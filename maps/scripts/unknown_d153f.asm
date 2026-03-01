
Data_d1457: ; d1457
	warpdef $06, $04, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $06, $04, $01, $01, MAP_29_11, $0a, $10, $0a, $11, SFX_2E
	warpdef $06, $04, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $06, $04, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $06, $04, $01, $01, MAP_29_14, $10, $0d, $10, $0e, SFX_2E

Data_d148e: ; d148e
	warpdef $0a, $04, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, SFX_2E
	warpdef $0a, $04, $01, $01, MAP_29_21, $10, $10, $0f, $10, SFX_2E
	warpdef $0a, $04, $01, $01, MAP_29_22, $07, $15, $08, $15, SFX_2E
	warpdef $0a, $04, $01, $01, MAP_29_23, $21, $0a, $20, $0a, SFX_2E
	warpdef $0a, $04, $01, $01, MAP_29_24, $16, $13, $16, $12, SFX_2E

Data_d14c5: ; d14c5
	warpdef $0e, $04, $01, $01, MAP_29_30, $12, $0f, $12, $10, SFX_2E
	warpdef $0e, $04, $01, $01, MAP_29_31, $0f, $0f, $0e, $0f, SFX_2E
	warpdef $0e, $04, $01, $01, MAP_29_32, $13, $10, $12, $10, SFX_2E
	warpdef $0e, $04, $01, $01, MAP_29_33, $0e, $0f, $0d, $0f, SFX_2E
	warpdef $0e, $04, $01, $01, MAP_29_34, $0e, $0e, $0d, $0e, SFX_2E

Data_d14fc: ; d14fc
	warpdef $09, $11, $03, $01, MAP_29_00, $0f, $04, $0f, $05, SFX_2E

Data_d1507: ; d1507
	person_event $2a, $0c, $0a, $06, $01, $01, $02, $04, $00, Func_d1680, NULL
	person_event $1b, $04, $06, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $1b, $04, $0a, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $1b, $04, $0e, $04, $01, $01, $02, $04, $00, NULL, NULL

Func_d153f:: ; d153f (34:553f)
	xor a
	ld [wc7de], a
	ld a, $5
	scall Random
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
	scall LoadWarps
	ld a, $5
	scall Random
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
	scall LoadWarps
	ld a, $5
	scall Random
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
	scall LoadWarps
	loadwarps $1, Data_d14fc
	loadpeople $4, Data_d1507
	ld a, [wBackupMapNumber]
	cp $22
	jp z, .asm_d1603
	cp $21
	jp z, .asm_d1603
	cp $20
	jp z, .asm_d1603
	cp $1f
	jp z, .asm_d1603
	cp $1e
	jp z, .asm_d1603
	cp $18
	jp z, .asm_d15f9
	cp $17
	jp z, .asm_d15f9
	cp $16
	jp z, .asm_d15f9
	cp $15
	jp z, .asm_d15f9
	cp $14
	jp z, .asm_d15f9
	cp $e
	jp z, .asm_d15ef
	cp $d
	jp z, .asm_d15ef
	cp $c
	jp z, .asm_d15ef
	cp $b
	jp z, .asm_d15ef
	cp $a
	jp nz, .asm_d160a
.asm_d15ef: ; d15ef (34:55ef)
	hideperson $1
	jp .asm_d160a

.asm_d15f9: ; d15f9 (34:55f9)
	hideperson $2
	jp .asm_d160a

.asm_d1603: ; d1603 (34:5603)
	hideperson $3
.asm_d160a: ; d160a (34:560a)
	ld a, [wc791]
	cp $4
	jp z, .asm_d163f
	cp $3
	jp z, .asm_d1635
	cp $2
	jp z, .asm_d162b
	cp $1
	jp nz, .asm_d1654
	hideperson $1
	jp .asm_d1654

.asm_d162b: ; d162b (34:562b)
	hideperson $2
	jp .asm_d1654

.asm_d1635: ; d1635 (34:5635)
	hideperson $3
	jp .asm_d1654

.asm_d163f: ; d163f (34:563f)
	hideperson $1
	hideperson $2
	hideperson $3
.asm_d1654: ; d1654 (34:5654)
	ld a, $1
	ld [wc7a2 + 1], a
	playmusic SONG_TOWN2
	scall Func_8001c
	ld a, [wBackupMapNumber]
	or a
	jp z, .asm_d166f
	call Func_d1749
	xor a
	ld [wBackupMapNumber], a
.asm_d166f: ; d166f (34:566f)
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
	jp nz, .asm_d1729
	face_player -$1
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_d16b1
	writenpctext TreeBitstreamText_47cc9
	ld e, $0
	ld a, $11
	scall Func_806a0
	script_sleep $3c
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	scall SpriteFace
	jp .asm_d1729

.asm_d16b1: ; d16b1 (34:56b1)
	writenpctext_yesorno TreeBitstreamText_47dc3
	or a
	jp nz, .asm_d1723
	writenpctext TreeBitstreamText_47e09
	ld a, [wPlayerFacing]
	cp $3
	jp z, .asm_d16df
	cp $2
	jp z, .asm_d16df
	cp $1
	jp nz, .asm_d16e8
	move_person 0, Data_d1674, 1
	jp .asm_d16e8

.asm_d16df: ; d16df (34:56df)
	move_person 0, Data_d1670, 1
.asm_d16e8: ; d16e8 (34:56e8)
	scall WaitNPCStep
	move_player $1, Data_d1678
	move_person 0, Data_d167c, 1
	scall WaitNPCStep
	sprite_face $2, 0
	showperson $1
	showperson $2
	showperson $3
	xor a
	ld [wc791], a
	jp .asm_d1729

.asm_d1723: ; d1723 (34:5723)
	writenpctext TreeBitstreamText_47dfa
.asm_d1729: ; d1729 (34:5729)
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
	jp z, .asm_d17ca
	cp $17
	jp z, .asm_d17ca
	cp $16
	jp z, .asm_d17ca
	cp $15
	jp z, .asm_d17ca
	cp $14
	jp z, .asm_d17ca
	cp $e
	jp z, .asm_d177e
	cp $d
	jp z, .asm_d177e
	cp $c
	jp z, .asm_d177e
	cp $b
	jp z, .asm_d177e
	cp $a
	jp nz, .asm_d1816
.asm_d177e: ; d177e (34:577e)
	move_player $1, Data_d172b
	ld a, $2
	scall PlayerFace
	script_sleep $1e
	face_player 0
	checkevent $5d
	cp $1
	jp nz, .asm_d17c7
	checkevent $5e
	or a
	jp nz, .asm_d17c7
	writenpctext TreeBitstreamText_47ce9
	ld e, $0
	ld a, $2d
	scall Func_80d62
	writetext TreeBitstreamText_47d38
	setevent $5e
.asm_d17c7: ; d17c7 (34:57c7)
	jp .asm_d1866

.asm_d17ca: ; d17ca (34:57ca)
	move_player $1, Data_d1731
	ld a, $2
	scall PlayerFace
	script_sleep $1e
	face_player 0
	checkevent $5f
	cp $1
	jp nz, .asm_d1813
	checkevent $60
	or a
	jp nz, .asm_d1813
	writenpctext TreeBitstreamText_47ce9
	ld e, $0
	ld a, $9
	scall Func_80d74
	writetext TreeBitstreamText_47d46
	setevent $60
.asm_d1813: ; d1813 (34:5813)
	jp .asm_d1866

.asm_d1816: ; d1816 (34:5816)
	move_player $1, Data_d1737
	ld a, $2
	scall PlayerFace
	script_sleep $1e
	face_player 0
	checkevent $61
	cp $1
	jp nz, .asm_d1866
	checkevent $62
	or a
	jp nz, .asm_d1866
	writenpctext TreeBitstreamText_47ce9
IF DEF(SUN)
	give_robot SCAR, 50, 0
ELIF DEF(STAR)
	give_robot NOBONE, 50, 0
ENDC
	cp $ff
	jp nz, .asm_d1858
.asm_d1858: ; d1858 (34:5858)
IF DEF(SUN)
	writetext TreeBitstreamText_47d58
ELIF DEF(STAR)
	writetext TreeBitstreamText_47d6a
ENDC
	setevent $62
.asm_d1866: ; d1866 (34:5866)
	move_person 0, Data_d173d, 1
	scall WaitNPCStep
	sprite_face $1, 0
	move_player $1, Data_d1741
	move_person 0, Data_d1745, 1
	scall WaitNPCStep
	sprite_face $2, 0
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
	move_person 0, Data_d18ae, 1
	scall WaitNPCStep
	sprite_face $1, 0
	move_player $1, Data_d18b2
	move_person 0, Data_d18b6, 1
	scall WaitNPCStep
	sprite_face $0, 0
	pop af
	push af
	cp $4
	jp z, .asm_d1938
	cp $3
	jp z, .asm_d192e
	cp $2
	jp z, .asm_d1924
	cp $1
	jp nz, .asm_d194d
	hideperson $1
	jp .asm_d194d

.asm_d1924: ; d1924 (34:5924)
	hideperson $2
	jp .asm_d194d

.asm_d192e: ; d192e (34:592e)
	hideperson $3
	jp .asm_d194d

.asm_d1938: ; d1938 (34:5938)
	hideperson $1
	hideperson $2
	hideperson $3
.asm_d194d: ; d194d (34:594d)
	pop af
	ld [wc791], a
	script_sleep $3c
	ret
