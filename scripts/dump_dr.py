#!/usr/bin/env python

import re
import subprocess

files_with_dr = subprocess.run(
    ["git", "grep", "-wl", "dr"], capture_output=True, text=True
)
filepaths = files_with_dr.stdout.splitlines()
pattern = re.compile(r"^\s*dr\s*\$([0-9a-fA-F]+),\s*\$([0-9a-fA-F]+)\s*$")
with open("baserom-sun.gbc", "rb") as sun, open("baserom-star.gbc", "rb") as star:
    condition_stack = [3]
    for filepath in filepaths:
        if not filepath.endswith(".asm"):
            continue
        with open(filepath) as fl:
            lines = list(fl)
        for i, line in enumerate(lines):
            if line.startswith("IF "):
                if line == "IF DEF(SUN)\n":
                    condition_stack.append(1)
                elif line == "IF DEF(STAR)\n":
                    condition_stack.append(2)
                else:
                    condition_stack.append(3)
            elif line.startswith("ENDC"):
                condition_stack.pop()
            elif m := pattern.match(line):
                start = int(m[1], 16)
                end = int(m[2], 16)
                sun.seek(start)
                star.seek(start)
                bts_sun = sun.read(end - start)
                bts_star = star.read(end - start)
                if condition_stack[-1] == 3:
                    if bts_sun == bts_star:
                        new_line = (
                            "\tdb " + ", ".join(f"${n:02x}" for n in bts_sun) + "\n"
                        )
                    else:
                        new_line = (
                            "IF DEF(SUN)\n"
                            "\tdb " + ", ".join(f"${n:02x}" for n in bts_sun) + "\n"
                            "ENDC\n"
                            "IF DEF(STAR)\n"
                            "\tdb " + ", ".join(f"${n:02x}" for n in bts_star) + "\n"
                            "ENDC\n"
                        )
                elif condition_stack[-1] == 1:
                    new_line = "\tdb " + ", ".join(f"${n:02x}" for n in bts_sun) + "\n"
                elif condition_stack[-1] == 2:
                    new_line = "\tdb " + ", ".join(f"${n:02x}" for n in bts_star) + "\n"
                else:
                    raise ValueError
                    new_line = line
                lines[i] = new_line
        with open(filepath, "w") as ofp:
            ofp.writelines(lines)
