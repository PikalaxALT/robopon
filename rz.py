import argparse


def findall(p, s, start=0):
    '''Yields all the positions of
    the pattern p in the string s.'''
    i = s.find(p, start)
    while i != -1:
        yield i
        i = s.find(p, i+1)


def int16(value):
    return int(value, 16)


def get_max_back(size, src_ptr):
    if size < 2:
        max_back = (1 << 5) - 1
    elif size < 5:
        max_back = (1 << 8)
    elif size < 20:
        max_back = (1 << 9)
    elif size < 275:
        max_back = (1 << 10)
    else:
        max_back = (1 << 11)
    return min(max_back, src_ptr)


def find_chunk(source_data, src_ptr, end):
    size = end - src_ptr
    max_back = src_ptr - get_max_back(size, src_ptr)
    chunk = source_data[src_ptr:(src_ptr + size)]
    bt = source_data.find(chunk, max_back)
    if bt >= src_ptr:
        bt = -1
    return bt, size


def find_largest_block(source_data, src_ptr):
    if src_ptr > 0:
        back = 0
        for end in range(len(source_data), src_ptr, -1):
            bt, size = find_chunk(source_data, src_ptr, end)
            if bt != -1:
                back = src_ptr - bt
                return size, back
    return 0, 0


def compress(infile, outfile, length=0x4000):
    """Compress a Robopon graphics file

    :param outfile: Output file buffer
    :param infile: Decompressed file buffer
    :param length: Expected length of the output data
    """
    global bitmask, last_byte
    infile.seek(0)
    source_data = infile.read()
    bitmask = 0x80
    last_byte = 0x00
    src_ptr = 0
    outfile.seek(0)
    outfile.truncate()

    def write_bits(nbits, value):
        global bitmask, last_byte
        assert value < (1 << nbits), '%d | %s' % (nbits, value)
        for bit in range(1, nbits + 1):
            last_byte |= (1 & (value >> (nbits - bit))) * bitmask
            bitmask >>= 1
            if not bitmask:
                outfile.write(chr(last_byte))
                bitmask = 0x80
                last_byte = 0x00

    while src_ptr < len(source_data):
        size, back = find_largest_block(source_data, src_ptr)
        if size == 0:
            write_bits(1, 0x01)
            write_bits(8, ord(source_data[src_ptr]))
            size = 1
        elif size < 2:
            write_bits(2, 0x00)
            write_bits(5, back - 1)
        elif size < 5:
            write_bits(2, 0x01)
            write_bits(2, size - 2)
            write_bits(8, back - 1)
        elif size < 20:
            write_bits(4, 0x07)
            write_bits(4, size - 5)
            write_bits(9, back - 1)
        elif size < 275:
            write_bits(8, 0x7f)
            write_bits(8, size - 20)
            write_bits(10, back - 1)
        else:
            write_bits(16, 0x7fff)
            write_bits(12, size - 275)
            write_bits(11, back - 1)
        src_ptr += size
    if bitmask != 0x80:
        outfile.write(chr(last_byte))
    if length < 0x4000 and outfile.tell() > length:
        written_length = outfile.tell()
        outfile.seek(0)
        outfile.truncate()
        raise ValueError('Did all that work compressing, '
                         'but got the wrong output somehow!\n'
                         'Expected size %d, got %d' % 
                         (length, written_length))
    if src_ptr > len(source_data):
        raise ValueError('Whoops! Something went amiss!')
    if outfile.tell() > len(source_data):
        raise ValueError('Somehow our compression yielded a larger file!')


def decompress(infile, outfile, start=0, length=0x4000):
    """Decompress a Robopon graphics file
    
    :param infile: Source file buffer, either a ROM or a standalone file
    :param start: Address in infile where the compressed data starts
    :param length: Expected length of the output data
    :return: Decompressed data, compressed size
    """
    global bitmask, last_byte
    bitmask = 0x80
    infile.seek(start)
    last_byte = ord(infile.read(1))
    outfile.seek(0)
    outfile.truncate()

    def read_bits(nbits):
        global bitmask, last_byte
        output = 0
        for bit in range(nbits):
            output <<= 1
            output |= bool(bitmask & last_byte)
            bitmask >>= 1
            if not bitmask:
                bitmask = 0x80
                last_byte = ord(infile.read(1))
        return output

    unpacked = b''
    while len(unpacked) < length:
        try:
            back = -1
            if read_bits(1):
                size = 0
                unpacked += chr(read_bits(8))
            elif not read_bits(1):
                size = 1
                back = read_bits(5) + 1
            else:
                size = read_bits(2)
                if size != 3:
                    size += 2
                    back = read_bits(8) + 1
                else:
                    size = read_bits(4)
                    if size != 15:
                        size += 5
                        back = read_bits(9) + 1
                    else:
                        size = read_bits(8)
                        if size != 255:
                            size += 20
                            back = read_bits(10) + 1
                        else:
                            size = read_bits(12) + 275
                            back = read_bits(11) + 1
            assert back <= len(unpacked), '%d, %d' % (back, len(unpacked))
            for _ in range(size):
                unpacked += unpacked[-back]
        except TypeError:
            break
    if length < 0x4000 and len(unpacked) != length:
        raise ValueError('Did all that work decompressing, '
                         'but got the wrong output somehow!')
    outfile.write(unpacked)
    return infile.tell() - start - (bitmask == 0x80)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('method', choices=['compress', 'decompress'])
    parser.add_argument('infile', type=argparse.FileType('rb'))
    parser.add_argument('outfile', type=argparse.FileType('wb'))
    parser.add_argument('--start', type=int16, default=0)
    parser.add_argument('--length', type=int16, default=0x4000)
    args = parser.parse_args()
    if args.method == 'decompress':
        outsize = decompress(args.infile, args.outfile, start=args.start,
                             length=args.length)
    else:
        compress(args.infile, args.outfile, length=args.length)
        
