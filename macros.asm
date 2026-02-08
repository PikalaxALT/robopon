INCLUDE "macros/enum.asm"
INCLUDE "macros/audio.asm"
INCLUDE "macros/wram.asm"
INCLUDE "macros/map.asm"
INCLUDE "macros/event.asm"
INCLUDE "macros/battle_anim.asm"

MACRO check_cgb
	ld a, [wSystemType]
	cp SYSID_CGB
	ENDM

MACRO tree_text_pointer
\2_Pointer::
	dw (BANK(\2) - BANK(\1)) << 14 | (\2 & $3fff)
	ENDM

MACRO dtext_tree_pointer
	dw (\1_Pointer - TextTreeBitstreams) / 2
	ENDM

MACRO emote_header
	dw \2 - \1, \3
	ENDM

DEF CallPredef EQUS "$8"

MACRO dn
	db ((\1 & $f) << 4) | (\2 & $f)
	ENDM

MACRO dbw
	db \1
	dw \2
	ENDM

MACRO dba
	dbw BANK(\1), \1
	ENDM

MACRO lb
	ld \1, (\2 << 8) | \3
	ENDM

MACRO dr
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

MACRO RGB
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	ENDM

MACRO ldRGB
	ld \1, ((\4) << 10) + ((\3) << 5) + (\2)
	ENDM

DEF hlRGB EQUS "ldRGB hl,"
DEF deRGB EQUS "ldRGB de,"
DEF bcRGB EQUS "ldRGB bc,"

DEF tile EQUS "+ $10 *"
DEF tiles EQUS "* $10"

MACRO coord
IF _NARG >= 4
	ld \1, \3 * SCREEN_WIDTH + \2 + \4
ELSE
	ld \1, \3 * SCREEN_WIDTH + \2 + wTileMap
ENDC
ENDM

DEF hlcoord EQUS "coord hl,"
DEF decoord EQUS "coord de,"
DEF bccoord EQUS "coord bc,"

MACRO dwcoord
IF _NARG >= 3
	dw \2 * SCREEN_WIDTH + \1 + \3
ELSE
	dw \2 * SCREEN_WIDTH + \1 + wTileMap
ENDC
ENDM

MACRO aCoord
IF _NARG >= 3
	ld a, [\2 * SCREEN_WIDTH + \1 + \3]
ELSE
	ld a, [\2 * SCREEN_WIDTH + \1 + wTileMap]
ENDC
ENDM

MACRO Coorda
IF _NARG >= 3
	ld [\2 * SCREEN_WIDTH + \1 + \3], a
ELSE
	ld [\2 * SCREEN_WIDTH + \1 + wTileMap], a
ENDC
ENDM

MACRO bgcoord
IF _NARG >= 4
	ld \1, \3 * BG_MAP_WIDTH + \2 + \4
ELSE
	ld \1, \3 * BG_MAP_WIDTH + \2 + vBGMap
ENDC
ENDM

DEF hlbgcoord EQUS "bgcoord hl,"
DEF debgcoord EQUS "bgcoord de,"
DEF bcbgcoord EQUS "bgcoord bc,"

MACRO defchar
REPT _NARG
charmap \1, __charval__
shift
ENDR
DEF __charval__ = __charval__ + 1
ENDM


MACRO char_def
IF _NARG >= 1
DEF __charval__ = \1
ELSE
DEF __charval__ = 0
ENDC
ENDM

MACRO callba
	ld a, BANK(\1)
	ld [wFarCallDestBank], a
	ld a, low(\1)
	ld [wFarCallDestAddr], a
	ld a, high(\1)
	ld [wFarCallDestAddr + 1], a
	call FarCall
	ENDM

MACRO set_farcall_addrs_hli
	ld hl, wFarCallDestBank
	ld [hl], BANK(\1)
	inc hl
	ld [hl], low(\1)
	inc hl
	ld [hl], high(\1)
	ENDM

MACRO callba_hli
	set_farcall_addrs_hli \1
	call FarCall
	ENDM

MACRO jpba_hli
	set_farcall_addrs_hli \1
	jp FarCall
	ENDM

MACRO ctxt
	fail "ctxt must be passed through textcomp.py"
	ENDM

MACRO bigdw
	db high(\1), low(\1)
	ENDM

MACRO dx
DEF x = \2
rept \1
	db low(x)
DEF x = x >> 8
endr
endm

MACRO bigdx
DEF y = \1
rept \1
	db low(\2 >> ((y - 1) * 8))
DEF y = y - 1
endr
endm

DEF dlong EQUS "dx 4,"

MACRO dbbw
	db \1, \2
	dw \3
	ENDM

MACRO dstr
	db \1, 0
	ENDM

MACRO write_hl_to
	call WriteHalfWordTo
	dw \1
	ENDM

MACRO read_hl_from
	call ReadHalfWordAt
	dw \1
	ENDM

MACRO read_hl_from_sp_plus
IF \1 >= $100
	call GetHLAtSPPlusParam16
	dw \1
ELSE
	call GetHLAtSPPlusParam8
	db \1
ENDC
ENDM

MACRO write_hl_to_sp_plus
IF \1 >= $100
	call WriteHLToSPPlusParam16
	dw \1
ELSE
	call WriteHLToSPPlusParam8
	db \1
ENDC
ENDM

MACRO walle ; meme
	rept \1
	nop
	ENDR
	ENDM

MACRO reg8rot
	ld \1, \2
	ld \2, \3
	ld \3, \1
	ENDM

MACRO reg16swap
	push \1
	push \2
	pop \1
	pop \2
	ENDM

MACRO menu_header
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

MACRO get_party_bot
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

MACRO push_long
	ld hl, \1 / $10000
	push hl
	ld hl, \1 % $10000
	push hl
	ENDM

MACRO write_long_to
	ld hl, \2 % $10000
	write_hl_to \1
	ld hl, \2 / $10000
	write_hl_to \1 + 2
	ENDM

MACRO read_long_from_and_push
	read_hl_from \1 + 2
	push hl
	read_hl_from \1
	push hl
	ENDM
