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
