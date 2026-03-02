
Data_af225:
	warpdef $09, $04, $01, $01, MAP_27_09, $0a, $04, $0b, $04, SFX_2E
	warpdef $04, $04, $01, $01, MAP_27_09, $05, $04, $05, $05, SFX_2E
	warpdef $04, $0e, $01, $01, MAP_27_11, $04, $15, $04, $14, SFX_2E

Data_af246:
IF DEF(SUN)
	wildbot $00, $03, $12, $1c, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $12, $1c, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $12, $1c, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $12, $1c, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $12, $1c, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $12, $1c, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_af28c:
	person_event $00, $0c, $04, $12, $01, $01, $00, $04, $00, Func_af34c, NULL

Func_af29a:: ; af29a
	set_frame_script Func_af309
	loadwarps $03, Data_af225
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_af246
	checkevent EVENT_04F
	or a
	jp nz, .asm_af2ca
	loadpeople $01, Data_af28c
.asm_af2ca
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46bea
	ret

Data_af2d9:
	db $12, $1d, $01, $01, $03, $0d

Data_af2df:
	db $12, $1d, $01, $01, $05, $0d

Data_af2e5:
	db $12, $1d, $01, $01, $03, $0f

Data_af2eb:
	db $12, $1d, $01, $01, $05, $0f

Data_af2f1:
	db $11, $1d, $01, $01, $03, $10

Data_af2f7:
	db $11, $1d, $01, $01, $05, $10

Data_af2fd:
	db $12, $1e, $01, $01, $04, $10

Data_af303:
	db $12, $1e, $01, $01, $04, $11

Func_af309:
	checkevent EVENT_04E
	cp $01
	jp nz, .asm_af347
	ld hl, Data_af2d9
	scall Func_80d9b
	ld hl, Data_af2df
	scall Func_80d9b
	ld hl, Data_af2e5
	scall Func_80d9b
	ld hl, Data_af2eb
	scall Func_80d9b
	ld hl, Data_af2f1
	scall Func_80d9b
	ld hl, Data_af2f7
	scall Func_80d9b
	ld hl, Data_af2fd
	scall Func_80d9b
	ld hl, Data_af303
	scall Func_80d9b
	scall Func_80f02
.asm_af347
	ret

Data_af348:
	db $04, $0e, $ff, $ff

Func_af34c:
	ld a, e
	or a
	jp nz, .asm_af384
	checkevent EVENT_04E
	or a
	jp nz, .asm_af364
	writenpctext TreeBitstreamText_3e99a
	jp .asm_af384
.asm_af364
	writenpctext TreeBitstreamText_3e9c4
	setevent EVENT_04F
	move_person 0, Data_af348, 1
	scall WaitNPCStep
	hideperson 0
.asm_af384
	ret
