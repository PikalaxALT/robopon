#!/usr/bin/env python

import argparse
import pathlib
import re
from typing import Literal

my_file = pathlib.Path(__file__)
repo_root = my_file.parent.parent


def load_charmap(infile: pathlib.Path):
    CHARMAP = r'charmap "(?P<sym>.|<.+>)", \$(?P<val>[0-9a-f]{,2})'
    DEFCHAR = r'\s+defchar "(?P<sym>.|<.+>)"'
    charmap_pattern = re.compile(CHARMAP)
    defchar_pattern = re.compile(DEFCHAR)

    all_chars_pattern = re.compile(r'"(.|<.+>)"')

    charmap: dict[int, list[str]] = {}
    cur_char = 0
    with infile.open() as ifp:
        for line in ifp:
            line = line.rstrip("\n")
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


class Namespace(argparse.Namespace):
    version: Literal["sun", "star"]
    offset: int
    kana_mode: bool = False

    @classmethod
    def from_cli(cls, args: list[str] | None = None):
        parser = argparse.ArgumentParser()
        parser.add_argument("version", choices=["sun", "star"])
        parser.add_argument("offset", type=lambda arg: int(arg, 0))
        parser.add_argument("-k", dest="kana_mode", action="store_true")
        return parser.parse_args(args, cls())


def main():
    args = Namespace.from_cli()
    baserom = repo_root / f"baserom-{args.version}.gbc"
    charmap_basename = "charmap.asm" if args.kana_mode else "charmap2.asm"
    charmap = load_charmap(repo_root / charmap_basename)
    kana = 1
    with baserom.open("rb") as rom:
        rom.seek(args.offset)
        result = ""

        while c := rom.read(1):
            if c == b"\0":
                break
            t = charmap[c[0]]
            if len(t) == 1:
                val = t[0]
            else:
                val = t[kana]
            if args.kana_mode:
                if val == "(":
                    kana = 0
                elif val == ")":
                    kana = 1
            result += val
    print(result, end="")


if __name__ == "__main__":
    main()
