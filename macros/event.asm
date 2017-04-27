writetext: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextStandard_20
	ENDM

writenpctext: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithNPCName_20
	ENDM

writetext_yesorno: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithYesNoBox_20
	ENDM

writenpctext_yesorno: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithNPCNameAndYesNoBox_20
	ENDM

script_sleep: MACRO
	ld hl, \1
	call ScriptSleep_20
	ENDM

playmusic: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	call PlayMusic_20
	ENDM

playsfx: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	call PlaySFX_20
	ENDM

checkevent: MACRO
	ld hl, \1
	call CheckEventFlag_20
	ENDM

setevent: MACRO
	ld e, 1
	ld hl, \1
	call EventFlagAction_20
	ENDM

resetevent: MACRO
	ld e, 0
	ld hl, \1
	call EventFlagAction_20
	ENDM

startbattle: MACRO
	ld de, \1
	ld hl, \2
	call ScriptedBattle_20
	ENDM

loadwilds: MACRO
	ld e, \1
	ld hl, \2
	call LoadEncounters_20
	ENDM

loadwarps: MACRO
	ld e, \1
	ld hl, \2
	call LoadWarps_20
	ENDM

loadpeople: MACRO
	ld e, \1
	ld hl, \2
	call LoadMapObjects_20
	ENDM

applymovementdata: MACRO
	ld c, \1
	ld de, \2
	ld a, BANK(\2)
	call ApplyMovementData_20
	ENDM

loademote: MACRO
	ld c, \1
	ld e, \2
	ld a, \3
	call LoadEmote_20
	ENDM

heal: MACRO
	call RepairRobots_20
	ENDM

face_player: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	call FacePlayer_20
	ENDM

sprite_face: MACRO
	ld e, \1
	ld a, \2
	call SpriteFace_20
	ENDM
