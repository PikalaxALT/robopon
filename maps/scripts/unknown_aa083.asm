
Data_a9f89:
	warpdef $05, $08, $01, $01, MAP_24_15, $02, $05, $02, $06, SFX_2E
	warpdef $05, $08, $01, $01, MAP_24_16, $0f, $05, $0e, $05, SFX_2E
	warpdef $05, $08, $01, $01, MAP_24_17, $15, $12, $15, $11, SFX_2E
	warpdef $05, $08, $01, $01, MAP_24_19, $02, $12, $02, $11, SFX_2E
	warpdef $05, $08, $01, $01, MAP_24_20, $02, $05, $03, $05, SFX_2E
	warpdef $05, $08, $01, $01, MAP_24_21, $15, $05, $15, $06, SFX_2E

Data_a9fcb:
	db $71, $02, $06, $01, $2d
	db $72, $03, $06, $01, $2b
	db $73, $04, $06, $01, $2d

Data_a9fda:
	db $74, $02, $06, $01, $2c
	db $75, $03, $06, $01, $2d
	db $76, $04, $06, $01, $2e

Data_a9fe9:
	db $77, $02, $06, $01, $2d
	db $78, $03, $06, $01, $2d
	db $79, $04, $06, $01, $2b

Data_a9ff8:
	db $7a, $02, $06, $01, $2e
	db $7b, $03, $06, $01, $2c
	db $7c, $04, $06, $01, $2d

Data_aa007:
	db $7d, $02, $06, $01, $2b
	db $7e, $03, $06, $01, $2d
	db $7f, $04, $06, $01, $2e

Data_aa016:
	db $80, $02, $06, $01, $2d
	db $81, $03, $06, $01, $2d
	db $82, $04, $06, $01, $2c

Data_aa025:
IF DEF(SUN)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_aa06b:
	map MAP_24_15
	db $02, $05

	map MAP_24_16
	db $0f, $05

	map MAP_24_17
	db $15, $12

	map MAP_24_19
	db $02, $12

	map MAP_24_20
	db $02, $05

	map MAP_24_21
	db $15, $05

Func_aa083:: ; aa083
	ld c, $00
.asm_aa085:
	ld a, c
	cp $06
	jp nc, .asm_aa0ed
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
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
	ld de, Data_a9f89
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_aa0ed
.asm_aa0e9:
	inc c
	jp .asm_aa085
.asm_aa0ed:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa108
	ld a, [wBackupMapNumber]
	cp $0f
	jp nz, .asm_aa108
	ld e, $03
	ld hl, Data_a9fcb
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa108:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa123
	ld a, [wBackupMapNumber]
	cp $10
	jp nz, .asm_aa123
	ld e, $03
	ld hl, Data_a9fda
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa123:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa13e
	ld a, [wBackupMapNumber]
	cp $11
	jp nz, .asm_aa13e
	ld e, $03
	ld hl, Data_a9fe9
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa13e:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa159
	ld a, [wBackupMapNumber]
	cp $13
	jp nz, .asm_aa159
	ld e, $03
	ld hl, Data_a9ff8
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa159:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa174
	ld a, [wBackupMapNumber]
	cp $14
	jp nz, .asm_aa174
	ld e, $03
	ld hl, Data_aa007
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa174:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa18c
	ld a, [wBackupMapNumber]
	cp $15
	jp nz, .asm_aa18c
	ld e, $03
	ld hl, Data_aa016
	scall Func_80ce7
.asm_aa18c:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aa025
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret
