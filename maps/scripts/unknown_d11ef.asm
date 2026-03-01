
Data_d10b4:
	warpdef $0f, $20, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $0f, $04, $01, $01, MAP_29_01, $0a, $11, $0a, $10, SFX_2E
	warpdef $06, $0d, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_2E
	warpdef $14, $13, $01, $01, MAP_32_06, $07, $0c, $07, $0b, SFX_2E
	warpdef $16, $0d, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_2E
	warpdef $13, $08, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_2E
	warpdef $08, $13, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_2E
	warpdef $0a, $19, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_2E
	warpdef $12, $19, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_2E

Data_d1117:
	dtext_tree_pointer TreeBitstreamText_46740
	dw -1

Data_d111b:
	dtext_tree_pointer TreeBitstreamText_4672b
	dw -1

Data_d111f:
	dtext_tree_pointer TreeBitstreamText_46e1d
	dtext_tree_pointer TreeBitstreamText_46e3b
	dtext_tree_pointer TreeBitstreamText_46e4b
	dw -1

Data_d1127:
	dtext_tree_pointer TreeBitstreamText_473b2
	dw -1

Data_d112b:
	dtext_tree_pointer TreeBitstreamText_475a7
	dw -1

Data_d112f:
	dtext_tree_pointer TreeBitstreamText_47416
	dw -1

Data_d1133:
	dtext_tree_pointer TreeBitstreamText_475f4
	dw -1

Data_d1137:
	dtext_tree_pointer TreeBitstreamText_474d4
	dw -1

Data_d113b:
	dtext_tree_pointer TreeBitstreamText_4734f
	dw -1

Data_d113f:
	db $1a, $19, $05

Data_d1142:
	db $1a, $19, $05, $00, $00

Data_d1147:
	person_event $03, $04, $19, $07, $01, $01, $01, $04, $00, Func_d121f, NULL
	person_event $ff, $00, $0e, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d1117
	person_event $ff, $00, $0e, $1f, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d111b
	person_event $ff, $00, $10, $1f, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d111b
	person_event $00, $04, $18, $05, $01, $01, $03, $04, $00, Func_806dd_34, Data_d113f
	person_event $ff, $00, $0f, $0d, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_34, Data_d111f
	person_event $00, $04, $11, $1c, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d1127
	person_event $02, $04, $0d, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d112b
	person_event $01, $04, $12, $0b, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d112f
	person_event $06, $04, $0b, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_34, Data_d1133
	person_event $04, $04, $08, $1c, $01, $01, $03, $04, $00, PrintTextFacePlayer_34, Data_d1137
	person_event $01, $04, $10, $15, $01, $01, $02, $04, $00, PrintTextFacePlayer_34, Data_d113b

Func_d11ef:: ; d11ef (34:51ef)
	ld a, $d
	ld [wc789], a
	ld a, $12
	ld [wc7e2], a
	ld e, $1
	ld hl, Data_d1142
	scall Func_80ce7
	loadwarps $9, Data_d10b4
	loadpeople $c, Data_d1147
	ld a, $1
	scall LoadPlayerSprite
	playmusic SONG_TOWN2
	scall Func_8001c
	ret

Func_d121f:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_d1454
	face_player -$3
	ld a, [wc796]
	cp $6
	jp nz, .asm_d12ba
	ld a, $4e
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, .asm_d12b7
	writenpctext TreeBitstreamText_45564
	ld a, $4e
	scall Func_80e7d
	cp $1
	jp nz, .asm_d12ae
	writenpctext TreeBitstreamText_4560f
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_d129d
	playsfx $68
	writenpctext TreeBitstreamText_4565b
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $0
	ld e, $1
	ld hl, sp+$3
	ld a, [hl]
	scall GiveRobot
	pop af
	give_robot SUBRIO, a, $0
	ld a, $7
	ld [wc796], a
	ld hl, sp+$0
	ld [hl], $1
	jp .asm_d12ab

.asm_d129d: ; d129d (34:529d)
	playsfx $69
	writenpctext TreeBitstreamText_456f4
	jp .asm_d1454

.asm_d12ab: ; d12ab (34:52ab)
	jp .asm_d12b7

.asm_d12ae: ; d12ae (34:52ae)
	writetext TreeBitstreamText_45a40
	jp .asm_d1454

.asm_d12b7: ; d12b7 (34:52b7)
	jp .asm_d13ff

.asm_d12ba: ; d12ba (34:52ba)
	ld a, [wc796]
	cp $8
	jp nz, .asm_d1344
	ld a, $51
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, .asm_d1341
	writenpctext TreeBitstreamText_45564
	ld a, $51
	scall Func_80e7d
	cp $1
	jp nz, .asm_d1338
	writenpctext TreeBitstreamText_45794
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_d1327
	playsfx $68
	writenpctext TreeBitstreamText_457de
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $0
	ld e, $1
	ld hl, sp+$3
	ld a, [hl]
	scall GiveRobot
	pop af
	give_robot VIPER, a, $0
	ld a, $9
	ld [wc796], a
	ld hl, sp+$0
	ld [hl], $1
	jp .asm_d1335

.asm_d1327: ; d1327 (34:5327)
	playsfx $69
	writenpctext TreeBitstreamText_456f4
	jp .asm_d1454

.asm_d1335: ; d1335 (34:5335)
	jp .asm_d1341

.asm_d1338: ; d1338 (34:5338)
	writetext TreeBitstreamText_45a40
	jp .asm_d1454

.asm_d1341: ; d1341 (34:5341)
	jp .asm_d13ff

.asm_d1344: ; d1344 (34:5344)
	ld a, $4e
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp nz, .asm_d135e
	ld a, $51
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, .asm_d13ff
.asm_d135e: ; d135e (34:535e)
	ld a, [wc796]
	cp $7
	jp z, .asm_d13e7
	or a
	jp z, .asm_d13e7
	cp $a
	jp z, .asm_d13d8
	cp $5
	jp z, .asm_d13d8
	cp $c
	jp z, .asm_d13c9
	cp $4
	jp z, .asm_d13c9
	cp $d
	jp z, .asm_d13ba
	cp $3
	jp z, .asm_d13ba
	cp $b
	jp z, .asm_d13ab
	cp $2
	jp z, .asm_d13ab
	cp $9
	jp z, .asm_d139c
	cp $1
	jp nz, .asm_d13f6
.asm_d139c: ; d139c (34:539c)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp .asm_d13fc

.asm_d13ab: ; d13ab (34:53ab)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp .asm_d13fc

.asm_d13ba: ; d13ba (34:53ba)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp .asm_d13fc

.asm_d13c9: ; d13c9 (34:53c9)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp .asm_d13fc

.asm_d13d8: ; d13d8 (34:53d8)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp .asm_d13fc

.asm_d13e7: ; d13e7 (34:53e7)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45abb
	jp .asm_d13fc

.asm_d13f6: ; d13f6 (34:53f6)
	writenpctext TreeBitstreamText_45564
.asm_d13fc: ; d13fc (34:53fc)
	jp .asm_d1454

.asm_d13ff: ; d13ff (34:53ff)
	ld hl, sp+$0
	ld a, [hl]
	cp $ff
	jp nz, .asm_d1454
	ld a, [wc796]
	cp $9
	jp nc, .asm_d1426
	ld a, [wc796]
	cp $7
	jp c, .asm_d1426
	writenpctext TreeBitstreamText_45564
	writenpctext TreeBitstreamText_45728
	jp .asm_d1454

.asm_d1426: ; d1426 (34:5426)
	ld a, [wc796]
	cp $f
	jp nz, .asm_d1437
	writenpctext TreeBitstreamText_45564
	jp .asm_d1454

.asm_d1437: ; d1437 (34:5437)
	ld a, [wc796]
	cp $9
	jp c, .asm_d1448
	writenpctext TreeBitstreamText_45875
	jp .asm_d1454

.asm_d1448: ; d1448 (34:5448)
	writenpctext TreeBitstreamText_45564
	writenpctext TreeBitstreamText_455be
.asm_d1454: ; d1454 (34:5454)
	pop bc
	pop bc
	ret
