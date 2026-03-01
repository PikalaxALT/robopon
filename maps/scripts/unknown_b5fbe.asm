
Data_b5f35:
	warpdef $0c, $05, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5f40:
	person_event $1a, $04, $0c, $0a, $01, $01, $02, $04, $00, NULL, NULL
	person_event $19, $0c, $0c, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $0e, $01, $01, $00, $04, $01, Func_b6117, NULL

Data_b5f6a:
	person_event $19, $0c, $0c, $0b, $01, $01, $02, $04, $00, Func_b6291, NULL
	person_event $1e, $0c, $0b, $0a, $01, $01, $02, $04, $00, Func_b634c, NULL
	person_event $1f, $0c, $0d, $0a, $01, $01, $02, $04, $00, Func_b6422, NULL
	person_event $20, $0c, $0a, $09, $01, $01, $02, $04, $00, Func_b6501, NULL
	person_event $21, $0c, $0c, $09, $01, $01, $02, $04, $00, Func_b65e9, NULL
	person_event $0d, $0c, $0e, $09, $01, $01, $02, $04, $00, Func_b66d1, NULL

Func_b5fbe:: ; b5fbe
	loadwarps $01, Data_b5f35
	checkevent $005a
	or a
	jp nz, .asm_b5fe2
	loadpeople $03, Data_b5f40
	hideperson $01
	jp .asm_b60c9
.asm_b5fe2:
	checkevent $005a
	cp $01
	jp nz, .asm_b60c9
	checkevent $00e1
	or a
	jp z, .asm_b6029
	checkevent $00e2
	or a
	jp z, .asm_b6029
	checkevent $00e3
	or a
	jp z, .asm_b6029
	checkevent $00e4
	or a
	jp z, .asm_b6029
	checkevent $00e5
	or a
	jp z, .asm_b6029
	checkevent $00e6
	or a
	jp nz, .asm_b60c9
.asm_b6029:
	loadpeople $06, Data_b5f6a
	checkevent $00e1
	cp $01
	jp nz, .asm_b604b
	hideperson 0
	ld c, $0b
	ld e, $0c
	ld a, $01
	scall Func_80080
.asm_b604b:
	checkevent $00e2
	cp $01
	jp nz, .asm_b6066
	hideperson $01
	ld c, $0b
	ld e, $0c
	ld a, $02
	scall Func_80080
.asm_b6066:
	checkevent $00e3
	cp $01
	jp nz, .asm_b6081
	hideperson $02
	ld c, $0b
	ld e, $0c
	ld a, $03
	scall Func_80080
.asm_b6081:
	checkevent $00e4
	cp $01
	jp nz, .asm_b609c
	hideperson $03
	ld c, $0b
	ld e, $0c
	ld a, $04
	scall Func_80080
.asm_b609c:
	checkevent $00e5
	cp $01
	jp nz, .asm_b60b7
	hideperson $04
	ld c, $0b
	ld e, $0c
	ld a, $05
	scall Func_80080
.asm_b60b7:
	checkevent $00e6
	cp $01
	jp nz, .asm_b60c9
	hideperson $05
.asm_b60c9:
	playmusic $13
	scall Func_8001c
	ret

Data_b60d2:
IF DEF(SUN)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $87
	db $06, $39, $04, $00, $00, $7b, $88, $06, $39, $04, $04, $00, $7b, $89, $06, $39
	db $04, $04, $04, $7c, $12, $07, $39, $1d, $1d, $1d, $09, $01, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $84
	db $06, $39, $03, $00, $00, $7b, $85, $06, $39, $03, $03, $00, $7b, $86, $06, $39
	db $03, $03, $03, $7c, $12, $07, $39, $1a, $1a, $1a, $09, $01, $0c
ENDC

Data_b60fb:
	db $0c, $0c, $ff, $ff

Data_b60ff:
	db $0c, $07, $08, $07, $ff, $ff

Data_b6105:
	db $08, $10, $08, $10, $ff, $ff

Data_b610b:
	db $0c, $0d, $ff, $ff

Data_b610f:
	db $0c, $10, $08, $07, $0c, $05, $ff, $ff

Func_b6117:
	ld a, e
	cp $02
	jp nz, .asm_b625f
	playmusic SONG_NONE
	scall AllocateSpaceForWarps
	move_player $01, Data_b60fb
	playmusic $01
	writenpctext TreeBitstreamText_3eae2
	startbattle Data_b6260, Data_b60d2
	or a
	jp nz, .asm_b6149
	jp .asm_b625f
.asm_b6149:
	writenpctext TreeBitstreamText_3eb76
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	loademote $01, $01, $0a
	ld e, $0a
	ld a, $0c
	scall MoveEmote
	ld a, $01
	scall FadeInAudio
	playsfx $43
	scall WaitEmote
	scall HideEmote
	hideperson 0
	script_sleep 60
	scall StartShakingScreen
	loademote $01, $01, $05
	scall WaitEmote
	playsfx $28
	scall HideEmote
	script_sleep 60
	xor a
.asm_b61a2:
	cp $04
	jp nc, .asm_b61b3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61a2
.asm_b61b3:
	showperson $01
	playmusic $18
	script_sleep 120
	move_person $01, Data_b60ff, 1
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	move_person $01, Data_b6105, 1
	scall WaitNPCStep
	sprite_face $01, $01
	xor a
.asm_b61ec:
	cp $02
	jp nc, .asm_b61fe
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61ec
.asm_b61fe:
	ld a, $02
	scall PlayerFace
	xor a
.asm_b6204:
	cp $02
	jp nc, .asm_b6216
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b6204
.asm_b6216:
	move_person $01, Data_b610b, 1
	scall WaitNPCStep
	playmusic SONG_NONE
	playmusic $04
	scall StopShakingScreen
	writenpctext TreeBitstreamText_3ec56
	scall StartShakingScreen
	move_person $01, Data_b610f, 0
	move_player $01, Data_b610f
	scall WaitNPCStep
	scall StopShakingScreen
	ld l, $05
	push hl
	ld c, $07
	ld e, $00
	ld a, $1a
	scall Func_80dff
	pop bc
.asm_b625f:
	ret

Data_b6260:
	dstr "セﾞロ"

Data_b6264:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $46, $07, $28, $07, $07, $07, $6b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $05, $07, $28, $03, $03, $01, $09, $01, $0b
ENDC

Data_b628d:
	db $0c, $0b, $ff, $ff

Func_b6291:
	push af
	ld a, e
	or a
	jp nz, .asm_b6312
	face_player -$01
	writenpctext TreeBitstreamText_3ef04
	startbattle Data_b6314, Data_b6264
	or a
	jp nz, .asm_b62b3
	jp .asm_b6312
.asm_b62b3:
	writenpctext TreeBitstreamText_3ef47
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $18
	script_sleep 120
	xor a
.asm_b62d3:
	cp $04
	jp nc, .asm_b62e5
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b62d3
.asm_b62e5:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	playmusic SONG_NONE
	playmusic $13
	ld bc, Data_b628d
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	scall WaitNPCStep
	setevent $00e1
	ld a, $01
	ld [wc7c4], a
.asm_b6312:
	pop bc
	ret

Data_b6314:
	dstr "ヒﾞスコ"

Data_b6319:
	db $00, $00, $00, $04, $32, $c5, $bd, $00, $00, $90, $01, $0e, $06, $2d, $04, $17
	db $00, $53, $38, $06, $2d, $0e, $0b, $00, $1b, $18, $06, $2d, $09, $09, $0b, $1c
	db $07, $07, $2d, $01, $13, $00, $63, $01, $0b

Data_b6342:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b6348:
	db $0c, $0b, $ff, $ff

Func_b634c:
	push af
	ld a, e
	or a
	jp nz, .asm_b63e6
	face_player -$01
	checkevent $00e1
	or a
	jp nz, .asm_b6373
	writetext TreeBitstreamText_3f36a
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b63e6
.asm_b6373:
	writenpctext TreeBitstreamText_3ef70
	startbattle Data_b63e8, Data_b6319
	or a
	jp nz, .asm_b6389
	jp .asm_b63e6
.asm_b6389:
	writenpctext TreeBitstreamText_3efa5
	xor a
.asm_b6390:
	cp $04
	jp nc, .asm_b63a2
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6390
.asm_b63a2:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b63c1
	ld bc, Data_b6342
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b63cd
.asm_b63c1:
	ld bc, Data_b6348
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b63cd:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	setevent $00e2
	ld a, $01
	ld [wc7c4], a
.asm_b63e6:
	pop bc
	ret

Data_b63e8:
	dstr "アムロン"

Data_b63ed:
	db $00, $00, $00, $04, $32, $c5, $be, $00, $00, $4e, $01, $3a, $06, $32, $07, $0b
	db $00, $49, $0f, $06, $32, $28, $12, $00, $6a, $21, $06, $32, $0c, $0f, $00, $7a
	db $3b, $07, $32, $07, $09, $00, $4a, $01, $0b

Data_b6416:
	db $0b, $0b, $0c, $0b, $ff, $ff

Data_b641c:
	db $0b, $0a, $0c, $0b, $ff, $ff

Func_b6422:
	push af
	ld a, e
	or a
	jp nz, .asm_b64c6
	face_player -$01
	checkevent $00e1
	or a
	jp z, .asm_b6442
	checkevent $00e2
	or a
	jp nz, .asm_b6453
.asm_b6442:
	writetext TreeBitstreamText_3f36a
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b64c6
.asm_b6453:
	writenpctext TreeBitstreamText_3eff8
	startbattle Data_b64c8, Data_b63ed
	or a
	jp nz, .asm_b6469
	jp .asm_b64c6
.asm_b6469:
	writenpctext TreeBitstreamText_3f05a
	xor a
.asm_b6470:
	cp $04
	jp nc, .asm_b6482
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6470
.asm_b6482:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b64a1
	ld bc, Data_b6416
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b64ad
.asm_b64a1:
	ld bc, Data_b641c
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b64ad:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	setevent $00e3
	ld a, $01
	ld [wc7c4], a
.asm_b64c6:
	pop bc
	ret

Data_b64c8:
	dstr "ワイルトﾞ"

Data_b64ce:
	db $00, $00, $00, $04, $32, $c5, $bf, $00, $00, $75, $01, $31, $06, $37, $07, $0c
	db $00, $48, $73, $06, $37, $0c, $08, $00, $49, $74, $06, $37, $0d, $09, $00, $49
	db $32, $07, $37, $07, $07, $14, $4a, $01, $0b

Data_b64f7:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b64fd:
	db $0c, $0b, $ff, $ff

Func_b6501:
	push af
	ld a, e
	or a
	jp nz, .asm_b65af
	face_player -$01
	checkevent $00e1
	or a
	jp z, .asm_b652b
	checkevent $00e2
	or a
	jp z, .asm_b652b
	checkevent $00e3
	or a
	jp nz, .asm_b653c
.asm_b652b:
	writetext TreeBitstreamText_3f36a
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b65af
.asm_b653c:
	writenpctext TreeBitstreamText_3f0a6
	startbattle Data_b65b1, Data_b64ce
	or a
	jp nz, .asm_b6552
	jp .asm_b65af
.asm_b6552:
	writenpctext TreeBitstreamText_3f118
	xor a
.asm_b6559:
	cp $04
	jp nc, .asm_b656b
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6559
.asm_b656b:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b658a
	ld bc, Data_b64f7
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6596
.asm_b658a:
	ld bc, Data_b64fd
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6596:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	setevent $00e4
	ld a, $01
	ld [wc7c4], a
.asm_b65af:
	pop bc
	ret

Data_b65b1:
	dstr "カマット"

Data_b65b6:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0d, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0a, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ENDC

Data_b65df:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b65e5:
	db $0c, $0b, $ff, $ff

Func_b65e9:
	push af
	ld a, e
	or a
	jp nz, .asm_b66a1
	face_player -$01
	checkevent $00e1
	or a
	jp z, .asm_b661d
	checkevent $00e2
	or a
	jp z, .asm_b661d
	checkevent $00e3
	or a
	jp z, .asm_b661d
	checkevent $00e4
	or a
	jp nz, .asm_b662e
.asm_b661d:
	writetext TreeBitstreamText_3f36a
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b66a1
.asm_b662e:
	writenpctext TreeBitstreamText_3f192
	startbattle Data_b66a3, Data_b65b6
	or a
	jp nz, .asm_b6644
	jp .asm_b66a1
.asm_b6644:
	writenpctext TreeBitstreamText_3f207
	xor a
.asm_b664b:
	cp $04
	jp nc, .asm_b665d
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b664b
.asm_b665d:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b667c
	ld bc, Data_b65df
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6688
.asm_b667c:
	ld bc, Data_b65e5
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6688:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	setevent $00e5
	ld a, $01
	ld [wc7c4], a
.asm_b66a1:
	pop bc
	ret

Data_b66a3:
	dstr "ヘットﾞ"

Data_b66a8:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $03, $03, $03
	db $7b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $04, $04, $04
	db $7b, $01, $0b
ENDC

Func_b66d1:
	push af
	ld a, e
	or a
	jp nz, .asm_b6751
	face_player -$01
	checkevent $00e1
	or a
	jp z, .asm_b670f
	checkevent $00e2
	or a
	jp z, .asm_b670f
	checkevent $00e3
	or a
	jp z, .asm_b670f
	checkevent $00e4
	or a
	jp z, .asm_b670f
	checkevent $00e5
	or a
	jp nz, .asm_b6720
.asm_b670f:
	writetext TreeBitstreamText_3f36a
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b6751
.asm_b6720:
	writenpctext TreeBitstreamText_3f276
	startbattle Data_b6753, Data_b66a8
	or a
	jp nz, .asm_b6736
	jp .asm_b6751
.asm_b6736:
	writenpctext TreeBitstreamText_3f2ff
	setevent $00e6
	ld l, $1a
	push hl
	ld c, $0f
	ld e, $0a
	ld a, $19
	scall Func_80dff
	pop bc
.asm_b6751:
	pop bc
	ret

Data_b6753:
	dstr "テール"
