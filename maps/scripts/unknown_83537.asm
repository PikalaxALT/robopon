
Data_83516:
	warpdef $08, $01, $01, $01, MAP_00_24, $08, $01, $08, $02, $2e
	warpdef $09, $01, $01, $01, MAP_00_22, $09, $01, $09, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Func_83537::
	call Func_83568
	ld hl, Func_83568
	scall Func_80f11
	ld a, $e
	ld [wc7de], a
	loadwarps $3, Data_83516
	playmusic SONG_SHOP
	scall Func_8001c
	ld hl, GetSRAMBank
	call LandmarkSign_20
	ret

Data_8355c:
	db $04, $01, $01, $01, $08, $01

Data_83562: ; 83562
	db $04, $01, $01, $01, $0a, $01

Func_83568:
	ld a, [wc78c]
	cp $f
	jp nc, Func_83576
	ld hl, Data_8355c
	scall Func_80d9b
Func_83576: ; 83576 (20:7576)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83584
	ld hl, Data_83562
	scall Func_80d9b
Func_83584: ; 83584 (20:7584)
	scall Func_80f02
	ret
