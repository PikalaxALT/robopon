
Data_cb40e:
	warpdef $01, $0d, $01, $01, MAP_21_21, $01, $0d, $01, $0c, $2e
	warpdef $09, $09, $01, $01, MAP_21_21, $09, $09, $09, $0a, $2e
	warpdef $12, $08, $01, $01, MAP_21_21, $12, $08, $12, $09, $2e
	warpdef $01, $0a, $01, $01, MAP_21_23, $01, $0a, $01, $09, $2e
	warpdef $0d, $0b, $01, $01, MAP_21_23, $0d, $0b, $0c, $0b, $2e
	warpdef $12, $0d, $01, $01, MAP_21_23, $12, $0d, $11, $0d, $2e

Data_cb450:
	db $32, $06, $0b, $03, $1b

Data_cb455:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb49b:
	person_event $09, $0c, $0b, $0b, $01, $01, $02, $04, $00, Func_cb534, NULL
	person_event $ff, $00, $0b, $09, $01, $02, $00, $04, $01, Func_cb534, NULL
	person_event $ff, $00, $0b, $0c, $01, $03, $00, $04, $01, Func_cb534, NULL

Func_cb4c5:: ; cb4c5
	ld e, $06
	ld hl, Data_cb40e
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb450
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb455
	scall LoadEncounters
	ld hl, $00ac
	scall CheckEventFlag
	or a
	jp nz, .asm_cb4f4
	ld e, $03
	ld hl, Data_cb49b
	scall LoadMapObjects
.asm_cb4f4:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0301
	scall LandmarkSign
	ret

Data_cb503:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $20, $17, $17
	db $17, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_cb52c:
	db $0b, $0a, $ff, $ff

Data_cb530:
	db $0b, $0c, $ff, $ff

Func_cb534:
	push af
	ld l, $ff
	ld a, e
	cp $02
	jp z, .asm_cb541
	or a
	jp nz, .asm_cb580
.asm_cb541:
	ld a, [wMapY]
	add a, $04
	cp $0b
	jp nz, .asm_cb550
	ld l, $01
	jp .asm_cb580
.asm_cb550:
	ld a, e
	cp $02
	jp nz, .asm_cb580
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb570
	ld c, $01
	ld de, Data_cb52c
	ld a, $32
	scall MovePlayer
	ld a, $02
	scall PlayerFace
	jp .asm_cb57e
.asm_cb570:
	ld c, $01
	ld de, Data_cb530
	ld a, $32
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_cb57e:
	ld l, $01
.asm_cb580:
	ld a, l
	cp $01
	jp nz, .asm_cb604
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	xor a
	scall FacePlayer
	ld hl, $00dd
	scall PrintTextStandard
	ld de, Data_cb606
	ld hl, Data_cb503
	scall ScriptedBattle
	or a
	jp nz, .asm_cb5a9
	jp .asm_cb604
.asm_cb5a9:
	ld hl, $00de
	scall PrintTextStandard
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ac
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb604:
	pop bc
	ret

Data_cb606:
	dstr "(くﾞんそう)"
