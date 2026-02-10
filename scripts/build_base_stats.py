#!/usr/bin/env python

import json
import pathlib
import struct
from typing import BinaryIO

my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
bin_dir = repo_root / "data" / "base_stats"
json_src = bin_dir / "base_stats.json"

with json_src.open() as fp:
    json_data = json.load(fp)

last_group = -1
binfile: BinaryIO | None = None
base_stats_struct = struct.Struct("<")  # size=47
try:
    for i, data in enumerate(json_data["base_stats"]):
        group_i = i // 5
        if group_i != last_group:
            if binfile is not None:
                binfile.close()
            binfile = (bin_dir / f"base_stats_{group_i}.bin").open("wb")
            last_group = group_i
        # todo: actually do the thing
finally:
    if binfile is not None:
        binfile.close()
