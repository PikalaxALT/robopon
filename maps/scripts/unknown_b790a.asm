
Data_b780b:
	warpdef $07, $0a, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $07, $05, $01, $01, MAP_31_02, $09, $0e, $09, $0d, $34

Data_b7821:
	warpdef $07, $0a, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $07, $05, $01, $01, MAP_31_01, $09, $0e, $09, $0d, $34

Data_b7837:
	warpdef $07, $0a, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e

Data_b7842:
	wildbot $01, $01, $0a, $0e, $2d, $28, $2d, $04, $06, $06, $06, $06, $04, $00
	wildbot $01, $01, $0a, $0e, $1c, $28, $2d, $04, $1f, $17, $11, $12, $03, $00
	wildbot $01, $01, $0a, $0e, $3d, $28, $2d, $04, $1f, $08, $08, $06, $04, $00
	wildbot $01, $01, $0a, $0e, $4b, $28, $2d, $04, $0e, $08, $14, $13, $05, $00
	wildbot $01, $01, $0a, $0e, $67, $28, $2d, $04, $05, $13, $00, $06, $06, $00
	wildbot $01, $01, $0a, $0e, $93, $28, $2d, $04, $04, $17, $00, $06, $04, $00
	wildbot $01, $01, $0a, $0e, $27, $28, $2d, $6e, $01, $03, $00, $06, $0a, $00
	wildbot $01, $01, $0a, $0e, $79, $28, $2d, $6e, $01, $04, $00, $12, $09, $00
	wildbot $01, $01, $0a, $0e, $08, $28, $2d, $6e, $01, $13, $00, $13, $09, $00
	wildbot $01, $01, $0a, $0e, $8f, $28, $2d, $6e, $0f, $0d, $14, $12, $08, $00
	wildbot $01, $01, $0a, $0e, $61, $28, $2d, $6e, $05, $09, $00, $06, $07, $00
	wildbot $01, $01, $0a, $0e, $37, $28, $2d, $6e, $24, $12, $00, $06, $02, $00

Data_b78ea:
	dw $2c2
	dw -1

Data_b78ee:
	person_event $ff, $00, $06, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_2d_2, Data_b78ea
	person_event $ff, $00, $08, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_2d_2, Data_b78ea

Func_b790a:: ; b790a
	ld a, $0c
	ld [wc7e2], a
	call Func_b79a1
	ld hl, Func_b79a1
	scall Func_80f11
	ld e, $02
	ld hl, Data_b78ee
	scall LoadMapObjects
	ld hl, $001b
	scall CheckEventFlag
	or a
	jp nz, .asm_b7935
	ld e, $02
	ld hl, Data_b780b
	scall LoadWarps
	jp .asm_b795d
.asm_b7935:
	ld hl, $001b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b795d
	ld hl, $0034
	scall CheckEventFlag
	or a
	jp nz, .asm_b7955
	ld e, $02
	ld hl, Data_b7821
	scall LoadWarps
	jp .asm_b795d
.asm_b7955:
	ld e, $01
	ld hl, Data_b7837
	scall LoadWarps
.asm_b795d:
	ld a, $03
	scall Func_80d01
	ld e, $0c
	ld hl, Data_b7842
	scall LoadEncounters
	ld a, $01
	scall LoadPlayerSprite
	ld hl, $001b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b7992
	ld hl, $00f1
	scall CheckEventFlag
	or a
	jp nz, .asm_b7992
	xor a
	scall PlayMusic
	xor a
	scall Func_80653
	call Func_b79b6
	jp .asm_b799a
.asm_b7992:
	ld a, $10
	scall PlayMusic
	scall Func_8001c
.asm_b799a:
	ret

Data_b799b:
	db $00, $15, $03, $02, $06, $03

Func_b79a1:
	ld hl, $001b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b79b5
	ld hl, Data_b799b
	scall Func_80d9b
	scall Func_80f02
.asm_b79b5:
	ret

Func_b79b6:
	ld c, $01
	ld e, $01
	ld a, $2b
	scall LoadEmote
	ld e, $04
	ld a, $07
	scall MoveEmote
	scall Func_8001c
	ld a, $65
	scall PlaySFX
	ld hl, $003c
	scall ScriptSleep
	ld a, $43
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld l, $0e
	push hl
	ld c, $07
	ld e, $0a
	ld a, $20
	scall Func_80dff
	pop bc
	ret
