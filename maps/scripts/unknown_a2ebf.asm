
Data_a2c46:
	warpdef $16, $13, $01, $01, MAP_29_01, $0a, $04, $0b, $04, SFX_2E

Data_a2c51:
	warpdef $01, $1c, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $01, $1c, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $01, $1c, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $01, $1c, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E

Data_a2c7d:
	warpdef $16, $0a, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $16, $0a, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $16, $0a, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $16, $0a, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E

Data_a2ca9:
	warpdef $25, $01, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $25, $01, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $25, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $25, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E

Data_a2cd5:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2d1b:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2d61:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $33, $21, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $33, $21, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2da7:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $33, $21, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1a, $1e, $30, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $33, $21, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a2ded:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $33, $21, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $33, $21, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2e33:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $33, $21, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $33, $21, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2e79:
	wildbot $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
IF DEF(STAR)
	wildbot $00, $00, $33, $21, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2ebf:: ; a2ebf
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2ed5
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2ed5:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2ee5
	setevent $005f
.asm_a2ee5:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a2fba
	cp $1d
	jp z, .asm_a2fba
	cp $1c
	jp z, .asm_a2fba
	cp $1b
	jp z, .asm_a2fba
	cp $1a
	jp z, .asm_a2fba
	cp $19
	jp z, .asm_a2faf
	cp $18
	jp z, .asm_a2faf
	cp $17
	jp z, .asm_a2faf
	cp $16
	jp z, .asm_a2faf
	cp $15
	jp z, .asm_a2faf
	cp $14
	jp z, .asm_a2fa4
	cp $13
	jp z, .asm_a2fa4
	cp $12
	jp z, .asm_a2fa4
	cp $11
	jp z, .asm_a2fa4
	cp $10
	jp z, .asm_a2fa4
	cp $0f
	jp z, .asm_a2f99
	cp $0e
	jp z, .asm_a2f99
	cp $0d
	jp z, .asm_a2f99
	cp $0c
	jp z, .asm_a2f99
	cp $0b
	jp z, .asm_a2f99
	cp $0a
	jp z, .asm_a2f8e
	cp $09
	jp z, .asm_a2f8e
	cp $08
	jp z, .asm_a2f8e
	cp $07
	jp z, .asm_a2f8e
	cp $06
	jp z, .asm_a2f8e
	cp $05
	jp z, .asm_a2f83
	cp $04
	jp z, .asm_a2f83
	cp $03
	jp z, .asm_a2f83
	cp $02
	jp z, .asm_a2f83
	cp $01
	jp nz, .asm_a2fc5
.asm_a2f83:
	loadwilds $05, Data_a2cd5
	jp .asm_a2fcd
.asm_a2f8e:
	loadwilds $05, Data_a2d1b
	jp .asm_a2fcd
.asm_a2f99:
	loadwilds $05, Data_a2d61
	jp .asm_a2fcd
.asm_a2fa4:
	loadwilds $05, Data_a2da7
	jp .asm_a2fcd
.asm_a2faf:
	loadwilds $05, Data_a2ded
	jp .asm_a2fcd
.asm_a2fba:
	loadwilds $05, Data_a2e33
	jp .asm_a2fcd
.asm_a2fc5:
IF DEF(SUN)
	ld e, $05
ELIF DEF(STAR)
	ld e, $0a
ENDC
	ld hl, Data_a2e79
	scall LoadEncounters
.asm_a2fcd:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a300d
	call Func_a304a
	ld hl, Func_a304a
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
	ld de, Data_a2c51
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a300d:
	loadwarps $01, Data_a2c46
	playmusic $08
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a302e
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a3037
.asm_a302e:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a3037:
	ret

Data_a3038:
	db $00, $0e, $01, $01, $01, $1c
	db $00, $0e, $01, $01, $16, $0a
	db $00, $0e, $01, $01, $25, $01

Func_a304a:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a3038
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
