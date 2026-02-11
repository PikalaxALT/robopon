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


my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
bin_dir = repo_root / "data" / "base_stats"
json_src = bin_dir / "base_stats.json"
charmap = load_charmap(repo_root / "charmap2.asm")
base_stats_struct = struct.Struct("<")  # size=47
json_data = {"base_stats": []}

with (repo_root / "constants" / "robot_constants.asm").open() as robots_file:
    robots = [m[1] for m in re.finditer(r"const (\w+)", robots_file.read())]

"""
struct BaseStats {
    u8 filler_00[6];
    u8 hp;
    u8 ep;
    u8 attack;
    u8 defense;
    u8 speed;
    u8 filler_0B[2];
    char name[6]; // 0x0D
    u8 filler_13[28];
};
"""
base_stats_struct = struct.Struct("<13B6s28B")

for i in range(0, 170, 5):
    with (bin_dir / f"base_stats_{i // 5}.bin").open("rb") as binfile:
        bin_data = list(base_stats_struct.iter_unpack(binfile.read()))
    for j, stats in enumerate(bin_data, i):
        json_data["base_stats"].append(
            {
                "id": robots[j] if j < len(robots) else None,
                "unknown_00": stats[:2],
                "enhances_into": robots[stats[2] - 1] if stats[2] else None,
                "unknown_03": stats[3:6],
                "hp": stats[6],
                "ep": stats[7],
                "attack": stats[8],
                "defense": stats[9],
                "speed": stats[10],
                "unknown_0B": stats[11],
                "dex_number": stats[12],
                "name": "".join(charmap[b][0] for b in stats[13] if b != 0),
                "unknown_13": stats[14:],
            }
        )

with json_src.open("w", encoding="utf-8") as ofp:
    json.dump(json_data, ofp, indent=4, ensure_ascii=False)
