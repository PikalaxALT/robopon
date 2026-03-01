
Data_83789:
	warpdef $08, $01, $01, $01, MAP_00_27, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_29, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Func_837aa::
	call Func_837db
	ld hl, Func_837db
	scall Func_80f11
	ld a, $13
	ld [wc7de], a
	loadwarps $3, Data_83789
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46ccb
	ret

Data_837cf:
	db $04, $01, $01, $01, $09, $01

Data_837d5: ; 837d5
	db $04, $01, $01, $01, $0a, $01

Func_837db:
	ld a, [wc78c]
	cp $14
	jp nc, Func_837e9
	ld hl, Data_837cf
	scall Func_80d9b
Func_837e9: ; 837e9 (20:77e9)
	ld a, [wc78c]
	cp $5
	jp nc, Func_837f7
	ld hl, Data_837d5
	scall Func_80d9b
Func_837f7: ; 837f7 (20:77f7)
	scall Func_80f02
	ret
