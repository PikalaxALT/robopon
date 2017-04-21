import re
import pickle
import argparse
pattern = re.compile(r'(\.bits|\t; )([01]+)\n\tld a, (.+)')

CHARMAP = r'charmap "(?P<sym>.|<.+>)", \$(?P<val>[0-9a-f]{,2})'
DEFCHAR = r'\tdefchar "(?P<sym>.|<.+>)"'
charmap_pattern = re.compile(CHARMAP)
defchar_pattern = re.compile(DEFCHAR)


def load_charmap(infile):
    data = open(infile, 'r').read().splitlines()
    charmap = {}
    cur_char = 0
    for line in data:
        if 'char_def' in line:
            if line != '\tchar_def':
                if '$' in line:
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
            sym, = M2.groups()
            if cur_char not in charmap:
                charmap[cur_char] = []
            charmap[cur_char] += [x[1:-1] for x in re.findall(r'"\S+?"', line)]
            cur_char += 1
            continue
    return charmap


def build_node(tree, node):
    if isinstance(node, tuple):
        return [build_node(tree, tree[branch]) for branch in node]
    return node


def rip_tree(romfile, pointer, charmap):
    charmap[0x00] = ['<TERM>']
    charmap[0x01] = ['<PLAYER>']
    charmap[0x0a] = ['<NL>']
    romfile.seek(pointer)
    bank = (pointer & (-0x3fff))
    end = 0x4000 + bank
    tree = {}
    while romfile.tell() < end:
        op_start = romfile.tell()
        opcode = ord(romfile.read(1))
        if opcode not in (0x3e, 0x38, 0xda, 0xc3, 0xcd):
            raise ValueError('invalid opcode: %02x' % opcode)
        if opcode > 0x40:
            addr = int.from_bytes(romfile.read(2), 'little')
            gbaddr = bank | (addr & 0x3fff)
            if opcode == 0xc3:
                end = gbaddr
        elif opcode == 0x38:
            offset = ord(romfile.read(1))
            if offset >= 0x80:
                offset -= 0x100
            gbaddr = romfile.tell() + offset
        else:
            charval = ord(romfile.read(1))
            if charval in charmap:
                character = charmap[charval][0]
            else:
                character = chr(charval)
            tree[op_start] = character
        if opcode in (0x38, 0xda):
            tree[op_start - 3] = (romfile.tell(), gbaddr)
    return build_node(tree, tree[pointer])


def int16(value):
    return int(value, 16)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('romfile', type=argparse.FileType('rb'))
    parser.add_argument('start', type=int16)
    parser.add_argument('charmap', type=load_charmap)
    parser.add_argument('outfile', type=argparse.FileType('wb'))
    args = parser.parse_args()
    tree = rip_tree(args.romfile, args.start, args.charmap)
    pickle.dump(tree, args.outfile)