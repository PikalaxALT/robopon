INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 20", ROMX
	script_library 20

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
	db $08, $01, $01, $01, $00, $11, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $13, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_83205: ; 83205
	db $08, $04, $03, $02, $01, $01, $01, $04, $00, $20, $6c, $72, $00, $00

Func_83213::
	call Func_8324c
	ld hl, Func_8324c
	scall Func_80f11
	ld a, $9
	ld [wc7de], a
	loadwarps $3, Data_831e4
	loadpeople $1, Data_83205
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46c4e
	ret

Data_83240:
	db $07, $01, $01, $01, $09, $01

Data_83246: ; 83246
	db $07, $01, $01, $01, $0a, $01

Func_8324c: ; 8324c (20:724c)
	ld a, [wc78c]
	cp $a
	jp nc, Func_8325a
	ld hl, Data_83240
	scall Func_80d9b
Func_8325a: ; 8325a (20:725a)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83268
	ld hl, Data_83246
	scall Func_80d9b
Func_83268: ; 83268 (20:7268)
	scall Func_80f02
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
	scall Func_80d4d
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
	scall Func_80d4d
	setevent $108
Func_83318: ; 83318 (20:7318)
	pop bc
	ret

Data_8331a:
	db $08, $01, $01, $01, $00, $14, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $12, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_8333b: ; 8333b
	db $65, $04, $06, $11, $30

Func_83340::
	call Func_83379
	ld hl, Func_83379
	scall Func_80f11
	ld a, $a
	ld [wc7de], a
	loadwarps $3, Data_8331a
	ld e, $1
	ld hl, Data_8333b
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	ld hl, Func_03d1
	call LandmarkSign_20
	ret

Data_8336d:
	db $05, $01, $01, $01, $08, $01

Data_83373: ; 83373
	db $05, $01, $01, $01, $0a, $01

Func_83379:
	ld a, [wc78c]
	cp $b
	jp nc, Func_83387
	ld hl, Data_8336d
	scall Func_80d9b
Func_83387: ; 83387 (20:7387)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83395
	ld hl, Data_83373
	scall Func_80d9b
Func_83395: ; 83395 (20:7395)
	scall Func_80f02
	ret

Data_83399:
	db $08, $01, $01, $01, $00, $13, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $15, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Func_833ba::
	call Func_833eb
	ld hl, Func_833eb
	scall Func_80f11
	ld a, $b
	ld [wc7de], a
	loadwarps $3, Data_83399
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46c6a
	ret

Data_833df:
	db $06, $01, $01, $01, $09, $01

Data_833e5: ; 833e5
	db $06, $01, $01, $01, $0a, $01

Func_833eb:
	ld a, [wc78c]
	cp $c
	jp nc, Func_833f9
	ld hl, Data_833df
	scall Func_80d9b
Func_833f9: ; 833f9 (20:73f9)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83407
	ld hl, Data_833e5
	scall Func_80d9b
Func_83407: ; 83407 (20:7407)
	scall Func_80f02
	ret

Data_8340b:
	db $08, $01, $01, $01, $00, $16, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $14, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_8342c: ; 8342c
	db $6a, $00, $02, $11, $4b

Func_83431::
	call Func_8346a
	ld hl, Func_8346a
	scall Func_80f11
	ld a, $c
	ld [wc7de], a
	loadwarps $3, Data_8340b
	ld e, $1
	ld hl, Data_8342c
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	ld hl, Func_03d3
	call LandmarkSign_20
	ret

Data_8345e:
	db $05, $01, $01, $01, $08, $01

Data_83464: ; 83464
	db $05, $01, $01, $01, $0a, $01

Func_8346a:
	ld a, [wc78c]
	cp $d
	jp nc, Func_83478
	ld hl, Data_8345e
	scall Func_80d9b
Func_83478: ; 83478 (20:7478)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83486
	ld hl, Data_83464
	scall Func_80d9b
Func_83486: ; 83486 (20:7486)
	scall Func_80f02
	ret

Data_8348a:
	db $08, $01, $01, $01, $00, $15, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $17, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $71, $04, $ff, $ff

Data_834af: ; 834af
	db $32, $0c, $01, $03, $01, $01, $01, $04, $00, $20, $fc, $48, $ab, $74

Func_834bd::
	call Func_834f6
	ld hl, Func_834f6
	scall Func_80f11
	ld a, $d
	ld [wc7de], a
	loadwarps $3, Data_8348a
	loadpeople $1, Data_834af
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46c83
	ret

Data_834ea:
	db $05, $01, $01, $01, $09, $01

Data_834f0: ; 834f0
	db $05, $01, $01, $01, $0a, $01

Func_834f6: ; 834f6 (20:74f6)
	ld a, [wc78c]
	cp $e
	jp nc, Func_83504
	ld hl, Data_834ea
	scall Func_80d9b
Func_83504: ; 83504 (20:7504)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83512
	ld hl, Data_834f0
	scall Func_80d9b
Func_83512: ; 83512 (20:7512)
	scall Func_80f02
	ret

Data_83516:
	db $08, $01, $01, $01, $00, $18, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $16, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Func_83537::
	call Func_83568
	ld hl, Func_83568
	scall Func_80f11
	ld a, $e
	ld [wc7de], a
	loadwarps $3, Data_83516
	playmusic SONG_SHOP
	scall FadeInMap
	ld hl, GetSRAMBank
	call LandmarkSign_20
	ret

Data_8355c:
	db $04, $01, $01, $01, $08, $01

Data_83562: ; 83562
	db $04, $01, $01, $01, $0a, $01

Func_83568:
	ld a, [wc78c]
	cp $f
	jp nc, Func_83576
	ld hl, Data_8355c
	scall Func_80d9b
Func_83576: ; 83576 (20:7576)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83584
	ld hl, Data_83562
	scall Func_80d9b
Func_83584: ; 83584 (20:7584)
	scall Func_80f02
	ret

Data_83588:
	db $08, $01, $01, $01, $00, $17, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $19, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_835a9: ; 835a9
	db $6b, $01, $04, $11, $4e

Func_835ae::
	call Func_835e7
	ld hl, Func_835e7
	scall Func_80f11
	ld a, $f
	ld [wc7de], a
	loadwarps $3, Data_83588
	ld e, $1
	ld hl, Data_835a9
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46c9b
	ret

Data_835db:
	db $05, $01, $01, $01, $09, $01

Data_835e1: ; 835e1
	db $05, $01, $01, $01, $0a, $01

Func_835e7: ; 835e7 (20:75e7)
	ld a, [wc78c]
	cp $10
	jp nc, Func_835f5
	ld hl, Data_835db
	scall Func_80d9b
Func_835f5: ; 835f5 (20:75f5)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83603
	ld hl, Data_835e1
	scall Func_80d9b
Func_83603: ; 83603 (20:7603)
	scall Func_80f02
	ret

Data_83607:
	db $08, $01, $01, $01, $00, $1a, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $18, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_83628: ; 83628
	db $6c, $00, $09, $01, $26, $6d, $07, $09, $01, $25

Func_83632::
	call Func_8366b
	ld hl, Func_8366b
	scall Func_80f11
	ld a, $10
	ld [wc7de], a
	loadwarps $3, Data_83607
	ld e, $2
	ld hl, Data_83628
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46ca8
	ret

Data_8365f:
	db $07, $01, $01, $01, $08, $01

Data_83665: ; 83665
	db $07, $01, $01, $01, $0a, $01

Func_8366b:
	ld a, [wc78c]
	cp $11
	jp nc, Func_83679
	ld hl, Data_8365f
	scall Func_80d9b
Func_83679: ; 83679 (20:7679)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83687
	ld hl, Data_83665
	scall Func_80d9b
Func_83687: ; 83687 (20:7687)
	scall Func_80f02
	ret

Data_8368b:
	db $08, $01, $01, $01, $00, $19, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $1b, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_836ac: ; 836ac
	db $6e, $01, $02, $13, $15

Func_836b1::
	call Func_836ea
	ld hl, Func_836ea
	scall Func_80f11
	ld a, $11
	ld [wc7de], a
	loadwarps $3, Data_8368b
	ld e, $1
	ld hl, Data_836ac
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46cb3
	ret

Data_836de:
	db $06, $01, $01, $01, $09, $01

Data_836e4: ; 836e4
	db $06, $01, $01, $01, $0a, $01

Func_836ea: ; 836ea (20:76ea)
	ld a, [wc78c]
	cp $12
	jp nc, Func_836f8
	ld hl, Data_836de
	scall Func_80d9b
Func_836f8: ; 836f8 (20:76f8)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83706
	ld hl, Data_836e4
	scall Func_80d9b
Func_83706: ; 83706 (20:7706)
	scall Func_80f02
	ret

Data_8370a:
	db $08, $01, $01, $01, $00, $1c, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $1a, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_8372b: ; 8372b
	db $6f, $04, $02, $12, $34

Func_83730::
	call Func_83769
	ld hl, Func_83769
	scall Func_80f11
	ld a, $12
	ld [wc7de], a
	loadwarps $3, Data_8370a
	ld e, $1
	ld hl, Data_8372b
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46cbf
	ret

Data_8375d:
	db $05, $01, $01, $01, $08, $01

Data_83763: ; 83763
	db $05, $01, $01, $01, $0a, $01

Func_83769: ; 83769 (20:7769)
	ld a, [wc78c]
	cp $13
	jp nc, Func_83777
	ld hl, Data_8375d
	scall Func_80d9b
Func_83777: ; 83777 (20:7777)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83785
	ld hl, Data_83763
	scall Func_80d9b
Func_83785: ; 83785 (20:7785)
	scall Func_80f02
	ret

Data_83789:
	db $08, $01, $01, $01, $00, $1b, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $1d, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Func_837aa::
	call Func_837db
	ld hl, Func_837db
	scall Func_80f11
	ld a, $13
	ld [wc7de], a
	loadwarps $3, Data_83789
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46ccb
	ret

Data_837cf:
	db $04, $01, $01, $01, $09, $01

Data_837d5: ; 837d5
	db $04, $01, $01, $01, $0a, $01

Func_837db:
	ld a, [wc78c]
	cp $14
	jp nc, Func_837e9
	ld hl, Data_837cf
	scall Func_80d9b
Func_837e9: ; 837e9 (20:77e9)
	ld a, [wc78c]
	cp $5
	jp nc, Func_837f7
	ld hl, Data_837d5
	scall Func_80d9b
Func_837f7: ; 837f7 (20:77f7)
	scall Func_80f02
	ret

Data_837fb:
	db $09, $01, $01, $01, $00, $1c, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_83811: ; 83811
	db $70, $05, $02, $11, $47

Func_83816::
	call Func_8384f
	ld hl, Func_8384f
	scall Func_80f11
	ld a, $14
	ld [wc7de], a
	loadwarps $2, Data_837fb
	ld e, $1
	ld hl, Data_83811
	scall Func_80ce7
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46cd7
	ret

Data_83843:
	db $00, $01, $01, $01, $08, $01

Data_83849: ; 83849
	db $00, $01, $01, $01, $0a, $01

Func_8384f:
	ld a, [wc78c]
	cp $15
	jp nc, Func_8385d
	ld hl, Data_83843
	scall Func_80d9b
Func_8385d: ; 8385d (20:785d)
	ld a, [wc78c]
	cp $5
	jp nc, Func_8386b
	ld hl, Data_83849
	scall Func_80d9b
Func_8386b: ; 8386b (20:786b)
	scall Func_80f02
	ret

Data_8386f:
	db $08, $01, $01, $01, $00, $0a, $0c, $01, $0c, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_83885: ; 83885
	db $2b, $01, $08, $13, $15, $2c, $00, $05, $13, $1e, $2d, $02, $05, $13, $1f

Data_83894: ; 83894
	db $2a, $0c, $07, $05, $01, $01, $01, $04, $00, $20, $1f, $7a, $00, $00

Func_838a2::
	call Func_838f0
	ld hl, Func_838f0
	scall Func_80f11
	xor a
	ld [wc7de], a
	loadwarps $2, Data_8386f
	ld e, $3
	ld hl, Data_83885
	scall Func_80ce7
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
	scall FadeInMap
	landmarksign TreeBitstreamText_46c00
	ret

Data_838ea: ; 838ea
	db $09, $01, $01, $01, $0a, $01

Func_838f0: ; 838f0 (20:78f0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83901
	ld hl, Data_838ea
	scall Func_80d9b
	scall Func_80f02
Func_83901: ; 83901 (20:7901)
	ret

Data_83902:
	db $32, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $32, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $00, $2c, $01, $00, $00, $c8, $00, $00, $00, $2c, $01, $00, $00, $90, $01, $00, $00, $2c, $01, $00, $00, $90, $01, $00, $00, $58, $02, $00, $00, $90, $01, $00, $00, $58, $02, $00, $00, $20, $03, $00, $00, $58, $02, $00, $00, $20, $03, $00, $00, $b0, $04, $00, $00, $20, $03, $00, $00, $b0, $04, $00, $00, $40, $06, $00, $00, $b0, $04, $00, $00, $40, $06, $00, $00, $60, $09, $00, $00, $40, $06, $00, $00, $60, $09, $00, $00, $80, $0c, $00, $00, $60, $09, $00, $00, $80, $0c, $00, $00, $c0, $12, $00, $00, $80, $0c, $00, $00, $c0, $12, $00, $00, $00, $19, $00, $00, $c0, $12, $00, $00, $00, $19, $00, $00, $80, $25, $00, $00, $00, $19, $00, $00, $80, $25, $00, $00, $00, $32, $00, $00, $80, $25, $00, $00, $00, $32, $00, $00, $00, $4b, $00, $00, $00, $32, $00, $00, $00, $4b, $00, $00, $00, $64, $00, $00, $00, $4b, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $f4, $2d, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05

Data_839ff: ; 839ff
	db $05, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17

Data_83a13: ; 83a13
	db $08, $01, $ff, $ff

Data_83a17: ; 83a17
	db $06, $07, $09, $02, $08, $01, $ff, $ff

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
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
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
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$2f
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
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
	scall Func_80688
	playsfx $2e
	jp Func_83d57

Func_83d45: ; 83d45 (20:7d45)
	ld bc, Data_83a13
	ld e, BANK(Data_83a13)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	scall Func_80688
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
	scall Func_80f94
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
	dstr "G(とられた)"

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
	scall Func_80f94
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

