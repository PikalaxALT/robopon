PYTHON := python3
POKETOOLS := extras/pokemontools

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	MD5 := gmd5sum -c
else
	MD5 := md5sum -c
endif

SUN_ROM := robosun.gbc
STAR_ROM := robostar.gbc
ROMS := $(SUN_ROM) $(STAR_ROM)

GAME_VERSION ?= SUN

ifeq ($(GAME_VERSION),SUN)
shortname := sun
else
ifeq ($(GAME_VERSION),STAR)
shortname := star
else
$(error unsupported GAME_VERSION=$(GAME_VERSION))
endif
endif

BUILDDIR := build/$(shortname)
BUILD_SUBDIRS := src maps
ROM := robo$(shortname).gbc
dummy := $(foreach dir,$(BUILD_SUBDIRS),$(shell mkdir -p $(BUILDDIR)/$(dir)))

RZ       := $(PYTHON) rz.py compress
TM       := $(PYTHON) tm2bpp.py furl
EMOTE    := $(PYTHON) emote.py pack
2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
includes := $(PYTHON) scan_includes.py

SRC_ASM := \
	wram.asm \
	sram.asm \
	vram.asm \
	gfx.asm \
	audio.asm \
	text.asm \
	home.asm \
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
	maps/block_data.asm \
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
	maps/bank_20.asm \
	maps/bank_21.asm \
	maps/bank_22.asm \
	maps/bank_23.asm \
	maps/bank_24.asm \
	maps/bank_24_2.asm \
	maps/bank_25.asm \
	maps/bank_26.asm \
	maps/bank_27.asm \
	maps/bank_28.asm \
	maps/bank_29.asm \
	maps/bank_2a.asm \
	maps/bank_2b.asm \
	maps/bank_2c.asm \
	maps/bank_2d.asm \
	maps/bank_2d_2.asm \
	maps/bank_2e.asm \
	src/bank_2f.asm \
	src/bank_30.asm \
	src/bank_31.asm \
	maps/bank_32.asm \
	maps/bank_33.asm \
	maps/bank_34.asm \
	src/bank_35.asm \
	maps/bank_36.asm \
	maps/bank_38.asm \
	src/bank_39.asm \
	src/bank_3e_2.asm \
	src/bank_3f.asm \
	src/bank_3f_2.asm \
	src/bank_3f_3.asm

objs := $(SRC_ASM:%.asm=$(BUILDDIR)/%.o)

$(foreach obj, $(SRC_ASM:.asm=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic .wav .pcm
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp %.png %.tm2bpp %.emote
.PHONY: all clean tidy roms sun star compare

all: $(ROM)

compare: roms
	$(MD5) roms.md5

roms: sun star

sun:
	$(MAKE) GAME_VERSION=SUN

star:
	$(MAKE) GAME_VERSION=STAR

tidy:
	$(RM) -r $(ROMS) $(BUILDDIR) $(roms:.gbc=.sym) $(roms:.gbc=.map)

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

$(objs): $(BUILDDIR)/%.o: %.asm $$(%_dep)
	rgbasm -D $(GAME_VERSION) -o $@ $<

opts = -csv -k 18 -l 0x33 -m 0xfe -p 0xff -r 0x03

$(ROM): $(objs) | layout.link
	rgblink -w -l layout.link -n $*.sym -m $*.map -o $@ $^
	./trim.py $@
	rgbfix $(opts) -t "ROBOPON $(GAME_VERSION)" $@
