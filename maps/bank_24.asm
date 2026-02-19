INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 24", ROMX

	script_library 24

Data_910b4:
	db $13, $0d, $01, $01, $07, $00, $12, $11, $12, $12, $2e

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
	jp nz, label_911c0
	ld e, $03
	ld hl, Data_910d3
	scall LoadMapObjects
	scall Func_8001c
	call Func_91219
	jp label_9120c
label_911c0:
	ld e, $0a
	ld hl, Data_910fd
	scall LoadMapObjects
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, label_911ea
	ld c, $0c
	ld e, $02
	ld a, $01
	scall Func_80080
	ld e, $02
	ld a, $01
	scall SpriteFace
label_911ea:
	ld a, [wc790]
	or a
	jp z, label_91209
	ld a, [wc790]
	cp $06
	jp nc, label_91209
	ld de, Data_910cb
	ld a, $08
	scall SetPersonTextPointer
	ld de, Data_910cf
	ld a, $09
	scall SetPersonTextPointer
label_91209:
	scall Func_8001c
label_9120c:
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
	jp nz, label_91332
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, label_9132c
	ld hl, $005c
	scall CheckEventFlag
	or a
	jp nz, label_91326
	hltext_tree_pointer TreeBitstreamText_3b7f7
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, label_9131d
	ld e, $01
	ld hl, $005c
	scall EventFlagAction
	call Func_91342
	jp label_91323
label_9131d:
	hltext_tree_pointer TreeBitstreamText_3b8b8
	scall PrintTextWithNPCName
label_91323:
	jp label_91329
label_91326:
	call Func_91342
label_91329:
	jp label_91332
label_9132c:
	hltext_tree_pointer TreeBitstreamText_3b973
	scall PrintTextWithNPCName
label_91332:
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
	jp z, label_91415
	ld a, $1e
	scall Func_80e6d
	cp $ff
	jp z, label_9140c
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
	jp label_91412
label_9140c:
	hltext_tree_pointer TreeBitstreamText_3b9d7
	scall PrintTextWithNPCName
label_91412:
	jp label_9141b
label_91415:
	hltext_tree_pointer TreeBitstreamText_3b9a9
	scall PrintTextWithNPCName
label_9141b:
	ret

Func_9141c:
	push af
	ld a, e
	or a
	jp nz, label_9142f
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $00
	ld a, $04
	scall Func_806a0
label_9142f:
	pop bc
	ret

Func_91431:
	push af
	ld a, e
	or a
	jp nz, label_91444
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $02
	ld a, $04
	scall Func_806a0
label_91444:
	pop bc
	ret

Func_91446:
	push af
	ld a, e
	or a
	jp nz, label_91459
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $01
	ld a, $04
	scall Func_806a0
label_91459:
	pop bc
	ret

Func_9145b:
	ld a, e
	or a
	jp nz, label_91477
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
label_91477:
	ret

Func_91478:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, label_9176c
	ld a, [wc796]
	cp $02
	jp nz, label_9152c
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_91529
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
	jp nz, label_91520
	hltext_tree_pointer TreeBitstreamText_446dc
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_91508
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
	jp label_9151d
label_91508:
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_447bd
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $07
	scall SpriteFace
	jp label_9176c
label_9151d:
	jp label_91529
label_91520:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_9176c
label_91529:
	jp label_916a9
label_9152c:
	ld a, [wc796]
	cp $0b
	jp nz, label_915dc
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_915d9
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
	jp nz, label_915d0
	hltext_tree_pointer TreeBitstreamText_44861
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_915b1
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
	jp label_915cd
label_915b1:
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
	jp label_9176c
label_915cd:
	jp label_915d9
label_915d0:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_9176c
label_915d9:
	jp label_916a9
label_915dc:
	ld a, $13
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, label_915f6
	ld a, $72
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_916a9
label_915f6:
	ld a, $07
	scall FacePlayer
	ld a, [wc796]
	cp $08
	jp z, label_91684
	cp $06
	jp z, label_91684
	cp $0a
	jp z, label_91675
	cp $05
	jp z, label_91675
	cp $0c
	jp z, label_91666
	cp $04
	jp z, label_91666
	cp $0d
	jp z, label_91657
	cp $03
	jp z, label_91657
	cp $07
	jp z, label_91648
	or a
	jp z, label_91648
	cp $09
	jp z, label_91639
	cp $01
	jp nz, label_91693
label_91639:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45acc
	scall PrintTextStandard
	jp label_91699
label_91648:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp label_91699
label_91657:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp label_91699
label_91666:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp label_91699
label_91675:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b10
	scall PrintTextStandard
	jp label_91699
label_91684:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp label_91699
label_91693:
	hltext_tree_pointer TreeBitstreamText_4461b
	scall PrintTextWithNPCName
label_91699:
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $07
	scall SpriteFace
	jp label_9176c
label_916a9:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, label_9176c
	ld a, [wc796]
	cp $0c
	jp nc, label_916ee
	ld a, [wc796]
	cp $03
	jp c, label_916ee
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
	jp label_9176c
label_916ee:
	ld a, [wc796]
	cp $0f
	jp nz, label_9171e
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
	jp label_9176c
label_9171e:
	ld a, [wc796]
	cp $0c
	jp c, label_91742
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
	jp label_9176c
label_91742:
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
label_9176c:
	pop bc
	pop bc
	ret

Data_9176f:
	db $04, $00, $01, $01, $08, $00, $0a, $09, $0a, $08, $2e

Data_9177a:
	db $29, $04, $17, $01, $13

Data_9177f:
IF DEF(SUN)
	db $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	db $00, $01, $09, $18, $11, $10, $12, $02, $1f, $1e, $18, $0d, $08, $00
	db $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ELIF DEF(STAR)
	db $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	db $00, $01, $09, $18, $8b, $10, $12, $77, $05, $05, $00, $0d, $08, $00
	db $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ENDC

Data_917a9:
IF DEF(SUN)
	db $00, $01, $09, $18, $0c, $10, $12, $77, $05, $17, $00, $03, $0a, $00
	db $00, $01, $09, $18, $07, $11, $13, $45, $06, $06, $11, $03, $06, $00
	db $00, $01, $09, $18, $1d, $12, $14, $51, $1f, $17, $08, $0c, $05, $00
	db $00, $01, $09, $18, $0d, $13, $15, $77, $01, $05, $00, $03, $04, $00
ELIF DEF(STAR)
	db $00, $01, $09, $18, $09, $10, $12, $77, $03, $0f, $00, $03, $0a, $00
	db $00, $01, $09, $18, $58, $11, $13, $03, $1f, $17, $11, $03, $06, $00
	db $00, $01, $09, $18, $39, $12, $14, $1a, $0e, $0b, $00, $03, $05, $00
	db $00, $01, $09, $18, $0a, $13, $15, $77, $04, $0f, $00, $03, $04, $00
ENDC

Data_917e1:
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_918f5, NULL
	person_event $00, $04, $02, $15, $01, $01, $03, $04, $00, Func_9198b, NULL
	person_event $08, $04, $00, $16, $01, $01, $01, $04, $00, Func_91b0c, NULL
	person_event $18, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL
	person_event $11, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL

Data_91827:
	db $04, $00, $01, $01, $06, $00, $10, $09, $10, $0a, $2e

Data_91832:
	db $24, $04, $17

Data_91835:
	db $24, $04, $17, $00, $00

Data_9183a:
	person_event $00, $04, $04, $16, $01, $01, $01, $04, $00, Func_806dd_24, Data_91832
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_91ae0, NULL

Func_91856:: ; 91856
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, label_918a0
	ld a, [wBackupMapNumber]
	or a
	jp nz, label_918a0
	ld e, $01
	ld hl, Data_91827
	scall LoadWarps
	ld e, $01
	ld hl, Data_91835
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_917a9
	scall LoadEncounters
	ld e, $02
	ld hl, Data_9183a
	scall LoadMapObjects
	ld a, $05
	ld [wc7e2], a
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $01b5
	scall LandmarkSign
	jp label_918f4
label_918a0:
	ld e, $01
	ld hl, Data_9176f
	scall LoadWarps
	ld e, $01
	ld hl, Data_9177a
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_9177f
	scall LoadEncounters
	ld a, $08
	ld [wBackupMapGroup], a
	xor a
	ld [wBackupMapNumber], a
	ld a, $06
	ld [wc7e2], a
	ld e, $05
	ld hl, Data_917e1
	scall LoadMapObjects
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall Func_8001c
	ld hl, $01b5
	scall LandmarkSign
label_918f4:
	ret

Func_918f5:
	ld a, e
	or a
	jp nz, label_91980
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, label_91922
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, label_91922
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, label_91922
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, label_9197a
label_91922:
	ld a, [wc790]
	or a
	jp z, label_91971
	ld a, [wc790]
	cp $06
	jp nc, label_91971
	hltext_tree_pointer TreeBitstreamText_46f30
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_9196e
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $02
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $2e
	ld e, $01
	ld a, $1e
	scall Func_80dff
	pop bc
label_9196e:
	jp label_91977
label_91971:
	hltext_tree_pointer TreeBitstreamText_470f0
	scall PrintTextStandard
label_91977:
	jp label_91980
label_9197a:
	hltext_tree_pointer TreeBitstreamText_470d8
	scall PrintTextStandard
label_91980:
	ret

Data_91981:
	db $01, $16, $02, $16, $ff, $ff

Data_91987:
	db $01, $16, $ff, $ff

Func_9198b:
	ld a, e
	or a
	jp nz, label_91adf
	ld a, [wPlayerFacing]
	cp $01
	jp nz, label_919a9
	ld c, $01
	ld de, Data_91981
	ld a, $24
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
label_919a9:
	ld a, $01
	scall FacePlayer
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, label_91ad9
	ld hl, $0020
	scall CheckEventFlag
	or a
	jp nz, label_91ad9
	ld hl, $003a
	scall CheckEventFlag
	cp $01
	jp nz, label_91ad0
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, label_91ac7
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, label_91abe
	push af
	hltext_tree_pointer TreeBitstreamText_3bc83
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $29
	scall LoadEmote
	ld e, $15
	ld a, $02
	scall MoveEmote
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld e, $01
	ld a, $04
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_91987
	ld a, $24
	scall MovePlayer
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayerFace
	call WaitVideoTransfer
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
	ld a, $20
	scall GiveRobot
	ld e, $01
	ld hl, $0047
	scall EventFlagAction
	ld hl, $001e
	scall ScriptSleep
	ld a, $2a
	scall PlaySFX
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	hltext_tree_pointer TreeBitstreamText_3bd77
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_3bd02
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $08
	scall PlayMusic
	jp label_91ac4
label_91abe:
	hltext_tree_pointer TreeBitstreamText_3bd37
	scall PrintTextWithNPCName
label_91ac4:
	jp label_91acd
label_91ac7:
	hltext_tree_pointer TreeBitstreamText_3bd02
	scall PrintTextWithNPCName
label_91acd:
	jp label_91ad6
label_91ad0:
	hltext_tree_pointer TreeBitstreamText_3bbab
	scall PrintTextWithNPCName
label_91ad6:
	jp label_91adf
label_91ad9:
	hltext_tree_pointer TreeBitstreamText_3bbab
	scall PrintTextWithNPCName
label_91adf:
	ret

Func_91ae0:
	ld a, e
	or a
	jp nz, label_91b0b
	scall RepairRobots
	xor a
	scall PlayMusic
	ld a, $16
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	hltext_tree_pointer TreeBitstreamText_46e0b
	scall PrintTextStandard
	ld a, $08
	scall PlayMusic
label_91b0b:
	ret

Func_91b0c:
	push af
	ld a, e
	or a
	jp nz, label_91b6b
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010f
	scall CheckEventFlag
	or a
	jp nz, label_91b65
	ld a, [wc79c]
	cp $01
	jp c, label_91b65
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, label_91b65
	hltext_tree_pointer TreeBitstreamText_3bc38
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	ld e, $01
	ld hl, $010f
	scall EventFlagAction
	jp label_91b6b
label_91b65:
	hltext_tree_pointer TreeBitstreamText_3bc38
	scall PrintTextStandard
label_91b6b:
	pop bc
	ret

Data_91b6d:
	db $08, $04, $01, $01, $09, $04, $02, $06, $02, $05, $34
	db $0b, $12, $01, $01, $13, $0b, $06, $06, $06, $05, $2e
	db $0b, $21, $01, $01, $13, $21, $04, $17, $04, $16, $2e
	db $05, $2c, $01, $01, $09, $01, $07, $0e, $06, $0e, $2e
	db $05, $28, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e

Data_91ba4:
	db $48, $05, $0d, $11, $40, $49, $0e, $22, $11, $43, $4a, $0e, $28, $11, $42

Data_91bb3:
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91caf:
	db $05, $22, $0b, $0d, $1f, $0f, $12, $7c, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91db9:
	db $05, $22, $0b, $0d, $20, $0f, $12, $70, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91ec3:
	db $05, $22, $0b, $0d, $21, $0f, $12, $7d, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91fcd:
	db $ba, $02, $ff, $ff

Data_91fd1:
	db $b9, $02, $ff, $ff

Data_91fd5:
	person_event $28, $04, $0f, $13, $01, $01, $02, $04, $00, Func_92211, NULL

Data_91fe3:
	person_event $ff, $00, $0a, $23, $03, $01, $00, $04, $01, Func_92257, NULL
	person_event $ff, $00, $05, $21, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $05, $18, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $0e, $12, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $0e, $09, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $0b, $04, $0e, $0a, $01, $01, $02, $04, $00, Func_92422, NULL
	person_event $29, $04, $10, $0b, $01, $01, $02, $04, $00, Func_924a9, NULL
	person_event $0b, $04, $05, $19, $01, $01, $01, $04, $00, Func_92531, NULL
	person_event $0b, $04, $07, $1a, $01, $01, $02, $04, $00, Func_925b8, NULL
	person_event $28, $0c, $08, $05, $01, $01, $02, $04, $00, Func_9264b, NULL
	person_event $ff, $00, $0a, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fcd
	person_event $ff, $00, $06, $27, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fd1
	person_event $ff, $00, $06, $29, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fd1
	person_event $0f, $04, $0f, $2b, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0f, $2b, $01, $01, $02, $04, $00, Func_926ba, NULL
	person_event $0b, $04, $06, $25, $01, $01, $01, $04, $00, Func_927eb, NULL

Func_920c3:: ; 920c3
	ld a, $07
	ld [wc7e2], a
	ld e, $05
	ld hl, Data_91b6d
	scall LoadWarps
	ld e, $03
	ld hl, Data_91ba4
	scall Func_80ce7
	ld e, $11
	ld hl, Data_91fd5
	scall LoadMapObjects
	ld a, $0d
	scall PlayMusic
	ld a, $03
	scall Func_80d01
	ld a, $1e
	scall Func_80e6d
	cp $ff
	jp nz, label_92147
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp nz, label_92147
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_92147
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_92147
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, label_92127
	ld e, $13
	ld hl, Data_91caf
	scall LoadEncounters
	jp label_92144
label_92127:
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, label_9213c
	ld e, $13
	ld hl, Data_91db9
	scall LoadEncounters
	jp label_92144
label_9213c:
	ld e, $13
	ld hl, Data_91ec3
	scall LoadEncounters
label_92144:
	jp label_9214f
label_92147:
	ld e, $12
	ld hl, Data_91bb3
	scall LoadEncounters
label_9214f:
	ld hl, $0047
	scall CheckEventFlag
	cp $01
	jp nz, label_92180
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_92178
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_92178
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp z, label_92180
label_92178:
	ld a, $03
	scall LoadPlayerSprite
	jp label_9219a
label_92180:
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, label_9219a
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, label_9219a
	ld a, $02
	scall LoadPlayerSprite
label_9219a:
	ld hl, $008d
	scall CheckEventFlag
	cp $01
	jp nz, label_921ac
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
label_921ac:
	ld a, [wc790]
	or a
	jp z, label_921dd
	ld a, [wc790]
	cp $06
	jp nc, label_921dd
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
label_921dd:
	ld e, $00
	ld a, $0e
	scall SetPersonVisibilityState
	scall Func_8001c
	ret

Data_921e8:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $8a, $01
	db $8a, $04, $15, $05, $05, $00, $04, $1f, $04, $15, $17, $17, $00, $70, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92211:
	ld a, e
	or a
	jp nz, label_92251
	xor a
	scall FacePlayer
	ld hl, $0088
	scall CheckEventFlag
	or a
	jp nz, label_9224b
	hltext_tree_pointer TreeBitstreamText_3babb
	scall PrintTextWithNPCName
	ld de, Data_92252
	ld hl, Data_921e8
	scall ScriptedBattle
	or a
	jp nz, label_9223a
	jp label_92251
label_9223a:
	hltext_tree_pointer TreeBitstreamText_3baee
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $0088
	scall EventFlagAction
	jp label_92251
label_9224b:
	hltext_tree_pointer TreeBitstreamText_3bb2b
	scall PrintTextWithNPCName
label_92251:
	ret

Data_92252:
	dstr "ウォリア"

Func_92257:
	ld a, e
	cp $02
	jp nz, label_9233a
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp nz, label_922b2
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_922b2
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_922b2
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp nz, label_922b2
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	xor a
	scall Func_80653
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $06
	push hl
	ld c, $0d
	ld e, $01
	ld a, $09
	scall Func_80dff
	pop bc
	jp label_9233a
label_922b2:
	ld hl, $0047
	scall CheckEventFlag
	cp $01
	jp nz, label_922eb
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_922db
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_922db
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp z, label_922eb
label_922db:
	ld a, [wPlayerState]
	cp $03
	jp z, label_922e8
	ld a, $03
	scall LoadPlayerSprite
label_922e8:
	jp label_9233a
label_922eb:
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, label_92310
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, label_92310
	ld a, [wPlayerState]
	cp $02
	jp z, label_9230d
	ld a, $02
	scall LoadPlayerSprite
label_9230d:
	jp label_9233a
label_92310:
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	xor a
	scall Func_80653
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $06
	push hl
	ld c, $0d
	ld e, $01
	ld a, $09
	scall Func_80dff
	pop bc
label_9233a:
	ret

Func_9233b:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, label_923f6
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_923a1
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_923a1
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp nz, label_923a1
	hltext_tree_pointer TreeBitstreamText_46fe6
	scall PrintTextStandard
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, label_92389
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp label_92391
label_92389:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
label_92391:
	ld c, $01
	ld hl, sp+$00
	push de
	push hl
	pop de
	pop hl
	ld a, $24
	scall MovePlayer
	jp label_923f6
label_923a1:
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, label_923e9
	hltext_tree_pointer TreeBitstreamText_46fe6
	scall PrintTextStandard
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, label_923cb
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp label_923d3
label_923cb:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
label_923d3:
	ld c, $01
	ld hl, sp+$00
	push de
	push hl
	pop de
	pop hl
	ld a, $24
	scall MovePlayer
	hltext_tree_pointer TreeBitstreamText_46ffa
	scall PrintTextWithNPCName
	jp label_923f6
label_923e9:
	ld a, [wPlayerState]
	cp $03
	jp z, label_923f6
	ld a, $03
	scall LoadPlayerSprite
label_923f6:
	pop bc
	pop bc
	ret

Data_923f9:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f
	db $01, $1f, $04, $16, $17, $17, $00, $70, $18, $04, $16, $09, $09, $0b, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92422:
	push af
	ld a, e
	or a
	jp nz, label_92478
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0089
	scall CheckEventFlag
	or a
	jp nz, label_92472
	hltext_tree_pointer TreeBitstreamText_42a37
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_92469
	ld de, Data_9247a
	ld hl, Data_923f9
	scall ScriptedBattle
	or a
	jp nz, label_92458
	jp label_92478
label_92458:
	ld e, $01
	ld hl, $0089
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42a4c
	scall PrintTextStandard
	jp label_9246f
label_92469:
	hltext_tree_pointer TreeBitstreamText_42b32
	scall PrintTextStandard
label_9246f:
	jp label_92478
label_92472:
	hltext_tree_pointer TreeBitstreamText_42a4c
	scall PrintTextStandard
label_92478:
	pop bc
	ret

Data_9247a:
	dstr "ソﾞッキー"

Data_92480:
	db $00, $00, $00, $02, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $7a, $04, $15, $17, $05, $1e, $5b, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_924a9:
	push af
	ld a, e
	or a
	jp nz, label_924ff
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $008a
	scall CheckEventFlag
	or a
	jp nz, label_924f9
	hltext_tree_pointer TreeBitstreamText_42a61
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_924f0
	ld de, Data_92501
	ld hl, Data_92480
	scall ScriptedBattle
	or a
	jp nz, label_924df
	jp label_924ff
label_924df:
	ld e, $01
	ld hl, $008a
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42a6e
	scall PrintTextStandard
	jp label_924f6
label_924f0:
	hltext_tree_pointer TreeBitstreamText_42b41
	scall PrintTextStandard
label_924f6:
	jp label_924ff
label_924f9:
	hltext_tree_pointer TreeBitstreamText_42a6e
	scall PrintTextStandard
label_924ff:
	pop bc
	ret

Data_92501:
	dstr "レテﾞィース"

Data_92508:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $8d, $03, $15, $0c, $0d, $14, $77, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92531:
	push af
	ld a, e
	or a
	jp nz, label_92587
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $008b
	scall CheckEventFlag
	or a
	jp nz, label_92581
	hltext_tree_pointer TreeBitstreamText_42a7e
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_92578
	ld de, Data_92589
	ld hl, Data_92508
	scall ScriptedBattle
	or a
	jp nz, label_92567
	jp label_92587
label_92567:
	ld e, $01
	ld hl, $008b
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42a9a
	scall PrintTextStandard
	jp label_9257e
label_92578:
	hltext_tree_pointer TreeBitstreamText_42b24
	scall PrintTextStandard
label_9257e:
	jp label_92587
label_92581:
	hltext_tree_pointer TreeBitstreamText_42ab0
	scall PrintTextStandard
label_92587:
	pop bc
	ret

Data_92589:
	dstr "ソﾞッキー"

Data_9258f:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $4a, $04, $15, $0e, $08, $00, $23, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_925b8:
	push af
	ld a, e
	or a
	jp nz, label_9260e
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $008c
	scall CheckEventFlag
	or a
	jp nz, label_92608
	hltext_tree_pointer TreeBitstreamText_42abe
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_925ff
	ld de, Data_92610
	ld hl, Data_9258f
	scall ScriptedBattle
	or a
	jp nz, label_925ee
	jp label_9260e
label_925ee:
	ld e, $01
	ld hl, $008c
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42ad0
	scall PrintTextStandard
	jp label_92605
label_925ff:
	hltext_tree_pointer TreeBitstreamText_42b32
	scall PrintTextStandard
label_92605:
	jp label_9260e
label_92608:
	hltext_tree_pointer TreeBitstreamText_42b0b
	scall PrintTextStandard
label_9260e:
	pop bc
	ret

Data_92610:
	dstr "ソﾞッキー"

Data_92616:
	db $08, $06, $0e, $06, $ff, $ff

Data_9261c:
	db $09, $06, $0e, $06, $ff, $ff

Data_92622:
	db $00, $00, $00, $03, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $17, $17, $17
	db $17, $70, $20, $04, $17, $17, $17, $17, $6f, $21, $02, $17, $0c, $0f, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_9264b:
	ld a, e
	or a
	jp nz, label_926b4
	ld hl, $008d
	scall CheckEventFlag
	or a
	jp nz, label_926b4
	ld a, $0a
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_3bd87
	scall PrintTextWithNPCName
	ld de, Data_926b5
	ld hl, Data_92622
	scall ScriptedBattle
	or a
	jp nz, label_92675
	jp label_926b4
label_92675:
	hltext_tree_pointer TreeBitstreamText_3bdc2
	scall PrintTextWithNPCName
	ld a, [wPlayerFacing]
	cp $01
	jp z, label_9268b
	ld a, [wPlayerFacing]
	cp $03
	jp nz, label_92698
label_9268b:
	ld bc, Data_92616
	ld e, $24
	ld a, $0a
	scall MovePersonAndWait
	jp label_926a2
label_92698:
	ld bc, Data_9261c
	ld e, $24
	ld a, $0a
	scall MovePersonAndWait
label_926a2:
	scall WaitNPCStep
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $008d
	scall EventFlagAction
label_926b4:
	ret

Data_926b5:
	dstr "ヒﾞーノ"

Func_926ba:
	ld a, e
	or a
	jp nz, label_927c1
	ld hl, $00da
	scall CheckEventFlag
	or a
	jp nz, label_927bb
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $2b
	ld a, $0f
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $0e
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $0e
	scall SpriteFace
	ld e, $00
	ld a, $0e
	scall SpriteFace
	ld e, $01
	ld a, $0e
	scall SpriteFace
	ld e, $02
	ld a, $0e
	scall SpriteFace
	ld e, $03
	ld a, $0e
	scall SpriteFace
	ld e, $00
	ld a, $0e
	scall SpriteFace
	ld e, $01
	ld a, $0e
	scall SpriteFace
	ld e, $02
	ld a, $0e
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ld hl, $001e
	scall ScriptSleep
	ld a, $0e
	scall FacePlayer
	ld c, $01
	ld e, $13
	ld a, $12
	scall Func_80e8d
	ld e, $01
	ld hl, $00da
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $0e
	scall SpriteFace
	ld e, $00
	ld a, $0e
	scall SpriteFace
	ld e, $01
	ld a, $0e
	scall SpriteFace
	ld e, $02
	ld a, $0e
	scall SpriteFace
	ld e, $03
	ld a, $0e
	scall SpriteFace
	ld e, $00
	ld a, $0e
	scall SpriteFace
	ld e, $01
	ld a, $0e
	scall SpriteFace
	ld e, $02
	ld a, $0e
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $0d
	scall PlayMusic
	ld a, $0e
	scall FacePlayer
	ld e, $00
	ld a, $0e
	scall SetPersonVisibilityState
	jp label_927c1
label_927bb:
	hltext_tree_pointer TreeBitstreamText_3f79e
	scall PrintTextStandard
label_927c1:
	ret

Data_927c2:
	db $00, $00, $00, $03, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $17, $17, $17
	db $17, $70, $20, $04, $17, $17, $17, $17, $6f, $21, $02, $17, $0c, $0f, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_927eb:
	ld a, e
	or a
	jp nz, label_92844
	ld a, $10
	scall FacePlayer
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, label_92808
	hltext_tree_pointer TreeBitstreamText_3bdf0
	scall PrintTextStandard
	jp label_92844
label_92808:
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, label_9281b
	hltext_tree_pointer TreeBitstreamText_3be3f
	scall PrintTextStandard
	jp label_92844
label_9281b:
	hltext_tree_pointer TreeBitstreamText_42b02
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_9283e
	ld de, Data_92845
	ld hl, Data_927c2
	scall ScriptedBattle
	or a
	jp nz, label_92835
	jp label_92844
label_92835:
	hltext_tree_pointer TreeBitstreamText_42af6
	scall PrintTextStandard
	jp label_92844
label_9283e:
	hltext_tree_pointer TreeBitstreamText_42903
	scall PrintTextStandard
label_92844:
	ret

Data_92845:
	dstr "ソﾞッキー"

Data_9284b:
	db $07, $0e, $01, $01, $09, $00, $05, $2c, $05, $2d, $2e

Data_92856:
	db $2a, $0d, $03, $03, $18

Data_9285b:
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_92893:
	db $00, $0d, $0f, $0d, $1f, $0f, $12, $2e, $17, $00, $00, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_928d9:
	db $00, $0d, $0f, $0d, $20, $0f, $12, $2e, $17, $17, $00, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_9291f:
	db $00, $0d, $0f, $0d, $21, $0f, $12, $2e, $17, $17, $17, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Func_92965:: ; 92965
	ld e, $01
	ld hl, Data_9284b
	scall LoadWarps
	ld e, $01
	ld hl, Data_92856
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp nz, label_92999
	ld hl, $0039
	scall CheckEventFlag
	or a
	jp nz, label_92999
	ld e, $05
	ld hl, Data_92893
	scall LoadEncounters
	jp label_929e0
label_92999:
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, label_929b8
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, label_929b8
	ld e, $05
	ld hl, Data_928d9
	scall LoadEncounters
	jp label_929e0
label_929b8:
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, label_929d8
	ld hl, $0047
	scall CheckEventFlag
	cp $01
	jp nz, label_929d8
	ld e, $05
	ld hl, Data_9291f
	scall LoadEncounters
	jp label_929e0
label_929d8:
	ld e, $04
	ld hl, Data_9285b
	scall LoadEncounters
label_929e0:
	ld e, $04
	ld hl, Data_9285b
	scall LoadEncounters
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e3
	scall LandmarkSign
	ret

Data_929fc: ; 929fc
	db $12, $18, $01, $01, $09, $03, $0a, $19, $0a, $18, $2e
	db $10, $04, $01, $01, $09, $03, $08, $04, $07, $04, $2e
	db $24, $07, $01, $01, $09, $03, $1d, $06, $1c, $06, $2e
	db $01, $15, $01, $01, $02, $00, $05, $0e, $06, $0e, $2e

Data_92a28: ; 92a28
	db $2e, $1b, $03, $01, $36

Data_92a2d: ; 92a2d
IF DEF(SUN)
	db $00, $03, $14, $17, $2b, $03, $05, $0c, $06, $11, $00, $01, $0a, $00, $00, $03
	db $14, $17, $09, $02, $04, $22, $0f, $04, $00, $01, $08, $00, $00, $03, $14, $17
	db $8b, $04, $06, $2d, $26, $12, $00, $08, $06, $00, $0f, $03, $18, $17, $2b, $03
	db $05, $7f, $06, $06, $00, $01, $0a, $00, $0f, $03, $18, $17, $09, $02, $04, $5a
	db $0f, $03, $00, $01, $08, $00, $0f, $03, $18, $17, $8b, $04, $06, $39, $05, $05
	db $00, $08, $06, $00, $19, $03, $04, $17, $29, $06, $08, $0d, $01, $00, $00, $01
	db $03, $00
ELIF DEF(STAR)
	db $00, $03, $14, $17, $2b, $03, $05, $7f, $06, $11, $00, $01, $0a, $00, $00, $03
	db $14, $17, $0c, $02, $04, $22, $05, $01, $00, $01, $08, $00, $00, $03, $14, $17
	db $11, $04, $06, $01, $1f, $1e, $00, $08, $06, $00, $0f, $03, $18, $17, $2b, $03
	db $05, $7f, $06, $06, $00, $01, $0a, $00, $0f, $03, $18, $17, $0c, $02, $04, $5a
	db $05, $19, $00, $01, $08, $00, $0f, $03, $18, $17, $11, $04, $06, $00, $1f, $00
	db $00, $08, $06, $00, $19, $03, $04, $17, $2a, $06, $08, $0d, $05, $05, $00, $01
	db $03, $00
ENDC

Data_92a8f: ; 92a8f
	person_event $10, $04, $04, $04, $01, $01, $01, $04, $00, Func_92b08, NULL
	person_event $0b, $04, $21, $18, $01, $01, $03, $04, $00, Func_92b90, NULL

Func_92aab:: ; 92aab (24:6aab)
	ld e, $4
	ld hl, Data_929fc
	scall LoadWarps
	ld e, $1
	ld hl, Data_92a28
	scall Func_80ce7
	ld a, $3
	scall Func_80d01
	ld e, $7
	ld hl, Data_92a2d
	scall LoadEncounters
	ld e, $2
	ld hl, Data_92a8f
	scall LoadMapObjects
	ld a, $8
	scall PlayMusic
	scall Func_8001c
	landmarksign TreeBitstreamText_46cec
	ret

Data_92adf:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $20, $01, $47, $01, $06, $14, $0d
	db $1e, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b08:
	push af
	ld a, e
	or a
	jp nz, Func_92b5e
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8e
	scall CheckEventFlag
	or a
	jp nz, Func_92b58
	writetext TreeBitstreamText_42ae8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92b4f
	ld de, Data_92b60
	ld hl, Data_92adf
	scall ScriptedBattle
	or a
	jp nz, Func_92b3e
	jp Func_92b5e

Func_92b3e: ; 92b3e (24:6b3e)
	ld e, $1
	ld hl, $8e
	scall EventFlagAction
	writetext TreeBitstreamText_42af6
	jp Func_92b55

Func_92b4f: ; 92b4f (24:6b4f)
	writetext TreeBitstreamText_42ad0
Func_92b55: ; 92b55 (24:6b55)
	jp Func_92b5e

Func_92b58: ; 92b58 (24:6b58)
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
Func_92b5e: ; 92b5e (24:6b5e)
	pop bc
	ret

Data_92b60:
	dstr "レテﾞィース"

Data_92b67:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1f, $01, $62, $02, $06, $02, $03
	db $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b90:
	push af
	ld a, e
	or a
	jp nz, Func_92be6
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8f
	scall CheckEventFlag
	or a
	jp nz, Func_92be0
	writetext TreeBitstreamText_42b02
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92bd7
	ld de, Data_92be8
	ld hl, Data_92b67
	scall ScriptedBattle
	or a
	jp nz, Func_92bc6
	jp Func_92be6

Func_92bc6: ; 92bc6 (24:6bc6)
	ld e, $1
	ld hl, $8f
	scall EventFlagAction
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
	jp Func_92bdd

Func_92bd7: ; 92bd7 (24:6bd7)
	writetext TreeBitstreamText_42b24
Func_92bdd: ; 92bdd (24:6bdd)
	jp Func_92be6

Func_92be0: ; 92be0 (24:6be0)
	ld hl, CheckSongFinishedPredef
	scall PrintTextStandard
Func_92be6: ; 92be6 (24:6be6)
	pop bc
	ret

Data_92be8:
	dstr "ソﾞッキー"

Data_92bee:
	db $08, $04, $01, $01, $09, $02, $10, $04, $10, $05, $2e
	db $0a, $19, $01, $01, $09, $02, $12, $18, $11, $18, $2e
	db $1d, $06, $01, $01, $09, $02, $24, $07, $24, $08, $2e

Data_92c0f:
	db $2f, $21, $1b, $03, $0d

Data_92c14:
IF DEF(SUN)
	db $00, $03, $13, $1b, $2b, $04, $06, $0c, $06, $11, $00, $01, $0a, $00
	db $00, $03, $13, $1b, $09, $03, $05, $22, $0f, $04, $00, $01, $08, $00
	db $00, $03, $13, $1b, $8b, $05, $07, $2d, $26, $12, $00, $08, $06, $00
	db $13, $03, $10, $19, $2b, $04, $06, $7f, $06, $06, $00, $01, $0a, $00
	db $13, $03, $10, $19, $09, $03, $05, $5a, $0f, $03, $00, $01, $08, $00
	db $13, $03, $10, $19, $8b, $05, $07, $39, $05, $05, $00, $08, $06, $00
	db $15, $0f, $0e, $10, $29, $07, $09, $0d, $01, $00, $00, $01, $02, $00
ELIF DEF(STAR)
	db $00, $03, $13, $1b, $2b, $04, $06, $7f, $06, $11, $00, $01, $0a, $00
	db $00, $03, $13, $1b, $0c, $03, $05, $22, $05, $01, $00, $03, $08, $00
	db $00, $03, $13, $1b, $11, $05, $07, $01, $1f, $1e, $00, $0d, $06, $00
	db $13, $03, $10, $19, $2b, $04, $06, $7f, $06, $06, $00, $01, $0a, $00
	db $13, $03, $10, $19, $0c, $03, $05, $5a, $05, $19, $00, $03, $08, $00
	db $13, $03, $10, $19, $11, $05, $07, $00, $1f, $00, $00, $0d, $06, $00
	db $15, $0f, $0e, $10, $2a, $07, $09, $0d, $05, $00, $00, $01, $02, $00
ENDC

Data_92c76:
	person_event $0b, $04, $11, $04, $01, $01, $03, $04, $00, Func_92cfe, NULL
	person_event $0f, $04, $01, $1c, $01, $01, $00, $04, $00, Func_92d5c, NULL

Func_92c92:: ; 92c92
	ld e, $03
	ld hl, Data_92bee
	scall LoadWarps
	ld e, $01
	ld hl, Data_92c0f
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $07
	ld hl, Data_92c14
	scall LoadEncounters
	ld e, $02
	ld hl, Data_92c76
	scall LoadMapObjects
	ld a, [wc797]
	cp $07
	jp z, label_92cc6
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
label_92cc6:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $03f2
	scall LandmarkSign
	ret

Data_92cd5:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1e, $01, $1e, $02
	db $07, $17, $17, $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92cfe:
	push af
	ld a, e
	or a
	jp nz, label_92d54
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0090
	scall CheckEventFlag
	or a
	jp nz, label_92d4e
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_92d45
	ld de, Data_92d56
	ld hl, Data_92cd5
	scall ScriptedBattle
	or a
	jp nz, label_92d34
	jp label_92d54
label_92d34:
	ld e, $01
	ld hl, $0090
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
	jp label_92d4b
label_92d45:
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
label_92d4b:
	jp label_92d54
label_92d4e:
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
label_92d54:
	pop bc
	ret

Data_92d56:
	dstr "ソﾞッキー"

Func_92d5c:
	push af
	ld a, e
	or a
	jp nz, label_92db9
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0014
	scall CheckEventFlag
	or a
	jp nz, label_92db3
	ld a, $17
	scall Func_80e5d
	cp $01
	jp nz, label_92daa
	hltext_tree_pointer TreeBitstreamText_39e1f
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_39e65
	scall PrintTextStandard
	ld e, $01
	ld hl, $0014
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $17
	scall Func_80d4d
	ld c, $00
	ld e, $01
	ld a, $16
	scall Func_80d4d
	jp label_92db0
label_92daa:
	hltext_tree_pointer TreeBitstreamText_39e71
	scall PrintTextWithNPCName
label_92db0:
	jp label_92db9
label_92db3:
	hltext_tree_pointer TreeBitstreamText_39e8c
	scall PrintTextWithNPCName
label_92db9:
	pop bc
	ret

Data_92dbb:
	db $01, $06, $02, $01, $09, $00, $08, $04, $08, $05, $34

Data_92dc6:
	dtext_tree_pointer TreeBitstreamText_3c162
	dw -1

Data_92dca:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Data_92de6:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, Func_808fc_24, Data_92dc6
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Func_92e02:: ; 92e02
	ld e, $01
	ld hl, Data_92dbb
	scall LoadWarps
	ld a, $01
	scall LoadPlayerSprite
	ld hl, $0015
	scall CheckEventFlag
	or a
	jp nz, label_92e32
	ld e, $02
	ld hl, Data_92dca
	scall LoadMapObjects
	scall Func_8001c
	call Func_92e6d
	ld e, $01
	ld hl, $0015
	scall EventFlagAction
	jp label_92e5c
label_92e32:
	ld a, [wc790]
	or a
	jp z, label_92e54
	ld a, [wc790]
	cp $06
	jp nc, label_92e54
	ld e, $02
	ld hl, Data_92de6
	scall LoadMapObjects
	ld a, $11
	scall PlayMusic
	scall Func_8001c
	jp label_92e5c
label_92e54:
	ld a, $11
	scall PlayMusic
	scall Func_8001c
label_92e5c:
	ret

Data_92e5d:
	db $02, $02, $05, $02, $03, $02, $04, $02, $ff, $ff

Data_92e67:
	db $02, $02, $02, $04, $ff, $ff

Func_92e6d:
	ld e, $01
	xor a
	scall PlayerStep
	xor a
	scall PlayMusic
	ld a, $01
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_3be8e
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $3d
	scall PlaySFX
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf25
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	scall WaitEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf4b
	scall PrintTextStandard
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $02
	ld e, $04
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bf50
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $34
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf85
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $02
	ld e, $08
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bf8e
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $34
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $34
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $50
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bfc1
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld c, $01
	ld e, $20
	ld a, $10
	scall LoadEmote
	ld a, $4d
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $02
	scall PlayerStep
	ret
