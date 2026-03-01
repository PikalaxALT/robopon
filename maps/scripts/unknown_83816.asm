
Data_837fb:
	warpdef $09, $01, $01, $01, MAP_00_28, $09, $01, $09, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_83811: ; 83811
	db $70, $05, $02, $11, $47

Func_83816::
	call Func_8384f
	ld hl, Func_8384f
	scall Func_80f11
	ld a, $14
	ld [wc7de], a
	loadwarps $2, Data_837fb
	ld e, $1
	ld hl, Data_83811
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46cd7
	ret

Data_83843:
	db $00, $01, $01, $01, $08, $01

Data_83849: ; 83849
	db $00, $01, $01, $01, $0a, $01

Func_8384f:
	ld a, [wc78c]
	cp $15
	jp nc, Func_8385d
	ld hl, Data_83843
	scall Func_80d9b
Func_8385d: ; 8385d (20:785d)
	ld a, [wc78c]
	cp $5
	jp nc, Func_8386b
	ld hl, Data_83849
	scall Func_80d9b
Func_8386b: ; 8386b (20:786b)
	scall Func_80f02
	ret
