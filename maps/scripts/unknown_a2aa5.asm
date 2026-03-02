
Data_a282c:
	warpdef $21, $0a, $01, $01, MAP_29_01, $0a, $04, $0b, $04, SFX_2E

Data_a2837:
	warpdef $01, $04, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $01, $04, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $01, $04, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $01, $04, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a2863:
	warpdef $08, $10, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $08, $10, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $08, $10, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $08, $10, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a288f:
	warpdef $21, $10, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $21, $10, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $21, $10, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $21, $10, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a28bb:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2901:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2947:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a298d:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a29d3:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2a19:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2a5f:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2aa5:: ; a2aa5
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2abb
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2abb
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2acb
	setevent EVENT_05F
.asm_a2acb
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a2ba0
	cp $1d
	jp z, .asm_a2ba0
	cp $1c
	jp z, .asm_a2ba0
	cp $1b
	jp z, .asm_a2ba0
	cp $1a
	jp z, .asm_a2ba0
	cp $19
	jp z, .asm_a2b95
	cp $18
	jp z, .asm_a2b95
	cp $17
	jp z, .asm_a2b95
	cp $16
	jp z, .asm_a2b95
	cp $15
	jp z, .asm_a2b95
	cp $14
	jp z, .asm_a2b8a
	cp $13
	jp z, .asm_a2b8a
	cp $12
	jp z, .asm_a2b8a
	cp $11
	jp z, .asm_a2b8a
	cp $10
	jp z, .asm_a2b8a
	cp $0f
	jp z, .asm_a2b7f
	cp $0e
	jp z, .asm_a2b7f
	cp $0d
	jp z, .asm_a2b7f
	cp $0c
	jp z, .asm_a2b7f
	cp $0b
	jp z, .asm_a2b7f
	cp $0a
	jp z, .asm_a2b74
	cp $09
	jp z, .asm_a2b74
	cp $08
	jp z, .asm_a2b74
	cp $07
	jp z, .asm_a2b74
	cp $06
	jp z, .asm_a2b74
	cp $05
	jp z, .asm_a2b69
	cp $04
	jp z, .asm_a2b69
	cp $03
	jp z, .asm_a2b69
	cp $02
	jp z, .asm_a2b69
	cp $01
	jp nz, .asm_a2bab
.asm_a2b69
	loadwilds $05, Data_a28bb
	jp .asm_a2bb3
.asm_a2b74
	loadwilds $05, Data_a2901
	jp .asm_a2bb3
.asm_a2b7f
	loadwilds $05, Data_a2947
	jp .asm_a2bb3
.asm_a2b8a
	loadwilds $05, Data_a298d
	jp .asm_a2bb3
.asm_a2b95
	loadwilds $05, Data_a29d3
	jp .asm_a2bb3
.asm_a2ba0
	loadwilds $05, Data_a2a19
	jp .asm_a2bb3
.asm_a2bab
	loadwilds $05, Data_a2a5f
.asm_a2bb3
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a2bf3
	set_frame_script Func_a2c30
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
	ld de, Data_a2837
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a2bf3
	loadwarps $01, Data_a282c
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2c14
	writetext TreeBitstreamText_47e17
	jp .asm_a2c1d
.asm_a2c14
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a2c1d
	ret

Data_a2c1e:
	db $21, $00, $01, $01, $01, $04
	db $21, $00, $01, $01, $08, $10
	db $21, $00, $01, $01, $21, $10

Func_a2c30:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a2c1e
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
