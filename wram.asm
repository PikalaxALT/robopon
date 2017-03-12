INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $1a ; c006
wc020:: ds $1e0 ; c020
wLCD:: ds $3 ; c200
wc203:: ds $4 ; c203
wc207:: ds $2 ; c207
wc209:: ds $3 ; c209
wSCX:: ds $1 ; c20c
wSCX2:: ds $1 ; c20d
wSCY:: ds $1 ; c20e
wSCY2:: ds $2 ; c20f
wLCDC:: ds $1 ; c211
wc212:: ds $1 ; c212
wc213:: ds $5 ; c213
wc218:: ds $2 ; c218
wc21a:: ds $1 ; c21a
wc21b:: ds $2 ; c21b
wBGP:: ds $1 ; c21d
wOBP0:: ds $1 ; c21e
wOBP1:: ds $1 ; c21f
	ds $db
wSystemType:: ; c2fb

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

SECTION "OAM Buffer 2", WRAM0 [$c400]
wOAMBuffer2:: ; c300
	oam_ram wOAM2_00
	oam_ram wOAM2_01
	oam_ram wOAM2_02
	oam_ram wOAM2_03
	oam_ram wOAM2_04
	oam_ram wOAM2_05
	oam_ram wOAM2_06
	oam_ram wOAM2_07
	oam_ram wOAM2_08
	oam_ram wOAM2_09
	oam_ram wOAM2_0a
	oam_ram wOAM2_0b
	oam_ram wOAM2_0c
	oam_ram wOAM2_0d
	oam_ram wOAM2_0e
	oam_ram wOAM2_0f
	oam_ram wOAM2_10
	oam_ram wOAM2_11
	oam_ram wOAM2_12
	oam_ram wOAM2_13
	oam_ram wOAM2_14
	oam_ram wOAM2_15
	oam_ram wOAM2_16
	oam_ram wOAM2_17
	oam_ram wOAM2_18
	oam_ram wOAM2_19
	oam_ram wOAM2_1a
	oam_ram wOAM2_1b
	oam_ram wOAM2_1c
	oam_ram wOAM2_1d
	oam_ram wOAM2_1e
	oam_ram wOAM2_1f
	oam_ram wOAM2_20
	oam_ram wOAM2_21
	oam_ram wOAM2_22
	oam_ram wOAM2_23
	oam_ram wOAM2_24
	oam_ram wOAM2_25
	oam_ram wOAM2_26
	oam_ram wOAM2_27

SECTION "CGB Palettes Buffer", WRAM0 [$c89c]
wCGB_BGPalsBuffer::
	ds 8 * 8

wCGB_OBPalsBuffer::
	ds 8 * 8

SECTION "Stack", WRAM0 [$df00]
wStackBottom:: ds $100 ; df00
wStackTop:: ; e000
