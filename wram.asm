INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $1fa ; c006
wLCD:: ds $7 ; c200
wc207:: ds $2 ; c207
wc209:: ds $9 ; c209
wc212:: ds $2 ; c212
wc213:: ds $5 ; c213
wc218:: ds $2 ; c213
wc21a:: ds $1 ; c21a
wc21b:: ds $2 ; c21b
	ds $de
wSystemTypeTemp:: ; c2fb

SECTION "OAM Buffer", WRAM0 [$c300]
wOAMBuffer:: ; c300
	oam_ram wOAM00
	oam_ram wOAM01
	oam_ram wOAM02
	oam_ram wOAM03
	oam_ram wOAM04
	oam_ram wOAM05
	oam_ram wOAM06
	oam_ram wOAM07
	oam_ram wOAM08
	oam_ram wOAM09
	oam_ram wOAM0a
	oam_ram wOAM0b
	oam_ram wOAM0c
	oam_ram wOAM0d
	oam_ram wOAM0e
	oam_ram wOAM0f
	oam_ram wOAM10
	oam_ram wOAM11
	oam_ram wOAM12
	oam_ram wOAM13
	oam_ram wOAM14
	oam_ram wOAM15
	oam_ram wOAM16
	oam_ram wOAM17
	oam_ram wOAM18
	oam_ram wOAM19
	oam_ram wOAM1a
	oam_ram wOAM1b
	oam_ram wOAM1c
	oam_ram wOAM1d
	oam_ram wOAM1e
	oam_ram wOAM1f
	oam_ram wOAM20
	oam_ram wOAM21
	oam_ram wOAM22
	oam_ram wOAM23
	oam_ram wOAM24
	oam_ram wOAM25
	oam_ram wOAM26
	oam_ram wOAM27

SECTION "Stack", WRAM0 [$df00]
wStackBottom:: ds $100 ; df00
wStackTop:: ; e000
