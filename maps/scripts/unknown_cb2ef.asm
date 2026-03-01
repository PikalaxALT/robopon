
Data_cb238:
	warpdef $06, $0a, $01, $01, MAP_21_20, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_20, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_20, $0d, $0a, $0d, $0b, $2e
	warpdef $01, $0d, $01, $01, MAP_21_22, $01, $0d, $02, $0d, $2e
	warpdef $09, $09, $01, $01, MAP_21_22, $09, $09, $09, $0a, $2e
	warpdef $12, $08, $01, $01, MAP_21_22, $12, $08, $11, $08, $2e

Data_cb27a:
	db $30, $0a, $02, $03, $19

Data_cb27f:
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

Data_cb2c5:
	person_event $09, $0c, $03, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $03, $06, $01, $04, $00, $04, $01, Func_cb335, NULL
	person_event $ff, $00, $04, $04, $01, $05, $00, $04, $01, Func_cb335, NULL

Func_cb2ef:: ; cb2ef
	ld e, $06
	ld hl, Data_cb238
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb27a
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb27f
	scall LoadEncounters
	ld hl, $00ab
	scall CheckEventFlag
	or a
	jp nz, .asm_cb31e
	ld e, $03
	ld hl, Data_cb2c5
	scall LoadMapObjects
.asm_cb31e:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0300
	scall LandmarkSign
	ret

Data_cb32d:
	db $03, $06, $ff, $ff

Data_cb331:
	db $04, $05, $ff, $ff

Func_cb335:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb391
	ld hl, $00ab
	scall CheckEventFlag
	or a
	jp nz, .asm_cb391
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb368
	ld c, $01
	ld de, Data_cb32d
	ld a, $32
	scall MovePlayer
	xor a
	scall PlayerFace
	jp .asm_cb37d
.asm_cb368:
	ld c, $01
	ld de, Data_cb331
	ld a, $32
	scall MovePlayer
	ld a, $03
	scall PlayerFace
	ld e, $01
	xor a
	scall SpriteFace
.asm_cb37d:
	call Func_cb3c6
	ld e, $01
	ld hl, $00ab
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb391:
	pop bc
	ret

Data_cb393:
	db $0c, $05, $ff, $ff

Data_cb397:
	db $03, $06, $0c, $06, $ff, $ff

Data_cb39d:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $03, $01, $03, $05, $1f, $01, $18
	db $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cb3c6:
	ld hl, $00d7
	scall PrintTextStandard
	ld de, Data_cb406
	ld hl, Data_cb39d
	scall ScriptedBattle
	or a
	jp nz, Func_cb3da
	ret

Func_cb3da:
	ld hl, $00d8
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_cb3f3
	ld bc, Data_cb393
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cb3fc
.asm_cb3f3:
	ld bc, Data_cb397
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cb3fc:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ret

Data_cb406:
	dstr "(くﾞんそう)"
