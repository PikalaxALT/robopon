
Data_83399:
	warpdef $08, $01, $01, $01, MAP_00_19, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_21, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Func_833ba::
	set_frame_script Func_833eb
	ld a, $b
	ld [wc7de], a
	loadwarps $3, Data_83399
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46c6a
	ret

Data_833df:
	db $06, $01, $01, $01, $09, $01

Data_833e5: ; 833e5
	db $06, $01, $01, $01, $0a, $01

Func_833eb:
	ld a, [wc78c]
	cp $c
	jp nc, Func_833f9
	ld hl, Data_833df
	scall Func_80d9b
Func_833f9: ; 833f9 (20:73f9)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83407
	ld hl, Data_833e5
	scall Func_80d9b
Func_83407: ; 83407 (20:7407)
	scall Func_80f02
	ret
