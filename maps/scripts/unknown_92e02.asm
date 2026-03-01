
Data_92dbb:
	warpdef $01, $06, $02, $01, MAP_09_00, $08, $04, $08, $05, SFX_34

Data_92dc6:
	dtext_tree_pointer TreeBitstreamText_3c162
	dw -1

Data_92dca:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Data_92de6:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, Func_808fc_24, Data_92dc6
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Func_92e02:: ; 92e02
	loadwarps $01, Data_92dbb
	ld a, $01
	scall LoadPlayerSprite
	checkevent $0015
	or a
	jp nz, .asm_92e32
	loadpeople $02, Data_92dca
	scall Func_8001c
	call Func_92e6d
	setevent $0015
	jp .asm_92e5c
.asm_92e32:
	ld a, [wc790]
	or a
	jp z, .asm_92e54
	ld a, [wc790]
	cp $06
	jp nc, .asm_92e54
	loadpeople $02, Data_92de6
	playmusic $11
	scall Func_8001c
	jp .asm_92e5c
.asm_92e54:
	playmusic $11
	scall Func_8001c
.asm_92e5c:
	ret

Data_92e5d:
	db $02, $02, $05, $02, $03, $02, $04, $02, $ff, $ff

Data_92e67:
	db $02, $02, $02, $04, $ff, $ff

Func_92e6d:
	ld e, $01
	xor a
	scall PlayerStep
	playmusic SONG_NONE
	playmusic $01
	hltext_tree_pointer TreeBitstreamText_3be8e
	scall PrintTextWithNPCName
	playmusic SONG_NONE
	sprite_face $03, 0
	loademote $01, $01, $10
	playsfx $34
	hideperson 0
	playsfx $3d
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf25
	scall PrintTextWithNPCName
	loademote $01, $02, $10
	playsfx $34
	scall WaitEmote
	showperson 0
	scall HideEmote
	sprite_face $01, 0
	move_person 0, Data_92e5d, 1
	scall WaitNPCStep
	sprite_face $02, 0
	loademote $01, $01, $05
	ld e, $02
	ld a, $04
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	move_person 0, Data_92e67, 1
	scall WaitNPCStep
	sprite_face $03, 0
	loademote $01, $01, $10
	playsfx $34
	hideperson 0
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf4b
	scall PrintTextStandard
	playmusic SONG_NONE
	playmusic $1b
	loademote $02, $04, $10
	scall WaitEmote
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_3bf50
	scall PrintTextWithNPCName
	playmusic SONG_NONE
	loademote $01, $02, $10
	scall WaitEmote
	playsfx $34
	showperson 0
	scall HideEmote
	sprite_face $01, 0
	move_person 0, Data_92e5d, 1
	scall WaitNPCStep
	sprite_face $02, 0
	loademote $01, $01, $05
	ld e, $02
	ld a, $04
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	move_person 0, Data_92e67, 1
	scall WaitNPCStep
	sprite_face $03, 0
	loademote $01, $01, $10
	playsfx $34
	hideperson 0
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf85
	scall PrintTextWithNPCName
	playmusic SONG_NONE
	playmusic $1b
	loademote $02, $08, $10
	scall WaitEmote
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_3bf8e
	scall PrintTextWithNPCName
	playmusic SONG_NONE
	loademote $01, $02, $10
	scall WaitEmote
	playsfx $34
	showperson 0
	scall HideEmote
	sprite_face $01, 0
	move_person 0, Data_92e5d, 1
	scall WaitNPCStep
	sprite_face $02, 0
	loademote $01, $01, $05
	ld e, $02
	ld a, $04
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	move_person 0, Data_92e67, 1
	scall WaitNPCStep
	playsfx $34
	sprite_face $03, 0
	loademote $01, $50, $10
	playsfx $34
	hideperson 0
	scall WaitEmote
	playsfx $68
	hltext_tree_pointer TreeBitstreamText_3bfc1
	scall PrintTextWithNPCName
	hideperson $01
	loademote $01, $20, $10
	playsfx $4d
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $02
	scall PlayerStep
	ret
