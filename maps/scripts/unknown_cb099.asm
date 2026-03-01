
Data_cafef:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $13, $11, $14, $2e
	warpdef $06, $0a, $01, $01, MAP_21_21, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_21, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_21, $0d, $0a, $0d, $09, $2e

Data_cb01b:
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

Data_cb061:
	person_event $09, $0c, $0a, $0c, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $04, $09, $06, $01, $01, $00, $04, $00, Func_cb1e9, NULL
	person_event $ff, $00, $09, $08, $02, $01, $02, $04, $01, Func_cb10e, NULL
	person_event $ff, $00, $0a, $06, $01, $01, $00, $04, $01, Func_cb183, NULL

Func_cb099:: ; cb099
	ld e, $04
	ld hl, Data_cafef
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb01b
	scall LoadEncounters
	ld e, $04
	ld hl, Data_cb061
	scall LoadMapObjects
	ld hl, $00aa
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cb0ce
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
.asm_cb0ce:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ff
	scall LandmarkSign
	ret

Data_cb0dd:
	db $0a, $0b, $ff, $ff

Data_cb0e1:
	db $09, $06, $ff, $ff

Data_cb0e5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $2e, $05, $1f, $04, $0e
	db $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $5c, $05, $1f, $05, $05
	db $05, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_cb10e:
	ld a, e
	cp $02
	jp nz, .asm_cb176
	ld hl, $00aa
	scall CheckEventFlag
	or a
	jp nz, .asm_cb176
	ld c, $01
	ld de, Data_cb0dd
	ld a, $32
	scall MovePlayer
	ld e, $00
	xor a
	scall SpriteFace
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $00d9
	scall PrintTextStandard
	ld de, Data_cb177
	ld hl, Data_cb0e5
	scall ScriptedBattle
	or a
	jp nz, .asm_cb14d
	jp .asm_cb176
.asm_cb14d:
	ld hl, $00da
	scall PrintTextStandard
	ld bc, Data_cb0e1
	ld e, $32
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00aa
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb176:
	ret

Data_cb177:
	dstr "(くﾞんそう)"

Data_cb17f:
	db $0a, $05, $ff, $ff

Func_cb183:
	push de
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_cb1e7
.asm_cb1b6:
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_cb1e7
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	ld hl, $00be
	scall PrintTextStandard
	ld c, $01
	ld de, Data_cb17f
	ld a, $32
	scall MovePlayer
	ld e, $00
	ld a, $01
	scall SpriteFace
.asm_cb1e7:
	pop bc
	ret

Func_cb1e9:
	push af
	ld a, e
	or a
	jp nz, .asm_cb236
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_cb230
.asm_cb227:
	ld hl, $00be
	scall PrintTextStandard
	jp .asm_cb236
.asm_cb230:
	ld hl, $03be
	scall PrintTextStandard
.asm_cb236:
	pop bc
	ret
