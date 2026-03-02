
Data_87e34:
	warpdef $06, $04, $01, $01, MAP_03_12, $01, $06, $02, $06, SFX_2E
    warpdef $10, $08, $01, $01, MAP_03_15, $01, $0b, $01, $0a, SFX_2E

Data_87e4a: ; 87e4a
IF DEF(SUN)
	wildbot $05, $03, $0f, $09, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $05, $03, $0f, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $0f, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $0f, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ELIF DEF(STAR)
	wildbot $05, $03, $0f, $09, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $05, $03, $0f, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $0f, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $0f, $09, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $0f, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_87e90:
    dtext_tree_pointer TreeBitstreamText_3af58
    dw -1

Data_87e94: ; 87e94
    person_event $00, $04, $10, $06, $01, $01, $02, $04, $00, Func_808fc_21, Data_87e90

Func_87ea2::
	loadwarps $2, Data_87e34
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_87e4a
	checkevent EVENT_000
	or a
	jp nz, .asm_87ec9
	ld a, $1
	ld [wc7da], a
	jp .asm_87ecd

.asm_87ec9 ; 87ec9 (21:7ec9)
	xor a
	ld [wc7da], a
.asm_87ecd ; 87ecd (21:7ecd)
	loadpeople $1, Data_87e94
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46894
	ret

