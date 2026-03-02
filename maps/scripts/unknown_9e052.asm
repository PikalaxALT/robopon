
Data_9dfe4:
	warpdef $04, $15, $03, $01, MAP_18_00, $1e, $1a, $1e, $1b, SFX_2E
	warpdef $05, $03, $01, $01, MAP_18_16, $01, $09, $02, $09, SFX_2E

Data_9dffa:
IF DEF(SUN)
	wildbot $00, $03, $0b, $12, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $12, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $0b, $12, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $0b, $12, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $0b, $12, $3b, $22, $24, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $12, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $0b, $12, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $0b, $12, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $0b, $12, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $0b, $12, $33, $22, $24, $34, $07, $07, $14, $11, $02, $00
ENDC

Data_9e040:
	dtext_tree_pointer TreeBitstreamText_46dca
	dw -1

Data_9e044:
	person_event $ff, $00, $03, $10, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9e040

Func_9e052:: ; 9e052
	ld l, $00
	push hl
	ld c, $03
	ld e, $05
	ld a, $04
	scall Func_80f24
	pop bc
	ld a, $01
	ld [wc792], a
	loadwarps $02, Data_9dfe4
	resetevent EVENT_010
	loadpeople $01, Data_9e044
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_9dffa
	playmusic SONG_CAVE
	scall Func_8001c
	ret
