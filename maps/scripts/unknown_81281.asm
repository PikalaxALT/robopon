Data_810b4:
	warpdef $0c, $04, $01, $01, MAP_N_A,   $ff, $ff, $ff, $ff, SFX_2E
	warpdef $1c, $0e, $01, $01, MAP_N_A,   $ff, $ff, $ff, $ff, SFX_2E
	warpdef $11, $14, $01, $01, MAP_00_01, $01, $07, $01, $06, SFX_34
	warpdef $10, $0c, $01, $01, MAP_00_10, $06, $0e, $06, $0d, SFX_2E
	warpdef $09, $0e, $01, $01, MAP_00_03, $01, $08, $01, $07, SFX_34
	warpdef $09, $07, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34

Data_810f6: ; 810f6
	warpdef $1b, $14, $01, $01, MAP_32_03, $01, $08, $01, $07, SFX_2E

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
	person_event $24, $0c, $15, $0d, $01, $01, $00, $04, $00, NULL, NULL
	person_event $18, $04, $14, $0c, $01, $01, $02, $04, $00, NULL, NULL
	person_event $11, $04, $16, $0c, $01, $01, $02, $04, $00, NULL, NULL

Data_81169:
	person_event $02, $04, $0d, $06, $01, $01, $03, $04, $00, Func_81607, NULL, NULL
	person_event $0b, $0c, $0c, $06, $01, $01, $01, $04, $00, Func_81607, NULL, NULL
	person_event $ff, $00, $0c, $06, $01, $01, $00, $04, $01, Func_81973, NULL, NULL
	person_event $22, $0c, $1a, $0d, $01, $01, $02, $04, $00, Func_81811, NULL, NULL
	person_event $0b, $0c, $1a, $0e, $01, $01, $00, $04, $00, Func_81811, NULL, NULL
	person_event $ff, $00, $1a, $0e, $01, $01, $00, $04, $01, Func_819b0, NULL, NULL

Data_811bd: ; 811bd
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $0d, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $1b, $0d, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $1b, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81115
	person_event $ff, $00, $08, $08, $01, $01, $00, $04, $00, Func_819ea, NULL
	person_event $ff, $00, $08, $0f, $01, $01, $00, $04, $00, Func_81a22, NULL

Data_81211:
	person_event $03, $04, $0a, $11, $01, $01, $02, $04, $00, PrintTextFacePlayerYesOrNo_20, Data_81123
	person_event $07, $04, $18, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_20, Data_81119

Data_8122d:
	person_event $07, $04, $0b, $08, $01, $01, $01, $02, $00, PrintTextFacePlayer_20, Data_8112b
	person_event $0c, $04, $0d, $08, $01, $01, $03, $02, $00, PrintTextFacePlayer_20, Data_8112f
	person_event $05, $04, $0b, $0a, $01, $01, $01, $00, $00, PrintTextFacePlayer_20, Data_81133
	person_event $01, $04, $0d, $0a, $01, $01, $03, $00, $00, PrintTextFacePlayer_20, Data_81137

Data_81265: ; 81265
	person_event $ff, $00, $1b, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_8111f

Data_81273: ; 81273
	person_event $ff, $00, $1b, $14, $01, $01, $00, $04, $01, Func_81a5a, NULL

Func_81281::
	call Func_81427
	ld hl, Func_81427
	scall Func_80f11
	ld e, $4
	ld hl, Data_81101
	scall Func_80ce7
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
	ld a, $1
	ld [wc7e2], a
	xor a
	ld [wc791], a
	loadwarps $6, Data_810b4
	ld a, $1
	scall LoadPlayerSprite
	ld a, [wc793]
	or a
	jp z, .asm_812c9
	ld a, [wc793]
	cp $2
	jp z, .asm_812c9
	ld a, [wc793]
	cp $3
	jp nz, .asm_813ff
.asm_812c9: ; 812c9 (20:52c9)
	checkevent $c
	or a
	jp nz, .asm_812ec
	loadpeople $3, Data_8113f
	scall Func_8001c
	call Func_814c1
	setevent $c
	jp .asm_813fc

.asm_812ec: ; 812ec (20:52ec)
	checkevent $2
	or a
	jp z, .asm_81300
	checkevent $3
	or a
	jp nz, .asm_8137b
.asm_81300: ; 81300 (20:5300)
	loadpeople $6, Data_81169
	checkevent $2
	cp $1
	jp nz, .asm_8133b
	checkevent $3
	cp $1
	jp nz, .asm_8132e
	hideperson 0
	hideperson $2
	jp .asm_81334

.asm_8132e: ; 8132e (20:532e)
	sprite_face $2, 0
.asm_81334: ; 81334 (20:5334)
	hideperson $1
.asm_8133b: ; 8133b (20:533b)
	checkevent $3
	cp $1
	jp nz, .asm_8137b
	checkevent $4
	cp $1
	jp z, .asm_8135c
	checkevent $2
	cp $1
	jp nz, .asm_8136d
.asm_8135c: ; 8135c (20:535c)
	hideperson $3
	hideperson $5
	jp .asm_81374

.asm_8136d: ; 8136d (20:536d)
	sprite_face $3, $3
.asm_81374: ; 81374 (20:5374)
	hideperson $4
.asm_8137b: ; 8137b (20:537b)
	loadpeople $6, Data_811bd
	checkevent $21
	cp $1
	jp nz, .asm_813ba
	checkevent $46
	or a
	jp nz, .asm_813ba
	loadpeople $4, Data_8122d
	ld a, [wc790]
	or a
	jp z, .asm_813b7
	ld a, [wc790]
	cp $7
	jp nc, .asm_813b7
	ld de, Data_8113b
	ld a, $7
	scall SetPersonTextPointer
.asm_813b7: ; 813b7 (20:53b7)
	jp .asm_813c2

.asm_813ba: ; 813ba (20:53ba)
	loadpeople $2, Data_81211
.asm_813c2: ; 813c2 (20:53c2)
	ld a, [wc790]
	or a
	jp z, .asm_813ec
	ld a, [wc790]
	cp $7
	jp nc, .asm_813ec
	loadwarps $1, Data_810f6
	ld de, Data_8113b
	ld a, $7
	scall SetPersonTextPointer
	loadpeople $1, Data_81273
	jp .asm_813f4

.asm_813ec: ; 813ec (20:53ec)
	loadpeople $1, Data_81265
.asm_813f4: ; 813f4 (20:53f4)
	playmusic SONG_TOWN1
	scall Func_8001c
.asm_813fc: ; 813fc (20:53fc)
	jp .asm_81402

.asm_813ff: ; 813ff (20:53ff)
	scall Func_8001c
.asm_81402: ; 81402 (20:5402)
	ret

Data_81403:
	db $1d, $04, $04, $02, $0e, $0b

Data_81409:
	db $1d, $00, $04, $03, $0e, $08

Data_8140f:
	db $1d, $00, $04, $05, $0e, $06

Data_81415:
	db $1d, $00, $04, $05, $0e, $04

Data_8141b:
	db $1d, $03, $04, $02, $0e, $09

Data_81421:
	db $11, $14, $01, $01, $1b, $14

Func_81427: ; 81427 (20:5427)
	ld a, [wc78c]
	cp $5
	jp c, .asm_81449
	ld a, [wc78c]
	cp $a
	jp nc, .asm_81449
	ld hl, Data_81409
	scall Func_80d9b
	ld hl, Data_81403
	scall Func_80d9b
	scall Func_80f02
	jp .asm_81490

.asm_81449: ; 81449 (20:5449)
	ld a, [wc78c]
	cp $a
	jp c, .asm_8146b
	ld a, [wc78c]
	cp $f
	jp nc, .asm_8146b
	ld hl, Data_8140f
	scall Func_80d9b
	ld hl, Data_81403
	scall Func_80d9b
	scall Func_80f02
	jp .asm_81490

.asm_8146b: ; 8146b (20:546b)
	ld a, [wc78c]
	cp $f
	jp c, .asm_81490
	ld a, [wc78c]
	cp $15
	jp nc, .asm_81490
	ld hl, Data_8141b
	scall Func_80d9b
	ld hl, Data_81415
	scall Func_80d9b
	ld hl, Data_81403
	scall Func_80d9b
	scall Func_80f02
.asm_81490: ; 81490 (20:5490)
	ld a, [wc790]
	or a
	jp z, .asm_814a8
	ld a, [wc790]
	cp $7
	jp nc, .asm_814a8
	ld hl, Data_81421
	scall Func_80d9b
	scall Func_80f02
.asm_814a8: ; 814a8 (20:54a8)
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
	scall WaitNPCStep
	xor a
	scall PlayerFace
	loademote $1, $1, $20
	hideperson $1
	hideperson $2
	playsfx $36
	script_sleep 30
	scall WaitEmote
	loademote $1, $2, $20
	playsfx $36
	scall WaitEmote
	playsfx $39
	ld a, $f
	scall FadeOutAudio
	playmusic SONG_NONE
	scall HideEmote
	writenpctext TreeBitstreamText_390e8
	ld a, $1
	scall FadeInAudio
	playmusic SONG_TOWN1
	loademote $1, $2, $1
	hideperson 0
	scall WaitEmote
	script_sleep 60
	showperson 0
	scall HideEmote
	sprite_face $0, 0
	sprite_face $1, 0
	sprite_face $2, 0
	sprite_face $3, 0
	sprite_face $2, 0
	script_sleep 30
	writenpctext TreeBitstreamText_3911a
	writetext TreeBitstreamText_3914e
	xor a
	scall NamingScreen
	writenpctext TreeBitstreamText_39167
	writenpctext TreeBitstreamText_3917e
	script_sleep 60
	loademote $1, $1, $5
	ld e, $d
	ld a, $15
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	script_sleep 30
	scall HideEmote
	writenpctext TreeBitstreamText_391fd
	move_person 0, Data_814bb, 0
	move_player $1, Data_814b3
	ret

Data_815d0:
	db $00, $00, $00, $01, $00, $c5, $c7, $00, $00, SCREWY + 1, $01, SCREWY + 1, $01, $04, $1e, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_815f9: ; 815f9
	db $0b, $07, $0d, $07, $ff, $ff

Data_815ff: ; 815ff
	db $0d, $07, $ff, $ff

Data_81603: ; 81603
	db $0c, $00, $ff, $ff

Func_81607:
	ld a, e
	or a
	jp nz, .asm_8171a
	checkevent $2
	or a
	jp nz, .asm_81704
	ld a, [wPlayerFacing]
	cp FACE_RIGHT
	jp nz, .asm_8162b
	move_player $0, Data_815f9
	jp .asm_81635

.asm_8162b: ; 8162b (20:562b)
	move_player $0, Data_815ff
.asm_81635: ; 81635 (20:5635)
	xor a
	scall PlayerFace
	ld a, $a
	scall FadeOutAudio
	playmusic SONG_NONE
	sprite_face FACE_DOWN, 0
	sprite_face FACE_DOWN, $1
	ld a, $1
	scall FadeInAudio
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_3969a ; Brother, he took my ice cream!
	writenpctext TreeBitstreamText_396d0 ; Yum yum this ice cream is good!
	writetext_yesorno TreeBitstreamText_396ec ; Do you wish to engage in mortal combat to retrieve the ice cream that was stolen from your little brother and thus redeem his honor?
	or a
	jp nz, .asm_816da
	startbattle Data_8171b, Data_815d0
	or a
	jp nz, .won
	jp .asm_8171a

.won
	writenpctext TreeBitstreamText_396fd
	move_person $1, Data_81603, 0
	playsfx $2e
	scall WaitNPCStep
	hideperson $1
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	checkevent $3
	or a
	jp nz, .asm_816cc
	writenpctext TreeBitstreamText_3972e
	writenpctext TreeBitstreamText_39760
	writenpctext TreeBitstreamText_3976c
	jp .asm_816cf

.asm_816cc: ; 816cc (20:56cc)
	call Func_8172f
.asm_816cf: ; 816cf (20:56cf)
	setevent $2
	jp .asm_81701

.asm_816da: ; 816da (20:56da)
	playsfx $69
	writenpctext TreeBitstreamText_39718
	script_sleep 30
	sprite_face FACE_LEFT, 0
	sprite_face FACE_RIGHT, $1
	playmusic SONG_NONE
	playmusic SONG_TOWN1
.asm_81701: ; 81701 (20:5701)
	jp .asm_8171a

.asm_81704: ; 81704 (20:5704)
	checkevent $3
	or a
	jp nz, .asm_81717
	writenpctext TreeBitstreamText_397b1
	jp .asm_8171a

.asm_81717: ; 81717 (20:5717)
	call Func_8172f
.asm_8171a: ; 8171a (20:571a)
	ret

Data_8171b:
	dstr "(こふﾞん1)"

Data_81723: ; 81723
	db $0c, $08, $ff, $ff

Data_81727: ; 81727
	db $0c, $09, $ff, $ff

Data_8172b: ; 8172b
	db $0c, $0e, $ff, $ff

Func_8172f: ; 8172f (20:572f)
	checkevent $4
	or a
	jp nz, .asm_817c9
	ld c, $e
	ld e, $c
	ld a, $3
	scall Func_80080
	writenpctext TreeBitstreamText_397dc
	writenpctext TreeBitstreamText_397ed
	script_sleep 30
	playmusic SONG_ENCOUNTER_UNKNOWN
	move_person $3, Data_81727, 0
	scall WaitNPCStep
	script_sleep 30
	move_player $1, Data_81723
	scall WaitNPCStep
	ld a, $2
	scall PlayerFace
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	writenpctext TreeBitstreamText_398d5
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
	playsfx $2e
	move_person $3, Data_8172b, 0
	scall WaitNPCStep
	hideperson $3
	setevent $4
	jp .asm_817d3

.asm_817c9: ; 817c9 (20:57c9)
	face_player 0
	writenpctext TreeBitstreamText_399d1
.asm_817d3: ; 817d3 (20:57d3)
	ret

Data_817d4:
	db $00, $00, $00, $01, $00, $c5, $c7, $00, $00, STIMY + 1, $01, STIMY + 1, $01, $04, $05, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_817fd: ; 817fd
	db $1f, $0e, $ff, $ff

Data_81801: ; 81801
	db $19, $0d, $ff, $ff

Data_81805: ; 81805
	db $1a, $0f, $18, $0f, $18, $12, $ff, $ff

Data_8180d: ; 8180d
	db $19, $0d, $ff, $ff

Func_81811:
	ld a, e
	or a
	jp nz, .asm_81966
	checkevent $3
	or a
	jp nz, .asm_8193b
	move_player $1, Data_8180d
	ld a, $1
	scall PlayerFace
	ld a, $a
	scall FadeOutAudio
	playmusic SONG_NONE
	sprite_face $3, $3
	sprite_face $3, $4
	ld a, $1
	scall FadeInAudio
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_397f7
	writenpctext TreeBitstreamText_3981d
	writenpctext TreeBitstreamText_39839
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, .asm_81910
	startbattle Data_81967, Data_817d4
	or a
	jp nz, .asm_8187c
	jp .asm_81966

.asm_8187c: ; 8187c (20:587c)
	writenpctext TreeBitstreamText_3985c
	move_person $4, Data_817fd, 0
	playsfx $2e
	scall WaitNPCStep
	hideperson $4
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	checkevent $2
	or a
	jp nz, .asm_818b7
	writenpctext TreeBitstreamText_39889
	jp .asm_81905

.asm_818b7: ; 818b7 (20:58b7)
	move_player $1, Data_81801
	scall WaitNPCStep
	ld a, $1
	scall PlayerFace
	writenpctext TreeBitstreamText_398ba
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
	playsfx $2e
	move_person $3, Data_81805, 1
	ld a, $2
	scall PlayerFace
	scall WaitNPCStep
	hideperson $3
	hideperson 0
.asm_81905: ; 81905 (20:5905)
	setevent $3
	jp .asm_81938

.asm_81910: ; 81910 (20:5910)
	playsfx $69
	writenpctext TreeBitstreamText_39847
	script_sleep 30
	sprite_face $2, $3
	sprite_face $0, $4
	playmusic SONG_NONE
	playmusic SONG_TOWN1
.asm_81938: ; 81938 (20:5938)
	jp .asm_81966

.asm_8193b: ; 8193b (20:593b)
	checkevent $2
	or a
	jp nz, .asm_8194e
	writenpctext TreeBitstreamText_39889
	jp .asm_81966

.asm_8194e: ; 8194e (20:594e)
	writenpctext TreeBitstreamText_398ba
	writenpctext TreeBitstreamText_398e4
	writenpctext TreeBitstreamText_39944
	writenpctext TreeBitstreamText_39953
.asm_81966: ; 81966 (20:5966)
	ret

Data_81967:
	dstr "(こふﾞん2)"

Data_8196f: ; 8196f
	db $0c, $07, $ff, $ff

Func_81973:
	push de
	checkevent $3
	or a
	jp nz, .asm_819aa
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, .asm_819aa
	sprite_face $3, 0
	writenpctext TreeBitstreamText_3976c
	ld a, $1
	scall PlayerFace
	move_player $1, Data_8196f
	scall WaitNPCStep
	sprite_face $2, 0
.asm_819aa: ; 819aa (20:59aa)
	pop bc
	ret

Data_819ac:
	db $19, $0e, $ff, $ff

Func_819b0:
	push de
	checkevent $2
	or a
	jp nz, .asm_819e8
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, .asm_819e8
	sprite_face $2, $3
	writenpctext TreeBitstreamText_39889
	xor a
	scall PlayerFace
	move_player $1, Data_819ac
	scall WaitNPCStep
	sprite_face $3, $3
.asm_819e8: ; 819e8 (20:59e8)
	pop bc
	ret

Func_819ea:
	ld a, e
	cp $1
	jp nz, .asm_81a21
	ld a, [wPlayerFacing]
	cp $1
	jp z, .asm_819fb
	jp .asm_81a21

.asm_819fb: ; 819fb (20:59fb)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $1
	ld [wSpawnPushX], a
	ld a, $7
	ld [wSpawnPushY], a
	playsfx $2e
	ld a, $8
	ld [wBackupMapX], a
	ld a, $8
	ld [wBackupMapY], a
.asm_81a21: ; 81a21 (20:5a21)
	ret

Func_81a22:
	ld a, e
	cp $1
	jp nz, .asm_81a59
	ld a, [wPlayerFacing]
	cp $1
	jp z, .asm_81a33
	jp .asm_81a59

.asm_81a33: ; 81a33 (20:5a33)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $1
	ld [wSpawnPushX], a
	ld a, $7
	ld [wSpawnPushY], a
	playsfx $2e
	ld a, $8
	ld [wBackupMapX], a
	ld a, $f
	ld [wBackupMapY], a
.asm_81a59: ; 81a59 (20:5a59)
	ret

Func_81a5a:
	ld a, e
	cp $2
	jp nz, .asm_81a65
	ld a, $6
	ld [wc78a], a
.asm_81a65: ; 81a65 (20:5a65)
	ret

