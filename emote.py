import os
import sys
import struct


def unpack_emote(emotefilename):
    pref, _ = os.path.splitext(emotefilename)
    infile = open(emotefilename, 'rb')
    size, = struct.unpack('<H', infile.read(2))
    outfile = open('{}_{:x}.2bpp'.format(pref, size), 'wb')
    outfile.write(infile.read())
    infile.close()
    outfile.close()


def pack_emote(infilename):
    infile = open(infilename, 'rb')
    prefix, ext = os.path.splitext(infilename)
    pref, start, size = prefix.split('_')
    outfile = open('{}_{}.emote'.format(pref, start), 'w+b')
    size = int(size, 16)
    outfile.write(struct.pack('<H', size))
    outfile.write(infile.read())
    outfile.close()
    infile.close()

if __name__ == '__main__':
    if sys.argv[1] == 'pack':
        for arg in sys.argv[2:]:
            pack_emote(arg)
    elif sys.argv[1] == 'unpack':
        for arg in sys.argv[2:]:
            unpack_emote(arg)
    else:
        raise ValueError('unsupported method: %s', sys.argv[1])
    
