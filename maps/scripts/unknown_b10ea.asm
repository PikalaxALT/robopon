
Data_b10b4:
	warpdef $06, $1b, $01, $01, MAP_25_01, $19, $05, $19, $06, $2e
	warpdef $06, $04, $04, $01, MAP_28_01, $11, $19, $11, $18, $2e

Data_b10ca:
	dw $2b2
	dw -1

Data_b10ce:
	person_event $ff, $00, $05, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca
	person_event $ff, $00, $07, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca

Func_b10ea:: ; b10ea
	ld e, $02
	ld hl, Data_b10b4
	scall LoadWarps
	ld e, $02
	ld hl, Data_b10ce
	scall LoadMapObjects
	ld a, $0d
	ld [wc7e2], a
	ld a, $12
	scall PlayMusic
	scall Func_8001c
	call Func_b110b
	ret

Func_b110b:
	ld hl, $001e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b112d
	ld hl, $0009
	scall CheckEventFlag
	or a
	jp nz, .asm_b112d
	ld l, $04
	push hl
	ld c, $11
	ld e, $01
	ld a, $1c
	scall Func_80dff
	pop bc
.asm_b112d:
	ret
