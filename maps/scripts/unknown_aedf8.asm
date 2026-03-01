
Data_aeda2:
	warpdef $12, $14, $01, $01, MAP_27_09, $12, $04, $11, $04, $2e

Data_aedad:
	db $47, $0a, $03, $02, $63

Data_aedb2:
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aedf8:: ; aedf8
	ld l, $00
	push hl
	ld c, $06
	ld e, $07
	ld a, $0e
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $06
	ld e, $08
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $09
	ld e, $0e
	ld a, $08
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $05
	ld e, $09
	ld a, $01
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $0d
	ld a, $04
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0f
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $06
	ld e, $06
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $08
	ld a, $0d
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0c
	ld a, $10
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $08
	ld e, $08
	ld a, $13
	scall Func_80f24
	pop bc
	ld e, $01
	ld hl, Data_aeda2
	scall LoadWarps
	ld e, $01
	ld hl, Data_aedad
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aedb2
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031c
	scall LandmarkSign
	ret
