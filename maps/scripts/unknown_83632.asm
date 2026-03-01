
Data_83607:
	warpdef $08, $01, $01, $01, MAP_00_26, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_24, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_83628: ; 83628
	db $6c, $00, $09, $01, $26, $6d, $07, $09, $01, $25

Func_83632::
	call Func_8366b
	ld hl, Func_8366b
	scall Func_80f11
	ld a, $10
	ld [wc7de], a
	loadwarps $3, Data_83607
	ld e, $2
	ld hl, Data_83628
	scall Func_80ce7
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46ca8
	ret

Data_8365f:
	db $07, $01, $01, $01, $08, $01

Data_83665: ; 83665
	db $07, $01, $01, $01, $0a, $01

Func_8366b:
	ld a, [wc78c]
	cp $11
	jp nc, Func_83679
	ld hl, Data_8365f
	scall Func_80d9b
Func_83679: ; 83679 (20:7679)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83687
	ld hl, Data_83665
	scall Func_80d9b
Func_83687: ; 83687 (20:7687)
	scall Func_80f02
	ret
