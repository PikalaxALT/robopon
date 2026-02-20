#!/usr/bin/env python

import argparse
import dataclasses
import hashlib
import pathlib
import re
import subprocess
from typing import Literal, SupportsIndex

my_file = pathlib.Path(__file__)
root_dir = my_file.parent.parent


REGION_LIMITS = {
    "ROM": 0x8000,
    "VRAM": 0xA000,
    "SRAM": 0xC000,
    "WRAM": 0xE000,
    "ERAM": 0xFF00,
    "HRAM": 0x10000,
}


@dataclasses.dataclass
class Instruction:
    addr_operand = {
        0x08: 0,  # ld [a16], sp
        0x18: 0,  # jr r8
        0x20: 1,  # jr nz, r8
        0x28: 1,  # jr z, r8
        0x30: 1,  # jr nc, r8
        0x31: 1,  # ld sp, d16
        0x38: 1,  # jr c, r8
        0xC2: 1,  # jp nz, a16
        0xC3: 0,  # jp a16
        0xC4: 1,  # call nz, a16
        0xCA: 1,  # jp z, a16
        0xCC: 1,  # call z, a16
        0xCD: 0,  # call a16
        0xD2: 1,  # jp nc, a16
        0xD4: 1,  # call nc, a16
        0xDA: 1,  # jp c, a16
        0xDC: 1,  # call c, a16
        0xE0: 0,  # ldh [a8], a
        0xEA: 0,  # ld [a16], a
        0xF0: 1,  # ldh a, [a8]
        0xFA: 1,  # ld a, [a16]
    }

    offset: int
    raw: bytearray
    mnemonic: str
    operands: list[str]
    verbose: bool = dataclasses.field(default=True)
    label: str | None = dataclasses.field(default=None)

    def __str__(self):
        bank, addr = rom_offset_to_addr(self.offset)
        raw = " ".join(f"{x:02X}" for x in self.raw)
        if self.operands:
            operands = ", ".join(self.operands)
            insn = f"{self.mnemonic} {operands}"
        else:
            insn = self.mnemonic
        label = f"{self.label}:\n" if self.label else ""
        if self.verbose:
            return (
                f"{label}\t{insn} ; {self.offset:05X} ({bank:02x}:{addr:04x}) -> {raw}"
            )
        return f"{label}\t{insn}"

    def __getitem__(self, index: SupportsIndex) -> str:
        return self.operands[index]

    def has_addr_operand(self):
        return self.raw[0] in Instruction.addr_operand

    def __len__(self):
        return len(self.raw)


def get_region(addr: int) -> str | None:
    region = None
    if addr >= 0 and addr < 0x10000:
        for region, upper in REGION_LIMITS.items():
            if addr < upper:
                break
    return region


def parse_symfile(
    symfile: pathlib.Path,
) -> dict[str, dict[tuple[int, int], str]]:
    addr_to_symbol = {region: {} for region in REGION_LIMITS}
    with symfile.open() as fp:
        for line in fp:
            if line.startswith(";"):
                continue
            bank, addr, name = re.split("[ :]", line.rstrip("\n"))
            if "." in name:
                continue
            bank = int(bank, 16)
            addr = int(addr, 16)
            region = get_region(addr)
            addr_to_symbol[region][(bank, addr)] = name
    return addr_to_symbol


def parse_gbhw_asm(asmfile: pathlib.Path) -> dict[int, str]:
    pattern = re.compile(r"^DEF +(\w+) +EQU +\$(ff[0-9a-f][0-9a-f])", re.IGNORECASE)
    ret: dict[int, str] = {}
    with asmfile.open() as fp:
        for line in fp:
            if m := pattern.match(line):
                name, addr = m.groups()
                ret[int(addr, 16)] = name
    return ret


def addr_to_rom_offset(bank: int, addr: int) -> int:
    if addr >= 0x8000:
        raise ValueError("not a ROM address")
    return (bank << 14) | (addr & 0x3FFF)


def rom_offset_to_addr(offset: int) -> tuple[int, int]:
    bank = offset >> 14
    addr = offset & 0x3FFF
    if bank != 0:
        addr |= 0x4000
    return bank, addr


def sanitize_operand(operand: str):
    return (
        operand.lower()
        .replace("(", "[")
        .replace(")", "]")
        .replace("hl+", "hli")
        .replace("hl-", "hld")
    )


def get_disassembly(
    unidasm: pathlib.Path, rom: pathlib.Path, start: int, end: int
) -> list[Instruction]:
    args = [
        str(unidasm.absolute()),
        str(rom.absolute()),
        "-skip",
        hex(start),
        "-count",
        hex(end - start),
        "-basepc",
        hex(start),
        "-arch",
        "lr35902",
    ]
    proc = subprocess.run(args, capture_output=True, check=True, text=True)
    result: list[Instruction] = []
    for line in proc.stdout.splitlines():
        offset, rest = line.split(": ", 1)
        raw = bytearray(int(x, 16) for x in rest[:10].strip().split())
        mnemonic = rest[10:15].strip()
        if mnemonic == "ld" and (raw[0] & 0xEF) == 0xE0:
            mnemonic = "ldh"
        operands = [sanitize_operand(op) for op in rest[15:].strip().split(",")]
        result.append(Instruction(int(offset, 16), raw, mnemonic, operands))
    return result


def update_instructions_symbols(
    instructions: list[Instruction], symbols: dict[str, dict[tuple[int, int], str]]
):
    # 2-pass operation
    # first pass: find all addresses and update the symbols dict
    # second pass: insert labels into the instructions list
    for insn in instructions:
        bank, _ = rom_offset_to_addr(insn.offset)
        if insn.has_addr_operand():
            oper_i = Instruction.addr_operand[insn.raw[0]]
            addr_operand = int(insn[oper_i].strip("$[]"), 16)
            if insn.mnemonic == "ldh":
                region = "HRAM"
                addr_operand |= 0xFF00
            else:
                region = get_region(addr_operand)
            if region is None:
                continue
            if region == "ROM":
                op_bank = 0 if addr_operand < 0x4000 else bank
            else:
                op_bank = 0
            if (op_bank, addr_operand) not in symbols[region]:
                if region == "ROM":
                    op_offset = addr_to_rom_offset(op_bank, addr_operand)
                    name = f"label_{op_offset:04x}"
                else:
                    name = f"{region[0].lower()}{addr_operand:04x}"
                symbols[region][(op_bank, addr_operand)] = name
            else:
                name = symbols[region][(op_bank, addr_operand)]
            insn.operands[oper_i] = (
                f"[{name}]" if "[" in insn.operands[oper_i] else name
            )
    for insn in instructions:
        bank, addr = rom_offset_to_addr(insn.offset)
        if (bank, addr) in symbols["ROM"]:
            label = symbols["ROM"][(bank, addr)]
            if "." in label:
                label = "." + label.rsplit(".", 1)[-1]
            insn.label = label


def any_int(arg: str):
    return int(arg, 0)


class Namespace(argparse.Namespace):
    version: Literal["sun", "star"]
    start: int
    end: int
    unidasm: pathlib.Path = root_dir / "tools" / "unidasm"

    @classmethod
    def from_cli(cls, args: list[str] | None = None):
        parser = argparse.ArgumentParser()
        parser.add_argument("version", choices=["sun", "star"])
        parser.add_argument("start", type=any_int)
        parser.add_argument("end", type=any_int)
        parser.add_argument("--unidasm", type=pathlib.Path)
        return parser.parse_args(args, cls())


def check_md5sum(rom: pathlib.Path, target: str):
    with rom.open("rb") as fp:
        hasher = hashlib.md5(fp.read())
    checksum = "".join(f"{x:02x}" for x in hasher.digest())
    return checksum == target


def verify_paths(version: Literal["sun", "star"], unidasm: pathlib.Path):
    if not unidasm.exists():
        raise FileNotFoundError(unidasm)
    symfile = root_dir / f"robo{version}.sym"
    if not symfile.exists():
        raise FileNotFoundError("please run `make` before running this script")
    checksums = root_dir / "roms.md5"
    with checksums.open() as md5file:
        for line in md5file:
            target, path = line.rstrip("\n").split(None, 1)
            if path.lstrip("*") == f"robo{version}.gbc":
                break
        else:
            raise ValueError(f"unable to find MD5 digest for robo{version}.gbc")
    for romname in (f"robo{version}.gbc", f"baserom-{version}.gbc"):
        baserom = root_dir / romname
        if not baserom.exists():
            continue
        if check_md5sum(baserom, target):
            break
    else:
        raise ValueError(
            f"unable to find a suitable copy of Robopon {version.title()} version"
        )

    return baserom, symfile


def main():
    args = Namespace.from_cli()
    if args.end <= args.start:
        raise ValueError("end must be strictly greater than start")
    baserom, symfile = verify_paths(args.version, args.unidasm)
    addr_to_symbol = parse_symfile(symfile)
    addr_to_symbol["HRAM"] |= parse_gbhw_asm(root_dir / "gbhw.asm")
    instructions = get_disassembly(args.unidasm, baserom, args.start, args.end)
    update_instructions_symbols(instructions, addr_to_symbol)
    for insn in instructions:
        print(insn)


if __name__ == "__main__":
    main()
