
Data_b79ed:
	warpdef $08, $0e, $02, $01, MAP_31_00, $07, $05, $07, $06, SFX_34

Func_b79f8:: ; b79f8
	loadwarps $01, Data_b79ed
	ld a, $01
	scall Func_80653
	ld a, $0c
	ld [wc7e2], a
	playmusic $13
	scall Func_8001c
	ret
