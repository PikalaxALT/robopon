
Data_b79ed:
	warpdef $08, $0e, $02, $01, MAP_31_00, $07, $05, $07, $06, $34

Func_b79f8:: ; b79f8
	ld e, $01
	ld hl, Data_b79ed
	scall LoadWarps
	ld a, $01
	scall Func_80653
	ld a, $0c
	ld [wc7e2], a
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	ret
