
Data_d2055: ; d2055
	warpdef $04, $0e, $01, $01, MAP_29_01, $06, $04, $07, $04, SFX_2E

Data_d2060: ; d2060
	warpdef $01, $07, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $07, $01, $01, MAP_29_11, $0a, $10, $0a, $11, SFX_2E
	warpdef $01, $07, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $01, $07, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $0d, $07, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $0d, $07, $01, $01, MAP_29_11, $0a, $10, $0a, $11, SFX_2E
	warpdef $0d, $07, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $0d, $07, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $18, $07, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $18, $07, $01, $01, MAP_29_11, $0a, $10, $0a, $11, SFX_2E
	warpdef $18, $07, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $18, $07, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E

Data_d20e4: ; d20e4
IF DEF(SUN)
	wildbot $00, $05, $1a, $16, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $05, $1a, $16, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d212a: ; d212a
IF DEF(SUN)
	wildbot $00, $05, $1a, $16, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $05, $1a, $16, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00
	wildbot $00, $05, $1a, $16, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d2170: ; d2170
IF DEF(SUN)
	wildbot $00, $05, $1a, $16, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $05, $1a, $16, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d21b6: ; d21b6
IF DEF(SUN)
	wildbot $00, $05, $1a, $16, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00
	wildbot $00, $05, $1a, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $05, $1a, $16, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $05, $1a, $16, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00
	wildbot $00, $05, $1a, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d21fc:: ; d21fc (34:61fc)
	ld l, $0
	push hl
	ld c, $8
	ld e, $7
	ld a, $c
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $d
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $12
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $15
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $5
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $5
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $5
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $16
	ld a, $a
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $5
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $2
	ld e, $e
	ld a, $d
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $d
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $b
	ld a, $10
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $8
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $11
	ld e, $5
	ld a, $16
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_d22d5
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_d22d5: ; d22d5 (34:62d5)
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d22e5
	setevent $5d
.asm_d22e5: ; d22e5 (34:62e5)
	ld a, $3
	scall Func_80d01
	ld a, [wc7de]
	cp $f
	jp z, .asm_d234e
	cp $e
	jp z, .asm_d234e
	cp $d
	jp z, .asm_d234e
	cp $c
	jp z, .asm_d234e
	cp $b
	jp z, .asm_d234e
	cp $a
	jp z, .asm_d2343
	cp $9
	jp z, .asm_d2343
	cp $8
	jp z, .asm_d2343
	cp $7
	jp z, .asm_d2343
	cp $6
	jp z, .asm_d2343
	cp $5
	jp z, .asm_d2338
	cp $4
	jp z, .asm_d2338
	cp $3
	jp z, .asm_d2338
	cp $2
	jp z, .asm_d2338
	cp $1
	jp nz, .asm_d2359
.asm_d2338: ; d2338 (34:6338)
	loadwilds $5, Data_d20e4
	jp .asm_d2361

.asm_d2343: ; d2343 (34:6343)
	loadwilds $5, Data_d212a
	jp .asm_d2361

.asm_d234e: ; d234e (34:634e)
	loadwilds $5, Data_d2170
	jp .asm_d2361

.asm_d2359: ; d2359 (34:6359)
	loadwilds $5, Data_d21b6
.asm_d2361: ; d2361 (34:6361)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, .asm_d23a1
	set_frame_script Func_d23de
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
	ld de, Data_d2060
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d23a1: ; d23a1 (34:63a1)
	loadwarps $1, Data_d2055
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d23c2
	writetext TreeBitstreamText_47e17
	jp .asm_d23cb

.asm_d23c2: ; d23c2 (34:63c2)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_d23cb: ; d23cb (34:63cb)
	ret

Data_d23cc:
	db $18, $00, $01, $01, $01, $07
	db $18, $00, $01, $01, $0d, $07
	db $18, $00, $01, $01, $18, $07

Func_d23de: ; d23de (34:63de)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d23cc
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
