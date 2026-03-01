
Data_d1958: ; d1958
	warpdef $0a, $10, $01, $01, MAP_29_01, $06, $04, $07, $04, $2e

Data_d1963: ; d1963
	warpdef $01, $17, $01, $01, MAP_29_11, $0a, $10, $0a, $11, $2e
	warpdef $01, $17, $01, $01, MAP_29_12, $04, $0e, $05, $0e, $2e
	warpdef $01, $17, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, $2e
	warpdef $01, $17, $01, $01, MAP_29_14, $10, $0d, $10, $0e, $2e
	warpdef $04, $13, $01, $01, MAP_29_11, $0a, $10, $0a, $11, $2e
	warpdef $04, $13, $01, $01, MAP_29_12, $04, $0e, $05, $0e, $2e
	warpdef $04, $13, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, $2e
	warpdef $04, $13, $01, $01, MAP_29_14, $10, $0d, $10, $0e, $2e
	warpdef $13, $17, $01, $01, MAP_29_11, $0a, $10, $0a, $11, $2e
	warpdef $13, $17, $01, $01, MAP_29_12, $04, $0e, $05, $0e, $2e
	warpdef $13, $17, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, $2e
	warpdef $13, $17, $01, $01, MAP_29_14, $10, $0d, $10, $0e, $2e

Data_d19e7: ; d19e7
IF DEF(SUN)
	wildbot $00, $03, $18, $15, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $03, $18, $15, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $18, $15, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $15, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d1a2d: ; d1a2d
IF DEF(SUN)
	wildbot $00, $03, $18, $15, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $18, $15, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $15, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00
	wildbot $00, $03, $18, $15, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d1a73: ; d1a73
IF DEF(SUN)
	wildbot $00, $03, $18, $15, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $15, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $18, $15, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d1ab9: ; d1ab9
IF DEF(SUN)
	wildbot $00, $03, $18, $15, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00
	wildbot $00, $03, $18, $15, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $15, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $03, $18, $15, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $03, $18, $15, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00
	wildbot $00, $03, $18, $15, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d1aff:: ; d1aff (34:5aff)
	ld l, $0
	push hl
	ld c, $6
	ld e, $5
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $14
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $12
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $c
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $15
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $c
	ld a, $14
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_d1bff
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_d1bff: ; d1bff (34:5bff)
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d1c0f
	setevent $5d
.asm_d1c0f: ; d1c0f (34:5c0f)
	ld a, $3
	scall Func_80d01
	ld a, [wc7de]
	cp $f
	jp z, .asm_d1c78
	cp $e
	jp z, .asm_d1c78
	cp $d
	jp z, .asm_d1c78
	cp $c
	jp z, .asm_d1c78
	cp $b
	jp z, .asm_d1c78
	cp $a
	jp z, .asm_d1c6d
	cp $9
	jp z, .asm_d1c6d
	cp $8
	jp z, .asm_d1c6d
	cp $7
	jp z, .asm_d1c6d
	cp $6
	jp z, .asm_d1c6d
	cp $5
	jp z, .asm_d1c62
	cp $4
	jp z, .asm_d1c62
	cp $3
	jp z, .asm_d1c62
	cp $2
	jp z, .asm_d1c62
	cp $1
	jp nz, .asm_d1c83
.asm_d1c62: ; d1c62 (34:5c62)
	loadwilds $5, Data_d19e7
	jp .asm_d1c8b

.asm_d1c6d: ; d1c6d (34:5c6d)
	loadwilds $5, Data_d1a2d
	jp .asm_d1c8b

.asm_d1c78: ; d1c78 (34:5c78)
	loadwilds $5, Data_d1a73
	jp .asm_d1c8b

.asm_d1c83: ; d1c83 (34:5c83)
	loadwilds $5, Data_d1ab9
.asm_d1c8b: ; d1c8b (34:5c8b)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, .asm_d1ccb
	call Func_d1d08
	ld hl, Func_d1d08
	scall Func_80f11
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
	ld de, Data_d1963
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d1ccb: ; d1ccb (34:5ccb)
	loadwarps $1, Data_d1958
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d1cec
	writetext TreeBitstreamText_47e17
	jp .asm_d1cf5

.asm_d1cec: ; d1cec (34:5cec)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_d1cf5: ; d1cf5 (34:5cf5)
	ret

Data_d1cf6:
	db $17, $01, $01, $01, $01, $17
	db $17, $01, $01, $01, $04, $13
	db $17, $01, $01, $01, $13, $17

Func_d1d08: ; d1d08 (34:5d08)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d1cf6
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
