MACRO char
\1:: db
ENDM

MACRO short
\1:: dw
ENDM

MACRO long
\1:: ds $4
ENDM

MACRO array
\1::
	ds \2 * \3 * \4
\1End::
ENDM

MACRO bitfield
\1::
IF \2 & $7
	ds (\2 >> 3) + 1
ELSE
	ds \2 >> 3
ENDC
ENDM

MACRO oam_ram
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

MACRO video_transfer_queue
\1::
\1TilesRemaining:: ds 1
\1Source:: ds 2
\1Dest:: ds 2
ENDM

MACRO alloc_block
\1::
	char \1_Status
	short \1_Size
	short \1_Next
ENDM

