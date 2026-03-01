import os
import struct
import sys


def unpack_emote(emotefilename):
    pref, _ = os.path.splitext(emotefilename)
    with open(emotefilename, "rb") as infile, open(f"{pref}.2bpp", "wb") as outfile:
        infile.seek(2)  # skip size
        outfile.write(infile.read())


def pack_emote(infilename):
    prefix, _ = os.path.splitext(infilename)
    with open(infilename, "rb") as infile, open(f"{prefix}.emote", "w+b") as outfile:
        data = infile.read()
        size = len(data)
        assert size % 16 == 0
        outfile.write(struct.pack("<H", size // 16))
        outfile.write(data)


if __name__ == "__main__":
    if sys.argv[1] == "pack":
        for arg in sys.argv[2:]:
            pack_emote(arg)
    elif sys.argv[1] == "unpack":
        for arg in sys.argv[2:]:
            unpack_emote(arg)
    else:
        raise ValueError("unsupported method: %s", sys.argv[1])
