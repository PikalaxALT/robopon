
Data_9ee60:
	warpdef $01, $09, $01, $01, MAP_18_11, $02, $08, $03, $08, $2e
	warpdef $06, $04, $01, $01, MAP_18_16, $06, $04, $05, $04, $2e

Data_9ee76:
	warpdef $01, $09, $01, $01, MAP_18_12, $02, $08, $03, $08, $2e
	warpdef $06, $04, $01, $01, MAP_18_16, $06, $04, $05, $04, $2e

Data_9ee8c:
IF DEF(SUN)
	wildbot $00, $03, $08, $08, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $08, $08, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $08, $08, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $08, $08, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $08, $08, $74, $1e, $20, $79, $0c, $08, $00, $05, $0a, $00
	wildbot $00, $03, $08, $08, $4c, $20, $22, $30, $2a, $12, $00, $10, $09, $00
	wildbot $00, $03, $08, $08, $32, $21, $23, $79, $07, $0c, $00, $11, $08, $00
	wildbot $00, $03, $08, $08, $72, $21, $23, $79, $09, $09, $00, $10, $07, $00
ENDC

Func_9eec4:: ; 9eec4
	ld a, [wc792]
	cp $05
	jp z, .asm_9eedc
	ld a, [wc792]
	cp $07
	jp z, .asm_9eedc
	ld a, [wc792]
	cp $06
	jp nz, .asm_9eeec
.asm_9eedc:
	ld e, $02
	ld hl, Data_9ee76
	scall LoadWarps
	ld a, $06
	ld [wc792], a
	jp .asm_9eef9
.asm_9eeec:
	ld e, $02
	ld hl, Data_9ee60
	scall LoadWarps
	ld a, $03
	ld [wc792], a
.asm_9eef9:
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9ee8c
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret
