
Data_9ef11:
	warpdef $05, $02, $01, $01, MAP_19_03, $08, $11, $08, $12, SFX_2E
	warpdef $04, $1a, $03, $01, MAP_19_22, $13, $16, $13, $17, SFX_2E

Data_9ef27:
	dtext_tree_pointer TreeBitstreamText_46db8
	dw -1

Data_9ef2b:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f017, NULL
	person_event $ff, $00, $04, $12, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9ef27

Data_9ef47:
IF DEF(SUN)
	wildbot $00, $03, $0b, $18, $5f, $1f, $22, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $18, $34, $1f, $22, $1a, $17, $05, $1e, $05, $09, $00
	wildbot $00, $03, $0b, $18, $60, $20, $23, $79, $05, $02, $03, $05, $08, $00
	wildbot $00, $03, $0b, $18, $35, $20, $23, $79, $17, $12, $11, $05, $07, $00
	wildbot $00, $03, $0b, $18, $26, $20, $23, $5d, $01, $01, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $18, $26, $1f, $22, $5b, $01, $00, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $18, $34, $1f, $22, $1a, $17, $05, $1e, $05, $09, $00
	wildbot $00, $03, $0b, $18, $27, $20, $23, $5d, $01, $03, $00, $05, $08, $00
	wildbot $00, $03, $0b, $18, $35, $20, $23, $79, $17, $12, $11, $05, $07, $00
	wildbot $00, $03, $0b, $18, $5f, $20, $23, $79, $05, $06, $00, $05, $06, $00
ENDC

Func_9ef8d:: ; 9ef8d
	loadwarps $02, Data_9ef11
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_9ef47
	loadpeople $02, Data_9ef2b
	playmusic SONG_CAVE
	checkevent $00e8
	or a
	jp nz, .asm_9efe3
	ld a, $01
	ld [wc7da], a
	scall Func_8001c
	writenpctext TreeBitstreamText_45b31
	setevent $00e8
	xor a
	ld [wc7da], a
	warp_player MAP_19_02, $05, $19
	pop bc
	jp .asm_9efe6
.asm_9efe3:
	scall Func_8001c
.asm_9efe6:
	ret

Data_9efe7:
	db $01, $09, $09, $09, $02, $0a, $03, $0a, $07, $0a, $08, $0a, $00, $0b, $04, $0b
	db $00, $0c, $08, $0c, $09, $0c, $02, $0d, $04, $0d, $05, $0d, $06, $0d, $00, $0e
	db $02, $0e, $09, $0e, $0a, $0e, $00, $0f, $05, $0f, $05, $10, $07, $10, $08, $10

Func_9f017:
	add sp, $ce
	push de
	ld hl, sp+$04
	reg16swap de, hl
	ld hl, Data_9efe7
	ld bc, $0030
	call MemCopy
	pop de
	ld a, e
	cp $02
	jp nz, .asm_9f0d8
	ld c, $00
.asm_9f032:
	ld a, c
	cp $18
	jp nc, .asm_9f069
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_9f065
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$03
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_9f065
	ld c, $ff
	jp .asm_9f069
.asm_9f065:
	inc c
	jp .asm_9f032
.asm_9f069:
	ld a, c
	cp $ff
	jp nz, .asm_9f0d8
	loademote $01, $01, $0a
	ld a, $35
	call OverworldPlaySFX
	scall StartShakingScreen
	scall WaitEmote
	scall StopShakingScreen
	scall HideEmote
	ld c, $00
.asm_9f08b:
	ld a, c
	cp $04
	jp nc, .asm_9f0d8
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
	jp nz, .asm_9f0a6
	jp .asm_9f0d4
.asm_9f0a6:
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $0015
	call CompareHLtoDE
	jp c, .asm_9f0bd
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp .asm_9f0c2
.asm_9f0bd:
	ld hl, $0014
	pop de
	push hl
.asm_9f0c2:
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
.asm_9f0d4:
	inc c
	jp .asm_9f08b
.asm_9f0d8:
	add sp, $32
	ret
