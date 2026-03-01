
Data_aae4d:
	warpdef $11, $04, $01, $01, MAP_25_05, $01, $18, $01, $17, SFX_2E
	warpdef $05, $03, $01, $03, MAP_28_01, $1d, $14, $1c, $14, SFX_2E

Data_aae63:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aae9b:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaf84, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaf84, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_ab05c, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_ab05c, NULL

Func_aaed3:: ; aaed3
	ld e, $02
	ld hl, Data_aae4d
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_aae63
	scall LoadEncounters
	ld e, $01
	ld hl, $00c2
	scall EventFlagAction
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aaf44
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aaf44
	ld e, $04
	ld hl, Data_aae9b
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b3
	scall CheckEventFlag
	or a
	jp z, .asm_aaf29
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_aaf29:
	ld hl, $00b4
	scall CheckEventFlag
	or a
	jp z, .asm_aaf41
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_aaf41:
	jp .asm_aaf49
.asm_aaf44:
	ld a, $08
	scall PlayMusic
.asm_aaf49:
	scall Func_8001c
	ret

Data_aaf4d:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $57, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $02, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aaf76:
	db $08, $04, $ff, $ff

Data_aaf7a:
	db $08, $04, $05, $04, $ff, $ff

Data_aaf80:
	db $05, $03, $ff, $ff

Func_aaf84:
	push de
	ld hl, $00b3
	scall CheckEventFlag
	or a
	jp nz, .asm_ab01b
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aaf9b
	or a
	jp nz, .asm_ab01b
.asm_aaf9b:
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aafaa
	xor a
	scall FacePlayer
	jp .asm_aafb8
.asm_aafaa:
	ld c, $01
	ld de, Data_aaf76
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_aafb8:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010e
	scall PrintTextStandard
	ld de, Data_ab01d
	ld hl, Data_aaf4d
	scall ScriptedBattle
	or a
	jp nz, .asm_aafd7
	jp .asm_ab01b
.asm_aafd7:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aaff1
	ld bc, Data_aaf7a
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_aaffa
.asm_aaff1:
	ld bc, Data_aaf80
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_aaffa:
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
	ld hl, $00b3
	scall EventFlagAction
.asm_ab01b:
	pop bc
	ret

Data_ab01d:
	dstr "(へいし)"

Data_ab023:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $24, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $22, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab04c:
	db $0a, $04, $ff, $ff

Data_ab050:
	db $0a, $04, $11, $04, $ff, $ff

Data_ab056:
	db $0c, $04, $11, $04, $ff, $ff

Func_ab05c:
	push de
	ld hl, $00b4
	scall CheckEventFlag
	or a
	jp nz, .asm_ab0f7
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab073
	or a
	jp nz, .asm_ab0f7
.asm_ab073:
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab083
	ld a, $02
	scall FacePlayer
	jp .asm_ab091
.asm_ab083:
	ld c, $01
	ld de, Data_ab04c
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_ab091:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010b
	scall PrintTextStandard
	ld de, Data_ab0f9
	ld hl, Data_ab023
	scall ScriptedBattle
	or a
	jp nz, .asm_ab0b0
	jp .asm_ab0f7
.asm_ab0b0:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab0cb
	ld bc, Data_ab050
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab0d5
.asm_ab0cb:
	ld bc, Data_ab056
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab0d5:
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
	ld hl, $00b4
	scall EventFlagAction
.asm_ab0f7:
	pop bc
	ret

Data_ab0f9:
	dstr "(へいし)"
