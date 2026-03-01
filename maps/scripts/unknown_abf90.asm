
Data_abf7a:
	warpdef $0e, $1c, $04, $01, MAP_25_00, $08, $05, $08, $06, $2e
	warpdef $0e, $05, $04, $01, MAP_25_10, $10, $1a, $10, $19, $2e

Func_abf90:: ; abf90
	ld e, $02
	ld hl, Data_abf7a
	scall LoadWarps
	scall Func_8001c
	ret
