
Data_a1bde:
	warpdef $0a, $0d, $01, $01, MAP_29_01, $0a, $04, $0b, $04, SFX_2E

Data_a1be9:
	warpdef $01, $01, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a1c15:
	warpdef $19, $07, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $19, $07, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $19, $07, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $19, $07, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a1c41:
	warpdef $19, $13, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $19, $13, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $19, $13, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $19, $13, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_a1c6d:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a1cb3:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a1cf9:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a1d3f:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a1d85:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a1dcb:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a1e11:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a1e57:: ; a1e57
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a1e6d
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a1e6d:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a1e7d
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a1e7d:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a1f52
	cp $1d
	jp z, .asm_a1f52
	cp $1c
	jp z, .asm_a1f52
	cp $1b
	jp z, .asm_a1f52
	cp $1a
	jp z, .asm_a1f52
	cp $19
	jp z, .asm_a1f47
	cp $18
	jp z, .asm_a1f47
	cp $17
	jp z, .asm_a1f47
	cp $16
	jp z, .asm_a1f47
	cp $15
	jp z, .asm_a1f47
	cp $14
	jp z, .asm_a1f3c
	cp $13
	jp z, .asm_a1f3c
	cp $12
	jp z, .asm_a1f3c
	cp $11
	jp z, .asm_a1f3c
	cp $10
	jp z, .asm_a1f3c
	cp $0f
	jp z, .asm_a1f31
	cp $0e
	jp z, .asm_a1f31
	cp $0d
	jp z, .asm_a1f31
	cp $0c
	jp z, .asm_a1f31
	cp $0b
	jp z, .asm_a1f31
	cp $0a
	jp z, .asm_a1f26
	cp $09
	jp z, .asm_a1f26
	cp $08
	jp z, .asm_a1f26
	cp $07
	jp z, .asm_a1f26
	cp $06
	jp z, .asm_a1f26
	cp $05
	jp z, .asm_a1f1b
	cp $04
	jp z, .asm_a1f1b
	cp $03
	jp z, .asm_a1f1b
	cp $02
	jp z, .asm_a1f1b
	cp $01
	jp nz, .asm_a1f5d
.asm_a1f1b:
	ld e, $05
	ld hl, Data_a1c6d
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f26:
	ld e, $05
	ld hl, Data_a1cb3
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f31:
	ld e, $05
	ld hl, Data_a1cf9
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f3c:
	ld e, $05
	ld hl, Data_a1d3f
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f47:
	ld e, $05
	ld hl, Data_a1d85
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f52:
	ld e, $05
	ld hl, Data_a1dcb
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f5d:
	ld e, $05
	ld hl, Data_a1e11
	scall LoadEncounters
.asm_a1f65:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a1fa5
	call Func_a1fe2
	ld hl, Func_a1fe2
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
	ld de, Data_a1be9
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a1fa5:
	ld e, $01
	ld hl, Data_a1bde
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a1fc6
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a1fcf
.asm_a1fc6:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a1fcf:
	ret

Data_a1fd0:
	db $19, $00, $01, $01, $01, $01
	db $19, $00, $01, $01, $19, $07
	db $19, $00, $01, $01, $19, $13

Func_a1fe2:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a1fd0
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
