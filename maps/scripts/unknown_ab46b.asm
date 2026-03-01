
Data_ab3d1:
	warpdef $01, $04, $01, $01, MAP_25_00, $0c, $12, $0b, $12, $2e
	warpdef $01, $18, $01, $01, MAP_25_03, $11, $04, $10, $04, $2e

Data_ab3e7:
	db $40, $09, $08, $01, $0f
	db $41, $09, $0c, $01, $36
	db $42, $0a, $09, $01, $4a
	db $43, $0a, $0b, $01, $42

Data_ab3fb:
IF DEF(SUN)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_ab433:
	person_event $09, $0c, $00, $0e, $01, $01, $01, $04, $00, Func_ab51a, NULL
	person_event $ff, $00, $01, $0e, $02, $01, $00, $04, $01, Func_ab51a, NULL
	person_event $09, $0c, $00, $0c, $01, $01, $01, $04, $00, Func_ab5f4, NULL
	person_event $ff, $00, $01, $0c, $02, $01, $00, $04, $01, Func_ab5f4, NULL

Func_ab46b:: ; ab46b
	ld e, $02
	ld hl, Data_ab3d1
	scall LoadWarps
	ld e, $04
	ld hl, Data_ab3e7
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_ab3fb
	scall LoadEncounters
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab4dc
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab4dc
	ld e, $04
	ld hl, Data_ab433
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b5
	scall CheckEventFlag
	or a
	jp z, .asm_ab4c1
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_ab4c1:
	ld hl, $00b6
	scall CheckEventFlag
	or a
	jp z, .asm_ab4d9
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_ab4d9:
	jp .asm_ab4e1
.asm_ab4dc:
	ld a, $08
	scall PlayMusic
.asm_ab4e1:
	scall Func_8001c
	ret

Data_ab4e5:
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $09, $01, $09, $06, $29, $04, $0f, $00, $05, $0c, $06, $29, $01
	db $05, $00, $05, $3c, $06, $29, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c

Data_ab50e:
	db $01, $0e, $ff, $ff

Data_ab512:
	db $01, $14, $ff, $ff

Data_ab516:
	db $00, $14, $ff, $ff

Func_ab51a:
	push de
	ld hl, $00b5
	scall CheckEventFlag
	or a
	jp nz, .asm_ab5b7
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab531
	or a
	jp nz, .asm_ab5b7
.asm_ab531:
	ld a, [wMapX]
	add a, $05
	or a
	jp nz, .asm_ab541
	xor a
	scall FacePlayer
	jp .asm_ab550
.asm_ab541:
	ld c, $01
	ld de, Data_ab50e
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab550:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010c
	scall PrintTextStandard
	ld de, Data_ab5b9
	ld hl, Data_ab4e5
	scall ScriptedBattle
	or a
	jp nz, .asm_ab56f
	jp .asm_ab5b7
.asm_ab56f:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab581
	or a
	jp nz, .asm_ab58d
.asm_ab581:
	ld bc, Data_ab512
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_ab596
.asm_ab58d:
	ld bc, Data_ab516
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_ab596:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b5
	scall EventFlagAction
.asm_ab5b7:
	pop bc
	ret

Data_ab5b9:
	dstr "(へいし)"

Data_ab5bf:
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0b, $01, $08
	db $06, $29, $03, $0f, $00, $05, $0b, $06, $29, $05, $17, $00, $05, $3c, $06, $29
	db $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_ab5e8:
	db $01, $0c, $ff, $ff

Data_ab5ec:
	db $01, $06, $ff, $ff

Data_ab5f0:
	db $00, $06, $ff, $ff

Func_ab5f4:
	push de
	ld hl, $00b6
	scall CheckEventFlag
	or a
	jp nz, .asm_ab695
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab60b
	or a
	jp nz, .asm_ab695
.asm_ab60b:
	ld a, [wMapX]
	add a, $05
	or a
	jp nz, .asm_ab61c
	ld a, $02
	scall FacePlayer
	jp .asm_ab62b
.asm_ab61c:
	ld c, $01
	ld de, Data_ab5e8
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab62b:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010e
	scall PrintTextStandard
	ld de, Data_ab697
	ld hl, Data_ab5bf
	scall ScriptedBattle
	or a
	jp nz, .asm_ab64a
	jp .asm_ab695
.asm_ab64a:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab65c
	or a
	jp nz, .asm_ab669
.asm_ab65c:
	ld bc, Data_ab5ec
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab673
.asm_ab669:
	ld bc, Data_ab5f0
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab673:
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b6
	scall EventFlagAction
.asm_ab695:
	pop bc
	ret

Data_ab697:
	dstr "(へいし)"
