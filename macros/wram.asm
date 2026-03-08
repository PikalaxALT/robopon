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

IF DEF(LANG_JP)
DEF PLAYER_NAME_LENGTH EQU 5
ELIF DEF(LANG_EN)
DEF PLAYER_NAME_LENGTH EQU 6
ENDC

MACRO save_block_1
\1::
	array \1_PlayerName, PLAYER_NAME_LENGTH, 1, 1 ; c980
	char \1_BirthMonth ; c985
	char \1_BirthDay ; c986
	char \1_ZodiacSign ; c987
	ds $1
	array \1_Money, 4, 1, 1 ; c989
	char \1_c98d ; c98d
	array \1_c98e, 20, 1, 1 ; c98e
	char \1_c9a2 ; c9a2
	array \1_c9a3, 20, 1, 1 ; c9a3
	char \1_c9b7 ; c9b7
	array \1_Party, 4, partyRobot_SIZEOF, 1 ; c9b8
	array \1_BagItems, 20, 1, 1 ; ca44
	array \1_BagItemQuantities, 20, 1, 1 ; ca58
	char \1_ca6c ; ca6c
	ds $3
	bitfield \1_DexSeenFlags, NUM_ROBOTS ; ca70
	bitfield \1_DexCaughtFlags, NUM_ROBOTS ; ca86
	char \1_Options ; ca9c
	bitfield \1_EventFlags, 400 ; ca9d
	array \1_c789, 100, 1, 1 ; cacf
	array \1_cb33, 8, 1, 1 ; cb33
	long \1_cb3b ; cb3b
	array \1_cb3f, 5, 1, 2 ; cb3f
	array \1_cb49, 5, 1, 2 ; cb49
	short \1_cb53 ; cb53
	short \1_cb55 ; cb55
	char \1_cb57 ; cb57
	array \1_c347, 3, 20, 1 ; cb58
	ENDM
