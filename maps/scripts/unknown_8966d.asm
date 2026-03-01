
Data_89432:
	warpdef $20, $0d, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $05, $07, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $1c, $07, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $1e, $0b, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $1e, $12, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $1c, $16, $01, $01, MAP_32_06, $06, $0c, $06, $0b, SFX_34
	warpdef $10, $06, $01, $01, MAP_05_30, $09, $13, $09, $12, SFX_34
	warpdef $05, $15, $01, $01, MAP_05_20, $09, $13, $09, $12, SFX_34

Data_8948a:
	warpdef $08, $0b, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $0a, $0e, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $0d, $14, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $10, $15, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $13, $14, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $16, $0e, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34
	warpdef $19, $0b, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34

Data_894d7:
	dtext_tree_pointer TreeBitstreamText_40de3
	dw -1

Data_894db:
	dtext_tree_pointer TreeBitstreamText_4105d
	dw -1

Data_894df:
	dtext_tree_pointer TreeBitstreamText_40ee8
	dw -1

Data_894e3:
	dtext_tree_pointer TreeBitstreamText_40e63
	dw -1

Data_894e7:
	dtext_tree_pointer TreeBitstreamText_40f67
	dw -1

Data_894eb:
	dtext_tree_pointer TreeBitstreamText_40fbf
	dw -1

Data_894ef:
	dtext_tree_pointer TreeBitstreamText_40e1f
	dw -1

Data_894f3:
	dtext_tree_pointer TreeBitstreamText_41013
	dw -1

Data_894f7:
	dtext_tree_pointer TreeBitstreamText_465b4
	dw -1

Data_894fb:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_894ff:
	dtext_tree_pointer TreeBitstreamText_41088
	dw -1

Data_89503:
	dtext_tree_pointer TreeBitstreamText_410cf
	dw -1

Data_89507:
	dtext_tree_pointer TreeBitstreamText_41102
	dw -1

Data_8950b:
	dtext_tree_pointer TreeBitstreamText_41136
	dw -1

MapObjects_8950f:
	person_event $00, $04, $17, $15, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894d7
	person_event $07, $04, $0e, $0a, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894db
	person_event $06, $04, $1a, $06, $01, $01, $01, $04, $00, PrintTextFacePlayer_22, Data_894df
	person_event $06, $04, $05, $0d, $01, $01, $01, $04, $00, PrintTextFacePlayer_22, Data_894e3
	person_event $06, $0c, $1f, $18, $01, $01, $03, $04, $00, PrintTextFacePlayer_22, Data_894e7
	person_event $ff, $00, $1f, $0c, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f7
	person_event $ff, $00, $1f, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f7
	person_event $02, $04, $0d, $16, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894eb
	person_event $05, $04, $11, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894ef
	person_event $00, $04, $1d, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f3
	person_event $07, $04, $13, $07, $01, $01, $03, $04, $00, Func_896f7, NULL

MapObjects_895a9:
	person_event $ff, $00, $08, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $0d, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $10, $15, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $13, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $16, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	person_event $ff, $00, $19, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb

MapObjects_8960b:
	person_event $ff, $00, $08, $0b, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $0a, $0e, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $0d, $14, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $10, $15, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $13, $14, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $16, $0e, $01, $01, $00, $04, $01, Func_89996, NULL
	person_event $ff, $00, $19, $0b, $01, $01, $00, $04, $01, Func_89996, NULL

Func_8966d:: ; 8966d
	ld a, $01
	ld [wc789], a
	ld a, $03
	ld [wc7e2], a
	call Func_89959
	ld hl, Func_89959
	scall Func_80f11
	playmusic SONG_TOWN1
	ld a, $01
	scall LoadPlayerSprite
	ld a, [wc790]
	or a
	jp z, .asm_896db
	ld a, [wc790]
	cp $07
	jp nc, .asm_896db
	loadwarps $08, Data_89432
	loadwarps $07, Data_8948a
	loadpeople $0b, MapObjects_8950f
	loadpeople $07, MapObjects_8960b
	ld de, Data_8950b
	xor a
	scall SetPersonTextPointer
	ld de, Data_89503
	ld a, $01
	scall SetPersonTextPointer
	ld de, Data_89507
	ld a, $03
	scall SetPersonTextPointer
	ld de, Data_894ff
	ld a, $09
	scall SetPersonTextPointer
	jp .asm_896f3
.asm_896db:
	loadwarps $08, Data_89432
	loadpeople $0b, MapObjects_8950f
	loadpeople $07, MapObjects_895a9
.asm_896f3:
	scall Func_8001c
	ret

Func_896f7:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	if_true .asm_8992c
	face_player -$03
	ld a, [wc796]
	cp $01
	jp nz, .asm_89792
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_8978f
	writenpctext TreeBitstreamText_442ef
	ld a, $26
	scall Func_80e7d
	cp $01
	jp nz, .asm_89786
	writenpctext TreeBitstreamText_44392
	writetext_yesorno TreeBitstreamText_458e0
	if_true .asm_89775
	playsfx $68
	writenpctext TreeBitstreamText_443c5
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $13
	scall GiveRobot
	ld a, $02
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_89783
.asm_89775:
	playsfx $69
	writenpctext TreeBitstreamText_4445d
	jp .asm_8992c
.asm_89783:
	jp .asm_8978f
.asm_89786:
	writetext TreeBitstreamText_45a40
	jp .asm_8992c
.asm_8978f:
	jp .asm_898d7
.asm_89792:
	ld a, [wc796]
	cp $09
	jp nz, .asm_8981c
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_89819
	writenpctext TreeBitstreamText_442ef
	ld a, $69
	scall Func_80e7d
	cp $01
	jp nz, .asm_89810
	writenpctext TreeBitstreamText_44507
	writetext_yesorno TreeBitstreamText_458e0
	if_true .asm_897ff
	playsfx $68
	writenpctext TreeBitstreamText_4453d
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $6f
	scall GiveRobot
	ld a, $0a
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_8980d
.asm_897ff:
	playsfx $69
	writenpctext TreeBitstreamText_4445d
	jp .asm_8992c
.asm_8980d:
	jp .asm_89819
.asm_89810:
	writetext TreeBitstreamText_45a40
	jp .asm_8992c
.asm_89819:
	jp .asm_898d7
.asm_8981c:
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_89836
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_898d7
.asm_89836:
	ld a, [wc796]
	cp $08
	jp z, .asm_898bf
	cp $06
	jp z, .asm_898bf
	cp $0a
	jp z, .asm_898b0
	cp $05
	jp z, .asm_898b0
	cp $0c
	jp z, .asm_898a1
	cp $04
	jp z, .asm_898a1
	cp $0d
	jp z, .asm_89892
	cp $03
	jp z, .asm_89892
	cp $0b
	jp z, .asm_89883
	cp $02
	jp z, .asm_89883
	cp $07
	jp z, .asm_89874
	if_true .asm_898ce
.asm_89874:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45abb
	jp .asm_898d4
.asm_89883:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp .asm_898d4
.asm_89892:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp .asm_898d4
.asm_898a1:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp .asm_898d4
.asm_898b0:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp .asm_898d4
.asm_898bf:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b20
	jp .asm_898d4
.asm_898ce:
	writenpctext TreeBitstreamText_442ef
.asm_898d4:
	jp .asm_8992c
.asm_898d7:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_8992c
	ld a, [wc796]
	cp $0a
	jp nc, .asm_898fe
	ld a, [wc796]
	cp $02
	jp c, .asm_898fe
	writenpctext TreeBitstreamText_442ef
	writenpctext TreeBitstreamText_44486
	jp .asm_8992c
.asm_898fe:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_8990f
	writenpctext TreeBitstreamText_442ef
	jp .asm_8992c
.asm_8990f:
	ld a, [wc796]
	cp $0a
	jp c, .asm_89920
	writenpctext TreeBitstreamText_445b1
	jp .asm_8992c
.asm_89920:
	writenpctext TreeBitstreamText_442ef
	writenpctext TreeBitstreamText_4434a
.asm_8992c:
	pop bc
	pop bc
	ret

Data_8992f:
	db $05, $07, $01, $01, $08, $0b

Data_89935:
	db $05, $07, $01, $01, $0a, $0e

Data_8993b:
	db $05, $07, $01, $01, $0d, $14

Data_89941:
	db $05, $07, $01, $01, $10, $15

Data_89947:
	db $05, $07, $01, $01, $13, $14

Data_8994d:
	db $05, $07, $01, $01, $16, $0e

Data_89953:
	db $05, $07, $01, $01, $19, $0b

Func_89959:
	ld a, [wc790]
	or a
	jp z, .asm_89995
	ld a, [wc790]
	cp $07
	jp nc, .asm_89995
	ld hl, Data_8992f
	scall Func_80d9b
	ld hl, Data_89935
	scall Func_80d9b
	ld hl, Data_8993b
	scall Func_80d9b
	ld hl, Data_89941
	scall Func_80d9b
	ld hl, Data_89947
	scall Func_80d9b
	ld hl, Data_8994d
	scall Func_80d9b
	ld hl, Data_89953
	scall Func_80d9b
	scall Func_80f02
.asm_89995:
	ret

Func_89996:	ld a, e
	cp $02
	jp nz, .asm_89a02
	ld a, [wMapX]
	add a, $05
	cp $19
	jp z, .asm_899f4
	cp $16
	jp z, .asm_899ec
	cp $13
	jp z, .asm_899e4
	cp $10
	jp z, .asm_899dc
	cp $0d
	jp z, .asm_899d4
	cp $0a
	jp z, .asm_899cc
	cp $08
	jp nz, .asm_899fc
	ld a, $04
	ld [wc78a], a
	jp .asm_89a02
.asm_899cc:
	ld a, $08
	ld [wc78a], a
	jp .asm_89a02
.asm_899d4:
	ld a, $0a
	ld [wc78a], a
	jp .asm_89a02
.asm_899dc:
	ld a, $0e
	ld [wc78a], a
	jp .asm_89a02
.asm_899e4:
	ld a, $0b
	ld [wc78a], a
	jp .asm_89a02
.asm_899ec:
	ld a, $09
	ld [wc78a], a
	jp .asm_89a02
.asm_899f4:
	ld a, $05
	ld [wc78a], a
	jp .asm_89a02
.asm_899fc:
	writetext DummyTextTreeBitstream_001
.asm_89a02:
	ret
