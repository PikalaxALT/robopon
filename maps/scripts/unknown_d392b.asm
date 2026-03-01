
Data_d38af: ; d38af
	warpdef $07, $14, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $07, $0e, $01, $01, MAP_31_02, $09, $0e, $09, $0d, SFX_34

Data_d38c5:
	dtext_tree_pointer TreeBitstreamText_4670e
	dw -1

Data_d38c9: ; d38c9
	wildbot $01, $01, $0a, $0e, $2d, $28, $2d, $04, $06, $06, $06, $06, $04, $00
	wildbot $01, $01, $0a, $0e, $36, $28, $2d, $04, $0f, $0b, $00, $06, $02, $00
	wildbot $01, $01, $0a, $0e, $91, $28, $2d, $04, $04, $17, $00, $06, $08, $00
	wildbot $01, $01, $0a, $0e, $08, $28, $2d, $6e, $01, $13, $00, $13, $0a, $00
	wildbot $01, $01, $0a, $0e, $8f, $28, $2d, $6e, $0f, $0d, $14, $12, $07, $00

Data_d390f: ; d390f
	person_event $ff, $00, $06, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d38c5
	person_event $ff, $00, $08, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_34, Data_d38c5

Func_d392b:: ; d392b (34:792b)
	ld a, $f
	ld [wc7e2], a
	call Func_d3adf
	ld hl, Func_d3adf
	scall Func_80f11
	loadwarps $2, Data_d38af
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_d38c9
	loadpeople $2, Data_d390f
	checkevent $f1
	or a
	jp nz, .asm_d3977
	xor a
	scall PlayMusic
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46dc3
	call Func_d3cb2
	jp .asm_d39a5

.asm_d3977: ; d3977 (34:7977)
	checkevent $1c
	cp $1
	jp nz, .asm_d3998
	xor a
	scall PlayMusic
	ld a, $1
	scall LoadPlayerSprite
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_d39a6
	jp .asm_d39a5

.asm_d3998: ; d3998 (34:7998)
	playmusic SONG_PUNCH_MINIGAME
	ld a, $1
	scall LoadPlayerSprite
	scall Func_8001c
.asm_d39a5: ; d39a5 (34:79a5)
	ret

Func_d39a6: ; d39a6 (34:79a6)
	scall StartShakingScreen
	playsfx $64
	loademote $3, $1, $13
	scall Func_80f54
	scall WaitEmote
	scall HideEmote
	loademote $2, $1, $13
	playsfx $64
	ld a, $1
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	scall WaitEmote
	scall HideEmote
	loademote $2, $1, $13
	playsfx $64
	ld a, $2
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	scall WaitEmote
	scall HideEmote
	loademote $2, $1, $13
	playsfx $64
	ld a, $3
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	scall WaitEmote
	scall HideEmote
	loademote $2, $1, $13
	playsfx $64
	ld a, $4
	ld [wc78d + 1], a
	call Func_d3adf
	playsfx $4e
	scall Func_80f02
	scall Func_80f54
	scall WaitEmote
	scall HideEmote
	scall StopShakingScreen
	ld l, $6
	push hl
	ld c, $8
	ld e, $0
	ld a, $1a
	scall Func_80dff
	pop bc
	ret

Data_d3a6d: ; d3a6d
	db $00, $00, $03, $02, $06, $0d

Data_d3a73: ; d3a73
	db $00, $00, $03, $02, $06, $0c

Data_d3a79: ; d3a79
	db $00, $00, $03, $02, $06, $0b

Data_d3a7f: ; d3a7f
	db $00, $00, $03, $02, $06, $0a

Data_d3a85: ; d3a85
	db $00, $00, $03, $02, $06, $09

Data_d3a8b: ; d3a8b
	db $00, $00, $03, $02, $06, $08

Data_d3a91: ; d3a91
	db $00, $00, $03, $02, $06, $07

Data_d3a97: ; d3a97
	db $00, $00, $03, $02, $06, $06

Data_d3a9d: ; d3a9d
	db $00, $00, $03, $02, $06, $05

Data_d3aa3: ; d3aa3
	db $0d, $00, $03, $04, $06, $0a

Data_d3aa9: ; d3aa9
	db $0d, $00, $03, $04, $06, $09

Data_d3aaf: ; d3aaf
	db $0d, $00, $03, $04, $06, $08

Data_d3ab5: ; d3ab5
	db $0d, $00, $03, $04, $06, $07

Data_d3abb: ; d3abb
	db $0d, $00, $03, $04, $06, $06

Data_d3ac1: ; d3ac1
	db $0d, $00, $03, $04, $06, $05

Data_d3ac7: ; d3ac7
	db $0d, $00, $03, $04, $06, $04

Data_d3acd: ; d3acd
	db $0d, $00, $03, $04, $06, $03

Data_d3ad3: ; d3ad3
	db $0d, $00, $03, $04, $06, $02

Data_d3ad9: ; d3ad9
	db $06, $0f, $03, $02, $06, $0d

Func_d3adf: ; d3adf (34:7adf)
	checkevent $f1
	or a
	jp nz, .asm_d3af2
	ld hl, Data_d3ad9
	scall Func_80d9b
	scall Func_80f02
.asm_d3af2: ; d3af2 (34:7af2)
	ld a, [wc78d + 1]
	cp $1
	jp nz, .asm_d3b0c
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aa3
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3b0c: ; d3b0c (34:7b0c)
	ld a, [wc78d + 1]
	cp $2
	jp nz, .asm_d3b2c
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aa9
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3b2c: ; d3b2c (34:7b2c)
	ld a, [wc78d + 1]
	cp $3
	jp nz, .asm_d3b52
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3aaf
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3b52: ; d3b52 (34:7b52)
	ld a, [wc78d + 1]
	cp $4
	jp nz, .asm_d3b7e
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ab5
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3b7e: ; d3b7e (34:7b7e)
	ld a, [wc78d + 1]
	cp $5
	jp nz, .asm_d3bb0
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3abb
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3bb0: ; d3bb0 (34:7bb0)
	ld a, [wc78d + 1]
	cp $6
	jp nz, .asm_d3be8
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ac1
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3be8: ; d3be8 (34:7be8)
	ld a, [wc78d + 1]
	cp $7
	jp nz, .asm_d3c26
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ac7
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3c26: ; d3c26 (34:7c26)
	ld a, [wc78d + 1]
	cp $8
	jp nz, .asm_d3c6a
	ld hl, Data_d3a97
	scall Func_80d9b
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3acd
	scall Func_80d9b
	scall Func_80f02
	jp .asm_d3cb1

.asm_d3c6a: ; d3c6a (34:7c6a)
	ld a, [wc78d + 1]
	cp $9
	jp nz, .asm_d3cb1
	ld hl, Data_d3a9d
	scall Func_80d9b
	ld hl, Data_d3a97
	scall Func_80d9b
	ld hl, Data_d3a91
	scall Func_80d9b
	ld hl, Data_d3a8b
	scall Func_80d9b
	ld hl, Data_d3a85
	scall Func_80d9b
	ld hl, Data_d3a7f
	scall Func_80d9b
	ld hl, Data_d3a79
	scall Func_80d9b
	ld hl, Data_d3a73
	scall Func_80d9b
	ld hl, Data_d3a6d
	scall Func_80d9b
	ld hl, Data_d3ad3
	scall Func_80d9b
	scall Func_80f02
.asm_d3cb1: ; d3cb1 (34:7cb1)
	ret

Func_d3cb2: ; d3cb2 (34:7cb2)
	loademote $1, $2, $2b
	ld e, $e
	ld a, $7
	scall MoveEmote
	playsfx $65
	script_sleep $3c
	playsfx $43
	scall WaitEmote
	setevent $f1
	ld l, $9
	push hl
	ld c, $9
	ld e, $1
	ld a, $1f
	scall Func_80dff
	pop bc
	ret

Func_d3ceb:: ; d3ceb (34:7ceb)
	resetevent $f9
	playmusic SONG_JUMP_MINIGAME
	xor a
	scall Func_80653
	loademote $1, $6, $26
	scall Func_8001c
	scall WaitEmote
	ld a, $1
	scall PlayerFace
	ld l, $5
	push hl
	ld c, $f
	ld e, $16
	ld a, $13
	scall Func_80dff
	pop bc
	ret
