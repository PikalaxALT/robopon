INCLUDE "macros/enum.asm"

CallPredef EQUS "$08"

dbw: MACRO
	db \1
	dw \2
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

oam_ram: MACRO
\1YCoord:: ds 1
\1XCoord:: ds 1
\1VTile:: ds 1
\1Attrs::
; bit 7 - bg priority
; bit 6 - y flip
; bit 5 - x flip
; bit 4 - dmg/sgb pal
; bit 3 - cgb vram bank
; bits 0-2 - cgb pal
	ds 1
	ENDM

defchar: MACRO
charmap \1, __charval__
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
	ld a, \1 % $100
	ld [wFarCallDestAddr], a
	ld a, \1 / $100
	ld [wFarCallDestAddr + 1], a
	call FarCall
	ENDM

set_farcall_addrs_hli: MACRO
	ld hl, wFarCallDestBank
	ld [hl], BANK(\1)
	inc hl
	ld [hl], \1 % $100
	inc hl
	ld [hl], \1 / $100
	ENDM

callba_hli: MACRO
	set_farcall_addrs_hli \1
	call FarCall
	ENDM

dx: MACRO
x = \2
rept \1
	db x & $ff
x = x >> 8
endr
endm

bigdx: MACRO
y = \1
rept \1
	db (\2 >> ((y - 1) * 8)) & $ff
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
TX_CALL EQUS "db $25, $73"
