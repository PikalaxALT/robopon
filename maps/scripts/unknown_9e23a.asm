
Data_9e1c8:
	warpdef $02, $08, $01, $01, MAP_18_12, $20, $12, $1f, $12, $2e
	warpdef $20, $06, $01, $01, MAP_18_15, $07, $15, $07, $14, $2e

Data_9e1de:
	db $1d, $17, $03

Data_9e1e1:
	db $1d, $17, $03, $00, $00

Data_9e1e6:
	person_event $00, $04, $17, $04, $01, $01, $02, $04, $00, Func_806dd_27, Data_9e1de

Data_9e1f4:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $24, $26, $3c, $25, $12, $00, $06, $0a, $00
	wildbot $00, $03, $28, $11, $72, $24, $26, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $25, $27, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $26, $28, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $28, $11, $3b, $27, $29, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $24, $26, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $24, $26, $3c, $25, $12, $00, $06, $09, $00
	wildbot $00, $03, $28, $11, $72, $25, $27, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $26, $28, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $28, $11, $33, $27, $29, $34, $07, $07, $14, $11, $02, $00
ENDC

Func_9e23a:: ; 9e23a
	ld l, $00
	push hl
	ld c, $03
	ld e, $03
	ld a, $12
	scall Func_80f24
	pop bc
	ld a, $08
	ld [wc792], a
	xor a
	ld [wc794], a
	ld e, $02
	ld hl, Data_9e1c8
	scall LoadWarps
	ld e, $01
	ld hl, Data_9e1e1
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_9e1f4
	scall LoadEncounters
	ld e, $01
	ld hl, Data_9e1e6
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret
