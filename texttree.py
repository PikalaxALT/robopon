import re
pattern = re.compile(r'(\.bits|\t; )([01]+)\n\tld a, (.+)')


def get_path(tree, character):
    output = []
    if isinstance(tree, list):
        left = get_path(tree[0], character)
        if left is not None:
            return [0] + left
        right = get_path(tree[1], character)
        if right is not None:
            return [1] + right
    elif tree == character:
        return []


def build_tree():
    tree = []
    for match in pattern.finditer(open('home/text.asm', 'r').read()):
        _, bits, character = match.groups()
        if character.startswith('"'):
            character = character[1:-1].encode('utf-8')
        elif character.startswith('$'):
            charval = int(character[1:], 16)
            if charval == 0:
                character = '<TERM>'
            elif charval == 10:
                character = '<NL>'
            elif charval == 1:
                character = '<PLAYER>'
        path = list(map(int, bits))
        node = tree
        for choice in path[:-1]:
            while len(node) < choice + 1:
                node.append([])
            node = node[choice]
        choice = path[-1]
        while len(node) < choice + 1:
            node.append([])
        node[choice] = character
    return tree
