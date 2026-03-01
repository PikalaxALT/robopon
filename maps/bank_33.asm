INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 33", ROMX
	script_library 33

Data_cd0b4:
	warpdef $12, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, $2e

Data_cd0bf:
	warpdef $00, $1d, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $00, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $00, $1d, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $00, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $03, $0f, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $03, $0f, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $03, $0f, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $03, $0f, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $1b, $21, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $1b, $21, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $1b, $21, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $1b, $21, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e

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

Data_cd73a:
	warpdef $0f, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, $2e

Data_cd745:
	warpdef $01, $01, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $01, $01, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $01, $01, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $01, $01, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $20, $01, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $20, $01, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $20, $01, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $20, $01, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $20, $1d, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $20, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $20, $1d, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $20, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e

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

Data_cdc33:
	warpdef $13, $10, $01, $01, MAP_29_01, $0e, $04, $0f, $04, $2e

Data_cdc3e:
	warpdef $01, $10, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $01, $10, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $01, $10, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $01, $10, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $14, $1f, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $14, $1f, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $14, $1f, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $14, $1f, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $26, $10, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $26, $10, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $26, $10, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $26, $10, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e

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
	ld e, $01
	ld hl, $0061
	scall EventFlagAction
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
	ld e, $05
	ld hl, Data_cdcc2
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce0de:
	ld e, $05
	ld hl, Data_cdd08
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce0e9:
	ld e, $05
	ld hl, Data_cdd4e
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce0f4:
	ld e, $05
	ld hl, Data_cdd94
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce0ff:
	ld e, $05
	ld hl, Data_cddda
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce10a:
	ld e, $05
	ld hl, Data_cde20
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce115:
	ld e, $05
	ld hl, Data_cde66
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce120:
	ld e, $05
	ld hl, Data_cdeac
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce12b:
	ld e, $05
	ld hl, Data_cdef2
	scall LoadEncounters
	jp .asm_ce13e
.asm_ce136:
	ld e, $09
	ld hl, Data_cdf38
	scall LoadEncounters
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
	ld e, $01
	ld hl, Data_cdc33
	scall LoadWarps
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
	ld e, $01
	ld hl, Data_cdfb6
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, .asm_ce1c7
	ld hl, $00f8
	scall PrintTextStandard
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
	ld a, $28
	scall PlaySFX
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
	ld a, $28
	scall PlaySFX
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
	ld a, $28
	scall PlaySFX
	ld a, $03
	ld [wc7a3], a
	ld a, $03
	call Func_ce409
	jp .asm_ce738
.asm_ce738:
	add sp, $60
	ret

Data_ce73b:
	warpdef $0e, $0f, $01, $01, MAP_29_01, $0e, $04, $0f, $04, $2e

Data_ce746:
	warpdef $08, $04, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $08, $04, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $08, $04, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $08, $04, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $14, $1d, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $14, $1d, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $14, $1d, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $14, $1d, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e
	warpdef $1e, $09, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $1e, $09, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $1e, $09, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $1e, $09, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, $2e

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

Data_cedca: ; cedca
	warpdef $0e, $0e, $01, $01, MAP_29_01, $0e, $04, $0f, $04, $2e

Data_cedd5:
	warpdef $01, $14, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $01, $14, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $01, $14, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $01, $14, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $07, $01, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $07, $01, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $07, $01, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $07, $01, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e
	warpdef $14, $1e, $01, $01, MAP_29_30, $12, $0f, $12, $10, $2e
	warpdef $14, $1e, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, $2e
	warpdef $14, $1e, $01, $01, MAP_29_32, $13, $10, $12, $10, $2e
	warpdef $14, $1e, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, $2e

Data_cee59: ; cee59
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

Data_cee9f: ; cee9f
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

Data_ceee5: ; ceee5
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

Data_cef2b: ; cef2b
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

Data_cef71: ; cef71
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

Data_cefb7: ; cefb7
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

Data_ceffd: ; ceffd
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

Data_cf043: ; cf043
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

Data_cf089: ; cf089
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

Data_cf0cf: ; cf0cf
IF DEF(SUN)
	wildbot $06, $06, $14, $14, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00
	wildbot $06, $06, $14, $14, $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00
	wildbot $06, $06, $14, $14, $06, $48, $4c, $34, $03, $03, $01, $14, $0a, $00
	wildbot $06, $06, $14, $14, $08, $49, $4d, $62, $01, $13, $00, $15, $0a, $00
	wildbot $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	wildbot $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00
	wildbot $06, $06, $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	wildbot $06, $06, $14, $14, $13, $49, $4d, $08, $1f, $1e, $16, $15, $0a, $00
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

Func_cf14d:: ; cf14d (33:714d)
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_cf163
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_cf163: ; cf163 (33:7163)
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cf173
	ld e, $1
	ld hl, $61
	scall EventFlagAction
.asm_cf173: ; cf173 (33:7173)
	ld a, $2
	scall Func_80d01
	ld a, [wc7de]
	cp $2d
	jp z, .asm_cf2b4
	cp $2c
	jp z, .asm_cf2b4
	cp $2b
	jp z, .asm_cf2b4
	cp $2a
	jp z, .asm_cf2b4
	cp $29
	jp z, .asm_cf2b4
	cp $28
	jp z, .asm_cf2a9
	cp $27
	jp z, .asm_cf2a9
	cp $26
	jp z, .asm_cf2a9
	cp $25
	jp z, .asm_cf2a9
	cp $24
	jp z, .asm_cf2a9
	cp $23
	jp z, .asm_cf29e
	cp $22
	jp z, .asm_cf29e
	cp $21
	jp z, .asm_cf29e
	cp $20
	jp z, .asm_cf29e
	cp $1f
	jp z, .asm_cf29e
	cp $1e
	jp z, .asm_cf293
	cp $1d
	jp z, .asm_cf293
	cp $1c
	jp z, .asm_cf293
	cp $1b
	jp z, .asm_cf293
	cp $1a
	jp z, .asm_cf293
	cp $19
	jp z, .asm_cf288
	cp $18
	jp z, .asm_cf288
	cp $17
	jp z, .asm_cf288
	cp $16
	jp z, .asm_cf288
	cp $15
	jp z, .asm_cf288
	cp $14
	jp z, .asm_cf27d
	cp $13
	jp z, .asm_cf27d
	cp $12
	jp z, .asm_cf27d
	cp $11
	jp z, .asm_cf27d
	cp $10
	jp z, .asm_cf27d
	cp $f
	jp z, .asm_cf272
	cp $e
	jp z, .asm_cf272
	cp $d
	jp z, .asm_cf272
	cp $c
	jp z, .asm_cf272
	cp $b
	jp z, .asm_cf272
	cp $a
	jp z, .asm_cf267
	cp $9
	jp z, .asm_cf267
	cp $8
	jp z, .asm_cf267
	cp $7
	jp z, .asm_cf267
	cp $6
	jp z, .asm_cf267
	cp $5
	jp z, .asm_cf25c
	cp $4
	jp z, .asm_cf25c
	cp $3
	jp z, .asm_cf25c
	cp $2
	jp z, .asm_cf25c
	cp $1
	jp nz, .asm_cf2bf
.asm_cf25c: ; cf25c (33:725c)
	ld e, $5
	ld hl, Data_cee59
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf267: ; cf267 (33:7267)
	ld e, $5
	ld hl, Data_cee9f
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf272: ; cf272 (33:7272)
	ld e, $5
	ld hl, Data_ceee5
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf27d: ; cf27d (33:727d)
	ld e, $5
	ld hl, Data_cef2b
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf288: ; cf288 (33:7288)
	ld e, $5
	ld hl, Data_cef71
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf293: ; cf293 (33:7293)
	ld e, $5
	ld hl, Data_cefb7
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf29e: ; cf29e (33:729e)
	ld e, $5
	ld hl, Data_ceffd
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf2a9: ; cf2a9 (33:72a9)
	ld e, $5
	ld hl, Data_cf043
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf2b4: ; cf2b4 (33:72b4)
	ld e, $5
	ld hl, Data_cf089
	scall LoadEncounters
	jp .asm_cf2c7

.asm_cf2bf: ; cf2bf (33:72bf)
	ld e, $9
	ld hl, Data_cf0cf
	scall LoadEncounters
.asm_cf2c7: ; cf2c7 (33:72c7)
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, .asm_cf307
	call Func_cf344
	ld hl, Func_cf344
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
	ld de, Data_cedd5
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_cf307: ; cf307 (33:7307)
	ld e, $1
	ld hl, Data_cedca
	scall LoadWarps
	ld a, $8
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, .asm_cf328
	writetext TreeBitstreamText_47e17
	jp .asm_cf331

.asm_cf328: ; cf328 (33:7328)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_cf331: ; cf331 (33:7331)
	ret

Data_cf332:
	db $1e, $22, $01, $01, $01, $14
	db $1e, $22, $01, $01, $07, $01
	db $1e, $22, $01, $01, $14, $1e

Func_cf344: ; cf344 (33:7344)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_cf332
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
