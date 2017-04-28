ldtext_tree_pointer: MACRO
	ld \1, (\2_Pointer - TextTreeBitstreams) / 2
	ENDM
hltext_tree_pointer EQUS "ldtext_tree_pointer hl,"

writetext: MACRO
	hltext_tree_pointer \1
	scall PrintTextStandard
	ENDM

writenpctext: MACRO
	hltext_tree_pointer \1
	scall PrintTextWithNPCName
	ENDM

writetext_yesorno: MACRO
	hltext_tree_pointer \1
	scall PrintTextWithYesNoBox
	ENDM

writenpctext_yesorno: MACRO
	hltext_tree_pointer \1
	scall PrintTextWithNPCNameAndYesNoBox
	ENDM

script_sleep: MACRO
	ld hl, \1
	scall ScriptSleep
	ENDM

playmusic: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall PlayMusic
	ENDM

playsfx: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall PlaySFX
	ENDM

checkevent: MACRO
	ld hl, \1
	scall CheckEventFlag
	ENDM

setevent: MACRO
	ld e, 1
	ld hl, \1
	scall EventFlagAction
	ENDM

resetevent: MACRO
	ld e, 0
	ld hl, \1
	scall EventFlagAction
	ENDM

startbattle: MACRO
	ld de, \1
	ld hl, \2
	scall ScriptedBattle
	ENDM

loadwilds: MACRO
	ld e, \1
	ld hl, \2
	scall LoadEncounters
	ENDM

loadwarps: MACRO
	ld e, \1
	ld hl, \2
	scall LoadWarps
	ENDM

loadpeople: MACRO
	ld e, \1
	ld hl, \2
	scall LoadMapObjects
	ENDM

move_player: MACRO
	ld c, \1
	ld de, \2
	ld a, BANK(\2)
	scall MovePlayer
	ENDM

loademote: MACRO
	ld c, \1
	ld e, \2
	ld a, \3
	scall LoadEmote
	ENDM

heal: MACRO
	scall RepairRobots
	ENDM

face_player: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall FacePlayer
	ENDM

sprite_face: MACRO
	ld e, \1
	ld a, \2
	scall SpriteFace
	ENDM
