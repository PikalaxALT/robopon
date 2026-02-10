PYTHON := python3
POKETOOLS := extras/pokemontools

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	MD5 := gmd5sum -c
else
	MD5 := md5sum -c
endif

RZ       := $(PYTHON) rz.py compress
TM       := $(PYTHON) tm2bpp.py furl
EMOTE    := $(PYTHON) emote.py pack
2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
includes := $(PYTHON) scan_includes.py

SRC_ASM := \
	src/bank_01.asm \
	src/bank_02.asm \
	src/bank_03.asm \
	src/bank_04.asm \
	src/bank_05.asm \
	src/bank_06.asm \
	src/bank_07.asm \
	src/bank_08.asm \
	src/bank_8_part_2.asm \
	src/bank_09.asm \
	src/bank_9_part_2.asm \
	src/bank_0c.asm \
	src/bank_0d.asm \
	src/bank_13.asm \
	src/bank_14.asm \
	src/bank_15.asm \
	src/text_56b9c.asm \
	src/bank_15_2.asm \
	src/bank_16.asm \
	src/bank_17.asm \
	src/bank_18.asm \
	src/bank_19.asm \
	src/bank_19_2.asm \
	src/bank_1a.asm \
	src/bank_1b.asm \
	src/bank_2f.asm \
	src/bank_30.asm \
	src/bank_31.asm \
	src/bank_35.asm \
	src/bank_39.asm \
	src/bank_3e_2.asm \
	src/bank_3f.asm \
	src/bank_3f_2.asm \
	src/bank_3f_3.asm

SRC_OBJS := $(SRC_ASM:%.asm=%.o)

objs := \
	wram.o \
	sram.o \
	vram.o \
	gfx.o \
	audio.o \
	text.o \
	maps.o \
	home.o \
	main.o

sun_objs := $(objs:.o=_sun.o)
star_objs := $(objs:.o=_star.o)

$(foreach obj, $(objs:.o=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic .wav .pcm
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp %.png %.tm2bpp %.emote
.PHONY: all clean tidy roms sun star compare

sun  := robosun.gbc
star := robostar.gbc

all: roms

compare: roms
	$(MD5) roms.md5

roms: $(sun) $(star)

sun: $(sun)

star: $(star)

tidy:
	rm -f $(sun) $(star) $(sun_objs) $(star_objs) $(roms:.gbc=.sym) $(roms:.gbc=.map)

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' -o -iname '*.pcm' -o -iname '*.rz' -o -iname '*.ctf' \) -exec rm {} +

%.ctf: %.asm
	$(PYTHON) textcomp.py $<

%.asm: ;
%.tm: ;
%.png: ;

data/base_stats/%.bin: ;

%.2bpp: %.png
	$(2bpp) $<

%.1bpp: %.png
	$(1bpp) $<

%.tm2bpp: %.2bpp
	$(TM) $< $@

%.emote: %_*.2bpp
	$(EMOTE) $<

%.rz: %
	$(RZ) $< $@

$(sun_objs): %_sun.o: %.asm $$(%_dep)
	rgbasm -D SUN -o $@ $*.asm

$(star_objs): %_star.o: %.asm $$(%_dep)
	rgbasm -D STAR -o $@ $*.asm

opts = -csv -k 18 -l 0x33 -m 0xfe -p 0x00 -r 0x03

$(sun): $(sun_objs)
	rgblink -w -n $*.sym -o $@ $^
	rgbfix $(opts) -t "ROBOPON SUN" $@

$(star): $(star_objs)
	rgblink -w -n $*.sym -o $@ $^
	rgbfix $(opts) -t "ROBOPON STAR" $@
