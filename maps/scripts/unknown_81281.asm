Data_810b4:
	warpdef $0c, $04, $01, $01, MAP_N_A,  $ff, $ff, $ff, $ff, $2e
	warpdef $1c, $0e, $01, $01, MAP_N_A,  $ff, $ff, $ff, $ff, $2e
	warpdef $11, $14, $01, $01, MAP_00_01,  $01, $07, $01, $06, $34
	warpdef $10, $0c, $01, $01, MAP_00_10, $06, $0e, $06, $0d, $2e
	warpdef $09, $0e, $01, $01, MAP_00_03,  $01, $08, $01, $07, $34
	warpdef $09, $07, $01, $01, MAP_32_02, $01, $0a, $01, $09, $34

Data_810f6: ; 810f6
	warpdef $1b, $14, $01, $01, MAP_32_03, $01, $08, $01, $07, $2e

Data_81101:
	db $56, $07, $07, $03, $02
	db $57, $06, $10, $01, $4c
	db $58, $07, $10, $01, $2f
	db $59, $0f, $10, $11, $33

Data_81115:
	dtext_tree_pointer TreeBitstreamText_4650d
	dw -1

Data_81119:
	dtext_tree_pointer TreeBitstreamText_3f384
	dtext_tree_pointer TreeBitstreamText_3f3c4
	dw -1

Data_8111f:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_81123:
	dtext_tree_pointer TreeBitstreamText_3f436
	dtext_tree_pointer TreeBitstreamText_3f449
	dtext_tree_pointer TreeBitstreamText_3f463
	dw -1

Data_8112b:
	dtext_tree_pointer TreeBitstreamText_3f4fb
	dw -1

Data_8112f:
	dtext_tree_pointer TreeBitstreamText_3f51d
	dw -1

Data_81133:
	dtext_tree_pointer TreeBitstreamText_3f55b
	dw -1

Data_81137:
	dtext_tree_pointer TreeBitstreamText_3f58e
	dw -1

Data_8113b:
	dtext_tree_pointer TreeBitstreamText_3f406
	dw -1

Data_8113f:
	person_event $24, $0c, $15, $0d, $01, $01, $00, $04, $00, $20, 0
	person_event $18, $04, $14, $0c, $01, $01, $02, $04, $00, $20, 0
	person_event $11, $04, $16, $0c, $01, $01, $02, $04, $00, $20, 0

Data_81169:
	person_event $02, $04, $0d, $06, $01, $01, $03, $04, $00, 0, Func_81607, 0
	person_event $0b, $0c, $0c, $06, $01, $01, $01, $04, $00, 0, Func_81607, 0
	person_event $ff, $00, $0c, $06, $01, $01, $00, $04, $01, 0, Func_81973, 0
	person_event $22, $0c, $1a, $0d, $01, $01, $02, $04, $00, 0, Func_81811, 0
	person_event $0b, $0c, $1a, $0e, $01, $01, $00, $04, $00, 0, Func_81811, 0
	person_event $ff, $00, $1a, $0e, $01, $01, $00, $04, $01, 0, Func_819b0, 0

Data_811bd: ; 811bd
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, 0, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $0d, $05, $01, $01, $00, $04, $00, 0, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $1b, $0d, $01, $01, $00, $04, $00, 0, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $1b, $0f, $01, $01, $00, $04, $00, 0, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $08, $08, $01, $01, $00, $04, $00, 0, Func_819ea, 0
	person_event $ff, $00, $08, $0f, $01, $01, $00, $04, $00, 0, Func_81a22, 0

Data_81211:
	person_event $03, $04, $0a, $11, $01, $01, $02, $04, $00, 0, PrintTextFacePlayerYesOrNo_20, Data_81123
	person_event $07, $04, $18, $14, $01, $01, $02, $04, $00, 0, PrintTextFacePlayer_20, Data_81119

Data_8122d:
	person_event $07, $04, $0b, $08, $01, $01, $01, $02, $00, 0, PrintTextFacePlayer_20, Data_8112b
	person_event $0c, $04, $0d, $08, $01, $01, $03, $02, $00, 0, PrintTextFacePlayer_20, Data_8112f
	person_event $05, $04, $0b, $0a, $01, $01, $01, $00, $00, 0, PrintTextFacePlayer_20, Data_81133
	person_event $01, $04, $0d, $0a, $01, $01, $03, $00, $00, 0, PrintTextFacePlayer_20, Data_81137

Data_81265: ; 81265
	person_event $ff, $00, $1b, $14, $01, $01, $00, $04, $00, 0, PrintTextFacePlayer_20, Data_8111f

Data_81273: ; 81273
	person_event $ff, $00, $1b, $14, $01, $01, $00, $04, $01, 0, Func_81a5a, 0

Func_81281:
	call Func_81427
	ld hl, Func_81427
	call Func_80f11_20
	ld e, $4
	ld hl, Data_81101
	call Func_80ce7_20
	ld a, $2
	call Func_80c94_20
	ld a, $d
	call Func_80c94_20
	ld a, $1
	ld [wc7e2], a
	xor a
	ld [wc791], a
	loadwarps $6, Data_810b4
	ld a, $1
	call Func_80cc6_20
	ld a, [wc793]
	or a
	jp z, Func_812c9
	ld a, [wc793]
	cp $2
	jp z, Func_812c9
	ld a, [wc793]
	cp $3
	jp nz, Func_813ff
Func_812c9: ; 812c9 (20:52c9)
	checkevent $c
	or a
	jp nz, Func_812ec
	loadpeople $3, Data_8113f
	call Func_8001c_20
	call Func_814c1
	setevent $c
	jp Func_813fc

Func_812ec: ; 812ec (20:52ec)
	checkevent $2
	or a
	jp z, Func_81300
	checkevent $3
	or a
	jp nz, Func_8137b
Func_81300: ; 81300 (20:5300)
	loadpeople $6, Data_81169
	checkevent $2
	cp $1
	jp nz, Func_8133b
	checkevent $3
	cp $1
	jp nz, Func_8132e
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	ld e, $0
	ld a, $2
	call SetPersonVisibilityState_20
	jp Func_81334

Func_8132e: ; 8132e (20:532e)
	ld e, $2
	xor a
	call SpriteFace_20
Func_81334: ; 81334 (20:5334)
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
Func_8133b: ; 8133b (20:533b)
	checkevent $3
	cp $1
	jp nz, Func_8137b
	checkevent $4
	cp $1
	jp z, Func_8135c
	checkevent $2
	cp $1
	jp nz, Func_8136d
Func_8135c: ; 8135c (20:535c)
	ld e, $0
	ld a, $3
	call SetPersonVisibilityState_20
	ld e, $0
	ld a, $5
	call SetPersonVisibilityState_20
	jp Func_81374

Func_8136d: ; 8136d (20:536d)
	sprite_face $3, $3
Func_81374: ; 81374 (20:5374)
	ld e, $0
	ld a, $4
	call SetPersonVisibilityState_20
Func_8137b: ; 8137b (20:537b)
	loadpeople $6, Data_811bd
	checkevent $21
	cp $1
	jp nz, Func_813ba
	checkevent $46
	or a
	jp nz, Func_813ba
	loadpeople $4, Data_8122d
	ld a, [wc790]
	or a
	jp z, Func_813b7
	ld a, [wc790]
	cp $7
	jp nc, Func_813b7
	ld de, Data_8113b
	ld a, $7
	call Func_80150_20
Func_813b7: ; 813b7 (20:53b7)
	jp Func_813c2

Func_813ba: ; 813ba (20:53ba)
	loadpeople $2, Data_81211
Func_813c2: ; 813c2 (20:53c2)
	ld a, [wc790]
	or a
	jp z, Func_813ec
	ld a, [wc790]
	cp $7
	jp nc, Func_813ec
	loadwarps $1, Data_810f6
	ld de, Data_8113b
	ld a, $7
	call Func_80150_20
	loadpeople $1, Data_81273
	jp Func_813f4

Func_813ec: ; 813ec (20:53ec)
	loadpeople $1, Data_81265
Func_813f4: ; 813f4 (20:53f4)
	playmusic SONG_TOWN1
	call Func_8001c_20
Func_813fc: ; 813fc (20:53fc)
	jp Func_81402

Func_813ff: ; 813ff (20:53ff)
	call Func_8001c_20
Func_81402: ; 81402 (20:5402)
	ret

Data_81403:
	dr $81403, $81409

Data_81409:
	dr $81409, $8140f

Data_8140f:
	dr $8140f, $81415

Data_81415:
	dr $81415, $8141b

Data_8141b:
	dr $8141b, $81421

Data_81421:
	dr $81421, $81427

Func_81427: ; 81427 (20:5427)
	ld a, [wc78c]
	cp $5
	jp c, Func_81449
	ld a, [wc78c]
	cp $a
	jp nc, Func_81449
	ld hl, Data_81409
	call Func_80d9b_20
	ld hl, Data_81403
	call Func_80d9b_20
	call Func_80f02_20
	jp Func_81490

Func_81449: ; 81449 (20:5449)
	ld a, [wc78c]
	cp $a
	jp c, Func_8146b
	ld a, [wc78c]
	cp $f
	jp nc, Func_8146b
	ld hl, Data_8140f
	call Func_80d9b_20
	ld hl, Data_81403
	call Func_80d9b_20
	call Func_80f02_20
	jp Func_81490

Func_8146b: ; 8146b (20:546b)
	ld a, [wc78c]
	cp $f
	jp c, Func_81490
	ld a, [wc78c]
	cp $15
	jp nc, Func_81490
	ld hl, Data_8141b
	call Func_80d9b_20
	ld hl, Data_81415
	call Func_80d9b_20
	ld hl, Data_81403
	call Func_80d9b_20
	call Func_80f02_20
Func_81490: ; 81490 (20:5490)
	ld a, [wc790]
	or a
	jp z, Func_814a8
	ld a, [wc790]
	cp $7
	jp nc, Func_814a8
	ld hl, Data_81421
	call Func_80d9b_20
	call Func_80f02_20
Func_814a8: ; 814a8 (20:54a8)
	ret

Data_814a9:
	db $11, $17
	db $b, $17
	db $b, $e
	db $15, $e
	db $ff, $ff

Data_814b3:
	db $15, $d
	db $10, $d
	db $10, $c
	db $ff, $ff

Data_814bb:
	db $10, $d
	db $10, $c
	db $ff, $ff

Func_814c1: ; 814c1 (20:54c1)
	playmusic SONG_WILD_BATTLE
	move_player $1, Data_814a9
	call Func_8020c_20
	xor a
	call PlayerFace_20
	loademote $1, $1, $20
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	ld e, $0
	ld a, $2
	call SetPersonVisibilityState_20
	playsfx $36
	script_sleep $1e
	call Func_801d5_20
	loademote $1, $2, $20
	playsfx $36
	call Func_801d5_20
	playsfx $39
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	call Func_8018b_20
	writenpctext TreeBitstreamText_390e8
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_TOWN1
	loademote $1, $2, $1
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	call Func_801d5_20
	script_sleep $3c
	ld e, $1
	xor a
	call SetPersonVisibilityState_20
	call Func_8018b_20
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld e, $3
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	script_sleep $1e
	writenpctext TreeBitstreamText_3911a
	writetext TreeBitstreamText_3914e
	xor a
	call NamingScreen_20
	writenpctext TreeBitstreamText_39167
	writenpctext TreeBitstreamText_3917e
	script_sleep $3c
	loademote $1, $1, $5
	ld e, $d
	ld a, $15
	call ShowEmote_20
	playsfx $28
	call Func_801d5_20
	script_sleep $1e
	call Func_8018b_20
	writenpctext TreeBitstreamText_391fd
	ld bc, Data_814bb
	ld e, BANK(Data_814bb)
	xor a
	call Func_801f7_20
	move_player $1, Data_814b3
	ret

Data_815d0:
	dr $815d0, $815f9

Data_815f9: ; 815f9
	dr $815f9, $815ff

Data_815ff: ; 815ff
	dr $815ff, $81603

Data_81603: ; 81603
	dr $81603, $81607

Func_81607:
	ld a, e
	or a
	jp nz, Func_8171a
	checkevent $2
	or a
	jp nz, Func_81704
	ld a, [wPlayerFacing]
	cp FACE_RIGHT
	jp nz, Func_8162b
	move_player $0, Data_815f9
	jp Func_81635

Func_8162b: ; 8162b (20:562b)
	move_player $0, Data_815ff
Func_81635: ; 81635 (20:5635)
	xor a
	call PlayerFace_20
	ld a, $a
	call FadeOutAudio_20
	playmusic SONG_NONE
	ld e, FACE_DOWN
	xor a
	call SpriteFace_20
	ld e, FACE_DOWN
	ld a, $1
	call SpriteFace_20
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_3969a
	writenpctext TreeBitstreamText_396d0
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_816da
	startbattle Data_8171b, Data_815d0
	or a
	jp nz, .won
	jp Func_8171a

.won
	writenpctext TreeBitstreamText_396fd
	ld bc, Data_81603
	ld e, BANK(Data_81603)
	ld a, $1
	call Func_801f7_20
	playsfx $2e
	call Func_8020c_20
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	script_sleep $1e
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	checkevent $3
	or a
	jp nz, Func_816cc
	writenpctext TreeBitstreamText_3972e
	writenpctext TreeBitstreamText_39760
	writenpctext TreeBitstreamText_3976c
	jp Func_816cf

Func_816cc: ; 816cc (20:56cc)
	call Func_8172f
Func_816cf: ; 816cf (20:56cf)
	setevent $2
	jp Func_81701

Func_816da: ; 816da (20:56da)
	playsfx $69
	writenpctext TreeBitstreamText_39718
	script_sleep $1e
	ld e, FACE_LEFT
	xor a
	call SpriteFace_20
	ld e, FACE_RIGHT
	ld a, $1
	call SpriteFace_20
	playmusic SONG_NONE
	playmusic SONG_TOWN1
Func_81701: ; 81701 (20:5701)
	jp Func_8171a

Func_81704: ; 81704 (20:5704)
	checkevent $3
	or a
	jp nz, Func_81717
	writenpctext TreeBitstreamText_397b1
	jp Func_8171a

Func_81717: ; 81717 (20:5717)
	call Func_8172f
Func_8171a: ; 8171a (20:571a)
	ret

Data_8171b:
	db "(こふﾞん1)", $0

Data_81723: ; 81723
	dr $81723, $81727

Data_81727: ; 81727
	dr $81727, $8172b

Data_8172b: ; 8172b
	dr $8172b, $8172f

Func_8172f: ; 8172f (20:572f)
	checkevent $4
	or a
	jp nz, Func_817c9
	ld c, $e
	ld e, $c
	ld a, $3
	call Func_80080_20
	writenpctext TreeBitstreamText_397dc
	writenpctext TreeBitstreamText_397ed
	script_sleep $1e
	playmusic SONG_ENCOUNTER_UNKNOWN
	ld bc, Data_81727
	ld e, BANK(Data_81727)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	script_sleep $1e
	move_player $1, Data_81723
	call Func_8020c_20
	ld a, $2
	call PlayerFace_20
	script_sleep $1e
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	writenpctext TreeBitstreamText_398d5
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
	playsfx $2e
	ld bc, Data_8172b
	ld e, BANK(Data_8172b)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call SetPersonVisibilityState_20
	setevent $4
	jp Func_817d3

Func_817c9: ; 817c9 (20:57c9)
	face_player 0
	writenpctext TreeBitstreamText_399d1
Func_817d3: ; 817d3 (20:57d3)
	ret

Data_817d4:
	dr $817d4, $817fd

Data_817fd: ; 817fd
	dr $817fd, $81801

Data_81801: ; 81801
	dr $81801, $81805

Data_81805: ; 81805
	dr $81805, $8180d

Data_8180d: ; 8180d
	dr $8180d, $81811

Func_81811:
	ld a, e
	or a
	jp nz, Func_81966
	checkevent $3
	or a
	jp nz, Func_8193b
	move_player $1, Data_8180d
	ld a, $1
	call PlayerFace_20
	ld a, $a
	call FadeOutAudio_20
	playmusic SONG_NONE
	sprite_face $3, $3
	sprite_face $3, $4
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_397f7
	writenpctext TreeBitstreamText_3981d
	writenpctext TreeBitstreamText_39839
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_81910
	startbattle Data_81967, Data_817d4
	or a
	jp nz, Func_8187c
	jp Func_81966

Func_8187c: ; 8187c (20:587c)
	writenpctext TreeBitstreamText_3985c
	ld bc, Data_817fd
	ld e, BANK(Data_817fd)
	ld a, $4
	call Func_801f7_20
	playsfx $2e
	call Func_8020c_20
	ld e, $0
	ld a, $4
	call SetPersonVisibilityState_20
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	checkevent $2
	or a
	jp nz, Func_818b7
	writenpctext TreeBitstreamText_39889
	jp Func_81905

Func_818b7: ; 818b7 (20:58b7)
	move_player $1, Data_81801
	call Func_8020c_20
	ld a, $1
	call PlayerFace_20
	writenpctext TreeBitstreamText_398ba
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
	playsfx $2e
	ld bc, Data_81805
	ld e, BANK(Data_81805)
	ld a, $3
	call Func_80688_20
	ld a, $2
	call PlayerFace_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call SetPersonVisibilityState_20
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
Func_81905: ; 81905 (20:5905)
	setevent $3
	jp Func_81938

Func_81910: ; 81910 (20:5910)
	playsfx $69
	writenpctext TreeBitstreamText_39847
	script_sleep $1e
	sprite_face $2, $3
	sprite_face $0, $4
	playmusic SONG_NONE
	playmusic SONG_TOWN1
Func_81938: ; 81938 (20:5938)
	jp Func_81966

Func_8193b: ; 8193b (20:593b)
	checkevent $2
	or a
	jp nz, Func_8194e
	writenpctext TreeBitstreamText_39889
	jp Func_81966

Func_8194e: ; 8194e (20:594e)
	writenpctext TreeBitstreamText_398ba
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
Func_81966: ; 81966 (20:5966)
	ret

Data_81967:
	db "(こふﾞん2)", $0

Data_8196f: ; 8196f
	dr $8196f, $81973

Func_81973:
	push de
	checkevent $3
	or a
	jp nz, Func_819aa
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819aa
	ld e, $3
	xor a
	call SpriteFace_20
	writenpctext TreeBitstreamText_3976c
	ld a, $1
	call PlayerFace_20
	move_player $1, Data_8196f
	call Func_8020c_20
	ld e, $2
	xor a
	call SpriteFace_20
Func_819aa: ; 819aa (20:59aa)
	pop bc
	ret

Data_819ac:
	dr $819ac, $819b0

Func_819b0:
	push de
	checkevent $2
	or a
	jp nz, Func_819e8
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819e8
	sprite_face $2, $3
	writenpctext TreeBitstreamText_39889
	xor a
	call PlayerFace_20
	move_player $1, Data_819ac
	call Func_8020c_20
	sprite_face $3, $3
Func_819e8: ; 819e8 (20:59e8)
	pop bc
	ret

Func_819ea:
	ld a, e
	cp $1
	jp nz, Func_81a21
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_819fb
	jp Func_81a21

Func_819fb: ; 819fb (20:59fb)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	call Func_80dff_20
	pop bc
	ld a, $1
	ld [wc7e9], a
	ld a, $7
	ld [wc7ea], a
	playsfx $2e
	ld a, $8
	ld [wBackupMapX], a
	ld a, $8
	ld [wBackupMapY], a
Func_81a21: ; 81a21 (20:5a21)
	ret

Func_81a22:
	ld a, e
	cp $1
	jp nz, Func_81a59
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_81a33
	jp Func_81a59

Func_81a33: ; 81a33 (20:5a33)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	call Func_80dff_20
	pop bc
	ld a, $1
	ld [wc7e9], a
	ld a, $7
	ld [wc7ea], a
	playsfx $2e
	ld a, $8
	ld [wBackupMapX], a
	ld a, $f
	ld [wBackupMapY], a
Func_81a59: ; 81a59 (20:5a59)
	ret

Func_81a5a:
	ld a, e
	cp $2
	jp nz, Func_81a65
	ld a, $6
	ld [wc78a], a
Func_81a65: ; 81a65 (20:5a65)
	ret

