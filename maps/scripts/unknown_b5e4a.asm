
Data_b5de0:
	warpdef $0d, $0f, $02, $01, MAP_26_00, $07, $05, $07, $06, SFX_2E
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b5df6:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3d, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $4b, $2a, $2d, $26, $0e, $08, $14, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $7d, $2b, $2e, $11, $06, $08, $11, $13, $08, $00
	wildbot $00, $02, $0f, $0e, $4f, $2c, $2f, $26, $06, $07, $00, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04, $04, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $70, $2b, $2e, $53, $01, $10, $00, $10, $08, $00
	wildbot $00, $02, $0f, $0e, $85, $2c, $2f, $7b, $14, $0d, $1f, $11, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01, $02, $00, $13, $06, $00
ENDC

Data_b5e3c:
	person_event $ff, $00, $09, $0a, $01, $01, $00, $04, $01, Func_b5ec4, NULL

Func_b5e4a:: ; b5e4a
	loadwarps $02, Data_b5de0
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b5df6
	loadpeople $01, Data_b5e3c
	playmusic SONG_TOWER
	ld a, $0f
	ld [wc7e2], a
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5eba
	ld a, [wBackupMapNumber]
	cp $08
	jp nz, .asm_b5eba
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_b5eba
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b5eba
	checkevent $00fd
	or a
	jp nz, .asm_b5eae
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46b1a
	call Func_b5f03
	jp .asm_b5eb7
.asm_b5eae:
	scall Func_8001c
	landmarksign TreeBitstreamText_46b1a
.asm_b5eb7:
	jp .asm_b5ec3
.asm_b5eba:
	scall Func_8001c
	landmarksign TreeBitstreamText_46b1a
.asm_b5ec3:
	ret

Func_b5ec4:
	ld a, e
	cp $02
	jp nz, .asm_b5f02
	landmarksign TreeBitstreamText_46d3b
	resetevent $00fe
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	warp_player MAP_30_08, $09, $0a
	pop bc
.asm_b5f02:
	ret

Func_b5f03:
	playmusic SONG_TOWER
	ld a, $02
	scall PlayerFace
	loademote $01, $02, $09
	playsfx SFX_37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	script_sleep 1
	scall HideEmote
	setevent $00fd
	ret
