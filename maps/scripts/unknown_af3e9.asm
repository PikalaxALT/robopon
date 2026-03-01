
Data_af385:
	warpdef $04, $15, $01, $01, MAP_27_10, $04, $0e, $04, $0f, SFX_2E

Data_af390:
	db $00, $04, $07, $01, $15

Data_af395:
IF DEF(SUN)
	wildbot $00, $03, $09, $17, $48, $30, $33, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $09, $17, $49, $30, $33, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $09, $17, $89, $35, $38, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $09, $17, $49, $30, $33, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $09, $17, $48, $30, $33, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $09, $17, $86, $35, $38, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_af3bf:
	person_event $ff, $00, $03, $0b, $03, $01, $00, $04, $01, Func_af46a, NULL
	person_event $00, $04, $04, $08, $01, $01, $02, $04, $00, Func_af4c3, NULL

Data_af3db:
	person_event $00, $04, $04, $08, $01, $01, $02, $04, $00, Func_af4c3, NULL

Func_af3e9:: ; af3e9
	loadwarps $01, Data_af385
	ld e, $01
	ld hl, Data_af390
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_af395
	checkevent $0050
	or a
	jp nz, .asm_af41b
	loadpeople $02, Data_af3bf
	jp .asm_af432
.asm_af41b:
	loadpeople $02, Data_af3bf
	hideperson $01
	loadpeople $01, Data_af3db
.asm_af432:
	playmusic $08
	scall Func_8001c
	landmarksign TreeBitstreamText_46bf5
	ret

Data_af441:
IF DEF(SUN)
	db $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $a9, $07, $41, $1d, $1d, $1d, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09
ELIF DEF(STAR)
	db $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $aa, $07, $41, $1a, $1a, $1a, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09
ENDC

Func_af46a:
	ld a, e
	cp $02
	jp nz, .asm_af4bd
	checkevent $0050
	or a
	jp nz, .asm_af4a1
	writenpctext TreeBitstreamText_3e9e1
	startbattle Data_af4be, Data_af441
	or a
	jp nz, .asm_af490
	jp .asm_af4bd
.asm_af490:
	setevent $0050
	writenpctext TreeBitstreamText_3ea2f
	jp .asm_af4bd
.asm_af4a1:
	writenpctext_yesorno TreeBitstreamText_3ea97
	or a
	jp nz, .asm_af4bd
	playsfx $5a
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af4bd:
	ret

Data_af4be:
	db $ca, $dd, $c0, $b0, $00

Func_af4c3:
	push af
	ld a, e
	or a
	jp nz, .asm_af537
	face_player -$01
	checkevent $0048
	or a
	jp nz, .asm_af505
	ld a, $15
	scall Func_80e5d
	or a
	jp z, .asm_af4fc
	writenpctext_yesorno TreeBitstreamText_3ea97
	or a
	jp nz, .asm_af4f9
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af4f9:
	jp .asm_af502
.asm_af4fc:
	writenpctext TreeBitstreamText_3ea2f
.asm_af502:
	jp .asm_af537
.asm_af505:
	checkevent $0100
	or a
	jp nz, .asm_af520
	writenpctext TreeBitstreamText_3eab5
	setevent $0100
	jp .asm_af537
.asm_af520:
	writenpctext_yesorno TreeBitstreamText_3ea97
	or a
	jp nz, .asm_af537
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af537:
	pop bc
	ret
