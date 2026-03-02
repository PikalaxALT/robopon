
Data_89dfd:
	warpdef $08, $13, $04, $01, MAP_05_00, $10, $06, $10, $07, SFX_34
	warpdef $01, $0a, $01, $01, MAP_05_31, $01, $0a, $02, $0a, SFX_2E
	warpdef $12, $0a, $01, $01, MAP_05_31, $12, $0a, $11, $0a, SFX_2E

Data_89e1e:
	db $1e, $0b, $0f, $03, $13

Data_89e23:
IF DEF(SUN)
	wildbot $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00
	wildbot $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00
	wildbot $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00
	wildbot $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $09, $04, $00
	wildbot $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00
	wildbot $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00
	wildbot $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00
	wildbot $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00
	wildbot $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00
ENDC

Data_89e69:
	person_event $03, $04, $08, $05, $01, $01, $00, $04, $00, Func_89f1e, NULL
	person_event $05, $04, $09, $05, $01, $01, $00, $04, $00, Func_89fa8, NULL
	person_event $01, $04, $0a, $05, $01, $01, $00, $04, $00, Func_8a031, NULL
	person_event $07, $04, $0b, $05, $01, $01, $00, $04, $00, Func_8a0b7, NULL

Data_89ea1:
	person_event $ff, $00, $07, $03, $06, $01, $00, $04, $00, Func_8a115, NULL

Func_89eaf:: ; 89eaf
	loadwarps $03, Data_89dfd
	ld e, $01
	ld hl, Data_89e1e
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_89e23
	checkevent EVENT_01F
	or a
	jp nz, .asm_89ede
	loadpeople $04, Data_89e69
.asm_89ede:
	loadpeople $01, Data_89ea1
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468c8
	ret

Data_89ef5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $04, $01, $08, $01, $06
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $45, $01, $08, $14, $14
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_89f1e:	push af
	ld a, e
	or a
	jp nz, .asm_89f74
	face_player -$01
	checkevent EVENT_076
	or a
	jp nz, .asm_89f6e
	writetext TreeBitstreamText_4297c
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_89f65
	startbattle Data_89f76, Data_89ef5
	or a
	jp nz, .asm_89f54
	jp .asm_89f74
.asm_89f54:
	setevent EVENT_076
	writetext TreeBitstreamText_4298a
	jp .asm_89f6b
.asm_89f65:
	writetext TreeBitstreamText_429ca
.asm_89f6b:
	jp .asm_89f74
.asm_89f6e:
	writetext TreeBitstreamText_429dc
.asm_89f74:
	pop bc
	ret

Data_89f76:
	dstr "(よひﾞくﾞん)"

Data_89f7f:
	db $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $34, $01, $34, $01, $08, $17, $12
	db $11, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_89fa8:
	push af
	ld a, e
	or a
	jp nz, .asm_89ffe
	face_player -$01
	checkevent EVENT_077
	or a
	jp nz, .asm_89ff8
	writetext TreeBitstreamText_42998
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_89fef
	startbattle Data_8a000, Data_89f7f
	or a
	jp nz, .asm_89fde
	jp .asm_89ffe
.asm_89fde:
	setevent EVENT_077
	writetext TreeBitstreamText_429a1
	jp .asm_89ff5
.asm_89fef:
	writetext TreeBitstreamText_429d1
.asm_89ff5:
	jp .asm_89ffe
.asm_89ff8:
	writetext TreeBitstreamText_42937
.asm_89ffe:
	pop bc
	ret

Data_8a000:
	dstr "ハﾞア(さん)"

Data_8a008:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $0a, $01, $17, $01, $08, $1f, $07
	db $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a031:
	push af
	ld a, e
	or a
	jp nz, .asm_8a087
	face_player -$01
	checkevent EVENT_078
	or a
	jp nz, .asm_8a081
	writetext TreeBitstreamText_429aa
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a078
	startbattle Data_8a089, Data_8a008
	or a
	jp nz, .asm_8a067
	jp .asm_8a087
.asm_8a067:
	setevent EVENT_078
	writetext TreeBitstreamText_429b8
	jp .asm_8a07e
.asm_8a078:
	writetext TreeBitstreamText_429d1
.asm_8a07e:
	jp .asm_8a087
.asm_8a081:
	writetext TreeBitstreamText_4290f
.asm_8a087:
	pop bc
	ret

Data_8a089:
	dstr "ロッカー"

Data_8a08e:
	db $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $51, $01, $51, $01, $08, $17, $17
	db $17, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a0b7:
	push af
	ld a, e
	or a
	jp nz, .asm_8a10d
	face_player -$01
	checkevent EVENT_079
	or a
	jp nz, .asm_8a107
	writetext TreeBitstreamText_42972
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a0fe
	startbattle Data_8a10f, Data_8a08e
	or a
	jp nz, .asm_8a0ed
	jp .asm_8a10d
.asm_8a0ed:
	setevent EVENT_079
	writetext TreeBitstreamText_42972
	jp .asm_8a104
.asm_8a0fe:
	writetext TreeBitstreamText_42972
.asm_8a104:
	jp .asm_8a10d
.asm_8a107:
	writetext TreeBitstreamText_42972
.asm_8a10d:
	pop bc
	ret

Data_8a10f:
	dstr "オハﾞサン"

Func_8a115:
	ld a, e
	or a
	jp nz, .asm_8a12f
	ld a, [wc790]
	or a
	jp z, .asm_8a129
	ld a, [wc790]
	cp $07
	jp nz, .asm_8a12f
.asm_8a129:
	writetext TreeBitstreamText_4706a
.asm_8a12f:
	ret
