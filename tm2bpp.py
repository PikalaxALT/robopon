import argparse
blank_tile = '\x00' * 16


def tm2bpp_furl(infile, outfile):
    gfx = infile.read()
    buffer = ''
    tilemap = ''
    while gfx:
        if gfx[:16] == blank_tile:
            tilemap += '\xff'
        else:
            tilemap += '\x00'
            buffer += gfx[:16]
        gfx = gfx[16:]
    outfile.write(tilemap)
    outfile.write(buffer)


def tm2bpp_unfurl(infile, outfile):
    tilemap = infile.read(0x40)
    for tile in tilemap:
        if ord(tile):
            outfile.write(blank_tile)
        else:
            outfile.write(infile.read(0x10))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('method', choices=['furl', 'unfurl'])
    parser.add_argument('infile', type=argparse.FileType('rb'))
    parser.add_argument('outfile', type=argparse.FileType('wb'))
    args = parser.parse_args()
    if args.method == 'furl':
        tm2bpp_furl(args.infile, args.outfile)
    else:
        tm2bpp_unfurl(args.infile, args.outfile)
