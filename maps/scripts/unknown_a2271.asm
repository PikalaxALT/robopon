
Data_a1ff8:
	warpdef $10, $10, $01, $01, MAP_29_01, $0a, $04, $0b, $04, SFX_2E

Data_a2003:
	warpdef $01, $13, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $01, $13, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a202f:
	warpdef $07, $01, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $07, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $07, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $07, $01, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a205b:
	warpdef $22, $0a, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $22, $0a, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $22, $0a, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $22, $0a, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a2087:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a20cd:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $2c, $16, $1a, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $16, $1a, $78, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $16, $1a, $78, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $16, $1a, $78, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $06, $16, $1a, $2f, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2113:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $24, $20, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $24, $20, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2159:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $24, $20, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $24, $20, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a219f:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $24, $20, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $24, $20, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a21e5:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $24, $20, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $24, $20, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a222b:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2271:: ; a2271
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2287
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2287:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2297
	setevent $005f
.asm_a2297:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a236c
	cp $1d
	jp z, .asm_a236c
	cp $1c
	jp z, .asm_a236c
	cp $1b
	jp z, .asm_a236c
	cp $1a
	jp z, .asm_a236c
	cp $19
	jp z, .asm_a2361
	cp $18
	jp z, .asm_a2361
	cp $17
	jp z, .asm_a2361
	cp $16
	jp z, .asm_a2361
	cp $15
	jp z, .asm_a2361
	cp $14
	jp z, .asm_a2356
	cp $13
	jp z, .asm_a2356
	cp $12
	jp z, .asm_a2356
	cp $11
	jp z, .asm_a2356
	cp $10
	jp z, .asm_a2356
	cp $0f
	jp z, .asm_a234b
	cp $0e
	jp z, .asm_a234b
	cp $0d
	jp z, .asm_a234b
	cp $0c
	jp z, .asm_a234b
	cp $0b
	jp z, .asm_a234b
	cp $0a
	jp z, .asm_a2340
	cp $09
	jp z, .asm_a2340
	cp $08
	jp z, .asm_a2340
	cp $07
	jp z, .asm_a2340
	cp $06
	jp z, .asm_a2340
	cp $05
	jp z, .asm_a2335
	cp $04
	jp z, .asm_a2335
	cp $03
	jp z, .asm_a2335
	cp $02
	jp z, .asm_a2335
	cp $01
	jp nz, .asm_a2377
.asm_a2335:
	loadwilds $05, Data_a2087
	jp .asm_a237f
.asm_a2340:
	loadwilds $05, Data_a20cd
	jp .asm_a237f
.asm_a234b:
	loadwilds $05, Data_a2113
	jp .asm_a237f
.asm_a2356:
	loadwilds $05, Data_a2159
	jp .asm_a237f
.asm_a2361:
	loadwilds $05, Data_a219f
	jp .asm_a237f
.asm_a236c:
	loadwilds $05, Data_a21e5
	jp .asm_a237f
.asm_a2377:
	loadwilds $05, Data_a222b
.asm_a237f:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a23bf
	call Func_a23fc
	ld hl, Func_a23fc
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
	ld h, $00
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
	ld h, $00
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
	ld de, Data_a2003
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a23bf:
	ld e, $01
	ld hl, $5ff8
	scall LoadWarps
	playmusic $08
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a23e0
	writetext TreeBitstreamText_47e17
	jp .asm_a23e9
.asm_a23e0:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a23e9:
	ret

Data_a23ea:
	db $22, $1f, $01, $01, $01, $13
	db $22, $1f, $01, $01, $07, $01
	db $22, $1f, $01, $01, $22, $0a

Func_a23fc:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a23ea
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
