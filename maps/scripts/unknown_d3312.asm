
Data_d3145: ; d3145
	warpdef $05, $09, $02, $01, MAP_01_00, $0c, $0c, $0c, $0d, SFX_34
	warpdef $05, $09, $02, $01, MAP_03_00, $17, $06, $17, $07, SFX_34
	warpdef $05, $09, $02, $01, MAP_05_00, $1e, $0b, $1e, $0c, SFX_34
	warpdef $05, $09, $02, $01, MAP_06_00, $15, $10, $15, $11, SFX_34
	warpdef $05, $09, $02, $01, MAP_11_00, $09, $0c, $09, $0d, SFX_34
	warpdef $05, $09, $02, $01, MAP_20_00, $07, $11, $07, $12, SFX_34
	warpdef $05, $09, $02, $01, MAP_21_00, $17, $0c, $17, $0d, SFX_34
	warpdef $05, $09, $02, $01, MAP_23_00, $14, $08, $14, $09, SFX_34
	warpdef $05, $09, $02, $01, MAP_24_00, $12, $13, $12, $14, SFX_34
	warpdef $05, $09, $02, $01, MAP_25_01, $20, $16, $20, $17, SFX_34
	warpdef $05, $09, $02, $01, MAP_29_00, $06, $0d, $06, $0e, SFX_34

Data_d31be:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_d31c2:
	dtext_tree_pointer TreeBitstreamText_46ee5
	dw -1

Data_d31c6:
	dtext_tree_pointer TreeBitstreamText_426de
	dw -1

Data_d31ca:
	dtext_tree_pointer TreeBitstreamText_4272e
	dw -1

Data_d31ce: ; d31ce
	person_event $10, $04, $05, $04, $01, $02, $02, $04, $00, Func_d341d, NULL
	person_event $00, $04, $06, $04, $01, $02, $02, $04, $00, Func_d342b, NULL

Data_d31ea: ; d31ea
	person_event $10, $04, $05, $04, $01, $02, $02, $04, $00, Func_d3439, NULL
	person_event $00, $04, $06, $04, $01, $02, $02, $04, $00, Func_d3439, NULL
	person_event $06, $04, $03, $03, $01, $02, $02, $04, $00, Func_d3439, NULL
	person_event $ff, $00, $02, $03, $01, $01, $00, $04, $00, Func_d3439, NULL
	person_event $07, $04, $08, $03, $01, $02, $02, $04, $00, Func_d3439, NULL
	person_event $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_d3439, NULL
	person_event $04, $04, $00, $03, $01, $01, $02, $04, $00, Func_d3439, NULL
	person_event $05, $04, $0b, $03, $01, $01, $02, $04, $00, Func_d3439, NULL

Data_d325a: ; d325a
	person_event $ff, $00, $00, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $01, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $0a, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $0b, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $00, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31c2
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $0a, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31be
	person_event $ff, $00, $0b, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d31c2

Data_d32ca: ; d32ca
	person_event $02, $04, $08, $05, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d31c6
	person_event $03, $04, $03, $05, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d31ca

Data_d32e6: ; d32e6
	map MAP_01_00
	db $0c, $0c

	map MAP_03_00
	db $17, $06

	map MAP_05_00
	db $1e, $0b

	map MAP_06_00
	db $15, $10

	map MAP_11_00
	db $09, $0c

	map MAP_20_00
	db $07, $11

	map MAP_21_00
	db $17, $0c

	map MAP_23_00
	db $14, $08

	map MAP_24_00
	db $12, $13

	map MAP_25_01
	db $20, $16

	map MAP_29_00
	db $06, $0d

Func_d3312:: ; d3312 (34:7312)
	ld c, $0
.asm_d3314 ; d3314 (34:7314)
	ld a, c
	cp $b
	jp nc, .asm_d337c
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_d3378
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
	ld de, Data_d3145
	add hl, de
	ld e, $1
	scall LoadWarps
	jp .asm_d337c

.asm_d3378 ; d3378 (34:7378)
	inc c
	jp .asm_d3314

.asm_d337c ; d337c (34:737c)
	ld a, [wBackupMapGroup]
	cp $1d
	jp nz, .asm_d33ed
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d33ed
	loadpeople $8, Data_d31ea
	ld a, [wc790]
	cp $3
	jp z, .asm_d33dc
	cp $4
	jp z, .asm_d33dc
	cp $5
	jp z, .asm_d33dc
	cp $6
	jp z, .asm_d33af
	cp $7
	jp nz, .asm_d33ea
.asm_d33af ; d33af (34:73af)
	hideperson $2
	hideperson $3
	hideperson $4
	hideperson $5
	hideperson $6
	hideperson $7
	jp .asm_d33ea

.asm_d33dc ; d33dc (34:73dc)
	hideperson $6
	hideperson $7
.asm_d33ea ; d33ea (34:73ea)
	jp .asm_d33f5

.asm_d33ed ; d33ed (34:73ed)
	loadpeople $2, Data_d31ce
.asm_d33f5 ; d33f5 (34:73f5)
	ld a, [wBackupMapGroup]
	cp $1
	jp nz, .asm_d340c
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_d340c
	loadpeople $2, Data_d32ca
.asm_d340c ; d340c (34:740c)
	loadpeople $8, Data_d325a
	playmusic SONG_CENTER
	scall Func_8001c
	ret

Func_d341d:
	ld a, e
	or a
	jp nz, .asm_d342a
	ld e, $2
	ld a, [wc789]
	scall Func_806a0
.asm_d342a ; d342a (34:742a)
	ret

Func_d342b:
	ld a, e
	or a
	jp nz, .asm_d3438
	ld e, $1
	ld a, [wc789]
	scall Func_806a0
.asm_d3438 ; d3438 (34:7438)
	ret

Func_d3439:
	cp $5
	jp z, .asm_d3448
	cp $3
	jp nz, .asm_d344d
	ld l, $2
	jp .asm_d344e

.asm_d3448 ; d3448 (34:7448)
	ld l, $4
	jp .asm_d344e

.asm_d344d ; d344d (34:744d)
	ld l, a
.asm_d344e ; d344e (34:744e)
	ld a, e
	or a
	jp nz, .asm_d34b0
	push hl
	ld a, l
	scall FacePlayer
	pop hl
	ld a, l
	cp $7
	jp z, .asm_d34a9
	cp $6
	jp z, .asm_d349f
	cp $4
	jp z, .asm_d3495
	cp $2
	jp z, .asm_d348b
	cp $1
	jp z, .asm_d3481
	or a
	jp nz, .asm_d34b0
	ld e, $2
	ld a, $d
	scall Func_806a0
	jp .asm_d34b0

.asm_d3481 ; d3481 (34:7481)
	ld e, $1
	ld a, $d
	scall Func_806a0
	jp .asm_d34b0

.asm_d348b ; d348b (34:748b)
	ld e, $2
	ld a, $e
	scall Func_806a0
	jp .asm_d34b0

.asm_d3495 ; d3495 (34:7495)
	ld e, $1
	ld a, $e
	scall Func_806a0
	jp .asm_d34b0

.asm_d349f ; d349f (34:749f)
	ld e, $2
	ld a, $f
	scall Func_806a0
	jp .asm_d34b0

.asm_d34a9 ; d34a9 (34:74a9)
	ld e, $1
	ld a, $f
	scall Func_806a0
.asm_d34b0 ; d34b0 (34:74b0)
	ret
