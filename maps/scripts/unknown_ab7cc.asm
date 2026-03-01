
Data_ab69d:
	warpdef $0e, $1b, $04, $01, MAP_25_20, $0f, $05, $0f, $06, SFX_2E

Data_ab6a8:
	db $22, $01, $ff, $ff

Data_ab6ac:
	db $b3, $02, $ff, $ff

Data_ab6b0:
	db $1a, $04, $ff, $ff

Data_ab6b4:
	person_event $23, $0c, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0d, $0c, $0f, $05, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6a8
	person_event $1a, $0c, $09, $10, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $0c, $0d, $0c, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $11, $0c, $01, $01, $02, $04, $00, NULL, NULL

Data_ab6fa:
	person_event $0d, $04, $0f, $07, $01, $01, $02, $04, $00, Func_abf5b, NULL
	person_event $23, $04, $10, $07, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6b0
	person_event $1c, $04, $10, $07, $01, $01, $02, $04, $00, NULL, NULL

Data_ab724:
	person_event $0d, $04, $0f, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $00, $04, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0c, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0c, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0e, $01, $01, $03, $04, $00, NULL, NULL

Data_ab794:
	person_event $ff, $00, $0c, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac
	person_event $ff, $00, $13, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac

Data_ab7b0:
	person_event $0f, $04, $16, $14, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $16, $14, $01, $01, $02, $04, $00, Func_abe67, NULL

Func_ab7cc:: ; ab7cc
	loadpeople $02, Data_ab7b0
	hideperson 0
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab7e9
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab7f9
.asm_ab7e9:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab804
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab804
.asm_ab7f9:
	loadpeople $08, Data_ab724
	jp .asm_ab860
.asm_ab804:
	loadwarps $01, Data_ab69d
	checkevent $0043
	or a
	jp nz, .asm_ab829
	loadpeople $05, Data_ab6b4
	loadpeople $02, Data_ab794
	jp .asm_ab860
.asm_ab829:
	checkevent $0023
	cp $01
	jp nz, .asm_ab858
	checkevent $0048
	or a
	jp nz, .asm_ab858
	loadpeople $03, Data_ab6fa
	loadpeople $02, Data_ab794
	hideperson $03
	jp .asm_ab860
.asm_ab858:
	loadpeople $02, Data_ab794
.asm_ab860:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab86f
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab87f
.asm_ab86f:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab88a
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab88a
.asm_ab87f:
	playmusic SONG_TOWN1
	call Func_abc22
	jp .asm_ab8c8
.asm_ab88a:
	checkevent $0043
	or a
	jp nz, .asm_ab8c0
	xor a
	scall Func_80653
	playmusic SONG_NONE
	playmusic SONG_PRINCE_TEIL
	scall Func_8001c
	call Func_ab8e1
	setevent $0043
	ld a, $0c
	scall Func_80c94
	playmusic SONG_NONE
	playmusic SONG_TEIL_TOWN
	jp .asm_ab8c8
.asm_ab8c0:
	playmusic SONG_TEIL_TOWN
	scall Func_8001c
.asm_ab8c8:
	ret

Data_ab8c9:
	db $0f, $0f, $ff, $ff

Data_ab8cd:
	db $0d, $0f, $ff, $ff

Data_ab8d1:
	db $11, $0f, $ff, $ff

Data_ab8d5:
	db $10, $0f, $ff, $ff

Data_ab8d9:
	db $0e, $0f, $ff, $ff

Data_ab8dd:
	db $10, $12, $ff, $ff

Func_ab8e1:
	xor a
.asm_ab8e2:
	cp $0a
	jp nc, .asm_ab8f3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_ab8e2
.asm_ab8f3:
	script_sleep 60
	ld c, $15
	ld e, $0f
	ld a, $04
	scall Func_80080
	ld bc, Data_ab8c9
Func_ab904:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	script_sleep 60
	move_person $05, Data_ab8cd, 1
	playsfx SFX_2E
	sprite_face $01, $05
	script_sleep 60
	sprite_face $03, $04
	move_person $06, Data_ab8d1, 1
	playsfx SFX_2E
	scall WaitNPCStep
	sprite_face $03, $06
	script_sleep 30
	sprite_face $01, $04
	script_sleep 30
	move_person $04, Data_ab8d5, 1
	scall WaitNPCStep
	playsfx SFX_62
	sprite_face $00, $06
	sprite_face $01, $06
	sprite_face $02, $06
	sprite_face $03, $06
	sprite_face $00, $06
	sprite_face $01, $06
	sprite_face $02, $06
	sprite_face $03, $06
	hideperson $06
	playsfx SFX_4E
	move_person $04, Data_ab8d9, 1
	scall WaitNPCStep
	playsfx SFX_63
	sprite_face $00, $05
	sprite_face $01, $05
	sprite_face $02, $05
	sprite_face $03, $05
	sprite_face $00, $05
	sprite_face $01, $05
	sprite_face $02, $05
	sprite_face $03, $05
	hideperson $05
	playsfx SFX_4E
	script_sleep 120
	ld c, $15
	ld e, $11
	ld a, $03
	scall Func_80080
	move_person $03, Data_ab8d1, 1
	scall WaitNPCStep
	sprite_face $03, $03
	script_sleep 60
	writenpctext TreeBitstreamText_3d8f1
	script_sleep 30
	sprite_face $01, $04
	writenpctext TreeBitstreamText_3d95c
	writenpctext TreeBitstreamText_3d9b8
	writenpctext TreeBitstreamText_3d9f7
	writenpctext TreeBitstreamText_3da77
	writenpctext TreeBitstreamText_3da85
	writenpctext TreeBitstreamText_3db5f
	writenpctext TreeBitstreamText_3db7f
	ld bc, Data_ab8c9
Func_aba78:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	loademote $01, $01, $16
	ld e, $0f
	ld a, $10
	scall MoveEmote
	playsfx SFX_61
	scall WaitEmote
	scall HideEmote
	writenpctext TreeBitstreamText_3dc1e
	sprite_face $02, $04
	script_sleep 60
	sprite_face $02, $03
	loademote $01, $01, $05
	ld e, $0f
	ld a, $11
	scall MoveEmote
	playsfx SFX_28
	scall WaitEmote
	scall HideEmote
	xor a
.asm_abad4:
	cp $02
	jp nc, .asm_abae6
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abad4
.asm_abae6:
	ld c, $19
	ld e, $10
	ld a, $02
	scall Func_80080
	move_person $02, Data_ab8dd, 1
	scall WaitNPCStep
	writenpctext TreeBitstreamText_3dc47
	writenpctext TreeBitstreamText_3dcbd
	loademote $01, $02, $16
	ld e, $0f
	ld a, $10
	scall MoveEmote
	playsfx SFX_60
	hideperson $02
	sprite_face $03, $03
	scall WaitEmote
	scall HideEmote
	sprite_face $01, $04
	writenpctext TreeBitstreamText_3dc61
	loademote $01, $04, $16
	ld e, $0f
	ld a, $10
	scall MoveEmote
	hideperson $04
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall Func_80653
	xor a
.asm_abb61:
	cp $08
	jp nc, .asm_abb73
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abb61
.asm_abb73:
	ret

Func_abb74:: ; abb74
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	xor a
	scall PlayerFace
	loademote $01, $3f, $1c
	ld e, $08
	ld a, $10
	scall MoveEmote
	playsfx SFX_5E
	hideperson $04
	scall WaitEmote
	showperson $03
	scall HideEmote
	script_sleep 60
	loademote $01, $3f, $1d
	ld e, $08
	ld a, $10
	scall MoveEmote
	hideperson $02
	hideperson $03
	scall WaitEmote
	showperson $02
	showperson $03
	scall HideEmote
	writenpctext TreeBitstreamText_427de
	writetext TreeBitstreamText_427b2
	give_robot SEABEE, $1e, $00
	cp $ff
	jp nz, .asm_abc02
.asm_abc02:
	writenpctext TreeBitstreamText_42876
	writetext TreeBitstreamText_427ca
	ld e, $00
	ld a, $2c
	scall Func_80d62
	setevent $0048
	ret

Data_abc1e:
	db $0f, $07, $ff, $ff

Func_abc22:
	xor a
	scall PlayerFace
	scall Func_8001c
	checkevent $0048
	or a
	jp nz, .asm_abc3d
	ld e, $1c
	ld a, $03
	scall ChangeSprite
	jp .asm_abc44
.asm_abc3d:
	ld e, $23
	ld a, $03
	scall ChangeSprite
.asm_abc44:
	sprite_face $02, $03
	move_player $01, Data_abc1e
	script_sleep 60
	checkevent $005a
	or a
	jp nz, .asm_abc6b
	writenpctext TreeBitstreamText_3ed13
.asm_abc6b:
	checkevent $0048
	or a
	jp nz, .asm_abc7b
	writenpctext TreeBitstreamText_3ed88
.asm_abc7b:
	checkevent $005a
	or a
	jp nz, .asm_abc9c
	writetext TreeBitstreamText_3ede7
	ld c, $00
	ld e, $01
	ld a, $07
	scall Func_80d4d
	setevent $005a
.asm_abc9c:
	writenpctext TreeBitstreamText_3ee04
	script_sleep 60
.asm_abca8:
	ld a, [wRTCTicker]
	cp $11
	jp z, .asm_abcc2
	ld a, [wRTCTicker]
	or a
	jp nz, .asm_abcbc
	ld a, $01
	ld [wRTCTicker], a
.asm_abcbc:
	call NextOverworldFrame
	jp .asm_abca8
.asm_abcc2:
	xor a
	ld [wc39e], a
	playmusic SONG_CREDITS
	ld a, $01
	ld [wc790], a
	scall ScriptLibrary
	or a
	jp nz, .asm_abdda
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $04
	ld [wNextVBlankFlags], a
.asm_abd24:
	ld a, [wNextVBlankFlags]
	ld hl, $c204
	cp [hl]
	jp nz, .asm_abd24
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	scall Func_80f02
	writenpctext TreeBitstreamText_3ee24
	xor a
	scall Func_8103e
	writenpctext TreeBitstreamText_3ee49
	resetevent $00e1
	resetevent $00e2
	resetevent $00e3
	resetevent $00e4
	resetevent $00e5
	resetevent $00e6
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits2
	jp .asm_abe66
.asm_abdda:
	resetevent $00e1
	resetevent $00e2
	resetevent $00e3
	resetevent $00e4
	resetevent $00e5
	resetevent $00e6
	ld a, $01
	ld [wc79a], a
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Func_fafa8
.asm_abe66:
	ret

Func_abe67:
	ld a, e
	or a
	jp nz, .asm_abf5a
	checkevent $00df
	or a
	jp nz, .asm_abf54
	playsfx SFX_5E
	loademote $02, $02, $08
	ld e, $14
	ld a, $16
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_28
	showperson 0
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep 30
	ld c, $11
	ld e, $10
	ld a, $0f
	scall Func_80e8d
	setevent $00df
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TEIL_TOWN
	face_player 0
	hideperson 0
	jp .asm_abf5a
.asm_abf54:
	writetext TreeBitstreamText_3f79e
.asm_abf5a:
	ret

Func_abf5b:
	ld a, e
	or a
	jp nz, .asm_abf79
	checkevent $0048
	or a
	jp nz, .asm_abf73
	writenpctext TreeBitstreamText_3e770
	jp .asm_abf79
.asm_abf73:
	writenpctext TreeBitstreamText_42899
.asm_abf79:
	ret
