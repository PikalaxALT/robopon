
Data_d23f4: ; d23f4
	warpdef $0a, $0d, $01, $01, MAP_29_01, $06, $04, $07, $04, SFX_2E

Data_d23ff: ; d23ff
	warpdef $01, $13, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $1b, $08, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $1b, $08, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $1b, $08, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $1b, $08, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $1e, $07, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $1e, $07, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $1e, $07, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $1e, $07, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E

Data_d2483: ; d2483
IF DEF(SUN)
	wildbot $00, $06, $20, $19, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $06, $20, $19, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $20, $19, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $20, $19, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d24c9: ; d24c9
IF DEF(SUN)
	wildbot $00, $06, $20, $19, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $20, $19, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $20, $19, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00
	wildbot $00, $06, $20, $19, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d250f: ; d250f
IF DEF(SUN)
	wildbot $00, $06, $20, $19, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $20, $19, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $20, $19, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d2555: ; d2555
IF DEF(SUN)
	wildbot $00, $06, $20, $19, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00
	wildbot $00, $06, $20, $19, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $20, $19, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $06, $20, $19, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $06, $20, $19, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00
	wildbot $00, $06, $20, $19, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d259b:: ; d259b (34:659b)
	ld l, $0
	push hl
	ld c, $b
	ld e, $b
	ld a, $9
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $16
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $17
	ld a, $15
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $14
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $e
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $c
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $f
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $15
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $18
	ld a, $14
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $19
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $12
	ld e, $6
	ld a, $1c
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_d2674
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_d2674: ; d2674 (34:6674)
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d2684
	setevent $5d
.asm_d2684: ; d2684 (34:6684)
	ld a, $3
	scall Func_80d01
	ld a, [wc7de]
	cp $f
	jp z, .asm_d26ed
	cp $e
	jp z, .asm_d26ed
	cp $d
	jp z, .asm_d26ed
	cp $c
	jp z, .asm_d26ed
	cp $b
	jp z, .asm_d26ed
	cp $a
	jp z, .asm_d26e2
	cp $9
	jp z, .asm_d26e2
	cp $8
	jp z, .asm_d26e2
	cp $7
	jp z, .asm_d26e2
	cp $6
	jp z, .asm_d26e2
	cp $5
	jp z, .asm_d26d7
	cp $4
	jp z, .asm_d26d7
	cp $3
	jp z, .asm_d26d7
	cp $2
	jp z, .asm_d26d7
	cp $1
	jp nz, .asm_d26f8
.asm_d26d7: ; d26d7 (34:66d7)
	loadwilds $5, Data_d2483
	jp .asm_d2700

.asm_d26e2: ; d26e2 (34:66e2)
	loadwilds $5, Data_d24c9
	jp .asm_d2700

.asm_d26ed: ; d26ed (34:66ed)
	loadwilds $5, Data_d250f
	jp .asm_d2700

.asm_d26f8: ; d26f8 (34:66f8)
	loadwilds $5, Data_d2555
.asm_d2700: ; d2700 (34:6700)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, .asm_d2740
	set_frame_script Func_d277d
	ld a, $4
	scall Random
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d23ff
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d2740: ; d2740 (34:6740)
	loadwarps $1, Data_d23f4
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d2761
	writetext TreeBitstreamText_47e17
	jp .asm_d276a

.asm_d2761: ; d2761 (34:6761)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_d276a: ; d276a (34:676a)
	ret

Data_d276b:
	db $1e, $00, $01, $01, $01, $13
	db $1e, $00, $01, $01, $1b, $08
	db $1e, $00, $01, $01, $1e, $07

Func_d277d: ; d277d (34:677d)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d276b
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
