
Data_cd0b4:
	warpdef $12, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, SFX_2E

Data_cd0bf:
	warpdef $00, $1d, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $00, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $00, $1d, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $00, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $03, $0f, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $03, $0f, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $03, $0f, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $03, $0f, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E
	warpdef $1b, $21, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $1b, $21, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $1b, $21, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $1b, $21, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E

Data_cd143:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $89, $28, $2c, $62, $04, $10, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $76, $29, $2d, $3f, $07, $10, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $2b, $2f, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $2c, $30, $55, $0c, $0e, $0f, $13, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $86, $28, $2c, $77, $14, $0d, $1f, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $2d, $29, $2d, $7b, $06, $06, $06, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $2b, $2f, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $2c, $30, $7b, $04, $04, $04, $13, $0a, $00
ENDC

Data_cd189:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $2d, $31, $4a, $20, $12, $00, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $2e, $32, $55, $0c, $0e, $0f, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $2f, $33, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $2d, $31, $08, $1f, $1e, $16, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $2e, $32, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $2f, $33, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $2f, $33, $7b, $23, $12, $00, $12, $0a, $00
ENDC

Data_cd1cf:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $45, $30, $34, $55, $0c, $0e, $0f, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $32, $36, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $33, $37, $7b, $04, $04, $04, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $32, $36, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $33, $37, $55, $0c, $0e, $0f, $14, $0a, $00
ENDC

Data_cd215:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $34, $38, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $35, $39, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $36, $3a, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $2d, $36, $3a, $7b, $06, $06, $06, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $34, $38, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $35, $39, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $36, $3a, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $76, $36, $3a, $3f, $07, $10, $00, $07, $0a, $00
ENDC

Data_cd25b:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $8c, $37, $3b, $7b, $04, $04, $04, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
ENDC

Data_cd2a1:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8a, $3b, $3f, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $3b, $3f, $4a, $20, $12, $00, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $87, $3b, $3f, $07, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $3b, $3f, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_cd2e7:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $76, $3c, $40, $3f, $07, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8a, $3d, $41, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $3d, $41, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $3e, $42, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $3f, $43, $77, $0c, $0f, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $2d, $3c, $40, $7b, $06, $06, $06, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $87, $3d, $41, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $3d, $41, $08, $1f, $1e, $16, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $3e, $42, $7b, $04, $04, $04, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $3f, $43, $7b, $04, $04, $00, $07, $0a, $00
ENDC

Data_cd32d:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $42, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $42, $46, $7b, $04, $04, $00, $07, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $41, $46, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $42, $46, $77, $0c, $0f, $17, $07, $0a, $00
ENDC

Data_cd373:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $22, $43, $47, $77, $0c, $0f, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8c, $45, $49, $7b, $04, $04, $04, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $46, $4a, $08, $1f, $1e, $16, $14, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $1a, $43, $47, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $45, $45, $49, $55, $0c, $0e, $0f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $54, $46, $4a, $4a, $20, $12, $00, $14, $0a, $00
ENDC

Data_cd3b9:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $00, $00, $1f, $22, $06, $48, $4c, $34, $03, $03, $01, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $08, $49, $4d, $62, $01, $13, $00, $15, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $86, $46, $4a, $77, $14, $0d, $1f, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $87, $47, $4b, $07, $14, $0d, $1f, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $47, $48, $4c, $78, $07, $07, $07, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $08, $49, $4d, $62, $01, $13, $00, $14, $0a, $00
ENDC

Data_cd3ff:
IF DEF(SUN)
	wildbot $00, $00, $1f, $22, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $49, $4d, $08, $1f, $1e, $16, $15, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1f, $22, $3c, $49, $4d, $4a, $07, $09, $00, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $33, $49, $4d, $34, $07, $07, $14, $14, $0a, $00
	wildbot $00, $00, $1f, $22, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00
	wildbot $00, $00, $1f, $22, $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Data_cd437:
	person_event $ff, $00, $11, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $0c, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $0c, $02, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $0c, $20, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $1d, $1c, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $06, $1f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $00, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $1d, $02, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $00, $05, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $12, $02, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $12, $20, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $19, $1c, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $05, $1f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $19, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $1e, $02, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $1d, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $05, $05, $01, $01, $00, $04, $01, Func_cd6d0, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, Func_cd6d0, NULL

Func_cd533:: ; cd533
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_cd549
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_cd549:
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cd559
	ld e, $01
	ld hl, $0061
	scall EventFlagAction
.asm_cd559:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $06
	jp nc, .asm_cd571
	ld e, $05
	ld hl, Data_cd143
	scall LoadEncounters
	jp .asm_cd611
.asm_cd571:
	ld a, [wc7de]
	cp $0b
	jp nc, .asm_cd584
	ld e, $05
	ld hl, Data_cd189
	scall LoadEncounters
	jp .asm_cd611
.asm_cd584:
	ld a, [wc7de]
	cp $10
	jp nc, .asm_cd597
	ld e, $05
	ld hl, Data_cd1cf
	scall LoadEncounters
	jp .asm_cd611
.asm_cd597:
	ld a, [wc7de]
	cp $15
	jp nc, .asm_cd5aa
	ld e, $05
	ld hl, Data_cd215
	scall LoadEncounters
	jp .asm_cd611
.asm_cd5aa:
	ld a, [wc7de]
	cp $1a
	jp nc, .asm_cd5bd
	ld e, $05
	ld hl, Data_cd25b
	scall LoadEncounters
	jp .asm_cd611
.asm_cd5bd:
	ld a, [wc7de]
	cp $1f
	jp nc, .asm_cd5d0
	ld e, $05
	ld hl, Data_cd2a1
	scall LoadEncounters
	jp .asm_cd611
.asm_cd5d0:
	ld a, [wc7de]
	cp $24
	jp nc, .asm_cd5e3
	ld e, $05
	ld hl, Data_cd2e7
	scall LoadEncounters
	jp .asm_cd611
.asm_cd5e3:
	ld a, [wc7de]
	cp $29
	jp nc, .asm_cd5f6
	ld e, $05
	ld hl, Data_cd32d
	scall LoadEncounters
	jp .asm_cd611
.asm_cd5f6:
	ld a, [wc7de]
	cp $2e
	jp nc, .asm_cd609
	ld e, $05
	ld hl, Data_cd373
	scall LoadEncounters
	jp .asm_cd611
.asm_cd609:
	ld e, $09
	ld hl, Data_cd3b9
	scall LoadEncounters
.asm_cd611:
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, .asm_cd651
	call Func_cd696
	ld hl, Func_cd696
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
	ld de, Data_cd0bf
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_cd651:
	ld e, $01
	ld hl, Data_cd0b4
	scall LoadWarps
	ld e, $12
	ld hl, Data_cd437
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cd67a
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_cd683
.asm_cd67a:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_cd683:
	ret

Data_cd684:
	db $00, $26, $01, $01, $00, $1d
	db $00, $26, $01, $01, $03, $0f
	db $00, $26, $01, $01, $1b, $21

Func_cd696:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_cd684
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_cd6ac:
	db $11, $10
	db $0c, $10
	db $0c, $03
	db $0c, $21
	db $1d, $1d
	db $06, $20
	db $00, $10
	db $1d, $03
	db $00, $06
	db $12, $03
	db $12, $21
	db $19, $1d
	db $05, $20
	db $19, $10
	db $1e, $03
	db $1d, $10
	db $05, $06
	db $06, $10

Func_cd6d0:
	push af
	ld a, e
	or a
	jp nz, .asm_cd738
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_cd6e0
	jp .asm_cd738
.asm_cd6e0:
	ld hl, sp+$01
	ld a, [hl]
	add a, $09
	ld b, $12
	call DivideAbyB
	ld hl, sp+$01
	ld [hl], b
	ld hl, sp+$01
	ld a, [hl]
	add a, a
	ld hl, sp+$01
	ld [hl], a
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	scall Func_80f63
	ld hl, sp+$01
	ld e, [hl]
	ld d, $00
	ld hl, Data_cd6ac
	add hl, de
	ld a, [hl]
	ld hl, sp+$01
	ld e, [hl]
	ld d, $00
	ld hl, Data_cd6ac + 1
	add hl, de
	ld e, [hl]
	scall Func_80664
	ld a, $01
	scall Func_80653
	scall Func_80f54
	ld a, $01
	ld [wc7c4], a
.asm_cd738:
	pop bc
	ret
