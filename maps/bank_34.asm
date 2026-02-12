INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 34", ROMX
	script_library 34

Data_d10b4:
	db $0f, $20, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $0f, $04, $01, $01, $1d, $01, $0a, $11, $0a, $10, $2e, $06, $0d, $01, $01, $20, $08, $05, $09, $05, $08, $2e, $14, $13, $01, $01, $20, $06, $07, $0c, $07, $0b, $2e, $16, $0d, $01, $01, $20, $07, $05, $09, $05, $08, $2e, $13, $08, $01, $01, $20, $05, $06, $0b, $06, $0a, $2e, $08, $13, $01, $01, $20, $01, $01, $08, $01, $07, $2e, $0a, $19, $01, $01, $20, $01, $01, $08, $01, $07, $2e, $12, $19, $01, $01, $20, $01, $01, $08, $01, $07, $2e, $82, $03, $ff, $ff, $81, $03, $ff, $ff, $23, $03, $24, $03, $25, $03, $ff, $ff, $11, $01, $ff, $ff, $84, $03, $ff, $ff, $21, $01, $ff, $ff, $85, $03, $ff, $ff, $cf, $01, $ff, $ff, $4e, $04, $ff, $ff, $1a, $19, $05

Data_d1142:
	db $1a, $19, $05, $00, $00

Data_d1147:
	db $03, $04, $19, $07, $01, $01, $01, $04, $00, $34, $1f, $52, $00, $00, $ff, $00, $0e, $05, $01, $01, $00, $04, $00, $34, $5f, $48, $17, $51, $ff, $00, $0e, $1f, $01, $01, $00, $04, $00, $34, $5f, $48, $1b, $51, $ff, $00, $10, $1f, $01, $01, $00, $04, $00, $34, $5f, $48, $1b, $51, $00, $04, $18, $05, $01, $01, $03, $04, $00, $34, $dd, $46, $3f, $51, $ff, $00, $0f, $0d, $01, $01, $00, $04, $00, $34, $7c, $4a, $1f, $51, $00, $04, $11, $1c, $01, $01, $02, $04, $00, $34, $5f, $48, $27, $51, $02, $04, $0d, $11, $01, $01, $00, $04, $00, $34, $5f, $48, $2b, $51, $01, $04, $12, $0b, $01, $01, $02, $04, $00, $34, $5f, $48, $2f, $51, $06, $04, $0b, $08, $01, $01, $03, $04, $00, $34, $5f, $48, $33, $51, $04, $04, $08, $1c, $01, $01, $03, $04, $00, $34, $5f, $48, $37, $51, $01, $04, $10, $15, $01, $01, $02, $04, $00, $34, $5f, $48, $3b, $51

Func_d11ef:: ; d11ef (34:51ef)
	ld a, $d
	ld [wc789], a
	ld a, $12
	ld [wc7e2], a
	ld e, $1
	ld hl, Data_d1142
	scall Func_80ce7
	loadwarps $9, Data_d10b4
	loadpeople $c, Data_d1147
	ld a, $1
	call LoadPlayerSprite_34
	playmusic SONG_TOWN2
	scall FadeInMap
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
	scall FacePlayer
	ld a, [wc796]
	cp $6
	jp nz, Func_d12ba
	ld a, $4e
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, Func_d12b7
	writenpctext TreeBitstreamText_45564
	ld a, $4e
	scall Func_80e7d
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
	scall Func_80488
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
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp z, Func_d1341
	writenpctext TreeBitstreamText_45564
	ld a, $51
	scall Func_80e7d
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
	scall Func_80488
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
	scall Func_80e6d
	ld hl, sp+$1
	ld [hl], a
	cp $ff
	jp nz, Func_d135e
	ld a, $51
	scall Func_80e6d
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
	db $06, $04, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $06, $04, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $06, $04, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $06, $04, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $06, $04, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e

Data_d148e: ; d148e
	db $0a, $04, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $0a, $04, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $0a, $04, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $0a, $04, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $0a, $04, $01, $01, $1d, $18, $16, $13, $16, $12, $2e

Data_d14c5: ; d14c5
	db $0e, $04, $01, $01, $1d, $1e, $12, $0f, $12, $10, $2e, $0e, $04, $01, $01, $1d, $1f, $0f, $0f, $0e, $0f, $2e, $0e, $04, $01, $01, $1d, $20, $13, $10, $12, $10, $2e, $0e, $04, $01, $01, $1d, $21, $0e, $0f, $0d, $0f, $2e, $0e, $04, $01, $01, $1d, $22, $0e, $0e, $0d, $0e, $2e

Data_d14fc: ; d14fc
	db $09, $11, $03, $01, $1d, $00, $0f, $04, $0f, $05, $2e

Data_d1507: ; d1507
	db $2a, $0c, $0a, $06, $01, $01, $02, $04, $00, $34, $80, $56, $00, $00, $1b, $04, $06, $04, $01, $01, $02, $04, $00, $34, $00, $00, $00, $00, $1b, $04, $0a, $04, $01, $01, $02, $04, $00, $34, $00, $00, $00, $00, $1b, $04, $0e, $04, $01, $01, $02, $04, $00, $34, $00, $00, $00, $00

Func_d153f:: ; d153f (34:553f)
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
	scall FadeInMap
	ld a, [wBackupMapNumber]
	or a
	jp z, Func_d166f
	call Func_d1749
	xor a
	ld [wBackupMapNumber], a
Func_d166f: ; d166f (34:566f)
	ret

Data_d1670:
	db $09, $06, $ff, $ff

Data_d1674: ; d1674
	db $0b, $06, $ff, $ff

Data_d1678: ; d1678
	db $0a, $07, $ff, $ff

Data_d167c: ; d167c
	db $0a, $06, $ff, $ff

Func_d1680:
	push af
	ld a, e
	or a
	jp nz, Func_d1729
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld a, [wPlayerFacing]
	or a
	jp nz, Func_d16b1
	writenpctext TreeBitstreamText_47cc9
	ld e, $0
	ld a, $11
	scall Func_806a0
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
	scall Func_80688
	jp Func_d16e8

Func_d16df: ; d16df (34:56df)
	ld bc, Data_d1670
	ld e, $34
	xor a
	scall Func_80688
Func_d16e8: ; d16e8 (34:56e8)
	call WaitNPCStep_34
	move_player $1, Data_d1678
	ld bc, Data_d167c
	ld e, $34
	xor a
	scall Func_80688
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
	db $07, $05, $0a, $05, $ff, $ff

Data_d1731: ; d1731
	db $0b, $05, $0a, $05, $ff, $ff

Data_d1737: ; d1737
	db $0f, $05, $0a, $05, $ff, $ff

Data_d173d: ; d173d
	db $09, $06, $ff, $ff

Data_d1741: ; d1741
	db $0a, $07, $ff, $ff

Data_d1745: ; d1745
	db $0a, $06, $ff, $ff

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
	scall Func_80d62
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
	scall Func_80d74
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
ELIF DEF(STAR)
	ld a, $98
ENDC
	call GiveRobot_34
	cp $ff
	jp nz, Func_d1858
Func_d1858: ; d1858 (34:5858)
IF DEF(SUN)
	ld hl, $3b7
ELIF DEF(STAR)
	ld hl, $20
ENDC
	call PrintTextStandard_34
	setevent $62
Func_d1866: ; d1866 (34:5866)
	ld bc, Data_d173d
	ld e, $34
	xor a
	scall Func_80688
	call WaitNPCStep_34
	ld e, $1
	xor a
	call SpriteFace_34
	move_player $1, Data_d1741
	ld bc, Data_d1745
	ld e, $34
	xor a
	scall Func_80688
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
	db $09, $06, $ff, $ff

Data_d18b2: ; d18b2
	db $0a, $05, $ff, $ff

Data_d18b6: ; d18b6
	db $0a, $06, $ff, $ff

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
	scall Func_80688
	call WaitNPCStep_34
	ld e, $1
	xor a
	call SpriteFace_34
	move_player $1, Data_d18b2
	ld bc, Data_d18b6
	ld e, $34
	xor a
	scall Func_80688
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
	db $0a, $10, $01, $01, $1d, $01, $06, $04, $07, $04, $2e

Data_d1963: ; d1963
	db $01, $17, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $01, $17, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $01, $17, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $01, $17, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $04, $13, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $04, $13, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $04, $13, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $04, $13, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $13, $17, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $13, $17, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $13, $17, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $13, $17, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e

Data_d19e7: ; d19e7
IF DEF(SUN)
	db $00, $03, $18, $15, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00, $00, $03, $18, $15, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00, $00, $03, $18, $15, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $18, $15, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00, $00, $03, $18, $15, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $18, $15, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00, $00, $03, $18, $15, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00, $00, $03, $18, $15, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $18, $15, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $18, $15, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d1a2d: ; d1a2d
IF DEF(SUN)
	db $00, $03, $18, $15, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $18, $15, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00, $00, $03, $18, $15, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00, $00, $03, $18, $15, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $03, $18, $15, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $18, $15, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $18, $15, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $18, $15, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00, $00, $03, $18, $15, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00, $00, $03, $18, $15, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d1a73: ; d1a73
IF DEF(SUN)
	db $00, $03, $18, $15, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00, $00, $03, $18, $15, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $03, $18, $15, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00, $00, $03, $18, $15, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $18, $15, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $18, $15, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00, $00, $03, $18, $15, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00, $00, $03, $18, $15, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00, $00, $03, $18, $15, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00, $00, $03, $18, $15, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d1ab9: ; d1ab9
IF DEF(SUN)
	db $00, $03, $18, $15, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $18, $15, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00, $00, $03, $18, $15, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00, $00, $03, $18, $15, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00, $00, $03, $18, $15, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $18, $15, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $18, $15, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00, $00, $03, $18, $15, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00, $00, $03, $18, $15, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00, $00, $03, $18, $15, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d1aff:: ; d1aff (34:5aff)
	ld l, $0
	push hl
	ld c, $6
	ld e, $5
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $6
	ld e, $b
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $3
	ld e, $11
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $14
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $12
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $c
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $15
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $c
	ld a, $14
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
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
	scall Func_80d01
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
	scall Func_80f11
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
	scall FadeInMap
	ld a, [wc7de]
	cp $14
	jp nz, Func_d1cec
	writetext TreeBitstreamText_47e17
	jp Func_d1cf5

Func_d1cec: ; d1cec (34:5cec)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_d1cf5: ; d1cf5 (34:5cf5)
	ret

Data_d1cf6:
	db $17, $01, $01, $01, $01, $17, $17, $01, $01, $01, $04, $13, $17, $01, $01, $01, $13, $17

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
	scall Func_80d9b
	scall Func_80f02
	ret

Data_d1d1e: ; d1d1e
	db $0a, $10, $01, $01, $1d, $01, $06, $04, $07, $04, $2e

Data_d1d29: ; d1d29
	db $01, $08, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $01, $08, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $01, $08, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $01, $08, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $07, $0b, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $07, $0b, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $07, $0b, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $07, $0b, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $11, $0b, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $11, $0b, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $11, $0b, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $11, $0b, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e

Data_d1dad: ; d1dad
IF DEF(SUN)
	db $00, $06, $1a, $10, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00, $00, $06, $1a, $10, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00, $00, $06, $1a, $10, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $1a, $10, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00, $00, $06, $1a, $10, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $1a, $10, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00, $00, $06, $1a, $10, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00, $00, $06, $1a, $10, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $1a, $10, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $1a, $10, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d1df3: ; d1df3
IF DEF(SUN)
	db $00, $06, $1a, $10, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $1a, $10, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00, $00, $06, $1a, $10, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00, $00, $06, $1a, $10, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $06, $1a, $10, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $1a, $10, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $1a, $10, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $1a, $10, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00, $00, $06, $1a, $10, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00, $00, $06, $1a, $10, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d1e39: ; d1e39
IF DEF(SUN)
	db $00, $06, $1a, $10, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00, $00, $06, $1a, $10, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $06, $1a, $10, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00, $00, $06, $1a, $10, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $1a, $10, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $1a, $10, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00, $00, $06, $1a, $10, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00, $00, $06, $1a, $10, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00, $00, $06, $1a, $10, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00, $00, $06, $1a, $10, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d1e7f: ; d1e7f
IF DEF(SUN)
	db $00, $06, $1a, $10, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $1a, $10, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00, $00, $06, $1a, $10, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00, $00, $06, $1a, $10, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00, $00, $06, $1a, $10, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $1a, $10, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $1a, $10, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00, $00, $06, $1a, $10, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00, $00, $06, $1a, $10, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00, $00, $06, $1a, $10, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d1ec5:: ; d1ec5 (34:5ec5)
	ld l, $0
	push hl
	ld c, $e
	ld e, $e
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $c
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $c
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $9
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $f
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
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
	scall Func_80d01
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
	scall Func_80f11
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
	scall FadeInMap
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2023
	writetext TreeBitstreamText_47e17
	jp Func_d202c

Func_d2023: ; d2023 (34:6023)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_d202c: ; d202c (34:602c)
	ret

Data_d202d:
	db $18, $00, $01, $01, $01, $08, $18, $00, $01, $01, $07, $0b, $18, $00, $01, $01, $11, $0b

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
	scall Func_80d9b
	scall Func_80f02
	ret

Data_d2055: ; d2055
	db $04, $0e, $01, $01, $1d, $01, $06, $04, $07, $04, $2e

Data_d2060: ; d2060
	db $01, $07, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $01, $07, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $01, $07, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $01, $07, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $0d, $07, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $0d, $07, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $0d, $07, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $0d, $07, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $18, $07, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $18, $07, $01, $01, $1d, $0b, $0a, $10, $0a, $11, $2e, $18, $07, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $18, $07, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e

Data_d20e4: ; d20e4
IF DEF(SUN)
	db $00, $05, $1a, $16, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00, $00, $05, $1a, $16, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00, $00, $05, $1a, $16, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00, $00, $05, $1a, $16, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00, $00, $05, $1a, $16, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $05, $1a, $16, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00, $00, $05, $1a, $16, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00, $00, $05, $1a, $16, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $05, $1a, $16, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00, $00, $05, $1a, $16, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d212a: ; d212a
IF DEF(SUN)
	db $00, $05, $1a, $16, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00, $00, $05, $1a, $16, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00, $00, $05, $1a, $16, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00, $00, $05, $1a, $16, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $05, $1a, $16, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $05, $1a, $16, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $05, $1a, $16, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00, $00, $05, $1a, $16, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00, $00, $05, $1a, $16, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00, $00, $05, $1a, $16, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d2170: ; d2170
IF DEF(SUN)
	db $00, $05, $1a, $16, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00, $00, $05, $1a, $16, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $05, $1a, $16, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00, $00, $05, $1a, $16, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00, $00, $05, $1a, $16, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $05, $1a, $16, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00, $00, $05, $1a, $16, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00, $00, $05, $1a, $16, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00, $00, $05, $1a, $16, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00, $00, $05, $1a, $16, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d21b6: ; d21b6
IF DEF(SUN)
	db $00, $05, $1a, $16, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $05, $1a, $16, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00, $00, $05, $1a, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00, $00, $05, $1a, $16, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00, $00, $05, $1a, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	db $00, $05, $1a, $16, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00, $00, $05, $1a, $16, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00, $00, $05, $1a, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00, $00, $05, $1a, $16, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00, $00, $05, $1a, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d21fc:: ; d21fc (34:61fc)
	ld l, $0
	push hl
	ld c, $8
	ld e, $7
	ld a, $c
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $d
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $12
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $15
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $5
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $5
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $6
	ld e, $5
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $16
	ld a, $a
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $5
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $2
	ld e, $e
	ld a, $d
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $13
	ld a, $d
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $b
	ld a, $10
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $b
	ld e, $8
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $11
	ld e, $5
	ld a, $16
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
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
	scall Func_80d01
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
	scall Func_80f11
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
	scall FadeInMap
	ld a, [wc7de]
	cp $14
	jp nz, Func_d23c2
	writetext TreeBitstreamText_47e17
	jp Func_d23cb

Func_d23c2: ; d23c2 (34:63c2)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_d23cb: ; d23cb (34:63cb)
	ret

Data_d23cc:
	db $18, $00, $01, $01, $01, $07, $18, $00, $01, $01, $0d, $07, $18, $00, $01, $01, $18, $07

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
	scall Func_80d9b
	scall Func_80f02
	ret

Data_d23f4: ; d23f4
	db $0a, $0d, $01, $01, $1d, $01, $06, $04, $07, $04, $2e

Data_d23ff: ; d23ff
	db $01, $13, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $01, $13, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $01, $13, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $01, $13, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $1b, $08, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $1b, $08, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $1b, $08, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $1b, $08, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e, $1e, $07, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $1e, $07, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $1e, $07, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $1e, $07, $01, $01, $1d, $0e, $10, $0d, $10, $0e, $2e

Data_d2483: ; d2483
IF DEF(SUN)
	db $00, $06, $20, $19, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00, $00, $06, $20, $19, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00, $00, $06, $20, $19, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $20, $19, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00, $00, $06, $20, $19, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $20, $19, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00, $00, $06, $20, $19, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00, $00, $06, $20, $19, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $20, $19, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $20, $19, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d24c9: ; d24c9
IF DEF(SUN)
	db $00, $06, $20, $19, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $20, $19, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00, $00, $06, $20, $19, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00, $00, $06, $20, $19, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $06, $20, $19, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $20, $19, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $20, $19, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $20, $19, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00, $00, $06, $20, $19, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00, $00, $06, $20, $19, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d250f: ; d250f
IF DEF(SUN)
	db $00, $06, $20, $19, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00, $00, $06, $20, $19, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $06, $20, $19, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00, $00, $06, $20, $19, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00, $00, $06, $20, $19, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $20, $19, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00, $00, $06, $20, $19, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00, $00, $06, $20, $19, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00, $00, $06, $20, $19, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00, $00, $06, $20, $19, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d2555: ; d2555
IF DEF(SUN)
	db $00, $06, $20, $19, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $06, $20, $19, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00, $00, $06, $20, $19, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00, $00, $06, $20, $19, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00, $00, $06, $20, $19, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	db $00, $06, $20, $19, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00, $00, $06, $20, $19, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00, $00, $06, $20, $19, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00, $00, $06, $20, $19, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00, $00, $06, $20, $19, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d259b:: ; d259b (34:659b)
	ld l, $0
	push hl
	ld c, $b
	ld e, $b
	ld a, $9
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $f
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $16
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $17
	ld a, $15
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $14
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $e
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $8
	ld e, $c
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $f
	ld a, $b
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $5
	ld e, $15
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $18
	ld a, $14
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $16
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $19
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $12
	ld e, $6
	ld a, $1c
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
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
	scall Func_80d01
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
	scall Func_80f11
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
	scall FadeInMap
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2761
	writetext TreeBitstreamText_47e17
	jp Func_d276a

Func_d2761: ; d2761 (34:6761)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_d276a: ; d276a (34:676a)
	ret

Data_d276b:
	db $1e, $00, $01, $01, $01, $13, $1e, $00, $01, $01, $1b, $08, $1e, $00, $01, $01, $1e, $07

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
	scall Func_80d9b
	scall Func_80f02
	ret

Data_d2793: ; d2793
	db $10, $0d, $01, $01, $1d, $01, $06, $04, $07, $04, $2e

Data_d279e: ; d279e
	db $01, $10, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $01, $10, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $01, $10, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $01, $10, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $0d, $13, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $0d, $13, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $0d, $13, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $0d, $13, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e, $13, $07, $01, $01, $1d, $0a, $0a, $10, $0a, $0f, $2e, $13, $07, $01, $01, $1d, $0b, $0a, $10, $0a, $0f, $2e, $13, $07, $01, $01, $1d, $0c, $04, $0e, $05, $0e, $2e, $13, $07, $01, $01, $1d, $0d, $0a, $0d, $0b, $0d, $2e

Data_d2822: ; d2822
IF DEF(SUN)
	db $00, $03, $1d, $16, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00, $00, $03, $1d, $16, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00, $00, $03, $1d, $16, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $1d, $16, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00, $00, $03, $1d, $16, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $1d, $16, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00, $00, $03, $1d, $16, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00, $00, $03, $1d, $16, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $1d, $16, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $1d, $16, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d2868: ; d2868
IF DEF(SUN)
	db $00, $03, $1d, $16, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $1d, $16, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00, $00, $03, $1d, $16, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00, $00, $03, $1d, $16, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $03, $1d, $16, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $1d, $16, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $1d, $16, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $1d, $16, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00, $00, $03, $1d, $16, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00, $00, $03, $1d, $16, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d28ae: ; d28ae
IF DEF(SUN)
	db $00, $03, $1d, $16, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00, $00, $03, $1d, $16, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00, $00, $03, $1d, $16, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00, $00, $03, $1d, $16, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00, $00, $03, $1d, $16, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $1d, $16, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00, $00, $03, $1d, $16, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00, $00, $03, $1d, $16, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00, $00, $03, $1d, $16, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00, $00, $03, $1d, $16, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d28f4: ; d28f4
IF DEF(SUN)
	db $00, $03, $1d, $16, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00, $00, $03, $1d, $16, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00, $00, $03, $1d, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00, $00, $03, $1d, $16, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00, $00, $03, $1d, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $1d, $16, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00, $00, $03, $1d, $16, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00, $00, $03, $1d, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00, $00, $03, $1d, $16, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00, $00, $03, $1d, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d293a:: ; d293a (34:693a)
	ld l, $0
	push hl
	ld c, $c
	ld e, $5
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $5
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $e
	ld e, $b
	ld a, $9
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $11
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $16
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $19
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
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
	scall Func_80d01
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
	scall Func_80f11
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
	scall FadeInMap
	ld a, [wc7de]
	cp $14
	jp nz, Func_d2af3
	writetext TreeBitstreamText_47e17
	jp Func_d2afc

Func_d2af3: ; d2af3 (34:6af3)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
Func_d2afc: ; d2afc (34:6afc)
	ret

Data_d2afd:
	db $1b, $00, $01, $01, $01, $10, $1b, $00, $01, $01, $0d, $13, $1b, $00, $01, $01, $13, $07

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
	scall Func_80d9b
	scall Func_80f02
	ret

Data_d2b25: ; d2b25
	db $06, $0c, $02, $01, $01, $00, $1e, $06, $1e, $07, $34, $06, $0c, $02, $01, $03, $00, $15, $0f, $15, $10, $34, $06, $0c, $02, $01, $05, $00, $1c, $16, $1c, $17, $34, $06, $0c, $02, $01, $15, $00, $18, $14, $18, $15, $34, $06, $0c, $02, $01, $18, $00, $18, $1a, $18, $1b, $34, $06, $0c, $02, $01, $1d, $00, $14, $13, $14, $14, $34, $06, $0c, $02, $01, $19, $01, $08, $0e, $08, $0f, $34, $2a, $03, $ff, $ff, $8e, $03, $ff, $ff, $48, $03, $ff, $ff, $49, $03, $ff, $ff

Data_d2b82: ; d2b82
	db $0a, $04, $08, $04, $01, $01, $02, $04, $00, $34, $c3, $6c, $00, $00, $06, $04, $00, $05, $01, $01, $02, $04, $00, $34, $c3, $6c, $00, $00, $ff, $00, $00, $02, $01, $01, $00, $04, $00, $34, $5f, $48, $76, $6b, $ff, $00, $01, $02, $01, $01, $00, $04, $00, $34, $5f, $48, $76, $6b, $ff, $00, $0c, $05, $01, $01, $00, $04, $00, $34, $5f, $48, $72, $6b, $ff, $00, $0d, $05, $01, $01, $00, $04, $00, $34, $5f, $48, $72, $6b, $ff, $00, $0c, $08, $01, $01, $00, $04, $00, $34, $5f, $48, $72, $6b, $ff, $00, $0d, $08, $01, $01, $00, $04, $00, $34, $5f, $48, $72, $6b

Data_d2bf2: ; d2bf2
	db $00, $04, $06, $07, $01, $01, $01, $04, $00, $34, $5f, $48, $7a, $6b, $01, $04, $03, $02, $01, $01, $02, $04, $00, $34, $5f, $48, $7e, $6b

Data_d2c0e: ; d2c0e
	db $01, $00, $1e, $06, $03, $00, $15, $0f, $05, $00, $1c, $16, $15, $00, $18, $14, $18, $00, $18, $1a, $1d, $00, $14, $13, $19, $01, $08, $0e

Func_d2c2a:: ; d2c2a (34:6c2a)
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
	ld [wCurShop], a
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
	scall FadeInMap
	ret

Func_d2cc3:
	push af
	ld a, e
	or a
	jp nz, Func_d2cef
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	writenpctext TreeBitstreamText_470a2
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_d2ce7
	ld e, $3
	ld a, [wCurShop]
	scall Func_806a0
	jp Func_d2cef

Func_d2ce7: ; d2ce7 (34:6ce7)
	ld e, $4
	ld a, [wCurShop]
	scall Func_806a0
Func_d2cef: ; d2cef (34:6cef)
	pop bc
	ret

Data_d2cf1: ; d2cf1
	db $05, $09, $02, $01, $01, $00, $0c, $06, $0c, $07, $34, $05, $09, $02, $01, $03, $00, $14, $05, $14, $06, $34, $05, $09, $02, $01, $05, $00, $05, $07, $05, $08, $34, $05, $09, $02, $01, $05, $00, $1c, $07, $1c, $08, $34, $05, $09, $02, $01, $06, $00, $10, $05, $10, $06, $34, $05, $09, $02, $01, $0b, $00, $1a, $07, $1a, $08, $34, $05, $09, $02, $01, $14, $00, $07, $0b, $07, $0c, $34, $05, $09, $02, $01, $15, $00, $0b, $0c, $0b, $0d, $34, $05, $09, $02, $01, $17, $00, $10, $08, $10, $09, $34, $05, $09, $02, $01, $18, $00, $0e, $13, $0e, $14, $34, $05, $09, $02, $01, $19, $01, $1d, $16, $1d, $17, $34, $05, $09, $02, $01, $1d, $00, $16, $0d, $16, $0e, $34

Data_d2d75: ; d2d75
	db $82, $00, $ff, $ff, $8e, $03, $ff, $ff, $8f, $03, $ff, $ff

Data_d2d81: ; d2d81
	db $56, $03, $ff, $ff

Data_d2d85: ; d2d85
	db $55, $03, $ff, $ff

Data_d2d89: ; d2d89
	db $54, $03, $ff, $ff

Data_d2d8d: ; d2d8d
	db $10, $04, $05, $04, $01, $02, $02, $04, $00, $34, $47, $70, $00, $00

Data_d2d9b: ; d2d9b
	db $06, $04, $05, $04, $01, $02, $02, $04, $00, $34, $55, $70, $00, $00

Data_d2da9: ; d2da9
	db $10, $04, $05, $04, $01, $02, $02, $04, $00, $34, $f9, $70, $00, $00, $06, $04, $03, $03, $01, $02, $02, $04, $00, $34, $f9, $70, $00, $00, $ff, $00, $02, $03, $01, $01, $00, $04, $00, $34, $f9, $70, $00, $00, $07, $04, $08, $03, $01, $02, $02, $04, $00, $34, $f9, $70, $00, $00, $ff, $00, $09, $03, $01, $01, $00, $04, $00, $34, $f9, $70, $00, $00

Data_d2def: ; d2def
	db $ff, $00, $00, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $01, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $0a, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $0b, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $00, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $7d, $6d, $ff, $00, $01, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $0a, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $79, $6d, $ff, $00, $0b, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $7d, $6d

Data_d2e5f: ; d2e5f
	db $06, $04, $09, $07, $01, $01, $03, $04, $00, $34, $5f, $48, $75, $6d

Data_d2e6d: ; d2e6d
	db $01, $00, $0c, $06, $03, $00, $14, $05, $05, $00, $05, $07, $05, $00, $1c, $07, $06, $00, $10, $05, $0b, $00, $1a, $07, $14, $00, $07, $0b, $15, $00, $0b, $0c, $17, $00, $10, $08, $18, $00, $0e, $13, $19, $01, $1d, $16, $1d, $00, $16, $0d

Func_d2e9d:: ; d2e9d (34:6e9d)
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
	scall Func_80150
	jp Func_d2f72

Func_d2f54: ; d2f54 (34:6f54)
	ld de, Data_d2d85
	ld a, $8
	scall Func_80150
	jp Func_d2f72

Func_d2f5f: ; d2f5f (34:6f5f)
	ld de, Data_d2d89
	ld a, $8
	scall Func_80150
	jp Func_d2f72

Func_d2f6a: ; d2f6a (34:6f6a)
	ld de, Data_d2d75
	ld a, $8
	scall Func_80150
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
	scall FadeInMap
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
	scall Func_806a0
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
	scall Func_80e5d
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
	scall Func_80d4d
	ld c, $0
	ld e, $1
	ld a, $12
	scall Func_80d4d
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
	scall Func_80d4d
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
	scall FacePlayer
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
	scall Func_806a0
	jp Func_d3144

Func_d3133: ; d3133 (34:7133)
	ld e, $0
	ld a, $e
	scall Func_806a0
	jp Func_d3144

Func_d313d: ; d313d (34:713d)
	ld e, $0
	ld a, $f
	scall Func_806a0
Func_d3144: ; d3144 (34:7144)
	ret

Data_d3145: ; d3145
	db $05, $09, $02, $01, $01, $00, $0c, $0c, $0c, $0d, $34, $05, $09, $02, $01, $03, $00, $17, $06, $17, $07, $34, $05, $09, $02, $01, $05, $00, $1e, $0b, $1e, $0c, $34, $05, $09, $02, $01, $06, $00, $15, $10, $15, $11, $34, $05, $09, $02, $01, $0b, $00, $09, $0c, $09, $0d, $34, $05, $09, $02, $01, $14, $00, $07, $11, $07, $12, $34, $05, $09, $02, $01, $15, $00, $17, $0c, $17, $0d, $34, $05, $09, $02, $01, $17, $00, $14, $08, $14, $09, $34, $05, $09, $02, $01, $18, $00, $12, $13, $12, $14, $34, $05, $09, $02, $01, $19, $01, $20, $16, $20, $17, $34, $05, $09, $02, $01, $1d, $00, $06, $0d, $06, $0e, $34, $8e, $03, $ff, $ff, $8f, $03, $ff, $ff, $f3, $03, $ff, $ff, $f4, $03, $ff, $ff

Data_d31ce: ; d31ce
	db $10, $04, $05, $04, $01, $02, $02, $04, $00, $34, $1d, $74, $00, $00, $00, $04, $06, $04, $01, $02, $02, $04, $00, $34, $2b, $74, $00, $00

Data_d31ea: ; d31ea
	db $10, $04, $05, $04, $01, $02, $02, $04, $00, $34, $39, $74, $00, $00, $00, $04, $06, $04, $01, $02, $02, $04, $00, $34, $39, $74, $00, $00, $06, $04, $03, $03, $01, $02, $02, $04, $00, $34, $39, $74, $00, $00, $ff, $00, $02, $03, $01, $01, $00, $04, $00, $34, $39, $74, $00, $00, $07, $04, $08, $03, $01, $02, $02, $04, $00, $34, $39, $74, $00, $00, $ff, $00, $09, $03, $01, $01, $00, $04, $00, $34, $39, $74, $00, $00, $04, $04, $00, $03, $01, $01, $02, $04, $00, $34, $39, $74, $00, $00, $05, $04, $0b, $03, $01, $01, $02, $04, $00, $34, $39, $74, $00, $00

Data_d325a: ; d325a
	db $ff, $00, $00, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $01, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $0a, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $0b, $06, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $00, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $c2, $71, $ff, $00, $01, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $0a, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $be, $71, $ff, $00, $0b, $01, $01, $01, $00, $04, $00, $34, $5f, $48, $c2, $71

Data_d32ca: ; d32ca
	db $02, $04, $08, $05, $01, $01, $02, $04, $00, $34, $5f, $48, $c6, $71, $03, $04, $03, $05, $01, $01, $02, $04, $00, $34, $5f, $48, $ca, $71

Data_d32e6: ; d32e6
	db $01, $00, $0c, $0c, $03, $00, $17, $06, $05, $00, $1e, $0b, $06, $00, $15, $10, $0b, $00, $09, $0c, $14, $00, $07, $11, $15, $00, $17, $0c, $17, $00, $14, $08, $18, $00, $12, $13, $19, $01, $20, $16, $1d, $00, $06, $0d

Func_d3312:: ; d3312 (34:7312)
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
	scall FadeInMap
	ret

Func_d341d:
	ld a, e
	or a
	jp nz, Func_d342a
	ld e, $2
	ld a, [wc789]
	scall Func_806a0
Func_d342a: ; d342a (34:742a)
	ret

Func_d342b:
	ld a, e
	or a
	jp nz, Func_d3438
	ld e, $1
	ld a, [wc789]
	scall Func_806a0
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
	scall FacePlayer
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
	scall Func_806a0
	jp Func_d34b0

Func_d3481: ; d3481 (34:7481)
	ld e, $1
	ld a, $d
	scall Func_806a0
	jp Func_d34b0

Func_d348b: ; d348b (34:748b)
	ld e, $2
	ld a, $e
	scall Func_806a0
	jp Func_d34b0

Func_d3495: ; d3495 (34:7495)
	ld e, $1
	ld a, $e
	scall Func_806a0
	jp Func_d34b0

Func_d349f: ; d349f (34:749f)
	ld e, $2
	ld a, $f
	scall Func_806a0
	jp Func_d34b0

Func_d34a9: ; d34a9 (34:74a9)
	ld e, $1
	ld a, $f
	scall Func_806a0
Func_d34b0: ; d34b0 (34:74b0)
	ret

Data_d34b1: ; d34b1
	db $01, $06, $02, $01, $00, $1e, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $0a, $0e, $01, $0e, $02, $34, $01, $06, $02, $01, $00, $0b, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $0c, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $0d, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $0e, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $0f, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $10, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $11, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $12, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $13, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $14, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $15, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $16, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $17, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $18, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $19, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $1a, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $1b, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $00, $1c, $0a, $01, $0a, $02, $34

Data_d358d: ; d358d
	db $01, $06, $02, $01, $00, $1d, $0a, $01, $0a, $02, $34, $01, $06, $02, $01, $02, $01, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $04, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $03, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $04, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $03, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $04, $0b, $01, $0b, $02, $34, $01, $06, $02, $01, $02, $02, $0b, $01, $0b, $02, $34

Data_d35e5: ; d35e5
	db $01, $06, $02, $01, $1e, $06, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $0a, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $09, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $05, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $0b, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $0c, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $07, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $0d, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $04, $01, $02, $01, $03, $34, $01, $06, $02, $01, $1e, $0e, $0c, $05, $0c, $06, $34, $01, $06, $02, $01, $1e, $04, $07, $01, $07, $02, $34

Data_d365e: ; d365e
	db $01, $04, $00, $02, $01, $01, $02, $04, $00, $34, $5b, $78, $00, $00, $ff, $00, $00, $03, $01, $01, $00, $04, $00, $34, $5b, $78, $00, $00

Func_d367a:: ; d367a (34:767a)
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
	scall FadeInMap
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
	scall FadeInMap
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
	scall FadeInMap
Func_d385a: ; d385a (34:785a)
	ret

Func_d385b:
	ld a, e
	or a
	jp nz, Func_d38ae
	face_player 0
	scall Func_80275
	ld l, a
	push hl
	scall Func_80f02
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
	db $07, $14, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $07, $0e, $01, $01, $1f, $02, $09, $0e, $09, $0d, $34, $c3, $02, $ff, $ff

Data_d38c9: ; d38c9
	db $01, $01, $0a, $0e, $2d, $28, $2d, $04, $06, $06, $06, $06, $04, $00, $01, $01, $0a, $0e, $36, $28, $2d, $04, $0f, $0b, $00, $06, $02, $00, $01, $01, $0a, $0e, $91, $28, $2d, $04, $04, $17, $00, $06, $08, $00, $01, $01, $0a, $0e, $08, $28, $2d, $6e, $01, $13, $00, $13, $0a, $00, $01, $01, $0a, $0e, $8f, $28, $2d, $6e, $0f, $0d, $14, $12, $07, $00

Data_d390f: ; d390f
	db $ff, $00, $06, $13, $01, $01, $00, $04, $00, $34, $5f, $48, $c5, $78, $ff, $00, $08, $13, $01, $01, $00, $04, $00, $34, $5f, $48, $c5, $78

Func_d392b:: ; d392b (34:792b)
	ld a, $f
	ld [wc7e2], a
	call Func_d3adf
	ld hl, Func_d3adf
	scall Func_80f11
	loadwarps $2, Data_d38af
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_d38c9
	loadpeople $2, Data_d390f
	checkevent $f1
	or a
	jp nz, Func_d3977
	xor a
	call PlayMusic_34
	xor a
	scall Func_80653
	scall FadeInMap
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
	scall Func_80653
	scall FadeInMap
	call Func_d39a6
	jp Func_d39a5

Func_d3998: ; d3998 (34:7998)
	playmusic SONG_PUNCH_MINIGAME
	ld a, $1
	call LoadPlayerSprite_34
	scall FadeInMap
Func_d39a5: ; d39a5 (34:79a5)
	ret

Func_d39a6: ; d39a6 (34:79a6)
	call StartShakingScreen_34
	playsfx $64
	loademote $3, $1, $13
	scall Func_80f54
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $1
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $2
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $3
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	call WaitEmote_34
	call HideEmote_34
	loademote $2, $1, $13
	playsfx $64
	ld a, $4
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	call WaitEmote_34
	call HideEmote_34
	call StopShakingScreen_34
	ld l, $6
	push hl
	ld c, $8
	ld e, $0
	ld a, $1a
	scall Func_80dff
	pop bc
	ret

Data_d3a6d: ; d3a6d
	db $00, $00, $03, $02, $06, $0d

Data_d3a73: ; d3a73
	db $00, $00, $03, $02, $06, $0c

Data_d3a79: ; d3a79
	db $00, $00, $03, $02, $06, $0b

Data_d3a7f: ; d3a7f
	db $00, $00, $03, $02, $06, $0a

Data_d3a85: ; d3a85
	db $00, $00, $03, $02, $06, $09

Data_d3a8b: ; d3a8b
	db $00, $00, $03, $02, $06, $08

Data_d3a91: ; d3a91
	db $00, $00, $03, $02, $06, $07

Data_d3a97: ; d3a97
	db $00, $00, $03, $02, $06, $06

Data_d3a9d: ; d3a9d
	db $00, $00, $03, $02, $06, $05

Data_d3aa3: ; d3aa3
	db $0d, $00, $03, $04, $06, $0a

Data_d3aa9: ; d3aa9
	db $0d, $00, $03, $04, $06, $09

Data_d3aaf: ; d3aaf
	db $0d, $00, $03, $04, $06, $08

Data_d3ab5: ; d3ab5
	db $0d, $00, $03, $04, $06, $07

Data_d3abb: ; d3abb
	db $0d, $00, $03, $04, $06, $06

Data_d3ac1: ; d3ac1
	db $0d, $00, $03, $04, $06, $05

Data_d3ac7: ; d3ac7
	db $0d, $00, $03, $04, $06, $04

Data_d3acd: ; d3acd
	db $0d, $00, $03, $04, $06, $03

Data_d3ad3: ; d3ad3
	db $0d, $00, $03, $04, $06, $02

Data_d3ad9: ; d3ad9
	db $06, $0f, $03, $02, $06, $0d

Func_d3adf: ; d3adf (34:7adf)
	checkevent $f1
	or a
	jp nz, Func_d3af2
	ld hl, Data_d3ad9
	scall Func_80d9b
	scall Func_80f02
Func_d3af2: ; d3af2 (34:7af2)
	ld a, [wc78d + 1]
	cp $1
	jp nz, Func_d3b0c
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aa3
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3b0c: ; d3b0c (34:7b0c)
	ld a, [wc78d + 1]
	cp $2
	jp nz, Func_d3b2c
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aa9
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3b2c: ; d3b2c (34:7b2c)
	ld a, [wc78d + 1]
	cp $3
	jp nz, Func_d3b52
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aaf
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3b52: ; d3b52 (34:7b52)
	ld a, [wc78d + 1]
	cp $4
	jp nz, Func_d3b7e
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ab5
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3b7e: ; d3b7e (34:7b7e)
	ld a, [wc78d + 1]
	cp $5
	jp nz, Func_d3bb0
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3abb
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3bb0: ; d3bb0 (34:7bb0)
	ld a, [wc78d + 1]
	cp $6
	jp nz, Func_d3be8
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ac1
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3be8: ; d3be8 (34:7be8)
	ld a, [wc78d + 1]
	cp $7
	jp nz, Func_d3c26
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ac7
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3c26: ; d3c26 (34:7c26)
	ld a, [wc78d + 1]
	cp $8
	jp nz, Func_d3c6a
	ld hl, Data_d3a97
	scall Func_80d9b
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3acd
	scall Func_80d9b
	scall Func_80f02
	jp Func_d3cb1

Func_d3c6a: ; d3c6a (34:7c6a)
	ld a, [wc78d + 1]
	cp $9
	jp nz, Func_d3cb1
	ld hl, Data_d3a9d
	scall Func_80d9b
	ld hl, Data_d3a97
	scall Func_80d9b
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ad3
	scall Func_80d9b
	scall Func_80f02
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
	scall Func_80dff
	pop bc
	ret

Func_d3ceb:: ; d3ceb (34:7ceb)
	resetevent $f9
	playmusic SONG_JUMP_MINIGAME
	xor a
	scall Func_80653
	loademote $1, $6, $26
	scall FadeInMap
	call WaitEmote_34
	ld a, $1
	call PlayerFace_34
	ld l, $5
	push hl
	ld c, $f
	ld e, $16
	ld a, $13
	scall Func_80dff
	pop bc
	ret

