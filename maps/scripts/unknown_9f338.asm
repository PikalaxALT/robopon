
Data_9f2dc:
	warpdef $00, $1b, $03, $01, MAP_19_37, $06, $02, $06, $03, $2e
	warpdef $05, $06, $03, $01, MAP_09_00, $0b, $12, $0b, $13, $2e

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
	ld e, $02
	ld hl, Data_9f2dc
	scall LoadWarps
	ld e, $01
	ld hl, Data_9f32a
	scall LoadMapObjects
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9f2f2
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ld hl, $02e3
	scall LandmarkSign
	ret

Func_9f369:
	ld a, e
	or a
	jp nz, .asm_9f394
	scall RepairRobots
	xor a
	scall PlayMusic
	ld a, $16
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld hl, $0322
	scall PrintTextStandard
	ld a, $08
	scall PlayMusic
.asm_9f394:
	ret
