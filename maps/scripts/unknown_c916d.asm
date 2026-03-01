
Data_c90b4:
	warpdef $10, $1d, $03, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $11, $09, $01, $01, MAP_21_10, $09, $13, $09, $12, SFX_34
	warpdef $05, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, SFX_34
	warpdef $1d, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, SFX_34
	warpdef $0b, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, SFX_34
	warpdef $17, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, SFX_34
	warpdef $0b, $0c, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $17, $0c, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $0a, $14, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $18, $14, $01, $01, MAP_32_06, $06, $0c, $06, $0b, SFX_34
	warpdef $11, $13, $01, $01, MAP_21_20, $09, $13, $09, $12, SFX_34

Data_c912d:
	dtext_tree_pointer TreeBitstreamText_46668
	dw -1

Data_c9131:
	dtext_tree_pointer TreeBitstreamText_3c707
	dw -1

Data_c9135:
	person_event $ff, $00, $12, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $ff, $00, $10, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $09, $04, $12, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_32, Data_c9131
	person_event $1d, $04, $04, $12, $01, $01, $02, $04, $00, NULL, NULL

Func_c916d:: ; c916d
	call Func_c91a4
	ld hl, Func_c91a4
	scall Func_80f11
	ld a, $06
	ld [wc789], a
	ld a, $09
	ld [wc7e2], a
	loadwarps $0b, Data_c90b4
	loadpeople $04, Data_c9135
	playmusic $13
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_c919e:
	db $10, $1e, $03, $01, $10, $1d

Func_c91a4:
	checkevent $001f
	cp $01
	jp nz, .asm_c91b8
	ld hl, Data_c919e
	scall Func_80d9b
	scall Func_80f02
.asm_c91b8:
	ret
