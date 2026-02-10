#!/usr/bin/env python

import pathlib
import re
import subprocess

my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent
outdir = repo_root / "src"


def main():
    error_pattern = re.compile(r"^error: Undefined symbol `(\w+)`$")
    found_pattern = re.compile(r"^\s+at (\S+)\((\d+)\)")

    proc = subprocess.run(["make", "compare"], capture_output=True, text=True)
    if proc.returncode == 0:
        return
    print("scanning")
    seen_symbols = set()
    mode = 0
    for line in proc.stderr.splitlines():
        if mode == 0:
            if m := error_pattern.match(line):
                symbol = m[1]
                if symbol in seen_symbols:
                    continue
                seen_symbols.add(symbol)
                mode = 1
        elif mode == 1:
            if line == "    1 symbol with that name is defined but not exported:":
                mode = 2
        elif mode == 2:
            if m := found_pattern.match(line):
                target = m[1]
                lineno = m[2]
                command = ["gsed", "-i", "-r", f"{lineno},{lineno}s/:/::/", target]
                print(*command)
                subprocess.run(command, check=True)
                mode = 0


if __name__ == "__main__":
    main()
