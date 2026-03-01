
Data_a365b:
	warpdef $0b, $11, $01, $01, MAP_19_32, $0b, $0c, $0a, $0c, SFX_2E
	warpdef $01, $04, $01, $01, MAP_19_37, $01, $0d, $02, $0d, SFX_2E
	warpdef $03, $17, $03, $01, MAP_09_00, $0b, $21, $0b, $22, SFX_2E

Data_a367c:
IF DEF(SUN)
	wildbot $03, $0d, $0a, $0a, $5f, $12, $14, $77, $05, $06, $00, $03, $0a, $00
	wildbot $03, $0d, $0a, $0a, $50, $12, $14, $77, $14, $14, $00, $0c, $09, $00
	wildbot $03, $0d, $0a, $0a, $34, $13, $15, $17, $17, $05, $1e, $03, $08, $00
	wildbot $00, $03, $09, $08, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $09, $08, $34, $16, $18, $17, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $09, $08, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $09, $08, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $03, $0d, $0a, $0a, $50, $12, $14, $77, $14, $14, $00, $0c, $09, $00
	wildbot $03, $0d, $0a, $0a, $57, $12, $14, $46, $1f, $17, $11, $0d, $04, $00
	wildbot $03, $0d, $0a, $0a, $26, $13, $15, $5b, $01, $00, $00, $03, $08, $00
	wildbot $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $09, $08, $57, $15, $17, $46, $1f, $17, $11, $0f, $04, $00
	wildbot $00, $03, $09, $08, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $09, $08, $5f, $16, $18, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $09, $08, $2a, $17, $19, $10, $05, $05, $05, $04, $0a, $00
ENDC

Func_a36ec:: ; a36ec
	call Func_a3730
	ld hl, Func_a3730
	scall Func_80f11
	loadwarps $03, Data_a365b
	ld a, $03
	scall Func_80d01
	loadwilds $08, Data_a367c
	ld a, $01
	scall LoadPlayerSprite
	playmusic $08
	scall Func_8001c
	ld hl, $02a9
	scall LandmarkSign
	ret

Data_a371e:
	db $0a, $0b, $03, $01, $03, $0c

Data_a3724:
	db $0a, $0b, $03, $01, $03, $0b

Data_a372a:
	db $0a, $0b, $03, $01, $03, $0a

Func_a3730:
	checkevent $00d1
	cp $01
	jp z, .asm_a3751
	checkevent $00d2
	cp $01
	jp z, .asm_a3751
	checkevent $00d3
	cp $01
	jp nz, .asm_a3787
.asm_a3751:
	checkevent $00d1
	cp $01
	jp nz, .asm_a3762
	ld hl, Data_a371e
	scall Func_80d9b
.asm_a3762:
	checkevent $00d2
	cp $01
	jp nz, .asm_a3773
	ld hl, Data_a3724
	scall Func_80d9b
.asm_a3773:
	checkevent $00d3
	cp $01
	jp nz, .asm_a3784
	ld hl, Data_a372a
	scall Func_80d9b
.asm_a3784:
	scall Func_80f02
.asm_a3787:
	ret
