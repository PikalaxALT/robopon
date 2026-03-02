
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
	playmusic SONG_NONE
	scall Func_8001c
	call Func_8e66b
	jp .asm_8e65a
.asm_8e612:
	checkevent $0088
	cp $01
	jp nz, .asm_8e63d
	playmusic SONG_TOWN1
	loadpeople $01, Data_8e526
	loadpeople $0b, Data_8e534
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	jp .asm_8e65a
.asm_8e63d:
	playmusic SONG_TOWN1
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
	playsfx SFX_2A
	writetext TreeBitstreamText_3b30a
	writetext TreeBitstreamText_3b31f
	move_person 0, Data_8e661, 0
	scall WaitNPCStep
	hideperson 0
	playmusic SONG_1B
	move_player $01, Data_8e667
	loademote $01, $0f, $0d
	ld e, $08
	ld a, $1b
	scall MoveEmote
	xor a
	scall Func_80653
	script_sleep 150
	playsfx SFX_34
	scall WaitEmote
	ld a, $01
	scall Func_80653
	playmusic SONG_NONE
	playmusic SONG_CARD_MINIGAME
	writenpctext_yesorno TreeBitstreamText_3b324
	or a
	jp nz, .asm_8e727
	setevent $00e9
	playsfx SFX_2B
	writetext TreeBitstreamText_3b35d
	playsfx SFX_68
	writenpctext TreeBitstreamText_3b36e
	playmusic SONG_NONE
	playmusic SONG_1B
	loademote $01, $07, $0f
	scall WaitEmote
	ld a, $01
	scall PlayerFace
	scall HideEmote
	jp .asm_8e7b2
.asm_8e727:
	playsfx SFX_69
	writenpctext TreeBitstreamText_3b3c0
	playmusic SONG_NONE
	playmusic SONG_1B
	loademote $01, $0f, $0e
	script_sleep 90
	playsfx SFX_2B
	script_sleep 30
	playsfx SFX_34
	script_sleep 30
	playsfx SFX_35
	script_sleep 30
	playsfx SFX_69
	xor a
	scall Func_80653
	scall WaitEmote
	writenpctext TreeBitstreamText_3b412
	setevent $00ea
	playsfx SFX_2B
	writetext TreeBitstreamText_3b401
	playmusic SONG_NONE
	playmusic SONG_1B
	loademote $01, $0f, $0f
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld a, $01
	scall PlayerFace
	scall HideEmote
.asm_8e7b2:
	playmusic SONG_NONE
	playmusic SONG_CARD_MINIGAME
	loademote $01, $10, $0f
	scall WaitEmote
	writenpctext TreeBitstreamText_3b447
	loademote $01, $20, $0f
	scall WaitEmote
	scall HideEmote
	loademote $01, $10, $0f
	scall WaitEmote
	writenpctext TreeBitstreamText_3b481
	loademote $01, $20, $0f
	scall WaitEmote
	scall HideEmote
	ld a, $06
	scall Func_80c94
	setevent $0008
	warp_player MAP_06_00, $1b, $08
	pop bc
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
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
	playsfx SFX_2E
	warp_player MAP_08_01, $04, $01
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
	playsfx SFX_2E
	warp_player MAP_32_01, $09, $07
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
	playsfx SFX_2E
	warp_player MAP_32_01, $09, $07
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
