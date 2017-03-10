INCLUDE "macros/enum.asm"

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
