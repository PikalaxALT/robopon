INCLUDE "includes.asm"

INCLUDE "audio/engine.asm"
INCLUDE "audio/song_headers.asm"
INCLUDE "audio/sfx.asm"

SECTION "Bank 1c padding", ROMX [$7f18], BANK [$1c]
REPT $74000 - $73f18
	db $ff
ENDR

SECTION "Bank 1d padding", ROMX [$7f10], BANK [$1d]
REPT $78000 - $77f10
	db $ff
ENDR
