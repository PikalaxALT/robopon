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
	ld a, [wSaveFileExists] ; CD533 (33:5533) -> FA 98 C7
	or a ; CD536 (33:5536) -> B7
	jp nz, .asm_cd549 ; CD537 (33:5537) -> C2 49 55
	ld a, $03 ; CD53A (33:553a) -> 3E 03
	scall Random ; CD53C (33:553c) -> CD D7 4C
	ld [wc7dd], a ; CD53F (33:553f) -> EA DD C7
	ld a, [wc7de] ; CD542 (33:5542) -> FA DE C7
	inc a ; CD545 (33:5545) -> 3C
	ld [wc7de], a ; CD546 (33:5546) -> EA DE C7
.asm_cd549:
	ld a, [wc7de] ; CD549 (33:5549) -> FA DE C7
	cp $32 ; CD54C (33:554c) -> FE 32
	jp nz, .asm_cd559 ; CD54E (33:554e) -> C2 59 55
	ld e, $01 ; CD551 (33:5551) -> 1E 01
	ld hl, $0061 ; CD553 (33:5553) -> 21 61 00
	scall EventFlagAction ; CD556 (33:5556) -> CD 1B 46
.asm_cd559:
	ld a, $03 ; CD559 (33:5559) -> 3E 03
	scall Func_80d01 ; CD55B (33:555b) -> CD 01 4D
	ld a, [wc7de] ; CD55E (33:555e) -> FA DE C7
	cp $06 ; CD561 (33:5561) -> FE 06
	jp nc, .asm_cd571 ; CD563 (33:5563) -> D2 71 55
	ld e, $05 ; CD566 (33:5566) -> 1E 05
	ld hl, Data_cd143 ; CD568 (33:5568) -> 21 43 51
	scall LoadEncounters ; CD56B (33:556b) -> CD 24 4D
	jp .asm_cd611 ; CD56E (33:556e) -> C3 11 56
.asm_cd571:
	ld a, [wc7de] ; CD571 (33:5571) -> FA DE C7
	cp $0b ; CD574 (33:5574) -> FE 0B
	jp nc, .asm_cd584 ; CD576 (33:5576) -> D2 84 55
	ld e, $05 ; CD579 (33:5579) -> 1E 05
	ld hl, Data_cd189 ; CD57B (33:557b) -> 21 89 51
	scall LoadEncounters ; CD57E (33:557e) -> CD 24 4D
	jp .asm_cd611 ; CD581 (33:5581) -> C3 11 56
.asm_cd584:
	ld a, [wc7de] ; CD584 (33:5584) -> FA DE C7
	cp $10 ; CD587 (33:5587) -> FE 10
	jp nc, .asm_cd597 ; CD589 (33:5589) -> D2 97 55
	ld e, $05 ; CD58C (33:558c) -> 1E 05
	ld hl, Data_cd1cf ; CD58E (33:558e) -> 21 CF 51
	scall LoadEncounters ; CD591 (33:5591) -> CD 24 4D
	jp .asm_cd611 ; CD594 (33:5594) -> C3 11 56
.asm_cd597:
	ld a, [wc7de] ; CD597 (33:5597) -> FA DE C7
	cp $15 ; CD59A (33:559a) -> FE 15
	jp nc, .asm_cd5aa ; CD59C (33:559c) -> D2 AA 55
	ld e, $05 ; CD59F (33:559f) -> 1E 05
	ld hl, Data_cd215 ; CD5A1 (33:55a1) -> 21 15 52
	scall LoadEncounters ; CD5A4 (33:55a4) -> CD 24 4D
	jp .asm_cd611 ; CD5A7 (33:55a7) -> C3 11 56
.asm_cd5aa:
	ld a, [wc7de] ; CD5AA (33:55aa) -> FA DE C7
	cp $1a ; CD5AD (33:55ad) -> FE 1A
	jp nc, .asm_cd5bd ; CD5AF (33:55af) -> D2 BD 55
	ld e, $05 ; CD5B2 (33:55b2) -> 1E 05
	ld hl, Data_cd25b ; CD5B4 (33:55b4) -> 21 5B 52
	scall LoadEncounters ; CD5B7 (33:55b7) -> CD 24 4D
	jp .asm_cd611 ; CD5BA (33:55ba) -> C3 11 56
.asm_cd5bd:
	ld a, [wc7de] ; CD5BD (33:55bd) -> FA DE C7
	cp $1f ; CD5C0 (33:55c0) -> FE 1F
	jp nc, .asm_cd5d0 ; CD5C2 (33:55c2) -> D2 D0 55
	ld e, $05 ; CD5C5 (33:55c5) -> 1E 05
	ld hl, Data_cd2a1 ; CD5C7 (33:55c7) -> 21 A1 52
	scall LoadEncounters ; CD5CA (33:55ca) -> CD 24 4D
	jp .asm_cd611 ; CD5CD (33:55cd) -> C3 11 56
.asm_cd5d0:
	ld a, [wc7de] ; CD5D0 (33:55d0) -> FA DE C7
	cp $24 ; CD5D3 (33:55d3) -> FE 24
	jp nc, .asm_cd5e3 ; CD5D5 (33:55d5) -> D2 E3 55
	ld e, $05 ; CD5D8 (33:55d8) -> 1E 05
	ld hl, Data_cd2e7 ; CD5DA (33:55da) -> 21 E7 52
	scall LoadEncounters ; CD5DD (33:55dd) -> CD 24 4D
	jp .asm_cd611 ; CD5E0 (33:55e0) -> C3 11 56
.asm_cd5e3:
	ld a, [wc7de] ; CD5E3 (33:55e3) -> FA DE C7
	cp $29 ; CD5E6 (33:55e6) -> FE 29
	jp nc, .asm_cd5f6 ; CD5E8 (33:55e8) -> D2 F6 55
	ld e, $05 ; CD5EB (33:55eb) -> 1E 05
	ld hl, Data_cd32d ; CD5ED (33:55ed) -> 21 2D 53
	scall LoadEncounters ; CD5F0 (33:55f0) -> CD 24 4D
	jp .asm_cd611 ; CD5F3 (33:55f3) -> C3 11 56
.asm_cd5f6:
	ld a, [wc7de] ; CD5F6 (33:55f6) -> FA DE C7
	cp $2e ; CD5F9 (33:55f9) -> FE 2E
	jp nc, .asm_cd609 ; CD5FB (33:55fb) -> D2 09 56
	ld e, $05 ; CD5FE (33:55fe) -> 1E 05
	ld hl, Data_cd373 ; CD600 (33:5600) -> 21 73 53
	scall LoadEncounters ; CD603 (33:5603) -> CD 24 4D
	jp .asm_cd611 ; CD606 (33:5606) -> C3 11 56
.asm_cd609:
	ld e, $09 ; CD609 (33:5609) -> 1E 09
	ld hl, Data_cd3b9 ; CD60B (33:560b) -> 21 B9 53
	scall LoadEncounters ; CD60E (33:560e) -> CD 24 4D
.asm_cd611:
	ld a, [wc7de] ; CD611 (33:5611) -> FA DE C7
	inc a ; CD614 (33:5614) -> 3C
	cp $33 ; CD615 (33:5615) -> FE 33
	jp nc, .asm_cd651 ; CD617 (33:5617) -> D2 51 56
	call Func_cd696 ; CD61A (33:561a) -> CD 96 56
	ld hl, Func_cd696 ; CD61D (33:561d) -> 21 96 56
	scall Func_80f11 ; CD620 (33:5620) -> CD 11 4F
	ld a, $04 ; CD623 (33:5623) -> 3E 04
	scall Random ; CD625 (33:5625) -> CD D7 4C
	ld l, a ; CD628 (33:5628) -> 6F
	ld h, $00 ; CD629 (33:5629) -> 26 00
	ld e, l ; CD62B (33:562b) -> 5D
	ld d, h ; CD62C (33:562c) -> 54
	add hl, hl ; CD62D (33:562d) -> 29
	ld c, l ; CD62E (33:562e) -> 4D
	ld b, h ; CD62F (33:562f) -> 44
	add hl, hl ; CD630 (33:5630) -> 29
	add hl, hl ; CD631 (33:5631) -> 29
	add hl, de ; CD632 (33:5632) -> 19
	add hl, bc ; CD633 (33:5633) -> 09
	push hl ; CD634 (33:5634) -> E5
	ld hl, wc7dd ; CD635 (33:5635) -> 21 DD C7
	ld l, [hl] ; CD638 (33:5638) -> 6E
	ld h, $00 ; CD639 (33:5639) -> 26 00
	add hl, hl ; CD63B (33:563b) -> 29
	add hl, hl ; CD63C (33:563c) -> 29
	ld e, l ; CD63D (33:563d) -> 5D
	ld d, h ; CD63E (33:563e) -> 54
	add hl, hl ; CD63F (33:563f) -> 29
	ld c, l ; CD640 (33:5640) -> 4D
	ld b, h ; CD641 (33:5641) -> 44
	add hl, hl ; CD642 (33:5642) -> 29
	add hl, hl ; CD643 (33:5643) -> 29
	add hl, de ; CD644 (33:5644) -> 19
	add hl, bc ; CD645 (33:5645) -> 09
	ld de, Data_cd0bf ; CD646 (33:5646) -> 11 BF 50
	add hl, de ; CD649 (33:5649) -> 19
	pop de ; CD64A (33:564a) -> D1
	add hl, de ; CD64B (33:564b) -> 19
	ld e, $01 ; CD64C (33:564c) -> 1E 01
	scall LoadWarps ; CD64E (33:564e) -> CD 3A 40
.asm_cd651:
	ld e, $01 ; CD651 (33:5651) -> 1E 01
	ld hl, Data_cd0b4 ; CD653 (33:5653) -> 21 B4 50
	scall LoadWarps ; CD656 (33:5656) -> CD 3A 40
	ld e, $12 ; CD659 (33:5659) -> 1E 12
	ld hl, Data_cd437 ; CD65B (33:565b) -> 21 37 54
	scall LoadMapObjects ; CD65E (33:565e) -> CD FB 40
	ld a, $08 ; CD661 (33:5661) -> 3E 08
	scall PlayMusic ; CD663 (33:5663) -> CD E6 4E
	scall Func_8001c ; CD666 (33:5666) -> CD 1C 40
	ld a, [wc7de] ; CD669 (33:5669) -> FA DE C7
	cp $32 ; CD66C (33:566c) -> FE 32
	jp nz, .asm_cd67a ; CD66E (33:566e) -> C2 7A 56
	ld hl, $00f8 ; CD671 (33:5671) -> 21 F8 00
	scall PrintTextStandard ; CD674 (33:5674) -> CD 98 44
	jp .asm_cd683 ; CD677 (33:5677) -> C3 83 56
.asm_cd67a:
	ld hl, wc7de ; CD67A (33:567a) -> 21 DE C7
	ld l, [hl] ; CD67D (33:567d) -> 6E
	ld h, $00 ; CD67E (33:567e) -> 26 00
	scall Func_80f83 ; CD680 (33:5680) -> CD 83 4F
.asm_cd683:
	ret  ; CD683 (33:5683) -> C9

Data_cd684:
	db $00, $26, $01, $01, $00, $1d
	db $00, $26, $01, $01, $03, $0f
	db $00, $26, $01, $01, $1b, $21

Func_cd696:
	ld hl, wc7dd ; CD696 (33:5696) -> 21 DD C7
	ld l, [hl] ; CD699 (33:5699) -> 6E
	ld h, $00 ; CD69A (33:569a) -> 26 00
	add hl, hl ; CD69C (33:569c) -> 29
	ld e, l ; CD69D (33:569d) -> 5D
	ld d, h ; CD69E (33:569e) -> 54
	add hl, hl ; CD69F (33:569f) -> 29
	add hl, de ; CD6A0 (33:56a0) -> 19
	ld de, Data_cd684 ; CD6A1 (33:56a1) -> 11 84 56
	add hl, de ; CD6A4 (33:56a4) -> 19
	scall Func_80d9b ; CD6A5 (33:56a5) -> CD 9B 4D
	scall Func_80f02 ; CD6A8 (33:56a8) -> CD 02 4F
	ret  ; CD6AB (33:56ab) -> C9

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
	push af ; CD6D0 (33:56d0) -> F5
	ld a, e ; CD6D1 (33:56d1) -> 7B
	or a ; CD6D2 (33:56d2) -> B7
	jp nz, .asm_cd738 ; CD6D3 (33:56d3) -> C2 38 57
	ld a, [wPlayerFacing] ; CD6D6 (33:56d6) -> FA 38 C8
	or a ; CD6D9 (33:56d9) -> B7
	jp z, .asm_cd6e0 ; CD6DA (33:56da) -> CA E0 56
	jp .asm_cd738 ; CD6DD (33:56dd) -> C3 38 57
.asm_cd6e0:
	ld hl, sp+$01 ; CD6E0 (33:56e0) -> F8 01
	ld a, [hl] ; CD6E2 (33:56e2) -> 7E
	add a, $09 ; CD6E3 (33:56e3) -> C6 09
	ld b, $12 ; CD6E5 (33:56e5) -> 06 12
	call DivideAbyB ; CD6E7 (33:56e7) -> CD AF 36
	ld hl, sp+$01 ; CD6EA (33:56ea) -> F8 01
	ld [hl], b ; CD6EC (33:56ec) -> 70
	ld hl, sp+$01 ; CD6ED (33:56ed) -> F8 01
	ld a, [hl] ; CD6EF (33:56ef) -> 7E
	add a, a ; CD6F0 (33:56f0) -> 87
	ld hl, sp+$01 ; CD6F1 (33:56f1) -> F8 01
	ld [hl], a ; CD6F3 (33:56f3) -> 77
	xor a ; CD6F4 (33:56f4) -> AF
	scall Func_80653 ; CD6F5 (33:56f5) -> CD 53 46
	ld c, $01 ; CD6F8 (33:56f8) -> 0E 01
	ld e, $01 ; CD6FA (33:56fa) -> 1E 01
	ld a, $09 ; CD6FC (33:56fc) -> 3E 09
	scall LoadEmote ; CD6FE (33:56fe) -> CD 76 41
	ld a, $5a ; CD701 (33:5701) -> 3E 5A
	scall PlaySFX ; CD703 (33:5703) -> CD FE 4E
	scall WaitEmote ; CD706 (33:5706) -> CD D5 41
	scall HideEmote ; CD709 (33:5709) -> CD 8B 41
	ld a, $02 ; CD70C (33:570c) -> 3E 02
	scall PlayerFace ; CD70E (33:570e) -> CD 77 46
	scall Func_80f63 ; CD711 (33:5711) -> CD 63 4F
	ld hl, sp+$01 ; CD714 (33:5714) -> F8 01
	ld e, [hl] ; CD716 (33:5716) -> 5E
	ld d, $00 ; CD717 (33:5717) -> 16 00
	ld hl, Data_cd6ac ; CD719 (33:5719) -> 21 AC 56
	add hl, de ; CD71C (33:571c) -> 19
	ld a, [hl] ; CD71D (33:571d) -> 7E
	ld hl, sp+$01 ; CD71E (33:571e) -> F8 01
	ld e, [hl] ; CD720 (33:5720) -> 5E
	ld d, $00 ; CD721 (33:5721) -> 16 00
	ld hl, Data_cd6ac + 1 ; CD723 (33:5723) -> 21 AD 56
	add hl, de ; CD726 (33:5726) -> 19
	ld e, [hl] ; CD727 (33:5727) -> 5E
	scall Func_80664 ; CD728 (33:5728) -> CD 64 46
	ld a, $01 ; CD72B (33:572b) -> 3E 01
	scall Func_80653 ; CD72D (33:572d) -> CD 53 46
	scall Func_80f54 ; CD730 (33:5730) -> CD 54 4F
	ld a, $01 ; CD733 (33:5733) -> 3E 01
	ld [wc7c4], a ; CD735 (33:5735) -> EA C4 C7
.asm_cd738:
	pop bc ; CD738 (33:5738) -> C1
	ret  ; CD739 (33:5739) -> C9

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
	ld a, [wSaveFileExists] ; CDABD (33:5abd) -> FA 98 C7
	or a ; CDAC0 (33:5ac0) -> B7
	jp nz, .asm_cdad3 ; CDAC1 (33:5ac1) -> C2 D3 5A
	ld a, $03 ; CDAC4 (33:5ac4) -> 3E 03
	scall Random ; CDAC6 (33:5ac6) -> CD D7 4C
	ld [wc7dd], a ; CDAC9 (33:5ac9) -> EA DD C7
	ld a, [wc7de] ; CDACC (33:5acc) -> FA DE C7
	inc a ; CDACF (33:5acf) -> 3C
	ld [wc7de], a ; CDAD0 (33:5ad0) -> EA DE C7
.asm_cdad3:
	ld a, [wc7de] ; CDAD3 (33:5ad3) -> FA DE C7
	cp $32 ; CDAD6 (33:5ad6) -> FE 32
	jp nz, .asm_cdae3 ; CDAD8 (33:5ad8) -> C2 E3 5A
	ld e, $01 ; CDADB (33:5adb) -> 1E 01
	ld hl, $0061 ; CDADD (33:5add) -> 21 61 00
	scall EventFlagAction ; CDAE0 (33:5ae0) -> CD 1B 46
.asm_cdae3:
	ld a, $03 ; CDAE3 (33:5ae3) -> 3E 03
	scall Func_80d01 ; CDAE5 (33:5ae5) -> CD 01 4D
	ld a, [wc7de] ; CDAE8 (33:5ae8) -> FA DE C7
	cp $06 ; CDAEB (33:5aeb) -> FE 06
	jp nc, .asm_cdafb ; CDAED (33:5aed) -> D2 FB 5A
	ld e, $05 ; CDAF0 (33:5af0) -> 1E 05
	ld hl, Data_cd7c9 ; CDAF2 (33:5af2) -> 21 C9 57
	scall LoadEncounters ; CDAF5 (33:5af5) -> CD 24 4D
	jp .asm_cdb9b ; CDAF8 (33:5af8) -> C3 9B 5B
.asm_cdafb:
	ld a, [wc7de] ; CDAFB (33:5afb) -> FA DE C7
	cp $0b ; CDAFE (33:5afe) -> FE 0B
	jp nc, .asm_cdb0e ; CDB00 (33:5b00) -> D2 0E 5B
	ld e, $05 ; CDB03 (33:5b03) -> 1E 05
	ld hl, Data_cd80f ; CDB05 (33:5b05) -> 21 0F 58
	scall LoadEncounters ; CDB08 (33:5b08) -> CD 24 4D
	jp .asm_cdb9b ; CDB0B (33:5b0b) -> C3 9B 5B
.asm_cdb0e:
	ld a, [wc7de] ; CDB0E (33:5b0e) -> FA DE C7
	cp $10 ; CDB11 (33:5b11) -> FE 10
	jp nc, .asm_cdb21 ; CDB13 (33:5b13) -> D2 21 5B
	ld e, $05 ; CDB16 (33:5b16) -> 1E 05
	ld hl, Data_cd855 ; CDB18 (33:5b18) -> 21 55 58
	scall LoadEncounters ; CDB1B (33:5b1b) -> CD 24 4D
	jp .asm_cdb9b ; CDB1E (33:5b1e) -> C3 9B 5B
.asm_cdb21:
	ld a, [wc7de] ; CDB21 (33:5b21) -> FA DE C7
	cp $15 ; CDB24 (33:5b24) -> FE 15
	jp nc, .asm_cdb34 ; CDB26 (33:5b26) -> D2 34 5B
	ld e, $05 ; CDB29 (33:5b29) -> 1E 05
	ld hl, Data_cd89b ; CDB2B (33:5b2b) -> 21 9B 58
	scall LoadEncounters ; CDB2E (33:5b2e) -> CD 24 4D
	jp .asm_cdb9b ; CDB31 (33:5b31) -> C3 9B 5B
.asm_cdb34:
	ld a, [wc7de] ; CDB34 (33:5b34) -> FA DE C7
	cp $1a ; CDB37 (33:5b37) -> FE 1A
	jp nc, .asm_cdb47 ; CDB39 (33:5b39) -> D2 47 5B
	ld e, $05 ; CDB3C (33:5b3c) -> 1E 05
	ld hl, Data_cd8e1 ; CDB3E (33:5b3e) -> 21 E1 58
	scall LoadEncounters ; CDB41 (33:5b41) -> CD 24 4D
	jp .asm_cdb9b ; CDB44 (33:5b44) -> C3 9B 5B
.asm_cdb47:
	ld a, [wc7de] ; CDB47 (33:5b47) -> FA DE C7
	cp $1f ; CDB4A (33:5b4a) -> FE 1F
	jp nc, .asm_cdb5a ; CDB4C (33:5b4c) -> D2 5A 5B
	ld e, $05 ; CDB4F (33:5b4f) -> 1E 05
	ld hl, Data_cd927 ; CDB51 (33:5b51) -> 21 27 59
	scall LoadEncounters ; CDB54 (33:5b54) -> CD 24 4D
	jp .asm_cdb9b ; CDB57 (33:5b57) -> C3 9B 5B
.asm_cdb5a:
	ld a, [wc7de] ; CDB5A (33:5b5a) -> FA DE C7
	cp $24 ; CDB5D (33:5b5d) -> FE 24
	jp nc, .asm_cdb6d ; CDB5F (33:5b5f) -> D2 6D 5B
	ld e, $05 ; CDB62 (33:5b62) -> 1E 05
	ld hl, Data_cd96d ; CDB64 (33:5b64) -> 21 6D 59
	scall LoadEncounters ; CDB67 (33:5b67) -> CD 24 4D
	jp .asm_cdb9b ; CDB6A (33:5b6a) -> C3 9B 5B
.asm_cdb6d:
	ld a, [wc7de] ; CDB6D (33:5b6d) -> FA DE C7
	cp $29 ; CDB70 (33:5b70) -> FE 29
	jp nc, .asm_cdb80 ; CDB72 (33:5b72) -> D2 80 5B
	ld e, $05 ; CDB75 (33:5b75) -> 1E 05
	ld hl, Data_cd9b3 ; CDB77 (33:5b77) -> 21 B3 59
	scall LoadEncounters ; CDB7A (33:5b7a) -> CD 24 4D
	jp .asm_cdb9b ; CDB7D (33:5b7d) -> C3 9B 5B
.asm_cdb80:
	ld a, [wc7de] ; CDB80 (33:5b80) -> FA DE C7
	cp $2e ; CDB83 (33:5b83) -> FE 2E
	jp nc, .asm_cdb93 ; CDB85 (33:5b85) -> D2 93 5B
	ld e, $05 ; CDB88 (33:5b88) -> 1E 05
	ld hl, Data_cd9f9 ; CDB8A (33:5b8a) -> 21 F9 59
	scall LoadEncounters ; CDB8D (33:5b8d) -> CD 24 4D
	jp .asm_cdb9b ; CDB90 (33:5b90) -> C3 9B 5B
.asm_cdb93:
	ld e, $09 ; CDB93 (33:5b93) -> 1E 09
	ld hl, Data_cda3f ; CDB95 (33:5b95) -> 21 3F 5A
	scall LoadEncounters ; CDB98 (33:5b98) -> CD 24 4D
.asm_cdb9b:
	ld a, [wc7de] ; CDB9B (33:5b9b) -> FA DE C7
	inc a ; CDB9E (33:5b9e) -> 3C
	cp $33 ; CDB9F (33:5b9f) -> FE 33
	jp nc, .asm_cdbdb ; CDBA1 (33:5ba1) -> D2 DB 5B
	call Func_cdc1d ; CDBA4 (33:5ba4) -> CD 1D 5C
	ld hl, Func_cdc1d ; CDBA7 (33:5ba7) -> 21 1D 5C
	scall Func_80f11 ; CDBAA (33:5baa) -> CD 11 4F
	ld a, $04 ; CDBAD (33:5bad) -> 3E 04
	scall Random ; CDBAF (33:5baf) -> CD D7 4C
	ld l, a ; CDBB2 (33:5bb2) -> 6F
	ld h, $00 ; CDBB3 (33:5bb3) -> 26 00
	ld e, l ; CDBB5 (33:5bb5) -> 5D
	ld d, h ; CDBB6 (33:5bb6) -> 54
	add hl, hl ; CDBB7 (33:5bb7) -> 29
	ld c, l ; CDBB8 (33:5bb8) -> 4D
	ld b, h ; CDBB9 (33:5bb9) -> 44
	add hl, hl ; CDBBA (33:5bba) -> 29
	add hl, hl ; CDBBB (33:5bbb) -> 29
	add hl, de ; CDBBC (33:5bbc) -> 19
	add hl, bc ; CDBBD (33:5bbd) -> 09
	push hl ; CDBBE (33:5bbe) -> E5
	ld hl, wc7dd ; CDBBF (33:5bbf) -> 21 DD C7
	ld l, [hl] ; CDBC2 (33:5bc2) -> 6E
	ld h, $00 ; CDBC3 (33:5bc3) -> 26 00
	add hl, hl ; CDBC5 (33:5bc5) -> 29
	add hl, hl ; CDBC6 (33:5bc6) -> 29
	ld e, l ; CDBC7 (33:5bc7) -> 5D
	ld d, h ; CDBC8 (33:5bc8) -> 54
	add hl, hl ; CDBC9 (33:5bc9) -> 29
	ld c, l ; CDBCA (33:5bca) -> 4D
	ld b, h ; CDBCB (33:5bcb) -> 44
	add hl, hl ; CDBCC (33:5bcc) -> 29
	add hl, hl ; CDBCD (33:5bcd) -> 29
	add hl, de ; CDBCE (33:5bce) -> 19
	add hl, bc ; CDBCF (33:5bcf) -> 09
	ld de, Data_cd745 ; CDBD0 (33:5bd0) -> 11 45 57
	add hl, de ; CDBD3 (33:5bd3) -> 19
	pop de ; CDBD4 (33:5bd4) -> D1
	add hl, de ; CDBD5 (33:5bd5) -> 19
	ld e, $01 ; CDBD6 (33:5bd6) -> 1E 01
	scall LoadWarps ; CDBD8 (33:5bd8) -> CD 3A 40
.asm_cdbdb:
	ld e, $01 ; CDBDB (33:5bdb) -> 1E 01
	ld hl, Data_cd73a ; CDBDD (33:5bdd) -> 21 3A 57
	scall LoadWarps ; CDBE0 (33:5be0) -> CD 3A 40
	ld a, $08 ; CDBE3 (33:5be3) -> 3E 08
	scall PlayMusic ; CDBE5 (33:5be5) -> CD E6 4E
	scall Func_8001c ; CDBE8 (33:5be8) -> CD 1C 40
	ld a, $41 ; CDBEB (33:5beb) -> 3E 41
	scall Func_80f43 ; CDBED (33:5bed) -> CD 43 4F
	ld a, [wc7de] ; CDBF0 (33:5bf0) -> FA DE C7
	cp $32 ; CDBF3 (33:5bf3) -> FE 32
	jp nz, .asm_cdc01 ; CDBF5 (33:5bf5) -> C2 01 5C
	ld hl, $00f8 ; CDBF8 (33:5bf8) -> 21 F8 00
	scall PrintTextStandard ; CDBFB (33:5bfb) -> CD 98 44
	jp .asm_cdc0a ; CDBFE (33:5bfe) -> C3 0A 5C
.asm_cdc01:
	ld hl, wc7de ; CDC01 (33:5c01) -> 21 DE C7
	ld l, [hl] ; CDC04 (33:5c04) -> 6E
	ld h, $00 ; CDC05 (33:5c05) -> 26 00
	scall Func_80f83 ; CDC07 (33:5c07) -> CD 83 4F
.asm_cdc0a:
	ret  ; CDC0A (33:5c0a) -> C9

Data_cdc0b:
	db $26, $01, $01, $01, $01, $01
	db $26, $01, $01, $01, $20, $01
	db $26, $01, $01, $01, $20, $1d

Func_cdc1d:
	ld hl, wc7dd ; CDC1D (33:5c1d) -> 21 DD C7
	ld l, [hl] ; CDC20 (33:5c20) -> 6E
	ld h, $00 ; CDC21 (33:5c21) -> 26 00
	add hl, hl ; CDC23 (33:5c23) -> 29
	ld e, l ; CDC24 (33:5c24) -> 5D
	ld d, h ; CDC25 (33:5c25) -> 54
	add hl, hl ; CDC26 (33:5c26) -> 29
	add hl, de ; CDC27 (33:5c27) -> 19
	ld de, Data_cdc0b ; CDC28 (33:5c28) -> 11 0B 5C
	add hl, de ; CDC2B (33:5c2b) -> 19
	scall Func_80d9b ; CDC2C (33:5c2c) -> CD 9B 4D
	scall Func_80f02 ; CDC2F (33:5c2f) -> CD 02 4F
	ret  ; CDC32 (33:5c32) -> C9

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
	ld a, [wSaveFileExists] ; CDFC4 (33:5fc4) -> FA 98 C7
	or a ; CDFC7 (33:5fc7) -> B7
	jp nz, .asm_cdfda ; CDFC8 (33:5fc8) -> C2 DA 5F
	ld a, $03 ; CDFCB (33:5fcb) -> 3E 03
	scall Random ; CDFCD (33:5fcd) -> CD D7 4C
	ld [wc7dd], a ; CDFD0 (33:5fd0) -> EA DD C7
	ld a, [wc7de] ; CDFD3 (33:5fd3) -> FA DE C7
	inc a ; CDFD6 (33:5fd6) -> 3C
	ld [wc7de], a ; CDFD7 (33:5fd7) -> EA DE C7
.asm_cdfda:
	ld a, [wc7de] ; CDFDA (33:5fda) -> FA DE C7
	cp $32 ; CDFDD (33:5fdd) -> FE 32
	jp nz, .asm_cdfea ; CDFDF (33:5fdf) -> C2 EA 5F
	ld e, $01 ; CDFE2 (33:5fe2) -> 1E 01
	ld hl, $0061 ; CDFE4 (33:5fe4) -> 21 61 00
	scall EventFlagAction ; CDFE7 (33:5fe7) -> CD 1B 46
.asm_cdfea:
	ld a, $03 ; CDFEA (33:5fea) -> 3E 03
	scall Func_80d01 ; CDFEC (33:5fec) -> CD 01 4D
	ld a, [wc7de] ; CDFEF (33:5fef) -> FA DE C7
	cp $2d ; CDFF2 (33:5ff2) -> FE 2D
	jp z, .asm_ce12b ; CDFF4 (33:5ff4) -> CA 2B 61
	cp $2c ; CDFF7 (33:5ff7) -> FE 2C
	jp z, .asm_ce12b ; CDFF9 (33:5ff9) -> CA 2B 61
	cp $2b ; CDFFC (33:5ffc) -> FE 2B
	jp z, .asm_ce12b ; CDFFE (33:5ffe) -> CA 2B 61
	cp $2a ; CE001 (33:6001) -> FE 2A
	jp z, .asm_ce12b ; CE003 (33:6003) -> CA 2B 61
	cp $29 ; CE006 (33:6006) -> FE 29
	jp z, .asm_ce12b ; CE008 (33:6008) -> CA 2B 61
	cp $28 ; CE00B (33:600b) -> FE 28
	jp z, .asm_ce120 ; CE00D (33:600d) -> CA 20 61
	cp $27 ; CE010 (33:6010) -> FE 27
	jp z, .asm_ce120 ; CE012 (33:6012) -> CA 20 61
	cp $26 ; CE015 (33:6015) -> FE 26
	jp z, .asm_ce120 ; CE017 (33:6017) -> CA 20 61
	cp $25 ; CE01A (33:601a) -> FE 25
	jp z, .asm_ce120 ; CE01C (33:601c) -> CA 20 61
	cp $24 ; CE01F (33:601f) -> FE 24
	jp z, .asm_ce120 ; CE021 (33:6021) -> CA 20 61
	cp $23 ; CE024 (33:6024) -> FE 23
	jp z, .asm_ce115 ; CE026 (33:6026) -> CA 15 61
	cp $22 ; CE029 (33:6029) -> FE 22
	jp z, .asm_ce115 ; CE02B (33:602b) -> CA 15 61
	cp $21 ; CE02E (33:602e) -> FE 21
	jp z, .asm_ce115 ; CE030 (33:6030) -> CA 15 61
	cp $20 ; CE033 (33:6033) -> FE 20
	jp z, .asm_ce115 ; CE035 (33:6035) -> CA 15 61
	cp $1f ; CE038 (33:6038) -> FE 1F
	jp z, .asm_ce115 ; CE03A (33:603a) -> CA 15 61
	cp $1e ; CE03D (33:603d) -> FE 1E
	jp z, .asm_ce10a ; CE03F (33:603f) -> CA 0A 61
	cp $1d ; CE042 (33:6042) -> FE 1D
	jp z, .asm_ce10a ; CE044 (33:6044) -> CA 0A 61
	cp $1c ; CE047 (33:6047) -> FE 1C
	jp z, .asm_ce10a ; CE049 (33:6049) -> CA 0A 61
	cp $1b ; CE04C (33:604c) -> FE 1B
	jp z, .asm_ce10a ; CE04E (33:604e) -> CA 0A 61
	cp $1a ; CE051 (33:6051) -> FE 1A
	jp z, .asm_ce10a ; CE053 (33:6053) -> CA 0A 61
	cp $19 ; CE056 (33:6056) -> FE 19
	jp z, .asm_ce0ff ; CE058 (33:6058) -> CA FF 60
	cp $18 ; CE05B (33:605b) -> FE 18
	jp z, .asm_ce0ff ; CE05D (33:605d) -> CA FF 60
	cp $17 ; CE060 (33:6060) -> FE 17
	jp z, .asm_ce0ff ; CE062 (33:6062) -> CA FF 60
	cp $16 ; CE065 (33:6065) -> FE 16
	jp z, .asm_ce0ff ; CE067 (33:6067) -> CA FF 60
	cp $15 ; CE06A (33:606a) -> FE 15
	jp z, .asm_ce0ff ; CE06C (33:606c) -> CA FF 60
	cp $14 ; CE06F (33:606f) -> FE 14
	jp z, .asm_ce0f4 ; CE071 (33:6071) -> CA F4 60
	cp $13 ; CE074 (33:6074) -> FE 13
	jp z, .asm_ce0f4 ; CE076 (33:6076) -> CA F4 60
	cp $12 ; CE079 (33:6079) -> FE 12
	jp z, .asm_ce0f4 ; CE07B (33:607b) -> CA F4 60
	cp $11 ; CE07E (33:607e) -> FE 11
	jp z, .asm_ce0f4 ; CE080 (33:6080) -> CA F4 60
	cp $10 ; CE083 (33:6083) -> FE 10
	jp z, .asm_ce0f4 ; CE085 (33:6085) -> CA F4 60
	cp $0f ; CE088 (33:6088) -> FE 0F
	jp z, .asm_ce0e9 ; CE08A (33:608a) -> CA E9 60
	cp $0e ; CE08D (33:608d) -> FE 0E
	jp z, .asm_ce0e9 ; CE08F (33:608f) -> CA E9 60
	cp $0d ; CE092 (33:6092) -> FE 0D
	jp z, .asm_ce0e9 ; CE094 (33:6094) -> CA E9 60
	cp $0c ; CE097 (33:6097) -> FE 0C
	jp z, .asm_ce0e9 ; CE099 (33:6099) -> CA E9 60
	cp $0b ; CE09C (33:609c) -> FE 0B
	jp z, .asm_ce0e9 ; CE09E (33:609e) -> CA E9 60
	cp $0a ; CE0A1 (33:60a1) -> FE 0A
	jp z, .asm_ce0de ; CE0A3 (33:60a3) -> CA DE 60
	cp $09 ; CE0A6 (33:60a6) -> FE 09
	jp z, .asm_ce0de ; CE0A8 (33:60a8) -> CA DE 60
	cp $08 ; CE0AB (33:60ab) -> FE 08
	jp z, .asm_ce0de ; CE0AD (33:60ad) -> CA DE 60
	cp $07 ; CE0B0 (33:60b0) -> FE 07
	jp z, .asm_ce0de ; CE0B2 (33:60b2) -> CA DE 60
	cp $06 ; CE0B5 (33:60b5) -> FE 06
	jp z, .asm_ce0de ; CE0B7 (33:60b7) -> CA DE 60
	cp $05 ; CE0BA (33:60ba) -> FE 05
	jp z, .asm_ce0d3 ; CE0BC (33:60bc) -> CA D3 60
	cp $04 ; CE0BF (33:60bf) -> FE 04
	jp z, .asm_ce0d3 ; CE0C1 (33:60c1) -> CA D3 60
	cp $03 ; CE0C4 (33:60c4) -> FE 03
	jp z, .asm_ce0d3 ; CE0C6 (33:60c6) -> CA D3 60
	cp $02 ; CE0C9 (33:60c9) -> FE 02
	jp z, .asm_ce0d3 ; CE0CB (33:60cb) -> CA D3 60
	cp $01 ; CE0CE (33:60ce) -> FE 01
	jp nz, .asm_ce136 ; CE0D0 (33:60d0) -> C2 36 61
.asm_ce0d3:
	ld e, $05 ; CE0D3 (33:60d3) -> 1E 05
	ld hl, Data_cdcc2 ; CE0D5 (33:60d5) -> 21 C2 5C
	scall LoadEncounters ; CE0D8 (33:60d8) -> CD 24 4D
	jp .asm_ce13e ; CE0DB (33:60db) -> C3 3E 61
.asm_ce0de:
	ld e, $05 ; CE0DE (33:60de) -> 1E 05
	ld hl, Data_cdd08 ; CE0E0 (33:60e0) -> 21 08 5D
	scall LoadEncounters ; CE0E3 (33:60e3) -> CD 24 4D
	jp .asm_ce13e ; CE0E6 (33:60e6) -> C3 3E 61
.asm_ce0e9:
	ld e, $05 ; CE0E9 (33:60e9) -> 1E 05
	ld hl, Data_cdd4e ; CE0EB (33:60eb) -> 21 4E 5D
	scall LoadEncounters ; CE0EE (33:60ee) -> CD 24 4D
	jp .asm_ce13e ; CE0F1 (33:60f1) -> C3 3E 61
.asm_ce0f4:
	ld e, $05 ; CE0F4 (33:60f4) -> 1E 05
	ld hl, Data_cdd94 ; CE0F6 (33:60f6) -> 21 94 5D
	scall LoadEncounters ; CE0F9 (33:60f9) -> CD 24 4D
	jp .asm_ce13e ; CE0FC (33:60fc) -> C3 3E 61
.asm_ce0ff:
	ld e, $05 ; CE0FF (33:60ff) -> 1E 05
	ld hl, Data_cddda ; CE101 (33:6101) -> 21 DA 5D
	scall LoadEncounters ; CE104 (33:6104) -> CD 24 4D
	jp .asm_ce13e ; CE107 (33:6107) -> C3 3E 61
.asm_ce10a:
	ld e, $05 ; CE10A (33:610a) -> 1E 05
	ld hl, Data_cde20 ; CE10C (33:610c) -> 21 20 5E
	scall LoadEncounters ; CE10F (33:610f) -> CD 24 4D
	jp .asm_ce13e ; CE112 (33:6112) -> C3 3E 61
.asm_ce115:
	ld e, $05 ; CE115 (33:6115) -> 1E 05
	ld hl, Data_cde66 ; CE117 (33:6117) -> 21 66 5E
	scall LoadEncounters ; CE11A (33:611a) -> CD 24 4D
	jp .asm_ce13e ; CE11D (33:611d) -> C3 3E 61
.asm_ce120:
	ld e, $05 ; CE120 (33:6120) -> 1E 05
	ld hl, Data_cdeac ; CE122 (33:6122) -> 21 AC 5E
	scall LoadEncounters ; CE125 (33:6125) -> CD 24 4D
	jp .asm_ce13e ; CE128 (33:6128) -> C3 3E 61
.asm_ce12b:
	ld e, $05 ; CE12B (33:612b) -> 1E 05
	ld hl, Data_cdef2 ; CE12D (33:612d) -> 21 F2 5E
	scall LoadEncounters ; CE130 (33:6130) -> CD 24 4D
	jp .asm_ce13e ; CE133 (33:6133) -> C3 3E 61
.asm_ce136:
	ld e, $09 ; CE136 (33:6136) -> 1E 09
	ld hl, Data_cdf38 ; CE138 (33:6138) -> 21 38 5F
	scall LoadEncounters ; CE13B (33:613b) -> CD 24 4D
.asm_ce13e:
	ld a, [wc7de] ; CE13E (33:613e) -> FA DE C7
	inc a ; CE141 (33:6141) -> 3C
	cp $33 ; CE142 (33:6142) -> FE 33
	jp nc, .asm_ce17e ; CE144 (33:6144) -> D2 7E 61
	call Func_ce1e3 ; CE147 (33:6147) -> CD E3 61
	ld hl, Func_ce1e3 ; CE14A (33:614a) -> 21 E3 61
	scall Func_80f11 ; CE14D (33:614d) -> CD 11 4F
	ld a, $04 ; CE150 (33:6150) -> 3E 04
	scall Random ; CE152 (33:6152) -> CD D7 4C
	ld l, a ; CE155 (33:6155) -> 6F
	ld h, $00 ; CE156 (33:6156) -> 26 00
	ld e, l ; CE158 (33:6158) -> 5D
	ld d, h ; CE159 (33:6159) -> 54
	add hl, hl ; CE15A (33:615a) -> 29
	ld c, l ; CE15B (33:615b) -> 4D
	ld b, h ; CE15C (33:615c) -> 44
	add hl, hl ; CE15D (33:615d) -> 29
	add hl, hl ; CE15E (33:615e) -> 29
	add hl, de ; CE15F (33:615f) -> 19
	add hl, bc ; CE160 (33:6160) -> 09
	push hl ; CE161 (33:6161) -> E5
	ld hl, wc7dd ; CE162 (33:6162) -> 21 DD C7
	ld l, [hl] ; CE165 (33:6165) -> 6E
	ld h, $00 ; CE166 (33:6166) -> 26 00
	add hl, hl ; CE168 (33:6168) -> 29
	add hl, hl ; CE169 (33:6169) -> 29
	ld e, l ; CE16A (33:616a) -> 5D
	ld d, h ; CE16B (33:616b) -> 54
	add hl, hl ; CE16C (33:616c) -> 29
	ld c, l ; CE16D (33:616d) -> 4D
	ld b, h ; CE16E (33:616e) -> 44
	add hl, hl ; CE16F (33:616f) -> 29
	add hl, hl ; CE170 (33:6170) -> 29
	add hl, de ; CE171 (33:6171) -> 19
	add hl, bc ; CE172 (33:6172) -> 09
	ld de, Data_cdc3e ; CE173 (33:6173) -> 11 3E 5C
	add hl, de ; CE176 (33:6176) -> 19
	pop de ; CE177 (33:6177) -> D1
	add hl, de ; CE178 (33:6178) -> 19
	ld e, $01 ; CE179 (33:6179) -> 1E 01
	scall LoadWarps ; CE17B (33:617b) -> CD 3A 40
.asm_ce17e:
	ld e, $01 ; CE17E (33:617e) -> 1E 01
	ld hl, Data_cdc33 ; CE180 (33:6180) -> 21 33 5C
	scall LoadWarps ; CE183 (33:6183) -> CD 3A 40
	ld a, [wc7a3] ; CE186 (33:6186) -> FA A3 C7
	cp $03 ; CE189 (33:6189) -> FE 03
	jp z, .asm_ce198 ; CE18B (33:618b) -> CA 98 61
	cp $02 ; CE18E (33:618e) -> FE 02
	jp z, .asm_ce198 ; CE190 (33:6190) -> CA 98 61
	cp $01 ; CE193 (33:6193) -> FE 01
	jp nz, .asm_ce19b ; CE195 (33:6195) -> C2 9B 61
.asm_ce198:
	jp .asm_ce1a0 ; CE198 (33:6198) -> C3 A0 61
.asm_ce19b:
	ld a, $01 ; CE19B (33:619b) -> 3E 01
	ld [wc7a3], a ; CE19D (33:619d) -> EA A3 C7
.asm_ce1a0:
	ld a, [wc7a3] ; CE1A0 (33:61a0) -> FA A3 C7
	call Func_ce409 ; CE1A3 (33:61a3) -> CD 09 64
	ld e, $01 ; CE1A6 (33:61a6) -> 1E 01
	ld hl, Data_cdfb6 ; CE1A8 (33:61a8) -> 21 B6 5F
	scall LoadMapObjects ; CE1AB (33:61ab) -> CD FB 40
	ld a, $08 ; CE1AE (33:61ae) -> 3E 08
	scall PlayMusic ; CE1B0 (33:61b0) -> CD E6 4E
	scall Func_8001c ; CE1B3 (33:61b3) -> CD 1C 40
	ld a, [wc7de] ; CE1B6 (33:61b6) -> FA DE C7
	cp $32 ; CE1B9 (33:61b9) -> FE 32
	jp nz, .asm_ce1c7 ; CE1BB (33:61bb) -> C2 C7 61
	ld hl, $00f8 ; CE1BE (33:61be) -> 21 F8 00
	scall PrintTextStandard ; CE1C1 (33:61c1) -> CD 98 44
	jp .asm_ce1d0 ; CE1C4 (33:61c4) -> C3 D0 61
.asm_ce1c7:
	ld hl, wc7de ; CE1C7 (33:61c7) -> 21 DE C7
	ld l, [hl] ; CE1CA (33:61ca) -> 6E
	ld h, $00 ; CE1CB (33:61cb) -> 26 00
	scall Func_80f83 ; CE1CD (33:61cd) -> CD 83 4F
.asm_ce1d0:
	ret  ; CE1D0 (33:61d0) -> C9

Data_ce1d1:
	db $27, $20, $01
	db $01, $01, $10, $27, $20, $01, $01, $14, $1f, $27, $20, $01, $01, $26, $10

Func_ce1e3:
	ld hl, $c7dd ; CE1E3 (33:61e3) -> 21 DD C7
	ld l, [hl] ; CE1E6 (33:61e6) -> 6E
	ld h, $00 ; CE1E7 (33:61e7) -> 26 00
	add hl, hl ; CE1E9 (33:61e9) -> 29
	ld e, l ; CE1EA (33:61ea) -> 5D
	ld d, h ; CE1EB (33:61eb) -> 54
	add hl, hl ; CE1EC (33:61ec) -> 29
	add hl, de ; CE1ED (33:61ed) -> 19
	ld de, Data_ce1d1 ; CE1EE (33:61ee) -> 11 D1 61
	add hl, de ; CE1F1 (33:61f1) -> 19
	scall Func_80d9b ; CE1F2 (33:61f2) -> CD 9B 4D
	scall Func_80f02 ; CE1F5 (33:61f5) -> CD 02 4F
	ret  ; CE1F8 (33:61f8) -> C9

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
	ld hl, $fdf0 ; CE409 (33:6409) -> 21 F0 FD
	add hl, sp ; CE40C (33:640c) -> 39
	ld sp, hl ; CE40D (33:640d) -> F9
	push af ; CE40E (33:640e) -> F5
	ld hl, $01b8 ; CE40F (33:640f) -> 21 B8 01
	add hl, sp ; CE412 (33:6412) -> 39
	push de ; CE413 (33:6413) -> D5
	push hl ; CE414 (33:6414) -> E5
	pop de ; CE415 (33:6415) -> D1
	pop hl ; CE416 (33:6416) -> E1
	ld hl, Data_ce1f9 ; CE417 (33:6417) -> 21 F9 61
	ld bc, $005a ; CE41A (33:641a) -> 01 5A 00
	call MemCopy ; CE41D (33:641d) -> CD E8 35
	ld hl, $015e ; CE420 (33:6420) -> 21 5E 01
	add hl, sp ; CE423 (33:6423) -> 39
	push de ; CE424 (33:6424) -> D5
	push hl ; CE425 (33:6425) -> E5
	pop de ; CE426 (33:6426) -> D1
	pop hl ; CE427 (33:6427) -> E1
	ld hl, Data_ce253 ; CE428 (33:6428) -> 21 53 62
	ld bc, $005a ; CE42B (33:642b) -> 01 5A 00
	call MemCopy ; CE42E (33:642e) -> CD E8 35
	ld hl, $010a ; CE431 (33:6431) -> 21 0A 01
	add hl, sp ; CE434 (33:6434) -> 39
	push de ; CE435 (33:6435) -> D5
	push hl ; CE436 (33:6436) -> E5
	pop de ; CE437 (33:6437) -> D1
	pop hl ; CE438 (33:6438) -> E1
	ld hl, Data_ce2ad ; CE439 (33:6439) -> 21 AD 62
	ld bc, $0054 ; CE43C (33:643c) -> 01 54 00
	call MemCopy ; CE43F (33:643f) -> CD E8 35
	ld hl, $00b0 ; CE442 (33:6442) -> 21 B0 00
	add hl, sp ; CE445 (33:6445) -> 39
	push de ; CE446 (33:6446) -> D5
	push hl ; CE447 (33:6447) -> E5
	pop de ; CE448 (33:6448) -> D1
	pop hl ; CE449 (33:6449) -> E1
	ld hl, Data_ce301 ; CE44A (33:644a) -> 21 01 63
	ld bc, $005a ; CE44D (33:644d) -> 01 5A 00
	call MemCopy ; CE450 (33:6450) -> CD E8 35
	ld hl, sp+$56 ; CE453 (33:6453) -> F8 56
	push de ; CE455 (33:6455) -> D5
	push hl ; CE456 (33:6456) -> E5
	pop de ; CE457 (33:6457) -> D1
	pop hl ; CE458 (33:6458) -> E1
	ld hl, Data_ce35b ; CE459 (33:6459) -> 21 5B 63
	ld bc, $005a ; CE45C (33:645c) -> 01 5A 00
	call MemCopy ; CE45F (33:645f) -> CD E8 35
	ld hl, sp+$02 ; CE462 (33:6462) -> F8 02
	push de ; CE464 (33:6464) -> D5
	push hl ; CE465 (33:6465) -> E5
	pop de ; CE466 (33:6466) -> D1
	pop hl ; CE467 (33:6467) -> E1
	ld hl, Data_ce3b5 ; CE468 (33:6468) -> 21 B5 63
	ld bc, $0054 ; CE46B (33:646b) -> 01 54 00
	call MemCopy ; CE46E (33:646e) -> CD E8 35
	pop af ; CE471 (33:6471) -> F1
	cp $03 ; CE472 (33:6472) -> FE 03
	jp z, .asm_ce547 ; CE474 (33:6474) -> CA 47 65
	cp $02 ; CE477 (33:6477) -> FE 02
	jp z, .asm_ce4e3 ; CE479 (33:6479) -> CA E3 64
	cp $01 ; CE47C (33:647c) -> FE 01
	jp nz, .asm_ce5a8 ; CE47E (33:647e) -> C2 A8 65
	xor a ; CE481 (33:6481) -> AF
.asm_ce482:
	cp $0f ; CE482 (33:6482) -> FE 0F
	jp nc, .asm_ce4a1 ; CE484 (33:6484) -> D2 A1 64
	push af ; CE487 (33:6487) -> F5
	ld l, a ; CE488 (33:6488) -> 6F
	ld h, $00 ; CE489 (33:6489) -> 26 00
	add hl, hl ; CE48B (33:648b) -> 29
	ld e, l ; CE48C (33:648c) -> 5D
	ld d, h ; CE48D (33:648d) -> 54
	add hl, hl ; CE48E (33:648e) -> 29
	add hl, de ; CE48F (33:648f) -> 19
	push de ; CE490 (33:6490) -> D5
	push hl ; CE491 (33:6491) -> E5
	pop de ; CE492 (33:6492) -> D1
	pop hl ; CE493 (33:6493) -> E1
	ld hl, $01b8 ; CE494 (33:6494) -> 21 B8 01
	add hl, sp ; CE497 (33:6497) -> 39
	add hl, de ; CE498 (33:6498) -> 19
	scall Func_80d9b ; CE499 (33:6499) -> CD 9B 4D
	pop af ; CE49C (33:649c) -> F1
	inc a ; CE49D (33:649d) -> 3C
	jp .asm_ce482 ; CE49E (33:649e) -> C3 82 64
.asm_ce4a1:
	xor a ; CE4A1 (33:64a1) -> AF
.asm_ce4a2:
	cp $0f ; CE4A2 (33:64a2) -> FE 0F
	jp nc, .asm_ce4bf ; CE4A4 (33:64a4) -> D2 BF 64
	push af ; CE4A7 (33:64a7) -> F5
	ld l, a ; CE4A8 (33:64a8) -> 6F
	ld h, $00 ; CE4A9 (33:64a9) -> 26 00
	add hl, hl ; CE4AB (33:64ab) -> 29
	ld e, l ; CE4AC (33:64ac) -> 5D
	ld d, h ; CE4AD (33:64ad) -> 54
	add hl, hl ; CE4AE (33:64ae) -> 29
	add hl, de ; CE4AF (33:64af) -> 19
	push de ; CE4B0 (33:64b0) -> D5
	push hl ; CE4B1 (33:64b1) -> E5
	pop de ; CE4B2 (33:64b2) -> D1
	pop hl ; CE4B3 (33:64b3) -> E1
	ld hl, sp+$56 ; CE4B4 (33:64b4) -> F8 56
	add hl, de ; CE4B6 (33:64b6) -> 19
	scall Func_80d9b ; CE4B7 (33:64b7) -> CD 9B 4D
	pop af ; CE4BA (33:64ba) -> F1
	inc a ; CE4BB (33:64bb) -> 3C
	jp .asm_ce4a2 ; CE4BC (33:64bc) -> C3 A2 64
.asm_ce4bf:
	xor a ; CE4BF (33:64bf) -> AF
.asm_ce4c0:
	cp $0e ; CE4C0 (33:64c0) -> FE 0E
	jp nc, .asm_ce4dd ; CE4C2 (33:64c2) -> D2 DD 64
	push af ; CE4C5 (33:64c5) -> F5
	ld l, a ; CE4C6 (33:64c6) -> 6F
	ld h, $00 ; CE4C7 (33:64c7) -> 26 00
	add hl, hl ; CE4C9 (33:64c9) -> 29
	ld e, l ; CE4CA (33:64ca) -> 5D
	ld d, h ; CE4CB (33:64cb) -> 54
	add hl, hl ; CE4CC (33:64cc) -> 29
	add hl, de ; CE4CD (33:64cd) -> 19
	push de ; CE4CE (33:64ce) -> D5
	push hl ; CE4CF (33:64cf) -> E5
	pop de ; CE4D0 (33:64d0) -> D1
	pop hl ; CE4D1 (33:64d1) -> E1
	ld hl, sp+$02 ; CE4D2 (33:64d2) -> F8 02
	add hl, de ; CE4D4 (33:64d4) -> 19
	scall Func_80d9b ; CE4D5 (33:64d5) -> CD 9B 4D
	pop af ; CE4D8 (33:64d8) -> F1
	inc a ; CE4D9 (33:64d9) -> 3C
	jp .asm_ce4c0 ; CE4DA (33:64da) -> C3 C0 64
.asm_ce4dd:
	scall Func_80f02 ; CE4DD (33:64dd) -> CD 02 4F
	jp .asm_ce5a8 ; CE4E0 (33:64e0) -> C3 A8 65
.asm_ce4e3:
	xor a ; CE4E3 (33:64e3) -> AF
.asm_ce4e4:
	cp $0f ; CE4E4 (33:64e4) -> FE 0F
	jp nc, .asm_ce503 ; CE4E6 (33:64e6) -> D2 03 65
	push af ; CE4E9 (33:64e9) -> F5
	ld l, a ; CE4EA (33:64ea) -> 6F
	ld h, $00 ; CE4EB (33:64eb) -> 26 00
	add hl, hl ; CE4ED (33:64ed) -> 29
	ld e, l ; CE4EE (33:64ee) -> 5D
	ld d, h ; CE4EF (33:64ef) -> 54
	add hl, hl ; CE4F0 (33:64f0) -> 29
	add hl, de ; CE4F1 (33:64f1) -> 19
	push de ; CE4F2 (33:64f2) -> D5
	push hl ; CE4F3 (33:64f3) -> E5
	pop de ; CE4F4 (33:64f4) -> D1
	pop hl ; CE4F5 (33:64f5) -> E1
	ld hl, $015e ; CE4F6 (33:64f6) -> 21 5E 01
	add hl, sp ; CE4F9 (33:64f9) -> 39
	add hl, de ; CE4FA (33:64fa) -> 19
	scall Func_80d9b ; CE4FB (33:64fb) -> CD 9B 4D
	pop af ; CE4FE (33:64fe) -> F1
	inc a ; CE4FF (33:64ff) -> 3C
	jp .asm_ce4e4 ; CE500 (33:6500) -> C3 E4 64
.asm_ce503:
	xor a ; CE503 (33:6503) -> AF
.asm_ce504:
	cp $0f ; CE504 (33:6504) -> FE 0F
	jp nc, .asm_ce523 ; CE506 (33:6506) -> D2 23 65
	push af ; CE509 (33:6509) -> F5
	ld l, a ; CE50A (33:650a) -> 6F
	ld h, $00 ; CE50B (33:650b) -> 26 00
	add hl, hl ; CE50D (33:650d) -> 29
	ld e, l ; CE50E (33:650e) -> 5D
	ld d, h ; CE50F (33:650f) -> 54
	add hl, hl ; CE510 (33:6510) -> 29
	add hl, de ; CE511 (33:6511) -> 19
	push de ; CE512 (33:6512) -> D5
	push hl ; CE513 (33:6513) -> E5
	pop de ; CE514 (33:6514) -> D1
	pop hl ; CE515 (33:6515) -> E1
	ld hl, $00b0 ; CE516 (33:6516) -> 21 B0 00
	add hl, sp ; CE519 (33:6519) -> 39
	add hl, de ; CE51A (33:651a) -> 19
	scall Func_80d9b ; CE51B (33:651b) -> CD 9B 4D
	pop af ; CE51E (33:651e) -> F1
	inc a ; CE51F (33:651f) -> 3C
	jp .asm_ce504 ; CE520 (33:6520) -> C3 04 65
.asm_ce523:
	xor a ; CE523 (33:6523) -> AF
.asm_ce524:
	cp $0e ; CE524 (33:6524) -> FE 0E
	jp nc, .asm_ce541 ; CE526 (33:6526) -> D2 41 65
	push af ; CE529 (33:6529) -> F5
	ld l, a ; CE52A (33:652a) -> 6F
	ld h, $00 ; CE52B (33:652b) -> 26 00
	add hl, hl ; CE52D (33:652d) -> 29
	ld e, l ; CE52E (33:652e) -> 5D
	ld d, h ; CE52F (33:652f) -> 54
	add hl, hl ; CE530 (33:6530) -> 29
	add hl, de ; CE531 (33:6531) -> 19
	push de ; CE532 (33:6532) -> D5
	push hl ; CE533 (33:6533) -> E5
	pop de ; CE534 (33:6534) -> D1
	pop hl ; CE535 (33:6535) -> E1
	ld hl, sp+$02 ; CE536 (33:6536) -> F8 02
	add hl, de ; CE538 (33:6538) -> 19
	scall Func_80d9b ; CE539 (33:6539) -> CD 9B 4D
	pop af ; CE53C (33:653c) -> F1
	inc a ; CE53D (33:653d) -> 3C
	jp .asm_ce524 ; CE53E (33:653e) -> C3 24 65
.asm_ce541:
	scall Func_80f02 ; CE541 (33:6541) -> CD 02 4F
	jp .asm_ce5a8 ; CE544 (33:6544) -> C3 A8 65
.asm_ce547:
	xor a ; CE547 (33:6547) -> AF
.asm_ce548:
	cp $0e ; CE548 (33:6548) -> FE 0E
	jp nc, .asm_ce567 ; CE54A (33:654a) -> D2 67 65
	push af ; CE54D (33:654d) -> F5
	ld l, a ; CE54E (33:654e) -> 6F
	ld h, $00 ; CE54F (33:654f) -> 26 00
	add hl, hl ; CE551 (33:6551) -> 29
	ld e, l ; CE552 (33:6552) -> 5D
	ld d, h ; CE553 (33:6553) -> 54
	add hl, hl ; CE554 (33:6554) -> 29
	add hl, de ; CE555 (33:6555) -> 19
	push de ; CE556 (33:6556) -> D5
	push hl ; CE557 (33:6557) -> E5
	pop de ; CE558 (33:6558) -> D1
	pop hl ; CE559 (33:6559) -> E1
	ld hl, $010a ; CE55A (33:655a) -> 21 0A 01
	add hl, sp ; CE55D (33:655d) -> 39
	add hl, de ; CE55E (33:655e) -> 19
	scall Func_80d9b ; CE55F (33:655f) -> CD 9B 4D
	pop af ; CE562 (33:6562) -> F1
	inc a ; CE563 (33:6563) -> 3C
	jp .asm_ce548 ; CE564 (33:6564) -> C3 48 65
.asm_ce567:
	xor a ; CE567 (33:6567) -> AF
.asm_ce568:
	cp $0f ; CE568 (33:6568) -> FE 0F
	jp nc, .asm_ce587 ; CE56A (33:656a) -> D2 87 65
	push af ; CE56D (33:656d) -> F5
	ld l, a ; CE56E (33:656e) -> 6F
	ld h, $00 ; CE56F (33:656f) -> 26 00
	add hl, hl ; CE571 (33:6571) -> 29
	ld e, l ; CE572 (33:6572) -> 5D
	ld d, h ; CE573 (33:6573) -> 54
	add hl, hl ; CE574 (33:6574) -> 29
	add hl, de ; CE575 (33:6575) -> 19
	push de ; CE576 (33:6576) -> D5
	push hl ; CE577 (33:6577) -> E5
	pop de ; CE578 (33:6578) -> D1
	pop hl ; CE579 (33:6579) -> E1
	ld hl, $00b0 ; CE57A (33:657a) -> 21 B0 00
	add hl, sp ; CE57D (33:657d) -> 39
	add hl, de ; CE57E (33:657e) -> 19
	scall Func_80d9b ; CE57F (33:657f) -> CD 9B 4D
	pop af ; CE582 (33:6582) -> F1
	inc a ; CE583 (33:6583) -> 3C
	jp .asm_ce568 ; CE584 (33:6584) -> C3 68 65
.asm_ce587:
	xor a ; CE587 (33:6587) -> AF
.asm_ce588:
	cp $0f ; CE588 (33:6588) -> FE 0F
	jp nc, .asm_ce5a5 ; CE58A (33:658a) -> D2 A5 65
	push af ; CE58D (33:658d) -> F5
	ld l, a ; CE58E (33:658e) -> 6F
	ld h, $00 ; CE58F (33:658f) -> 26 00
	add hl, hl ; CE591 (33:6591) -> 29
	ld e, l ; CE592 (33:6592) -> 5D
	ld d, h ; CE593 (33:6593) -> 54
	add hl, hl ; CE594 (33:6594) -> 29
	add hl, de ; CE595 (33:6595) -> 19
	push de ; CE596 (33:6596) -> D5
	push hl ; CE597 (33:6597) -> E5
	pop de ; CE598 (33:6598) -> D1
	pop hl ; CE599 (33:6599) -> E1
	ld hl, sp+$56 ; CE59A (33:659a) -> F8 56
	add hl, de ; CE59C (33:659c) -> 19
	scall Func_80d9b ; CE59D (33:659d) -> CD 9B 4D
	pop af ; CE5A0 (33:65a0) -> F1
	inc a ; CE5A1 (33:65a1) -> 3C
	jp .asm_ce588 ; CE5A2 (33:65a2) -> C3 88 65
.asm_ce5a5:
	scall Func_80f02 ; CE5A5 (33:65a5) -> CD 02 4F
.asm_ce5a8:
	ld hl, $0210 ; CE5A8 (33:65a8) -> 21 10 02
	add hl, sp ; CE5AB (33:65ab) -> 39
	ld sp, hl ; CE5AC (33:65ac) -> F9
	ret  ; CE5AD (33:65ad) -> C9

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
	add sp, $a0 ; CE60E (33:660e) -> E8 A0
	push de ; CE610 (33:6610) -> D5
	ld hl, sp+$38 ; CE611 (33:6611) -> F8 38
	push de ; CE613 (33:6613) -> D5
	push hl ; CE614 (33:6614) -> E5
	pop de ; CE615 (33:6615) -> D1
	pop hl ; CE616 (33:6616) -> E1
	ld hl, Data_ce5ae ; CE617 (33:6617) -> 21 AE 65
	ld bc, $002a ; CE61A (33:661a) -> 01 2A 00
	call MemCopy ; CE61D (33:661d) -> CD E8 35
	ld hl, sp+$1e ; CE620 (33:6620) -> F8 1E
	push de ; CE622 (33:6622) -> D5
	push hl ; CE623 (33:6623) -> E5
	pop de ; CE624 (33:6624) -> D1
	pop hl ; CE625 (33:6625) -> E1
	ld hl, Data_ce5d8 ; CE626 (33:6626) -> 21 D8 65
	ld bc, $001a ; CE629 (33:6629) -> 01 1A 00
	call MemCopy ; CE62C (33:662c) -> CD E8 35
	ld hl, sp+$02 ; CE62F (33:662f) -> F8 02
	push de ; CE631 (33:6631) -> D5
	push hl ; CE632 (33:6632) -> E5
	pop de ; CE633 (33:6633) -> D1
	pop hl ; CE634 (33:6634) -> E1
	ld hl, Data_ce5f2 ; CE635 (33:6635) -> 21 F2 65
	ld bc, $001c ; CE638 (33:6638) -> 01 1C 00
	call MemCopy ; CE63B (33:663b) -> CD E8 35
	pop de ; CE63E (33:663e) -> D1
	ld a, e ; CE63F (33:663f) -> 7B
	cp $02 ; CE640 (33:6640) -> FE 02
	jp nz, .asm_ce738 ; CE642 (33:6642) -> C2 38 67
	ld c, $00 ; CE645 (33:6645) -> 0E 00
.asm_ce647:
	ld a, c ; CE647 (33:6647) -> 79
	cp $15 ; CE648 (33:6648) -> FE 15
	jp nc, .asm_ce67e ; CE64A (33:664a) -> D2 7E 66
	ld l, c ; CE64D (33:664d) -> 69
	ld h, $00 ; CE64E (33:664e) -> 26 00
	add hl, hl ; CE650 (33:6650) -> 29
	push de ; CE651 (33:6651) -> D5
	push hl ; CE652 (33:6652) -> E5
	pop de ; CE653 (33:6653) -> D1
	pop hl ; CE654 (33:6654) -> E1
	ld hl, sp+$36 ; CE655 (33:6655) -> F8 36
	add hl, de ; CE657 (33:6657) -> 19
	ld a, [wMapX] ; CE658 (33:6658) -> FA D8 C2
	add a, $05 ; CE65B (33:665b) -> C6 05
	cp [hl] ; CE65D (33:665d) -> BE
	jp nz, .asm_ce67a ; CE65E (33:665e) -> C2 7A 66
	ld l, c ; CE661 (33:6661) -> 69
	ld h, $00 ; CE662 (33:6662) -> 26 00
	add hl, hl ; CE664 (33:6664) -> 29
	push de ; CE665 (33:6665) -> D5
	push hl ; CE666 (33:6666) -> E5
	pop de ; CE667 (33:6667) -> D1
	pop hl ; CE668 (33:6668) -> E1
	ld hl, sp+$37 ; CE669 (33:6669) -> F8 37
	add hl, de ; CE66B (33:666b) -> 19
	ld a, [wMapY] ; CE66C (33:666c) -> FA D9 C2
	add a, $04 ; CE66F (33:666f) -> C6 04
	cp [hl] ; CE671 (33:6671) -> BE
	jp nz, .asm_ce67a ; CE672 (33:6672) -> C2 7A 66
	ld c, $ff ; CE675 (33:6675) -> 0E FF
	jp .asm_ce67e ; CE677 (33:6677) -> C3 7E 66
.asm_ce67a:
	inc c ; CE67A (33:667a) -> 0C
	jp .asm_ce647 ; CE67B (33:667b) -> C3 47 66
.asm_ce67e:
	ld a, c ; CE67E (33:667e) -> 79
	cp $ff ; CE67F (33:667f) -> FE FF
	jp nz, .asm_ce696 ; CE681 (33:6681) -> C2 96 66
	ld a, $28 ; CE684 (33:6684) -> 3E 28
	scall PlaySFX ; CE686 (33:6686) -> CD FE 4E
	ld a, $01 ; CE689 (33:6689) -> 3E 01
	ld [wc7a3], a ; CE68B (33:668b) -> EA A3 C7
	ld a, $01 ; CE68E (33:668e) -> 3E 01
	call Func_ce409 ; CE690 (33:6690) -> CD 09 64
	jp .asm_ce738 ; CE693 (33:6693) -> C3 38 67
.asm_ce696:
	ld c, $00 ; CE696 (33:6696) -> 0E 00
.asm_ce698:
	ld a, c ; CE698 (33:6698) -> 79
	cp $0d ; CE699 (33:6699) -> FE 0D
	jp nc, .asm_ce6cf ; CE69B (33:669b) -> D2 CF 66
	ld l, c ; CE69E (33:669e) -> 69
	ld h, $00 ; CE69F (33:669f) -> 26 00
	add hl, hl ; CE6A1 (33:66a1) -> 29
	push de ; CE6A2 (33:66a2) -> D5
	push hl ; CE6A3 (33:66a3) -> E5
	pop de ; CE6A4 (33:66a4) -> D1
	pop hl ; CE6A5 (33:66a5) -> E1
	ld hl, sp+$1c ; CE6A6 (33:66a6) -> F8 1C
	add hl, de ; CE6A8 (33:66a8) -> 19
	ld a, [wMapX] ; CE6A9 (33:66a9) -> FA D8 C2
	add a, $05 ; CE6AC (33:66ac) -> C6 05
	cp [hl] ; CE6AE (33:66ae) -> BE
	jp nz, .asm_ce6cb ; CE6AF (33:66af) -> C2 CB 66
	ld l, c ; CE6B2 (33:66b2) -> 69
	ld h, $00 ; CE6B3 (33:66b3) -> 26 00
	add hl, hl ; CE6B5 (33:66b5) -> 29
	push de ; CE6B6 (33:66b6) -> D5
	push hl ; CE6B7 (33:66b7) -> E5
	pop de ; CE6B8 (33:66b8) -> D1
	pop hl ; CE6B9 (33:66b9) -> E1
	ld hl, sp+$1d ; CE6BA (33:66ba) -> F8 1D
	add hl, de ; CE6BC (33:66bc) -> 19
	ld a, [wMapY] ; CE6BD (33:66bd) -> FA D9 C2
	add a, $04 ; CE6C0 (33:66c0) -> C6 04
	cp [hl] ; CE6C2 (33:66c2) -> BE
	jp nz, .asm_ce6cb ; CE6C3 (33:66c3) -> C2 CB 66
	ld c, $ff ; CE6C6 (33:66c6) -> 0E FF
	jp .asm_ce6cf ; CE6C8 (33:66c8) -> C3 CF 66
.asm_ce6cb:
	inc c ; CE6CB (33:66cb) -> 0C
	jp .asm_ce698 ; CE6CC (33:66cc) -> C3 98 66
.asm_ce6cf:
	ld a, c ; CE6CF (33:66cf) -> 79
	cp $ff ; CE6D0 (33:66d0) -> FE FF
	jp nz, .asm_ce6e7 ; CE6D2 (33:66d2) -> C2 E7 66
	ld a, $28 ; CE6D5 (33:66d5) -> 3E 28
	scall PlaySFX ; CE6D7 (33:66d7) -> CD FE 4E
	ld a, $02 ; CE6DA (33:66da) -> 3E 02
	ld [wc7a3], a ; CE6DC (33:66dc) -> EA A3 C7
	ld a, $02 ; CE6DF (33:66df) -> 3E 02
	call Func_ce409 ; CE6E1 (33:66e1) -> CD 09 64
	jp .asm_ce738 ; CE6E4 (33:66e4) -> C3 38 67
.asm_ce6e7:
	ld c, $00 ; CE6E7 (33:66e7) -> 0E 00
.asm_ce6e9:
	ld a, c ; CE6E9 (33:66e9) -> 79
	cp $0e ; CE6EA (33:66ea) -> FE 0E
	jp nc, .asm_ce720 ; CE6EC (33:66ec) -> D2 20 67
	ld l, c ; CE6EF (33:66ef) -> 69
	ld h, $00 ; CE6F0 (33:66f0) -> 26 00
	add hl, hl ; CE6F2 (33:66f2) -> 29
	push de ; CE6F3 (33:66f3) -> D5
	push hl ; CE6F4 (33:66f4) -> E5
	pop de ; CE6F5 (33:66f5) -> D1
	pop hl ; CE6F6 (33:66f6) -> E1
	ld hl, sp+$00 ; CE6F7 (33:66f7) -> F8 00
	add hl, de ; CE6F9 (33:66f9) -> 19
	ld a, [wMapX] ; CE6FA (33:66fa) -> FA D8 C2
	add a, $05 ; CE6FD (33:66fd) -> C6 05
	cp [hl] ; CE6FF (33:66ff) -> BE
	jp nz, .asm_ce71c ; CE700 (33:6700) -> C2 1C 67
	ld l, c ; CE703 (33:6703) -> 69
	ld h, $00 ; CE704 (33:6704) -> 26 00
	add hl, hl ; CE706 (33:6706) -> 29
	push de ; CE707 (33:6707) -> D5
	push hl ; CE708 (33:6708) -> E5
	pop de ; CE709 (33:6709) -> D1
	pop hl ; CE70A (33:670a) -> E1
	ld hl, sp+$01 ; CE70B (33:670b) -> F8 01
	add hl, de ; CE70D (33:670d) -> 19
	ld a, [wMapY] ; CE70E (33:670e) -> FA D9 C2
	add a, $04 ; CE711 (33:6711) -> C6 04
	cp [hl] ; CE713 (33:6713) -> BE
	jp nz, .asm_ce71c ; CE714 (33:6714) -> C2 1C 67
	ld c, $ff ; CE717 (33:6717) -> 0E FF
	jp .asm_ce720 ; CE719 (33:6719) -> C3 20 67
.asm_ce71c:
	inc c ; CE71C (33:671c) -> 0C
	jp .asm_ce6e9 ; CE71D (33:671d) -> C3 E9 66
.asm_ce720:
	ld a, c ; CE720 (33:6720) -> 79
	cp $ff ; CE721 (33:6721) -> FE FF
	jp nz, .asm_ce738 ; CE723 (33:6723) -> C2 38 67
	ld a, $28 ; CE726 (33:6726) -> 3E 28
	scall PlaySFX ; CE728 (33:6728) -> CD FE 4E
	ld a, $03 ; CE72B (33:672b) -> 3E 03
	ld [wc7a3], a ; CE72D (33:672d) -> EA A3 C7
	ld a, $03 ; CE730 (33:6730) -> 3E 03
	call Func_ce409 ; CE732 (33:6732) -> CD 09 64
	jp .asm_ce738 ; CE735 (33:6735) -> C3 38 67
.asm_ce738:
	add sp, $60 ; CE738 (33:6738) -> E8 60
	ret  ; CE73A (33:673a) -> C9

Data_ce73b:
IF DEF(SUN)
	db $0e, $0f, $01, $01, $1d, $01, $0e, $04, $0f
	db $04, $2e, $08, $04, $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $08, $04, $01
	db $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e, $08, $04, $01, $01, $1d, $20, $13, $10
	db $12, $10, $2e, $08, $04, $01, $01, $1d, $22, $0e, $0e, $0d, $0e, $2e, $14, $1d
	db $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $14, $1d, $01, $01, $1d, $1f, $0f
	db $0f, $0e, $0f, $2e, $14, $1d, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $14
	db $1d, $01, $01, $1d, $22, $0e, $0e, $0d, $0e, $2e, $1e, $09, $01, $01, $1d, $1e
	db $12, $0f, $12, $10, $2e, $1e, $09, $01, $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e
	db $1e, $09, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $1e, $09, $01, $01, $1d
	db $22, $0e, $0e, $0d, $0e, $2e, $06, $06, $14, $14, $89, $28, $2c, $62, $04, $10
	db $00, $06, $0a, $00, $06, $06, $14, $14, $76, $29, $2d, $3f, $07, $10, $00, $06
	db $0a, $00, $06, $06, $14, $14, $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00
	db $06, $06, $14, $14, $54, $2b, $2f, $4a, $20, $12, $00, $12, $0a, $00, $06, $06
	db $14, $14, $45, $2c, $30, $55, $0c, $0e, $0f, $13, $0a, $00, $06, $06, $14, $14
	db $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00, $06, $06, $14, $14, $54, $2d
	db $31, $4a, $20, $12, $00, $12, $0a, $00, $06, $06, $14, $14, $45, $2e, $32, $55
	db $0c, $0e, $0f, $13, $0a, $00, $06, $06, $14, $14, $22, $2f, $33, $77, $0c, $0f
	db $00, $06, $0a, $00, $06, $06, $14, $14, $1e, $2f, $33, $7b, $23, $12, $00, $12
	db $0a, $00, $06, $06, $14, $14, $45, $30, $34, $55, $0c, $08, $00, $12, $0a, $00
	db $06, $06, $14, $14, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00, $06, $06
	db $14, $14, $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00, $06, $06, $14, $14
	db $1a, $32, $36, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $8c, $33
	db $37, $7b, $04, $04, $04, $14, $0a, $00, $06, $06, $14, $14, $1e, $33, $37, $7b
	db $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $1a, $34, $38, $7b, $04, $04
	db $00, $07, $0a, $00, $06, $06, $14, $14, $8c, $35, $39, $7b, $04, $04, $04, $15
	db $0a, $00, $06, $06, $14, $14, $13, $36, $3a, $08, $1f, $1e, $16, $14, $0a, $00
	db $06, $06, $14, $14, $2d, $36, $3a, $7b, $06, $06, $06, $07, $0a, $00, $06, $06
	db $14, $14, $8c, $37, $3b, $7b, $04, $04, $00, $14, $0a, $00, $06, $06, $14, $14
	db $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00, $06, $06, $14, $14, $2d, $38
	db $3c, $7b, $06, $06, $06, $07, $0a, $00, $06, $06, $14, $14, $89, $39, $3d, $62
	db $04, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $76, $3a, $3e, $3f, $07, $10
	db $00, $07, $0a, $00, $06, $06, $14, $14, $2d, $38, $3c, $7b, $06, $06, $06, $07
	db $0a, $00, $06, $06, $14, $14, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00
	db $06, $06, $14, $14, $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00, $06, $06
	db $14, $14, $8a, $3b, $3f, $08, $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14
	db $54, $3b, $3f, $4a, $20, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $76, $3c
	db $40, $3f, $07, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $8a, $3d, $41, $08
	db $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14, $54, $3d, $41, $4a, $20, $12
	db $00, $14, $0a, $00, $06, $06, $14, $14, $45, $3e, $42, $55, $0c, $0e, $0f, $15
	db $0a, $00, $06, $06, $14, $14, $22, $3f, $43, $77, $0c, $0f, $00, $07, $0a, $00
	db $06, $06, $14, $14, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00, $06, $06
	db $14, $14, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06, $14, $14
	db $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $42
	db $46, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $1a, $42, $46, $7b
	db $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $22, $43, $47, $77, $0c, $0f
	db $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14
	db $0a, $00, $06, $06, $14, $14, $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00
	db $06, $06, $14, $14, $8c, $45, $49, $7b, $04, $04, $04, $15, $0a, $00, $06, $06
	db $14, $14, $13, $46, $4a, $08, $1f, $1e, $16, $14, $0a, $00, $06, $06, $14, $14
	db $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $89, $46
	db $4a, $62, $04, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $8a, $47, $4b, $08
	db $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14, $06, $48, $4c, $34, $03, $03
	db $01, $14, $0a, $00, $06, $06, $14, $14, $08, $49, $4d, $62, $01, $13, $00, $15
	db $0a, $00, $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09, $00, $14, $0a, $00
	db $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $15, $0a, $00, $06, $06
	db $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00, $06, $06, $14, $14
	db $13, $49, $4d, $7b, $1f, $1e, $16, $15, $0a, $00, $ff, $00, $00, $00, $64, $64
	db $00, $04, $01, $33, $03, $6d, $00, $00
ELIF DEF(STAR)
	db $0e, $0f, $01, $01, $1d, $01, $0e, $04, $0f
	db $04, $2e, $08, $04, $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $08, $04, $01
	db $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e, $08, $04, $01, $01, $1d, $20, $13, $10
	db $12, $10, $2e, $08, $04, $01, $01, $1d, $22, $0e, $0e, $0d, $0e, $2e, $14, $1d
	db $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $14, $1d, $01, $01, $1d, $1f, $0f
	db $0f, $0e, $0f, $2e, $14, $1d, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $14
	db $1d, $01, $01, $1d, $22, $0e, $0e, $0d, $0e, $2e, $1e, $09, $01, $01, $1d, $1e
	db $12, $0f, $12, $10, $2e, $1e, $09, $01, $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e
	db $1e, $09, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $1e, $09, $01, $01, $1d
	db $22, $0e, $0e, $0d, $0e, $2e, $06, $06, $14, $14, $86, $28, $2c, $77, $14, $0d
	db $1f, $12, $0a, $00, $06, $06, $14, $14, $2d, $29, $2d, $7b, $06, $06, $06, $06
	db $0a, $00, $06, $06, $14, $14, $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00
	db $06, $06, $14, $14, $13, $2b, $2f, $08, $1f, $1e, $16, $12, $0a, $00, $06, $06
	db $14, $14, $8c, $2c, $30, $7b, $04, $04, $04, $13, $0a, $00, $06, $06, $14, $14
	db $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00, $06, $06, $14, $14, $13, $2d
	db $31, $08, $1f, $1e, $16, $12, $0a, $00, $06, $06, $14, $14, $8c, $2e, $32, $7b
	db $04, $04, $04, $13, $0a, $00, $06, $06, $14, $14, $1a, $2f, $33, $7b, $04, $04
	db $00, $06, $0a, $00, $06, $06, $14, $14, $1e, $2f, $33, $7b, $23, $12, $00, $12
	db $0a, $00, $06, $06, $14, $14, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00
	db $06, $06, $14, $14, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00, $06, $06
	db $14, $14, $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00, $06, $06, $14, $14
	db $22, $32, $36, $77, $0c, $0f, $17, $07, $0a, $00, $06, $06, $14, $14, $45, $33
	db $37, $55, $0c, $0e, $0f, $14, $0a, $00, $06, $06, $14, $14, $1e, $33, $37, $7b
	db $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $22, $34, $38, $77, $0c, $0f
	db $17, $07, $0a, $00, $06, $06, $14, $14, $45, $35, $39, $55, $0c, $0e, $0f, $15
	db $0a, $00, $06, $06, $14, $14, $54, $36, $3a, $4a, $20, $12, $00, $14, $0a, $00
	db $06, $06, $14, $14, $76, $36, $3a, $3f, $07, $10, $00, $07, $0a, $00, $06, $06
	db $14, $14, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00, $06, $06, $14, $14
	db $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00, $06, $06, $14, $14, $76, $38
	db $3c, $3f, $07, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $86, $39, $3d, $77
	db $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $2d, $3a, $3e, $7b, $06, $06
	db $06, $07, $0a, $00, $06, $06, $14, $14, $76, $38, $3c, $3f, $07, $10, $00, $07
	db $0a, $00, $06, $06, $14, $14, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00
	db $06, $06, $14, $14, $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00, $06, $06
	db $14, $14, $87, $3b, $3f, $07, $14, $0d, $1f, $15, $0a, $00, $06, $06, $14, $14
	db $13, $3b, $3f, $08, $1f, $1e, $16, $14, $0a, $00, $06, $06, $14, $14, $2d, $3c
	db $40, $7b, $06, $06, $06, $07, $0a, $00, $06, $06, $14, $14, $87, $3d, $41, $07
	db $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $13, $3d, $41, $08, $1f, $1e
	db $16, $15, $0a, $00, $06, $06, $14, $14, $8c, $3e, $42, $7b, $04, $04, $04, $14
	db $0a, $00, $06, $06, $14, $14, $1a, $3f, $43, $7b, $04, $04, $00, $07, $0a, $00
	db $06, $06, $14, $14, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00, $06, $06
	db $14, $14, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00, $06, $06, $14, $14
	db $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $41
	db $46, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $22, $42, $46, $77
	db $0c, $0f, $17, $07, $0a, $00, $06, $06, $14, $14, $1a, $43, $47, $7b, $04, $04
	db $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14
	db $0a, $00, $06, $06, $14, $14, $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00
	db $06, $06, $14, $14, $45, $45, $49, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06
	db $14, $14, $54, $46, $4a, $4a, $20, $12, $00, $14, $0a, $00, $06, $06, $14, $14
	db $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $86, $46
	db $4a, $77, $14, $0d, $1f, $15, $0a, $00, $06, $06, $14, $14, $87, $47, $4b, $07
	db $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $47, $48, $4c, $78, $07, $07
	db $07, $15, $0a, $00, $06, $06, $14, $14, $08, $49, $4d, $62, $01, $13, $00, $14
	db $0a, $00, $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09, $00, $15, $0a, $00
	db $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $14, $0a, $00, $06, $06
	db $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00, $06, $06, $14, $14
	db $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00, $ff, $00, $00, $00, $64, $64
	db $00, $04, $01, $33, $03, $6d, $00, $00
ENDC

Func_ceacc:: ; ceacc
	db $fa, $98, $c7, $b7, $c2, $e2, $6a, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $32, $c2, $f2, $6a, $1e, $01
	db $21, $61, $00, $cd, $1b, $46, $3e, $02, $cd, $01, $4d, $fa, $de, $c7, $fe, $2d
	db $ca, $33, $6c, $fe, $2c, $ca, $33, $6c, $fe, $2b, $ca, $33, $6c, $fe, $2a, $ca
	db $33, $6c, $fe, $29, $ca, $33, $6c, $fe, $28, $ca, $28, $6c, $fe, $27, $ca, $28
	db $6c, $fe, $26, $ca, $28, $6c, $fe, $25, $ca, $28, $6c, $fe, $24, $ca, $28, $6c
	db $fe, $23, $ca, $1d, $6c, $fe, $22, $ca, $1d, $6c, $fe, $21, $ca, $1d, $6c, $fe
	db $20, $ca, $1d, $6c, $fe, $1f, $ca, $1d, $6c, $fe, $1e, $ca, $12, $6c, $fe, $1d
	db $ca, $12, $6c, $fe, $1c, $ca, $12, $6c, $fe, $1b, $ca, $12, $6c, $fe, $1a, $ca
	db $12, $6c, $fe, $19, $ca, $07, $6c, $fe, $18, $ca, $07, $6c, $fe, $17, $ca, $07
	db $6c, $fe, $16, $ca, $07, $6c, $fe, $15, $ca, $07, $6c, $fe, $14, $ca, $fc, $6b
	db $fe, $13, $ca, $fc, $6b, $fe, $12, $ca, $fc, $6b, $fe, $11, $ca, $fc, $6b, $fe
	db $10, $ca, $fc, $6b, $fe, $0f, $ca, $f1, $6b, $fe, $0e, $ca, $f1, $6b, $fe, $0d
	db $ca, $f1, $6b, $fe, $0c, $ca, $f1, $6b, $fe, $0b, $ca, $f1, $6b, $fe, $0a, $ca
	db $e6, $6b, $fe, $09, $ca, $e6, $6b, $fe, $08, $ca, $e6, $6b, $fe, $07, $ca, $e6
	db $6b, $fe, $06, $ca, $e6, $6b, $fe, $05, $ca, $db, $6b, $fe, $04, $ca, $db, $6b
	db $fe, $03, $ca, $db, $6b, $fe, $02, $ca, $db, $6b, $fe, $01, $c2, $3e, $6c, $1e
	db $05, $21, $ca, $67, $cd, $24, $4d, $c3, $46, $6c, $1e, $05, $21, $10, $68, $cd
	db $24, $4d, $c3, $46, $6c, $1e, $05, $21, $56, $68, $cd, $24, $4d, $c3, $46, $6c
	db $1e, $05, $21, $9c, $68, $cd, $24, $4d, $c3, $46, $6c, $1e, $05, $21, $e2, $68
	db $cd, $24, $4d, $c3, $46, $6c, $1e, $05, $21, $28, $69, $cd, $24, $4d, $c3, $46
	db $6c, $1e, $05, $21, $6e, $69, $cd, $24, $4d, $c3, $46, $6c, $1e, $05, $21, $b4
	db $69, $cd, $24, $4d, $c3, $46, $6c, $1e, $05, $21, $fa, $69, $cd, $24, $4d, $c3
	db $46, $6c, $1e, $09, $21, $40, $6a, $cd, $24, $4d, $fa, $de, $c7, $3c, $fe, $33
	db $d2, $86, $6c, $cd, $cb, $6c, $21, $cb, $6c, $cd, $11, $4f, $3e, $04, $cd, $d7
	db $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $e5, $21, $dd
	db $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11
	db $46, $67, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01, $21, $3b, $67, $cd
	db $3a, $40, $1e, $01, $21, $be, $6a, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd
	db $1c, $40, $fa, $de, $c7, $fe, $32, $c2, $af, $6c, $21, $f8, $00, $cd, $98, $44
	db $c3, $b8, $6c, $21, $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $1e, $1e, $01
	db $01, $08, $04, $1e, $1e, $01, $01, $14, $1d, $1e, $1e, $01, $01, $1e, $09, $21
	db $dd, $c7, $6e, $26, $00, $29, $5d, $54, $29, $19, $11, $b9, $6c, $19, $cd, $9b
	db $4d, $cd, $02, $4f, $c9, $0a, $05, $0d, $07, $0a, $0b, $1e, $0b, $13, $0c, $0c
	db $0e, $12, $0e, $1a, $10, $09, $11, $13, $11, $02, $12, $10, $13, $18, $13, $03
	db $14, $14, $16, $0e, $17, $14, $17, $e8, $dc, $d5, $f8, $04, $d5, $e5, $d1, $e1
	db $21, $e1, $6c, $01, $22, $00, $cd, $e8, $35, $d1, $7b, $fe, $02, $c2, $c7, $6d
	db $0e, $00, $79, $fe, $11, $d2, $58, $6d, $69, $26, $00, $29, $d5, $e5, $d1, $e1
	db $f8, $02, $19, $7e, $3d, $6f, $fa, $d8, $c2, $c6, $05, $bd, $c2, $54, $6d, $69
	db $26, $00, $29, $d5, $e5, $d1, $e1, $f8, $03, $19, $fa, $d9, $c2, $c6, $04, $be
	db $c2, $54, $6d, $0e, $ff, $c3, $58, $6d, $0c, $c3, $1e, $6d, $79, $fe, $ff, $c2
	db $c7, $6d, $0e, $01, $1e, $01, $3e, $0a, $cd, $76, $41, $3e, $35, $cd, $02, $15
	db $cd, $a2, $4e, $cd, $d5, $41, $cd, $b1, $4e, $cd, $8b, $41, $0e, $00, $79, $fe
	db $04, $d2, $c7, $6d, $c5, $69, $26, $00, $cd, $88, $44, $cd, $97, $37, $c1, $e1
	db $e5, $7d, $b4, $c2, $95, $6d, $c3, $c3, $6d, $e1, $e5, $d5, $e5, $d1, $e1, $21
	db $15, $00, $cd, $08, $36, $da, $ac, $6d, $e1, $e5, $2b, $d1, $e5, $c3, $b1, $6d
	db $21, $14, $00, $d1, $e5, $c5, $cd, $29, $38, $7d, $2f, $6f, $7c, $2f, $67, $23
	db $59, $16, $00, $cd, $31, $4e, $c1, $0c, $c3, $7a, $6d, $e8, $24, $c9

Data_cedca: ; cedca
	db $0e, $0e, $01, $01, $1d, $01, $0e, $04, $0f, $04, $2e

Data_cedd5:
	db $01, $14, $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $01, $14, $01, $01, $1d
	db $1f, $0f, $0f, $0e, $0f, $2e, $01, $14, $01, $01, $1d, $20, $13, $10, $12, $10
	db $2e, $01, $14, $01, $01, $1d, $21, $0e, $0f, $0d, $0f, $2e, $07, $01, $01, $01
	db $1d, $1e, $12, $0f, $12, $10, $2e, $07, $01, $01, $01, $1d, $1f, $0f, $0f, $0e
	db $0f, $2e, $07, $01, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $07, $01, $01
	db $01, $1d, $21, $0e, $0f, $0d, $0f, $2e, $14, $1e, $01, $01, $1d, $1e, $12, $0f
	db $12, $10, $2e, $14, $1e, $01, $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e, $14, $1e
	db $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $14, $1e, $01, $01, $1d, $21, $0e
	db $0f, $0d, $0f, $2e

Data_cee59: ; cee59
IF DEF(SUN)
	db $06, $06, $14, $14, $89, $28, $2c, $62, $04, $10, $00, $06, $0a, $00, $06, $06
	db $14, $14, $76, $29, $2d, $3f, $07, $10, $00, $06, $0a, $00, $06, $06, $14, $14
	db $8a, $2a, $2e, $08, $14, $14, $1e, $06, $0a, $00, $06, $06, $14, $14, $54, $2b
	db $2f, $4a, $20, $12, $00, $12, $0a, $00, $06, $06, $14, $14, $45, $2c, $30, $55
	db $0c, $0e, $0f, $13, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $86, $28, $2c, $77, $14, $0d, $1f, $12, $0a, $00, $06, $06
	db $14, $14, $2d, $29, $2d, $7b, $06, $06, $06, $06, $0a, $00, $06, $06, $14, $14
	db $87, $2a, $2e, $07, $14, $0d, $1f, $13, $0a, $00, $06, $06, $14, $14, $13, $2b
	db $2f, $08, $1f, $1e, $16, $12, $0a, $00, $06, $06, $14, $14, $8c, $2c, $30, $7b
	db $04, $04, $04, $13, $0a, $00
ENDC

Data_cee9f: ; cee9f
IF DEF(SUN)
	db $06, $06, $14, $14, $8a, $2c, $30, $08, $14, $14, $1e, $06, $0a, $00, $06, $06
	db $14, $14, $54, $2d, $31, $4a, $20, $12, $00, $12, $0a, $00, $06, $06, $14, $14
	db $45, $2e, $32, $55, $0c, $0e, $0f, $13, $0a, $00, $06, $06, $14, $14, $22, $2f
	db $33, $77, $0c, $0f, $00, $06, $0a, $00, $06, $06, $14, $14, $1e, $2f, $33, $7b
	db $23, $12, $00, $12, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $87, $2c, $30, $07, $14, $0d, $1f, $13, $0a, $00, $06, $06
	db $14, $14, $13, $2d, $31, $08, $1f, $1e, $16, $12, $0a, $00, $06, $06, $14, $14
	db $8c, $2e, $32, $7b, $04, $04, $04, $13, $0a, $00, $06, $06, $14, $14, $1a, $2f
	db $33, $7b, $04, $04, $00, $06, $0a, $00, $06, $06, $14, $14, $1e, $2f, $33, $7b
	db $23, $12, $00, $12, $0a, $00
ENDC

Data_ceee5: ; ceee5
IF DEF(SUN)
	db $06, $06, $14, $14, $45, $30, $34, $55, $0c, $08, $00, $12, $0a, $00, $06, $06
	db $14, $14, $22, $31, $35, $77, $0c, $0f, $00, $06, $0a, $00, $06, $06, $14, $14
	db $1e, $31, $35, $7b, $23, $12, $00, $13, $0a, $00, $06, $06, $14, $14, $1a, $32
	db $36, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $8c, $33, $37, $7b
	db $04, $04, $04, $14, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $8c, $30, $34, $7b, $04, $04, $04, $13, $0a, $00, $06, $06
	db $14, $14, $1a, $31, $35, $7b, $04, $04, $00, $06, $0a, $00, $06, $06, $14, $14
	db $1e, $31, $35, $7b, $23, $12, $00, $12, $0a, $00, $06, $06, $14, $14, $22, $32
	db $36, $77, $0c, $0f, $17, $07, $0a, $00, $06, $06, $14, $14, $45, $33, $37, $55
	db $0c, $0e, $0f, $14, $0a, $00
ENDC

Data_cef2b: ; cef2b
IF DEF(SUN)
	db $06, $06, $14, $14, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00, $06, $06
	db $14, $14, $1a, $34, $38, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14
	db $8c, $35, $39, $7b, $04, $04, $04, $15, $0a, $00, $06, $06, $14, $14, $13, $36
	db $3a, $08, $1f, $1e, $16, $14, $0a, $00, $06, $06, $14, $14, $2d, $36, $3a, $7b
	db $06, $06, $06, $07, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $1e, $33, $37, $7b, $23, $12, $00, $14, $0a, $00, $06, $06
	db $14, $14, $22, $34, $38, $77, $0c, $0f, $17, $07, $0a, $00, $06, $06, $14, $14
	db $45, $35, $39, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06, $14, $14, $54, $36
	db $3a, $4a, $20, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $76, $36, $3a, $3f
	db $07, $10, $00, $07, $0a, $00
ENDC

Data_cef71: ; cef71
IF DEF(SUN)
	db $06, $06, $14, $14, $8c, $37, $3b, $7b, $04, $04, $00, $14, $0a, $00, $06, $06
	db $14, $14, $13, $38, $3c, $08, $1f, $1e, $16, $15, $0a, $00, $06, $06, $14, $14
	db $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00, $06, $06, $14, $14, $89, $39
	db $3d, $62, $04, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $76, $3a, $3e, $3f
	db $07, $10, $00, $07, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $45, $37, $3b, $55, $0c, $0e, $0f, $14, $0a, $00, $06, $06
	db $14, $14, $54, $38, $3c, $4a, $20, $12, $00, $15, $0a, $00, $06, $06, $14, $14
	db $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $86, $39
	db $3d, $77, $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $2d, $3a, $3e, $7b
	db $06, $06, $06, $07, $0a, $00
ENDC

Data_cefb7: ; cefb7
IF DEF(SUN)
	db $06, $06, $14, $14, $2d, $38, $3c, $7b, $06, $06, $06, $07, $0a, $00, $06, $06
	db $14, $14, $89, $39, $3d, $62, $04, $10, $00, $07, $0a, $00, $06, $06, $14, $14
	db $76, $3a, $3e, $3f, $07, $10, $00, $07, $0a, $00, $06, $06, $14, $14, $8a, $3b
	db $3f, $08, $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14, $54, $3b, $3f, $4a
	db $20, $12, $00, $14, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $76, $38, $3c, $3f, $07, $10, $00, $07, $0a, $00, $06, $06
	db $14, $14, $86, $39, $3d, $77, $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14
	db $2d, $3a, $3e, $7b, $06, $06, $06, $07, $0a, $00, $06, $06, $14, $14, $87, $3b
	db $3f, $07, $14, $0d, $1f, $15, $0a, $00, $06, $06, $14, $14, $13, $3b, $3f, $08
	db $1f, $1e, $16, $14, $0a, $00
ENDC

Data_ceffd: ; ceffd
IF DEF(SUN)
	db $06, $06, $14, $14, $76, $3c, $40, $3f, $07, $10, $00, $07, $0a, $00, $06, $06
	db $14, $14, $8a, $3d, $41, $08, $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14
	db $54, $3d, $41, $4a, $20, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $45, $3e
	db $42, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06, $14, $14, $22, $3f, $43, $77
	db $0c, $0f, $00, $07, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $2d, $3c, $40, $7b, $06, $06, $06, $07, $0a, $00, $06, $06
	db $14, $14, $87, $3d, $41, $07, $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14
	db $13, $3d, $41, $08, $1f, $1e, $16, $15, $0a, $00, $06, $06, $14, $14, $8c, $3e
	db $42, $7b, $04, $04, $04, $14, $0a, $00, $06, $06, $14, $14, $1a, $3f, $43, $7b
	db $04, $04, $00, $07, $0a, $00
ENDC

Data_cf043: ; cf043
IF DEF(SUN)
	db $06, $06, $14, $14, $54, $3f, $43, $4a, $20, $12, $00, $14, $0a, $00, $06, $06
	db $14, $14, $45, $40, $44, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06, $14, $14
	db $22, $41, $45, $77, $0c, $0f, $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $42
	db $46, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $1a, $42, $46, $7b
	db $04, $04, $00, $07, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $13, $3f, $43, $08, $1f, $1e, $16, $14, $0a, $00, $06, $06
	db $14, $14, $8c, $40, $44, $7b, $04, $04, $04, $15, $0a, $00, $06, $06, $14, $14
	db $1a, $41, $45, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $1e, $41
	db $46, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14, $22, $42, $46, $77
	db $0c, $0f, $17, $07, $0a, $00
ENDC

Data_cf089: ; cf089
IF DEF(SUN)
	db $06, $06, $14, $14, $22, $43, $47, $77, $0c, $0f, $00, $07, $0a, $00, $06, $06
	db $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14
	db $1a, $44, $48, $7b, $04, $04, $00, $07, $0a, $00, $06, $06, $14, $14, $8c, $45
	db $49, $7b, $04, $04, $04, $15, $0a, $00, $06, $06, $14, $14, $13, $46, $4a, $08
	db $1f, $1e, $16, $14, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $1a, $43, $47, $7b, $04, $04, $00, $07, $0a, $00, $06, $06
	db $14, $14, $1e, $44, $48, $7b, $23, $12, $00, $14, $0a, $00, $06, $06, $14, $14
	db $22, $44, $48, $77, $0c, $0f, $17, $07, $0a, $00, $06, $06, $14, $14, $45, $45
	db $49, $55, $0c, $0e, $0f, $15, $0a, $00, $06, $06, $14, $14, $54, $46, $4a, $4a
	db $20, $12, $00, $14, $0a, $00
ENDC

Data_cf0cf: ; cf0cf
IF DEF(SUN)
	db $06, $06, $14, $14, $88, $45, $4b, $7b, $04, $04, $00, $07, $0a, $00, $06, $06
	db $14, $14, $89, $46, $4a, $62, $04, $10, $00, $07, $0a, $00, $06, $06, $14, $14
	db $8a, $47, $4b, $08, $14, $14, $1e, $07, $0a, $00, $06, $06, $14, $14, $06, $48
	db $4c, $34, $03, $03, $01, $14, $0a, $00, $06, $06, $14, $14, $08, $49, $4d, $62
	db $01, $13, $00, $15, $0a, $00, $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09
	db $00, $14, $0a, $00, $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $15
	db $0a, $00, $06, $06, $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $14, $0a, $00
	db $06, $06, $14, $14, $13, $49, $4d, $08, $1f, $1e, $16, $15, $0a, $00
ELIF DEF(STAR)
	db $06, $06, $14, $14, $85, $45, $4b, $7b, $14, $0d, $1f, $14, $0a, $00, $06, $06
	db $14, $14, $86, $46, $4a, $77, $14, $0d, $1f, $15, $0a, $00, $06, $06, $14, $14
	db $87, $47, $4b, $07, $14, $0d, $1f, $14, $0a, $00, $06, $06, $14, $14, $47, $48
	db $4c, $78, $07, $07, $07, $15, $0a, $00, $06, $06, $14, $14, $08, $49, $4d, $62
	db $01, $13, $00, $14, $0a, $00, $06, $06, $14, $14, $3c, $49, $4d, $4a, $07, $09
	db $00, $15, $0a, $00, $06, $06, $14, $14, $33, $49, $4d, $34, $07, $07, $14, $14
	db $0a, $00, $06, $06, $14, $14, $8e, $49, $4d, $7b, $0d, $0e, $13, $15, $0a, $00
	db $06, $06, $14, $14, $13, $49, $4d, $08, $1f, $1e, $16, $14, $0a, $00
ENDC

Func_cf14d:: ; cf14d (33:714d)
	ld a, [wSaveFileExists]
	or a
	jp nz, Func_cf163
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_cf163: ; cf163 (33:7163)
	ld a, [wc7de]
	cp $32
	jp nz, Func_cf173
	ld e, $1
	ld hl, $61
	scall EventFlagAction
Func_cf173: ; cf173 (33:7173)
	ld a, $2
	scall Func_80d01
	ld a, [wc7de]
	cp $2d
	jp z, Func_cf2b4
	cp $2c
	jp z, Func_cf2b4
	cp $2b
	jp z, Func_cf2b4
	cp $2a
	jp z, Func_cf2b4
	cp $29
	jp z, Func_cf2b4
	cp $28
	jp z, Func_cf2a9
	cp $27
	jp z, Func_cf2a9
	cp $26
	jp z, Func_cf2a9
	cp $25
	jp z, Func_cf2a9
	cp $24
	jp z, Func_cf2a9
	cp $23
	jp z, Func_cf29e
	cp $22
	jp z, Func_cf29e
	cp $21
	jp z, Func_cf29e
	cp $20
	jp z, Func_cf29e
	cp $1f
	jp z, Func_cf29e
	cp $1e
	jp z, Func_cf293
	cp $1d
	jp z, Func_cf293
	cp $1c
	jp z, Func_cf293
	cp $1b
	jp z, Func_cf293
	cp $1a
	jp z, Func_cf293
	cp $19
	jp z, Func_cf288
	cp $18
	jp z, Func_cf288
	cp $17
	jp z, Func_cf288
	cp $16
	jp z, Func_cf288
	cp $15
	jp z, Func_cf288
	cp $14
	jp z, Func_cf27d
	cp $13
	jp z, Func_cf27d
	cp $12
	jp z, Func_cf27d
	cp $11
	jp z, Func_cf27d
	cp $10
	jp z, Func_cf27d
	cp $f
	jp z, Func_cf272
	cp $e
	jp z, Func_cf272
	cp $d
	jp z, Func_cf272
	cp $c
	jp z, Func_cf272
	cp $b
	jp z, Func_cf272
	cp $a
	jp z, Func_cf267
	cp $9
	jp z, Func_cf267
	cp $8
	jp z, Func_cf267
	cp $7
	jp z, Func_cf267
	cp $6
	jp z, Func_cf267
	cp $5
	jp z, Func_cf25c
	cp $4
	jp z, Func_cf25c
	cp $3
	jp z, Func_cf25c
	cp $2
	jp z, Func_cf25c
	cp $1
	jp nz, Func_cf2bf
Func_cf25c: ; cf25c (33:725c)
	ld e, $5
	ld hl, Data_cee59
	scall LoadEncounters
	jp Func_cf2c7

Func_cf267: ; cf267 (33:7267)
	ld e, $5
	ld hl, Data_cee9f
	scall LoadEncounters
	jp Func_cf2c7

Func_cf272: ; cf272 (33:7272)
	ld e, $5
	ld hl, Data_ceee5
	scall LoadEncounters
	jp Func_cf2c7

Func_cf27d: ; cf27d (33:727d)
	ld e, $5
	ld hl, Data_cef2b
	scall LoadEncounters
	jp Func_cf2c7

Func_cf288: ; cf288 (33:7288)
	ld e, $5
	ld hl, Data_cef71
	scall LoadEncounters
	jp Func_cf2c7

Func_cf293: ; cf293 (33:7293)
	ld e, $5
	ld hl, Data_cefb7
	scall LoadEncounters
	jp Func_cf2c7

Func_cf29e: ; cf29e (33:729e)
	ld e, $5
	ld hl, Data_ceffd
	scall LoadEncounters
	jp Func_cf2c7

Func_cf2a9: ; cf2a9 (33:72a9)
	ld e, $5
	ld hl, Data_cf043
	scall LoadEncounters
	jp Func_cf2c7

Func_cf2b4: ; cf2b4 (33:72b4)
	ld e, $5
	ld hl, Data_cf089
	scall LoadEncounters
	jp Func_cf2c7

Func_cf2bf: ; cf2bf (33:72bf)
	ld e, $9
	ld hl, Data_cf0cf
	scall LoadEncounters
Func_cf2c7: ; cf2c7 (33:72c7)
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, Func_cf307
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
Func_cf307: ; cf307 (33:7307)
	ld e, $1
	ld hl, Data_cedca
	scall LoadWarps
	ld a, $8
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $32
	jp nz, Func_cf328
	writetext TreeBitstreamText_47e17
	jp Func_cf331

Func_cf328: ; cf328 (33:7328)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_cf331: ; cf331 (33:7331)
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

