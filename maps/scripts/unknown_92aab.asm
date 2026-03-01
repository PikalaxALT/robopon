
Data_929fc: ; 929fc
	warpdef $12, $18, $01, $01, MAP_09_03, $0a, $19, $0a, $18, SFX_2E
	warpdef $10, $04, $01, $01, MAP_09_03, $08, $04, $07, $04, SFX_2E
	warpdef $24, $07, $01, $01, MAP_09_03, $1d, $06, $1c, $06, SFX_2E
	warpdef $01, $15, $01, $01, MAP_02_00, $05, $0e, $06, $0e, SFX_2E

Data_92a28: ; 92a28
	db $2e, $1b, $03, $01, $36

Data_92a2d: ; 92a2d
IF DEF(SUN)
	wildbot $00, $03, $14, $17, $2b, $03, $05, $0c, $06, $11, $00, $01, $0a, $00
	wildbot $00, $03, $14, $17, $09, $02, $04, $22, $0f, $04, $00, $01, $08, $00
	wildbot $00, $03, $14, $17, $8b, $04, $06, $2d, $26, $12, $00, $08, $06, $00
	wildbot $0f, $03, $18, $17, $2b, $03, $05, $7f, $06, $06, $00, $01, $0a, $00
	wildbot $0f, $03, $18, $17, $09, $02, $04, $5a, $0f, $03, $00, $01, $08, $00
	wildbot $0f, $03, $18, $17, $8b, $04, $06, $39, $05, $05, $00, $08, $06, $00
	wildbot $19, $03, $04, $17, $29, $06, $08, $0d, $01, $00, $00, $01, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $17, $2b, $03, $05, $7f, $06, $11, $00, $01, $0a, $00
	wildbot $00, $03, $14, $17, $0c, $02, $04, $22, $05, $01, $00, $01, $08, $00
	wildbot $00, $03, $14, $17, $11, $04, $06, $01, $1f, $1e, $00, $08, $06, $00
	wildbot $0f, $03, $18, $17, $2b, $03, $05, $7f, $06, $06, $00, $01, $0a, $00
	wildbot $0f, $03, $18, $17, $0c, $02, $04, $5a, $05, $19, $00, $01, $08, $00
	wildbot $0f, $03, $18, $17, $11, $04, $06, $00, $1f, $00, $00, $08, $06, $00
	wildbot $19, $03, $04, $17, $2a, $06, $08, $0d, $05, $05, $00, $01, $03, $00
ENDC

Data_92a8f: ; 92a8f
	person_event $10, $04, $04, $04, $01, $01, $01, $04, $00, Func_92b08, NULL
	person_event $0b, $04, $21, $18, $01, $01, $03, $04, $00, Func_92b90, NULL

Func_92aab:: ; 92aab (24:6aab)
	ld e, $4
	ld hl, Data_929fc
	scall LoadWarps
	ld e, $1
	ld hl, Data_92a28
	scall Func_80ce7
	ld a, $3
	scall Func_80d01
	ld e, $7
	ld hl, Data_92a2d
	scall LoadEncounters
	ld e, $2
	ld hl, Data_92a8f
	scall LoadMapObjects
	ld a, $8
	scall PlayMusic
	scall Func_8001c
	landmarksign TreeBitstreamText_46cec
	ret

Data_92adf:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $20, $01, $47, $01, $06, $14, $0d
	db $1e, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b08:
	push af
	ld a, e
	or a
	jp nz, Func_92b5e
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8e
	scall CheckEventFlag
	or a
	jp nz, Func_92b58
	writetext TreeBitstreamText_42ae8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92b4f
	ld de, Data_92b60
	ld hl, Data_92adf
	scall ScriptedBattle
	or a
	jp nz, Func_92b3e
	jp Func_92b5e

Func_92b3e: ; 92b3e (24:6b3e)
	ld e, $1
	ld hl, $8e
	scall EventFlagAction
	writetext TreeBitstreamText_42af6
	jp Func_92b55

Func_92b4f: ; 92b4f (24:6b4f)
	writetext TreeBitstreamText_42ad0
Func_92b55: ; 92b55 (24:6b55)
	jp Func_92b5e

Func_92b58: ; 92b58 (24:6b58)
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
Func_92b5e: ; 92b5e (24:6b5e)
	pop bc
	ret

Data_92b60:
	dstr "レテﾞィース"

Data_92b67:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1f, $01, $62, $02, $06, $02, $03
	db $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b90:
	push af
	ld a, e
	or a
	jp nz, Func_92be6
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8f
	scall CheckEventFlag
	or a
	jp nz, Func_92be0
	writetext TreeBitstreamText_42b02
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92bd7
	ld de, Data_92be8
	ld hl, Data_92b67
	scall ScriptedBattle
	or a
	jp nz, Func_92bc6
	jp Func_92be6

Func_92bc6: ; 92bc6 (24:6bc6)
	ld e, $1
	ld hl, $8f
	scall EventFlagAction
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
	jp Func_92bdd

Func_92bd7: ; 92bd7 (24:6bd7)
	writetext TreeBitstreamText_42b24
Func_92bdd: ; 92bdd (24:6bdd)
	jp Func_92be6

Func_92be0: ; 92be0 (24:6be0)
	ld hl, CheckSongFinishedPredef
	scall PrintTextStandard
Func_92be6: ; 92be6 (24:6be6)
	pop bc
	ret

Data_92be8:
	dstr "ソﾞッキー"
