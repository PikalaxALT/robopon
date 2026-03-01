
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
	ld e, $02
	ld hl, Data_9f5a1
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_9f5b7
	scall LoadEncounters
	ld a, [wBackupMapGroup]
	cp $20
	jp nz, .asm_9f632
	ld a, [wBackupMapNumber]
	cp $0b
	jp nz, .asm_9f632
	ld hl, $00f9
	scall CheckEventFlag
	or a
	jp nz, .asm_9f627
	ld a, $0e
	scall PlayMusic
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_9f63b
	jp .asm_9f62f
.asm_9f627:
	ld a, $13
	scall PlayMusic
	scall Func_8001c
.asm_9f62f:
	jp .asm_9f63a
.asm_9f632:
	ld a, $13
	scall PlayMusic
	scall Func_8001c
.asm_9f63a:
	ret

Func_9f63b:
	ld c, $01
	ld e, $08
	ld a, $26
	scall LoadEmote
	scall WaitEmote
	ld a, $02
	scall PlayerFace
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	ld e, $01
	ld hl, $00f9
	scall EventFlagAction
	ret
