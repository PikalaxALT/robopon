
Data_ab0ff:
	warpdef $09, $18, $01, $01, MAP_25_02, $01, $04, $02, $04, $2e
	warpdef $09, $04, $01, $01, MAP_25_00, $05, $12, $06, $12, $2e

Data_ab115:
	db $3c, $01, $08, $03, $1c
	db $3d, $01, $0c, $01, $0f
	db $3e, $00, $09, $03, $1e
	db $3f, $00, $0b, $03, $1f

Data_ab129:
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

Data_ab161:
	person_event $09, $0c, $08, $0e, $01, $01, $01, $04, $00, Func_ab24a, NULL
	person_event $ff, $00, $09, $0e, $02, $01, $00, $04, $01, Func_ab24a, NULL
	person_event $09, $0c, $08, $0c, $01, $01, $01, $04, $00, Func_ab327, NULL
	person_event $ff, $00, $09, $0c, $02, $01, $00, $04, $01, Func_ab327, NULL

Func_ab199:: ; ab199
	ld e, $02
	ld hl, Data_ab0ff
	scall LoadWarps
	ld e, $04
	ld hl, Data_ab115
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_ab129
	scall LoadEncounters
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab20a
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab20a
	ld e, $04
	ld hl, Data_ab161
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b1
	scall CheckEventFlag
	or a
	jp z, .asm_ab1ef
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_ab1ef:
	ld hl, $00b2
	scall CheckEventFlag
	or a
	jp z, .asm_ab207
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_ab207:
	jp .asm_ab20f
.asm_ab20a:
	ld a, $08
	scall PlayMusic
.asm_ab20f:
	scall Func_8001c
	ret

Data_ab213:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_ab23c:
	db $09, $0e, $ff, $ff

Data_ab240:
	db $09, $0e, $09, $15, $ff, $ff

Data_ab246:
	db $08, $15, $ff, $ff

Func_ab24a:
	push de
	ld hl, $00b1
	scall CheckEventFlag
	or a
	jp nz, .asm_ab2e8
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab261
	or a
	jp nz, .asm_ab2e8
.asm_ab261:
	ld a, [wMapX]
	add a, $05
	cp $08
	jp nz, .asm_ab272
	xor a
	scall FacePlayer
	jp .asm_ab281
.asm_ab272:
	ld c, $01
	ld de, Data_ab23c
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab281:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010c
	scall PrintTextStandard
	ld de, Data_ab2ea
	ld hl, Data_ab213
	scall ScriptedBattle
	or a
	jp nz, .asm_ab2a0
	jp .asm_ab2e8
.asm_ab2a0:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab2b2
	or a
	jp nz, .asm_ab2be
.asm_ab2b2:
	ld bc, Data_ab240
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_ab2c7
.asm_ab2be:
	ld bc, Data_ab246
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_ab2c7:
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
	ld hl, $00b1
	scall EventFlagAction
.asm_ab2e8:
	pop bc
	ret

Data_ab2ea:
	dstr "(へいし)"

Data_ab2f0:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab319:
	db $09, $0c, $ff, $ff

Data_ab31d:
	db $09, $0c, $09, $06, $ff, $ff

Data_ab323:
	db $08, $06, $ff, $ff

Func_ab327:
	push de
	ld hl, $00b2
	scall CheckEventFlag
	or a
	jp nz, .asm_ab3c9
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab33e
	or a
	jp nz, .asm_ab3c9
.asm_ab33e:
	ld a, [wMapX]
	add a, $05
	cp $08
	jp nz, .asm_ab350
	ld a, $02
	scall FacePlayer
	jp .asm_ab35f
.asm_ab350:
	ld c, $01
	ld de, Data_ab319
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab35f:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010d
	scall PrintTextStandard
	ld de, Data_ab3cb
	ld hl, Data_ab2f0
	scall ScriptedBattle
	or a
	jp nz, .asm_ab37e
	jp .asm_ab3c9
.asm_ab37e:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab390
	or a
	jp nz, .asm_ab39d
.asm_ab390:
	ld bc, Data_ab31d
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab3a7
.asm_ab39d:
	ld bc, Data_ab323
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab3a7:
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
	ld hl, $00b2
	scall EventFlagAction
.asm_ab3c9:
	pop bc
	ret

Data_ab3cb:
	dstr "(へいし)"
