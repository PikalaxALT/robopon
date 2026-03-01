
Data_aa3d8:
	warpdef $0c, $1c, $02, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $0c, $04, $02, $01, MAP_25_00, $08, $14, $08, $13, SFX_2E
	warpdef $19, $04, $01, $01, MAP_28_00, $06, $1a, $06, $19, SFX_2E
	warpdef $05, $0e, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $08, $0e, $01, $01, MAP_32_06, $06, $0c, $06, $0b, SFX_34
	warpdef $1d, $16, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $20, $16, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $05, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $08, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $11, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $14, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $17, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $1e, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $21, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34

Data_aa472:
	warpdef $07, $08, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34

Data_aa47d:
	dtext_tree_pointer TreeBitstreamText_40bf2
	dw -1

Data_aa481:
	dtext_tree_pointer TreeBitstreamText_40c56
	dw -1

Data_aa485:
	dtext_tree_pointer TreeBitstreamText_40c1e
	dw -1

Data_aa489:
	dtext_tree_pointer TreeBitstreamText_40c37
	dw -1

Data_aa48d:
	dtext_tree_pointer TreeBitstreamText_46554
	dw -1

Data_aa491:
	dtext_tree_pointer TreeBitstreamText_4657c
	dw -1

Data_aa495:
	dtext_tree_pointer TreeBitstreamText_4656c
	dw -1

Data_aa499:
	dtext_tree_pointer TreeBitstreamText_46e1d
	dtext_tree_pointer TreeBitstreamText_46e3b
	dtext_tree_pointer TreeBitstreamText_46e4b
	dw -1

Data_aa4a1:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_aa4a5:
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $0e, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $18, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $1a, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $0b, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $0e, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $07, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $14, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $12, $07, $03, $03, $00, $04, $00, Func_aa6ee, NULL

Data_aa523:
	person_event $09, $04, $0b, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa481
	person_event $ff, $00, $0c, $06, $01, $01, $00, $04, $01, Func_aa7b6, NULL
	person_event $ff, $00, $0d, $06, $01, $01, $00, $04, $01, Func_aa7f5, NULL
	person_event $09, $04, $0e, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa485
	person_event $09, $04, $18, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa489
	person_event $ff, $00, $19, $06, $01, $01, $00, $04, $01, Func_aa834, NULL

Data_aa577:
	person_event $03, $04, $0d, $18, $01, $01, $02, $04, $00, Func_aa86f, NULL
	person_event $00, $04, $0c, $11, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_aa47d

Data_aa593:
	person_event $10, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5a1:
	person_event $0b, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5af:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa4a1

Data_aa5bd:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $01, Func_aab87, NULL

Func_aa5cb:: ; aa5cb
	ld a, $09
	ld [wc789], a
	ld a, $0d
	ld [wc7e2], a
	call Func_aaaad
	ld hl, Func_aaaad
	scall Func_80f11
	loadwarps $0e, Data_aa3d8
	loadpeople $09, Data_aa4a5
	loadpeople $02, Data_aa577
	ld a, $01
	scall LoadPlayerSprite
	playmusic $12
	ld a, [wc790]
	or a
	jp z, .asm_aa622
	ld a, [wc790]
	cp $07
	jp nc, .asm_aa622
	loadwarps $01, Data_aa472
	loadpeople $01, Data_aa5bd
	jp .asm_aa62a
.asm_aa622:
	loadpeople $01, Data_aa5af
.asm_aa62a:
	checkevent $0034
	cp $01
	jp nz, .asm_aa666
	checkevent $00c3
	or a
	jp nz, .asm_aa666
	ld a, [wBackupMapGroup]
	cp $1a
	jp nz, .asm_aa666
	checkevent $0035
	or a
	jp nz, .asm_aa666
	loadpeople $01, Data_aa5a1
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_aab3f
	jp .asm_aa6dd
.asm_aa666:
	checkevent $0022
	cp $01
	jp nz, .asm_aa69e
	checkevent $0043
	or a
	jp nz, .asm_aa69e
	checkevent $00c2
	or a
	jp nz, .asm_aa69e
	ld a, [wBackupMapGroup]
	cp $ff
	jp z, .asm_aa69b
	loadpeople $01, Data_aa593
	scall Func_8001c
	call Func_aaad6
.asm_aa69b:
	jp .asm_aa6dd
.asm_aa69e:
	checkevent $0022
	or a
	jp nz, .asm_aa6da
	loadpeople $06, Data_aa523
	checkevent $0014
	cp $01
	jp nz, .asm_aa6d4
	checkevent $0007
	cp $01
	jp nz, .asm_aa6d4
	hideperson $10
	hideperson $11
.asm_aa6d4:
	scall Func_8001c
	jp .asm_aa6dd
.asm_aa6da:
	scall Func_8001c
.asm_aa6dd:
	ret

Data_aa6de:
	db $13, $0a, $ff, $ff

Data_aa6e2:
	db $11, $0a, $13, $0a, $ff, $ff

Data_aa6e8:
	db $15, $0a, $13, $0a, $ff, $ff

Func_aa6ee:
	ld a, e
	or a
	jp nz, .asm_aa7b1
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_aa7ab
.asm_aa71b:
	ld a, [wc790]
	or a
	jp z, .asm_aa7a2
	ld a, [wc790]
	cp $06
	jp nc, .asm_aa7a2
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa79f
	ld a, [wPlayerFacing]
	cp $01
	jp z, .asm_aa74d
	or a
	jp nz, .asm_aa75a
	move_player $01, Data_aa6de
	jp .asm_aa764
.asm_aa74d:
	move_player $01, Data_aa6e2
	jp .asm_aa764
.asm_aa75a:
	move_player $01, Data_aa6e8
.asm_aa764:
	scall WaitNPCStep
	playmusic SONG_NONE
	playmusic $0a
	xor a
	scall Func_80653
	loademote $01, $01, $0b
	playsfx $44
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $02
	scall PlayerFace
	ld l, $12
	push hl
	ld c, $0a
	ld e, $01
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_aa79f:
	jp .asm_aa7a8
.asm_aa7a2:
	ld hl, $0377
	scall PrintTextStandard
.asm_aa7a8:
	jp .asm_aa7b1
.asm_aa7ab:
	ld hl, $0376
	scall PrintTextStandard
.asm_aa7b1:
	ret

Data_aa7b2:
	db $0c, $07, $ff, $ff

Func_aa7b6:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa7ef
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	playsfx $69
	ld hl, $01bc
	scall PrintTextStandard
	move_player $01, Data_aa7b2
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
.asm_aa7ef:
	pop bc
	ret

Data_aa7f1:
	db $0d, $07, $ff, $ff

Func_aa7f5:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa82e
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $01
	scall PlayerFace
	playsfx $69
	ld hl, $01bc
	scall PrintTextStandard
	move_player $01, Data_aa7f1
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
.asm_aa82e:
	pop bc
	ret

Data_aa830:
	db $19, $07, $ff, $ff

Func_aa834:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa86d
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	playsfx $69
	ld hl, $01bd
	scall PrintTextStandard
	move_player $01, Data_aa830
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
.asm_aa86d:
	pop bc
	ret

Func_aa86f:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_aaaa4
	face_player -$03
	ld a, [wc796]
	cp $04
	jp nz, .asm_aa90a
	ld a, $49
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aa907
	ld hl, $0416
	scall PrintTextWithNPCName
	ld a, $49
	scall Func_80e7d
	cp $01
	jp nz, .asm_aa8fe
	ld hl, $0295
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa8ed
	playsfx $68
	ld hl, $040c
	scall PrintTextWithNPCName
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
	give_robot FILRUP, a, $00
	ld a, $05
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_aa8fb
.asm_aa8ed:
	playsfx $69
	ld hl, $040d
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aa8fb:
	jp .asm_aa907
.asm_aa8fe:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_aaaa4
.asm_aa907:
	jp .asm_aaa4f
.asm_aa90a:
	ld a, [wc796]
	cp $0c
	jp nz, .asm_aa994
	ld a, $7c
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aa991
	ld hl, $0416
	scall PrintTextWithNPCName
	ld a, $7c
	scall Func_80e7d
	cp $01
	jp nz, .asm_aa988
	ld hl, $0296
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa977
	playsfx $68
	ld hl, $0432
	scall PrintTextWithNPCName
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
	give_robot MACK, a, $00
	ld a, $0d
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_aa985
.asm_aa977:
	playsfx $69
	ld hl, $0433
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aa985:
	jp .asm_aa991
.asm_aa988:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_aaaa4
.asm_aa991:
	jp .asm_aaa4f
.asm_aa994:
	ld a, $49
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_aa9ae
	ld a, $7c
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aaa4f
.asm_aa9ae:
	ld a, [wc796]
	cp $08
	jp z, .asm_aaa37
	cp $06
	jp z, .asm_aaa37
	cp $0a
	jp z, .asm_aaa28
	cp $05
	jp z, .asm_aaa28
	cp $07
	jp z, .asm_aaa19
	or a
	jp z, .asm_aaa19
	cp $0d
	jp z, .asm_aaa0a
	cp $03
	jp z, .asm_aaa0a
	cp $0b
	jp z, .asm_aa9fb
	cp $02
	jp z, .asm_aa9fb
	cp $09
	jp z, .asm_aa9ec
	cp $01
	jp nz, .asm_aaa46
.asm_aa9ec:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034d
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aa9fb:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0205
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa0a:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $020a
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa19:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034b
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa28:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0241
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa37:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0244
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa46:
	ld hl, $0416
	scall PrintTextWithNPCName
.asm_aaa4c:
	jp .asm_aaaa4
.asm_aaa4f:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_aaaa4
	ld a, [wc796]
	cp $0d
	jp nc, .asm_aaa76
	ld a, [wc796]
	cp $05
	jp c, .asm_aaa76
	ld hl, $0416
	scall PrintTextWithNPCName
	ld hl, $0431
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa76:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_aaa87
	ld hl, $0416
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa87:
	ld a, [wc796]
	cp $0d
	jp c, .asm_aaa98
	ld hl, $0434
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa98:
	ld hl, $0416
	scall PrintTextWithNPCName
	ld hl, $01ba
	scall PrintTextWithNPCName
.asm_aaaa4:
	pop bc
	pop bc
	ret

Data_aaaa7:
	db $05, $0e, $01, $01
	db $07, $08

Func_aaaad:
	ld a, [wc790]
	or a
	jp z, .asm_aaac5
	ld a, [wc790]
	cp $07
	jp nc, .asm_aaac5
	ld hl, Data_aaaa7
	scall Func_80d9b
	scall Func_80f02
.asm_aaac5:
	ret

Data_aaac6:
	db $19, $05, $ff, $ff

Data_aaaca:
	db $19, $0d, $ff, $ff

Data_aaace:
	db $1a, $06, $ff, $ff

Data_aaad2:
	db $19, $07, $ff, $ff

Func_aaad6:
	move_person $0c, Data_aaac6, 1
	scall WaitNPCStep
	move_player $01, Data_aaace
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	move_person $0c, Data_aaaca, 1
	scall WaitNPCStep
	ld a, $02
	scall PlayerFace
	hideperson $0c
	ld hl, $0112
	scall PrintTextStandard
	move_player $01, Data_aaad2
	scall WaitNPCStep
	setevent $00c2
	ld l, $07
	push hl
	ld c, $19
	ld e, $01
	ld a, $19
	scall Func_80dff
	pop bc
	ret

Data_aab37:
	db $19, $06, $ff, $ff

Data_aab3b:
	db $19, $0d, $ff, $ff

Func_aab3f:
	move_person $0c, Data_aab37, 1
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld hl, $01bf
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	move_person $0c, Data_aab3b, 1
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld l, $06
	push hl
	ld c, $07
	ld e, $00
	ld a, $1a
	scall Func_80dff
	pop bc
	setevent $00c3
	ret

Func_aab87:
	ld a, e
	cp $02
	jp nz, .asm_aab92
	ld a, $0c
	ld [wc78a], a
.asm_aab92:
	ret
