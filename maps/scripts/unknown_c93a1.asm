
Data_c91b9:
	warpdef $09, $13, $02, $01, MAP_21_00, $17, $1a, $17, $1b, SFX_2E
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, SFX_2E

Data_c91cf:
	warpdef $09, $13, $02, $01, MAP_21_00, $0b, $1a, $0b, $1b, SFX_2E
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, SFX_2E

Data_c91e5:
	warpdef $09, $13, $02, $01, MAP_21_00, $1d, $11, $1d, $12, SFX_2E
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, SFX_2E

Data_c91fb:
	warpdef $09, $13, $02, $01, MAP_21_00, $05, $11, $05, $12, SFX_2E
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, SFX_2E

Data_c9211:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $09, $11, $0a, SFX_2E
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, SFX_2E

Data_c9227:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $16, $18, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $16, $18, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c926d:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c92b3:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ENDC

Data_c92f9:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c933f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0f, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c9385:
	person_event $09, $04, $09, $0f, $01, $01, $02, $04, $00, Func_c9614, NULL
	person_event $ff, $00, $0a, $0f, $01, $01, $00, $04, $01, Func_c95da, NULL

Func_c93a1:: ; c93a1
	ld a, [wBackupMapGroup]
	cp $15
	jp nz, .asm_c9424
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_c9424
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_c93c8
	ld a, [wBackupMapY]
	cp $09
	jp nz, .asm_c93c8
	ld a, $04
	ld [wc78b], a
	jp .asm_c9424
.asm_c93c8:
	ld a, [wBackupMapX]
	cp $05
	jp nz, .asm_c93e0
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_c93e0
	ld a, $03
	ld [wc78b], a
	jp .asm_c9424
.asm_c93e0:
	ld a, [wBackupMapX]
	cp $1d
	jp nz, .asm_c93f8
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_c93f8
	ld a, $02
	ld [wc78b], a
	jp .asm_c9424
.asm_c93f8:
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_c9410
	ld a, [wBackupMapY]
	cp $1a
	jp nz, .asm_c9410
	ld a, $01
	ld [wc78b], a
	jp .asm_c9424
.asm_c9410:
	ld a, [wBackupMapX]
	cp $17
	jp nz, .asm_c9424
	ld a, [wBackupMapY]
	cp $1a
	jp nz, .asm_c9424
	xor a
	ld [wc78b], a
.asm_c9424:
	loadpeople $02, Data_c9385
	ld a, [wc78b]
	cp $04
	jp z, .asm_c94df
	cp $03
	jp z, .asm_c94b9
	cp $02
	jp z, .asm_c9493
	cp $01
	jp z, .asm_c946d
	or a
	jp nz, .asm_c9502
	loadwarps $02, Data_c91b9
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_c9227
	playmusic $09
	scall Func_8001c
	landmarksign TreeBitstreamText_46986
	jp .asm_c9502
.asm_c946d:
	loadwarps $02, Data_c91cf
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_c926d
	playmusic $0e
	scall Func_8001c
	landmarksign TreeBitstreamText_46a3e
	jp .asm_c9502
.asm_c9493:
	loadwarps $02, Data_c91e5
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_c92b3
	playmusic $0d
	scall Func_8001c
	landmarksign TreeBitstreamText_469fd
	jp .asm_c9502
.asm_c94b9:
	loadwarps $02, Data_c91fb
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_c92f9
	playmusic $0f
	scall Func_8001c
	landmarksign TreeBitstreamText_469c1
	jp .asm_c9502
.asm_c94df:
	loadwarps $02, Data_c9211
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_c933f
	playmusic $10
	scall Func_8001c
	landmarksign TreeBitstreamText_46a7f
.asm_c9502:
	ret

Func_c9503:
	ld a, [wc78b]
	cp $04
	jp z, .asm_c95b2
	cp $03
	jp z, .asm_c958d
	cp $02
	jp z, .asm_c9568
	cp $01
	jp z, .asm_c9543
	or a
	jp nz, .asm_c95d4
	checkevent $0095
	cp $01
	jp nz, .asm_c952e
	ld l, $02
	jp .asm_c9540
.asm_c952e:
	checkevent $003d
	cp $01
	jp nz, .asm_c953e
	ld l, $00
	jp .asm_c9540
.asm_c953e:
	ld l, $01
.asm_c9540:
	jp .asm_c95d4
.asm_c9543:
	checkevent $009a
	cp $01
	jp nz, .asm_c9553
	ld l, $02
	jp .asm_c9565
.asm_c9553:
	checkevent $003e
	cp $01
	jp nz, .asm_c9563
	ld l, $00
	jp .asm_c9565
.asm_c9563:
	ld l, $01
.asm_c9565:
	jp .asm_c95d4
.asm_c9568:
	checkevent $009f
	cp $01
	jp nz, .asm_c9578
	ld l, $02
	jp .asm_c958a
.asm_c9578:
	checkevent $003f
	cp $01
	jp nz, .asm_c9588
	ld l, $00
	jp .asm_c958a
.asm_c9588:
	ld l, $01
.asm_c958a:
	jp .asm_c95d4
.asm_c958d:
	checkevent $00a4
	cp $01
	jp nz, .asm_c959d
	ld l, $02
	jp .asm_c95af
.asm_c959d:
	checkevent $0040
	cp $01
	jp nz, .asm_c95ad
	ld l, $00
	jp .asm_c95af
.asm_c95ad:
	ld l, $01
.asm_c95af:
	jp .asm_c95d4
.asm_c95b2:
	checkevent $00a9
	cp $01
	jp nz, .asm_c95c2
	ld l, $02
	jp .asm_c95d4
.asm_c95c2:
	checkevent $0041
	cp $01
	jp nz, .asm_c95d2
	ld l, $00
	jp .asm_c95d4
.asm_c95d2:
	ld l, $01
.asm_c95d4:
	ld a, l
	ret

Data_c95d6:
	db $0a, $10, $ff, $ff

Func_c95da:
	push de
	ld a, $ff
	call Func_c9503
	pop de
	cp $01
	jp nz, .asm_c9613
	ld a, e
	cp $02
	jp nz, .asm_c9613
	sprite_face $01, 0
	script_sleep 30
	ld a, $03
	scall PlayerFace
	writetext TreeBitstreamText_3c983
	move_player $01, Data_c95d6
	sprite_face $02, 0
.asm_c9613:
	ret

Func_c9614:
	push af
	push de
	ld a, $ff
	call Func_c9503
	ld l, a
	pop de
	ld a, e
	or a
	jp nz, .asm_c9651
	push hl
	face_player -$03
	pop hl
	ld a, l
	cp $02
	jp z, .asm_c964b
	cp $01
	jp z, .asm_c9642
	or a
	jp nz, .asm_c9651
	writetext TreeBitstreamText_3c973
	jp .asm_c9651
.asm_c9642:
	writetext TreeBitstreamText_3c983
	jp .asm_c9651
.asm_c964b:
	writetext TreeBitstreamText_3d897
.asm_c9651:
	pop bc
	ret
