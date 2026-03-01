
Data_a6720:
	warpdef $13, $19, $01, $01, MAP_22_00, $09, $0f, $09, $0e, SFX_2E
	warpdef $10, $08, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $14, $08, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $16, $0f, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $0b, $05, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $19, $06, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $1d, $06, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $21, $06, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $08, $10, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $0c, $10, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $10, $10, $01, $01, MAP_32_00, $01, $05, $01, $04, SFX_34
	warpdef $20, $0e, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34

Data_a67a4:
	dtext_tree_pointer TreeBitstreamText_41c86
	dw -1

Data_a67a8:
	dtext_tree_pointer TreeBitstreamText_41c4a
	dw -1

Data_a67ac:
	dtext_tree_pointer TreeBitstreamText_41dce
	dw -1

Data_a67b0:
	dtext_tree_pointer TreeBitstreamText_41d47
	dw -1

Data_a67b4:
	dtext_tree_pointer TreeBitstreamText_41e16
	dw -1

Data_a67b8:
	dtext_tree_pointer TreeBitstreamText_41d81
	dw -1

Data_a67bc:
	dtext_tree_pointer TreeBitstreamText_41e56
	dw -1

Data_a67c0:
	dtext_tree_pointer TreeBitstreamText_4203a
	dw -1

Data_a67c4:
	dtext_tree_pointer TreeBitstreamText_4249f
	dw -1

Data_a67c8:
	dtext_tree_pointer TreeBitstreamText_466e2
	dw -1

Data_a67cc:
	person_event $02, $0c, $13, $14, $01, $01, $02, $04, $00, NULL, NULL

Data_a67da:
	person_event $02, $04, $24, $05, $01, $01, $00, $04, $00, Func_a6a87, NULL
	person_event $26, $04, $0c, $0a, $01, $01, $01, $04, $00, PrintTextFacePlayer_29_2, Data_a67a4
	person_event $26, $04, $16, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67a8
	person_event $26, $04, $0c, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_29_2, Data_a67ac
	person_event $26, $04, $21, $0a, $01, $01, $03, $04, $00, PrintTextFacePlayer_29_2, Data_a67b0
	person_event $26, $04, $18, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67b4
	person_event $27, $04, $1e, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67b8
	person_event $26, $04, $09, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67bc
	person_event $26, $04, $06, $10, $01, $01, $03, $04, $00, PrintTextFacePlayer_29_2, Data_a67c0
	person_event $26, $04, $1a, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_29_2, Data_a67c4

Data_a6866:
	person_event $ff, $00, $14, $18, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67c8
	person_event $ff, $00, $12, $18, $01, $01, $00, $04, $00, PrintTextFacePlayer_29_2, Data_a67c8

Func_a6882:: ; a6882
	ld l, $00
	push hl
	ld c, $02
	ld e, $03
	ld a, $08
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $02
	ld e, $03
	ld a, $0d
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $09
	ld e, $04
	ld a, $0f
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $02
	ld e, $04
	ld a, $23
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $03
	ld e, $0b
	ld a, $05
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $08
	ld e, $04
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $09
	ld e, $0c
	ld a, $04
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $06
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $06
	ld a, $09
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $06
	ld a, $0c
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $04
	ld a, $0e
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $09
	ld a, $0e
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $11
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $10
	ld a, $14
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $09
	ld a, $15
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $07
	ld a, $17
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $10
	ld a, $1b
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $0f
	ld a, $1e
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $0f
	ld a, $21
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $07
	ld a, $22
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $05
	ld e, $0e
	ld a, $23
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $06
	ld e, $05
	ld a, $24
	scall Func_80f24
	pop bc
	ld a, $08
	ld [wc789], a
	ld e, $0c
	ld hl, Data_a6720
	scall LoadWarps
	ld hl, $002d
	scall CheckEventFlag
	or a
	jp nz, .asm_a69d9
	ld e, $01
	ld hl, Data_a67cc
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_a6866
	scall LoadMapObjects
	xor a
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	call Func_a6a09
	jp .asm_a69f6
.asm_a69d9:
	ld e, $0a
	ld hl, Data_a67da
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_a6866
	scall LoadMapObjects
	ld a, $0a
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
.asm_a69f6:
	ret

Data_a69f7:
	db $13, $17, $ff, $ff

Data_a69fb:
	db $0e, $11, $10, $10, $ff, $ff

Data_a6a01:
	db $13, $13, $0e, $11, $10, $10, $ff, $ff

Func_a6a09:
	ld c, $01
	ld de, Data_a69f7
	ld a, $29
	scall MovePlayer
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $14
	ld a, $13
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $0102
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld bc, Data_a69fb
	ld e, $29
	xor a
	scall MovePerson
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld c, $01
	ld de, Data_a6a01
	ld a, $29
	scall MovePlayer
	ret

Func_a6a87:
	push af
	ld a, e
	or a
	jp nz, .asm_a6adb
	xor a
	scall PlayMusic
	ld a, $28
	scall PlaySFX
	ld c, $01
	ld e, $02
	ld a, $03
	scall LoadEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	ld a, $28
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $03
	scall LoadEmote
	scall WaitEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $01
	ld hl, $002e
	scall EventFlagAction
	ld hl, $0108
	scall PrintTextWithNPCName
	ld a, $0a
	scall PlayMusic
.asm_a6adb:
	pop bc
	ret
