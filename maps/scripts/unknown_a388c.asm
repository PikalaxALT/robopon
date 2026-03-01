
Data_a378b:
	warpdef $01, $0d, $01, $01, MAP_19_33, $01, $04, $02, $04, SFX_2E
	warpdef $0b, $0d, $01, $01, MAP_19_38, $0b, $0d, $0a, $0d, SFX_2E
	warpdef $06, $02, $01, $01, MAP_19_11, $02, $1b, $02, $1a, SFX_2E

Data_a37ac:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0d, $0c, $34, $16, $18, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0d, $0c, $57, $15, $17, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $0d, $0c, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $5f, $16, $18, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $2a, $17, $19, $10, $05, $05, $05, $04, $02, $00
ENDC

Data_a37f2:
	person_event $ff, $00, $00, $04, $01, $01, $00, $04, $01, Func_a38b8, NULL
	person_event $ff, $00, $01, $08, $01, $01, $00, $04, $01, Func_a38e9, NULL
	person_event $ff, $00, $02, $0a, $01, $01, $00, $04, $01, Func_a391a, NULL
	person_event $ff, $00, $04, $0c, $01, $01, $00, $04, $01, Func_a394b, NULL
	person_event $ff, $00, $05, $05, $01, $01, $00, $04, $01, Func_a397c, NULL
	person_event $ff, $00, $05, $07, $01, $01, $00, $04, $01, Func_a39ad, NULL
	person_event $ff, $00, $06, $0a, $01, $01, $00, $04, $01, Func_a39de, NULL
	person_event $ff, $00, $07, $04, $01, $01, $00, $04, $01, Func_a3a0f, NULL
	person_event $ff, $00, $07, $0c, $01, $01, $00, $04, $01, Func_a3a40, NULL
	person_event $ff, $00, $09, $07, $01, $01, $00, $04, $01, Func_a3a71, NULL
	person_event $ff, $00, $0a, $0a, $01, $01, $00, $04, $01, Func_a3aa2, NULL

Func_a388c:: ; a388c
	ld e, $03
	ld hl, Data_a378b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a37ac
	scall LoadEncounters
	ld e, $0b
	ld hl, Data_a37f2
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $041e
	scall LandmarkSign
	ret

Func_a38b8:
	ld a, e
	cp $02
	jp nz, .asm_a38e8
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
	ld c, $00
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a38e8:
	ret

Func_a38e9:
	ld a, e
	cp $02
	jp nz, .asm_a3919
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
	ld l, $08
	push hl
	ld c, $01
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3919:
	ret

Func_a391a:
	ld a, e
	cp $02
	jp nz, .asm_a394a
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
	ld l, $0a
	push hl
	ld c, $02
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a394a:
	ret

Func_a394b:
	ld a, e
	cp $02
	jp nz, .asm_a397b
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
	ld l, $0c
	push hl
	ld c, $04
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a397b:
	ret

Func_a397c:
	ld a, e
	cp $02
	jp nz, .asm_a39ac
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
	ld l, $05
	push hl
	ld c, $05
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a39ac:
	ret

Func_a39ad:
	ld a, e
	cp $02
	jp nz, .asm_a39dd
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
	ld l, $07
	push hl
	ld c, $05
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a39dd:
	ret

Func_a39de:
	ld a, e
	cp $02
	jp nz, .asm_a3a0e
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
	ld l, $0a
	push hl
	ld c, $06
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a0e:
	ret

Func_a3a0f:
	ld a, e
	cp $02
	jp nz, .asm_a3a3f
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
	ld c, $07
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a3f:
	ret

Func_a3a40:
	ld a, e
	cp $02
	jp nz, .asm_a3a70
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
	ld l, $0c
	push hl
	ld c, $07
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a70:
	ret

Func_a3a71:
	ld a, e
	cp $02
	jp nz, .asm_a3aa1
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
	ld l, $07
	push hl
	ld c, $09
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3aa1:
	ret

Func_a3aa2:
	ld a, e
	cp $02
	jp nz, .asm_a3ad2
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
	ld l, $0a
	push hl
	ld c, $0a
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3ad2:
	ret
