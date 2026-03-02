
Data_ad0b4:
	warpdef $06, $0c, $04, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $07, $05, $02, $01, MAP_30_13, $0d, $0f, $0d, $0e, SFX_2E

Data_ad0ca:
	wildbot $04, $06, $0b, $17, $69, $24, $27, $7a, $05, $0f, $00, $10, $0a, $00
	wildbot $04, $06, $0b, $17, $31, $24, $27, $7a, $06, $1e, $00, $11, $0a, $00
	wildbot $04, $06, $0b, $17, $43, $24, $27, $7a, $06, $07, $00, $10, $0a, $00

Data_ad0f4:
	dtext_tree_pointer TreeBitstreamText_466f0
	dw -1

Data_ad0f8:
	person_event $ff, $00, $06, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b, Data_ad0f4
	person_event $ff, $00, $09, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b, Data_ad0f4

Data_ad114:
	person_event $19, $0c, $08, $05, $01, $01, $02, $04, $00, NULL, NULL

Func_ad122:: ; ad122
	ld a, $0f
	ld [wc7e2], a
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_ad0ca
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ad152
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ad152
	loadpeople $01, Data_ad114
	call Func_ad225
	jp .asm_ad1c5
.asm_ad152:
	loadwarps $02, Data_ad0b4
	loadpeople $02, Data_ad0f8
	checkevent $0034
	or a
	jp nz, .asm_ad18a
	playmusic SONG_NONE
	ld a, $01
	scall LoadPlayerSprite
	xor a
	scall Func_80653
	scall StartShakingScreen
	playsfx SFX_65
	scall Func_8001c
	call Func_ad1c6
	jp .asm_ad1c5
.asm_ad18a:
	checkevent $00c3
	or a
	jp nz, .asm_ad1b8
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ad1b8
	checkevent $0035
	or a
	jp nz, .asm_ad1b8
	scall Func_8001c
	call Func_ad302
	playmusic SONG_NONE
	playmusic SONG_PRINCE_TEIL
	jp .asm_ad1c5
.asm_ad1b8:
	ld a, $01
	scall LoadPlayerSprite
	playmusic SONG_PRINCE_TEIL
	scall Func_8001c
.asm_ad1c5:
	ret

Func_ad1c6:
	playsfx SFX_65
	loademote $05, $02, $14
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	playsfx SFX_65
	loademote $01, $01, $14
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_65
	writenpctext TreeBitstreamText_3e01f
	scall StopShakingScreen
	warp_player MAP_31_02, $09, $0a
	pop bc
	ret

Data_ad215:
	db $08, $08, $ff, $ff

Data_ad219:
	db $07, $08, $ff, $ff

Data_ad21d:
	db $08, $0c, $ff, $ff

Data_ad221:
	db $07, $0c, $ff, $ff

Func_ad225:
	hideperson 0
	xor a
	scall Func_80653
	scall StartShakingScreen
	scall Func_8001c
	script_sleep 120
	playsfx SFX_65
	loademote $05, $02, $14
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	script_sleep 60
	showperson 0
	move_person 0, Data_ad215, 1
	scall WaitNPCStep
	sprite_face $00, 0
	script_sleep 30
	playsfx SFX_65
	loademote $05, $02, $14
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	script_sleep 60
	ld a, $02
	scall PlayerFace
	ld a, $01
	scall Func_80653
	playsfx SFX_65
	loademote $01, $01, $14
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	move_player $01, Data_ad219
	move_person 0, Data_ad21d, 0
	move_player $01, Data_ad221
	scall WaitNPCStep
	scall StopShakingScreen
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_NONE
	ld l, $05
	push hl
	ld c, $04
	ld e, $02
	xor a
	scall Func_80dff
	pop bc
	ret
Func_ad302:
	warp_player MAP_25_01, $19, $06
	pop bc
	ret
