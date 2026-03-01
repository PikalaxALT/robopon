
Data_ba025:
	warpdef $01, $0a, $02, $01, MAP_00_00, $09, $07, $09, $08, SFX_34
	warpdef $01, $0a, $02, $01, MAP_01_00, $11, $06, $11, $07, SFX_34
	warpdef $01, $0a, $02, $01, MAP_01_00, $19, $06, $19, $07, SFX_34
	warpdef $01, $0a, $02, $01, MAP_06_00, $0e, $12, $0e, $13, SFX_34
	warpdef $01, $0a, $02, $01, MAP_06_00, $1c, $0e, $1c, $0f, SFX_34
	warpdef $01, $0a, $02, $01, MAP_23_00, $0b, $05, $0b, $06, SFX_34
	warpdef $01, $0a, $02, $01, MAP_23_00, $20, $0e, $20, $0f, SFX_34
	warpdef $01, $0a, $02, $01, MAP_24_00, $09, $10, $09, $11, SFX_34
	warpdef $01, $0a, $02, $01, MAP_24_00, $1e, $19, $1e, $1a, SFX_34

Data_ba088:
	db $66, $07, $02, $11, $2b
	db $67, $09, $02, $11, $2d

Data_ba092:
	db $68, $07, $02, $11, $2b
	db $69, $09, $02, $11, $2e

Data_ba09c:
	dtext_tree_pointer TreeBitstreamText_4593e
	dw -1

Data_ba0a0:
	dtext_tree_pointer TreeBitstreamText_40164
	dw -1

Data_ba0a4:
	dtext_tree_pointer TreeBitstreamText_40000
	dw -1

Data_ba0a8:
	dtext_tree_pointer TreeBitstreamText_4163b
	dw -1

Data_ba0ac:
	dtext_tree_pointer TreeBitstreamText_414f9
	dw -1

Data_ba0b0:
	dtext_tree_pointer TreeBitstreamText_41f0a
	dw -1

Data_ba0b4:
	dtext_tree_pointer TreeBitstreamText_41eb0
	dw -1

Data_ba0b8:
	dtext_tree_pointer TreeBitstreamText_42324
	dw -1

Data_ba0bc:
	dtext_tree_pointer TreeBitstreamText_42239
	dw -1

Data_ba0c0:
	dtext_tree_pointer TreeBitstreamText_401e1
	dw -1

Data_ba0c4:
	dtext_tree_pointer TreeBitstreamText_4003e
	dw -1

Data_ba0c8:
	dtext_tree_pointer TreeBitstreamText_4161d
	dw -1

Data_ba0cc:
	dtext_tree_pointer TreeBitstreamText_415f3
	dw -1

Data_ba0d0:
	dtext_tree_pointer TreeBitstreamText_4157e
	dw -1

Data_ba0d4:
	dtext_tree_pointer TreeBitstreamText_41ff4
	dw -1

Data_ba0d8:
	dtext_tree_pointer TreeBitstreamText_41ec7
	dw -1

Data_ba0dc:
	dtext_tree_pointer TreeBitstreamText_42364
	dw -1

Data_ba0e0:
	dtext_tree_pointer TreeBitstreamText_4225d
	dw -1

Data_ba0e4:
	dtext_tree_pointer TreeBitstreamText_46eb8
	dw -1

Data_ba0e8:
	dtext_tree_pointer TreeBitstreamText_46e84
	dw -1

Data_ba0ec:
	dtext_tree_pointer TreeBitstreamText_46e95
	dw -1

Data_ba0f0:
	dtext_tree_pointer TreeBitstreamText_401ae
	dw -1

Data_ba0f4:
	dtext_tree_pointer TreeBitstreamText_4001a
	dw -1

Data_ba0f8:
	dtext_tree_pointer TreeBitstreamText_4006b
	dw -1

Data_ba0fc:
	dtext_tree_pointer TreeBitstreamText_459de
	dw -1

Data_ba100:
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba09c
	person_event $02, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0fc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba162:
	person_event $03, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0a0
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba1c4:
	person_event $03, $04, $05, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0a4
	person_event $0a, $04, $0a, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0c4
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba226:
	person_event $00, $04, $0b, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0a8
	person_event $07, $04, $05, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c8
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba288:
	person_event $02, $04, $01, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ac
	person_event $05, $04, $09, $05, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0cc
	person_event $06, $04, $0d, $09, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba2f8:
	person_event $0e, $04, $01, $08, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0b0
	person_event $02, $04, $0c, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d4
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba33e:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0b4
	person_event $03, $04, $09, $05, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0d8
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba384:
	person_event $0e, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0b8
	person_event $02, $04, $04, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0dc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba3e6:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0bc
	person_event $03, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba448:
	map MAP_00_00
	db $09, $07

	map MAP_01_00
	db $11, $06

	map MAP_01_00
	db $19, $06

	map MAP_06_00
	db $0e, $12

	map MAP_06_00
	db $1c, $0e

	map MAP_23_00
	db $0b, $05

	map MAP_23_00
	db $20, $0e

	map MAP_24_00
	db $09, $10

	map MAP_24_00
	db $1e, $19

Func_ba46c:: ; ba46c
	ld c, $00
.asm_ba46e:
	ld a, c
	cp $09
	jp nc, .asm_ba4d6
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_ba4d2
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
	ld de, Data_ba025
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_ba4d6
.asm_ba4d2:
	inc c
	jp .asm_ba46e
.asm_ba4d6:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ba4ff
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba4ff
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_ba4fc
	ld a, [wBackupMapY]
	cp $07
	jp nz, .asm_ba4fc
	loadpeople $07, Data_ba100
.asm_ba4fc:
	jp .asm_ba654
.asm_ba4ff:
	ld a, [wBackupMapGroup]
	cp $01
	jp nz, .asm_ba578
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba578
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_ba53f
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_ba53f
	loadpeople $07, Data_ba162
	ld a, [wc790]
	or a
	jp z, .asm_ba53c
	ld a, [wc790]
	cp $04
	jp nz, .asm_ba53c
	ld de, Data_ba0f0
	xor a
	scall SetPersonTextPointer
.asm_ba53c:
	jp .asm_ba575
.asm_ba53f:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_ba575
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_ba575
	loadpeople $07, Data_ba1c4
	ld a, [wc790]
	or a
	jp z, .asm_ba575
	ld a, [wc790]
	cp $04
	jp nz, .asm_ba575
	ld de, Data_ba0f4
	xor a
	scall SetPersonTextPointer
	ld de, Data_ba0f8
	ld a, $01
	scall SetPersonTextPointer
.asm_ba575:
	jp .asm_ba654
.asm_ba578:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_ba5bd
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba5bd
	ld a, [wBackupMapX]
	cp $0e
	jp nz, .asm_ba5a2
	ld a, [wBackupMapY]
	cp $12
	jp nz, .asm_ba5a2
	loadpeople $07, Data_ba226
	jp .asm_ba5ba
.asm_ba5a2:
	ld a, [wBackupMapX]
	cp $1c
	jp nz, .asm_ba5ba
	ld a, [wBackupMapY]
	cp $0e
	jp nz, .asm_ba5ba
	loadpeople $08, Data_ba288
.asm_ba5ba:
	jp .asm_ba654
.asm_ba5bd:
	ld a, [wBackupMapGroup]
	cp $17
	jp nz, .asm_ba612
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba612
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_ba5ef
	ld a, [wBackupMapY]
	cp $05
	jp nz, .asm_ba5ef
	loadpeople $05, Data_ba2f8
	ld e, $02
	ld hl, Data_ba088
	scall Func_80ce7
	jp .asm_ba60f
.asm_ba5ef:
	ld a, [wBackupMapX]
	cp $20
	jp nz, .asm_ba60f
	ld a, [wBackupMapY]
	cp $0e
	jp nz, .asm_ba60f
	loadpeople $05, Data_ba33e
	ld e, $02
	ld hl, Data_ba092
	scall Func_80ce7
.asm_ba60f:
	jp .asm_ba654
.asm_ba612:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_ba654
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba654
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_ba63c
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_ba63c
	loadpeople $07, Data_ba384
	jp .asm_ba654
.asm_ba63c:
	ld a, [wBackupMapX]
	cp $1e
	jp nz, .asm_ba654
	ld a, [wBackupMapY]
	cp $19
	jp nz, .asm_ba654
	loadpeople $07, Data_ba3e6
.asm_ba654:
	scall Func_8001c
	playmusic SONG_TOWN3
	ret
