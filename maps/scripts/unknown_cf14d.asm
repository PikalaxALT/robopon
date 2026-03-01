
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
