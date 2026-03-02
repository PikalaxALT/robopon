
Data_8331a:
	warpdef $08, $01, $01, $01, MAP_00_20, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_18, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_8333b: ; 8333b
	db $65, $04, $06, $11, $30

Func_83340::
	set_frame_script Func_83379
	ld a, $a
	ld [wc7de], a
	loadwarps $3, Data_8331a
	ld e, $1
	ld hl, Data_8333b
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	ld hl, Func_03d1
	call LandmarkSign_20
	ret

Data_8336d:
	db $05, $01, $01, $01, $08, $01

Data_83373: ; 83373
	db $05, $01, $01, $01, $0a, $01

Func_83379:
	ld a, [wc78c]
	cp $b
	jp nc, .asm_83387
	ld hl, Data_8336d
	scall Func_80d9b
.asm_83387 ; 83387 (20:7387)
	ld a, [wc78c]
	cp $5
	jp nc, .asm_83395
	ld hl, Data_83373
	scall Func_80d9b
.asm_83395 ; 83395 (20:7395)
	scall Func_80f02
	ret
