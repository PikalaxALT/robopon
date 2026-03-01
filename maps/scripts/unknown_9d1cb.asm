
Data_9d0b4:
	warpdef $11, $1c, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $1b, $0e, $01, $01, MAP_18_01, $03, $0b, $03, $0a, SFX_34
	warpdef $1e, $1a, $01, $01, MAP_18_10, $05, $15, $05, $14, SFX_2E

Data_9d0d5:
IF DEF(SUN)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4d, $20, $25, $39, $2a, $12, $00, $10, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ELIF DEF(STAR)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4c, $20, $25, $46, $01, $01, $01, $05, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ENDC

Data_9d10d:
	dtext_tree_pointer TreeBitstreamText_42df1
	dw -1

Data_9d111:
	dtext_tree_pointer TreeBitstreamText_43c84
	dw -1

Data_9d115:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, Func_9d36b, NULL
	person_event $ff, $00, $0b, $07, $01, $01, $00, $04, $00, Func_9d3a1, NULL
	person_event $ff, $00, $0b, $14, $01, $01, $00, $04, $00, Func_9d3d7, NULL
	person_event $ff, $00, $11, $18, $01, $01, $00, $04, $00, Func_9d42b, NULL
	person_event $ff, $00, $19, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9d10d

Data_9d15b:
	person_event $0f, $04, $1d, $1b, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0a, $0c, $23, $1b, $01, $01, $00, $04, $00, NULL, NULL
	person_event $08, $04, $20, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d185:
	person_event $0a, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_808fc_27, Data_9d111

Data_9d193:
	person_event $06, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_9daea, NULL
	person_event $1d, $04, $1e, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d1af:
	person_event $0f, $04, $1e, $0e, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $1e, $0e, $01, $01, $02, $04, $00, Func_9db30, NULL

Func_9d1cb:: ; 9d1cb
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$02
	scall Func_80f94
	ld hl, sp+$05
	ld l, [hl]
	ld h, $00
	ld de, $003c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$06
	ld l, [hl]
	ld h, $00
	add hl, de
	pop de
	push hl
	ld a, $0b
	ld [wc7e2], a
	ld hl, $00f2
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9d203
	ld a, $06
	ld [wc795], a
	jp .asm_9d207
.asm_9d203:
	xor a
	ld [wc795], a
.asm_9d207:
	call Func_9d344
	ld hl, Func_9d344
	scall Func_80f11
	ld e, $00
	ld hl, $0010
	scall EventFlagAction
	ld e, $03
	ld hl, Data_9d0b4
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9d0d5
	scall LoadEncounters
	ld a, $03
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	ld e, $02
	ld hl, Data_9d1af
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, [wBackupMapGroup]
	cp $12
	jp nz, .asm_9d255
	ld a, [wBackupMapNumber]
	cp $01
	jp z, .asm_9d25d
.asm_9d255:
	ld a, [wBackupMapGroup]
	cp $ff
	jp nz, .asm_9d2ab
.asm_9d25d:
	ld hl, $00b9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9d29d
	ld e, $02
	ld hl, Data_9d193
	scall LoadMapObjects
	pop hl
	push hl
	ld de, $0438
	call CompareHLtoDE
	jp c, .asm_9d290
	pop hl
	push hl
	ld de, $04b0
	call CompareHLtoDE
	jp nc, .asm_9d290
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	jp .asm_9d297
.asm_9d290:
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
.asm_9d297:
	scall Func_8001c
	jp .asm_9d2a8
.asm_9d29d:
	ld e, $01
	ld hl, Data_9d185
	scall LoadMapObjects
	scall Func_8001c
.asm_9d2a8:
	jp .asm_9d31f
.asm_9d2ab:
	ld a, [wBackupMapGroup]
	cp $12
	jp nz, .asm_9d31c
	ld a, [wBackupMapNumber]
	cp $11
	jp nz, .asm_9d31c
	ld hl, $00bb
	scall CheckEventFlag
	or a
	jp z, .asm_9d2ed
	ld hl, $00bc
	scall CheckEventFlag
	or a
	jp z, .asm_9d2ed
	ld hl, $00bd
	scall CheckEventFlag
	or a
	jp z, .asm_9d2ed
	ld hl, $00be
	scall CheckEventFlag
	or a
	jp z, .asm_9d2ed
	ld hl, $00ee
	scall CheckEventFlag
	or a
	jp nz, .asm_9d316
.asm_9d2ed:
	ld e, $03
	ld hl, Data_9d15b
	scall LoadMapObjects
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld a, $12
	ld [wBackupMapGroup], a
	ld a, $0a
	ld [wBackupMapNumber], a
	scall Func_8001c
	call Func_9d4a7
	jp .asm_9d319
.asm_9d316:
	scall Func_8001c
.asm_9d319:
	jp .asm_9d31f
.asm_9d31c:
	scall Func_8001c
.asm_9d31f:
	ld e, $05
	ld hl, Data_9d115
	scall LoadMapObjects
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_9d32c:
	db $00, $00, $01, $01, $17, $09

Data_9d332:
	db $00, $00, $01, $01, $17, $14

Data_9d338:
	db $06, $04, $01, $01, $17, $09

Data_9d33e:
	db $06, $04, $01, $01, $17, $14

Func_9d344:
	ld a, [wc795]
	cp $06
	jp z, .asm_9d35b
	ld hl, Data_9d32c
	scall Func_80d9b
	ld hl, Data_9d332
	scall Func_80d9b
	jp .asm_9d367
.asm_9d35b:
	ld hl, Data_9d338
	scall Func_80d9b
	ld hl, Data_9d33e
	scall Func_80d9b
.asm_9d367:
	scall Func_80f02
	ret

Func_9d36b:
	ld a, e
	or a
	jp nz, .asm_9d3a0
	ld a, [wc795]
	cp $06
	jp z, .asm_9d3a0
	ld a, [wc795]
	cp $03
	jp z, .asm_9d388
	ld a, [wc795]
	cp $04
	jp nz, .asm_9d396
.asm_9d388:
	ld a, $04
	ld [wc795], a
	ld hl, $0198
	scall PrintTextStandard
	jp .asm_9d3a0
.asm_9d396:
	xor a
	ld [wc795], a
	ld hl, $0361
	scall PrintTextStandard
.asm_9d3a0:
	ret

Func_9d3a1:
	ld a, e
	or a
	jp nz, .asm_9d3d6
	ld a, [wc795]
	cp $06
	jp z, .asm_9d3d6
	ld a, [wc795]
	cp $02
	jp z, .asm_9d3be
	ld a, [wc795]
	cp $03
	jp nz, .asm_9d3cc
.asm_9d3be:
	ld a, $03
	ld [wc795], a
	ld hl, $045a
	scall PrintTextStandard
	jp .asm_9d3d6
.asm_9d3cc:
	xor a
	ld [wc795], a
	ld hl, $0361
	scall PrintTextStandard
.asm_9d3d6:
	ret

Func_9d3d7:
	ld a, e
	or a
	jp nz, .asm_9d42a
	ld a, [wc795]
	cp $06
	jp z, .asm_9d42a
	ld a, [wc795]
	cp $01
	jp z, .asm_9d3f4
	ld a, [wc795]
	cp $02
	jp nz, .asm_9d402
.asm_9d3f4:
	ld a, $02
	ld [wc795], a
	ld hl, $035f
	scall PrintTextStandard
	jp .asm_9d42a
.asm_9d402:
	ld a, [wc795]
	cp $04
	jp z, .asm_9d412
	ld a, [wc795]
	cp $05
	jp nz, .asm_9d420
.asm_9d412:
	ld a, $05
	ld [wc795], a
	ld hl, $0459
	scall PrintTextStandard
	jp .asm_9d42a
.asm_9d420:
	xor a
	ld [wc795], a
	ld hl, $0361
	scall PrintTextStandard
.asm_9d42a:
	ret

Func_9d42b:
	ld a, e
	or a
	jp nz, .asm_9d4a2
	ld a, [wc795]
	cp $06
	jp z, .asm_9d49c
	ld a, [wc795]
	or a
	jp z, .asm_9d447
	ld a, [wc795]
	cp $01
	jp nz, .asm_9d455
.asm_9d447:
	ld a, $01
	ld [wc795], a
	ld hl, $035d
	scall PrintTextStandard
	jp .asm_9d499
.asm_9d455:
	ld a, [wc795]
	cp $05
	jp nz, .asm_9d48e
	ld a, $06
	ld [wc795], a
	ld hl, $035e
	scall PrintTextStandard
	ld hl, $003c
	scall ScriptSleep
	scall StartShakingScreen
	ld hl, $0078
	scall ScriptSleep
	ld hl, $0360
	scall PrintTextStandard
	scall StopShakingScreen
	call Func_9d344
	ld e, $01
	ld hl, $00f2
	scall EventFlagAction
	jp .asm_9d499
.asm_9d48e:
	ld a, $01
	ld [wc795], a
	ld hl, $0361
	scall PrintTextStandard
.asm_9d499:
	jp .asm_9d4a2
.asm_9d49c:
	ld hl, $0284
	scall PrintTextStandard
.asm_9d4a2:
	ret

Data_9d4a3:
	db $21, $1b, $ff, $ff

Func_9d4a7:
	ld hl, $001e
	scall ScriptSleep
	ld hl, $03b2
	scall PrintTextWithNPCName
	ld a, $67
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $2a
	scall LoadEmote
	xor a
	scall Func_80653
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld bc, Data_9d4a3
	ld e, $27
	ld a, $03
	scall MovePerson
	ld a, $01
	scall PlayerFace
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld hl, $00bb
	scall CheckEventFlag
	or a
	jp nz, .asm_9d50d
	call Func_9d56e
	ld e, $01
	ld hl, $00bb
	scall EventFlagAction
	jp .asm_9d56a
.asm_9d50d:
	ld hl, $00bc
	scall CheckEventFlag
	or a
	jp nz, .asm_9d525
	call Func_9d61e
	ld e, $01
	ld hl, $00bc
	scall EventFlagAction
	jp .asm_9d56a
.asm_9d525:
	ld hl, $00bd
	scall CheckEventFlag
	or a
	jp nz, .asm_9d53d
	call Func_9d6ce
	ld e, $01
	ld hl, $00bd
	scall EventFlagAction
	jp .asm_9d56a
.asm_9d53d:
	ld hl, $00be
	scall CheckEventFlag
	or a
	jp nz, .asm_9d555
	call Func_9d77e
	ld e, $01
	ld hl, $00be
	scall EventFlagAction
	jp .asm_9d56a
.asm_9d555:
	ld hl, $00ee
	scall CheckEventFlag
	or a
	jp nz, .asm_9d56a
	call Func_9d83b
	ld e, $01
	ld hl, $00ee
	scall EventFlagAction
.asm_9d56a:
	call Func_9d8fa
	ret

Func_9d56e:
	ld hl, $0272
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0273
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $06
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0274
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $03
	scall PlayMusic
	ld a, $68
	scall PlaySFX
	ld hl, $002d
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $0275
	scall PrintTextWithNPCName
	ret

Func_9d61e:
	ld hl, $0277
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0273
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $18
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0274
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $03
	scall PlayMusic
	ld a, $68
	scall PlaySFX
	ld hl, $002d
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $0278
	scall PrintTextWithNPCName
	ret

Func_9d6ce:
	ld hl, $0279
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $0273
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $60
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0274
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $03
	scall PlayMusic
	ld a, $68
	scall PlaySFX
	ld hl, $002d
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $027a
	scall PrintTextWithNPCName
	ret

Func_9d77e:
	ld hl, $027b
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $027c
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $03
	ld a, $23
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $19
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $04
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0274
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $03
	scall PlayMusic
	ld a, $68
	scall PlaySFX
	ld hl, $002d
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $027d
	scall PrintTextWithNPCName
	ret

Data_9d837:
	db $20, $1b, $ff, $ff

Func_9d83b:
	ld hl, $027e
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $027f
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $22
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	ld c, $1b
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $0c
	ld a, $23
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld bc, Data_9d837
	ld e, $27
	ld a, $03
	scall MovePerson
	scall WaitNPCStep
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	scall WaitEmote
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0274
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $03
	scall PlayMusic
	ld a, $68
	scall PlaySFX
	ld hl, $002d
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $0280
	scall PrintTextWithNPCName
	ret

Data_9d8ee:
	db $23, $1b, $ff, $ff

Data_9d8f2:
	db $1f, $1b, $ff, $ff

Data_9d8f6:
	db $20, $1b, $ff, $ff

Func_9d8fa:
	push bc
	ld hl, sp+$00
	ld [hl], $00
	ld hl, $0053
	scall CheckEventFlag
	or a
	jp nz, .asm_9d910
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d910:
	ld hl, $0054
	scall CheckEventFlag
	or a
	jp nz, .asm_9d921
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d921:
	ld hl, $0055
	scall CheckEventFlag
	or a
	jp nz, .asm_9d932
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d932:
	ld hl, $0056
	scall CheckEventFlag
	or a
	jp nz, .asm_9d943
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d943:
	ld hl, $0057
	scall CheckEventFlag
	or a
	jp nz, .asm_9d954
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9d954:
	ld hl, sp+$00
	ld a, [hl]
	or a
	jp z, .asm_9da64
	cp $01
	jp z, .asm_9d9fd
	cp $02
	jp z, .asm_9d96f
	cp $03
	jp z, .asm_9d96f
	cp $04
	jp nz, .asm_9dae4
.asm_9d96f:
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0276
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld bc, Data_9d8f2
	ld e, $27
	ld a, $02
	scall MovePerson
	ld bc, Data_9d8f6
	ld e, $27
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $20
	ld a, $23
	scall LoadEmote
	ld e, $1b
	ld a, $1f
	scall MoveEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
	ld bc, Data_9d8f2
	ld e, $27
	ld a, $02
	scall MovePerson
	scall WaitNPCStep
	ld e, $01
	ld a, $03
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $03
	ld a, $03
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_9d8ee
	ld e, $27
	ld a, $03
	scall MovePerson
	scall WaitNPCStep
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld a, $2e
	scall PlaySFX
	jp .asm_9dae4
.asm_9d9fd:
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0276
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $20
	ld a, $23
	scall LoadEmote
	ld e, $19
	ld a, $20
	scall MoveEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_9d8ee
	ld e, $27
	ld a, $03
	scall MovePerson
	ld bc, Data_9d8ee
	ld e, $27
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld a, $2e
	scall PlaySFX
	jp .asm_9dae4
.asm_9da64:
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $10
	ld a, $23
	scall LoadEmote
	ld e, $1b
	ld a, $1e
	scall MoveEmote
	ld c, $19
	ld e, $20
	ld a, $02
	scall Func_80080
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld a, $33
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $33
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $33
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $33
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld hl, $0276
	scall PrintTextWithNPCName
	ld a, $59
	scall PlaySFX
	ld c, $01
	ld e, $20
	ld a, $23
	scall LoadEmote
	ld e, $19
	ld a, $20
	scall MoveEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
.asm_9dae4:
	pop bc
	ret

Data_9dae6:
	db $1d, $1b, $ff, $ff

Func_9daea:
	ld a, e
	or a
	jp nz, .asm_9db2f
	ld a, $02
	scall FacePlayer
	ld hl, $0010
	scall CheckEventFlag
	or a
	jp nz, .asm_9db29
	ld hl, $0281
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_9dae6
	ld e, $27
	ld a, $02
	scall MovePerson
	scall WaitNPCStep
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld e, $01
	ld hl, $0010
	scall EventFlagAction
	jp .asm_9db2f
.asm_9db29:
	ld hl, $0281
	scall PrintTextWithNPCName
.asm_9db2f:
	ret

Func_9db30:
	ld a, e
	or a
	jp nz, .asm_9dc23
	ld hl, $00dc
	scall CheckEventFlag
	or a
	jp nz, .asm_9dc1d
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $0e
	ld a, $1e
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	xor a
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $0c
	ld e, $09
	ld a, $06
	scall Func_80e8d
	ld e, $01
	ld hl, $00dc
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $03
	scall PlayMusic
	xor a
	scall FacePlayer
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_9dc23
.asm_9dc1d:
	ld hl, $015c
	scall PrintTextStandard
.asm_9dc23:
	ret
