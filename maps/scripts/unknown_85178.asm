
Data_850b4:
	warpdef $17, $11, $01, $01, MAP_01_00, $15, $06, $15, $07, SFX_2E
	warpdef $07, $0b, $02, $01, MAP_02_01, $01, $0c, $01, $0b, SFX_2E
	warpdef $0c, $0b, $02, $01, MAP_02_01, $05, $0c, $05, $0b, SFX_2E
	warpdef $11, $0b, $02, $01, MAP_02_01, $09, $0c, $09, $0b, SFX_2E
	warpdef $1f, $09, $02, $01, MAP_02_08, $08, $15, $08, $14, SFX_2E
	warpdef $05, $0e, $01, $01, MAP_09_02, $01, $15, $01, $14, SFX_2E

Data_850f6:
	dtext_tree_pointer TreeBitstreamText_46549
	dw -1

Data_850fa: ; 850fa
	person_event $0b, $0c, $16, $0b, $01, $01, $02, $04, $00, Func_854aa, NULL
	person_event $0b, $0c, $17, $0b, $01, $01, $02, $04, $00, Func_854aa, NULL
	person_event $19, $0c, $17, $09, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $1f, $0a, $01, $01, $00, $04, $01, Func_855dc, NULL
	person_event $ff, $00, $20, $0a, $01, $01, $00, $04, $01, Func_855dc, NULL

Data_85140: ; 85140
	person_event $ff, $00, $16, $10, $01, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_850f6
	person_event $ff, $00, $18, $10, $01, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_850f6
	person_event $ff, $00, $15, $07, $04, $01, $00, $04, $00, Func_85832, NULL
	person_event $03, $04, $06, $0d, $01, $01, $01, $04, $00, Func_858f9, NULL

Func_85178::
	push bc
	push bc
	push bc
	ld hl, sp+$0
	scall Func_80f94
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
	jp c, .asm_851a9
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, .asm_851b4
.asm_851a9: ; 851a9 (21:51a9)
	setevent $38
	jp .asm_851bc

.asm_851b4: ; 851b4 (21:51b4)
	resetevent $38
.asm_851bc: ; 851bc (21:51bc)
	loadwarps $6, Data_850b4
	ld a, $1
	scall LoadPlayerSprite
	ld a, $2
	ld [wc7e2], a
	checkevent $32
	or a
	jp nz, .asm_851fe
	loadpeople $5, Data_850fa
	loadpeople $4, Data_85140
	playmusic SONG_TOWN1
	scall Func_8001c
	call Func_852ac
	setevent $32
	jp .asm_85270

.asm_851fe: ; 851fe (21:51fe)
	checkevent $5
	or a
	jp z, .asm_85212
	checkevent $6
	or a
	jp nz, .asm_85260
.asm_85212: ; 85212 (21:5212)
	loadpeople $5, Data_850fa
	playmusic SONG_TOWN1
	hideperson $2
	checkevent $5
	cp $1
	jp nz, .asm_8523a
	hideperson 0
	jp .asm_85242

.asm_8523a: ; 8523a (21:523a)
	ld c, $a
	ld e, $1f
	xor a
	scall Func_80080
.asm_85242: ; 85242 (21:5242)
	checkevent $6
	cp $1
	jp nz, .asm_85257
	hideperson $1
	jp .asm_85260

.asm_85257: ; 85257 (21:5257)
	ld c, $a
	ld e, $20
	ld a, $1
	scall Func_80080
.asm_85260: ; 85260 (21:5260)
	playmusic SONG_TOWN1
	loadpeople $4, Data_85140
	scall Func_8001c
.asm_85270: ; 85270 (21:5270)
	pop bc
	pop bc
	pop bc
	ret

Data_85274:
	db $16, $0d, $ff, $ff

Data_85278: ; 85278
	db $17, $0d, $ff, $ff

Data_8527c: ; 8527c
	db $17, $0c, $ff, $ff

Data_85280: ; 85280
	db $16, $0b, $17, $0b, $ff, $ff

Data_85286: ; 85286
	db $18, $0d, $ff, $ff

Data_8528a: ; 8528a
	db $17, $0e, $ff, $ff

Data_8528e: ; 8528e
	db $18, $0b, $ff, $ff

Data_85292: ; 85292
	db $17, $0c, $1d, $0c, $ff, $ff

Data_85298: ; 85298
	db $17, $0d, $ff, $ff

Data_8529c: ; 8529c
	db $1b, $0b, $1f, $0b, $1f, $0a, $ff, $ff

Data_852a4: ; 852a4
	db $1c, $0b, $20, $0b, $20, $0a, $ff, $ff

Func_852ac: ; 852ac (21:52ac)
	script_sleep $3c
	loademote $1, $1, $5
	ld e, $f
	ld a, $17
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	script_sleep $3c
	scall HideEmote
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	move_person 0, Data_85274, 0
	move_person $1, Data_85278, 1
	scall WaitNPCStep
	script_sleep $3c
	writenpctext TreeBitstreamText_399f1
	writenpctext TreeBitstreamText_39a27
	writenpctext TreeBitstreamText_39a42
	writenpctext TreeBitstreamText_39a5f
	playmusic SONG_NONE
	writenpctext TreeBitstreamText_39a7b
	playmusic SONG_ENCOUNTER_BEAUTY
	sprite_face $0, 0
	sprite_face $0, $1
	move_person $2, Data_8527c, 1
	scall WaitNPCStep
	playsfx $33
	move_person $1, Data_85286, 1
	scall WaitNPCStep
	sprite_face $1, 0
	sprite_face $3, $1
	move_person $2, Data_8528a, 1
	scall WaitNPCStep
	sprite_face $2, 0
	sprite_face $2, $1
	script_sleep $3c
	playmusic SONG_NONE
	playmusic SONG_TITLE
	writenpctext TreeBitstreamText_39a8f
	writenpctext TreeBitstreamText_39b0b
	writenpctext TreeBitstreamText_39b45
	writenpctext TreeBitstreamText_39ba9
	ld a, $a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $1
	scall FadeInAudio
	playmusic SONG_ENCOUNTER_BEAUTY
	move_person $2, Data_85292, 1
	scall WaitNPCStep
	hideperson $2
	move_person 0, Data_85280, 0
	move_person $1, Data_8528e, 1
	scall WaitNPCStep
	playsfx $33
	sprite_face $3, $1
	move_player $1, Data_85298
	script_sleep $1e
	playsfx $2e
	scall WaitNPCStep
	sprite_face $2, 0
	sprite_face $2, $1
	move_person 0, Data_8529c, 0
	move_person $1, Data_852a4, 1
	scall WaitNPCStep
	ld a, $1
	scall PlayerFace
	sprite_face $2, 0
	sprite_face $2, $1
	playsfx $5c
	script_sleep $78
	writenpctext TreeBitstreamText_39c6c
	writenpctext TreeBitstreamText_39c19
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	ret

Data_85450:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $07, $1e, $00
	db $00, $7e, $31, $02, $07, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_85479: ; 85479
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $07, $05, $00
	db $00, $7e, $8b, $02, $07, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_854a2: ; 854a2
	db $1f, $09, $ff, $ff

Data_854a6: ; 854a6
	db $20, $09, $ff, $ff

Func_854aa:
	push af
	ld a, e
	or a
	jp nz, .asm_85570
	checkevent $14
	or a
	jp nz, .asm_854c8
	playsfx $69
	writenpctext TreeBitstreamText_3a2e2
	jp .asm_85570

.asm_854c8: ; 854c8 (21:54c8)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, .asm_8551c
	writenpctext TreeBitstreamText_3a308
	script_sleep $1e
	startbattle Data_85572, Data_85450
	or a
	jp nz, .asm_854eb
	jp .asm_85570

.asm_854eb: ; 854eb (21:54eb)
	move_person 0, Data_854a2, 1
	scall WaitNPCStep
	hideperson 0
	setevent $5
	checkevent $6
	or a
	jp nz, .asm_85519
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
.asm_85519: ; 85519 (21:5519)
	jp .asm_85570

.asm_8551c: ; 8551c (21:551c)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, .asm_85570
	writenpctext TreeBitstreamText_3a349
	script_sleep $1e
	startbattle Data_8557a, Data_85479
	or a
	jp nz, .asm_85540
	jp .asm_85570

.asm_85540: ; 85540 (21:5540)
	move_person $1, Data_854a6, 1
	scall WaitNPCStep
	hideperson $1
	setevent $6
	checkevent $5
	or a
	jp nz, .asm_85570
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
.asm_85570: ; 85570 (21:5570)
	pop bc
	ret

Data_85572:
	dstr "(こふﾞん1)"

Data_8557a:
	dstr "(こふﾞん2)"

Data_85582:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $06, $1e, $00
	db $00, $7e, $31, $02, $06, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_855ab: ; 855ab
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $06, $05, $00
	db $00, $7e, $8b, $02, $06, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_855d4: ; 855d4
	db $1f, $09, $ff, $ff

Data_855d8: ; 855d8
	db $20, $09, $ff, $ff

Func_855dc:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $2
	jp nz, .asm_856d9
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, .asm_8560d
	checkevent $6
	or a
	jp nz, .asm_8560a
	sprite_face $3, $1
	ld a, $1
	scall PlayerFace
	ld hl, sp+$0
	ld [hl], $1
.asm_8560a: ; 8560a (21:560a)
	jp .asm_8562e

.asm_8560d: ; 8560d (21:560d)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, .asm_8562e
	checkevent $5
	or a
	jp nz, .asm_8562e
	sprite_face $1, 0
	ld a, $3
	scall PlayerFace
	ld hl, sp+$0
	ld [hl], $1
.asm_8562e: ; 8562e (21:562e)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, .asm_856d9
	writenpctext TreeBitstreamText_3a368
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, .asm_8568d
	script_sleep $1e
	startbattle Data_856dc, Data_855ab
	or a
	jp nz, .asm_8565a
	jp .asm_856d9

.asm_8565a: ; 8565a (21:565a)
	move_person $1, Data_855d8, 1
	scall WaitNPCStep
	hideperson $1
	setevent $6
	checkevent $5
	or a
	jp nz, .asm_8568a
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
.asm_8568a: ; 8568a (21:568a)
	jp .asm_856d9

.asm_8568d: ; 8568d (21:568d)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, .asm_856d9
	script_sleep $1e
	startbattle Data_856e4, Data_85582
	or a
	jp nz, .asm_856ab
	jp .asm_856d9

.asm_856ab: ; 856ab (21:56ab)
	move_person 0, Data_855d4, 1
	scall WaitNPCStep
	hideperson 0
	setevent $5
	checkevent $6
	or a
	jp nz, .asm_856d9
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
.asm_856d9: ; 856d9 (21:56d9)
	pop bc
	pop bc
	ret

Data_856dc:
	dstr "(こふﾞん2)"

Data_856e4:
	dstr "(こふﾞん1)"

Data_856ec:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $06, $1e, $00
	db $00, $7e, $31, $02, $06, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_85715: ; 85715
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $06, $05, $00
	db $00, $7e, $8b, $02, $06, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8573e: ; 8573e
	db $1f, $09, $ff, $ff

Data_85742: ; 85742
	db $20, $09, $ff, $ff

Func_85746:
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $2
	jp nz, .asm_8581b
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, .asm_85777
	checkevent $6
	or a
	jp nz, .asm_85774
	sprite_face $3, $1
	ld a, $1
	scall PlayerFace
	ld hl, sp+$0
	ld [hl], $1
.asm_85774: ; 85774 (21:5774)
	jp .asm_85798

.asm_85777: ; 85777 (21:5777)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, .asm_85798
	checkevent $5
	or a
	jp nz, .asm_85798
	sprite_face $1, 0
	ld a, $3
	scall PlayerFace
	ld hl, sp+$0
	ld [hl], $1
.asm_85798: ; 85798 (21:5798)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, .asm_8581b
	writenpctext TreeBitstreamText_3a368
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, .asm_857e3
	script_sleep $1e
	startbattle Data_8581e, Data_85715
	or a
	jp nz, .asm_857c4
	jp .asm_8581b

.asm_857c4: ; 857c4 (21:57c4)
	move_person $1, Data_85742, 1
	scall WaitNPCStep
	hideperson $1
	setevent $6
	jp .asm_8581b

.asm_857e3: ; 857e3 (21:57e3)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nz, .asm_8581b
	script_sleep $1e
	startbattle Data_85826, Data_856ec
	or a
	jp nz, .asm_85801
	jp .asm_8581b

.asm_85801: ; 85801 (21:5801)
	move_person 0, Data_8573e, 1
	scall WaitNPCStep
	hideperson 0
	setevent $5
.asm_8581b: ; 8581b (21:581b)
	pop bc
	pop bc
	ret

Data_8581e:
	dstr "(こふﾞん2)"

Data_85826:
	dstr "(こふﾞん1)"

Data_8582e:
	db $16, $08, $ff, $ff

Func_85832:
	ld a, e
	or a
	jp nz, .asm_858cf
	ld a, $f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8585f
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8585f
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8585f
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_858c9
.asm_8585f: ; 8585f (21:585f)
	ld a, [wc790]
	or a
	jp z, .asm_858c0
	ld a, [wc790]
	cp $6
	jp nc, .asm_858c0
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, .asm_858bd
	move_player $1, Data_8582e
	scall WaitNPCStep
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	scall Func_80653
	loademote $1, $1, $b
	playsfx $44
	scall WaitEmote
	scall HideEmote
	ld a, $4
	scall LoadPlayerSprite
	ld a, $1
	scall PlayerFace
	ld l, $b
	push hl
	ld c, $25
	ld e, $0
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_858bd: ; 858bd (21:58bd)
	jp .asm_858c6

.asm_858c0: ; 858c0 (21:58c0)
	writetext TreeBitstreamText_470f0
.asm_858c6: ; 858c6 (21:58c6)
	jp .asm_858cf

.asm_858c9: ; 858c9 (21:58c9)
	writetext TreeBitstreamText_470d8
.asm_858cf: ; 858cf (21:58cf)
	ret

Data_858d0:
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $01, $01, $38, $02, $05, $0a, $0b
	db $0b, $17, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_858f9:
	push af
	ld a, e
	or a
	jp nz, .asm_8592e
	face_player -$1
	writetext_yesorno TreeBitstreamText_472f0
	or a
	jp nz, .asm_85928
	startbattle Data_85930, Data_858d0
	or a
	jp nz, .asm_8591f
	jp .asm_8592e

.asm_8591f: ; 8591f (21:591f)
	writetext TreeBitstreamText_47319
	jp .asm_8592e

.asm_85928: ; 85928 (21:5928)
	writetext TreeBitstreamText_47306
.asm_8592e: ; 8592e (21:592e)
	pop bc
	ret

Data_85930:
	dstr "(おんなのこ)"
