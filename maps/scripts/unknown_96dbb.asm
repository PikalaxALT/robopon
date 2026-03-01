
Data_96d59:
	warpdef $0b, $0f, $05, $01, MAP_30_00, $0c, $0b, $0b, $0b, SFX_2E
    warpdef $09, $04, $01, $01, MAP_12_01, $09, $2c, $09, $2b, SFX_2E
    warpdef $0b, $04, $01, $01, MAP_12_01, $09, $2c, $09, $2b, SFX_2E
    warpdef $0d, $04, $01, $01, MAP_12_01, $09, $2c, $09, $2b, SFX_2E
    warpdef $0f, $04, $01, $01, MAP_12_01, $09, $2c, $09, $2b, SFX_2E
    warpdef $11, $04, $01, $01, MAP_12_01, $09, $2c, $09, $2b, SFX_2E

Data_96d9b:
	dtext_tree_pointer TreeBitstreamText_46dd4
	dw -1

Data_96d9f:
	person_event $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b
	person_event $ff, $00, $10, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b

Func_96dbb:: ; 96dbb
	loadwarps $06, Data_96d59
	loadpeople $02, Data_96d9f
	playmusic SONG_0A
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_96dd9:
	warpdef $08, $2c, $03, $01, MAP_12_00, $0d, $04, $0d, $05, SFX_2E
    warpdef $09, $03, $01, $01, MAP_12_02, $1c, $0a, $1b, $0a, SFX_2E

Data_96def:
    dtext_tree_pointer TreeBitstreamText_47b32
	dw -1

Data_96df3:
    dtext_tree_pointer TreeBitstreamText_47b4c
	dw -1

Data_96df7:
    dtext_tree_pointer TreeBitstreamText_47b61
	dw -1

Data_96dfb:
	dtext_tree_pointer TreeBitstreamText_47b78
	dw -1

Data_96dff:
    dtext_tree_pointer TreeBitstreamText_47b8e
	dw -1

Data_96e03:
    dtext_tree_pointer TreeBitstreamText_47ba5
	dw -1

Data_96e07:
    dtext_tree_pointer TreeBitstreamText_47bb9
	dw -1

Data_96e0b:
	person_event $08, $04, $07, $12, $01, $01, $02, $04, $00, Func_96f2b, NULL
    person_event $08, $04, $03, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df3
    person_event $08, $04, $04, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df7
    person_event $08, $04, $05, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dfb
    person_event $08, $04, $06, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dff
    person_event $08, $04, $0d, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e03
    person_event $08, $04, $0e, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e07
    person_event $04, $0c, $09, $23, $01, $01, $02, $04, $00, NULL, NULL
    person_event $ff, $00, $08, $24, $03, $01, $02, $04, $01, Func_970d8, NULL
    person_event $04, $04, $07, $22, $01, $01, $01, $04, $00, Func_808fc_25_2, Data_96def

Func_96e97:: ; 96e97
	ld l, $00
	push hl
	ld c, $06
	ld e, $0d
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $06
	ld e, $0d
	ld a, $0b
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0b
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0b
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0e
	ld a, $01
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0e
	ld a, $10
	scall Func_80f24
	pop bc
	loadwarps $02, Data_96dd9
	loadpeople $0a, Data_96e0b
	checkevent $010e
	cp $01
	jp nz, .asm_96f11
	hideperson $07
	hideperson $08
	jp .asm_96f18
.asm_96f11:
	hideperson $09
.asm_96f18:
	playmusic SONG_TOWN2
	scall Func_8001c
	ret

Data_96f21:
	db $09, $12, $ff, $ff

Data_96f25:
    db $06, $13, $09, $12, $ff, $ff

Func_96f2b:
	ld a, e
	or a
	jp nz, .asm_970c9
	face_player 0
	writetext_yesorno TreeBitstreamText_47aea
	or a
	jp nz, .asm_970c3
	script_sleep 30
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_96f60
	move_player $01, Data_96f25
	scall WaitNPCStep
	xor a
	scall PlayerFace
	jp .asm_96f71
.asm_96f60:
	move_player $01, Data_96f21
	scall WaitNPCStep
	xor a
	scall PlayerFace
.asm_96f71:
	writetext TreeBitstreamText_47b05
	script_sleep 30
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_MAZE_MINIGAME
	xor a
.asm_96f91:
	cp $05
	jp nc, .asm_96fa2
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_96f91
.asm_96fa2:
	script_sleep 30
	hideperson $01
	hideperson $02
	hideperson $03
	hideperson $04
	hideperson $05
	hideperson $06
	hideperson $07
	hideperson $08
	hideperson $09
	loademote $01, $0f, $24
	ld e, $06
	ld a, $09
	scall MoveEmote
	scall WaitEmote
	loademote $01, $4f, $25
	ld e, $06
	ld a, $09
	scall MoveEmote
	script_sleep 360
	playsfx $68
	script_sleep 30
	playsfx $68
	script_sleep 30
	playsfx $68
	script_sleep 30
	playsfx $68
	scall WaitEmote
	scall HideEmote
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	script_sleep 30
	showperson $03
	showperson $04
	xor a
.asm_9705a:
	cp $05
	jp nc, .asm_9706c
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_9705a
.asm_9706c:
	script_sleep 30
	heal
	ld a, $01
	scall FadeInAudio
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	showperson $01
	showperson $02
	showperson $05
	showperson $06
	showperson $09
	playmusic SONG_TOWN2
	jp .asm_970c9
.asm_970c3:
	writetext TreeBitstreamText_47b1d
.asm_970c9:
	ret

Data_970ca:
    db $09, $22, $07, $22, $ff, $ff

Data_970d0:
    db $09, $24, $ff, $ff,

Data_970d4:
    db 09, $26, $ff, $ff

Func_970d8:
	ld a, e
	cp $02
	jp nz, .asm_9714f
	move_player $01, Data_970d0
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld a, $18
	scall Func_80e5d
	or a
	jp z, .asm_97136
	writenpctext TreeBitstreamText_47bd1
	script_sleep 30
	move_person $07, Data_970ca, 1
	scall WaitNPCStep
	script_sleep 30
	sprite_face $01, $07
	setevent $010e
	ld l, $24
	push hl
	ld c, $09
	ld e, $01
	ld a, $0c
	scall Func_80dff
	pop bc
	jp .asm_9714f
.asm_97136:
	writenpctext TreeBitstreamText_47c51
	script_sleep 30
	move_player $01, Data_970d4
	scall WaitNPCStep
.asm_9714f:
	ret
