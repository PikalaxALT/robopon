
Data_9f395:
	warpdef $08, $27, $03, $01, MAP_19_10, $06, $02, $06, $03, SFX_2E
	warpdef $0c, $02, $01, $01, MAP_19_40, $05, $0c, $05, $0b, SFX_2E

Data_9f3ab:
	db $1c, $09, $14

Data_9f3ae:
	db $1c, $09, $14, $00, $00

Data_9f3b3:
	db $86, $04, $0e, $02, $0b
	db $87, $10, $0e, $02, $4c

Data_9f3bd:
	db $ea, $03, $ff, $ff

Data_9f3c1:
	person_event $ff, $00, $03, $04, $03, $03, $00, $04, $00, Func_9f574, NULL
	person_event $00, $04, $08, $14, $01, $01, $03, $04, $00, Func_806dd_27, Data_9f3ab
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f4ac, NULL
	person_event $ff, $00, $08, $1f, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9f3bd

Data_9f3f9:
IF DEF(SUN)
	wildbot $01, $03, $11, $25, $27, $23, $26, $5d, $01, $03, $00, $05, $0a, $00
	wildbot $01, $03, $11, $25, $61, $23, $26, $5d, $05, $09, $00, $05, $09, $00
	wildbot $01, $03, $11, $25, $36, $25, $28, $79, $0f, $0b, $00, $05, $08, $00
	wildbot $01, $03, $11, $25, $28, $25, $28, $5d, $0e, $0f, $00, $05, $07, $00
	wildbot $01, $03, $11, $25, $37, $27, $2a, $5d, $24, $12, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $01, $03, $11, $25, $60, $23, $26, $79, $05, $02, $03, $05, $0a, $00
	wildbot $01, $03, $11, $25, $28, $23, $26, $5d, $0e, $0f, $00, $05, $09, $00
	wildbot $01, $03, $11, $25, $36, $25, $28, $79, $0f, $0b, $00, $05, $08, $00
	wildbot $01, $03, $11, $25, $61, $25, $28, $5d, $05, $09, $00, $05, $07, $00
	wildbot $01, $03, $11, $25, $37, $27, $2a, $5d, $24, $12, $00, $05, $06, $00
ENDC

Func_9f43f:: ; 9f43f
	loadwarps $02, Data_9f395
	ld e, $01
	ld hl, Data_9f3ae
	scall Func_80ce7
	ld e, $02
	ld hl, Data_9f3b3
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_9f3f9
	loadpeople $04, Data_9f3c1
	playmusic $08
	ld a, $44
	scall Func_80f43
	scall Func_8001c
	ret

Data_9f47a:
	db $0f, $09, $11, $09, $04, $0c, $07, $0c, $0a, $0c, $0e, $0c, $10, $0c, $04, $0d
	db $10, $0d, $03, $0e, $05, $0e, $0f, $0e, $11, $0e, $04, $0f, $10, $0f, $09, $13
	db $08, $14, $0a, $14, $09, $15, $10, $17, $03, $18, $0d, $19, $06, $1a, $03, $1b
	db $10, $1c

Func_9f4ac:
	add sp, $cc
	push de
	ld hl, sp+$04
	reg16swap de, hl
	ld hl, Data_9f47a
	ld bc, $0032
	call MemCopy
	pop de
	ld a, e
	cp $02
	jp nz, .asm_9f571
	ld c, $00
.asm_9f4c7:
	ld a, c
	cp $19
	jp nc, .asm_9f4fe
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_9f4fa
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$03
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_9f4fa
	ld c, $ff
	jp .asm_9f4fe
.asm_9f4fa:
	inc c
	jp .asm_9f4c7
.asm_9f4fe:
	ld a, c
	cp $ff
	jp nz, .asm_9f571
	loademote $01, $01, $0a
	ld a, $35
	call OverworldPlaySFX
	scall StartShakingScreen
	scall WaitEmote
	scall StopShakingScreen
	scall HideEmote
	ld c, $00
.asm_9f520:
	ld a, c
	cp $04
	jp nc, .asm_9f56d
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
	jp nz, .asm_9f53b
	jp .asm_9f569
.asm_9f53b:
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $0015
	call CompareHLtoDE
	jp c, .asm_9f552
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp .asm_9f557
.asm_9f552:
	ld hl, $0014
	pop de
	push hl
.asm_9f557:
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
.asm_9f569:
	inc c
	jp .asm_9f520
.asm_9f56d:
	xor a
	ld [wSliding], a
.asm_9f571:
	add sp, $34
	ret

Func_9f574:
	ld a, e
	or a
	jp nz, .asm_9f59f
	heal
	playmusic SONG_NONE
	playmusic $16
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic $08
.asm_9f59f:
	ret
