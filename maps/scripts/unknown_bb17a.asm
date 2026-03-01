
Data_bb0d1:
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $08, $07, $08, SFX_34
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $0f, $07, $0f, SFX_34
	warpdef $01, $08, $02, $01, MAP_06_00, $0c, $04, $0c, $05, SFX_34
	warpdef $01, $08, $02, $01, MAP_06_00, $19, $04, $19, $05, SFX_34

Data_bb0fd:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_bb101:
	dtext_tree_pointer TreeBitstreamText_46ee5
	dw -1

Data_bb105:
	dtext_tree_pointer TreeBitstreamText_46e84
	dw -1

Data_bb109:
	dtext_tree_pointer TreeBitstreamText_46ea4
	dw -1

Data_bb10d:
	db $02, $08, $04, $01, $4b

Data_bb112:
	db $31, $08, $04

Data_bb115:
	db $31, $08, $04, $00, $00

Data_bb11a:
	db $17, $08, $04, $02, $47

Data_bb11f:
	db $20, $08, $04, $02, $79

Data_bb124:
	person_event $00, $04, $08, $05, $01, $01, $02, $04, $00, Func_806dd_2e, Data_bb112

Data_bb132:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb0fd
	person_event $ff, $00, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb101
	person_event $ff, $00, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb105
	person_event $ff, $00, $04, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb109

Data_bb16a:
	map MAP_00_00
	db $08, $08

	map MAP_00_00
	db $08, $0f

	map MAP_06_00
	db $0c, $04

	map MAP_06_00
	db $19, $04

Func_bb17a:: ; bb17a
	ld c, $00
.asm_bb17c:
	ld a, c
	cp $04
	jp nc, .asm_bb1e4
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_bb0d1
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_bb1e4
.asm_bb1e0:
	inc c
	jp .asm_bb17c
.asm_bb1e4:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_bb239
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_bb239
	call Func_bb29e
	ld hl, Func_bb29e
	scall Func_80f11
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb216
	ld a, [wBackupMapY]
	cp $08
	jp nz, .asm_bb216
	ld e, $01
	ld hl, Data_bb10d
	scall Func_80ce7
	jp .asm_bb236
.asm_bb216:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb236
	ld a, [wBackupMapY]
	cp $0f
	jp nz, .asm_bb236
	ld e, $01
	ld hl, Data_bb115
	scall Func_80ce7
	loadpeople $01, Data_bb124
.asm_bb236:
	jp .asm_bb27b
.asm_bb239:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_bb27b
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_bb27b
	ld a, [wBackupMapX]
	cp $0c
	jp nz, .asm_bb263
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_bb263
	ld e, $01
	ld hl, Data_bb11a
	scall Func_80ce7
	jp .asm_bb27b
.asm_bb263:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_bb27b
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_bb27b
	ld e, $01
	ld hl, Data_bb11f
	scall Func_80ce7
.asm_bb27b:
	loadpeople $04, Data_bb132
	playmusic $11
	scall Func_8001c
	ret

Data_bb28c:
	db $02, $08, $01, $01, $00, $07

Data_bb292:
	db $02, $08, $01, $01, $00, $08

Data_bb298:
	db $03, $08, $02, $01, $01, $08

Func_bb29e:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb2c6
	ld a, [wBackupMapY]
	cp $08
	jp nz, .asm_bb2c6
	ld hl, Data_bb28c
	scall Func_80d9b
	ld hl, Data_bb292
	scall Func_80d9b
	ld hl, Data_bb298
	scall Func_80d9b
	scall Func_80f02
	jp .asm_bb2eb
.asm_bb2c6:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb2eb
	ld a, [wBackupMapY]
	cp $0f
	jp nz, .asm_bb2eb
	ld hl, Data_bb28c
	scall Func_80d9b
	ld hl, Data_bb292
	scall Func_80d9b
	ld hl, Data_bb298
	scall Func_80d9b
	scall Func_80f02
.asm_bb2eb:
	ret
