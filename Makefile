PYTHON := python3
POKETOOLS := extras/pokemontools
COMPARE ?= 0

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	MD5 := gmd5sum -c
else
	MD5 := md5sum -c
endif

SUN_ROM := robosun-jp.gbc
STAR_ROM := robostar-jp.gbc
SUN_EN_ROM := roboson-en.gbc
ROMS := $(SUN_ROM) $(STAR_ROM) $(SUN_EN_ROM)

GAME_VERSION  ?= SUN
GAME_LANGUAGE ?= JP

ifeq ($(GAME_VERSION),SUN)
shortname := sun
else
ifeq ($(GAME_VERSION),STAR)
shortname := star
else
$(error unsupported GAME_VERSION=$(GAME_VERSION))
endif
endif


ifeq ($(GAME_LANGUAGE),JP)
shortname  := $(shortname)-jp
LINK_PAD   := 0
GAME_TITLE := "ROBOPON $(GAME_VERSION)"
GAME_ID    :=
LANG_FLAG  :=
else
ifeq ($(GAME_LANGUAGE),EN)
shortname  := $(shortname)-en
LINK_PAD   := 255
GAME_TITLE := $(GAME_VERSION)
GAME_ID    := -i HREE
LANG_FLAG  := -j
else
$(error unsupported GAME_LANGUAGE=$(GAME_LANGUAGE))
endif
endif

BUILDDIR := build/$(shortname)
BUILD_SUBDIRS := src maps
ROM := robo$(shortname).gbc
dummy := $(foreach dir,$(BUILD_SUBDIRS),$(shell mkdir -p $(BUILDDIR)/$(dir)))

RGBASM_OPTS  = -D $(GAME_VERSION) -D LANG_$(GAME_LANGUAGE)
RGBLINK_OPTS = -w -p $(LINK_PAD)
RGBFIX_OPTS  = -csv -k 18 -l 0x33 -m 0xfe -p 0xff -r 0x03 -t $(GAME_TITLE) $(GAME_ID) $(LANG_FLAG)

RZ       := $(PYTHON) rz.py compress
TM       := $(PYTHON) tm2bpp.py furl
EMOTE    := $(PYTHON) emote.py pack
2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
includes := $(PYTHON) scan_includes.py

SRC_ASM := \
	hram.asm \
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
	maps/bank_25_2.asm \
	maps/bank_26.asm \
	maps/bank_26_2.asm \
	src/bank_26_3.asm \
	maps/bank_27.asm \
	maps/bank_28.asm \
	maps/bank_29.asm \
	maps/bank_29_2.asm \
	maps/bank_2a.asm \
	maps/bank_2b.asm \
	maps/bank_2b_2.asm \
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

ALL_OBJS := $(SRC_ASM:%.asm=$(BUILDDIR)/%.o)

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
ifeq ($(COMPARE),1)
	$(MD5) $(shortname).md5
endif

sun:     ; @$(MAKE) GAME_VERSION=SUN
star:    ; @$(MAKE) GAME_VERSION=STAR
sun-en:  ; @$(MAKE) GAME_VERSION=SUN GAME_LANGUAGE=EN
star-en: ; @$(MAKE) GAME_VERSION=STAR GAME_LANGUAGE=EN

compare:
	@$(MAKE) COMPARE=1 GAME_VERSION=SUN
	@$(MAKE) COMPARE=1 GAME_VERSION=STAR

tidy:
	$(RM) -r $(ROMS) $(BUILDDIR) $(ROMS:.gbc=.sym) $(ROMS:.gbc=.map)

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' -o -iname '*.pcm' -o -iname '*.rz' -o -iname '*.ctf' -o -iname '*.tm2bpp' -o -iname '*.emote' \) -exec $(RM) {} +
	$(RM) -r build

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

%.emote: %.2bpp
	$(EMOTE) $<

%.rz: %
	$(RZ) $< $@

$(ALL_OBJS): $(BUILDDIR)/%.o: %.asm $$(%_dep)
	rgbasm $(RGBASM_OPTS) -o $@ $<

$(ROM): $(ALL_OBJS) layout.link
	rgblink $(RGBLINK_OPTS) -l layout.link -n $*.sym -m $*.map -o $@ $(ALL_OBJS)
	./trim.py $@
	rgbfix $(RGBFIX_OPTS) $@
