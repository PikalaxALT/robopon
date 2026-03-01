
Data_b53c1:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b53cc:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E
	warpdef $07, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_b53e2:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $54, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $28, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $12, $06, $06, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b5428:
	person_event $19, $0c, $0c, $0b, $01, $01, $03, $04, $00, NULL, NULL

Data_b5436:
	person_event $ff, $00, $0d, $02, $01, $01, $00, $04, $01, Func_b5576, NULL
	person_event $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, Func_b55be, NULL

Func_b5452:: ; b5452
	ld a, [wc790]
	or a
	jp z, .asm_b5475
	ld a, [wc790]
	cp $03
	jp nc, .asm_b5475
	call Func_b556c
	ld hl, Func_b556c
	scall Func_80f11
	loadwarps $02, Data_b53cc
	jp .asm_b547d
.asm_b5475:
	loadwarps $01, Data_b53c1
.asm_b547d:
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b53e2
	ld a, $0f
	ld [wc7e2], a
	checkevent $0034
	or a
	jp nz, .asm_b54c0
	loadpeople $01, Data_b5428
	loadpeople $02, Data_b5436
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
	call Func_b5526
	setevent $0034
	jp .asm_b551f
.asm_b54c0:
	loadpeople $02, Data_b5436
	playmusic $09
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5516
	ld a, [wBackupMapNumber]
	cp $08
	jp nz, .asm_b5516
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_b5516
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b5516
	checkevent $00ff
	or a
	jp nz, .asm_b550a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
	call Func_b55fd
	jp .asm_b5513
.asm_b550a:
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
.asm_b5513:
	jp .asm_b551f
.asm_b5516:
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
.asm_b551f:
	ret

Data_b5520:
	db $0c, $0c, $0b, $0c, $ff, $ff

Func_b5526:
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $18
	ld hl, $012a
	scall PrintTextWithNPCName
	playmusic $18
	move_person 0, Data_b5520, 1
	scall WaitNPCStep
	playsfx $2e
	hideperson 0
	playmusic $09
	ret

Data_b5566:
	db $0d, $02, $01, $01, $07, $01

Func_b556c:
	ld hl, Data_b5566
	scall Func_80d9b
	scall Func_80f02
	ret

Func_b5576:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b55bb
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b55a6
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b55ae
.asm_b55a6:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b55ae:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b55bb:
	pop bc
	pop bc
	ret

Func_b55be:
	ld a, e
	cp $02
	jp nz, .asm_b55fc
	ld hl, $00b4
	scall LandmarkSign
	resetevent $00fe
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $0c
	push hl
	ld c, $0b
	ld e, $08
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b55fc:
	ret

Func_b55fd:
	playmusic $09
	ld a, $02
	scall PlayerFace
	loademote $01, $02, $09
	playsfx $37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	setevent $00ff
	ret
