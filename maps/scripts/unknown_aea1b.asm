
Data_ae9a1:
	warpdef $09, $04, $01, $01, MAP_27_03, $11, $04, $11, $05, $2e
	warpdef $16, $04, $01, $01, MAP_27_03, $1e, $04, $1e, $05, $2e
	warpdef $01, $0c, $01, $01, MAP_27_05, $0d, $0c, $0d, $0b, $2e

Data_ae9c2:
	db $44, $15, $0a, $02, $76

Data_ae9c7:
IF DEF(SUN)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ENDC

Data_aea0d:
	person_event $ff, $00, $06, $0f, $03, $01, $01, $04, $01, Func_aea4f, NULL

Func_aea1b:: ; aea1b
	ld e, $03
	ld hl, Data_ae9a1
	scall LoadWarps
	ld e, $01
	ld hl, Data_ae9c2
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae9c7
	scall LoadEncounters
	ld e, $01
	ld hl, Data_aea0d
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0318
	scall LandmarkSign
	ret

Func_aea4f:
	ld a, e
	cp $02
	jp nz, .asm_aea7f
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $0e
	ld e, $07
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_aea7f:
	ret
