
Data_b58c8:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00,
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00,
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b590e:
	db $83, $00, $07, $02, $7c
	db $84, $06, $0d, $03, $2b
	db $85, $0b, $04, $01, $4a

Data_b591d:
	person_event $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, Func_b59d9, NULL
	person_event $ff, $00, $09, $0a, $01, $01, $00, $04, $01, Func_b5a18, NULL

Func_b5939:: ; b5939
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b58c8
	ld e, $03
	ld hl, Data_b590e
	scall Func_80ce7
	loadpeople $02, Data_b591d
	playmusic $09
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5998
	ld a, [wBackupMapNumber]
	cp $0d
	jp nz, .asm_b5998
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_b5998
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b5998
	checkevent $00fe
	or a
	jp nz, .asm_b5992
	xor a
	scall Func_80653
	call Func_b58be
	call Func_b5a57
	jp .asm_b5995
.asm_b5992:
	call Func_b58be
.asm_b5995:
	jp .asm_b59d8
.asm_b5998:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b59d5
	ld a, [wBackupMapNumber]
	cp $04
	jp nz, .asm_b59d5
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_b59d5
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b59d5
	checkevent $00fe
	or a
	jp nz, .asm_b59cf
	xor a
	scall Func_80653
	call Func_b58be
	call Func_b5a57
	jp .asm_b59d2
.asm_b59cf:
	call Func_b58be
.asm_b59d2:
	jp .asm_b59d8
.asm_b59d5:
	call Func_b58be
.asm_b59d8:
	ret

Func_b59d9:
	ld a, e
	cp $02
	jp nz, .asm_b5a17
	landmarksign TreeBitstreamText_46d96
	resetevent $00ff
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $0c
	push hl
	ld c, $0b
	ld e, $04
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b5a17:
	ret

Func_b5a18:
	ld a, e
	cp $02
	jp nz, .asm_b5a56
	landmarksign TreeBitstreamText_46d45
	resetevent $00fd
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $0a
	push hl
	ld c, $09
	ld e, $0d
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b5a56:
	ret

Func_b5a57:
	playmusic $09
	ld a, $02
	scall PlayerFace
	loademote $01, $02, $09
	playsfx $37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	script_sleep 1
	scall HideEmote
	setevent $00fe
	ret
