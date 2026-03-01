
Data_8340b:
	warpdef $08, $01, $01, $01, MAP_00_22, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_20, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_8342c: ; 8342c
	db $6a, $00, $02, $11, $4b

Func_83431::
	set_frame_script Func_8346a
	ld a, $c
	ld [wc7de], a
	loadwarps $3, Data_8340b
	ld e, $1
	ld hl, Data_8342c
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	ld hl, Func_03d3
	call LandmarkSign_20
	ret

Data_8345e:
	db $05, $01, $01, $01, $08, $01

Data_83464: ; 83464
	db $05, $01, $01, $01, $0a, $01

Func_8346a:
	ld a, [wc78c]
	cp $d
	jp nc, Func_83478
	ld hl, Data_8345e
	scall Func_80d9b
Func_83478: ; 83478 (20:7478)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83486
	ld hl, Data_83464
	scall Func_80d9b
Func_83486: ; 83486 (20:7486)
	scall Func_80f02
	ret
