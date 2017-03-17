INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $1a ; c006
wc020:: ds $1e0 ; c020
wLCD:: ds $3 ; c200

; bit 7: call wVBlankCallback (far call with SRAM open)
; bit 6: push BGMap metatiles or CGB palettes
; bit 5: push DMG pals
; bit 4: push SCX and SCY
; bit 3: read joypad
; bit 2: push LCDC
; bit 1: push OAM
; bit 0: handle video transfer request
wNextVBlankFlags:: ds $1 ; c203
wLastVBlankFlags:: ds $1 ; c204
wJoyPressed:: ds $1 ; c205
wJoyLast:: ds $1 ; c206
wJoyHeld:: ds $1 ; c207
wc208:: ds $1 ; c208
wTextBlinkerFrameCounter:: ds $1 ; c209
wTimerCounter:: ds $2 ; c20a
wSCX:: ds $1 ; c20c
wSCX2:: ds $1 ; c20d
wSCY:: ds $1 ; c20e
wSCY2:: ds $2 ; c20f
wLCDC:: ds $1 ; c211
wFarCallSavedA:: ds $1 ; c212
wc213:: ds $5 ; c213
wFarCallSavedHL:: ds $2 ; c218
wFarCallDestBank:: ds $1 ; c21a
wFarCallDestAddr:: ds $2 ; c21b
wBGP:: ds $1 ; c21d
wOBP0:: ds $1 ; c21e
wOBP1:: ds $1 ; c21f
	ds $4
wVBlankCallbackROMBank:: ds $1 ; c224
wVBlankCallbackRAMBank:: ds $1 ; c225
wVBlankCallbackAddress:: ds $2 ; c226
wDecompressEndAddress:: ds $2 ; c228
wDecompressLiteralCopySize:: ds $2 ; c22a
wDecompresLiteralCopyOffsetHi:: ds $1 ; c22c
	ds $c

video_transfer_queue: MACRO
\1::
\1TilesRemaining:: ds 1
\1Source:: ds 2
\1Dest:: ds 2
ENDM

wVideoTransferQueue:: ; c239
	video_transfer_queue wVideoTransferQueueEntry1 ; c239
	video_transfer_queue wVideoTransferQueueEntry2 ; c23e
	video_transfer_queue wVideoTransferQueueEntry3 ; c243
	video_transfer_queue wVideoTransferQueueEntry4 ; c248

wc24d:: ds $1 ; c24d
wBlinkerX:: ds $1 ; c24e
wBlinkerY:: ds $1 ; c24f
wBlinkerTile:: ds $1 ; c250
wBlinkerOffTile:: ds $1 ; c251
wStringDestX:: ds $1 ; c252
wStringDestY:: ds $1 ; c253
	ds $1
wKana:: ; c255
; 00: katakana
; ff: hiragana
	ds $1

	ds $92
wc2e8:: ds $1 ; c2e8
	ds $1

wVideoTransferRequestFlags:: ds $1 ; c2ea
	ds $2
wVideoTransferRequestBank:: ds $1 ; c2ed
	ds $d
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

SECTION "Tile Map", WRAM0 [$c4a0]
wTileMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT

SECTION "CGB Palettes Buffer", WRAM0 [$c89c]
wCGB_BGPalsBuffer:: ; c89c
	ds 8 * 8

wCGB_OBPalsBuffer:: ; c8dc
	ds 8 * 8

wVBlankTransferFlags:: ; c91c
; ==0: push CGB palettes
; bit 1: push wVBlankMetaTileTransferQueue1
; bit 0: push wVBlankMetaTileTransferQueue0
	ds $1

	ds $2

wVBlankMetaTileTransferQueue0TileSource:: dw ; c91f
wVBlankMetaTileTransferQueue0AttrSource:: dw ; c921
wVBlankMetaTileTransferQueue0Dest:: dw ; c923

wVBlankMetaTileTransferQueue1TileSource:: dw ; c925
wVBlankMetaTileTransferQueue1AttrSource:: dw ; c927
wVBlankMetaTileTransferQueue1Dest:: dw ; c929

SECTION "Stack", WRAM0 [$d810]
wStackBottom:: ds $7f0 ; d810
wStackTop:: ; e000
