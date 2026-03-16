#!/usr/bin/env python

import argparse
import json

ENDTREE = "\tjp .queue_character"
BACKMAP = {
    "<TERM>": 0,
    "<PLAYER>": 1,
    "<NL>": 'CHARVAL("\\n")',
}

type TreeNode = str | list[TreeNode]


def get_instructions(
    node: TreeNode, label: str = "", offset: int = 0
) -> list[list[str, int]]:
    ret: list[list[str, int]] = []

    # Pass 1: Build the script
    if label:
        if label.endswith("1"):
            ret.append([f"{label}", 0, offset])
    else:
        label = ".bits"
    if isinstance(node, str):
        value = BACKMAP.get(node, f'CHARVAL("{node}")')
        ret.append([f"\tld a, {value}", 2, offset])
        ret.append([ENDTREE, 3, offset + 2])
    else:
        ret.append(["\tcall .GetNextBit", 3, offset])
        ret.append([f"\tjr c, {label}1", 2, offset + 3])
        ret += get_instructions(node[0], f"{label}0", offset + 5)
        ret += get_instructions(node[1], f"{label}1", ret[-1][2] + ret[-1][1])

    # Pass 2: Gather the label offsets
    label_offsets = {}
    for line, _, offset in ret:
        if not line.startswith("\t"):
            label_offsets[line] = offset

    # Pass 3: convert too-far relative jumps
    for i, (line, _, offset) in enumerate(ret[::-1], 1):
        original_i = len(ret) - i
        if line.startswith("\tjr c,"):
            target = line.split()[-1]
            target_offset = label_offsets[target]
            # jr can handle up to +127, but Hudson must have hardcoded 50 here
            if target_offset - offset > 50:
                ret[original_i] = [f"\tjp c, {target}", 3, offset]
                for j in range(original_i + 1, len(ret)):
                    ret[j][2] += 1
                    if ret[j][0].endswith(":"):
                        cur_label = ret[j][0]
                        label_offsets[cur_label] = ret[j][2]

    return ret


class Namespace(argparse.Namespace):
    infile: str
    outfile: str

    @classmethod
    def from_cli(cls, args: list[str] | None = None):
        parser = argparse.ArgumentParser()
        parser.add_argument("infile")
        parser.add_argument("outfile")
        return parser.parse_args(args, cls())


def main():
    args = Namespace.from_cli()
    with open(args.infile) as fp:
        tree = json.load(fp)
    lines = get_instructions(tree)
    with open(args.outfile, "w") as ofp:
        for line, _, _ in lines:
            print(line, file=ofp)


if __name__ == "__main__":
    main()
