
Data_b5c2f:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5c45:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $06, $07, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5c8b:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5cc5, NULL

Func_b5c99:: ; b5c99
	loadwarps $02, Data_b5c2f
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b5c45
	loadpeople $01, Data_b5c8b
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_46b30
	ret

Func_b5cc5:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5d0a
	landmarksign TreeBitstreamText_46daf
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5cf5
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5cfd
.asm_b5cf5
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5cfd
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5d0a
	pop bc
	pop bc
	ret
