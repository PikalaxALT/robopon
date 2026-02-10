#!/usr/bin/env python

import pathlib
import re
from typing import TextIO

my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
outdir = repo_root / "src"
outdir.mkdir(parents=True, exist_ok=True)

includes = """INCLUDE "includes.asm"
INCLUDE "charmap.asm"
"""
cur_outfile: TextIO | None = None
seen_outfnames: set[str] = set()
parse = [True]
try:
    with (repo_root / "main.asm").open() as fp:
        for line in fp:
            if line.startswith("SECTION"):
                if cur_outfile is not None:
                    cur_outfile.close()
                outfname = re.match(r'^SECTION "(.+)",', line)[1].lower()
                outfname = re.sub(r"\W+", "_", outfname) + ".asm"
                assert outfname not in seen_outfnames, outfname
                seen_outfnames.add(outfname)
                cur_outfile = (outdir / outfname).open("w")
                cur_outfile.write(includes)
                print(f"src/{outfname}")
            if cur_outfile is not None:
                cur_outfile.write(line)
finally:
    if cur_outfile is not None:
        cur_outfile.close()
