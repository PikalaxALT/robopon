
Data_b5f35:
	warpdef $0c, $05, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5f40:
	person_event $1a, $04, $0c, $0a, $01, $01, $02, $04, $00, NULL, NULL
	person_event $19, $0c, $0c, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $0e, $01, $01, $00, $04, $01, Func_b6117, NULL

Data_b5f6a:
	person_event $19, $0c, $0c, $0b, $01, $01, $02, $04, $00, Func_b6291, NULL
	person_event $1e, $0c, $0b, $0a, $01, $01, $02, $04, $00, Func_b634c, NULL
	person_event $1f, $0c, $0d, $0a, $01, $01, $02, $04, $00, Func_b6422, NULL
	person_event $20, $0c, $0a, $09, $01, $01, $02, $04, $00, Func_b6501, NULL
	person_event $21, $0c, $0c, $09, $01, $01, $02, $04, $00, Func_b65e9, NULL
	person_event $0d, $0c, $0e, $09, $01, $01, $02, $04, $00, Func_b66d1, NULL

Func_b5fbe:: ; b5fbe
	ld e, $01
	ld hl, Data_b5f35
	scall LoadWarps
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_b5fe2
	ld e, $03
	ld hl, Data_b5f40
	scall LoadMapObjects
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	jp .asm_b60c9
.asm_b5fe2:
	ld hl, $005a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60c9
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e5
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e6
	scall CheckEventFlag
	or a
	jp nz, .asm_b60c9
.asm_b6029:
	ld e, $06
	ld hl, Data_b5f6a
	scall LoadMapObjects
	ld hl, $00e1
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b604b
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $01
	scall Func_80080
.asm_b604b:
	ld hl, $00e2
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b6066
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $02
	scall Func_80080
.asm_b6066:
	ld hl, $00e3
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b6081
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $03
	scall Func_80080
.asm_b6081:
	ld hl, $00e4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b609c
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $04
	scall Func_80080
.asm_b609c:
	ld hl, $00e5
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60b7
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $05
	scall Func_80080
.asm_b60b7:
	ld hl, $00e6
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60c9
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
.asm_b60c9:
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	ret

Data_b60d2:
IF DEF(SUN)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $87
	db $06, $39, $04, $00, $00, $7b, $88, $06, $39, $04, $04, $00, $7b, $89, $06, $39
	db $04, $04, $04, $7c, $12, $07, $39, $1d, $1d, $1d, $09, $01, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $84
	db $06, $39, $03, $00, $00, $7b, $85, $06, $39, $03, $03, $00, $7b, $86, $06, $39
	db $03, $03, $03, $7c, $12, $07, $39, $1a, $1a, $1a, $09, $01, $0c
ENDC

Data_b60fb:
	db $0c, $0c, $ff, $ff

Data_b60ff:
	db $0c, $07, $08, $07, $ff, $ff

Data_b6105:
	db $08, $10, $08, $10, $ff, $ff

Data_b610b:
	db $0c, $0d, $ff, $ff

Data_b610f:
	db $0c, $10, $08, $07, $0c, $05, $ff, $ff

Func_b6117:
	ld a, e
	cp $02
	jp nz, .asm_b625f
	xor a
	scall PlayMusic
	scall AllocateSpaceForWarps
	ld c, $01
	ld de, Data_b60fb
	ld a, $2d
	scall MovePlayer
	ld a, $01
	scall PlayMusic
	ld hl, $014a
	scall PrintTextWithNPCName
	ld de, Data_b6260
	ld hl, Data_b60d2
	scall ScriptedBattle
	or a
	jp nz, .asm_b6149
	jp .asm_b625f
.asm_b6149:
	ld hl, $014b
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $0a
	ld a, $0c
	scall MoveEmote
	ld a, $01
	scall FadeInAudio
	ld a, $43
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld hl, $003c
	scall ScriptSleep
	scall StartShakingScreen
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	scall WaitEmote
	ld a, $28
	scall PlaySFX
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	xor a
.asm_b61a2:
	cp $04
	jp nc, .asm_b61b3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61a2
.asm_b61b3:
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $18
	scall PlayMusic
	ld hl, $0078
	scall ScriptSleep
	ld bc, Data_b60ff
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	ld bc, Data_b6105
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	ld a, $01
	scall SpriteFace
	xor a
.asm_b61ec:
	cp $02
	jp nc, .asm_b61fe
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61ec
.asm_b61fe:
	ld a, $02
	scall PlayerFace
	xor a
.asm_b6204:
	cp $02
	jp nc, .asm_b6216
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b6204
.asm_b6216:
	ld bc, Data_b610b
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	scall StopShakingScreen
	ld hl, $014c
	scall PrintTextWithNPCName
	scall StartShakingScreen
	ld bc, Data_b610f
	ld e, $2d
	ld a, $01
	scall MovePerson
	ld c, $01
	ld de, Data_b610f
	ld a, $2d
	scall MovePlayer
	scall WaitNPCStep
	scall StopShakingScreen
	ld l, $05
	push hl
	ld c, $07
	ld e, $00
	ld a, $1a
	scall Func_80dff
	pop bc
.asm_b625f:
	ret

Data_b6260:
	dstr "セﾞロ"

Data_b6264:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $46, $07, $28, $07, $07, $07, $6b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $05, $07, $28, $03, $03, $01, $09, $01, $0b
ENDC

Data_b628d:
	db $0c, $0b, $ff, $ff

Func_b6291:
	push af
	ld a, e
	or a
	jp nz, .asm_b6312
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0442
	scall PrintTextWithNPCName
	ld de, Data_b6314
	ld hl, Data_b6264
	scall ScriptedBattle
	or a
	jp nz, .asm_b62b3
	jp .asm_b6312
.asm_b62b3:
	ld hl, $0443
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $18
	scall PlayMusic
	ld hl, $0078
	scall ScriptSleep
	xor a
.asm_b62d3:
	cp $04
	jp nc, .asm_b62e5
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b62d3
.asm_b62e5:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	ld bc, Data_b628d
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	ld hl, $00e1
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b6312:
	pop bc
	ret

Data_b6314:
	dstr "ヒﾞスコ"

Data_b6319:
	db $00, $00, $00, $04, $32, $c5, $bd, $00, $00, $90, $01, $0e, $06, $2d, $04, $17
	db $00, $53, $38, $06, $2d, $0e, $0b, $00, $1b, $18, $06, $2d, $09, $09, $0b, $1c
	db $07, $07, $2d, $01, $13, $00, $63, $01, $0b

Data_b6342:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b6348:
	db $0c, $0b, $ff, $ff

Func_b634c:
	push af
	ld a, e
	or a
	jp nz, .asm_b63e6
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp nz, .asm_b6373
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b63e6
.asm_b6373:
	ld hl, $0444
	scall PrintTextWithNPCName
	ld de, Data_b63e8
	ld hl, Data_b6319
	scall ScriptedBattle
	or a
	jp nz, .asm_b6389
	jp .asm_b63e6
.asm_b6389:
	ld hl, $0445
	scall PrintTextWithNPCName
	xor a
.asm_b6390:
	cp $04
	jp nc, .asm_b63a2
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6390
.asm_b63a2:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b63c1
	ld bc, Data_b6342
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b63cd
.asm_b63c1:
	ld bc, Data_b6348
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b63cd:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e2
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b63e6:
	pop bc
	ret

Data_b63e8:
	dstr "アムロン"

Data_b63ed:
	db $00, $00, $00, $04, $32, $c5, $be, $00, $00, $4e, $01, $3a, $06, $32, $07, $0b
	db $00, $49, $0f, $06, $32, $28, $12, $00, $6a, $21, $06, $32, $0c, $0f, $00, $7a
	db $3b, $07, $32, $07, $09, $00, $4a, $01, $0b

Data_b6416:
	db $0b, $0b, $0c, $0b, $ff, $ff

Data_b641c:
	db $0b, $0a, $0c, $0b, $ff, $ff

Func_b6422:
	push af
	ld a, e
	or a
	jp nz, .asm_b64c6
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b6442
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp nz, .asm_b6453
.asm_b6442:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b64c6
.asm_b6453:
	ld hl, $0446
	scall PrintTextWithNPCName
	ld de, Data_b64c8
	ld hl, Data_b63ed
	scall ScriptedBattle
	or a
	jp nz, .asm_b6469
	jp .asm_b64c6
.asm_b6469:
	ld hl, $0447
	scall PrintTextWithNPCName
	xor a
.asm_b6470:
	cp $04
	jp nc, .asm_b6482
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6470
.asm_b6482:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b64a1
	ld bc, Data_b6416
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b64ad
.asm_b64a1:
	ld bc, Data_b641c
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b64ad:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e3
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b64c6:
	pop bc
	ret

Data_b64c8:
	dstr "ワイルトﾞ"

Data_b64ce:
	db $00, $00, $00, $04, $32, $c5, $bf, $00, $00, $75, $01, $31, $06, $37, $07, $0c
	db $00, $48, $73, $06, $37, $0c, $08, $00, $49, $74, $06, $37, $0d, $09, $00, $49
	db $32, $07, $37, $07, $07, $14, $4a, $01, $0b

Data_b64f7:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b64fd:
	db $0c, $0b, $ff, $ff

Func_b6501:
	push af
	ld a, e
	or a
	jp nz, .asm_b65af
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b652b
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b652b
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp nz, .asm_b653c
.asm_b652b:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b65af
.asm_b653c:
	ld hl, $0448
	scall PrintTextWithNPCName
	ld de, Data_b65b1
	ld hl, Data_b64ce
	scall ScriptedBattle
	or a
	jp nz, .asm_b6552
	jp .asm_b65af
.asm_b6552:
	ld hl, $0449
	scall PrintTextWithNPCName
	xor a
.asm_b6559:
	cp $04
	jp nc, .asm_b656b
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6559
.asm_b656b:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b658a
	ld bc, Data_b64f7
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6596
.asm_b658a:
	ld bc, Data_b64fd
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6596:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e4
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b65af:
	pop bc
	ret

Data_b65b1:
	dstr "カマット"

Data_b65b6:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0d, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0a, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ENDC

Data_b65df:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b65e5:
	db $0c, $0b, $ff, $ff

Func_b65e9:
	push af
	ld a, e
	or a
	jp nz, .asm_b66a1
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp nz, .asm_b662e
.asm_b661d:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b66a1
.asm_b662e:
	ld hl, $044a
	scall PrintTextWithNPCName
	ld de, Data_b66a3
	ld hl, Data_b65b6
	scall ScriptedBattle
	or a
	jp nz, .asm_b6644
	jp .asm_b66a1
.asm_b6644:
	ld hl, $044b
	scall PrintTextWithNPCName
	xor a
.asm_b664b:
	cp $04
	jp nc, .asm_b665d
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b664b
.asm_b665d:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b667c
	ld bc, Data_b65df
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6688
.asm_b667c:
	ld bc, Data_b65e5
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6688:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e5
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b66a1:
	pop bc
	ret

Data_b66a3:
	dstr "ヘットﾞ"

Data_b66a8:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $03, $03, $03
	db $7b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $04, $04, $04
	db $7b, $01, $0b
ENDC

Func_b66d1:
	push af
	ld a, e
	or a
	jp nz, .asm_b6751
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e5
	scall CheckEventFlag
	or a
	jp nz, .asm_b6720
.asm_b670f:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b6751
.asm_b6720:
	ld hl, $044c
	scall PrintTextWithNPCName
	ld de, Data_b6753
	ld hl, Data_b66a8
	scall ScriptedBattle
	or a
	jp nz, .asm_b6736
	jp .asm_b6751
.asm_b6736:
	ld hl, $044d
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $00e6
	scall EventFlagAction
	ld l, $1a
	push hl
	ld c, $0f
	ld e, $0a
	ld a, $19
	scall Func_80dff
	pop bc
.asm_b6751:
	pop bc
	ret

Data_b6753:
	dstr "テール"
