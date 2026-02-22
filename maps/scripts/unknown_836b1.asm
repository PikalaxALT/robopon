
Data_8368b:
	warpdef $08, $01, $01, $01, MAP_00_25, $08, $01, $08, $02, $2e
	warpdef $09, $01, $01, $01, MAP_00_27, $09, $01, $09, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_836ac: ; 836ac
	db $6e, $01, $02, $13, $15

Func_836b1::
	call Func_836ea
	ld hl, Func_836ea
	scall Func_80f11
	ld a, $11
	ld [wc7de], a
	loadwarps $3, Data_8368b
	ld e, $1
	ld hl, Data_836ac
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46cb3
	ret

Data_836de:
	db $06, $01, $01, $01, $09, $01

Data_836e4: ; 836e4
	db $06, $01, $01, $01, $0a, $01

Func_836ea: ; 836ea (20:76ea)
	ld a, [wc78c]
	cp $12
	jp nc, Func_836f8
	ld hl, Data_836de
	scall Func_80d9b
Func_836f8: ; 836f8 (20:76f8)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83706
	ld hl, Data_836e4
	scall Func_80d9b
Func_83706: ; 83706 (20:7706)
	scall Func_80f02
	ret
