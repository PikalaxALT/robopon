#!/bin/sh
# Compares baserom.gbc and pokecrystal.gbc

# create baserom.txt if necessary
if [ -z ${1+x} ]; then
	rom=sun
else
	rom=$1
fi

if [ ! -f baserom-$rom.txt ]; then
	hexdump -C baserom-$rom.gbc > baserom-$rom.txt
fi

hexdump -C robo$rom.gbc > robo$rom.txt

diff -u baserom-$rom.txt robo$rom.txt | less
