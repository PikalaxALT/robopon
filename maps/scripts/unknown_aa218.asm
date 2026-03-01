
Data_aa1a2:
	warpdef $08, $05, $02, $01, MAP_25_20, $0f, $1c, $0f, $1b, $2e
	warpdef $08, $15, $02, $01, MAP_25_01, $0c, $05, $0c, $06, $2e
	warpdef $05, $12, $01, $01, MAP_25_04, $09, $04, $09, $05, $2e
	warpdef $0c, $12, $01, $01, MAP_25_05, $01, $04, $01, $05, $2e

Data_aa1ce:
	dw $2b3
	dw -1

Data_aa1d2:
	person_event $09, $0c, $07, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $0a, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $07, $09, $04, $01, $00, $04, $01, Func_aa277, NULL

Data_aa1fc:
	person_event $ff, $00, $07, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce
	person_event $ff, $00, $0a, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce

Func_aa218:: ; aa218
	ld a, $09
	ld [wc789], a
	ld a, $0d
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_aa1a2
	scall LoadWarps
	ld hl, $00b7
	scall CheckEventFlag
	or a
	jp nz, .asm_aa23c
	ld e, $03
	ld hl, Data_aa1d2
	scall LoadMapObjects
.asm_aa23c:
	ld e, $02
	ld hl, Data_aa1fc
	scall LoadMapObjects
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa261
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aa261
	ld a, $04
	scall PlayMusic
	jp .asm_aa266
.asm_aa261:
	ld a, $12
	scall PlayMusic
.asm_aa266:
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_aa26f:
	db $08, $07, $ff, $ff

Data_aa273:
	db $09, $07, $ff, $ff

Func_aa277:
	push de
	ld hl, $00b7
	scall CheckEventFlag
	or a
	jp nz, .asm_aa2f2
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_aa2f2
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld c, $01
	ld de, Data_aa26f
	ld a, $2a
	scall MovePlayer
	ld e, $01
	xor a
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	ld e, $00
	ld hl, $00f7
	scall EventFlagAction
	call Func_aa321
	ld hl, $00f7
	scall CheckEventFlag
	or a
	jp z, .asm_aa2c0
	jp .asm_aa2f2
.asm_aa2c0:
	ld bc, Data_aa273
	ld e, $2a
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld e, $00
	ld hl, $00f7
	scall EventFlagAction
	call Func_aa392
	ld hl, $00f7
	scall CheckEventFlag
	or a
	jp z, .asm_aa2ea
	jp .asm_aa2f2
.asm_aa2ea:
	ld e, $01
	ld hl, $00b7
	scall EventFlagAction
.asm_aa2f2:
	pop bc
	ret

Data_aa2f4:
	db $07, $0f, $ff, $ff

Data_aa2f8:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $02, $06, $2a, $0f, $17
	db $00, $6f, $2d, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $57, $06, $2a, $0f, $17
	db $00, $6f, $5a, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_aa321:
	ld hl, $010b
	scall PrintTextStandard
	ld de, Data_aa35f
	ld hl, Data_aa2f8
	scall ScriptedBattle
	or a
	jp nz, Func_aa33d
	ld e, $01
	ld hl, $00f7
	scall EventFlagAction
	ret

Func_aa33d:
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld hl, $010f
	scall PrintTextStandard
	ld bc, Data_aa2f4
	ld e, $2a
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ret

Data_aa35f:
	dstr "(へいし)"

Data_aa365:
	db $09, $0f, $ff, $ff

Data_aa369:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $7d, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $14, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_aa392:
	ld hl, $010d
	scall PrintTextStandard
	ld de, Data_aa3d2
	ld hl, Data_aa369
	scall ScriptedBattle
	or a
	jp nz, .asm_aa3ae
	ld e, $01
	ld hl, $00f7
	scall EventFlagAction
	ret
.asm_aa3ae:
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld hl, $010f
	scall PrintTextStandard
	ld bc, Data_aa365
	ld e, $2a
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ret

Data_aa3d2:
	dstr "(へいし)"
