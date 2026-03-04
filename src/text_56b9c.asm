INCLUDE "includes.asm"
INCLUDE "charmap.asm"

IF DEF(LANG_JP)
setcharmap kana
ENDC

SECTION "Text_56b9c", ROMX

Text_56b9c::
	dstr "アタック"

