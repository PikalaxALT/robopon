
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
	playmusic SONG_TOWN1
	checkevent EVENT_02E
	cp $01
	jp nz, .asm_a5163
	checkevent EVENT_02F
	cp $01
	jp nz, .asm_a5163
	checkevent EVENT_044
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
	playmusic SONG_0A
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
	playsfx SFX_28
	loademote $01, $04, $11
	playmusic SONG_NONE
	playmusic SONG_GYM_LEADER_BATTLE
	scall WaitEmote
.asm_a5223:
	scall HideEmote
	pop af
	cp $02
	jp nz, .asm_a5247
	playsfx SFX_45
	writenpctext TreeBitstreamText_46f3e
	warp_player MAP_23_00, $13, $18
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
	playmusic SONG_1B
	script_sleep 30
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	playsfx SFX_5B
	loademote $01, $0f, $15
	hideperson 0
	xor a
	scall Func_80653
	script_sleep 60
	playsfx SFX_46
	script_sleep 30
	playsfx SFX_46
	script_sleep 30
	playsfx SFX_46
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
	playsfx SFX_65
	playmusic SONG_NONE
	playmusic SONG_1B
	move_person 0, Data_a525a, 1
	playsfx SFX_2E
	scall WaitNPCStep
	hideperson 0
	playsfx SFX_65
	move_player $01, Data_a5260
	scall WaitNPCStep
	warp_player MAP_24_00, $16, $06
.asm_a5383:
	pop bc
	ret

Func_a5385:
	playsfx SFX_45
	warp_player MAP_23_00, $13, $18
	ret

Func_a5398:
	ld a, e
	cp $02
	jp nz, .asm_a53dd
	checkevent EVENT_02D
	cp $01
	jp nz, .asm_a53dd
	ld a, $2a
	scall Func_80e5d
	or a
	jp z, .asm_a53d7
	writetext_yesorno TreeBitstreamText_46f73
	or a
	jp nz, .asm_a53d4
	playsfx SFX_45
	script_sleep 30
	warp_player MAP_23_00, $13, $18
.asm_a53d4:
	jp .asm_a53dd
.asm_a53d7:
	writetext TreeBitstreamText_46f8a
.asm_a53dd:
	ret
