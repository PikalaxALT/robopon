#!/usr/bin/env python

import json
import pathlib
import re
import struct


def load_charmap(infile: pathlib.Path):
    CHARMAP = r'charmap "(?P<sym>.|<.+>)", \$(?P<val>[0-9a-f]{,2})'
    DEFCHAR = r'\tdefchar "(?P<sym>.|<.+>)"'
    charmap_pattern = re.compile(CHARMAP)
    defchar_pattern = re.compile(DEFCHAR)

    data = infile.open("r").read().splitlines()
    charmap: dict[int, list[str]] = {}
    cur_char = 0
    for line in data:
        if "char_def" in line:
            if line != "\tchar_def":
                if "$" in line:
                    cur_char = int(line[11:], 16)
                else:
                    cur_char = int(line[10:])
            else:
                cur_char = 0
            continue
        M1 = charmap_pattern.search(line)
        if M1 is not None:
            sym, val = M1.groups()
            val = int(val, 16)
            if val not in charmap:
                charmap[val] = []
            charmap[val].append(sym)
            continue
        M2 = defchar_pattern.search(line)
        if M2 is not None:
            (sym,) = M2.groups()
            if cur_char not in charmap:
                charmap[cur_char] = []
            charmap[cur_char] += [x[1:-1] for x in re.findall(r'"\S+?"', line)]
            cur_char += 1
            continue
    return charmap


def decode_string(raw: bytes, charmap: dict[int, list[str]]) -> str:
    return "".join(charmap[b][0] for b in raw if b != 0)


my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
bin_dir = repo_root / "data" / "parts"
json_src = bin_dir / "parts.json"
charmap = load_charmap(repo_root / "charmap2.asm")
parts_struct = struct.Struct("<")  # size=47
json_data = {"parts": []}

with (repo_root / "constants" / "parts_constants.asm").open() as parts_constants_file:
    parts_constants = [
        m[1] for m in re.finditer(r"const (\w+)", parts_constants_file.read())
    ]

"""
struct BaseStats {
    u8 unk_00[8];
    unk_08;
    unk_09[6];
    u8 filler_0F[9];
};
"""
parts_struct = struct.Struct("<8s1B6s9B")

for i in range(0, 128, 8):
    with (bin_dir / f"parts_{i // 8:02d}.bin").open("rb") as binfile:
        bin_data = list(parts_struct.iter_unpack(binfile.read()))
    for j, stats in enumerate(bin_data, i):
        json_data["parts"].append(
            {
                "id": parts_constants[j],
                "name": decode_string(stats[0], charmap),
                "unknown_08": stats[1],
                "unknown_09": decode_string(stats[2], charmap),
                "ram": stats[3],
                "attack": stats[4],
                "defense": stats[5],
                "speed": stats[6],
                "unknown_13": stats[7:],
            }
        )

with json_src.open("w", encoding="utf-8") as ofp:
    json.dump(json_data, ofp, indent=4, ensure_ascii=False)
