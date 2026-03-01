
Data_a10b4:
	warpdef $0d, $04, $02, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $06, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $15, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $07, $0b, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $07, $11, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $14, $09, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $14, $0c, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $0d, $11, $01, $01, MAP_20_01, $04, $09, $04, $08, SFX_34

Data_a110c:
	warpdef $15, $11, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34

Data_a1117:
	dtext_tree_pointer TreeBitstreamText_41800
	dw -1

Data_a111b:
	dtext_tree_pointer TreeBitstreamText_41a56
	dw -1

Data_a111f:
	dtext_tree_pointer TreeBitstreamText_41836
	dw -1

Data_a1123:
	dtext_tree_pointer TreeBitstreamText_41903
	dw -1

Data_a1127:
	dtext_tree_pointer TreeBitstreamText_46651
	dw -1

Data_a112b:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_a112f:
	dtext_tree_pointer TreeBitstreamText_4181e
	dw -1

Data_a1133:
	dtext_tree_pointer TreeBitstreamText_41a76
	dw -1

Data_a1137:
	dtext_tree_pointer TreeBitstreamText_41867
	dw -1

Data_a113b:
	dtext_tree_pointer TreeBitstreamText_41982
	dw -1

Data_a113f:
	db $5b, $0e, $09, $11, $4f

Data_a1144:
	person_event $02, $04, $0e, $0b, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a1117

Data_a1152:
	person_event $09, $04, $16, $12, $01, $01, $03, $04, $00, PrintTextFacePlayer_28, Data_a111b
	person_event $00, $04, $10, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a111f
	person_event $01, $04, $06, $0d, $01, $01, $01, $04, $00, Func_a12b1, NULL
	person_event $06, $04, $08, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a1123
	person_event $ff, $00, $0c, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a1127
	person_event $ff, $00, $0f, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a1127
	person_event $0f, $04, $0c, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $08, $01, $01, $02, $04, $00, Func_a1514, NULL

Data_a11c2:
	person_event $ff, $00, $15, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a112b

Data_a11d0:
	person_event $ff, $00, $15, $11, $01, $01, $00, $04, $01, Func_a1508, NULL

Func_a11de:: ; a11de
	ld a, $5
	ld [wc789], a
	ld a, $8
	ld [wc7e2], a
	call Func_a14ef
	ld hl, Func_a14ef
	scall Func_80f11
	checkevent $42
	cp $1
	jp nz, .asm_a120b
	ld a, $9
	scall Func_80c94
	ld a, $10
	scall Func_80c94
	ld a, $11
	scall Func_80c94
.asm_a120b:
	ld a, [wc793]
	cp $1
	jp z, .asm_a121b
	ld a, [wc793]
	cp $2
	jp nz, .asm_a122c
.asm_a121b:
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
.asm_a122c:
	loadwarps $8, Data_a10b4
	ld e, $1
	ld hl, Data_a113f
	scall Func_80ce7
	loadpeople $9, Data_a1144
	playmusic $13
	ld a, $1
	scall LoadPlayerSprite
	hideperson $7
	ld a, [wc790]
	or a
	jp z, .asm_a1283
	ld a, [wc790]
	cp $5
	jp nc, .asm_a1283
	ld de, Data_a112f
	xor a
	scall SetPersonTextPointer
	ld de, Data_a1133
	ld a, $1
	scall SetPersonTextPointer
	ld de, Data_a1137
	ld a, $2
	scall SetPersonTextPointer
	ld de, Data_a113b
	ld a, $4
	scall SetPersonTextPointer
.asm_a1283:
	ld a, [wc790]
	or a
	jp z, .asm_a12a5
	ld a, [wc790]
	cp 7
	jp nc, .asm_a12a5
	loadwarps $1, Data_a110c
	loadpeople $1, Data_a11d0
	jp .asm_a12ad
.asm_a12a5:
	loadpeople $1, Data_a11c2
.asm_a12ad:
	scall Func_8001c
	ret

Func_a12b1:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_a14e6
	face_player -$03
	ld a, [wc796]
	cp $03
	jp nz, .asm_a134c
	ld a, $32
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a1349
	writenpctext TreeBitstreamText_4498a
	ld a, $32
	scall Func_80e7d
	cp $01
	jp nz, .asm_a1340
	writenpctext TreeBitstreamText_44a2d
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_a132f
	playsfx $68
	writenpctext TreeBitstreamText_44a7f
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
	give_robot WHACKY, a, $00
	ld a, $04
	ld [$c796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a133d

.asm_a132f:
	playsfx $69
	writenpctext TreeBitstreamText_44af6
	jp .asm_a14e6

.asm_a133d:
	jp .asm_a1349

.asm_a1340:
	writetext TreeBitstreamText_45a40
	jp .asm_a14e6

.asm_a1349:
	jp .asm_a1491

.asm_a134c:
	ld a, [$c796]
	cp $0d
	jp nz, .asm_a13d6
	ld a, $7e
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a13d3
	writenpctext TreeBitstreamText_4498a
	ld a, $7e
	scall Func_80e7d
	cp $01
	jp nz, .asm_a13ca
	writenpctext TreeBitstreamText_44b74
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_a13b9
	playsfx $68
	writenpctext TreeBitstreamText_44bcf
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
	give_robot GIGO, a, $00
	ld a, $0e
	ld [$c796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a13c7

.asm_a13b9:
	playsfx $69
	writenpctext TreeBitstreamText_44c2a
	jp .asm_a14e6

.asm_a13c7:
	jp .asm_a13d3

.asm_a13ca:
	writetext TreeBitstreamText_45a40
	jp .asm_a14e6

.asm_a13d3:
	jp .asm_a1491

.asm_a13d6:
	ld a, $32
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_a13f0
	ld a, $7e
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a1491
.asm_a13f0:
	ld a, [$c796]
	cp $08
	jp z, .asm_a1479
	cp $06
	jp z, .asm_a1479
	cp $0a
	jp z, .asm_a146a
	cp $05
	jp z, .asm_a146a
	cp $0c
	jp z, .asm_a145b
	cp $04
	jp z, .asm_a145b
	cp $07
	jp z, .asm_a144c
	or a
	jp z, .asm_a144c
	cp $0b
	jp z, .asm_a143d
	cp $02
	jp z, .asm_a143d
	cp $09
	jp z, .asm_a142e
	cp $01
	jp nz, .asm_a1488
.asm_a142e:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp .asm_a148e

.asm_a143d:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp .asm_a148e

.asm_a144c:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45abb
	jp .asm_a148e

.asm_a145b:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp .asm_a148e

.asm_a146a:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp .asm_a148e

.asm_a1479:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b20
	jp .asm_a148e

.asm_a1488:
	writenpctext TreeBitstreamText_4498a
.asm_a148e:
	jp .asm_a14e6

.asm_a1491:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_a14e6
	ld a, [$c796]
	cp $0e
	jp nc, .asm_a14b8
	ld a, [$c796]
	cp $04
	jp c, .asm_a14b8
	writenpctext TreeBitstreamText_4498a
	writenpctext TreeBitstreamText_44b1c
	jp .asm_a14e6

.asm_a14b8:
	ld a, [$c796]
	cp $0f
	jp nz, .asm_a14c9
	writenpctext TreeBitstreamText_4498a
	jp .asm_a14e6

.asm_a14c9:
	ld a, [$c796]
	cp $0e
	jp c, .asm_a14da
	writenpctext TreeBitstreamText_44c51
	jp .asm_a14e6

.asm_a14da:
	writenpctext TreeBitstreamText_4498a
	writenpctext TreeBitstreamText_449c9
.asm_a14e6:
	pop bc
	pop bc
	ret

Data_a14e9:
	db $14, $0c, $01, $01, $15, $11

Func_a14ef:
	ld a, [wc790]
	or a
	jp z, .asm_a1507
	ld a, [wc790]
	cp $07
	jp nc, .asm_a1507
	ld hl, Data_a14e9
	scall Func_80d9b
	scall Func_80f02
.asm_a1507:
	ret

Func_a1508:
	ld a, e
	cp $02
	jp nz, .asm_a1513
	ld a, $0d
	ld [wc78a], a
.asm_a1513:
	ret

Func_a1514:
	ld a, e
	or a
	jp nz, .asm_a161b
	checkevent $00dd
	or a
	jp nz, .asm_a1615
	playsfx $5e
	loademote $02, $02, $08
	ld e, $08
	ld a, $0c
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx $28
	showperson $07
	playsfx $60
	sprite_face $03, $07
	sprite_face $00, $07
	sprite_face $01, $07
	sprite_face $02, $07
	sprite_face $03, $07
	sprite_face $00, $07
	sprite_face $01, $07
	sprite_face $02, $07
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $14
	face_player $07
	script_sleep 30
	ld c, $11
	ld e, $0a
	ld a, $03
	scall Func_80e8d
	setevent $00dd
	playsfx $60
	sprite_face $03, $07
	sprite_face $00, $07
	sprite_face $01, $07
	sprite_face $02, $07
	sprite_face $03, $07
	sprite_face $00, $07
	sprite_face $01, $07
	sprite_face $02, $07
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $13
	face_player $07
	hideperson $07
	jp .asm_a161b
.asm_a1615:
	writetext TreeBitstreamText_3f79e
.asm_a161b:
	ret
