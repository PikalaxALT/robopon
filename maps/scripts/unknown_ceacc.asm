
Data_ce73b:
	warpdef $0e, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, SFX_2E

Data_ce746:
	warpdef $08, $04, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $08, $04, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $08, $04, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $08, $04, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $14, $1d, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $14, $1d, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $14, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $14, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $1e, $09, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $1e, $09, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $1e, $09, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $1e, $09, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E

Data_ce7ca:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $89, $28, $2c, $62, $04, $10, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $76, $29, $2d, $3f, $07, $10, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $06, $06, $14, $14, $54, $2b, $2f, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $06, $06, $14, $14, $45, $2c, $30, $55, $0c, $0e, $0f, $13, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $86, $28, $2c, $77, $14, $0d, $1f, $12, $0a, $00
	wildbot $06, $06, $14, $14, $2d, $29, $2d, $7b, $06, $06, $06, $06, $0a, $00
	wildbot $06, $06, $14, $14, $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $06, $06, $14, $14, $13, $2b, $2f, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $2c, $30, $7b, $04, $04, $04, $13, $0a, $00
ENDC

Data_ce810:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $06, $06, $14, $14, $54, $2d, $31, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $06, $06, $14, $14, $45, $2e, $32, $55, $0c, $0e, $0f, $13, $0a, $00
	wildbot $06, $06, $14, $14, $22, $2f, $33, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $06, $06, $14, $14, $13, $2d, $31, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $2e, $32, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $2f, $33, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ENDC

Data_ce856:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $45, $30, $34, $55, $0c, $08, $00, $12, $0a, $00
	wildbot $06, $06, $14, $14, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $32, $36, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $33, $37, $7b, $04, $04, $04, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00
	wildbot $06, $06, $14, $14, $22, $32, $36, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $06, $06, $14, $14, $45, $33, $37, $55, $0c, $0e, $0f, $14, $0a, $00
ENDC

Data_ce89c:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $34, $38, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $35, $39, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $06, $06, $14, $14, $13, $36, $3a, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $06, $06, $14, $14, $2d, $36, $3a, $7b, $06, $06, $06, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $22, $34, $38, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $06, $06, $14, $14, $45, $35, $39, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $54, $36, $3a, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $76, $36, $3a, $3f, $07, $10, $00, $07, $0a, $00
ENDC

Data_ce8e2:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $8c, $37, $3b, $7b, $04, $04, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $06, $06, $14, $14, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $06, $06, $14, $14, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00
	wildbot $06, $06, $14, $14, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
ENDC

Data_ce928:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $06, $06, $14, $14, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8a, $3b, $3f, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $06, $06, $14, $14, $54, $3b, $3f, $4a, $20, $12, $00, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $06, $06, $14, $14, $87, $3b, $3f, $07, $14, $0d, $1f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $13, $3b, $3f, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_ce96e:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $76, $3c, $40, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8a, $3d, $41, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $06, $06, $14, $14, $54, $3d, $41, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $45, $3e, $42, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $22, $3f, $43, $77, $0c, $0f, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $2d, $3c, $40, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $06, $06, $14, $14, $87, $3d, $41, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $13, $3d, $41, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $3e, $42, $7b, $04, $04, $04, $14, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $3f, $43, $7b, $04, $04, $00, $07, $0a, $00
ENDC

Data_ce9b4:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $42, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $42, $46, $7b, $04, $04, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $41, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $22, $42, $46, $77, $0c, $0f, $17, $07, $0a, $00
ENDC

Data_ce9fa:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $22, $43, $47, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8c, $45, $49, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $06, $06, $14, $14, $13, $46, $4a, $08, $1f, $1e, $16, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $1a, $43, $47, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $06, $06, $14, $14, $45, $45, $49, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $54, $46, $4a, $4a, $20, $12, $00, $14, $0a, $00
ENDC

Data_cea40:
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $06, $06, $14, $14, $06, $48, $4c, $34, $03, $03, $01, $14, $0a, $00
	wildbot $06, $06, $14, $14, $08, $49, $4d, $62, $01, $13, $00, $15, $0a, $00
	wildbot $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00
	wildbot $06, $06, $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	wildbot $06, $06, $14, $14, $13, $49, $4d, $7b, $1f, $1e, $16, $15, $0a, $00
ELIF DEF(STAR)
	wildbot $06, $06, $14, $14, $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $86, $46, $4a, $77, $14, $0d, $1f, $15, $0a, $00
	wildbot $06, $06, $14, $14, $87, $47, $4b, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $06, $06, $14, $14, $47, $48, $4c, $78, $07, $07, $07, $15, $0a, $00
	wildbot $06, $06, $14, $14, $08, $49, $4d, $62, $01, $13, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09, $00, $15, $0a, $00
	wildbot $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $14, $0a, $00
	wildbot $06, $06, $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00
	wildbot $06, $06, $14, $14, $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_ceabe:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_ced03, NULL

Func_ceacc:: ; ceacc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_ceae2
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_ceae2:
	ld a, [wc7de]
	cp $32
	jp nz, .asm_ceaf2
	ld e, $01
	ld hl, $0061
	scall EventFlagAction
.asm_ceaf2:
	ld a, $02
	scall Func_80d01
	ld a, [wc7de]
	cp $2d
	jp z, .asm_cec33
	cp $2c
	jp z, .asm_cec33
	cp $2b
	jp z, .asm_cec33
	cp $2a
	jp z, .asm_cec33
	cp $29
	jp z, .asm_cec33
	cp $28
	jp z, .asm_cec28
	cp $27
	jp z, .asm_cec28
	cp $26
	jp z, .asm_cec28
	cp $25
	jp z, .asm_cec28
	cp $24
	jp z, .asm_cec28
	cp $23
	jp z, .asm_cec1d
	cp $22
	jp z, .asm_cec1d
	cp $21
	jp z, .asm_cec1d
	cp $20
	jp z, .asm_cec1d
	cp $1f
	jp z, .asm_cec1d
	cp $1e
	jp z, .asm_cec12
	cp $1d
	jp z, .asm_cec12
	cp $1c
	jp z, .asm_cec12
	cp $1b
	jp z, .asm_cec12
	cp $1a
	jp z, .asm_cec12
	cp $19
	jp z, .asm_cec07
	cp $18
	jp z, .asm_cec07
	cp $17
	jp z, .asm_cec07
	cp $16
	jp z, .asm_cec07
	cp $15
	jp z, .asm_cec07
	cp $14
	jp z, .asm_cebfc
	cp $13
	jp z, .asm_cebfc
	cp $12
	jp z, .asm_cebfc
	cp $11
	jp z, .asm_cebfc
	cp $10
	jp z, .asm_cebfc
	cp $0f
	jp z, .asm_cebf1
	cp $0e
	jp z, .asm_cebf1
	cp $0d
	jp z, .asm_cebf1
	cp $0c
	jp z, .asm_cebf1
	cp $0b
	jp z, .asm_cebf1
	cp $0a
	jp z, .asm_cebe6
	cp $09
	jp z, .asm_cebe6
	cp $08
	jp z, .asm_cebe6
	cp $07
	jp z, .asm_cebe6
	cp $06
	jp z, .asm_cebe6
	cp $05
	jp z, .asm_cebdb
	cp $04
	jp z, .asm_cebdb
	cp $03
	jp z, .asm_cebdb
	cp $02
	jp z, .asm_cebdb
	cp $01
	jp nz, .asm_cec3e
.asm_cebdb:
	ld e, $05
	ld hl, Data_ce7ca
	scall LoadEncounters
	jp .asm_cec46
.asm_cebe6:
	ld e, $05
	ld hl, Data_ce810
	scall LoadEncounters
	jp .asm_cec46
.asm_cebf1:
	ld e, $05
	ld hl, Data_ce856
	scall LoadEncounters
	jp .asm_cec46
.asm_cebfc:
	ld e, $05
	ld hl, Data_ce89c
	scall LoadEncounters
	jp .asm_cec46
.asm_cec07:
	ld e, $05
	ld hl, Data_ce8e2
	scall LoadEncounters
	jp .asm_cec46
.asm_cec12:
	ld e, $05
	ld hl, Data_ce928
	scall LoadEncounters
	jp .asm_cec46
.asm_cec1d:
	ld e, $05
	ld hl, Data_ce96e
	scall LoadEncounters
	jp .asm_cec46
.asm_cec28:
	ld e, $05
	ld hl, Data_ce9b4
	scall LoadEncounters
	jp .asm_cec46
.asm_cec33:
	ld e, $05
	ld hl, Data_ce9fa
	scall LoadEncounters
	jp .asm_cec46
.asm_cec3e:
	ld e, $09
	ld hl, Data_cea40
	scall LoadEncounters
.asm_cec46:
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, .asm_cec86
	call Func_ceccb
	ld hl, Func_ceccb
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
	ld de, Data_ce746
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_cec86:
	ld e, $01
	ld hl, Data_ce73b
	scall LoadWarps
	ld e, $01
	ld hl, Data_ceabe
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cecaf
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_cecb8
.asm_cecaf:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_cecb8:
	ret

Data_cecb9:
	db $1e, $1e, $01
	db $01, $08, $04, $1e, $1e, $01, $01, $14, $1d, $1e, $1e, $01, $01, $1e, $09

Func_ceccb:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_cecb9
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_cece1:
	db $0a, $05, $0d, $07, $0a, $0b, $1e, $0b, $13, $0c, $0c
	db $0e, $12, $0e, $1a, $10, $09, $11, $13, $11, $02, $12, $10, $13, $18, $13, $03
	db $14, $14, $16, $0e, $17, $14, $17

Func_ced03:
	add sp, $dc
	push de
	ld hl, sp+$04
	reg16swap de, hl
	ld hl, Data_cece1
	ld bc, $0022
	call MemCopy
	pop de
	ld a, e
	cp $02
	jp nz, .asm_cedc7
	ld c, $00
.asm_ced1e:
	ld a, c
	cp $11
	jp nc, .asm_ced58
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$02
	add hl, de
	ld a, [hl]
	dec a
	ld l, a
	ld a, [wMapX]
	add a, $05
	cp l
	jp nz, .asm_ced54
	ld l, c
	ld h, $00
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$03
	add hl, de
	ld a, [wMapY]
	add a, $04
	cp [hl]
	jp nz, .asm_ced54
	ld c, $ff
	jp .asm_ced58
.asm_ced54:
	inc c
	jp .asm_ced1e
.asm_ced58:
	ld a, c
	cp $ff
	jp nz, .asm_cedc7
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld a, $35
	call OverworldPlaySFX
	scall StartShakingScreen
	scall WaitEmote
	scall StopShakingScreen
	scall HideEmote
	ld c, $00
.asm_ced7a:
	ld a, c
	cp $04
	jp nc, .asm_cedc7
	push bc
	ld l, c
	ld h, $00
	scall Func_80488
	call WriteHLToSPPlus4
	pop bc
	pop hl
	push hl
	ld a, l
	or h
	jp nz, .asm_ced95
	jp .asm_cedc3
.asm_ced95:
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $0015
	call CompareHLtoDE
	jp c, .asm_cedac
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp .asm_cedb1
.asm_cedac:
	ld hl, $0014
	pop de
	push hl
.asm_cedb1:
	push bc
	call GetHLAtSPPlus4
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld e, c
	ld d, $00
	scall Func_80e31
	pop bc
.asm_cedc3:
	inc c
	jp .asm_ced7a
.asm_cedc7:
	add sp, $24
	ret
