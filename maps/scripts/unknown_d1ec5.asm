
Data_d1d1e: ; d1d1e
	warpdef $0a, $10, $01, $01, MAP_29_01, $06, $04, $07, $04, SFX_2E

Data_d1d29: ; d1d29
	warpdef $01, $08, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $08, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $01, $08, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $01, $08, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $07, $0b, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $07, $0b, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $07, $0b, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $07, $0b, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E
	warpdef $11, $0b, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $11, $0b, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $11, $0b, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $11, $0b, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E

Data_d1dad: ; d1dad
IF DEF(SUN)
	wildbot $00, $06, $1a, $10, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $1a, $10, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d1df3: ; d1df3
IF DEF(SUN)
	wildbot $00, $06, $1a, $10, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $1a, $10, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00
	wildbot $00, $06, $1a, $10, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d1e39: ; d1e39
IF DEF(SUN)
	wildbot $00, $06, $1a, $10, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $1a, $10, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d1e7f: ; d1e7f
IF DEF(SUN)
	wildbot $00, $06, $1a, $10, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00
	wildbot $00, $06, $1a, $10, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $06, $1a, $10, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $06, $1a, $10, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00
	wildbot $00, $06, $1a, $10, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d1ec5:: ; d1ec5 (34:5ec5)
	ld l, $0
	push hl
	ld c, $e
	ld e, $e
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $c
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $c
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_d1f36
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_d1f36: ; d1f36 (34:5f36)
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d1f46
	setevent EVENT_05D
.asm_d1f46: ; d1f46 (34:5f46)
	ld a, $3
	scall Func_80d01
	ld a, [wc7de]
	cp $f
	jp z, .asm_d1faf
	cp $e
	jp z, .asm_d1faf
	cp $d
	jp z, .asm_d1faf
	cp $c
	jp z, .asm_d1faf
	cp $b
	jp z, .asm_d1faf
	cp $a
	jp z, .asm_d1fa4
	cp $9
	jp z, .asm_d1fa4
	cp $8
	jp z, .asm_d1fa4
	cp $7
	jp z, .asm_d1fa4
	cp $6
	jp z, .asm_d1fa4
	cp $5
	jp z, .asm_d1f99
	cp $4
	jp z, .asm_d1f99
	cp $3
	jp z, .asm_d1f99
	cp $2
	jp z, .asm_d1f99
	cp $1
	jp nz, .asm_d1fba
.asm_d1f99: ; d1f99 (34:5f99)
	loadwilds $5, Data_d1dad
	jp .asm_d1fc2

.asm_d1fa4: ; d1fa4 (34:5fa4)
	loadwilds $5, Data_d1df3
	jp .asm_d1fc2

.asm_d1faf: ; d1faf (34:5faf)
	loadwilds $5, Data_d1e39
	jp .asm_d1fc2

.asm_d1fba: ; d1fba (34:5fba)
	loadwilds $5, Data_d1e7f
.asm_d1fc2: ; d1fc2 (34:5fc2)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, .asm_d2002
	set_frame_script Func_d203f
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
	ld de, Data_d1d29
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d2002: ; d2002 (34:6002)
	loadwarps $1, Data_d1d1e
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d2023
	writetext TreeBitstreamText_47e17
	jp .asm_d202c

.asm_d2023: ; d2023 (34:6023)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_d202c: ; d202c (34:602c)
	ret

Data_d202d:
	db $18, $00, $01, $01, $01, $08
	db $18, $00, $01, $01, $07, $0b
	db $18, $00, $01, $01, $11, $0b

Func_d203f: ; d203f (34:603f)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d202d
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
