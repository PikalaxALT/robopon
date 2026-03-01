
Data_a50b4:
	warpdef $14, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $06, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, SFX_34

Data_a50ca:
	dtext_tree_pointer TreeBitstreamText_46686
	dw -1

Data_a50ce:
	dtext_tree_pointer TreeBitstreamText_466b3
	dw -1

Data_a50d2:
	person_event $02, $0c, $08, $06, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $12, $05, $01, $01, $00, $04, $01, Func_a5264, NULL
	person_event $ff, $00, $09, $0d, $01, $01, $00, $04, $01, Func_a5264, NULL

Data_a50fc:
	person_event $ff, $00, $13, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ca
	person_event $ff, $00, $13, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ce

Data_a5118:
	person_event $ff, $00, $09, $0f, $01, $01, $00, $04, $01, Func_a5398, NULL

Func_a5126:: ; a5126
	ld a, $0a
	ld [wc7e2], a
	loadwarps $02, Data_a50b4
	playmusic $03
	checkevent $002e
	cp $01
	jp nz, .asm_a5163
	checkevent $002f
	cp $01
	jp nz, .asm_a5163
	checkevent $0044
	or a
	jp nz, .asm_a5163
	loadpeople $03, Data_a50d2
	jp .asm_a516b
.asm_a5163:
	loadpeople $01, Data_a5118
.asm_a516b:
	ld a, $01
	scall LoadPlayerSprite
	loadpeople $02, Data_a50fc
	scall Func_8001c
	ret

Func_a517c:: ; a517c
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	playmusic SONG_NONE
	playmusic $0a
	xor a
	scall Func_80653
	loademote $01, $01, $11
	scall WaitEmote
	script_sleep 60
	pop af
	push af
	cp $02
	jp z, .asm_a51f7
	cp $01
	jp z, .asm_a51d6
	or a
	jp nz, .asm_a5223
	script_sleep 30
	writenpctext TreeBitstreamText_46f46
	script_sleep 60
	writenpctext TreeBitstreamText_46fa5
	jp .asm_a5223
.asm_a51d6:
	loademote $01, $02, $11
	scall WaitEmote
	writenpctext TreeBitstreamText_46f5e
	script_sleep 60
	writenpctext TreeBitstreamText_46fa5
	jp .asm_a5223
.asm_a51f7:
	loademote $01, $02, $11
	scall WaitEmote
	script_sleep 60
	playsfx $28
	loademote $01, $04, $11
	playmusic SONG_NONE
	playmusic $15
	scall WaitEmote
.asm_a5223:
	scall HideEmote
	pop af
	cp $02
	jp nz, .asm_a5247
	playsfx $45
	writenpctext TreeBitstreamText_46f3e
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
	jp .asm_a524c
.asm_a5247:
	ld a, $01
	scall Func_80653
.asm_a524c:
	ret

Data_a524d:
	db $0c, $06, $ff, $ff

Data_a5251:
	db $09, $06, $0c, $06, $ff

Data_a5256:
	db $09, $06, $ff, $ff

Data_a525a:
	db $09, $05, $12, $05, $ff, $ff

Data_a5260:
	db $0b, $06, $ff, $ff

Func_a5264:
	push af
	ld a, e
	cp $02
	jp nz, .asm_a5383
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_a5289
	move_player $01, Data_a524d
	jp .asm_a5293
.asm_a5289:
	move_player $01, Data_a5251
.asm_a5293:
	move_person 0, Data_a5256, 1
	scall WaitNPCStep
	script_sleep 60
	sprite_face $01, 0
	ld a, $03
	scall PlayerFace
	script_sleep 30
	writenpctext TreeBitstreamText_3d302
	ld a, $01
	scall FadeInAudio
	playmusic $1b
	script_sleep 30
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	playsfx $5b
	loademote $01, $0f, $15
	hideperson 0
	xor a
	scall Func_80653
	script_sleep 60
	playsfx $46
	script_sleep 30
	playsfx $46
	script_sleep 30
	playsfx $46
	script_sleep 30
	scall WaitEmote
	showperson 0
	ld a, $01
	scall Func_80653
	scall HideEmote
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	writenpctext TreeBitstreamText_3d354
	scall StartShakingScreen
	playsfx $65
	playmusic SONG_NONE
	playmusic $1b
	move_person 0, Data_a525a, 1
	playsfx $2e
	scall WaitNPCStep
	hideperson 0
	playsfx $65
	move_player $01, Data_a5260
	scall WaitNPCStep
	ld l, $06
	push hl
	ld c, $16
	ld e, $00
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a5383:
	pop bc
	ret

Func_a5385:
	playsfx $45
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
	ret

Func_a5398:
	ld a, e
	cp $02
	jp nz, .asm_a53dd
	checkevent $002d
	cp $01
	jp nz, .asm_a53dd
	ld a, $2a
	scall Func_80e5d
	or a
	jp z, .asm_a53d7
	writetext_yesorno TreeBitstreamText_46f73
	or a
	jp nz, .asm_a53d4
	playsfx $45
	script_sleep 30
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
.asm_a53d4:
	jp .asm_a53dd
.asm_a53d7:
	writetext TreeBitstreamText_46f8a
.asm_a53dd:
	ret
