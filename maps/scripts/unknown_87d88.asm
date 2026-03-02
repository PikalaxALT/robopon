
Data_87d45:
	warpdef $06, $04, $01, $01, MAP_03_12, $01, $06, $02, $06, SFX_2E

Data_87d50: ; 87d50
IF DEF(SUN)
	wildbot $05, $03, $0f, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $06, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $0f, $06, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ELIF DEF(STAR)
	wildbot $05, $03, $0f, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $06, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $0f, $06, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_87d7a: ; 87d7a
	person_event $00, $04, $10, $06, $01, $01, $02, $04, $00, Func_87dca, NULL

Func_87d88::
	loadwarps $1, Data_87d45
	ld a, $3
	scall Func_80d01
	loadwilds $3, Data_87d50
	checkevent EVENT_000
	or a
	jp nz, .asm_87daf
	ld a, $1
	ld [wc7da], a
	jp .asm_87db3

.asm_87daf: ; 87daf (21:7daf)
	xor a
	ld [wc7da], a
.asm_87db3: ; 87db3 (21:7db3)
	loadpeople $1, Data_87d7a
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46894
	ret

Func_87dca:
	push af
	ld a, e
	or a
	jp nz, .asm_87e32
	face_player -$1
	checkevent EVENT_051
	or a
	jp nz, .asm_87e2c
	writenpctext TreeBitstreamText_3ae6a
	ld a, $b
	scall Func_80e5d
	cp $1
	jp nz, .asm_87e23
	writenpctext TreeBitstreamText_3aea4
	writenpctext_yesorno TreeBitstreamText_3aef1
	or a
	jp nz, .asm_87e1a
	ld c, $1
	ld e, $1
	ld a, $b
	scall Func_80d4d
	setevent EVENT_051
	writenpctext TreeBitstreamText_3af20
	jp .asm_87e20

.asm_87e1a: ; 87e1a (21:7e1a)
	writenpctext TreeBitstreamText_3af00
.asm_87e20: ; 87e20 (21:7e20)
	jp .asm_87e29

.asm_87e23: ; 87e23 (21:7e23)
	writenpctext TreeBitstreamText_3aea4
.asm_87e29: ; 87e29 (21:7e29)
	jp .asm_87e32

.asm_87e2c: ; 87e2c (21:7e2c)
	writenpctext TreeBitstreamText_3af3a
.asm_87e32: ; 87e32 (21:7e32)
	pop bc
	ret
