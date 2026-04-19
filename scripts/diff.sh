#!/usr/bin/env bash

version="${1:-sun-jp}"

BASEROM=baserom-$version.gbc
BUILDROM=robo$version.gbc

if ! [ -f $BASEROM ]; then
    echo "missing baserom $BASEROM"
    exit 127
fi
if ! [ -f $BUILDROM ]; then
    echo "missing target ROM $BUILDROM"
    exit 127
fi

diff -u <(hexdump -Cv $BASEROM) <(hexdump -Cv $BUILDROM)
