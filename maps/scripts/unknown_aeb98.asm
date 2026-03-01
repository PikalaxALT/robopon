
Data_aeb0d:
	warpdef $09, $08, $01, $01, MAP_27_05, $01, $11, $01, $12, $2e
	warpdef $01, $08, $01, $01, MAP_27_07, $01, $07, $01, $06, $2e

Data_aeb23:
	db $46, $18, $07, $01, $42

Data_aeb28:
IF DEF(SUN)
	wildbot $00, $06, $19, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $06, $19, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aeb6e:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL
	person_event $00, $0c, $18, $06, $01, $01, $02, $04, $00, Func_aec4d, NULL

Data_aeb8a:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL

Func_aeb98:: ; aeb98
	call Func_aebfc
	ld hl, Func_aebfc
	scall Func_80f11
	ld e, $02
	ld hl, Data_aeb0d
	scall LoadWarps
	ld e, $01
	ld hl, Data_aeb23
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aeb28
	scall LoadEncounters
	ld hl, $00d4
	scall CheckEventFlag
	or a
	jp nz, .asm_aebd3
	ld e, $02
	ld hl, Data_aeb6e
	scall LoadMapObjects
	jp .asm_aebdb
.asm_aebd3:
	ld e, $01
	ld hl, Data_aeb8a
	scall LoadMapObjects
.asm_aebdb:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031a
	scall LandmarkSign
	ret

Data_aebea:
	db $00, $00, $01, $01, $18, $03

Data_aebf0:
	db $00, $00, $01, $01, $18, $04

Data_aebf6:
	db $00, $00, $01, $01, $18, $05

Func_aebfc:
	ld hl, $00d4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aec1c
	ld hl, Data_aebea
	scall Func_80d9b
	ld hl, Data_aebf0
	scall Func_80d9b
	ld hl, Data_aebf6
	scall Func_80d9b
	scall Func_80f02
.asm_aec1c:
	ret

Func_aec1d:
	ld a, e
	cp $02
	jp nz, .asm_aec48
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld l, $08
	push hl
	ld c, $06
	ld e, $08
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_aec48:
	ret

Data_aec49:
	db $18, $01, $ff, $ff

Func_aec4d:
	ld a, e
	or a
	jp nz, .asm_aecf8
	xor a
	scall PlayerFace
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld hl, $0142
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld a, [wMapX]
	add a, $05
	cp $19
	jp nz, .asm_aecb0
	ld a, $03
	scall PlayerFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	jp .asm_aecbc
.asm_aecb0:
	ld a, $01
	scall PlayerFace
	ld e, $03
	ld a, $01
	scall SpriteFace
.asm_aecbc:
	ld hl, $0143
	scall PrintTextWithNPCName
	scall Func_81094
	or a
	jp nz, .asm_aecf8
	ld e, $01
	ld hl, $00d4
	scall EventFlagAction
	call Func_aebfc
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld hl, $0144
	scall PrintTextWithNPCName
	ld bc, Data_aec49
	ld e, $2b
	ld a, $01
	scall MovePersonAndWait
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_aecf8:
	ret
