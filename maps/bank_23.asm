INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 23", ROMX
	script_library 23

Data_8d0b4:
	db $05, $14, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e
	db $15, $05, $01, $01, $02, $00, $17, $10, $17, $0f, $2e
	db $0c, $06, $01, $01, $20, $07, $05, $09, $05, $08, $34
	db $11, $06, $01, $01, $20, $02, $01, $0a, $01, $09, $34
	db $19, $06, $01, $01, $20, $02, $01, $0a, $01, $09, $34
	db $1e, $06, $01, $01, $20, $06, $06, $0c, $06, $0b, $34
	db $0c, $0c, $01, $01, $20, $08, $05, $09, $05, $08, $34
	db $11, $0c, $01, $01, $20, $01, $01, $08, $01, $07, $34
	db $19, $0c, $01, $01, $20, $01, $01, $08, $01, $07, $34
	db $1d, $0c, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $0c, $12, $01, $01, $20, $05, $06, $0b, $06, $0a, $34
	db $11, $12, $01, $01, $20, $01, $01, $08, $01, $07, $34
	db $19, $12, $01, $01, $20, $01, $01, $08, $01, $07, $34
	db $1d, $12, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $23, $14, $01, $01, $20, $05, $06, $0b, $06, $0a, $34

Data_8d159:
	db $07, $11, $01, $01, $20, $03, $01, $08, $01, $07, $34

Data_8d164:
	dtext_tree_pointer TreeBitstreamText_4651c
	dw -1

Data_8d168:
	dtext_tree_pointer TreeBitstreamText_4653a
	dw -1

Data_8d16c:
	dtext_tree_pointer TreeBitstreamText_3fd45
	dw -1

Data_8d170:
	dtext_tree_pointer TreeBitstreamText_3ffc5
	dw -1

Data_8d174:
	dtext_tree_pointer TreeBitstreamText_3fc99
	dw -1

Data_8d178:
	dtext_tree_pointer TreeBitstreamText_3ff8c
	dw -1

Data_8d17c:
	dtext_tree_pointer TreeBitstreamText_46e6c
	dw -1

Data_8d180:
	dtext_tree_pointer TreeBitstreamText_3fcf1
	dw -1

Data_8d184:
	person_event $21, $0c, $23, $02, $01, $01, $02, $04, $00, Func_8d955, NULL
	person_event $22, $0c, $23, $01, $01, $01, $02, $04, $00, Func_8d955, NULL

Data_8d1a0:
	person_event $ff, $00, $23, $14, $02, $01, $00, $04, $00, Func_8d396, NULL
	person_event $ff, $00, $06, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	person_event $ff, $00, $06, $15, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	person_event $ff, $00, $14, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	person_event $ff, $00, $16, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	person_event $ff, $00, $06, $04, $03, $03, $00, $04, $00, Func_8d2f4, NULL
	person_event $10, $0c, $0d, $08, $01, $01, $03, $04, $00, Func_8db33, NULL
	person_event $06, $04, $0b, $14, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d16c
	person_event $0e, $04, $1c, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_23, Data_8d170
	person_event $04, $04, $1c, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_23, Data_8d174
	person_event $0a, $04, $21, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d178

Data_8d23a:
	person_event $ff, $00, $07, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d17c

Data_8d248:
	person_event $ff, $00, $07, $11, $01, $01, $00, $04, $01, Func_8dd80, NULL

Func_8d256:: ; 8d256
	call Func_8da28
	ld hl, Func_8da28
	scall Func_80f11
	xor a
	ld [wc789], a
	ld a, $02
	ld [wc7e2], a
	loadwarps $0f, Data_8d0b4
	loadpeople $02, Data_8d184
	hideperson 0
	hideperson $01
	loadpeople $0b, Data_8d1a0
	ld a, $07
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	checkevent $0046
	cp $01
	jp nz, label_8d2a9
	hideperson $02
label_8d2a9:
	ld a, [wc790]
	or a
	jp z, label_8d2c0
	ld a, [wc790]
	cp $04
	jp nz, label_8d2c0
	ld de, Data_8d180
	ld a, $09
	scall SetPersonTextPointer
label_8d2c0:
	ld a, [wc790]
	or a
	jp z, label_8d2e2
	ld a, [wc790]
	cp $07
	jp nc, label_8d2e2
	loadwarps $01, Data_8d159
	loadpeople $01, Data_8d248
	jp label_8d2ea
label_8d2e2:
	loadpeople $01, Data_8d23a
label_8d2ea:
	scall Func_8001c
	ret

Data_8d2ee:
	db $09, $07, $07, $07, $ff, $ff

Func_8d2f4:
	ld a, e
	or a
	jp nz, label_8d395
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, label_8d321
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, label_8d321
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, label_8d321
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, label_8d38f
label_8d321:
	ld a, [wc790]
	or a
	jp z, label_8d386
	ld a, [wc790]
	cp $06
	jp nc, label_8d386
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, label_8d383
	ld a, [wPlayerFacing]
	or a
	jp z, label_8d34b
	ld c, $01
	ld de, Data_8d2ee
	ld a, $23
	scall MovePlayer
label_8d34b:
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	ld a, $44
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $03
	scall PlayerFace
	ld l, $09
	push hl
	ld c, $2d
	ld e, $02
	ld a, $1e
	scall Func_80dff
	pop bc
label_8d383:
	jp label_8d38c
label_8d386:
	writetext TreeBitstreamText_470f0
label_8d38c:
	jp label_8d395
label_8d38f:
	writetext TreeBitstreamText_470d8
label_8d395:
	ret

Func_8d396:
	push de
	xor a
	checkevent $0046
	or a
	jp nz, label_8d42b
	ld hl, sp+$00
	ld a, [hl]
	or a
	jp nz, label_8d42b
	ld a, [wc78d]
	cp $07
	jp z, label_8d3b4
	jp label_8d42b
label_8d3b4:
	showperson 0
	writenpctext TreeBitstreamText_3ccf9
	ld l, $11
	xor a
label_8d3c3:
	cp l
	jp nc, label_8d3e0
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d3da
	xor a
	scall Func_80653
label_8d3da:
	pop af
	inc a
	pop hl
	jp label_8d3c3
label_8d3e0:
	push hl
	call Func_8d435
	xor a
	pop hl
label_8d3e6:
	cp l
	jp nc, label_8d412
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d40c
	hideperson 0
	hideperson $01
	ld a, $01
	scall Func_80653
label_8d40c:
	pop af
	inc a
	pop hl
	jp label_8d3e6
label_8d412:
	hideperson $02
	ld a, $0a
	scall Func_80c94
	ld a, $0b
	scall Func_80c94
	setevent $0046
label_8d42b:
	pop bc
	ret

Data_8d42d:
	db $24, $02, $ff, $ff

Data_8d431:
	db $23, $02, $ff, $ff

Func_8d435:
	ld hl, $003c
	scall ScriptSleep
	writenpctext TreeBitstreamText_3cd08
	ld hl, $003c
	scall ScriptSleep
	showperson $01
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	move_person 0, Data_8d42d, 1
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	move_person $01, Data_8d431, 1
	scall WaitNPCStep
	ld e, $01
	ld a, $01
	scall SpriteFace
	writenpctext TreeBitstreamText_3cdce
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	writenpctext TreeBitstreamText_3ce14
	ld e, $02
	ld a, $01
	scall SpriteFace
	writenpctext TreeBitstreamText_3cec2
	writenpctext TreeBitstreamText_3cefd
	hideperson $02
	ret

Func_8d4d8:: ; 8d4d8
	push af
	ld hl, $c21a
	ld [hl], $02
	inc hl
	ld [hl], $a8
	inc hl
	ld [hl], $4b
	xor a
	call FarCall
	xor a
	scall PlayMusic
	hideperson $0c
	ld a, $3a
	scall PlaySFX
	scall StartShakingScreen
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $12
	ld a, $23
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $11
	ld a, $22
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $11
	ld a, $24
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $13
	ld a, $22
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $13
	ld a, $24
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $65
	scall PlaySFX
	scall StopShakingScreen
	pop af
	cp $2d
	jp z, label_8d5f5
	call Func_8da28
	scall Func_80f02
	ld a, $07
	scall PlayMusic
	ld a, [wc78d]
	cp $01
	jp z, label_8d5dd
	cp $02
	jp z, label_8d5d7
	cp $03
	jp z, label_8d5d1
	cp $04
	jp z, label_8d5cb
	cp $05
	jp z, label_8d5bd
	cp $06
	jp nz, label_8d5f2
	call Func_8d8e9
	jp label_8d5f2
label_8d5bd:
	call Func_8d877
	setevent $002f
	jp label_8d5f2
label_8d5cb:
	call Func_8d813
	jp label_8d5f2
label_8d5d1:
	call Func_8d7b8
	jp label_8d5f2
label_8d5d7:
	call Func_8d76b
	jp label_8d5f2
label_8d5dd:
	checkevent $0049
	or a
	jp nz, label_8d5f2
	call Func_8d61a
	setevent $0049
label_8d5f2:
	jp label_8d5fa
label_8d5f5:
	ld a, $07
	scall PlayMusic
label_8d5fa:
	call FillVisibleAreaWithBlankTile
	ret

Data_8d5fe:
	db $24, $16, $ff, $ff

Data_8d602:
	db $23, $15, $24, $15, $ff, $ff

Data_8d608:
	db $25, $15, $ff, $ff

Data_8d60c:
	db $23, $15, $24, $15, $ff, $ff

Data_8d612:
	db $1c, $15, $ff, $ff

Data_8d616:
	db $1d, $15, $ff, $ff

Func_8d61a:
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_8d5fe
	ld a, $23
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld hl, $003c
	scall ScriptSleep
	ld a, $01
	scall PlayMusic
	ld c, $14
	ld e, $23
	ld a, $01
	scall Func_80080
	showperson $01
	move_person $01, Data_8d602, 1
	scall WaitNPCStep
	ld e, $02
	ld a, $01
	scall SpriteFace
	writenpctext TreeBitstreamText_3d465
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	move_person $01, Data_8d608, 1
	scall WaitNPCStep
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld c, $14
	ld e, $23
	xor a
	scall Func_80080
	showperson 0
	move_person 0, Data_8d60c, 1
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	writenpctext TreeBitstreamText_3d4a3
	ld e, $03
	ld a, $01
	scall SpriteFace
	writenpctext TreeBitstreamText_3d51a
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	xor a
	scall PlayMusic
label_8d6e1:
	writenpctext_yesorno TreeBitstreamText_3d552
	or a
	jp nz, label_8d75c
	ld a, $03
	scall PlayMusic
	writenpctext TreeBitstreamText_3d59c
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	writenpctext TreeBitstreamText_3d5d0
	writenpctext TreeBitstreamText_3d60c
	move_person 0, Data_8d612, 0
	move_person $01, Data_8d616, 1
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	jp label_8d76a
label_8d75c:
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3d63e
	jp label_8d6e1
label_8d76a:
	ret
Func_8d76b:
	ld l, $03
	push hl
	showperson 0
	ld c, $10
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
label_8d77e:
	cp l
	jp nc, label_8d790
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp label_8d77e
label_8d790:
	push hl
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3d404
	xor a
	pop hl
label_8d79e:
	cp l
	jp nc, label_8d7b1
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp label_8d79e
label_8d7b1:
	hideperson 0
	ret
Func_8d7b8:
	ld l, $06
	push hl
	showperson $01
	ld c, $0d
	ld e, $23
	ld a, $01
	scall Func_80080
	xor a
	pop hl
label_8d7cd:
	cp l
	jp nc, label_8d7df
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp label_8d7cd
label_8d7df:
	push hl
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_3d442
	xor a
	pop hl
label_8d7f8:
	cp l
	jp nc, label_8d80b
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	pop hl
	jp label_8d7f8
label_8d80b:
	hideperson $01
	ret
Func_8d813:
	ld l, $09
	push hl
	showperson 0
	ld c, $0a
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
label_8d826:
	cp l
	jp nc, label_8d843
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d83d
	xor a
	scall Func_80653
label_8d83d:
	pop af
	inc a
	pop hl
	jp label_8d826
label_8d843:
	push hl
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3d37a
	xor a
	pop hl
label_8d851:
	cp l
	jp nc, label_8d870
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $03
	jp nz, label_8d86a
	ld a, $01
	scall Func_80653
label_8d86a:
	pop af
	inc a
	pop hl
	jp label_8d851
label_8d870:
	hideperson 0
	ret
Func_8d877:
	ld l, $0c
	push hl
	showperson $01
	ld c, $07
	ld e, $23
	ld a, $01
	scall Func_80080
	xor a
	pop hl
label_8d88c:
	cp l
	jp nc, label_8d8a9
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d8a3
	xor a
	scall Func_80653
label_8d8a3:
	pop af
	inc a
	pop hl
	jp label_8d88c
label_8d8a9:
	push hl
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_3d2d1
	xor a
	pop hl
label_8d8c2:
	cp l
	jp nc, label_8d8e1
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d8db
	ld a, $01
	scall Func_80653
label_8d8db:
	pop af
	inc a
	pop hl
	jp label_8d8c2
label_8d8e1:
	hideperson $01
	ret
Func_8d8e9:
	ld l, $0f
	push hl
	showperson 0
	ld c, $04
	ld e, $23
	xor a
	scall Func_80080
	xor a
	pop hl
label_8d8fc:
	cp l
	jp nc, label_8d919
	push hl
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d913
	xor a
	scall Func_80653
label_8d913:
	pop af
	inc a
	pop hl
	jp label_8d8fc
label_8d919:
	push hl
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3d278
	xor a
	pop hl
label_8d927:
	cp l
	jp nc, label_8d946
	push hl
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	push af
	cp $07
	jp nz, label_8d940
	ld a, $01
	scall Func_80653
label_8d940:
	pop af
	inc a
	pop hl
	jp label_8d927
label_8d946:
	hideperson 0
	ret

Data_8d94d:
	db $1e, $15, $ff, $ff

Data_8d951:
	db $1f, $15, $ff, $ff

Func_8d955:
	ld a, e
	or a
	jp nz, label_8d9bb
	writetext_yesorno TreeBitstreamText_3d552
	or a
	jp nz, label_8d9b5
	writenpctext TreeBitstreamText_3d59c
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld hl, $002d
	scall ScriptSleep
	ld e, $01
	xor a
	scall SpriteFace
	writenpctext TreeBitstreamText_3d5d0
	ld e, $02
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $01
	scall SpriteFace
	writenpctext TreeBitstreamText_3d60c
	move_person 0, Data_8d94d, 0
	move_person $01, Data_8d951, 1
	scall WaitNPCStep
	jp label_8d9bb
label_8d9b5:
	writenpctext TreeBitstreamText_3d63e
label_8d9bb:
	ret

Data_8d9bc:
	db $2a, $03, $04, $03, $22, $12

Data_8d9c2:
	db $2a, $00, $04, $08, $22, $0d

Data_8d9c8:
	db $2a, $00, $04, $08, $22, $0a

Data_8d9ce:
	db $2a, $00, $04, $08, $22, $07

Data_8d9d4:
	db $2a, $00, $04, $08, $22, $04

Data_8d9da:
	db $2a, $00, $04, $08, $22, $01

Data_8d9e0:
	db $2a, $02, $04, $06, $22, $00

Data_8d9e6:
	db $2a, $08, $04, $08, $22, $0a

Data_8d9ec:
	db $2a, $04, $04, $04, $22, $0f

Data_8d9f2:
	db $2a, $04, $04, $04, $22, $0c

Data_8d9f8:
	db $2a, $04, $04, $04, $22, $09

Data_8d9fe:
	db $2a, $04, $04, $04, $22, $06

Data_8da04:
	db $2a, $04, $04, $04, $22, $03

Data_8da0a:
	db $2a, $04, $04, $04, $22, $00

Data_8da10:
	db $0c, $12, $01, $01, $07, $11

Data_8da16:
	db $2a, $0a, $04, $02, $22, $05

Data_8da1c:
	db $2a, $0a, $04, $02, $22, $08

Data_8da22:
	db $2a, $0a, $04, $01, $22, $00

Func_8da28:
	ld a, [wc78d]
	cp $01
	jp z, label_8db0e
	cp $02
	jp z, label_8daf9
	cp $03
	jp z, label_8dade
	cp $04
	jp z, label_8dac3
	cp $05
	jp z, label_8da9c
	cp $06
	jp z, label_8da75
	cp $07
	jp nz, label_8db1a
	ld hl, Data_8d9ec
	scall Func_80d9b
	ld hl, Data_8d9f2
	scall Func_80d9b
	ld hl, Data_8d9f8
	scall Func_80d9b
	ld hl, Data_8d9fe
	scall Func_80d9b
	ld hl, Data_8da04
	scall Func_80d9b
	ld hl, Data_8da0a
	scall Func_80d9b
	jp label_8db1a
label_8da75:
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	ld hl, Data_8d9da
	scall Func_80d9b
	ld hl, Data_8d9e0
	scall Func_80d9b
	jp label_8db1a
label_8da9c:
	ld hl, Data_8da22
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	ld hl, Data_8d9da
	scall Func_80d9b
	jp label_8db1a
label_8dac3:
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	ld hl, Data_8d9d4
	scall Func_80d9b
	jp label_8db1a
label_8dade:
	ld hl, Data_8da16
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	ld hl, Data_8d9ce
	scall Func_80d9b
	jp label_8db1a
label_8daf9:
	ld hl, Data_8da1c
	scall Func_80d9b
	ld hl, Data_8d9c2
	scall Func_80d9b
	ld hl, Data_8d9c8
	scall Func_80d9b
	jp label_8db1a
label_8db0e:
	ld hl, Data_8d9e6
	scall Func_80d9b
	ld hl, Data_8d9bc
	scall Func_80d9b
label_8db1a:
	ld a, [wc790]
	or a
	jp z, label_8db2f
	ld a, [wc790]
	cp $07
	jp nc, label_8db2f
	ld hl, Data_8da10
	scall Func_80d9b
label_8db2f:
	scall Func_80f02
	ret

Func_8db33:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, label_8dd7d
	face_player -$03
	ld a, [wc796]
	or a
	jp nz, label_8dbd3
	ld a, $17
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_8dbd0
	writenpctext TreeBitstreamText_44000
	ld a, $17
	scall Func_80e7d
	cp $01
	jp nz, label_8dbc7
	writenpctext TreeBitstreamText_440c4
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, label_8dbb3
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_440f4
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $26
	scall GiveRobot
	ld a, $01
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	call Func_8dd96
	jp label_8dbc4
label_8dbb3:
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_44185
	call Func_8dd96
	jp label_8dd7d
label_8dbc4:
	jp label_8dbd0
label_8dbc7:
	writetext TreeBitstreamText_45a40
	jp label_8dd7d
label_8dbd0:
	jp label_8dd1f
label_8dbd3:
	ld a, [wc796]
	cp $07
	jp nz, label_8dc63
	ld a, $50
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_8dc60
	writenpctext TreeBitstreamText_44000
	ld a, $50
	scall Func_80e7d
	cp $01
	jp nz, label_8dc57
	writenpctext TreeBitstreamText_44213
	writetext_yesorno TreeBitstreamText_458e0
	or a
	jp nz, label_8dc43
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_44239
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $51
	scall GiveRobot
	ld a, $08
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	call Func_8dd96
	jp label_8dc54
label_8dc43:
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_44185
	call Func_8dd96
	jp label_8dd7d
label_8dc54:
	jp label_8dc60
label_8dc57:
	writetext TreeBitstreamText_45a40
	jp label_8dd7d
label_8dc60:
	jp label_8dd1f
label_8dc63:
	ld a, $17
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, label_8dc7d
	ld a, $50
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_8dd1f
label_8dc7d:
	ld a, [wc796]
	cp $08
	jp z, label_8dd07
	cp $06
	jp z, label_8dd07
	cp $0a
	jp z, label_8dcf8
	cp $05
	jp z, label_8dcf8
	cp $0c
	jp z, label_8dce9
	cp $04
	jp z, label_8dce9
	cp $0d
	jp z, label_8dcda
	cp $03
	jp z, label_8dcda
	cp $0b
	jp z, label_8dccb
	cp $02
	jp z, label_8dccb
	cp $09
	jp z, label_8dcbc
	cp $01
	jp nz, label_8dd16
label_8dcbc:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45acc
	jp label_8dd1c
label_8dccb:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45add
	jp label_8dd1c
label_8dcda:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aee
	jp label_8dd1c
label_8dce9:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45aff
	jp label_8dd1c
label_8dcf8:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b10
	jp label_8dd1c
label_8dd07:
	writetext TreeBitstreamText_45a76
	writetext TreeBitstreamText_45b20
	jp label_8dd1c
label_8dd16:
	writenpctext TreeBitstreamText_44000
label_8dd1c:
	jp label_8dd7d
label_8dd1f:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, label_8dd7d
	ld a, [wc796]
	cp $08
	jp nc, label_8dd49
	ld a, [wc796]
	cp $01
	jp c, label_8dd49
	writenpctext TreeBitstreamText_44000
	writenpctext TreeBitstreamText_441b3
	call Func_8dd96
	jp label_8dd7d
label_8dd49:
	ld a, [wc796]
	cp $0f
	jp nz, label_8dd5a
	writenpctext TreeBitstreamText_44000
	jp label_8dd7d
label_8dd5a:
	ld a, [wc796]
	cp $08
	jp c, label_8dd6e
	writenpctext TreeBitstreamText_4428f
	call Func_8dd96
	jp label_8dd7d
label_8dd6e:
	writenpctext TreeBitstreamText_44000
	writenpctext TreeBitstreamText_44051
	call Func_8dd96
label_8dd7d:
	pop bc
	pop bc
	ret

Func_8dd80:
	ld a, e
	cp $02
	jp nz, label_8dd8b
	ld a, $07
	ld [wc78a], a
label_8dd8b:
	ret

Data_8dd8c:
	db $14, $08, $ff, $ff

Data_8dd90:
	db $0d, $07, $14, $08, $ff, $ff

Func_8dd96:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, label_8ddc0
	ld hl, $001e
	scall ScriptSleep
	ld a, $2e
	scall PlaySFX
	move_person $08, Data_8dd90, 1
	scall WaitNPCStep
	hideperson $08
	jp label_8dddf
label_8ddc0:
	ld hl, $001e
	scall ScriptSleep
	ld a, $2e
	scall PlaySFX
	move_person $08, Data_8dd8c, 1
	scall WaitNPCStep
	hideperson $08
label_8dddf:
	ret

Data_8dde0:
	db $0c, $04, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e
	db $12, $11, $01, $01, $08, $00, $13, $0d, $12, $0d, $2e

Data_8ddf6:
	dtext_tree_pointer TreeBitstreamText_465ec
	dw -1

Data_8ddfa:
	dtext_tree_pointer TreeBitstreamText_46e1d
	dtext_tree_pointer TreeBitstreamText_46e3b
	dtext_tree_pointer TreeBitstreamText_46e4b
	dw -1

Data_8de02:
	person_event $02, $0c, $0e, $07, $01, $01, $03, $04, $00, Func_8dfe6, NULL
	person_event $0c, $0c, $0a, $09, $01, $01, $01, $04, $00, Func_8e080, NULL
	person_event $00, $0c, $09, $0c, $01, $01, $01, $04, $00, Func_8e11a, NULL
	person_event $0c, $0c, $0d, $0d, $01, $01, $03, $04, $00, Func_8e1b2, NULL
	person_event $0b, $0c, $07, $11, $01, $01, $01, $04, $00, Func_8e24c, NULL
	person_event $04, $0c, $12, $11, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0e, $10, $03, $03, $00, $04, $01, Func_8e2be, NULL

Data_8de64:
	person_event $0f, $04, $06, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $05, $01, $01, $02, $04, $00, Func_8e36e, NULL
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8ddf6
	person_event $ff, $00, $0d, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8ddf6
	person_event $ff, $00, $0c, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_23, Data_8ddfa

Func_8deaa:: ; 8deaa
	ld a, $06
	ld [wc7e2], a
	call Func_8df6e
	ld hl, Func_8df6e
	scall Func_80f11
	loadwarps $02, Data_8dde0
	loadpeople $05, Data_8de64
	hideperson 0
	checkevent $0037
	or a
	jp nz, label_8df41
	loadpeople $07, Data_8de02
	hideperson $0a
	checkevent $0028
	cp $01
	jp nz, label_8def9
	hideperson $05
label_8def9:
	checkevent $0029
	cp $01
	jp nz, label_8df0b
	hideperson $06
label_8df0b:
	checkevent $002a
	cp $01
	jp nz, label_8df1d
	hideperson $07
label_8df1d:
	checkevent $002b
	cp $01
	jp nz, label_8df2f
	hideperson $08
label_8df2f:
	checkevent $002c
	cp $01
	jp nz, label_8df41
	hideperson $09
label_8df41:
	checkevent $0037
	cp $01
	jp nz, label_8df54
	ld a, $03
	scall PlayMusic
	jp label_8df59
label_8df54:
	ld a, $04
	scall PlayMusic
label_8df59:
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_8df62:
	db $10, $0d, $01, $01, $12, $12

Data_8df68:
	db $11, $12, $01, $01, $12, $12

Func_8df6e:
	checkevent $0028
	or a
	jp z, label_8dfa0
	checkevent $0029
	or a
	jp z, label_8dfa0
	checkevent $002a
	or a
	jp z, label_8dfa0
	checkevent $002b
	or a
	jp z, label_8dfa0
	checkevent $002c
	or a
	jp nz, label_8dfa9
label_8dfa0:
	ld hl, Data_8df62
	scall Func_80d9b
	jp label_8dfaf
label_8dfa9:
	ld hl, Data_8df68
	scall Func_80d9b
label_8dfaf:
	scall Func_80f02
	ret

Data_8dfb3:
	db $0c, $04, $ff, $ff

Data_8dfb7:
	db $0e, $06, $0c, $04, $ff, $ff

Data_8dfbd:
	db $00, $00, $00, $01, $00, $c5, $b2, $00, $00, $1f, $01, $1f, $03, $11, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8dfe6:
	push af
	ld a, e
	or a
	jp nz, label_8e046
	checkevent $0028
	or a
	jp nz, label_8e046
	face_player -$01
	writetext TreeBitstreamText_429e1
	startbattle Data_8e048, Data_8dfbd
	or a
	jp nz, label_8e012
	jp label_8e046
label_8e012:
	ld a, [wPlayerFacing]
	cp $01
	jp nz, label_8e028
	move_person -$01, Data_8dfb7, 1
	jp label_8e033
label_8e028:
	move_person -$01, Data_8dfb3, 1
label_8e033:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $0028
label_8e046:
	pop bc
	ret

Data_8e048:
	dstr "ソﾞク1"

Data_8e04d:
	db $0a, $08, $0c, $04, $ff, $ff

Data_8e053:
	db $0c, $04, $ff, $ff

Data_8e057:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e080:
	push af
	ld a, e
	or a
	jp nz, label_8e0e0
	checkevent $0029
	or a
	jp nz, label_8e0e0
	face_player -$01
	writetext TreeBitstreamText_429f2
	startbattle Data_8e0e2, Data_8e057
	or a
	jp nz, label_8e0ac
	jp label_8e0e0
label_8e0ac:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, label_8e0c2
	move_person -$01, Data_8e04d, 1
	jp label_8e0cd
label_8e0c2:
	move_person -$01, Data_8e053, 1
label_8e0cd:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $0029
label_8e0e0:
	pop bc
	ret

Data_8e0e2:
	dstr "ソﾞク2"

Data_8e0e7:
	db $09, $0b, $0b, $06, $ff, $ff

Data_8e0ed:
	db $0b, $06, $ff, $ff

Data_8e0f1:
	db $00, $00, $00, $01, $00, $c5, $ae, $00, $00, $1f, $01, $1f, $03, $12, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e11a:
	push af
	ld a, e
	or a
	jp nz, label_8e17a
	checkevent $002a
	or a
	jp nz, label_8e17a
	face_player -$01
	writetext TreeBitstreamText_42a0d
	startbattle Data_8e17c, Data_8e0f1
	or a
	jp nz, label_8e146
	jp label_8e17a
label_8e146:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, label_8e15c
	move_person -$01, Data_8e0e7, 1
	jp label_8e167
label_8e15c:
	move_person -$01, Data_8e0ed, 1
label_8e167:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002a
label_8e17a:
	pop bc
	ret

Data_8e17c:
	dstr "ソﾞク3"

Data_8e181:
	db $0e, $07, $ff, $ff

Data_8e185:
	db $0d, $07, $ff, $ff

Data_8e189:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17, $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e1b2:
	push af
	ld a, e
	or a
	jp nz, label_8e212
	checkevent $002b
	or a
	jp nz, label_8e212
	face_player -$01
	writetext TreeBitstreamText_42a00
	startbattle Data_8e214, Data_8e189
	or a
	jp nz, label_8e1de
	jp label_8e212
label_8e1de:
	ld a, [wPlayerFacing]
	cp $02
	jp nz, label_8e1f4
	move_person -$01, Data_8e181, 1
	jp label_8e1ff
label_8e1f4:
	move_person -$01, Data_8e185, 1
label_8e1ff:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002b
label_8e212:
	pop bc
	ret

Data_8e214:
	dstr "ソﾞク4"

Data_8e219:
	db $09, $0c, $ff, $ff

Data_8e21d:
	db $07, $12, $09, $0c, $ff, $ff

Data_8e223:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $20, $01, $20, $03, $13, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e24c:
	push af
	ld a, e
	or a
	jp nz, label_8e2ab
	checkevent $002c
	or a
	jp nz, label_8e2ab
	face_player -$01
	writetext TreeBitstreamText_42a24
	startbattle Data_8e2ad, Data_8e223
	or a
	jp nz, label_8e278
	jp label_8e2ab
label_8e278:
	ld a, [wPlayerFacing]
	or a
	jp nz, label_8e28d
	move_person -$01, Data_8e219, 1
	jp label_8e298
label_8e28d:
	move_person -$01, Data_8e21d, 1
label_8e298:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002c
label_8e2ab:
	pop bc
	ret

Data_8e2ad:
	dstr "ソﾞク5"

Data_8e2b2:
	db $12, $12, $10, $12, $ff, $ff

Data_8e2b8:
	db $12, $12, $12, $11, $ff, $ff

Func_8e2be:
	ld a, e
	cp $02
	jp nz, label_8e36d
	checkevent $0028
	cp $01
	jp nz, label_8e36d
	checkevent $0029
	cp $01
	jp nz, label_8e36d
	checkevent $002a
	cp $01
	jp nz, label_8e36d
	checkevent $002b
	cp $01
	jp nz, label_8e36d
	checkevent $002c
	cp $01
	jp nz, label_8e36d
	checkevent $0037
	or a
	jp nz, label_8e36d
	xor a
	scall PlayMusic
	showperson $0a
	ld hl, $003c
	scall ScriptSleep
	ld a, $30
	scall PlaySFX
	call Func_8df6e
	ld hl, Func_8df6e
	scall Func_80f11
	ld hl, $003c
	scall ScriptSleep
	move_person $0a, Data_8e2b2, 1
	scall WaitNPCStep
	ld a, [wPlayerFacing]
	cp $02
	jp nz, label_8e346
	ld e, $00
	ld a, $0a
	scall SpriteFace
label_8e346:
	writenpctext TreeBitstreamText_3b605
	move_person $0a, Data_8e2b8, 1
	scall WaitNPCStep
	ld a, $2e
	scall PlaySFX
	hideperson $0a
	setevent $0037
label_8e36d:
	ret

Func_8e36e:
	ld a, e
	or a
	jp nz, label_8e479
	checkevent $00d9
	or a
	jp nz, label_8e473
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $05
	ld a, $06
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	showperson 0
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	face_player 0
	ld hl, $001e
	scall ScriptSleep
	ld c, $05
	ld e, $04
	ld a, $03
	scall Func_80e8d
	setevent $00d9
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	checkevent $0037
	cp $01
	jp nz, label_8e45c
	ld a, $01
	scall FadeInAudio
	ld a, $03
	scall PlayMusic
	jp label_8e466
label_8e45c:
	ld a, $01
	scall FadeInAudio
	ld a, $04
	scall PlayMusic
label_8e466:
	face_player 0
	hideperson 0
	jp label_8e479
label_8e473:
	writetext TreeBitstreamText_3f79e
label_8e479:
	ret

Data_8e47a:
	db $05, $08, $01, $02, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $23, $07, $01, $02, $ff
	db $ff, $ff, $ff, $ff, $ff, $2e, $08, $06, $01, $01, $20, $01, $01, $08, $01, $07
	db $34, $0c, $04, $01, $01, $20, $04, $01, $08, $01, $07, $34, $10, $05, $01, $01
	db $20, $07, $05, $09, $05, $08, $34, $15, $06, $01, $01, $20, $01, $01, $08, $01
	db $07, $34, $19, $04, $01, $01, $20, $04, $01, $08, $01, $07, $34, $1c, $05, $01
	db $01, $20, $05, $06, $0b, $06, $0a, $34, $0e, $12, $01, $01, $20, $02, $01, $0a
	db $01, $09, $34, $15, $10, $01, $01, $20, $08, $05, $09, $05, $08, $34, $1c, $0e
	db $01, $01, $20, $02, $01, $0a, $01, $09, $34, $10, $09, $01, $01, $08, $01, $04
	db $00, $04, $01, $2e

Data_8e4fe:
	dtext_tree_pointer TreeBitstreamText_3b9f6
	dw -1

Data_8e502:
	dtext_tree_pointer TreeBitstreamText_41675
	dtext_tree_pointer TreeBitstreamText_416c4
	dw -1

Data_8e508:
	dtext_tree_pointer TreeBitstreamText_416f0
	dw -1

Data_8e50c:
	dtext_tree_pointer TreeBitstreamText_41721
	dw -1

Data_8e510:
	dtext_tree_pointer TreeBitstreamText_4174d
	dw -1

Data_8e514:
	dtext_tree_pointer TreeBitstreamText_465d8
	dw -1

Data_8e518:
	person_event $04, $04, $0a, $04, $01, $01, $02, $04, $00, Func_808fc_23, Data_8e4fe

Data_8e526:
	person_event $04, $04, $0a, $04, $01, $01, $02, $04, $00, Func_8e8b4, NULL

Data_8e534:
	person_event $00, $04, $1f, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_23, Data_8e502
	person_event $01, $04, $0d, $0a, $01, $01, $01, $04, $00, PrintTextFacePlayer_23, Data_8e508
	person_event $07, $04, $0b, $10, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8e50c
	person_event $0c, $04, $16, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e510
	person_event $ff, $00, $22, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $22, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $06, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $06, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $10, $09, $01, $01, $00, $04, $00, Func_8e826, NULL
	person_event $ff, $00, $09, $05, $01, $01, $00, $04, $00, Func_8e864, NULL
	person_event $ff, $00, $16, $05, $01, $01, $00, $04, $00, Func_8e88c, NULL

Data_8e5ce:
	person_event $03, $0c, $1c, $05, $01, $01, $02, $04, $00, NULL, NULL

Func_8e5dc:: ; 8e5dc
	ld a, $03
	ld [wc789], a
	ld a, $05
	ld [wc7e2], a
	loadwarps $0c, Data_8e47a
	checkevent $0008
	or a
	jp nz, label_8e612
	loadpeople $01, Data_8e5ce
	ld a, $01
	scall LoadPlayerSprite
	xor a
	scall PlayMusic
	scall Func_8001c
	call Func_8e66b
	jp label_8e65a
label_8e612:
	checkevent $0088
	cp $01
	jp nz, label_8e63d
	ld a, $03
	scall PlayMusic
	loadpeople $01, Data_8e526
	loadpeople $0b, Data_8e534
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	jp label_8e65a
label_8e63d:
	ld a, $03
	scall PlayMusic
	loadpeople $01, Data_8e518
	loadpeople $0b, Data_8e534
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
label_8e65a:
	ret

Data_8e65b:
	db $1c, $08, $20, $08, $ff, $ff

Data_8e661:
	db $1c, $08, $1c, $05, $ff, $ff

Data_8e667:
	db $1b, $08, $ff, $ff

Func_8e66b:
	move_person 0, Data_8e65b, 1
	scall WaitNPCStep
	writetext TreeBitstreamText_3b2db
	ld a, $2a
	scall PlaySFX
	writetext TreeBitstreamText_3b30a
	writetext TreeBitstreamText_3b31f
	move_person 0, Data_8e661, 0
	scall WaitNPCStep
	hideperson 0
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld de, Data_8e667
	ld a, $23
	scall MovePlayer
	ld c, $01
	ld e, $0f
	ld a, $0d
	scall LoadEmote
	ld e, $08
	ld a, $1b
	scall MoveEmote
	xor a
	scall Func_80653
	ld hl, $0096
	scall ScriptSleep
	ld a, $34
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	xor a
	scall PlayMusic
	ld a, $0f
	scall PlayMusic
	writenpctext_yesorno TreeBitstreamText_3b324
	or a
	jp nz, label_8e727
	setevent $00e9
	ld a, $2b
	scall PlaySFX
	writetext TreeBitstreamText_3b35d
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_3b36e
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $07
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	ld a, $01
	scall PlayerFace
	scall HideEmote
	jp label_8e7b2
label_8e727:
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3b3c0
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $0f
	ld a, $0e
	scall LoadEmote
	ld hl, $005a
	scall ScriptSleep
	ld a, $2b
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $34
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $35
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $69
	scall PlaySFX
	xor a
	scall Func_80653
	scall WaitEmote
	writenpctext TreeBitstreamText_3b412
	setevent $00ea
	ld a, $2b
	scall PlaySFX
	writetext TreeBitstreamText_3b401
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $0f
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld a, $01
	scall PlayerFace
	scall HideEmote
label_8e7b2:
	xor a
	scall PlayMusic
	ld a, $0f
	scall PlayMusic
	ld c, $01
	ld e, $10
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	writenpctext TreeBitstreamText_3b447
	ld c, $01
	ld e, $20
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld e, $10
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	writenpctext TreeBitstreamText_3b481
	ld c, $01
	ld e, $20
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld a, $06
	scall Func_80c94
	setevent $0008
	ld l, $08
	push hl
	ld c, $1b
	ld e, $00
	ld a, $06
	scall Func_80dff
	pop bc
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ret

Func_8e826:
	ld a, e
	or a
	jp nz, label_8e863
	writetext_yesorno TreeBitstreamText_46e1d
	or a
	jp nz, label_8e85d
	xor a
	scall Func_80653
	ld a, $2e
	scall PlaySFX
	ld l, $01
	push hl
	ld c, $04
	ld e, $01
	ld a, $08
	scall Func_80dff
	pop bc
	ld a, $02
	ld [wPlayerFacing], a
	ld a, $10
	ld [wBackupMapX], a
	ld a, $09
	ld [wBackupMapY], a
	jp label_8e863
label_8e85d:
	writetext TreeBitstreamText_46e5d
label_8e863:
	ret

Func_8e864:
	ld a, e
	cp $01
	jp nz, label_8e88b
	ld a, $2e
	scall PlaySFX
	ld l, $07
	push hl
	ld c, $09
	ld e, $01
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $03
	ld [wPlayerFacing], a
	ld a, $08
	ld [wBackupMapX], a
	ld a, $06
	ld [wBackupMapY], a
label_8e88b:
	ret

Func_8e88c:
	ld a, e
	cp $01
	jp nz, label_8e8b3
	ld a, $2e
	scall PlaySFX
	ld l, $07
	push hl
	ld c, $09
	ld e, $01
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $03
	ld [wPlayerFacing], a
	ld a, $15
	ld [wBackupMapX], a
	ld a, $06
	ld [wBackupMapY], a
label_8e8b3:
	ret

Func_8e8b4:
	ld a, e
	or a
	jp nz, label_8e8cc
	face_player $01
	writenpctext TreeBitstreamText_3ba23
	setevent $003a
label_8e8cc:
	ret
