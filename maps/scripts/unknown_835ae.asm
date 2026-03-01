
Data_83588:
	warpdef $08, $01, $01, $01, MAP_00_23, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_25, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_835a9: ; 835a9
	db $6b, $01, $04, $11, $4e

Func_835ae::
	call Func_835e7
	ld hl, Func_835e7
	scall Func_80f11
	ld a, $f
	ld [wc7de], a
	loadwarps $3, Data_83588
	ld e, $1
	ld hl, Data_835a9
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46c9b
	ret

Data_835db:
	db $05, $01, $01, $01, $09, $01

Data_835e1: ; 835e1
	db $05, $01, $01, $01, $0a, $01

Func_835e7: ; 835e7 (20:75e7)
	ld a, [wc78c]
	cp $10
	jp nc, Func_835f5
	ld hl, Data_835db
	scall Func_80d9b
Func_835f5: ; 835f5 (20:75f5)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83603
	ld hl, Data_835e1
	scall Func_80d9b
Func_83603: ; 83603 (20:7603)
	scall Func_80f02
	ret
