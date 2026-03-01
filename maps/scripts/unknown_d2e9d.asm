
Data_d2cf1: ; d2cf1
	warpdef $05, $09, $02, $01, MAP_01_00, $0c, $06, $0c, $07, SFX_34
	warpdef $05, $09, $02, $01, MAP_03_00, $14, $05, $14, $06, SFX_34
	warpdef $05, $09, $02, $01, MAP_05_00, $05, $07, $05, $08, SFX_34
	warpdef $05, $09, $02, $01, MAP_05_00, $1c, $07, $1c, $08, SFX_34
	warpdef $05, $09, $02, $01, MAP_06_00, $10, $05, $10, $06, SFX_34
	warpdef $05, $09, $02, $01, MAP_11_00, $1a, $07, $1a, $08, SFX_34
	warpdef $05, $09, $02, $01, MAP_20_00, $07, $0b, $07, $0c, SFX_34
	warpdef $05, $09, $02, $01, MAP_21_00, $0b, $0c, $0b, $0d, SFX_34
	warpdef $05, $09, $02, $01, MAP_23_00, $10, $08, $10, $09, SFX_34
	warpdef $05, $09, $02, $01, MAP_24_00, $0e, $13, $0e, $14, SFX_34
	warpdef $05, $09, $02, $01, MAP_25_01, $1d, $16, $1d, $17, SFX_34
	warpdef $05, $09, $02, $01, MAP_29_00, $16, $0d, $16, $0e, SFX_34

Data_d2d75: ; d2d75
	dtext_tree_pointer TreeBitstreamText_4257c
	dw -1

Data_d2d79:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_d2d7d:
	dtext_tree_pointer TreeBitstreamText_46ee5
	dw -1

Data_d2d81: ; d2d81
	dtext_tree_pointer TreeBitstreamText_42650
	dw -1

Data_d2d85: ; d2d85
	dtext_tree_pointer TreeBitstreamText_42617
	dw -1

Data_d2d89: ; d2d89
	dtext_tree_pointer TreeBitstreamText_425cb
	dw -1

Data_d2d8d: ; d2d8d
	person_event $10, $04, $05, $04, $01, $02, $02, $04, $00, Func_d3047, NULL

Data_d2d9b: ; d2d9b
	person_event $06, $04, $05, $04, $01, $02, $02, $04, $00, Func_d3055, NULL

Data_d2da9: ; d2da9
	person_event $10, $04, $05, $04, $01, $02, $02, $04, $00, Func_d30f9, NULL
	person_event $06, $04, $03, $03, $01, $02, $02, $04, $00, Func_d30f9, NULL
	person_event $ff, $00, $02, $03, $01, $01, $00, $04, $00, Func_d30f9, NULL
	person_event $07, $04, $08, $03, $01, $02, $02, $04, $00, Func_d30f9, NULL
	person_event $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_d30f9, NULL

Data_d2def: ; d2def
	person_event $ff, $00, $00, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $01, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $0a, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $0b, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $00, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d7d
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $0a, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d79
	person_event $ff, $00, $0b, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d2d7d

Data_d2e5f: ; d2e5f
	person_event $06, $04, $09, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_34, Data_d2d75

Data_d2e6d: ; d2e6d
	map MAP_01_00
	db $0c, $06

	map MAP_03_00
	db $14, $05

	map MAP_05_00
	db $05, $07

	map MAP_05_00
	db $1c, $07

	map MAP_06_00
	db $10, $05

	map MAP_11_00
	db $1a, $07

	map MAP_20_00
	db $07, $0b

	map MAP_21_00
	db $0b, $0c

	map MAP_23_00
	db $10, $08

	map MAP_24_00
	db $0e, $13

	map MAP_25_01
	db $1d, $16

	map MAP_29_00
	db $16, $0d

Func_d2e9d:: ; d2e9d (34:6e9d)
	ld c, $0
.asm_d2e9f: ; d2e9f (34:6e9f)
	ld a, c
	cp $c
	jp nc, .asm_d2f07
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_d2f03
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
	ld de, Data_d2cf1
	add hl, de
	ld e, $1
	scall LoadWarps
	jp .asm_d2f07

.asm_d2f03: ; d2f03 (34:6f03)
	inc c
	jp .asm_d2e9f

.asm_d2f07: ; d2f07 (34:6f07)
	loadpeople $8, Data_d2def
	ld a, [wBackupMapGroup]
	cp $1
	jp z, .asm_d2f2f
	ld a, [wBackupMapGroup]
	cp $5
	jp z, .asm_d2f2f
	ld a, [wBackupMapNumber]
	cp $15
	jp z, .asm_d2f2f
	ld a, [wBackupMapNumber]
	cp $19
	jp nz, .asm_d2f37
.asm_d2f2f: ; d2f2f (34:6f2f)
	loadpeople $1, Data_d2e5f
.asm_d2f37: ; d2f37 (34:6f37)
	ld a, [wBackupMapGroup]
	cp $15
	jp z, .asm_d2f5f
	cp $19
	jp z, .asm_d2f54
	cp $5
	jp nz, .asm_d2f6a
	ld de, Data_d2d81
	ld a, $8
	scall SetPersonTextPointer
	jp .asm_d2f72

.asm_d2f54: ; d2f54 (34:6f54)
	ld de, Data_d2d85
	ld a, $8
	scall SetPersonTextPointer
	jp .asm_d2f72

.asm_d2f5f: ; d2f5f (34:6f5f)
	ld de, Data_d2d89
	ld a, $8
	scall SetPersonTextPointer
	jp .asm_d2f72

.asm_d2f6a: ; d2f6a (34:6f6a)
	ld de, Data_d2d75
	ld a, $8
	scall SetPersonTextPointer
.asm_d2f72: ; d2f72 (34:6f72)
	ld a, [wBackupMapGroup]
	cp $5
	jp nz, .asm_d2fae
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d2fae
	ld a, [wBackupMapX]
	cp $5
	jp nz, .asm_d2fa3
	ld a, [wBackupMapY]
	cp $7
	jp nz, .asm_d2fa3
	loadpeople $1, Data_d2d9b
	hideperson $8
	jp .asm_d2fab

.asm_d2fa3: ; d2fa3 (34:6fa3)
	loadpeople $1, Data_d2d8d
.asm_d2fab: ; d2fab (34:6fab)
	jp .asm_d3019

.asm_d2fae: ; d2fae (34:6fae)
	ld a, [wBackupMapGroup]
	cp $1d
	jp nz, .asm_d3011
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d3011
	loadpeople $5, Data_d2da9
	ld a, [wc790]
	cp $3
	jp z, .asm_d3000
	cp $4
	jp z, .asm_d3000
	cp $5
	jp z, .asm_d3000
	cp $6
	jp z, .asm_d2fe1
	cp $7
	jp nz, .asm_d300e
.asm_d2fe1: ; d2fe1 (34:6fe1)
	hideperson $9
	hideperson $a
	hideperson $b
	hideperson $c
	jp .asm_d300e

.asm_d3000: ; d3000 (34:7000)
	hideperson $b
	hideperson $c
.asm_d300e: ; d300e (34:700e)
	jp .asm_d3019

.asm_d3011: ; d3011 (34:7011)
	loadpeople $1, Data_d2d8d
.asm_d3019: ; d3019 (34:7019)
	playmusic SONG_CENTER
	scall Func_8001c
	ld a, [wBackupMapGroup]
	cp $5
	jp nz, .asm_d3046
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d3046
	ld a, [wBackupMapX]
	cp $5
	jp nz, .asm_d3046
	ld a, [wBackupMapY]
	cp $7
	jp nz, .asm_d3046
	landmarksign TreeBitstreamText_465ae
.asm_d3046: ; d3046 (34:7046)
	ret

Func_d3047:
	ld a, e
	or a
	jp nz, .asm_d3054
	ld e, $0
	ld a, [wc789]
	scall Func_806a0
.asm_d3054: ; d3054 (34:7054)
	ret

Func_d3055:
	ld a, e
	or a
	jp nz, .asm_d30f8
	checkevent $1
	or a
	jp nz, .asm_d3086
	writetext TreeBitstreamText_3a8c3
	checkevent $f0
	cp $1
	jp nz, .asm_d3083
	writetext TreeBitstreamText_3a8e1
	setevent $1
.asm_d3083: ; d3083 (34:7083)
	jp .asm_d30f8

.asm_d3086: ; d3086 (34:7086)
	ld a, $e
	scall Func_80e5d
	or a
	jp nz, .asm_d3098
	writetext TreeBitstreamText_3a92f
	jp .asm_d30f8

.asm_d3098: ; d3098 (34:7098)
	checkevent $0
	or a
	jp nz, .asm_d30e9
	writetext_yesorno TreeBitstreamText_3a966
	or a
	jp nz, .asm_d30e0
	writetext TreeBitstreamText_3a995
	playsfx SFX_2A
	writetext TreeBitstreamText_3a9e8
	writetext TreeBitstreamText_3a9f3
	ld c, $1
	ld e, $1
	ld a, $e
	scall Func_80d4d
	ld c, $0
	ld e, $1
	ld a, $12
	scall Func_80d4d
	setevent $0
	jp .asm_d30e6

.asm_d30e0: ; d30e0 (34:70e0)
	writetext TreeBitstreamText_3a97f
.asm_d30e6: ; d30e6 (34:70e6)
	jp .asm_d30f8

.asm_d30e9: ; d30e9 (34:70e9)
	writetext TreeBitstreamText_3aa23
	ld c, $1
	ld e, $1
	ld a, $e
	scall Func_80d4d
.asm_d30f8: ; d30f8 (34:70f8)
	ret

Func_d30f9:
	cp $c
	jp z, .asm_d3108
	cp $a
	jp nz, .asm_d310d
	ld l, $9
	jp .asm_d310e

.asm_d3108: ; d3108 (34:7108)
	ld l, $b
	jp .asm_d310e

.asm_d310d: ; d310d (34:710d)
	ld l, a
.asm_d310e: ; d310e (34:710e)
	ld a, e
	or a
	jp nz, .asm_d3144
	push hl
	ld a, l
	scall FacePlayer
	pop hl
	ld a, l
	cp $b
	jp z, .asm_d313d
	cp $9
	jp z, .asm_d3133
	cp $8
	jp nz, .asm_d3144
	ld e, $0
	ld a, $d
	scall Func_806a0
	jp .asm_d3144

.asm_d3133: ; d3133 (34:7133)
	ld e, $0
	ld a, $e
	scall Func_806a0
	jp .asm_d3144

.asm_d313d: ; d313d (34:713d)
	ld e, $0
	ld a, $f
	scall Func_806a0
.asm_d3144: ; d3144 (34:7144)
	ret
