
Data_8d0b4:
	warpdef $05, $14, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $15, $05, $01, $01, MAP_02_00, $17, $10, $17, $0f, SFX_2E
	warpdef $0c, $06, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $11, $06, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $19, $06, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $1e, $06, $01, $01, MAP_32_06, $06, $0c, $06, $0b, SFX_34
	warpdef $0c, $0c, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $11, $0c, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $19, $0c, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $1d, $0c, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $0c, $12, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $11, $12, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $19, $12, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $1d, $12, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $23, $14, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34

Data_8d159:
	warpdef $07, $11, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_34

Data_8d164:
	dtext_tree_pointer TreeBitstreamText_4651c
	dw -1

Data_8d168:
	dtext_tree_pointer TreeBitstreamText_4653a
	dw -1

Data_8d16c:
	dtext_tree_pointer TreeBitstreamText_3fd45
	dw -1

Data_8d170:
	dtext_tree_pointer TreeBitstreamText_3ffc5
	dw -1

Data_8d174:
	dtext_tree_pointer TreeBitstreamText_3fc99
	dw -1

Data_8d178:
	dtext_tree_pointer TreeBitstreamText_3ff8c
	dw -1

Data_8d17c:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_8d180:
	dtext_tree_pointer TreeBitstreamText_3fcf1
	dw -1

Data_8d184:
	person_event $21, $0c, $23, $02, $01, $01, $02, $04, $00, Func_8d955, NULL
	person_event $22, $0c, $23, $01, $01, $01, $02, $04, $00, Func_8d955, NULL

Data_8d1a0:
	person_event $ff, $00, $23, $14, $02, $01, $00, $04, $00, Func_8d396, NULL
	person_event $ff, $00, $06, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	person_event $ff, $00, $06, $15, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	person_event $ff, $00, $14, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	person_event $ff, $00, $16, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	person_event $ff, $00, $06, $04, $03, $03, $00, $04, $00, Func_8d2f4, NULL
	person_event $10, $0c, $0d, $08, $01, $01, $03, $04, $00, Func_8db33, NULL
	person_event $06, $04, $0b, $14, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d16c
	person_event $0e, $04, $1c, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_23, Data_8d170
	person_event $04, $04, $1c, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_23, Data_8d174
	person_event $0a, $04, $21, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d178

Data_8d23a:
	person_event $ff, $00, $07, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d17c

Data_8d248:
	person_event $ff, $00, $07, $11, $01, $01, $00, $04, $01, Func_8dd80, NULL

Func_8d256:: ; 8d256
	set_frame_script Func_8da28
	xor a
	ld [wc789], a
	ld a, $02
	ld [wc7e2], a
	loadwarps $0f, Data_8d0b4
	loadpeople $02, Data_8d184
	hideperson 0
	hideperson $01
	loadpeople $0b, Data_8d1a0
	playmusic SONG_TOWN2
	ld a, $01
	scall LoadPlayerSprite
	checkevent EVENT_046
	cp $01
	jp nz, .asm_8d2a9
	hideperson $02
.asm_8d2a9:
	ld a, [wc790]
	or a
	jp z, .asm_8d2c0
	ld a, [wc790]
	cp $04
	jp nz, .asm_8d2c0
	ld de, Data_8d180
	ld a, $09
	scall SetPersonTextPointer
.asm_8d2c0:
	ld a, [wc790]
	or a
	jp z, .asm_8d2e2
	ld a, [wc790]
	cp $07
	jp nc, .asm_8d2e2
	loadwarps $01, Data_8d159
	loadpeople $01, Data_8d248
	jp .asm_8d2ea
.asm_8d2e2:
	loadpeople $01, Data_8d23a
.asm_8d2ea:
	scall Func_8001c
	ret

Data_8d2ee:
	db $09, $07, $07, $07, $ff, $ff

Func_8d2f4:
	ld a, e
	or a
	jp nz, .asm_8d395
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8d321
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8d321
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8d321
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_8d38f
.asm_8d321:
	ld a, [wc790]
	or a
	jp z, .asm_8d386
	ld a, [wc790]
	cp $06
	jp nc, .asm_8d386
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, .asm_8d383
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_8d34b
	move_player $01, Data_8d2ee
.asm_8d34b:
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	scall Func_80653
	loademote $01, $01, $0b
	playsfx SFX_44
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $03
	scall PlayerFace
	warp_player MAP_30_02, $2d, $09
.asm_8d383:
	jp .asm_8d38c
.asm_8d386:
	writetext TreeBitstreamText_470f0
.asm_8d38c:
	jp .asm_8d395
.asm_8d38f:
	writetext TreeBitstreamText_470d8
.asm_8d395:
	ret

Func_8d396:
	push de
	xor a
	checkevent EVENT_046
	or a
	jp nz, .asm_8d42b
	ld hl, sp+$00
	ld a, [hl]
	or a
	jp nz, .asm_8d42b
	ld a, [wc78d]
	cp $07
	jp z, .asm_8d3b4
	jp .asm_8d42b
.asm_8d3b4:
	showperson 0
	writenpctext TreeBitstreamText_3ccf9
	ld l, $11
	xor a
.asm_8d3c3:
	cp l
	jp nc, .asm_8d3e0
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d3da
	xor a
	scall Func_80653
.asm_8d3da:
	pop af
	inc a
	pop hl
	jp .asm_8d3c3
.asm_8d3e0:
	push hl
	call Func_8d435
	xor a
	pop hl
.asm_8d3e6:
	cp l
	jp nc, .asm_8d412
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d40c
	hideperson 0
	hideperson $01
	ld a, $01
	scall Func_80653
.asm_8d40c:
	pop af
	inc a
	pop hl
	jp .asm_8d3e6
.asm_8d412:
	hideperson $02
	ld a, $0a
	scall Func_80c94
	ld a, $0b
	scall Func_80c94
	setevent EVENT_046
.asm_8d42b:
	pop bc
	ret

Data_8d42d:
	db $24, $02, $ff, $ff

Data_8d431:
	db $23, $02, $ff, $ff

Func_8d435:
	script_sleep 60
	writenpctext TreeBitstreamText_3cd08
	script_sleep 60
	showperson $01
	script_sleep 30
	sprite_face $00, 0
	script_sleep 30
	move_person 0, Data_8d42d, 1
	scall WaitNPCStep
	sprite_face $03, 0
	script_sleep 30
	move_person $01, Data_8d431, 1
	scall WaitNPCStep
	sprite_face $01, $01
	writenpctext TreeBitstreamText_3cdce
	sprite_face $00, $01
	sprite_face $02, 0
	script_sleep 30
	sprite_face $03, 0
	script_sleep 30
	sprite_face $02, 0
	writenpctext TreeBitstreamText_3ce14
	sprite_face $02, $01
	writenpctext TreeBitstreamText_3cec2
	writenpctext TreeBitstreamText_3cefd
	hideperson $02
	ret

Func_8d4d8:: ; 8d4d8
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	playmusic SONG_NONE
	hideperson $0c
	playsfx SFX_3A
	scall StartShakingScreen
	loademote $01, $01, $0a
	ld e, $12
	ld a, $23
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_3A
	loademote $01, $01, $0a
	ld e, $11
	ld a, $22
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_3A
	loademote $01, $01, $0a
	ld e, $11
	ld a, $24
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_3A
	loademote $01, $01, $0a
	ld e, $13
	ld a, $22
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_3A
	loademote $01, $01, $0a
	ld e, $13
	ld a, $24
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_65
	scall StopShakingScreen
	pop af
	cp $2d
	jp z, .asm_8d5f5
	call Func_8da28
	scall Func_80f02
	playmusic SONG_TOWN2
	ld a, [wc78d]
	cp $01
	jp z, .asm_8d5dd
	cp $02
	jp z, .asm_8d5d7
	cp $03
	jp z, .asm_8d5d1
	cp $04
	jp z, .asm_8d5cb
	cp $05
	jp z, .asm_8d5bd
	cp $06
	jp nz, .asm_8d5f2
	call Func_8d8e9
	jp .asm_8d5f2
.asm_8d5bd:
	call Func_8d877
	setevent EVENT_02F
	jp .asm_8d5f2
.asm_8d5cb:
	call Func_8d813
	jp .asm_8d5f2
.asm_8d5d1:
	call Func_8d7b8
	jp .asm_8d5f2
.asm_8d5d7:
	call Func_8d76b
	jp .asm_8d5f2
.asm_8d5dd:
	checkevent EVENT_049
	or a
	jp nz, .asm_8d5f2
	call Func_8d61a
	setevent EVENT_049
.asm_8d5f2:
	jp .asm_8d5fa
.asm_8d5f5:
	playmusic SONG_TOWN2
.asm_8d5fa:
	call FillVisibleAreaWithBlankTile
	ret

Data_8d5fe:
	db $24, $16, $ff, $ff

Data_8d602:
	db $23, $15, $24, $15, $ff, $ff

Data_8d608:
	db $25, $15, $ff, $ff

Data_8d60c:
	db $23, $15, $24, $15, $ff, $ff

Data_8d612:
	db $1c, $15, $ff, $ff

Data_8d616:
	db $1d, $15, $ff, $ff

Func_8d61a:
	playmusic SONG_NONE
	move_player $01, Data_8d5fe
	scall WaitNPCStep
	xor a
	scall PlayerFace
	script_sleep 60
	playmusic SONG_TITLE
	ld c, $14
	ld e, $23
	ld a, $01
	scall Func_80080
	showperson $01
	move_person $01, Data_8d602, 1
	scall WaitNPCStep
	sprite_face $02, $01
	writenpctext TreeBitstreamText_3d465
	sprite_face $03, $01
	script_sleep 30
	move_person $01, Data_8d608, 1
	scall WaitNPCStep
	sprite_face $03, $01
	ld c, $14
	ld e, $23
	xor a
	scall Func_80080
	showperson 0
	move_person 0, Data_8d60c, 1
	scall WaitNPCStep
	sprite_face $00, 0
	script_sleep 60
	sprite_face $02, 0
	writenpctext TreeBitstreamText_3d4a3
	sprite_face $03, $01
	writenpctext TreeBitstreamText_3d51a
	sprite_face $02, $01
	sprite_face $01, 0
	script_sleep 30
	sprite_face $02, 0
	playmusic SONG_NONE
.asm_8d6e1:
	writenpctext_yesorno TreeBitstreamText_3d552
	or a
	jp nz, .asm_8d75c
	playmusic SONG_TOWN1
	writenpctext TreeBitstreamText_3d59c
	sprite_face $03, $01
	script_sleep 30
	sprite_face $02, $01
	script_sleep 30
	sprite_face $03, $01
	script_sleep 30
	sprite_face $02, $01
	script_sleep 30
	writenpctext TreeBitstreamText_3d5d0
	writenpctext TreeBitstreamText_3d60c
	move_person 0, Data_8d612, 0
	move_person $01, Data_8d616, 1
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	jp .asm_8d76a
.asm_8d75c:
	playsfx SFX_69
	writenpctext TreeBitstreamText_3d63e
	jp .asm_8d6e1
.asm_8d76a:
	ret
Func_8d76b:
	ld l, $03
	push hl
	showperson 0
	ld c, $10
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
.asm_8d77e:
	cp l
	jp nc, .asm_8d790
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp .asm_8d77e
.asm_8d790:
	push hl
	playsfx SFX_69
	writenpctext TreeBitstreamText_3d404
	xor a
	pop hl
.asm_8d79e:
	cp l
	jp nc, .asm_8d7b1
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp .asm_8d79e
.asm_8d7b1:
	hideperson 0
	ret
Func_8d7b8:
	ld l, $06
	push hl
	showperson $01
	ld c, $0d
	ld e, $23
	ld a, $01
	scall Func_80080
	xor a
	pop hl
.asm_8d7cd:
	cp l
	jp nc, .asm_8d7df
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp .asm_8d7cd
.asm_8d7df:
	push hl
	playsfx SFX_68
	script_sleep 30
	playsfx SFX_68
	writenpctext TreeBitstreamText_3d442
	xor a
	pop hl
.asm_8d7f8:
	cp l
	jp nc, .asm_8d80b
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp .asm_8d7f8
.asm_8d80b:
	hideperson $01
	ret
Func_8d813:
	ld l, $09
	push hl
	showperson 0
	ld c, $0a
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
.asm_8d826:
	cp l
	jp nc, .asm_8d843
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d83d
	xor a
	scall Func_80653
.asm_8d83d:
	pop af
	inc a
	pop hl
	jp .asm_8d826
.asm_8d843:
	push hl
	playsfx SFX_69
	writenpctext TreeBitstreamText_3d37a
	xor a
	pop hl
.asm_8d851:
	cp l
	jp nc, .asm_8d870
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $03
	jp nz, .asm_8d86a
	ld a, $01
	scall Func_80653
.asm_8d86a:
	pop af
	inc a
	pop hl
	jp .asm_8d851
.asm_8d870:
	hideperson 0
	ret
Func_8d877:
	ld l, $0c
	push hl
	showperson $01
	ld c, $07
	ld e, $23
	ld a, $01
	scall Func_80080
	xor a
	pop hl
.asm_8d88c:
	cp l
	jp nc, .asm_8d8a9
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d8a3
	xor a
	scall Func_80653
.asm_8d8a3:
	pop af
	inc a
	pop hl
	jp .asm_8d88c
.asm_8d8a9:
	push hl
	playsfx SFX_68
	script_sleep 30
	playsfx SFX_68
	writenpctext TreeBitstreamText_3d2d1
	xor a
	pop hl
.asm_8d8c2:
	cp l
	jp nc, .asm_8d8e1
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d8db
	ld a, $01
	scall Func_80653
.asm_8d8db:
	pop af
	inc a
	pop hl
	jp .asm_8d8c2
.asm_8d8e1:
	hideperson $01
	ret
Func_8d8e9:
	ld l, $0f
	push hl
	showperson 0
	ld c, $04
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
.asm_8d8fc:
	cp l
	jp nc, .asm_8d919
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d913
	xor a
	scall Func_80653
.asm_8d913:
	pop af
	inc a
	pop hl
	jp .asm_8d8fc
.asm_8d919:
	push hl
	playsfx SFX_69
	writenpctext TreeBitstreamText_3d278
	xor a
	pop hl
.asm_8d927:
	cp l
	jp nc, .asm_8d946
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, .asm_8d940
	ld a, $01
	scall Func_80653
.asm_8d940:
	pop af
	inc a
	pop hl
	jp .asm_8d927
.asm_8d946:
	hideperson 0
	ret

Data_8d94d:
	db $1e, $15, $ff, $ff

Data_8d951:
	db $1f, $15, $ff, $ff

Func_8d955:
	ld a, e
	or a
	jp nz, .asm_8d9bb
	writetext_yesorno TreeBitstreamText_3d552
	or a
	jp nz, .asm_8d9b5
	writenpctext TreeBitstreamText_3d59c
	sprite_face $01, $01
	script_sleep 45
	sprite_face $01, 0
	writenpctext TreeBitstreamText_3d5d0
	sprite_face $02, 0
	script_sleep 30
	sprite_face $02, $01
	writenpctext TreeBitstreamText_3d60c
	move_person 0, Data_8d94d, 0
	move_person $01, Data_8d951, 1
	scall WaitNPCStep
	jp .asm_8d9bb
.asm_8d9b5:
	writenpctext TreeBitstreamText_3d63e
.asm_8d9bb:
	ret

Data_8d9bc:
	db $2a, $03, $04, $03, $22, $12

Data_8d9c2:
	db $2a, $00, $04, $08, $22, $0d

Data_8d9c8:
	db $2a, $00, $04, $08, $22, $0a

Data_8d9ce:
	db $2a, $00, $04, $08, $22, $07

Data_8d9d4:
	db $2a, $00, $04, $08, $22, $04

Data_8d9da:
	db $2a, $00, $04, $08, $22, $01

Data_8d9e0:
	db $2a, $02, $04, $06, $22, $00

Data_8d9e6:
	db $2a, $08, $04, $08, $22, $0a

Data_8d9ec:
	db $2a, $04, $04, $04, $22, $0f

Data_8d9f2:
	db $2a, $04, $04, $04, $22, $0c

Data_8d9f8:
	db $2a, $04, $04, $04, $22, $09

Data_8d9fe:
	db $2a, $04, $04, $04, $22, $06

Data_8da04:
	db $2a, $04, $04, $04, $22, $03

Data_8da0a:
	db $2a, $04, $04, $04, $22, $00

Data_8da10:
	db $0c, $12, $01, $01, $07, $11

Data_8da16:
	db $2a, $0a, $04, $02, $22, $05

Data_8da1c:
	db $2a, $0a, $04, $02, $22, $08

Data_8da22:
	db $2a, $0a, $04, $01, $22, $00

Func_8da28:
	ld a, [wc78d]
	cp $01
	jp z, .asm_8db0e
	cp $02
	jp z, .asm_8daf9
	cp $03
	jp z, .asm_8dade
	cp $04
	jp z, .asm_8dac3
	cp $05
	jp z, .asm_8da9c
	cp $06
	jp z, .asm_8da75
	cp $07
	jp nz, .asm_8db1a
	ld hl, Data_8d9ec
	scall Func_80d9b
	ld hl, Data_8d9f2
	scall Func_80d9b
	ld hl, Data_8d9f8
	scall Func_80d9b
	ld hl, Data_8d9fe
	scall Func_80d9b
	ld hl, Data_8da04
	scall Func_80d9b
	ld hl, Data_8da0a
	scall Func_80d9b
	jp .asm_8db1a
.asm_8da75:
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	ld hl, Data_8d9da
	scall Func_80d9b
	ld hl, Data_8d9e0
	scall Func_80d9b
	jp .asm_8db1a
.asm_8da9c:
	ld hl, Data_8da22
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	ld hl, Data_8d9da
	scall Func_80d9b
	jp .asm_8db1a
.asm_8dac3:
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	jp .asm_8db1a
.asm_8dade:
	ld hl, Data_8da16
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	jp .asm_8db1a
.asm_8daf9:
	ld hl, Data_8da1c
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	jp .asm_8db1a
.asm_8db0e:
	ld hl, Data_8d9e6
	scall Func_80d9b
	ld hl, Data_8d9bc
	scall Func_80d9b
.asm_8db1a:
	ld a, [wc790]
	or a
	jp z, .asm_8db2f
	ld a, [wc790]
	cp $07
	jp nc, .asm_8db2f
	ld hl, Data_8da10
	scall Func_80d9b
.asm_8db2f:
	scall Func_80f02
	ret

Func_8db33:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_8dd7d
	face_player -$03
	ld a, [wc796]
	or a
	jp nz, .asm_8dbd3
	ld a, $17
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_8dbd0
	writenpctext TreeBitstreamText_44000
	ld a, $17
	scall Func_80e7d
	cp $01
	jp nz, .asm_8dbc7
	writenpctext TreeBitstreamText_440c4
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_8dbb3
	playsfx SFX_68
	writenpctext TreeBitstreamText_440f4
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
	give_robot ROTOR, a, $00
	ld a, $01
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	call Func_8dd96
	jp .asm_8dbc4
.asm_8dbb3:
	playsfx SFX_69
	writenpctext TreeBitstreamText_44185
	call Func_8dd96
	jp .asm_8dd7d
.asm_8dbc4:
	jp .asm_8dbd0
.asm_8dbc7:
	writetext TreeBitstreamText_45a40
	jp .asm_8dd7d
.asm_8dbd0:
	jp .asm_8dd1f
.asm_8dbd3:
	ld a, [wc796]
	cp $07
	jp nz, .asm_8dc63
	ld a, $50
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_8dc60
	writenpctext TreeBitstreamText_44000
	ld a, $50
	scall Func_80e7d
	cp $01
	jp nz, .asm_8dc57
	writenpctext TreeBitstreamText_44213
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_8dc43
	playsfx SFX_68
	writenpctext TreeBitstreamText_44239
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
	give_robot SUMISU, a, $00
	ld a, $08
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	call Func_8dd96
	jp .asm_8dc54
.asm_8dc43:
	playsfx SFX_69
	writenpctext TreeBitstreamText_44185
	call Func_8dd96
	jp .asm_8dd7d
.asm_8dc54:
	jp .asm_8dc60
.asm_8dc57:
	writetext TreeBitstreamText_45a40
	jp .asm_8dd7d
.asm_8dc60:
	jp .asm_8dd1f
.asm_8dc63:
	ld a, $17
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_8dc7d
	ld a, $50
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_8dd1f
.asm_8dc7d:
	ld a, [wc796]
	cp $08
	jp z, .asm_8dd07
	cp $06
	jp z, .asm_8dd07
	cp $0a
	jp z, .asm_8dcf8
	cp $05
	jp z, .asm_8dcf8
	cp $0c
	jp z, .asm_8dce9
	cp $04
	jp z, .asm_8dce9
	cp $0d
	jp z, .asm_8dcda
	cp $03
	jp z, .asm_8dcda
	cp $0b
	jp z, .asm_8dccb
	cp $02
	jp z, .asm_8dccb
	cp $09
	jp z, .asm_8dcbc
	cp $01
	jp nz, .asm_8dd16
.asm_8dcbc:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp .asm_8dd1c
.asm_8dccb:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp .asm_8dd1c
.asm_8dcda:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp .asm_8dd1c
.asm_8dce9:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp .asm_8dd1c
.asm_8dcf8:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp .asm_8dd1c
.asm_8dd07:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b20
	jp .asm_8dd1c
.asm_8dd16:
	writenpctext TreeBitstreamText_44000
.asm_8dd1c:
	jp .asm_8dd7d
.asm_8dd1f:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_8dd7d
	ld a, [wc796]
	cp $08
	jp nc, .asm_8dd49
	ld a, [wc796]
	cp $01
	jp c, .asm_8dd49
	writenpctext TreeBitstreamText_44000
	writenpctext TreeBitstreamText_441b3
	call Func_8dd96
	jp .asm_8dd7d
.asm_8dd49:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_8dd5a
	writenpctext TreeBitstreamText_44000
	jp .asm_8dd7d
.asm_8dd5a:
	ld a, [wc796]
	cp $08
	jp c, .asm_8dd6e
	writenpctext TreeBitstreamText_4428f
	call Func_8dd96
	jp .asm_8dd7d
.asm_8dd6e:
	writenpctext TreeBitstreamText_44000
	writenpctext TreeBitstreamText_44051
	call Func_8dd96
.asm_8dd7d:
	pop bc
	pop bc
	ret

Func_8dd80:
	ld a, e
	cp $02
	jp nz, .asm_8dd8b
	ld a, $07
	ld [wc78a], a
.asm_8dd8b:
	ret

Data_8dd8c:
	db $14, $08, $ff, $ff

Data_8dd90:
	db $0d, $07, $14, $08, $ff, $ff

Func_8dd96:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, .asm_8ddc0
	script_sleep 30
	playsfx SFX_2E
	move_person $08, Data_8dd90, 1
	scall WaitNPCStep
	hideperson $08
	jp .asm_8dddf
.asm_8ddc0:
	script_sleep 30
	playsfx SFX_2E
	move_person $08, Data_8dd8c, 1
	scall WaitNPCStep
	hideperson $08
.asm_8dddf:
	ret
