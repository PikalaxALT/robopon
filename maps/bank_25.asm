INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 25", ROMX
	script_library 25

Data_950b4:
	db $23, $0e, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e
	db $09, $0c, $01, $01, $20, $08, $05, $09, $05, $08, $34
	db $0f, $0d, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $13, $11, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $1a, $07, $01, $01, $20, $07, $05, $09, $05, $08, $34
	db $1b, $10, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $1c, $0b, $01, $01, $20, $00, $01, $05, $01, $04, $34

Data_95101:
	db $80, $03, $ff, $ff

Data_95105:
	db $88, $03, $ff, $ff

Data_95109:
	person_event $03, $04, $18, $1a, $01, $01, $03, $04, $00, Func_951e4, NULL
	person_event $08, $04, $18, $0e, $01, $01, $03, $04, $00, Func_955fc, NULL
	person_event $08, $04, $12, $0a, $01, $01, $00, $04, $00, Func_95657, NULL
	person_event $00, $04, $0b, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95105
	person_event $08, $04, $0e, $10, $01, $01, $01, $04, $00, Func_956b2, NULL
	person_event $08, $04, $16, $12, $01, $01, $02, $04, $00, Func_9570d, NULL
	person_event $ff, $00, $09, $1a, $03, $01, $00, $04, $01, Func_9542c, NULL
	person_event $ff, $00, $16, $0a, $03, $03, $00, $04, $00, Func_95504, NULL
	person_event $ff, $00, $0d, $07, $03, $03, $00, $04, $00, Func_95540, NULL
	person_event $ff, $00, $22, $0d, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101
	person_event $ff, $00, $22, $0f, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101

Func_951a3:: ; 951a3
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, label_951bc
	ld a, $09
	scall Func_80c94
	ld a, $10
	scall Func_80c94
	ld a, $11
	scall Func_80c94
label_951bc:
	ld a, $08
	ld [wc789], a
	ld a, $10
	ld [wc7e2], a
	ld e, $0b
	ld hl, Data_95109
	scall LoadMapObjects
	ld e, $07
	ld hl, Data_950b4
	scall LoadWarps
	playmusic SONG_0A
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Func_951e4:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, label_95429
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	ld a, [wc796]
	cp $05
	jp nz, label_95287
	ld a, $4a
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_95284
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	ld a, $4a
	scall Func_80e7d
	cp $01
	jp nz, label_9527b
	hltext_tree_pointer TreeBitstreamText_4531c
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_95262
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_4535e
	scall PrintTextWithNPCName
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
	ld a, $4e
	scall GiveRobot
	ld a, $06
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp label_95278
label_95262:
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_453ee
	scall PrintTextWithNPCName
	ld e, $03
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp label_95429
label_95278:
	jp label_95284
label_9527b:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_95429
label_95284:
	jp label_953d4
label_95287:
	ld a, [wc796]
	cp $0a
	jp nz, label_95319
	ld a, $6f
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_95316
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	ld a, $6f
	scall Func_80e7d
	cp $01
	jp nz, label_9530d
	hltext_tree_pointer TreeBitstreamText_4547f
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_952f4
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_454c0
	scall PrintTextWithNPCName
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
	ld a, $72
	scall GiveRobot
	ld a, $0b
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp label_9530a
label_952f4:
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_453ee
	scall PrintTextWithNPCName
	ld e, $03
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	jp label_95429
label_9530a:
	jp label_95316
label_9530d:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_95429
label_95316:
	jp label_953d4
label_95319:
	ld a, $4a
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, label_95333
	ld a, $6f
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_953d4
label_95333:
	ld a, [wc796]
	cp $08
	jp z, label_953bc
	cp $06
	jp z, label_953bc
	cp $07
	jp z, label_953ad
	or a
	jp z, label_953ad
	cp $0c
	jp z, label_9539e
	cp $04
	jp z, label_9539e
	cp $0d
	jp z, label_9538f
	cp $03
	jp z, label_9538f
	cp $0b
	jp z, label_95380
	cp $02
	jp z, label_95380
	cp $09
	jp z, label_95371
	cp $01
	jp nz, label_953cb
label_95371:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45acc
	scall PrintTextStandard
	jp label_953d1
label_95380:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45add
	scall PrintTextStandard
	jp label_953d1
label_9538f:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp label_953d1
label_9539e:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp label_953d1
label_953ad:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp label_953d1
label_953bc:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp label_953d1
label_953cb:
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
label_953d1:
	jp label_95429
label_953d4:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, label_95429
	ld a, [wc796]
	cp $0b
	jp nc, label_953fb
	ld a, [wc796]
	cp $06
	jp c, label_953fb
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_45418
	scall PrintTextWithNPCName
	jp label_95429
label_953fb:
	ld a, [wc796]
	cp $0f
	jp nz, label_9540c
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	jp label_95429
label_9540c:
	ld a, [wc796]
	cp $0b
	jp c, label_9541d
	hltext_tree_pointer TreeBitstreamText_45511
	scall PrintTextWithNPCName
	jp label_95429
label_9541d:
	hltext_tree_pointer TreeBitstreamText_45277
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_452cd
	scall PrintTextWithNPCName
label_95429:
	pop bc
	pop bc
	ret

Func_9542c:
	ld a, e
	cp $02
	jp nz, label_95503
	ld a, $01
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $03
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $07
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $25
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $26
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $27
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $36
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $60
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $79
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $88
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $8e
	scall Func_80e6d
	cp $ff
	jp nz, label_954aa
	ld a, $95
	scall Func_80e6d
	cp $ff
	jp z, label_954fd
label_954aa:
	ld a, [wc790]
	or a
	jp z, label_954f4
	ld a, [wc790]
	cp $05
	jp nc, label_954f4
	hltext_tree_pointer TreeBitstreamText_470c8
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_954f1
	playmusic SONG_NONE
	playmusic SONG_JUMP_MINIGAME
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $26
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $05
	ld e, $0b
	ld a, $20
	scall Func_80dff
	pop bc
label_954f1:
	jp label_954fa
label_954f4:
	hltext_tree_pointer TreeBitstreamText_4714c
	scall PrintTextStandard
label_954fa:
	jp label_95503
label_954fd:
	hltext_tree_pointer TreeBitstreamText_47136
	scall PrintTextStandard
label_95503:
	ret

Func_95504:
	ld a, e
	or a
	jp nz, label_9552f
	scall RepairRobots
	playmusic SONG_NONE
	playmusic SONG_HEAL
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	hltext_tree_pointer TreeBitstreamText_46e0b
	scall PrintTextStandard
	playmusic SONG_0A
label_9552f:
	ret

Data_95530:
	db $0e, $0a, $ff, $ff

Data_95534:
	db $0c, $0a, $0e, $0a, $ff, $ff

Data_9553a:
	db $10, $0a, $0e, $0a, $ff, $ff

Func_95540:
	ld a, e
	or a
	jp nz, label_955fb
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, label_9556d
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, label_9556d
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, label_9556d
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, label_955f5
label_9556d:
	ld a, [wc790]
	or a
	jp z, label_955ec
	ld a, [wc790]
	cp $06
	jp nc, label_955ec
	hltext_tree_pointer TreeBitstreamText_46f30
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_955e9
	ld a, [wPlayerFacing]
	cp $01
	jp z, label_9559f
	or a
	jp nz, label_955ac
	ld c, $01
	ld de, Data_95530
	ld a, $25
	scall MovePlayer
	jp label_955b6
label_9559f:
	ld c, $01
	ld de, Data_95534
	ld a, $25
	scall MovePlayer
	jp label_955b6
label_955ac:
	ld c, $01
	ld de, Data_9553a
	ld a, $25
	scall MovePlayer
label_955b6:
	scall WaitNPCStep
	scall WaitNPCStep
	xor a
	scall PlayerFace
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
	xor a
	scall PlayerFace
	ld l, $1e
	push hl
	ld c, $18
	ld e, $03
	ld a, $1e
	scall Func_80dff
	pop bc
label_955e9:
	jp label_955f2
label_955ec:
	hltext_tree_pointer TreeBitstreamText_470f0
	scall PrintTextStandard
label_955f2:
	jp label_955fb
label_955f5:
	hltext_tree_pointer TreeBitstreamText_470d8
	scall PrintTextStandard
label_955fb:
	ret

Func_955fc:
	push af
	ld a, e
	or a
	jp nz, label_95655
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010a
	scall CheckEventFlag
	or a
	jp nz, label_9564f
	ld a, [wc79c]
	cp $01
	jp c, label_9564f
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, label_9564f
	hltext_tree_pointer TreeBitstreamText_47722
	scall PrintTextStandard
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
	ld hl, $010a
	scall EventFlagAction
	jp label_95655
label_9564f:
	hltext_tree_pointer TreeBitstreamText_47722
	scall PrintTextStandard
label_95655:
	pop bc
	ret

Func_95657:
	push af
	ld a, e
	or a
	jp nz, label_956b0
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010b
	scall CheckEventFlag
	or a
	jp nz, label_956aa
	ld a, [wc79c]
	cp $01
	jp c, label_956aa
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, label_956aa
	hltext_tree_pointer TreeBitstreamText_47780
	scall PrintTextStandard
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
	ld hl, $010b
	scall EventFlagAction
	jp label_956b0
label_956aa:
	hltext_tree_pointer TreeBitstreamText_47780
	scall PrintTextStandard
label_956b0:
	pop bc
	ret

Func_956b2:
	push af
	ld a, e
	or a
	jp nz, label_9570b
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010c
	scall CheckEventFlag
	or a
	jp nz, label_95705
	ld a, [wc79c]
	cp $01
	jp c, label_95705
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, label_95705
	hltext_tree_pointer TreeBitstreamText_478bb
	scall PrintTextStandard
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
	ld hl, $010c
	scall EventFlagAction
	jp label_9570b
label_95705:
	hltext_tree_pointer TreeBitstreamText_478bb
	scall PrintTextStandard
label_9570b:
	pop bc
	ret

Func_9570d:
	push af
	ld a, e
	or a
	jp nz, label_95766
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010d
	scall CheckEventFlag
	or a
	jp nz, label_95760
	ld a, [wc79c]
	cp $01
	jp c, label_95760
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, label_95760
	hltext_tree_pointer TreeBitstreamText_47943
	scall PrintTextStandard
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
	ld hl, $010d
	scall EventFlagAction
	jp label_95766
label_95760:
	hltext_tree_pointer TreeBitstreamText_47943
	scall PrintTextStandard
label_95766:
	pop bc
	ret

Data_95768:
	db $01, $08, $02, $01, $00, $0a, $03, $01, $03, $02, $34
	db $05, $01, $01, $01, $00, $21, $02, $09, $02, $08, $34

Data_9577e:
	db $f0, $03, $ff, $ff

Data_95782:
	db $8e, $03, $ff, $ff

Data_95786:
	person_event $24, $0c, $02, $07, $01, $01, $01, $04, $00, NULL, NULL

Data_95794:
	person_event $ff, $00, $03, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_9577e
	person_event $ff, $00, $08, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_95782

Func_957b0:: ; 957b0
	ld e, $02
	ld hl, Data_95768
	scall LoadWarps
	ld hl, $000e
	scall CheckEventFlag
	or a
	jp nz, label_957e0
	ld e, $01
	ld hl, Data_95786
	scall LoadMapObjects
	playmusic SONG_SHOP
	scall Func_8001c
	call Func_957f5
	ld e, $01
	ld hl, $000e
	scall EventFlagAction
	jp label_957f0
label_957e0:
	playmusic SONG_SHOP
	ld e, $02
	ld hl, Data_95794
	scall LoadMapObjects
	scall Func_8001c
label_957f0:
	ret

Data_957f1:
	db $05, $01, $ff, $ff

Func_957f5:
	ld bc, Data_957f1
	ld e, $25
	xor a
	scall MovePerson
	ld c, $01
	ld de, Data_957f1
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
	ret

Data_9580c:
	db $00, $0b, $09, $01, $00, $0a, $09, $04, $09, $05, $2e

Func_95817:: ; 95817
	ld e, $01
	ld hl, Data_9580c
	scall LoadWarps
	playmusic SONG_WORLD_MAP
	scall Func_8001c
	ret

Data_95828: ; 95828
	db $02, $09, $02, $01, $00, $1f, $05, $01, $05, $02, $34

Data_95833: ; 95833
	db $5a, $02, $02, $11, $4f, $c7, $03, $ff, $ff, $ef, $03, $ff, $ff, $28, $03, $ff
	db $ff

Data_95844: ; 95844
	db $24, $0c, $03, $08, $01, $01, $01, $04, $00, $25, $b9, $5a, $00, $00, $00, $0c
	db $06, $01, $01, $01, $02, $04, $00, $25, $00, $00, $00, $00, $ff, $00, $06, $01
	db $01, $01, $02, $04, $00, $25, $5f, $48, $38, $58, $ff, $00, $03, $01, $02, $01
	db $02, $04, $00, $25, $5f, $48, $40, $58

Data_9587c: ; 9587c
	db $24, $04, $05, $04, $01, $01, $00, $04, $00, $25, $b9, $5a, $00, $00, $00, $04
	db $09, $07, $01, $01, $00, $04, $00, $25, $00, $00, $00, $00, $ff, $00, $06, $01
	db $01, $01, $02, $04, $00, $25, $5f, $48, $38, $58, $ff, $00, $03, $01, $02, $01
	db $02, $04, $00, $25, $5f, $48, $40, $58, $ff, $00, $0a, $05, $02, $02, $02, $04
	db $00, $25, $5f, $48, $3c, $58

Func_958c2::
	call Func_9596a
	ld hl, Func_9596a
	scall Func_80f11
	loadwarps 1, Data_95828
	ld e, $1
	ld hl, Data_95833
	scall Func_80ce7
	playmusic $c
	checkevent $f
	or a
	jp nz, Func_9590a
	loadpeople 4, Data_95844
	hideperson $1
	scall Func_8001c
	call Func_959a9
	setevent $f
	jp Func_95957

Func_9590a:
	ld a, [wc78c]
	cp $a
	jp c, Func_95935
	loadpeople 5, Data_9587c
	ld c, $6
	ld e, $9
	xor a
	scall Func_80080
	ld e, $2
	xor a
	scall SpriteFace
	hideperson $1
	scall Func_8001c
	jp Func_95957

Func_95935:
	loadpeople 5, Data_9587c
	ld c, $0
	ld e, $0
	ld a, $1
	scall Func_80080
	hideperson $1
	hideperson $4
	scall Func_8001c
Func_95957:
	ret

Data_95958:
	db $00, $0f, $02, $01, $0a, $05

Data_9595e: ; 9595e
	db $02, $0f, $02, $01, $0a, $06

Data_95964: ; 95964
	db $04, $03, $02, $03, $0a, $05

Func_9596a:
	ld a, [wc78c]
	cp $a
	jp nc, Func_9597e
	ld hl, Data_95964
	scall Func_80d9b
	scall Func_80f02
	jp Func_95998

Func_9597e:
	checkevent $5b
	cp $1
	jp nz, Func_95998
	ld hl, Data_95958
	scall Func_80d9b
	ld hl, Data_9595e
	scall Func_80d9b
	scall Func_80f02
Func_95998:
	ret

Data_95999:
	db $05, $04, $ff, $ff

Data_9599d: ; 9599d
	db $06, $04, $ff, $ff

Data_959a1: ; 959a1
	db $06, $02, $ff, $ff

Data_959a5: ; 959a5
	db $06, $04, $ff, $ff

Func_959a9:
	ld bc, Data_95999
	ld e, BANK(Data_95999)
	xor a
	scall MovePerson
	ld c, $1
	ld de, Data_9599d
	ld a, BANK(Data_9599d)
	scall MovePlayer
	playsfx $31
	loademote $1, $2, $c
	scall WaitEmote
	ld hl, $1e
	scall ScriptSleep
	ld a, STARTER + 1
	scall GetRobotSprite
	ld e, a
	ld a, $1
	scall ChangeSprite
	ld e, $2
	ld a, $1
	scall SpriteFace
	showperson $1
	move_person $1, Data_959a1, 1
	scall WaitNPCStep
	playsfx $31
	loademote $1, $4, $c
	scall WaitEmote
	scall HideEmote
	ld e, $1
	xor a
	scall SpriteFace
	writenpctext TreeBitstreamText_3926c
	ld bc, Data_959a5
	ld e, BANK(Data_959a5)
	ld a, $1
	scall MovePerson
	scall WaitNPCStep
	hideperson $1
	playsfx $2a
	playmusic SONG_NONE
	playmusic $19
	ld hl, $b4
	scall ScriptSleep
	playmusic SONG_NONE
	playmusic $c
IF DEF(SUN)
	writetext TreeBitstreamText_39295
ELIF DEF(STAR)
	writetext TreeBitstreamText_392a8
ENDC
	ld a, $3
	scall PlayerFace
	writenpctext TreeBitstreamText_392ba
	playsfx $2a
	writetext TreeBitstreamText_39321
	ld a, [wc78c]
	cp $a
	jp nc, Func_95a7f
	checkevent $63
	cp $1
	jp nz, Func_95a7f
	writenpctext TreeBitstreamText_3933b
Func_95a7f:
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, 1000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wc793]
	cp $3
	jp nz, Func_95aa4
	ld c, $4
	ld e, $0
	ld a, SUNNY + 1
	scall GiveRobot
	jp Func_95ab2

Func_95aa4:
	ld c, $5
	ld e, $0
	ld a, STARTER + 1
	scall GiveRobot
	ld a, $28
	scall Func_810a3
Func_95ab2:
	ret

Data_95ab3:
	db $08, $07, $09, $07, $ff, $ff

Func_95ab9:
	ld a, e
	or a
	jp nz, Func_95c0b
	checkevent $f3
	cp $1
	jp nz, Func_95b02
	checkevent $f5
	or a
	jp nz, Func_95b02
	xor a
	scall FacePlayer
	writenpctext TreeBitstreamText_39559
	playsfx $2a
	writetext TreeBitstreamText_395a3
	ld c, $0
	ld e, $1
	ld a, $1b
	scall Func_80d4d
	writenpctext TreeBitstreamText_395b4
	setevent $f5
	jp Func_95c0b

Func_95b02:
	checkevent $f4
	cp $1
	jp nz, Func_95b40
	checkevent $f6
	or a
	jp nz, Func_95b40
	xor a
	scall FacePlayer
	ld hl, CopyFromDEtoHL
	scall PrintTextWithNPCName
	playsfx $2a
	writetext TreeBitstreamText_3968a
	ld c, $0
	ld e, $1
	ld a, $1a
	scall Func_80d4d
	setevent $f6
	jp Func_95c0b

Func_95b40:
	ld a, [wc78c]
	cp $14
	jp nz, Func_95b81
	checkevent $e7
	or a
	jp nz, Func_95b81
	xor a
	scall FacePlayer
	writenpctext TreeBitstreamText_3949f
	playsfx $2a
	writetext TreeBitstreamText_39545
	ld c, $1e
	ld e, $0
	ld a, $16
	scall GiveRobot
	setevent $e7
	ld e, $2
	xor a
	scall SpriteFace
	jp Func_95c0b

Func_95b81:
	ld a, [wc78c]
	cp $a
	jp c, Func_95bdb
	ld a, [wPlayerFacing]
	cp $2
	jp z, Func_95b96
	cp $1
	jp nz, Func_95ba4
Func_95b96:
	ld c, $1
	ld de, Data_95ab3
	ld a, BANK(Data_95ab3)
	scall MovePlayer
	xor a
	scall PlayerFace
Func_95ba4:
	ld e, $2
	xor a
	scall SpriteFace
	checkevent $c4
	or a
	jp nz, Func_95bc2
	writenpctext TreeBitstreamText_393e9
	setevent $c4
Func_95bc2:
	writenpctext_yesorno TreeBitstreamText_3945b
	or a
	jp nz, Func_95bd2
	scall Func_80479
	jp Func_95bd8

Func_95bd2:
	writenpctext TreeBitstreamText_39471
Func_95bd8:
	jp Func_95c0b

Func_95bdb:
	xor a
	scall FacePlayer
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $1, $2, $8
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	writenpctext TreeBitstreamText_39369
	playmusic SONG_CENTER
Func_95c0b:
	ret

Data_95c0c:
	db $0a, $07, $ff, $ff

Data_95c10:
	db $0a, $06, $ff, $ff

Func_95c14:: ; 95c14
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld hl, $003c
	scall ScriptSleep
	pop af
	ld e, a
	ld a, $01
	scall ChangeSprite
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld bc, Data_95c0c
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld hl, $005b
	scall EventFlagAction
	call Func_9596a
	ld bc, Data_95c10
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ret

Data_95c73:
	db $0a, $07, $09, $07, $ff, $ff

Func_95c79:: ; 95c79
	ld e, a
	ld a, $01
	scall ChangeSprite
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld bc, Data_95c73
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall Func_80f02
	ret
