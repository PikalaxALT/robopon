
Data_9284b:
	warpdef $07, $0e, $01, $01, MAP_09_00, $05, $2c, $05, $2d, $2e

Data_92856:
	db $2a, $0d, $03, $03, $18

Data_9285b:
	wildbot $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	wildbot $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	wildbot $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	wildbot $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_92893:
	wildbot $00, $0d, $0f, $0d, $1f, $0f, $12, $2e, $17, $00, $00, $03, $0c, $00
	wildbot $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	wildbot $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	wildbot $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	wildbot $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_928d9:
	wildbot $00, $0d, $0f, $0d, $20, $0f, $12, $2e, $17, $17, $00, $03, $0c, $00
	wildbot $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	wildbot $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	wildbot $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	wildbot $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_9291f:
	wildbot $00, $0d, $0f, $0d, $21, $0f, $12, $2e, $17, $17, $17, $03, $0c, $00
	wildbot $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	wildbot $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	wildbot $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	wildbot $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Func_92965:: ; 92965
	ld e, $01
	ld hl, Data_9284b
	scall LoadWarps
	ld e, $01
	ld hl, Data_92856
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_92999
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, .asm_92999
	ld e, $05
	ld hl, Data_92893
	scall LoadEncounters
	jp .asm_929e0
.asm_92999:
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, .asm_929b8
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, .asm_929b8
	ld e, $05
	ld hl, Data_928d9
	scall LoadEncounters
	jp .asm_929e0
.asm_929b8:
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, .asm_929d8
	ld hl, $0047
	scall CheckEventFlag
	cp $01
	jp nz, .asm_929d8
	ld e, $05
	ld hl, Data_9291f
	scall LoadEncounters
	jp .asm_929e0
.asm_929d8:
	ld e, $04
	ld hl, Data_9285b
	scall LoadEncounters
.asm_929e0:
	ld e, $04
	ld hl, Data_9285b
	scall LoadEncounters
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e3
	scall LandmarkSign
	ret
