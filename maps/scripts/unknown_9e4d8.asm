
Data_9e3c9:
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e3d4:
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e3df:
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e

Data_9e3ea:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $28, $11, $3b, $22, $24, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $28, $11, $33, $22, $24, $34, $07, $07, $14, $11, $02, $00
ENDC

Data_9e430:
	person_event $1d, $04, $04, $0b, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $07, $0f, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $08, $07, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $0a, $0d, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $ff, $00, $07, $09, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $08, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $08, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $15, $01, $01, $00, $04, $01, NULL, NULL

Func_9e4d8:: ; 9e4d8
	ld l, $00
	push hl
	ld c, $09
	ld e, $04
	ld a, $03
	scall Func_80f24
	pop bc
	ld a, [wc794]
	or a
	jp z, .asm_9e4f7
	ld a, $01
	call Func_9e7f4
	ld hl, Func_9e7f4
	scall Func_80f11
.asm_9e4f7:
	ld a, [wBackupMapNumber]
	cp $0b
	jp nz, .asm_9e50f
	ld e, $01
	ld hl, Data_9e3c9
	scall LoadWarps
	ld a, $04
	ld [wc792], a
	jp .asm_9e585
.asm_9e50f:
	ld a, [wBackupMapNumber]
	cp $0c
	jp nz, .asm_9e527
	ld e, $01
	ld hl, Data_9e3d4
	scall LoadWarps
	ld a, $07
	ld [wc792], a
	jp .asm_9e585
.asm_9e527:
	ld a, [wBackupMapNumber]
	cp $0d
	jp nz, .asm_9e53f
	ld e, $01
	ld hl, Data_9e3df
	scall LoadWarps
	ld a, $08
	ld [wc792], a
	jp .asm_9e585
.asm_9e53f:
	ld a, [wBackupMapNumber]
	cp $11
	jp z, .asm_9e54f
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_9e585
.asm_9e54f:
	ld a, [wc792]
	cp $04
	jp nz, .asm_9e562
	ld e, $01
	ld hl, Data_9e3c9
	scall LoadWarps
	jp .asm_9e585
.asm_9e562:
	ld a, [wc792]
	cp $07
	jp nz, .asm_9e575
	ld e, $01
	ld hl, Data_9e3d4
	scall LoadWarps
	jp .asm_9e585
.asm_9e575:
	ld a, [wc792]
	cp $08
	jp nz, .asm_9e585
	ld e, $01
	ld hl, Data_9e3df
	scall LoadWarps
.asm_9e585:
	ld e, $0c
	ld hl, Data_9e430
	scall LoadMapObjects
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_9e3ea
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld a, [wc794]
	or a
	jp z, .asm_9e5d2
	ld a, [wBackupMapNumber]
	cp $11
	jp z, .asm_9e5b6
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_9e5c4
.asm_9e5b6:
	scall Func_8001c
	xor a
	call Func_9e7f4
	xor a
	ld [wc794], a
	jp .asm_9e5cf
.asm_9e5c4:
	xor a
	ld [wc794], a
	xor a
	call Func_9e7f4
	scall Func_8001c
.asm_9e5cf:
	jp .asm_9e5dd
.asm_9e5d2:
	xor a
	ld [wc794], a
	xor a
	call Func_9e7f4
	scall Func_8001c
.asm_9e5dd:
	ret

Data_9e5de:
	db $04, $07, $08, $00

Data_9e5e2:
	db $04, $07, $0a, $00

Data_9e5e6:
	db $04, $05, $0a, $00

Data_9e5ea:
	db $04, $05, $08, $0a

Data_9e5ee:
	db $04, $05, $07, $0a

Data_9e5f2:
	db $00, $00, $00, $00

Func_9e5f6:
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$09
	reg16swap de, hl
	ld hl, Data_9e5f2
	ld bc, $0004
	call MemCopy
	ld hl, sp+$02
	ld a, $ff
	ld [hl], a
	ld hl, sp+$03
	ld [hl], a
	ld hl, sp+$04
	ld [hl], a
	ld hl, sp+$05
	ld [hl], a
	ld hl, sp+$06
	ld [hl], a
	pop de
	ld a, e
	cp $03
	jp z, .asm_9e63d
	cp $01
	jp nz, .asm_9e7e5
	ld hl, sp+$0d
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_9e63a
	ld a, $01
	ld [wc7c4], a
.asm_9e63a:
	jp .asm_9e7e5
.asm_9e63d:
	ld a, [wc794]
	ld l, a
	push hl
	xor a
	ld [wc794], a
	ld hl, sp+$07
	ld [hl], $00
	ld hl, sp+$08
	ld [hl], $04
.asm_9e64e:
	ld hl, sp+$08
	ld a, [hl]
	cp $0b
	jp nc, .asm_9e6a6
	ld hl, sp+$08
	ld e, [hl]
	xor a
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp z, .asm_9e689
	ld hl, sp+$08
	ld e, [hl]
	ld a, $01
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp z, .asm_9e689
	ld hl, sp+$08
	ld e, [hl]
	ld a, $02
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp z, .asm_9e689
	ld hl, sp+$08
	ld e, [hl]
	ld a, $03
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp nz, .asm_9e69c
.asm_9e689:
	ld hl, sp+$08
	ld a, [hl]
	ld hl, sp+$07
	ld e, [hl]
	ld d, $00
	ld hl, sp+$09
	add hl, de
	ld [hl], a
	ld hl, sp+$07
	ld a, [hl]
	inc a
	ld hl, sp+$07
	ld [hl], a
.asm_9e69c:
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld hl, sp+$08
	ld [hl], a
	jp .asm_9e64e
.asm_9e6a6:
	ld hl, sp+$08
	ld [hl], $00
.asm_9e6aa:
	ld hl, sp+$08
	ld a, [hl]
	cp $04
	jp nc, .asm_9e6d1
	ld e, $0b
	ld hl, sp+$08
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp nz, .asm_9e6c7
	ld e, $00
	ld hl, sp+$08
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_9e6c7:
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld hl, sp+$08
	ld [hl], a
	jp .asm_9e6aa
.asm_9e6d1:
	ld c, $00
.asm_9e6d3:
	ld a, c
	cp $04
	jp nc, .asm_9e773
	ld hl, sp+$06
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e6f7
	ld e, c
	ld d, $00
	ld hl, Data_9e5de
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$09
	add hl, de
	cp [hl]
	jp z, .asm_9e6f7
	ld hl, sp+$06
	ld [hl], $00
.asm_9e6f7:
	ld hl, sp+$05
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e715
	ld e, c
	ld d, $00
	ld hl, Data_9e5e2
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$09
	add hl, de
	cp [hl]
	jp z, .asm_9e715
	ld hl, sp+$05
	ld [hl], $00
.asm_9e715:
	ld hl, sp+$04
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e733
	ld e, c
	ld d, $00
	ld hl, Data_9e5e6
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$09
	add hl, de
	cp [hl]
	jp z, .asm_9e733
	ld hl, sp+$04
	ld [hl], $00
.asm_9e733:
	ld hl, sp+$03
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e751
	ld e, c
	ld d, $00
	ld hl, Data_9e5ea
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$09
	add hl, de
	cp [hl]
	jp z, .asm_9e751
	ld hl, sp+$03
	ld [hl], $00
.asm_9e751:
	ld hl, sp+$02
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e76f
	ld e, c
	ld d, $00
	ld hl, Data_9e5ee
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$09
	add hl, de
	cp [hl]
	jp z, .asm_9e76f
	ld hl, sp+$02
	ld [hl], $00
.asm_9e76f:
	inc c
	jp .asm_9e6d3
.asm_9e773:
	ld hl, sp+$06
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e780
	ld a, $02
	ld [wc794], a
.asm_9e780:
	ld hl, sp+$05
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e78d
	ld a, $03
	ld [wc794], a
.asm_9e78d:
	ld hl, sp+$04
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e79a
	ld a, $05
	ld [wc794], a
.asm_9e79a:
	ld hl, sp+$03
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e7a7
	ld a, $06
	ld [wc794], a
.asm_9e7a7:
	ld hl, sp+$02
	ld a, [hl]
	cp $ff
	jp nz, .asm_9e7b4
	ld a, $09
	ld [wc794], a
.asm_9e7b4:
	pop hl
	ld a, [wc794]
	or a
	jp z, .asm_9e7da
	ld a, [wc794]
	cp l
	jp z, .asm_9e7d7
	scall StartShakingScreen
	ld hl, $0078
	scall ScriptSleep
	scall StopShakingScreen
	ld a, $01
	call Func_9e7f4
	call Func_9e88f
.asm_9e7d7:
	jp .asm_9e7e5
.asm_9e7da:
	ld a, [wc794]
	cp l
	jp z, .asm_9e7e5
	xor a
	call Func_9e7f4
.asm_9e7e5:
	add sp, $0e
	ret

Data_9e7e8:
	db $00, $01, $01, $01, $07, $02

Data_9e7ee:
	db $13, $00, $01, $01, $07, $02

Func_9e7f4:
	or a
	jp nz, .asm_9e801
	ld hl, Data_9e7e8
	scall Func_80d9b
	jp .asm_9e807
.asm_9e801:
	ld hl, Data_9e7ee
	scall Func_80d9b
.asm_9e807:
	scall Func_80f02
	ret

Data_9e80b:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e821:
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e837:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e84d:
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e863:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e

Data_9e879:
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e

Func_9e88f:
    scall AllocateSpaceForWarps
	ld a, [wc792]
	cp $04
	jp nz, .asm_9e8b8
	ld a, [wc794]
	cp $09
	jp nz, .asm_9e8ad
	ld e, $02
	ld hl, Data_9e821
	scall LoadWarps
	jp .asm_9e8b5
.asm_9e8ad:
	ld e, $02
	ld hl, Data_9e80b
	scall LoadWarps
.asm_9e8b5:
	jp .asm_9e8f9
.asm_9e8b8:
	ld a, [wc792]
	cp $07
	jp nz, .asm_9e8de
	ld a, [wc794]
	cp $09
	jp nz, .asm_9e8d3
	ld e, $02
	ld hl, Data_9e84d
	scall LoadWarps
	jp .asm_9e8db
.asm_9e8d3:
	ld e, $02
	ld hl, Data_9e837
	scall LoadWarps
.asm_9e8db:
	jp .asm_9e8f9
.asm_9e8de:
	ld a, [wc794]
	cp $09
	jp nz, .asm_9e8f1
	ld e, $02
	ld hl, Data_9e879
	scall LoadWarps
	jp .asm_9e8f9
.asm_9e8f1:
	ld e, $02
	ld hl, Data_9e863
	scall LoadWarps
.asm_9e8f9:
	ret
