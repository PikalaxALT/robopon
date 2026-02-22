
Data_8370a:
	warpdef $08, $01, $01, $01, MAP_00_28, $08, $01, $08, $02, $2e
	warpdef $09, $01, $01, $01, MAP_00_26, $09, $01, $09, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_8372b: ; 8372b
	db $6f, $04, $02, $12, $34

Func_83730::
	call Func_83769
	ld hl, Func_83769
	scall Func_80f11
	ld a, $12
	ld [wc7de], a
	loadwarps $3, Data_8370a
	ld e, $1
	ld hl, Data_8372b
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46cbf
	ret

Data_8375d:
	db $05, $01, $01, $01, $08, $01

Data_83763: ; 83763
	db $05, $01, $01, $01, $0a, $01

Func_83769: ; 83769 (20:7769)
	ld a, [wc78c]
	cp $13
	jp nc, Func_83777
	ld hl, Data_8375d
	scall Func_80d9b
Func_83777: ; 83777 (20:7777)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83785
	ld hl, Data_83763
	scall Func_80d9b
Func_83785: ; 83785 (20:7785)
	scall Func_80f02
	ret
