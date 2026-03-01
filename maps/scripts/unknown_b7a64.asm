
Data_b7a13: ; b7a13
	warpdef $08, $0e, $02, $01, MAP_31_00, $07, $05, $07, $06, SFX_34

Data_b7a1e: ; b7a1e
	person_event $1a, $04, $09, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $23, $04, $08, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $16, $04, $08, $0a, $01, $01, $01, $04, $00, NULL, NULL
	person_event $16, $04, $09, $0b, $01, $01, $00, $04, $00, NULL, NULL
	person_event $16, $04, $0a, $0a, $01, $01, $03, $04, $00, NULL, NULL

Func_b7a64::
	loadwarps 1, Data_b7a13
	loadpeople 5, Data_b7a1e
	playmusic $13
	hideperson $2
	hideperson $3
	hideperson $4
	checkevent $1b
	or a
	jp nz, Func_b7abb
	hideperson $2
	hideperson $3
	hideperson $4
	playmusic $13
	scall Func_8001c
	call Func_b7b62
	jp Func_b7ae2

Func_b7abb:
	checkevent $1c
	or a
	jp nz, Func_b7ad3
	playmusic $13
	scall Func_8001c
	call Func_b7d97
	jp Func_b7ae2

Func_b7ad3:
	xor a
	scall PlayerFace
	playmusic $13
	scall Func_8001c
	call Func_b7df7
Func_b7ae2:
	ret

Data_b7ae3:
	db $00, $00, $00, $03, $00, $c5, $67, $00, $00, $67, $01, $67, $04, $2d, $05, $05
	db $05, $03, $44, $04, $2d, $0c, $0e, $0f, $03, $77, $04, $2d, $21, $12, $00, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b0c: ; b7b0c
	db $00, $00, $00, $03, $00, $c5, $73, $00, $00, $73, $01, $73, $06, $2d, $0c, $08
	db $00, $05, $7b, $04, $2d, $02, $05, $00, $03, $75, $04, $2d, $07, $10, $00, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b35: ; b7b35
	db $00, $00, $00, $03, $00, $c5, $3f, $00, $00, $3f, $01, $3f, $06, $2d, $02, $09
	db $00, $05, $81, $06, $2d, $01, $01, $07, $05, $64, $04, $2d, $02, $02, $00, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b5e: ; b7b5e
	db $09, $0a, $ff, $ff

Func_b7b62:
	move_player $1, Data_b7b5e
	writenpctext TreeBitstreamText_3dd0b
	playsfx $5a
	showperson $2
	ld e, $2
	ld a, $2
	scall SpriteFace
	ld e, $3
	ld a, $2
	scall SpriteFace
	ld e, $0
	ld a, $2
	scall SpriteFace
	ld e, $1
	ld a, $2
	scall SpriteFace
	ld e, $2
	ld a, $2
	scall SpriteFace
	ld e, $3
	ld a, $2
	scall SpriteFace
	ld e, $0
	ld a, $2
	scall SpriteFace
	ld e, $1
	ld a, $2
	scall SpriteFace
	ld hl, $1e
	scall ScriptSleep
	playsfx $5b
	showperson $3
	ld e, $1
	ld a, $3
	scall SpriteFace
	ld e, $2
	ld a, $3
	scall SpriteFace
	ld e, $3
	ld a, $3
	scall SpriteFace
	ld e, $0
	ld a, $3
	scall SpriteFace
	ld e, $1
	ld a, $3
	scall SpriteFace
	ld e, $2
	ld a, $3
	scall SpriteFace
	ld e, $3
	ld a, $3
	scall SpriteFace
	ld e, $0
	ld a, $3
	scall SpriteFace
	ld hl, $1e
	scall ScriptSleep
	playsfx $66
	showperson $4
	ld e, $0
	ld a, $4
	scall SpriteFace
	ld e, $1
	ld a, $4
	scall SpriteFace
	ld e, $2
	ld a, $4
	scall SpriteFace
	ld e, $3
	ld a, $4
	scall SpriteFace
	ld e, $0
	ld a, $4
	scall SpriteFace
	ld e, $1
	ld a, $4
	scall SpriteFace
	ld e, $2
	ld a, $4
	scall SpriteFace
	ld e, $3
	ld a, $4
	scall SpriteFace
	ld hl, $1e
	scall ScriptSleep
	ld a, $3
	scall PlayerFace
	ld hl, $1e
	scall ScriptSleep
	ld de, Data_b7d76
	ld hl, Data_b7ae3
	scall ScriptedBattle
	or a
	jp nz, Func_b7c69
	ret

Func_b7c69:
	loademote $1, $1, $a
	ld e, $a
	ld a, $8
	scall MoveEmote
	playsfx $38
	scall WaitEmote
	scall HideEmote
	hideperson $2
	ld hl, $1e
	scall ScriptSleep
	ld a, $2
	scall PlayerFace
	ld hl, $1e
	scall ScriptSleep
	ld de, Data_b7d7b
	ld hl, Data_b7b0c
	scall ScriptedBattle
	or a
	jp nz, Func_b7caa
	ret

Func_b7caa:
	loademote $1, $1, $a
	ld e, $b
	ld a, $9
	scall MoveEmote
	playsfx $38
	scall WaitEmote
	scall HideEmote
	hideperson $3
	ld hl, $1e
	scall ScriptSleep
	ld a, $1
	scall PlayerFace
	ld hl, $1e
	scall ScriptSleep
	ld de, Data_b7d80
	ld hl, Data_b7b35
	scall ScriptedBattle
	or a
	jp nz, Func_b7ceb
	ret

Func_b7ceb:
	loademote $1, $1, $a
	ld e, $a
	ld a, $a
	scall MoveEmote
	playsfx $38
	scall WaitEmote
	scall HideEmote
	hideperson $4
	ld hl, $1e
	scall ScriptSleep
	xor a
	scall PlayerFace
	ld hl, $3c
	scall ScriptSleep
	writenpctext TreeBitstreamText_3de23
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	playsfx $35
	loademote $1, $1, $1b
	playsfx $37
	xor a
	scall Func_80653
	scall WaitEmote
	scall HideEmote
	setevent $1b
	ld a, $f
	scall Func_80c94
	ld l, $4
	push hl
	ld c, $7
	ld e, $0
	ld a, $1f
	scall Func_80dff
	pop bc
	ret

Data_b7d76: ; b7d76
	db $c3, $de, $bc, $31, $00

Data_b7d7b: ; b7d7b
	db $c3, $de, $bc, $32, $00

Data_b7d80: ; b7d80
	db $c3, $de, $bc, $33, $00

Data_b7d85: ; b7d85
	db $09, $0a, $ff, $ff

Data_b7d89: ; b7d89
	db $09, $0c, $06, $0c, $06, $0a, $0c, $0a, $09, $0c, $09, $0a, $ff, $ff

Func_b7d97:
	move_player $1, Data_b7d85
	writenpctext_yesorno TreeBitstreamText_3de8e
	or a
	jp nz, Func_b7db4
	writenpctext TreeBitstreamText_3df08
	jp Func_b7dba

Func_b7db4:
	writenpctext TreeBitstreamText_3dfb9
Func_b7dba:
	setevent $1c
	ld a, $a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	xor a
	scall FadeInAudio
	scall StartShakingScreen
	playsfx $65
	move_player $1, Data_b7d89
	playsfx $65
	scall StopShakingScreen
	ld l, $f
	push hl
	ld c, $7
	ld e, $a
	ld a, $20
	scall Func_80dff
	pop bc
	ret

Func_b7df7:
	scall StopShakingScreen
	ld hl, $3c
	scall ScriptSleep
	writenpctext TreeBitstreamText_3e04a
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	xor a
	scall Func_80653
	loademote $1, $1, $1b
	playsfx $37
	scall WaitEmote
	scall HideEmote
	ld l, $b
	push hl
	ld c, $9
	ld e, $4
	ld a, $1e
	scall Func_80dff
	pop bc
	ret
