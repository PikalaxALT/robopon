
Data_a9849:
	db $36, $0f, $04, $01, $31

Data_a984e:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9894:
	person_event $ff, $00, $05, $14, $01, $01, $00, $04, $01, Func_a98c8, NULL

Func_a98a2:: ; a98a2
	ld e, $01
	ld hl, Data_a9849
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a984e
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9894
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a98c8:
	ld a, e
	cp $02
	jp nz, .asm_a98f7
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $04
	ld e, $0d
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a98f7:
	ret
