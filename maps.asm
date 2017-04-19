INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

INCLUDE "maps/block_data.asm"

SECTION "Bank 20", ROMX, BANK [$20]
	lib_bank_20 20

INCLUDE "maps/scripts/unknown_81281.asm"
INCLUDE "maps/scripts/unknown_81607.asm"
INCLUDE "maps/scripts/unknown_81811.asm"
INCLUDE "maps/scripts/unknown_81973.asm"
INCLUDE "maps/scripts/unknown_819b0.asm"
INCLUDE "maps/scripts/unknown_81ac1.asm"
INCLUDE "maps/scripts/unknown_81d6a.asm"
INCLUDE "maps/scripts/unknown_82047.asm"
INCLUDE "maps/scripts/unknown_82079.asm"
INCLUDE "maps/scripts/unknown_8208c.asm"
INCLUDE "maps/scripts/unknown_82286.asm"
INCLUDE "maps/scripts/unknown_822dd.asm"
INCLUDE "maps/scripts/unknown_82335.asm"
INCLUDE "maps/scripts/unknown_8238b.asm"
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
	ld e, $3
	ld hl, Data_831e4
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_83205
	call Func_800fb_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d0
	call Func_80f72_20
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
	call Func_8044b_20
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
	ld e, $1
	ld hl, $108
	call EventFlagAction_20
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
	ld e, $1
	ld hl, $108
	call EventFlagAction_20
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
	ld e, $3
	ld hl, Data_8331a
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_8333b
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, Func_03d1
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_83399
	call LoadMapObjects_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d2
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_8340b
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_8342c
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, Func_03d3
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_8348a
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_834af
	call Func_800fb_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d4
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_83516
	call LoadMapObjects_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, GetSRAMBank
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_83588
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_835a9
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d6
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_83607
	call LoadMapObjects_20
	ld e, $2
	ld hl, Data_83628
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d7
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_8368b
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_836ac
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d8
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_8370a
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_8372b
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3d9
	call Func_80f72_20
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
	ld e, $3
	ld hl, Data_83789
	call LoadMapObjects_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3da
	call Func_80f72_20
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
	ld e, $2
	ld hl, Data_837fb
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_83811
	call Func_80ce7_20
	playmusic SONG_SHOP
	call Func_8001c_20
	ld hl, $3db
	call Func_80f72_20
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
	ld e, $2
	ld hl, Data_8386f
	call LoadMapObjects_20
	ld e, $3
	ld hl, Data_83885
	call Func_80ce7_20
	ld e, $1
	ld hl, Data_83894
	call Func_800fb_20
	playmusic SONG_SHOP
	call Func_83e56
	ld [wc7a4], a
	ld a, [wc7a4]
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
	call Func_8044b_20
	checkevent $58
	or a
	jp nz, Func_83a5e
	writenpctext TreeBitstreamText_45c80
	ld e, $1
	ld hl, $58
	call EventFlagAction_20
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
	ld e, $1
	ld hl, $110
	call EventFlagAction_20
Func_83adb: ; 83adb (20:7adb)
	checkevent $106
	or a
	jp nz, Func_83af3
	ld hl, $493
	call Func_80f72_20
	ld e, $1
	ld hl, $106
	call EventFlagAction_20
Func_83af3: ; 83af3 (20:7af3)
	checkevent $105
	or a
	jp nz, Func_83b0b
	ld hl, $494
	call Func_80f72_20
	ld e, $1
	ld hl, $105
	call EventFlagAction_20
Func_83b0b: ; 83b0b (20:7b0b)
	checkevent $104
	or a
	jp nz, Func_83b23
	ld hl, $48f
	call Func_80f72_20
	ld e, $1
	ld hl, $104
	call EventFlagAction_20
Func_83b23: ; 83b23 (20:7b23)
	checkevent $103
	or a
	jp nz, Func_83b3b
	ld hl, $492
	call Func_80f72_20
	ld e, $1
	ld hl, $103
	call EventFlagAction_20
Func_83b3b: ; 83b3b (20:7b3b)
	checkevent $102
	or a
	jp nz, Func_83b53
	ld hl, $491
	call Func_80f72_20
	ld e, $1
	ld hl, $102
	call EventFlagAction_20
Func_83b53: ; 83b53 (20:7b53)
	checkevent $101
	or a
	jp nz, Func_83b6b
	ld hl, $490
	call Func_80f72_20
	ld e, $1
	ld hl, $101
	call EventFlagAction_20
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
	call Func_277c
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
	call Func_80cd7_20
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
	call Func_8013d_20
	playsfx $2e
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
	db "G<HIRA>とられた<KATA>", $00

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
	ld e, $1
	ld hl, $38
	call EventFlagAction_21
	jp Func_851bc

Func_851b4: ; 851b4 (21:51b4)
	ld e, $0
	ld hl, $38
	call EventFlagAction_21
Func_851bc: ; 851bc (21:51bc)
	ld e, $6
	ld hl, Data_850b4
	call LoadMapObjects_21
	ld a, $1
	call Func_80cc6_21
	ld a, $2
	ld [wc7e2], a
	checkevent $32
	or a
	jp nz, Func_851fe
	ld e, $5
	ld hl, Data_850fa
	call Func_800fb_21
	ld e, $4
	ld hl, Data_85140
	call Func_800fb_21
	playmusic SONG_TOWN1
	call Func_8001c_21
	call Func_852ac
	ld e, $1
	ld hl, $32
	call EventFlagAction_21
	jp Func_85270

Func_851fe: ; 851fe (21:51fe)
	checkevent $5
	or a
	jp z, Func_85212
	checkevent $6
	or a
	jp nz, Func_85260
Func_85212: ; 85212 (21:5212)
	ld e, $5
	ld hl, Data_850fa
	call Func_800fb_21
	playmusic SONG_TOWN1
	ld e, $0
	ld a, $2
	call Func_8013d_21
	checkevent $5
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
	checkevent $6
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
	playmusic SONG_TOWN1
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
	script_sleep $3c
	ld c, $1
	ld e, $1
	ld a, $5
	call LoadEmote_21
	ld e, $f
	ld a, $17
	call ShowEmote_21
	playsfx $28
	call Func_801d5_21
	script_sleep $3c
	call Func_8018b_21
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld bc, Data_85274
	ld e, BANK(Data_85274)
	xor a
	call Func_801f7_21
	ld bc, Data_85278
	ld e, BANK(Data_85278)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	script_sleep $3c
	writenpctext TreeBitstreamText_399f1
	writenpctext TreeBitstreamText_39a27
	writenpctext TreeBitstreamText_39a42
	writenpctext TreeBitstreamText_39a5f
	playmusic SONG_NONE
	writenpctext TreeBitstreamText_39a7b
	playmusic SONG_18
	ld e, $0
	xor a
	call SpriteFace_21
	ld e, $0
	ld a, $1
	call SpriteFace_21
	ld bc, Data_8527c
	ld e, BANK(Data_8527c)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	playsfx $33
	ld bc, Data_85286
	ld e, BANK(Data_85286)
	ld a, $1
	call Func_80688_21
	call Func_8020c_21
	ld e, $1
	xor a
	call SpriteFace_21
	ld e, $3
	ld a, $1
	call SpriteFace_21
	ld bc, Data_8528a
	ld e, BANK(Data_8528a)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld e, $2
	ld a, $1
	call SpriteFace_21
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
	playmusic SONG_18
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
	playsfx $33
	ld e, $3
	ld a, $1
	call SpriteFace_21
	ld c, $1
	ld de, Data_85298
	ld a, BANK(Data_85298)
	call ApplyMovementData_21
	script_sleep $1e
	playsfx $2e
	call Func_8020c_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld e, $2
	ld a, $1
	call SpriteFace_21
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
	call PlayerFace_21
	ld e, $2
	xor a
	call SpriteFace_21
	ld e, $2
	ld a, $1
	call SpriteFace_21
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
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call EventFlagAction_21
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
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call EventFlagAction_21
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
	db "<HIRA>こふﾞん1<KATA>", $00

Data_8557a:
	db "<HIRA>こふﾞん2<KATA>", $00

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
	ld e, $3
	ld a, $1
	call SpriteFace_21
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
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call EventFlagAction_21
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
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call EventFlagAction_21
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
	db "<HIRA>こふﾞん2<KATA>", $00

Data_856e4:
	db "<HIRA>こふﾞん1<KATA>", $00

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
	ld e, $3
	ld a, $1
	call SpriteFace_21
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
	call Func_8020c_21
	ld e, $0
	ld a, $1
	call Func_8013d_21
	ld e, $1
	ld hl, $6
	call EventFlagAction_21
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
	call Func_8020c_21
	ld e, $0
	xor a
	call Func_8013d_21
	ld e, $1
	ld hl, $5
	call EventFlagAction_21
Func_8581b: ; 8581b (21:581b)
	pop bc
	pop bc
	ret

Data_8581e:
	db "<HIRA>こふﾞん2<KATA>", $00

Data_85826:
	db "<HIRA>こふﾞん1<KATA>", $00

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
	ld c, $1
	ld de, Data_8582e
	ld a, BANK(Data_8582e)
	call ApplyMovementData_21
	call Func_8020c_21
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	call Func_80653_21
	ld c, $1
	ld e, $1
	ld a, $b
	call LoadEmote_21
	playsfx $44
	call Func_801d5_21
	call Func_8018b_21
	ld a, $4
	call Func_80cc6_21
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
	call Func_8044b_21
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
	db "<HIRA>おんなのこ<KATA>", $00

Data_85938:
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $7e, $02, $03, $00, $09, $08
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $06
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $7e, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $02
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
	ld e, $1
	ld hl, $38
	call EventFlagAction_21
	jp Func_85a61

Func_85a59: ; 85a59 (21:5a59)
	ld e, $0
	ld hl, $38
	call EventFlagAction_21
Func_85a61: ; 85a61 (21:5a61)
	ld a, $1
	ld [wc7de], a
	ld e, $5
	ld hl, Data_85992
	call LoadMapObjects_21
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
	ld e, $5
	ld hl, Data_859c9
	call Func_800fb_21
	playmusic SONG_11
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
	ld e, $0
	ld a, $4
	call Func_8013d_21
	ld e, $1
	ld hl, Data_85a0f
	call Func_800fb_21
	checkevent $14
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
	call Func_8044b_21
	writenpctext TreeBitstreamText_39cd9
	playsfx $2a
	writetext TreeBitstreamText_39d70
	ld c, $0
	ld e, $1
	ld a, $17
	call Func_80d4d_21
	ld e, $1
	ld hl, $c0
	call EventFlagAction_21
	jp Func_85b6d

Func_85b52: ; 85b52 (21:5b52)
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_21
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
	call Func_8044b_21
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
	ld e, $1
	ld hl, $64
	call EventFlagAction_21
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
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $06
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
	ld e, $1
	ld hl, $38
	call EventFlagAction_21
	jp Func_85d22

Func_85d1a: ; 85d1a (21:5d1a)
	ld e, $0
	ld hl, $38
	call EventFlagAction_21
Func_85d22: ; 85d22 (21:5d22)
	ld a, $7
	ld [wc7de], a
	ld e, $2
	ld hl, Data_85c82
	call LoadMapObjects_21
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
	ld e, $5
	ld hl, Data_85c98
	call Func_800fb_21
	playmusic SONG_11
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
	ld e, $1
	ld hl, $6a
	call EventFlagAction_21
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
	db "<HIRA>りかの せんせい<KATA>", $00

Data_85e6d: ; 85e6d
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $02
ENDC

Data_85eb3: ; 85eb3
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $02
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
	ld e, $1
	ld hl, $38
	call EventFlagAction_21
	jp Func_85fb0

Func_85fa8: ; 85fa8 (21:5fa8)
	ld e, $0
	ld hl, $38
	call EventFlagAction_21
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
	ld e, $3
	ld hl, Data_85f05
	call LoadMapObjects_21
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
	playmusic SONG_11
Func_86019: ; 86019 (21:6019)
	call Func_8001c_21
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
	ld e, $2
	ld hl, Data_85f26
	call Func_800fb_21
Func_86057: ; 86057 (21:6057)
	ld hl, $2c6
	call Func_80f72_21
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
	ld e, $1
	ld hl, $66
	call EventFlagAction_21
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
	db "<HIRA>えいこﾞの せんせい<KATA>", $00

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
	ld e, $1
	ld hl, $68
	call EventFlagAction_21
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
	db "<HIRA>しゃかいの せんせい<KATA>", $00

Data_8620c: ; 8620c
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
ENDC

Data_86252: ; 86252
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
ENDC

Data_86298: ; 86298
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ENDC
IF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
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
	ld e, $1
	ld hl, $38
	call EventFlagAction_21
	jp Func_8643f

Func_86437: ; 86437 (21:6437)
	ld e, $0
	ld hl, $38
	call EventFlagAction_21
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
	playmusic SONG_11
Func_864a0: ; 864a0 (21:64a0)
	ld a, [wc7de]
	cp $6
	jp z, Func_86536
	cp $4
	jp z, Func_864f4
	cp $2
	jp nz, Func_86575
	ld e, $3
	ld hl, Data_862fe
	call LoadMapObjects_21
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
	call LoadMapObjects_21
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
	call LoadMapObjects_21
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
	ld e, $1
	ld hl, $c5
	call EventFlagAction_21
	jp Func_865df

Func_865be: ; 865be (21:65be)
	writenpctext TreeBitstreamText_3f8cd
	writetext TreeBitstreamText_3f8f1
	ld e, $0
	ld a, $7f
	call Func_80d74_21
	writenpctext TreeBitstreamText_3f901
	ld e, $1
	ld hl, $c5
	call EventFlagAction_21
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
	call Func_8044b_21
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
	ld e, $1
	ld hl, $65
	call EventFlagAction_21
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
	db "<HIRA>こくこﾞの せんせい<KATA>", $00

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
	ld e, $1
	ld hl, $67
	call EventFlagAction_21
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
	db "<HIRA>たいいくの せんせい<KATA>", $00

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
	ld e, $1
	ld hl, $69
	call EventFlagAction_21
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
	db "<HIRA>すうかﾞくの せんせい<KATA>", $00

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
	call LoadMapObjects_21
	checkevent $7
	or a
	jp nz, Func_868d5
	ld e, $4
	ld hl, Data_86836
	call Func_800fb_21
	call Func_8001c_21
	call Func_86943
	jp Func_868dd

Func_868d5: ; 868d5 (21:68d5)
	playmusic SONG_TOWN2
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
	playmusic SONG_NONE
	playmusic SONG_TITLE
	call Func_8020c_21
	ld c, $1
	ld de, Data_86907
	ld a, BANK(Data_86907)
	call ApplyMovementData_21
	call Func_8020c_21
	xor a
	call PlayerFace_21
	ld c, $1
	ld e, $1
	ld a, $7
	call LoadEmote_21
	playsfx $68
	call Func_801d5_21
	ld c, $1
	ld e, $1
	ld a, $7
	call LoadEmote_21
	playsfx $68
	call Func_801d5_21
	ld c, $1
	ld e, $1
	ld a, $7
	call LoadEmote_21
	playsfx $68
	call Func_801d5_21
	writenpctext TreeBitstreamText_3a38a
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
	call SpriteFace_21
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_3a3ac
	writenpctext TreeBitstreamText_3a3c2
	ld e, $2
	ld a, $2
	call SpriteFace_21
	writenpctext TreeBitstreamText_3a3dc
	startbattle Data_86ac4, Data_868de
	or a
	jp nz, Func_869e7
	ret

Func_869e7: ; 869e7 (21:69e7)
	playsfx $69
	writenpctext TreeBitstreamText_3a420
	playmusic SONG_NONE
	playmusic SONG_18
	ld bc, Data_86917
	ld e, BANK(Data_86917)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld a, $1
	call PlayerFace_21
	ld bc, Data_8691f
	ld e, BANK(Data_8691f)
	ld a, $2
	call Func_80688_21
	call Func_8020c_21
	ld e, $0
	ld a, $2
	call Func_8013d_21
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
	call PlayerFace_21
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
	playmusic SONG_NONE
	playmusic SONG_TOWN2
	script_sleep $1e
	ld bc, Data_8693f
	ld e, BANK(Data_8693f)
	ld a, $5
	call Func_80688_21
	call Func_8020c_21
	ld e, $2
	ld a, $5
	call SpriteFace_21
	script_sleep $1e
	xor a
	call PlayerFace_21
	script_sleep $1e
	writenpctext TreeBitstreamText_3a481
	ld e, $1
	ld hl, $7
	call EventFlagAction_21
	ld a, $8
	ld [wc790], a
	ret

Data_86ac4:
	db "ヒﾞスコ", $00

Func_86ac9:
	ld a, e
	or a
	jp nz, Func_86b0c
	ld e, $1
	ld a, $5
	call SpriteFace_21
	ld e, $0
	ld a, $5
	call SpriteFace_21
	ld e, $3
	ld a, $5
	call SpriteFace_21
	ld e, $2
	ld a, $5
	call SpriteFace_21
	script_sleep $1e
	ld e, $3
	ld a, $5
	call SpriteFace_21
	ld e, $0
	ld a, $5
	call SpriteFace_21
	ld e, $1
	ld a, $5
	call SpriteFace_21
	ld e, $2
	ld a, $5
	call SpriteFace_21
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
	ld c, $2
	ld e, $2
	ld a, $8
	call LoadEmote_21
	ld e, $4
	ld a, $e
	call ShowEmote_21
	call Func_801d5_21
	call Func_8018b_21
	playsfx $28
	ld e, $1
	xor a
	call Func_8013d_21
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
	playmusic SONG_14
	xor a
	call Func_8044b_21
	script_sleep $1e
	ld c, $8
	ld e, $7
	ld a, $6
	call Func_80e8d_21
	ld e, $1
	ld hl, $d6
	call EventFlagAction_21
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
	xor a
	call Func_8044b_21
	ld e, $0
	xor a
	call Func_8013d_21
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
	wildbot $05, $14, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $05, $14, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $05, $14, $04, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $05, $14, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $05, $14, $04, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $09, $15, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $09, $15, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $09, $15, $04, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $09, $15, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $09, $15, $04, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $0d, $16, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $0d, $16, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $0d, $16, $04, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $0d, $16, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $0d, $16, $04, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $11, $17, $04, $02, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $11, $17, $04, $02, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $11, $17, $04, $02, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $11, $17, $04, $02, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $11, $17, $04, $02, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $15, $16, $02, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $15, $16, $02, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $15, $16, $02, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $15, $16, $02, $03, $40, $0a, $0c, $0c, $02, $00, $00, $02, $05
	wildbot $15, $16, $02, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $17, $15, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $17, $15, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $17, $15, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $17, $15, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $17, $15, $03, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $1a, $14, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $1a, $14, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $1a, $14, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $1a, $14, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $1a, $14, $03, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $1d, $13, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $1d, $13, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $1d, $13, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $1d, $13, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $1d, $13, $03, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
	wildbot $20, $12, $02, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $20, $12, $02, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $20, $12, $02, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $20, $12, $02, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $20, $12, $02, $03, $69, $08, $0a, $7f, $05, $00, $00, $08, $04
ENDC
IF DEF(STAR)
	wildbot $05, $14, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $05, $14, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $05, $14, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $05, $14, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $05, $14, $04, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $09, $15, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $09, $15, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $09, $15, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $09, $15, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $09, $15, $04, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $0d, $16, $04, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $0d, $16, $04, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $0d, $16, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $0d, $16, $04, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $0d, $16, $04, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $11, $17, $04, $02, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $11, $17, $04, $02, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $11, $17, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $11, $17, $04, $02, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $11, $17, $04, $02, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $15, $16, $02, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $15, $16, $02, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $15, $16, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $15, $16, $02, $03, $40, $0a, $0c, $0c, $02, $00, $00, $02, $05
	wildbot $15, $16, $02, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $17, $15, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $17, $15, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $17, $15, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $17, $15, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $17, $15, $03, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $1a, $14, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $1a, $14, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $1a, $14, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $1a, $14, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $1a, $14, $03, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $1d, $13, $03, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $1d, $13, $03, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $1d, $13, $03, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $1d, $13, $03, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $1d, $13, $03, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
	wildbot $20, $12, $02, $03, $49, $0a, $0c, $01, $02, $00, $00, $02, $0a
	wildbot $20, $12, $02, $03, $43, $09, $0b, $7f, $06, $00, $00, $08, $09
	wildbot $20, $12, $02, $03, $84, $0c, $0e, $0c, $14, $00, $00, $0a, $06
	wildbot $20, $12, $02, $03, $40, $0a, $0c, $7f, $02, $00, $00, $02, $05
	wildbot $20, $12, $02, $03, $66, $08, $0a, $7b, $06, $00, $00, $08, $04
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
	ld e, $b
	ld hl, Data_86c01
	call LoadMapObjects_21
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
	ld e, $a
	ld hl, Data_86cf8
	call Func_800fb_21
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
	ld e, $0
	ld a, $8
	call Func_8013d_21
	ld e, $0
	ld a, $9
	call Func_8013d_21
Func_8706e: ; 8706e (21:706e)
	playmusic SONG_TOWN1
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
	ld a, $5
	call Func_8044b_21
	writetext TreeBitstreamText_414b4
	checkevent $f0
	or a
	jp nz, Func_87163
	ld e, $1
	ld hl, $f0
	call EventFlagAction_21
Func_87163: ; 87163 (21:7163)
	ret

Data_87164:
	dr $87164, $87185

Data_87185: ; 87185
	dr $87185, $8718a

Data_8718a: ; 8718a
IF DEF(SUN)
	wildbot $00, $03, $10, $10, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $03, $10, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $10, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $03, $10, $10, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $00, $03, $10, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC
IF DEF(STAR)
	wildbot $00, $03, $10, $10, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $03, $10, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $10, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $03, $10, $10, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $00, $03, $10, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_871d0
	dr $871d0, $871d4

Data_871d4: ; 871d4
	dr $871d4, $871fe

Func_871fe:
	ld e, $3
	ld hl, Data_87164
	call LoadMapObjects_21
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_8723b
	ld a, $1
	ld [wc7da], a
	call Func_8001c_21
	writenpctext TreeBitstreamText_3a89f
	call Func_8737a
	checkevent $f0
	or a
	jp nz, Func_87238
	ld e, $1
	ld hl, $f0
	call EventFlagAction_21
Func_87238: ; 87238 (21:7238)
	jp Func_87265

Func_8723b: ; 8723b (21:723b)
	ld a, $3
	call Func_80d01_21
	loadwilds $5, Data_8718a
	ld e, $1
	ld hl, Data_87185
	call Func_80ce7_21
	ld e, $3
	ld hl, Data_871d4
	call Func_800fb_21
	xor a
	ld [wc7da], a
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
	ld e, $1
	ld hl, $6c
	call EventFlagAction_21
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
	db "<HIRA>りょうし<KATA>", $00

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
	ld e, $1
	ld hl, $6d
	call EventFlagAction_21
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
	db "<HIRA>りょうし<KATA>", $00

Data_87376:
	dr $87376, $8737a

Func_8737a: ; 8737a (21:737a)
	ld c, $1
	ld de, Data_87376
	ld a, BANK(Data_87376)
	call ApplyMovementData_21
	call Func_8020c_21
	ret

Data_87388:
	dr $87388, $873a9

Data_873a9: ; 873a9
	dr $873a9, $873b3

Data_873b3: ; 873b3
IF DEF(SUN)
	wildbot $05, $03, $08, $10, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $05, $03, $08, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $08, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $08, $10, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $08, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $00, $03, $05, $09, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $03, $05, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $05, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ENDC
IF DEF(STAR)
	wildbot $05, $03, $08, $10, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $05, $03, $08, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $08, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $08, $10, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $08, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $00, $03, $05, $09, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $03, $05, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $05, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ENDC

Data_87423: ; 87423
	dr $87423, $8744d

Func_8744d:
	ld e, $3
	ld hl, Data_87388
	call LoadMapObjects_21
	ld e, $2
	ld hl, Data_873a9
	call Func_80ce7_21
	ld a, $3
	call Func_80d01_21
	loadwilds $8, Data_873b3
	ld e, $3
	ld hl, Data_87423
	call Func_800fb_21
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
	call Func_8001c_21
	ld hl, $2d6
	call Func_80f72_21
	ret

Func_87497:
	ld a, e
	or a
	jp nz, Func_874c2
	call Func_802e0_21
	playmusic SONG_NONE
	playmusic SONG_16
	ld c, $1
	ld e, $2
	ld a, $8
	call LoadEmote_21
	call Func_801d5_21
	call Func_8018b_21
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
	call Func_8044b_21
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
	ld e, $1
	ld hl, $6e
	call EventFlagAction_21
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
	db "<HIRA>りょうし<KATA>", $00

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
	ld e, $1
	ld hl, $6f
	call EventFlagAction_21
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
	ld e, $1
	ld hl, $109
	call EventFlagAction_21
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
	ld e, $1
	ld hl, $109
	call EventFlagAction_21
Func_87636: ; 87636 (21:7636)
	writetext TreeBitstreamText_42bc8
Func_8763c: ; 8763c (21:763c)
	pop bc
	ret

Data_8763e:
	db "<HIRA>かいてーしﾞん<KATA>", $00

Func_87648: ; 87648 (21:7648)
	ld e, $0
	ld hl, $18
	call EventFlagAction_21
	ld e, $0
	ld hl, $19
	call EventFlagAction_21
	ld e, $0
	ld hl, $1a
	call EventFlagAction_21
	ld e, $0
	ld hl, $4b
	call EventFlagAction_21
	ret

Data_87669:
	dr $87669, $87695

Data_87695: ; 87695
	dr $87695, $876c1

Data_876c1: ; 876c1
IF DEF(SUN)
	wildbot $00, $04, $18, $0a, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $04, $18, $0a, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $04, $18, $0a, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $04, $18, $0a, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $00, $04, $18, $0a, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $14, $0e, $05, $06, $05, $09, $0b, $2e, $01, $06, $00, $08, $0a
	wildbot $14, $0e, $05, $06, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $14, $0e, $05, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ENDC
IF DEF(STAR)
	wildbot $00, $04, $18, $0a, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $04, $18, $0a, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $04, $18, $0a, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $04, $18, $0a, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $00, $04, $18, $0a, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $14, $0e, $05, $06, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $14, $0e, $05, $06, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $14, $0e, $05, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
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
	ld e, $4
	ld hl, Data_87669
	call LoadMapObjects_21
	ld e, $4
	ld hl, Data_87731
	call Func_800fb_21
	jp Func_87828

Func_877f5: ; 877f5 (21:77f5)
	checkevent $51
	cp $1
	jp nz, Func_87820
	checkevent $4c
	or a
	jp nz, Func_87820
	call Func_87648
	ld e, $4
	ld hl, Data_87669
	call LoadMapObjects_21
	ld e, $2
	ld hl, Data_87769
	call Func_800fb_21
	jp Func_87828

Func_87820: ; 87820 (21:7820)
	ld e, $4
	ld hl, Data_87695
	call LoadMapObjects_21
Func_87828: ; 87828 (21:7828)
	ld a, $3
	call Func_80d01_21
	loadwilds $8, Data_876c1
	ld e, $5
	ld hl, Data_87785
	call Func_800fb_21
	playmusic SONG_CAVE
	ld a, $4
	ld [wc7e2], a
	ld a, [$c78a]
	cp $3
	jp nz, Func_8786b
	checkevent $fb
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
	ld [wc7c4], a
Func_878a7: ; 878a7 (21:78a7)
	jp Func_878ef

Func_878aa: ; 878aa (21:78aa)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	call Func_800e9_21
	or a
	jp z, Func_878ef
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $18
	call EventFlagAction_21
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
	call Func_800e9_21
	or a
	jp z, Func_87955
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $19
	call EventFlagAction_21
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
	call Func_800e9_21
	or a
	jp z, Func_879bb
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $1a
	call EventFlagAction_21
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
	call Func_800e9_21
	or a
	jp z, Func_87a21
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $4b
	call EventFlagAction_21
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
	call Func_800e9_21
	or a
	jp z, Func_87a71
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $18
	call EventFlagAction_21
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
	call Func_800e9_21
	or a
	jp z, Func_87ac1
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call Func_8013d_21
	ld e, $1
	ld hl, $19
	call EventFlagAction_21
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
	ld e, $1
	ld hl, $59
	call EventFlagAction_21
	playsfx $32
	writetext TreeBitstreamText_47029
	jp Func_87b13

Func_87b00: ; 87b00 (21:7b00)
	ld e, $0
	ld hl, $59
	call EventFlagAction_21
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
	ld [$c78a], a
	xor a
	call Func_80653_21
	ld c, $1
	ld e, $1
	ld a, $9
	call LoadEmote_21
	playsfx $5a
	call Func_801d5_21
	call Func_8018b_21
	ld a, $2
	call PlayerFace_21
	ld e, $0
	ld hl, $fa
	call EventFlagAction_21
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
	call Func_8001c_21
	ld hl, $2d7
	call Func_80f72_21
	ld c, $1
	ld e, $2
	ld a, $9
	call LoadEmote_21
	playsfx $37
	call Func_801d5_21
	ld a, $1
	call Func_80653_21
	script_sleep $1
	call Func_8018b_21
	ld e, $1
	ld hl, $fb
	call EventFlagAction_21
	ret

Data_87bd7:
	dr $87bd7, $87c03

Func_87c03: ; 87c03 (21:7c03)
	ld e, $1
	ld hl, $4c
	call EventFlagAction_21
	call Func_8002b_21
	ld e, $4
	ld hl, Data_87bd7
	call LoadMapObjects_21
	call Func_80ea2_21
	playsfx $64
	script_sleep $3c
	playsfx $64
	script_sleep $3c
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
	ld e, $1
	ld hl, $70
	call EventFlagAction_21
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
	db "<HIRA>おんなのこ<KATA>", $00

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
	ld e, $1
	ld hl, $71
	call EventFlagAction_21
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
	db "<HIRA>しﾞいさん<KATA>", $00

Data_87d45:
	dr $87d45, $87d50

Data_87d50: ; 87d50
IF DEF(SUN)
	wildbot $05, $03, $0f, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $06, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $0f, $06, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC
IF DEF(STAR)
	wildbot $05, $03, $0f, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $06, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $0f, $06, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_87d7a: ; 87d7a
	dr $87d7a, $87d88

Func_87d88:
	ld e, $1
	ld hl, Data_87d45
	call LoadMapObjects_21
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
	ld e, $1
	ld hl, Data_87d7a
	call Func_800fb_21
	playmusic SONG_CAVE
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
	ld e, $1
	ld hl, $51
	call EventFlagAction_21
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
	wildbot $05, $03, $0f, $09, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $05, $03, $0f, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $0f, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $0f, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC
IF DEF(STAR)
	wildbot $05, $03, $0f, $09, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $05, $03, $0f, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $0f, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $09, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $0f, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_87e90:
	dr $87e90, $87e94

Data_87e94: ; 87e94
	dr $87e94, $87ea2

Func_87ea2:
	ld e, $2
	ld hl, Data_87e34
	call LoadMapObjects_21
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
	ld e, $1
	ld hl, Data_87e94
	call Func_800fb_21
	playmusic SONG_CAVE
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
	dr $932bd, $93364

Func_93364: ; 93364 (24:7364)
	read_hl_from wc930
	ret

Func_9336a: ; 9336a (24:736a)
	read_hl_from wc92c
	ret

Func_93370:: ; 93370 (24:7370)
	push hl
	pop hl
	push hl
	push de
	push hl
	pop de
	pop hl
	read_hl_from wc930
	call Func_93792
	read_hl_from wc92e
	ld de, $3c
	call DivideHLByDESigned
	ld a, l
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from wc92e
	ld de, $3c
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
	ld a, [wc92e]
	ld [hl], a
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [wc92e + 1]
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
	ld a, [wc01c]
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
	ld a, [wc01c]
	or a
	jp nz, Func_93429
	ld a, $1
	ld [wc01c], a
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
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [$ca9c]
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
	dr $9a173, $9a1aa

Func_9a1aa: ; 9a1aa
	dr $9a1aa, $9a1bb

Func_9a1bb: ; 9a1bb (26:61bb)
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
.asm_9a32f
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
	db "<HIRA>ちか   0かい<KATA>", $00

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

Func_9a39e: ; 9a39e
	dr $9a39e, $9a41d

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
	db $00
ENDR

Data_9a67d: ; 9a67d
	dr $9a67d, $9a69f

Data_9a69f: ; 9a69f
REPT 11
	db $00
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
	call ShowEmote
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
	call ShowEmote
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
	call ShowEmote
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
	call ShowEmote
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

Func_9a84a::
	dr $9a84a, $9a87c

Func_9a87c: ; 9a87c
	dr $9a87c, $9a897

ShowEmote: ; 9a897
	add -5
	ld [wc832], a
	ld a, e
	add -4
	ld [wc833], a
	callba_hli ShowEmote_
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
	dr $d9f74, $d9f7e

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
	dr $da07a, $da093

Func_da093:: ; da093
	dr $da093, $da4dc

Func_da4dc:: ; da4dc (36:64dc)
	ld hl, wOAMBuffer
.loop
	ld a, l
	sub wOAMBufferEnd % $100
	ld a, h
	sbc wOAMBufferEnd / $100
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
	dr $da4fc, $da545

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
	dr $da631, $da729

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

INCLUDE "maps/enter_map.asm"
