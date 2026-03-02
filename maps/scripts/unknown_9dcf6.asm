
Data_9dc24:
	warpdef $02, $0b, $02, $01, MAP_18_00, $1b, $0e, $1b, $0f, SFX_2E

Data_9dc2f:
	db $88, $0f, $02, $12, $2a
	db $89, $11, $02, $12, $15
	db $8a, $00, $06, $12, $20

Data_9dc3e:
	dtext_tree_pointer TreeBitstreamText_42f84
	dw -1

Data_9dc42:
	dtext_tree_pointer TreeBitstreamText_4380b
	dtext_tree_pointer TreeBitstreamText_43945
	dw -1

Data_9dc48:
	dtext_tree_pointer TreeBitstreamText_4393b
	dw -1

Data_9dc4c:
	dtext_tree_pointer TreeBitstreamText_43b4c
	dw -1

Data_9dc50:
	dtext_tree_pointer TreeBitstreamText_43d46
	dw -1

Data_9dc54:
	dtext_tree_pointer TreeBitstreamText_43cbb
	dw -1

Data_9dc58:
	dtext_tree_pointer TreeBitstreamText_472d8
	dw -1

Data_9dc5c:
	person_event $0a, $04, $06, $04, $01, $01, $00, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $00, $04, $00, Func_9df90, NULL

Data_9dc78:
	person_event $0a, $04, $06, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $02, $04, $00, Func_9df90, NULL

Data_9dc94:
	person_event $0a, $04, $06, $04, $01, $01, $03, $04, $00, Func_808fc_27, Data_9dc42
	person_event $06, $04, $08, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc50
	person_event $08, $04, $05, $04, $01, $01, $01, $04, $00, Func_808fc_27, Data_9dc48

Data_9dcbe:
	person_event $ff, $00, $03, $04, $01, $02, $02, $04, $00, Func_808fc_27, Data_9dc4c

Data_9dccc:
	person_event $ff, $00, $0f, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $11, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $00, $05, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58

Func_9dcf6:: ; 9dcf6
	set_frame_script Func_9ddbb
	resetevent EVENT_010
	loadwarps $01, Data_9dc24
	playmusic SONG_MAZE_MINIGAME
	checkevent EVENT_0BA
	or a
	jp nz, .asm_9dd37
	loadpeople $02, Data_9dc5c
	loadpeople $03, Data_9dccc
	scall Func_8001c
	call Func_9ddf2
	jp .asm_9dda8
.asm_9dd37
	checkevent EVENT_0BE
	cp $01
	jp nz, .asm_9dd62
	checkevent EVENT_0EE
	or a
	jp nz, .asm_9dd62
	loadpeople $03, Data_9dc94
	loadpeople $03, Data_9dccc
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd62
	checkevent EVENT_0EE
	cp $01
	jp nz, .asm_9dd83
	loadpeople $01, Data_9dcbe
	ld e, $03
	ld hl, Data_9dc2f
	scall Func_80ce7
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd83
	loadpeople $02, Data_9dc78
	loadpeople $03, Data_9dccc
	checkevent EVENT_0BB
	cp $01
	jp nz, .asm_9dda5
	ld de, Data_9dc54
	xor a
	scall SetPersonTextPointer
.asm_9dda5
	scall Func_8001c
.asm_9dda8
	ret

Data_9dda9:
	db $16, $06, $01, $02, $06, $01

Data_9ddaf:
	db $16, $08, $01, $02, $07, $01

Data_9ddb5:
	db $16, $0a, $01, $02, $03, $04

Func_9ddbb:
	checkevent EVENT_0BA
	cp $01
	jp nz, .asm_9ddd5
	ld hl, Data_9dda9
	scall Func_80d9b
	ld hl, Data_9ddaf
	scall Func_80d9b
	scall Func_80f02
.asm_9ddd5
	checkevent EVENT_0EE
	cp $01
	jp nz, .asm_9dde9
	ld hl, Data_9ddb5
	scall Func_80d9b
	scall Func_80f02
.asm_9dde9
	ret

Data_9ddea:
	db $05, $07, $ff, $ff

Data_9ddee:
	db $07, $07, $ff, $ff

Func_9ddf2:
	script_sleep 30
	playsfx SFX_68
	writenpctext TreeBitstreamText_42e15
	playsfx SFX_68
	script_sleep 30
	move_player $00, Data_9ddea
	scall WaitNPCStep
	move_player $00, Data_9ddee
	scall WaitNPCStep
	xor a
	scall PlayerFace
	script_sleep 30
	xor a
.asm_9de33
	cp $03
	jp nc, .asm_9de44
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_9de33
.asm_9de44
	script_sleep 30
	loademote $01, $01, $0a
	ld e, $01
	ld a, $06
	scall MoveEmote
	playsfx SFX_62
	scall WaitEmote
	scall HideEmote
	loademote $01, $01, $0a
	ld e, $02
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	loademote $01, $01, $0a
	ld e, $01
	ld a, $06
	scall MoveEmote
	playsfx SFX_62
	scall WaitEmote
	scall HideEmote
	loademote $01, $01, $0a
	ld e, $02
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playmusic SONG_NONE
	playmusic SONG_1C
	script_sleep 180
	setevent EVENT_0BA
	call Func_9ddbb
	loademote $01, $03, $27
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld e, $80
	xor a
	scall SetPersonVisibilityState
	ld e, $80
	ld a, $01
	scall SetPersonVisibilityState
	playsfx SFX_51
	scall WaitEmote
	ld e, $81
	xor a
	scall SetPersonVisibilityState
	ld e, $81
	ld a, $01
	scall SetPersonVisibilityState
	script_sleep 60
	playsfx SFX_69
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_MAZE_MINIGAME
	writenpctext TreeBitstreamText_42e5e
	script_sleep 60
	loademote $01, $07, $28
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld e, $80
	xor a
	scall SetPersonVisibilityState
	ld e, $80
	ld a, $01
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $81
	xor a
	scall SetPersonVisibilityState
	ld e, $81
	ld a, $01
	scall SetPersonVisibilityState
	call NextOverworldFrame
	scall Func_801b8
	script_sleep 60
	xor a
.asm_9df58
	cp $03
	jp nc, .asm_9df6a
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_9df58
.asm_9df6a
	script_sleep 30
	sprite_face $02, 0
	script_sleep 30
	sprite_face $02, $01
	script_sleep 30
	writenpctext TreeBitstreamText_42ec2
	ret

Func_9df90:
	ld a, e
	or a
	jp nz, .asm_9dfe3
	face_player $01
	checkevent EVENT_0B9
	cp $01
	jp nz, .asm_9dfc2
	checkevent EVENT_0BB
	cp $01
	jp nz, .asm_9dfb9
	writenpctext TreeBitstreamText_43d46
	jp .asm_9dfbf
.asm_9dfb9
	writenpctext TreeBitstreamText_43156
.asm_9dfbf
	jp .asm_9dfe3
.asm_9dfc2
	writenpctext_yesorno TreeBitstreamText_42ffd
	or a
	jp nz, .asm_9dfdd
	writenpctext TreeBitstreamText_43084
	setevent EVENT_0B9
	jp .asm_9dfe3
.asm_9dfdd
	writenpctext TreeBitstreamText_430f7
.asm_9dfe3
	ret
