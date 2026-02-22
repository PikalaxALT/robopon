
Data_910b4:
	warpdef $13, $0d, $01, $01, MAP_07_00, $12, $11, $12, $12, $2e

Data_910bf:
	dtext_tree_pointer TreeBitstreamText_3b7a6
	dw -1

Data_910c3:
	dtext_tree_pointer TreeBitstreamText_409c8
	dw -1

Data_910c7:
	dtext_tree_pointer TreeBitstreamText_40a7a
	dw -1

Data_910cb:
	dtext_tree_pointer TreeBitstreamText_409fd
	dw -1

Data_910cf:
	dtext_tree_pointer TreeBitstreamText_40ac2
	dw -1

Data_910d3:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, NULL, NULL
	person_event $10, $0c, $09, $08, $01, $01, $00, $04, $00, NULL, NULL
	person_event $10, $0c, $0b, $08, $01, $01, $00, $04, $00, NULL, NULL

Data_910fd:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, Func_808fc_24, Data_910bf
	person_event $0e, $0c, $04, $0d, $01, $01, $01, $04, $00, Func_912e5, NULL
	person_event $18, $04, $00, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $10, $04, $03, $04, $01, $01, $02, $04, $00, Func_9141c, NULL
	person_event $10, $04, $11, $04, $01, $01, $02, $04, $00, Func_91431, NULL
	person_event $10, $04, $12, $04, $01, $01, $02, $04, $00, Func_91446, NULL
	person_event $ff, $00, $0a, $09, $01, $01, $00, $04, $00, Func_9145b, NULL
	person_event $01, $04, $0a, $0d, $01, $01, $00, $04, $00, Func_91478, NULL
	person_event $03, $04, $13, $09, $01, $01, $03, $04, $00, PrintTextFacePlayer_24, Data_910c3
	person_event $01, $04, $02, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_24, Data_910c7

Func_91189:: ; 91189
	ld a, $04
	ld [wc789], a
	ld e, $01
	ld hl, Data_910b4
	scall LoadWarps
	ld a, $0f
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	ld a, $06
	ld [wc7e2], a
	ld hl, $0036
	scall CheckEventFlag
	or a
	jp nz, .asm_911c0
	ld e, $03
	ld hl, Data_910d3
	scall LoadMapObjects
	scall Func_8001c
	call Func_91219
	jp .asm_9120c
.asm_911c0:
	ld e, $0a
	ld hl, Data_910fd
	scall LoadMapObjects
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, .asm_911ea
	ld c, $0c
	ld e, $02
	ld a, $01
	scall Func_80080
	ld e, $02
	ld a, $01
	scall SpriteFace
.asm_911ea:
	ld a, [wc790]
	or a
	jp z, .asm_91209
	ld a, [wc790]
	cp $06
	jp nc, .asm_91209
	ld de, Data_910cb
	ld a, $08
	scall SetPersonTextPointer
	ld de, Data_910cf
	ld a, $09
	scall SetPersonTextPointer
.asm_91209:
	scall Func_8001c
.asm_9120c:
	ret

Data_9120d:
	db $0e, $07, $ff, $ff

Data_91211:
	db $03, $04, $ff, $ff

Data_91215:
	db $11, $04, $ff, $ff

Func_91219:
	ld c, $01
	ld de, Data_9120d
	ld a, $24
	scall MovePlayer
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	hltext_tree_pointer TreeBitstreamText_3b676
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_3b6ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_3b6fb
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_3b6ef
	scall PrintTextWithNPCName
	ld e, $01
	xor a
	scall SpriteFace
	hltext_tree_pointer TreeBitstreamText_3b731
	scall PrintTextWithNPCName
	ld e, $02
	xor a
	scall SpriteFace
	hltext_tree_pointer TreeBitstreamText_3b6ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_3b762
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_3b77b
	scall PrintTextWithNPCName
	ld bc, Data_91211
	ld e, $24
	ld a, $01
	scall MovePerson
	ld bc, Data_91215
	ld e, $24
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld hl, $0036
	scall EventFlagAction
	ld a, $07
	scall Func_80c94
	ld l, $07
	push hl
	ld c, $0e
	ld e, $00
	ld a, $08
	scall Func_80dff
	pop bc
	ret

Func_912e5:
	push af
	ld a, e
	or a
	jp nz, .asm_91332
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, .asm_9132c
	ld hl, $005c
	scall CheckEventFlag
	or a
	jp nz, .asm_91326
	hltext_tree_pointer TreeBitstreamText_3b7f7
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_9131d
	ld e, $01
	ld hl, $005c
	scall EventFlagAction
	call Func_91342
	jp .asm_91323
.asm_9131d:
	hltext_tree_pointer TreeBitstreamText_3b8b8
	scall PrintTextWithNPCName
.asm_91323:
	jp .asm_91329
.asm_91326:
	call Func_91342
.asm_91329:
	jp .asm_91332
.asm_9132c:
	hltext_tree_pointer TreeBitstreamText_3b973
	scall PrintTextWithNPCName
.asm_91332:
	pop bc
	ret

Data_91334:
	db $01, $0d, $ff, $ff

Data_91338:
	db $02, $0c, $ff, $ff

Data_9133c:
	db $04, $0d, $01, $0d, $ff, $ff

Func_91342:
	ld a, $13
	scall Func_80e5d
	or a
	jp z, .asm_91415
	ld a, $1e
	scall Func_80e6d
	cp $ff
	jp z, .asm_9140c
	push af
	hltext_tree_pointer TreeBitstreamText_3b8f2
	scall PrintTextWithNPCName
	ld bc, Data_91334
	ld e, $24
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld c, $01
	ld e, $01
	ld a, $04
	scall LoadEmote
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld a, $68
	scall PlaySFX
	xor a
	scall PlayMusic
	ld a, $0f
	scall PlayMusic
	ld bc, Data_91338
	ld e, $24
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	ld a, $01
	scall SpriteFace
	hltext_tree_pointer TreeBitstreamText_3b942
	scall PrintTextWithNPCName
	ld c, $01
	ld de, Data_9133c
	ld a, $24
	scall MovePlayer
	ld a, $2a
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3b932
	scall PrintTextStandard
	pop af
	push af
	ld l, a
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	pop af
	push hl
	ld e, $01
	ld c, $00
	scall GiveRobot
	pop hl
	ld c, l
	ld e, $00
	ld a, $1f
	scall GiveRobot
	ld c, $01
	ld e, $01
	ld a, $13
	scall Func_80d4d
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0039
	scall EventFlagAction
	jp .asm_91412
.asm_9140c:
	hltext_tree_pointer TreeBitstreamText_3b9d7
	scall PrintTextWithNPCName
.asm_91412:
	jp .asm_9141b
.asm_91415:
	hltext_tree_pointer TreeBitstreamText_3b9a9
	scall PrintTextWithNPCName
.asm_9141b:
	ret

Func_9141c:
	push af
	ld a, e
	or a
	jp nz, .asm_9142f
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $00
	ld a, $04
	scall Func_806a0
.asm_9142f:
	pop bc
	ret

Func_91431:
	push af
	ld a, e
	or a
	jp nz, .asm_91444
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $02
	ld a, $04
	scall Func_806a0
.asm_91444:
	pop bc
	ret

Func_91446:
	push af
	ld a, e
	or a
	jp nz, .asm_91459
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $01
	ld a, $04
	scall Func_806a0
.asm_91459:
	pop bc
	ret

Func_9145b:
	ld a, e
	or a
	jp nz, .asm_91477
	ld l, $01
	push hl
	ld c, $04
	ld e, $01
	ld a, $08
	scall Func_80dff
	pop bc
	ld a, $2e
	scall PlaySFX
	ld a, $02
	ld [wPlayerFacing], a
.asm_91477:
	ret

Func_91478:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_9176c
	ld a, [wc796]
	cp $02
	jp nz, .asm_9152c
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_91529
	hltext_tree_pointer TreeBitstreamText_44601
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
	ld a, $13
	scall Func_80e7d
	cp $01
	jp nz, .asm_91520
	hltext_tree_pointer TreeBitstreamText_446dc
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_91508
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_44733
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $32
	scall GiveRobot
	ld a, $03
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_9151d
.asm_91508:
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_447bd
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $07
	scall SpriteFace
	jp .asm_9176c
.asm_9151d:
	jp .asm_91529
.asm_91520:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_9176c
.asm_91529:
	jp .asm_916a9
.asm_9152c:
	ld a, [wc796]
	cp $0b
	jp nz, .asm_915dc
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_915d9
	hltext_tree_pointer TreeBitstreamText_44601
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
	ld a, $72
	scall Func_80e7d
	cp $01
	jp nz, .asm_915d0
	hltext_tree_pointer TreeBitstreamText_44861
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_915b1
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_448b8
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
	ld a, $7c
	scall GiveRobot
	ld a, $0c
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_915cd
.asm_915b1:
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_447bd
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_915cd:
	jp .asm_915d9
.asm_915d0:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_9176c
.asm_915d9:
	jp .asm_916a9
.asm_915dc:
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_915f6
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_916a9
.asm_915f6:
	ld a, $07
	scall FacePlayer
	ld a, [wc796]
	cp $08
	jp z, .asm_91684
	cp $06
	jp z, .asm_91684
	cp $0a
	jp z, .asm_91675
	cp $05
	jp z, .asm_91675
	cp $0c
	jp z, .asm_91666
	cp $04
	jp z, .asm_91666
	cp $0d
	jp z, .asm_91657
	cp $03
	jp z, .asm_91657
	cp $07
	jp z, .asm_91648
	or a
	jp z, .asm_91648
	cp $09
	jp z, .asm_91639
	cp $01
	jp nz, .asm_91693
.asm_91639:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45acc
	scall PrintTextStandard
	jp .asm_91699
.asm_91648:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp .asm_91699
.asm_91657:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp .asm_91699
.asm_91666:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp .asm_91699
.asm_91675:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b10
	scall PrintTextStandard
	jp .asm_91699
.asm_91684:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp .asm_91699
.asm_91693:
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
.asm_91699:
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $07
	scall SpriteFace
	jp .asm_9176c
.asm_916a9:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_9176c
	ld a, [wc796]
	cp $0c
	jp nc, .asm_916ee
	ld a, [wc796]
	cp $03
	jp c, .asm_916ee
	hltext_tree_pointer TreeBitstreamText_44601
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_447ed
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld a, $07
	scall SpriteFace
	jp .asm_9176c
.asm_916ee:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_9171e
	hltext_tree_pointer TreeBitstreamText_44601
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_9171e:
	ld a, [wc796]
	cp $0c
	jp c, .asm_91742
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_44937
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp .asm_9176c
.asm_91742:
	hltext_tree_pointer TreeBitstreamText_44601
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld a, $07
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_44657
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld a, $07
	scall SpriteFace
.asm_9176c:
	pop bc
	pop bc
	ret
