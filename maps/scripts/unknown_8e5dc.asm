
Data_8e47a:
	warpdef $05, $08, $01, $02, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $23, $07, $01, $02, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $08, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $0c, $04, $01, $01, MAP_32_04, $01, $08, $01, $07, SFX_34
	warpdef $10, $05, $01, $01, MAP_32_07, $05, $09, $05, $08, SFX_34
	warpdef $15, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, SFX_34
	warpdef $19, $04, $01, $01, MAP_32_04, $01, $08, $01, $07, SFX_34
	warpdef $1c, $05, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $0e, $12, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $15, $10, $01, $01, MAP_32_08, $05, $09, $05, $08, SFX_34
	warpdef $1c, $0e, $01, $01, MAP_32_02, $01, $0a, $01, $09, SFX_34
	warpdef $10, $09, $01, $01, MAP_08_01, $04, $00, $04, $01, SFX_2E

Data_8e4fe:
	dtext_tree_pointer TreeBitstreamText_3b9f6
	dw -1

Data_8e502:
	dtext_tree_pointer TreeBitstreamText_41675
	dtext_tree_pointer TreeBitstreamText_416c4
	dw -1

Data_8e508:
	dtext_tree_pointer TreeBitstreamText_416f0
	dw -1

Data_8e50c:
	dtext_tree_pointer TreeBitstreamText_41721
	dw -1

Data_8e510:
	dtext_tree_pointer TreeBitstreamText_4174d
	dw -1

Data_8e514:
	dtext_tree_pointer TreeBitstreamText_465d8
	dw -1

Data_8e518:
	person_event $04, $04, $0a, $04, $01, $01, $02, $04, $00, Func_808fc_23, Data_8e4fe

Data_8e526:
	person_event $04, $04, $0a, $04, $01, $01, $02, $04, $00, Func_8e8b4, NULL

Data_8e534:
	person_event $00, $04, $1f, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_23, Data_8e502
	person_event $01, $04, $0d, $0a, $01, $01, $01, $04, $00, PrintTextFacePlayer_23, Data_8e508
	person_event $07, $04, $0b, $10, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8e50c
	person_event $0c, $04, $16, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e510
	person_event $ff, $00, $22, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $22, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $06, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $06, $09, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8e514
	person_event $ff, $00, $10, $09, $01, $01, $00, $04, $00, Func_8e826, NULL
	person_event $ff, $00, $09, $05, $01, $01, $00, $04, $00, Func_8e864, NULL
	person_event $ff, $00, $16, $05, $01, $01, $00, $04, $00, Func_8e88c, NULL

Data_8e5ce:
	person_event $03, $0c, $1c, $05, $01, $01, $02, $04, $00, NULL, NULL

Func_8e5dc:: ; 8e5dc
	ld a, $03
	ld [wc789], a
	ld a, $05
	ld [wc7e2], a
	loadwarps $0c, Data_8e47a
	checkevent $0008
	or a
	jp nz, .asm_8e612
	loadpeople $01, Data_8e5ce
	ld a, $01
	scall LoadPlayerSprite
	xor a
	scall PlayMusic
	scall Func_8001c
	call Func_8e66b
	jp .asm_8e65a
.asm_8e612:
	checkevent $0088
	cp $01
	jp nz, .asm_8e63d
	ld a, $03
	scall PlayMusic
	loadpeople $01, Data_8e526
	loadpeople $0b, Data_8e534
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	jp .asm_8e65a
.asm_8e63d:
	ld a, $03
	scall PlayMusic
	loadpeople $01, Data_8e518
	loadpeople $0b, Data_8e534
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
.asm_8e65a:
	ret

Data_8e65b:
	db $1c, $08, $20, $08, $ff, $ff

Data_8e661:
	db $1c, $08, $1c, $05, $ff, $ff

Data_8e667:
	db $1b, $08, $ff, $ff

Func_8e66b:
	move_person 0, Data_8e65b, 1
	scall WaitNPCStep
	writetext TreeBitstreamText_3b2db
	ld a, $2a
	scall PlaySFX
	writetext TreeBitstreamText_3b30a
	writetext TreeBitstreamText_3b31f
	move_person 0, Data_8e661, 0
	scall WaitNPCStep
	hideperson 0
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld de, Data_8e667
	ld a, $23
	scall MovePlayer
	ld c, $01
	ld e, $0f
	ld a, $0d
	scall LoadEmote
	ld e, $08
	ld a, $1b
	scall MoveEmote
	xor a
	scall Func_80653
	ld hl, $0096
	scall ScriptSleep
	ld a, $34
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	xor a
	scall PlayMusic
	ld a, $0f
	scall PlayMusic
	writenpctext_yesorno TreeBitstreamText_3b324
	or a
	jp nz, .asm_8e727
	setevent $00e9
	ld a, $2b
	scall PlaySFX
	writetext TreeBitstreamText_3b35d
	ld a, $68
	scall PlaySFX
	writenpctext TreeBitstreamText_3b36e
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $07
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	ld a, $01
	scall PlayerFace
	scall HideEmote
	jp .asm_8e7b2
.asm_8e727:
	ld a, $69
	scall PlaySFX
	writenpctext TreeBitstreamText_3b3c0
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $0f
	ld a, $0e
	scall LoadEmote
	ld hl, $005a
	scall ScriptSleep
	ld a, $2b
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $34
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $35
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $69
	scall PlaySFX
	xor a
	scall Func_80653
	scall WaitEmote
	writenpctext TreeBitstreamText_3b412
	setevent $00ea
	ld a, $2b
	scall PlaySFX
	writetext TreeBitstreamText_3b401
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $01
	ld e, $0f
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld a, $01
	scall PlayerFace
	scall HideEmote
.asm_8e7b2:
	xor a
	scall PlayMusic
	ld a, $0f
	scall PlayMusic
	ld c, $01
	ld e, $10
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	writenpctext TreeBitstreamText_3b447
	ld c, $01
	ld e, $20
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld e, $10
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	writenpctext TreeBitstreamText_3b481
	ld c, $01
	ld e, $20
	ld a, $0f
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld a, $06
	scall Func_80c94
	setevent $0008
	ld l, $08
	push hl
	ld c, $1b
	ld e, $00
	ld a, $06
	scall Func_80dff
	pop bc
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ret

Func_8e826:
	ld a, e
	or a
	jp nz, .asm_8e863
	writetext_yesorno TreeBitstreamText_46e1d
	or a
	jp nz, .asm_8e85d
	xor a
	scall Func_80653
	ld a, $2e
	scall PlaySFX
	ld l, $01
	push hl
	ld c, $04
	ld e, $01
	ld a, $08
	scall Func_80dff
	pop bc
	ld a, $02
	ld [wPlayerFacing], a
	ld a, $10
	ld [wBackupMapX], a
	ld a, $09
	ld [wBackupMapY], a
	jp .asm_8e863
.asm_8e85d:
	writetext TreeBitstreamText_46e5d
.asm_8e863:
	ret

Func_8e864:
	ld a, e
	cp $01
	jp nz, .asm_8e88b
	ld a, $2e
	scall PlaySFX
	ld l, $07
	push hl
	ld c, $09
	ld e, $01
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $03
	ld [wPlayerFacing], a
	ld a, $08
	ld [wBackupMapX], a
	ld a, $06
	ld [wBackupMapY], a
.asm_8e88b:
	ret

Func_8e88c:
	ld a, e
	cp $01
	jp nz, .asm_8e8b3
	ld a, $2e
	scall PlaySFX
	ld l, $07
	push hl
	ld c, $09
	ld e, $01
	ld a, $20
	scall Func_80dff
	pop bc
	ld a, $03
	ld [wPlayerFacing], a
	ld a, $15
	ld [wBackupMapX], a
	ld a, $06
	ld [wBackupMapY], a
.asm_8e8b3:
	ret

Func_8e8b4:
	ld a, e
	or a
	jp nz, .asm_8e8cc
	face_player $01
	writenpctext TreeBitstreamText_3ba23
	setevent $003a
.asm_8e8cc:
	ret
