
Data_d2793: ; d2793
	warpdef $10, $0d, $01, $01, MAP_29_01, $06, $04, $07, $04, SFX_2E

Data_d279e: ; d279e
	warpdef $01, $10, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $01, $10, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $0d, $13, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $0d, $13, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $0d, $13, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $0d, $13, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E
	warpdef $13, $07, $01, $01, MAP_29_10, $0a, $10, $0a, $0f, SFX_2E
	warpdef $13, $07, $01, $01, MAP_29_11, $0a, $10, $0a, $0f, SFX_2E
	warpdef $13, $07, $01, $01, MAP_29_12, $04, $0e, $05, $0e, SFX_2E
	warpdef $13, $07, $01, $01, MAP_29_13, $0a, $0d, $0b, $0d, SFX_2E

Data_d2822: ; d2822
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $09, $0a, $0e, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $34, $0a, $0e, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $2b, $0a, $0e, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $18, $0a, $0e, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $05, $0a, $0e, $2e, $01, $06, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $0c, $0a, $0e, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $26, $0a, $0e, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $11, $0a, $0e, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $1c, $0a, $0e, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $46, $0a, $0e, $78, $14, $14, $00, $0c, $0a, $00
ENDC

Data_d2868: ; d2868
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $2b, $0c, $10, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $18, $0c, $10, $18, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $05, $0c, $10, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $23, $0c, $10, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $43, $0c, $10, $77, $06, $07, $00, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $11, $0c, $10, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $1c, $0c, $10, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $46, $0c, $10, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $25, $0c, $10, $79, $18, $18, $00, $0d, $06, $00
	wildbot $00, $03, $1d, $16, $40, $0c, $10, $78, $02, $09, $00, $03, $0a, $00
ENDC

Data_d28ae: ; d28ae
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $05, $0e, $12, $2e, $01, $06, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $23, $0e, $12, $50, $1e, $1e, $00, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $43, $0e, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $1c, $0e, $12, $77, $1f, $17, $11, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $11, $0e, $12, $02, $1f, $1e, $18, $0c, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $46, $0e, $12, $78, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $25, $0e, $12, $79, $18, $18, $00, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $40, $0e, $12, $78, $02, $09, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $18, $0e, $12, $17, $1f, $07, $18, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $2b, $0e, $12, $77, $06, $06, $00, $03, $0a, $00
ENDC

Data_d28f4: ; d28f4
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $11, $10, $14, $02, $1f, $1e, $18, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $26, $10, $14, $5b, $01, $00, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $69, $10, $14, $77, $05, $0f, $00, $0d, $0a, $00
	wildbot $00, $03, $1d, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $2b, $10, $14, $77, $06, $06, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $34, $10, $14, $18, $17, $05, $1e, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $09, $10, $14, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $03, $1d, $16, $66, $10, $14, $7b, $06, $09, $00, $0c, $0a, $00
	wildbot $00, $03, $1d, $16, $0c, $10, $14, $77, $05, $19, $00, $03, $0a, $00
ENDC

Func_d293a:: ; d293a (34:693a)
	ld l, $0
	push hl
	ld c, $c
	ld e, $5
	ld a, $3
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $b
	ld e, $5
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $e
	ld e, $b
	ld a, $9
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $9
	ld e, $11
	ld a, $6
	scall Func_80f24
	pop bc
	ld l, $0
	push hl
	ld c, $8
	ld e, $11
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $f
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $5
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $8
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $e
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $6
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $12
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $3
	ld e, $c
	ld a, $16
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $9
	ld e, $9
	ld a, $19
	scall Func_80f24
	pop bc
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_d2a06
	ld a, $3
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_d2a06: ; d2a06 (34:6a06)
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d2a16
	setevent $5d
.asm_d2a16: ; d2a16 (34:6a16)
	ld a, $3
	scall Func_80d01
	ld a, [wc7de]
	cp $f
	jp z, .asm_d2a7f
	cp $e
	jp z, .asm_d2a7f
	cp $d
	jp z, .asm_d2a7f
	cp $c
	jp z, .asm_d2a7f
	cp $b
	jp z, .asm_d2a7f
	cp $a
	jp z, .asm_d2a74
	cp $9
	jp z, .asm_d2a74
	cp $8
	jp z, .asm_d2a74
	cp $7
	jp z, .asm_d2a74
	cp $6
	jp z, .asm_d2a74
	cp $5
	jp z, .asm_d2a69
	cp $4
	jp z, .asm_d2a69
	cp $3
	jp z, .asm_d2a69
	cp $2
	jp z, .asm_d2a69
	cp $1
	jp nz, .asm_d2a8a
.asm_d2a69: ; d2a69 (34:6a69)
	loadwilds $5, Data_d2822
	jp .asm_d2a92

.asm_d2a74: ; d2a74 (34:6a74)
	loadwilds $5, Data_d2868
	jp .asm_d2a92

.asm_d2a7f: ; d2a7f (34:6a7f)
	loadwilds $5, Data_d28ae
	jp .asm_d2a92

.asm_d2a8a: ; d2a8a (34:6a8a)
	loadwilds $5, Data_d28f4
.asm_d2a92: ; d2a92 (34:6a92)
	ld a, [wc7de]
	inc a
	cp $15
	jp nc, .asm_d2ad2
	set_frame_script Func_d2b0f
	ld a, $4
	scall Random
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d279e
	add hl, de
	pop de
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d2ad2: ; d2ad2 (34:6ad2)
	loadwarps $1, Data_d2793
	playmusic SONG_CAVE
	scall Func_8001c
	ld a, [wc7de]
	cp $14
	jp nz, .asm_d2af3
	writetext TreeBitstreamText_47e17
	jp .asm_d2afc

.asm_d2af3: ; d2af3 (34:6af3)
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	scall Func_80f83
.asm_d2afc: ; d2afc (34:6afc)
	ret

Data_d2afd:
	db $1b, $00, $01, $01, $01, $10
	db $1b, $00, $01, $01, $0d, $13
	db $1b, $00, $01, $01, $13, $07

Func_d2b0f: ; d2b0f (34:6b0f)
	ld hl, wc7dd
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_d2afd
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret
