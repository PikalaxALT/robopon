
Data_8b5dd:
	warpdef $07, $04, $01, $01, MAP_03_12, $15, $12, $16, $12, $2e
	warpdef $01, $0b, $02, $01, MAP_03_14, $10, $08, $10, $09, $2e

Data_8b5f3:
	db $03, $08, $0b, $03, $18

Data_8b5f8:
IF DEF(SUN)
	wildbot $00, $03, $09, $09, $05, $09, $0b, $2d, $01, $06, $00, $0a, $0a, $00
	wildbot $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00
	wildbot $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00
	wildbot $00, $03, $09, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0c, $06, $00
	wildbot $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $09, $09, $46, $09, $0b, $78, $14, $14, $00, $0a, $0a, $00
	wildbot $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00
	wildbot $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00
	wildbot $00, $03, $09, $09, $25, $0c, $0e, $79, $18, $18, $00, $0c, $06, $00
	wildbot $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00
ENDC

Data_8b63e:
	person_event $ff, $00, $03, $09, $03, $01, $00, $04, $00, Func_8b6ae, NULL
	person_event $0a, $04, $01, $03, $01, $01, $02, $04, $00, Func_8b767, NULL

Func_8b65a:: ; 8b65a
	loadwarps $02, Data_8b5dd
	ld e, $01
	ld hl, Data_8b5f3
	scall Func_80ce7
	loadpeople $02, Data_8b63e
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8b5f8
	ld a, $04
	ld [wc7e2], a
	checkevent $0000
	or a
	jp nz, .asm_8b696
	ld a, $01
	ld [wc7da], a
	jp .asm_8b69a
.asm_8b696:
	xor a
	ld [wc7da], a
.asm_8b69a:
	ld a, $01
	scall LoadPlayerSprite
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46894
	ret

Func_8b6ae:
	ld a, e
	or a
	jp nz, .asm_8b73d
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_8b737
.asm_8b6db:
	ld a, [wc790]
	or a
	jp z, .asm_8b72e
	ld a, [wc790]
	cp $06
	jp nc, .asm_8b72e
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, .asm_8b72b
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	playsfx $44
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	xor a
	scall PlayerFace
	ld l, $1e
	push hl
	ld c, $2e
	ld e, $03
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_8b72b:
	jp .asm_8b734
.asm_8b72e:
	writetext TreeBitstreamText_470f0
.asm_8b734:
	jp .asm_8b73d
.asm_8b737:
	writetext TreeBitstreamText_470d8
.asm_8b73d:
	ret

Data_8b73e:
	db $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $39, $01, $39, $02, $0e, $1f, $1e
	db $08, $19, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b767:
	push af
	ld a, e
	or a
	jp nz, .asm_8b7bd
	face_player -$01
	checkevent $0072
	or a
	jp nz, .asm_8b7b7
	writetext TreeBitstreamText_42b7b
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8b7ae
	startbattle Data_8b7bf, Data_8b73e
	or a
	jp nz, .asm_8b79d
	jp .asm_8b7bd
.asm_8b79d:
	setevent $0072
	writetext TreeBitstreamText_42b85
	jp .asm_8b7b4
.asm_8b7ae:
	writetext TreeBitstreamText_42c16
.asm_8b7b4:
	jp .asm_8b7bd
.asm_8b7b7:
	writetext TreeBitstreamText_42b85
.asm_8b7bd:
	pop bc
	ret

Data_8b7bf:
	dstr "アヤシケﾞ(くん)"

