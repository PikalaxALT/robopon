#!/usr/bin/env python

import pathlib
import re
from typing import TextIO

my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
outdir = repo_root / "src"
outdir.mkdir(parents=True, exist_ok=True)


def split_src_file(srcfile: pathlib.Path, outdir: pathlib.Path, includes: list[str]):
    outdir.mkdir(parents=True, exist_ok=True)
    cur_outfile: TextIO | None = None
    seen_outfnames: set[str] = set()
    try:
        with srcfile.open() as fp:
            for line in fp:
                if line.startswith("SECTION"):
                    if cur_outfile is not None:
                        cur_outfile.close()
                    outfname = re.match(r'^SECTION "(.+)",', line)[1].lower()
                    outfname = re.sub(r"\W+", "_", outfname) + ".asm"
                    assert outfname not in seen_outfnames, outfname
                    seen_outfnames.add(outfname)
                    outfpath = outdir / outfname
                    print(outfpath.relative_to(repo_root))
                    cur_outfile = outfpath.open("w")
                    for incl in includes:
                        cur_outfile.write(f'INCLUDE "{incl}"\n')
                    cur_outfile.write("\n")
                if cur_outfile is not None:
                    cur_outfile.write(line)
    finally:
        if cur_outfile is not None:
            cur_outfile.close()


specs = [
    (
        repo_root / "main.asm",
        repo_root / "src",
        ["includes.asm", "charmap.asm"],
    ),
    (
        repo_root / "maps.asm",
        repo_root / "maps",
        ["includes.asm", "charmap.asm", "macros/bank20.asm"],
    ),
]

for srcfile, outdir, includes in specs:
    if srcfile.exists():
        split_src_file(srcfile, outdir, includes)
