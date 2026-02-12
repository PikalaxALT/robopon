INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2d, 2", ROMX
	script_library 2d_2

Data_b780b:
	db $07, $0a, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $07, $05, $01, $01, $1f, $02, $09, $0e, $09, $0d, $34, $07, $0a, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $07, $05, $01, $01, $1f, $01, $09, $0e, $09, $0d, $34, $07, $0a, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $01, $01, $0a, $0e, $2d, $28, $2d, $04, $06, $06, $06, $06, $04, $00, $01, $01, $0a, $0e, $1c, $28, $2d, $04, $1f, $17, $11, $12, $03, $00, $01, $01, $0a, $0e, $3d, $28, $2d, $04, $1f, $08, $08, $06, $04, $00, $01, $01, $0a, $0e, $4b, $28, $2d, $04, $0e, $08, $14, $13, $05, $00, $01, $01, $0a, $0e, $67, $28, $2d, $04, $05, $13, $00, $06, $06, $00, $01, $01, $0a, $0e, $93, $28, $2d, $04, $04, $17, $00, $06, $04, $00, $01, $01, $0a, $0e, $27, $28, $2d, $6e, $01, $03, $00, $06, $0a, $00, $01, $01, $0a, $0e, $79, $28, $2d, $6e, $01, $04, $00, $12, $09, $00, $01, $01, $0a, $0e, $08, $28, $2d, $6e, $01, $13, $00, $13, $09, $00, $01, $01, $0a, $0e, $8f, $28, $2d, $6e, $0f, $0d, $14, $12, $08, $00, $01, $01, $0a, $0e, $61, $28, $2d, $6e, $05, $09, $00, $06, $07, $00, $01, $01, $0a, $0e, $37, $28, $2d, $6e, $24, $12, $00, $06, $02, $00, $c2, $02, $ff, $ff, $ff, $00, $06, $09, $01, $01, $00, $04, $00, $2d, $b6, $6f, $ea, $78, $ff, $00, $08, $09, $01, $01, $00, $04, $00, $2d, $b6, $6f, $ea, $78

Func_b790a:: ; b790a
	db $3e, $0c, $ea, $e2, $c7, $cd, $a1, $79, $21, $a1, $79, $cd, $68, $76, $1e, $02, $21, $ee, $78, $cd, $52, $68, $21, $1b, $00, $cd, $85, $6d, $b7, $c2, $35, $79, $1e, $02, $21, $0b, $78, $cd, $91, $67, $c3, $5d, $79, $21, $1b, $00, $cd, $85, $6d, $fe, $01, $c2, $5d, $79, $21, $34, $00, $cd, $85, $6d, $b7, $c2, $55, $79, $1e, $02, $21, $21, $78, $cd, $91, $67, $c3, $5d, $79, $1e, $01, $21, $37, $78, $cd, $91, $67, $3e, $03, $cd, $58, $74, $1e, $0c, $21, $42, $78, $cd, $7b, $74, $3e, $01, $cd, $1d, $74, $21, $1b, $00, $cd, $85, $6d, $fe, $01, $c2, $92, $79, $21, $f1, $00, $cd, $85, $6d, $b7, $c2, $92, $79, $af, $cd, $3d, $76, $af, $cd, $aa, $6d, $cd, $b6, $79, $c3, $9a, $79, $3e, $10, $cd, $3d, $76, $cd, $73, $67, $c9, $00, $15, $03, $02, $06, $03, $21, $1b, $00, $cd, $85, $6d, $fe, $01, $c2, $b5, $79, $21, $9b, $79, $cd, $f2, $74, $cd, $59, $76, $c9, $0e, $01, $1e, $01, $3e, $2b, $cd, $cd, $68, $1e, $04, $3e, $07, $cd, $3b, $69, $cd, $73, $67, $3e, $65, $cd, $55, $76, $21, $3c, $00, $cd, $e6, $6d, $3e, $43, $cd, $55, $76, $cd, $2c, $69, $cd, $e2, $68, $2e, $0e, $e5, $0e, $07, $1e, $0a, $3e, $20, $cd, $56, $75, $c1, $c9, $08, $0e, $02, $01, $1f, $00, $07, $05, $07, $06, $34

Func_b79f8:: ; b79f8
	db $1e, $01, $21, $ed, $79, $cd, $91, $67, $3e, $01, $cd, $aa, $6d, $3e, $0c, $ea, $e2, $c7, $3e, $13, $cd, $3d, $76, $cd, $73, $67, $c9

Data_b7a13: ; b7a13
	db $08, $0e, $02, $01, $1f, $00, $07, $05, $07, $06, $34

Data_b7a1e: ; b7a1e
	db $1a, $04, $09, $08, $01, $01, $02, $04, $00, $2d, $00, $00, $00, $00, $23, $04, $08, $08, $01, $01, $02, $04, $00, $2d, $00, $00, $00, $00, $16, $04, $08, $0a, $01, $01, $01, $04, $00, $2d, $00, $00, $00, $00, $16, $04, $09, $0b, $01, $01, $00, $04, $00, $2d, $00, $00, $00, $00, $16, $04, $0a, $0a, $01, $01, $03, $04, $00, $2d, $00, $00, $00, $00

Func_b7a64:: ; b7a64 (2d:7a64)
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
	scall FadeInMap
	call Func_b7b62
	jp Func_b7ae2

Func_b7abb: ; b7abb (2d:7abb)
	checkevent $1c
	or a
	jp nz, Func_b7ad3
	playmusic $13
	scall FadeInMap
	call Func_b7d97
	jp Func_b7ae2

Func_b7ad3: ; b7ad3 (2d:7ad3)
	xor a
	call PlayerFace_2d_2
	playmusic $13
	scall FadeInMap
	call Func_b7df7
Func_b7ae2: ; b7ae2 (2d:7ae2)
	ret

Data_b7ae3:
	db $00, $00, $00, $03, $00, $c5, $67, $00, $00, $67, $01, $67, $04, $2d, $05, $05, $05, $03, $44, $04, $2d, $0c, $0e, $0f, $03, $77, $04, $2d, $21, $12, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b0c: ; b7b0c
	db $00, $00, $00, $03, $00, $c5, $73, $00, $00, $73, $01, $73, $06, $2d, $0c, $08, $00, $05, $7b, $04, $2d, $02, $05, $00, $03, $75, $04, $2d, $07, $10, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b35: ; b7b35
	db $00, $00, $00, $03, $00, $c5, $3f, $00, $00, $3f, $01, $3f, $06, $2d, $02, $09, $00, $05, $81, $06, $2d, $01, $01, $07, $05, $64, $04, $2d, $02, $02, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_b7b5e: ; b7b5e
	db $09, $0a, $ff, $ff

Func_b7b62: ; b7b62 (2d:7b62)
	move_player $1, Data_b7b5e
	writenpctext TreeBitstreamText_3dd0b
	playsfx $5a
	showperson $2
	ld e, $2
	ld a, $2
	call SpriteFace_2d_2
	ld e, $3
	ld a, $2
	call SpriteFace_2d_2
	ld e, $0
	ld a, $2
	call SpriteFace_2d_2
	ld e, $1
	ld a, $2
	call SpriteFace_2d_2
	ld e, $2
	ld a, $2
	call SpriteFace_2d_2
	ld e, $3
	ld a, $2
	call SpriteFace_2d_2
	ld e, $0
	ld a, $2
	call SpriteFace_2d_2
	ld e, $1
	ld a, $2
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	playsfx $5b
	showperson $3
	ld e, $1
	ld a, $3
	call SpriteFace_2d_2
	ld e, $2
	ld a, $3
	call SpriteFace_2d_2
	ld e, $3
	ld a, $3
	call SpriteFace_2d_2
	ld e, $0
	ld a, $3
	call SpriteFace_2d_2
	ld e, $1
	ld a, $3
	call SpriteFace_2d_2
	ld e, $2
	ld a, $3
	call SpriteFace_2d_2
	ld e, $3
	ld a, $3
	call SpriteFace_2d_2
	ld e, $0
	ld a, $3
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	playsfx $66
	showperson $4
	ld e, $0
	ld a, $4
	call SpriteFace_2d_2
	ld e, $1
	ld a, $4
	call SpriteFace_2d_2
	ld e, $2
	ld a, $4
	call SpriteFace_2d_2
	ld e, $3
	ld a, $4
	call SpriteFace_2d_2
	ld e, $0
	ld a, $4
	call SpriteFace_2d_2
	ld e, $1
	ld a, $4
	call SpriteFace_2d_2
	ld e, $2
	ld a, $4
	call SpriteFace_2d_2
	ld e, $3
	ld a, $4
	call SpriteFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $3
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d76
	ld hl, Data_b7ae3
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7c69
	ret

Func_b7c69: ; b7c69 (2d:7c69)
	loademote $1, $1, $a
	ld e, $a
	ld a, $8
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $2
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d7b
	ld hl, Data_b7b0c
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7caa
	ret

Func_b7caa: ; b7caa (2d:7caa)
	loademote $1, $1, $a
	ld e, $b
	ld a, $9
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $3
	ld hl, $1e
	call ScriptSleep_2d_2
	ld a, $1
	call PlayerFace_2d_2
	ld hl, $1e
	call ScriptSleep_2d_2
	ld de, Data_b7d80
	ld hl, Data_b7b35
	call ScriptedBattle_2d_2
	or a
	jp nz, Func_b7ceb
	ret

Func_b7ceb: ; b7ceb (2d:7ceb)
	loademote $1, $1, $a
	ld e, $a
	ld a, $a
	call MoveEmote_2d_2
	playsfx $38
	call WaitEmote_2d_2
	call HideEmote_2d_2
	hideperson $4
	ld hl, $1e
	call ScriptSleep_2d_2
	xor a
	call PlayerFace_2d_2
	ld hl, $3c
	call ScriptSleep_2d_2
	writenpctext TreeBitstreamText_3de23
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	call MoveEmote_2d_2
	playsfx $28
	call WaitEmote_2d_2
	call HideEmote_2d_2
	playsfx $35
	loademote $1, $1, $1b
	playsfx $37
	xor a
	scall Func_80653
	call WaitEmote_2d_2
	call HideEmote_2d_2
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

Func_b7d97: ; b7d97 (2d:7d97)
	move_player $1, Data_b7d85
	writenpctext_yesorno TreeBitstreamText_3de8e
	or a
	jp nz, Func_b7db4
	writenpctext TreeBitstreamText_3df08
	jp Func_b7dba

Func_b7db4: ; b7db4 (2d:7db4)
	writenpctext TreeBitstreamText_3dfb9
Func_b7dba: ; b7dba (2d:7dba)
	setevent $1c
	ld a, $a
	call FadeOutAudio_2d_2
	xor a
	call PlayMusic_2d_2
	xor a
	call FadeInAudio_2d_2
	call StartShakingScreen_2d_2
	playsfx $65
	move_player $1, Data_b7d89
	playsfx $65
	call StopShakingScreen_2d_2
	ld l, $f
	push hl
	ld c, $7
	ld e, $a
	ld a, $20
	scall Func_80dff
	pop bc
	ret

Func_b7df7: ; b7df7 (2d:7df7)
	call StopShakingScreen_2d_2
	ld hl, $3c
	call ScriptSleep_2d_2
	writenpctext TreeBitstreamText_3e04a
	loademote $1, $1, $5
	ld e, $a
	ld a, $9
	call MoveEmote_2d_2
	playsfx $28
	call WaitEmote_2d_2
	call HideEmote_2d_2
	xor a
	scall Func_80653
	loademote $1, $1, $1b
	playsfx $37
	call WaitEmote_2d_2
	call HideEmote_2d_2
	ld l, $b
	push hl
	ld c, $9
	ld e, $4
	ld a, $1e
	scall Func_80dff
	pop bc
	ret

