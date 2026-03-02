
Data_910b4:
	warpdef $13, $0d, $01, $01, MAP_07_00, $12, $11, $12, $12, SFX_2E

Data_910bf:
	dtext_tree_pointer TreeBitstreamText_3b7a6
	dw -1

Data_910c3:
	dtext_tree_pointer TreeBitstreamText_409c8
	dw -1

Data_910c7:
	dtext_tree_pointer TreeBitstreamText_40a7a
	dw -1

Data_910cb:
	dtext_tree_pointer TreeBitstreamText_409fd
	dw -1

Data_910cf:
	dtext_tree_pointer TreeBitstreamText_40ac2
	dw -1

Data_910d3:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, NULL, NULL
	person_event $10, $0c, $09, $08, $01, $01, $00, $04, $00, NULL, NULL
	person_event $10, $0c, $0b, $08, $01, $01, $00, $04, $00, NULL, NULL

Data_910fd:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, Func_808fc_24, Data_910bf
	person_event $0e, $0c, $04, $0d, $01, $01, $01, $04, $00, Func_912e5, NULL
	person_event $18, $04, $00, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $10, $04, $03, $04, $01, $01, $02, $04, $00, Func_9141c, NULL
	person_event $10, $04, $11, $04, $01, $01, $02, $04, $00, Func_91431, NULL
	person_event $10, $04, $12, $04, $01, $01, $02, $04, $00, Func_91446, NULL
	person_event $ff, $00, $0a, $09, $01, $01, $00, $04, $00, Func_9145b, NULL
	person_event $01, $04, $0a, $0d, $01, $01, $00, $04, $00, Func_91478, NULL
	person_event $03, $04, $13, $09, $01, $01, $03, $04, $00, PrintTextFacePlayer_24, Data_910c3
	person_event $01, $04, $02, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_24, Data_910c7

Func_91189:: ; 91189
	ld a, $04
	ld [wc789], a
	loadwarps $01, Data_910b4
	playmusic SONG_CARD_MINIGAME
	ld a, $01
	scall LoadPlayerSprite
	ld a, $06
	ld [wc7e2], a
	checkevent EVENT_036
	or a
	jp nz, .asm_911c0
	loadpeople $03, Data_910d3
	scall Func_8001c
	call Func_91219
	jp .asm_9120c
.asm_911c0
	loadpeople $0a, Data_910fd
	hideperson $02
	checkevent EVENT_039
	cp $01
	jp nz, .asm_911ea
	ld c, $0c
	ld e, $02
	ld a, $01
	scall Func_80080
	sprite_face $02, $01
.asm_911ea
	ld a, [wc790]
	or a
	jp z, .asm_91209
	ld a, [wc790]
	cp $06
	jp nc, .asm_91209
	ld de, Data_910cb
	ld a, $08
	scall SetPersonTextPointer
	ld de, Data_910cf
	ld a, $09
	scall SetPersonTextPointer
.asm_91209
	scall Func_8001c
.asm_9120c
	ret

Data_9120d:
	db $0e, $07, $ff, $ff

Data_91211:
	db $03, $04, $ff, $ff

Data_91215:
	db $11, $04, $ff, $ff

Func_91219:
	move_player $01, Data_9120d
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	script_sleep 30
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	writenpctext TreeBitstreamText_3b676
	writenpctext TreeBitstreamText_3b6ef
	writenpctext TreeBitstreamText_3b6fb
	writenpctext TreeBitstreamText_3b6ef
	sprite_face $01, 0
	writenpctext TreeBitstreamText_3b731
	sprite_face $02, 0
	writenpctext TreeBitstreamText_3b6ef
	writenpctext TreeBitstreamText_3b762
	writenpctext TreeBitstreamText_3b77b
	move_person $01, Data_91211, 0
	move_person $02, Data_91215, 1
	scall WaitNPCStep
	sprite_face $02, $01
	sprite_face $02, $02
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	setevent EVENT_036
	ld a, $07
	scall Func_80c94
	warp_player MAP_08_00, $0e, $07
	ret

Func_912e5:
	push af
	ld a, e
	or a
	jp nz, .asm_91332
	face_player -1
	checkevent EVENT_039
	or a
	jp nz, .asm_9132c
	checkevent EVENT_05C
	or a
	jp nz, .asm_91326
	writenpctext_yesorno TreeBitstreamText_3b7f7
	or a
	jp nz, .asm_9131d
	setevent EVENT_05C
	call Func_91342
	jp .asm_91323
.asm_9131d
	writenpctext TreeBitstreamText_3b8b8
.asm_91323
	jp .asm_91329
.asm_91326
	call Func_91342
.asm_91329
	jp .asm_91332
.asm_9132c
	writenpctext TreeBitstreamText_3b973
.asm_91332
	pop bc
	ret

Data_91334:
	db $01, $0d, $ff, $ff

Data_91338:
	db $02, $0c, $ff, $ff

Data_9133c:
	db $04, $0d, $01, $0d, $ff, $ff

Func_91342:
	ld a, $13
	scall Func_80e5d
	or a
	jp z, .asm_91415
	ld a, $1e
	scall Func_80e6d
	cp $ff
	jp z, .asm_9140c
	push af
	writenpctext TreeBitstreamText_3b8f2
	move_person $01, Data_91334, 1
	scall WaitNPCStep
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $01, $04
	hideperson $01
	scall WaitEmote
	showperson $01
	scall HideEmote
	showperson $02
	playsfx SFX_68
	playmusic SONG_NONE
	playmusic SONG_CARD_MINIGAME
	move_person $01, Data_91338, 1
	scall WaitNPCStep
	sprite_face $02, $01
	writenpctext TreeBitstreamText_3b942
	move_player $01, Data_9133c
	playsfx SFX_2A
	writetext TreeBitstreamText_3b932
	pop af
	push af
	ld l, a
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	pop af
	push hl
	ld e, $01
	ld c, $00
	scall GiveRobot
	pop hl
	give_robot CYCOOL, l, $00
	ld c, $01
	ld e, $01
	ld a, $13
	scall Func_80d4d
	hideperson $02
	setevent EVENT_039
	jp .asm_91412
.asm_9140c
	writenpctext TreeBitstreamText_3b9d7
.asm_91412
	jp .asm_9141b
.asm_91415
	writenpctext TreeBitstreamText_3b9a9
.asm_9141b
	ret

Func_9141c:
	push af
	ld a, e
	or a
	jp nz, .asm_9142f
	face_player -$01
	ld e, $00
	ld a, $04
	scall Func_806a0
.asm_9142f
	pop bc
	ret

Func_91431:
	push af
	ld a, e
	or a
	jp nz, .asm_91444
	face_player -$01
	ld e, $02
	ld a, $04
	scall Func_806a0
.asm_91444
	pop bc
	ret

Func_91446:
	push af
	ld a, e
	or a
	jp nz, .asm_91459
	face_player -$01
	ld e, $01
	ld a, $04
	scall Func_806a0
.asm_91459
	pop bc
	ret

Func_9145b:
	ld a, e
	or a
	jp nz, .asm_91477
	warp_player MAP_08_01, $04, $01
	playsfx SFX_2E
	ld a, $02
	ld [wPlayerFacing], a
.asm_91477
	ret

Func_91478:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_9176c
	ld a, [wc796]
	cp $02
	jp nz, .asm_9152c
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_91529
	writenpctext TreeBitstreamText_44601
	script_sleep 60
	face_player $07
	writenpctext TreeBitstreamText_4461b
	ld a, $13
	scall Func_80e7d
	cp $01
	jp nz, .asm_91520
	writenpctext TreeBitstreamText_446dc
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_91508
	playsfx SFX_68
	writenpctext TreeBitstreamText_44733
	sprite_face $00, $07
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
	give_robot PIRATE, a, $00
	ld a, $03
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_9151d
.asm_91508
	playsfx SFX_69
	writenpctext TreeBitstreamText_447bd
	sprite_face $00, $07
	jp .asm_9176c
.asm_9151d
	jp .asm_91529
.asm_91520
	writetext TreeBitstreamText_45a40
	jp .asm_9176c
.asm_91529
	jp .asm_916a9
.asm_9152c
	ld a, [wc796]
	cp $0b
	jp nz, .asm_915dc
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_915d9
	writenpctext TreeBitstreamText_44601
	script_sleep 60
	face_player $07
	writenpctext TreeBitstreamText_4461b
	ld a, $72
	scall Func_80e7d
	cp $01
	jp nz, .asm_915d0
	writenpctext TreeBitstreamText_44861
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_915b1
	playsfx SFX_68
	writenpctext TreeBitstreamText_448b8
	sprite_face $00, $07
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
	give_robot SLOTS, a, $00
	ld a, $0c
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_915cd
.asm_915b1
	playsfx SFX_69
	writenpctext TreeBitstreamText_447bd
	script_sleep 30
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_915cd
	jp .asm_915d9
.asm_915d0
	writetext TreeBitstreamText_45a40
	jp .asm_9176c
.asm_915d9
	jp .asm_916a9
.asm_915dc
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_915f6
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_916a9
.asm_915f6
	face_player $07
	ld a, [wc796]
	cp $08
	jp z, .asm_91684
	cp $06
	jp z, .asm_91684
	cp $0a
	jp z, .asm_91675
	cp $05
	jp z, .asm_91675
	cp $0c
	jp z, .asm_91666
	cp $04
	jp z, .asm_91666
	cp $0d
	jp z, .asm_91657
	cp $03
	jp z, .asm_91657
	cp $07
	jp z, .asm_91648
	or a
	jp z, .asm_91648
	cp $09
	jp z, .asm_91639
	cp $01
	jp nz, .asm_91693
.asm_91639
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp .asm_91699
.asm_91648
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45abb
	jp .asm_91699
.asm_91657
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp .asm_91699
.asm_91666
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp .asm_91699
.asm_91675
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp .asm_91699
.asm_91684
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b20
	jp .asm_91699
.asm_91693
	writenpctext TreeBitstreamText_4461b
.asm_91699
	script_sleep 60
	sprite_face $00, $07
	jp .asm_9176c
.asm_916a9
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_9176c
	ld a, [wc796]
	cp $0c
	jp nc, .asm_916ee
	ld a, [wc796]
	cp $03
	jp c, .asm_916ee
	writenpctext TreeBitstreamText_44601
	script_sleep 60
	face_player $07
	writenpctext TreeBitstreamText_4461b
	writenpctext TreeBitstreamText_447ed
	script_sleep 30
	sprite_face $00, $07
	jp .asm_9176c
.asm_916ee
	ld a, [wc796]
	cp $0f
	jp nz, .asm_9171e
	writenpctext TreeBitstreamText_44601
	script_sleep 60
	face_player $07
	writenpctext TreeBitstreamText_4461b
	script_sleep 30
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_9171e
	ld a, [wc796]
	cp $0c
	jp c, .asm_91742
	face_player $07
	writenpctext TreeBitstreamText_44937
	script_sleep 30
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_91742
	writenpctext TreeBitstreamText_44601
	script_sleep 60
	face_player $07
	writenpctext TreeBitstreamText_4461b
	writenpctext TreeBitstreamText_44657
	script_sleep 30
	sprite_face $00, $07
.asm_9176c
	pop bc
	pop bc
	ret
