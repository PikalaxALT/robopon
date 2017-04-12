INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 20", ROMX, BANK [$20]
	lib_bank_20 20

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
	call Func_8003a_20
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
	ld hl, $c
	call Func_8062e_20
	or a
	jp nz, Func_812ec
	ld e, $3
	ld hl, Data_8113f
	call Func_800fb_20
	call Func_8001c_20
	call Func_814c1
	ld e, $1
	ld hl, $c
	call Func_8061b_20
	jp Func_813fc

Func_812ec: ; 812ec (20:52ec)
	ld hl, $2
	call Func_8062e_20
	or a
	jp z, Func_81300
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_8137b
Func_81300: ; 81300 (20:5300)
	ld e, $6
	ld hl, Data_81169
	call Func_800fb_20
	ld hl, $2
	call Func_8062e_20
	cp $1
	jp nz, Func_8133b
	ld hl, $3
	call Func_8062e_20
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
	call Func_80095_20
Func_81334: ; 81334 (20:5334)
	ld e, $0
	ld a, $1
	call Func_8013d_20
Func_8133b: ; 8133b (20:533b)
	ld hl, $3
	call Func_8062e_20
	cp $1
	jp nz, Func_8137b
	ld hl, $4
	call Func_8062e_20
	cp $1
	jp z, Func_8135c
	ld hl, $2
	call Func_8062e_20
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
	call Func_80095_20
Func_81374: ; 81374 (20:5374)
	ld e, $0
	ld a, $4
	call Func_8013d_20
Func_8137b: ; 8137b (20:537b)
	ld e, $6
	ld hl, Data_811bd
	call Func_800fb_20
	ld hl, $21
	call Func_8062e_20
	cp $1
	jp nz, Func_813ba
	ld hl, $46
	call Func_8062e_20
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
	call Func_8003a_20
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
	ld a, $3
	call Func_80ee6_20
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
	ld a, $4
	call Func_80ee6_20
	ld c, $1
	ld de, Data_814a9
	ld a, BANK(Data_814a9)
	call Func_8063e_20
	call Func_8020c_20
	xor a
	call Func_80677_20
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
	ld a, $36
	call Func_80efe_20
	ld hl, $1e
	call Func_8068f_20
	call Func_801d5_20
	ld c, $1
	ld e, $2
	ld a, $20
	call Func_80176_20
	ld a, $36
	call Func_80efe_20
	call Func_801d5_20
	ld a, $39
	call Func_80efe_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	call Func_8018b_20
	ld hl, $a
	call Func_804a9_20
	ld a, $1
	call Func_8101a_20
	ld a, $3
	call Func_80ee6_20
	ld c, $1
	ld e, $2
	ld a, $1
	call Func_80176_20
	ld e, $0
	xor a
	call Func_8013d_20
	call Func_801d5_20
	ld hl, $3c
	call Func_8068f_20
	ld e, $1
	xor a
	call Func_8013d_20
	call Func_8018b_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld hl, $1e
	call Func_8068f_20
	ld hl, $b
	call Func_804a9_20
	ld hl, $c
	call Func_80498_20
	xor a
	call Func_8021b_20
	ld hl, $d
	call Func_804a9_20
	ld hl, $e
	call Func_804a9_20
	ld hl, $3c
	call Func_8068f_20
	ld c, $1
	ld e, $1
	ld a, $5
	call Func_80176_20
	ld e, $d
	ld a, $15
	call Func_801e4_20
	ld a, $28
	call Func_80efe_20
	call Func_801d5_20
	ld hl, $1e
	call Func_8068f_20
	call Func_8018b_20
	ld hl, $f
	call Func_804a9_20
	ld bc, Data_814bb
	ld e, BANK(Data_814bb)
	xor a
	call Func_801f7_20
	ld c, $1
	ld de, Data_814b3
	ld a, BANK(Data_814b3)
	call Func_8063e_20
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
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_81704
	ld a, [$c838]
	cp $1
	jp nz, Func_8162b
	ld c, $0
	ld de, Data_815f9
	ld a, BANK(Data_815f9)
	call Func_8063e_20
	jp Func_81635

Func_8162b: ; 8162b (20:562b)
	ld c, $0
	ld de, Data_815ff
	ld a, BANK(Data_815ff)
	call Func_8063e_20
Func_81635: ; 81635 (20:5635)
	xor a
	call Func_80677_20
	ld a, $a
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $2
	ld a, $1
	call Func_80095_20
	ld a, $1
	call Func_8101a_20
	ld a, $1a
	call Func_80ee6_20
	ld hl, $16
	call Func_804a9_20
	ld hl, $17
	call Func_804a9_20
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_816da
	ld de, Data_8171b
	ld hl, Data_815d0
	call Func_80dd3_20
	or a
	jp nz, Func_8167f
	jp Func_8171a

Func_8167f: ; 8167f (20:567f)
	ld hl, $19
	call Func_804a9_20
	ld bc, Data_81603
	ld e, BANK(Data_81603)
	ld a, $1
	call Func_801f7_20
	ld a, $2e
	call Func_80efe_20
	call Func_8020c_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	ld hl, $1e
	call Func_8068f_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_816cc
	ld hl, $1b
	call Func_804a9_20
	ld hl, $1c
	call Func_804a9_20
	ld hl, $1d
	call Func_804a9_20
	jp Func_816cf

Func_816cc: ; 816cc (20:56cc)
	call Func_8172f
Func_816cf: ; 816cf (20:56cf)
	ld e, $1
	ld hl, $2
	call Func_8061b_20
	jp Func_81701

Func_816da: ; 816da (20:56da)
	ld a, $69
	call Func_80efe_20
	ld hl, $1a
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $1
	ld a, $1
	call Func_80095_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
Func_81701: ; 81701 (20:5701)
	jp Func_8171a

Func_81704: ; 81704 (20:5704)
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_81717
	ld hl, $1f
	call Func_804a9_20
	jp Func_8171a

Func_81717: ; 81717 (20:5717)
	call Func_8172f
Func_8171a: ; 8171a (20:571a)
	ret

Data_8171b:
	db "<HIRA>こふﾞん1<KATA>$"

Data_81723: ; 81723
	dr $81723, $81727

Data_81727: ; 81727
	dr $81727, $8172b

Data_8172b: ; 8172b
	dr $8172b, $8172f

Func_8172f: ; 8172f (20:572f)
	ld hl, $4
	call Func_8062e_20
	or a
	jp nz, Func_817c9
	ld c, $e
	ld e, $c
	ld a, $3
	call Func_80080_20
	ld hl, $21
	call Func_804a9_20
	ld hl, $22
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $19
	call Func_80ee6_20
	ld bc, Data_81727
	ld e, BANK(Data_81727)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81723
	ld a, BANK(Data_81723)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $2
	call Func_80677_20
	ld hl, $1e
	call Func_8068f_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
	ld hl, $17d
	call Func_804a9_20
	ld hl, $2a
	call Func_804a9_20
	ld hl, $2b
	call Func_804a9_20
	ld hl, $2c
	call Func_804a9_20
	ld a, $2e
	call Func_80efe_20
	ld bc, Data_8172b
	ld e, BANK(Data_8172b)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld e, $1
	ld hl, $4
	call Func_8061b_20
	jp Func_817d3

Func_817c9: ; 817c9 (20:57c9)
	xor a
	call Func_8044b_20
	ld hl, $3bf
	call Func_804a9_20
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
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_8193b
	ld c, $1
	ld de, Data_8180d
	ld a, BANK(Data_8180d)
	call Func_8063e_20
	ld a, $1
	call Func_80677_20
	ld a, $a
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld e, $3
	ld a, $3
	call Func_80095_20
	ld e, $3
	ld a, $4
	call Func_80095_20
	ld a, $1
	call Func_8101a_20
	ld a, $1a
	call Func_80ee6_20
	ld hl, $23
	call Func_804a9_20
	ld hl, $24
	call Func_804a9_20
	ld hl, $25
	call Func_804a9_20
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_81910
	ld de, Data_81967
	ld hl, Data_817d4
	call Func_80dd3_20
	or a
	jp nz, Func_8187c
	jp Func_81966

Func_8187c: ; 8187c (20:587c)
	ld hl, $27
	call Func_804a9_20
	ld bc, Data_817fd
	ld e, BANK(Data_817fd)
	ld a, $4
	call Func_801f7_20
	ld a, $2e
	call Func_80efe_20
	call Func_8020c_20
	ld e, $0
	ld a, $4
	call Func_8013d_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_818b7
	ld hl, $28
	call Func_804a9_20
	jp Func_81905

Func_818b7: ; 818b7 (20:58b7)
	ld c, $1
	ld de, Data_81801
	ld a, BANK(Data_81801)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $1
	call Func_80677_20
	ld hl, $29
	call Func_804a9_20
	ld hl, $2a
	call Func_804a9_20
	ld hl, $2b
	call Func_804a9_20
	ld hl, $2c
	call Func_804a9_20
	ld a, $2e
	call Func_80efe_20
	ld bc, Data_81805
	ld e, BANK(Data_81805)
	ld a, $3
	call Func_80688_20
	ld a, $2
	call Func_80677_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_81905: ; 81905 (20:5905)
	ld e, $1
	ld hl, $3
	call Func_8061b_20
	jp Func_81938

Func_81910: ; 81910 (20:5910)
	ld a, $69
	call Func_80efe_20
	ld hl, $26
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $2
	ld a, $3
	call Func_80095_20
	ld e, $0
	ld a, $4
	call Func_80095_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
Func_81938: ; 81938 (20:5938)
	jp Func_81966

Func_8193b: ; 8193b (20:593b)
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_8194e
	ld hl, $28
	call Func_804a9_20
	jp Func_81966

Func_8194e: ; 8194e (20:594e)
	ld hl, $29
	call Func_804a9_20
	ld hl, $2a
	call Func_804a9_20
	ld hl, $2b
	call Func_804a9_20
	ld hl, $2c
	call Func_804a9_20
Func_81966: ; 81966 (20:5966)
	ret

Data_81967:
	db "<HIRA>こふﾞん2<KATA>$"

Data_8196f: ; 8196f
	dr $8196f, $81973

Func_81973:
	push de
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_819aa
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819aa
	ld e, $3
	xor a
	call Func_80095_20
	ld hl, $1d
	call Func_804a9_20
	ld a, $1
	call Func_80677_20
	ld c, $1
	ld de, Data_8196f
	ld a, BANK(Data_8196f)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $2
	xor a
	call Func_80095_20
Func_819aa: ; 819aa (20:59aa)
	pop bc
	ret

Data_819ac:
	dr $819ac, $819b0

Func_819b0:
	push de
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_819e8
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819e8
	ld e, $2
	ld a, $3
	call Func_80095_20
	ld hl, $28
	call Func_804a9_20
	xor a
	call Func_80677_20
	ld c, $1
	ld de, Data_819ac
	ld a, BANK(Data_819ac)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $3
	ld a, $3
	call Func_80095_20
Func_819e8: ; 819e8 (20:59e8)
	pop bc
	ret

Func_819ea:
	ld a, e
	cp $1
	jp nz, Func_81a21
	ld a, [$c838]
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
	ld [$c7e9], a
	ld a, $7
	ld [$c7ea], a
	ld a, $2e
	call Func_80efe_20
	ld a, $8
	ld [$c7db], a
	ld a, $8
	ld [$c7dc], a
Func_81a21: ; 81a21 (20:5a21)
	ret

Func_81a22:
	ld a, e
	cp $1
	jp nz, Func_81a59
	ld a, [$c838]
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
	ld [$c7e9], a
	ld a, $7
	ld [$c7ea], a
	ld a, $2e
	call Func_80efe_20
	ld a, $8
	ld [$c7db], a
	ld a, $f
	ld [$c7dc], a
Func_81a59: ; 81a59 (20:5a59)
	ret

Func_81a5a:
	ld a, e
	cp $2
	jp nz, Func_81a65
	ld a, $6
	ld [$c78a], a
Func_81a65: ; 81a65 (20:5a65)
	ret

Data_81a66:
	dr $81a66, $81a84

Data_81a84: ; 81a84
	dr $81a84, $81abc

Data_81abc: ; 81abc
	dr $81abc, $81ac1

Func_81ac1:
	ld e, $2
	ld hl, Data_81a66
	call Func_8003a_20
	ld e, $1
	ld hl, Data_81abc
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_81ae8
	ld a, [$c793]
	cp $2
	jp z, Func_81ae8
	ld a, [$c793]
	cp $3
	jp nz, Func_81b20
Func_81ae8: ; 81ae8 (20:5ae8)
	ld hl, $b
	call Func_8062e_20
	or a
	jp nz, Func_81b15
	ld e, $4
	ld hl, Data_81a84
	call Func_800fb_20
	ld a, $2
	call Func_80677_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	call Func_81b45
	ld e, $1
	ld hl, $b
	call Func_8061b_20
	jp Func_81b1d

Func_81b15: ; 81b15 (20:5b15)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81b1d: ; 81b1d (20:5b1d)
	jp Func_81b28

Func_81b20: ; 81b20 (20:5b20)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81b28: ; 81b28 (20:5b28)
	ret

Data_81b29:
	dr $81b29, $81b2d

Data_81b2d: ; 81b2d
	dr $81b2d, $81b31

Data_81b31: ; 81b31
	dr $81b31, $81b35

Data_81b35: ; 81b35
	dr $81b35, $81b39

Data_81b39: ; 81b39
	dr $81b39, $81b3d

Data_81b3d: ; 81b3d
	dr $81b3d, $81b45

Func_81b45: ; 81b45 (20:5b45)
	ld a, $3
	call Func_80677_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	ld hl, $1e
	call Func_8068f_20
	ld bc, Data_81b29
	ld e, BANK(Data_81b29)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld hl, $4
	call Func_804a9_20
	ld e, $1
	ld a, $1
	call Func_80095_20
	ld hl, $5
	call Func_804a9_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call Func_80095_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $2
	call Func_80677_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $3c
	call Func_8068f_20
	ld e, $1
	xor a
	call Func_80095_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $3
	call Func_80677_20
	ld hl, $6
	call Func_804a9_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $2
	call Func_80677_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $1
	xor a
	call Func_80095_20
	ld a, $3
	call Func_80677_20
	ld hl, $7
	call Func_804a9_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld c, $1
	ld de, Data_81b35
	ld a, BANK(Data_81b35)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $2
	call Func_80677_20
	ld hl, $8
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81b39
	ld a, BANK(Data_81b39)
	call Func_8063e_20
	call Func_8020c_20
	ld hl, $9
	call Func_80498_20
	ld c, $1
	ld de, Data_81b3d
	ld a, BANK(Data_81b3d)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $1
	call Func_8101a_20
	ret

Data_81cb4:
	dr $81cb4, $81cbf

Data_81cbf: ; 81cbf
	dr $81cbf, $81cd0

Data_81cd0: ; 81cd0
	dr $81cd0, $81cfa

Data_81cfa: ; 81cfa
	dr $81cfa, $81d40

Data_81d40: ; 81d40
	dr $81d40, $81d4e

Data_81d4e: ; 81d4e
	dr $81d4e, $81d6a

Func_81d6a:
	xor a
	ld [$c793], a
	ld e, $1
	ld hl, Data_81cb4
	call Func_8003a_20
	ld e, $1
	ld hl, Data_81cbf
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_81d95
	ld a, [$c793]
	cp $2
	jp z, Func_81d95
	ld a, [$c793]
	cp $3
	jp nz, Func_81df9
Func_81d95: ; 81d95 (20:5d95)
	ld a, [$c7df]
	cp $1a
	jp nz, Func_81db2
	ld a, [$c7e0]
	or a
	jp nz, Func_81db2
	ld e, $1
	ld hl, Data_81d40
	call Func_800fb_20
	call Func_81f41
	jp Func_81df6

Func_81db2: ; 81db2 (20:5db2)
	ld e, $1
	ld hl, Data_81cb4
	call Func_8003a_20
	ld hl, $a
	call Func_8062e_20
	or a
	jp nz, Func_81de6
	xor a
	call Func_80ee6_20
	xor a
	call Func_80653_20
	ld e, $5
	ld a, $3
	call Func_80664_20
	call Func_81e2b
	ld e, $1
	ld hl, $a
	call Func_8061b_20
	ld a, $1
	ld [$c78c], a
	jp Func_81df6

Func_81de6: ; 81de6 (20:5de6)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81df6: ; 81df6 (20:5df6)
	jp Func_81e22

Func_81df9: ; 81df9 (20:5df9)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld e, $5
	ld hl, Data_81cfa
	call Func_800fb_20
	ld a, $5
	call Func_80d01_20
	ld e, $2
	ld hl, Data_81d4e
	call Func_80d24_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	xor a
	ld [$c793], a
Func_81e22: ; 81e22 (20:5e22)
	ret

Data_81e23:
	dr $81e23, $81e27

Data_81e27: ; 81e27
	dr $81e27, $81e2b

Func_81e2b: ; 81e2b (20:5e2b)
	ld c, $6
	ld e, $1
	ld a, $1f
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld a, $67
	call Func_80efe_20
	ld hl, $3c
	call Func_8068f_20
	ld a, $66
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $34
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $35
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80ea2_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $38
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $36
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3a
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80eb1_20
	ld c, $6
	ld e, $2
	ld a, $1f
	call Func_80176_20
	call Func_801d5_20
	ld hl, $2
	call Func_80498_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call Func_8068f_20
	ld c, $1
	ld de, Data_81e23
	ld a, BANK(Data_81e23)
	call Func_8063e_20
	call Func_801d5_20
	ld a, $3b
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3c
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80ea2_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $39
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3a
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld hl, $1e
	call Func_8068f_20
	call Func_80eb1_20
	ld hl, $1
	call Func_8068f_20
	ld hl, $3
	call Func_80498_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call Func_8068f_20
	call Func_8018b_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81e27
	ld a, BANK(Data_81e27)
	call Func_8063e_20
	call Func_8020c_20
	ret

Data_81f2d:
	dr $81f2d, $81f33

Data_81f33: ; 81f33
	dr $81f33, $81f37

Data_81f37: ; 81f37
	dr $81f37, $81f3d

Data_81f3d: ; 81f3d
	dr $81f3d, $81f41

Func_81f41: ; 81f41 (20:5f41)
	ld bc, $0
Func_81f44: ; 81f44 (20:5f44)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f63
	ld hl, $0
Func_81f52: ; 81f52 (20:5f52)
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f5f
	inc hl
	jp Func_81f52

Func_81f5f: ; 81f5f (20:5f5f)
	inc bc
	jp Func_81f44

Func_81f63: ; 81f63 (20:5f63)
	ld a, $67
	call Func_80efe_20
	ld bc, $0
Func_81f6b: ; 81f6b (20:5f6b)
	ld l, c
	ld h, b
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f8a
	ld hl, $0
Func_81f79: ; 81f79 (20:5f79)
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f86
	inc hl
	jp Func_81f79

Func_81f86: ; 81f86 (20:5f86)
	inc bc
	jp Func_81f6b

Func_81f8a: ; 81f8a (20:5f8a)
	call Func_8002b_20
	xor a
	call Func_80ee6_20
	xor a
	call Func_80653_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $8
	ld e, $1
	ld a, $1f
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld hl, $3c
	call Func_8068f_20
	ld a, $2e
	call Func_80efe_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld bc, Data_81f2d
	ld e, BANK(Data_81f2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call Func_80095_20
	ld hl, $14d
	call Func_804a9_20
	ld bc, Data_81f33
	ld e, BANK(Data_81f33)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld a, $2e
	call Func_80efe_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call Func_8068f_20
	ld c, $1
	ld de, Data_81f37
	ld a, BANK(Data_81f37)
	call Func_8063e_20
	call Func_801d5_20
	xor a
	call Func_80677_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call Func_8068f_20
	call Func_8018b_20
	ld hl, $1e
	call Func_8068f_20
	ld hl, $14e
	call Func_80498_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81f3d
	ld a, BANK(Data_81f3d)
	call Func_8063e_20
	ld a, $2e
	call Func_80efe_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
	ret

Func_82047:
	push de
	xor a
Func_82049: ; 82049 (20:6049)
	cp $14
	jp nc, Func_82057
	push af
	call Func_80c94_20
	pop af
	inc a
	jp Func_82049

Func_82057: ; 82057 (20:6057)
	pop de
	ld a, e
	cp $2
	jp nz, Func_82078
	xor a
	call Func_80653_20
	ld c, $32
	ld e, $0
	ld a, $1e
	call Func_80d87_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
Func_82078: ; 82078 (20:6078)
	ret

Func_82079:
	ld a, e
	cp $2
	jp nz, Func_8208b
	ld c, $6
	ld e, $1
	ld a, $2b
	call Func_80176_20
	call Func_801d5_20
Func_8208b: ; 8208b (20:608b)
	ret

Func_8208c:: ; 8208c (20:608c)
	cp $11
	jp z, Func_8224a
	cp $10
	jp z, Func_82235
	cp $f
	jp z, Func_82220
	cp $e
	jp z, Func_8220b
	cp $d
	jp z, Func_821f6
	cp $c
	jp z, Func_821e1
	cp $b
	jp z, Func_821cc
	cp $a
	jp z, Func_821b7
	cp $9
	jp z, Func_821a2
	cp $8
	jp z, Func_8218d
	cp $7
	jp z, Func_82178
	cp $6
	jp z, Func_82163
	cp $5
	jp z, Func_8214e
	cp $4
	jp z, Func_82139
	cp $3
	jp z, Func_82124
	cp $2
	jp z, Func_8210f
	cp $1
	jp z, Func_820fa
	or a
	jp nz, Func_8225c
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $2b
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_820fa: ; 820fa (20:60fa)
	ld a, $5a
	call Func_80efe_20
	ld l, $13
	push hl
	ld c, $d
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8210f: ; 8210f (20:610f)
	ld a, $5a
	call Func_80efe_20
	ld l, $16
	push hl
	ld c, $5
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82124: ; 82124 (20:6124)
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $10
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82139: ; 82139 (20:6139)
	ld a, $5a
	call Func_80efe_20
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	ld a, $8
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8214e: ; 8214e (20:614e)
	ld a, $5a
	call Func_80efe_20
	ld l, $e
	push hl
	ld c, $6
	ld e, $0
	ld a, $2
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82163: ; 82163 (20:6163)
	ld a, $5a
	call Func_80efe_20
	ld l, $2d
	push hl
	ld c, $5
	ld e, $0
	ld a, $9
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82178: ; 82178 (20:6178)
	ld a, $5a
	call Func_80efe_20
	ld l, $14
	push hl
	ld c, $11
	ld e, $0
	ld a, $15
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8218d: ; 8218d (20:618d)
	ld a, $5a
	call Func_80efe_20
	ld l, $10
	push hl
	ld c, $7
	ld e, $0
	ld a, $18
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821a2: ; 821a2 (20:61a2)
	ld a, $5a
	call Func_80efe_20
	ld l, $5
	push hl
	ld c, $7
	ld e, $0
	ld a, $1c
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821b7: ; 821b7 (20:61b7)
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $9
	ld e, $0
	ld a, $1b
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821cc: ; 821cc (20:61cc)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $6
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821e1: ; 821e1 (20:61e1)
	ld a, $5a
	call Func_80efe_20
	ld l, $6
	push hl
	ld c, $7
	ld e, $0
	ld a, $1a
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821f6: ; 821f6 (20:61f6)
	ld a, $5a
	call Func_80efe_20
	ld l, $a
	push hl
	ld c, $10
	ld e, $0
	ld a, $6
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8220b: ; 8220b (20:620b)
	ld a, $5a
	call Func_80efe_20
	ld l, $17
	push hl
	ld c, $13
	ld e, $16
	ld a, $13
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82220: ; 82220 (20:6220)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $a
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82235: ; 82235 (20:6235)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $e
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8224a: ; 8224a (20:624a)
	ld a, $5a
	call Func_80efe_20
	ld l, $14
	push hl
	ld c, $5
	ld e, $a
	ld a, $12
	call Func_80dff_20
	pop bc
Func_8225c: ; 8225c (20:625c)
	ret

Data_8225d:
	dr $8225d, $82286

Func_82286:
	ld a, e
	or a
	jp nz, Func_822ae
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_822ae
	xor a
	ld [$c793], a
	ld de, Data_822af
	ld hl, Data_8225d
	call Func_80dd3_20
	or a
	jp nz, Func_822a9
	jp Func_822ae

Func_822a9: ; 822a9 (20:62a9)
	ld a, $1
	ld [$c793], a
Func_822ae: ; 822ae (20:62ae)
	ret

Data_822af:
	db "ハﾞクﾞ$"

Data_822b4: ; 822b4
	dr $822b4, $822dd

Func_822dd:
	ld a, e
	or a
	jp nz, Func_82305
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_82305
	xor a
	ld [$c793], a
	ld de, Data_82306
	ld hl, Data_822b4
	call Func_80dd3_20
	or a
	jp nz, Func_82300
	jp Func_82305

Func_82300: ; 82300 (20:6300)
	ld a, $1
	ld [$c793], a
Func_82305: ; 82305 (20:6305)
	ret

Data_82306:
	db "<HIRA>のうむ<KATA>$"

Data_8230c: ; 8230c
	dr $8230c, $82335

Func_82335:
	ld a, e
	or a
	jp nz, Func_8235d
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_8235d
	xor a
	ld [$c793], a
	ld de, Data_8235e
	ld hl, Data_8230c
	call Func_80dd3_20
	or a
	jp nz, Func_82358
	jp Func_8235d

Func_82358: ; 82358 (20:6358)
	ld a, $1
	ld [$c793], a
Func_8235d: ; 8235d (20:635d)
	ret

Data_8235e:
	db "サヒﾞ$"

Data_82362: ; 82362
	dr $82362, $8238b

Func_8238b:
	ld a, e
	or a
	jp nz, Func_823b3
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_823b3
	xor a
	ld [$c793], a
	ld de, Data_823b4
	ld hl, Data_82362
	call Func_80dd3_20
	or a
	jp nz, Func_823ae
	jp Func_823b3

Func_823ae: ; 823ae (20:63ae)
	ld a, $1
	ld [$c793], a
Func_823b3: ; 823b3 (20:63b3)
	ret

Data_823b4:
	db "イーヒﾟー$"

Data_823ba: ; 823ba
	dr $823ba, $823d4

Data_823d4: ; 823d4
	dr $823d4, $8240c

Func_8240c:
	ld e, $2
	ld hl, Data_823ba
	call Func_8003a_20
	ld a, [$c790]
	cp $4
	jp z, Func_8242b
	ld e, $4
	ld hl, Data_823d4
	call Func_800fb_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
Func_8242b: ; 8242b (20:642b)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	ret

Data_82434:
	dr $82434, $8243a

Data_8243a: ; 8243a
	dr $8243a, $82440

Data_82440: ; 82440
	dr $82440, $82446

Func_82446:
	ld a, e
	or a
	jp nz, Func_82592
	ld hl, $c6
	call Func_8062e_20
	or a
	jp nz, Func_82562
	ld a, [$c838]
	cp $1
	jp z, Func_82464
	or a
	jp nz, Func_82478
	jp Func_82489

Func_82464: ; 82464 (20:6464)
	ld c, $1
	ld de, Data_8243a
	ld a, BANK(Data_8243a)
	call Func_8063e_20
	call Func_8020c_20
	xor a
	call Func_80677_20
	jp Func_82489

Func_82478: ; 82478 (20:6478)
	ld c, $1
	ld de, Data_82434
	ld a, BANK(Data_82434)
	call Func_8063e_20
	call Func_8020c_20
	xor a
	call Func_80677_20
Func_82489: ; 82489 (20:6489)
	call Func_8000e_20
	cp $b
	jp z, Func_824c3
	cp $7
	jp z, Func_824c3
	cp $3
	jp z, Func_824c3
	cp $a
	jp z, Func_824be
	cp $6
	jp z, Func_824be
	cp $2
	jp z, Func_824be
	cp $9
	jp z, Func_824b9
	cp $5
	jp z, Func_824b9
	cp $1
	jp nz, Func_824c8
Func_824b9: ; 824b9 (20:64b9)
IF DEF(SUN)
	ld a, $5a
ENDC
IF DEF(STAR)
	ld a, $2d
ENDC
	jp Func_824ca

Func_824be: ; 824be (20:64be)
IF DEF(SUN)
	ld a, $5c
ENDC
IF DEF(STAR)
	ld a, $2e
ENDC
	jp Func_824ca

Func_824c3: ; 824c3 (20:64c3)
IF DEF(SUN)
	ld a, $6c
ENDC
IF DEF(STAR)
	ld a, $2f
ENDC
	jp Func_824ca

Func_824c8: ; 824c8 (20:64c8)
IF DEF(SUN)
	ld a, $14
ENDC
IF DEF(STAR)
	ld a, $7d
ENDC
Func_824ca: ; 824ca (20:64ca)
	push af
	call Func_800b8_20
	ld e, a
	ld a, $3
	call Func_800c8_20
	ld hl, $3fa
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $3
	call Func_8013d_20
	ld e, $3
	ld a, $3
	call Func_80095_20
	ld e, $0
	ld a, $3
	call Func_80095_20
	ld e, $1
	ld a, $3
	call Func_80095_20
	ld e, $2
	ld a, $3
	call Func_80095_20
	ld e, $3
	ld a, $3
	call Func_80095_20
	ld e, $0
	ld a, $3
	call Func_80095_20
	ld e, $1
	ld a, $3
	call Func_80095_20
	ld e, $2
	ld a, $3
	call Func_80095_20
	ld hl, $1e
	call Func_8068f_20
	ld bc, Data_82440
	ld e, BANK(Data_82440)
	ld a, $3
	call Func_80688_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld a, $2a
	call Func_80efe_20
	ld hl, $3f9
	call Func_80498_20
	pop af
	ld e, $0
	ld c, $5
	call Func_80d87_20
	cp $ff
	jp nz, Func_82551
Func_82551: ; 82551 (20:6551)
	ld hl, $3fb
	call Func_804a9_20
	ld e, $1
	ld hl, $c6
	call Func_8061b_20
	jp Func_82592

Func_82562: ; 82562 (20:6562)
	xor a
	call Func_8044b_20
	call Func_802e0_20
	xor a
	call Func_80ee6_20
	ld a, $16
	call Func_80ee6_20
	ld c, $1
	ld e, $2
	ld a, $8
	call Func_80176_20
	call Func_801d5_20
	call Func_8018b_20
	ld hl, $322
	call Func_80498_20
	ld hl, $15a
	call Func_804a9_20
	ld a, $11
	call Func_80ee6_20
Func_82592: ; 82592 (20:6592)
	ret

Data_82593:
	dr $82593, $825a2

Data_825a2: ; 825a2
	dr $825a2, $825be

Data_825be: ; 825be
	dr $825be, $825cc

Func_825cc:
	ld e, $1
	ld hl, Data_82593
	call Func_8003a_20
	ld a, [$c793]
	or a
	jp z, Func_825eb
	ld a, [$c793]
	cp $1
	jp z, Func_825eb
.asm_825e3
	ld a, [$c793]
	cp $2
	jp nz, Func_825f9
Func_825eb: ; 825eb (20:65eb)
	ld e, $2
	ld hl, Data_825a2
	call Func_800fb_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_825f9: ; 825f9 (20:65f9)
	ld hl, $2
	call Func_8062e_20
	cp $1
	jp nz, Func_8261f
	ld hl, $3
	call Func_8062e_20
	cp $1
	jp nz, Func_8261f
	ld a, [$c790]
	cp $4
	jp z, Func_8261f
	ld e, $1
	ld hl, Data_825be
	call Func_800fb_20
Func_8261f: ; 8261f (20:661f)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	ret

Func_82628:
	ld a, e
	or a
	jp nz, Func_8271b
	ld hl, $d5
	call Func_8062e_20
	or a
	jp nz, Func_82715
	ld a, $5e
	call Func_80efe_20
	ld c, $2
	ld e, $2
	ld a, $8
	call Func_80176_20
	ld e, $2
	ld a, $4
	call Func_801e4_20
	call Func_801d5_20
	call Func_8018b_20
	ld a, $28
	call Func_80efe_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $14
	call Func_80ee6_20
	xor a
	call Func_8044b_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $b
	ld e, $a
	ld a, $9
	call Func_80e8d_20
	ld e, $1
	ld hl, $d5
	call Func_8061b_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	xor a
	call Func_8044b_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $11
	call Func_80ee6_20
	ld e, $0
	xor a
	call Func_8013d_20
	jp Func_8271b

Func_82715: ; 82715 (20:6715)
	ld hl, $15c
	call Func_80498_20
Func_8271b: ; 8271b (20:671b)
	ret

Data_8271c:
	dr $8271c, $8275e

Data_8275e: ; 8275e
	dr $8275e, $82763

Data_82763: ; 82763
	dr $82763, $8279b

Data_8279b: ; 8279b
	dr $8279b, $827a9

Func_827a9:
	call Func_82866
	ld hl, Func_82866
	call Func_80f11_20
	ld a, $1
	ld [$c7de], a
	ld e, $6
	ld hl, Data_8271c
	call Func_8003a_20
	ld e, $1
	ld hl, Data_8275e
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_827de
	ld a, [$c793]
	cp $2
	jp z, Func_827de
	ld a, [$c793]
	cp $3
	jp nz, Func_8283f
Func_827de: ; 827de (20:67de)
	ld e, $4
	ld hl, Data_82763
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	ld a, [$c7df]
	cp $20
	jp nz, Func_82811
	ld a, [$c7e0]
	cp $5
	jp nz, Func_82811
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
	ld hl, $3dc
	call Func_80f72_20
	call Func_829dd
	jp Func_8283c

Func_82811: ; 82811 (20:6811)
	ld hl, $d
	call Func_8062e_20
	or a
	jp nz, Func_8282c
	call Func_8001c_20
	call Func_82894
	ld e, $1
	ld hl, $d
	call Func_8061b_20
	jp Func_8283c

Func_8282c: ; 8282c (20:682c)
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
	ld hl, $3dc
	call Func_80f72_20
Func_8283c: ; 8283c (20:683c)
	jp Func_82859

Func_8283f: ; 8283f (20:683f)
	ld e, $4
	ld hl, Data_82763
	call Func_800fb_20
	ld e, $1
	ld hl, Data_8279b
	call Func_800fb_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
Func_82859: ; 82859 (20:6859)
	ret

Data_8285a:
	dr $8285a, $82860

Data_82860: ; 82860
	dr $82860, $82866

Func_82866: ; 82866 (20:6866)
	ld a, [$c78c]
	cp $2
	jp nc, Func_82874
	ld hl, Data_8285a
	call Func_80d9b_20
Func_82874: ; 82874 (20:6874)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82882
	ld hl, Data_82860
	call Func_80d9b_20
Func_82882: ; 82882 (20:6882)
	call Func_80f02_20
	ret

Data_82886:
	dr $82886, $8288a

Data_8288a: ; 8288a
	dr $8288a, $82890

Data_82890: ; 82890
	dr $82890, $82894

Func_82894: ; 82894 (20:6894)
	ld bc, Data_82886
	ld e, BANK(Data_82886)
	ld a, $1
	call Func_801f7_20
	ld c, $1
	ld de, Data_8288a
	ld a, BANK(Data_8288a)
	call Func_8063e_20
	call Func_8020c_20
	ld hl, $10
	call Func_804a9_20
	ld hl, $11
	call Func_804a9_20
	ld bc, Data_82890
	ld e, BANK(Data_82890)
	ld a, $1
	call Func_801f7_20
	ld c, $3
	ld de, Data_82890
	ld a, BANK(Data_82890)
	call Func_8063e_20
	call Func_8020c_20
	ret

Data_828cf:
	dr $828cf, $828d3

Data_828d3: ; 828d3
	dr $828d3, $828d7

Data_828d7: ; 828d7
	dr $828d7, $828db

Data_828db: ; 828db
	dr $828db, $828df

Func_828df:
	ld a, e
	cp $2
	jp nz, Func_8298b
	ld bc, Data_828cf
	ld e, BANK(Data_828cf)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
	ld hl, $32
	call Func_8062e_20
	cp $1
	jp nz, Func_82967
	ld hl, $3ed
	call Func_804ca_20
	or a
	jp nz, Func_82940
	ld hl, $486
	call Func_804a9_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
	ld c, $1
	ld de, Data_828db
	ld a, BANK(Data_828db)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $0
	ld hl, $f8
	call Func_8061b_20
	jp Func_82964

Func_82940: ; 82940 (20:6940)
	ld hl, $482
	call Func_804a9_20
	ld c, $1
	ld de, Data_828d7
	ld a, BANK(Data_828d7)
	call Func_8063e_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
Func_82964: ; 82964 (20:6964)
	jp Func_8298b

Func_82967: ; 82967 (20:6967)
	ld hl, FillMemory
	call Func_804a9_20
	ld c, $1
	ld de, Data_828d7
	ld a, BANK(Data_828d7)
	call Func_8063e_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
Func_8298b: ; 8298b (20:698b)
	ret

Func_8298c:
	ld a, e
	or a
	jp nz, Func_8299a
	ld hl, $2a6
	call Func_804a9_20
	call Func_8045c_20
Func_8299a: ; 8299a (20:699a)
	ret

Func_8299b:
	ld a, e
	or a
	jp nz, Func_829d0
	ld a, $5
	call Func_8044b_20
	ld a, [$c78c]
	inc a
	ld [$c78c], a
	ld a, [$c78c]
	cp $15
	jp nz, Func_829b9
	ld a, $1
	ld [$c78c], a
Func_829b9: ; 829b9 (20:69b9)
	set_farcall_addrs_hli Func_bd6fa
	ld a, [$c78c]
	ld e, a
	ld d, $0
	ld hl, Data_829d1
	call FarCall
Func_829d0: ; 829d0 (20:69d0)
	ret

Data_829d1:
	dr $829d1, $829d9

Data_829d9: ; 829d9
	dr $829d9, $829dd

Func_829dd: ; 829dd (20:69dd)
	ld hl, $f8
	call Func_8062e_20
	or a
	jp nz, .asm_829fc
	ld c, $1
	ld de, Data_829d9
	ld a, BANK(Data_829d9)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $1
	ld hl, $f8
	call Func_8061b_20
.asm_829fc
	ret

Func_829fd:
	push af
	ld a, e
	or a
	jp nz, Func_82ab6
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	ld hl, $114
	call Func_8062e_20
	or a
	jp nz, Func_82ab0
	ld a, $10
	call Func_80e5d_20
	or a
	jp z, Func_82a9b
	ld hl, $497
	call Func_804ba_20
	or a
	jp nz, Func_82a92
	ld a, $2b
	call Func_80efe_20
	ld c, $1
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	ld a, [$c79c]
	or a
	jp nz, Func_82a43
	ld a, $2
	ld [$c79c], a
	jp Func_82a59

Func_82a43: ; 82a43 (20:6a43)
	ld a, [$c79c]
	or a
	jp nz, Func_82a52
	ld a, $2
	ld [$c79c], a
	jp Func_82a59

Func_82a52: ; 82a52 (20:6a52)
	ld a, [$c79c]
	inc a
	ld [$c79c], a
Func_82a59: ; 82a59 (20:6a59)
	ld hl, $498
	call Func_80498_20
	ld a, [$c79c]
	cp $9
	jp c, Func_82a8f
	ld hl, $499
	call Func_80498_20
	ld a, $2a
	call Func_80efe_20
	ld hl, $49a
	call Func_80498_20
	ld c, $0
	ld e, $1
	ld a, $18
	call Func_80d4d_20
	ld e, $1
	ld hl, $114
	call Func_8061b_20
	ld hl, $4a8
	call Func_80498_20
Func_82a8f: ; 82a8f (20:6a8f)
	jp Func_82a98

Func_82a92: ; 82a92 (20:6a92)
	ld hl, $496
	call Func_80498_20
Func_82a98: ; 82a98 (20:6a98)
	jp Func_82aad

Func_82a9b: ; 82a9b (20:6a9b)
	ld hl, $3ec
	call Func_80498_20
	ld a, [$c79c]
	or a
	jp nz, Func_82aad
	ld a, $1
	ld [$c79c], a
Func_82aad: ; 82aad (20:6aad)
	jp Func_82ab6

Func_82ab0: ; 82ab0 (20:6ab0)
	ld hl, $49c
	call Func_80498_20
Func_82ab6: ; 82ab6 (20:6ab6)
	pop bc
	ret

Data_82ab8:
	dr $82ab8, $82ad9

Data_82ad9: ; 82ad9
	dr $82ad9, $82b03

Func_82b03:
	call Func_82ba1
	ld hl, Func_82ba1
	call Func_80f11_20
	ld a, $2
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82ab8
	call Func_8003a_20
	ld e, $3
	ld hl, Data_82ad9
	call Func_800fb_20
	ld a, [$c78c]
	cp $a
	jp nc, Func_82b39
	ld e, $0
	xor a
	call Func_8013d_20
	ld e, $0
	ld a, $2
	call Func_8013d_20
	jp Func_82b48

Func_82b39: ; 82b39 (20:6b39)
	ld a, [$c78c]
	cp $f
	jp nc, Func_82b48
	ld e, $0
	ld a, $2
	call Func_8013d_20
Func_82b48: ; 82b48 (20:6b48)
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3c9
	call Func_80f72_20
	ret

Func_82b57:
	push af
	ld a, e
	or a
	jp nz, Func_82b93
	ld a, $c
	call Func_80ee6_20
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp z, Func_82b87
	cp $1
	jp z, Func_82b7d
	or a
	jp nz, Func_82b8e
	ld e, $0
	ld a, $b
	call Func_806a0_20
	jp Func_82b8e

Func_82b7d: ; 82b7d (20:6b7d)
	ld e, $0
	ld a, $a
	call Func_806a0_20
	jp Func_82b8e

Func_82b87: ; 82b87 (20:6b87)
	ld e, $0
	ld a, $c
	call Func_806a0_20
Func_82b8e: ; 82b8e (20:6b8e)
	ld a, $b
	call Func_80ee6_20
Func_82b93: ; 82b93 (20:6b93)
	pop bc
	ret

Data_82b95:
	dr $82b95, $82b9b

Data_82b9b: ; 82b9b
	dr $82b9b, $82ba1

Func_82ba1: ; 82ba1 (20:6ba1)
	ld a, [$c78c]
	cp $3
	jp nc, Func_82baf
	ld hl, Data_82b95
	call Func_80d9b_20
Func_82baf: ; 82baf (20:6baf)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82bbd
	ld hl, Data_82b9b
	call Func_80d9b_20
Func_82bbd: ; 82bbd (20:6bbd)
	call Func_80f02_20
	ret

Data_82bc1:
	dr $82bc1, $82be2

Data_82be2: ; 82be2
	dr $82be2, $82bfe

Data_82bfe: ; 82bfe
	dr $82bfe, $82c28

Data_82c28: ; 82c28
	dr $82c28, $82c44

Func_82c44:
	call Func_82d22
	ld hl, Func_82d22
	call Func_80f11_20
	ld a, $3
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82bc1
	call Func_8003a_20
	ld e, $2
	ld hl, Data_82be2
	call Func_800fb_20
	ld a, [$c78c]
	cp $a
	jp c, Func_82c72
	ld e, $3
	ld hl, Data_82bfe
	call Func_800fb_20
Func_82c72: ; 82c72 (20:6c72)
	ld a, [$c78c]
	cp $f
	jp c, Func_82c82
	ld e, $2
	ld hl, Data_82c28
	call Func_800fb_20
Func_82c82: ; 82c82 (20:6c82)
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3ca
	call Func_80f72_20
	ret

Func_82c91:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp z, Func_82ca3
	or a
	jp nz, Func_82ca8
	ld l, $a
	jp Func_82caa

Func_82ca3: ; 82ca3 (20:6ca3)
	ld l, $b
	jp Func_82caa

Func_82ca8: ; 82ca8 (20:6ca8)
	ld l, $c
Func_82caa: ; 82caa (20:6caa)
	ld a, e
	or a
	jp nz, Func_82cc7
	push hl
	ld hl, sp+$3
	ld a, [hl]
	call Func_8044b_20
	ld a, $c
	call Func_80ee6_20
	pop hl
	ld a, l
	ld e, $2
	call Func_806a0_20
	ld a, $b
	call Func_80ee6_20
Func_82cc7: ; 82cc7 (20:6cc7)
	pop bc
	ret

Func_82cc9:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp z, Func_82ce1
	cp $3
	jp z, Func_82ce1
	cp $1
	jp nz, Func_82ce6
	ld l, $a
	jp Func_82ce8

Func_82ce1: ; 82ce1 (20:6ce1)
	ld l, $b
	jp Func_82ce8

Func_82ce6: ; 82ce6 (20:6ce6)
	ld l, $c
Func_82ce8: ; 82ce8 (20:6ce8)
	ld a, e
	or a
	jp nz, Func_82d14
	push hl
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_82cfd
	ld hl, sp+$3
	ld a, [hl]
	dec a
	ld hl, sp+$3
	ld [hl], a
Func_82cfd: ; 82cfd (20:6cfd)
	ld hl, sp+$3
	ld a, [hl]
	call Func_8044b_20
	ld a, $c
	call Func_80ee6_20
	pop hl
	ld a, l
	ld e, $1
	call Func_806a0_20
	ld a, $b
	call Func_80ee6_20
Func_82d14: ; 82d14 (20:6d14)
	pop bc
	ret

Data_82d16:
	dr $82d16, $82d1c

Data_82d1c: ; 82d1c
	dr $82d1c, $82d22

Func_82d22: ; 82d22 (20:6d22)
	ld a, [$c78c]
	cp $4
	jp nc, Func_82d30
	ld hl, Data_82d16
	call Func_80d9b_20
Func_82d30: ; 82d30 (20:6d30)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82d3e
	ld hl, Data_82d1c
	call Func_80d9b_20
Func_82d3e: ; 82d3e (20:6d3e)
	call Func_80f02_20
	ret

Data_82d42:
	dr $82d42, $82d63

Data_82d63: ; 82d63
	dr $82d63, $82d7f

Func_82d7f:
	call Func_82e00
	ld hl, Func_82e00
	call Func_80f11_20
	ld a, $4
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82d42
	call Func_8003a_20
	ld e, $2
	ld hl, Data_82d63
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3cb
	call Func_80f72_20
	ret

Func_82dac:
	push af
	ld a, e
	or a
	jp nz, Func_82dce
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	ld hl, $362
	call Func_804a9_20
	ld a, $c
	call Func_80ee6_20
	ld e, $3
	xor a
	call Func_806a0_20
	ld a, $b
	call Func_80ee6_20
Func_82dce: ; 82dce (20:6dce)
	pop bc
	ret

Func_82dd0:
	push af
	ld a, e
	or a
	jp nz, Func_82df2
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	ld hl, $362
	call Func_804a9_20
	ld a, $c
	call Func_80ee6_20
	ld e, $4
	xor a
	call Func_806a0_20
	ld a, $b
	call Func_80ee6_20
Func_82df2: ; 82df2 (20:6df2)
	pop bc
	ret

Data_82df4:
	dr $82df4, $82dfa

Data_82dfa: ; 82dfa
	dr $82dfa, $82e00

Func_82e00: ; 82e00 (20:6e00)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82e0e
	ld hl, Data_82df4
	call Func_80d9b_20
Func_82e0e: ; 82e0e (20:6e0e)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82e1c
	ld hl, Data_82dfa
	call Func_80d9b_20
Func_82e1c: ; 82e1c (20:6e1c)
	call Func_80f02_20
	ret

Data_82e20:
	dr $82e20, $82e41

Data_82e41: ; 82e41
	dr $82e41, $82e46

Data_82e46: ; 82e46
	dr $82e46, $82e70

Func_82e70:
	ld l, $0
	push hl
	ld c, $8
	ld e, $4
	xor a
	call Func_80f24_20
	pop bc
	call Func_82ec2
	ld hl, Func_82ec2
	call Func_80f11_20
	ld a, $5
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82e20
	call Func_8003a_20
	ld e, $1
	ld hl, Data_82e41
	call Func_80ce7_20
	ld a, $1
	call Func_80d01_20
	ld e, $3
	ld hl, Data_82e46
	call Func_80d24_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3cc
	call Func_80f72_20
	ret

Data_82eb6:
	dr $82eb6, $82ebc

Data_82ebc: ; 82ebc
	dr $82ebc, $82ec2

Func_82ec2: ; 82ec2 (20:6ec2)
	ld a, [$c78c]
	cp $6
	jp nc, Func_82ed0
	ld hl, Data_82eb6
	call Func_80d9b_20
Func_82ed0: ; 82ed0 (20:6ed0)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82ede
	ld hl, Data_82ebc
	call Func_80d9b_20
Func_82ede: ; 82ede (20:6ede)
	call Func_80f02_20
	ret

Data_82ee2:
	dr $82ee2, $82f03

Data_82f03: ; 82f03
	dr $82f03, $82f08

Func_82f08:
	call Func_82f41
	ld hl, Func_82f41
	call Func_80f11_20
	ld a, $6
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82ee2
	call Func_8003a_20
	ld e, $1
	ld hl, Data_82f03
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3cd
	call Func_80f72_20
	ret

Data_82f35:
	dr $82f35, $82f3b

Data_82f3b: ; 82f3b
	dr $82f3b, $82f41

Func_82f41:
	ld a, [$c78c]
	cp $7
	jp nc, Func_82f4f
	ld hl, Data_82f35
	call Func_80d9b_20
Func_82f4f: ; 82f4f (20:6f4f)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82f5d
	ld hl, Data_82f3b
	call Func_80d9b_20
Func_82f5d: ; 82f5d (20:6f5d)
	call Func_80f02_20
	ret

Data_82f61:
	dr $82f61, $82f82

Data_82f82: ; 82f82
	dr $82f82, $82f8c

Data_82f8c: ; 82f8c
	dr $82f8c, $82fa8

Func_82fa8:
	call Func_83006
	ld hl, Func_83006
	call Func_80f11_20
	ld a, $7
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82f61
	call Func_8003a_20
	ld e, $2
	ld hl, Data_82f82
	call Func_80ce7_20
	ld a, $11
	call Func_80ee6_20
	ld a, [$c793]
	or a
	jp z, Func_82fe2
	ld a, [$c793]
	cp $1
	jp z, Func_82fe2
	ld a, [$c793]
	cp $2
	jp nz, Func_82ff0
Func_82fe2: ; 82fe2 (20:6fe2)
	ld e, $2
	ld hl, Data_82f8c
	call Func_800fb_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_82ff0: ; 82ff0 (20:6ff0)
	call Func_8001c_20
	ld hl, $3ce
	call Func_80f72_20
	ret

Data_82ffa:
	dr $82ffa, $83000

Data_83000: ; 83000
	dr $83000, $83006

Func_83006: ; 83006 (20:7006)
	ld a, [$c78c]
	cp $8
	jp nc, Func_83014
	ld hl, Data_82ffa
	call Func_80d9b_20
Func_83014: ; 83014 (20:7014)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83022
	ld hl, Data_83000
	call Func_80d9b_20
Func_83022: ; 83022 (20:7022)
	call Func_80f02_20
	ret

Func_83026:
	ld a, e
	or a
	jp nz, Func_83119
	ld hl, $d7
	call Func_8062e_20
	or a
	jp nz, Func_83113
	ld a, $5e
	call Func_80efe_20
	ld c, $2
	ld e, $2
	ld a, $8
	call Func_80176_20
	ld e, $2
	ld a, $3
	call Func_801e4_20
	call Func_801d5_20
	call Func_8018b_20
	ld a, $28
	call Func_80efe_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $14
	call Func_80ee6_20
	xor a
	call Func_8044b_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $c
	ld e, $17
	ld a, $15
	call Func_80e8d_20
	ld e, $1
	ld hl, $d7
	call Func_8061b_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $11
	call Func_80ee6_20
	xor a
	call Func_8044b_20
	ld e, $0
	xor a
	call Func_8013d_20
	jp Func_83119

Func_83113: ; 83113 (20:7113)
	ld hl, $15c
	call Func_80498_20
Func_83119: ; 83119 (20:7119)
	ret

Data_8311a:
	dr $8311a, $8313f

Data_8313f: ; 8313f
	dr $8313f, $83169

Func_83169:
	call Func_831a2
	ld hl, Func_831a2
	call Func_80f11_20
	ld a, $8
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8311a
	call Func_8003a_20
	ld e, $3
	ld hl, Data_8313f
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3cf
	call Func_80f72_20
	ret

Data_83196:
	dr $83196, $8319c

Data_8319c: ; 8319c
	dr $8319c, $831a2

Func_831a2: ; 831a2 (20:71a2)
	ld a, [$c78c]
	cp $9
	jp nc, Func_831b0
	ld hl, Data_83196
	call Func_80d9b_20
Func_831b0: ; 831b0 (20:71b0)
	ld a, [$c78c]
	cp $5
	jp nc, Func_831be
	ld hl, Data_8319c
	call Func_80d9b_20
Func_831be: ; 831be (20:71be)
	call Func_80f02_20
	ret

Func_831c2:
	push af
	ld a, e
	or a
	jp nz, Func_831d1
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	call Func_8104f_20
Func_831d1: ; 831d1 (20:71d1)
	pop bc
	ret

Func_831d3:
	push af
	ld a, e
	or a
	jp nz, Func_831e2
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	call Func_81072_20
Func_831e2: ; 831e2 (20:71e2)
	pop bc
	ret

Data_831e4:
	dr $831e4, $83205

Data_83205: ; 83205
	dr $83205, $83213

Func_83213:
	call Func_8324c
	ld hl, Func_8324c
	call Func_80f11_20
	ld a, $9
	ld [$c7de], a
	ld e, $3
	ld hl, Data_831e4
	call Func_8003a_20
	ld e, $1
	ld hl, Data_83205
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d0
	call Func_80f72_20
	ret

Data_83240:
	dr $83240, $83246

Data_83246: ; 83246
	dr $83246, $8324c

Func_8324c: ; 8324c (20:724c)
	ld a, [$c78c]
	cp $a
	jp nc, Func_8325a
	ld hl, Data_83240
	call Func_80d9b_20
Func_8325a: ; 8325a (20:725a)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83268
	ld hl, Data_83246
	call Func_80d9b_20
Func_83268: ; 83268 (20:7268)
	call Func_80f02_20
	ret

Func_8326c:
	push af
	ld a, e
	or a
	jp nz, Func_83318
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	ld hl, $9c
	call Func_804ba_20
	or a
	jp nz, Func_832d4
	ld hl, $391
	call Func_80498_20
	ld a, $1
	call Func_8021b_20
	ld hl, $108
	call Func_8062e_20
	or a
	jp nz, Func_832cb
	ld a, [$c79c]
	cp $1
	jp c, Func_832cb
	ld hl, $114
	call Func_8062e_20
	or a
	jp nz, Func_832cb
	ld hl, $49d
	call Func_80498_20
	ld a, $2a
	call Func_80efe_20
	ld hl, $49e
	call Func_80498_20
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	ld e, $1
	ld hl, $108
	call Func_8061b_20
Func_832cb: ; 832cb (20:72cb)
	ld hl, $33c
	call Func_80498_20
	jp Func_83318

Func_832d4: ; 832d4 (20:72d4)
	ld hl, $392
	call Func_80498_20
	ld hl, $108
	call Func_8062e_20
	or a
	jp nz, Func_83318
	ld a, [$c79c]
	cp $1
	jp c, Func_83318
	ld hl, $114
	call Func_8062e_20
	or a
	jp nz, Func_83318
	ld hl, $49d
	call Func_80498_20
	ld a, $2a
	call Func_80efe_20
	ld hl, $49e
	call Func_80498_20
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	ld e, $1
	ld hl, $108
	call Func_8061b_20
Func_83318: ; 83318 (20:7318)
	pop bc
	ret

Data_8331a:
	dr $8331a, $8333b

Data_8333b: ; 8333b
	dr $8333b, $83340

Func_83340:
	call Func_83379
	ld hl, Func_83379
	call Func_80f11_20
	ld a, $a
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8331a
	call Func_8003a_20
	ld e, $1
	ld hl, Data_8333b
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, Func_03d1
	call Func_80f72_20
	ret

Data_8336d:
	dr $8336d, $83373

Data_83373: ; 83373
	dr $83373, $83379

Func_83379:
	ld a, [$c78c]
	cp $b
	jp nc, Func_83387
	ld hl, Data_8336d
	call Func_80d9b_20
Func_83387: ; 83387 (20:7387)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83395
	ld hl, Data_83373
	call Func_80d9b_20
Func_83395: ; 83395 (20:7395)
	call Func_80f02_20
	ret

Data_83399:
	dr $83399, $833ba

Func_833ba:
	call Func_833eb
	ld hl, Func_833eb
	call Func_80f11_20
	ld a, $b
	ld [$c7de], a
	ld e, $3
	ld hl, Data_83399
	call Func_8003a_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d2
	call Func_80f72_20
	ret

Data_833df:
	dr $833df, $833e5

Data_833e5: ; 833e5
	dr $833e5, $833eb

Func_833eb:
	ld a, [$c78c]
	cp $c
	jp nc, Func_833f9
	ld hl, Data_833df
	call Func_80d9b_20
Func_833f9: ; 833f9 (20:73f9)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83407
	ld hl, Data_833e5
	call Func_80d9b_20
Func_83407: ; 83407 (20:7407)
	call Func_80f02_20
	ret

Data_8340b:
	dr $8340b, $8342c

Data_8342c: ; 8342c
	dr $8342c, $83431

Func_83431:
	call Func_8346a
	ld hl, Func_8346a
	call Func_80f11_20
	ld a, $c
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8340b
	call Func_8003a_20
	ld e, $1
	ld hl, Data_8342c
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, Func_03d3
	call Func_80f72_20
	ret

Data_8345e:
	dr $8345e, $83464

Data_83464: ; 83464
	dr $83464, $8346a

Func_8346a:
	ld a, [$c78c]
	cp $d
	jp nc, Func_83478
	ld hl, Data_8345e
	call Func_80d9b_20
Func_83478: ; 83478 (20:7478)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83486
	ld hl, Data_83464
	call Func_80d9b_20
Func_83486: ; 83486 (20:7486)
	call Func_80f02_20
	ret

Data_8348a:
	dr $8348a, $834af

Data_834af: ; 834af
	dr $834af, $834bd

Func_834bd:
	call Func_834f6
	ld hl, Func_834f6
	call Func_80f11_20
	ld a, $d
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8348a
	call Func_8003a_20
	ld e, $1
	ld hl, Data_834af
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d4
	call Func_80f72_20
	ret

Data_834ea:
	dr $834ea, $834f0

Data_834f0: ; 834f0
	dr $834f0, $834f6

Func_834f6: ; 834f6 (20:74f6)
	ld a, [$c78c]
	cp $e
	jp nc, Func_83504
	ld hl, Data_834ea
	call Func_80d9b_20
Func_83504: ; 83504 (20:7504)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83512
	ld hl, Data_834f0
	call Func_80d9b_20
Func_83512: ; 83512 (20:7512)
	call Func_80f02_20
	ret

Data_83516:
	dr $83516, $83537

Func_83537:
	call Func_83568
	ld hl, Func_83568
	call Func_80f11_20
	ld a, $e
	ld [$c7de], a
	ld e, $3
	ld hl, Data_83516
	call Func_8003a_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, GetSRAMBank
	call Func_80f72_20
	ret

Data_8355c:
	dr $8355c, $83562

Data_83562: ; 83562
	dr $83562, $83568

Func_83568:
	ld a, [$c78c]
	cp $f
	jp nc, Func_83576
	ld hl, Data_8355c
	call Func_80d9b_20
Func_83576: ; 83576 (20:7576)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83584
	ld hl, Data_83562
	call Func_80d9b_20
Func_83584: ; 83584 (20:7584)
	call Func_80f02_20
	ret

Data_83588:
	dr $83588, $835a9

Data_835a9: ; 835a9
	dr $835a9, $835ae

Func_835ae:
	call Func_835e7
	ld hl, Func_835e7
	call Func_80f11_20
	ld a, $f
	ld [$c7de], a
	ld e, $3
	ld hl, Data_83588
	call Func_8003a_20
	ld e, $1
	ld hl, Data_835a9
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d6
	call Func_80f72_20
	ret

Data_835db:
	dr $835db, $835e1

Data_835e1: ; 835e1
	dr $835e1, $835e7

Func_835e7: ; 835e7 (20:75e7)
	ld a, [$c78c]
	cp $10
	jp nc, Func_835f5
	ld hl, Data_835db
	call Func_80d9b_20
Func_835f5: ; 835f5 (20:75f5)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83603
	ld hl, Data_835e1
	call Func_80d9b_20
Func_83603: ; 83603 (20:7603)
	call Func_80f02_20
	ret

Data_83607:
	dr $83607, $83628

Data_83628: ; 83628
	dr $83628, $83632

Func_83632:
	call Func_8366b
	ld hl, Func_8366b
	call Func_80f11_20
	ld a, $10
	ld [$c7de], a
	ld e, $3
	ld hl, Data_83607
	call Func_8003a_20
	ld e, $2
	ld hl, Data_83628
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d7
	call Func_80f72_20
	ret

Data_8365f:
	dr $8365f, $83665

Data_83665: ; 83665
	dr $83665, $8366b

Func_8366b:
	ld a, [$c78c]
	cp $11
	jp nc, Func_83679
	ld hl, Data_8365f
	call Func_80d9b_20
Func_83679: ; 83679 (20:7679)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83687
	ld hl, Data_83665
	call Func_80d9b_20
Func_83687: ; 83687 (20:7687)
	call Func_80f02_20
	ret

Data_8368b:
	dr $8368b, $836ac

Data_836ac: ; 836ac
	dr $836ac, $836b1

Func_836b1:
	call Func_836ea
	ld hl, Func_836ea
	call Func_80f11_20
	ld a, $11
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8368b
	call Func_8003a_20
	ld e, $1
	ld hl, Data_836ac
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d8
	call Func_80f72_20
	ret

Data_836de:
	dr $836de, $836e4

Data_836e4: ; 836e4
	dr $836e4, $836ea

Func_836ea: ; 836ea (20:76ea)
	ld a, [$c78c]
	cp $12
	jp nc, Func_836f8
	ld hl, Data_836de
	call Func_80d9b_20
Func_836f8: ; 836f8 (20:76f8)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83706
	ld hl, Data_836e4
	call Func_80d9b_20
Func_83706: ; 83706 (20:7706)
	call Func_80f02_20
	ret

Data_8370a:
	dr $8370a, $8372b

Data_8372b: ; 8372b
	dr $8372b, $83730

Func_83730:
	call Func_83769
	ld hl, Func_83769
	call Func_80f11_20
	ld a, $12
	ld [$c7de], a
	ld e, $3
	ld hl, Data_8370a
	call Func_8003a_20
	ld e, $1
	ld hl, Data_8372b
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3d9
	call Func_80f72_20
	ret

Data_8375d:
	dr $8375d, $83763

Data_83763: ; 83763
	dr $83763, $83769

Func_83769: ; 83769 (20:7769)
	ld a, [$c78c]
	cp $13
	jp nc, Func_83777
	ld hl, Data_8375d
	call Func_80d9b_20
Func_83777: ; 83777 (20:7777)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83785
	ld hl, Data_83763
	call Func_80d9b_20
Func_83785: ; 83785 (20:7785)
	call Func_80f02_20
	ret

Data_83789:
	dr $83789, $837aa

Func_837aa:
	call Func_837db
	ld hl, Func_837db
	call Func_80f11_20
	ld a, $13
	ld [$c7de], a
	ld e, $3
	ld hl, Data_83789
	call Func_8003a_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3da
	call Func_80f72_20
	ret

Data_837cf:
	dr $837cf, $837d5

Data_837d5: ; 837d5
	dr $837d5, $837db

Func_837db:
	ld a, [$c78c]
	cp $14
	jp nc, Func_837e9
	ld hl, Data_837cf
	call Func_80d9b_20
Func_837e9: ; 837e9 (20:77e9)
	ld a, [$c78c]
	cp $5
	jp nc, Func_837f7
	ld hl, Data_837d5
	call Func_80d9b_20
Func_837f7: ; 837f7 (20:77f7)
	call Func_80f02_20
	ret

Data_837fb:
	dr $837fb, $83811

Data_83811: ; 83811
	dr $83811, $83816

Func_83816:
	call Func_8384f
	ld hl, Func_8384f
	call Func_80f11_20
	ld a, $14
	ld [$c7de], a
	ld e, $2
	ld hl, Data_837fb
	call Func_8003a_20
	ld e, $1
	ld hl, Data_83811
	call Func_80ce7_20
	ld a, $b
	call Func_80ee6_20
	call Func_8001c_20
	ld hl, $3db
	call Func_80f72_20
	ret

Data_83843:
	dr $83843, $83849

Data_83849: ; 83849
	dr $83849, $8384f

Func_8384f:
	ld a, [$c78c]
	cp $15
	jp nc, Func_8385d
	ld hl, Data_83843
	call Func_80d9b_20
Func_8385d: ; 8385d (20:785d)
	ld a, [$c78c]
	cp $5
	jp nc, Func_8386b
	ld hl, Data_83849
	call Func_80d9b_20
Func_8386b: ; 8386b (20:786b)
	call Func_80f02_20
	ret

Data_8386f:
	dr $8386f, $83885

Data_83885: ; 83885
	dr $83885, $83894

Data_83894: ; 83894
	dr $83894, $838a2

Func_838a2:
	call Func_838f0
	ld hl, Func_838f0
	call Func_80f11_20
	xor a
	ld [$c7de], a
	ld e, $2
	ld hl, Data_8386f
	call Func_8003a_20
	ld e, $3
	ld hl, Data_83885
	call Func_80ce7_20
	ld e, $1
	ld hl, Data_83894
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	call Func_83e56
	ld [$c7a4], a
	ld a, [$c7a4]
	cp $1
	jp nz, Func_838e0
	ld e, $0
	xor a
	call Func_8013d_20
Func_838e0: ; 838e0 (20:78e0)
	call Func_8001c_20
	ld hl, $3c8
	call Func_80f72_20
	ret

Data_838ea: ; 838ea
	dr $838ea, $838f0

Func_838f0: ; 838f0 (20:78f0)
	ld a, [$c78c]
	cp $5
	jp nc, Func_83901
	ld hl, Data_838ea
	call Func_80d9b_20
	call Func_80f02_20
Func_83901: ; 83901 (20:7901)
	ret

Data_83902:
	dr $83902, $839ff

Data_839ff: ; 839ff
	dr $839ff, $83a13

Data_83a13: ; 83a13
	dr $83a13, $83a17

Data_83a17: ; 83a17
	dr $83a17, $83a1f

Data_83a1f:
	push af
	ld hl, -$12e
	add hl, sp
	ld sp, hl
	push de
	ld hl, sp+$33
	reg16swap de, hl
	ld hl, Data_83902
	ld bc, $fc
	call MemCopy
	pop de
	ld a, e
	or a
	jp nz, Func_83e48
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_8044b_20
	ld hl, $58
	call Func_8062e_20
	or a
	jp nz, Func_83a5e
	ld hl, $29d
	call Func_804a9_20
	ld e, $1
	ld hl, $58
	call Func_8061b_20
	jp Func_83e48

Func_83a5e: ; 83a5e (20:7a5e)
	ld a, [$c79d]
	cp $1
	jp nz, Func_83b71
	ld a, [$c7a4]
	cp $ff
	jp nz, Func_83a7b
	ld hl, $48b
	call Func_804a9_20
	xor a
	ld [$c79d], a
	jp Func_83b6e

Func_83a7b: ; 83a7b (20:7a7b)
	ld hl, $100
	call Func_804a9_20
	ld a, [$c78c]
	inc a
	ld [$c78c], a
	xor a
	ld [$c79d], a
	ld a, [$c78c]
	cp $2
	jp z, Func_83b53
	cp $3
	jp z, Func_83b3b
	cp $4
	jp z, Func_83b23
	cp $5
	jp z, Func_83b0b
	cp $8
	jp z, Func_83af3
	cp $9
	jp z, Func_83adb
	cp $a
	jp nz, Func_83b6e
	ld hl, $110
	call Func_8062e_20
	or a
	jp nz, Func_83adb
	ld a, $5c
	call Func_80efe_20
	ld hl, $78
	call Func_8068f_20
	ld hl, $484
	call Func_804a9_20
	ld hl, $485
	call Func_804a9_20
	ld e, $1
	ld hl, $110
	call Func_8061b_20
Func_83adb: ; 83adb (20:7adb)
	ld hl, $106
	call Func_8062e_20
	or a
	jp nz, Func_83af3
	ld hl, $493
	call Func_80f72_20
	ld e, $1
	ld hl, $106
	call Func_8061b_20
Func_83af3: ; 83af3 (20:7af3)
	ld hl, $105
	call Func_8062e_20
	or a
	jp nz, Func_83b0b
	ld hl, $494
	call Func_80f72_20
	ld e, $1
	ld hl, $105
	call Func_8061b_20
Func_83b0b: ; 83b0b (20:7b0b)
	ld hl, $104
	call Func_8062e_20
	or a
	jp nz, Func_83b23
	ld hl, $48f
	call Func_80f72_20
	ld e, $1
	ld hl, $104
	call Func_8061b_20
Func_83b23: ; 83b23 (20:7b23)
	ld hl, $103
	call Func_8062e_20
	or a
	jp nz, Func_83b3b
	ld hl, $492
	call Func_80f72_20
	ld e, $1
	ld hl, $103
	call Func_8061b_20
Func_83b3b: ; 83b3b (20:7b3b)
	ld hl, $102
	call Func_8062e_20
	or a
	jp nz, Func_83b53
	ld hl, $491
	call Func_80f72_20
	ld e, $1
	ld hl, $102
	call Func_8061b_20
Func_83b53: ; 83b53 (20:7b53)
	ld hl, $101
	call Func_8062e_20
	or a
	jp nz, Func_83b6b
	ld hl, $490
	call Func_80f72_20
	ld e, $1
	ld hl, $101
	call Func_8061b_20
Func_83b6b: ; 83b6b (20:7b6b)
	jp Func_83b6e

Func_83b6e: ; 83b6e (20:7b6e)
	jp Func_83e48

Func_83b71: ; 83b71 (20:7b71)
	ld a, [$c78c]
	cp $14
	jp nz, Func_83b96
	ld hl, $e7
	call Func_8062e_20
	cp $1
	jp nz, Func_83b8d
	ld hl, $2a5
	call Func_804a9_20
	jp Func_83b93

Func_83b8d: ; 83b8d (20:7b8d)
	ld hl, $456
	call Func_804a9_20
Func_83b93: ; 83b93 (20:7b93)
	jp Func_83e48

Func_83b96: ; 83b96 (20:7b96)
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call Func_277c
	pop bc
	pop bc
	ld hl, sp+$f
	call PutLongFromStackToHL
	ld hl, sp+$7
	push hl
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	ld de, $8
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
	ld hl, sp+$b
	call PutLongFromHLOnStack
	ld hl, sp+$b
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp c, Func_83e42
	ld hl, $29e
	call Func_804ca_20
	or a
	jp nz, Func_83e39
	ld a, $3
	call Func_80cd7_20
	cp $2
	jp z, Func_83c48
	cp $1
	jp z, Func_83c1e
	or a
	jp nz, Func_83c6f
	ld hl, $2a1
	call Func_804a9_20
	ld hl, sp+$b
	push hl
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
	jp Func_83c6f

Func_83c1e: ; 83c1e (20:7c1e)
	ld hl, $2a2
	call Func_804a9_20
	ld hl, sp+$b
	push hl
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	pop de
	ld bc, $4
	call MemCopy
	jp Func_83c6f

Func_83c48: ; 83c48 (20:7c48)
	ld hl, $2a3
	call Func_804a9_20
	ld hl, sp+$b
	push hl
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	ld de, $8
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
Func_83c6f: ; 83c6f (20:7c6f)
	ld hl, sp+$b
	call PutLongFromHLOnStack
	ld hl, sp+$13
	call PrintNum
	pop bc
	pop bc
	ld hl, sp+$f
	call FindFirstNonzero
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	ld de, Data_83e4e
	call CopyUntilNull
	ld hl, sp+$f
	write_hl_to_sp_plus $2f
	ld hl, $0
	write_hl_to_sp_plus $31
	ld a, $1
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	ld a, $2
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$2f
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	ld hl, $2a4
	call Func_804a9_20
	ld a, [$c2d8]
	cp $3
	jp nz, Func_83d45
	ld a, [$c2d9]
	cp $1
	jp nz, Func_83d45
	ld bc, Data_83a17
	ld e, BANK(Data_83a17)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_80688_20
	ld a, $2e
	call Func_80efe_20
	jp Func_83d57

Func_83d45: ; 83d45 (20:7d45)
	ld bc, Data_83a13
	ld e, BANK(Data_83a13)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_80688_20
	ld a, $2e
	call Func_80efe_20
Func_83d57: ; 83d57 (20:7d57)
	ld e, $0
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_8013d_20
	ld a, $2e
	call Func_80efe_20
	push hl
	push hl
	ld hl, sp+$f
	call PutLongFromHLOnStack
	call NegateLongOnStack
	call Func_277c
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$2
	call Func_80f94_20
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	call WriteHLToSPPlus4
	pop bc
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	ld de, Data_839ff
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld de, $5a0
	call CompareHLtoDE
	jp c, Func_83dd5
	pop hl
	push hl
	inc hl
	pop de
	push hl
	ld hl, -$5a0
	add hl, bc
	ld c, l
	ld b, h
Func_83dd5: ; 83dd5 (20:7dd5)
	push bc
	set_farcall_addrs_hli Func_93792
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, $3c
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	pop hl
	ld de, $3c
	call DivideHLByDESigned
	ld hl, sp+$6
	ld [hl], e
	ld a, $1
	ld [$c79d], a
	ld hl, sp+$2
	ld a, [hl]
	ld [$c79e], a
	ld hl, sp+$3
	ld a, [hl]
	ld [$c79f], a
	ld hl, sp+$4
	ld a, [hl]
	ld [$c7a0], a
	ld hl, sp+$5
	ld a, [hl]
	ld [$c7a1], a
	ld hl, sp+$6
	ld a, [hl]
	ld [$c7a2], a
	set_farcall_addrs_hli Func_93941
	ld a, $4
	call FarCall
	jp Func_83e3f

Func_83e39: ; 83e39 (20:7e39)
	ld hl, $2a0
	call Func_804a9_20
Func_83e3f: ; 83e3f (20:7e3f)
	jp Func_83e48

Func_83e42: ; 83e42 (20:7e42)
	ld hl, $29f
	call Func_804a9_20
Func_83e48: ; 83e48 (20:7e48)
	ld hl, $130
	add hl, sp
	ld sp, hl
	ret

Data_83e4e:
	db "G<HIRA>とられた<KATA>$"

Func_83e56: ; 83e56 (20:7e56)
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld a, [$c79d]
	cp $1
	jp nz, Func_83f33
	ld hl, sp+$6
	call Func_80f94_20
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$8
	ld c, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	push hl
	ld hl, $c7a1
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld a, [$c7a2]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld a, [$c7a0]
	ld c, a
	ld a, [$c79f]
	ld e, a
	ld a, [$c79e]
	call FarCall
	reg16swap de, hl
	ld c, $0
	pop hl
	call CompareHLtoDE
	jp nz, Func_83ee9
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, Func_83ee6
	ld c, $1
Func_83ee6: ; 83ee6 (20:7ee6)
	jp Func_83f30

Func_83ee9: ; 83ee9 (20:7ee9)
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, Func_83f30
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	push hl
	ld a, $2
	sub l
	ld a, $0
	sbc h
	jp nc, Func_83f06
	ld c, $ff
	jp Func_83f30

Func_83f06: ; 83f06 (20:7f06)
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	push bc
	call GetHLAtSPPlus4
	ld de, $5a0
	call MultiplyHLbyDE
	pop bc
	add hl, bc
	ld a, l
	sub $a0
	ld a, h
	sbc $5
	jp c, Func_83f2e
	ld c, $ff
	jp Func_83f30

Func_83f2e: ; 83f2e (20:7f2e)
	ld c, $1
Func_83f30: ; 83f30 (20:7f30)
	jp Func_83f35

Func_83f33: ; 83f33 (20:7f33)
	ld c, $2
Func_83f35: ; 83f35 (20:7f35)
	ld a, c
	add sp, $c
	ret

SECTION "Bank 21", ROMX, BANK [$21]
	lib_bank_20 21

Data_850b4:
	dr $850b4, $850fa

Data_850fa: ; 850fa
	dr $850fa, $85140

Data_85140: ; 85140
	dr $85140, $85178

Func_85178:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	call Func_80f94_21
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, Func_851a9
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_851b4
Func_851a9: ; 851a9 (21:51a9)
	ld e, $1
	ld hl, $38
	call Func_8061b_21
	jp Func_851bc

Func_851b4: ; 851b4 (21:51b4)
	ld e, $0
	ld hl, $38
	call Func_8061b_21
Func_851bc: ; 851bc (21:51bc)
	ld e, $6
	ld hl, Data_850b4
	call Func_8003a_21
	ld a, $1
	call Func_80cc6_21
	ld a, $2
	ld [$c7e2], a
	ld hl, $32
	call Func_8062e_21
	or a
	jp nz, Func_851fe
	ld e, $5
	ld hl, Data_850fa
	call Func_800fb_21
	ld e, $4
	ld hl, Data_85140
	call Func_800fb_21
	ld a, $3
	call Func_80ee6_21
	call Func_8001c_21
	call Func_852ac
	ld e, $1
	ld hl, $32
	call Func_8061b_21
	jp Func_85270

Func_851fe: ; 851fe (21:51fe)
	ld hl, $5
	call Func_8062e_21
	or a
	jp z, Func_85212
	ld hl, $6
	call Func_8062e_21
	or a
	jp nz, Func_85260
Func_85212: ; 85212 (21:5212)
	ld e, $5
	ld hl, Data_850fa
	call Func_800fb_21
	ld a, $3
	call Func_80ee6_21
	ld e, $0
	ld a, $2
	call Func_8013d_21
	ld hl, $5
	call Func_8062e_21
	cp $1
	jp nz, Func_8523a
	ld e, $0
	xor a
	call Func_8013d_21
	jp Func_85242

Func_8523a: ; 8523a (21:523a)
	ld c, $a
	ld e, $1f
	xor a
	call Func_80080_21
Func_85242: ; 85242 (21:5242)
	ld hl, $6
	call Func_8062e_21
	cp $1
	jp nz, Func_85257
	ld e, $0
	ld a, $1
	call Func_8013d_21
	jp Func_85260

Func_85257: ; 85257 (21:5257)
	ld c, $a
	ld e, $20
	ld a, $1
	call Func_80080_21
Func_85260: ; 85260 (21:5260)
	ld a, $3
	call Func_80ee6_21
	ld e, $4
	ld hl, Data_85140
	call Func_800fb_21
	call Func_8001c_21
Func_85270: ; 85270 (21:5270)
	pop bc
	pop bc
	pop bc
	ret

Data_85274:
	dr $85274, $85278

Data_85278: ; 85278
	dr $85278, $8527c

Data_8527c: ; 8527c
	dr $8527c, $85280

Data_85280: ; 85280
	dr $85280, $85286

Data_85286: ; 85286
	dr $85286, $8528a

Data_8528a: ; 8528a
	dr $8528a, $8528e

Data_8528e: ; 8528e
	dr $8528e, $85292

Data_85292: ; 85292
	dr $85292, $85298

Data_85298: ; 85298
	dr $85298, $8529c

Data_8529c: ; 8529c
	dr $8529c, $852a4

Data_852a4: ; 852a4
	dr $852a4, $852ac

Func_852ac: ; 852ac (21:52ac)
	ld hl, $3c
	call Func_8068f_21
	ld c, $1
	ld e, $1
	ld a, $5
	call Func_80176_21
	ld e, $f
	ld a, $17
	call Func_801e4_21
	ld a, $28
	call Func_80efe_21
	call Func_801d5_21
	ld hl, $3c
	call Func_8068f_21
	call Func_8018b_21
	xor a
	call Func_80ee6_21
	ld a, $1a
	call Func_80ee6_21
	ld bc, Data_85274
	ld e, BANK(Data_85274)
	xor a
	call Func_801f7_21
	ld bc, Data_85278
	ld e, BANK(Data_85278)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $2f
	call Func_804a9_21
	ld hl, $30
	call Func_804a9_21
	ld hl, $31
	call Func_804a9_21
	ld hl, $32
	call Func_804a9_21
	xor a
	call Func_80ee6_21
	ld hl, $33
	call Func_804a9_21
	ld a, $18
	call Func_80ee6_21
	ld e, $0
	xor a
	call Func_80095_21
	ld e, $0
	ld a, $1
	call Func_80095_21
	ld bc, Data_8527c
	ld e, BANK(Data_8527c)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld a, $33
	call Func_80efe_21
	ld bc, Data_85286
	ld e, BANK(Data_85286)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld e, $1
	xor a
	call Func_80095_21
	ld e, $3
	ld a, $1
	call Func_80095_21
	ld bc, Data_8528a
	ld e, BANK(Data_8528a)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld e, $2
	xor a
	call Func_80095_21
	ld e, $2
	ld a, $1
	call Func_80095_21
	ld hl, $3c
	call Func_8068f_21
	xor a
	call Func_80ee6_21
	ld a, $1
	call Func_80ee6_21
	ld hl, $34
	call Func_804a9_21
	ld hl, $35
	call Func_804a9_21
	ld hl, $36
	call Func_804a9_21
	ld hl, $37
	call Func_804a9_21
	ld a, $a
	call Func_80ff1_21
	xor a
	call Func_80ee6_21
	ld a, $1
	call Func_8101a_21
	ld a, $18
	call Func_80ee6_21
	ld bc, Data_85292
	ld e, BANK(Data_85292)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $2
	call Func_8013d_21
	ld bc, Data_85280
	ld e, BANK(Data_85280)
	xor a
	call Func_801f7_21
	ld bc, Data_8528e
	ld e, BANK(Data_8528e)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld a, $33
	call Func_80efe_21
	ld e, $3
	ld a, $1
	call Func_80095_21
	ld c, $1
	ld de, Data_85298
	ld a, BANK(Data_85298)
	call Func_8063e_21
	ld hl, $1e
	call Func_8068f_21
	ld a, $2e
	call Func_80efe_21
	call Func_8020c_21
	ld e, $2
	xor a
	call Func_80095_21
	ld e, $2
	ld a, $1
	call Func_80095_21
	ld bc, Data_8529c
	ld e, BANK(Data_8529c)
	xor a
	call Func_801f7_21
	ld bc, Data_852a4
	ld e, BANK(Data_852a4)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld a, $1
	call Func_80677_21
	ld e, $2
	xor a
	call Func_80095_21
	ld e, $2
	ld a, $1
	call Func_80095_21
	ld a, $5c
	call Func_80efe_21
	ld hl, $78
	call Func_8068f_21
	ld hl, $484
	call Func_804a9_21
	ld hl, $483
	call Func_804a9_21
	xor a
	call Func_80ee6_21
	ld a, $3
	call Func_80ee6_21
	ret

Data_85450:
	dr $85450, $85479

Data_85479: ; 85479
	dr $85479, $854a2

Data_854a2: ; 854a2
	dr $854a2, $854a6

Data_854a6: ; 854a6
	dr $854a6, $854aa

Func_854aa:
	push af
	ld a, e
	or a
	jp nz, Func_85570
	ld hl, $14
	call Func_8062e_21
	or a
	jp nz, Func_854c8
	ld a, $69
	call Func_80efe_21
	ld hl, $44
	call Func_804a9_21
	jp Func_85570

Func_854c8: ; 854c8 (21:54c8)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_8551c
	ld hl, $45
	call Func_804a9_21
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_85572
	ld hl, Data_85450
	call Func_80dd3_21
	or a
	jp nz, Func_854eb
	jp Func_85570

Func_854eb: ; 854eb (21:54eb)
	ld bc, Data_854a2
	ld e, BANK(Data_854a2)
	xor a
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call Func_8061b_21
	ld hl, $6
	call Func_8062e_21
	or a
	jp nz, Func_85519
	ld a, $2
	call Func_80c94_21
	ld a, $d
	call Func_80c94_21
Func_85519: ; 85519 (21:5519)
	jp Func_85570

Func_8551c: ; 8551c (21:551c)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_85570
	ld hl, $46
	call Func_804a9_21
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_8557a
	ld hl, Data_85479
	call Func_80dd3_21
	or a
	jp nz, Func_85540
	jp Func_85570

Func_85540: ; 85540 (21:5540)
	ld bc, Data_854a6
	ld e, BANK(Data_854a6)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call Func_8061b_21
	ld hl, $5
	call Func_8062e_21
	or a
	jp nz, Func_85570
	ld a, $2
	call Func_80c94_21
	ld a, $d
	call Func_80c94_21
Func_85570: ; 85570 (21:5570)
	pop bc
	ret

Data_85572:
	db "<HIRA>こふﾞん1<KATA>$"

Data_8557a:
	db "<HIRA>こふﾞん2<KATA>$"

Data_85582
	dr $85582, $855ab

Data_855ab: ; 855ab
	dr $855ab, $855d4

Data_855d4: ; 855d4
	dr $855d4, $855d8

Data_855d8: ; 855d8
	dr $855d8, $855dc

Func_855dc:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $2
	jp nz, Func_856d9
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_8560d
	ld hl, $6
	call Func_8062e_21
	or a
	jp nz, Func_8560a
	ld e, $3
	ld a, $1
	call Func_80095_21
	ld a, $1
	call Func_80677_21
	ld hl, sp+$0
	ld [hl], $1
Func_8560a: ; 8560a (21:560a)
	jp Func_8562e

Func_8560d: ; 8560d (21:560d)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_8562e
	ld hl, $5
	call Func_8062e_21
	or a
	jp nz, Func_8562e
	ld e, $1
	xor a
	call Func_80095_21
	ld a, $3
	call Func_80677_21
	ld hl, sp+$0
	ld [hl], $1
Func_8562e: ; 8562e (21:562e)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_856d9
	ld hl, $47
	call Func_804a9_21
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_8568d
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_856dc
	ld hl, Data_855ab
	call Func_80dd3_21
	or a
	jp nz, Func_8565a
	jp Func_856d9

Func_8565a: ; 8565a (21:565a)
	ld bc, Data_855d8
	ld e, BANK(Data_855d8)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call Func_8061b_21
	ld hl, $5
	call Func_8062e_21
	or a
	jp nz, Func_8568a
	ld a, $2
	call Func_80c94_21
	ld a, $d
	call Func_80c94_21
Func_8568a: ; 8568a (21:568a)
	jp Func_856d9

Func_8568d: ; 8568d (21:568d)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_856d9
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_856e4
	ld hl, Data_85582
	call Func_80dd3_21
	or a
	jp nz, Func_856ab
	jp Func_856d9

Func_856ab: ; 856ab (21:56ab)
	ld bc, Data_855d4
	ld e, BANK(Data_855d4)
	xor a
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call Func_8061b_21
	ld hl, $6
	call Func_8062e_21
	or a
	jp nz, Func_856d9
	ld a, $2
	call Func_80c94_21
	ld a, $d
	call Func_80c94_21
Func_856d9: ; 856d9 (21:56d9)
	pop bc
	pop bc
	ret

Data_856dc:
	db "<HIRA>こふﾞん2<KATA>$"

Data_856e4:
	db "<HIRA>こふﾞん1<KATA>$"

Data_856ec:
	dr $856ec, $85715

Data_85715: ; 85715
	dr $85715, $8573e

Data_8573e: ; 8573e
	dr $8573e, $85742

Data_85742: ; 85742
	dr $85742, $85746

Func_85746:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $2
	jp nz, Func_8581b
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, Func_85777
	ld hl, $6
	call Func_8062e_21
	or a
	jp nz, Func_85774
	ld e, $3
	ld a, $1
	call Func_80095_21
	ld a, $1
	call Func_80677_21
	ld hl, sp+$0
	ld [hl], $1
Func_85774: ; 85774 (21:5774)
	jp Func_85798

Func_85777: ; 85777 (21:5777)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_85798
	ld hl, $5
	call Func_8062e_21
	or a
	jp nz, Func_85798
	ld e, $1
	xor a
	call Func_80095_21
	ld a, $3
	call Func_80677_21
	ld hl, sp+$0
	ld [hl], $1
Func_85798: ; 85798 (21:5798)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_8581b
	ld hl, $47
	call Func_804a9_21
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, Func_857e3
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_8581e
	ld hl, Data_85715
	call Func_80dd3_21
	or a
	jp nz, Func_857c4
	jp Func_8581b

Func_857c4: ; 857c4 (21:57c4)
	ld bc, Data_85742
	ld e, BANK(Data_85742)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call Func_8061b_21
	jp Func_8581b

Func_857e3: ; 857e3 (21:57e3)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_8581b
	ld hl, $1e
	call Func_8068f_21
	ld de, Data_85826
	ld hl, Data_856ec
	call Func_80dd3_21
	or a
	jp nz, Func_85801
	jp Func_8581b

Func_85801: ; 85801 (21:5801)
	ld bc, Data_8573e
	ld e, BANK(Data_8573e)
	xor a
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call Func_8061b_21
Func_8581b: ; 8581b (21:581b)
	pop bc
	pop bc
	ret

Data_8581e:
	db "<HIRA>こふﾞん2<KATA>$"

Data_85826:
	db "<HIRA>こふﾞん1<KATA>$"

Data_8582e:
	dr $8582e, $85832

Func_85832:
	ld a, e
	or a
	jp nz, Func_858cf
	ld a, $f
	call Func_80e6d_21
	cp $ff
	jp nz, Func_8585f
	ld a, $41
	call Func_80e6d_21
	cp $ff
	jp nz, Func_8585f
	ld a, $50
	call Func_80e6d_21
	cp $ff
	jp nz, Func_8585f
	ld a, $64
	call Func_80e6d_21
	cp $ff
	jp z, Func_858c9
Func_8585f: ; 8585f (21:585f)
	ld a, [$c790]
	or a
	jp z, Func_858c0
	ld a, [$c790]
	cp $6
	jp nc, Func_858c0
	ld hl, $32d
	call Func_804ba_21
	or a
	jp nz, Func_858bd
	ld c, $1
	ld de, Data_8582e
	ld a, BANK(Data_8582e)
	call Func_8063e_21
	call Func_8020c_21
	xor a
	call Func_80ee6_21
	ld a, $a
	call Func_80ee6_21
	xor a
	call Func_80653_21
	ld c, $1
	ld e, $1
	ld a, $b
	call Func_80176_21
	ld a, $44
	call Func_80efe_21
	call Func_801d5_21
	call Func_8018b_21
	ld a, $4
	call Func_80cc6_21
	ld a, $1
	call Func_80677_21
	ld l, $b
	push hl
	ld c, $25
	ld e, $0
	ld a, $1e
	call Func_80dff_21
	pop bc
Func_858bd: ; 858bd (21:58bd)
	jp Func_858c6

Func_858c0: ; 858c0 (21:58c0)
	ld hl, $377
	call Func_80498_21
Func_858c6: ; 858c6 (21:58c6)
	jp Func_858cf

Func_858c9: ; 858c9 (21:58c9)
	ld hl, $376
	call Func_80498_21
Func_858cf: ; 858cf (21:58cf)
	ret

Data_858d0:
	dr $858d0, $858f9

Func_858f9:
	push af
	ld a, e
	or a
	jp nz, Func_8592e
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $1d8
	call Func_804ba_21
	or a
	jp nz, Func_85928
	ld de, Data_85930
	ld hl, Data_858d0
	call Func_80dd3_21
	or a
	jp nz, Func_8591f
	jp Func_8592e

Func_8591f: ; 8591f (21:591f)
	ld hl, $2e5
	call Func_80498_21
	jp Func_8592e

Func_85928: ; 85928 (21:5928)
	ld hl, $2e4
	call Func_80498_21
Func_8592e: ; 8592e (21:592e)
	pop bc
	ret

Data_85930:
	db "<HIRA>おんなのこ<KATA>$"

Data_85938:
	dr $85938, $8598e

Data_8598e: ; 8598e
	dr $8598e, $85992

Data_85992: ; 85992
	dr $85992, $859c9

Data_859c9: ; 859c9
	dr $859c9, $85a0f

Data_85a0f: ; 85a0f
	dr $85a0f, $85a1d

Func_85a1d:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	call Func_80f94_21
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, Func_85a4e
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_85a59
Func_85a4e: ; 85a4e (21:5a4e)
	ld e, $1
	ld hl, $38
	call Func_8061b_21
	jp Func_85a61

Func_85a59: ; 85a59 (21:5a59)
	ld e, $0
	ld hl, $38
	call Func_8061b_21
Func_85a61: ; 85a61 (21:5a61)
	ld a, $1
	ld [$c7de], a
	ld e, $5
	ld hl, Data_85992
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_85aaf
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_85aaf
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_85938
	call Func_80d24_21
	ld a, $8
	call Func_80ee6_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_85aa8
	ld a, $1
	ld [$c7da], a
	jp Func_85aac

Func_85aa8: ; 85aa8 (21:5aa8)
	xor a
	ld [$c7da], a
Func_85aac: ; 85aac (21:5aac)
	jp Func_85abc

Func_85aaf: ; 85aaf (21:5aaf)
	ld e, $5
	ld hl, Data_859c9
	call Func_800fb_21
	ld a, $11
	call Func_80ee6_21
Func_85abc: ; 85abc (21:5abc)
	ld a, [$c797]
	cp $7
	jp c, Func_85afc
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_85ada
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp z, Func_85afc
Func_85ada: ; 85ada (21:5ada)
	ld e, $0
	ld a, $4
	call Func_8013d_21
	ld e, $1
	ld hl, Data_85a0f
	call Func_800fb_21
	ld hl, $14
	call Func_8062e_21
	cp $1
	jp nz, Func_85afc
	ld de, Data_8598e
	ld a, $5
	call Func_80150_21
Func_85afc: ; 85afc (21:5afc)
	call Func_8001c_21
	ld hl, $2c4
	call Func_80f72_21
	pop bc
	pop bc
	pop bc
	ret

Data_85b09:
	dr $85b09, $85b17

Func_85b17:
	push af
	ld a, e
	or a
	jp nz, Func_85b6d
	ld hl, $c0
	call Func_8062e_21
	or a
	jp nz, Func_85b52
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $38
	call Func_804a9_21
	ld a, $2a
	call Func_80efe_21
	ld hl, $479
	call Func_80498_21
	ld c, $0
	ld e, $1
	ld a, $17
	call Func_80d4d_21
	ld e, $1
	ld hl, $c0
	call Func_8061b_21
	jp Func_85b6d

Func_85b52: ; 85b52 (21:5b52)
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c797
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_85b09
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_80498_21
Func_85b6d: ; 85b6d (21:5b6d)
	pop bc
	ret

Data_85b6f:
	dr $85b6f, $85b98

Func_85b98:
	push af
	ld a, e
	or a
	jp nz, Func_85c1a
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_85c14
	ld hl, $64
	call Func_8062e_21
	or a
	jp nz, Func_85c0b
	ld hl, $39
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_85c02
	ld de, Data_85c1c
	ld hl, Data_85b6f
	call Func_80dd3_21
	or a
	jp nz, Func_85bd9
	jp Func_85c1a

Func_85bd9: ; 85bd9 (21:5bd9)
	ld e, $1
	ld hl, $64
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $3a
	call Func_804a9_21
	jp Func_85c08

Func_85c02: ; 85c02 (21:5c02)
	ld hl, $3b
	call Func_804a9_21
Func_85c08: ; 85c08 (21:5c08)
	jp Func_85c11

Func_85c0b: ; 85c0b (21:5c0b)
	ld hl, $168
	call Func_804a9_21
Func_85c11: ; 85c11 (21:5c11)
	jp Func_85c1a

Func_85c14: ; 85c14 (21:5c14)
	ld hl, $478
	call Func_80498_21
Func_85c1a: ; 85c1a (21:5c1a)
	pop bc
	ret

Data_85c1c:
	dr $85c1c, $85c28

Data_85c28: ; 85c28
	dr $85c28, $85c7e

Data_85c7e: ; 85c7e
	dr $85c7e, $85c82

Data_85c82: ; 85c82
	dr $85c82, $85c98

Data_85c98: ; 85c98
	dr $85c98, $85cde

Func_85cde:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	call Func_80f94_21
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, Func_85d0f
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_85d1a
Func_85d0f: ; 85d0f (21:5d0f)
	ld e, $1
	ld hl, $38
	call Func_8061b_21
	jp Func_85d22

Func_85d1a: ; 85d1a (21:5d1a)
	ld e, $0
	ld hl, $38
	call Func_8061b_21
Func_85d22: ; 85d22 (21:5d22)
	ld a, $7
	ld [$c7de], a
	ld e, $2
	ld hl, Data_85c82
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_85d70
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_85d70
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_85c28
	call Func_80d24_21
	ld a, $8
	call Func_80ee6_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_85d69
	ld a, $1
	ld [$c7da], a
	jp Func_85d6d

Func_85d69: ; 85d69 (21:5d69)
	xor a
	ld [$c7da], a
Func_85d6d: ; 85d6d (21:5d6d)
	jp Func_85d7d

Func_85d70: ; 85d70 (21:5d70)
	ld e, $5
	ld hl, Data_85c98
	call Func_800fb_21
	ld a, $11
	call Func_80ee6_21
Func_85d7d: ; 85d7d (21:5d7d)
	ld hl, $14
	call Func_8062e_21
	or a
	jp nz, Func_85d97
	ld a, [$c797]
	cp $7
	jp nz, Func_85d97
	ld de, Data_85c7e
	ld a, $3
	call Func_80150_21
Func_85d97: ; 85d97 (21:5d97)
	call Func_8001c_21
	ld hl, $2ca
	call Func_80f72_21
	pop bc
	pop bc
	pop bc
	ret

Data_85da4:
	dr $85da4, $85dcd

Func_85dcd:
	push af
	ld a, e
	or a
	jp nz, Func_85e60
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_85e5a
	ld a, [$c797]
	cp $6
	jp c, Func_85e51
	ld hl, $6a
	call Func_8062e_21
	or a
	jp nz, Func_85e48
	ld hl, $221
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_85e3f
	ld de, Data_85e62
	ld hl, Data_85da4
	call Func_80dd3_21
	or a
	jp nz, Func_85e16
	jp Func_85e60

Func_85e16: ; 85e16 (21:5e16)
	ld e, $1
	ld hl, $6a
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $222
	call Func_804a9_21
	jp Func_85e45

Func_85e3f: ; 85e3f (21:5e3f)
	ld hl, $25e
	call Func_804a9_21
Func_85e45: ; 85e45 (21:5e45)
	jp Func_85e4e

Func_85e48: ; 85e48 (21:5e48)
	ld hl, $170
	call Func_804a9_21
Func_85e4e: ; 85e4e (21:5e4e)
	jp Func_85e57

Func_85e51: ; 85e51 (21:5e51)
	ld hl, $220
	call Func_804a9_21
Func_85e57: ; 85e57 (21:5e57)
	jp Func_85e60

Func_85e5a: ; 85e5a (21:5e5a)
	ld hl, $478
	call Func_80498_21
Func_85e60: ; 85e60 (21:5e60)
	pop bc
	ret

Data_85e62:
	db "<HIRA>りかの せんせい<KATA>$"

Data_85e6d:
	dr $85e6d, $85eb3

Data_85eb3: ; 85eb3
	dr $85eb3, $85f05

Data_85f05: ; 85f05
	dr $85f05, $85f26

Data_85f26: ; 85f26
	dr $85f26, $85f42

Data_85f42: ; 85f42
	dr $85f42, $85f6c

Func_85f6c:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	call Func_80f94_21
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, Func_85f9d
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_85fa8
Func_85f9d: ; 85f9d (21:5f9d)
	ld e, $1
	ld hl, $38
	call Func_8061b_21
	jp Func_85fb0

Func_85fa8: ; 85fa8 (21:5fa8)
	ld e, $0
	ld hl, $38
	call Func_8061b_21
Func_85fb0: ; 85fb0 (21:5fb0)
	ld a, [$c798]
	or a
	jp nz, Func_85fd8
	ld a, [$c2d8]
	cp $5
	jp nz, Func_85fc9
	ld a, [$c7de]
	inc a
	ld [$c7de], a
	jp Func_85fd8

Func_85fc9: ; 85fc9 (21:5fc9)
	ld a, [$c2d8]
	cp $4
	jp nz, Func_85fd8
	ld a, [$c7de]
	dec a
	ld [$c7de], a
Func_85fd8: ; 85fd8 (21:5fd8)
	ld e, $3
	ld hl, Data_85f05
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_86014
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_86014
	ld a, $8
	call Func_80ee6_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_8600d
	ld a, $1
	ld [$c7da], a
	jp Func_86011

Func_8600d: ; 8600d (21:600d)
	xor a
	ld [$c7da], a
Func_86011: ; 86011 (21:6011)
	jp Func_86019

Func_86014: ; 86014 (21:6014)
	ld a, $11
	call Func_80ee6_21
Func_86019: ; 86019 (21:6019)
	call Func_8001c_21
	ld a, [$c7de]
	cp $5
	jp z, Func_86060
	cp $3
	jp nz, Func_86094
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_8604f
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_8604f
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_85e6d
	call Func_80d24_21
	jp Func_86057

Func_8604f: ; 8604f (21:604f)
	ld e, $2
	ld hl, Data_85f26
	call Func_800fb_21
Func_86057: ; 86057 (21:6057)
	ld hl, $2c6
	call Func_80f72_21
	jp Func_86094

Func_86060: ; 86060 (21:6060)
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_86086
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_86086
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_85eb3
	call Func_80d24_21
	jp Func_8608e

Func_86086: ; 86086 (21:6086)
	ld e, $3
	ld hl, Data_85f42
	call Func_800fb_21
Func_8608e: ; 8608e (21:608e)
	ld hl, $2c8
	call Func_80f72_21
Func_86094: ; 86094 (21:6094)
	pop bc
	pop bc
	pop bc
	ret

Data_86098:
	dr $86098, $860c1

Func_860c1:
	push af
	ld a, e
	or a
	jp nz, Func_86143
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_8613d
	ld hl, $66
	call Func_8062e_21
	or a
	jp nz, Func_86134
	ld hl, $40
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_8612b
	ld de, Data_86145
	ld hl, Data_86098
	call Func_80dd3_21
	or a
	jp nz, Func_86102
	jp Func_86143

Func_86102: ; 86102 (21:6102)
	ld e, $1
	ld hl, $66
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $41
	call Func_804a9_21
	jp Func_86131

Func_8612b: ; 8612b (21:612b)
	ld hl, $42
	call Func_804a9_21
Func_86131: ; 86131 (21:6131)
	jp Func_8613a

Func_86134: ; 86134 (21:6134)
	ld hl, $16d
	call Func_804a9_21
Func_8613a: ; 8613a (21:613a)
	jp Func_86143

Func_8613d: ; 8613d (21:613d)
	ld hl, $478
	call Func_80498_21
Func_86143: ; 86143 (21:6143)
	pop bc
	ret

Data_86145:
	db "<HIRA>えいこﾞの せんせい<KATA>$"

Data_86152:
	dr $86152, $8617b

Func_8617b:
	push af
	ld a, e
	or a
	jp nz, Func_861fd
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_861f7
	ld hl, $68
	call Func_8062e_21
	or a
	jp nz, Func_861ee
	ld hl, $21a
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_861e5
	ld de, Data_861ff
	ld hl, Data_86152
	call Func_80dd3_21
	or a
	jp nz, Func_861bc
	jp Func_861fd

Func_861bc: ; 861bc (21:61bc)
	ld e, $1
	ld hl, $68
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $21b
	call Func_804a9_21
	jp Func_861eb

Func_861e5: ; 861e5 (21:61e5)
	ld hl, Func_021c
	call Func_804a9_21
Func_861eb: ; 861eb (21:61eb)
	jp Func_861f4

Func_861ee: ; 861ee (21:61ee)
	ld hl, $179
	call Func_804a9_21
Func_861f4: ; 861f4 (21:61f4)
	jp Func_861fd

Func_861f7: ; 861f7 (21:61f7)
	ld hl, $478
	call Func_80498_21
Func_861fd: ; 861fd (21:61fd)
	pop bc
	ret

Data_861ff:
	db "<HIRA>しゃかいの せんせい<KATA>$"

Data_8620c:
	dr $8620c, $86252

Data_86252: ; 86252
	dr $86252, $86298

Data_86298: ; 86298
	dr $86298, $862fe

Data_862fe: ; 862fe
	dr $862fe, $8631f

Data_8631f: ; 8631f
	dr $8631f, $86340

Data_86340: ; 86340
	dr $86340, $86361

Data_86361: ; 86361
	dr $86361, $8638b

Data_8638b: ; 8638b
	dr $8638b, $863c3

Data_863c3: ; 863c3
	dr $863c3, $863fb

Func_863fb:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	call Func_80f94_21
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, Func_8642c
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_86437
Func_8642c: ; 8642c (21:642c)
	ld e, $1
	ld hl, $38
	call Func_8061b_21
	jp Func_8643f

Func_86437: ; 86437 (21:6437)
	ld e, $0
	ld hl, $38
	call Func_8061b_21
Func_8643f: ; 8643f (21:643f)
	ld a, [$c798]
	or a
	jp nz, Func_86467
	ld a, [$c2d8]
	cp $5
	jp nz, Func_86458
	ld a, [$c7de]
	dec a
	ld [$c7de], a
	jp Func_86467

Func_86458: ; 86458 (21:6458)
	ld a, [$c2d8]
	cp $4
	jp nz, Func_86467
	ld a, [$c7de]
	inc a
	ld [$c7de], a
Func_86467: ; 86467 (21:6467)
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_8649b
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_8649b
	ld a, $8
	call Func_80ee6_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_86494
	ld a, $1
	ld [$c7da], a
	jp Func_86498

Func_86494: ; 86494 (21:6494)
	xor a
	ld [$c7da], a
Func_86498: ; 86498 (21:6498)
	jp Func_864a0

Func_8649b: ; 8649b (21:649b)
	ld a, $11
	call Func_80ee6_21
Func_864a0: ; 864a0 (21:64a0)
	ld a, [$c7de]
	cp $6
	jp z, Func_86536
	cp $4
	jp z, Func_864f4
	cp $2
	jp nz, Func_86575
	ld e, $3
	ld hl, Data_862fe
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_864e0
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_864e0
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_8620c
	call Func_80d24_21
	jp Func_864e8

Func_864e0: ; 864e0 (21:64e0)
	ld e, $3
	ld hl, Data_86361
	call Func_800fb_21
Func_864e8: ; 864e8 (21:64e8)
	call Func_8001c_21
	ld hl, $2c5
	call Func_80f72_21
	jp Func_86575

Func_864f4: ; 864f4 (21:64f4)
	ld e, $3
	ld hl, Data_8631f
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_86522
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_86522
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_86252
	call Func_80d24_21
	jp Func_8652a

Func_86522: ; 86522 (21:6522)
	ld e, $4
	ld hl, Data_8638b
	call Func_800fb_21
Func_8652a: ; 8652a (21:652a)
	call Func_8001c_21
	ld hl, $2c7
	call Func_80f72_21
	jp Func_86575

Func_86536: ; 86536 (21:6536)
	ld e, $3
	ld hl, Data_86340
	call Func_8003a_21
	ld hl, $38
	call Func_8062e_21
	cp $1
	jp nz, Func_86564
	ld hl, $7
	call Func_8062e_21
	cp $1
	jp nz, Func_86564
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_86298
	call Func_80d24_21
	jp Func_8656c

Func_86564: ; 86564 (21:6564)
	ld e, $4
	ld hl, Data_863c3
	call Func_800fb_21
Func_8656c: ; 8656c (21:656c)
	call Func_8001c_21
	ld hl, $2c9
	call Func_80f72_21
Func_86575: ; 86575 (21:6575)
	pop bc
	pop bc
	pop bc
	ret

Func_86579:
	push af
	ld a, e
	or a
	jp nz, Func_865fa
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $14
	call Func_8062e_21
	or a
	jp nz, Func_865f4
	ld hl, $c5
	call Func_8062e_21
	or a
	jp nz, Func_865eb
	ld a, $3b
	call Func_80e5d_21
	cp $1
	jp nz, Func_865e2
	ld hl, $161
	call Func_804ca_21
	or a
	jp nz, Func_865be
	ld hl, $162
	call Func_804a9_21
	ld e, $1
	ld hl, $c5
	call Func_8061b_21
	jp Func_865df

Func_865be: ; 865be (21:65be)
	ld hl, $164
	call Func_804a9_21
	ld hl, $3f5
	call Func_80498_21
	ld e, $0
	ld a, $7f
	call Func_80d74_21
	ld hl, $3f6
	call Func_804a9_21
	ld e, $1
	ld hl, $c5
	call Func_8061b_21
Func_865df: ; 865df (21:65df)
	jp Func_865e8

Func_865e2: ; 865e2 (21:65e2)
	ld hl, $160
	call Func_804a9_21
Func_865e8: ; 865e8 (21:65e8)
	jp Func_865f1

Func_865eb: ; 865eb (21:65eb)
	ld hl, $16e
	call Func_80498_21
Func_865f1: ; 865f1 (21:65f1)
	jp Func_865fa

Func_865f4: ; 865f4 (21:65f4)
	ld hl, $16e
	call Func_80498_21
Func_865fa: ; 865fa (21:65fa)
	pop bc
	ret

Data_865fc:
	dr $865fc, $86625

Func_86625:
	push af
	ld a, e
	or a
	jp nz, Func_866a7
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_866a1
	ld hl, $65
	call Func_8062e_21
	or a
	jp nz, Func_86698
	ld hl, $3d
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_8668f
	ld de, Data_866a9
	ld hl, Data_865fc
	call Func_80dd3_21
	or a
	jp nz, Func_86666
	jp Func_866a7

Func_86666: ; 86666 (21:6666)
	ld e, $1
	ld hl, $65
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $3e
	call Func_804a9_21
	jp Func_86695

Func_8668f: ; 8668f (21:668f)
	ld hl, $3f
	call Func_804a9_21
Func_86695: ; 86695 (21:6695)
	jp Func_8669e

Func_86698: ; 86698 (21:6698)
	ld hl, $16a
	call Func_804a9_21
Func_8669e: ; 8669e (21:669e)
	jp Func_866a7

Func_866a1: ; 866a1 (21:66a1)
	ld hl, $478
	call Func_80498_21
Func_866a7: ; 866a7 (21:66a7)
	pop bc
	ret

Data_866a9:
	db "<HIRA>こくこﾞの せんせい<KATA>$"

Data_866b6:
	dr $866b6, $866df

Func_866df:
	push af
	ld a, e
	or a
	jp nz, Func_86761
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_8675b
	ld hl, $67
	call Func_8062e_21
	or a
	jp nz, Func_86752
	ld hl, $43
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_86749
	ld de, Data_86763
	ld hl, Data_866b6
	call Func_80dd3_21
	or a
	jp nz, Func_86720
	jp Func_86761

Func_86720: ; 86720 (21:6720)
	ld e, $1
	ld hl, $67
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $217
	call Func_804a9_21
	jp Func_8674f

Func_86749: ; 86749 (21:6749)
	ld hl, $219
	call Func_804a9_21
Func_8674f: ; 8674f (21:674f)
	jp Func_86758

Func_86752: ; 86752 (21:6752)
	ld hl, $176
	call Func_804a9_21
Func_86758: ; 86758 (21:6758)
	jp Func_86761

Func_8675b: ; 8675b (21:675b)
	ld hl, $478
	call Func_80498_21
Func_86761: ; 86761 (21:6761)
	pop bc
	ret

Data_86763:
	db "<HIRA>たいいくの せんせい<KATA>$"

Data_86770:
	dr $86770, $86799

Func_86799:
	push af
	ld a, e
	or a
	jp nz, Func_8681b
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $c0
	call Func_8062e_21
	cp $1
	jp nz, Func_86815
	ld hl, $69
	call Func_8062e_21
	or a
	jp nz, Func_8680c
	ld hl, $21d
	call Func_804a9_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_86803
	ld de, Data_8681d
	ld hl, Data_86770
	call Func_80dd3_21
	or a
	jp nz, Func_867da
	jp Func_8681b

Func_867da: ; 867da (21:67da)
	ld e, $1
	ld hl, $69
	call Func_8061b_21
	ld a, [$c797]
	inc a
	ld [$c797], a
	ld a, $28
	call Func_80efe_21
	ld hl, $342
	call Func_80498_21
	ld hl, $3c
	call Func_8068f_21
	ld hl, $21e
	call Func_804a9_21
	jp Func_86809

Func_86803: ; 86803 (21:6803)
	ld hl, $21f
	call Func_804a9_21
Func_86809: ; 86809 (21:6809)
	jp Func_86812

Func_8680c: ; 8680c (21:680c)
	ld hl, $16f
	call Func_804a9_21
Func_86812: ; 86812 (21:6812)
	jp Func_8681b

Func_86815: ; 86815 (21:6815)
	ld hl, $478
	call Func_80498_21
Func_8681b: ; 8681b (21:681b)
	pop bc
	ret

Data_8681d:
	db "<HIRA>すうかﾞくの せんせい<KATA>$"

Data_8682b:
	dr $8682b, $86836

Data_86836: ; 86836
	dr $86836, $8686e

Data_8686e: ; 8686e
	dr $8686e, $8688a

Func_8688a:
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $2
	call Func_80f24_21
	pop bc
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $f
	call Func_80f24_21
	pop bc
	ld e, $2
	ld hl, Data_8686e
	call Func_800fb_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, Data_8682b
	call Func_8003a_21
	ld hl, $7
	call Func_8062e_21
	or a
	jp nz, Func_868d5
	ld e, $4
	ld hl, Data_86836
	call Func_800fb_21
	call Func_8001c_21
	call Func_86943
	jp Func_868dd

Func_868d5: ; 868d5 (21:68d5)
	ld a, $7
	call Func_80ee6_21
	call Func_8001c_21
Func_868dd: ; 868dd (21:68dd)
	ret

Data_868de:
	dr $868de, $86907

Data_86907: ; 86907
	dr $86907, $8690f

Data_8690f: ; 8690f
	dr $8690f, $86913

Data_86913: ; 86913
	dr $86913, $86917

Data_86917: ; 86917
	dr $86917, $8691f

Data_8691f: ; 8691f
	dr $8691f, $86923

Data_86923: ; 86923
	dr $86923, $86927

Data_86927: ; 86927
	dr $86927, $8692d

Data_8692d: ; 8692d
	dr $8692d, $86931

Data_86931: ; 86931
	dr $86931, $86935

Data_86935: ; 86935
	dr $86935, $8693b

Data_8693b: ; 8693b
	dr $8693b, $8693f

Data_8693f: ; 8693f
	dr $8693f, $86943

Func_86943: ; 86943 (21:6943)
	xor a
	call Func_80ee6_21
	ld a, $1
	call Func_80ee6_21
	call Func_8020c_21
	ld c, $1
	ld de, Data_86907
	ld a, BANK(Data_86907)
	call Func_8063e_21
	call Func_8020c_21
	xor a
	call Func_80677_21
	ld c, $1
	ld e, $1
	ld a, $7
	call Func_80176_21
	ld a, $68
	call Func_80efe_21
	call Func_801d5_21
	ld c, $1
	ld e, $1
	ld a, $7
	call Func_80176_21
	ld a, $68
	call Func_80efe_21
	call Func_801d5_21
	ld c, $1
	ld e, $1
	ld a, $7
	call Func_80176_21
	ld a, $68
	call Func_80efe_21
	call Func_801d5_21
	ld hl, $48
	call Func_804a9_21
	ld bc, Data_8690f
	ld e, BANK(Data_8690f)
	ld a, $3
	call Func_801f7_21
	ld bc, Data_86913
	ld e, BANK(Data_86913)
	ld a, $4
	call Func_80688_21
	call Func_8020c_21
	ld e, $3
	ld a, $2
	call Func_80095_21
	xor a
	call Func_80ee6_21
	ld a, $1a
	call Func_80ee6_21
	ld hl, $49
	call Func_804a9_21
	ld hl, $4a
	call Func_804a9_21
	ld e, $2
	ld a, $2
	call Func_80095_21
	ld hl, $4b
	call Func_804a9_21
	ld de, Data_86ac4
	ld hl, Data_868de
	call Func_80dd3_21
	or a
	jp nz, Func_869e7
	ret

Func_869e7: ; 869e7 (21:69e7)
	ld a, $69
	call Func_80efe_21
	ld hl, $4c
	call Func_804a9_21
	xor a
	call Func_80ee6_21
	ld a, $18
	call Func_80ee6_21
	ld bc, Data_86917
	ld e, BANK(Data_86917)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld a, $1
	call Func_80677_21
	ld bc, Data_8691f
	ld e, BANK(Data_8691f)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $2
	call Func_8013d_21
	xor a
	call Func_80677_21
	ld bc, Data_86923
	ld e, BANK(Data_86923)
	ld a, $3
	call Func_80688_21
	ld bc, Data_86927
	ld e, BANK(Data_86927)
	ld a, $4
	call Func_80688_21
	call Func_8020c_21
	ld bc, Data_8692d
	ld e, BANK(Data_8692d)
	ld a, $3
	call Func_801f7_21
	ld bc, Data_86931
	ld e, BANK(Data_86931)
	ld a, $4
	call Func_80688_21
	call Func_8020c_21
	ld a, $3
	call Func_80677_21
	ld bc, Data_86935
	ld e, BANK(Data_86935)
	ld a, $3
	call Func_801f7_21
	ld bc, Data_8693b
	ld e, BANK(Data_8693b)
	ld a, $4
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $3
	call Func_8013d_21
	ld e, $0
	ld a, $4
	call Func_8013d_21
	xor a
	call Func_80ee6_21
	ld a, $7
	call Func_80ee6_21
	ld hl, $1e
	call Func_8068f_21
	ld bc, Data_8693f
	ld e, BANK(Data_8693f)
	ld a, $5
	call Func_80688_21
	call Func_8020c_21
	ld e, $2
	ld a, $5
	call Func_80095_21
	ld hl, $1e
	call Func_8068f_21
	xor a
	call Func_80677_21
	ld hl, $1e
	call Func_8068f_21
	ld hl, $345
	call Func_804a9_21
	ld e, $1
	ld hl, $7
	call Func_8061b_21
	ld a, $8
	ld [$c790], a
	ret

Data_86ac4:
	db "ヒﾞスコ$"

Func_86ac9:
	ld a, e
	or a
	jp nz, Func_86b0c
	ld e, $1
	ld a, $5
	call Func_80095_21
	ld e, $0
	ld a, $5
	call Func_80095_21
	ld e, $3
	ld a, $5
	call Func_80095_21
	ld e, $2
	ld a, $5
	call Func_80095_21
	ld hl, $1e
	call Func_8068f_21
	ld e, $3
	ld a, $5
	call Func_80095_21
	ld e, $0
	ld a, $5
	call Func_80095_21
	ld e, $1
	ld a, $5
	call Func_80095_21
	ld e, $2
	ld a, $5
	call Func_80095_21
Func_86b0c: ; 86b0c (21:6b0c)
	ret

Func_86b0d:
	ld a, e
	or a
	jp nz, Func_86c00
	ld hl, $d6
	call Func_8062e_21
	or a
	jp nz, Func_86bfa
	ld a, $5e
	call Func_80efe_21
	ld c, $2
	ld e, $2
	ld a, $8
	call Func_80176_21
	ld e, $4
	ld a, $e
	call Func_801e4_21
	call Func_801d5_21
	call Func_8018b_21
	ld a, $28
	call Func_80efe_21
	ld e, $1
	xor a
	call Func_8013d_21
	ld a, $60
	call Func_80efe_21
	ld e, $3
	xor a
	call Func_80095_21
	ld e, $0
	xor a
	call Func_80095_21
	ld e, $1
	xor a
	call Func_80095_21
	ld e, $2
	xor a
	call Func_80095_21
	ld e, $3
	xor a
	call Func_80095_21
	ld e, $0
	xor a
	call Func_80095_21
	ld e, $1
	xor a
	call Func_80095_21
	ld e, $2
	xor a
	call Func_80095_21
	ld a, $f
	call Func_80ff1_21
	xor a
	call Func_80ee6_21
	ld a, $1
	call Func_8101a_21
	ld a, $14
	call Func_80ee6_21
	xor a
	call Func_8044b_21
	ld hl, $1e
	call Func_8068f_21
	ld c, $8
	ld e, $7
	ld a, $6
	call Func_80e8d_21
	ld e, $1
	ld hl, $d6
	call Func_8061b_21
	ld a, $60
	call Func_80efe_21
	ld e, $3
	xor a
	call Func_80095_21
	ld e, $0
	xor a
	call Func_80095_21
	ld e, $1
	xor a
	call Func_80095_21
	ld e, $2
	xor a
	call Func_80095_21
	ld e, $3
	xor a
	call Func_80095_21
	ld e, $0
	xor a
	call Func_80095_21
	ld e, $1
	xor a
	call Func_80095_21
	ld e, $2
	xor a
	call Func_80095_21
	ld a, $f
	call Func_80ff1_21
	xor a
	call Func_80ee6_21
	ld a, $1
	call Func_8101a_21
	ld a, $7
	call Func_80ee6_21
	xor a
	call Func_8044b_21
	ld e, $0
	xor a
	call Func_8013d_21
	jp Func_86c00

Func_86bfa: ; 86bfa (21:6bfa)
	ld hl, $15c
	call Func_80498_21
Func_86c00: ; 86c00 (21:6c00)
	ret

Data_86c01:
	dr $86c01, $86c7a

Data_86c7a: ; 86c7a
	dr $86c7a, $86cf0

Data_86cf0: ; 86cf0
	dr $86cf0, $86cf4

Data_86cf4: ; 86cf4
	dr $86cf4, $86cf8

Data_86cf8: ; 86cf8
	dr $86cf8, $86d84

Data_86d84: ; 86d84
	dr $86d84, $86ffa

Func_86ffa:
	ld a, $2
	ld [$c789], a
	ld a, $4
	ld [$c7e2], a
	ld a, $4
	call Func_80c94_21
	call Func_870fa
	ld hl, Func_870fa
	call Func_80f11_21
	ld e, $b
	ld hl, Data_86c01
	call Func_8003a_21
	ld a, $5
	call Func_80d01_21
	ld e, $2d
	ld hl, Data_86d84
	call Func_80d24_21
	ld hl, $1
	call Func_8062e_21
	cp $1
	jp nz, Func_8703a
	ld e, $12
	ld hl, Data_86c7a
	call Func_80ce7_21
Func_8703a: ; 8703a (21:703a)
	ld e, $a
	ld hl, Data_86cf8
	call Func_800fb_21
	ld a, [$c790]
	or a
	jp z, Func_8706e
	ld a, [$c790]
	cp $7
	jp nc, Func_8706e
	ld de, Data_86cf0
	xor a
	call Func_80150_21
	ld de, Data_86cf4
	ld a, $1
	call Func_80150_21
	ld e, $0
	ld a, $8
	call Func_8013d_21
	ld e, $0
	ld a, $9
	call Func_8013d_21
Func_8706e: ; 8706e (21:706e)
	ld a, $3
	call Func_80ee6_21
	ld a, $1
	call Func_80cc6_21
	call Func_8001c_21
	ret

Data_8707c:
	dr $8707c, $87082

Data_87082: ; 87082
	dr $87082, $87088

Data_87088: ; 87088
	dr $87088, $870fa

Func_870fa: ; 870fa (21:70fa)
	ld hl, $1
	call Func_8062e_21
	or a
	jp nz, Func_87122
	xor a
Func_87105: ; 87105 (21:7105)
	cp $13
	jp nc, Func_8711f
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_87088
	add hl, de
	call Func_80d9b_21
	pop af
	inc a
	jp Func_87105

Func_8711f: ; 8711f (21:711f)
	call Func_80f02_21
Func_87122: ; 87122 (21:7122)
	ld a, [$c790]
	or a
	jp z, Func_87140
	ld a, [$c790]
	cp $7
	jp nc, Func_87140
	ld hl, Data_8707c
	call Func_80d9b_21
	ld hl, Data_87082
	call Func_80d9b_21
	call Func_80f02_21
Func_87140: ; 87140 (21:7140)
	ret

Func_87141:
	ld a, e
	or a
	jp nz, Func_87163
	ld a, $5
	call Func_8044b_21
	ld hl, $1d5
	call Func_80498_21
	ld hl, $f0
	call Func_8062e_21
	or a
	jp nz, Func_87163
	ld e, $1
	ld hl, $f0
	call Func_8061b_21
Func_87163: ; 87163 (21:7163)
	ret

Data_87164:
	dr $87164, $87185

Data_87185: ; 87185
	dr $87185, $8718a

Data_8718a: ; 8718a
	dr $8718a, $871d4

Data_871d4: ; 871d4
	dr $871d4, $871fe

Func_871fe:
	ld e, $3
	ld hl, Data_87164
	call Func_8003a_21
	ld a, $8
	call Func_80ee6_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_8723b
	ld a, $1
	ld [$c7da], a
	call Func_8001c_21
	ld hl, $2d
	call Func_804a9_21
	call Func_8737a
	ld hl, $f0
	call Func_8062e_21
	or a
	jp nz, Func_87238
	ld e, $1
	ld hl, $f0
	call Func_8061b_21
Func_87238: ; 87238 (21:7238)
	jp Func_87265

Func_8723b: ; 8723b (21:723b)
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_8718a
	call Func_80d24_21
	ld e, $1
	ld hl, Data_87185
	call Func_80ce7_21
	ld e, $3
	ld hl, Data_871d4
	call Func_800fb_21
	xor a
	ld [$c7da], a
	call Func_8001c_21
	ld hl, $2d5
	call Func_80f72_21
Func_87265: ; 87265 (21:7265)
	ret

Data_87266:
	dr $87266, $8728f

Func_8728f:
	push af
	ld a, e
	or a
	jp nz, Func_872e5
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $6c
	call Func_8062e_21
	or a
	jp nz, Func_872df
	ld hl, $256
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_872d6
	ld de, Data_872e7
	ld hl, Data_87266
	call Func_80dd3_21
	or a
	jp nz, Func_872c5
	jp Func_872e5

Func_872c5: ; 872c5 (21:72c5)
	ld e, $1
	ld hl, $6c
	call Func_8061b_21
	ld hl, $257
	call Func_80498_21
	jp Func_872dc

Func_872d6: ; 872d6 (21:72d6)
	ld hl, $257
	call Func_80498_21
Func_872dc: ; 872dc (21:72dc)
	jp Func_872e5

Func_872df: ; 872df (21:72df)
	ld hl, $257
	call Func_80498_21
Func_872e5: ; 872e5 (21:72e5)
	pop bc
	ret

Data_872e7:
	db "<HIRA>りょうし<KATA>$"

Data_872ee:
	dr $872ee, $87317

Func_87317:
	push af
	ld a, e
	or a
	jp nz, Func_8736d
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $6d
	call Func_8062e_21
	or a
	jp nz, Func_87367
	ld hl, $254
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_8735e
	ld de, Data_8736f
	ld hl, Data_872ee
	call Func_80dd3_21
	or a
	jp nz, Func_8734d
	jp Func_8736d

Func_8734d: ; 8734d (21:734d)
	ld e, $1
	ld hl, $6d
	call Func_8061b_21
	ld hl, $255
	call Func_80498_21
	jp Func_87364

Func_8735e: ; 8735e (21:735e)
	ld hl, $255
	call Func_80498_21
Func_87364: ; 87364 (21:7364)
	jp Func_8736d

Func_87367: ; 87367 (21:7367)
	ld hl, $25c
	call Func_80498_21
Func_8736d: ; 8736d (21:736d)
	pop bc
	ret

Data_8736f:
	db "<HIRA>りょうし<KATA>$"

Data_87376:
	dr $87376, $8737a

Func_8737a: ; 8737a (21:737a)
	ld c, $1
	ld de, Data_87376
	ld a, BANK(Data_87376)
	call Func_8063e_21
	call Func_8020c_21
	ret

Data_87388:
	dr $87388, $873a9

Data_873a9: ; 873a9
	dr $873a9, $873b3

Data_873b3: ; 873b3
	dr $873b3, $87423

Data_87423: ; 87423
	dr $87423, $8744d

Func_8744d:
	ld e, $3
	ld hl, Data_87388
	call Func_8003a_21
	ld e, $2
	ld hl, Data_873a9
	call Func_80ce7_21
	ld a, $3
	call Func_80d01_21
	ld e, $8
	ld hl, Data_873b3
	call Func_80d24_21
	ld e, $3
	ld hl, Data_87423
	call Func_800fb_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_87484
	ld a, $1
	ld [$c7da], a
	jp Func_87488

Func_87484: ; 87484 (21:7484)
	xor a
	ld [$c7da], a
Func_87488: ; 87488 (21:7488)
	ld a, $8
	call Func_80ee6_21
	call Func_8001c_21
	ld hl, $2d6
	call Func_80f72_21
	ret

Func_87497:
	ld a, e
	or a
	jp nz, Func_874c2
	call Func_802e0_21
	xor a
	call Func_80ee6_21
	ld a, $16
	call Func_80ee6_21
	ld c, $1
	ld e, $2
	ld a, $8
	call Func_80176_21
	call Func_801d5_21
	call Func_8018b_21
	ld hl, $322
	call Func_80498_21
	ld a, $8
	call Func_80ee6_21
Func_874c2: ; 874c2 (21:74c2)
	ret

Data_874c3:
	dr $874c3, $874ec

Func_874ec:
	push af
	ld a, e
	or a
	jp nz, Func_87542
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $6e
	call Func_8062e_21
	or a
	jp nz, Func_8753c
	ld hl, $25a
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_87533
	ld de, Data_87544
	ld hl, Data_874c3
	call Func_80dd3_21
	or a
	jp nz, Func_87522
	jp Func_87542

Func_87522: ; 87522 (21:7522)
	ld e, $1
	ld hl, $6e
	call Func_8061b_21
	ld hl, $25b
	call Func_80498_21
	jp Func_87539

Func_87533: ; 87533 (21:7533)
	ld hl, $25b
	call Func_80498_21
Func_87539: ; 87539 (21:7539)
	jp Func_87542

Func_8753c: ; 8753c (21:753c)
	ld hl, $25c
	call Func_80498_21
Func_87542: ; 87542 (21:7542)
	pop bc
	ret

Data_87544:
	db "<HIRA>りょうし<KATA>$"

Data_8754b:
	dr $8754b, $87574

Func_87574
	push af
	ld a, e
	or a
	jp nz, Func_8763c
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $6f
	call Func_8062e_21
	or a
	jp nz, Func_87602
	ld hl, $252
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_875f9
	ld de, Data_8763e
	ld hl, Data_8754b
	call Func_80dd3_21
	or a
	jp nz, Func_875aa
	jp Func_8763c

Func_875aa: ; 875aa (21:75aa)
	ld e, $1
	ld hl, $6f
	call Func_8061b_21
	ld hl, $109
	call Func_8062e_21
	or a
	jp nz, Func_875f0
	ld a, [$c79c]
	cp $1
	jp c, Func_875f0
	ld hl, $114
	call Func_8062e_21
	or a
	jp nz, Func_875f0
	ld hl, $49d
	call Func_80498_21
	ld a, $2a
	call Func_80efe_21
	ld hl, $49e
	call Func_80498_21
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_21
	ld e, $1
	ld hl, $109
	call Func_8061b_21
Func_875f0: ; 875f0 (21:75f0)
	ld hl, $253
	call Func_80498_21
	jp Func_875ff

Func_875f9: ; 875f9 (21:75f9)
	ld hl, $250
	call Func_80498_21
Func_875ff: ; 875ff (21:75ff)
	jp Func_8763c

Func_87602: ; 87602 (21:7602)
	ld hl, $109
	call Func_8062e_21
	or a
	jp nz, Func_87636
	ld a, [$c79c]
	cp $1
	jp c, Func_87636
	ld hl, $49d
	call Func_80498_21
	ld a, $2a
	call Func_80efe_21
	ld hl, $49e
	call Func_80498_21
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_21
	ld e, $1
	ld hl, $109
	call Func_8061b_21
Func_87636: ; 87636 (21:7636)
	ld hl, $257
	call Func_80498_21
Func_8763c: ; 8763c (21:763c)
	pop bc
	ret

Data_8763e:
	db "<HIRA>かいてーしﾞん<KATA>$"

Func_87648: ; 87648 (21:7648)
	ld e, $0
	ld hl, $18
	call Func_8061b_21
	ld e, $0
	ld hl, $19
	call Func_8061b_21
	ld e, $0
	ld hl, $1a
	call Func_8061b_21
	ld e, $0
	ld hl, $4b
	call Func_8061b_21
	ret

Data_87669:
	dr $87669, $87695

Data_87695: ; 87695
	dr $87695, $876c1

Data_876c1: ; 876c1
	dr $876c1, $87731

Data_87731: ; 87731
	dr $87731, $87769

Data_87769: ; 87769
	dr $87769, $87785

Data_87785: ; 87785
	dr $87785, $877cb

Func_877cb:
	ld hl, $51
	call Func_8062e_21
	or a
	jp nz, Func_877f5
	ld hl, $4c
	call Func_8062e_21
	or a
	jp nz, Func_877f5
	call Func_87648
	ld e, $4
	ld hl, Data_87669
	call Func_8003a_21
	ld e, $4
	ld hl, Data_87731
	call Func_800fb_21
	jp Func_87828

Func_877f5: ; 877f5 (21:77f5)
	ld hl, $51
	call Func_8062e_21
	cp $1
	jp nz, Func_87820
	ld hl, $4c
	call Func_8062e_21
	or a
	jp nz, Func_87820
	call Func_87648
	ld e, $4
	ld hl, Data_87669
	call Func_8003a_21
	ld e, $2
	ld hl, Data_87769
	call Func_800fb_21
	jp Func_87828

Func_87820: ; 87820 (21:7820)
	ld e, $4
	ld hl, Data_87695
	call Func_8003a_21
Func_87828: ; 87828 (21:7828)
	ld a, $3
	call Func_80d01_21
	ld e, $8
	ld hl, Data_876c1
	call Func_80d24_21
	ld e, $5
	ld hl, Data_87785
	call Func_800fb_21
	ld a, $8
	call Func_80ee6_21
	ld a, $4
	ld [$c7e2], a
	ld a, [$c78a]
	cp $3
	jp nz, Func_8786b
	ld hl, $fb
	call Func_8062e_21
	or a
	jp nz, Func_8785f
	call Func_87b87
	jp Func_87868

Func_8785f: ; 8785f (21:785f)
	call Func_8001c_21
	ld hl, $2d7
	call Func_80f72_21
Func_87868: ; 87868 (21:7868)
	jp Func_8788a

Func_8786b: ; 8786b (21:786b)
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_8787d
	ld a, $1
	ld [$c7da], a
	jp Func_87881

Func_8787d: ; 8787d (21:787d)
	xor a
	ld [$c7da], a
Func_87881: ; 87881 (21:7881)
	call Func_8001c_21
	ld hl, $2d7
	call Func_80f72_21
Func_8788a: ; 8788a (21:788a)
	ret

Func_8788b:
	push af
	ld a, e
	cp $3
	jp z, Func_878aa
	cp $1
	jp nz, Func_878ef
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_878a7
	ld a, $1
	ld [wMapMusic + 6], a
Func_878a7: ; 878a7 (21:78a7)
	jp Func_878ef

Func_878aa: ; 878aa (21:78aa)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_878ef
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $18
	call Func_8061b_21
	ld hl, $19
	call Func_8062e_21
	cp $1
	jp nz, Func_878ef
	ld hl, $1a
	call Func_8062e_21
	cp $1
	jp nz, Func_878ef
	ld hl, $4b
	call Func_8062e_21
	cp $1
	jp nz, Func_878ef
	call Func_87c03
Func_878ef: ; 878ef (21:78ef)
	pop bc
	ret

Func_878f1:
	push af
	ld a, e
	cp $3
	jp z, Func_87910
	cp $1
	jp nz, Func_87955
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_8790d
	ld a, $1
	ld [wMapMusic + 6], a
Func_8790d: ; 8790d (21:790d)
	jp Func_87955

Func_87910: ; 87910 (21:7910)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_87955
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $19
	call Func_8061b_21
	ld hl, $18
	call Func_8062e_21
	cp $1
	jp nz, Func_87955
	ld hl, $1a
	call Func_8062e_21
	cp $1
	jp nz, Func_87955
	ld hl, $4b
	call Func_8062e_21
	cp $1
	jp nz, Func_87955
	call Func_87c03
Func_87955: ; 87955 (21:7955)
	pop bc
	ret

Func_87957:
	push af
	ld a, e
	cp $3
	jp z, Func_87976
	cp $1
	jp nz, Func_879bb
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_87973
	ld a, $1
	ld [wMapMusic + 6], a
Func_87973: ; 87973 (21:7973)
	jp Func_879bb

Func_87976: ; 87976 (21:7976)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_879bb
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $1a
	call Func_8061b_21
	ld hl, $18
	call Func_8062e_21
	cp $1
	jp nz, Func_879bb
	ld hl, $19
	call Func_8062e_21
	cp $1
	jp nz, Func_879bb
	ld hl, $4b
	call Func_8062e_21
	cp $1
	jp nz, Func_879bb
	call Func_87c03
Func_879bb: ; 879bb (21:79bb)
	pop bc
	ret

Func_879bd:
	push af
	ld a, e
	cp $3
	jp z, Func_879dc
	cp $1
	jp nz, Func_87a21
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_879d9
	ld a, $1
	ld [wMapMusic + 6], a
Func_879d9: ; 879d9 (21:79d9)
	jp Func_87a21

Func_879dc: ; 879dc (21:79dc)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_87a21
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $4b
	call Func_8061b_21
	ld hl, $18
	call Func_8062e_21
	cp $1
	jp nz, Func_87a21
	ld hl, $19
	call Func_8062e_21
	cp $1
	jp nz, Func_87a21
	ld hl, $1a
	call Func_8062e_21
	cp $1
	jp nz, Func_87a21
	call Func_87c03
Func_87a21: ; 87a21 (21:7a21)
	pop bc
	ret

Func_87a23:
	push af
	ld a, e
	cp $3
	jp z, Func_87a42
	cp $1
	jp nz, Func_87a71
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_87a3f
	ld a, $1
	ld [wMapMusic + 6], a
Func_87a3f: ; 87a3f (21:7a3f)
	jp Func_87a71

Func_87a42: ; 87a42 (21:7a42)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_87a71
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $18
	call Func_8061b_21
	ld hl, $19
	call Func_8062e_21
	cp $1
	jp nz, Func_87a71
	call Func_87c03
Func_87a71: ; 87a71 (21:7a71)
	pop bc
	ret

Func_87a73:
	push af
	ld a, e
	cp $3
	jp z, Func_87a92
	cp $1
	jp nz, Func_87ac1
	ld hl, sp+$1
	ld a, [hl]
	call Func_80bde_21
	cp $1
	jp nz, Func_87a8f
	ld a, $1
	ld [wMapMusic + 6], a
Func_87a8f: ; 87a8f (21:7a8f)
	jp Func_87ac1

Func_87a92: ; 87a92 (21:7a92)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_87ac1
	ld a, $2b
	call Func_80efe_21
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $19
	call Func_8061b_21
	ld hl, $18
	call Func_8062e_21
	cp $1
	jp nz, Func_87ac1
	call Func_87c03
Func_87ac1: ; 87ac1 (21:7ac1)
	pop bc
	ret

Func_87ac3:
	ld a, e
	or a
	jp nz, Func_87b13
	ld a, [$c790]
	or a
	jp z, Func_87ae0
	ld a, [$c790]
	cp $7
	jp nc, Func_87ae0
	ld hl, $3dd
	call Func_80498_21
	jp Func_87b13

Func_87ae0: ; 87ae0 (21:7ae0)
	ld hl, $59
	call Func_8062e_21
	or a
	jp nz, Func_87b00
	ld e, $1
	ld hl, $59
	call Func_8061b_21
	ld a, $32
	call Func_80efe_21
	ld hl, $35b
	call Func_80498_21
	jp Func_87b13

Func_87b00: ; 87b00 (21:7b00)
	ld e, $0
	ld hl, $59
	call Func_8061b_21
	ld a, $28
	call Func_80efe_21
	ld hl, $35c
	call Func_80498_21
Func_87b13: ; 87b13 (21:7b13)
	ret

Func_87b14:
	ld a, e
	or a
	jp nz, Func_87b86
	ld a, [$c838]
	or a
	jp z, Func_87b23
	jp Func_87b86

Func_87b23: ; 87b23 (21:7b23)
	ld hl, $59
	call Func_8062e_21
	cp $1
	jp nz, Func_87b37
	ld hl, $283
	call Func_80498_21
	jp Func_87b86

Func_87b37: ; 87b37 (21:7b37)
	ld a, [$c790]
	or a
	jp z, Func_87b4f
	ld a, [$c790]
	cp $7
	jp nc, Func_87b4f
	ld hl, $283
	call Func_80498_21
	jp Func_87b86

Func_87b4f: ; 87b4f (21:7b4f)
	ld a, $4
	ld [$c78a], a
	xor a
	call Func_80653_21
	ld c, $1
	ld e, $1
	ld a, $9
	call Func_80176_21
	ld a, $5a
	call Func_80efe_21
	call Func_801d5_21
	call Func_8018b_21
	ld a, $2
	call Func_80677_21
	ld e, $0
	ld hl, $fa
	call Func_8061b_21
	ld l, $3
	push hl
	ld c, $3
	ld e, $3
	ld a, $20
	call Func_80dff_21
	pop bc
Func_87b86: ; 87b86 (21:7b86)
	ret

Func_87b87: ; 87b87 (21:7b87)
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_87b99
	ld a, $1
	ld [$c7da], a
	jp Func_87b9d

Func_87b99: ; 87b99 (21:7b99)
	xor a
	ld [$c7da], a
Func_87b9d: ; 87b9d (21:7b9d)
	xor a
	call Func_80653_21
	ld a, $2
	call Func_80677_21
	call Func_8001c_21
	ld hl, $2d7
	call Func_80f72_21
	ld c, $1
	ld e, $2
	ld a, $9
	call Func_80176_21
	ld a, $37
	call Func_80efe_21
	call Func_801d5_21
	ld a, $1
	call Func_80653_21
	ld hl, $1
	call Func_8068f_21
	call Func_8018b_21
	ld e, $1
	ld hl, $fb
	call Func_8061b_21
	ret

Data_87bd7:
	dr $87bd7, $87c03

Func_87c03: ; 87c03 (21:7c03)
	ld e, $1
	ld hl, $4c
	call Func_8061b_21
	call Func_8002b_21
	ld e, $4
	ld hl, Data_87bd7
	call Func_8003a_21
	call Func_80ea2_21
	ld a, $64
	call Func_80efe_21
	ld hl, $3c
	call Func_8068f_21
	ld a, $64
	call Func_80efe_21
	ld hl, $3c
	call Func_8068f_21
	call Func_80eb1_21
	ret

Data_87c33:
	dr $87c33, $87c5c

Func_87c5c:
	push af
	ld a, e
	or a
	jp nz, Func_87cb2
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $70
	call Func_8062e_21
	or a
	jp nz, Func_87cac
	ld hl, $24e
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_87ca3
	ld de, Data_87cb4
	ld hl, Data_87c33
	call Func_80dd3_21
	or a
	jp nz, Func_87c92
	jp Func_87cb2

Func_87c92: ; 87c92 (21:7c92)
	ld e, $1
	ld hl, $70
	call Func_8061b_21
	ld hl, $24f
	call Func_80498_21
	jp Func_87ca9

Func_87ca3: ; 87ca3 (21:7ca3)
	ld hl, $253
	call Func_80498_21
Func_87ca9: ; 87ca9 (21:7ca9)
	jp Func_87cb2

Func_87cac: ; 87cac (21:7cac)
	ld hl, $24e
	call Func_80498_21
Func_87cb2: ; 87cb2 (21:7cb2)
	pop bc
	ret

Data_87cb4:
	db "<HIRA>おんなのこ<KATA>$"

Data_87cbc:
	dr $87cbc, $87ce5

Func_87ce5:
	push af
	ld a, e
	or a
	jp nz, Func_87d3b
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $71
	call Func_8062e_21
	or a
	jp nz, Func_87d35
	ld hl, $258
	call Func_80498_21
	ld hl, $32c
	call Func_804ba_21
	or a
	jp nz, Func_87d2c
	ld de, Data_87d3d
	ld hl, Data_87cbc
	call Func_80dd3_21
	or a
	jp nz, Func_87d1b
	jp Func_87d3b

Func_87d1b: ; 87d1b (21:7d1b)
	ld e, $1
	ld hl, $71
	call Func_8061b_21
	ld hl, $259
	call Func_80498_21
	jp Func_87d32

Func_87d2c: ; 87d2c (21:7d2c)
	ld hl, $258
	call Func_80498_21
Func_87d32: ; 87d32 (21:7d32)
	jp Func_87d3b

Func_87d35: ; 87d35 (21:7d35)
	ld hl, $258
	call Func_80498_21
Func_87d3b: ; 87d3b (21:7d3b)
	pop bc
	ret

Data_87d3d:
	db "<HIRA>しﾞいさん<KATA>$"

Data_87d45:
	dr $87d45, $87d50

Data_87d50: ; 87d50
	dr $87d50, $87d7a

Data_87d7a: ; 87d7a
	dr $87d7a, $87d88

Func_87d88:
	ld e, $1
	ld hl, Data_87d45
	call Func_8003a_21
	ld a, $3
	call Func_80d01_21
	ld e, $3
	ld hl, Data_87d50
	call Func_80d24_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_87daf
	ld a, $1
	ld [$c7da], a
	jp Func_87db3

Func_87daf: ; 87daf (21:7daf)
	xor a
	ld [$c7da], a
Func_87db3: ; 87db3 (21:7db3)
	ld e, $1
	ld hl, Data_87d7a
	call Func_800fb_21
	ld a, $8
	call Func_80ee6_21
	call Func_8001c_21
	ld hl, $2d8
	call Func_80f72_21
	ret

Func_87dca:
	push af
	ld a, e
	or a
	jp nz, Func_87e32
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
	ld hl, $51
	call Func_8062e_21
	or a
	jp nz, Func_87e2c
	ld hl, $74
	call Func_804a9_21
	ld a, $b
	call Func_80e5d_21
	cp $1
	jp nz, Func_87e23
	ld hl, $75
	call Func_804a9_21
	ld hl, $76
	call Func_804ca_21
	or a
	jp nz, Func_87e1a
	ld c, $1
	ld e, $1
	ld a, $b
	call Func_80d4d_21
	ld e, $1
	ld hl, $51
	call Func_8061b_21
	ld hl, $78
	call Func_804a9_21
	jp Func_87e20

Func_87e1a: ; 87e1a (21:7e1a)
	ld hl, $77
	call Func_804a9_21
Func_87e20: ; 87e20 (21:7e20)
	jp Func_87e29

Func_87e23: ; 87e23 (21:7e23)
	ld hl, $75
	call Func_804a9_21
Func_87e29: ; 87e29 (21:7e29)
	jp Func_87e32

Func_87e2c: ; 87e2c (21:7e2c)
	ld hl, $79
	call Func_804a9_21
Func_87e32: ; 87e32 (21:7e32)
	pop bc
	ret

Data_87e34:
	dr $87e34, $87e4a

Data_87e4a: ; 87e4a
	dr $87e4a, $87e94

Data_87e94: ; 87e94
	dr $87e94, $87ea2

Func_87ea2:
	ld e, $2
	ld hl, Data_87e34
	call Func_8003a_21
	ld a, $3
	call Func_80d01_21
	ld e, $5
	ld hl, Data_87e4a
	call Func_80d24_21
	ld hl, $0
	call Func_8062e_21
	or a
	jp nz, Func_87ec9
	ld a, $1
	ld [$c7da], a
	jp Func_87ecd

Func_87ec9: ; 87ec9 (21:7ec9)
	xor a
	ld [$c7da], a
Func_87ecd: ; 87ecd (21:7ecd)
	ld e, $1
	ld hl, Data_87e94
	call Func_800fb_21
	ld a, $8
	call Func_80ee6_21
	call Func_8001c_21
	ld hl, $2d8
	call Func_80f72_21
	ret

SECTION "Bank 22", ROMX, BANK [$22]
	lib_bank_20 22

Data_890b4:
	dr $890b4, $89161

Func_89161:
	dr $89161, $8966d

Func_8966d: ; 8966d
	dr $8966d, $89a75

Func_89a75: ; 89a75
	dr $89a75, $89c58

Func_89c58: ; 89c58
	dr $89c58, $89eaf

Func_89eaf: ; 89eaf
	dr $89eaf, $8a1f3

Func_8a1f3: ; 8a1f3
	dr $8a1f3, $8a69b

Func_8a69b: ; 8a69b
	dr $8a69b, $8aa33

Func_8aa33: ; 8aa33
	dr $8aa33, $8af07

Func_8af07: ; 8af07
	dr $8af07, $8afc4

Func_8afc4: ; 8afc4
	dr $8afc4, $8b49c

Func_8b49c: ; 8b49c
	dr $8b49c, $8b65a

Func_8b65a: ; 8b65a
	dr $8b65a, $8b7c9

SECTION "Bank 23", ROMX, BANK [$23]
	lib_bank_20 23

Data_8d0b4:
	dr $8d0b4, $8d256

Func_8d256: ; 8d256
	dr $8d256, $8d4d8

Func_8d4d8:: ; 8d4d8
	dr $8d4d8, $8deaa

Func_8deaa: ; 8deaa
	dr $8deaa, $8e5dc

Func_8e5dc: ; 8e5dc
	dr $8e5dc, $8e8cd

SECTION "Bank 24", ROMX, BANK [$24]
	lib_bank_20 24

Data_910b4:
	dr $910b4, $91189

Func_91189: ; 91189
	dr $91189, $91856

Func_91856: ; 91856
	dr $91856, $920c3

Func_920c3: ; 920c3
	dr $920c3, $92965

Func_92965: ; 92965
	dr $92965, $92aab

Func_92aab: ; 92aab
	dr $92aab, $92c92

Func_92c92: ; 92c92
	dr $92c92, $92e02

Func_92e02: ; 92e02
	dr $92e02, $932bd

Func_932bd:: ; 932bd
	dr $932bd, $93370

Func_93370:: ; 93370
	dr $93370, $933c1

Func_933c1::
	dr $933c1, $935a8

Func_935a8:: ; 935a8
	dr $935a8, $93792

Func_93792:: ; 93792
	dr $93792, $93883

Func_93883:: ; 93883
	dr $93883, $93941

Func_93941:: ; 93941
	dr $93941, $93b87

Func_93b87:: ; 93b87
	dr $93b87, $93c0c

Func_93c0c:: ; 93c0c
	dr $93c0c, $93d34

SECTION "Bank 25", ROMX, BANK [$25]
	lib_bank_20 25

Data_950b4:
	dr $950b4, $951a3

Func_951a3: ; 951a3
	dr $951a3, $957b0

Func_957b0: ; 957b0
	dr $957b0, $95817

Func_95817: ; 95817
	dr $95817, $958c2

Func_958c2: ; 958c2
	dr $958c2, $95c14

Func_95c14:: ; 95c14
	dr $95c14, $95c79

Func_95c79:: ; 95c79
	dr $95c79, $96dbb

Func_96dbb: ; 96dbb
	dr $96dbb, $96e97

Func_96e97: ; 96e97
	dr $96e97, $971d6

Func_971d6: ; 971d6
	dr $971d6, $97486

Func_97486: ; 97486
	dr $97486, $974a7

SECTION "Bank 26", ROMX, BANK [$26]
	lib_bank_20 26

Data_990b4:
	dr $990b4, $9a168

Func_9a168: ; 9a168
	dr $9a168, $9a169

Func_9a169: ; 9a169
	dr $9a169, $9a16a

Func_9a16a: ; 9a16a
	dr $9a16a, $9a16b

Func_9a16b: ; 9a16b
	dr $9a16b, $9a16c

Func_9a16c: ; 9a16c
	dr $9a16c, $9a16d

Func_9a16d: ; 9a16d
	dr $9a16d, $9a16e

Func_9a16e: ; 9a16e
	dr $9a16e, $9a16f

Func_9a16f: ; 9a16f
	dr $9a16f, $9a170

Func_9a170: ; 9a170
	dr $9a170, $9a171

Func_9a171: ; 9a171
	dr $9a171, $9a172

Func_9a172: ; 9a172
	dr $9a172, $9a173

Func_9a173: ; 9a173
	dr $9a173, $9a1bb

Func_9a1bb: ; 9a1bb
	dr $9a1bb, $9a28c

Func_9a28c: ; 9a28c
	dr $9a28c, $9a39e

Func_9a39e: ; 9a39e
	dr $9a39e, $9a41d

Func_9a41d:: ; 9a41d
	dr $9a41d, $9a6aa

Func_9a6aa::
	dr $9a6aa, $9a84a

Func_9a84a::
	dr $9a84a, $9a87c

Func_9a87c: ; 9a87c
	dr $9a87c, $9a897

Func_9a897: ; 9a897
	dr $9a897, $9a8c3

Func_9a8c3:: ; 9a8c3
	dr $9a8c3, $9ace0

Func_9ace0: ; 9ace0
	dr $9ace0, $9b251

Func_9b251:: ; 9b251
	dr $9b251, $9b262

Func_9b262: ; 9b262
	dr $9b262, $9b326

Func_9b326:: ; 9b326
	dr $9b326, $9b74a

SECTION "Bank 27", ROMX, BANK [$27]
	lib_bank_20 27

Data_9d0b4
	dr $9d0b4, $9d1cb

Func_9d1cb: ; 9d1cb
	dr $9d1cb, $9dcf6

Func_9dcf6: ; 9dcf6
	dr $9dcf6, $9e052

Func_9e052: ; 9e052
	dr $9e052, $9e0f9

Func_9e0f9: ; 9e0f9
	dr $9e0f9, $9e194

Func_9e194: ; 9e194
	dr $9e194, $9e23a

Func_9e23a: ; 9e23a
	dr $9e23a, $9e2cf

Func_9e2cf: ; 9e2cf
	dr $9e2cf, $9e4d8

Func_9e4d8: ; 9e4d8
	dr $9e4d8, $9e95e

Func_9e95e: ; 9e95e
	dr $9e95e, $9ea24

Func_9ea24: ; 9ea24
	dr $9ea24, $9eec4

Func_9eec4: ; 9eec4
	dr $9eec4, $9ef0f

Func_9ef0f: ; 9ef0f
	dr $9ef0f, $9ef10

Func_9ef10: ; 9ef10
	dr $9ef10, $9ef8d

Func_9ef8d: ; 9ef8d
	dr $9ef8d, $9f137

Func_9f137: ; 9f137
	dr $9f137, $9f1c9

Func_9f1c9: ; 9f1c9
	dr $9f1c9, $9f338

Func_9f338: ; 9f338
	dr $9f338, $9f43f

Func_9f43f: ; 9f43f
	dr $9f43f, $9f5a0

Func_9f5a0: ; 9f5a0
	dr $9f5a0, $9f5e1

Func_9f5e1: ; 9f5e1
	dr $9f5e1, $9f672

SECTION "Bank 28", ROMX, BANK [$28]
	lib_bank_20 28

Data_a10b4:
	dr $a10b4, $a11de

Func_a11de: ; a11de
	dr $a11de, $a167b

Func_a167b: ; a167b
	dr $a167b, $a1e57

Func_a1e57: ; a1e57
	dr $a1e57, $a2271

Func_a2271: ; a2271
	dr $a2271, $a268b

Func_a268b: ; a268b
	dr $a268b, $a2aa5

Func_a2aa5: ; a2aa5
IF DEF(SUN)
	dr $a2aa5, $a2ebf

Func_a2ebf: ; a2ebf
	dr $a2ebf, $a30cd

Func_a30cd: ; a30cd
	dr $a30cd, $a32cf

Func_a32cf: ; a32cf
	dr $a32cf, $a34d1

Func_a34d1: ; a34d1
	dr $a34d1, $a36ec

Func_a36ec: ; a36ec
	dr $a36ec, $a3788

Func_a3788: ; a3788
	dr $a3788, $a3789

Func_a3789: ; a3789
	dr $a3789, $a378a

Func_a378a: ; a378a
	dr $a378a, $a388c

Func_a388c: ; a388c
	dr $a388c, $a3b2f

Func_a3b2f: ; a3b2f
	dr $a3b2f, $a3bc8

Func_a3bc8: ; a3bc8
	dr $a3bc8, $a3c17

Func_a3c17:: ; a3c17
	dr $a3c17, $a3dc4

Func_a3dc4: ; a3dc4
	dr $a3dc4, $a3f5e
ENDC
IF DEF(STAR)
	dr $a2aa5, $a2f05

Func_a2ebf: ; a2f05
	dr $a2f05, $a3113

Func_a30cd: ; a3113
	dr $a3113, $a3315

Func_a32cf: ; a3315
	dr $a3315, $a3517

Func_a34d1: ; a3517
	dr $a3517, $a3732

Func_a36ec: ; a3732
	dr $a3732, $a37ce

Func_a3788: ; a37ce
	dr $a37ce, $a37cf

Func_a3789: ; a37cf
	dr $a37cf, $a37d0

Func_a378a: ; a37d0
	dr $a37d0, $a38d2

Func_a388c: ; a38d2
	dr $a38d2, $a3b75

Func_a3b2f: ; a3b75
	dr $a3b75, $a3c0e

Func_a3bc8: ; a3c0e
	dr $a3c0e, $a3c5d

Func_a3c17:: ; a3c17
	dr $a3c5d, $a3e0a

Func_a3dc4: ; a3e0a
	dr $a3e0a, $a3fa4
ENDC

SECTION "Bank 29", ROMX, BANK [$29]
	lib_bank_20 29

Data_a50b4:
	dr $a50b4, $a5126

Func_a5126: ; a5126
	dr $a5126, $a517c

Func_a517c:: ; a517c
	dr $a517c, $a544c

Func_a544c: ; a544c
	dr $a544c, $a6882

Func_a6882: ; a6882
	dr $a6882, $a6add

SECTION "Bank 2a", ROMX, BANK [$2a]
	lib_bank_20 2a

Data_a90b4:
	dr $a90b4, $a922b

Func_a922b: ; a922b
	dr $a922b, $a973e

Func_a973e: ; a973e
	dr $a973e, $a97f3

Func_a97f3: ; a97f3
	dr $a97f3, $a98a2

Func_a98a2: ; a98a2
	dr $a98a2, $a9957

Func_a9957: ; a9957
	dr $a9957, $a9a0c

Func_a9a0c: ; a9a0c
	dr $a9a0c, $a9ac1

Func_a9ac1: ; a9ac1
	dr $a9ac1, $a9b7b

Func_a9b7b: ; a9b7b
	dr $a9b7b, $a9c3d

Func_a9c3d: ; a9c3d
	dr $a9c3d, $a9cfa

Func_a9cfa: ; a9cfa
	dr $a9cfa, $a9db4

Func_a9db4: ; a9db4
	dr $a9db4, $a9e71

Func_a9e71: ; a9e71
	dr $a9e71, $a9f2b

Func_a9f2b: ; a9f2b
	dr $a9f2b, $aa083

Func_aa083: ; aa083
	dr $aa083, $aa218

Func_aa218: ; aa218
	dr $aa218, $aa5cb

Func_aa5cb: ; aa5cb
	dr $aa5cb, $aac19

Func_aac19: ; aac19
	dr $aac19, $aaed3

Func_aaed3: ; aaed3
	dr $aaed3, $ab199

Func_ab199: ; ab199
	dr $ab199, $ab46b

Func_ab46b: ; ab46b
	dr $ab46b, $ab7cc

Func_ab7cc: ; ab7cc
	dr $ab7cc, $abb74

Func_abb74:: ; abb74
	dr $abb74, $abf90

Func_abf90: ; abf90
	dr $abf90, $abf9c

SECTION "Bank 2b", ROMX, BANK [$2b]
	lib_bank_20 2b

Data_ad0b4:
	dr $ad0b4, $ad122

Func_ad122: ; ad122
	dr $ad122, $ae48b

Func_ae48b: ; ae48b
	dr $ae48b, $ae6ea

Func_ae6ea: ; ae6ea
	dr $ae6ea, $ae8e7

Func_ae8e7: ; ae8e7
	dr $ae8e7, $ae97d

Func_ae97d: ; ae97d
	dr $ae97d, $aea1b

Func_aea1b: ; aea1b
	dr $aea1b, $aeae1

Func_aeae1: ; aeae1
	dr $aeae1, $aeb98

Func_aeb98: ; aeb98
	dr $aeb98, $aed4a

Func_aed4a: ; aed4a
	dr $aed4a, $aedf8

Func_aedf8: ; aedf8
	dr $aedf8, $af01b

Func_af01b: ; af01b
	dr $af01b, $af29a

Func_af29a: ; af29a
	dr $af29a, $af3e9

Func_af3e9: ; af3e9
	dr $af3e9, $af539

SECTION "Bank 2c", ROMX, BANK [$2c]
	lib_bank_20 2c

Data_b10b4:
	dr $b10b4, $b10ea

Func_b10ea: ; b10ea
	dr $b10ea, $b138f

Func_b138f: ; b138f
	dr $b138f, $b3fd0

SECTION "Bank 2d", ROMX, BANK [$2d]
	lib_bank_20 2d

Data_b50b4:
	dr $b50b4, $b5152

Func_b5152: ; b5152
	dr $b5152, $b5215

Func_b5215: ; b5215
	dr $b5215, $b52d3

Func_b52d3: ; b52d3
	dr $b52d3, $b5391

Func_b5391: ; b5391
	dr $b5391, $b5452

Func_b5452: ; b5452
	dr $b5452, $b568e

Func_b568e: ; b568e
	dr $b568e, $b576c

Func_b576c: ; b576c
	dr $b576c, $b584a

Func_b584a: ; b584a
	dr $b584a, $b5939

Func_b5939: ; b5939
	dr $b5939, $b5ae8

Func_b5ae8: ; b5ae8
	dr $b5ae8, $b5bbb

Func_b5bbb: ; b5bbb
	dr $b5bbb, $b5c99

Func_b5c99: ; b5c99
	dr $b5c99, $b5d6c

Func_b5d6c: ; b5d6c
	dr $b5d6c, $b5e4a

Func_b5e4a: ; b5e4a
	dr $b5e4a, $b5fbe

Func_b5fbe: ; b5fbe
	dr $b5fbe, $b790a

Func_b790a: ; b790a
	dr $b790a, $b79f8

Func_b79f8: ; b79f8
	dr $b79f8, $b7a64

Func_b7a64: ; b7a64
	dr $b7a64, $b7e47

SECTION "Bank 2e", ROMX, BANK [$2e]
	lib_bank_20 2e

Data_b90b4:
	dr $b90b4, $b93f1

Func_b93f1: ; b93f1
	dr $b93f1, $b9bbe

Func_b9bbe: ; b9bbe
	dr $b9bbe, $ba46c

Func_ba46c: ; ba46c
	dr $ba46c, $ba7e9

Func_ba7e9: ; ba7e9
	dr $ba7e9, $bb17a

Func_bb17a: ; bb17a
	dr $bb17a, $bb44e

Func_bb44e: ; bb44e
	dr $bb44e, $bb71a

SECTION "Bank 32", ROMX, BANK [$32]
	lib_bank_20 32

Data_c90b4:
	dr $c90b4, $c916d

Func_c916d: ; c916d
	dr $c916d, $c93a1

Func_c93a1: ; c93a1
	dr $c93a1, $c980d

Func_c980d: ; c980d
	dr $c980d, $c9d95

Func_c9d95: ; c9d95
	dr $c9d95, $ca379

Func_ca379: ; ca379
	dr $ca379, $ca8dd

Func_ca8dd: ; ca8dd
	dr $ca8dd, $cb099

Func_cb099: ; cb099
	dr $cb099, $cb2ef

Func_cb2ef: ; cb2ef
	dr $cb2ef, $cb4c5

Func_cb4c5: ; cb4c5
	dr $cb4c5, $cb6d3

Func_cb6d3: ; cb6d3
	dr $cb6d3, $cb8d6

Func_cb8d6: ; cb8d6
	dr $cb8d6, $cba6d

Func_cba6d: ; cba6d
	dr $cba6d, $cc000

SECTION "Bank 33", ROMX, BANK [$33]
	lib_bank_20 33

Data_cd0b4:
	dr $cd0b4, $cd533

Func_cd533: ; cd533
	dr $cd533, $cdabd

Func_cdabd: ; cdabd
	dr $cdabd, $cdfc4

Func_cdfc4: ; cdfc4
	dr $cdfc4, $ceacc

Func_ceacc: ; ceacc
	dr $ceacc, $cf14d

Func_cf14d: ; cf14d
	dr $cf14d, $d0000

SECTION "Bank 34", ROMX, BANK [$34]
	lib_bank_20 34

Data_d10b4:
	dr $d10b4, $d11ef

Func_d11ef: ; d11ef
	dr $d11ef, $d153f

Func_d153f: ; d153f
	dr $d153f, $d18ba

Func_d18ba:: ; d18ba
	dr $d18ba, $d1aff

Func_d1aff: ; d1aff
	dr $d1aff, $d1ec5

Func_d1ec5: ; d1ec5
	dr $d1ec5, $d21fc

Func_d21fc: ; d21fc
	dr $d21fc, $d259b

Func_d259b: ; d259b
	dr $d259b, $d293a

Func_d293a: ; d293a
	dr $d293a, $d2c2a

Func_d2c2a: ; d2c2a
	dr $d2c2a, $d2e9d

Func_d2e9d: ; d2e9d
	dr $d2e9d, $d3312

Func_d3312: ; d3312
	dr $d3312, $d367a

Func_d367a: ; d367a
	dr $d367a, $d392b

Func_d392b: ; d392b
	dr $d392b, $d3ceb

Func_d3ceb: ; d3ceb
	dr $d3ceb, $d4000

SECTION "Bank 36", ROMX, BANK [$36]
	dr $d8000, $d93e8

OverworldAttrMaps:: ; d93e8
	dr $d93e8, $d9f38

Func_d9f38:: ; d9f38
	dr $d9f38, $d9f55

Func_d9f55:: ; d9f55 (36:5f55)
	di
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ei
	ret

Func_d9f68:: ; d9f68
	dr $d9f68, $d9f74

Func_d9f74:: ; d9f74
	dr $d9f74, $da07a

Func_da07a:: ; da07a
	dr $da07a, $da093

Func_da093:: ; da093
	dr $da093, $da4dc


; void Func_da4dc (void) {
;   char * (hl = wOAMBuffer2)
;   while (hl < wOAMBuffer2End) {
;     *(hl++) = 0xff;
;     *(hl++) = 0xff;
;     *(hl++) = 0xff;
;     *(hl++) = 0xff;
;   }
; }
Func_da4dc:: ; da4dc (36:64dc)
	ld hl, wOAMBuffer2
.loop
	ld a, l
	sub wOAMBuffer2End % $100
	ld a, h
	sbc wOAMBuffer2End / $100
	jp nc, .done
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	jp .loop

.done
	ret

Func_da4fc:: ; da4fc
	dr $da4fc, $da729

Func_da729:: ; da729
	dr $da729, $da835

Func_da835:: ; da835
	dr $da835, $da839

Func_da839:: ; da839
	dr $da839, $da901

Func_da901:: ; da901
	dr $da901, $daa40

Func_daa40:: ; daa40
	dr $daa40, $daa72

EnterMap:: ; daa72 (36:6a72)
	push af
	push de
	set_farcall_addrs_hli Func_c7ae6
	pop de
	pop af
	call FarCall
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call FarCall
	ret

Func_daaac:
	ret

Pointers_daaad:
	dba Func_81281
	dba Func_81ac1
	dba Func_81d6a
	dba Func_8240c
	dba Func_825cc
	dba Func_827a9
	dba Func_82b03
	dba Func_82c44
	dba Func_82d7f
	dba Func_82e70
	dba Func_82f08
	dba Func_82fa8
	dba Func_83169
	dba Func_83213
	dba Func_83340
	dba Func_833ba
	dba Func_83431
	dba Func_834bd
	dba Func_83537
	dba Func_835ae
	dba Func_83632
	dba Func_836b1
	dba Func_83730
	dba Func_837aa
	dba Func_83816
	dba Func_838a2
	dba Func_957b0
	dba Func_95817
	dba Func_958c2
	dba Func_8d256
	dba Func_85178
	dba Func_85a1d
	dba Func_85cde
	dba Func_85f6c
	dba Func_863fb
	dba Func_8688a
	dba Func_86ffa
	dba Func_871fe
	dba Func_8744d
	dba Func_877cb
	dba Func_87d88
	dba Func_87ea2
	dba Func_8b65a
	dba Func_89161
	dba Func_8966d
	dba Func_89a75
	dba Func_89c58
	dba Func_89eaf
	dba Func_8a1f3
	dba Func_8a69b
	dba Func_8aa33
	dba Func_8af07
	dba Func_8afc4
	dba Func_8b49c
	dba Func_8e5dc
	dba Func_8deaa
	dba Func_91189
	dba Func_91856
	dba Func_920c3
	dba Func_92965
	dba Func_92aab
	dba Func_92c92
	dba Func_92e02
	dba Func_951a3
	dba Func_96dbb
	dba Func_96e97
	dba Func_971d6
	dba Func_97486
	dba Func_9a168
	dba Func_9a169
	dba Func_9a16a
	dba Func_9a16b
	dba Func_9a16c
	dba Func_9a16d
	dba Func_9a16e
	dba Func_9a16f
	dba Func_9a170
	dba Func_9a171
	dba Func_9a172
	dba Func_9a173
	dba Func_9d1cb
	dba Func_9dcf6
	dba Func_9e052
	dba Func_9e0f9
	dba Func_9e194
	dba Func_9e23a
	dba Func_9e2cf
	dba Func_9e4d8
	dba Func_9e95e
	dba Func_9ea24
	dba Func_9eec4
	dba Func_9ef0f
	dba Func_9ef10
	dba Func_9ef8d
	dba Func_9f137
	dba Func_9f1c9
	dba Func_9f338
	dba Func_9f43f
	dba Func_9f5a0
	dba Func_9f5e1
	dba Func_a30cd
	dba Func_a32cf
	dba Func_a34d1
	dba Func_a36ec
	dba Func_a3788
	dba Func_a3789
	dba Func_a378a
	dba Func_a388c
	dba Func_a3b2f
	dba Func_a3bc8
	dba Func_a3dc4
	dba Func_a11de
	dba Func_a167b
	dba Func_c916d
	dba Func_c93a1
	dba Func_c980d
	dba Func_c9d95
	dba Func_ca379
	dba Func_ca8dd
	dba Func_cb099
	dba Func_cb2ef
	dba Func_cb4c5
	dba Func_cb6d3
	dba Func_cb8d6
	dba Func_cba6d
	dba Func_a5126
	dba Func_a544c
	dba Func_a6882
	dba Func_a922b
	dba Func_a973e
	dba Func_a97f3
	dba Func_a98a2
	dba Func_a9957
	dba Func_a9a0c
	dba Func_a9ac1
	dba Func_a9b7b
	dba Func_a9c3d
	dba Func_a9cfa
	dba Func_a9db4
	dba Func_a9e71
	dba Func_a9f2b
	dba Func_aa083
	dba Func_aa218
	dba Func_aa5cb
	dba Func_aac19
	dba Func_aaed3
	dba Func_ab199
	dba Func_ab46b
	dba Func_ab7cc
	dba Func_abf90
	dba Func_ad122
	dba Func_ae48b
	dba Func_ae6ea
	dba Func_ae8e7
	dba Func_ae97d
	dba Func_aea1b
	dba Func_aeae1
	dba Func_aeb98
	dba Func_aed4a
	dba Func_aedf8
	dba Func_af01b
	dba Func_af29a
	dba Func_af3e9
	dba Func_b10ea
	dba Func_b138f
	dba Func_d11ef
	dba Func_d153f
	dba Func_d1aff
	dba Func_d1ec5
	dba Func_d21fc
	dba Func_d259b
	dba Func_d293a
	dba Func_a1e57
	dba Func_a2271
	dba Func_a268b
	dba Func_a2aa5
	dba Func_a2ebf
	dba Func_cd533
	dba Func_cdabd
	dba Func_cdfc4
	dba Func_ceacc
	dba Func_cf14d
	dba Func_b5152
	dba Func_b5215
	dba Func_b52d3
	dba Func_b5391
	dba Func_b5452
	dba Func_b568e
	dba Func_b576c
	dba Func_b584a
	dba Func_b5939
	dba Func_b5ae8
	dba Func_b5bbb
	dba Func_b5c99
	dba Func_b5d6c
	dba Func_b5e4a
	dba Func_b5fbe
	dba Func_b790a
	dba Func_b79f8
	dba Func_b7a64
	dba Func_b93f1
	dba Func_b9bbe
	dba Func_ba46c
	dba Func_ba7e9
	dba Func_bb17a
	dba Func_bb44e
	dba Func_d2c2a
	dba Func_d2e9d
	dba Func_d3312
	dba Func_d367a
	dba Func_d392b
	dba Func_d3ceb
