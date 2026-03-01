
Data_cd73a:
	warpdef $0f, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, SFX_2E

Data_cd745:
	warpdef $01, $01, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $01, $01, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $20, $01, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $20, $01, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $20, $01, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $20, $01, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $20, $1d, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $20, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $20, $1d, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $20, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E

Data_cd7c9:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $89, $28, $2c, $62, $04, $10, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $76, $29, $2d, $3f, $07, $10, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $2b, $2f, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $2c, $30, $55, $0c, $0e, $0f, $13, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $86, $28, $2c, $77, $14, $0d, $1f, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $2d, $29, $2d, $7b, $06, $06, $06, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $2b, $2f, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $2c, $30, $7b, $04, $04, $04, $13, $0a, $00
ENDC

Data_cd80f:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $2d, $31, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $2e, $32, $55, $0c, $0e, $0f, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $2f, $33, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $2d, $31, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $2e, $32, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $2f, $33, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ENDC

Data_cd855:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $45, $30, $34, $55, $0c, $0e, $0f, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $32, $36, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $33, $37, $7b, $04, $04, $04, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $32, $36, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $33, $37, $55, $0c, $0e, $0f, $14, $0a, $00
ENDC

Data_cd89b:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $34, $38, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $35, $39, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $36, $3a, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $2d, $36, $3a, $7b, $06, $06, $06, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $34, $38, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $35, $39, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $36, $3a, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $76, $36, $3a, $3f, $07, $10, $00, $07, $0a, $00
ENDC

Data_cd8e1:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $8c, $37, $3b, $7b, $04, $04, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
ENDC

Data_cd927:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8a, $3b, $3f, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $3b, $3f, $4a, $20, $12, $00, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $87, $3b, $3f, $07, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $3b, $3f, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_cd96d:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $76, $3c, $40, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8a, $3d, $41, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $3d, $41, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $3e, $42, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $3f, $43, $77, $0c, $0f, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $2d, $3c, $40, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $87, $3d, $41, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $3d, $41, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $3e, $42, $7b, $04, $04, $04, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $3f, $43, $7b, $04, $04, $00, $07, $0a, $00
ENDC

Data_cd9b3:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $42, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $42, $46, $7b, $04, $04, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $41, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $42, $46, $77, $0c, $0f, $17, $07, $0a, $00
ENDC

Data_cd9f9:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $22, $43, $47, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8c, $45, $49, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $46, $4a, $08, $1f, $1e, $16, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $1a, $43, $47, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $45, $45, $49, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $54, $46, $4a, $4a, $20, $12, $00, $14, $0a, $00
ENDC

Data_cda3f:
IF DEF(SUN)
	wildbot $00, $00, $22, $1f, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $22, $1f, $06, $48, $4c, $34, $03, $03, $01, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $08, $49, $4d, $62, $01, $13, $00, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $49, $4d, $08, $1f, $1e, $16, $15, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $22, $1f, $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $86, $46, $4a, $77, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $87, $47, $4b, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $47, $48, $4c, $78, $07, $07, $07, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $08, $49, $4d, $62, $01, $13, $00, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $3c, $49, $4d, $4a, $07, $09, $00, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $33, $49, $4d, $34, $07, $07, $14, $14, $0a, $00
	wildbot $00, $00, $22, $1f, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00
	wildbot $00, $00, $22, $1f, $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Func_cdabd:: ; cdabd
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_cdad3
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_cdad3:
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cdae3
	ld e, $01
	ld hl, $0061
	scall EventFlagAction
.asm_cdae3:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $06
	jp nc, .asm_cdafb
	ld e, $05
	ld hl, Data_cd7c9
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdafb:
	ld a, [wc7de]
	cp $0b
	jp nc, .asm_cdb0e
	ld e, $05
	ld hl, Data_cd80f
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb0e:
	ld a, [wc7de]
	cp $10
	jp nc, .asm_cdb21
	ld e, $05
	ld hl, Data_cd855
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb21:
	ld a, [wc7de]
	cp $15
	jp nc, .asm_cdb34
	ld e, $05
	ld hl, Data_cd89b
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb34:
	ld a, [wc7de]
	cp $1a
	jp nc, .asm_cdb47
	ld e, $05
	ld hl, Data_cd8e1
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb47:
	ld a, [wc7de]
	cp $1f
	jp nc, .asm_cdb5a
	ld e, $05
	ld hl, Data_cd927
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb5a:
	ld a, [wc7de]
	cp $24
	jp nc, .asm_cdb6d
	ld e, $05
	ld hl, Data_cd96d
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb6d:
	ld a, [wc7de]
	cp $29
	jp nc, .asm_cdb80
	ld e, $05
	ld hl, Data_cd9b3
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb80:
	ld a, [wc7de]
	cp $2e
	jp nc, .asm_cdb93
	ld e, $05
	ld hl, Data_cd9f9
	scall LoadEncounters
	jp .asm_cdb9b
.asm_cdb93:
	ld e, $09
	ld hl, Data_cda3f
	scall LoadEncounters
.asm_cdb9b:
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, .asm_cdbdb
	call Func_cdc1d
	ld hl, Func_cdc1d
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
	ld de, Data_cd745
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_cdbdb:
	ld e, $01
	ld hl, Data_cd73a
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, $41
	scall Func_80f43
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cdc01
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_cdc0a
.asm_cdc01:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_cdc0a:
	ret

Data_cdc0b:
	db $26, $01, $01, $01, $01, $01
	db $26, $01, $01, $01, $20, $01
	db $26, $01, $01, $01, $20, $1d

Func_cdc1d:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_cdc0b
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
