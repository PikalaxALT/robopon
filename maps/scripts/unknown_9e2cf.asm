
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
	loadwarps $01, Data_9e27e
	loadpeople $01, Data_9e2c1
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_9e289
	playmusic SONG_CAVE
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
.asm_9e332
	ld a, [wc790]
	or a
	jp z, .asm_9e3b9
	ld a, [wc790]
	cp $06
	jp nc, .asm_9e3b9
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, .asm_9e3b6
	ld a, [wPlayerFacing]
	cp $01
	jp z, .asm_9e364
	or a
	jp nz, .asm_9e371
	move_player $01, Data_9e2fb
	jp .asm_9e37b
.asm_9e364
	move_player $01, Data_9e2ff
	jp .asm_9e37b
.asm_9e371
	move_player $01, Data_9e2f5
.asm_9e37b
	scall WaitNPCStep
	playmusic SONG_NONE
	playmusic SONG_0A
	xor a
	scall Func_80653
	loademote $01, $01, $0b
	playsfx SFX_44
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $03
	scall PlayerFace
	warp_player MAP_18_17, $07, $09
.asm_9e3b6
	jp .asm_9e3bf
.asm_9e3b9
	writetext TreeBitstreamText_470f0
.asm_9e3bf
	jp .asm_9e3c8
.asm_9e3c2
	writetext TreeBitstreamText_470d8
.asm_9e3c8
	ret
