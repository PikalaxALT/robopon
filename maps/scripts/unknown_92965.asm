
Data_9284b:
	warpdef $07, $0e, $01, $01, MAP_09_00, $05, $2c, $05, $2d, SFX_2E

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
	loadwarps $01, Data_9284b
	ld e, $01
	ld hl, Data_92856
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_92999
	checkevent $0039
	or a
	jp nz, .asm_92999
	loadwilds $05, Data_92893
	jp .asm_929e0
.asm_92999:
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, .asm_929b8
	checkevent $0047
	or a
	jp nz, .asm_929b8
	loadwilds $05, Data_928d9
	jp .asm_929e0
.asm_929b8:
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, .asm_929d8
	checkevent $0047
	cp $01
	jp nz, .asm_929d8
	loadwilds $05, Data_9291f
	jp .asm_929e0
.asm_929d8:
	loadwilds $04, Data_9285b
.asm_929e0:
	loadwilds $04, Data_9285b
	ld a, $01
	scall LoadPlayerSprite
	playmusic $08
	scall Func_8001c
	ld hl, $02e3
	scall LandmarkSign
	ret
