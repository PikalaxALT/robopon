
Data_89a03:
	warpdef $08, $13, $04, $01, MAP_05_00, $05, $15, $05, $16, SFX_2E

Data_89a0e:
	db $1f, $01, $0a, $03, $14

Data_89a13:
IF DEF(SUN)
	wildbot $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	wildbot $00, $02, $14, $14, $1c, $08, $0a, $7f, $1f, $17, $11, $08, $09, $00
	wildbot $00, $02, $14, $14, $26, $08, $0a, $5a, $01, $00, $00, $01, $08, $00
	wildbot $00, $02, $14, $14, $07, $09, $0b, $45, $06, $06, $11, $01, $04, $00
	wildbot $00, $02, $14, $14, $03, $0a, $0c, $02, $0f, $17, $00, $02, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	wildbot $00, $02, $14, $14, $38, $08, $0a, $18, $0d, $0b, $00, $01, $09, $00
	wildbot $00, $02, $14, $14, $34, $08, $0a, $19, $17, $05, $1e, $01, $08, $00
	wildbot $00, $02, $14, $14, $3a, $09, $0b, $17, $1f, $1e, $08, $01, $04, $00
	wildbot $00, $02, $14, $14, $58, $0a, $0c, $02, $1f, $17, $11, $02, $02, $00
ENDC

MapObjects_89a59:
	person_event $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_89ac3, NULL
	person_event $ff, $00, $0a, $03, $01, $01, $00, $04, $00, Func_89b28, NULL

Func_89a75:: ; 89a75
	loadwarps $01, Data_89a03
	ld e, $01
	ld hl, Data_89a0e
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_89a13
	loadpeople $02, MapObjects_89a59
	ld a, $03
	ld [wc7e2], a
	ld a, [wBackupMapGroup]
	if_true .asm_89ab4
	ld a, [wBackupMapNumber]
	cp $02
	jp nz, .asm_89ab4
	call Func_89b79
	jp .asm_89ac2
.asm_89ab4:
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468ae
.asm_89ac2:
	ret

Func_89ac3:
	ld a, e
	if_true .asm_89b27
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89ad2
	jp .asm_89b27
.asm_89ad2:
	checkevent $0059
	cp $01
	jp nz, .asm_89ae6
	writetext TreeBitstreamText_47037
	jp .asm_89b27
.asm_89ae6:
	ld a, [wc790]
	or a
	jp z, .asm_89afe
	ld a, [wc790]
	cp $07
	jp nc, .asm_89afe
	writetext TreeBitstreamText_47037
	jp .asm_89b27
.asm_89afe:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	xor a
	scall PlayerFace
	ld l, $10
	push hl
	ld c, $09
	ld e, $15
	ld a, $05
	scall Func_80dff
	pop bc
.asm_89b27:
	ret

Func_89b28:
	ld a, e
	if_true .asm_89b78
	ld a, [wc790]
	or a
	jp z, .asm_89b45
	ld a, [wc790]
	cp $07
	jp nc, .asm_89b45
	writetext TreeBitstreamText_47041
	jp .asm_89b78
.asm_89b45:
	checkevent $0059
	if_true .asm_89b65
	setevent $0059
	playsfx $32
	writetext TreeBitstreamText_47029
	jp .asm_89b78
.asm_89b65:
	resetevent $0059
	playsfx $28
	writetext TreeBitstreamText_4701b
.asm_89b78:
	ret

Func_89b79:
	checkevent $00fc
	if_true .asm_89bc4
	playmusic SONG_TOWER
	xor a
	scall Func_80653
	ld a, $02
	scall PlayerFace
	scall Func_8001c
	landmarksign TreeBitstreamText_3d76a
	loademote $01, $02, $09
	playsfx $37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	script_sleep 1
	scall HideEmote
	setevent $00fc
	jp .asm_89bc9
.asm_89bc4:
	ld a, $01
	scall Func_80653
.asm_89bc9:
	ret
