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
    charmap = {}
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

"""

"""
base_stats_struct = struct.Struct("<")

for i in range(0, 170, 5):
    with (bin_dir / f"base_stats_{i // 5}.bin").open("rb") as binfile:
        bin_data = list(base_stats_struct.iter_unpack(binfile.read()))
    for j, stats in enumerate(bin_data, i):
        pass

with json_src.open("w") as ofp:
    json.dump(json_data, ofp, indent=4)
