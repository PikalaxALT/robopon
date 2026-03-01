
Data_9d0b4:
	warpdef $11, $1c, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $1b, $0e, $01, $01, MAP_18_01, $03, $0b, $03, $0a, SFX_34
	warpdef $1e, $1a, $01, $01, MAP_18_10, $05, $15, $05, $14, SFX_2E

Data_9d0d5:
IF DEF(SUN)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4d, $20, $25, $39, $2a, $12, $00, $10, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ELIF DEF(STAR)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4c, $20, $25, $46, $01, $01, $01, $05, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ENDC

Data_9d10d:
	dtext_tree_pointer TreeBitstreamText_42df1
	dw -1

Data_9d111:
	dtext_tree_pointer TreeBitstreamText_43c84
	dw -1

Data_9d115:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, Func_9d36b, NULL
	person_event $ff, $00, $0b, $07, $01, $01, $00, $04, $00, Func_9d3a1, NULL
	person_event $ff, $00, $0b, $14, $01, $01, $00, $04, $00, Func_9d3d7, NULL
	person_event $ff, $00, $11, $18, $01, $01, $00, $04, $00, Func_9d42b, NULL
	person_event $ff, $00, $19, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9d10d

Data_9d15b:
	person_event $0f, $04, $1d, $1b, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0a, $0c, $23, $1b, $01, $01, $00, $04, $00, NULL, NULL
	person_event $08, $04, $20, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d185:
	person_event $0a, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_808fc_27, Data_9d111

Data_9d193:
	person_event $06, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_9daea, NULL
	person_event $1d, $04, $1e, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d1af:
	person_event $0f, $04, $1e, $0e, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $1e, $0e, $01, $01, $02, $04, $00, Func_9db30, NULL

Func_9d1cb:: ; 9d1cb
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$02
	scall Func_80f94
	ld hl, sp+$05
	ld l, [hl]
	ld h, $00
	ld de, $003c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$06
	ld l, [hl]
	ld h, $00
	add hl, de
	pop de
	push hl
	ld a, $0b
	ld [wc7e2], a
	checkevent $00f2
	cp $01
	jp nz, .asm_9d203
	ld a, $06
	ld [wc795], a
	jp .asm_9d207
.asm_9d203:
	xor a
	ld [wc795], a
.asm_9d207:
	set_frame_script Func_9d344
	resetevent $0010
	loadwarps $03, Data_9d0b4
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_9d0d5
	playmusic SONG_TOWN1
	ld a, $01
	scall LoadPlayerSprite
	loadpeople $02, Data_9d1af
	hideperson 0
	ld a, [wBackupMapGroup]
	cp $12
	jp nz, .asm_9d255
	ld a, [wBackupMapNumber]
	cp $01
	jp z, .asm_9d25d
.asm_9d255:
	ld a, [wBackupMapGroup]
	cp $ff
	jp nz, .asm_9d2ab
.asm_9d25d:
	checkevent $00b9
	cp $01
	jp nz, .asm_9d29d
	loadpeople $02, Data_9d193
	pop hl
	push hl
	ld de, $0438
	call CompareHLtoDE
	jp c, .asm_9d290
	pop hl
	push hl
	ld de, $04b0
	call CompareHLtoDE
	jp nc, .asm_9d290
	hideperson $03
	jp .asm_9d297
.asm_9d290:
	hideperson $02
.asm_9d297:
	scall Func_8001c
	jp .asm_9d2a8
.asm_9d29d:
	loadpeople $01, Data_9d185
	scall Func_8001c
.asm_9d2a8:
	jp .asm_9d31f
.asm_9d2ab:
	ld a, [wBackupMapGroup]
	cp $12
	jp nz, .asm_9d31c
	ld a, [wBackupMapNumber]
	cp $11
	jp nz, .asm_9d31c
	checkevent $00bb
	or a
	jp z, .asm_9d2ed
	checkevent $00bc
	or a
	jp z, .asm_9d2ed
	checkevent $00bd
	or a
	jp z, .asm_9d2ed
	checkevent $00be
	or a
	jp z, .asm_9d2ed
	checkevent $00ee
	or a
	jp nz, .asm_9d316
.asm_9d2ed:
	loadpeople $03, Data_9d15b
	hideperson $02
	hideperson $04
	ld a, $12
	ld [wBackupMapGroup], a
	ld a, $0a
	ld [wBackupMapNumber], a
	scall Func_8001c
	call Func_9d4a7
	jp .asm_9d319
.asm_9d316:
	scall Func_8001c
.asm_9d319:
	jp .asm_9d31f
.asm_9d31c:
	scall Func_8001c
.asm_9d31f:
	loadpeople $05, Data_9d115
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_9d32c:
	db $00, $00, $01, $01, $17, $09

Data_9d332:
	db $00, $00, $01, $01, $17, $14

Data_9d338:
	db $06, $04, $01, $01, $17, $09

Data_9d33e:
	db $06, $04, $01, $01, $17, $14

Func_9d344:
	ld a, [wc795]
	cp $06
	jp z, .asm_9d35b
	ld hl, Data_9d32c
	scall Func_80d9b
	ld hl, Data_9d332
	scall Func_80d9b
	jp .asm_9d367
.asm_9d35b:
	ld hl, Data_9d338
	scall Func_80d9b
	ld hl, Data_9d33e
	scall Func_80d9b
.asm_9d367:
	scall Func_80f02
	ret

Func_9d36b:
	ld a, e
	or a
	jp nz, .asm_9d3a0
	ld a, [wc795]
	cp $06
	jp z, .asm_9d3a0
	ld a, [wc795]
	cp $03
	jp z, .asm_9d388
	ld a, [wc795]
	cp $04
	jp nz, .asm_9d396
.asm_9d388:
	ld a, $04
	ld [wc795], a
	writetext TreeBitstreamText_42dac
	jp .asm_9d3a0
.asm_9d396:
	xor a
	ld [wc795], a
	writetext TreeBitstreamText_42dde
.asm_9d3a0:
	ret

Func_9d3a1:
	ld a, e
	or a
	jp nz, .asm_9d3d6
	ld a, [wc795]
	cp $06
	jp z, .asm_9d3d6
	ld a, [wc795]
	cp $02
	jp z, .asm_9d3be
	ld a, [wc795]
	cp $03
	jp nz, .asm_9d3cc
.asm_9d3be:
	ld a, $03
	ld [wc795], a
	writetext TreeBitstreamText_42d9a
	jp .asm_9d3d6
.asm_9d3cc:
	xor a
	ld [wc795], a
	writetext TreeBitstreamText_42dde
.asm_9d3d6:
	ret

Func_9d3d7:
	ld a, e
	or a
	jp nz, .asm_9d42a
	ld a, [wc795]
	cp $06
	jp z, .asm_9d42a
	ld a, [wc795]
	cp $01
	jp z, .asm_9d3f4
	ld a, [wc795]
	cp $02
	jp nz, .asm_9d402
.asm_9d3f4:
	ld a, $02
	ld [wc795], a
	writetext TreeBitstreamText_42d79
	jp .asm_9d42a
.asm_9d402:
	ld a, [wc795]
	cp $04
	jp z, .asm_9d412
	ld a, [wc795]
	cp $05
	jp nz, .asm_9d420
.asm_9d412:
	ld a, $05
	ld [wc795], a
	writetext TreeBitstreamText_42d89
	jp .asm_9d42a
.asm_9d420:
	xor a
	ld [wc795], a
	writetext TreeBitstreamText_42dde
.asm_9d42a:
	ret

Func_9d42b:
	ld a, e
	or a
	jp nz, .asm_9d4a2
	ld a, [wc795]
	cp $06
	jp z, .asm_9d49c
	ld a, [wc795]
	or a
	jp z, .asm_9d447
	ld a, [wc795]
	cp $01
	jp nz, .asm_9d455
.asm_9d447:
	ld a, $01
	ld [wc795], a
	writetext TreeBitstreamText_42d37
	jp .asm_9d499
.asm_9d455:
	ld a, [wc795]
	cp $05
	jp nz, .asm_9d48e
	ld a, $06
	ld [wc795], a
	writetext TreeBitstreamText_42d69
	script_sleep 60
	scall StartShakingScreen
	script_sleep 120
	writetext TreeBitstreamText_42dc8
	scall StopShakingScreen
	call Func_9d344
	setevent $00f2
	jp .asm_9d499
.asm_9d48e:
	ld a, $01
	ld [wc795], a
	writetext TreeBitstreamText_42dde
.asm_9d499:
	jp .asm_9d4a2
.asm_9d49c:
	writetext TreeBitstreamText_42df1
.asm_9d4a2:
	ret

Data_9d4a3:
	db $21, $1b, $ff, $ff

Func_9d4a7:
	script_sleep 30
	writenpctext TreeBitstreamText_431d7
	playsfx SFX_67
	loademote $01, $01, $2a
	xor a
	scall Func_80653
	scall WaitEmote
	ld a, $01
	scall Func_80653
	showperson $02
	scall HideEmote
	script_sleep 60
	move_person $03, Data_9d4a3, 0
	ld a, $01
	scall PlayerFace
	scall WaitNPCStep
	script_sleep 30
	checkevent $00bb
	or a
	jp nz, .asm_9d50d
	call Func_9d56e
	setevent $00bb
	jp .asm_9d56a
.asm_9d50d:
	checkevent $00bc
	or a
	jp nz, .asm_9d525
	call Func_9d61e
	setevent $00bc
	jp .asm_9d56a
.asm_9d525:
	checkevent $00bd
	or a
	jp nz, .asm_9d53d
	call Func_9d6ce
	setevent $00bd
	jp .asm_9d56a
.asm_9d53d:
	checkevent $00be
	or a
	jp nz, .asm_9d555
	call Func_9d77e
	setevent $00be
	jp .asm_9d56a
.asm_9d555:
	checkevent $00ee
	or a
	jp nz, .asm_9d56a
	call Func_9d83b
	setevent $00ee
.asm_9d56a:
	call Func_9d8fa
	ret

Func_9d56e:
	writenpctext TreeBitstreamText_431e5
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_432c2
	playsfx SFX_59
	loademote $01, $01, $22
	hideperson $02
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	scall HideEmote
	script_sleep 30
	sprite_face $02, $02
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $06, $22
	hideperson $02
	scall WaitEmote
	showperson $02
	scall HideEmote
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_432d3
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	playsfx SFX_68
	script_sleep 45
	playsfx SFX_68
	writenpctext TreeBitstreamText_432e2
	ret

Func_9d61e:
	writenpctext TreeBitstreamText_4338d
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_432c2
	playsfx SFX_59
	loademote $01, $01, $22
	hideperson $02
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	scall HideEmote
	script_sleep 30
	sprite_face $02, $02
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $18, $22
	hideperson $02
	scall WaitEmote
	showperson $02
	scall HideEmote
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_432d3
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	playsfx SFX_68
	script_sleep 45
	playsfx SFX_68
	writenpctext TreeBitstreamText_4347a
	ret

Func_9d6ce:
	writenpctext TreeBitstreamText_434f2
	script_sleep 30
	sprite_face $01, $02
	writenpctext TreeBitstreamText_432c2
	playsfx SFX_59
	loademote $01, $01, $22
	hideperson $02
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	scall HideEmote
	script_sleep 30
	sprite_face $02, $02
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $60, $22
	hideperson $02
	scall WaitEmote
	showperson $02
	scall HideEmote
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_432d3
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	playsfx SFX_68
	script_sleep 45
	playsfx SFX_68
	writenpctext TreeBitstreamText_435b0
	ret

Func_9d77e:
	writenpctext TreeBitstreamText_4365f
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_43761
	playsfx SFX_59
	loademote $01, $01, $22
	hideperson $02
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	scall HideEmote
	script_sleep 30
	sprite_face $02, $02
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $03, $23
	hideperson $02
	scall WaitEmote
	ld c, $19
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	showperson $04
	scall HideEmote
	script_sleep 30
	writenpctext TreeBitstreamText_432d3
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	playsfx SFX_68
	script_sleep 45
	playsfx SFX_68
	writenpctext TreeBitstreamText_4377a
	ret

Data_9d837:
	db $20, $1b, $ff, $ff

Func_9d83b:
	writenpctext TreeBitstreamText_43956
	sprite_face $01, $02
	script_sleep 30
	writenpctext TreeBitstreamText_43a21
	playsfx SFX_59
	loademote $01, $01, $22
	hideperson $02
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	scall HideEmote
	script_sleep 30
	sprite_face $02, $02
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_UNKNOWN
	loademote $01, $0c, $23
	hideperson $02
	move_person $03, Data_9d837, 0
	scall WaitNPCStep
	hideperson $03
	scall WaitEmote
	script_sleep 30
	writenpctext TreeBitstreamText_432d3
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	playsfx SFX_68
	script_sleep 45
	playsfx SFX_68
	writenpctext TreeBitstreamText_43a5a
	ret

Data_9d8ee:
	db $23, $1b, $ff, $ff

Data_9d8f2:
	db $1f, $1b, $ff, $ff

Data_9d8f6:
	db $20, $1b, $ff, $ff

Func_9d8fa:
	push bc
	ld hl, sp+$00
	ld [hl], $00
	checkevent $0053
	or a
	jp nz, .asm_9d910
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d910:
	checkevent $0054
	or a
	jp nz, .asm_9d921
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d921:
	checkevent $0055
	or a
	jp nz, .asm_9d932
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d932:
	checkevent $0056
	or a
	jp nz, .asm_9d943
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d943:
	checkevent $0057
	or a
	jp nz, .asm_9d954
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d954:
	ld hl, sp+$00
	ld a, [hl]
	or a
	jp z, .asm_9da64
	cp $01
	jp z, .asm_9d9fd
	cp $02
	jp z, .asm_9d96f
	cp $03
	jp z, .asm_9d96f
	cp $04
	jp nz, .asm_9dae4
.asm_9d96f:
	script_sleep 30
	writenpctext TreeBitstreamText_43362
	playsfx SFX_59
	move_person $02, Data_9d8f2, 0
	move_person $03, Data_9d8f6, 1
	scall WaitNPCStep
	script_sleep 30
	loademote $01, $20, $23
	ld e, $1b
	ld a, $1f
	scall MoveEmote
	hideperson $02
	scall WaitEmote
	scall HideEmote
	move_person $02, Data_9d8f2, 0
	scall WaitNPCStep
	sprite_face $01, $03
	script_sleep 30
	sprite_face $03, $03
	script_sleep 30
	move_person $03, Data_9d8ee, 0
	scall WaitNPCStep
	hideperson $03
	playsfx SFX_2E
	jp .asm_9dae4
.asm_9d9fd:
	script_sleep 30
	writenpctext TreeBitstreamText_43362
	playsfx SFX_59
	script_sleep 30
	loademote $01, $20, $23
	ld e, $19
	ld a, $20
	scall MoveEmote
	hideperson $02
	scall WaitEmote
	scall HideEmote
	script_sleep 30
	move_person $03, Data_9d8ee, 0
	move_person $04, Data_9d8ee, 1
	scall WaitNPCStep
	hideperson $03
	hideperson $04
	playsfx SFX_2E
	jp .asm_9dae4
.asm_9da64:
	script_sleep 30
	loademote $01, $10, $23
	ld e, $1b
	ld a, $1e
	scall MoveEmote
	ld c, $19
	ld e, $20
	ld a, $02
	scall Func_80080
	showperson $02
	playsfx SFX_33
	script_sleep 30
	playsfx SFX_33
	script_sleep 30
	playsfx SFX_33
	script_sleep 30
	playsfx SFX_33
	scall WaitEmote
	scall HideEmote
	script_sleep 60
	writenpctext TreeBitstreamText_43362
	playsfx SFX_59
	loademote $01, $20, $23
	ld e, $19
	ld a, $20
	scall MoveEmote
	hideperson $02
	scall WaitEmote
	scall HideEmote
.asm_9dae4:
	pop bc
	ret

Data_9dae6:
	db $1d, $1b, $ff, $ff

Func_9daea:
	ld a, e
	or a
	jp nz, .asm_9db2f
	face_player $02
	checkevent $0010
	or a
	jp nz, .asm_9db29
	writenpctext TreeBitstreamText_43c04
	script_sleep 30
	move_person $02, Data_9dae6, 0
	scall WaitNPCStep
	sprite_face $01, $02
	setevent $0010
	jp .asm_9db2f
.asm_9db29:
	writenpctext TreeBitstreamText_43c04
.asm_9db2f:
	ret

Func_9db30:
	ld a, e
	or a
	jp nz, .asm_9dc23
	checkevent $00dc
	or a
	jp nz, .asm_9dc1d
	playsfx SFX_5E
	loademote $02, $02, $08
	ld e, $0e
	ld a, $1e
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_28
	showperson 0
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep 30
	ld c, $0c
	ld e, $09
	ld a, $06
	scall Func_80e8d
	setevent $00dc
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TOWN1
	face_player 0
	hideperson 0
	jp .asm_9dc23
.asm_9dc1d:
	writetext TreeBitstreamText_3f79e
.asm_9dc23:
	ret
