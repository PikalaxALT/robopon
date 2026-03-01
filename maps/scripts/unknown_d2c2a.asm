
Data_d2b25: ; d2b25
	warpdef $06, $0c, $02, $01, MAP_01_00, $1e, $06, $1e, $07, $34
	warpdef $06, $0c, $02, $01, MAP_03_00, $15, $0f, $15, $10, $34
	warpdef $06, $0c, $02, $01, MAP_05_00, $1c, $16, $1c, $17, $34
	warpdef $06, $0c, $02, $01, MAP_21_00, $18, $14, $18, $15, $34
	warpdef $06, $0c, $02, $01, MAP_24_00, $18, $1a, $18, $1b, $34
	warpdef $06, $0c, $02, $01, MAP_29_00, $14, $13, $14, $14, $34
	warpdef $06, $0c, $02, $01, MAP_25_01, $08, $0e, $08, $0f, $34

Data_d2b72:
	dtext_tree_pointer TreeBitstreamText_46ea4
	dw -1

Data_d2b76:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_d2b7a:
	dtext_tree_pointer TreeBitstreamText_424a9
	dw -1

Data_d2b7e:
	dtext_tree_pointer TreeBitstreamText_4251f
	dw -1

Data_d2b82: ; d2b82
	person_event $0a, $04, $08, $04, $01, $01, $02, $04, $00, Func_d2cc3, NULL
	person_event $06, $04, $00, $05, $01, $01, $02, $04, $00, Func_d2cc3, NULL
	person_event $ff, $00, $00, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b76
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b76
	person_event $ff, $00, $0c, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b72
	person_event $ff, $00, $0d, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b72
	person_event $ff, $00, $0c, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b72
	person_event $ff, $00, $0d, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2b72

Data_d2bf2: ; d2bf2
	person_event $00, $04, $06, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_34, Data_d2b7a
	person_event $01, $04, $03, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d2b7e

Data_d2c0e: ; d2c0e
	db $01, $00, $1e, $06
	db $03, $00, $15, $0f
	db $05, $00, $1c, $16
	db $15, $00, $18, $14
	db $18, $00, $18, $1a
	db $1d, $00, $14, $13
	db $19, $01, $08, $0e

Func_d2c2a:: ; d2c2a (34:6c2a)
	ld c, $0
.asm_d2c2c: ; d2c2c (34:6c2c)
	ld a, c
	cp $7
	jp nc, .asm_d2c9b
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_d2c97
	push bc
	ld l, c
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
	ld de, Data_d2b25
	add hl, de
	ld e, $1
	scall LoadWarps
	pop bc
	ld a, c
	inc a
	ld [wCurShop], a
	jp .asm_d2c9b

.asm_d2c97: ; d2c97 (34:6c97)
	inc c
	jp .asm_d2c2c

.asm_d2c9b: ; d2c9b (34:6c9b)
	loadpeople $8, Data_d2b82
	ld a, [wBackupMapGroup]
	cp $1
	jp nz, .asm_d2cba
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d2cba
	loadpeople $2, Data_d2bf2
.asm_d2cba: ; d2cba (34:6cba)
	playmusic SONG_CENTER
	scall Func_8001c
	ret

Func_d2cc3:
	push af
	ld a, e
	or a
	jp nz, .asm_d2cef
	face_player -$1
	writenpctext TreeBitstreamText_470a2
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, .asm_d2ce7
	ld e, $3
	ld a, [wCurShop]
	scall Func_806a0
	jp .asm_d2cef

.asm_d2ce7: ; d2ce7 (34:6ce7)
	ld e, $4
	ld a, [wCurShop]
	scall Func_806a0
.asm_d2cef: ; d2cef (34:6cef)
	pop bc
	ret
