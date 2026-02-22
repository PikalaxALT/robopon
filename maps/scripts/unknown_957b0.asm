
Data_95768:
	warpdef $01, $08, $02, $01, MAP_00_10, $03, $01, $03, $02, $34
	warpdef $05, $01, $01, $01, MAP_00_33, $02, $09, $02, $08, $34

Data_9577e:
	dtext_tree_pointer TreeBitstreamText_46ef5
	dw -1

Data_95782:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_95786:
	person_event $24, $0c, $02, $07, $01, $01, $01, $04, $00, NULL, NULL

Data_95794:
	person_event $ff, $00, $03, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_9577e
	person_event $ff, $00, $08, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_95782

Func_957b0:: ; 957b0
	ld e, $02
	ld hl, Data_95768
	scall LoadWarps
	ld hl, $000e
	scall CheckEventFlag
	or a
	jp nz, .asm_957e0
	ld e, $01
	ld hl, Data_95786
	scall LoadMapObjects
	playmusic SONG_SHOP
	scall Func_8001c
	call Func_957f5
	ld e, $01
	ld hl, $000e
	scall EventFlagAction
	jp .asm_957f0
.asm_957e0:
	playmusic SONG_SHOP
	ld e, $02
	ld hl, Data_95794
	scall LoadMapObjects
	scall Func_8001c
.asm_957f0:
	ret

Data_957f1:
	db $05, $01, $ff, $ff

Func_957f5:
	ld bc, Data_957f1
	ld e, $25
	xor a
	scall MovePerson
	ld c, $01
	ld de, Data_957f1
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
	ret
