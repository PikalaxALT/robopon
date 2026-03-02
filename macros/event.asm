MACRO lda
IF \1 == 0
	xor a
ELIF \1 < 0
	ld hl, sp-\1
	ld a, [hl]
ELSE
	ld a, \1
ENDC
ENDM

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
	lda \1
	scall PlayMusic
	ENDM

MACRO playsfx
	lda \1
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

MACRO move_person
	; person, pointer, wait
	ld bc, \2
	ld e, csbnk
	lda \1
IF \3 == 0
	scall MovePerson
ELSE
	scall MovePersonAndWait
ENDC
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
	lda \1
	scall FacePlayer
	ENDM

MACRO sprite_face
	ld e, \1
	lda \2
	scall SpriteFace
	ENDM

MACRO showperson
	ld e, 1
	lda \1
	scall SetPersonVisibilityState
	ENDM

MACRO hideperson
	ld e, 0
	lda \1
	scall SetPersonVisibilityState
	ENDM

Macro give_robot
	ld c, \2
	ld e, \3
	ld a, \1 + 1
	scall GiveRobot
	ENDM

MACRO if_true
	or a
	jp nz, \1
	ENDM

MACRO if_false
	or a
	jp z, \1
	ENDM

MACRO if_last_warp_not
	ld a, [wBackupMapGroup]
	cp GROUP_\1
	jp nz, \4
	ld a, [wBackupMapNumber]
	cp MAP_\1
	jp nz, \4
	ld a, [wBackupMapX]
	cp \2
	jp nz, \4
	ld a, [wBackupMapY]
	cp \3
	jp nz, \4
	ENDM

MACRO set_frame_script
	call \1
	ld hl, \1
	scall Func_80f11
	ENDM

MACRO warp_player
	ld l, \3
	push hl
	ld c, \2
	ld e, MAP_\1
	ld a, GROUP_\1
	scall Func_80dff
	ENDM
