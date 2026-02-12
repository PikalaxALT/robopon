INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 21", ROMX
	script_library 21

Data_850b4:
	db $17, $11, $01, $01, $01, $00, $15, $06, $15, $07, $2e, $07, $0b, $02, $01, $02, $01, $01, $0c, $01, $0b, $2e, $0c, $0b, $02, $01, $02, $01, $05, $0c, $05, $0b, $2e, $11, $0b, $02, $01, $02, $01, $09, $0c, $09, $0b, $2e, $1f, $09, $02, $01, $02, $08, $08, $15, $08, $14, $2e, $05, $0e, $01, $01, $09, $02, $01, $15, $01, $14, $2e, $ae, $02, $ff, $ff

Data_850fa: ; 850fa
	db $0b, $0c, $16, $0b, $01, $01, $02, $04, $00, $21, $aa, $54, $00, $00, $0b, $0c, $17, $0b, $01, $01, $02, $04, $00, $21, $aa, $54, $00, $00, $19, $0c, $17, $09, $01, $01, $02, $04, $00, $21, $00, $00, $00, $00, $ff, $00, $1f, $0a, $01, $01, $00, $04, $01, $21, $dc, $55, $00, $00, $ff, $00, $20, $0a, $01, $01, $00, $04, $01, $21, $dc, $55, $00, $00

Data_85140: ; 85140
	db $ff, $00, $16, $10, $01, $01, $00, $04, $00, $21, $5f, $48, $f6, $50, $ff, $00, $18, $10, $01, $01, $00, $04, $00, $21, $5f, $48, $f6, $50, $ff, $00, $15, $07, $04, $01, $00, $04, $00, $21, $32, $58, $00, $00, $03, $04, $06, $0d, $01, $01, $01, $04, $00, $21, $f9, $58, $00, $00

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
	scall LoadPlayerSprite
	ld a, $2
	ld [wc7e2], a
	checkevent $32
	or a
	jp nz, Func_851fe
	loadpeople $5, Data_850fa
	loadpeople $4, Data_85140
	playmusic SONG_TOWN1
	scall FadeInMap
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
	scall SetPersonVisibilityState
	jp Func_85242

Func_8523a: ; 8523a (21:523a)
	ld c, $a
	ld e, $1f
	xor a
	scall Func_80080
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
	scall Func_80080
Func_85260: ; 85260 (21:5260)
	playmusic SONG_TOWN1
	loadpeople $4, Data_85140
	scall FadeInMap
Func_85270: ; 85270 (21:5270)
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
	ld bc, Data_85274
	ld e, BANK(Data_85274)
	xor a
	scall MovePerson
	ld bc, Data_85278
	ld e, BANK(Data_85278)
	ld a, $1
	scall Func_80688
	scall WaitNPCStep
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
	scall SpriteFace
	sprite_face $0, $1
	ld bc, Data_8527c
	ld e, BANK(Data_8527c)
	ld a, $2
	scall Func_80688
	scall WaitNPCStep
	playsfx $33
	ld bc, Data_85286
	ld e, BANK(Data_85286)
	ld a, $1
	scall Func_80688
	scall WaitNPCStep
	ld e, $1
	xor a
	scall SpriteFace
	sprite_face $3, $1
	ld bc, Data_8528a
	ld e, BANK(Data_8528a)
	ld a, $2
	scall Func_80688
	scall WaitNPCStep
	ld e, $2
	xor a
	scall SpriteFace
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
	ld bc, Data_85292
	ld e, BANK(Data_85292)
	ld a, $2
	scall Func_80688
	scall WaitNPCStep
	hideperson $2
	ld bc, Data_85280
	ld e, BANK(Data_85280)
	xor a
	scall MovePerson
	ld bc, Data_8528e
	ld e, BANK(Data_8528e)
	ld a, $1
	scall Func_80688
	scall WaitNPCStep
	playsfx $33
	sprite_face $3, $1
	move_player $1, Data_85298
	script_sleep $1e
	playsfx $2e
	scall WaitNPCStep
	ld e, $2
	xor a
	scall SpriteFace
	sprite_face $2, $1
	ld bc, Data_8529c
	ld e, BANK(Data_8529c)
	xor a
	scall MovePerson
	ld bc, Data_852a4
	ld e, BANK(Data_852a4)
	ld a, $1
	scall Func_80688
	scall WaitNPCStep
	ld a, $1
	scall PlayerFace
	ld e, $2
	xor a
	scall SpriteFace
	sprite_face $2, $1
	playsfx $5c
	script_sleep $78
	writenpctext TreeBitstreamText_39c6c
	writenpctext TreeBitstreamText_39c19
	playmusic SONG_NONE
	playmusic SONG_TOWN1
	ret

Data_85450:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $07, $1e, $00, $00, $7e, $31, $02, $07, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_85479: ; 85479
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $07, $05, $00, $00, $7e, $8b, $02, $07, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_854a2: ; 854a2
	db $1f, $09, $ff, $ff

Data_854a6: ; 854a6
	db $20, $09, $ff, $ff

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
	scall Func_80688
	scall WaitNPCStep
	ld e, $0
	xor a
	scall SetPersonVisibilityState
	setevent $5
	checkevent $6
	or a
	jp nz, Func_85519
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
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
	scall Func_80688
	scall WaitNPCStep
	hideperson $1
	setevent $6
	checkevent $5
	or a
	jp nz, Func_85570
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
Func_85570: ; 85570 (21:5570)
	pop bc
	ret

Data_85572:
	dstr "(こふﾞん1)"

Data_8557a:
	dstr "(こふﾞん2)"

Data_85582:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $06, $1e, $00, $00, $7e, $31, $02, $06, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_855ab: ; 855ab
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $06, $05, $00, $00, $7e, $8b, $02, $06, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

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
	scall PlayerFace
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
	scall SpriteFace
	ld a, $3
	scall PlayerFace
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
	scall Func_80688
	scall WaitNPCStep
	hideperson $1
	setevent $6
	checkevent $5
	or a
	jp nz, Func_8568a
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
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
	scall Func_80688
	scall WaitNPCStep
	ld e, $0
	xor a
	scall SetPersonVisibilityState
	setevent $5
	checkevent $6
	or a
	jp nz, Func_856d9
	ld a, $2
	scall Func_80c94
	ld a, $d
	scall Func_80c94
Func_856d9: ; 856d9 (21:56d9)
	pop bc
	pop bc
	ret

Data_856dc:
	dstr "(こふﾞん2)"

Data_856e4:
	dstr "(こふﾞん1)"

Data_856ec:
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $30, $01, $30, $02, $06, $1e, $00, $00, $7e, $31, $02, $06, $07, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_85715: ; 85715
	db $00, $00, $00, $02, $00, $c5, $c7, $00, $00, $8a, $01, $8a, $02, $06, $05, $00, $00, $7e, $8b, $02, $06, $03, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

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
	scall PlayerFace
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
	scall SpriteFace
	ld a, $3
	scall PlayerFace
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
	scall Func_80688
	scall WaitNPCStep
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
	scall Func_80688
	scall WaitNPCStep
	ld e, $0
	xor a
	scall SetPersonVisibilityState
	setevent $5
Func_8581b: ; 8581b (21:581b)
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
	jp nz, Func_858cf
	ld a, $f
	scall Func_80e6d
	cp $ff
	jp nz, Func_8585f
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, Func_8585f
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, Func_8585f
	ld a, $64
	scall Func_80e6d
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
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $01, $01, $38, $02, $05, $0a, $0b, $0b, $17, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_858f9:
	push af
	ld a, e
	or a
	jp nz, Func_8592e
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(おんなのこ)"

Data_85938:
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ELIF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $7e, $2, $3, $0, $9, $8
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $6
	wildbot $0, $2, $c, $b, $c, $4, $6, $7e, $5, $19, $0, $1, $4
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $2
ENDC

Data_8597e:
	db $9e, $01, $ff, $ff, $65, $01, $ff, $ff, $66, $01, $ff, $ff, $e8, $03, $ff, $ff

Data_8598e: ; 8598e
	db $e9, $03, $ff, $ff

Data_85992: ; 85992
	db $01, $0c, $02, $01, $02, $00, $07, $0b, $07, $0c, $2e, $05, $0c, $02, $01, $02, $00, $0c, $0b, $0c, $0c, $2e, $09, $0c, $02, $01, $02, $00, $11, $0b, $11, $0c, $2e, $09, $01, $01, $01, $02, $04, $09, $01, $09, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_859c9: ; 859c9
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $7e, $59, $0c, $04, $00, $07, $01, $01, $01, $04, $00, $21, $98, $5b, $00, $00, $03, $04, $0a, $08, $01, $01, $03, $04, $00, $21, $5f, $48, $82, $59, $02, $04, $06, $03, $01, $01, $01, $04, $00, $21, $5f, $48, $86, $59, $0f, $04, $00, $04, $01, $01, $01, $04, $00, $21, $17, $5b, $00, $00

Data_85a0f: ; 85a0f
	db $00, $04, $00, $04, $01, $01, $01, $04, $00, $21, $5f, $48, $8a, $59

Func_85a1d::
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
	scall Func_80d01
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
	scall Func_80150
Func_85afc: ; 85afc (21:5afc)
	scall FadeInMap
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
	scall FacePlayer
	writenpctext TreeBitstreamText_39cd9
	playsfx $2a
	writetext TreeBitstreamText_39d70
	ld c, $0
	ld e, $1
	ld a, $17
	scall Func_80d4d
	setevent $c0
	jp Func_85b6d

Func_85b52: ; 85b52 (21:5b52)
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	scall PrintTextStandard
Func_85b6d: ; 85b6d (21:5b6d)
	pop bc
	ret

Data_85b6f:
	db $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $01, $01, $7a, $02, $05, $05, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_85b98:
	push af
	ld a, e
	or a
	jp nz, Func_85c1a
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	db $28, $ce, $b9, $dd, $c9, $20, $be, $dd, $be, $b2, $29, $00

Data_85c28: ; 85c28
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ELIF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $6
ENDC

Data_85c6e:
	db $a4, $01, $ff, $ff, $72, $01, $ff, $ff, $74, $01, $ff, $ff, $73, $01, $ff, $ff

Data_85c7e: ; 85c7e
	db $e6, $03, $ff, $ff

Data_85c82: ; 85c82
	db $0a, $01, $01, $01, $02, $04, $0a, $01, $0a, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_85c98: ; 85c98
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $6e, $5c, $07, $04, $09, $08, $01, $01, $03, $04, $00, $21, $5f, $48, $72, $5c, $02, $04, $01, $0b, $01, $01, $01, $04, $00, $21, $5f, $48, $76, $5c, $03, $04, $02, $03, $01, $01, $03, $04, $00, $21, $5f, $48, $7a, $5c, $06, $04, $0a, $03, $01, $01, $02, $04, $00, $21, $cd, $5d, $00, $00

Func_85cde::
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
	scall Func_80d01
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
	scall Func_80150
Func_85d97: ; 85d97 (21:5d97)
	scall FadeInMap
	landmarksign TreeBitstreamText_46803
	pop bc
	pop bc
	pop bc
	ret

Data_85da4:
	db $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $01, $01, $91, $02, $06, $13, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_85dcd:
	push af
	ld a, e
	or a
	jp nz, Func_85e60
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(りかの せんせい)"

Data_85e6d: ; 85e6d
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ELIF DEF(STAR)
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
ELIF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $8
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $9, $6
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $4
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $a, $2
ENDC

Data_85ef9:
	db $a0, $01, $ff, $ff, $a2, $01, $ff, $ff, $77, $01, $ff, $ff

Data_85f05: ; 85f05
	db $09, $01, $01, $01, $02, $04, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $02, $04, $0a, $01, $0a, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_85f26: ; 85f26
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $f9, $5e, $0e, $04, $00, $07, $01, $01, $01, $04, $00, $21, $c1, $60, $00, $00

Data_85f42: ; 85f42
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $fd, $5e, $02, $04, $04, $0a, $01, $01, $02, $04, $00, $21, $5f, $48, $01, $5f, $04, $04, $09, $0b, $01, $01, $00, $04, $00, $21, $7b, $61, $00, $00

Func_85f6c::
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
	ld a, [wSaveFileExists]
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
	scall FadeInMap
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
	scall Func_80d01
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
	scall Func_80d01
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
	db $00, $00, $00, $01, $00, $c5, $b6, $00, $00, $72, $01, $42, $02, $05, $06, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_860c1:
	push af
	ld a, e
	or a
	jp nz, Func_86143
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(えいこﾞの せんせい)"

Data_86152:
	db $00, $00, $00, $01, $00, $c5, $b4, $00, $00, $02, $01, $2a, $02, $06, $06, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8617b:
	push af
	ld a, e
	or a
	jp nz, Func_861fd
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(しゃかいの せんせい)"

Data_8620c: ; 8620c
IF DEF(SUN)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $31, $5, $7, $7e, $6, $1e, $0, $8, $8
	wildbot $0, $2, $c, $b, $95, $6, $8, $7e, $7, $12, $0, $9, $6
	wildbot $0, $2, $c, $b, $9, $4, $6, $7e, $f, $0, $0, $1, $4
	wildbot $0, $2, $c, $b, $94, $7, $9, $7e, $7, $7, $0, $a, $2
ELIF DEF(STAR)
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
ELIF DEF(STAR)
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
ELIF DEF(STAR)
	wildbot $0, $2, $c, $b, $43, $5, $7, $7e, $7, $0, $0, $8, $a
	wildbot $0, $2, $c, $b, $63, $5, $7, $77, $2, $3, $0, $8, $4
	wildbot $0, $2, $c, $b, $94, $6, $8, $7e, $7, $7, $0, $8, $2
	wildbot $0, $2, $c, $b, $c, $4, $6, $77, $5, $19, $0, $1, $a
	wildbot $0, $2, $c, $b, $95, $7, $9, $7e, $7, $12, $0, $9, $6
ENDC

Data_862de:
	db $9f, $01, $ff, $ff, $69, $01, $ff, $ff, $a1, $01, $ff, $ff, $75, $01, $ff, $ff, $6c, $01, $ff, $ff, $a3, $01, $ff, $ff, $71, $01, $ff, $ff, $4f, $04, $ff, $ff

Data_862fe: ; 862fe
	db $0a, $01, $01, $01, $02, $03, $0a, $01, $0a, $02, $2e, $09, $01, $01, $01, $02, $01, $09, $01, $09, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_8631f: ; 8631f
	db $0a, $01, $01, $01, $02, $03, $0a, $01, $0a, $02, $2e, $09, $01, $01, $01, $02, $03, $09, $01, $09, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_86340: ; 86340
	db $0a, $01, $01, $01, $02, $02, $0a, $01, $0a, $02, $2e, $09, $01, $01, $01, $02, $03, $09, $01, $09, $02, $2e, $0b, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_86361: ; 86361
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $de, $62, $07, $04, $03, $0a, $01, $01, $02, $04, $00, $21, $25, $66, $00, $00, $03, $04, $09, $07, $01, $01, $03, $04, $00, $21, $5f, $48, $e2, $62

Data_8638b: ; 8638b
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $e6, $62, $00, $04, $09, $0a, $01, $01, $02, $04, $00, $21, $df, $66, $00, $00, $02, $04, $03, $0b, $01, $01, $00, $04, $00, $21, $5f, $48, $ea, $62, $07, $04, $0b, $0c, $01, $01, $03, $04, $00, $21, $5f, $48, $ee, $62

Data_863c3: ; 863c3
	db $ff, $00, $01, $01, $06, $01, $00, $04, $00, $21, $5f, $48, $f2, $62, $05, $04, $0a, $0a, $01, $01, $03, $04, $00, $21, $99, $67, $00, $00, $0a, $04, $03, $0b, $01, $01, $01, $04, $00, $21, $5f, $48, $f6, $62, $00, $04, $04, $02, $01, $01, $02, $04, $00, $21, $5f, $48, $fa, $62

Func_863fb::
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
	ld a, [wSaveFileExists]
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
	scall Func_80d01
	loadwilds $5, Data_8620c
	jp Func_864e8

Func_864e0: ; 864e0 (21:64e0)
	loadpeople $3, Data_86361
Func_864e8: ; 864e8 (21:64e8)
	scall FadeInMap
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
	scall Func_80d01
	loadwilds $5, Data_86252
	jp Func_8652a

Func_86522: ; 86522 (21:6522)
	loadpeople $4, Data_8638b
Func_8652a: ; 8652a (21:652a)
	scall FadeInMap
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
	scall Func_80d01
	loadwilds $5, Data_86298
	jp Func_8656c

Func_86564: ; 86564 (21:6564)
	loadpeople $4, Data_863c3
Func_8656c: ; 8656c (21:656c)
	scall FadeInMap
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
	scall FacePlayer
	checkevent $14
	or a
	jp nz, Func_865f4
	checkevent $c5
	or a
	jp nz, Func_865eb
	ld a, $3b
	scall Func_80e5d
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
	scall Func_80d74
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
	db $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $91, $01, $08, $02, $05, $0f, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_86625:
	push af
	ld a, e
	or a
	jp nz, Func_866a7
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(こくこﾞの せんせい)"

Data_866b6:
	db $00, $00, $00, $01, $00, $c5, $c9, $00, $00, $73, $01, $65, $02, $06, $06, $00, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_866df:
	push af
	ld a, e
	or a
	jp nz, Func_86761
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(たいいくの せんせい)"

Data_86770:
	db $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $2a, $01, $2a, $02, $06, $06, $00, $00, $0b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_86799:
	push af
	ld a, e
	or a
	jp nz, Func_8681b
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(すうかﾞくの せんせい)"

Data_8682b:
	db $08, $15, $02, $01, $02, $00, $1f, $09, $1f, $0a, $2e

Data_86836: ; 86836
	db $19, $0c, $09, $05, $01, $01, $02, $04, $00, $21, $00, $00, $00, $00, $0b, $0c, $03, $05, $01, $01, $01, $04, $00, $21, $00, $00, $00, $00, $0b, $0c, $03, $06, $01, $01, $01, $04, $00, $21, $00, $00, $00, $00, $0f, $0c, $0c, $06, $01, $01, $02, $04, $00, $21, $c9, $6a, $00, $00

Data_8686e: ; 8686e
	db $0f, $04, $0e, $04, $01, $01, $02, $04, $00, $21, $00, $00, $00, $00, $ff, $00, $0e, $04, $01, $01, $02, $04, $00, $21, $0d, $6b, $00, $00

Func_8688a::
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $f
	scall Func_80f24
	pop bc
	loadpeople $2, Data_8686e
	ld e, $0
	xor a
	scall SetPersonVisibilityState
	loadwarps $1, Data_8682b
	checkevent $7
	or a
	jp nz, Func_868d5
	loadpeople $4, Data_86836
	scall FadeInMap
	call Func_86943
	jp Func_868dd

Func_868d5: ; 868d5 (21:68d5)
	playmusic SONG_TOWN2
	scall FadeInMap
Func_868dd: ; 868dd (21:68dd)
	ret

Data_868de:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $bc, $00, $00, $00, $01, $4f, $02, $06, $14, $00, $00, $7e, $61, $02, $06, $11, $00, $00, $00, $46, $03, $06, $07, $07, $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $bc, $00, $00, $00, $01, $4f, $02, $06, $14, $00, $00, $7e, $61, $02, $06, $11, $00, $00, $00, $05, $03, $06, $01, $06, $00, $2d, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_86907: ; 86907
	db $0b, $13, $0b, $08, $09, $08, $ff, $ff

Data_8690f: ; 8690f
	db $07, $05, $ff, $ff

Data_86913: ; 86913
	db $07, $06, $ff, $ff

Data_86917: ; 86917
	db $0e, $05, $0e, $08, $0c, $08, $ff, $ff

Data_8691f: ; 8691f
	db $0c, $0d, $ff, $ff

Data_86923: ; 86923
	db $04, $05, $ff, $ff

Data_86927: ; 86927
	db $04, $06, $04, $08, $ff, $ff

Data_8692d: ; 8692d
	db $04, $08, $ff, $ff

Data_86931: ; 86931
	db $06, $08, $ff, $ff

Data_86935: ; 86935
	db $06, $08, $06, $0d, $ff, $ff

Data_8693b: ; 8693b
	db $06, $0e, $ff, $ff

Data_8693f: ; 8693f
	db $09, $06, $ff, $ff

Func_86943: ; 86943 (21:6943)
	playmusic SONG_NONE
	playmusic SONG_TITLE
	scall WaitNPCStep
	move_player $1, Data_86907
	scall WaitNPCStep
	xor a
	scall PlayerFace
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	writenpctext TreeBitstreamText_3a38a
	ld bc, Data_8690f
	ld e, BANK(Data_8690f)
	ld a, $3
	scall MovePerson
	ld bc, Data_86913
	ld e, BANK(Data_86913)
	ld a, $4
	scall Func_80688
	scall WaitNPCStep
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
	scall Func_80688
	scall WaitNPCStep
	ld a, $1
	scall PlayerFace
	ld bc, Data_8691f
	ld e, BANK(Data_8691f)
	ld a, $2
	scall Func_80688
	scall WaitNPCStep
	hideperson $2
	xor a
	scall PlayerFace
	ld bc, Data_86923
	ld e, BANK(Data_86923)
	ld a, $3
	scall Func_80688
	ld bc, Data_86927
	ld e, BANK(Data_86927)
	ld a, $4
	scall Func_80688
	scall WaitNPCStep
	ld bc, Data_8692d
	ld e, BANK(Data_8692d)
	ld a, $3
	scall MovePerson
	ld bc, Data_86931
	ld e, BANK(Data_86931)
	ld a, $4
	scall Func_80688
	scall WaitNPCStep
	ld a, $3
	scall PlayerFace
	ld bc, Data_86935
	ld e, BANK(Data_86935)
	ld a, $3
	scall MovePerson
	ld bc, Data_8693b
	ld e, BANK(Data_8693b)
	ld a, $4
	scall Func_80688
	scall WaitNPCStep
	hideperson $3
	hideperson $4
	playmusic SONG_NONE
	playmusic SONG_TOWN2
	script_sleep $1e
	ld bc, Data_8693f
	ld e, BANK(Data_8693f)
	ld a, $5
	scall Func_80688
	scall WaitNPCStep
	sprite_face $2, $5
	script_sleep $1e
	xor a
	scall PlayerFace
	script_sleep $1e
	writenpctext TreeBitstreamText_3a481
	setevent $7
	ld a, $8
	ld [wc790], a
	ret

Data_86ac4:
	dstr "ヒﾞスコ"

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
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx $28
	ld e, $1
	xor a
	scall SetPersonVisibilityState
	playsfx $60
	ld e, $3
	xor a
	scall SpriteFace
	ld e, $0
	xor a
	scall SpriteFace
	ld e, $1
	xor a
	scall SpriteFace
	ld e, $2
	xor a
	scall SpriteFace
	ld e, $3
	xor a
	scall SpriteFace
	ld e, $0
	xor a
	scall SpriteFace
	ld e, $1
	xor a
	scall SpriteFace
	ld e, $2
	xor a
	scall SpriteFace
	ld a, $f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $1
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep $1e
	ld c, $8
	ld e, $7
	ld a, $6
	scall Func_80e8d
	setevent $d6
	playsfx $60
	ld e, $3
	xor a
	scall SpriteFace
	ld e, $0
	xor a
	scall SpriteFace
	ld e, $1
	xor a
	scall SpriteFace
	ld e, $2
	xor a
	scall SpriteFace
	ld e, $3
	xor a
	scall SpriteFace
	ld e, $0
	xor a
	scall SpriteFace
	ld e, $1
	xor a
	scall SpriteFace
	ld e, $2
	xor a
	scall SpriteFace
	ld a, $f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $1
	scall FadeInAudio
	playmusic SONG_TOWN2
	face_player 0
	ld e, $0
	xor a
	scall SetPersonVisibilityState
	jp Func_86c00

Func_86bfa: ; 86bfa (21:6bfa)
	writetext TreeBitstreamText_3f79e
Func_86c00: ; 86c00 (21:6c00)
	ret

Data_86c01:
	db $0c, $04, $02, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $2b, $06, $01, $01, $03, $0a, $09, $12, $09, $11, $2e, $09, $09, $01, $01, $20, $00, $01, $05, $01, $04, $2e, $07, $0d, $01, $01, $20, $00, $01, $05, $01, $04, $2e, $05, $11, $01, $01, $20, $00, $01, $05, $01, $04, $2e, $11, $09, $01, $01, $20, $00, $01, $05, $01, $04, $2e, $15, $0f, $01, $01, $20, $06, $06, $0c, $06, $0b, $2e, $17, $13, $01, $01, $20, $00, $01, $05, $01, $04, $2e, $14, $05, $01, $01, $20, $07, $05, $09, $05, $08, $2e, $17, $06, $01, $01, $20, $08, $05, $09, $05, $08, $2e, $1a, $0a, $01, $01, $20, $05, $06, $0b, $06, $0a, $2e

Data_86c7a: ; 86c7a
	db $04, $07, $16, $11, $0b, $05, $09, $15, $11, $0b, $06, $0b, $17, $11, $0b, $07, $16, $18, $11, $0b, $08, $18, $16, $11, $0b, $09, $0b, $15, $11, $0c, $0a, $19, $17, $11, $0c, $0b, $1b, $14, $11, $0c, $0c, $0a, $16, $11, $0d, $0d, $0f, $16, $11, $0d, $0e, $0f, $18, $11, $0d, $0f, $1e, $13, $11, $0d, $10, $0a, $15, $11, $0e, $11, $11, $17, $11, $0e, $12, $20, $13, $11, $0e, $13, $15, $17, $11, $0f, $14, $06, $14, $11, $10, $15, $1f, $14, $11, $11, $d1, $01, $ff, $ff, $d2, $01, $ff, $ff, $d3, $01, $ff, $ff, $d0, $01, $ff, $ff, $d4, $01, $ff, $ff, $b6, $02, $ff, $ff, $26, $03, $ff, $ff

Data_86cf0: ; 86cf0
	db $98, $03, $ff, $ff

Data_86cf4: ; 86cf4
	db $99, $03, $ff, $ff

Data_86cf8: ; 86cf8
	db $04, $04, $0e, $08, $01, $01, $03, $04, $00, $21, $5f, $48, $d4, $6c, $0c, $04, $0a, $11, $01, $01, $01, $04, $00, $21, $5f, $48, $d8, $6c, $0b, $04, $12, $13, $01, $01, $02, $04, $00, $21, $5f, $48, $dc, $6c, $00, $04, $1e, $0a, $01, $01, $01, $04, $00, $21, $5f, $48, $e0, $6c, $00, $04, $29, $07, $01, $01, $02, $04, $00, $21, $5f, $48, $e4, $6c, $05, $04, $15, $09, $01, $01, $00, $04, $00, $21, $41, $71, $00, $00, $ff, $00, $0b, $05, $01, $01, $00, $04, $00, $21, $5f, $48, $e8, $6c, $ff, $00, $0e, $05, $01, $01, $00, $04, $00, $21, $5f, $48, $e8, $6c, $ff, $00, $1c, $10, $01, $01, $00, $04, $00, $21, $5f, $48, $ec, $6c, $ff, $00, $0d, $12, $01, $01, $00, $04, $00, $21, $5f, $48, $ec, $6c

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
ELIF DEF(STAR)
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

Func_86ffa::
	ld a, $2
	ld [wc789], a
	ld a, $4
	ld [wc7e2], a
	ld a, $4
	scall Func_80c94
	call Func_870fa
	ld hl, Func_870fa
	scall Func_80f11
	loadwarps $b, Data_86c01
	ld a, $5
	scall Func_80d01
	loadwilds $2d, Data_86d84
	checkevent $1
	cp $1
	jp nz, Func_8703a
	ld e, $12
	ld hl, Data_86c7a
	scall Func_80ce7
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
	scall Func_80150
	ld de, Data_86cf4
	ld a, $1
	scall Func_80150
	hideperson $8
	hideperson $9
Func_8706e: ; 8706e (21:706e)
	playmusic SONG_TOWN1
	ld a, $1
	scall LoadPlayerSprite
	scall FadeInMap
	ret

Data_8707c:
	db $0c, $08, $03, $05, $0c, $0e

Data_87082: ; 87082
	db $0c, $08, $03, $04, $1b, $0d

Data_87088: ; 87088
	db $2c, $1a, $04, $04, $05, $14, $2c, $1a, $04, $04, $09, $15, $2c, $1a, $04, $04, $0d, $16, $00, $1d, $01, $01, $04, $14, $11, $13, $02, $01, $17, $15, $24, $10, $01, $01, $15, $16, $24, $12, $01, $04, $15, $17, $02, $13, $02, $04, $16, $16, $2a, $0c, $01, $04, $18, $16, $24, $10, $01, $05, $19, $14, $02, $13, $02, $04, $1a, $14, $02, $13, $01, $04, $1c, $14, $24, $10, $01, $01, $1d, $13, $24, $12, $01, $04, $1d, $14, $02, $13, $02, $04, $1e, $13, $24, $11, $01, $04, $20, $12, $02, $13, $01, $04, $21, $12, $02, $13, $02, $04, $11, $17, $02, $13, $02, $04, $13, $17

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
	scall Func_80d9b
	pop af
	inc a
	jp Func_87105

Func_8711f: ; 8711f (21:711f)
	scall Func_80f02
Func_87122: ; 87122 (21:7122)
	ld a, [wc790]
	or a
	jp z, Func_87140
	ld a, [wc790]
	cp $7
	jp nc, Func_87140
	ld hl, Data_8707c
	scall Func_80d9b
	ld hl, Data_87082
	scall Func_80d9b
	scall Func_80f02
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
	db $08, $12, $03, $01, $03, $00, $2b, $06, $2b, $07, $2e, $01, $04, $01, $01, $03, $0b, $02, $04, $02, $05, $2e, $07, $04, $01, $01, $03, $0b, $08, $04, $09, $04, $2e

Data_87185: ; 87185
	db $16, $0e, $03, $01, $30

Data_8718a: ; 8718a
IF DEF(SUN)
	wildbot $0, $3, $10, $10, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $0, $3, $10, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $10, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $3, $10, $10, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $0, $3, $10, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ELIF DEF(STAR)
	wildbot $0, $3, $10, $10, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $0, $3, $10, $10, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $0, $3, $10, $10, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $0, $3, $10, $10, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $0, $3, $10, $10, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_871d0:
	db $90, $03, $ff, $ff

Data_871d4: ; 871d4
	db $06, $04, $0e, $07, $01, $01, $02, $04, $00, $21, $8f, $72, $00, $00, $0e, $04, $01, $0a, $01, $01, $02, $04, $00, $21, $17, $73, $00, $00, $ff, $00, $07, $0d, $01, $01, $00, $04, $00, $21, $5f, $48, $d0, $71

Func_871fe::
	loadwarps $3, Data_87164
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, Func_8723b
	ld a, $1
	ld [wc7da], a
	scall FadeInMap
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
	scall Func_80d01
	loadwilds $5, Data_8718a
	ld e, $1
	ld hl, Data_87185
	scall Func_80ce7
	loadpeople $3, Data_871d4
	xor a
	ld [wc7da], a
	scall FadeInMap
	landmarksign TreeBitstreamText_4686b
Func_87265: ; 87265 (21:7265)
	ret

Data_87266:
	db $00, $00, $00, $01, $00, $c5, $c9, $00, $00, $91, $01, $91, $02, $0c, $0e, $13, $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8728f:
	push af
	ld a, e
	or a
	jp nz, Func_872e5
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(りょうし)"

Data_872ee:
	db $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $7a, $01, $7a, $02, $0c, $17, $05, $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87317:
	push af
	ld a, e
	or a
	jp nz, Func_8736d
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(りょうし)"

Data_87376:
	db $09, $12, $ff, $ff

Func_8737a: ; 8737a (21:737a)
	move_player $1, Data_87376
	scall WaitNPCStep
	ret

Data_87388:
	db $02, $04, $01, $01, $03, $0a, $01, $04, $01, $05, $2e, $08, $04, $01, $01, $03, $0a, $07, $04, $08, $04, $2e, $01, $11, $01, $01, $03, $0c, $16, $07, $15, $07, $2e

Data_873a9: ; 873a9
	db $18, $02, $03, $01, $0c, $19, $0c, $12, $01, $0c

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
ELIF DEF(STAR)
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
	db $ff, $00, $01, $09, $03, $03, $00, $04, $00, $21, $97, $74, $00, $00, $00, $04, $0c, $0c, $01, $01, $03, $04, $00, $21, $ec, $74, $00, $00, $08, $04, $04, $10, $01, $01, $02, $04, $00, $21, $74, $75, $00, $00

Func_8744d::
	loadwarps $3, Data_87388
	ld e, $2
	ld hl, Data_873a9
	scall Func_80ce7
	ld a, $3
	scall Func_80d01
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
	scall FadeInMap
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
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic SONG_CAVE
Func_874c2: ; 874c2 (21:74c2)
	ret

Data_874c3:
	db $00, $00, $00, $01, $00, $c5, $ae, $00, $00, $42, $01, $42, $02, $0c, $06, $07, $00, $66, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_874ec:
	push af
	ld a, e
	or a
	jp nz, Func_87542
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(りょうし)"

Data_8754b:
	db $00, $00, $00, $01, $00, $c5, $b9, $00, $00, $3f, $01, $3f, $02, $0d, $02, $09, $00, $65, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87574:
	push af
	ld a, e
	or a
	jp nz, Func_8763c
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	scall Func_80d4d
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
	scall Func_80d4d
	setevent $109
Func_87636: ; 87636 (21:7636)
	writetext TreeBitstreamText_42bc8
Func_8763c: ; 8763c (21:763c)
	pop bc
	ret

Data_8763e:
	dstr "(かいてーしﾞん)"

Func_87648: ; 87648 (21:7648)
	resetevent $18
	resetevent $19
	resetevent $1a
	resetevent $4b
	ret

Data_87669:
	db $16, $07, $01, $01, $03, $0b, $01, $11, $02, $11, $2e, $01, $06, $01, $01, $03, $0d, $06, $04, $06, $05, $2e, $15, $12, $01, $01, $03, $0f, $07, $04, $06, $04, $2e, $16, $0e, $01, $01, $20, $03, $04, $02, $04, $03, $2e

Data_87695: ; 87695
	db $16, $07, $01, $01, $03, $0b, $01, $11, $02, $11, $2e, $01, $06, $01, $01, $03, $0e, $06, $04, $06, $05, $2e, $15, $12, $01, $01, $03, $0f, $07, $04, $06, $04, $2e, $16, $0e, $01, $01, $20, $03, $04, $02, $04, $03, $2e

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
ELIF DEF(STAR)
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
	db $1b, $04, $08, $08, $01, $01, $02, $04, $00, $21, $8b, $78, $00, $00, $1b, $04, $09, $09, $01, $01, $02, $04, $00, $21, $f1, $78, $00, $00, $1b, $04, $0a, $0a, $01, $01, $02, $04, $00, $21, $57, $79, $00, $00, $1b, $04, $0b, $0b, $01, $01, $02, $04, $00, $21, $bd, $79, $00, $00

Data_87769: ; 87769
	db $1b, $04, $09, $09, $01, $01, $02, $04, $00, $21, $23, $7a, $00, $00, $1b, $04, $0a, $0a, $01, $01, $02, $04, $00, $21, $73, $7a, $00, $00

Data_87785: ; 87785
	db $ff, $00, $09, $0d, $01, $01, $00, $04, $01, $21, $00, $00, $00, $00, $ff, $00, $16, $0e, $01, $01, $00, $04, $00, $21, $14, $7b, $00, $00, $ff, $00, $17, $0e, $01, $01, $00, $04, $00, $21, $c3, $7a, $00, $00, $03, $04, $15, $0a, $01, $01, $00, $04, $00, $21, $5c, $7c, $00, $00, $04, $04, $01, $09, $01, $01, $01, $04, $00, $21, $e5, $7c, $00, $00

Func_877cb::
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
	scall Func_80d01
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
	scall FadeInMap
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
	scall FadeInMap
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_878ef
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_87955
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_879bb
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_87a21
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_87a71
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80bde
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
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, Func_87ac1
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
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
	scall Func_80653
	loademote $1, $1, $9
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $2
	scall PlayerFace
	resetevent $fa
	ld l, $3
	push hl
	ld c, $3
	ld e, $3
	ld a, $20
	scall Func_80dff
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
	scall Func_80653
	ld a, $2
	scall PlayerFace
	scall FadeInMap
	landmarksign TreeBitstreamText_46886
	loademote $1, $2, $9
	playsfx $37
	scall WaitEmote
	ld a, $1
	scall Func_80653
	script_sleep $1
	scall HideEmote
	setevent $fb
	ret

Data_87bd7:
	db $16, $07, $01, $01, $03, $0b, $01, $11, $02, $11, $2e, $01, $06, $01, $01, $03, $0e, $06, $04, $06, $05, $2e, $15, $12, $01, $01, $03, $0f, $07, $04, $06, $04, $2e, $16, $0e, $01, $01, $20, $03, $04, $02, $04, $03, $2e

Func_87c03: ; 87c03 (21:7c03)
	setevent $4c
	scall AllocateSpaceForWarps
	loadwarps $4, Data_87bd7
	scall StartShakingScreen
	playsfx $64
	script_sleep $3c
	playsfx $64
	script_sleep $3c
	scall StopShakingScreen
	ret

Data_87c33:
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $48, $01, $48, $02, $0d, $02, $02, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87c5c:
	push af
	ld a, e
	or a
	jp nz, Func_87cb2
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(おんなのこ)"

Data_87cbc:
	db $00, $00, $00, $01, $00, $c5, $b4, $00, $00, $49, $01, $49, $02, $0e, $07, $11, $14, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87ce5:
	push af
	ld a, e
	or a
	jp nz, Func_87d3b
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
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
	dstr "(しﾞいさん)"

Data_87d45:
	db $06, $04, $01, $01, $03, $0c, $01, $06, $02, $06, $2e

Data_87d50: ; 87d50
IF DEF(SUN)
	wildbot $5, $3, $f, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $6, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $5, $3, $f, $6, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ELIF DEF(STAR)
	wildbot $5, $3, $f, $6, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $6, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $5, $3, $f, $6, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_87d7a: ; 87d7a
	db $00, $04, $10, $06, $01, $01, $02, $04, $00, $21, $ca, $7d, $00, $00

Func_87d88::
	loadwarps $1, Data_87d45
	ld a, $3
	scall Func_80d01
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
	scall FadeInMap
	landmarksign TreeBitstreamText_46894
	ret

Func_87dca:
	push af
	ld a, e
	or a
	jp nz, Func_87e32
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	checkevent $51
	or a
	jp nz, Func_87e2c
	writenpctext TreeBitstreamText_3ae6a
	ld a, $b
	scall Func_80e5d
	cp $1
	jp nz, Func_87e23
	writenpctext TreeBitstreamText_3aea4
	writenpctext_yesorno TreeBitstreamText_3aef1
	or a
	jp nz, Func_87e1a
	ld c, $1
	ld e, $1
	ld a, $b
	scall Func_80d4d
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
	db $06, $04, $01, $01, $03, $0c, $01, $06, $02, $06, $2e, $10, $08, $01, $01, $03, $0f, $01, $0b, $01, $0a, $2e

Data_87e4a: ; 87e4a
IF DEF(SUN)
	wildbot $5, $3, $f, $9, $5, $9, $b, $2d, $1, $6, $0, $8, $a
	wildbot $5, $3, $f, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $f, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $9, $23, $c, $e, $4f, $1e, $1e, $0, $a, $6
	wildbot $5, $3, $f, $9, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ELIF DEF(STAR)
	wildbot $5, $3, $f, $9, $46, $9, $b, $78, $14, $14, $0, $8, $a
	wildbot $5, $3, $f, $9, $48, $a, $c, $7f, $14, $d, $1e, $2, $9
	wildbot $5, $3, $f, $9, $49, $b, $d, $2, $2, $2, $2, $2, $8
	wildbot $5, $3, $f, $9, $25, $c, $e, $79, $18, $18, $0, $a, $6
	wildbot $5, $3, $f, $9, $6a, $e, $10, $7f, $3, $c, $0, $b, $2
ENDC

Data_87e90:
	db $7a, $00, $ff, $ff

Data_87e94: ; 87e94
	db $00, $04, $10, $06, $01, $01, $02, $04, $00, $21, $fc, $48, $90, $7e

Func_87ea2::
	loadwarps $2, Data_87e34
	ld a, $3
	scall Func_80d01
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
	scall FadeInMap
	landmarksign TreeBitstreamText_46894
	ret

