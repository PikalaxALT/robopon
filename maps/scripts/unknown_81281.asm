Data_810b4:
	dr $810b4, $810f6

Data_810f6: ; 810f6
	dr $810f6, $81101

Data_81101:
	dr $81101, $8113b

Data_8113b:
	dr $8113b, $8113f

Data_8113f:
	dr $8113f, $81169

Data_81169:
	dr $81169, $811bd

Data_811bd: ; 811bd
	dr $811bd, $81211

Data_81211:
	dr $81211, $8122d

Data_8122d:
	dr $8122d, $81265

Data_81265: ; 81265
	dr $81265, $81273

Data_81273: ; 81273
	dr $81273, $81281

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
	ld [$c7e2], a
	xor a
	ld [$c791], a
	ld e, $6
	ld hl, Data_810b4
	call LoadMapObjects_20
	ld a, $1
	call Func_80cc6_20
	ld a, [$c793]
	or a
	jp z, Func_812c9
	ld a, [$c793]
	cp $2
	jp z, Func_812c9
	ld a, [$c793]
	cp $3
	jp nz, Func_813ff
Func_812c9: ; 812c9 (20:52c9)
	checkevent $c
	or a
	jp nz, Func_812ec
	ld e, $3
	ld hl, Data_8113f
	call Func_800fb_20
	call Func_8001c_20
	call Func_814c1
	ld e, $1
	ld hl, $c
	call EventFlagAction_20
	jp Func_813fc

Func_812ec: ; 812ec (20:52ec)
	checkevent $2
	or a
	jp z, Func_81300
	checkevent $3
	or a
	jp nz, Func_8137b
Func_81300: ; 81300 (20:5300)
	ld e, $6
	ld hl, Data_81169
	call Func_800fb_20
	checkevent $2
	cp $1
	jp nz, Func_8133b
	checkevent $3
	cp $1
	jp nz, Func_8132e
	ld e, $0
	xor a
	call Func_8013d_20
	ld e, $0
	ld a, $2
	call Func_8013d_20
	jp Func_81334

Func_8132e: ; 8132e (20:532e)
	ld e, $2
	xor a
	call SpriteFace_20
Func_81334: ; 81334 (20:5334)
	ld e, $0
	ld a, $1
	call Func_8013d_20
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
	call Func_8013d_20
	ld e, $0
	ld a, $5
	call Func_8013d_20
	jp Func_81374

Func_8136d: ; 8136d (20:536d)
	ld e, $3
	ld a, $3
	call SpriteFace_20
Func_81374: ; 81374 (20:5374)
	ld e, $0
	ld a, $4
	call Func_8013d_20
Func_8137b: ; 8137b (20:537b)
	ld e, $6
	ld hl, Data_811bd
	call Func_800fb_20
	checkevent $21
	cp $1
	jp nz, Func_813ba
	checkevent $46
	or a
	jp nz, Func_813ba
	ld e, $4
	ld hl, Data_8122d
	call Func_800fb_20
	ld a, [$c790]
	or a
	jp z, Func_813b7
	ld a, [$c790]
	cp $7
	jp nc, Func_813b7
	ld de, Data_8113b
	ld a, $7
	call Func_80150_20
Func_813b7: ; 813b7 (20:53b7)
	jp Func_813c2

Func_813ba: ; 813ba (20:53ba)
	ld e, $2
	ld hl, Data_81211
	call Func_800fb_20
Func_813c2: ; 813c2 (20:53c2)
	ld a, [$c790]
	or a
	jp z, Func_813ec
	ld a, [$c790]
	cp $7
	jp nc, Func_813ec
	ld e, $1
	ld hl, Data_810f6
	call LoadMapObjects_20
	ld de, Data_8113b
	ld a, $7
	call Func_80150_20
	ld e, $1
	ld hl, Data_81273
	call Func_800fb_20
	jp Func_813f4

Func_813ec: ; 813ec (20:53ec)
	ld e, $1
	ld hl, Data_81265
	call Func_800fb_20
Func_813f4: ; 813f4 (20:53f4)
	playmusic $3
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
	ld a, [$c78c]
	cp $5
	jp c, Func_81449
	ld a, [$c78c]
	cp $a
	jp nc, Func_81449
	ld hl, Data_81409
	call Func_80d9b_20
	ld hl, Data_81403
	call Func_80d9b_20
	call Func_80f02_20
	jp Func_81490

Func_81449: ; 81449 (20:5449)
	ld a, [$c78c]
	cp $a
	jp c, Func_8146b
	ld a, [$c78c]
	cp $f
	jp nc, Func_8146b
	ld hl, Data_8140f
	call Func_80d9b_20
	ld hl, Data_81403
	call Func_80d9b_20
	call Func_80f02_20
	jp Func_81490

Func_8146b: ; 8146b (20:546b)
	ld a, [$c78c]
	cp $f
	jp c, Func_81490
	ld a, [$c78c]
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
	ld a, [$c790]
	or a
	jp z, Func_814a8
	ld a, [$c790]
	cp $7
	jp nc, Func_814a8
	ld hl, Data_81421
	call Func_80d9b_20
	call Func_80f02_20
Func_814a8: ; 814a8 (20:54a8)
	ret

Data_814a9:
	dr $814a9, $814b3

Data_814b3:
	dr $814b3, $814bb

Data_814bb:
	dr $814bb, $814c1

Func_814c1: ; 814c1 (20:54c1)
	playmusic $4
	ld c, $1
	ld de, Data_814a9
	ld a, BANK(Data_814a9)
	call ApplyMovementData_20
	call Func_8020c_20
	xor a
	call PlayerFace_20
	ld c, $1
	ld e, $1
	ld a, $20
	call Func_80176_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	ld e, $0
	ld a, $2
	call Func_8013d_20
	playsfx $36
	script_sleep $1e
	call Func_801d5_20
	ld c, $1
	ld e, $2
	ld a, $20
	call Func_80176_20
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
	playmusic $3
	ld c, $1
	ld e, $2
	ld a, $1
	call Func_80176_20
	ld e, $0
	xor a
	call Func_8013d_20
	call Func_801d5_20
	script_sleep $3c
	ld e, $1
	xor a
	call Func_8013d_20
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
	call Func_8021b_20
	writenpctext TreeBitstreamText_39167
	writenpctext TreeBitstreamText_3917e
	script_sleep $3c
	ld c, $1
	ld e, $1
	ld a, $5
	call Func_80176_20
	ld e, $d
	ld a, $15
	call Func_801e4_20
	playsfx $28
	call Func_801d5_20
	script_sleep $1e
	call Func_8018b_20
	writenpctext TreeBitstreamText_391fd
	ld bc, Data_814bb
	ld e, BANK(Data_814bb)
	xor a
	call Func_801f7_20
	ld c, $1
	ld de, Data_814b3
	ld a, BANK(Data_814b3)
	call ApplyMovementData_20
	ret
