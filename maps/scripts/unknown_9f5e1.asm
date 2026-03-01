
Data_9f5a1:
	warpdef $13, $16, $01, $01, MAP_19_02, $05, $1a, $05, $19, SFX_2E
	warpdef $0e, $04, $03, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E

Data_9f5b7:
IF DEF(SUN)
	wildbot $05, $0a, $10, $14, $5f, $1e, $21, $79, $05, $06, $00, $05, $0a, $00
	wildbot $05, $0a, $10, $14, $34, $1e, $21, $1a, $17, $05, $1e, $05, $0a, $00,
	wildbot $05, $0a, $10, $14, $26, $1e, $21, $5d, $01, $01, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $05, $0a, $10, $14, $26, $1e, $21, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $05, $0a, $10, $14, $34, $1e, $21, $1a, $17, $05, $1e, $05, $0a, $00,
	wildbot $05, $0a, $10, $14, $5f, $1e, $21, $79, $05, $06, $00, $05, $0a, $00
ENDC

Func_9f5e1:: ; 9f5e1
	ld a, $11
	ld [wc7e2], a
	loadwarps $02, Data_9f5a1
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_9f5b7
	ld a, [wBackupMapGroup]
	cp $20
	jp nz, .asm_9f632
	ld a, [wBackupMapNumber]
	cp $0b
	jp nz, .asm_9f632
	checkevent $00f9
	or a
	jp nz, .asm_9f627
	playmusic SONG_JUMP_MINIGAME
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_9f63b
	jp .asm_9f62f
.asm_9f627:
	playmusic SONG_PRINCE_TEIL
	scall Func_8001c
.asm_9f62f:
	jp .asm_9f63a
.asm_9f632:
	playmusic SONG_PRINCE_TEIL
	scall Func_8001c
.asm_9f63a:
	ret

Func_9f63b:
	loademote $01, $08, $26
	scall WaitEmote
	ld a, $02
	scall PlayerFace
	ld a, $01
	scall Func_80653
	script_sleep 1
	scall HideEmote
	script_sleep 30
	playmusic SONG_NONE
	playmusic SONG_PRINCE_TEIL
	setevent $00f9
	ret
