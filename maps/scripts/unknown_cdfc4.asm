
Data_cdc33:
	warpdef $13, $10, $01, $01, MAP_29_01, $0e, $04, $0f, $04, SFX_2E

Data_cdc3e:
	warpdef $01, $10, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $14, $1f, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $14, $1f, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $14, $1f, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $14, $1f, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $26, $10, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $26, $10, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $26, $10, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $26, $10, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E

Data_cdcc2:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $89, $28, $2c, $62, $04, $10, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $76, $29, $2d, $3f, $07, $10, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $28, $23, $54, $2b, $2f, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $28, $23, $45, $2c, $30, $55, $0c, $0e, $0f, $13, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $86, $28, $2c, $77, $14, $0d, $1f, $12, $0a, $00
	wildbot $00, $00, $28, $23, $2d, $29, $2d, $7b, $06, $06, $06, $06, $0a, $00
	wildbot $00, $00, $28, $23, $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $28, $23, $13, $2b, $2f, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $2c, $30, $7b, $04, $04, $04, $13, $0a, $00
ENDC

Data_cdd08:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $28, $23, $54, $2d, $31, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $28, $23, $45, $2e, $32, $55, $0c, $0e, $0f, $13, $0a, $00
	wildbot $00, $00, $28, $23, $22, $2f, $33, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $28, $23, $13, $2d, $31, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $2e, $32, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $2f, $33, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ENDC

Data_cdd4e:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $45, $30, $34, $55, $0c, $08, $00, $12, $0a, $00
	wildbot $00, $00, $28, $23, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $32, $36, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $33, $37, $7b, $04, $04, $04, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00
	wildbot $00, $00, $28, $23, $22, $32, $36, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $28, $23, $45, $33, $37, $55, $0c, $0e, $0f, $14, $0a, $00
ENDC

Data_cdd94:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $34, $38, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $35, $39, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $28, $23, $13, $36, $3a, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $28, $23, $2d, $36, $3a, $7b, $06, $06, $06, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $22, $34, $38, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $28, $23, $45, $35, $39, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $54, $36, $3a, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $76, $36, $3a, $3f, $07, $10, $00, $07, $0a, $00
ENDC

Data_cddda:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $8c, $37, $3b, $7b, $04, $04, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $28, $23, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $28, $23, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00
	wildbot $00, $00, $28, $23, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
ENDC

Data_cde20:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $28, $23, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8a, $3b, $3f, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $28, $23, $54, $3b, $3f, $4a, $20, $12, $00, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $28, $23, $87, $3b, $3f, $07, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $13, $3b, $3f, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_cde66:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $76, $3c, $40, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8a, $3d, $41, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $28, $23, $54, $3d, $41, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $45, $3e, $42, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $22, $3f, $43, $77, $0c, $0f, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $2d, $3c, $40, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $28, $23, $87, $3d, $41, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $13, $3d, $41, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $3e, $42, $7b, $04, $04, $04, $14, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $3f, $43, $7b, $04, $04, $00, $07, $0a, $00
ENDC

Data_cdeac:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $42, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $42, $46, $7b, $04, $04, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $41, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $22, $42, $46, $77, $0c, $0f, $17, $07, $0a, $00
ENDC

Data_cdef2:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $22, $43, $47, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8c, $45, $49, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $28, $23, $13, $46, $4a, $08, $1f, $1e, $16, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $1a, $43, $47, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $28, $23, $45, $45, $49, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $54, $46, $4a, $4a, $20, $12, $00, $14, $0a, $00
ENDC

Data_cdf38:
IF DEF(SUN)
	wildbot $00, $00, $28, $23, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $28, $23, $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $28, $23, $06, $48, $4c, $34, $03, $03, $01, $14, $0a, $00
	wildbot $00, $00, $28, $23, $08, $49, $4d, $62, $01, $13, $00, $15, $0a, $00
	wildbot $00, $00, $28, $23, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00
	wildbot $00, $00, $28, $23, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	wildbot $00, $00, $28, $23, $13, $49, $4d, $08, $1f, $1e, $16, $15, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $28, $23, $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $86, $46, $4a, $77, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $28, $23, $87, $47, $4b, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $28, $23, $47, $48, $4c, $78, $07, $07, $07, $15, $0a, $00
	wildbot $00, $00, $28, $23, $08, $49, $4d, $62, $01, $13, $00, $14, $0a, $00
	wildbot $00, $00, $28, $23, $3c, $49, $4d, $4a, $07, $09, $00, $15, $0a, $00
	wildbot $00, $00, $28, $23, $33, $49, $4d, $34, $07, $07, $14, $14, $0a, $00
	wildbot $00, $00, $28, $23, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00
	wildbot $00, $00, $28, $23, $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_cdfb6:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_ce60e, NULL

Func_cdfc4:: ; cdfc4
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_cdfda
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_cdfda:
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cdfea
	setevent $0061
.asm_cdfea:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $2d
	jp z, .asm_ce12b
	cp $2c
	jp z, .asm_ce12b
	cp $2b
	jp z, .asm_ce12b
	cp $2a
	jp z, .asm_ce12b
	cp $29
	jp z, .asm_ce12b
	cp $28
	jp z, .asm_ce120
	cp $27
	jp z, .asm_ce120
	cp $26
	jp z, .asm_ce120
	cp $25
	jp z, .asm_ce120
	cp $24
	jp z, .asm_ce120
	cp $23
	jp z, .asm_ce115
	cp $22
	jp z, .asm_ce115
	cp $21
	jp z, .asm_ce115
	cp $20
	jp z, .asm_ce115
	cp $1f
	jp z, .asm_ce115
	cp $1e
	jp z, .asm_ce10a
	cp $1d
	jp z, .asm_ce10a
	cp $1c
	jp z, .asm_ce10a
	cp $1b
	jp z, .asm_ce10a
	cp $1a
	jp z, .asm_ce10a
	cp $19
	jp z, .asm_ce0ff
	cp $18
	jp z, .asm_ce0ff
	cp $17
	jp z, .asm_ce0ff
	cp $16
	jp z, .asm_ce0ff
	cp $15
	jp z, .asm_ce0ff
	cp $14
	jp z, .asm_ce0f4
	cp $13
	jp z, .asm_ce0f4
	cp $12
	jp z, .asm_ce0f4
	cp $11
	jp z, .asm_ce0f4
	cp $10
	jp z, .asm_ce0f4
	cp $0f
	jp z, .asm_ce0e9
	cp $0e
	jp z, .asm_ce0e9
	cp $0d
	jp z, .asm_ce0e9
	cp $0c
	jp z, .asm_ce0e9
	cp $0b
	jp z, .asm_ce0e9
	cp $0a
	jp z, .asm_ce0de
	cp $09
	jp z, .asm_ce0de
	cp $08
	jp z, .asm_ce0de
	cp $07
	jp z, .asm_ce0de
	cp $06
	jp z, .asm_ce0de
	cp $05
	jp z, .asm_ce0d3
	cp $04
	jp z, .asm_ce0d3
	cp $03
	jp z, .asm_ce0d3
	cp $02
	jp z, .asm_ce0d3
	cp $01
	jp nz, .asm_ce136
.asm_ce0d3:
	loadwilds $05, Data_cdcc2
	jp .asm_ce13e
.asm_ce0de:
	loadwilds $05, Data_cdd08
	jp .asm_ce13e
.asm_ce0e9:
	loadwilds $05, Data_cdd4e
	jp .asm_ce13e
.asm_ce0f4:
	loadwilds $05, Data_cdd94
	jp .asm_ce13e
.asm_ce0ff:
	loadwilds $05, Data_cddda
	jp .asm_ce13e
.asm_ce10a:
	loadwilds $05, Data_cde20
	jp .asm_ce13e
.asm_ce115:
	loadwilds $05, Data_cde66
	jp .asm_ce13e
.asm_ce120:
	loadwilds $05, Data_cdeac
	jp .asm_ce13e
.asm_ce12b:
	loadwilds $05, Data_cdef2
	jp .asm_ce13e
.asm_ce136:
	loadwilds $09, Data_cdf38
.asm_ce13e:
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, .asm_ce17e
	call Func_ce1e3
	ld hl, Func_ce1e3
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
	ld de, Data_cdc3e
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_ce17e:
	loadwarps $01, Data_cdc33
	ld a, [wc7a3]
	cp $03
	jp z, .asm_ce198
	cp $02
	jp z, .asm_ce198
	cp $01
	jp nz, .asm_ce19b
.asm_ce198:
	jp .asm_ce1a0
.asm_ce19b:
	ld a, $01
	ld [wc7a3], a
.asm_ce1a0:
	ld a, [wc7a3]
	call Func_ce409
	loadpeople $01, Data_cdfb6
	playmusic $08
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, .asm_ce1c7
	writetext TreeBitstreamText_47e17
	jp .asm_ce1d0
.asm_ce1c7:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_ce1d0:
	ret

Data_ce1d1:
	db $27, $20, $01, $01, $01, $10, $27, $20, $01, $01, $14, $1f, $27, $20, $01, $01
	db $26, $10

Func_ce1e3:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_ce1d1
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_ce1f9:
	db $24, $11, $02, $02, $0a, $06, $24, $11, $02, $02, $10, $0b, $24, $11, $02, $02
	db $1c, $0b, $24, $11, $02, $02, $04, $10, $24, $11, $02, $02, $16, $15, $24, $11
	db $02, $02, $0a, $1a, $24, $11, $02, $02, $1c, $1a, $24, $0f, $02, $02, $13, $03
	db $24, $0f, $02, $02, $1f, $08, $24, $0f, $02, $02, $13, $0d, $24, $0f, $02, $02
	db $0d, $12, $24, $0f, $02, $02, $13, $12, $24, $0f, $02, $02, $19, $12, $24, $0f
	db $02, $02, $1f, $17, $24, $0f, $02, $02, $13, $1c

Data_ce253:
	db $24, $11, $02, $02, $16, $06, $24, $11, $02, $02, $1c, $06, $24, $11, $02, $02
	db $16, $0b, $24, $11, $02, $02, $10, $10, $24, $11, $02, $02, $22, $10, $24, $11
	db $02, $02, $0a, $15, $24, $11, $02, $02, $1c, $15, $24, $11, $02, $02, $10, $1a
	db $24, $0f, $02, $02, $0d, $08, $24, $0f, $02, $02, $07, $0d, $24, $0f, $02, $02
	db $0d, $0d, $24, $0f, $02, $02, $19, $0d, $24, $0f, $02, $02, $07, $12, $24, $0f
	db $02, $02, $1f, $12, $24, $0f, $02, $02, $13, $17

Data_ce2ad:
	db $24, $11, $02, $02, $10, $06, $24, $11, $02, $02, $0a, $0b, $24, $11, $02, $02
	db $0a, $10, $24, $11, $02, $02, $16, $10, $24, $11, $02, $02, $1c, $10, $24, $11
	db $02, $02, $10, $15, $24, $11, $02, $02, $16, $1a, $24, $0f, $02, $02, $07, $08
	db $24, $0f, $02, $02, $13, $08, $24, $0f, $02, $02, $19, $08, $24, $0f, $02, $02
	db $1f, $0d, $24, $0f, $02, $02, $07, $17, $24, $0f, $02, $02, $0d, $17, $24, $0f
	db $02, $02, $19, $17

Data_ce301:
	db $00, $00, $02, $02, $0a, $06, $00, $00, $02, $02, $10, $0b, $00, $00, $02, $02
	db $1c, $0b, $00, $00, $02, $02, $04, $10, $00, $00, $02, $02, $16, $15, $00, $00
	db $02, $02, $0a, $1a, $00, $00, $02, $02, $1c, $1a, $24, $12, $02, $02, $13, $03
	db $24, $12, $02, $02, $1f, $08, $24, $12, $02, $02, $13, $0d, $24, $12, $02, $02
	db $0d, $12, $24, $12, $02, $02, $13, $12, $24, $12, $02, $02, $19, $12, $24, $12
	db $02, $02, $1f, $17, $24, $12, $02, $02, $13, $1c

Data_ce35b:
	db $00, $00, $02, $02, $16, $06, $00, $00, $02, $02, $1c, $06, $00, $00, $02, $02
	db $16, $0b, $00, $00, $02, $02, $10, $10, $00, $00, $02, $02, $22, $10, $00, $00
	db $02, $02, $0a, $15, $00, $00, $02, $02, $1c, $15, $00, $00, $02, $02, $10, $1a
	db $24, $12, $02, $02, $0d, $08, $24, $12, $02, $02, $07, $0d, $24, $12, $02, $02
	db $0d, $0d, $24, $12, $02, $02, $19, $0d, $24, $12, $02, $02, $07, $12, $24, $12
	db $02, $02, $1f, $12, $24, $12, $02, $02, $13, $17

Data_ce3b5:
	db $00, $00, $02, $02, $10, $06, $00, $00, $02, $02, $0a, $0b, $00, $00, $02, $02
	db $0a, $10, $00, $00, $02, $02, $16, $10, $00, $00, $02, $02, $1c, $10, $00, $00
	db $02, $02, $10, $15, $00, $00, $02, $02, $16, $1a, $24, $12, $02, $02, $07, $08
	db $24, $12, $02, $02, $13, $08, $24, $12, $02, $02, $19, $08, $24, $12, $02, $02
	db $1f, $0d, $24, $12, $02, $02, $07, $17, $24, $12, $02, $02, $0d, $17, $24, $12
	db $02, $02, $19, $17

Func_ce409:
	ld hl, -$210
	add hl, sp
	ld sp, hl
	push af
	ld hl, $01b8
	add hl, sp
	reg16swap de, hl
	ld hl, Data_ce1f9
	ld bc, $005a
	call MemCopy
	ld hl, $015e
	add hl, sp
	reg16swap de, hl
	ld hl, Data_ce253
	ld bc, $005a
	call MemCopy
	ld hl, $010a
	add hl, sp
	reg16swap de, hl
	ld hl, Data_ce2ad
	ld bc, $0054
	call MemCopy
	ld hl, $00b0
	add hl, sp
	reg16swap de, hl
	ld hl, Data_ce301
	ld bc, $005a
	call MemCopy
	ld hl, sp+$56
	reg16swap de, hl
	ld hl, Data_ce35b
	ld bc, $005a
	call MemCopy
	ld hl, sp+$02
	reg16swap de, hl
	ld hl, Data_ce3b5
	ld bc, $0054
	call MemCopy
	pop af
	cp $03
	jp z, .asm_ce547
	cp $02
	jp z, .asm_ce4e3
	cp $01
	jp nz, .asm_ce5a8
	xor a
.asm_ce482:
	cp $0f
	jp nc, .asm_ce4a1
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $01b8
	add hl, sp
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce482
.asm_ce4a1:
	xor a
.asm_ce4a2:
	cp $0f
	jp nc, .asm_ce4bf
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$56
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce4a2
.asm_ce4bf:
	xor a
.asm_ce4c0:
	cp $0e
	jp nc, .asm_ce4dd
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce4c0
.asm_ce4dd:
	scall Func_80f02
	jp .asm_ce5a8
.asm_ce4e3:
	xor a
.asm_ce4e4:
	cp $0f
	jp nc, .asm_ce503
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $015e
	add hl, sp
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce4e4
.asm_ce503:
	xor a
.asm_ce504:
	cp $0f
	jp nc, .asm_ce523
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $00b0
	add hl, sp
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce504
.asm_ce523:
	xor a
.asm_ce524:
	cp $0e
	jp nc, .asm_ce541
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce524
.asm_ce541:
	scall Func_80f02
	jp .asm_ce5a8
.asm_ce547:
	xor a
.asm_ce548:
	cp $0e
	jp nc, .asm_ce567
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $010a
	add hl, sp
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce548
.asm_ce567:
	xor a
.asm_ce568:
	cp $0f
	jp nc, .asm_ce587
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $00b0
	add hl, sp
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce568
.asm_ce587:
	xor a
.asm_ce588:
	cp $0f
	jp nc, .asm_ce5a5
	push af
	ld l, a
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$56
	add hl, de
	scall Func_80d9b
	pop af
	inc a
	jp .asm_ce588
.asm_ce5a5:
	scall Func_80f02
.asm_ce5a8:
	ld hl, $0210
	add hl, sp
	ld sp, hl
	ret

Data_ce5ae:
	db $07, $06, $0d, $06, $13, $06, $1a, $06, $20, $06, $07, $0b, $0d, $0b, $14, $0b
	db $1a, $0b, $07, $10, $19, $10, $07, $15, $0d, $15, $13, $15, $19, $15, $1f, $15
	db $07, $1a, $0d, $1a, $13, $1a, $19, $1a, $1f, $1a

Data_ce5d8:
	db $0e, $06, $14, $06, $19, $06, $08, $0b, $13, $0b, $1f, $0b, $08, $10, $0d, $10
	db $1f, $10, $0e, $15, $14, $15, $1a, $15, $20, $1a

Data_ce5f2:
	db $08, $06, $1f, $06, $0e, $0b, $19, $0b, $20, $0b, $0e, $10, $1a, $10, $20, $10
	db $08, $15, $20, $15, $08, $1a, $0e, $1a, $14, $1a, $1a, $1a

Func_ce60e:
	add sp, $a0
	push de
	ld hl, sp+$38
	reg16swap de, hl
	ld hl, Data_ce5ae
	ld bc, $002a
	call MemCopy
	ld hl, sp+$1e
	reg16swap de, hl
	ld hl, Data_ce5d8
	ld bc, $001a
	call MemCopy
	ld hl, sp+$02
	reg16swap de, hl
	ld hl, Data_ce5f2
	ld bc, $001c
	call MemCopy
	pop de
	ld a, e
	cp $02
	jp nz, .asm_ce738
	ld c, $00
.asm_ce647:
	ld a, c
	cp $15
	jp nc, .asm_ce67e
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$36
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_ce67a
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$37
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_ce67a
	ld c, $ff
	jp .asm_ce67e
.asm_ce67a:
	inc c
	jp .asm_ce647
.asm_ce67e:
	ld a, c
	cp $ff
	jp nz, .asm_ce696
	playsfx $28
	ld a, $01
	ld [wc7a3], a
	ld a, $01
	call Func_ce409
	jp .asm_ce738
.asm_ce696:
	ld c, $00
.asm_ce698:
	ld a, c
	cp $0d
	jp nc, .asm_ce6cf
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1c
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_ce6cb
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1d
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_ce6cb
	ld c, $ff
	jp .asm_ce6cf
.asm_ce6cb:
	inc c
	jp .asm_ce698
.asm_ce6cf:
	ld a, c
	cp $ff
	jp nz, .asm_ce6e7
	playsfx $28
	ld a, $02
	ld [wc7a3], a
	ld a, $02
	call Func_ce409
	jp .asm_ce738
.asm_ce6e7:
	ld c, $00
.asm_ce6e9:
	ld a, c
	cp $0e
	jp nc, .asm_ce720
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$00
	add hl, de
	ld a, [wMapX]
	add a, $05
	cp [hl]
	jp nz, .asm_ce71c
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$01
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_ce71c
	ld c, $ff
	jp .asm_ce720
.asm_ce71c:
	inc c
	jp .asm_ce6e9
.asm_ce720:
	ld a, c
	cp $ff
	jp nz, .asm_ce738
	playsfx $28
	ld a, $03
	ld [wc7a3], a
	ld a, $03
	call Func_ce409
	jp .asm_ce738
.asm_ce738:
	add sp, $60
	ret
