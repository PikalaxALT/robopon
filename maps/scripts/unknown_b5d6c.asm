
Data_b5d0d:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5d18:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3d, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $4b, $2a, $2d, $26, $0e, $08, $14, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $7d, $2b, $2e, $11, $06, $08, $11, $13, $08, $00
	wildbot $00, $02, $0f, $0e, $4f, $2c, $2f, $26, $06, $07, $00, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04, $04, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $70, $2b, $2e, $53, $01, $10, $00, $10, $08, $00
	wildbot $00, $02, $0f, $0e, $85, $2c, $2f, $7b, $14, $0d, $1f, $11, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01, $02, $00, $13, $06, $00
ENDC

Data_b5d5e:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5d98, NULL

Func_b5d6c:: ; b5d6c
	ld e, $01
	ld hl, Data_b5d0d
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5d18
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5d5e
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $030c
	scall LandmarkSign
	ret

Func_b5d98:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5ddd
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5dc8
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5dd0
.asm_b5dc8:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5dd0:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5ddd:
	pop bc
	pop bc
	ret
