
Data_9f155:
	warpdef $05, $1d, $03, $01, MAP_19_03, $1d, $04, $1d, $05, SFX_2E
	warpdef $06, $02, $01, $01, MAP_19_20, $09, $27, $09, $26, SFX_2E

Data_9f16b:
IF DEF(SUN)
	wildbot $00, $03, $0e, $1b, $26, $20, $23, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $00, $03, $0e, $1b, $27, $22, $25, $5d, $01, $03, $00, $05, $09, $00
	wildbot $00, $03, $0e, $1b, $61, $22, $25, $5d, $05, $09, $00, $05, $08, $00
	wildbot $00, $03, $0e, $1b, $36, $24, $27, $79, $0f, $0b, $00, $05, $07, $00
	wildbot $00, $03, $0e, $1b, $28, $24, $27, $5d, $0e, $0f, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $1b, $5f, $20, $23, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $03, $0e, $1b, $60, $22, $25, $5d, $01, $03, $00, $05, $09, $00
	wildbot $00, $03, $0e, $1b, $28, $22, $25, $5d, $0e, $0f, $00, $05, $08, $00
	wildbot $00, $03, $0e, $1b, $36, $24, $27, $79, $0f, $0b, $00, $05, $07, $00
	wildbot $00, $03, $0e, $1b, $61, $24, $27, $5d, $05, $09, $00, $05, $06, $00
ENDC

Data_9f1b1:
	db $8b, $01, $13, $01, $38
	db $8c, $0c, $14, $01, $49

Data_9f1bb:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f214, NULL

Func_9f1c9:: ; 9f1c9
	loadwarps $02, Data_9f155
	loadpeople $01, Data_9f1bb
	playmusic SONG_CAVE
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_9f16b
	ld e, $02
	ld hl, Data_9f1b1
	scall Func_80ce7
	ld a, $44
	scall Func_80f43
	scall Func_8001c
	ret

Data_9f1fc:
	db $09, $0b, $0a, $0b, $01, $0c, $0b, $0d, $02, $0e, $04, $10, $05, $10, $0a, $10
	db $00, $11, $06, $12, $01, $14, $0c, $15

Func_9f214:
	add sp, $e6
	push de
	ld hl, sp+$04
	reg16swap de, hl
	ld hl, Data_9f1fc
	ld bc, $0018
	call MemCopy
	pop de
	ld a, e
	cp $02
	jp nz, .asm_9f2d9
	ld c, $00
.asm_9f22f:
	ld a, c
	cp $0c
	jp nc, .asm_9f266
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_9f262
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$03
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_9f262
	ld c, $ff
	jp .asm_9f266
.asm_9f262:
	inc c
	jp .asm_9f22f
.asm_9f266:
	ld a, c
	cp $ff
	jp nz, .asm_9f2d9
	loademote $01, $01, $0a
	ld a, $35
	call OverworldPlaySFX
	scall StartShakingScreen
	scall WaitEmote
	scall StopShakingScreen
	scall HideEmote
	ld c, $00
.asm_9f288:
	ld a, c
	cp $04
	jp nc, .asm_9f2d5
	push bc
	ld l, c
	ld h, $00
	scall Func_80488
	call WriteHLToSPPlus4
	pop bc
	pop hl
	push hl
	ld a, l
	or h
	jp nz, .asm_9f2a3
	jp .asm_9f2d1
.asm_9f2a3:
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $0015
	call CompareHLtoDE
	jp c, .asm_9f2ba
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp .asm_9f2bf
.asm_9f2ba:
	ld hl, $0014
	pop de
	push hl
.asm_9f2bf:
	push bc
	call GetHLAtSPPlus4
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld e, c
	ld d, $00
	scall Func_80e31
	pop bc
.asm_9f2d1:
	inc c
	jp .asm_9f288
.asm_9f2d5:
	xor a
	ld [wSliding], a
.asm_9f2d9:
	add sp, $1a
	ret
