
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
	call Func_9ddbb
	ld hl, Func_9ddbb
	scall Func_80f11
	resetevent $0010
	loadwarps $01, Data_9dc24
	playmusic $0d
	checkevent $00ba
	or a
	jp nz, .asm_9dd37
	loadpeople $02, Data_9dc5c
	loadpeople $03, Data_9dccc
	scall Func_8001c
	call Func_9ddf2
	jp .asm_9dda8
.asm_9dd37:
	checkevent $00be
	cp $01
	jp nz, .asm_9dd62
	checkevent $00ee
	or a
	jp nz, .asm_9dd62
	loadpeople $03, Data_9dc94
	loadpeople $03, Data_9dccc
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd62:
	checkevent $00ee
	cp $01
	jp nz, .asm_9dd83
	loadpeople $01, Data_9dcbe
	ld e, $03
	ld hl, Data_9dc2f
	scall Func_80ce7
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd83:
	loadpeople $02, Data_9dc78
	loadpeople $03, Data_9dccc
	checkevent $00bb
	cp $01
	jp nz, .asm_9dda5
	ld de, Data_9dc54
	xor a
	scall SetPersonTextPointer
.asm_9dda5:
	scall Func_8001c
.asm_9dda8:
	ret

Data_9dda9:
	db $16, $06, $01, $02, $06, $01

Data_9ddaf:
	db $16, $08, $01, $02, $07, $01

Data_9ddb5:
	db $16, $0a, $01, $02, $03, $04

Func_9ddbb:
	checkevent $00ba
	cp $01
	jp nz, .asm_9ddd5
	ld hl, Data_9dda9
	scall Func_80d9b
	ld hl, Data_9ddaf
	scall Func_80d9b
	scall Func_80f02
.asm_9ddd5:
	checkevent $00ee
	cp $01
	jp nz, .asm_9dde9
	ld hl, Data_9ddb5
	scall Func_80d9b
	scall Func_80f02
.asm_9dde9:
	ret

Data_9ddea:
	db $05, $07, $ff, $ff

Data_9ddee:
	db $07, $07, $ff, $ff

Func_9ddf2:
	ld hl, $001e
	scall ScriptSleep
	playsfx $68
	ld hl, $026a
	scall PrintTextWithNPCName
	playsfx $68
	ld hl, $001e
	scall ScriptSleep
	move_player $00, Data_9ddea
	scall WaitNPCStep
	move_player $00, Data_9ddee
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_9de33:
	cp $03
	jp nc, .asm_9de44
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_9de33
.asm_9de44:
	ld hl, $001e
	scall ScriptSleep
	loademote $01, $01, $0a
	ld e, $01
	ld a, $06
	scall MoveEmote
	playsfx $62
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
	playsfx $62
	scall WaitEmote
	scall HideEmote
	loademote $01, $01, $0a
	ld e, $02
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playmusic SONG_NONE
	playmusic $1c
	ld hl, $00b4
	scall ScriptSleep
	setevent $00ba
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
	playsfx $51
	scall WaitEmote
	ld e, $81
	xor a
	scall SetPersonVisibilityState
	ld e, $81
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $003c
	scall ScriptSleep
	playsfx $69
	ld hl, $001e
	scall ScriptSleep
	playmusic SONG_NONE
	playmusic $0d
	ld hl, $026b
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
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
	ld hl, $003c
	scall ScriptSleep
	xor a
.asm_9df58:
	cp $03
	jp nc, .asm_9df6a
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_9df58
.asm_9df6a:
	ld hl, $001e
	scall ScriptSleep
	sprite_face $02, 0
	ld hl, $001e
	scall ScriptSleep
	sprite_face $02, $01
	ld hl, $001e
	scall ScriptSleep
	ld hl, $026c
	scall PrintTextWithNPCName
	ret

Func_9df90:
	ld a, e
	or a
	jp nz, .asm_9dfe3
	face_player $01
	checkevent $00b9
	cp $01
	jp nz, .asm_9dfc2
	checkevent $00bb
	cp $01
	jp nz, .asm_9dfb9
	ld hl, $037f
	scall PrintTextWithNPCName
	jp .asm_9dfbf
.asm_9dfb9:
	ld hl, $0271
	scall PrintTextWithNPCName
.asm_9dfbf:
	jp .asm_9dfe3
.asm_9dfc2:
	ld hl, $026e
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_9dfdd
	ld hl, $026f
	scall PrintTextWithNPCName
	setevent $00b9
	jp .asm_9dfe3
.asm_9dfdd:
	ld hl, $0270
	scall PrintTextWithNPCName
.asm_9dfe3:
	ret
