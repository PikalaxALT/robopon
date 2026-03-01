
Data_b5702:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5718:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b575e:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5798, NULL

Func_b576c:: ; b576c
	loadwarps $02, Data_b5702
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b5718
	loadpeople $01, Data_b575e
	playmusic $09
	scall Func_8001c
	landmarksign TreeBitstreamText_46b67
	ret

Func_b5798:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b57dd
	landmarksign TreeBitstreamText_46daf
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b57c8
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b57d0
.asm_b57c8:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b57d0:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b57dd:
	pop bc
	pop bc
	ret
