
Data_a90b4:
	warpdef $20, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $11, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, SFX_34
	warpdef $0e, $13, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $12, $13, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $14, $1a, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $18, $1a, $01, $01, MAP_32_06, $06, $0c, $06, $0b, SFX_34
	warpdef $09, $10, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $1e, $19, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $06, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $0a, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $0e, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $17, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $1b, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $1f, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $07, $0f, $01, $01, MAP_24_10, $05, $1a, $05, $19, SFX_34

Data_a9159:
	dtext_tree_pointer TreeBitstreamText_42280
	dw -1

Data_a915d:
	dtext_tree_pointer TreeBitstreamText_4238a
	dw -1

Data_a9161:
	dtext_tree_pointer TreeBitstreamText_420bf
	dw -1

Data_a9165:
	dtext_tree_pointer TreeBitstreamText_42221
	dw -1

Data_a9169:
	dtext_tree_pointer TreeBitstreamText_4209c
	dw -1

Data_a916d:
	dtext_tree_pointer TreeBitstreamText_4217a
	dw -1

Data_a9171:
	dtext_tree_pointer TreeBitstreamText_4229c
	dw -1

Data_a9175:
	dtext_tree_pointer TreeBitstreamText_466e2
	dw -1

Data_a9179:
	db $5c, $10, $13, $11, $46
	db $5d, $08, $1b, $11, $4f

Data_a9183:
	person_event $00, $04, $08, $1f, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_a9159
	person_event $02, $04, $1b, $18, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a915d
	person_event $27, $04, $11, $1a, $01, $01, $03, $04, $00, Func_a94fe, NULL
	person_event $04, $04, $16, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9161
	person_event $04, $04, $1f, $15, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_a9165
	person_event $26, $04, $06, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9169
	person_event $26, $04, $0c, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a916d
	person_event $27, $04, $06, $17, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9171
	person_event $ff, $00, $1f, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $ff, $00, $1f, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $0f, $04, $06, $1f, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $1f, $01, $01, $02, $04, $00, Func_a95d7, NULL

Func_a922b:: ; a922b
	set_frame_script Func_a933a
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $14
	ld a, $0c
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1c
	ld a, $0f
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1b
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $14
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $12
	ld a, $15
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $19
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1a
	ld a, $1c
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1b
	ld a, $19
	scall Func_80f24
	pop bc
	loadwarps $0f, Data_a90b4
	ld a, $01
	scall LoadPlayerSprite
	ld a, $0a
	ld [wc7e2], a
	ld a, $07
	ld [wc789], a
	checkevent $0044
	or a
	jp nz, .asm_a92e4
	playmusic SONG_NONE
	scall Func_8001c
	call Func_a93b6
	jp .asm_a9303
.asm_a92e4:
	ld e, $02
	ld hl, Data_a9179
	scall Func_80ce7
	loadpeople $0c, Data_a9183
	hideperson $0a
	playmusic SONG_TOWN1
	scall Func_8001c
.asm_a9303:
	ret

Data_a9304:
	db $16, $0e, $03, $01, $16, $0f

Data_a930a:
	db $16, $0e, $01, $01, $1a, $0f

Data_a9310:
	db $0d, $0f, $06, $01, $10, $10

Data_a9316:
	db $11, $0f, $02, $01, $14, $11

Data_a931c:
	db $1e, $0f, $03, $01, $16, $0f

Data_a9322:
	db $1e, $0f, $01, $01, $1a, $0f

Data_a9328:
	db $1a, $14, $03, $01, $13, $10

Data_a932e:
	db $0d, $10, $03, $01, $10, $10

Data_a9334:
	db $1a, $14, $02, $01, $14, $11

Func_a933a:
	checkevent $00bf
	cp $01
	jp nz, .asm_a9351
	ld hl, Data_a931c
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9351:
	checkevent $00c1
	cp $01
	jp nz, .asm_a9368
	ld hl, Data_a9322
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9368:
	checkevent $0044
	or a
	jp nz, .asm_a9390
	ld hl, Data_a9304
	scall Func_80d9b
	ld hl, Data_a930a
	scall Func_80d9b
	ld hl, Data_a9310
	scall Func_80d9b
	ld hl, Data_a9316
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9390:
	ld hl, Data_a931c
	scall Func_80d9b
	ld hl, Data_a9322
	scall Func_80d9b
	ld hl, Data_a9328
	scall Func_80d9b
	ld hl, Data_a932e
	scall Func_80d9b
	ld hl, Data_a9334
	scall Func_80d9b
	scall Func_80f02
.asm_a93b1:
	ret

Data_a93b2:
	db $14, $0f, $ff, $ff

Func_a93b6:
	call Func_a933a
	scall Func_80f02
	playsfx SFX_65
	scall StartShakingScreen
	script_sleep 30
	loademote $01, $01, $05
	playsfx SFX_24
	scall WaitEmote
	script_sleep 30
	scall HideEmote
	scall StopShakingScreen
	script_sleep 30
	xor a
.asm_a93ee:
	cp $05
	jp nc, .asm_a9400
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_a93ee
.asm_a9400:
	scall StartShakingScreen
	script_sleep 30
	playsfx SFX_45
	loademote $01, $04, $12
	ld e, $16
	ld a, $18
	scall MoveEmote
	setevent $00bf
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	scall HideEmote
	script_sleep 30
	playsfx SFX_45
	loademote $01, $04, $12
	ld e, $16
	ld a, $1b
	scall MoveEmote
	resetevent $00bf
	setevent $00c1
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	scall HideEmote
	scall StopShakingScreen
	script_sleep 30
	xor a
.asm_a9473:
	cp $02
	jp nc, .asm_a9485
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_a9473
.asm_a9485:
	scall StartShakingScreen
	script_sleep 30
	loademote $01, $08, $12
	ld e, $16
	ld a, $17
	scall MoveEmote
	playsfx SFX_45
	resetevent $00c1
	setevent $0044
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	script_sleep 30
	scall HideEmote
	scall StopShakingScreen
	xor a
.asm_a94c9:
	cp $07
	jp nc, .asm_a94da
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_a94c9
.asm_a94da:
	script_sleep 30
	move_player $01, Data_a93b2
	script_sleep 30
	warp_player MAP_24_00, $14, $0f
	pop bc
	ret

Func_a94fe:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_a95d4
	face_player -$03
	ld a, [wc796]
	cp $0e
	jp nz, .asm_a9599
	ld a, $83
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a9596
	writenpctext TreeBitstreamText_44c92
	ld a, $83
	scall Func_80e7d
	cp $01
	jp nz, .asm_a958d
	writenpctext TreeBitstreamText_44d13
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, .asm_a957c
	playsfx SFX_68
	writenpctext TreeBitstreamText_44d53
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
IF DEF(SUN)
	ld a, $a9
ELIF DEF(STAR)
	ld a, $aa
ENDC
	scall GiveRobot
	ld a, $0f
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a958a
.asm_a957c:
	playsfx SFX_69
	writenpctext TreeBitstreamText_44dc8
	jp .asm_a95d4
.asm_a958a:
	jp .asm_a9596
.asm_a958d:
	writetext TreeBitstreamText_45a40
	jp .asm_a95d4
.asm_a9596:
	jp .asm_a95af
.asm_a9599:
	ld a, $83
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a95af
	writetext TreeBitstreamText_45a76
	jp .asm_a95d4
.asm_a95af:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_a95d4
	ld a, [wc796]
	cp $0f
	jp nz, .asm_a95c8
	writenpctext TreeBitstreamText_44df3
	jp .asm_a95d4
.asm_a95c8:
	writenpctext TreeBitstreamText_44c92
	writenpctext TreeBitstreamText_44ceb
.asm_a95d4:
	pop bc
	pop bc
	ret

Func_a95d7:
	ld a, e
	or a
	jp nz, .asm_a96de
	checkevent $00de
	or a
	jp nz, .asm_a96d8
	playsfx SFX_5E
	loademote $02, $02, $08
	ld e, $1f
	ld a, $06
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_28
	showperson $0a
	playsfx SFX_60
	sprite_face $03, $0a
	sprite_face $00, $0a
	sprite_face $01, $0a
	sprite_face $02, $0a
	sprite_face $03, $0a
	sprite_face $00, $0a
	sprite_face $01, $0a
	sprite_face $02, $0a
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player $0a
	script_sleep 30
	ld c, $0d
	ld e, $14
	ld a, $0a
	scall Func_80e8d
	setevent $00de
	playsfx SFX_60
	sprite_face $03, $0a
	sprite_face $00, $0a
	sprite_face $01, $0a
	sprite_face $02, $0a
	sprite_face $03, $0a
	sprite_face $00, $0a
	sprite_face $01, $0a
	sprite_face $02, $0a
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TOWN1
	face_player $0a
	hideperson $0a
	jp .asm_a96de
.asm_a96d8:
	writetext TreeBitstreamText_3f79e
.asm_a96de:
	ret
