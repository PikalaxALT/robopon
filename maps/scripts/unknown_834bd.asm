
Data_8348a:
	warpdef $08, $01, $01, $01, MAP_00_21, $08, $01, $08, $02, $2e
	warpdef $09, $01, $01, $01, MAP_00_23, $09, $01, $09, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_834ab:
	dtext_tree_pointer TreeBitstreamText_423f3
	dw -1

Data_834af: ; 834af
	person_event $32, $0c, $01, $03, $01, $01, $01, $04, $00, Func_808fc_20, Data_834ab

Func_834bd::
	call Func_834f6
	ld hl, Func_834f6
	scall Func_80f11
	ld a, $d
	ld [wc7de], a
	loadwarps $3, Data_8348a
	loadpeople $1, Data_834af
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46c83
	ret

Data_834ea:
	db $05, $01, $01, $01, $09, $01

Data_834f0: ; 834f0
	db $05, $01, $01, $01, $0a, $01

Func_834f6: ; 834f6 (20:74f6)
	ld a, [wc78c]
	cp $e
	jp nc, Func_83504
	ld hl, Data_834ea
	scall Func_80d9b
Func_83504: ; 83504 (20:7504)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83512
	ld hl, Data_834f0
	scall Func_80d9b
Func_83512: ; 83512 (20:7512)
	scall Func_80f02
	ret
