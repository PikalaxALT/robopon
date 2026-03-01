
Data_abf7a:
	warpdef $0e, $1c, $04, $01, MAP_25_00, $08, $05, $08, $06, SFX_2E
	warpdef $0e, $05, $04, $01, MAP_25_10, $10, $1a, $10, $19, SFX_2E

Func_abf90:: ; abf90
	loadwarps $02, Data_abf7a
	scall Func_8001c
	ret
