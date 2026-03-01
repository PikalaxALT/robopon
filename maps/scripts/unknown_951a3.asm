
Data_950b4:
	warpdef $23, $0e, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $09, $0c, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $0f, $0d, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $13, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $1a, $07, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $1b, $10, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $1c, $0b, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34

Data_95101:
	dtext_tree_pointer TreeBitstreamText_46718
	dw -1

Data_95105:
	dtext_tree_pointer TreeBitstreamText_4780b
	dw -1

Data_95109:
	person_event $03, $04, $18, $1a, $01, $01, $03, $04, $00, Func_951e4, NULL
	person_event $08, $04, $18, $0e, $01, $01, $03, $04, $00, Func_955fc, NULL
	person_event $08, $04, $12, $0a, $01, $01, $00, $04, $00, Func_95657, NULL
	person_event $00, $04, $0b, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95105
	person_event $08, $04, $0e, $10, $01, $01, $01, $04, $00, Func_956b2, NULL
	person_event $08, $04, $16, $12, $01, $01, $02, $04, $00, Func_9570d, NULL
	person_event $ff, $00, $09, $1a, $03, $01, $00, $04, $01, Func_9542c, NULL
	person_event $ff, $00, $16, $0a, $03, $03, $00, $04, $00, Func_95504, NULL
	person_event $ff, $00, $0d, $07, $03, $03, $00, $04, $00, Func_95540, NULL
	person_event $ff, $00, $22, $0d, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101
	person_event $ff, $00, $22, $0f, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101

Func_951a3:: ; 951a3
	checkevent $0042
	or a
	jp nz, .asm_951bc
	ld a, $09
	scall Func_80c94
	ld a, $10
	scall Func_80c94
	ld a, $11
	scall Func_80c94
.asm_951bc:
	ld a, $08
	ld [wc789], a
	ld a, $10
	ld [wc7e2], a
	loadpeople $0b, Data_95109
	loadwarps $07, Data_950b4
	playmusic SONG_0A
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Func_951e4:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_95429
	face_player -$03
	ld a, [wc796]
	cp $05
	jp nz, .asm_95287
	ld a, $4a
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_95284
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	ld a, $4a
	scall Func_80e7d
	cp $01
	jp nz, .asm_9527b
	hltext_tree_pointer TreeBitstreamText_4531c
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_95262
	playsfx $68
	hltext_tree_pointer TreeBitstreamText_4535e
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
	give_robot BOILER, a, $00
	ld a, $06
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_95278
.asm_95262:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_453ee
	scall PrintTextWithNPCName
	ld e, $03
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_95429
.asm_95278:
	jp .asm_95284
.asm_9527b:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_95429
.asm_95284:
	jp .asm_953d4
.asm_95287:
	ld a, [wc796]
	cp $0a
	jp nz, .asm_95319
	ld a, $6f
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_95316
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	ld a, $6f
	scall Func_80e7d
	cp $01
	jp nz, .asm_9530d
	hltext_tree_pointer TreeBitstreamText_4547f
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_952f4
	playsfx $68
	hltext_tree_pointer TreeBitstreamText_454c0
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
	give_robot GRANIT, a, $00
	ld a, $0b
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_9530a
.asm_952f4:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_453ee
	scall PrintTextWithNPCName
	ld e, $03
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_95429
.asm_9530a:
	jp .asm_95316
.asm_9530d:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_95429
.asm_95316:
	jp .asm_953d4
.asm_95319:
	ld a, $4a
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_95333
	ld a, $6f
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_953d4
.asm_95333:
	ld a, [wc796]
	cp $08
	jp z, .asm_953bc
	cp $06
	jp z, .asm_953bc
	cp $07
	jp z, .asm_953ad
	or a
	jp z, .asm_953ad
	cp $0c
	jp z, .asm_9539e
	cp $04
	jp z, .asm_9539e
	cp $0d
	jp z, .asm_9538f
	cp $03
	jp z, .asm_9538f
	cp $0b
	jp z, .asm_95380
	cp $02
	jp z, .asm_95380
	cp $09
	jp z, .asm_95371
	cp $01
	jp nz, .asm_953cb
.asm_95371:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45acc
	scall PrintTextStandard
	jp .asm_953d1
.asm_95380:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45add
	scall PrintTextStandard
	jp .asm_953d1
.asm_9538f:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp .asm_953d1
.asm_9539e:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp .asm_953d1
.asm_953ad:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp .asm_953d1
.asm_953bc:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp .asm_953d1
.asm_953cb:
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
.asm_953d1:
	jp .asm_95429
.asm_953d4:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_95429
	ld a, [wc796]
	cp $0b
	jp nc, .asm_953fb
	ld a, [wc796]
	cp $06
	jp c, .asm_953fb
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_45418
	scall PrintTextWithNPCName
	jp .asm_95429
.asm_953fb:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_9540c
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	jp .asm_95429
.asm_9540c:
	ld a, [wc796]
	cp $0b
	jp c, .asm_9541d
	hltext_tree_pointer TreeBitstreamText_45511
	scall PrintTextWithNPCName
	jp .asm_95429
.asm_9541d:
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_452cd
	scall PrintTextWithNPCName
.asm_95429:
	pop bc
	pop bc
	ret

Func_9542c:
	ld a, e
	cp $02
	jp nz, .asm_95503
	ld a, $01
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $03
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $07
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $25
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $26
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $27
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $36
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $60
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $79
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $88
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $8e
	scall Func_80e6d
	cp $ff
	jp nz, .asm_954aa
	ld a, $95
	scall Func_80e6d
	cp $ff
	jp z, .asm_954fd
.asm_954aa:
	ld a, [wc790]
	or a
	jp z, .asm_954f4
	ld a, [wc790]
	cp $05
	jp nc, .asm_954f4
	hltext_tree_pointer TreeBitstreamText_470c8
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_954f1
	playmusic SONG_NONE
	playmusic SONG_JUMP_MINIGAME
	xor a
	scall Func_80653
	loademote $01, $01, $26
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $05
	ld e, $0b
	ld a, $20
	scall Func_80dff
	pop bc
.asm_954f1:
	jp .asm_954fa
.asm_954f4:
	hltext_tree_pointer TreeBitstreamText_4714c
	scall PrintTextStandard
.asm_954fa:
	jp .asm_95503
.asm_954fd:
	hltext_tree_pointer TreeBitstreamText_47136
	scall PrintTextStandard
.asm_95503:
	ret

Func_95504:
	ld a, e
	or a
	jp nz, .asm_9552f
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	hltext_tree_pointer TreeBitstreamText_46e0b
	scall PrintTextStandard
	playmusic SONG_0A
.asm_9552f:
	ret

Data_95530:
	db $0e, $0a, $ff, $ff

Data_95534:
	db $0c, $0a, $0e, $0a, $ff, $ff

Data_9553a:
	db $10, $0a, $0e, $0a, $ff, $ff

Func_95540:
	ld a, e
	or a
	jp nz, .asm_955fb
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9556d
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9556d
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9556d
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_955f5
.asm_9556d:
	ld a, [wc790]
	or a
	jp z, .asm_955ec
	ld a, [wc790]
	cp $06
	jp nc, .asm_955ec
	hltext_tree_pointer TreeBitstreamText_46f30
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_955e9
	ld a, [wPlayerFacing]
	cp $01
	jp z, .asm_9559f
	or a
	jp nz, .asm_955ac
	move_player $01, Data_95530
	jp .asm_955b6
.asm_9559f:
	move_player $01, Data_95534
	jp .asm_955b6
.asm_955ac:
	move_player $01, Data_9553a
.asm_955b6:
	scall WaitNPCStep
	scall WaitNPCStep
	xor a
	scall PlayerFace
	xor a
	scall Func_80653
	loademote $01, $01, $0b
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	xor a
	scall PlayerFace
	ld l, $1e
	push hl
	ld c, $18
	ld e, $03
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_955e9:
	jp .asm_955f2
.asm_955ec:
	hltext_tree_pointer TreeBitstreamText_470f0
	scall PrintTextStandard
.asm_955f2:
	jp .asm_955fb
.asm_955f5:
	hltext_tree_pointer TreeBitstreamText_470d8
	scall PrintTextStandard
.asm_955fb:
	ret

Func_955fc:
	push af
	ld a, e
	or a
	jp nz, .asm_95655
	face_player -$01
	checkevent $010a
	or a
	jp nz, .asm_9564f
	ld a, [wc79c]
	cp $01
	jp c, .asm_9564f
	checkevent $0114
	or a
	jp nz, .asm_9564f
	hltext_tree_pointer TreeBitstreamText_47722
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	playsfx $2a
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	setevent $010a
	jp .asm_95655
.asm_9564f:
	hltext_tree_pointer TreeBitstreamText_47722
	scall PrintTextStandard
.asm_95655:
	pop bc
	ret

Func_95657:
	push af
	ld a, e
	or a
	jp nz, .asm_956b0
	face_player -$01
	checkevent $010b
	or a
	jp nz, .asm_956aa
	ld a, [wc79c]
	cp $01
	jp c, .asm_956aa
	checkevent $0114
	or a
	jp nz, .asm_956aa
	hltext_tree_pointer TreeBitstreamText_47780
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	playsfx $2a
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	setevent $010b
	jp .asm_956b0
.asm_956aa:
	hltext_tree_pointer TreeBitstreamText_47780
	scall PrintTextStandard
.asm_956b0:
	pop bc
	ret

Func_956b2:
	push af
	ld a, e
	or a
	jp nz, .asm_9570b
	face_player -$01
	checkevent $010c
	or a
	jp nz, .asm_95705
	ld a, [wc79c]
	cp $01
	jp c, .asm_95705
	checkevent $0114
	or a
	jp nz, .asm_95705
	hltext_tree_pointer TreeBitstreamText_478bb
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	playsfx $2a
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	setevent $010c
	jp .asm_9570b
.asm_95705:
	hltext_tree_pointer TreeBitstreamText_478bb
	scall PrintTextStandard
.asm_9570b:
	pop bc
	ret

Func_9570d:
	push af
	ld a, e
	or a
	jp nz, .asm_95766
	face_player -$01
	checkevent $010d
	or a
	jp nz, .asm_95760
	ld a, [wc79c]
	cp $01
	jp c, .asm_95760
	checkevent $0114
	or a
	jp nz, .asm_95760
	hltext_tree_pointer TreeBitstreamText_47943
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	playsfx $2a
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	setevent $010d
	jp .asm_95766
.asm_95760:
	hltext_tree_pointer TreeBitstreamText_47943
	scall PrintTextStandard
.asm_95766:
	pop bc
	ret
