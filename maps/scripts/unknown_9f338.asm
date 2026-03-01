
Data_9f2dc:
	warpdef $00, $1b, $03, $01, MAP_19_37, $06, $02, $06, $03, SFX_2E
	warpdef $05, $06, $03, $01, MAP_09_00, $0b, $12, $0b, $13, SFX_2E

Data_9f2f2:
IF DEF(SUN)
	wildbot $00, $03, $15, $19, $5f, $14, $18, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $15, $19, $50, $14, $18, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $15, $19, $34, $15, $19, $17, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $15, $19, $35, $15, $19, $77, $17, $12, $11, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $15, $19, $50, $14, $18, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $15, $19, $57, $14, $18, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $15, $19, $26, $15, $19, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $15, $19, $5f, $15, $19, $77, $05, $06, $00, $04, $06, $00
ENDC

Data_9f32a:
	person_event $ff, $00, $12, $11, $03, $03, $00, $04, $00, Func_9f369, NULL

Func_9f338:: ; 9f338
	loadwarps $02, Data_9f2dc
	loadpeople $01, Data_9f32a
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_9f2f2
	playmusic SONG_CAVE
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	landmarksign TreeBitstreamText_46973
	ret

Func_9f369:
	ld a, e
	or a
	jp nz, .asm_9f394
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic SONG_CAVE
.asm_9f394:
	ret
