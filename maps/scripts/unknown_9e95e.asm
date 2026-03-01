
Data_9e8fa:
	warpdef $06, $04, $01, $01, MAP_18_18, $06, $04, $07, $04, SFX_2E
	warpdef $01, $09, $01, $01, MAP_18_10, $05, $03, $04, $03, SFX_2E

Data_9e910:
	warpdef $06, $04, $01, $01, MAP_18_18, $06, $04, $07, $04, SFX_2E
	warpdef $01, $09, $01, $01, MAP_18_11, $20, $12, $1f, $12, SFX_2E

Data_9e926:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
ENDC

Func_9e95e:: ; 9e95e
	ld a, [wc792]
	cp $01
	jp z, .asm_9e976
	ld a, [wc792]
	cp $03
	jp z, .asm_9e976
	ld a, [wc792]
	cp $02
	jp nz, .asm_9e986
.asm_9e976:
	ld e, $02
	ld hl, Data_9e8fa
	scall LoadWarps
	ld a, $02
	ld [wc792], a
	jp .asm_9e993
.asm_9e986:
	ld e, $02
	ld hl, Data_9e910
	scall LoadWarps
	ld a, $05
	ld [wc792], a
.asm_9e993:
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9e926
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret
