MACRO ldtext_tree_pointer
	ld \1, (\2_Pointer - TextTreeBitstreams) / 2
	ENDM
DEF hltext_tree_pointer EQUS "ldtext_tree_pointer hl,"

MACRO writetext
	hltext_tree_pointer \1
	scall PrintTextStandard
	ENDM

MACRO writenpctext
	hltext_tree_pointer \1
	scall PrintTextWithNPCName
	ENDM

MACRO writetext_yesorno
	hltext_tree_pointer \1
	scall PrintTextWithYesNoBox
	ENDM

MACRO writenpctext_yesorno
	hltext_tree_pointer \1
	scall PrintTextWithNPCNameAndYesNoBox
	ENDM

MACRO landmarksign
	hltext_tree_pointer \1
	scall LandmarkSign
	ENDM

MACRO script_sleep
	ld hl, \1
	scall ScriptSleep
	ENDM

MACRO playmusic
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall PlayMusic
	ENDM

MACRO playsfx
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall PlaySFX
	ENDM

MACRO checkevent
	ld hl, \1
	scall CheckEventFlag
	ENDM

MACRO setevent
	ld e, 1
	ld hl, \1
	scall EventFlagAction
	ENDM

MACRO resetevent
	ld e, 0
	ld hl, \1
	scall EventFlagAction
	ENDM

MACRO startbattle
	ld de, \1
	ld hl, \2
	scall ScriptedBattle
	ENDM

MACRO loadwilds
	ld e, \1
	ld hl, \2
	scall LoadEncounters
	ENDM

MACRO loadwarps
	ld e, \1
	ld hl, \2
	scall LoadWarps
	ENDM

MACRO loadpeople
	ld e, \1
	ld hl, \2
	scall LoadMapObjects
	ENDM

MACRO move_player
	ld c, \1 ; speed?
	ld de, \2
	ld a, csbnk
	scall MovePlayer
	ENDM

MACRO loademote
	ld c, \1
	ld e, \2
	ld a, \3
	scall LoadEmote
	ENDM

MACRO heal
	scall RepairRobots
	ENDM

MACRO face_player
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scall FacePlayer
	ENDM

MACRO sprite_face
	ld e, \1
	ld a, \2
	scall SpriteFace
	ENDM

MACRO showperson
	ld e, 1
	ld a, \1
	scall SetPersonVisibilityState
	ENDM

MACRO hideperson
	ld e, 0
	ld a, \1
	scall SetPersonVisibilityState
	ENDM

MACRO if_true
	or a
	jp nz, \1
	ENDM
