#!/usr/bin/env python

import argparse
import json
import pathlib
import re
from typing import BinaryIO

VALID_OPCODES = (
    0x38,  # jr c, n8
    0x3E,  # ld a, n8
    0xC3,  # jp a16
    0xCD,  # call a16
    0xDA,  # jp c, a16
)

pattern = re.compile(r"(\.bits|\t; )([01]+)\n\tld a, (.+)")

CHARDEF = r"\tchar_def(?!\s*(?P<arg>\$[0-9a-f]+|\d+))?"
CHARMAP = r'charmap "(?P<sym>.|<.+>)", \$(?P<val>[0-9a-f]{,2})'
DEFCHAR = r'\tdefchar "(?P<sym>.|<.+>)"'
chardef_pattern = re.compile(CHARDEF)
charmap_pattern = re.compile(CHARMAP)
defchar_pattern = re.compile(DEFCHAR)


def load_charmap(infile: pathlib.Path, charmap_name):
    CHARMAP = r'charmap "(?P<sym>.|<.+>)", \$(?P<val>[0-9a-f]{,2})'
    DEFCHAR = r'\s+defchar "(?P<sym>.|<.+>)"'
    charmap_pattern = re.compile(CHARMAP)
    defchar_pattern = re.compile(DEFCHAR)

    all_chars_pattern = re.compile(r'"(.|<.+>)"')

    charmap: dict[int, list[str]] = {}
    cur_char = 0
    parsing_charmap = False
    with infile.open() as ifp:
        for line in ifp:
            line = line.rstrip("\n")
            if "newcharmap" in line:
                parsing_charmap = charmap_name in line
            if not parsing_charmap:
                continue
            if "char_def" in line:
                line = line.lstrip()
                if line != "char_def":
                    if "$" in line:
                        cur_char = int(line.split()[1][1:], 16)
                    else:
                        cur_char = int(line.split()[1])
                else:
                    cur_char = 0
            elif M1 := charmap_pattern.search(line):
                sym, val = M1.groups()
                val = int(val, 16)
                if val not in charmap:
                    charmap[val] = []
                charmap[val].append(sym)
            elif M2 := defchar_pattern.search(line):
                (sym,) = M2.groups()
                charmap.setdefault(cur_char, []).extend(
                    m.strip('"') for m in all_chars_pattern.findall(line)
                )
                cur_char += 1
            elif '"\\\\"' in line:
                charmap[cur_char] = ["\\"]
                cur_char += 1
    return charmap


def build_node(tree, node: str | tuple[int, int]):
    if isinstance(node, tuple):
        return [build_node(tree, tree[branch]) for branch in node]
    return node


def rip_tree(romfile: BinaryIO, pointer: int, charmap: dict[int, list[str]]):
    charmap[0x00] = ["<TERM>"]
    charmap[0x01] = ["<PLAYER>"]
    charmap[0x0A] = ["<NL>"]
    romfile.seek(pointer)
    bank = pointer & (-0x3FFF)
    end = 0x4000 + bank
    tree: dict[int, str | tuple[int, int]] = {}

    while romfile.tell() < end:
        op_start = romfile.tell()
        (opcode,) = romfile.read(1)
        if opcode not in VALID_OPCODES:
            raise ValueError("invalid opcode: %02x" % opcode)
        if opcode > 0x40:
            addr = int.from_bytes(romfile.read(2), "little")
            gbaddr = bank | (addr & 0x3FFF)
            if opcode == 0xC3:
                end = gbaddr
        elif opcode == 0x38:
            offset = int.from_bytes(romfile.read(1), "little", signed=True)
            gbaddr = romfile.tell() + offset
        else:
            (charval,) = romfile.read(1)
            if charval in charmap:
                character = charmap[charval][0]
            else:
                character = chr(charval)
            tree[op_start] = character
        if opcode in (0x38, 0xDA):
            tree[op_start - 3] = (romfile.tell(), gbaddr)
    return build_node(tree, tree[pointer])


def int16(value):
    return int(value, 16)


class Namespace(argparse.Namespace):
    romfile: str
    start: int
    charmapfile: pathlib.Path
    charmapname: str
    outfile: str


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("romfile")
    parser.add_argument("start", type=int16)
    parser.add_argument("charmapfile", type=pathlib.Path)
    parser.add_argument("charmapname")
    parser.add_argument("outfile")
    args = parser.parse_args(namespace=Namespace())

    charmap = load_charmap(args.charmapfile, args.charmapname)
    # print(charmap)
    with open(args.romfile, "rb") as romfile:
        tree = rip_tree(romfile, args.start, charmap)
    with open(args.outfile, "w") as ofp:
        json.dump(tree, ofp, ensure_ascii=False, separators=(",", ":"))
