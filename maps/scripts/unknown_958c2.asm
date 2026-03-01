
Data_95828: ; 95828
	warpdef $02, $09, $02, $01, MAP_00_31, $05, $01, $05, $02, SFX_34

Data_95833: ; 95833
	db $5a, $02, $02, $11, $4f

Data_95838:
	db $c7, $03, $ff, $ff

Data_9583c:
	db $ef, $03, $ff, $ff

Data_95840:
	db $28, $03, $ff, $ff

Data_95844: ; 95844
	person_event $24, $0c, $03, $08, $01, $01, $01, $04, $00, Func_95ab9, NULL
	person_event $00, $0c, $06, $01, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95838
	person_event $ff, $00, $03, $01, $02, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95840

Data_9587c: ; 9587c
	person_event $24, $04, $05, $04, $01, $01, $00, $04, $00, Func_95ab9, NULL
	person_event $00, $04, $09, $07, $01, $01, $00, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95838
	person_event $ff, $00, $03, $01, $02, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95840
	person_event $ff, $00, $0a, $05, $02, $02, $02, $04, $00, PrintTextFacePlayer_25, Data_9583c

Func_958c2::
	call Func_9596a
	ld hl, Func_9596a
	scall Func_80f11
	loadwarps 1, Data_95828
	ld e, $1
	ld hl, Data_95833
	scall Func_80ce7
	playmusic $c
	checkevent $f
	or a
	jp nz, Func_9590a
	loadpeople 4, Data_95844
	hideperson $1
	scall Func_8001c
	call Func_959a9
	setevent $f
	jp Func_95957

Func_9590a:
	ld a, [wc78c]
	cp $a
	jp c, Func_95935
	loadpeople 5, Data_9587c
	ld c, $6
	ld e, $9
	xor a
	scall Func_80080
	sprite_face $2, 0
	hideperson $1
	scall Func_8001c
	jp Func_95957

Func_95935:
	loadpeople 5, Data_9587c
	ld c, $0
	ld e, $0
	ld a, $1
	scall Func_80080
	hideperson $1
	hideperson $4
	scall Func_8001c
Func_95957:
	ret

Data_95958:
	db $00, $0f, $02, $01, $0a, $05

Data_9595e: ; 9595e
	db $02, $0f, $02, $01, $0a, $06

Data_95964: ; 95964
	db $04, $03, $02, $03, $0a, $05

Func_9596a:
	ld a, [wc78c]
	cp $a
	jp nc, Func_9597e
	ld hl, Data_95964
	scall Func_80d9b
	scall Func_80f02
	jp Func_95998

Func_9597e:
	checkevent $5b
	cp $1
	jp nz, Func_95998
	ld hl, Data_95958
	scall Func_80d9b
	ld hl, Data_9595e
	scall Func_80d9b
	scall Func_80f02
Func_95998:
	ret

Data_95999:
	db $05, $04, $ff, $ff

Data_9599d: ; 9599d
	db $06, $04, $ff, $ff

Data_959a1: ; 959a1
	db $06, $02, $ff, $ff

Data_959a5: ; 959a5
	db $06, $04, $ff, $ff

Func_959a9:
	move_person 0, Data_95999, 0
	move_player $1, Data_9599d
	playsfx $31
	loademote $1, $2, $c
	scall WaitEmote
	ld hl, $1e
	scall ScriptSleep
	ld a, STARTER + 1
	scall GetRobotSprite
	ld e, a
	ld a, $1
	scall ChangeSprite
	sprite_face $2, $1
	showperson $1
	move_person $1, Data_959a1, 1
	scall WaitNPCStep
	playsfx $31
	loademote $1, $4, $c
	scall WaitEmote
	scall HideEmote
	sprite_face $1, 0
	writenpctext TreeBitstreamText_3926c
	move_person $1, Data_959a5, 0
	scall WaitNPCStep
	hideperson $1
	playsfx $2a
	playmusic SONG_NONE
	playmusic $19
	ld hl, $b4
	scall ScriptSleep
	playmusic SONG_NONE
	playmusic $c
IF DEF(SUN)
	writetext TreeBitstreamText_39295
ELIF DEF(STAR)
	writetext TreeBitstreamText_392a8
ENDC
	ld a, $3
	scall PlayerFace
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
Func_95a7f:
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
	scall GiveRobot
	jp Func_95ab2

Func_95aa4:
	ld c, $5
	ld e, $0
	ld a, STARTER + 1
	scall GiveRobot
	ld a, $28
	scall Func_810a3
Func_95ab2:
	ret

Data_95ab3:
	db $08, $07, $09, $07, $ff, $ff

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
	face_player 0
	writenpctext TreeBitstreamText_39559
	playsfx $2a
	writetext TreeBitstreamText_395a3
	ld c, $0
	ld e, $1
	ld a, $1b
	scall Func_80d4d
	writenpctext TreeBitstreamText_395b4
	setevent $f5
	jp Func_95c0b

Func_95b02:
	checkevent $f4
	cp $1
	jp nz, Func_95b40
	checkevent $f6
	or a
	jp nz, Func_95b40
	face_player 0
	ld hl, $47e
	scall PrintTextWithNPCName
	playsfx $2a
	writetext TreeBitstreamText_3968a
	ld c, $0
	ld e, $1
	ld a, $1a
	scall Func_80d4d
	setevent $f6
	jp Func_95c0b

Func_95b40:
	ld a, [wc78c]
	cp $14
	jp nz, Func_95b81
	checkevent $e7
	or a
	jp nz, Func_95b81
	face_player 0
	writenpctext TreeBitstreamText_3949f
	playsfx $2a
	writetext TreeBitstreamText_39545
	give_robot TEABOT, $1e, $0
	setevent $e7
	sprite_face $2, 0
	jp Func_95c0b

Func_95b81:
	ld a, [wc78c]
	cp $a
	jp c, Func_95bdb
	ld a, [wPlayerFacing]
	cp $2
	jp z, Func_95b96
	cp $1
	jp nz, Func_95ba4
Func_95b96:
	move_player $1, Data_95ab3
	xor a
	scall PlayerFace
Func_95ba4:
	sprite_face $2, 0
	checkevent $c4
	or a
	jp nz, Func_95bc2
	writenpctext TreeBitstreamText_393e9
	setevent $c4
Func_95bc2:
	writenpctext_yesorno TreeBitstreamText_3945b
	or a
	jp nz, Func_95bd2
	scall Func_80479
	jp Func_95bd8

Func_95bd2:
	writenpctext TreeBitstreamText_39471
Func_95bd8:
	jp Func_95c0b

Func_95bdb:
	face_player 0
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $1, $2, $8
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	writenpctext TreeBitstreamText_39369
	playmusic SONG_CENTER
Func_95c0b:
	ret
