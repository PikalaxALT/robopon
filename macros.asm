INCLUDE "macros/enum.asm"
INCLUDE "macros/audio.asm"
INCLUDE "macros/wram.asm"
INCLUDE "macros/map.asm"
INCLUDE "macros/event.asm"

tree_text_pointer: MACRO
\2_Pointer::
	dw (BANK(\2) - BANK(\1)) << 14 | (\2 & $3fff)
	ENDM

dtext_tree_pointer: MACRO
	dw (\1_Pointer - TextTreeBitstreams) / 2
	ENDM

emote_header: MACRO
	dw \2 - \1, \3
	ENDM

CallPredef EQUS "$8"

dn: MACRO
	db ((\1 & $f) << 4) | (\2 & $f)
	ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dba: MACRO
	dbw BANK(\1), \1
	ENDM

lb: MACRO
	ld \1, (\2 << 8) | \3
	ENDM

dr: MACRO
IF DEF(SUN)
INCBIN "baserom-sun.gbc", \1, \2 - \1
ELSE
IF DEF(STAR)
INCBIN "baserom-star.gbc", \1, \2 - \1
ELSE
	fail "No baserom variable defined. Stop."
ENDC
ENDC
ENDM

RGB: MACRO
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	ENDM

ldRGB: MACRO
	ld \1, ((\4) << 10) + ((\3) << 5) + (\2)
	ENDM

hlRGB EQUS "ldRGB hl,"
deRGB EQUS "ldRGB de,"
bcRGB EQUS "ldRGB bc,"

tile EQUS "+ $10 *"
tiles EQUS "* $10"

coord: MACRO
IF _NARG >= 4
	ld \1, \3 * SCREEN_WIDTH + \2 + \4
ELSE
	ld \1, \3 * SCREEN_WIDTH + \2 + wTileMap
ENDC
ENDM

hlcoord EQUS "coord hl,"
decoord EQUS "coord de,"
bccoord EQUS "coord bc,"

dwcoord: MACRO
IF _NARG >= 3
	dw \2 * SCREEN_WIDTH + \1 + \3
ELSE
	dw \2 * SCREEN_WIDTH + \1 + wTileMap
ENDC
ENDM

aCoord: MACRO
IF _NARG >= 3
	ld a, [\2 * SCREEN_WIDTH + \1 + \3]
ELSE
	ld a, [\2 * SCREEN_WIDTH + \1 + wTileMap]
ENDC
ENDM

Coorda: MACRO
IF _NARG >= 3
	ld [\2 * SCREEN_WIDTH + \1 + \3], a
ELSE
	ld [\2 * SCREEN_WIDTH + \1 + wTileMap], a
ENDC
ENDM

bgcoord: MACRO
IF _NARG >= 4
	ld \1, \3 * BG_MAP_WIDTH + \2 + \4
ELSE
	ld \1, \3 * BG_MAP_WIDTH + \2 + vBGMap
ENDC
ENDM

hlbgcoord EQUS "bgcoord hl,"
debgcoord EQUS "bgcoord de,"
bcbgcoord EQUS "bgcoord bc,"

defchar: MACRO
REPT _NARG
charmap \1, __charval__
shift
ENDR
__charval__ = __charval__ + 1
ENDM


char_def: MACRO
IF _NARG >= 1
__charval__ = \1
ELSE
__charval__ = 0
ENDC
ENDM

callba: MACRO
	ld a, BANK(\1)
	ld [wFarCallDestBank], a
	ld a, low(\1)
	ld [wFarCallDestAddr], a
	ld a, high(\1)
	ld [wFarCallDestAddr + 1], a
	call FarCall
	ENDM

set_farcall_addrs_hli: MACRO
	ld hl, wFarCallDestBank
	ld [hl], BANK(\1)
	inc hl
	ld [hl], low(\1)
	inc hl
	ld [hl], high(\1)
	ENDM

callba_hli: MACRO
	set_farcall_addrs_hli \1
	call FarCall
	ENDM

jpba_hli: MACRO
	set_farcall_addrs_hli \1
	jp FarCall
	ENDM

ctxt: MACRO
	fail "ctxt must be passed through textcomp.py"
	ENDM

bigdw: MACRO
	db high(\1), low(\1)
	ENDM

dx: MACRO
x = \2
rept \1
	db low(x)
x = x >> 8
endr
endm

bigdx: MACRO
y = \1
rept \1
	db low(\2 >> ((y - 1) * 8))
y = y - 1
endr
endm

dlong EQUS "dx 4,"

dbbw: MACRO
	db \1, \2
	dw \3
	ENDM

TX_STACK EQUS "db $25, $63"
TX_SNUM EQUS "db $25, $64"
TX_LITERAL EQUS "db $25, $6c,"
TX_UNUM EQUS "db $25, $6c, $64"
TX_HNUM EQUS "db $25, $70"
TX_CALL EQUS "db $25, $73"

write_hl_to: MACRO
	call WriteHalfWordTo
	dw \1
	ENDM

read_hl_from: MACRO
	call ReadHalfWordAt
	dw \1
	ENDM

read_hl_from_sp_plus: MACRO
IF \1 >= $100
	call GetHLAtSPPlusParam16
	dw \1
ELSE
	call GetHLAtSPPlusParam8
	db \1
ENDC
ENDM

write_hl_to_sp_plus: MACRO
IF \1 >= $100
	call WriteHLToSPPlusParam16
	dw \1
ELSE
	call WriteHLToSPPlusParam8
	db \1
ENDC
ENDM

walle: MACRO ; meme
	rept \1
	nop
	ENDR
	ENDM

reg8rot: MACRO
	ld \1, \2
	ld \2, \3
	ld \3, \1
	ENDM

reg16swap: MACRO
	push \1
	push \2
	pop \1
	pop \2
	ENDM

menu_header: MACRO
	db \1, \2 ; (x, y) of top left corner
	db \3, \4 ; width, height
REPT 9
IF \5 == $ff
	dba \6
	; enter callback
	; exit callback
	; up/down
	; a
	; b
	; right
	; left
	; loop callback
	; select
ELSE
	dbw \5, \6
ENDC
	shift
ENDR
ENDM

get_party_bot: MACRO
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
IF _NARG > 0
	ld de, \1
	add hl, de
ENDC
	ld de, wSaveScratchParty
	add hl, de
	ENDM

push_long: MACRO
	ld hl, \1 / $10000
	push hl
	ld hl, \1 % $10000
	push hl
	ENDM

write_long_to: MACRO
	ld hl, \2 % $10000
	write_hl_to \1
	ld hl, \2 / $10000
	write_hl_to \1 + 2
	ENDM

read_long_from_and_push: MACRO
	read_hl_from \1 + 2
	push hl
	read_hl_from \1
	push hl
	ENDM
