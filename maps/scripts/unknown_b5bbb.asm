
Data_b5b5c:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5b67:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $52, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3c, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5bad:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5be7, NULL

Func_b5bbb:: ; b5bbb
	loadwarps $01, Data_b5b5c
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b5b67
	loadpeople $01, Data_b5bad
	playmusic $09
	scall Func_8001c
	ld hl, $030e
	scall LandmarkSign
	ret

Func_b5be7:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5c2c
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5c17
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5c1f
.asm_b5c17:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5c1f:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5c2c:
	pop bc
	pop bc
	ret
