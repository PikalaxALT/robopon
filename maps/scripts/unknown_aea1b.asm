
Data_ae9a1:
	warpdef $09, $04, $01, $01, MAP_27_03, $11, $04, $11, $05, SFX_2E
	warpdef $16, $04, $01, $01, MAP_27_03, $1e, $04, $1e, $05, SFX_2E
	warpdef $01, $0c, $01, $01, MAP_27_05, $0d, $0c, $0d, $0b, SFX_2E

Data_ae9c2:
	db $44, $15, $0a, $02, $76

Data_ae9c7:
IF DEF(SUN)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ENDC

Data_aea0d:
	person_event $ff, $00, $06, $0f, $03, $01, $01, $04, $01, Func_aea4f, NULL

Func_aea1b:: ; aea1b
	loadwarps $03, Data_ae9a1
	ld e, $01
	ld hl, Data_ae9c2
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_ae9c7
	loadpeople $01, Data_aea0d
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46ba8
	ret

Func_aea4f:
	ld a, e
	cp $02
	jp nz, .asm_aea7f
	xor a
	scall Func_80653
	loademote $01, $01, $1b
	playsfx SFX_37
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	warp_player MAP_27_07, $0e, $04
.asm_aea7f:
	ret
