#!/usr/bin/env python

import sys

if len(sys.argv) < 2:
    sys.stderr.write(f"usage: {sys.argv[0]} ROM\n")
    sys.exit(1)

with open(sys.argv[1], "rb") as rom:
    bts = rom.read()
bts = bts.rstrip(b"\00")
with open(sys.argv[1], "wb") as rom:
    rom.write(bts)
