INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

INCLUDE "maps/block_data.asm"

SECTION "Bank 20", ROMX, BANK [$20]
	lib_bank_20 20

INCLUDE "maps/scripts/unknown_81281.asm"
INCLUDE "maps/scripts/unknown_81ac1.asm"
INCLUDE "maps/scripts/unknown_81d6a.asm"
INCLUDE "maps/scripts/unknown_8240c.asm"
INCLUDE "maps/scripts/unknown_825cc.asm"
INCLUDE "maps/scripts/unknown_82628.asm"
INCLUDE "maps/scripts/unknown_827a9.asm"
INCLUDE "maps/scripts/unknown_82b03.asm"
INCLUDE "maps/scripts/unknown_82c44.asm"
INCLUDE "maps/scripts/unknown_82d7f.asm"
INCLUDE "maps/scripts/unknown_82e70.asm"
INCLUDE "maps/scripts/unknown_82f08.asm"
INCLUDE "maps/scripts/unknown_82fa8.asm"
INCLUDE "maps/scripts/unknown_83026.asm"
INCLUDE "maps/scripts/unknown_83169.asm"
INCLUDE "maps/scripts/unknown_831c2.asm"

Data_831e4:
	dr $831e4, $83205

Data_83205: ; 83205
	dr $83205, $83213

Func_83213:
	call Func_8324c
	ld hl, Func_8324c
	call Func_80f11_20
	ld a, $9
	ld [wc7de], a
	loadwarps $3, Data_831e4
	loadpeople $1, Data_83205
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c4e
	ret

Data_83240:
	dr $83240, $83246

Data_83246: ; 83246
	dr $83246, $8324c

Func_8324c: ; 8324c (20:724c)
	ld a, [wc78c]
	cp $a
	jp nc, Func_8325a
	ld hl, Data_83240
	call Func_80d9b_20
Func_8325a: ; 8325a (20:725a)
	ld a, [wc78c]
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
	call FacePlayer_20
	writetext_yesorno TreeBitstreamText_4600d
	or a
	jp nz, Func_832d4
	writetext TreeBitstreamText_46031
	ld a, $1
	call NamingScreen_20
	checkevent $108
	or a
	jp nz, Func_832cb
	ld a, [wc79c]
	cp $1
	jp c, Func_832cb
	checkevent $114
	or a
	jp nz, Func_832cb
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	setevent $108
Func_832cb: ; 832cb (20:72cb)
	writetext TreeBitstreamText_4604f
	jp Func_83318

Func_832d4: ; 832d4 (20:72d4)
	writetext TreeBitstreamText_46040
	checkevent $108
	or a
	jp nz, Func_83318
	ld a, [wc79c]
	cp $1
	jp c, Func_83318
	checkevent $114
	or a
	jp nz, Func_83318
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	setevent $108
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
	ld [wc7de], a
	loadwarps $3, Data_8331a
	ld e, $1
	ld hl, Data_8333b
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	ld hl, Func_03d1
	call LandmarkSign_20
	ret

Data_8336d:
	dr $8336d, $83373

Data_83373: ; 83373
	dr $83373, $83379

Func_83379:
	ld a, [wc78c]
	cp $b
	jp nc, Func_83387
	ld hl, Data_8336d
	call Func_80d9b_20
Func_83387: ; 83387 (20:7387)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_83399
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c6a
	ret

Data_833df:
	dr $833df, $833e5

Data_833e5: ; 833e5
	dr $833e5, $833eb

Func_833eb:
	ld a, [wc78c]
	cp $c
	jp nc, Func_833f9
	ld hl, Data_833df
	call Func_80d9b_20
Func_833f9: ; 833f9 (20:73f9)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_8340b
	ld e, $1
	ld hl, Data_8342c
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	ld hl, Func_03d3
	call LandmarkSign_20
	ret

Data_8345e:
	dr $8345e, $83464

Data_83464: ; 83464
	dr $83464, $8346a

Func_8346a:
	ld a, [wc78c]
	cp $d
	jp nc, Func_83478
	ld hl, Data_8345e
	call Func_80d9b_20
Func_83478: ; 83478 (20:7478)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_8348a
	loadpeople $1, Data_834af
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c83
	ret

Data_834ea:
	dr $834ea, $834f0

Data_834f0: ; 834f0
	dr $834f0, $834f6

Func_834f6: ; 834f6 (20:74f6)
	ld a, [wc78c]
	cp $e
	jp nc, Func_83504
	ld hl, Data_834ea
	call Func_80d9b_20
Func_83504: ; 83504 (20:7504)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_83516
	playmusic SONG_SHOP
	call FadeInMap_20
	ld hl, GetSRAMBank
	call LandmarkSign_20
	ret

Data_8355c:
	dr $8355c, $83562

Data_83562: ; 83562
	dr $83562, $83568

Func_83568:
	ld a, [wc78c]
	cp $f
	jp nc, Func_83576
	ld hl, Data_8355c
	call Func_80d9b_20
Func_83576: ; 83576 (20:7576)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_83588
	ld e, $1
	ld hl, Data_835a9
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c9b
	ret

Data_835db:
	dr $835db, $835e1

Data_835e1: ; 835e1
	dr $835e1, $835e7

Func_835e7: ; 835e7 (20:75e7)
	ld a, [wc78c]
	cp $10
	jp nc, Func_835f5
	ld hl, Data_835db
	call Func_80d9b_20
Func_835f5: ; 835f5 (20:75f5)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_83607
	ld e, $2
	ld hl, Data_83628
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46ca8
	ret

Data_8365f:
	dr $8365f, $83665

Data_83665: ; 83665
	dr $83665, $8366b

Func_8366b:
	ld a, [wc78c]
	cp $11
	jp nc, Func_83679
	ld hl, Data_8365f
	call Func_80d9b_20
Func_83679: ; 83679 (20:7679)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_8368b
	ld e, $1
	ld hl, Data_836ac
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46cb3
	ret

Data_836de:
	dr $836de, $836e4

Data_836e4: ; 836e4
	dr $836e4, $836ea

Func_836ea: ; 836ea (20:76ea)
	ld a, [wc78c]
	cp $12
	jp nc, Func_836f8
	ld hl, Data_836de
	call Func_80d9b_20
Func_836f8: ; 836f8 (20:76f8)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_8370a
	ld e, $1
	ld hl, Data_8372b
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46cbf
	ret

Data_8375d:
	dr $8375d, $83763

Data_83763: ; 83763
	dr $83763, $83769

Func_83769: ; 83769 (20:7769)
	ld a, [wc78c]
	cp $13
	jp nc, Func_83777
	ld hl, Data_8375d
	call Func_80d9b_20
Func_83777: ; 83777 (20:7777)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $3, Data_83789
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46ccb
	ret

Data_837cf:
	dr $837cf, $837d5

Data_837d5: ; 837d5
	dr $837d5, $837db

Func_837db:
	ld a, [wc78c]
	cp $14
	jp nc, Func_837e9
	ld hl, Data_837cf
	call Func_80d9b_20
Func_837e9: ; 837e9 (20:77e9)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $2, Data_837fb
	ld e, $1
	ld hl, Data_83811
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46cd7
	ret

Data_83843:
	dr $83843, $83849

Data_83849: ; 83849
	dr $83849, $8384f

Func_8384f:
	ld a, [wc78c]
	cp $15
	jp nc, Func_8385d
	ld hl, Data_83843
	call Func_80d9b_20
Func_8385d: ; 8385d (20:785d)
	ld a, [wc78c]
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
	ld [wc7de], a
	loadwarps $2, Data_8386f
	ld e, $3
	ld hl, Data_83885
	call Func_80ce7_20
	loadpeople $1, Data_83894
	playmusic SONG_SHOP
	call Func_83e56
	ld [wc7a4], a
	ld a, [wc7a4]
	cp $1
	jp nz, Func_838e0
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
Func_838e0: ; 838e0 (20:78e0)
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c00
	ret

Data_838ea: ; 838ea
	dr $838ea, $838f0

Func_838f0: ; 838f0 (20:78f0)
	ld a, [wc78c]
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
	call FacePlayer_20
	checkevent $58
	or a
	jp nz, Func_83a5e
	writenpctext TreeBitstreamText_45c80
	setevent $58
	jp Func_83e48

Func_83a5e: ; 83a5e (20:7a5e)
	ld a, [wc79d]
	cp $1
	jp nz, Func_83b71
	ld a, [wc7a4]
	cp $ff
	jp nz, Func_83a7b
	writenpctext TreeBitstreamText_47e30
	xor a
	ld [wc79d], a
	jp Func_83b6e

Func_83a7b: ; 83a7b (20:7a7b)
	writenpctext TreeBitstreamText_45e29
	ld a, [wc78c]
	inc a
	ld [wc78c], a
	xor a
	ld [wc79d], a
	ld a, [wc78c]
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
	checkevent $110
	or a
	jp nz, Func_83adb
	playsfx $5c
	script_sleep $78
	writenpctext TreeBitstreamText_39c6c
	writenpctext TreeBitstreamText_39c82
	setevent $110
Func_83adb: ; 83adb (20:7adb)
	checkevent $106
	or a
	jp nz, Func_83af3
	landmarksign TreeBitstreamText_461a9
	setevent $106
Func_83af3: ; 83af3 (20:7af3)
	checkevent $105
	or a
	jp nz, Func_83b0b
	landmarksign TreeBitstreamText_461b4
	setevent $105
Func_83b0b: ; 83b0b (20:7b0b)
	checkevent $104
	or a
	jp nz, Func_83b23
	landmarksign TreeBitstreamText_46175
	setevent $104
Func_83b23: ; 83b23 (20:7b23)
	checkevent $103
	or a
	jp nz, Func_83b3b
	landmarksign TreeBitstreamText_4619b
	setevent $103
Func_83b3b: ; 83b3b (20:7b3b)
	checkevent $102
	or a
	jp nz, Func_83b53
	landmarksign TreeBitstreamText_4618f
	setevent $102
Func_83b53: ; 83b53 (20:7b53)
	checkevent $101
	or a
	jp nz, Func_83b6b
	landmarksign TreeBitstreamText_46183
	setevent $101
Func_83b6b: ; 83b6b (20:7b6b)
	jp Func_83b6e

Func_83b6e: ; 83b6e (20:7b6e)
	jp Func_83e48

Func_83b71: ; 83b71 (20:7b71)
	ld a, [wc78c]
	cp $14
	jp nz, Func_83b96
	checkevent $e7
	cp $1
	jp nz, Func_83b8d
	writenpctext TreeBitstreamText_45db0
	jp Func_83b93

Func_83b8d: ; 83b8d (20:7b8d)
	writenpctext TreeBitstreamText_45dff
Func_83b93: ; 83b93 (20:7b93)
	jp Func_83e48

Func_83b96: ; 83b96 (20:7b96)
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$f
	call PutLongFromStackToHL
	ld hl, sp+$7
	push hl
	ld hl, wc78c
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
	writenpctext_yesorno TreeBitstreamText_45cb9
	or a
	jp nz, Func_83e39
	ld a, $3
	call Random_20
	cp $2
	jp z, Func_83c48
	cp $1
	jp z, Func_83c1e
	or a
	jp nz, Func_83c6f
	writenpctext TreeBitstreamText_45d1c
	ld hl, sp+$b
	push hl
	ld hl, wc78c
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
	writenpctext TreeBitstreamText_45d3d
	ld hl, sp+$b
	push hl
	ld hl, wc78c
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
	writenpctext TreeBitstreamText_45d61
	ld hl, sp+$b
	push hl
	ld hl, wc78c
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
	ld [wc39a], a
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
	ld [wc39a], a
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
	writenpctext TreeBitstreamText_45d82
	ld a, [wMapX]
	cp $3
	jp nz, Func_83d45
	ld a, [wMapY]
	cp $1
	jp nz, Func_83d45
	ld bc, Data_83a17
	ld e, BANK(Data_83a17)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_80688_20
	playsfx $2e
	jp Func_83d57

Func_83d45: ; 83d45 (20:7d45)
	ld bc, Data_83a13
	ld e, BANK(Data_83a13)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call Func_80688_20
	playsfx $2e
Func_83d57: ; 83d57 (20:7d57)
	ld e, $0
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call SetPersonVisibilityState_20
	playsfx $2e
	push hl
	push hl
	ld hl, sp+$f
	call PutLongFromHLOnStack
	call NegateLongOnStack
	call AdjustMoney
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
	ld hl, wc78c
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
	set_farcall_addrs_hli FixDays
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
	ld [wc79d], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wc79e], a
	ld hl, sp+$3
	ld a, [hl]
	ld [wc79f], a
	ld hl, sp+$4
	ld a, [hl]
	ld [wc7a0], a
	ld hl, sp+$5
	ld a, [hl]
	ld [wc7a1], a
	ld hl, sp+$6
	ld a, [hl]
	ld [wc7a2], a
	set_farcall_addrs_hli Func_93941
	ld a, $4
	call FarCall
	jp Func_83e3f

Func_83e39: ; 83e39 (20:7e39)
	writenpctext TreeBitstreamText_45cff
Func_83e3f: ; 83e3f (20:7e3f)
	jp Func_83e48

Func_83e42: ; 83e42 (20:7e42)
	writenpctext TreeBitstreamText_45cd8
Func_83e48: ; 83e48 (20:7e48)
	ld hl, $130
	add hl, sp
	ld sp, hl
	ret

Data_83e4e:
	db "G(とられた)", $0

Func_83e56: ; 83e56 (20:7e56)
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld a, [wc79d]
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
	ld hl, wc7a1
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld a, [wc7a2]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld a, [wc7a0]
	ld c, a
	ld a, [wc79f]
	ld e, a
	ld a, [wc79e]
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
	setevent $38
	jp Func_851bc

Func_851b4: ; 851b4 (21:51b4)
	resetevent $38
Func_851bc: ; 851bc (21:51bc)
	loadwarps $6, Data_850b4
	ld a, $1
	call LoadPlayerSprite_21
	ld a, $2
	ld [wc7e2], a
	checkevent $32
	or a
	jp nz, Func_851fe
	loadpeople $5, Data_850fa
	loadpeople $4, Data_85140
	playmusic SONG_TOWN1
	call FadeInMap_21
	call Func_852ac
	setevent $32
	jp Func_85270

Func_851fe: ; 851fe (21:51fe)
	checkevent $5
	or a
	jp z, Func_85212
	checkevent $6
	or a
	jp nz, Func_85260
Func_85212: ; 85212 (21:5212)
	loadpeople $5, Data_850fa
	playmusic SONG_TOWN1
	hideperson $2
	checkevent $5
	cp $1
	jp nz, Func_8523a
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	jp Func_85242

Func_8523a: ; 8523a (21:523a)
	ld c, $a
	ld e, $1f
	xor a
	call Func_80080_21
Func_85242: ; 85242 (21:5242)
	checkevent $6
	cp $1
	jp nz, Func_85257
	hideperson $1
	jp Func_85260

Func_85257: ; 85257 (21:5257)
	ld c, $a
	ld e, $20
	ld a, $1
	call Func_80080_21
Func_85260: ; 85260 (21:5260)
	playmusic SONG_TOWN1
	loadpeople $4, Data_85140
	call FadeInMap_21
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
	script_sleep $3c
	loademote $1, $1, $5
	ld e, $f
	ld a, $17
	call MoveEmote_21
	playsfx $28
	call WaitEmote_21
	script_sleep $3c
	call HideEmote_21
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld bc, Data_85274
	ld e, BANK(Data_85274)
	xor a
	call MovePerson_21
	ld bc, Data_85278
	ld e, BANK(Data_85278)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	script_sleep $3c
	writenpctext TreeBitstreamText_399f1
	writenpctext TreeBitstreamText_39a27
	writenpctext TreeBitstreamText_39a42
	writenpctext TreeBitstreamText_39a5f
	playmusic SONG_NONE
	writenpctext TreeBitstreamText_39a7b
	playmusic SONG_ENCOUNTER_BEAUTY
	ld e, $0
	xor a
	call SpriteFace_21
	sprite_face $0, $1
	ld bc, Data_8527c
	ld e, BANK(Data_8527c)
	ld a, $2
	call Func_80688_21
	call WaitNPCStep_21
	playsfx $33
	ld bc, Data_85286
	ld e, BANK(Data_85286)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	ld e, $1
	xor a
	call SpriteFace_21
	sprite_face $3, $1
	ld bc, Data_8528a
	ld e, BANK(Data_8528a)
	ld a, $2
	call Func_80688_21
	call WaitNPCStep_21
	ld e, $2
	xor a
	call SpriteFace_21
	sprite_face $2, $1
	script_sleep $3c
	playmusic SONG_NONE
	playmusic SONG_TITLE
	writenpctext TreeBitstreamText_39a8f
	writenpctext TreeBitstreamText_39b0b
	writenpctext TreeBitstreamText_39b45
	writenpctext TreeBitstreamText_39ba9
	ld a, $a
	call FadeOutAudio_21
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_21
	playmusic SONG_ENCOUNTER_BEAUTY
	ld bc, Data_85292
	ld e, BANK(Data_85292)
	ld a, $2
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $2
	ld bc, Data_85280
	ld e, BANK(Data_85280)
	xor a
	call MovePerson_21
	ld bc, Data_8528e
	ld e, BANK(Data_8528e)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	playsfx $33
	sprite_face $3, $1
	move_player $1, Data_85298
	script_sleep $1e
	playsfx $2e
	call WaitNPCStep_21
	ld e, $2
	xor a
	call SpriteFace_21
	sprite_face $2, $1
	ld bc, Data_8529c
	ld e, BANK(Data_8529c)
	xor a
	call MovePerson_21
	ld bc, Data_852a4
	ld e, BANK(Data_852a4)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	ld a, $1
	call PlayerFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	sprite_face $2, $1
	playsfx $5c
	script_sleep $78
	writenpctext TreeBitstreamText_39c6c
	writenpctext TreeBitstreamText_39c19
	playmusic SONG_NONE
	playmusic SONG_TOWN1
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
	checkevent $14
	or a
	jp nz, Func_854c8
	playsfx $69
	writenpctext TreeBitstreamText_3a2e2
	jp Func_85570

Func_854c8: ; 854c8 (21:54c8)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_8551c
	writenpctext TreeBitstreamText_3a308
	script_sleep $1e
	startbattle Data_85572, Data_85450
	or a
	jp nz, Func_854eb
	jp Func_85570

Func_854eb: ; 854eb (21:54eb)
	ld bc, Data_854a2
	ld e, BANK(Data_854a2)
	xor a
	call Func_80688_21
	call WaitNPCStep_21
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	setevent $5
	checkevent $6
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
	writenpctext TreeBitstreamText_3a349
	script_sleep $1e
	startbattle Data_8557a, Data_85479
	or a
	jp nz, Func_85540
	jp Func_85570

Func_85540: ; 85540 (21:5540)
	ld bc, Data_854a6
	ld e, BANK(Data_854a6)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $1
	setevent $6
	checkevent $5
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
	db "(こふﾞん1)", $0

Data_8557a:
	db "(こふﾞん2)", $0

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
	checkevent $6
	or a
	jp nz, Func_8560a
	sprite_face $3, $1
	ld a, $1
	call PlayerFace_21
	ld hl, sp+$0
	ld [hl], $1
Func_8560a: ; 8560a (21:560a)
	jp Func_8562e

Func_8560d: ; 8560d (21:560d)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_8562e
	checkevent $5
	or a
	jp nz, Func_8562e
	ld e, $1
	xor a
	call SpriteFace_21
	ld a, $3
	call PlayerFace_21
	ld hl, sp+$0
	ld [hl], $1
Func_8562e: ; 8562e (21:562e)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_856d9
	writenpctext TreeBitstreamText_3a368
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_8568d
	script_sleep $1e
	startbattle Data_856dc, Data_855ab
	or a
	jp nz, Func_8565a
	jp Func_856d9

Func_8565a: ; 8565a (21:565a)
	ld bc, Data_855d8
	ld e, BANK(Data_855d8)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $1
	setevent $6
	checkevent $5
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
	script_sleep $1e
	startbattle Data_856e4, Data_85582
	or a
	jp nz, Func_856ab
	jp Func_856d9

Func_856ab: ; 856ab (21:56ab)
	ld bc, Data_855d4
	ld e, BANK(Data_855d4)
	xor a
	call Func_80688_21
	call WaitNPCStep_21
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	setevent $5
	checkevent $6
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
	db "(こふﾞん2)", $0

Data_856e4:
	db "(こふﾞん1)", $0

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
	checkevent $6
	or a
	jp nz, Func_85774
	sprite_face $3, $1
	ld a, $1
	call PlayerFace_21
	ld hl, sp+$0
	ld [hl], $1
Func_85774: ; 85774 (21:5774)
	jp Func_85798

Func_85777: ; 85777 (21:5777)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_85798
	checkevent $5
	or a
	jp nz, Func_85798
	ld e, $1
	xor a
	call SpriteFace_21
	ld a, $3
	call PlayerFace_21
	ld hl, sp+$0
	ld [hl], $1
Func_85798: ; 85798 (21:5798)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_8581b
	writenpctext TreeBitstreamText_3a368
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, Func_857e3
	script_sleep $1e
	startbattle Data_8581e, Data_85715
	or a
	jp nz, Func_857c4
	jp Func_8581b

Func_857c4: ; 857c4 (21:57c4)
	ld bc, Data_85742
	ld e, BANK(Data_85742)
	ld a, $1
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $1
	setevent $6
	jp Func_8581b

Func_857e3: ; 857e3 (21:57e3)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, Func_8581b
	script_sleep $1e
	startbattle Data_85826, Data_856ec
	or a
	jp nz, Func_85801
	jp Func_8581b

Func_85801: ; 85801 (21:5801)
	ld bc, Data_8573e
	ld e, BANK(Data_8573e)
	xor a
	call Func_80688_21
	call WaitNPCStep_21
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	setevent $5
Func_8581b: ; 8581b (21:581b)
	pop bc
	pop bc
	ret

Data_8581e:
	db "(こふﾞん2)", $0

Data_85826:
	db "(こふﾞん1)", $0

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
	ld a, [wc790]
	or a
	jp z, Func_858c0
	ld a, [wc790]
	cp $6
	jp nc, Func_858c0
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, Func_858bd
	move_player $1, Data_8582e
	call WaitNPCStep_21
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	call Func_80653_21
	loademote $1, $1, $b
	playsfx $44
	call WaitEmote_21
	call HideEmote_21
	ld a, $4
	call LoadPlayerSprite_21
	ld a, $1
	call PlayerFace_21
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
	writetext TreeBitstreamText_470f0
Func_858c6: ; 858c6 (21:58c6)
	jp Func_858cf

Func_858c9: ; 858c9 (21:58c9)
	writetext TreeBitstreamText_470d8
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
	call FacePlayer_20
	writetext_yesorno TreeBitstreamText_472f0
	or a
	jp nz, Func_85928
	startbattle Data_85930, Data_858d0
	or a
	jp nz, Func_8591f
	jp Func_8592e

Func_8591f: ; 8591f (21:591f)
	writetext TreeBitstreamText_47319
	jp Func_8592e

Func_85928: ; 85928 (21:5928)
	writetext TreeBitstreamText_47306
Func_8592e: ; 8592e (21:592e)
	pop bc
	ret

Data_85930:
	db "(おんなのこ)", $0

Data_85938:
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $7e, $2, $3, $0, $9, $8
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $6
	wildbot $0, $2, $c, $b, $c, $4, $6, $7e, $5, $19, $0, $1, $4
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $2
ENDC

Data_8597e:
	dr $8597e, $8598e

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
	setevent $38
	jp Func_85a61

Func_85a59: ; 85a59 (21:5a59)
	resetevent $38
Func_85a61: ; 85a61 (21:5a61)
	ld a, $1
	ld [wc7de], a
	loadwarps $5, Data_85992
	checkevent $38
	cp $1
	jp nz, Func_85aaf
	checkevent $7
	cp $1
	jp nz, Func_85aaf
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_85938
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_85aa8
	ld a, $1
	ld [wc7da], a
	jp Func_85aac

Func_85aa8: ; 85aa8 (21:5aa8)
	xor a
	ld [wc7da], a
Func_85aac: ; 85aac (21:5aac)
	jp Func_85abc

Func_85aaf: ; 85aaf (21:5aaf)
	loadpeople $5, Data_859c9
	playmusic SONG_TOWN3
Func_85abc: ; 85abc (21:5abc)
	ld a, [wc797]
	cp $7
	jp c, Func_85afc
	checkevent $38
	cp $1
	jp nz, Func_85ada
	checkevent $7
	cp $1
	jp z, Func_85afc
Func_85ada: ; 85ada (21:5ada)
	hideperson $4
	loadpeople $1, Data_85a0f
	checkevent $14
	cp $1
	jp nz, Func_85afc
	ld de, Data_8598e
	ld a, $5
	call Func_80150_21
Func_85afc: ; 85afc (21:5afc)
	call FadeInMap_21
	landmarksign TreeBitstreamText_467bb
	pop bc
	pop bc
	pop bc
	ret

Data_85b09:
	dtext_tree_pointer TreeBitstreamText_39d7e
	dtext_tree_pointer TreeBitstreamText_39d95
	dtext_tree_pointer TreeBitstreamText_39dac
	dtext_tree_pointer TreeBitstreamText_39dc3
	dtext_tree_pointer TreeBitstreamText_39dda
	dtext_tree_pointer TreeBitstreamText_39df1
	dtext_tree_pointer TreeBitstreamText_39e08

Func_85b17:
	push af
	ld a, e
	or a
	jp nz, Func_85b6d
	checkevent $c0
	or a
	jp nz, Func_85b52
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	writenpctext TreeBitstreamText_39cd9
	playsfx $2a
	writetext TreeBitstreamText_39d70
	ld c, $0
	ld e, $1
	ld a, $17
	call Func_80d4d_21
	setevent $c0
	jp Func_85b6d

Func_85b52: ; 85b52 (21:5b52)
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	ld hl, wc797
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_85b09
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextStandard_21
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
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_85c14
	checkevent $64
	or a
	jp nz, Func_85c0b
	writenpctext TreeBitstreamText_39eb7
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_85c02
	startbattle Data_85c1c, Data_85b6f
	or a
	jp nz, Func_85bd9
	jp Func_85c1a

Func_85bd9: ; 85bd9 (21:5bd9)
	setevent $64
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_39ed3
	jp Func_85c08

Func_85c02: ; 85c02 (21:5c02)
	writenpctext TreeBitstreamText_39ef3
Func_85c08: ; 85c08 (21:5c08)
	jp Func_85c11

Func_85c0b: ; 85c0b (21:5c0b)
	writenpctext TreeBitstreamText_39f09
Func_85c11: ; 85c11 (21:5c11)
	jp Func_85c1a

Func_85c14: ; 85c14 (21:5c14)
	writetext TreeBitstreamText_3a27f
Func_85c1a: ; 85c1a (21:5c1a)
	pop bc
	ret

Data_85c1c:
	dr $85c1c, $85c28

Data_85c28: ; 85c28
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $6
ENDC

Data_85c6e:
	dr $85c6e, $85c7e

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
	setevent $38
	jp Func_85d22

Func_85d1a: ; 85d1a (21:5d1a)
	resetevent $38
Func_85d22: ; 85d22 (21:5d22)
	ld a, $7
	ld [wc7de], a
	loadwarps $2, Data_85c82
	checkevent $38
	cp $1
	jp nz, Func_85d70
	checkevent $7
	cp $1
	jp nz, Func_85d70
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_85c28
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_85d69
	ld a, $1
	ld [wc7da], a
	jp Func_85d6d

Func_85d69: ; 85d69 (21:5d69)
	xor a
	ld [wc7da], a
Func_85d6d: ; 85d6d (21:5d6d)
	jp Func_85d7d

Func_85d70: ; 85d70 (21:5d70)
	loadpeople $5, Data_85c98
	playmusic SONG_TOWN3
Func_85d7d: ; 85d7d (21:5d7d)
	checkevent $14
	or a
	jp nz, Func_85d97
	ld a, [wc797]
	cp $7
	jp nz, Func_85d97
	ld de, Data_85c7e
	ld a, $3
	call Func_80150_21
Func_85d97: ; 85d97 (21:5d97)
	call FadeInMap_21
	landmarksign TreeBitstreamText_46803
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
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_85e5a
	ld a, [wc797]
	cp $6
	jp c, Func_85e51
	checkevent $6a
	or a
	jp nz, Func_85e48
	writenpctext TreeBitstreamText_3a1de
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_85e3f
	startbattle Data_85e62, Data_85da4
	or a
	jp nz, Func_85e16
	jp Func_85e60

Func_85e16: ; 85e16 (21:5e16)
	setevent $6a
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_3a202
	jp Func_85e45

Func_85e3f: ; 85e3f (21:5e3f)
	writenpctext TreeBitstreamText_3a215
Func_85e45: ; 85e45 (21:5e45)
	jp Func_85e4e

Func_85e48: ; 85e48 (21:5e48)
	writenpctext TreeBitstreamText_3a22e
Func_85e4e: ; 85e4e (21:5e4e)
	jp Func_85e57

Func_85e51: ; 85e51 (21:5e51)
	writenpctext TreeBitstreamText_3a1b9
Func_85e57: ; 85e57 (21:5e57)
	jp Func_85e60

Func_85e5a: ; 85e5a (21:5e5a)
	writetext TreeBitstreamText_3a27f
Func_85e60: ; 85e60 (21:5e60)
	pop bc
	ret

Data_85e62:
	db "(りかの せんせい)", $0

Data_85e6d: ; 85e6d
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $8
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $9, $6
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $4
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $2
ENDC

Data_85eb3: ; 85eb3
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $8
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $9, $6
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $4
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $2
ENDC

Data_85ef9:
	dr $85ef9, $85f05

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
	setevent $38
	jp Func_85fb0

Func_85fa8: ; 85fa8 (21:5fa8)
	resetevent $38
Func_85fb0: ; 85fb0 (21:5fb0)
	ld a, [wc798]
	or a
	jp nz, Func_85fd8
	ld a, [wMapX]
	cp $5
	jp nz, Func_85fc9
	ld a, [wc7de]
	inc a
	ld [wc7de], a
	jp Func_85fd8

Func_85fc9: ; 85fc9 (21:5fc9)
	ld a, [wMapX]
	cp $4
	jp nz, Func_85fd8
	ld a, [wc7de]
	dec a
	ld [wc7de], a
Func_85fd8: ; 85fd8 (21:5fd8)
	loadwarps $3, Data_85f05
	checkevent $38
	cp $1
	jp nz, Func_86014
	checkevent $7
	cp $1
	jp nz, Func_86014
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_8600d
	ld a, $1
	ld [wc7da], a
	jp Func_86011

Func_8600d: ; 8600d (21:600d)
	xor a
	ld [wc7da], a
Func_86011: ; 86011 (21:6011)
	jp Func_86019

Func_86014: ; 86014 (21:6014)
	playmusic SONG_TOWN3
Func_86019: ; 86019 (21:6019)
	call FadeInMap_21
	ld a, [wc7de]
	cp $5
	jp z, Func_86060
	cp $3
	jp nz, Func_86094
	checkevent $38
	cp $1
	jp nz, Func_8604f
	checkevent $7
	cp $1
	jp nz, Func_8604f
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_85e6d
	jp Func_86057

Func_8604f: ; 8604f (21:604f)
	loadpeople $2, Data_85f26
Func_86057: ; 86057 (21:6057)
	landmarksign TreeBitstreamText_467d3
	jp Func_86094

Func_86060: ; 86060 (21:6060)
	checkevent $38
	cp $1
	jp nz, Func_86086
	checkevent $7
	cp $1
	jp nz, Func_86086
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_85eb3
	jp Func_8608e

Func_86086: ; 86086 (21:6086)
	loadpeople $3, Data_85f42
Func_8608e: ; 8608e (21:608e)
	landmarksign TreeBitstreamText_467eb
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
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_8613d
	checkevent $66
	or a
	jp nz, Func_86134
	writenpctext TreeBitstreamText_3a00a
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_8612b
	startbattle Data_86145, Data_86098
	or a
	jp nz, Func_86102
	jp Func_86143

Func_86102: ; 86102 (21:6102)
	setevent $66
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_3a024
	jp Func_86131

Func_8612b: ; 8612b (21:612b)
	writenpctext TreeBitstreamText_3a03a
Func_86131: ; 86131 (21:6131)
	jp Func_8613a

Func_86134: ; 86134 (21:6134)
	writenpctext TreeBitstreamText_3a04b
Func_8613a: ; 8613a (21:613a)
	jp Func_86143

Func_8613d: ; 8613d (21:613d)
	writetext TreeBitstreamText_3a27f
Func_86143: ; 86143 (21:6143)
	pop bc
	ret

Data_86145:
	db "(えいこﾞの せんせい)", $0

Data_86152:
	dr $86152, $8617b

Func_8617b:
	push af
	ld a, e
	or a
	jp nz, Func_861fd
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_861f7
	checkevent $68
	or a
	jp nz, Func_861ee
	writenpctext TreeBitstreamText_3a138
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_861e5
	startbattle Data_861ff, Data_86152
	or a
	jp nz, Func_861bc
	jp Func_861fd

Func_861bc: ; 861bc (21:61bc)
	setevent $68
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_3a151
	jp Func_861eb

Func_861e5: ; 861e5 (21:61e5)
	writenpctext TreeBitstreamText_3a167
Func_861eb: ; 861eb (21:61eb)
	jp Func_861f4

Func_861ee: ; 861ee (21:61ee)
	writenpctext TreeBitstreamText_3a184
Func_861f4: ; 861f4 (21:61f4)
	jp Func_861fd

Func_861f7: ; 861f7 (21:61f7)
	writetext TreeBitstreamText_3a27f
Func_861fd: ; 861fd (21:61fd)
	pop bc
	ret

Data_861ff:
	db "(しゃかいの せんせい)", $0

Data_8620c: ; 8620c
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $9, $6
ENDC

Data_86252: ; 86252
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $9, $6
ENDC

Data_86298: ; 86298
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ENDC
IF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $9, $6
ENDC

Data_862de:
	dr $862de, $862fe

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
	setevent $38
	jp Func_8643f

Func_86437: ; 86437 (21:6437)
	resetevent $38
Func_8643f: ; 8643f (21:643f)
	ld a, [wc798]
	or a
	jp nz, Func_86467
	ld a, [wMapX]
	cp $5
	jp nz, Func_86458
	ld a, [wc7de]
	dec a
	ld [wc7de], a
	jp Func_86467

Func_86458: ; 86458 (21:6458)
	ld a, [wMapX]
	cp $4
	jp nz, Func_86467
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_86467: ; 86467 (21:6467)
	checkevent $38
	cp $1
	jp nz, Func_8649b
	checkevent $7
	cp $1
	jp nz, Func_8649b
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_86494
	ld a, $1
	ld [wc7da], a
	jp Func_86498

Func_86494: ; 86494 (21:6494)
	xor a
	ld [wc7da], a
Func_86498: ; 86498 (21:6498)
	jp Func_864a0

Func_8649b: ; 8649b (21:649b)
	playmusic SONG_TOWN3
Func_864a0: ; 864a0 (21:64a0)
	ld a, [wc7de]
	cp $6
	jp z, Func_86536
	cp $4
	jp z, Func_864f4
	cp $2
	jp nz, Func_86575
	loadwarps $3, Data_862fe
	checkevent $38
	cp $1
	jp nz, Func_864e0
	checkevent $7
	cp $1
	jp nz, Func_864e0
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_8620c
	jp Func_864e8

Func_864e0: ; 864e0 (21:64e0)
	loadpeople $3, Data_86361
Func_864e8: ; 864e8 (21:64e8)
	call FadeInMap_21
	landmarksign TreeBitstreamText_467c7
	jp Func_86575

Func_864f4: ; 864f4 (21:64f4)
	loadwarps $3, Data_8631f
	checkevent $38
	cp $1
	jp nz, Func_86522
	checkevent $7
	cp $1
	jp nz, Func_86522
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_86252
	jp Func_8652a

Func_86522: ; 86522 (21:6522)
	loadpeople $4, Data_8638b
Func_8652a: ; 8652a (21:652a)
	call FadeInMap_21
	landmarksign TreeBitstreamText_467df
	jp Func_86575

Func_86536: ; 86536 (21:6536)
	loadwarps $3, Data_86340
	checkevent $38
	cp $1
	jp nz, Func_86564
	checkevent $7
	cp $1
	jp nz, Func_86564
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_86298
	jp Func_8656c

Func_86564: ; 86564 (21:6564)
	loadpeople $4, Data_863c3
Func_8656c: ; 8656c (21:656c)
	call FadeInMap_21
	landmarksign TreeBitstreamText_467f7
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
	call FacePlayer_20
	checkevent $14
	or a
	jp nz, Func_865f4
	checkevent $c5
	or a
	jp nz, Func_865eb
	ld a, $3b
	call Func_80e5d_21
	cp $1
	jp nz, Func_865e2
	writenpctext_yesorno TreeBitstreamText_3f7e8
	or a
	jp nz, Func_865be
	writenpctext TreeBitstreamText_3f85e
	setevent $c5
	jp Func_865df

Func_865be: ; 865be (21:65be)
	writenpctext TreeBitstreamText_3f8cd
	writetext TreeBitstreamText_3f8f1
	ld e, $0
	ld a, $7f
	call Func_80d74_21
	writenpctext TreeBitstreamText_3f901
	setevent $c5
Func_865df: ; 865df (21:65df)
	jp Func_865e8

Func_865e2: ; 865e2 (21:65e2)
	writenpctext TreeBitstreamText_3f7ae
Func_865e8: ; 865e8 (21:65e8)
	jp Func_865f1

Func_865eb: ; 865eb (21:65eb)
	writetext TreeBitstreamText_3fa6b
Func_865f1: ; 865f1 (21:65f1)
	jp Func_865fa

Func_865f4: ; 865f4 (21:65f4)
	writetext TreeBitstreamText_3fa6b
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
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_866a1
	checkevent $65
	or a
	jp nz, Func_86698
	writenpctext TreeBitstreamText_39f37
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_8668f
	startbattle Data_866a9, Data_865fc
	or a
	jp nz, Func_86666
	jp Func_866a7

Func_86666: ; 86666 (21:6666)
	setevent $65
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_39f4e
	jp Func_86695

Func_8668f: ; 8668f (21:668f)
	writenpctext TreeBitstreamText_39f5f
Func_86695: ; 86695 (21:6695)
	jp Func_8669e

Func_86698: ; 86698 (21:6698)
	writenpctext TreeBitstreamText_39f70
Func_8669e: ; 8669e (21:669e)
	jp Func_866a7

Func_866a1: ; 866a1 (21:66a1)
	writetext TreeBitstreamText_3a27f
Func_866a7: ; 866a7 (21:66a7)
	pop bc
	ret

Data_866a9:
	db "(こくこﾞの せんせい)", $0

Data_866b6:
	dr $866b6, $866df

Func_866df:
	push af
	ld a, e
	or a
	jp nz, Func_86761
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_8675b
	checkevent $67
	or a
	jp nz, Func_86752
	writenpctext TreeBitstreamText_3a097
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_86749
	startbattle Data_86763, Data_866b6
	or a
	jp nz, Func_86720
	jp Func_86761

Func_86720: ; 86720 (21:6720)
	setevent $67
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_3a0b1
	jp Func_8674f

Func_86749: ; 86749 (21:6749)
	writenpctext TreeBitstreamText_3a0c9
Func_8674f: ; 8674f (21:674f)
	jp Func_86758

Func_86752: ; 86752 (21:6752)
	writenpctext TreeBitstreamText_3a0e1
Func_86758: ; 86758 (21:6758)
	jp Func_86761

Func_8675b: ; 8675b (21:675b)
	writetext TreeBitstreamText_3a27f
Func_86761: ; 86761 (21:6761)
	pop bc
	ret

Data_86763:
	db "(たいいくの せんせい)", $0

Data_86770:
	dr $86770, $86799

Func_86799:
	push af
	ld a, e
	or a
	jp nz, Func_8681b
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $c0
	cp $1
	jp nz, Func_86815
	checkevent $69
	or a
	jp nz, Func_8680c
	writenpctext TreeBitstreamText_39fb2
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_86803
	startbattle Data_8681d, Data_86770
	or a
	jp nz, Func_867da
	jp Func_8681b

Func_867da: ; 867da (21:67da)
	setevent $69
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_39fc7
	jp Func_86809

Func_86803: ; 86803 (21:6803)
	writenpctext TreeBitstreamText_39fd9
Func_86809: ; 86809 (21:6809)
	jp Func_86812

Func_8680c: ; 8680c (21:680c)
	writenpctext TreeBitstreamText_39fe7
Func_86812: ; 86812 (21:6812)
	jp Func_8681b

Func_86815: ; 86815 (21:6815)
	writetext TreeBitstreamText_3a27f
Func_8681b: ; 8681b (21:681b)
	pop bc
	ret

Data_8681d:
	db "(すうかﾞくの せんせい)", $0

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
	loadpeople $2, Data_8686e
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	loadwarps $1, Data_8682b
	checkevent $7
	or a
	jp nz, Func_868d5
	loadpeople $4, Data_86836
	call FadeInMap_21
	call Func_86943
	jp Func_868dd

Func_868d5: ; 868d5 (21:68d5)
	playmusic SONG_TOWN2
	call FadeInMap_21
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
	playmusic SONG_NONE
	playmusic SONG_TITLE
	call WaitNPCStep_21
	move_player $1, Data_86907
	call WaitNPCStep_21
	xor a
	call PlayerFace_21
	loademote $1, $1, $7
	playsfx $68
	call WaitEmote_21
	loademote $1, $1, $7
	playsfx $68
	call WaitEmote_21
	loademote $1, $1, $7
	playsfx $68
	call WaitEmote_21
	writenpctext TreeBitstreamText_3a38a
	ld bc, Data_8690f
	ld e, BANK(Data_8690f)
	ld a, $3
	call MovePerson_21
	ld bc, Data_86913
	ld e, BANK(Data_86913)
	ld a, $4
	call Func_80688_21
	call WaitNPCStep_21
	sprite_face $3, $2
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_3a3ac
	writenpctext TreeBitstreamText_3a3c2
	sprite_face $2, $2
	writenpctext TreeBitstreamText_3a3dc
	startbattle Data_86ac4, Data_868de
	or a
	jp nz, Func_869e7
	ret

Func_869e7: ; 869e7 (21:69e7)
	playsfx $69
	writenpctext TreeBitstreamText_3a420
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_BEAUTY
	ld bc, Data_86917
	ld e, BANK(Data_86917)
	ld a, $2
	call Func_80688_21
	call WaitNPCStep_21
	ld a, $1
	call PlayerFace_21
	ld bc, Data_8691f
	ld e, BANK(Data_8691f)
	ld a, $2
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $2
	xor a
	call PlayerFace_21
	ld bc, Data_86923
	ld e, BANK(Data_86923)
	ld a, $3
	call Func_80688_21
	ld bc, Data_86927
	ld e, BANK(Data_86927)
	ld a, $4
	call Func_80688_21
	call WaitNPCStep_21
	ld bc, Data_8692d
	ld e, BANK(Data_8692d)
	ld a, $3
	call MovePerson_21
	ld bc, Data_86931
	ld e, BANK(Data_86931)
	ld a, $4
	call Func_80688_21
	call WaitNPCStep_21
	ld a, $3
	call PlayerFace_21
	ld bc, Data_86935
	ld e, BANK(Data_86935)
	ld a, $3
	call MovePerson_21
	ld bc, Data_8693b
	ld e, BANK(Data_8693b)
	ld a, $4
	call Func_80688_21
	call WaitNPCStep_21
	hideperson $3
	hideperson $4
	playmusic SONG_NONE
	playmusic SONG_TOWN2
	script_sleep $1e
	ld bc, Data_8693f
	ld e, BANK(Data_8693f)
	ld a, $5
	call Func_80688_21
	call WaitNPCStep_21
	sprite_face $2, $5
	script_sleep $1e
	xor a
	call PlayerFace_21
	script_sleep $1e
	writenpctext TreeBitstreamText_3a481
	setevent $7
	ld a, $8
	ld [wc790], a
	ret

Data_86ac4:
	db "ヒﾞスコ", $0

Func_86ac9:
	ld a, e
	or a
	jp nz, Func_86b0c
	sprite_face $1, $5
	sprite_face $0, $5
	sprite_face $3, $5
	sprite_face $2, $5
	script_sleep $1e
	sprite_face $3, $5
	sprite_face $0, $5
	sprite_face $1, $5
	sprite_face $2, $5
Func_86b0c: ; 86b0c (21:6b0c)
	ret

Func_86b0d:
	ld a, e
	or a
	jp nz, Func_86c00
	checkevent $d6
	or a
	jp nz, Func_86bfa
	playsfx $5e
	loademote $2, $2, $8
	ld e, $4
	ld a, $e
	call MoveEmote_21
	call WaitEmote_21
	call HideEmote_21
	playsfx $28
	ld e, $1
	xor a
	call SetPersonVisibilityState_21
	playsfx $60
	ld e, $3
	xor a
	call SpriteFace_21
	ld e, $0
	xor a
	call SpriteFace_21
	ld e, $1
	xor a
	call SpriteFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld e, $3
	xor a
	call SpriteFace_21
	ld e, $0
	xor a
	call SpriteFace_21
	ld e, $1
	xor a
	call SpriteFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld a, $f
	call FadeOutAudio_21
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_21
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep $1e
	ld c, $8
	ld e, $7
	ld a, $6
	call Func_80e8d_21
	setevent $d6
	playsfx $60
	ld e, $3
	xor a
	call SpriteFace_21
	ld e, $0
	xor a
	call SpriteFace_21
	ld e, $1
	xor a
	call SpriteFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld e, $3
	xor a
	call SpriteFace_21
	ld e, $0
	xor a
	call SpriteFace_21
	ld e, $1
	xor a
	call SpriteFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld a, $f
	call FadeOutAudio_21
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_21
	playmusic SONG_TOWN2
	face_player 0
	ld e, $0
	xor a
	call SetPersonVisibilityState_21
	jp Func_86c00

Func_86bfa: ; 86bfa (21:6bfa)
	writetext TreeBitstreamText_3f79e
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
IF DEF(SUN)
	wildbot $5, $14, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $5, $14, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $5, $14, $4, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $5, $14, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $5, $14, $4, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $9, $15, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $9, $15, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $9, $15, $4, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $9, $15, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $9, $15, $4, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $d, $16, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $d, $16, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $d, $16, $4, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $d, $16, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $d, $16, $4, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $11, $17, $4, $2, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $11, $17, $4, $2, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $11, $17, $4, $2, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $11, $17, $4, $2, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $11, $17, $4, $2, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $15, $16, $2, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $15, $16, $2, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $15, $16, $2, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $15, $16, $2, $3, $40, $a, $c, $c, $2, $0, $0, $2, $5
	wildbot $15, $16, $2, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $17, $15, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $17, $15, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $17, $15, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $17, $15, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $17, $15, $3, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $1a, $14, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $1a, $14, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $1a, $14, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $1a, $14, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $1a, $14, $3, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $1d, $13, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $1d, $13, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $1d, $13, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $1d, $13, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $1d, $13, $3, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
	wildbot $20, $12, $2, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $20, $12, $2, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $20, $12, $2, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $20, $12, $2, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $20, $12, $2, $3, $69, $8, $a, $7f, $5, $0, $0, $8, $4
ENDC
IF DEF(STAR)
	wildbot $5, $14, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $5, $14, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $5, $14, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $5, $14, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $5, $14, $4, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $9, $15, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $9, $15, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $9, $15, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $9, $15, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $9, $15, $4, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $d, $16, $4, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $d, $16, $4, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $d, $16, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $d, $16, $4, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $d, $16, $4, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $11, $17, $4, $2, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $11, $17, $4, $2, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $11, $17, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $11, $17, $4, $2, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $11, $17, $4, $2, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $15, $16, $2, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $15, $16, $2, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $15, $16, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $15, $16, $2, $3, $40, $a, $c, $c, $2, $0, $0, $2, $5
	wildbot $15, $16, $2, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $17, $15, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $17, $15, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $17, $15, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $17, $15, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $17, $15, $3, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $1a, $14, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $1a, $14, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $1a, $14, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $1a, $14, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $1a, $14, $3, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $1d, $13, $3, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $1d, $13, $3, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $1d, $13, $3, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $1d, $13, $3, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $1d, $13, $3, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
	wildbot $20, $12, $2, $3, $49, $a, $c, $1, $2, $0, $0, $2, $a
	wildbot $20, $12, $2, $3, $43, $9, $b, $7f, $6, $0, $0, $8, $9
	wildbot $20, $12, $2, $3, $84, $c, $e, $c, $14, $0, $0, $a, $6
	wildbot $20, $12, $2, $3, $40, $a, $c, $7f, $2, $0, $0, $2, $5
	wildbot $20, $12, $2, $3, $66, $8, $a, $7b, $6, $0, $0, $8, $4
ENDC

Func_86ffa:
	ld a, $2
	ld [wc789], a
	ld a, $4
	ld [wc7e2], a
	ld a, $4
	call Func_80c94_21
	call Func_870fa
	ld hl, Func_870fa
	call Func_80f11_21
	loadwarps $b, Data_86c01
	ld a, $5
	call Func_80d01_21
	loadwilds $2d, Data_86d84
	checkevent $1
	cp $1
	jp nz, Func_8703a
	ld e, $12
	ld hl, Data_86c7a
	call Func_80ce7_21
Func_8703a: ; 8703a (21:703a)
	loadpeople $a, Data_86cf8
	ld a, [wc790]
	or a
	jp z, Func_8706e
	ld a, [wc790]
	cp $7
	jp nc, Func_8706e
	ld de, Data_86cf0
	xor a
	call Func_80150_21
	ld de, Data_86cf4
	ld a, $1
	call Func_80150_21
	hideperson $8
	hideperson $9
Func_8706e: ; 8706e (21:706e)
	playmusic SONG_TOWN1
	ld a, $1
	call LoadPlayerSprite_21
	call FadeInMap_21
	ret

Data_8707c:
	dr $8707c, $87082

Data_87082: ; 87082
	dr $87082, $87088

Data_87088: ; 87088
	dr $87088, $870fa

Func_870fa: ; 870fa (21:70fa)
	checkevent $1
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
	ld a, [wc790]
	or a
	jp z, Func_87140
	ld a, [wc790]
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
	face_player $5
	writetext TreeBitstreamText_414b4
	checkevent $f0
	or a
	jp nz, Func_87163
	setevent $f0
Func_87163: ; 87163 (21:7163)
	ret

Data_87164:
	dr $87164, $87185

Data_87185: ; 87185
	dr $87185, $8718a

Data_8718a: ; 8718a
IF DEF(SUN)
	wildbot $0, $3, $10, $10, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $0, $3, $10, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $10, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $3, $10, $10, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $0, $3, $10, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC
IF DEF(STAR)
	wildbot $0, $3, $10, $10, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $0, $3, $10, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $10, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $3, $10, $10, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $0, $3, $10, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_871d0
	dr $871d0, $871d4

Data_871d4: ; 871d4
	dr $871d4, $871fe

Func_871fe:
	loadwarps $3, Data_87164
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_8723b
	ld a, $1
	ld [wc7da], a
	call FadeInMap_21
	writenpctext TreeBitstreamText_3a89f
	call Func_8737a
	checkevent $f0
	or a
	jp nz, Func_87238
	setevent $f0
Func_87238: ; 87238 (21:7238)
	jp Func_87265

Func_8723b: ; 8723b (21:723b)
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_8718a
	ld e, $1
	ld hl, Data_87185
	call Func_80ce7_21
	loadpeople $3, Data_871d4
	xor a
	ld [wc7da], a
	call FadeInMap_21
	landmarksign TreeBitstreamText_4686b
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
	call FacePlayer_20
	checkevent $6c
	or a
	jp nz, Func_872df
	writetext TreeBitstreamText_42bb7
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_872d6
	startbattle Data_872e7, Data_87266
	or a
	jp nz, Func_872c5
	jp Func_872e5

Func_872c5: ; 872c5 (21:72c5)
	setevent $6c
	writetext TreeBitstreamText_42bc8
	jp Func_872dc

Func_872d6: ; 872d6 (21:72d6)
	writetext TreeBitstreamText_42bc8
Func_872dc: ; 872dc (21:72dc)
	jp Func_872e5

Func_872df: ; 872df (21:72df)
	writetext TreeBitstreamText_42bc8
Func_872e5: ; 872e5 (21:72e5)
	pop bc
	ret

Data_872e7:
	db "(りょうし)", $0

Data_872ee:
	dr $872ee, $87317

Func_87317:
	push af
	ld a, e
	or a
	jp nz, Func_8736d
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $6d
	or a
	jp nz, Func_87367
	writetext TreeBitstreamText_42ba0
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_8735e
	startbattle Data_8736f, Data_872ee
	or a
	jp nz, Func_8734d
	jp Func_8736d

Func_8734d: ; 8734d (21:734d)
	setevent $6d
	writetext TreeBitstreamText_42baa
	jp Func_87364

Func_8735e: ; 8735e (21:735e)
	writetext TreeBitstreamText_42baa
Func_87364: ; 87364 (21:7364)
	jp Func_8736d

Func_87367: ; 87367 (21:7367)
	writetext TreeBitstreamText_42c09
Func_8736d: ; 8736d (21:736d)
	pop bc
	ret

Data_8736f:
	db "(りょうし)", $0

Data_87376:
	dr $87376, $8737a

Func_8737a: ; 8737a (21:737a)
	move_player $1, Data_87376
	call WaitNPCStep_21
	ret

Data_87388:
	dr $87388, $873a9

Data_873a9: ; 873a9
	dr $873a9, $873b3

Data_873b3: ; 873b3
IF DEF(SUN)
	wildbot $5, $3, $8, $10, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $5, $3, $8, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $8, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $8, $10, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $5, $3, $8, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
	wildbot $0, $3, $5, $9, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $0, $3, $5, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $5, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
ENDC
IF DEF(STAR)
	wildbot $5, $3, $8, $10, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $5, $3, $8, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $8, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $8, $10, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $5, $3, $8, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
	wildbot $0, $3, $5, $9, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $0, $3, $5, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $5, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
ENDC

Data_87423: ; 87423
	dr $87423, $8744d

Func_8744d:
	loadwarps $3, Data_87388
	ld e, $2
	ld hl, Data_873a9
	call Func_80ce7_21
	ld a, $3
	call Func_80d01_21
	loadwilds $8, Data_873b3
	loadpeople $3, Data_87423
	checkevent $0
	or a
	jp nz, Func_87484
	ld a, $1
	ld [wc7da], a
	jp Func_87488

Func_87484: ; 87484 (21:7484)
	xor a
	ld [wc7da], a
Func_87488: ; 87488 (21:7488)
	playmusic SONG_CAVE
	call FadeInMap_21
	landmarksign TreeBitstreamText_46878
	ret

Func_87497:
	ld a, e
	or a
	jp nz, Func_874c2
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $1, $2, $8
	call WaitEmote_21
	call HideEmote_21
	writetext TreeBitstreamText_46e0b
	playmusic SONG_CAVE
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
	call FacePlayer_20
	checkevent $6e
	or a
	jp nz, Func_8753c
	writetext TreeBitstreamText_42be8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_87533
	startbattle Data_87544, Data_874c3
	or a
	jp nz, Func_87522
	jp Func_87542

Func_87522: ; 87522 (21:7522)
	setevent $6e
	writetext TreeBitstreamText_42bf7
	jp Func_87539

Func_87533: ; 87533 (21:7533)
	writetext TreeBitstreamText_42bf7
Func_87539: ; 87539 (21:7539)
	jp Func_87542

Func_8753c: ; 8753c (21:753c)
	writetext TreeBitstreamText_42c09
Func_87542: ; 87542 (21:7542)
	pop bc
	ret

Data_87544:
	db "(りょうし)", $0

Data_8754b:
	dr $8754b, $87574

Func_87574
	push af
	ld a, e
	or a
	jp nz, Func_8763c
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $6f
	or a
	jp nz, Func_87602
	writetext TreeBitstreamText_42b8f
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_875f9
	startbattle Data_8763e, Data_8754b
	or a
	jp nz, Func_875aa
	jp Func_8763c

Func_875aa: ; 875aa (21:75aa)
	setevent $6f
	checkevent $109
	or a
	jp nz, Func_875f0
	ld a, [wc79c]
	cp $1
	jp c, Func_875f0
	checkevent $114
	or a
	jp nz, Func_875f0
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_21
	setevent $109
Func_875f0: ; 875f0 (21:75f0)
	writetext TreeBitstreamText_42b98
	jp Func_875ff

Func_875f9: ; 875f9 (21:75f9)
	writetext TreeBitstreamText_42b7b
Func_875ff: ; 875ff (21:75ff)
	jp Func_8763c

Func_87602: ; 87602 (21:7602)
	checkevent $109
	or a
	jp nz, Func_87636
	ld a, [wc79c]
	cp $1
	jp c, Func_87636
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	call Func_80d4d_21
	setevent $109
Func_87636: ; 87636 (21:7636)
	writetext TreeBitstreamText_42bc8
Func_8763c: ; 8763c (21:763c)
	pop bc
	ret

Data_8763e:
	db "(かいてーしﾞん)", $0

Func_87648: ; 87648 (21:7648)
	resetevent $18
	resetevent $19
	resetevent $1a
	resetevent $4b
	ret

Data_87669:
	dr $87669, $87695

Data_87695: ; 87695
	dr $87695, $876c1

Data_876c1: ; 876c1
IF DEF(SUN)
	wildbot $0, $4, $18, $a, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $0, $4, $18, $a, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $4, $18, $a, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $4, $18, $a, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $0, $4, $18, $a, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
	wildbot $14, $e, $5, $6, $5, $9, $b, $2e, $1, $6, $0, $8, $a
	wildbot $14, $e, $5, $6, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $14, $e, $5, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
ENDC
IF DEF(STAR)
	wildbot $0, $4, $18, $a, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $0, $4, $18, $a, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $4, $18, $a, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $4, $18, $a, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $0, $4, $18, $a, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
	wildbot $14, $e, $5, $6, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $14, $e, $5, $6, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $14, $e, $5, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
ENDC

Data_87731: ; 87731
	dr $87731, $87769

Data_87769: ; 87769
	dr $87769, $87785

Data_87785: ; 87785
	dr $87785, $877cb

Func_877cb:
	checkevent $51
	or a
	jp nz, Func_877f5
	checkevent $4c
	or a
	jp nz, Func_877f5
	call Func_87648
	loadwarps $4, Data_87669
	loadpeople $4, Data_87731
	jp Func_87828

Func_877f5: ; 877f5 (21:77f5)
	checkevent $51
	cp $1
	jp nz, Func_87820
	checkevent $4c
	or a
	jp nz, Func_87820
	call Func_87648
	loadwarps $4, Data_87669
	loadpeople $2, Data_87769
	jp Func_87828

Func_87820: ; 87820 (21:7820)
	loadwarps $4, Data_87695
Func_87828: ; 87828 (21:7828)
	ld a, $3
	call Func_80d01_21
	loadwilds $8, Data_876c1
	loadpeople $5, Data_87785
	playmusic SONG_CAVE
	ld a, $4
	ld [wc7e2], a
	ld a, [wc78a]
	cp $3
	jp nz, Func_8786b
	checkevent $fb
	or a
	jp nz, Func_8785f
	call Func_87b87
	jp Func_87868

Func_8785f: ; 8785f (21:785f)
	call FadeInMap_21
	landmarksign TreeBitstreamText_46886
Func_87868: ; 87868 (21:7868)
	jp Func_8788a

Func_8786b: ; 8786b (21:786b)
	checkevent $0
	or a
	jp nz, Func_8787d
	ld a, $1
	ld [wc7da], a
	jp Func_87881

Func_8787d: ; 8787d (21:787d)
	xor a
	ld [wc7da], a
Func_87881: ; 87881 (21:7881)
	call FadeInMap_21
	landmarksign TreeBitstreamText_46886
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
	ld [wc7c4], a
Func_878a7: ; 878a7 (21:78a7)
	jp Func_878ef

Func_878aa: ; 878aa (21:78aa)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_878ef
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $18
	checkevent $19
	cp $1
	jp nz, Func_878ef
	checkevent $1a
	cp $1
	jp nz, Func_878ef
	checkevent $4b
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
	ld [wc7c4], a
Func_8790d: ; 8790d (21:790d)
	jp Func_87955

Func_87910: ; 87910 (21:7910)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_87955
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $19
	checkevent $18
	cp $1
	jp nz, Func_87955
	checkevent $1a
	cp $1
	jp nz, Func_87955
	checkevent $4b
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
	ld [wc7c4], a
Func_87973: ; 87973 (21:7973)
	jp Func_879bb

Func_87976: ; 87976 (21:7976)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_879bb
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $1a
	checkevent $18
	cp $1
	jp nz, Func_879bb
	checkevent $19
	cp $1
	jp nz, Func_879bb
	checkevent $4b
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
	ld [wc7c4], a
Func_879d9: ; 879d9 (21:79d9)
	jp Func_87a21

Func_879dc: ; 879dc (21:79dc)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_87a21
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $4b
	checkevent $18
	cp $1
	jp nz, Func_87a21
	checkevent $19
	cp $1
	jp nz, Func_87a21
	checkevent $1a
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
	ld [wc7c4], a
Func_87a3f: ; 87a3f (21:7a3f)
	jp Func_87a71

Func_87a42: ; 87a42 (21:7a42)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_87a71
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $18
	checkevent $19
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
	ld [wc7c4], a
Func_87a8f: ; 87a8f (21:7a8f)
	jp Func_87ac1

Func_87a92: ; 87a92 (21:7a92)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call CheckObjectsOccupyingSameTile_21
	or a
	jp z, Func_87ac1
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call SetPersonVisibilityState_21
	setevent $19
	checkevent $18
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
	ld a, [wc790]
	or a
	jp z, Func_87ae0
	ld a, [wc790]
	cp $7
	jp nc, Func_87ae0
	writetext TreeBitstreamText_47041
	jp Func_87b13

Func_87ae0: ; 87ae0 (21:7ae0)
	checkevent $59
	or a
	jp nz, Func_87b00
	setevent $59
	playsfx $32
	writetext TreeBitstreamText_47029
	jp Func_87b13

Func_87b00: ; 87b00 (21:7b00)
	resetevent $59
	playsfx $28
	writetext TreeBitstreamText_4701b
Func_87b13: ; 87b13 (21:7b13)
	ret

Func_87b14:
	ld a, e
	or a
	jp nz, Func_87b86
	ld a, [wPlayerFacing]
	or a
	jp z, Func_87b23
	jp Func_87b86

Func_87b23: ; 87b23 (21:7b23)
	checkevent $59
	cp $1
	jp nz, Func_87b37
	writetext TreeBitstreamText_47037
	jp Func_87b86

Func_87b37: ; 87b37 (21:7b37)
	ld a, [wc790]
	or a
	jp z, Func_87b4f
	ld a, [wc790]
	cp $7
	jp nc, Func_87b4f
	writetext TreeBitstreamText_47037
	jp Func_87b86

Func_87b4f: ; 87b4f (21:7b4f)
	ld a, $4
	ld [wc78a], a
	xor a
	call Func_80653_21
	loademote $1, $1, $9
	playsfx $5a
	call WaitEmote_21
	call HideEmote_21
	ld a, $2
	call PlayerFace_21
	resetevent $fa
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
	checkevent $0
	or a
	jp nz, Func_87b99
	ld a, $1
	ld [wc7da], a
	jp Func_87b9d

Func_87b99: ; 87b99 (21:7b99)
	xor a
	ld [wc7da], a
Func_87b9d: ; 87b9d (21:7b9d)
	xor a
	call Func_80653_21
	ld a, $2
	call PlayerFace_21
	call FadeInMap_21
	landmarksign TreeBitstreamText_46886
	loademote $1, $2, $9
	playsfx $37
	call WaitEmote_21
	ld a, $1
	call Func_80653_21
	script_sleep $1
	call HideEmote_21
	setevent $fb
	ret

Data_87bd7:
	dr $87bd7, $87c03

Func_87c03: ; 87c03 (21:7c03)
	setevent $4c
	call AllocateSpaceForWarps_21
	loadwarps $4, Data_87bd7
	call StartShakingScreen_21
	playsfx $64
	script_sleep $3c
	playsfx $64
	script_sleep $3c
	call StopShakingScreen_21
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
	call FacePlayer_20
	checkevent $70
	or a
	jp nz, Func_87cac
	writetext TreeBitstreamText_42b4c
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_87ca3
	startbattle Data_87cb4, Data_87c33
	or a
	jp nz, Func_87c92
	jp Func_87cb2

Func_87c92: ; 87c92 (21:7c92)
	setevent $70
	writetext TreeBitstreamText_42b64
	jp Func_87ca9

Func_87ca3: ; 87ca3 (21:7ca3)
	writetext TreeBitstreamText_42b98
Func_87ca9: ; 87ca9 (21:7ca9)
	jp Func_87cb2

Func_87cac: ; 87cac (21:7cac)
	writetext TreeBitstreamText_42b4c
Func_87cb2: ; 87cb2 (21:7cb2)
	pop bc
	ret

Data_87cb4:
	db "(おんなのこ)", $0

Data_87cbc:
	dr $87cbc, $87ce5

Func_87ce5:
	push af
	ld a, e
	or a
	jp nz, Func_87d3b
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $71
	or a
	jp nz, Func_87d35
	writetext TreeBitstreamText_42bd2
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_87d2c
	startbattle Data_87d3d, Data_87cbc
	or a
	jp nz, Func_87d1b
	jp Func_87d3b

Func_87d1b: ; 87d1b (21:7d1b)
	setevent $71
	writetext TreeBitstreamText_42bdd
	jp Func_87d32

Func_87d2c: ; 87d2c (21:7d2c)
	writetext TreeBitstreamText_42bd2
Func_87d32: ; 87d32 (21:7d32)
	jp Func_87d3b

Func_87d35: ; 87d35 (21:7d35)
	writetext TreeBitstreamText_42bd2
Func_87d3b: ; 87d3b (21:7d3b)
	pop bc
	ret

Data_87d3d:
	db "(しﾞいさん)", $0

Data_87d45:
	dr $87d45, $87d50

Data_87d50: ; 87d50
IF DEF(SUN)
	wildbot $5, $3, $f, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $6, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $5, $3, $f, $6, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC
IF DEF(STAR)
	wildbot $5, $3, $f, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $6, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $5, $3, $f, $6, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_87d7a: ; 87d7a
	dr $87d7a, $87d88

Func_87d88:
	loadwarps $1, Data_87d45
	ld a, $3
	call Func_80d01_21
	loadwilds $3, Data_87d50
	checkevent $0
	or a
	jp nz, Func_87daf
	ld a, $1
	ld [wc7da], a
	jp Func_87db3

Func_87daf: ; 87daf (21:7daf)
	xor a
	ld [wc7da], a
Func_87db3: ; 87db3 (21:7db3)
	loadpeople $1, Data_87d7a
	playmusic SONG_CAVE
	call FadeInMap_21
	landmarksign TreeBitstreamText_46894
	ret

Func_87dca:
	push af
	ld a, e
	or a
	jp nz, Func_87e32
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $51
	or a
	jp nz, Func_87e2c
	writenpctext TreeBitstreamText_3ae6a
	ld a, $b
	call Func_80e5d_21
	cp $1
	jp nz, Func_87e23
	writenpctext TreeBitstreamText_3aea4
	writenpctext_yesorno TreeBitstreamText_3aef1
	or a
	jp nz, Func_87e1a
	ld c, $1
	ld e, $1
	ld a, $b
	call Func_80d4d_21
	setevent $51
	writenpctext TreeBitstreamText_3af20
	jp Func_87e20

Func_87e1a: ; 87e1a (21:7e1a)
	writenpctext TreeBitstreamText_3af00
Func_87e20: ; 87e20 (21:7e20)
	jp Func_87e29

Func_87e23: ; 87e23 (21:7e23)
	writenpctext TreeBitstreamText_3aea4
Func_87e29: ; 87e29 (21:7e29)
	jp Func_87e32

Func_87e2c: ; 87e2c (21:7e2c)
	writenpctext TreeBitstreamText_3af3a
Func_87e32: ; 87e32 (21:7e32)
	pop bc
	ret

Data_87e34:
	dr $87e34, $87e4a

Data_87e4a: ; 87e4a
IF DEF(SUN)
	wildbot $5, $3, $f, $9, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $5, $3, $f, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $f, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $9, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $5, $3, $f, $9, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC
IF DEF(STAR)
	wildbot $5, $3, $f, $9, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $5, $3, $f, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $f, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $9, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $5, $3, $f, $9, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_87e90:
	dr $87e90, $87e94

Data_87e94: ; 87e94
	dr $87e94, $87ea2

Func_87ea2:
	loadwarps $2, Data_87e34
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_87e4a
	checkevent $0
	or a
	jp nz, Func_87ec9
	ld a, $1
	ld [wc7da], a
	jp Func_87ecd

Func_87ec9: ; 87ec9 (21:7ec9)
	xor a
	ld [wc7da], a
Func_87ecd: ; 87ecd (21:7ecd)
	loadpeople $1, Data_87e94
	playmusic SONG_CAVE
	call FadeInMap_21
	landmarksign TreeBitstreamText_46894
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
	dr $92965, $929fc

Data_929fc: ; 929fc
	dr $929fc, $92a28

Data_92a28: ; 92a28
	dr $92a28, $92a2d

Data_92a2d: ; 92a2d
	dr $92a2d, $92a8f

Data_92a8f: ; 92a8f
	dr $92a8f, $92aab

Func_92aab: ; 92aab (24:6aab)
	ld e, $4
	ld hl, Data_929fc
	call LoadWarps_24
	ld e, $1
	ld hl, Data_92a28
	call Func_80ce7_24
	ld a, $3
	call Func_80d01_24
	ld e, $7
	ld hl, Data_92a2d
	call LoadEncounters_24
	ld e, $2
	ld hl, Data_92a8f
	call LoadMapObjects_24
	ld a, $8
	call PlayMusic_24
	call FadeInMap_24
	landmarksign TreeBitstreamText_46cec
	ret

Data_92adf:
	dr $92adf, $92b08

Func_92b08:
	push af
	ld a, e
	or a
	jp nz, Func_92b5e
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_24
	ld hl, $8e
	call CheckEventFlag_24
	or a
	jp nz, Func_92b58
	writetext TreeBitstreamText_42ae8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92b4f
	ld de, Data_92b60
	ld hl, Data_92adf
	call ScriptedBattle_24
	or a
	jp nz, Func_92b3e
	jp Func_92b5e

Func_92b3e: ; 92b3e (24:6b3e)
	ld e, $1
	ld hl, $8e
	call EventFlagAction_24
	writetext TreeBitstreamText_42af6
	jp Func_92b55

Func_92b4f: ; 92b4f (24:6b4f)
	writetext TreeBitstreamText_42ad0
Func_92b55: ; 92b55 (24:6b55)
	jp Func_92b5e

Func_92b58: ; 92b58 (24:6b58)
	ld hl, CheckSFXFinishedPredef
	call PrintTextStandard_24
Func_92b5e: ; 92b5e (24:6b5e)
	pop bc
	ret

Data_92b60:
	db "レテﾞィース", $0

Data_92b67:
	dr $92b67, $92b90

Func_92b90:
	push af
	ld a, e
	or a
	jp nz, Func_92be6
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_24
	ld hl, $8f
	call CheckEventFlag_24
	or a
	jp nz, Func_92be0
	writetext TreeBitstreamText_42b02
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92bd7
	ld de, Data_92be8
	ld hl, Data_92b67
	call ScriptedBattle_24
	or a
	jp nz, Func_92bc6
	jp Func_92be6

Func_92bc6: ; 92bc6 (24:6bc6)
	ld e, $1
	ld hl, $8f
	call EventFlagAction_24
	ld hl, CheckSFXFinishedPredef
	call PrintTextStandard_24
	jp Func_92bdd

Func_92bd7: ; 92bd7 (24:6bd7)
	writetext TreeBitstreamText_42b24
Func_92bdd: ; 92bdd (24:6bdd)
	jp Func_92be6

Func_92be0: ; 92be0 (24:6be0)
	ld hl, CheckSongFinishedPredef
	call PrintTextStandard_24
Func_92be6: ; 92be6 (24:6be6)
	pop bc
	ret

Data_92be8:
	db "ソﾞッキー", $0

Data_92bee:
	dr $92bee, $92c92

Func_92c92: ; 92c92
	dr $92c92, $92e02

Func_92e02: ; 92e02
	dr $92e02, $93097

SECTION "Bank 24, 2", ROMX [$7097], BANK [$24]
CommonYearMonthLengths:
	db 0
	db 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

LeapYearMonthLengths:
	db 0
	db 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

Data_930b1:
	db "Robopon", $0

Func_930b9:
	ld a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank
	ld bc, $7
	ld de, Data_930b1
	ld hl, $a000
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ret

Func_930d2:
	push bc
	ld a, [hSRAMBank]
	push af
	ld hl, sp+$2
	ld [hl], $0
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld c, $0
Func_930e1: ; 930e1 (24:70e1)
	ld a, c
	cp $7
	jp nc, Func_93105
	ld e, c
	ld d, $0
	ld hl, Data_930b1
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $a000
	add hl, de
	cp [hl]
	jp z, Func_93101
	ld hl, sp+$2
	ld [hl], $ff
	jp Func_93105

Func_93101: ; 93101 (24:7101)
	inc c
	jp Func_930e1

Func_93105: ; 93105 (24:7105)
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_9310e:
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $d
	ld e, $14
	ld hl, $0
	call FarCall
	ld e, $1
	ld a, $2
	call SetStringStartState
	ld hl, Data_93224
	push hl
	call PlaceString
	pop bc
	ld e, $3
	ld a, $2
	call SetStringStartState
	ld hl, Data_93235
	push hl
	call PlaceString
	pop bc
	ld e, $5
	ld a, $2
	call SetStringStartState
	ld hl, Data_93240
	push hl
	call PlaceString
	pop bc
	ld e, $7
	ld a, $2
	call SetStringStartState
	ld hl, Data_93256
	push hl
	call PlaceString
	pop bc
	ld e, $9
	ld a, $2
	call SetStringStartState
	ld hl, Data_9325f
	push hl
	call PlaceString
	pop bc
	ld e, $b
	ld a, $2
	call SetStringStartState
	ld hl, Data_93271
	push hl
	call PlaceString
	pop bc
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_93281
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld l, $0
Func_931a2: ; 931a2 (24:71a2)
	push hl
	call NextOverworldFrame
	call CheckButton
	pop hl
	cp $10
	jp nz, Func_931b2
	jp Func_931fc

Func_931b2: ; 931b2 (24:71b2)
	cp $2
	jp nz, Func_931b9
	ld l, $0
Func_931b9: ; 931b9 (24:71b9)
	cp $1
	jp nz, Func_931c0
	ld l, $1
Func_931c0: ; 931c0 (24:71c0)
	push hl
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop hl
	push hl
	inc l
	dec l
	jp nz, Func_931df
	ld hl, $8b
	push hl
	ld hl, Data_93295
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_931ec

Func_931df: ; 931df (24:71df)
	ld hl, $8b
	push hl
	ld hl, Data_932a9
	push hl
	call PlaceString
	pop bc
	pop bc
Func_931ec: ; 931ec (24:71ec)
	ld l, $3
	push hl
	ld c, $14
	ld e, $e
.asm_931f2
	xor a
	call Func_3bc5
	pop bc
	pop hl
	jp Func_931a2

Func_931fc: ; 931fc (24:71fc)
	push hl
	call FillVisibleAreaWithBlankTile
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	xor a
	ld [wc2cd], a
Func_93214: ; 93214 (24:7214)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp z, Func_93221
	jp Func_93214

Func_93221: ; 93221 (24:7221)
	pop hl
	ld a, l
	ret

Data_93224:
	db "カートリッシﾞ(の てﾞんちを)", $0

Data_93235:
	db "(とりかえてね!!)", $0

Data_93240:
	db "(そろそろ てﾞんちかﾞ きれそうてﾞす)", $0

Data_93256:
	db "(ちゅうい!!)", $0

Data_9325f:
	db "ケﾞームホﾞーイ (ほんたい の)", $0

Data_93271:
	db "(てﾞんちてﾞは ありません)", $0

Data_93281:
	db "("
	TX_STACK
	db "とりかえた    とりかえない)", $0

Data_93295:
	db "("
	TX_STACK
	db "とりかえた    とりかえない)", $0

Data_932a9:
	db "( とりかえた   "
	TX_STACK
	db "とりかえない)", $0

Func_932bd:: ; 932bd (24:72bd)
	push hl
	ld a, [wRTCTicker]
	push af
	call GetHLAtSPPlus4
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus4
	ld a, [hl]
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	call Func_93883
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, bc
	push hl
.loop
	ld a, [wRTCTicker]
	cp $1
	jp z, .break
	ld a, [wRTCTicker]
	or a
	jp nz, .delay
	ld a, $1
	ld [wRTCTicker], a
.delay
	call NextOverworldFrame
	jp .loop

.break
	pop hl
	pop bc
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call Func_93d05
	pop af
	or a
	jp z, .loop2
	ld a, [wRTCTicker]
	or a
	jp nz, .loop2
	ld a, $1
	ld [wRTCTicker], a
.loop2
	ld a, [wRTCTicker]
	cp $11
	jp z, .break2
	ld a, [wRTCTicker]
	or a
	jp nz, .delay2
	ld a, $1
	ld [wRTCTicker], a
.delay2
	call NextOverworldFrame
	jp .loop2

.break2
	call NextOverworldFrame
.loop3
	ld a, [wRTCTicker]
	cp $11
	jp z, .break3
	ld a, [wRTCTicker]
	or a
	jp nz, .delay3
	ld a, $1
	ld [wRTCTicker], a
.delay3
	call NextOverworldFrame
	jp .loop3

.break3
	call NextOverworldFrame
	pop bc
	ret

Func_93364: ; 93364 (24:7364)
	read_hl_from wRTCDays
	ret

Func_9336a: ; 9336a (24:736a)
	read_hl_from wc92c
	ret

Func_93370:: ; 93370 (24:7370)
	push hl
	pop hl
	push hl
	reg16swap de, hl
	read_hl_from wRTCDays
	call FixDays
	read_hl_from wMinutesSinceMidnight
	ld de, 60
	call DivideHLByDESigned
	ld a, l
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from wMinutesSinceMidnight
	ld de, 60
	call DivideHLByDESigned
	ld a, e
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ret

Func_933a6:
	push hl
	ld a, [wc92c]
	ld [hl], a
	inc hl
	ld a, [wc92c + 1]
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [wMinutesSinceMidnight]
	ld [hl], a
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [wMinutesSinceMidnight + 1]
	ld [hl], a
	ret

Func_933c1:: ; 933c1 (24:73c1)
	push hl
	push de
	ld hl, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_933d8
	reg16swap de, hl
	ld e, $0
	ld bc, $8
	call FillMemory
Func_933d8: ; 933d8 (24:73d8)
	pop de
	pop hl
	push hl
	ld a, l
	sub $a
	or h
	jp nz, Func_933ea
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, $8
	or [hl]
	ld [hl], a
Func_933ea: ; 933ea (24:73ea)
	ld a, [wRTCTicker]
	reg16swap de, hl
	write_hl_to wc874
	pop hl
	push af
	ld a, l
	add a
	add a
	add a
	add $20
	ld [wc876], a
	ld a, [wc874]
	ld l, a
	ld a, [wc874 + 1]
	ld h, a
	ld a, [wc876]
	ld c, a
	ld b, $8
	ld a, [hSRAMBank]
	push af
	predef Func_7e497
	pop af
	call GetSRAMBank
	pop af
	or a
	jp z, Func_93429
	ld a, [wRTCTicker]
	or a
	jp nz, Func_93429
	ld a, $1
	ld [wRTCTicker], a
Func_93429: ; 93429 (24:7429)
	ret

Func_9342a::
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	read_hl_from_sp_plus $c
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_93468
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	push bc
	ld bc, $8
	read_hl_from_sp_plus $e
	ld e, $0
	call FillMemory
	pop bc
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_935a8
	jp Func_935a5

Func_93468: ; 93468 (24:7468)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wca9c]
	and $2
	push af
	ld a, l
	call GetSRAMBank
	pop af
	or a
	jp z, Func_934b6
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	push bc
	ld bc, $8
	read_hl_from_sp_plus $e
	ld e, $0
	call FillMemory
	pop bc
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_935a8
	jp Func_935a5

Func_934b6: ; 934b6 (24:74b6)
	call Func_9336a
	push hl
	call Func_93364
	push hl
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld c, [hl]
	read_hl_from_sp_plus $10
	ld a, [hl]
	read_hl_from_sp_plus $10
	inc hl
	ld e, [hl]
	call Func_93883
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	add hl, de
	reg16swap de, hl
	push de
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, bc
	reg16swap de, hl
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$4
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	pop de
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$5
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld a, [hl]
	cp $2
	jp nc, Func_9357b
	jp Func_935a5

Func_9357b: ; 9357b (24:757b)
	ld bc, $8
	ld hl, sp+$1
	push hl
	read_hl_from_sp_plus $e
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wc938 - 2 * 8
	add hl, de
	pop de
	call CopyFromDEtoHL
	callba_hli Func_93c0c
Func_935a5: ; 935a5 (24:75a5)
	add sp, $c
	ret

Func_935a8:: ; 935a8 (24:75a8)
	push hl
	push de
	call GetHLAtSPPlus4
	ld de, $2
	call CompareHLtoDE
	jp nc, Func_935b9
	jp Func_9362f

Func_935b9: ; 935b9 (24:75b9)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_935ce
	ld bc, $8
	pop hl
	push hl
	ld e, $0
	call FillMemory
Func_935ce: ; 935ce (24:75ce)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wca9c]
	and $2
	push af
	ld a, l
	call GetSRAMBank
	pop af
	or a
	jp z, Func_935fb
	ld bc, $8
	pop hl
	push hl
	ld e, $0
	call FillMemory
Func_935fb: ; 935fb (24:75fb)
	call GetHLAtSPPlus4
	ld a, l
	sub $a
	or h
	jp nz, Func_9360d
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $8
	or [hl]
	ld [hl], a
Func_9360d: ; 9360d (24:760d)
	ld bc, $8
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wRTCDays - 8
	add hl, de
	pop de
	call CopyFromDEtoHL
	callba_hli Func_93c0c
Func_9362f: ; 9362f (24:762f)
	pop bc
	pop bc
	ret

DaysSince1Jan1924:
	dw   366 ; 1924
	dw   731 ; 1925
	dw  1096 ; 1926
	dw  1461 ; 1927
	dw  1827 ; 1928
	dw  2192 ; 1929
	dw  2557 ; 1930
	dw  2922 ; 1931
	dw  3288 ; 1932
	dw  3653 ; 1933
	dw  4018 ; 1934
	dw  4383 ; 1935
	dw  4749 ; 1936
	dw  5114 ; 1937
	dw  5479 ; 1938
	dw  5844 ; 1939
	dw  6210 ; 1940
	dw  6575 ; 1941
	dw  6940 ; 1942
	dw  7305 ; 1943
	dw  7671 ; 1944
	dw  8036 ; 1945
	dw  8401 ; 1946
	dw  8766 ; 1947
	dw  9132 ; 1948
	dw  9497 ; 1949
	dw  9862 ; 1950
	dw 10227 ; 1951
	dw 10593 ; 1952
	dw 10958 ; 1953
	dw 11323 ; 1954
	dw 11688 ; 1955
	dw 12054 ; 1956
	dw 12419 ; 1957
	dw 12784 ; 1958
	dw 13149 ; 1959
	dw 13515 ; 1960
	dw 13880 ; 1961
	dw 14245 ; 1962
	dw 14610 ; 1963
	dw 14976 ; 1964
	dw 15341 ; 1965
	dw 15706 ; 1966
	dw 16071 ; 1967
	dw 16437 ; 1968
	dw 16802 ; 1969
	dw 17167 ; 1970
	dw 17532 ; 1971
	dw 17898 ; 1972
	dw 18263 ; 1973
	dw 18628 ; 1974
	dw 18993 ; 1975
	dw 19359 ; 1976
	dw 19724 ; 1977
	dw 20089 ; 1978
	dw 20454 ; 1979
	dw 20820 ; 1980
	dw 21185 ; 1981
	dw 21550 ; 1982
	dw 21915 ; 1983
	dw 22281 ; 1984
	dw 22646 ; 1985
	dw 23011 ; 1986
	dw 23376 ; 1987
	dw 23742 ; 1988
	dw 24107 ; 1989
	dw 24472 ; 1990
	dw 24837 ; 1991
	dw 25203 ; 1992
	dw 25568 ; 1993
	dw 25933 ; 1994
	dw 26298 ; 1995
	dw 26664 ; 1996
	dw 27029 ; 1997
	dw 27394 ; 1998
	dw 27759 ; 1999
	dw 28125 ; 2000
	dw 28490 ; 2001
	dw 28855 ; 2002
	dw 29220 ; 2003
	dw 29586 ; 2004
	dw 29951 ; 2005
	dw 30316 ; 2006
	dw 30681 ; 2007
	dw 31047 ; 2008
	dw 31412 ; 2009
	dw 31777 ; 2010
	dw 32142 ; 2011
	dw 32508 ; 2012
	dw 32873 ; 2013
	dw 33238 ; 2014
	dw 33603 ; 2015
	dw 33969 ; 2016
	dw 34334 ; 2017
	dw 34699 ; 2018
	dw 35064 ; 2019
	dw 35430 ; 2020
	dw 35795 ; 2021
	dw 36160 ; 2022
	dw 36525 ; 2023
	dw 36891 ; 2024
	dw 37256 ; 2025
	dw 37621 ; 2026
	dw 37986 ; 2027
	dw 38352 ; 2028
	dw 38717 ; 2029
	dw 39082 ; 2030
	dw 39447 ; 2031
	dw 39813 ; 2032
	dw 40178 ; 2033
	dw 40543 ; 2034
	dw 40908 ; 2035
	dw 41274 ; 2036
	dw 41639 ; 2037
	dw 42004 ; 2038
	dw 42369 ; 2039
	dw 42735 ; 2040
	dw 43100 ; 2041
	dw 43465 ; 2042
	dw 43830 ; 2043
	dw 44196 ; 2044
	dw 44561 ; 2045
	dw 44926 ; 2046
	dw 45291 ; 2047
	dw 45657 ; 2048
	dw 46022 ; 2049
	dw 46387 ; 2050
	dw 46752 ; 2051
	dw 47118 ; 2052
	dw 47483 ; 2053
	dw 47848 ; 2054
	dw 48213 ; 2055
	dw 48579 ; 2056
	dw 48944 ; 2057
	dw 49309 ; 2058
	dw 49674 ; 2059
	dw 50040 ; 2060
	dw 50405 ; 2061
	dw 50770 ; 2062
	dw 51135 ; 2063
	dw 51501 ; 2064
	dw 51866 ; 2065
	dw 52231 ; 2066
	dw 52596 ; 2067
	dw 52962 ; 2068
	dw 53327 ; 2069
	dw 53692 ; 2070
	dw 54057 ; 2071
	dw 54423 ; 2072
	dw 54788 ; 2073
	dw 55153 ; 2074
	dw 55518 ; 2075
	dw 55884 ; 2076
	dw 56249 ; 2077
	dw 56614 ; 2078
	dw 56979 ; 2079
	dw 57345 ; 2080
	dw 57710 ; 2081
	dw 58075 ; 2082
	dw 58440 ; 2083
	dw 58806 ; 2084
	dw 59171 ; 2085
	dw 59536 ; 2086
	dw 59901 ; 2087
	dw 60267 ; 2088
	dw 60632 ; 2089
	dw 60997 ; 2090
	dw 61362 ; 2091
	dw 61728 ; 2092
	dw 62093 ; 2093
	dw 62458 ; 2094
	dw 62823 ; 2095
	dw 63189 ; 2096
	dw 63554 ; 2097
	dw 63919 ; 2098
	dw 64284 ; 2099

FixDays:: ; 93792 (24:7792)
	push hl
	push bc
	push bc
	push de
	call GetHLAtSPPlus8
	ld de, $3c
	add hl, de
	call WriteHLToSPPlus8
	ld hl, sp+$4
	ld [hl], $0
.getYear
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .gotYear
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp .getYear

.gotYear
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, .year_zero
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924 - 2
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus8
.year_zero
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, .not_1924
	ld hl, sp+$3
	ld [hl], $3
	jp .query_leap_year

.not_1924: ; 937f3 (24:77f3)
	ld hl, sp+$3
	ld [hl], $1
.query_leap_year: ; 937f7 (24:77f7)
	; this is queried twice for some reason
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld hl, sp+$2
	ld [hl], a
.loop: ; 93812 (24:7812)
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, .break
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, .common_year
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, LeapYearMonthLengths
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	jp .got_month

.common_year: ; 93833 (24:7833)
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, CommonYearMonthLengths
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
.got_month: ; 93841 (24:7841)
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .break_
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus8
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp .continue

.break_: ; 93861 (24:7861)
	jp .break

.continue: ; 93864 (24:7864)
	jp .loop

.break: ; 93867 (24:7867)
	call GetHLAtSPPlus8
	inc hl
	ld c, l
	pop de
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
	ld hl, sp+$1
	ld a, [hl]
	ld l, e
	ld h, d
	inc hl
	ld [hl], a
	reg16swap de, hl
	inc hl
	inc hl
	ld [hl], c
	pop bc
	pop bc
	pop bc
	ret

Func_93883:: ; 93883 (24:7883)
	push bc
	push bc
	push de
	or a
	jp nz, Func_93893
	ld hl, $0
	call WriteHLToSPPlus6
	jp Func_938a4

Func_93893: ; 93893 (24:7893)
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924 - 2
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	pop af
Func_938a4: ; 938a4 (24:78a4)
	call GetHLAtSPPlus6
	ld de, hFFC4
	add hl, de
	call WriteHLToSPPlus6
	or a
	jp nz, Func_938b7
	ld c, $3
	jp Func_938b9

Func_938b7: ; 938b7 (24:78b7)
	ld c, $1
Func_938b9: ; 938b9 (24:78b9)
	push bc
	ld l, a
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld l, a
	pop bc
	pop de
Func_938c7: ; 938c7 (24:78c7)
	ld a, c
	cp e
	jp nc, Func_93903
	push hl
	push de
	ld a, l
	cp $1
	jp nz, Func_938ea
	push bc
	ld e, c
	ld d, $0
	ld hl, LeapYearMonthLengths
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, bc
	call WriteHLToSPPlus10
	pop bc
	jp Func_938fd

Func_938ea: ; 938ea (24:78ea)
	push bc
	ld e, c
	ld d, $0
	ld hl, CommonYearMonthLengths
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, bc
	call WriteHLToSPPlus10
	pop bc
Func_938fd: ; 938fd (24:78fd)
	inc c
	pop de
	pop hl
	jp Func_938c7

Func_93903: ; 93903 (24:7903)
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, $0
	dec de
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	pop bc
	ret

IsLeapYear: ; 93911 (24:7911)
	push hl
	pop hl
	push hl
	ld de, 4
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_9392c
	pop hl
	push hl
	ld de, 100
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_93939
Func_9392c: ; 9392c (24:792c)
	pop hl
	push hl
	ld de, 400
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_9393e
Func_93939: ; 93939 (24:7939)
	ld a, $1
	jp Func_9393f

Func_9393e: ; 9393e (24:793e)
	xor a
Func_9393f: ; 9393f (24:793f)
	pop bc
	ret

Func_93941:: ; 93941 (24:7941)
	add sp, -$12
	push bc
	push af
	ld hl, sp+$4
	call Func_93370
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, de
	write_hl_to_sp_plus $13
	pop af
	pop bc
	cp $1
	jp nz, Func_939c3
	push af
	ld hl, sp+$c
	ld [hl], $8
	set_farcall_addrs_hli Func_e2829
	ld a, $12
	call FarCall
	cp $1
	jp nz, Func_939ad
	ld hl, $384
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_939a2
	inc bc
Func_939a2: ; 939a2 (24:79a2)
	ld hl, sp+$e
	ld [hl], $3
	ld hl, sp+$d
	ld [hl], $1
	jp Func_939bf

Func_939ad: ; 939ad (24:79ad)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_939bf: ; 939bf (24:79bf)
	pop af
	jp Func_93b08

Func_939c3: ; 939c3 (24:79c3)
	cp $2
	jp nz, Func_93a3d
	push af
	ld hl, sp+$c
	ld [hl], $9
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $7
	call FarCall
	ld hl, sp+$b
	ld [hl], a
	set_farcall_addrs_hli Func_e2829
	ld a, $2
	call FarCall
	cp $1
	jp nz, Func_93a27
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_93a27
	ld hl, $474
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_93a1c
	inc bc
Func_93a1c: ; 93a1c (24:7a1c)
	ld hl, sp+$e
	ld [hl], $7
	ld hl, sp+$d
	ld [hl], $1
	jp Func_93a39

Func_93a27: ; 93a27 (24:7a27)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_93a39: ; 93a39 (24:7a39)
	pop af
	jp Func_93b08

Func_93a3d: ; 93a3d (24:7a3d)
	cp $3
	jp nz, Func_93ab7
	push af
	ld hl, sp+$c
	ld [hl], $a
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $b9
	call FarCall
	ld hl, sp+$b
	ld [hl], a
	set_farcall_addrs_hli Func_e2829
	ld a, $b
	call FarCall
	cp $1
	jp nz, Func_93aa1
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_93aa1
	ld hl, $438
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_93a96
	inc bc
Func_93a96: ; 93a96 (24:7a96)
	ld hl, sp+$e
	ld [hl], $3
	ld hl, sp+$d
	ld [hl], $1
	jp Func_93ab3

Func_93aa1: ; 93aa1 (24:7aa1)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_93ab3: ; 93ab3 (24:7ab3)
	pop af
	jp Func_93b08

Func_93ab7: ; 93ab7 (24:7ab7)
	cp $4
	jp nz, Func_93b08
	push bc
	push af
	ld hl, sp+$e
	ld [hl], $7
	ld hl, sp+$4
	ld a, [wc79e]
	ld [hl], a
	ld hl, sp+$5
	ld a, [wc79f]
	ld [hl], a
	ld hl, sp+$6
	ld a, [wc7a0]
	ld [hl], a
	ld hl, sp+$7
	ld a, [wc7a1]
	ld [hl], a
	ld hl, sp+$8
	ld a, [wc7a2]
	ld [hl], a
	ld hl, sp+$e
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, sp+$a
	ld [hl], $3
	ld hl, sp+$c
	ld [hl], $0
	ld a, [wc79d]
	cp $1
	jp nz, Func_93afd
	ld hl, sp+$b
	ld [hl], $1
	jp Func_93b01

Func_93afd: ; 93afd (24:7afd)
	ld hl, sp+$b
	ld [hl], $0
Func_93b01: ; 93b01 (24:7b01)
	ld hl, sp+$4
	call Func_9342a
	pop af
	pop bc
Func_93b08: ; 93b08 (24:7b08)
	cp $4
	jp z, Func_93b84
	push af
	push bc
	read_hl_from_sp_plus $15
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$4
	ld [hl], e
	read_hl_from_sp_plus $15
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	read_hl_from_sp_plus $15
	ld l, h
	ld h, $0
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop bc
	ld a, c
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	ld l, c
	ld h, b
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$6
	ld [hl], c
	ld hl, sp+$7
	ld [hl], $9
	ld hl, sp+$e
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	pop af
	cp $3
	jp nz, Func_93b76
	ld hl, sp+$3
	ld a, [hl]
	or $8
	ld hl, sp+$3
	ld [hl], a
Func_93b76: ; 93b76 (24:7b76)
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	call Func_935a8
Func_93b84: ; 93b84 (24:7b84)
	add sp, $12
	ret

Func_93b87:: ; 93b87 (24:7b87)
	push bc
	push de
	push hl
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	xor a
	ld [wRTCTicker], a
	predef Func_7e4d2
	jr z, .asm_93bb6
	ld hl, wAttrMapEnd
	xor a
	ld [hl], a
	ld c, $7
	ld b, $1
	predef Func_7e497
	predef Func_7e2fd
	ld bc, $fe00
	add hl, bc
	jr nc, .skip_reset
	call Func_93c08
	or a
	jr nz, .skip_reset
	predef Func_7e2d8
	jr .asm_93bc1

.asm_93bb6
	call Func_93bee
	ld de, $6a89
	ld hl, $0
	jr .asm_93bc1

.asm_93bc1
	ld bc, $0
	predef SetRTCPredef
.skip_reset
	call Func_93be9
	jr z, .asm_93bd9
	call Func_93bee
	ld de, $6a89
	ld hl, $0
	predef Func_7e320
	call Func_93be5
.asm_93bd9
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	pop hl
	pop de
	pop bc
	ret

Func_93be5: ; 93be5 (24:7be5)
	call Func_930b9
	ret

Func_93be9: ; 93be9 (24:7be9)
	call Func_930d2
	or a
	ret

Func_93bee: ; 93bee (24:7bee)
	ld hl, wc770
	ld b, $e0
	xor a
.asm_93bf4
	ld [hli], a
	dec b
	jr nz, .asm_93bf4
	ld hl, wMapMusic + 4
	ld a, $8
	ld [hl], a
	ld hl, wc770
	ld c, $20
	ld b, $e0
	predef Func_7e497
	ret

Func_93c08: ; 93c08 (24:7c08)
	call Func_9310e
	ret

Func_93c0c:: ; 93c0c (24:7c0c)
	push af
	push bc
	push de
	push hl
	ld a, $ff
	ld [wc932], a
	ld [wc932 + 1], a
	ld [wc934], a
	ld [wc934 + 1], a
	ld hl, wc938 + 7
	ld a, $9
Func_93c23: ; 93c23 (24:7c23)
	push af
	push hl
	ld a, [hld]
	or a
	jp z, Func_93cf6
	dec hl
	ld a, [hld]
	bit 3, a
	jr z, .asm_93c64
	ld b, a
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
	ld a, [hld]
	and $7
	ld d, a
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
	ld a, [wc92c + 1]
	ld b, a
	ld a, [wc92c]
	ld c, a
	ld a, [wMinutesSinceMidnight + 1]
	cp d
	jr c, .asm_93cba
	jr nz, .asm_93c61
	ld a, [wMinutesSinceMidnight]
	cp e
	jr c, .asm_93cba
.asm_93c61
	inc bc
	jr .asm_93cba

.asm_93c64
	ld b, a
	ld a, [wc92c + 1]
	cp b
	jr c, .asm_93ca0
	jp nz, Func_93cf6
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
	ld a, [wc92c]
	cp c
	jr c, .asm_93cab
	jr nz, Func_93cf6
	ld a, [hld]
	and $7
	ld d, a
	ld a, [wMinutesSinceMidnight + 1]
	cp d
	jr c, .asm_93caf
	jr nz, Func_93cf6
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
	ld a, [wMinutesSinceMidnight]
	cp e
	jr c, .asm_93cba
	jr Func_93cf6

.asm_93ca0
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
.asm_93cab
	ld a, [hld]
	and $7
	ld d, a
.asm_93caf
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
.asm_93cba
	ld a, [wc932 + 1]
	cp b
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc932]
	cp c
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc934 + 1]
	cp d
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc934]
	cp e
	jr c, Func_93cf6
	jr z, Func_93cf6
.asm_93cda
	ld a, c
	ld [wc932], a
	ld a, b
	ld [wc932 + 1], a
	ld a, e
	ld [wc934], a
	ld a, d
	ld [wc934 + 1], a
	ld de, $7
	add hl, de
	ld a, [hli]
	ld [wc936], a
	ld a, [hli]
	ld [wc936 + 1], a
Func_93cf6: ; 93cf6 (24:7cf6)
	pop hl
	pop af
	ld bc, $8
	add hl, bc
	dec a
	jp nz, Func_93c23
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_93d05: ; 93d05 (24:7d05)
	push bc
	push de
	push hl
	call SuppressVBlankCallback
	push bc
	reg16swap hl, de
	ld a, [hSRAMBank]
	push af
	push af
	push bc
	push de
	push hl
	predef Func_7e320
	call NextOverworldFrame
	call NextOverworldFrame
	call NextOverworldFrame
	pop hl
	pop de
	pop bc
	pop af
	predef Func_7e320
	pop af
	call GetSRAMBank
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop hl
	pop de
	pop bc
	ret

SECTION "Bank 25", ROMX, BANK [$25]
	lib_bank_20 25

Data_950b4:
	dr $950b4, $951a3

Func_951a3: ; 951a3
	dr $951a3, $957b0

Func_957b0: ; 957b0
	dr $957b0, $95817

Func_95817: ; 95817
	dr $95817, $95828

Data_95828: ; 95828
	dr $95828, $95833

Data_95833: ; 95833
	dr $95833, $95844

Data_95844: ; 95844
	dr $95844, $9587c

Data_9587c: ; 9587c
	dr $9587c, $958c2

Func_958c2: ; 958c2 (25:58c2)
	call Func_9596a
	ld hl, Func_9596a
	call Func_80f11_25
	loadwarps 1, Data_95828
	ld e, $1
	ld hl, Data_95833
	call Func_80ce7_25
	playmusic $c
	checkevent $f
	or a
	jp nz, Func_9590a
	loadpeople 4, Data_95844
	hideperson $1
	call FadeInMap_25
	call Func_959a9
	setevent $f
	jp Func_95957

Func_9590a: ; 9590a (25:590a)
	ld a, [wc78c]
	cp $a
	jp c, Func_95935
	loadpeople 5, Data_9587c
	ld c, $6
	ld e, $9
	xor a
	call Func_80080_25
	ld e, $2
	xor a
	call SpriteFace_25
	hideperson $1
	call FadeInMap_25
	jp Func_95957

Func_95935: ; 95935 (25:5935)
	loadpeople 5, Data_9587c
	ld c, $0
	ld e, $0
	ld a, $1
	call Func_80080_25
	hideperson $1
	hideperson $4
	call FadeInMap_25
Func_95957: ; 95957 (25:5957)
	ret

Data_95958:
	dr $95958, $9595e

Data_9595e: ; 9595e
	dr $9595e, $95964

Data_95964: ; 95964
	dr $95964, $9596a

Func_9596a: ; 9596a (25:596a)
	ld a, [wc78c]
	cp $a
	jp nc, Func_9597e
	ld hl, Data_95964
	call Func_80d9b_25
	call Func_80f02_25
	jp Func_95998

Func_9597e: ; 9597e (25:597e)
	checkevent $5b
	cp $1
	jp nz, Func_95998
	ld hl, Data_95958
	call Func_80d9b_25
	ld hl, Data_9595e
	call Func_80d9b_25
	call Func_80f02_25
Func_95998: ; 95998 (25:5998)
	ret

Data_95999:
	dr $95999, $9599d

Data_9599d: ; 9599d
	dr $9599d, $959a1

Data_959a1: ; 959a1
	dr $959a1, $959a5

Data_959a5: ; 959a5
	dr $959a5, $959a9

Func_959a9: ; 959a9 (25:59a9)
	ld bc, Data_95999
	ld e, BANK(Data_95999)
	xor a
	call MovePerson_25
	ld c, $1
	ld de, Data_9599d
	ld a, BANK(Data_9599d)
	call MovePlayer_25
	playsfx $31
	loademote $1, $2, $c
	call WaitEmote_25
	ld hl, $1e
	call ScriptSleep_25
	ld a, STARTER + 1
	call GetRobotSprite_25
	ld e, a
	ld a, $1
	call ChangeSprite_25
	ld e, $2
	ld a, $1
	call SpriteFace_25
	showperson $1
	ld bc, Data_959a1
	ld e, BANK(Data_959a1)
	ld a, $1
	call Func_80688_25
	call WaitNPCStep_25
	playsfx $31
	loademote $1, $4, $c
	call WaitEmote_25
	call HideEmote_25
	ld e, $1
	xor a
	call SpriteFace_25
	writenpctext TreeBitstreamText_3926c
	ld bc, Data_959a5
	ld e, BANK(Data_959a5)
	ld a, $1
	call MovePerson_25
	call WaitNPCStep_25
	hideperson $1
	playsfx $2a
	xor a
	call PlayMusic_25
	playmusic $19
	ld hl, $b4
	call ScriptSleep_25
	xor a
	call PlayMusic_25
	playmusic $c
IF DEF(SUN)
	writetext TreeBitstreamText_39295
ENDC
IF DEF(STAR)
	writetext TreeBitstreamText_392a8
ENDC
	ld a, $3
	call PlayerFace_25
	writenpctext TreeBitstreamText_392ba
	playsfx $2a
	writetext TreeBitstreamText_39321
	ld a, [wc78c]
	cp $a
	jp nc, Func_95a7f
	checkevent $63
	cp $1
	jp nz, Func_95a7f
	writenpctext TreeBitstreamText_3933b
Func_95a7f: ; 95a7f (25:5a7f)
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, 1000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wc793]
	cp $3
	jp nz, Func_95aa4
	ld c, $4
	ld e, $0
	ld a, SUNNY + 1
	call GiveRobot_25
	jp Func_95ab2

Func_95aa4: ; 95aa4 (25:5aa4)
	ld c, $5
	ld e, $0
	ld a, STARTER + 1
	call GiveRobot_25
	ld a, $28
	call Func_810a3_25
Func_95ab2: ; 95ab2 (25:5ab2)
	ret

Data_95ab3:
	dr $95ab3, $95ab9

Func_95ab9:
	ld a, e
	or a
	jp nz, Func_95c0b
	checkevent $f3
	cp $1
	jp nz, Func_95b02
	checkevent $f5
	or a
	jp nz, Func_95b02
	xor a
	call FacePlayer_25
	writenpctext TreeBitstreamText_39559
	playsfx $2a
	writetext TreeBitstreamText_395a3
	ld c, $0
	ld e, $1
	ld a, $1b
	call Func_80d4d_25
	writenpctext TreeBitstreamText_395b4
	setevent $f5
	jp Func_95c0b

Func_95b02: ; 95b02 (25:5b02)
	checkevent $f4
	cp $1
	jp nz, Func_95b40
	checkevent $f6
	or a
	jp nz, Func_95b40
	xor a
	call FacePlayer_25
	ld hl, CopyFromDEtoHL
	call PrintTextWithNPCName_25
	playsfx $2a
	writetext TreeBitstreamText_3968a
	ld c, $0
	ld e, $1
	ld a, $1a
	call Func_80d4d_25
	setevent $f6
	jp Func_95c0b

Func_95b40: ; 95b40 (25:5b40)
	ld a, [wc78c]
	cp $14
	jp nz, Func_95b81
	checkevent $e7
	or a
	jp nz, Func_95b81
	xor a
	call FacePlayer_25
	writenpctext TreeBitstreamText_3949f
	playsfx $2a
	writetext TreeBitstreamText_39545
	ld c, $1e
	ld e, $0
	ld a, $16
	call GiveRobot_25
	setevent $e7
	ld e, $2
	xor a
	call SpriteFace_25
	jp Func_95c0b

Func_95b81: ; 95b81 (25:5b81)
	ld a, [wc78c]
	cp $a
	jp c, Func_95bdb
	ld a, [wPlayerFacing]
	cp $2
	jp z, Func_95b96
	cp $1
	jp nz, Func_95ba4
Func_95b96: ; 95b96 (25:5b96)
	ld c, $1
	ld de, Data_95ab3
	ld a, BANK(Data_95ab3)
	call MovePlayer_25
	xor a
	call PlayerFace_25
Func_95ba4: ; 95ba4 (25:5ba4)
	ld e, $2
	xor a
	call SpriteFace_25
	checkevent $c4
	or a
	jp nz, Func_95bc2
	writenpctext TreeBitstreamText_393e9
	setevent $c4
Func_95bc2: ; 95bc2 (25:5bc2)
	writenpctext_yesorno TreeBitstreamText_3945b
	or a
	jp nz, Func_95bd2
	call Func_80479_25
	jp Func_95bd8

Func_95bd2: ; 95bd2 (25:5bd2)
	writenpctext TreeBitstreamText_39471
Func_95bd8: ; 95bd8 (25:5bd8)
	jp Func_95c0b

Func_95bdb: ; 95bdb (25:5bdb)
	xor a
	call FacePlayer_25
	heal
	xor a
	call PlayMusic_25
	playmusic SONG_HEAL
	loademote $1, $2, $8
	call WaitEmote_25
	call HideEmote_25
	writetext TreeBitstreamText_46e0b
	writenpctext TreeBitstreamText_39369
	playmusic SONG_CENTER
Func_95c0b: ; 95c0b (25:5c0b)
	ret

Data_95c0c:
	dr $95c0c, $95c14

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
	dr $9a173, $9a1aa

Func_9a1aa: ; 9a1aa
	dr $9a1aa, $9a1bb

LandmarkSign: ; 9a1bb (26:61bb)
	push hl
	add sp, -$40
	ld hl, sp+$40
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3f
	ld hl, -1
	write_hl_to_sp_plus $41
	ld a, $3
	ld [wc39a], a
	call Func_9a377
	call Func_9a391
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, sp+$3d
	call PrintCharacterFromTree
	ld hl, sp+$1
	call Func_292b
	add $2
	ld l, a
	push hl
	ld a, $14
	sub l
	ld b, $2
	call DivideAbyB
	push af
	ld a, $2
	ld [wc39a], a
	set_farcall_addrs_hli Func_da901
	pop af
	pop hl
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	inc hl
	call FarCall
	push hl
	ld c, $5
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	ld hl, sp+$4
	ld [hl], $0
Func_9a236: ; 9a236 (26:6236)
	ld hl, sp+$4
	ld a, [hl]
	cp $3c
	jp nc, Func_9a25d
	call NextOverworldFrame
	ld hl, sp+$4
	ld a, [hl]
	cp $10
	jp c, Func_9a253
	call GetJoyPressed
	or a
	jp z, Func_9a253
	jp Func_9a25d

Func_9a253: ; 9a253 (26:6253)
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp Func_9a236

Func_9a25d: ; 9a25d (26:625d)
	callba_hli Func_8f44
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	add sp, $42
	ret

Func_9a28c: ; 9a28c (26:628c)
	push hl
	add sp, -$3e
	ld a, $3
	ld [wc39a], a
	call Func_9a377
	call Func_9a391
	ld de, Data_9a36c
	ld hl, sp+$1
	call CopyUntilNull
	ld hl, sp+$0
	ld [hl], $0
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2bc
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a2e4
Func_9a2bc: ; 9a2bc (26:62bc)
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$5
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a2e4: ; 9a2e4 (26:62e4)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2fa
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a322
Func_9a2fa: ; 9a2fa (26:62fa)
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a322: ; 9a322 (26:6322)
	read_hl_from_sp_plus $40
	ld de, $30
	add hl, de
	ld e, l
	ld hl, sp+$7
	ld [hl], e
	ld c, $5
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	xor a
Func_9a33e: ; 9a33e (26:633e)
	cp $3c
	jp nc, Func_9a34c
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_9a33e

Func_9a34c: ; 9a34c (26:634c)
	callba_hli Func_8f44
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	add sp, $40
	ret

Data_9a36c:
	db "(ちか   0かい)", $0

Func_9a377: ; 9a377 (26:6377)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ret

Func_9a384:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Func_9a391: ; 9a391 (26:6391)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

CheckObjectsOccupyingSameTile: ; 9a39e (26:639e)
	push af
	push de
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld a, $1
	jp Func_9a41a

Func_9a419: ; 9a419 (26:6419)
	xor a
Func_9a41a: ; 9a41a (26:641a)
	pop bc
	pop bc
	ret

Func_9a41d:: ; 9a41d
	dr $9a41d, $9a5f6

Data_9a5f6: ; 9a5f6
	dr $9a5f6, $9a618

Data_9a618: ; 9a618
	dr $9a618, $9a623

Data_9a623: ; 9a623
	dr $9a623, $9a645

Data_9a645: ; 9a645
	dr $9a645, $9a650

Data_9a650: ; 9a650
	dr $9a650, $9a672

Data_9a672: ; 9a672
REPT 11
	db $0
ENDR

Data_9a67d: ; 9a67d
	dr $9a67d, $9a69f

Data_9a69f: ; 9a69f
REPT 11
	db $0
ENDR

LoadEmote:: ; 9a6aa (26:66aa)
	push af
	push de
	push bc
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a6c7
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a6c7: ; 9a6c7 (26:66c7)
	pop bc
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $22
	jp nc, Func_9a780
	push de
	push bc
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a5f6
	add hl, de
	ld c, [hl]
	ld de, Emotes_c4000
	ld a, BANK(Emotes_c4000)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a623
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_c5b26
	ld a, BANK(EmoteAttrs_c5b26)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp Func_9a771

Func_9a75a: ; 9a75a (26:675a)
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld e, [hl]
	call MoveEmote
Func_9a771: ; 9a771 (26:6771)
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
	jp Func_9a834

Func_9a780: ; 9a780 (26:6780)
	push de
	push bc
	ld hl, sp+$5
	ld a, [hl]
	add -$21
	ld hl, sp+$5
	ld [hl], a
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a618
	add hl, de
	ld c, [hl]
	ld de, Emotes_b2418
	ld a, BANK(Emotes_b2418)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a645
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_b3607
	ld a, BANK(EmoteAttrs_b3607)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp .done_show_emote

.not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld e, [hl]
	call MoveEmote
.done_show_emote
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
Func_9a834: ; 9a834 (26:6834)
	ld hl, sp+$1
	ld a, [hl]
	cp $c
	jp z, Func_9a844
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp nz, Func_9a848
Func_9a844: ; 9a844 (26:6844)
	xor a
	ld [wc85a], a
Func_9a848: ; 9a848 (26:6848)
	pop bc
	ret

Func_9a84a:: ; 9a84a (26:684a)
	call NextOverworldFrame
	set_farcall_addrs_hli UpdateSprites
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call FarCall
	cp $1
	jp z, Func_9a86a
	jp Func_9a87b

Func_9a86a: ; 9a86a (26:686a)
	callba_hli HandleNPCStep
	jp Func_9a84a

Func_9a87b: ; 9a87b (26:687b)
	ret

Func_9a87c:: ; 9a87c (26:687c)
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a896
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a896: ; 9a896 (26:6896)
	ret

MoveEmote: ; 9a897
	add -5
	ld [wc832], a
	ld a, e
	add -4
	ld [wc833], a
	callba_hli MoveEmote_
	ret

Func_9a8b1:
	ld [wc834], a
	ld a, e
	ld [wc835], a
	ld a, c
	ld [wc836], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wc837], a
	ret

Func_9a8c3:: ; 9a8c3
	dr $9a8c3, $9ace0

Func_9ace0: ; 9ace0
	dr $9ace0, $9b251

Func_9b251:: ; 9b251
	dr $9b251, $9b262

Func_9b262: ; 9b262 (26:7262)
	ld [wc785], a
	reg16swap de, hl
	write_hl_to wc786
	ld a, c
	ld [wc788], a
	call Func_9b276
	ret

Func_9b276: ; 9b276 (26:7276)
	push bc
	push bc
	push bc
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b286
	jp Func_9b322

Func_9b286: ; 9b286 (26:7286)
	ld e, $0
Func_9b288: ; 9b288 (26:7288)
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b314
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b30f
	ld hl, sp+$6
	ld a, [hl]
	and $10
	jp nz, Func_9b30f
	ld a, [wc859]
	or a
	jp z, Func_9b30f
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
Func_9b30f: ; 9b30f (26:730f)
	pop de
	inc e
	jp Func_9b288

Func_9b314: ; 9b314 (26:7314)
	callba_hli Func_8f44
Func_9b322: ; 9b322 (26:7322)
	pop bc
	pop bc
	pop bc
	ret

Func_9b326:: ; 9b326 (26:7326)
	add sp, -$4a
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b335
	jp Func_9b72f

Func_9b335: ; 9b335 (26:7335)
	ld e, $0
Func_9b337: ; 9b337 (26:7337)
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b72f
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$45
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$4a
	ld [hl], a
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b38c
	jp Func_9b72a

Func_9b38c: ; 9b38c (26:738c)
	ld hl, sp+$44
	ld a, [wPlayerMapX]
	ld [hl], a
	ld a, [wPlayerMapY]
	ld e, a
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b3cd
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_9b3c6
	cp $2
	jp z, Func_9b3c2
	cp $1
	jp z, Func_9b3b8
	or a
	jp nz, Func_9b3cd
	dec e
	jp Func_9b3cd

Func_9b3b8: ; 9b3b8 (26:73b8)
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	jp Func_9b3cd

Func_9b3c2: ; 9b3c2 (26:73c2)
	inc e
	jp Func_9b3cd

Func_9b3c6: ; 9b3c6 (26:73c6)
	ld hl, sp+$44
	ld a, [hl]
	dec a
	ld hl, sp+$44
	ld [hl], a
Func_9b3cd: ; 9b3cd (26:73cd)
	ld hl, sp+$46
	ld a, [hl]
	ld hl, sp+$44
	cp [hl]
	jp nz, Func_9b72a
	ld hl, sp+$47
	ld a, [hl]
	cp e
	jp nz, Func_9b72a
	ld hl, sp+$4a
	ld a, [hl]
	cp $31
	jp z, Func_9b403
	cp $28
	jp z, Func_9b403
	cp $24
	jp z, Func_9b403
	cp $22
	jp z, Func_9b403
	cp $1d
	jp z, Func_9b403
	cp $1c
	jp z, Func_9b403
	cp $1a
	jp nz, Func_9b44d
Func_9b403: ; 9b403 (26:7403)
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	set_farcall_addrs_hli DrawTextBoxAndOverworldText
	ld c, $0
	ld e, $c
	ld hl, $69
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	jp Func_9b72a

Func_9b44d: ; 9b44d (26:744d)
	push de
	ld a, $3
	ld [wc39a], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4c
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b4c2
	cp $2
	jp z, Func_9b49f
	cp $1
	jp nz, Func_9b4e1
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli Func_15ad6
	pop af
	ld hl, sp+$2a
	push hl
	ld l, a
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	ld c, $a
	call FarCall
	jp Func_9b4e1

Func_9b49f: ; 9b49f (26:749f)
	ld hl, sp+$4d
	ld a, [hl]
	push af
	set_farcall_addrs_hli Func_15ad6
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	inc h
	inc h
	ld c, $8
	call FarCall
	jp Func_9b4e1

Func_9b4c2: ; 9b4c2 (26:74c2)
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli Func_15ad6
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld c, $5
	call FarCall
Func_9b4e1: ; 9b4e1 (26:74e1)
	pop af
	call GetSRAMBank
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b557
	ld a, [wc859]
	or a
	jp z, Func_9b554
	push de
	ld a, $31
	call OverworldPlaySFX
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
	callba_hli Func_8f44
	pop de
Func_9b554: ; 9b554 (26:7554)
	jp Func_9b55e

Func_9b557: ; 9b557 (26:7557)
	push de
	ld a, $2a
	call OverworldPlaySFX
	pop de
Func_9b55e: ; 9b55e (26:755e)
	push de
	ld hl, sp+$28
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	dec hl
	ld de, $7732
	call CopyUntilNull
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
	ld a, $1
	ld [wc39a], a
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
	ld [wc39a], a
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
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	ld hl, sp+$4a
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b652
	cp $2
	jp z, Func_9b639
	cp $1
	jp nz, Func_9b668
	set_farcall_addrs_hli Func_5a0e0
	ld c, $0
	ld e, $1
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b639: ; 9b639 (26:7639)
	set_farcall_addrs_hli Func_6af0d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b652: ; 9b652 (26:7652)
	set_farcall_addrs_hli Func_4ed5d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
Func_9b668: ; 9b668 (26:7668)
	pop de
	ld hl, sp+$3
	ld a, [hl]
	cp $ff
	jp nz, Func_9b70c
	push de
	ld de, $773a
	ld hl, sp+$a
	call CopyUntilNull
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
	ld a, $2
	ld [wc39a], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b6fb
	ld a, [wc859]
	or a
	jp z, Func_9b6fb
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$44
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
Func_9b6fb: ; 9b6fb (26:76fb)
	callba_hli Func_8f44
	jp Func_9b72a

Func_9b70c: ; 9b70c (26:770c)
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	push af
	ld hl, sp+$4c
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	pop af
	or [hl]
	ld [hl], a
Func_9b72a: ; 9b72a (26:772a)
	pop de
	inc e
	jp Func_9b337

Func_9b72f: ; 9b72f (26:772f)
	add sp, $4a
	ret

Data_9b732:
	db "(をみつけた)", $0

Data_9b73a:
	db "(これいしﾞょう ひろえない)", $0

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
	dr $b138f, $b2418

Emotes_b2418: ; b2418
	dw $0, $0
	emote_header Emotes_b2418, GFX_b2440, $3e2
	emote_header Emotes_b2418, GFX_b2720, $3f2
	emote_header Emotes_b2418, GFX_b2a29, $332
	emote_header Emotes_b2418, GFX_b2b7a, $342
	emote_header Emotes_b2418, GFX_b2d1b, $382
	emote_header Emotes_b2418, GFX_b2f5c, $3e2
	emote_header Emotes_b2418, GFX_b31f3, $202
	emote_header Emotes_b2418, GFX_b32dd, $1f2
	emote_header Emotes_b2418, GFX_b348c, $222

GFX_b2440:: INCBIN "gfx/emotes/emote_b2440.emote.rz"
GFX_b2720:: INCBIN "gfx/emotes/emote_b2720.emote.rz"
GFX_b2a29:: INCBIN "gfx/emotes/emote_b2a29.emote.rz"
GFX_b2b7a:: INCBIN "gfx/emotes/emote_b2b7a.emote.rz"
GFX_b2d1b:: INCBIN "gfx/emotes/emote_b2d1b.emote.rz"
GFX_b2f5c:: INCBIN "gfx/emotes/emote_b2f5c.emote.rz"
GFX_b31f3:: INCBIN "gfx/emotes/emote_b31f3.emote.rz"
GFX_b32dd:: INCBIN "gfx/emotes/emote_b32dd.emote.rz"
GFX_b348c:: INCBIN "gfx/emotes/emote_b348c.emote.rz"

EmoteAttrs_b3607: ; b3607
	dw $0, $0
	emote_header EmoteAttrs_b3607, Data_b3633, $367
	emote_header EmoteAttrs_b3607, Data_b376f, $352
	emote_header EmoteAttrs_b3607, Data_b3884, $8f8
	emote_header EmoteAttrs_b3607, Data_b39da, $b25
	emote_header EmoteAttrs_b3607, Data_b3c0b, $278
	emote_header EmoteAttrs_b3607, Data_b3cd5, $ac
	emote_header EmoteAttrs_b3607, Data_b3d24, $2f9
	emote_header EmoteAttrs_b3607, Data_b3e2b, $148
	emote_header EmoteAttrs_b3607, Data_b3ecb, $111
	emote_header EmoteAttrs_b3607, Data_b3f35, $18c

Data_b3633: INCBIN "gfx/emotes/emote_b3633.emoteattrs.rz" ; b3633
Data_b376f: INCBIN "gfx/emotes/emote_b376f.emoteattrs.rz" ; b376f
Data_b3884: INCBIN "gfx/emotes/emote_b3884.emoteattrs.rz" ; b3884
Data_b39da: INCBIN "gfx/emotes/emote_b39da.emoteattrs.rz" ; b39da
Data_b3c0b: INCBIN "gfx/emotes/emote_b3c0b.emoteattrs.rz" ; b3c0b
Data_b3cd5: INCBIN "gfx/emotes/emote_b3cd5.emoteattrs.rz" ; b3cd5
Data_b3d24: INCBIN "gfx/emotes/emote_b3d24.emoteattrs.rz" ; b3d24
Data_b3e2b: INCBIN "gfx/emotes/emote_b3e2b.emoteattrs.rz" ; b3e2b
Data_b3ecb: INCBIN "gfx/emotes/emote_b3ecb.emoteattrs.rz" ; b3ecb
Data_b3f35: INCBIN "gfx/emotes/emote_b3f35.emoteattrs.rz" ; b3f35

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
	dr $b5fbe, $b6757

SECTION "Bank 2d, 2", ROMX [$6757], BANK [$2d]
	lib_bank_20 2d_2

Data_b780b:
	dr $b780b, $b790a

Func_b790a: ; b790a
	dr $b790a, $b79f8

Func_b79f8: ; b79f8
	dr $b79f8, $b7a13

Data_b7a13: ; b7a13
	dr $b7a13, $b7a1e

Data_b7a1e: ; b7a1e
	dr $b7a1e, $b7a64

Func_b7a64: ; b7a64 (2d:7a64)
	loadwarps 1, Data_b7a13
	loadpeople 5, Data_b7a1e
	playmusic $13
	hideperson $2
	hideperson $3
	hideperson $4
	checkevent $1b
	or a
	jp nz, Func_b7abb
	hideperson $2
	hideperson $3
	hideperson $4
	playmusic $13
	call FadeInMap_2d_2
	call Func_b7b62
	jp Func_b7ae2

Func_b7abb: ; b7abb (2d:7abb)
	checkevent $1c
	or a
	jp nz, Func_b7ad3
	playmusic $13
	call FadeInMap_2d_2
	call Func_b7d97
	jp Func_b7ae2

Func_b7ad3: ; b7ad3 (2d:7ad3)
	xor a
	call PlayerFace_2d_2
	playmusic $13
	call FadeInMap_2d_2
	call Func_b7df7
Func_b7ae2: ; b7ae2 (2d:7ae2)
	ret

Data_b7ae3:
	dr $b7ae3, $b7b0c

Data_b7b0c: ; b7b0c
	dr $b7b0c, $b7b35

Data_b7b35: ; b7b35
	dr $b7b35, $b7b5e

Data_b7b5e: ; b7b5e
	dr $b7b5e, $b7b62

Func_b7b62: ; b7b62 (2d:7b62)
	move_player $1, Data_b7b5e
	writenpctext TreeBitstreamText_3dd0b
	playsfx $5a
	showperson $2
	ld e, $2
	ld a, $2
	call SpriteFace_2d_2
	ld e, $3
	ld a, $2
	call SpriteFace_2d_2
	ld e, $0
	ld a, $2
	call SpriteFace_2d_2
	ld e, $1
	ld a, $2
	call SpriteFace_2d_2
	ld e, $2
	ld a, $2
	call SpriteFace_2d_2
	ld e, $3
	ld a, $2
	call SpriteFace_2d_2
	ld e, $0
	ld a, $2
	call SpriteFace_2d_2
	ld e, $1
	ld a, $2
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	playsfx $5b
	showperson $3
	ld e, $1
	ld a, $3
	call SpriteFace_2d_2
	ld e, $2
	ld a, $3
	call SpriteFace_2d_2
	ld e, $3
	ld a, $3
	call SpriteFace_2d_2
	ld e, $0
	ld a, $3
	call SpriteFace_2d_2
	ld e, $1
	ld a, $3
	call SpriteFace_2d_2
	ld e, $2
	ld a, $3
	call SpriteFace_2d_2
	ld e, $3
	ld a, $3
	call SpriteFace_2d_2
	ld e, $0
	ld a, $3
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	playsfx $66
	showperson $4
	ld e, $0
	ld a, $4
	call SpriteFace_2d_2
	ld e, $1
	ld a, $4
	call SpriteFace_2d_2
	ld e, $2
	ld a, $4
	call SpriteFace_2d_2
	ld e, $3
	ld a, $4
	call SpriteFace_2d_2
	ld e, $0
	ld a, $4
	call SpriteFace_2d_2
	ld e, $1
	ld a, $4
	call SpriteFace_2d_2
	ld e, $2
	ld a, $4
	call SpriteFace_2d_2
	ld e, $3
	ld a, $4
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $3
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d76
	ld hl, Data_b7ae3
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7c69
	ret

Func_b7c69: ; b7c69 (2d:7c69)
	loademote $1, $1, $a
	ld e, $a
	ld a, $8
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $2
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d7b
	ld hl, Data_b7b0c
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7caa
	ret

Func_b7caa: ; b7caa (2d:7caa)
	loademote $1, $1, $a
	ld e, $b
	ld a, $9
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $3
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $1
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d80
	ld hl, Data_b7b35
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7ceb
	ret

Func_b7ceb: ; b7ceb (2d:7ceb)
	loademote $1, $1, $a
	ld e, $a
	ld a, $a
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $4
	ld hl, $1e
	call ScriptSleep_2d_2
	xor a
	call PlayerFace_2d_2
	ld hl, $3c
	call ScriptSleep_2d_2
	writenpctext TreeBitstreamText_3de23
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	call MoveEmote_2d_2
	playsfx $28
	call WaitEmote_2d_2
	call HideEmote_2d_2
	playsfx $35
	loademote $1, $1, $1b
	playsfx $37
	xor a
	call Func_80653_2d_2
	call WaitEmote_2d_2
	call HideEmote_2d_2
	setevent $1b
	ld a, $f
	call Func_80c94_2d_2
	ld l, $4
	push hl
	ld c, $7
	ld e, $0
	ld a, $1f
	call Func_80dff_2d_2
	pop bc
	ret

Data_b7d76: ; b7d76
	dr $b7d76, $b7d7b

Data_b7d7b: ; b7d7b
	dr $b7d7b, $b7d80

Data_b7d80: ; b7d80
	dr $b7d80, $b7d85

Data_b7d85: ; b7d85
	dr $b7d85, $b7d89

Data_b7d89: ; b7d89
	dr $b7d89, $b7d97

Func_b7d97: ; b7d97 (2d:7d97)
	move_player $1, Data_b7d85
	writenpctext_yesorno TreeBitstreamText_3de8e
	or a
	jp nz, Func_b7db4
	writenpctext TreeBitstreamText_3df08
	jp Func_b7dba

Func_b7db4: ; b7db4 (2d:7db4)
	writenpctext TreeBitstreamText_3dfb9
Func_b7dba: ; b7dba (2d:7dba)
	setevent $1c
	ld a, $a
	call FadeOutAudio_2d_2
	xor a
	call PlayMusic_2d_2
	xor a
	call FadeInAudio_2d_2
	call StartShakingScreen_2d_2
	playsfx $65
	move_player $1, Data_b7d89
	playsfx $65
	call StopShakingScreen_2d_2
	ld l, $f
	push hl
	ld c, $7
	ld e, $a
	ld a, $20
	call Func_80dff_2d_2
	pop bc
	ret

Func_b7df7: ; b7df7 (2d:7df7)
	call StopShakingScreen_2d_2
	ld hl, $3c
	call ScriptSleep_2d_2
	writenpctext TreeBitstreamText_3e04a
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	call MoveEmote_2d_2
	playsfx $28
	call WaitEmote_2d_2
	call HideEmote_2d_2
	xor a
	call Func_80653_2d_2
	loademote $1, $1, $1b
	playsfx $37
	call WaitEmote_2d_2
	call HideEmote_2d_2
	ld l, $b
	push hl
	ld c, $9
	ld e, $4
	ld a, $1e
	call Func_80dff_2d_2
	pop bc
	ret

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
	dr $cba6d, $cbb5f

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
	dr $ceacc, $cedca

Data_cedca: ; cedca
	dr $cedca, $cedd5

Data_cedd5:
	dr $cedd5, $cee59

Data_cee59: ; cee59
	dr $cee59, $cee9f

Data_cee9f: ; cee9f
	dr $cee9f, $ceee5

Data_ceee5: ; ceee5
	dr $ceee5, $cef2b

Data_cef2b: ; cef2b
	dr $cef2b, $cef71

Data_cef71: ; cef71
	dr $cef71, $cefb7

Data_cefb7: ; cefb7
	dr $cefb7, $ceffd

Data_ceffd: ; ceffd
	dr $ceffd, $cf043

Data_cf043: ; cf043
	dr $cf043, $cf089

Data_cf089: ; cf089
	dr $cf089, $cf0cf

Data_cf0cf: ; cf0cf
	dr $cf0cf, $cf14d

Func_cf14d: ; cf14d (33:714d)
	ld a, [wc798]
	or a
	jp nz, Func_cf163
	ld a, $3
	call Random_33
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_cf163: ; cf163 (33:7163)
	ld a, [wc7de]
	cp $32
	jp nz, Func_cf173
	ld e, $1
	ld hl, $61
	call EventFlagAction_33
Func_cf173: ; cf173 (33:7173)
	ld a, $2
	call Func_80d01_33
	ld a, [wc7de]
	cp $2d
	jp z, Func_cf2b4
	cp $2c
	jp z, Func_cf2b4
	cp $2b
	jp z, Func_cf2b4
	cp $2a
	jp z, Func_cf2b4
	cp $29
	jp z, Func_cf2b4
	cp $28
	jp z, Func_cf2a9
	cp $27
	jp z, Func_cf2a9
	cp $26
	jp z, Func_cf2a9
	cp $25
	jp z, Func_cf2a9
	cp $24
	jp z, Func_cf2a9
	cp $23
	jp z, Func_cf29e
	cp $22
	jp z, Func_cf29e
	cp $21
	jp z, Func_cf29e
	cp $20
	jp z, Func_cf29e
	cp $1f
	jp z, Func_cf29e
	cp $1e
	jp z, Func_cf293
	cp $1d
	jp z, Func_cf293
	cp $1c
	jp z, Func_cf293
	cp $1b
	jp z, Func_cf293
	cp $1a
	jp z, Func_cf293
	cp $19
	jp z, Func_cf288
	cp $18
	jp z, Func_cf288
	cp $17
	jp z, Func_cf288
	cp $16
	jp z, Func_cf288
	cp $15
	jp z, Func_cf288
	cp $14
	jp z, Func_cf27d
	cp $13
	jp z, Func_cf27d
	cp $12
	jp z, Func_cf27d
	cp $11
	jp z, Func_cf27d
	cp $10
	jp z, Func_cf27d
	cp $f
	jp z, Func_cf272
	cp $e
	jp z, Func_cf272
	cp $d
	jp z, Func_cf272
	cp $c
	jp z, Func_cf272
	cp $b
	jp z, Func_cf272
	cp $a
	jp z, Func_cf267
	cp $9
	jp z, Func_cf267
	cp $8
	jp z, Func_cf267
	cp $7
	jp z, Func_cf267
	cp $6
	jp z, Func_cf267
	cp $5
	jp z, Func_cf25c
	cp $4
	jp z, Func_cf25c
	cp $3
	jp z, Func_cf25c
	cp $2
	jp z, Func_cf25c
	cp $1
	jp nz, Func_cf2bf
Func_cf25c: ; cf25c (33:725c)
	ld e, $5
	ld hl, Data_cee59
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf267: ; cf267 (33:7267)
	ld e, $5
	ld hl, Data_cee9f
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf272: ; cf272 (33:7272)
	ld e, $5
	ld hl, Data_ceee5
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf27d: ; cf27d (33:727d)
	ld e, $5
	ld hl, Data_cef2b
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf288: ; cf288 (33:7288)
	ld e, $5
	ld hl, Data_cef71
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf293: ; cf293 (33:7293)
	ld e, $5
	ld hl, Data_cefb7
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf29e: ; cf29e (33:729e)
	ld e, $5
	ld hl, Data_ceffd
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf2a9: ; cf2a9 (33:72a9)
	ld e, $5
	ld hl, Data_cf043
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf2b4: ; cf2b4 (33:72b4)
	ld e, $5
	ld hl, Data_cf089
	call LoadEncounters_33
	jp Func_cf2c7

Func_cf2bf: ; cf2bf (33:72bf)
	ld e, $9
	ld hl, Data_cf0cf
	call LoadEncounters_33
Func_cf2c7: ; cf2c7 (33:72c7)
	ld a, [wc7de]
	inc a
	cp $33
	jp nc, Func_cf307
	call Func_cf344
	ld hl, Func_cf344
	call Func_80f11_33
	ld a, $4
	call Random_33
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_cedd5
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_33
Func_cf307: ; cf307 (33:7307)
	ld e, $1
	ld hl, Data_cedca
	call LoadWarps_33
	ld a, $8
	call PlayMusic_33
	call FadeInMap_33
	ld a, [wc7de]
	cp $32
	jp nz, Func_cf328
	writetext TreeBitstreamText_47e17
	jp Func_cf331

Func_cf328: ; cf328 (33:7328)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_33
Func_cf331: ; cf331 (33:7331)
	ret

Data_cf332:
	dr $cf332, $cf344

Func_cf344: ; cf344 (33:7344)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_cf332
	add hl, de
	call Func_80d9b_33
	call Func_80f02_33
	ret

SECTION "Bank 34", ROMX, BANK [$34]
	lib_bank_20 34

Data_d10b4:
	dr $d10b4, $d1142

Data_d1142:
	dr $d1142, $d1147

Data_d1147:
	dr $d1147, $d11ef

Func_d11ef: ; d11ef (34:51ef)
	ld a, $d
	ld [wc789], a
	ld a, $12
	ld [wc7e2], a
	ld e, $1
	ld hl, Data_d1142
	call Func_80ce7_34
	loadwarps $9, Data_d10b4
	loadpeople $c, Data_d1147
	ld a, $1
	call LoadPlayerSprite_34
	playmusic SONG_TOWN2
	call FadeInMap_34
	ret

Func_d121f:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, e
	or a
	jp nz, Func_d1454
	ld hl, sp+$3
	ld a, [hl]
	call FacePlayer_20
	ld a, [wc796]
	cp $6
	jp nz, Func_d12ba
	ld a, $4e
	call Func_80e6d_34
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, Func_d12b7
	writenpctext TreeBitstreamText_45564
	ld a, $4e
	call Func_80e7d_34
	cp $1
	jp nz, Func_d12ae
	writenpctext TreeBitstreamText_4560f
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, Func_d129d
	playsfx $68
	writenpctext TreeBitstreamText_4565b
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $b00
	add hl, de
	call Func_80488_34
	ld a, l
	push af
	ld c, $0
	ld e, $1
	ld hl, sp+$3
	ld a, [hl]
	call GiveRobot_34
	pop af
	ld c, a
	ld e, $0
	ld a, $50
	call GiveRobot_34
	ld a, $7
	ld [wc796], a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_d12ab

Func_d129d: ; d129d (34:529d)
	playsfx $69
	writenpctext TreeBitstreamText_456f4
	jp Func_d1454

Func_d12ab: ; d12ab (34:52ab)
	jp Func_d12b7

Func_d12ae: ; d12ae (34:52ae)
	writetext TreeBitstreamText_45a40
	jp Func_d1454

Func_d12b7: ; d12b7 (34:52b7)
	jp Func_d13ff

Func_d12ba: ; d12ba (34:52ba)
	ld a, [wc796]
	cp $8
	jp nz, Func_d1344
	ld a, $51
	call Func_80e6d_34
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, Func_d1341
	writenpctext TreeBitstreamText_45564
	ld a, $51
	call Func_80e7d_34
	cp $1
	jp nz, Func_d1338
	writenpctext TreeBitstreamText_45794
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, Func_d1327
	playsfx $68
	writenpctext TreeBitstreamText_457de
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $b00
	add hl, de
	call Func_80488_34
	ld a, l
	push af
	ld c, $0
	ld e, $1
	ld hl, sp+$3
	ld a, [hl]
	call GiveRobot_34
	pop af
	ld c, a
	ld e, $0
	ld a, $69
	call GiveRobot_34
	ld a, $9
	ld [wc796], a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_d1335

Func_d1327: ; d1327 (34:5327)
	playsfx $69
	writenpctext TreeBitstreamText_456f4
	jp Func_d1454

Func_d1335: ; d1335 (34:5335)
	jp Func_d1341

Func_d1338: ; d1338 (34:5338)
	writetext TreeBitstreamText_45a40
	jp Func_d1454

Func_d1341: ; d1341 (34:5341)
	jp Func_d13ff

Func_d1344: ; d1344 (34:5344)
	ld a, $4e
	call Func_80e6d_34
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp nz, Func_d135e
	ld a, $51
	call Func_80e6d_34
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, Func_d13ff
Func_d135e: ; d135e (34:535e)
	ld a, [wc796]
	cp $7
	jp z, Func_d13e7
	or a
	jp z, Func_d13e7
	cp $a
	jp z, Func_d13d8
	cp $5
	jp z, Func_d13d8
	cp $c
	jp z, Func_d13c9
	cp $4
	jp z, Func_d13c9
	cp $d
	jp z, Func_d13ba
	cp $3
	jp z, Func_d13ba
	cp $b
	jp z, Func_d13ab
	cp $2
	jp z, Func_d13ab
	cp $9
	jp z, Func_d139c
	cp $1
	jp nz, Func_d13f6
Func_d139c: ; d139c (34:539c)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp Func_d13fc

Func_d13ab: ; d13ab (34:53ab)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp Func_d13fc

Func_d13ba: ; d13ba (34:53ba)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp Func_d13fc

Func_d13c9: ; d13c9 (34:53c9)
	writetext TreeBitstreamText_45a76
	ld hl, Func_0218
	call PrintTextStandard_34
	jp Func_d13fc

Func_d13d8: ; d13d8 (34:53d8)
	writetext TreeBitstreamText_45a76
	ld hl, SelectChannelsPredef
	call PrintTextStandard_34
	jp Func_d13fc

Func_d13e7: ; d13e7 (34:53e7)
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45abb
	jp Func_d13fc

Func_d13f6: ; d13f6 (34:53f6)
	writenpctext TreeBitstreamText_45564
Func_d13fc: ; d13fc (34:53fc)
	jp Func_d1454

Func_d13ff: ; d13ff (34:53ff)
	ld hl, sp+$0
	ld a, [hl]
	cp $ff
	jp nz, Func_d1454
	ld a, [wc796]
	cp $9
	jp nc, Func_d1426
	ld a, [wc796]
	cp $7
	jp c, Func_d1426
	writenpctext TreeBitstreamText_45564
	writenpctext TreeBitstreamText_45728
	jp Func_d1454

Func_d1426: ; d1426 (34:5426)
	ld a, [wc796]
	cp $f
	jp nz, Func_d1437
	writenpctext TreeBitstreamText_45564
	jp Func_d1454

Func_d1437: ; d1437 (34:5437)
	ld a, [wc796]
	cp $9
	jp c, Func_d1448
	writenpctext TreeBitstreamText_45875
	jp Func_d1454

Func_d1448: ; d1448 (34:5448)
	writenpctext TreeBitstreamText_45564
	writenpctext TreeBitstreamText_455be
Func_d1454: ; d1454 (34:5454)
	pop bc
	pop bc
	ret

Data_d1457: ; d1457
	dr $d1457, $d148e

Data_d148e: ; d148e
	dr $d148e, $d14c5

Data_d14c5: ; d14c5
	dr $d14c5, $d14fc

Data_d14fc: ; d14fc
	dr $d14fc, $d1507

Data_d1507: ; d1507
	dr $d1507, $d153f

Func_d153f: ; d153f (34:553f)
	xor a
	ld [wc7de], a
	ld a, $5
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d1457
	add hl, de
	ld e, $1
	call LoadWarps_34
	ld a, $5
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d148e
	add hl, de
	ld e, $1
	call LoadWarps_34
	ld a, $5
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d14c5
	add hl, de
	ld e, $1
	call LoadWarps_34
	loadwarps $1, Data_d14fc
	loadpeople $4, Data_d1507
	ld a, [wBackupMapNumber]
	cp $22
	jp z, Func_d1603
	cp $21
	jp z, Func_d1603
	cp $20
	jp z, Func_d1603
	cp $1f
	jp z, Func_d1603
	cp $1e
	jp z, Func_d1603
	cp $18
	jp z, Func_d15f9
	cp $17
	jp z, Func_d15f9
	cp $16
	jp z, Func_d15f9
	cp $15
	jp z, Func_d15f9
	cp $14
	jp z, Func_d15f9
	cp $e
	jp z, Func_d15ef
	cp $d
	jp z, Func_d15ef
	cp $c
	jp z, Func_d15ef
	cp $b
	jp z, Func_d15ef
	cp $a
	jp nz, Func_d160a
Func_d15ef: ; d15ef (34:55ef)
	hideperson $1
	jp Func_d160a

Func_d15f9: ; d15f9 (34:55f9)
	hideperson $2
	jp Func_d160a

Func_d1603: ; d1603 (34:5603)
	hideperson $3
Func_d160a: ; d160a (34:560a)
	ld a, [wc791]
	cp $4
	jp z, Func_d163f
	cp $3
	jp z, Func_d1635
	cp $2
	jp z, Func_d162b
	cp $1
	jp nz, Func_d1654
	hideperson $1
	jp Func_d1654

Func_d162b: ; d162b (34:562b)
	hideperson $2
	jp Func_d1654

Func_d1635: ; d1635 (34:5635)
	hideperson $3
	jp Func_d1654

Func_d163f: ; d163f (34:563f)
	hideperson $1
	hideperson $2
	hideperson $3
Func_d1654: ; d1654 (34:5654)
	ld a, $1
	ld [wc7a2 + 1], a
	playmusic SONG_TOWN2
	call FadeInMap_34
	ld a, [wBackupMapNumber]
	or a
	jp z, Func_d166f
	call Func_d1749
	xor a
	ld [wBackupMapNumber], a
Func_d166f: ; d166f (34:566f)
	ret

Data_d1670:
	dr $d1670, $d1674

Data_d1674: ; d1674
	dr $d1674, $d1678

Data_d1678: ; d1678
	dr $d1678, $d167c

Data_d167c: ; d167c
	dr $d167c, $d1680

Func_d1680:
	push af
	ld a, e
	or a
	jp nz, Func_d1729
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	ld a, [wPlayerFacing]
	or a
	jp nz, Func_d16b1
	writenpctext TreeBitstreamText_47cc9
	ld e, $0
	ld a, $11
	call Func_806a0_34
	script_sleep $3c
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call SpriteFace_34
	jp Func_d1729

Func_d16b1: ; d16b1 (34:56b1)
	writenpctext_yesorno TreeBitstreamText_47dc3
	or a
	jp nz, Func_d1723
	writenpctext TreeBitstreamText_47e09
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_d16df
	cp $2
	jp z, Func_d16df
	cp $1
	jp nz, Func_d16e8
	ld bc, Data_d1674
	ld e, $34
	xor a
	call Func_80688_34
	jp Func_d16e8

Func_d16df: ; d16df (34:56df)
	ld bc, Data_d1670
	ld e, $34
	xor a
	call Func_80688_34
Func_d16e8: ; d16e8 (34:56e8)
	call WaitNPCStep_34
	move_player $1, Data_d1678
	ld bc, Data_d167c
	ld e, $34
	xor a
	call Func_80688_34
	call WaitNPCStep_34
	ld e, $2
	xor a
	call SpriteFace_34
	showperson $1
	showperson $2
	showperson $3
	xor a
	ld [wc791], a
	jp Func_d1729

Func_d1723: ; d1723 (34:5723)
	writenpctext TreeBitstreamText_47dfa
Func_d1729: ; d1729 (34:5729)
	pop bc
	ret

Data_d172b:
	dr $d172b, $d1731

Data_d1731: ; d1731
	dr $d1731, $d1737

Data_d1737: ; d1737
	dr $d1737, $d173d

Data_d173d: ; d173d
	dr $d173d, $d1741

Data_d1741: ; d1741
	dr $d1741, $d1745

Data_d1745: ; d1745
	dr $d1745, $d1749

Func_d1749: ; d1749 (34:5749)
	ld a, [wBackupMapNumber]
	cp $18
	jp z, Func_d17ca
	cp $17
	jp z, Func_d17ca
	cp $16
	jp z, Func_d17ca
	cp $15
	jp z, Func_d17ca
	cp $14
	jp z, Func_d17ca
	cp $e
	jp z, Func_d177e
	cp $d
	jp z, Func_d177e
	cp $c
	jp z, Func_d177e
	cp $b
	jp z, Func_d177e
	cp $a
	jp nz, Func_d1816
Func_d177e: ; d177e (34:577e)
	move_player $1, Data_d172b
	ld a, $2
	call PlayerFace_34
	script_sleep $1e
	face_player 0
	checkevent $5d
	cp $1
	jp nz, Func_d17c7
	checkevent $5e
	or a
	jp nz, Func_d17c7
	writenpctext TreeBitstreamText_47ce9
	ld e, $0
	ld a, $2d
	call Func_80d62_34
	writetext TreeBitstreamText_47d38
	setevent $5e
Func_d17c7: ; d17c7 (34:57c7)
	jp Func_d1866

Func_d17ca: ; d17ca (34:57ca)
	move_player $1, Data_d1731
	ld a, $2
	call PlayerFace_34
	script_sleep $1e
	face_player 0
	checkevent $5f
	cp $1
	jp nz, Func_d1813
	checkevent $60
	or a
	jp nz, Func_d1813
	writenpctext TreeBitstreamText_47ce9
	ld e, $0
	ld a, $9
	call Func_80d74_34
	writetext TreeBitstreamText_47d46
	setevent $60
Func_d1813: ; d1813 (34:5813)
	jp Func_d1866

Func_d1816: ; d1816 (34:5816)
	move_player $1, Data_d1737
	ld a, $2
	call PlayerFace_34
	script_sleep $1e
	face_player 0
	checkevent $61
	cp $1
	jp nz, Func_d1866
	checkevent $62
	or a
	jp nz, Func_d1866
	writenpctext TreeBitstreamText_47ce9
	ld c, $32
	ld e, $0
IF DEF(SUN)
	ld a, $99
ENDC
IF DEF(STAR)
	ld a, $98
ENDC
	call GiveRobot_34
	cp $ff
	jp nz, Func_d1858
Func_d1858: ; d1858 (34:5858)
IF DEF(SUN)
	ld hl, $3b7
ENDC
IF DEF(STAR)
	ld hl, $20
ENDC
	call PrintTextStandard_34
	setevent $62
Func_d1866: ; d1866 (34:5866)
	ld bc, Data_d173d
	ld e, $34
	xor a
	call Func_80688_34
	call WaitNPCStep_34
	ld e, $1
	xor a
	call SpriteFace_34
	move_player $1, Data_d1741
	ld bc, Data_d1745
	ld e, $34
	xor a
	call Func_80688_34
	call WaitNPCStep_34
	ld e, $2
	xor a
	call SpriteFace_34
	showperson $1
	showperson $2
	showperson $3
	xor a
	ld [wc791], a
	ret

Data_d18ae: ; d18ae
	dr $d18ae, $d18b2

Data_d18b2: ; d18b2
	dr $d18b2, $d18b6

Data_d18b6: ; d18b6
	dr $d18b6, $d18ba

Func_d18ba:: ; d18ba (34:58ba)
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	script_sleep $3c
	writenpctext TreeBitstreamText_47ddc
	ld bc, Data_d18ae
	ld e, $34
	xor a
	call Func_80688_34
	call WaitNPCStep_34
	ld e, $1
	xor a
	call SpriteFace_34
	move_player $1, Data_d18b2
	ld bc, Data_d18b6
	ld e, $34
	xor a
	call Func_80688_34
	call WaitNPCStep_34
	ld e, $0
	xor a
	call SpriteFace_34
	pop af
	push af
	cp $4
	jp z, Func_d1938
	cp $3
	jp z, Func_d192e
	cp $2
	jp z, Func_d1924
	cp $1
	jp nz, Func_d194d
	hideperson $1
	jp Func_d194d

Func_d1924: ; d1924 (34:5924)
	hideperson $2
	jp Func_d194d

Func_d192e: ; d192e (34:592e)
	hideperson $3
	jp Func_d194d

Func_d1938: ; d1938 (34:5938)
	hideperson $1
	hideperson $2
	hideperson $3
Func_d194d: ; d194d (34:594d)
	pop af
	ld [wc791], a
	script_sleep $3c
	ret

Data_d1958: ; d1958
	dr $d1958, $d1963

Data_d1963: ; d1963
	dr $d1963, $d19e7

Data_d19e7: ; d19e7
	dr $d19e7, $d1a2d

Data_d1a2d: ; d1a2d
	dr $d1a2d, $d1a73

Data_d1a73: ; d1a73
	dr $d1a73, $d1ab9

Data_d1ab9: ; d1ab9
	dr $d1ab9, $d1aff

Func_d1aff: ; d1aff (34:5aff)
	ld l, $0
	push hl
	ld c, $6
	ld e, $5
	ld a, $3
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $f
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $3
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $f
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $14
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $6
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $12
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $8
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $8
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $c
	ld a, $b
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $11
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $15
	ld a, $11
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $c
	ld a, $14
	call Func_80f24_34
	pop bc
	ld a, [wc798]
	or a
	jp nz, Func_d1bff
	ld a, $3
	call Random_34
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_d1bff: ; d1bff (34:5bff)
	ld a, [wc7de]
	cp $14
	jp nz, Func_d1c0f
	setevent $5d
Func_d1c0f: ; d1c0f (34:5c0f)
	ld a, $3
	call Func_80d01_34
	ld a, [wc7de]
	cp $f
	jp z, Func_d1c78
	cp $e
	jp z, Func_d1c78
	cp $d
	jp z, Func_d1c78
	cp $c
	jp z, Func_d1c78
	cp $b
	jp z, Func_d1c78
	cp $a
	jp z, Func_d1c6d
	cp $9
	jp z, Func_d1c6d
	cp $8
	jp z, Func_d1c6d
	cp $7
	jp z, Func_d1c6d
	cp $6
	jp z, Func_d1c6d
	cp $5
	jp z, Func_d1c62
	cp $4
	jp z, Func_d1c62
	cp $3
	jp z, Func_d1c62
	cp $2
	jp z, Func_d1c62
	cp $1
	jp nz, Func_d1c83
Func_d1c62: ; d1c62 (34:5c62)
	loadwilds $5, Data_d19e7
	jp Func_d1c8b

Func_d1c6d: ; d1c6d (34:5c6d)
	loadwilds $5, Data_d1a2d
	jp Func_d1c8b

Func_d1c78: ; d1c78 (34:5c78)
	loadwilds $5, Data_d1a73
	jp Func_d1c8b

Func_d1c83: ; d1c83 (34:5c83)
	loadwilds $5, Data_d1ab9
Func_d1c8b: ; d1c8b (34:5c8b)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, Func_d1ccb
	call Func_d1d08
	ld hl, Func_d1d08
	call Func_80f11_34
	ld a, $4
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d1963
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d1ccb: ; d1ccb (34:5ccb)
	loadwarps $1, Data_d1958
	playmusic SONG_CAVE
	call FadeInMap_34
	ld a, [wc7de]
	cp $14
	jp nz, Func_d1cec
	writetext TreeBitstreamText_47e17
	jp Func_d1cf5

Func_d1cec: ; d1cec (34:5cec)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_34
Func_d1cf5: ; d1cf5 (34:5cf5)
	ret

Data_d1cf6:
	dr $d1cf6, $d1d08

Func_d1d08: ; d1d08 (34:5d08)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d1cf6
	add hl, de
	call Func_80d9b_34
	call Func_80f02_34
	ret

Data_d1d1e: ; d1d1e
	dr $d1d1e, $d1d29

Data_d1d29: ; d1d29
	dr $d1d29, $d1dad

Data_d1dad: ; d1dad
	dr $d1dad, $d1df3

Data_d1df3: ; d1df3
	dr $d1df3, $d1e39

Data_d1e39: ; d1e39
	dr $d1e39, $d1e7f

Data_d1e7f: ; d1e7f
	dr $d1e7f, $d1ec5

Func_d1ec5: ; d1ec5 (34:5ec5)
	ld l, $0
	push hl
	ld c, $e
	ld e, $e
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $c
	ld e, $6
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $9
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $c
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $f
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $13
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	call Func_80f24_34
	pop bc
	ld a, [wc798]
	or a
	jp nz, Func_d1f36
	ld a, $3
	call Random_34
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_d1f36: ; d1f36 (34:5f36)
	ld a, [wc7de]
	cp $14
	jp nz, Func_d1f46
	setevent $5d
Func_d1f46: ; d1f46 (34:5f46)
	ld a, $3
	call Func_80d01_34
	ld a, [wc7de]
	cp $f
	jp z, Func_d1faf
	cp $e
	jp z, Func_d1faf
	cp $d
	jp z, Func_d1faf
	cp $c
	jp z, Func_d1faf
	cp $b
	jp z, Func_d1faf
	cp $a
	jp z, Func_d1fa4
	cp $9
	jp z, Func_d1fa4
	cp $8
	jp z, Func_d1fa4
	cp $7
	jp z, Func_d1fa4
	cp $6
	jp z, Func_d1fa4
	cp $5
	jp z, Func_d1f99
	cp $4
	jp z, Func_d1f99
	cp $3
	jp z, Func_d1f99
	cp $2
	jp z, Func_d1f99
	cp $1
	jp nz, Func_d1fba
Func_d1f99: ; d1f99 (34:5f99)
	loadwilds $5, Data_d1dad
	jp Func_d1fc2

Func_d1fa4: ; d1fa4 (34:5fa4)
	loadwilds $5, Data_d1df3
	jp Func_d1fc2

Func_d1faf: ; d1faf (34:5faf)
	loadwilds $5, Data_d1e39
	jp Func_d1fc2

Func_d1fba: ; d1fba (34:5fba)
	loadwilds $5, Data_d1e7f
Func_d1fc2: ; d1fc2 (34:5fc2)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, Func_d2002
	call Func_d203f
	ld hl, Func_d203f
	call Func_80f11_34
	ld a, $4
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d1d29
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d2002: ; d2002 (34:6002)
	loadwarps $1, Data_d1d1e
	playmusic SONG_CAVE
	call FadeInMap_34
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2023
	writetext TreeBitstreamText_47e17
	jp Func_d202c

Func_d2023: ; d2023 (34:6023)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_34
Func_d202c: ; d202c (34:602c)
	ret

Data_d202d:
	dr $d202d, $d203f

Func_d203f: ; d203f (34:603f)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d202d
	add hl, de
	call Func_80d9b_34
	call Func_80f02_34
	ret

Data_d2055: ; d2055
	dr $d2055, $d2060

Data_d2060: ; d2060
	dr $d2060, $d20e4

Data_d20e4: ; d20e4
	dr $d20e4, $d212a

Data_d212a: ; d212a
	dr $d212a, $d2170

Data_d2170: ; d2170
	dr $d2170, $d21b6

Data_d21b6: ; d21b6
	dr $d21b6, $d21fc

Func_d21fc: ; d21fc (34:61fc)
	ld l, $0
	push hl
	ld c, $8
	ld e, $7
	ld a, $c
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $d
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $12
	ld a, $3
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $15
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $5
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $5
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $5
	ld a, $8
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $16
	ld a, $a
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $5
	ld a, $b
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $2
	ld e, $e
	ld a, $d
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $d
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $b
	ld a, $10
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $8
	ld a, $13
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $11
	ld e, $5
	ld a, $16
	call Func_80f24_34
	pop bc
	ld a, [wc798]
	or a
	jp nz, Func_d22d5
	ld a, $3
	call Random_34
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_d22d5: ; d22d5 (34:62d5)
	ld a, [wc7de]
	cp $14
	jp nz, Func_d22e5
	setevent $5d
Func_d22e5: ; d22e5 (34:62e5)
	ld a, $3
	call Func_80d01_34
	ld a, [wc7de]
	cp $f
	jp z, Func_d234e
	cp $e
	jp z, Func_d234e
	cp $d
	jp z, Func_d234e
	cp $c
	jp z, Func_d234e
	cp $b
	jp z, Func_d234e
	cp $a
	jp z, Func_d2343
	cp $9
	jp z, Func_d2343
	cp $8
	jp z, Func_d2343
	cp $7
	jp z, Func_d2343
	cp $6
	jp z, Func_d2343
	cp $5
	jp z, Func_d2338
	cp $4
	jp z, Func_d2338
	cp $3
	jp z, Func_d2338
	cp $2
	jp z, Func_d2338
	cp $1
	jp nz, Func_d2359
Func_d2338: ; d2338 (34:6338)
	loadwilds $5, Data_d20e4
	jp Func_d2361

Func_d2343: ; d2343 (34:6343)
	loadwilds $5, Data_d212a
	jp Func_d2361

Func_d234e: ; d234e (34:634e)
	loadwilds $5, Data_d2170
	jp Func_d2361

Func_d2359: ; d2359 (34:6359)
	loadwilds $5, Data_d21b6
Func_d2361: ; d2361 (34:6361)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, Func_d23a1
	call Func_d23de
	ld hl, Func_d23de
	call Func_80f11_34
	ld a, $4
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d2060
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d23a1: ; d23a1 (34:63a1)
	loadwarps $1, Data_d2055
	playmusic SONG_CAVE
	call FadeInMap_34
	ld a, [wc7de]
	cp $14
	jp nz, Func_d23c2
	writetext TreeBitstreamText_47e17
	jp Func_d23cb

Func_d23c2: ; d23c2 (34:63c2)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_34
Func_d23cb: ; d23cb (34:63cb)
	ret

Data_d23cc:
	dr $d23cc, $d23de

Func_d23de: ; d23de (34:63de)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d23cc
	add hl, de
	call Func_80d9b_34
	call Func_80f02_34
	ret

Data_d23f4: ; d23f4
	dr $d23f4, $d23ff

Data_d23ff: ; d23ff
	dr $d23ff, $d2483

Data_d2483: ; d2483
	dr $d2483, $d24c9

Data_d24c9: ; d24c9
	dr $d24c9, $d250f

Data_d250f: ; d250f
	dr $d250f, $d2555

Data_d2555: ; d2555
	dr $d2555, $d259b

Func_d259b: ; d259b (34:659b)
	ld l, $0
	push hl
	ld c, $b
	ld e, $b
	ld a, $9
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $f
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $16
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $17
	ld a, $15
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $14
	ld e, $6
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $e
	ld e, $9
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $c
	ld a, $8
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $f
	ld a, $b
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $12
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $15
	ld a, $11
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $13
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $18
	ld a, $14
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $19
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $12
	ld e, $6
	ld a, $1c
	call Func_80f24_34
	pop bc
	ld a, [wc798]
	or a
	jp nz, Func_d2674
	ld a, $3
	call Random_34
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_d2674: ; d2674 (34:6674)
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2684
	setevent $5d
Func_d2684: ; d2684 (34:6684)
	ld a, $3
	call Func_80d01_34
	ld a, [wc7de]
	cp $f
	jp z, Func_d26ed
	cp $e
	jp z, Func_d26ed
	cp $d
	jp z, Func_d26ed
	cp $c
	jp z, Func_d26ed
	cp $b
	jp z, Func_d26ed
	cp $a
	jp z, Func_d26e2
	cp $9
	jp z, Func_d26e2
	cp $8
	jp z, Func_d26e2
	cp $7
	jp z, Func_d26e2
	cp $6
	jp z, Func_d26e2
	cp $5
	jp z, Func_d26d7
	cp $4
	jp z, Func_d26d7
	cp $3
	jp z, Func_d26d7
	cp $2
	jp z, Func_d26d7
	cp $1
	jp nz, Func_d26f8
Func_d26d7: ; d26d7 (34:66d7)
	loadwilds $5, Data_d2483
	jp Func_d2700

Func_d26e2: ; d26e2 (34:66e2)
	loadwilds $5, Data_d24c9
	jp Func_d2700

Func_d26ed: ; d26ed (34:66ed)
	loadwilds $5, Data_d250f
	jp Func_d2700

Func_d26f8: ; d26f8 (34:66f8)
	loadwilds $5, Data_d2555
Func_d2700: ; d2700 (34:6700)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, Func_d2740
	call Func_d277d
	ld hl, Func_d277d
	call Func_80f11_34
	ld a, $4
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d23ff
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d2740: ; d2740 (34:6740)
	loadwarps $1, Data_d23f4
	playmusic SONG_CAVE
	call FadeInMap_34
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2761
	writetext TreeBitstreamText_47e17
	jp Func_d276a

Func_d2761: ; d2761 (34:6761)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_34
Func_d276a: ; d276a (34:676a)
	ret

Data_d276b:
	dr $d276b, $d277d

Func_d277d: ; d277d (34:677d)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d276b
	add hl, de
	call Func_80d9b_34
	call Func_80f02_34
	ret

Data_d2793: ; d2793
	dr $d2793, $d279e

Data_d279e: ; d279e
	dr $d279e, $d2822

Data_d2822: ; d2822
	dr $d2822, $d2868

Data_d2868: ; d2868
	dr $d2868, $d28ae

Data_d28ae: ; d28ae
	dr $d28ae, $d28f4

Data_d28f4: ; d28f4
	dr $d28f4, $d293a

Func_d293a: ; d293a (34:693a)
	ld l, $0
	push hl
	ld c, $c
	ld e, $5
	ld a, $3
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $5
	ld a, $12
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $e
	ld e, $b
	ld a, $9
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $11
	ld a, $6
	call Func_80f24_34
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $12
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $2
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $5
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $8
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $11
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $11
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $16
	call Func_80f24_34
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $19
	call Func_80f24_34
	pop bc
	ld a, [wc798]
	or a
	jp nz, Func_d2a06
	ld a, $3
	call Random_34
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
Func_d2a06: ; d2a06 (34:6a06)
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2a16
	setevent $5d
Func_d2a16: ; d2a16 (34:6a16)
	ld a, $3
	call Func_80d01_34
	ld a, [wc7de]
	cp $f
	jp z, Func_d2a7f
	cp $e
	jp z, Func_d2a7f
	cp $d
	jp z, Func_d2a7f
	cp $c
	jp z, Func_d2a7f
	cp $b
	jp z, Func_d2a7f
	cp $a
	jp z, Func_d2a74
	cp $9
	jp z, Func_d2a74
	cp $8
	jp z, Func_d2a74
	cp $7
	jp z, Func_d2a74
	cp $6
	jp z, Func_d2a74
	cp $5
	jp z, Func_d2a69
	cp $4
	jp z, Func_d2a69
	cp $3
	jp z, Func_d2a69
	cp $2
	jp z, Func_d2a69
	cp $1
	jp nz, Func_d2a8a
Func_d2a69: ; d2a69 (34:6a69)
	loadwilds $5, Data_d2822
	jp Func_d2a92

Func_d2a74: ; d2a74 (34:6a74)
	loadwilds $5, Data_d2868
	jp Func_d2a92

Func_d2a7f: ; d2a7f (34:6a7f)
	loadwilds $5, Data_d28ae
	jp Func_d2a92

Func_d2a8a: ; d2a8a (34:6a8a)
	loadwilds $5, Data_d28f4
Func_d2a92: ; d2a92 (34:6a92)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, Func_d2ad2
	call Func_d2b0f
	ld hl, Func_d2b0f
	call Func_80f11_34
	ld a, $4
	call Random_34
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d279e
	add hl, de
	pop de
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d2ad2: ; d2ad2 (34:6ad2)
	loadwarps $1, Data_d2793
	playmusic SONG_CAVE
	call FadeInMap_34
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2af3
	writetext TreeBitstreamText_47e17
	jp Func_d2afc

Func_d2af3: ; d2af3 (34:6af3)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	call Func_80f83_34
Func_d2afc: ; d2afc (34:6afc)
	ret

Data_d2afd:
	dr $d2afd, $d2b0f

Func_d2b0f: ; d2b0f (34:6b0f)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d2afd
	add hl, de
	call Func_80d9b_34
	call Func_80f02_34
	ret

Data_d2b25: ; d2b25
	dr $d2b25, $d2b82

Data_d2b82: ; d2b82
	dr $d2b82, $d2bf2

Data_d2bf2: ; d2bf2
	dr $d2bf2, $d2c0e

Data_d2c0e: ; d2c0e
	dr $d2c0e, $d2c2a

Func_d2c2a: ; d2c2a (34:6c2a)
	ld c, $0
Func_d2c2c: ; d2c2c (34:6c2c)
	ld a, c
	cp $7
	jp nc, Func_d2c9b
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, Func_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, Func_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, Func_d2c97
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2c0e
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, Func_d2c97
	push bc
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d2b25
	add hl, de
	ld e, $1
	call LoadWarps_34
	pop bc
	ld a, c
	inc a
	ld [wc2f8], a
	jp Func_d2c9b

Func_d2c97: ; d2c97 (34:6c97)
	inc c
	jp Func_d2c2c

Func_d2c9b: ; d2c9b (34:6c9b)
	loadpeople $8, Data_d2b82
	ld a, [wBackupMapGroup]
	cp $1
	jp nz, Func_d2cba
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d2cba
	loadpeople $2, Data_d2bf2
Func_d2cba: ; d2cba (34:6cba)
	playmusic SONG_CENTER
	call FadeInMap_34
	ret

Func_d2cc3:
	push af
	ld a, e
	or a
	jp nz, Func_d2cef
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	writenpctext TreeBitstreamText_470a2
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_d2ce7
	ld e, $3
	ld a, [wc2f8]
	call Func_806a0_34
	jp Func_d2cef

Func_d2ce7: ; d2ce7 (34:6ce7)
	ld e, $4
	ld a, [wc2f8]
	call Func_806a0_34
Func_d2cef: ; d2cef (34:6cef)
	pop bc
	ret

Data_d2cf1: ; d2cf1
	dr $d2cf1, $d2d75

Data_d2d75: ; d2d75
	dr $d2d75, $d2d81

Data_d2d81: ; d2d81
	dr $d2d81, $d2d85

Data_d2d85: ; d2d85
	dr $d2d85, $d2d89

Data_d2d89: ; d2d89
	dr $d2d89, $d2d8d

Data_d2d8d: ; d2d8d
	dr $d2d8d, $d2d9b

Data_d2d9b: ; d2d9b
	dr $d2d9b, $d2da9

Data_d2da9: ; d2da9
	dr $d2da9, $d2def

Data_d2def: ; d2def
	dr $d2def, $d2e5f

Data_d2e5f: ; d2e5f
	dr $d2e5f, $d2e6d

Data_d2e6d: ; d2e6d
	dr $d2e6d, $d2e9d

Func_d2e9d: ; d2e9d (34:6e9d)
	ld c, $0
Func_d2e9f: ; d2e9f (34:6e9f)
	ld a, c
	cp $c
	jp nc, Func_d2f07
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, Func_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, Func_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, Func_d2f03
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d2e6d
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, Func_d2f03
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d2cf1
	add hl, de
	ld e, $1
	call LoadWarps_34
	jp Func_d2f07

Func_d2f03: ; d2f03 (34:6f03)
	inc c
	jp Func_d2e9f

Func_d2f07: ; d2f07 (34:6f07)
	loadpeople $8, Data_d2def
	ld a, [wBackupMapGroup]
	cp $1
	jp z, Func_d2f2f
	ld a, [wBackupMapGroup]
	cp $5
	jp z, Func_d2f2f
	ld a, [wBackupMapNumber]
	cp $15
	jp z, Func_d2f2f
	ld a, [wBackupMapNumber]
	cp $19
	jp nz, Func_d2f37
Func_d2f2f: ; d2f2f (34:6f2f)
	loadpeople $1, Data_d2e5f
Func_d2f37: ; d2f37 (34:6f37)
	ld a, [wBackupMapGroup]
	cp $15
	jp z, Func_d2f5f
	cp $19
	jp z, Func_d2f54
	cp $5
	jp nz, Func_d2f6a
	ld de, Data_d2d81
	ld a, $8
	call Func_80150_34
	jp Func_d2f72

Func_d2f54: ; d2f54 (34:6f54)
	ld de, Data_d2d85
	ld a, $8
	call Func_80150_34
	jp Func_d2f72

Func_d2f5f: ; d2f5f (34:6f5f)
	ld de, Data_d2d89
	ld a, $8
	call Func_80150_34
	jp Func_d2f72

Func_d2f6a: ; d2f6a (34:6f6a)
	ld de, Data_d2d75
	ld a, $8
	call Func_80150_34
Func_d2f72: ; d2f72 (34:6f72)
	ld a, [wBackupMapGroup]
	cp $5
	jp nz, Func_d2fae
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d2fae
	ld a, [wBackupMapX]
	cp $5
	jp nz, Func_d2fa3
	ld a, [wBackupMapY]
	cp $7
	jp nz, Func_d2fa3
	loadpeople $1, Data_d2d9b
	hideperson $8
	jp Func_d2fab

Func_d2fa3: ; d2fa3 (34:6fa3)
	loadpeople $1, Data_d2d8d
Func_d2fab: ; d2fab (34:6fab)
	jp Func_d3019

Func_d2fae: ; d2fae (34:6fae)
	ld a, [wBackupMapGroup]
	cp $1d
	jp nz, Func_d3011
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d3011
	loadpeople $5, Data_d2da9
	ld a, [wc790]
	cp $3
	jp z, Func_d3000
	cp $4
	jp z, Func_d3000
	cp $5
	jp z, Func_d3000
	cp $6
	jp z, Func_d2fe1
	cp $7
	jp nz, Func_d300e
Func_d2fe1: ; d2fe1 (34:6fe1)
	hideperson $9
	hideperson $a
	hideperson $b
	hideperson $c
	jp Func_d300e

Func_d3000: ; d3000 (34:7000)
	hideperson $b
	hideperson $c
Func_d300e: ; d300e (34:700e)
	jp Func_d3019

Func_d3011: ; d3011 (34:7011)
	loadpeople $1, Data_d2d8d
Func_d3019: ; d3019 (34:7019)
	playmusic SONG_CENTER
	call FadeInMap_34
	ld a, [wBackupMapGroup]
	cp $5
	jp nz, Func_d3046
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d3046
	ld a, [wBackupMapX]
	cp $5
	jp nz, Func_d3046
	ld a, [wBackupMapY]
	cp $7
	jp nz, Func_d3046
	landmarksign TreeBitstreamText_465ae
Func_d3046: ; d3046 (34:7046)
	ret

Func_d3047:
	ld a, e
	or a
	jp nz, Func_d3054
	ld e, $0
	ld a, [wc789]
	call Func_806a0_34
Func_d3054: ; d3054 (34:7054)
	ret

Func_d3055:
	ld a, e
	or a
	jp nz, Func_d30f8
	checkevent $1
	or a
	jp nz, Func_d3086
	writetext TreeBitstreamText_3a8c3
	checkevent $f0
	cp $1
	jp nz, Func_d3083
	writetext TreeBitstreamText_3a8e1
	setevent $1
Func_d3083: ; d3083 (34:7083)
	jp Func_d30f8

Func_d3086: ; d3086 (34:7086)
	ld a, $e
	call Func_80e5d_34
	or a
	jp nz, Func_d3098
	writetext TreeBitstreamText_3a92f
	jp Func_d30f8

Func_d3098: ; d3098 (34:7098)
	checkevent $0
	or a
	jp nz, Func_d30e9
	writetext_yesorno TreeBitstreamText_3a966
	or a
	jp nz, Func_d30e0
	writetext TreeBitstreamText_3a995
	playsfx $2a
	writetext TreeBitstreamText_3a9e8
	writetext TreeBitstreamText_3a9f3
	ld c, $1
	ld e, $1
	ld a, $e
	call Func_80d4d_34
	ld c, $0
	ld e, $1
	ld a, $12
	call Func_80d4d_34
	setevent $0
	jp Func_d30e6

Func_d30e0: ; d30e0 (34:70e0)
	writetext TreeBitstreamText_3a97f
Func_d30e6: ; d30e6 (34:70e6)
	jp Func_d30f8

Func_d30e9: ; d30e9 (34:70e9)
	writetext TreeBitstreamText_3aa23
	ld c, $1
	ld e, $1
	ld a, $e
	call Func_80d4d_34
Func_d30f8: ; d30f8 (34:70f8)
	ret

Func_d30f9:
	cp $c
	jp z, Func_d3108
	cp $a
	jp nz, Func_d310d
	ld l, $9
	jp Func_d310e

Func_d3108: ; d3108 (34:7108)
	ld l, $b
	jp Func_d310e

Func_d310d: ; d310d (34:710d)
	ld l, a
Func_d310e: ; d310e (34:710e)
	ld a, e
	or a
	jp nz, Func_d3144
	push hl
	ld a, l
	call FacePlayer_20
	pop hl
	ld a, l
	cp $b
	jp z, Func_d313d
	cp $9
	jp z, Func_d3133
	cp $8
	jp nz, Func_d3144
	ld e, $0
	ld a, $d
	call Func_806a0_34
	jp Func_d3144

Func_d3133: ; d3133 (34:7133)
	ld e, $0
	ld a, $e
	call Func_806a0_34
	jp Func_d3144

Func_d313d: ; d313d (34:713d)
	ld e, $0
	ld a, $f
	call Func_806a0_34
Func_d3144: ; d3144 (34:7144)
	ret

Data_d3145: ; d3145
	dr $d3145, $d31ce

Data_d31ce: ; d31ce
	dr $d31ce, $d31ea

Data_d31ea: ; d31ea
	dr $d31ea, $d325a

Data_d325a: ; d325a
	dr $d325a, $d32ca

Data_d32ca: ; d32ca
	dr $d32ca, $d32e6

Data_d32e6: ; d32e6
	dr $d32e6, $d3312

Func_d3312: ; d3312 (34:7312)
	ld c, $0
Func_d3314: ; d3314 (34:7314)
	ld a, c
	cp $b
	jp nc, Func_d337c
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, Func_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, Func_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, Func_d3378
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_d32e6
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, Func_d3378
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d3145
	add hl, de
	ld e, $1
	call LoadWarps_34
	jp Func_d337c

Func_d3378: ; d3378 (34:7378)
	inc c
	jp Func_d3314

Func_d337c: ; d337c (34:737c)
	ld a, [wBackupMapGroup]
	cp $1d
	jp nz, Func_d33ed
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d33ed
	loadpeople $8, Data_d31ea
	ld a, [wc790]
	cp $3
	jp z, Func_d33dc
	cp $4
	jp z, Func_d33dc
	cp $5
	jp z, Func_d33dc
	cp $6
	jp z, Func_d33af
	cp $7
	jp nz, Func_d33ea
Func_d33af: ; d33af (34:73af)
	hideperson $2
	hideperson $3
	hideperson $4
	hideperson $5
	hideperson $6
	hideperson $7
	jp Func_d33ea

Func_d33dc: ; d33dc (34:73dc)
	hideperson $6
	hideperson $7
Func_d33ea: ; d33ea (34:73ea)
	jp Func_d33f5

Func_d33ed: ; d33ed (34:73ed)
	loadpeople $2, Data_d31ce
Func_d33f5: ; d33f5 (34:73f5)
	ld a, [wBackupMapGroup]
	cp $1
	jp nz, Func_d340c
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_d340c
	loadpeople $2, Data_d32ca
Func_d340c: ; d340c (34:740c)
	loadpeople $8, Data_d325a
	playmusic SONG_CENTER
	call FadeInMap_34
	ret

Func_d341d:
	ld a, e
	or a
	jp nz, Func_d342a
	ld e, $2
	ld a, [wc789]
	call Func_806a0_34
Func_d342a: ; d342a (34:742a)
	ret

Func_d342b:
	ld a, e
	or a
	jp nz, Func_d3438
	ld e, $1
	ld a, [wc789]
	call Func_806a0_34
Func_d3438: ; d3438 (34:7438)
	ret

Func_d3439:
	cp $5
	jp z, Func_d3448
	cp $3
	jp nz, Func_d344d
	ld l, $2
	jp Func_d344e

Func_d3448: ; d3448 (34:7448)
	ld l, $4
	jp Func_d344e

Func_d344d: ; d344d (34:744d)
	ld l, a
Func_d344e: ; d344e (34:744e)
	ld a, e
	or a
	jp nz, Func_d34b0
	push hl
	ld a, l
	call FacePlayer_20
	pop hl
	ld a, l
	cp $7
	jp z, Func_d34a9
	cp $6
	jp z, Func_d349f
	cp $4
	jp z, Func_d3495
	cp $2
	jp z, Func_d348b
	cp $1
	jp z, Func_d3481
	or a
	jp nz, Func_d34b0
	ld e, $2
	ld a, $d
	call Func_806a0_34
	jp Func_d34b0

Func_d3481: ; d3481 (34:7481)
	ld e, $1
	ld a, $d
	call Func_806a0_34
	jp Func_d34b0

Func_d348b: ; d348b (34:748b)
	ld e, $2
	ld a, $e
	call Func_806a0_34
	jp Func_d34b0

Func_d3495: ; d3495 (34:7495)
	ld e, $1
	ld a, $e
	call Func_806a0_34
	jp Func_d34b0

Func_d349f: ; d349f (34:749f)
	ld e, $2
	ld a, $f
	call Func_806a0_34
	jp Func_d34b0

Func_d34a9: ; d34a9 (34:74a9)
	ld e, $1
	ld a, $f
	call Func_806a0_34
Func_d34b0: ; d34b0 (34:74b0)
	ret

Data_d34b1: ; d34b1
	dr $d34b1, $d358d

Data_d358d: ; d358d
	dr $d358d, $d35e5

Data_d35e5: ; d35e5
	dr $d35e5, $d365e

Data_d365e: ; d365e
	dr $d365e, $d367a

Func_d367a: ; d367a (34:767a)
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, Func_d37e8
	ld a, [wBackupMapNumber]
	cp $e
	jp z, Func_d3718
	cp $d
	jp z, Func_d3713
	cp $c
	jp z, Func_d370e
	cp $b
	jp z, Func_d36fc
	cp $a
	jp z, Func_d36f7
	cp $9
	jp z, Func_d36f2
	cp $7
	jp z, Func_d36e0
	cp $6
	jp z, Func_d36ce
	cp $5
	jp z, Func_d36c9
	cp $4
	jp nz, Func_d371a
	ld a, [wBackupMapX]
	cp $1
	jp nz, Func_d36c4
	ld l, $0
	jp Func_d36c6

Func_d36c4: ; d36c4 (34:76c4)
	ld l, $9
Func_d36c6: ; d36c6 (34:76c6)
	jp Func_d371a

Func_d36c9: ; d36c9 (34:76c9)
	ld l, $1
	jp Func_d371a

Func_d36ce: ; d36ce (34:76ce)
	ld a, [wBackupMapX]
	cp $7
	jp nz, Func_d36db
	ld l, $2
	jp Func_d36dd

Func_d36db: ; d36db (34:76db)
	ld l, $3
Func_d36dd: ; d36dd (34:76dd)
	jp Func_d371a

Func_d36e0: ; d36e0 (34:76e0)
	ld a, [wBackupMapX]
	cp $7
	jp nz, Func_d36ed
	ld l, $4
	jp Func_d36ef

Func_d36ed: ; d36ed (34:76ed)
	ld l, $5
Func_d36ef: ; d36ef (34:76ef)
	jp Func_d371a

Func_d36f2: ; d36f2 (34:76f2)
	ld l, $6
	jp Func_d371a

Func_d36f7: ; d36f7 (34:76f7)
	ld l, $7
	jp Func_d371a

Func_d36fc: ; d36fc (34:76fc)
	ld a, [wBackupMapX]
	cp $7
	jp nz, Func_d3709
	ld l, $2
	jp Func_d370b

Func_d3709: ; d3709 (34:7709)
	ld l, $5
Func_d370b: ; d370b (34:770b)
	jp Func_d371a

Func_d370e: ; d370e (34:770e)
	ld l, $3
	jp Func_d371a

Func_d3713: ; d3713 (34:7713)
	ld l, $8
	jp Func_d371a

Func_d3718: ; d3718 (34:7718)
	ld l, $a
Func_d371a: ; d371a (34:771a)
	push hl
	call AllocateSpaceForWarps_34
	pop hl
	push hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d35e5
	add hl, de
	ld e, $1
	call LoadWarps_34
	playmusic SONG_TOWER
	call FadeInMap_34
	pop hl
	ld a, l
	cp $a
	jp z, Func_d37ce
	cp $9
	jp z, Func_d37c5
	cp $8
	jp z, Func_d37bc
	cp $7
	jp z, Func_d37b3
	cp $6
	jp z, Func_d37aa
	cp $5
	jp z, Func_d37a1
	cp $4
	jp z, Func_d3798
	cp $3
	jp z, Func_d378f
	cp $2
	jp z, Func_d3786
	cp $1
	jp z, Func_d377d
	or a
	jp nz, Func_d37d4
	landmarksign TreeBitstreamText_46d81
	jp Func_d37d4

Func_d377d: ; d377d (34:777d)
	landmarksign TreeBitstreamText_46d63
	jp Func_d37d4

Func_d3786: ; d3786 (34:7786)
	landmarksign TreeBitstreamText_46d6d
	jp Func_d37d4

Func_d378f: ; d378f (34:778f)
	landmarksign TreeBitstreamText_46d8b
	jp Func_d37d4

Func_d3798: ; d3798 (34:7798)
	landmarksign TreeBitstreamText_46d59
	jp Func_d37d4

Func_d37a1: ; d37a1 (34:77a1)
	landmarksign TreeBitstreamText_46d4f
	jp Func_d37d4

Func_d37aa: ; d37aa (34:77aa)
	landmarksign TreeBitstreamText_46d77
	jp Func_d37d4

Func_d37b3: ; d37b3 (34:77b3)
	landmarksign TreeBitstreamText_46d45
	jp Func_d37d4

Func_d37bc: ; d37bc (34:77bc)
	landmarksign TreeBitstreamText_46d96
	jp Func_d37d4

Func_d37c5: ; d37c5 (34:77c5)
	landmarksign TreeBitstreamText_46da2
	jp Func_d37d4

Func_d37ce: ; d37ce (34:77ce)
	landmarksign TreeBitstreamText_46d96
Func_d37d4: ; d37d4 (34:77d4)
	call StartShakingScreen_34
	playsfx $64
	script_sleep $3c
	call StopShakingScreen_34
	jp Func_d385a

Func_d37e8: ; d37e8 (34:77e8)
	ld a, [wBackupMapGroup]
	cp $2
	jp nz, Func_d381e
	call AllocateSpaceForWarps_34
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d358d
	add hl, de
	ld e, $1
	call LoadWarps_34
	loadpeople $2, Data_d365e
	playmusic SONG_TOWN3
	call FadeInMap_34
	jp Func_d385a

Func_d381e: ; d381e (34:781e)
	ld a, [wBackupMapNumber]
	cp $1e
	jp nz, Func_d382b
	ld l, $0
	jp Func_d3831

Func_d382b: ; d382b (34:782b)
	ld a, [wBackupMapNumber]
	add $f7
	ld l, a
Func_d3831: ; d3831 (34:7831)
	push hl
	call AllocateSpaceForWarps_34
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d34b1
	add hl, de
	ld e, $1
	call LoadWarps_34
	loadpeople $2, Data_d365e
	playmusic SONG_SHOP
	call FadeInMap_34
Func_d385a: ; d385a (34:785a)
	ret

Func_d385b:
	ld a, e
	or a
	jp nz, Func_d38ae
	face_player 0
	call Func_80275_34
	ld l, a
	push hl
	call Func_80f02_34
	pop hl
	ld a, [wBackupMapGroup]
	cp $2
	jp nz, Func_d3895
	push hl
	ld a, l
	ld [wc7de], a
	call AllocateSpaceForWarps_34
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d358d
	add hl, de
	ld e, $1
	call LoadWarps_34
	jp Func_d38ae

Func_d3895: ; d3895 (34:7895)
	push hl
	call AllocateSpaceForWarps_34
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d34b1
	add hl, de
	ld e, $1
	call LoadWarps_34
Func_d38ae: ; d38ae (34:78ae)
	ret

Data_d38af: ; d38af
	dr $d38af, $d38c9

Data_d38c9: ; d38c9
	dr $d38c9, $d390f

Data_d390f: ; d390f
	dr $d390f, $d392b

Func_d392b: ; d392b (34:792b)
	ld a, $f
	ld [wc7e2], a
	call Func_d3adf
	ld hl, Func_d3adf
	call Func_80f11_34
	loadwarps $2, Data_d38af
	ld a, $3
	call Func_80d01_34
	loadwilds $5, Data_d38c9
	loadpeople $2, Data_d390f
	checkevent $f1
	or a
	jp nz, Func_d3977
	xor a
	call PlayMusic_34
	xor a
	call Func_80653_34
	call FadeInMap_34
	landmarksign TreeBitstreamText_46dc3
	call Func_d3cb2
	jp Func_d39a5

Func_d3977: ; d3977 (34:7977)
	checkevent $1c
	cp $1
	jp nz, Func_d3998
	xor a
	call PlayMusic_34
	ld a, $1
	call LoadPlayerSprite_34
	xor a
	call Func_80653_34
	call FadeInMap_34
	call Func_d39a6
	jp Func_d39a5

Func_d3998: ; d3998 (34:7998)
	playmusic SONG_PUNCH_MINIGAME
	ld a, $1
	call LoadPlayerSprite_34
	call FadeInMap_34
Func_d39a5: ; d39a5 (34:79a5)
	ret

Func_d39a6: ; d39a6 (34:79a6)
	call StartShakingScreen_34
	playsfx $64
	loademote $3, $1, $13
	call Func_80f54_34
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $1
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	call Func_80f02_34
	call Func_80f54_34
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $2
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	call Func_80f02_34
	call Func_80f54_34
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $3
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	call Func_80f02_34
	call Func_80f54_34
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $4
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	call Func_80f02_34
	call Func_80f54_34
	call WaitEmote_34
	call HideEmote_34
	call StopShakingScreen_34
	ld l, $6
	push hl
	ld c, $8
	ld e, $0
	ld a, $1a
	call Func_80dff_34
	pop bc
	ret

Data_d3a6d: ; d3a6d
	dr $d3a6d, $d3a73

Data_d3a73: ; d3a73
	dr $d3a73, $d3a79

Data_d3a79: ; d3a79
	dr $d3a79, $d3a7f

Data_d3a7f: ; d3a7f
	dr $d3a7f, $d3a85

Data_d3a85: ; d3a85
	dr $d3a85, $d3a8b

Data_d3a8b: ; d3a8b
	dr $d3a8b, $d3a91

Data_d3a91: ; d3a91
	dr $d3a91, $d3a97

Data_d3a97: ; d3a97
	dr $d3a97, $d3a9d

Data_d3a9d: ; d3a9d
	dr $d3a9d, $d3aa3

Data_d3aa3: ; d3aa3
	dr $d3aa3, $d3aa9

Data_d3aa9: ; d3aa9
	dr $d3aa9, $d3aaf

Data_d3aaf: ; d3aaf
	dr $d3aaf, $d3ab5

Data_d3ab5: ; d3ab5
	dr $d3ab5, $d3abb

Data_d3abb: ; d3abb
	dr $d3abb, $d3ac1

Data_d3ac1: ; d3ac1
	dr $d3ac1, $d3ac7

Data_d3ac7: ; d3ac7
	dr $d3ac7, $d3acd

Data_d3acd: ; d3acd
	dr $d3acd, $d3ad3

Data_d3ad3: ; d3ad3
	dr $d3ad3, $d3ad9

Data_d3ad9: ; d3ad9
	dr $d3ad9, $d3adf

Func_d3adf: ; d3adf (34:7adf)
	checkevent $f1
	or a
	jp nz, Func_d3af2
	ld hl, Data_d3ad9
	call Func_80d9b_34
	call Func_80f02_34
Func_d3af2: ; d3af2 (34:7af2)
	ld a, [wc78d + 1]
	cp $1
	jp nz, Func_d3b0c
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3aa3
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3b0c: ; d3b0c (34:7b0c)
	ld a, [wc78d + 1]
	cp $2
	jp nz, Func_d3b2c
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3aa9
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3b2c: ; d3b2c (34:7b2c)
	ld a, [wc78d + 1]
	cp $3
	jp nz, Func_d3b52
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3aaf
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3b52: ; d3b52 (34:7b52)
	ld a, [wc78d + 1]
	cp $4
	jp nz, Func_d3b7e
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3ab5
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3b7e: ; d3b7e (34:7b7e)
	ld a, [wc78d + 1]
	cp $5
	jp nz, Func_d3bb0
	ld hl, Data_d3a85
	call Func_80d9b_34
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3abb
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3bb0: ; d3bb0 (34:7bb0)
	ld a, [wc78d + 1]
	cp $6
	jp nz, Func_d3be8
	ld hl, Data_d3a8b
	call Func_80d9b_34
	ld hl, Data_d3a85
	call Func_80d9b_34
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3ac1
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3be8: ; d3be8 (34:7be8)
	ld a, [wc78d + 1]
	cp $7
	jp nz, Func_d3c26
	ld hl, Data_d3a91
	call Func_80d9b_34
	ld hl, Data_d3a8b
	call Func_80d9b_34
	ld hl, Data_d3a85
	call Func_80d9b_34
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3ac7
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3c26: ; d3c26 (34:7c26)
	ld a, [wc78d + 1]
	cp $8
	jp nz, Func_d3c6a
	ld hl, Data_d3a97
	call Func_80d9b_34
	ld hl, Data_d3a91
	call Func_80d9b_34
	ld hl, Data_d3a8b
	call Func_80d9b_34
	ld hl, Data_d3a85
	call Func_80d9b_34
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3acd
	call Func_80d9b_34
	call Func_80f02_34
	jp Func_d3cb1

Func_d3c6a: ; d3c6a (34:7c6a)
	ld a, [wc78d + 1]
	cp $9
	jp nz, Func_d3cb1
	ld hl, Data_d3a9d
	call Func_80d9b_34
	ld hl, Data_d3a97
	call Func_80d9b_34
	ld hl, Data_d3a91
	call Func_80d9b_34
	ld hl, Data_d3a8b
	call Func_80d9b_34
	ld hl, Data_d3a85
	call Func_80d9b_34
	ld hl, Data_d3a7f
	call Func_80d9b_34
	ld hl, Data_d3a79
	call Func_80d9b_34
	ld hl, Data_d3a73
	call Func_80d9b_34
	ld hl, Data_d3a6d
	call Func_80d9b_34
	ld hl, Data_d3ad3
	call Func_80d9b_34
	call Func_80f02_34
Func_d3cb1: ; d3cb1 (34:7cb1)
	ret

Func_d3cb2: ; d3cb2 (34:7cb2)
	loademote $1, $2, $2b
	ld e, $e
	ld a, $7
	call MoveEmote_34
	playsfx $65
	script_sleep $3c
	playsfx $43
	call WaitEmote_34
	setevent $f1
	ld l, $9
	push hl
	ld c, $9
	ld e, $1
	ld a, $1f
	call Func_80dff_34
	pop bc
	ret

Func_d3ceb: ; d3ceb (34:7ceb)
	resetevent $f9
	playmusic SONG_JUMP_MINIGAME
	xor a
	call Func_80653_34
	loademote $1, $6, $26
	call FadeInMap_34
	call WaitEmote_34
	ld a, $1
	call PlayerFace_34
	ld l, $5
	push hl
	ld c, $f
	ld e, $16
	ld a, $13
	call Func_80dff_34
	pop bc
	ret

SECTION "Bank 36", ROMX, BANK [$36]
GFX_d8000:: INCBIN "gfx/misc/d8000.2bpp"

Data_d8790::
	dr $d8790, $d88f8

GFX_d88f8:: INCBIN "gfx/misc/d88f8.2bpp"

Data_d9048::
	dr $d9048, $d93e8

OverworldAttrMaps:: ; d93e8
	dr $d93e8, $d97e8

GFX_d97e8:: INCBIN "gfx/misc/d97e8.2bpp"

Func_d9f38:: ; d9f38
	ret

Func_d9f39:
	push de
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	pop de
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ret

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
	ld bc, $a0
	ld e, $0
	ld hl, wOAMBuffer
	call FillMemory
	ret

Func_d9f74:: ; d9f74
	ld a, [hl]
	ld [wc263], a
	inc hl
	ld a, [hl]
	ld [wNumSpritesLoaded], a
	ret

Func_d9f7e: ; d9f7e (36:5f7e)
	; void Func_d9f7e (char b, char c, short de, char * hl) {
	push bc
	push de
	push hl
	ld hl, sp+$5
	ld [hl], b
	ld hl, sp+$4
	ld [hl], c
	pop hl
	; extern short wc26b[16];
	; extern char wc28b[16];
	; extern char wc29b[16];
	; extern char wc2ab[16];
	; extern char wc2bb[16];
	; extern char * wc2f4;
	; short * wc265 = hl;
	write_hl_to wc265
	; short * wc267 = *wc265;
	read_hl_from wc265
	write_hl_to wc267
	; short * wc269 = (*wc265 + 0x20);
	read_hl_from wc265
	ld de, $20
	add hl, de
	write_hl_to wc269
	; char * wc85a = 0x10;
	ld a, $10
	ld [wc85a], a
	; char i;
	ld c, $0
	pop de
.loop
	; for (i=0; i<0x10; i++) {
	ld a, c
	cp $10
	jp nc, .quit
	; if (!((1 << i) & de)) {
	push de
	ld b, c
	ld hl, $1
	call LeftShiftHL
	ld a, e
	and l
	ld l, a
	ld a, d
	and h
	ld h, a
	ld a, l
	or h
	jp nz, .asm_d9fd7
	; *wc26b[i] = 0;
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	; }
	jp .next

.asm_d9fd7
	; else if (!(*wc267[i])) {
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, .asm_d9ffc
	; *wc26b[i] = 0;
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	; }
	jp .next

.asm_d9ffc
	; else {
	; *wc26b[i] = *(*wc267)[i] + *wc265;
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	; *wc28b[i] = *(*wc26b[i])[1];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	; *wc29b[i] = *(*wc26b[i])[2];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	; *wc2ab[i] = *(*wc26b[i])[3];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	; *wc2bb[i] = b;
	ld hl, sp+$3
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld [hl], a
	; *wc2f4 = c;
	ld hl, sp+$2
	ld a, [hl]
	ld [wc2f4], a
	; }
.next
	; }
	inc c
	pop de
	jp .loop

.quit
	; }
	pop bc
	ret

Func_da07a:: ; da07a
	xor a
Func_da07b: ; da07b (36:607b)
	cp $10
	jp nc, Func_da092
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_da07b

Func_da092: ; da092 (36:6092)
	ret

Func_da093:: ; da093
	push af
	push bc
	push bc
	push bc
	push bc
	ld hl, wNumSpritesLoaded
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	pop de
	push hl
	ld c, $0
	ld hl, sp+$4
	ld [hl], $f
Func_da0ac: ; da0ac (36:60ac)
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp nz, Func_da0b7
	jp Func_da4a1

Func_da0b7: ; da0b7 (36:60b7)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_da0ca
	jp Func_da497

Func_da0ca: ; da0ca (36:60ca)
	ld a, $1
	ld hl, sp+$4
	ld b, [hl]
	call LeftShiftA
	or c
	ld c, a
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld c, [hl]
	ld a, c
	cp $80
	jp z, Func_da30a
	ld a, c
	cp $ff
	jp z, Func_da30a
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc269
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_da30a
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc269
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	ld c, l
	ld b, h
Func_da11d: ; da11d (36:611d)
	ld a, [bc]
	cp $ff
	jp z, Func_da30a
	push bc
	ld a, [bc]
	ld hl, wc263
	add [hl]
	ld hl, sp+$b
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [wc85a]
	or [hl]
	ld hl, sp+$a
	ld [hl], a
	ld a, [wc2cb]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	add [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$7
	ld [hl], a
	ld a, [wc2cc]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	add [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$6
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld c, [hl]
	ld hl, sp+$a
	ld a, [hl]
	and $40
	jp z, Func_da184
	ld a, c
	dec a
	add a
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$b
	ld [hl], a
Func_da184: ; da184 (36:6184)
	ld hl, sp+$a
	ld a, [hl]
	and $20
	jp z, Func_da196
	ld hl, sp+$9
	ld a, [hl]
	dec a
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$b
	ld [hl], a
Func_da196: ; da196 (36:6196)
	ld a, [wc2f4]
	or a
	jp nz, Func_da241
	ld e, $0
Func_da19f: ; da19f (36:619f)
	ld a, e
	cp c
	jp nc, Func_da23e
	push bc
	ld c, $0
Func_da1a7: ; da1a7 (36:61a7)
	ld a, c
	ld hl, sp+$b
	cp [hl]
	jp nc, Func_da201
	push de
	ld a, e
	add a
	add a
	add a
	ld hl, sp+$a
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld a, c
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$f
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da1f5
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$f
	ld [hl], a
	jp Func_da1fc

Func_da1f5: ; da1f5 (36:61f5)
	ld hl, sp+$f
	ld a, [hl]
	inc a
	ld hl, sp+$f
	ld [hl], a
Func_da1fc: ; da1fc (36:61fc)
	inc c
	pop de
	jp Func_da1a7

Func_da201: ; da201 (36:6201)
	ld hl, sp+$c
	ld a, [hl]
	and $20
	jp z, Func_da215
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$d
	ld [hl], a
	jp Func_da21e

Func_da215: ; da215 (36:6215)
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	sub [hl]
	ld hl, sp+$d
	ld [hl], a
Func_da21e: ; da21e (36:621e)
	ld hl, sp+$c
	ld a, [hl]
	and $40
	jp z, Func_da231
	ld hl, sp+$d
	ld a, [hl]
	add $f0
	ld hl, sp+$d
	ld [hl], a
	jp Func_da239

Func_da231: ; da231 (36:6231)
	ld hl, sp+$d
	ld a, [hl]
	add $10
	ld hl, sp+$d
	ld [hl], a
Func_da239: ; da239 (36:6239)
	inc e
	pop bc
	jp Func_da19f

Func_da23e: ; da23e (36:623e)
	jp Func_da300

Func_da241: ; da241 (36:6241)
	ld e, $0
Func_da243: ; da243 (36:6243)
	ld a, e
	cp c
	jp nc, Func_da300
	push bc
	ld c, $0
Func_da24b: ; da24b (36:624b)
	ld a, c
	ld hl, sp+$b
	cp [hl]
	jp nc, Func_da2c3
	push de
	ld a, e
	add a
	add a
	add a
	ld hl, sp+$a
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld a, c
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	ld l, a
	ld a, $a8
	sub l
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$f
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da298
	ld hl, sp+$e
	ld a, [hl]
	and $df
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	jp Func_da2a5

Func_da298: ; da298 (36:6298)
	ld hl, sp+$e
	ld a, [hl]
	or $20
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
Func_da2a5: ; da2a5 (36:62a5)
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da2b7
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$f
	ld [hl], a
	jp Func_da2be

Func_da2b7: ; da2b7 (36:62b7)
	ld hl, sp+$f
	ld a, [hl]
	inc a
	ld hl, sp+$f
	ld [hl], a
Func_da2be: ; da2be (36:62be)
	inc c
	pop de
	jp Func_da24b

Func_da2c3: ; da2c3 (36:62c3)
	ld hl, sp+$c
	ld a, [hl]
	and $20
	jp z, Func_da2d7
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$d
	ld [hl], a
	jp Func_da2e0

Func_da2d7: ; da2d7 (36:62d7)
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	sub [hl]
	ld hl, sp+$d
	ld [hl], a
Func_da2e0: ; da2e0 (36:62e0)
	ld hl, sp+$c
	ld a, [hl]
	and $40
	jp z, Func_da2f3
	ld hl, sp+$d
	ld a, [hl]
	add $f0
	ld hl, sp+$d
	ld [hl], a
	jp Func_da2fb

Func_da2f3: ; da2f3 (36:62f3)
	ld hl, sp+$d
	ld a, [hl]
	add $10
	ld hl, sp+$d
	ld [hl], a
Func_da2fb: ; da2fb (36:62fb)
	inc e
	pop bc
	jp Func_da243

Func_da300: ; da300 (36:6300)
	pop bc
	ld hl, $6
	add hl, bc
	ld c, l
	ld b, h
	jp Func_da11d

Func_da30a: ; da30a (36:630a)
	pop bc
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	cp $1
	jp nc, Func_da497
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	add $4
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp nz, Func_da379
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_da379
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	cp $80
	jp nz, Func_da379
	ld a, $1
	ld hl, sp+$4
	ld b, [hl]
	call LeftShiftA
	cpl
	and c
	ld c, a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	sub $4
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_da379: ; da379 (36:6379)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	cp $80
	jp nz, Func_da447
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_da3bf
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	or a
	jp nz, Func_da3bf
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_da497

Func_da3bf: ; da3bf (36:63bf)
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	ld a, [wc318]
	or a
	jp z, Func_da443
	ld a, [wc318]
	call OverworldPlaySFX
Func_da443: ; da443 (36:6443)
	pop bc
	jp Func_da497

Func_da447: ; da447 (36:6447)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	add [hl]
	ld [hl], a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	add [hl]
	ld [hl], a
Func_da497: ; da497 (36:6497)
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld hl, sp+$4
	ld [hl], a
	jp Func_da0ac

Func_da4a1: ; da4a1 (36:64a1)
	pop hl
	push hl
	ld a, l
	sub $a0
	ld a, h
	sbc $c4
	jp nc, Func_da4cb
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	jp Func_da4a1

Func_da4cb: ; da4cb (36:64cb)
	inc c
	dec c
	jp z, Func_da4d5
	ld a, $1
	jp Func_da4d6

Func_da4d5: ; da4d5 (36:64d5)
	xor a
Func_da4d6: ; da4d6 (36:64d6)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_da4dc:: ; da4dc (36:64dc)
	ld hl, wOAMBuffer
.loop
	ld a, l
	sub low(wOAMBufferEnd)
	ld a, h
	sbc high(wOAMBufferEnd)
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
	ld a, [wNumSpritesLoaded]
	add a
	add a
	ld hl, $0
	ld hl, wOAMBuffer ; whoops
	ld l, a
	ld a, [wNumSpritesLoaded]
	ld b, a
	ld a, $28
	sub b
	ld b, a
	ld a, $ff
	ld de, $4
Func_da515: ; da515 (36:6515)
	ld [hl], a
	add hl, de
	dec b
	jp nz, Func_da515
	ld hl, $0
	ld hl, wc26b
	ld a, $0
	REPT $20
	ld [hli], a
	ENDR
	ret

Func_da544:
	ret

LoadEmoteGFX: ; da545 (36:6545)
	push de
	push bc
	push bc
	push bc
	push bc
	push af
	ld [wFarCallDestBank], a
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld bc, $4
	call FarCopyVideoData
	set_farcall_addrs_hli AllocateMemory
	call GetHLAtSPPlus10
	call FarCall
	call WriteHLToSPPlus4
	pop af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus8
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
	pop de
	call FarDecompressVideoData
	ld hl, wc263
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	call WriteHLToSPPlus4
	pop hl
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	push hl
	inc hl
	inc hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call RequestVideoData
	set_farcall_addrs_hli FreeMemory
	pop hl
	push hl
	call FarCall
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

DecompressEmoteAttrs: ; da5db (36:65db)
	push de
	push bc
	push bc
	push bc
	push af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus10
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $4
	call FarCopyVideoData
	set_farcall_addrs_hli AllocateMemory
	call GetHLAtSPPlus8
	call FarCall
	call WriteHLToSPPlus4
	pop af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $c
	pop de
	add hl, de
	pop de
	call FarDecompressVideoData
	pop hl
	push hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_da631:
	dr $da631, $da66f

Data_da66f: ; da66f
	dr $da66f, $da6ad

Data_da6ad: ; da6ad
	dr $da6ad, $da6eb

Data_da6eb: ; da6eb
	dr $da6eb, $da729

Func_da729:: ; da729 (36:6729)
	push af
	push de
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$2
	call Func_d9f74
	ld a, $2
	ld [wFarCallDestBank], a
	ld hl, $0
	pop de
	push hl
	ld c, $1
	ld hl, sp+$7
	ld a, [hl]
	cp $3a
	jp z, Func_da79b
	cp $39
	jp z, Func_da78e
	cp $38
	jp z, Func_da78e
	cp $5
	jp z, Func_da781
	cp $3d
	jp z, Func_da76c
	cp $3c
	jp z, Func_da76c
	cp $3b
	jp nz, Func_da7a8
Func_da76c: ; da76c (36:676c)
	ld a, [wc85a]
	or $1
	ld [wc85a], a
	xor a
	ld [wc2cb], a
	xor a
	ld [wc2cc], a
	ld c, $1
	jp Func_da7b2

Func_da781: ; da781 (36:6781)
	ld a, $68
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da78e: ; da78e (36:678e)
	ld a, $36
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da79b: ; da79b (36:679b)
	ld a, $40
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da7a8: ; da7a8 (36:67a8)
	ld a, $28
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
Func_da7b2: ; da7b2 (36:67b2)
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da66f
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_da803
	push bc
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, Data_da631
	add hl, de
	ld c, [hl]
	ld de, Emotes_34000
	ld a, BANK(Emotes_34000)
	call LoadEmoteGFX
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, Data_da66f
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_3570d
	ld a, BANK(EmoteAttrs_3570d)
	call DecompressEmoteAttrs
	call WriteHLToSPPlus4
	pop bc
	ld hl, sp+$4
	ld l, [hl]
	ld h, c
	ld c, l
	ld b, h
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da6ad
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	call GetHLAtSPPlus4
	pop de
	call Func_d9f7e
Func_da803: ; da803 (36:6803)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_da82e
	ld hl, sp+$7
	ld a, [hl]
	cp $3e
	jp c, Func_da81e
	ld a, [wc85a]
	or $7
	ld [wc85a], a
	jp Func_da82e

Func_da81e: ; da81e (36:681e)
	ld a, [wc85a]
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da6eb
	add hl, de
	or [hl]
	ld [wc85a], a
Func_da82e: ; da82e (36:682e)
	pop hl
	push hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_da835:: ; da835
	ld [wc2f5], a
	ret

UpdateCurSprite:: ; da839 (36:6839)
	push af
	ld a, b
	and $3
	cp $1
	jp z, Func_da89f
	ld a, c
	add a
	add a
	pop bc
	add b
	ld b, a
	ld a, [wSystemType]
	cp $11
	jr z, .asm_da853
	ld c, $10
	jr .asm_da859

.asm_da853
	ld a, [wMapObjectCGBAttrsOverride]
	or $10
	ld c, a
.asm_da859
	push de
	ld a, [wc2f5]
	ld h, $0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wc2f5]
	add $4
	ld [wc2f5], a
	ret

Func_da89f: ; da89f (36:689f)
	ld a, c
	add a
	add a
	pop bc
	add b
	ld b, a
	ld a, [wSystemType]
	cp $11
	jr z, .asm_da8b0
	ld c, $30
	jr .asm_da8b6

.asm_da8b0
	ld a, [wMapObjectCGBAttrsOverride]
	or $30
	ld c, a
.asm_da8b6
	push de
	ld a, [wc2f5]
	ld h, $0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	pop de
	ld a, d
	add $8
	ld d, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wc2f5]
	add $4
	ld [wc2f5], a
	ret

Func_da900:
	ret

Func_da901:: ; da901
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld e, h
	ld d, $0
	inc de
	ld hl, sp+$e
	ld [hl], e
	pop hl
	ld e, l
	ld d, $0
	inc de
	inc de
	ld hl, sp+$b
	ld [hl], e
	pop de
	ld hl, sp+$8
	ld [hl], d
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$5
	ld [hl], $0
	xor a
Func_da92b: ; da92b (36:692b)
	cp $28
	jp nc, Func_da98b
	push af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	ld a, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld a, c
	add $8
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, Func_da986
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$9
	add [hl]
	add a
	add a
	add a
	ld l, a
	ld a, c
	cp l
	jp nc, Func_da986
	ld hl, sp+$4
	ld a, [hl]
	add $8
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, Func_da986
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$a
	add [hl]
	add a
	add a
	add a
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	cp e
	jp nc, Func_da986
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
Func_da986: ; da986 (36:6986)
	pop af
	inc a
	jp Func_da92b

Func_da98b: ; da98b (36:698b)
	set_farcall_addrs_hli AllocateMemory
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	call FarCall
	pop de
	push hl
	push hl
	ld hl, sp+$7
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	ld hl, sp+$8
	ld [hl], $0
Func_da9b2: ; da9b2 (36:69b2)
	ld hl, sp+$8
	ld a, [hl]
	cp $28
	jp nc, Func_daa38
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	call WriteHLToSPPlus7
	call GetHLAtSPPlus7
	ld c, [hl]
	call GetHLAtSPPlus7
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld a, c
	add $8
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, Func_daa2e
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$9
	add [hl]
	add a
	add a
	add a
	ld l, a
	ld a, c
	cp l
	jp nc, Func_daa2e
	ld hl, sp+$4
	ld a, [hl]
	add $8
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, Func_daa2e
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$a
	add [hl]
	add a
	add a
	add a
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	cp e
	jp nc, Func_daa2e
	ld hl, sp+$8
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus7
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus7
	ld [hl], $a0
Func_daa2e: ; daa2e (36:6a2e)
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_da9b2

Func_daa38: ; daa38 (36:6a38)
	pop hl
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_daa40:: ; daa40
	push hl
	ld c, l
	ld b, h
	ld a, [bc]
	inc bc
	ld l, a
	xor a
Func_daa47: ; daa47 (36:6a47)
	cp l
	jp nc, Func_daa61
	push hl
	push af
	ld a, [bc]
	inc bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop af
	inc a
	pop hl
	jp Func_daa47

Func_daa61: ; daa61 (36:6a61)
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ret

Func_daa71:
	ret



INCLUDE "maps/enter_map.asm"

SECTION "Bank 38", ROMX, BANK [$38]
GFX_e0000: INCBIN "gfx/misc/e0000.w64.t1.2bpp"
Data_e06f0:
	dr $e06f0, $e0858

Data_e0858:
	dr $e0858, $e09c0

GFX_e09c0: INCBIN "gfx/misc/e09c0.2bpp"

Data_e10c0:
	dr $e10c0, $e1255

Data_e1255: ; e1255
	dr $e1255, $e1259

Data_e1259: ; e1259
	dr $e1259, $e127f

Data_e127f: ; e127f
	dr $e127f, $e129e

Data_e129e: ; e129e
	dr $e129e, $e12af

Data_e12af: ; e12af
	dr $e12af, $e12c0

Data_e12c0: ; e12c0
	dr $e12c0, $e1513

Func_e1513:: ; e1513 (38:5513)
	ld hl, -$86
	add hl, sp
	ld sp, hl
	push bc
	push de
	push af
	ld hl, $81
	add hl, sp
	reg16swap de, hl
	ld hl, Data_e1255
	ld bc, $4
	call MemCopy
	ld hl, sp+$7b
	reg16swap de, hl
	ld hl, Data_e1259
	ld bc, $6
	call MemCopy
	ld hl, sp+$75
	reg16swap de, hl
	ld hl, Data_e127f
	ld bc, $6
	call MemCopy
	ld hl, sp+$6f
	reg16swap de, hl
	ld hl, Data_e129e
	ld bc, $6
	call MemCopy
	ld hl, sp+$6b
	reg16swap de, hl
	ld hl, Data_e12af
	ld bc, $4
	call MemCopy
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, Data_e12c0
	ld bc, $60
	call MemCopy
	ld hl, sp+$9
	ld [hl], $0
	ld hl, sp+$a
	ld [hl], $0
	pop af
	ld hl, sp+$4
	ld [hl], a
	pop de
	ld hl, sp+$3
	ld [hl], e
	pop bc
	ld hl, sp+$2
	ld [hl], c
	callba_hli Func_b6f2
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$3
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	callba_hli AllocateMonsterStruct
	set_farcall_addrs_hli Func_dc0a
	ld e, $bb
	xor a
	call FarCall
	ld c, $6
	push bc
	ld a, $2
	push af
	set_farcall_addrs_hli Func_7c8a
	pop af
	pop bc
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, c
	ld l, a
	ld c, $2
	call FarCall
	callba_hli FreeMonsterStruct
	ld a, $2
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld a, [wSystemType]
	cp $11
	jp z, Func_e164a
	callba_hli Func_b65f
Func_e164a: ; e164a (38:564a)
	ld e, $0
	ld hl, sp+$75
	call Func_e1d9c
	ld e, $0
	ld hl, sp+$6f
	call Func_e1d9c
	set_farcall_addrs_hli LoadEmote
	ld c, $0
	ld e, $f
	ld a, $21
	call FarCall
	ld a, $1
Func_e166e: ; e166e (38:566e)
	cp $4
	jp nc, Func_e1685
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_e166e

Func_e1685: ; e1685 (38:5685)
	xor a
	ld hl, $81
	add hl, sp
	ld [hl], $0
	ld e, $ff
Func_e168e: ; e168e (38:568e)
	push de
	call NextOverworldFrame
	call CheckButton
	ld l, a
	pop de
	push hl
	ld hl, $83
	add hl, sp
	ld a, [hl]
	cp e
	jp z, Func_e1733
	ld c, $1
Func_e16a3: ; e16a3 (38:56a3)
	ld a, c
	cp $4
	jp nc, Func_e172e
	ld hl, $83
	add hl, sp
	ld a, [hl]
	inc a
	cp c
	jp nz, Func_e171c
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc26bEnd
	add hl, de
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	jp Func_e172a

Func_e171c: ; e171c (38:571c)
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_e172a: ; e172a (38:572a)
	inc c
	jp Func_e16a3

Func_e172e: ; e172e (38:572e)
	ld hl, $83
	add hl, sp
	ld e, [hl]
Func_e1733: ; e1733 (38:5733)
	push de
	set_farcall_addrs_hli Func_da093
	ld a, $1
	call FarCall
	callba_hli Func_d9f55
	pop de
	pop hl
	ld a, l
	and $2
	jp z, Func_e1772
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $1
	jp c, Func_e176f
	ld hl, $81
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e176f: ; e176f (38:576f)
	jp Func_e179c

Func_e1772: ; e1772 (38:5772)
	ld a, l
	and $1
	jp z, Func_e1790
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $2
	jp nc, Func_e178d
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e178d: ; e178d (38:578d)
	jp Func_e179c

Func_e1790: ; e1790 (38:5790)
	ld a, l
	and $10
	jp z, Func_e179c
	call NextOverworldFrame
	jp Func_e179f

Func_e179c: ; e179c (38:579c)
	jp Func_e168e

Func_e179f: ; e179f (38:579f)
	ld hl, $81
	add hl, sp
	ld a, [hl]
	ld hl, $80
	add hl, sp
	ld [hl], a
	callba_hli Func_9a87c
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	ld a, $38
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e09c0
	ld hl, $8900
	call FarRequestVideoData
	ld hl, $83
	add hl, sp
	ld [hl], $0
	ld hl, $82
	add hl, sp
	ld [hl], $17
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld hl, $82
	add hl, sp
	ld l, [hl]
	ld h, a
	call FarCall
	callba_hli Func_b65f
	call FillVisibleAreaWithBlankTile
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld c, [hl]
	ld e, $6
	ld a, $9
	call Func_e1bb4
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$5
	add hl, de
	ld e, $0
	call Func_e1d9c
	call FillVisibleAreaWithBlankTile
	call Func_e1c97
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_e1864: ; e1864 (38:5864)
	ld e, $0
	ld hl, sp+$65
	call Func_e1d9c
	ld hl, $81
	add hl, sp
	ld [hl], $0
	ld e, $0
Func_e1873: ; e1873 (38:5873)
	push de
	call NextOverworldFrame
	call CheckButton
	ld l, a
	pop de
	ld a, l
	and $4
	jp z, Func_e189b
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $6
	jp c, Func_e1898
	ld hl, $81
	add hl, sp
	ld a, [hl]
	add $fa
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e1898: ; e1898 (38:5898)
	jp Func_e1981

Func_e189b: ; e189b (38:589b)
	ld a, l
	and $8
	jp z, Func_e18ba
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $6
	jp nc, Func_e18b7
	ld hl, $81
	add hl, sp
	ld a, [hl]
	add $6
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18b7: ; e18b7 (38:58b7)
	jp Func_e1981

Func_e18ba: ; e18ba (38:58ba)
	ld a, l
	and $2
	jp z, Func_e18d8
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $1
	jp c, Func_e18d5
	ld hl, $81
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18d5: ; e18d5 (38:58d5)
	jp Func_e1981

Func_e18d8: ; e18d8 (38:58d8)
	ld a, l
	and $1
	jp z, Func_e18f6
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $b
	jp nc, Func_e18f3
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18f3: ; e18f3 (38:58f3)
	jp Func_e1981

Func_e18f6: ; e18f6 (38:58f6)
	ld a, l
	and $10
	jp z, Func_e1981
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld e, [hl]
	ld hl, sp+$7f
	ld [hl], e
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld [hl], a
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_e197e
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld l, [hl]
	push hl
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, $85
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	pop bc
	call Func_e1bb4
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_e197e: ; e197e (38:597e)
	jp Func_e1a0b

Func_e1981: ; e1981 (38:5981)
	push de
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	add a
	add a
	add a
	add $c
	ld hl, $87
	add hl, sp
	ld [hl], a
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	add a
	add a
	add a
	add $10
	ld hl, $86
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli UpdateCurSprite
	pop de
	push de
	ld l, e
	ld h, $0
	ld b, $4
	call RightShiftHL
	reg16swap de, hl
	ld hl, sp+$7d
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, $86
	add hl, sp
	ld e, [hl]
	ld hl, $87
	add hl, sp
	ld h, [hl]
	ld d, h
	xor a
	call FarCall
	pop de
	inc e
	ld a, e
	and $3f
	ld e, a
	push de
	callba_hli Func_d9f55
	pop de
	jp Func_e1873

Func_e1a0b: ; e1a0b (38:5a0b)
	callba_hli Func_da4dc
	callba_hli Func_d9f55
	ld e, $1
	ld hl, sp+$69
	call Func_e1d9c
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, Func_e1a44
	jp Func_e1a65

Func_e1a44: ; e1a44 (38:5a44)
	ld hl, sp+$7f
	ld a, [hl]
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld [hl], a
	call Func_e1c97
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	jp Func_e1864

Func_e1a65: ; e1a65 (38:5a65)
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $14
	jp z, Func_e1a80
	cp $13
	jp z, Func_e1a80
	cp $12
	jp nz, Func_e1a91
Func_e1a80: ; e1a80 (38:5a80)
	set_farcall_addrs_hli Func_b785
	ld a, [wc782]
	call FarCall
Func_e1a91: ; e1a91 (38:5a91)
	call Func_e1aa9
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld hl, $86
	add hl, sp
	ld sp, hl
	ret

Func_e1aa9:: ; e1aa9 (38:5aa9)
	push bc
	push bc
	push bc
	push bc
	callba_hli Func_9336a
	reg16swap de, hl
	push de
	ld bc, $8
	ld e, $0
	ld hl, sp+$2
	call FillMemory
	ld bc, $5
	push bc
	set_farcall_addrs_hli Func_935a8
	pop bc
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld l, c
	ld h, b
	call FarCall
	set_farcall_addrs_hli Func_935a8
	pop bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	call FarCall
	ld l, $0
	pop de
Func_e1b01: ; e1b01 (38:5b01)
	ld a, l
	cp $c
	jp nc, Func_e1baf
	push de
	ld bc, $ff
	push hl
	ld e, l
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $15
	jp z, Func_e1b24
	cp $14
	jp nz, Func_e1b27
	ld bc, $5
	jp Func_e1b27

Func_e1b24: ; e1b24 (38:5b24)
	ld bc, $6
Func_e1b27: ; e1b27 (38:5b27)
	pop hl
	pop de
	push hl
	ld a, c
	inc a
	or b
	jp z, Func_e1baa
	push bc
	push de
	ld h, $0
	ld de, $78
	call MultiplyHLbyDE
	reg16swap de, hl
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$7
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$9
	ld [hl], e
	pop de
	push de
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$a
	ld [hl], c
	ld hl, sp+$b
	ld [hl], $9
	ld hl, sp+$c
	ld [hl], $1
	ld hl, sp+$d
	ld [hl], $1
	set_farcall_addrs_hli Func_935a8
	pop de
	pop bc
	push de
	ld hl, sp+$4
	reg16swap de, hl
	ld l, c
	ld h, b
	call FarCall
	pop de
Func_e1baa: ; e1baa (38:5baa)
	pop hl
	inc l
	jp Func_e1b01

Func_e1baf: ; e1baf (38:5baf)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e1bb4: ; e1bb4 (38:5bb4)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	ld a, c
	ld b, $9
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	ld hl, sp+$6
	ld [hl], a
	pop bc
	push bc
	ld a, c
	ld b, $9
	call DivideAbyB
	ld d, a
	add a
	add d
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$8
	ld [hl], $0
	pop bc
Func_e1bdb: ; e1bdb (38:5bdb)
	ld hl, sp+$6
	ld a, [hl]
	cp $3
	jp nc, Func_e1c94
	push bc
	ld a, BANK(Data_e10c0)
	ld [wFarCallDestBank], a
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $1b
	call MultiplyHLbyDE
	ld de, Data_e10c0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $3
	call FarCopyVideoData
	ld hl, sp+$7
	ld [hl], $0
	pop bc
Func_e1c19: ; e1c19 (38:5c19)
	ld hl, sp+$5
	ld a, [hl]
	cp $3
	jp nc, Func_e1c8a
	ld a, c
	cp $2c
	jp nz, Func_e1c50
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	pop de
	add hl, de
	ld [hl], $8f
	jp Func_e1c80

Func_e1c50: ; e1c50 (38:5c50)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	add $90
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	pop de
	add hl, de
	ld [hl], a
Func_e1c80: ; e1c80 (38:5c80)
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	jp Func_e1c19

Func_e1c8a: ; e1c8a (38:5c8a)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_e1bdb

Func_e1c94: ; e1c94 (38:5c94)
	add sp, $c
	ret

Func_e1c97: ; e1c97 (38:5c97)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld e, $2
	xor a
	call SetStringStartState
	ld hl, Data_e1d74
	push hl
	call PlaceString
	pop bc
	ld e, $8
	xor a
	call SetStringStartState
	ld hl, Data_e1d88
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$0
	ld [hl], $0
Func_e1cc4: ; e1cc4 (38:5cc4)
	ld hl, sp+$0
	ld a, [hl]
	cp $c
	jp nc, Func_e1d72
	ld hl, sp+$0
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	add $3
	ld c, a
	push bc
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $2
	pop bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], $90
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $18
	jp c, Func_e1d10
	ld a, $ff
Func_e1d10: ; e1d10 (38:5d10)
	cp $ff
	jp z, Func_e1d45
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, sp+$4
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	pop bc
	call Func_e1bb4
	jp Func_e1d68

Func_e1d45: ; e1d45 (38:5d45)
	ld hl, sp+$0
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	ld c, $2c
	call Func_e1bb4
Func_e1d68: ; e1d68 (38:5d68)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_e1cc4

Func_e1d72: ; e1d72 (38:5d72)
	pop bc
	ret

Data_e1d74:
	db "(  0  2  4  6  8 10", $0

Data_e1d88:
	db "( 12 14 16 18 20 22", $0

Func_e1d9c: ; e1d9c (38:5d9c)
	push hl
	ld hl, -$d2
	add hl, sp
	ld sp, hl
	push de
	ld c, $0
Func_e1da5: ; e1da5 (38:5da5)
	ld a, c
	cp $5
	jp nc, Func_e1e28
	read_hl_from_sp_plus $d6
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_e1e0e
	push bc
	read_hl_from_sp_plus $d8
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	pop de
	call CopyUntilNull
	pop bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $cc
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_e1e24

Func_e1e0e: ; e1e0e (38:5e0e)
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $ca
	add hl, sp
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_e1e28

Func_e1e24: ; e1e24 (38:5e24)
	inc c
	jp Func_e1da5

Func_e1e28: ; e1e28 (38:5e28)
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	pop de
	inc e
	dec e
	jp nz, Func_e1e61
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, $c8
	add hl, sp
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	jp Func_e1e7d

Func_e1e61: ; e1e61 (38:5e61)
	set_farcall_addrs_hli PrintMapText
	ld bc, $880
	ld hl, $c8
	add hl, sp
	reg16swap de, hl
	ld hl, $10e
	call FarCall
Func_e1e7d: ; e1e7d (38:5e7d)
	ld hl, $d4
	add hl, sp
	ld sp, hl
	ret

Func_e1e83:: ; e1e83 (38:5e83)
	call FillVisibleAreaWithBlankTile
	ld a, BANK(GFX_e09c0)
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e09c0
	ld hl, $8900
	call FarRequestVideoData
	call Func_e1c97
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, Data_e1eeb
	push hl
	call PlaceString
	pop bc
	ld e, $10
	ld a, $1
	call SetStringStartState
	ld hl, Data_e1ef9
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	callba_hli Func_ac37
	call Func_3af6
	ret

Data_e1eeb:
	db "()スケシﾞュールハﾟネル", $0

Data_e1ef9:
	db "(せっていしﾞょうきょう)", $0

Func_e1f07: ; e1f07 (38:5f07)
	push af
	ld a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, Func_e1f26
	ld a, l
	and $7f
	call FarCall
	jp Func_e1f2c

Func_e1f26: ; e1f26 (38:5f26)
	ld a, l
	or $80
	call FarCall
Func_e1f2c: ; e1f2c (38:5f2c)
	ret

Func_e1f2d:: ; e1f2d (38:5f2d)
	push af
	push bc
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, sp+$2
	ld a, [wSaveScratchca6c]
	ld [hl], a
	ld hl, sp+$3
	ld [hl], $0
	ld c, $0
Func_e1f43: ; e1f43 (38:5f43)
	ld a, c
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_e1f70
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nz, Func_e1f6c
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_e1f6c
	ld hl, sp+$3
	ld [hl], $1
	jp Func_e1f70

Func_e1f6c: ; e1f6c (38:5f6c)
	inc c
	jp Func_e1f43

Func_e1f70: ; e1f70 (38:5f70)
	pop af
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	pop bc
	pop bc
	ret

Data_e1f7a:
	dr $e1f7a, $e1fa2

Data_e1fa2: ; e1fa2
	dr $e1fa2, $e1ff2

Pointers_e1ff2:
	dw Data_e201a
	dw Data_e2023
	dw Data_e202d
	dw Data_e2036
	dw Data_e2040
	dw Data_e2049
	dw Data_e2052
	dw Data_e205c
	dw Data_e2065
	dw Data_e2070
	dw Data_e2079
	dw Data_e2083
	dw Data_e2090
	dw Data_e2099
	dw Data_e20a2
	dw Data_e20ab
	dw Data_e20b4
	dw Data_e20bf
	dw Data_e20c9
	dw Data_e20d6

Data_e201a:
	db "カフﾟリ(むら)", $0

Data_e2023:
	db "リフﾞラ(のまち)", $0

Data_e202d:
	db "カリーユ(まち)", $0

Data_e2036:
	db "ハﾞンサﾞ(むら)", $0

Data_e2040:
	db "キャロル(むら)", $0

Data_e2049:
	db "クールス(まち)", $0

Data_e2052:
	db "クﾞリース(やま)", $0

Data_e205c:
	db "タﾞイン(まち)", $0

Data_e2065:
	db "アホﾟロ(ようさい)", $0

Data_e2070:
	db "カﾞーナ(いけ)", $0

Data_e2079:
	db "メイシﾞ(のもり)", $0

Data_e2083:
	db "コﾞルトﾞ(へいけﾞん)", $0

Data_e2090:
	db "テール(のしろ)", $0

Data_e2099:
	db "ツキカﾞ(おか)", $0

Data_e20a2:
	db "オワリ(のもり)", $0

Data_e20ab:
	db "ホﾟロ(のむら)", $0

Data_e20b4:
	db "ハﾞートﾞ(しﾞま)", $0

Data_e20bf:
	db "(まほﾞろしむら)", $0

Data_e20c9:
	db "コﾞルトﾞ(へいけﾞん)", $0

Data_e20d6:
	db "(すいちゅう)", $0

Func_e20de:
	ld e, $0
	push de
	call GetJoyPressed
	ld c, a
	ld l, $0
	pop de
Func_e20e8: ; e20e8 (38:60e8)
	ld a, l
	cp $8
	jp nc, Func_e2110
	ld b, l
	ld a, [wc874]
	call RightShiftA
	and $1
	jp nz, Func_e210c
	ld a, c
	ld b, l
	call RightShiftA
	and $1
	jp z, Func_e210c
	ld b, l
	ld a, $1
	call LeftShiftA
	or e
	ld e, a
Func_e210c: ; e210c (38:610c)
	inc l
	jp Func_e20e8

Func_e2110: ; e2110 (38:6110)
	ld a, c
	ld [wc874], a
	ld a, e
	ret

Data_e2116: ; e2116
	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 26, 16, 04
	RGB 17, 08, 05
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 00, 16, 00
	RGB 17, 08, 05
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 06, 19, 27
	RGB 07, 07, 27
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 31, 00, 31
	RGB 16, 00, 16
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 08, 19, 19
	RGB 00, 11, 11
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 31, 00, 00
	RGB 16, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 16
	RGB 11, 05, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 16, 31
	RGB 08, 08, 16
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 16, 16
	RGB 16, 08, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 08, 16
	RGB 04, 04, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 08, 08
	RGB 08, 04, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 23, 19
	RGB 22, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 23, 31
	RGB 10, 14, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 14, 25
	RGB 22, 12, 10
	RGB 00, 00, 00

Data_e2196: ; e2196
	dr $e2196, $e219a

Data_e219a: ; e219a
	dr $e219a, $e219e

Data_e219e: ; e219e
	dr $e219e, $e220d

Func_e220d:: ; e220d
	ld hl, -$96
	add hl, sp
	ld sp, hl
	ld hl, sp+$74
	reg16swap de, hl
	ld hl, Data_e2196
	ld bc, $4
	call MemCopy
	ld hl, sp+$70
	reg16swap de, hl
	ld hl, Data_e219a
	ld bc, $4
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_e219e
	ld bc, $6f
	call MemCopy
	ld de, $384
	push de
	ld bc, $438
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, $84
	add hl, sp
	call FarCall
	ld hl, $87
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $88
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, de
	pop bc
	pop de
	call CompareHLtoDE
	jp c, Func_e2287
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_e2287
	ld a, $1
	jp Func_e2288

Func_e2287: ; e2287 (38:6287)
	xor a
Func_e2288: ; e2288 (38:6288)
	ld hl, sp+$6f
	ld [hl], a
Func_e228b: ; e228b (38:628b)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_e228b
	ld bc, $80
	ld de, Data_e2116
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
Func_e22a9: ; e22a9 (38:62a9)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_e22a9
	ld a, $14
	call OverworldPlaySong
	ld hl, sp+$79
	ld a, [wc7e2]
	ld [hl], a
	ld hl, sp+$79
	ld a, [hl]
	cp $12
	jp nz, Func_e22c8
	ld hl, sp+$6f
	ld [hl], $1
Func_e22c8: ; e22c8 (38:62c8)
	xor a
	call Func_e1f07
	ld a, BANK(GFX_e0000)
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e0000
	ld hl, $8900
	call FarRequestVideoData
	call Func_e2a17
	hlcoord 0, 0
	write_hl_to_sp_plus $7e
	hlcoord 0, 0, wAttrMap
	write_hl_to_sp_plus $7c
	ld de, Data_e06f0
	xor a
Func_e22f2: ; e22f2 (38:62f2)
	cp $12
	jp nc, Func_e2350
	push af
	push de
	ld a, BANK(Data_e06f0)
	ld [wFarCallDestBank], a
	ld hl, $84
	add hl, sp
	ld bc, $14
	call FarCopyVideoData
	ld c, $0
Func_e230a: ; e230a (38:630a)
	ld a, c
	cp $14
	jp nc, Func_e2342
	ld e, c
	ld d, $0
	ld hl, $84
	add hl, sp
	add hl, de
	ld a, [hl]
	add $90
	read_hl_from_sp_plus $82
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $82
	ld e, c
	ld d, $0
	ld hl, $84
	add hl, sp
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $80
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $80
	inc c
	jp Func_e230a

Func_e2342: ; e2342 (38:6342)
	pop de
	ld hl, $14
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	jp Func_e22f2

Func_e2350: ; e2350 (38:6350)
	ld hl, $94
	add hl, sp
	ld [hl], $1
Func_e2356: ; e2356 (38:6356)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $14
	jp nc, Func_e243e
	ld hl, $94
	add hl, sp
	ld a, [hl]
	call Func_e2829
	or a
	jp z, Func_e2430
	ld hl, $95
	add hl, sp
	ld [hl], $0
Func_e2372: ; e2372 (38:6372)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2430
	ld hl, $95
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, $94
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$78
	ld [hl], a
	cp $ff
	jp z, Func_e2422
	ld hl, sp+$78
	ld a, [hl]
	ld hl, $94
	add hl, sp
	cp [hl]
	jp nc, Func_e23a8
	jp Func_e2422

Func_e23a8: ; e23a8 (38:63a8)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $10
	jp z, Func_e23bc
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $11
	jp nz, Func_e23d7
Func_e23bc: ; e23bc (38:63bc)
	ld hl, sp+$78
	ld a, [hl]
	cp $10
	jp z, Func_e23cc
	ld hl, sp+$78
	ld a, [hl]
	cp $11
	jp nz, Func_e23d7
Func_e23cc: ; e23cc (38:63cc)
	ld hl, sp+$79
	ld a, [hl]
	cp $11
	jp z, Func_e23d7
	jp Func_e2422

Func_e23d7: ; e23d7 (38:63d7)
	ld hl, sp+$6f
	ld a, [hl]
	or a
	jp nz, Func_e240d
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, Func_e23f2
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $12
	jp nz, Func_e240d
Func_e23f2: ; e23f2 (38:63f2)
	ld hl, sp+$78
	ld a, [hl]
	cp $2
	jp z, Func_e2402
	ld hl, sp+$78
	ld a, [hl]
	cp $12
	jp nz, Func_e240d
Func_e2402: ; e2402 (38:6402)
	ld hl, sp+$79
	ld a, [hl]
	cp $12
	jp z, Func_e240d
	jp Func_e2422

Func_e240d: ; e240d (38:640d)
	ld hl, sp+$78
	ld a, [hl]
	call Func_e2829
	or a
	jp z, Func_e2422
	ld hl, sp+$78
	ld e, [hl]
	ld hl, $94
	add hl, sp
	ld a, [hl]
	call Func_e2851
Func_e2422: ; e2422 (38:6422)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $95
	add hl, sp
	ld [hl], a
	jp Func_e2372

Func_e2430: ; e2430 (38:6430)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $94
	add hl, sp
	ld [hl], a
	jp Func_e2356

Func_e243e: ; e243e (38:643e)
	ld hl, sp+$79
	ld a, [hl]
	call Func_e262f
	callba_hli Func_da4fc
	ld hl, sp+$7f
	ld [hl], $0
	ld hl, sp+$7e
	ld [hl], $17
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$7f
	ld a, [hl]
	ld hl, sp+$7e
	ld l, [hl]
	ld h, a
	call FarCall
	ld a, $1
	call Func_e1f07
	call NextOverworldFrame
	call CheckButton
	set_farcall_addrs_hli Func_c7bd0
	xor a
	call FarCall
	ld e, $0
	push de
	ld a, $2
	ld [wc39a], a
	call Func_e2a24
	xor a
	ld [wc874], a
	pop de
Func_e24a3: ; e24a3 (38:64a3)
	push de
	call NextOverworldFrame
	call CheckButton
	ld hl, sp+$7a
	ld [hl], a
	ld hl, $97
	add hl, sp
	ld [hl], $0
Func_e24b3: ; e24b3 (38:64b3)
	ld hl, $97
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e258f
	ld hl, sp+$7a
	ld a, [hl]
	ld hl, $97
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$76
	add hl, de
	and [hl]
	jp z, Func_e2581
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $ff
	jp z, Func_e2581
	ld hl, sp+$7b
	ld a, [hl]
	cp $10
	jp nz, Func_e250b
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $11
	jp nz, Func_e250b
	jp Func_e2581

Func_e250b: ; e250b (38:650b)
	ld hl, sp+$71
	ld a, [hl]
	or a
	jp nz, Func_e2536
	ld hl, sp+$7b
	ld a, [hl]
	cp $2
	jp nz, Func_e2536
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $12
	jp nz, Func_e2536
	jp Func_e2581

Func_e2536: ; e2536 (38:6536)
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	call Func_e2829
	or a
	jp z, Func_e2581
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$7b
	ld [hl], e
	ld hl, sp+$7b
	ld a, [hl]
	call Func_e262f
	ld l, $3
	push hl
	ld c, $a
	ld e, $f
	ld a, $a
	call Func_3bc5
	pop bc
	call NextOverworldFrame
	jp Func_e258f

Func_e2581: ; e2581 (38:6581)
	ld hl, $97
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $97
	add hl, sp
	ld [hl], a
	jp Func_e24b3

Func_e258f: ; e258f (38:658f)
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	set_farcall_addrs_hli UpdateCurSprite
	pop de
	push de
	ld l, e
	ld h, $0
	ld b, $4
	call RightShiftHL
	reg16swap de, hl
	ld hl, sp+$72
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $c
	add hl, de
	push hl
	ld hl, sp+$7d
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $400
	add hl, de
	pop de
	add hl, de
	reg16swap de, hl
	xor a
	call FarCall
	callba_hli Func_d9f55
	pop de
	ld a, e
	inc a
	and $3f
	ld e, a
	ld hl, sp+$78
	ld a, [hl]
	and $10
	jp z, Func_e2626
	call NextOverworldFrame
	call NextOverworldFrame
	call NextOverworldFrame
	ld hl, sp+$79
	ld a, [hl]
	ld [wc7e2], a
	ld hl, sp+$79
	ld a, [hl]
	dec a
	jp Func_e2629

Func_e2626: ; e2626 (38:6626)
	jp Func_e24a3

Func_e2629: ; e2629 (38:6629)
	ld hl, $96
	add hl, sp
	ld sp, hl
	ret

Func_e262f: ; e262f (38:662f)
	push af
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $a
	ld hl, $a0f
	call FarCall
	ld e, $10
	ld a, $b
	call SetStringStartState
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $1c
	call FarCall
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	cp $f
	jp nz, Func_e2677
	ld a, e
	cp $1
	jp nz, Func_e2677
	ld hl, Data_e26ce
	push hl
	call PlaceString
	pop bc
	jp Func_e26cc

Func_e2677: ; e2677 (38:6677)
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $35
	call FarCall
	ld e, a
	push de
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $23
	call FarCall
	ld c, a
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $d
	jp nz, Func_e26ba
.asm_e26a5
	inc e
	dec e
	jp z, Func_e26ba
	inc c
	dec c
	jp nz, Func_e26ba
	ld hl, Data_e26d7
	push hl
	call PlaceString
	pop bc
	jp Func_e26cc

Func_e26ba: ; e26ba (38:66ba)
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_e1ff2 - 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PlaceString
	pop bc
Func_e26cc: ; e26cc (38:66cc)
	pop bc
	ret

Data_e26ce:
	db "セﾞロキャッスル", $0

Data_e26d7:
	db "セﾞロ(のしろ)", $0

Func_e26e0::
	push hl
	push bc
	ld hl, sp+$0
	ld a, [wc7e2]
	ld [hl], a
	set_farcall_addrs_hli CheckEventFlag
	ld hl, sp+$0
	ld a, [hl]
	cp $f
	jp nz, Func_e2712
	ld hl, $1c
	call FarCall
	cp $1
	jp nz, Func_e2712
	call GetHLAtSPPlus4
	ld de, Data_e276e
	call CopyUntilNull
	jp Func_e276b

Func_e2712: ; e2712 (38:6712)
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $35
	call FarCall
	ld e, a
	push de
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $23
	call FarCall
	ld c, a
	pop de
	ld hl, sp+$0
	ld a, [hl]
	cp $d
	jp nz, Func_e2756
	inc e
	dec e
	jp z, Func_e2756
	inc c
	dec c
	jp nz, Func_e2756
	call GetHLAtSPPlus4
	ld de, Data_e2777
	call CopyUntilNull
	jp Func_e276b

Func_e2756: ; e2756 (38:6756)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_e1ff2 - 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	pop de
	call CopyUntilNull
Func_e276b: ; e276b (38:676b)
	pop bc
	pop bc
	ret

Data_e276e:
	db "セﾞロキャッスル", $0

Data_e2777:
	db "セﾞロ(のしろ)", $0

Func_e2780:: ; e2780
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp nz, Func_e27a3
	ld hl, sp+$1
	ld a, [hl]
	call Func_e2829
	or a
	jp nz, Func_e27a3
	set_farcall_addrs_hli Func_93941
	ld a, $1
	call FarCall
Func_e27a3: ; e27a3 (38:67a3)
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp nz, Func_e27c5
	ld hl, sp+$1
	ld a, [hl]
	call Func_e2829
	or a
	jp nz, Func_e27c5
	set_farcall_addrs_hli Func_93941
	ld a, $2
	call FarCall
Func_e27c5: ; e27c5 (38:67c5)
	ld hl, sp+$1
	ld a, [hl]
	cp $b
	jp nz, Func_e27e7
	ld hl, sp+$1
	ld a, [hl]
	call Func_e2829
	or a
	jp nz, Func_e27e7
	set_farcall_addrs_hli Func_93941
	ld a, $3
	call FarCall
Func_e27e7: ; e27e7 (38:67e7)
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7e3
	add hl, de
	pop af
	or [hl]
	ld [hl], a
	pop bc
	ret

Func_e2807:: ; e2807 (38:6807)
	push af
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	cpl
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7e3
	add hl, de
	pop af
	and [hl]
	ld [hl], a
	pop bc
	ret

Func_e2829: ; e2829 (38:6829)
	push af
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7e3
	add hl, de
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_e284e
	ld a, $1
	jp Func_e284f

Func_e284e: ; e284e (38:684e)
	xor a
Func_e284f: ; e284f (38:684f)
	pop bc
	ret

Func_e2851:
	push af
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop de
	ld a, e
	ld hl, sp+$7
	cp [hl]
	jp nc, Func_e289b
	jp Func_e29f1

Func_e289b: ; e289b (38:689b)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nc, Func_e28b0
	ld hl, sp+$5
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$3
	ld [hl], e
Func_e28b0: ; e28b0 (38:68b0)
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_e28c5
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$2
	ld [hl], e
Func_e28c5: ; e28c5 (38:68c5)
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	ld [hl], $fc
	ld hl, sp+$3
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	ld [hl], $fc
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	ld [hl], $2
	ld hl, sp+$3
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	ld [hl], $2
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nz, Func_e2986
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	inc hl
	pop de
	push hl
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	inc hl
	reg16swap de, hl
	ld c, $1
Func_e2964: ; e2964 (38:6964)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	sub [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_e2983
	push de
	call GetHLAtSPPlus4
	ld [hl], $fd
	inc hl
	call WriteHLToSPPlus4
	pop de
	ld a, $6
	ld [de], a
	inc de
	inc c
	jp Func_e2964

Func_e2983: ; e2983 (38:6983)
	jp Func_e29f1

Func_e2986: ; e2986 (38:6986)
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$3
	cp [hl]
	jp nz, Func_e29f1
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 1
	add hl, de
	add hl, bc
	pop de
	push hl
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 1, wAttrMap
	add hl, de
	add hl, bc
	reg16swap de, hl
	ld c, $1
Func_e29c3: ; e29c3 (38:69c3)
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	sub [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_e29f1
	push de
	call GetHLAtSPPlus4
	ld [hl], $fe
	pop de
	push de
	ld a, $6
	ld [de], a
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	call WriteHLToSPPlus4
	pop de
	ld hl, $14
	add hl, de
	reg16swap de, hl
	inc c
	jp Func_e29c3

Func_e29f1: ; e29f1 (38:69f1)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e29f6:
	push hl
	set_farcall_addrs_hli AllocateMemory
	pop hl
	jp FarCall

Func_e2a06:
	push hl
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ret

Func_e2a17:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ret

Func_e2a24:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Func_e2a31:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Data_e2a3e:
	dr $e2a3e, $e2b56

Data_e2b56:
	dr $e2b56, $e2bf8

Func_e2bf8:: ; e2bf8 (38:6bf8)
	cp $ff
	jp nz, Func_e2c08
	ld hl, $0
	write_hl_to wc854
	jp Func_e2c28

Func_e2c08: ; e2c08 (38:6c08)
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_e2b56
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wc854
	read_hl_from wc854
	ld a, [hl]
	inc hl
	write_hl_to wc854
	ld [wc856], a
Func_e2c28: ; e2c28 (38:6c28)
	ret

Func_e2c29:: ; e2c29 (38:6c29)
	read_hl_from wc854
	ld a, l
	or h
	jp nz, Func_e2c35
	xor a
	ret

Func_e2c35: ; e2c35 (38:6c35)
	ld a, [wc856]
	or a
	jp nz, Func_e2c69
	read_hl_from wc854
	ld a, [hl]
	inc hl
	write_hl_to wc854
	call OverworldPlaySFX
	read_hl_from wc854
	ld a, [hl]
	inc hl
	write_hl_to wc854
	ld [wc856], a
	cp $ff
	jp nz, Func_e2c69
	ld hl, $0
	write_hl_to wc854
	xor a
	ret

Func_e2c69: ; e2c69 (38:6c69)
	ld a, [wc856]
	dec a
	ld [wc856], a
	ld a, $1
	ret

Data_e2c73:
	dr $e2c73, $e2c88

Data_e2c88:
	dr $e2c88, $e2cc7

Func_e2cc7:: ; e2cc7
	ld hl, -$90
	add hl, sp
	ld sp, hl
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2cd2: ; e2cd2 (38:6cd2)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2e0c
	set_farcall_addrs_hli Func_7dfc
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	reg16swap de, hl
	call FarCall
	read_hl_from_sp_plus $10
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $14
	write_hl_to_sp_plus $12
	ld hl, sp+$16
	ld [hl], $0
	set_farcall_addrs_hli Func_7db0
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	reg16swap de, hl
	call FarCall
	ld hl, sp+$7
	ld c, [hl]
	ld b, $0
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $e
	push hl
	ld hl, $90
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6e
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$0
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$23
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$28
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $8
	jp nc, Func_e2da9
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $0
	jp Func_e2dec

Func_e2da9: ; e2da9 (38:6da9)
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $8
	jp c, Func_e2dde
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $b
	jp nc, Func_e2dde
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $1
	jp Func_e2dec

Func_e2dde: ; e2dde (38:6dde)
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $2
Func_e2dec: ; e2dec (38:6dec)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2cd2

Func_e2e0c: ; e2e0c (38:6e0c)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2e12: ; e2e12 (38:6e12)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2e73
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub c
	ld c, a
	ld a, d
	sbc b
	ld b, a
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2e12

Func_e2e73: ; e2e73 (38:6e73)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2e79: ; e2e79 (38:6e79)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2f60
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_e2c88
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, $90
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$76
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, $92
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$70
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $a
	call DivideHLByDESigned
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc h
	ld h, a
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_e2f52
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
.asm_e2f52
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2e79

Func_e2f60: ; e2f60 (38:6f60)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2f66: ; e2f66 (38:6f66)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e3010
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $85
	add hl, sp
	ld [hl], a
Func_e2f7b: ; e2f7b (38:6f7b)
	ld hl, $85
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e3002
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_e2ff4
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld c, [hl]
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], c
Func_e2ff4: ; e2ff4 (38:6ff4)
	ld hl, $85
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $85
	add hl, sp
	ld [hl], a
	jp Func_e2f7b

Func_e3002: ; e3002 (38:7002)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2f66

Func_e3010: ; e3010 (38:7010)
	ld hl, $86
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	write_hl_to_sp_plus $5c
	read_hl_from_sp_plus $5c
	push hl
	ld hl, $89
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $5e
	read_hl_from_sp_plus $5e
	push hl
	ld hl, $8a
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $60
	read_hl_from_sp_plus $60
	push hl
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $62
	read_hl_from_sp_plus $62
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $54
	read_hl_from_sp_plus $54
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $56
	read_hl_from_sp_plus $56
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $58
	read_hl_from_sp_plus $58
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $5a
	ld hl, wTimeSetMonthsTensDigit
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wTimeSetMonthsOnesDigit]
	ld e, a
	ld d, $0
	add hl, de
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld hl, wTimeSetDaysTensDigit
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wTimeSetDaysOnesDigit]
	ld e, a
	ld d, $0
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $6c
	read_hl_from_sp_plus $6c
	push hl
	read_hl_from_sp_plus $5c
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, Func_e31aa
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $a
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $b
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $c
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $d
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $0
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], $0
	jp Func_e31b8

Func_e31aa: ; e31aa (38:71aa)
	read_hl_from_sp_plus $6c
	call Func_e330f
	or a
	jp nz, Func_e31b8
	call Func_e3379
Func_e31b8: ; e31b8 (38:71b8)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $d
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_e3222
	read_hl_from_sp_plus $6c
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	pop de
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $12
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_e3222: ; e3222 (38:7222)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e3309
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$7c
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$7d
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$7e
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$7f
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, $80
	add hl, sp
	ld [hl], e
	ld hl, $81
	add hl, sp
	ld a, [wc387]
	add $2
	ld [hl], a
	ld hl, $82
	add hl, sp
	ld [hl], $c
	ld a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [wca9c]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	and $2
	jp z, Func_e32ed
	ld hl, $83
	add hl, sp
	ld [hl], $0
	jp Func_e32f3

Func_e32ed: ; e32ed (38:72ed)
	ld hl, $83
	add hl, sp
	ld [hl], $1
Func_e32f3: ; e32f3 (38:72f3)
	ld hl, $84
	add hl, sp
	ld [hl], $0
	set_farcall_addrs_hli Func_9342a
	ld hl, sp+$7c
	call FarCall
Func_e3309: ; e3309 (38:7309)
	ld hl, $90
	add hl, sp
	ld sp, hl
	ret

Func_e330f: ; e330f (38:730f)
	ld de, $3c
	call DivideHLByDESigned
	ld de, $14
	call CompareHLtoDE
	jp c, Func_e3322
	xor a
	jp Func_e334c

Func_e3322: ; e3322 (38:7322)
	push hl
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	pop hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_e334a
	xor a
	jp Func_e334c

Func_e334a: ; e334a (38:734a)
	ld a, $ff
Func_e334c: ; e334c (38:734c)
	ret

Data_e334d:
	dr $e334d, $e3358

Data_e3358:
	dr $e3358, $e3363

Data_e3363:
	dr $e3363, $e336e

Data_e336e:
	dr $e336e, $e3379

Func_e3379: ; e3379 (38:7379)
	add sp, -$2e
	ld hl, sp+$21
	reg16swap de, hl
	ld hl, Data_e334d
	ld bc, $b
	call MemCopy
	ld hl, sp+$16
	reg16swap de, hl
	ld hl, Data_e3358
	ld bc, $b
	call MemCopy
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, Data_e3363
	ld bc, $b
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_e336e
	ld bc, $b
	call MemCopy
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	cp $3c
	jp nc, Func_e33e6
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $1
	jp Func_e341c

Func_e33e6: ; e33e6 (38:73e6)
	cp $50
	jp nc, Func_e3405
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $2
	jp Func_e341c

Func_e3405: ; e3405 (38:7405)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $3
Func_e341c: ; e341c (38:741c)
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	ld e, a
	ld hl, sp+$2c
	ld [hl], $0
	ld c, $0
Func_e3433: ; e3433 (38:7433)
	ld a, c
	cp $b
	jp nc, Func_e3504
	push de
	ld hl, sp+$2e
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	add [hl]
	ld hl, sp+$2e
	ld [hl], a
	pop de
	ld a, e
	ld hl, sp+$2c
	cp [hl]
	jp nc, Func_e3500
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e348a
	ld e, c
	ld d, $0
	ld hl, sp+$21
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
	jp Func_e34fd

Func_e348a: ; e348a (38:748a)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, Func_e34c5
	ld e, c
	ld d, $0
	ld hl, sp+$16
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
	jp Func_e34fd

Func_e34c5: ; e34c5 (38:74c5)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $3
	jp nz, Func_e34fd
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
Func_e34fd: ; e34fd (38:74fd)
	jp Func_e3504

Func_e3500: ; e3500 (38:7500)
	inc c
	jp Func_e3433

Func_e3504: ; e3504 (38:7504)
	add sp, $2e
	ret

Func_e3507:: ; e3507
	push bc
	push bc
	push bc
	push bc
	push bc
	ld c, $0
Func_e350e: ; e350e (38:750e)
	ld a, c
	cp $3
	jp nc, Func_e3613
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc327End
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e35e3
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc327End
	add hl, de
	ld de, $9
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e35e3
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc327End
	add hl, de
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc327End
	add hl, de
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc327End
	add hl, de
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	ld a, c
	add $2
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$8
	ld [hl], $c
	ld a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [wca9c]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	and $2
	jp z, Func_e35db
	ld hl, sp+$9
	ld [hl], $0
	jp Func_e35df

Func_e35db: ; e35db (38:75db)
	ld hl, sp+$9
	ld [hl], $1
Func_e35df: ; e35df (38:75df)
	pop bc
	jp Func_e35f9

Func_e35e3: ; e35e3 (38:75e3)
	push bc
	ld bc, $9
	ld e, $0
	ld hl, sp+$2
	call FillMemory
	pop bc
	ld a, c
	add $2
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$7
	ld [hl], $0
Func_e35f9: ; e35f9 (38:75f9)
	push bc
	ld hl, sp+$a
	ld [hl], $0
	set_farcall_addrs_hli Func_9342a
	ld hl, sp+$2
	call FarCall
	pop bc
	inc c
	jp Func_e350e

Func_e3613: ; e3613 (38:7613)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e3619: ; e3619 (38:7619)
	push hl
	push bc
	push bc
	push de
	call GetHLAtSPPlus8
	ld e, h
	ld hl, sp+$4
	ld [hl], e
	call GetHLAtSPPlus8
	ld e, l
	ld hl, sp+$3
	ld [hl], e
	pop de
	inc c
	dec c
	jp nz, Func_e36ac
	ld hl, sp+$0
	ld [hl], $0
Func_e3635: ; e3635 (38:7635)
	ld hl, sp+$0
	ld a, [hl]
	cp e
	jp nc, Func_e36a9
	push de
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $10
	or [hl]
	ld [hl], a
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $40
	or [hl]
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop de
	jp Func_e3635

Func_e36a9: ; e36a9 (38:76a9)
	jp Func_e3710

Func_e36ac: ; e36ac (38:76ac)
	xor a
Func_e36ad: ; e36ad (38:76ad)
	cp e
	jp nc, Func_e3710
	push de
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $20
	or [hl]
	ld [hl], a
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, $8
	or [hl]
	ld [hl], a
	pop af
	inc a
	pop de
	jp Func_e36ad

Func_e3710: ; e3710 (38:7710)
	pop bc
	pop bc
	pop bc
	ret

Func_e3714:: ; e3714 (38:7714)
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	read_hl_from_sp_plus $c
	ld e, h
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $c
	pop de
	push hl
	ld hl, sp+$7
	ld [hl], d
	ld hl, sp+$6
	ld [hl], b
	ld a, c
	pop hl
	push de
	push af
	ld e, l
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus8
	pop af
	ld e, a
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus4
	xor a
	pop de
.outer
	cp e
	jp nc, .quit
	push de
	push af
	ld c, $0
.inner
	ld a, c
	ld hl, sp+$9
	cp [hl]
	jp nc, .next
	call GetHLAtSPPlus8
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	jp .inner

.next
	call GetHLAtSPPlus8
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus6
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus6
	pop af
	inc a
	pop de
	jp .outer

.quit
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret
