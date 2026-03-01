
Data_9e27e:
	warpdef $03, $0e, $03, $01, MAP_18_15, $07, $02, $07, $03, SFX_2E

Data_9e289:
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

Data_9e2c1:
	person_event $ff, $00, $02, $04, $05, $04, $00, $04, $00, Func_9e305, NULL

Func_9e2cf:: ; 9e2cf
	ld e, $01
	ld hl, Data_9e27e
	scall LoadWarps
	ld e, $01
	ld hl, Data_9e2c1
	scall LoadMapObjects
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9e289
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Data_9e2f5:
	db $07, $08, $04, $08, $ff, $ff

Data_9e2fb:
	db $04, $08, $ff, $ff

Data_9e2ff:
	db $01, $08, $04, $08, $ff, $ff

Func_9e305:
	ld a, e
	or a
	jp nz, .asm_9e3c8
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9e332
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9e332
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9e332
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_9e3c2
.asm_9e332:
	ld a, [wc790]
	or a
	jp z, .asm_9e3b9
	ld a, [wc790]
	cp $06
	jp nc, .asm_9e3b9
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_9e3b6
	ld a, [wPlayerFacing]
	cp $01
	jp z, .asm_9e364
	or a
	jp nz, .asm_9e371
	ld c, $01
	ld de, Data_9e2fb
	ld a, $27
	scall MovePlayer
	jp .asm_9e37b
.asm_9e364:
	ld c, $01
	ld de, Data_9e2ff
	ld a, $27
	scall MovePlayer
	jp .asm_9e37b
.asm_9e371:
	ld c, $01
	ld de, Data_9e2f5
	ld a, $27
	scall MovePlayer
.asm_9e37b:
	scall WaitNPCStep
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	ld a, $44
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $03
	scall PlayerFace
	ld l, $09
	push hl
	ld c, $07
	ld e, $11
	ld a, $12
	scall Func_80dff
	pop bc
.asm_9e3b6:
	jp .asm_9e3bf
.asm_9e3b9:
	ld hl, $0377
	scall PrintTextStandard
.asm_9e3bf:
	jp .asm_9e3c8
.asm_9e3c2:
	ld hl, $0376
	scall PrintTextStandard
.asm_9e3c8:
	ret
