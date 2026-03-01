
Data_b10b4:
	warpdef $06, $1b, $01, $01, MAP_25_01, $19, $05, $19, $06, SFX_2E
	warpdef $06, $04, $04, $01, MAP_28_01, $11, $19, $11, $18, SFX_2E

Data_b10ca:
	dtext_tree_pointer TreeBitstreamText_46596
	dw -1

Data_b10ce:
	person_event $ff, $00, $05, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca
	person_event $ff, $00, $07, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca

Func_b10ea:: ; b10ea
	loadwarps $02, Data_b10b4
	loadpeople $02, Data_b10ce
	ld a, $0d
	ld [wc7e2], a
	playmusic $12
	scall Func_8001c
	call Func_b110b
	ret

Func_b110b:
	checkevent $001e
	cp $01
	jp nz, .asm_b112d
	checkevent $0009
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
