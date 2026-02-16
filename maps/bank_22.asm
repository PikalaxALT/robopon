INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 22", ROMX
	script_library 22

Data_890b4:
	db $1b, $10, $05, $03, $12

MapObjects_890b9:
	map_object $0c, $0c, $0d, $10, $01, $01, $02, $04, $00, 0, 0
	map_object $0c, $0c, $0e, $0e, $01, $01, $02, $04, $00, 0, 0
	map_object $0c, $0c, $0f, $10, $01, $01, $02, $04, $00, 0, 0
	map_object $ff, $00, $0c, $11, $01, $03, $02, $04, $01, Func_89237, 0

MapObjects_890f1:
	map_object $ff, $00, $09, $09, $01, $01, $00, $04, $00, Func_89353, 0
	map_object $ff, $00, $0f, $09, $01, $01, $00, $04, $00, Func_893a6, 0
	map_object $ff, $00, $0c, $09, $01, $01, $00, $04, $00, Func_893f9, 0

Data_8911b:
IF DEF(SUN)
	db $00, $02, $14, $11, $77, $09, $0b, $7f, $09, $18, $00, $01, $0a, $00
	db $00, $02, $14, $11, $3d, $0a, $0c, $7f, $1f, $17, $00, $02, $09, $00
	db $00, $02, $14, $11, $52, $0b, $0d, $2d, $09, $09, $00, $0a, $08, $00
	db $00, $02, $14, $11, $1b, $0c, $0e, $7f, $04, $0a, $00, $0b, $06, $00
	db $00, $02, $14, $11, $3a, $0e, $10, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $11, $7b, $09, $0b, $77, $17, $05, $1e, $0a, $0a, $00
	db $00, $02, $14, $11, $52, $0a, $0c, $2d, $09, $09, $00, $0b, $09, $00
	db $00, $02, $14, $11, $3d, $0b, $0d, $7f, $1f, $17, $00, $02, $08, $00
	db $00, $02, $14, $11, $31, $0c, $0e, $7e, $06, $1e, $00, $0a, $06, $00
	db $00, $02, $14, $11, $91, $0e, $10, $3b, $04, $17, $00, $02, $02, $00
ENDC

Func_89161::
	ld e, $01
	ld hl, Data_890b4
	scall Func_80ce7
	ld a, $04
	ld [wc7e2], a
	checkevent $0073
	if_true label_89180
	loadpeople $04, MapObjects_890b9
label_89180:
	loadpeople $03, MapObjects_890f1
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8911b
	playmusic $09
	scall FadeInMap
	hltext_tree_pointer TreeBitstreamText_468a2
	scall LandmarkSign
	ret

Data_891a4:
	db $0d, $11, $0e, $11, $0e, $10, $ff, $ff

Data_891ac:
	db $0f, $09, $ff, $ff

Data_891b0:
	db $0d, $09, $ff, $ff

Data_891b4:
	db $0e, $0f, $ff, $ff

Data_891b8:
	db $0e, $09, $ff, $ff

Data_891bc:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $17, $03, $0e, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_891e5:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $0e, $03, $0e, $04, $17, $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8920e:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $6b, $03, $0e, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_89237:
	ld a, e
	cp $02
	jp nz, label_89348
	checkevent $0073
	if_true label_89348
	playmusic 0
	playmusic $1a
	ld c, $01
	ld de, Data_891a4
	ld a, $22
	scall MovePlayer
	ld e, $03
	ld a, $02
	scall SpriteFace
	ld a, $01
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_47192
	scall PrintTextStandard
label_89272:
	ld de, Data_89349
	ld hl, Data_891bc
	scall Func_8039e
	if_true label_8928a
	ld a, [wc7c4]
	cp $01
	jp nz, label_89272
	jp label_89348
label_8928a:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_891ac
	ld e, $22
	ld a, $02
	scall Func_80688
	scall WaitNPCStep
	hideperson $02
	ld e, $01
	xor a
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_47192
	scall PrintTextStandard
label_892bb:
	ld de, Data_8934c
	ld hl, Data_891e5
	scall Func_8039e
	if_true label_892d3
	ld a, [wc7c4]
	cp $01
	jp nz, label_892bb
	jp label_89348
label_892d3:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_891b0
	ld e, $22
	xor a
	scall Func_80688
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld bc, Data_891b4
	ld e, $22
	ld a, $01
	scall Func_80688
	xor a
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_47192
	scall PrintTextStandard
label_89305:
	ld de, Data_89350
	ld hl, Data_8920e
	scall Func_8039e
	if_true label_8931d
	ld a, [wc7c4]
	cp $01
	jp nz, label_89305
	jp label_89348
label_8931d:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld e, $01
	ld hl, $0073
	scall EventFlagAction
	ld bc, Data_891b8
	ld e, $22
	ld a, $01
	scall Func_80688
	scall WaitNPCStep
	hideperson $01
	playmusic 0
	playmusic $09
label_89348:
	ret

Data_89349:
	dstr "ゆき"

Data_8934c:
	dstr "なつこ"

Data_89350:
	dstr "あい"

Func_89353:
	ld a, e
	if_true label_893a5
	ld a, [wPlayerFacing]
	or a
	jp z, label_89362
	jp label_893a5
label_89362:
	checkevent $0059
	cp $01
	jp nz, label_89376
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp label_893a5
label_89376:
	loademote $01, $01, $09
	xor a
	scall Func_80653
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld a, $0e
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
label_893a5:
	ret

Func_893a6:
	ld a, e
	if_true label_893f8
	ld a, [wPlayerFacing]
	or a
	jp z, label_893b5
	jp label_893f8
label_893b5:
	checkevent $0059
	cp $01
	jp nz, label_893c9
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp label_893f8
label_893c9:
	loademote $01, $01, $09
	xor a
	scall Func_80653
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld a, $0f
	ld [wc78a], a
	ld l, $09
	push hl
	ld c, $11
	ld e, $20
	ld a, $05
	scall Func_80dff
	pop bc
label_893f8:
	ret

Func_893f9:
	ld a, e
	if_true label_89431
	checkevent $0059
	if_true label_8941e
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	playsfx $31
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp label_89431
label_8941e:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	playsfx $32
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
label_89431:
	ret

Data_89432:
	db $20, $0d, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $05, $07, $01, $01, $20, $07, $05, $09, $05, $08, $34, $1c, $07, $01, $01, $20, $07, $05, $09, $05, $08, $34, $1e, $0b, $01, $01, $20, $08, $05, $09, $05, $08, $34, $1e, $12, $01, $01, $20, $05, $06, $0b, $06, $0a, $34, $1c, $16, $01, $01, $20, $06, $06, $0c, $06, $0b, $34, $10, $06, $01, $01, $05, $1e, $09, $13, $09, $12, $34, $05, $15, $01, $01, $05, $14, $09, $13, $09, $12, $34

Data_8948a:
	db $08, $0b, $01, $01, $20, $03, $01, $08, $01, $07, $34, $0a, $0e, $01, $01, $20, $03, $01, $08, $01, $07, $34, $0d, $14, $01, $01, $20, $03, $01, $08, $01, $07, $34, $10, $15, $01, $01, $20, $03, $01, $08, $01, $07, $34, $13, $14, $01, $01, $20, $03, $01, $08, $01, $07, $34, $16, $0e, $01, $01, $20, $03, $01, $08, $01, $07, $34, $19, $0b, $01, $01, $20, $03, $01, $08, $01, $07, $34

Data_894d7:
	db $c1, $01, $ff, $ff

Data_894db:
	db $ca, $01, $ff, $ff

Data_894df:
	db $c5, $01, $ff, $ff

Data_894e3:
	db $c3, $01, $ff, $ff

Data_894e7:
	db $c6, $01, $ff, $ff

Data_894eb:
	db $c7, $01, $ff, $ff

Data_894ef:
	db $c2, $01, $ff, $ff

Data_894f3:
	db $c9, $01, $ff, $ff

Data_894f7:
	db $b5, $02, $ff, $ff

Data_894fb:
	db $26, $03, $ff, $ff

Data_894ff:
	db $9c, $03, $ff, $ff

Data_89503:
	db $9d, $03, $ff, $ff

Data_89507:
	db $9e, $03, $ff, $ff

Data_8950b:
	db $9f, $03, $ff, $ff

MapObjects_8950f:
	map_object $00, $04, $17, $15, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894d7
	map_object $07, $04, $0e, $0a, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894db
	map_object $06, $04, $1a, $06, $01, $01, $01, $04, $00, PrintTextFacePlayer_22, Data_894df
	map_object $06, $04, $05, $0d, $01, $01, $01, $04, $00, PrintTextFacePlayer_22, Data_894e3
	map_object $06, $0c, $1f, $18, $01, $01, $03, $04, $00, PrintTextFacePlayer_22, Data_894e7
	map_object $ff, $00, $1f, $0c, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f7
	map_object $ff, $00, $1f, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f7
	map_object $02, $04, $0d, $16, $01, $01, $02, $04, $00, PrintTextFacePlayer_22, Data_894eb
	map_object $05, $04, $11, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894ef
	map_object $00, $04, $1d, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894f3
	map_object $07, $04, $13, $07, $01, $01, $03, $04, $00, Func_896f7, 0

MapObjects_895a9:
	map_object $ff, $00, $08, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $0d, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $10, $15, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $13, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $16, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb
	map_object $ff, $00, $19, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_22, Data_894fb

MapObjects_8960b:
	map_object $ff, $00, $08, $0b, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $0a, $0e, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $0d, $14, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $10, $15, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $13, $14, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $16, $0e, $01, $01, $00, $04, $01, Func_89996, 0
	map_object $ff, $00, $19, $0b, $01, $01, $00, $04, $01, Func_89996, 0

Func_8966d:: ; 8966d
	ld a, $01
	ld [wc789], a
	ld a, $03
	ld [wc7e2], a
	call Func_89959
	ld hl, Func_89959
	scall Func_80f11
	playmusic $03
	ld a, $01
	scall LoadPlayerSprite
	ld a, [wc790]
	or a
	jp z, label_896db
	ld a, [wc790]
	cp $07
	jp nc, label_896db
	loadwarps $08, Data_89432
	loadwarps $07, Data_8948a
	loadpeople $0b, MapObjects_8950f
	loadpeople $07, MapObjects_8960b
	ld de, Data_8950b
	xor a
	scall Func_80150
	ld de, Data_89503
	ld a, $01
	scall Func_80150
	ld de, Data_89507
	ld a, $03
	scall Func_80150
	ld de, Data_894ff
	ld a, $09
	scall Func_80150
	jp label_896f3
label_896db:
	loadwarps $08, Data_89432
	loadpeople $0b, MapObjects_8950f
	loadpeople $07, MapObjects_895a9
label_896f3:
	scall FadeInMap
	ret

Func_896f7:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	if_true label_8992c
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	ld a, [wc796]
	cp $01
	jp nz, label_89792
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_8978f
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	ld a, $26
	scall Func_80e7d
	cp $01
	jp nz, label_89786
	hltext_tree_pointer TreeBitstreamText_44392
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	if_true label_89775
	playsfx $68
	hltext_tree_pointer TreeBitstreamText_443c5
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
	ld a, $13
	scall GiveRobot
	ld a, $02
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp label_89783
label_89775:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_4445d
	scall PrintTextWithNPCName
	jp label_8992c
label_89783:
	jp label_8978f
label_89786:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_8992c
label_8978f:
	jp label_898d7
label_89792:
	ld a, [wc796]
	cp $09
	jp nz, label_8981c
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_89819
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	ld a, $69
	scall Func_80e7d
	cp $01
	jp nz, label_89810
	hltext_tree_pointer TreeBitstreamText_44507
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	if_true label_897ff
	playsfx $68
	hltext_tree_pointer TreeBitstreamText_4453d
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
	ld a, $6f
	scall GiveRobot
	ld a, $0a
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp label_8980d
label_897ff:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_4445d
	scall PrintTextWithNPCName
	jp label_8992c
label_8980d:
	jp label_89819
label_89810:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp label_8992c
label_89819:
	jp label_898d7
label_8981c:
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, label_89836
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, label_898d7
label_89836:
	ld a, [wc796]
	cp $08
	jp z, label_898bf
	cp $06
	jp z, label_898bf
	cp $0a
	jp z, label_898b0
	cp $05
	jp z, label_898b0
	cp $0c
	jp z, label_898a1
	cp $04
	jp z, label_898a1
	cp $0d
	jp z, label_89892
	cp $03
	jp z, label_89892
	cp $0b
	jp z, label_89883
	cp $02
	jp z, label_89883
	cp $07
	jp z, label_89874
	if_true label_898ce
label_89874:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp label_898d4
label_89883:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45add
	scall PrintTextStandard
	jp label_898d4
label_89892:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp label_898d4
label_898a1:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp label_898d4
label_898b0:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b10
	scall PrintTextStandard
	jp label_898d4
label_898bf:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp label_898d4
label_898ce:
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
label_898d4:
	jp label_8992c
label_898d7:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, label_8992c
	ld a, [wc796]
	cp $0a
	jp nc, label_898fe
	ld a, [wc796]
	cp $02
	jp c, label_898fe
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_44486
	scall PrintTextWithNPCName
	jp label_8992c
label_898fe:
	ld a, [wc796]
	cp $0f
	jp nz, label_8990f
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	jp label_8992c
label_8990f:
	ld a, [wc796]
	cp $0a
	jp c, label_89920
	hltext_tree_pointer TreeBitstreamText_445b1
	scall PrintTextWithNPCName
	jp label_8992c
label_89920:
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_4434a
	scall PrintTextWithNPCName
label_8992c:
	pop bc
	pop bc
	ret

Data_8992f:
	db $05, $07, $01, $01, $08, $0b

Data_89935:
	db $05, $07, $01, $01, $0a, $0e

Data_8993b:
	db $05, $07, $01, $01, $0d, $14

Data_89941:
	db $05, $07, $01, $01, $10, $15

Data_89947:
	db $05, $07, $01, $01, $13, $14

Data_8994d:
	db $05, $07, $01, $01, $16, $0e

Data_89953:
	db $05, $07, $01, $01, $19, $0b

Func_89959:
	ld a, [wc790]
	or a
	jp z, label_89995
	ld a, [wc790]
	cp $07
	jp nc, label_89995
	ld hl, Data_8992f
	scall Func_80d9b
	ld hl, Data_89935
	scall Func_80d9b
	ld hl, Data_8993b
	scall Func_80d9b
	ld hl, Data_89941
	scall Func_80d9b
	ld hl, Data_89947
	scall Func_80d9b
	ld hl, Data_8994d
	scall Func_80d9b
	ld hl, Data_89953
	scall Func_80d9b
	scall Func_80f02
label_89995:
	ret

Func_89996:	ld a, e
	cp $02
	jp nz, label_89a02
	ld a, [wMapX]
	add a, $05
	cp $19
	jp z, label_899f4
	cp $16
	jp z, label_899ec
	cp $13
	jp z, label_899e4
	cp $10
	jp z, label_899dc
	cp $0d
	jp z, label_899d4
	cp $0a
	jp z, label_899cc
	cp $08
	jp nz, label_899fc
	ld a, $04
	ld [wc78a], a
	jp label_89a02
label_899cc:
	ld a, $08
	ld [wc78a], a
	jp label_89a02
label_899d4:
	ld a, $0a
	ld [wc78a], a
	jp label_89a02
label_899dc:
	ld a, $0e
	ld [wc78a], a
	jp label_89a02
label_899e4:
	ld a, $0b
	ld [wc78a], a
	jp label_89a02
label_899ec:
	ld a, $09
	ld [wc78a], a
	jp label_89a02
label_899f4:
	ld a, $05
	ld [wc78a], a
	jp label_89a02
label_899fc:
	hltext_tree_pointer DummyTextTreeBitstream_001
	scall PrintTextStandard
label_89a02:
	ret

Data_89a03:
	db $08, $13, $04, $01, $05, $00, $05, $15, $05, $16, $2e

Data_89a0e:
	db $1f, $01, $0a, $03, $14

Data_89a13:
IF DEF(SUN)
	db $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	db $00, $02, $14, $14, $1c, $08, $0a, $7f, $1f, $17, $11, $08, $09, $00
	db $00, $02, $14, $14, $26, $08, $0a, $5a, $01, $00, $00, $01, $08, $00
	db $00, $02, $14, $14, $07, $09, $0b, $45, $06, $06, $11, $01, $04, $00
	db $00, $02, $14, $14, $03, $0a, $0c, $02, $0f, $17, $00, $02, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	db $00, $02, $14, $14, $38, $08, $0a, $18, $0d, $0b, $00, $01, $09, $00
	db $00, $02, $14, $14, $34, $08, $0a, $19, $17, $05, $1e, $01, $08, $00
	db $00, $02, $14, $14, $3a, $09, $0b, $17, $1f, $1e, $08, $01, $04, $00
	db $00, $02, $14, $14, $58, $0a, $0c, $02, $1f, $17, $11, $02, $02, $00
ENDC

MapObjects_89a59:
	map_object $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_89ac3, 0
	map_object $ff, $00, $0a, $03, $01, $01, $00, $04, $00, Func_89b28, 0

Func_89a75:: ; 89a75
	loadwarps $01, Data_89a03
	ld e, $01
	ld hl, Data_89a0e
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_89a13
	loadpeople $02, MapObjects_89a59
	ld a, $03
	ld [wc7e2], a
	ld a, [wBackupMapGroup]
	if_true label_89ab4
	ld a, [wBackupMapNumber]
	cp $02
	jp nz, label_89ab4
	call Func_89b79
	jp label_89ac2
label_89ab4:
	playmusic $09
	scall FadeInMap
	hltext_tree_pointer TreeBitstreamText_468ae
	scall LandmarkSign
label_89ac2:
	ret

Func_89ac3:
	ld a, e
	if_true label_89b27
	ld a, [wPlayerFacing]
	or a
	jp z, label_89ad2
	jp label_89b27
label_89ad2:
	checkevent $0059
	cp $01
	jp nz, label_89ae6
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp label_89b27
label_89ae6:
	ld a, [wc790]
	or a
	jp z, label_89afe
	ld a, [wc790]
	cp $07
	jp nc, label_89afe
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp label_89b27
label_89afe:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	xor a
	scall PlayerFace
	ld l, $10
	push hl
	ld c, $09
	ld e, $15
	ld a, $05
	scall Func_80dff
	pop bc
label_89b27:
	ret

Func_89b28:
	ld a, e
	if_true label_89b78
	ld a, [wc790]
	or a
	jp z, label_89b45
	ld a, [wc790]
	cp $07
	jp nc, label_89b45
	hltext_tree_pointer TreeBitstreamText_47041
	scall PrintTextStandard
	jp label_89b78
label_89b45:
	checkevent $0059
	if_true label_89b65
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	playsfx $32
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp label_89b78
label_89b65:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	playsfx $28
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
label_89b78:
	ret

Func_89b79:
	checkevent $00fc
	if_true label_89bc4
	playmusic $09
	xor a
	scall Func_80653
	ld a, $02
	scall PlayerFace
	scall FadeInMap
	hltext_tree_pointer TreeBitstreamText_3d76a
	scall LandmarkSign
	loademote $01, $02, $09
	playsfx $37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld e, $01
	ld hl, $00fc
	scall EventFlagAction
	jp label_89bc9
label_89bc4:
	ld a, $01
	scall Func_80653
label_89bc9:
	ret

Data_89bca:
	db $09, $03, $01, $01, $20, $03, $03, $02, $03, $03, $2e

Data_89bd5:
	db $21, $0e, $12, $03, $0d

Data_89bda:
IF DEF(SUN)
	db $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	db $00, $02, $14, $14, $1c, $08, $0a, $7f, $1f, $17, $11, $08, $09, $00
	db $00, $02, $14, $14, $26, $08, $0a, $5a, $01, $00, $00, $01, $08, $00
	db $00, $02, $14, $14, $07, $09, $0b, $45, $06, $06, $11, $01, $04, $00
	db $00, $02, $14, $14, $03, $0a, $0c, $02, $0f, $17, $00, $02, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	db $00, $02, $14, $14, $38, $08, $0a, $18, $0d, $0b, $00, $01, $09, $00
	db $00, $02, $14, $14, $34, $08, $0a, $19, $17, $05, $1e, $01, $08, $00
	db $00, $02, $14, $14, $3a, $09, $0b, $17, $1f, $1e, $08, $01, $04, $00
	db $00, $02, $14, $14, $58, $0a, $0c, $02, $1f, $17, $11, $02, $02, $00
ENDC

Data_89c20:
	map_object $0c, $0c, $10, $09, $01, $01, $02, $04, $00, 0, 0
	map_object $ff, $00, $0e, $0a, $01, $02, $00, $04, $01, Func_89d8a, 0
	map_object $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_89ca9, 0
	map_object $ff, $00, $0a, $03, $01, $01, $00, $04, $00, Func_89d04, 0

Func_89c58:: ; 89c58
	ld e, $01 ; 89C58 (22:5c58) -> 1E 01
	ld hl, Data_89bca ; 89C5A (22:5c5a) -> 21 CA 5B
	scall LoadWarps ; 89C5D (22:5c5d) -> CD 3A 40
	ld e, $01 ; 89C60 (22:5c60) -> 1E 01
	ld hl, Data_89bd5 ; 89C62 (22:5c62) -> 21 D5 5B
	scall Func_80ce7 ; 89C65 (22:5c65) -> CD E7 4C
	ld a, $03 ; 89C68 (22:5c68) -> 3E 03
	scall Func_80d01 ; 89C6A (22:5c6a) -> CD 01 4D
	ld e, $05 ; 89C6D (22:5c6d) -> 1E 05
	ld hl, Data_89bda ; 89C6F (22:5c6f) -> 21 DA 5B
	scall LoadEncounters ; 89C72 (22:5c72) -> CD 24 4D
	ld e, $04 ; 89C75 (22:5c75) -> 1E 04
	ld hl, Data_89c20 ; 89C77 (22:5c77) -> 21 20 5C
	scall LoadMapObjects ; 89C7A (22:5c7a) -> CD FB 40
	ld a, $09 ; 89C7D (22:5c7d) -> 3E 09
	scall PlayMusic ; 89C7F (22:5c7f) -> CD E6 4E
	ld a, $03 ; 89C82 (22:5c82) -> 3E 03
	ld [wc7e2], a ; 89C84 (22:5c84) -> EA E2 C7
	ld hl, $006b ; 89C87 (22:5c87) -> 21 6B 00
	scall CheckEventFlag ; 89C8A (22:5c8a) -> CD 2E 46
	cp $01 ; 89C8D (22:5c8d) -> FE 01
	jp nz, label_89c9f ; 89C8F (22:5c8f) -> C2 9F 5C
	ld e, $00 ; 89C92 (22:5c92) -> 1E 00
	xor a ; 89C94 (22:5c94) -> AF
	scall SetPersonVisibilityState ; 89C95 (22:5c95) -> CD 3D 41
	ld e, $00 ; 89C98 (22:5c98) -> 1E 00
	ld a, $01 ; 89C9A (22:5c9a) -> 3E 01
	scall SetPersonVisibilityState ; 89C9C (22:5c9c) -> CD 3D 41
label_89c9f:
	scall FadeInMap ; 89C9F (22:5c9f) -> CD 1C 40
	ld hl, $02db ; 89CA2 (22:5ca2) -> 21 DB 02
	scall LandmarkSign ; 89CA5 (22:5ca5) -> CD 72 4F
	ret  ; 89CA8 (22:5ca8) -> C9

Func_89ca9:
	ld a, e ; 89CA9 (22:5ca9) -> 7B
	or a ; 89CAA (22:5caa) -> B7
	jp nz, label_89d03 ; 89CAB (22:5cab) -> C2 03 5D
	ld a, [wPlayerFacing] ; 89CAE (22:5cae) -> FA 38 C8
	or a ; 89CB1 (22:5cb1) -> B7
	jp z, label_89cb8 ; 89CB2 (22:5cb2) -> CA B8 5C
	jp label_89d03 ; 89CB5 (22:5cb5) -> C3 03 5D
label_89cb8:
	ld hl, $0059 ; 89CB8 (22:5cb8) -> 21 59 00
	scall CheckEventFlag ; 89CBB (22:5cbb) -> CD 2E 46
	cp $01 ; 89CBE (22:5cbe) -> FE 01
	jp nz, label_89ccc ; 89CC0 (22:5cc0) -> C2 CC 5C
	ld hl, $0283 ; 89CC3 (22:5cc3) -> 21 83 02
	scall PrintTextStandard ; 89CC6 (22:5cc6) -> CD 98 44
	jp label_89d03 ; 89CC9 (22:5cc9) -> C3 03 5D
label_89ccc:
	ld a, $01 ; 89CCC (22:5ccc) -> 3E 01
	ld [wc78a], a ; 89CCE (22:5cce) -> EA 8A C7
	ld e, $00 ; 89CD1 (22:5cd1) -> 1E 00
	ld hl, $00fc ; 89CD3 (22:5cd3) -> 21 FC 00
	scall EventFlagAction ; 89CD6 (22:5cd6) -> CD 1B 46
	xor a ; 89CD9 (22:5cd9) -> AF
	scall Func_80653 ; 89CDA (22:5cda) -> CD 53 46
	ld c, $01 ; 89CDD (22:5cdd) -> 0E 01
	ld e, $01 ; 89CDF (22:5cdf) -> 1E 01
	ld a, $09 ; 89CE1 (22:5ce1) -> 3E 09
	scall LoadEmote ; 89CE3 (22:5ce3) -> CD 76 41
	ld a, $5a ; 89CE6 (22:5ce6) -> 3E 5A
	scall PlaySFX ; 89CE8 (22:5ce8) -> CD FE 4E
	scall WaitEmote ; 89CEB (22:5ceb) -> CD D5 41
	scall HideEmote ; 89CEE (22:5cee) -> CD 8B 41
	ld a, $02 ; 89CF1 (22:5cf1) -> 3E 02
	scall PlayerFace ; 89CF3 (22:5cf3) -> CD 77 46
	ld l, $03 ; 89CF6 (22:5cf6) -> 2E 03
	push hl ; 89CF8 (22:5cf8) -> E5
	ld c, $03 ; 89CF9 (22:5cf9) -> 0E 03
	ld e, $03 ; 89CFB (22:5cfb) -> 1E 03
	ld a, $20 ; 89CFD (22:5cfd) -> 3E 20
	scall Func_80dff ; 89CFF (22:5cff) -> CD FF 4D
	pop bc ; 89D02 (22:5d02) -> C1
label_89d03:
	ret  ; 89D03 (22:5d03) -> C9

Func_89d04:
	ld a, e ; 89D04 (22:5d04) -> 7B
	or a ; 89D05 (22:5d05) -> B7
	jp nz, label_89d54 ; 89D06 (22:5d06) -> C2 54 5D
	ld a, [wc790] ; 89D09 (22:5d09) -> FA 90 C7
	or a ; 89D0C (22:5d0c) -> B7
	jp z, label_89d21 ; 89D0D (22:5d0d) -> CA 21 5D
	ld a, [wc790] ; 89D10 (22:5d10) -> FA 90 C7
	cp $07 ; 89D13 (22:5d13) -> FE 07
	jp nc, label_89d21 ; 89D15 (22:5d15) -> D2 21 5D
	ld hl, $03dd ; 89D18 (22:5d18) -> 21 DD 03
	scall PrintTextStandard ; 89D1B (22:5d1b) -> CD 98 44
	jp label_89d54 ; 89D1E (22:5d1e) -> C3 54 5D
label_89d21:
	ld hl, $0059 ; 89D21 (22:5d21) -> 21 59 00
	scall CheckEventFlag ; 89D24 (22:5d24) -> CD 2E 46
	or a ; 89D27 (22:5d27) -> B7
	jp nz, label_89d41 ; 89D28 (22:5d28) -> C2 41 5D
	ld e, $01 ; 89D2B (22:5d2b) -> 1E 01
	ld hl, $0059 ; 89D2D (22:5d2d) -> 21 59 00
	scall EventFlagAction ; 89D30 (22:5d30) -> CD 1B 46
	ld a, $32 ; 89D33 (22:5d33) -> 3E 32
	scall PlaySFX ; 89D35 (22:5d35) -> CD FE 4E
	ld hl, $035b ; 89D38 (22:5d38) -> 21 5B 03
	scall PrintTextStandard ; 89D3B (22:5d3b) -> CD 98 44
	jp label_89d54 ; 89D3E (22:5d3e) -> C3 54 5D
label_89d41:
	ld e, $00 ; 89D41 (22:5d41) -> 1E 00
	ld hl, $0059 ; 89D43 (22:5d43) -> 21 59 00
	scall EventFlagAction ; 89D46 (22:5d46) -> CD 1B 46
	ld a, $28 ; 89D49 (22:5d49) -> 3E 28
	scall PlaySFX ; 89D4B (22:5d4b) -> CD FE 4E
	ld hl, $035c ; 89D4E (22:5d4e) -> 21 5C 03
	scall PrintTextStandard ; 89D51 (22:5d51) -> CD 98 44
label_89d54:
	ret  ; 89D54 (22:5d54) -> C9

Data_89d55:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $90, $01, $90, $02, $0a, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $10, $0a, $ff, $ff, $10, $06, $09, $06, $09, $04, $ff, $ff

Func_89d8a:
IF DEF(SUN)
	db $7b, $fe, $02, $c2, $f8, $5d, $21, $6b, $00, $cd, $2e, $46, $b7, $c2, $f8, $5d, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $0e, $01, $11, $7e, $5d, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $77, $46, $21, $7b, $00, $cd, $a9, $44, $11, $f9, $5d, $21, $55, $5d, $cd, $d3, $4d, $b7, $c2, $ca, $5d, $c3, $f8, $5d, $1e, $01, $21, $6b, $00, $cd, $1b, $46, $21, $7c, $00, $cd, $a9, $44, $01, $82, $5d, $1e, $22, $af, $cd, $88, $46, $3e, $2e, $cd, $fe, $4e, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c9, $c1, $c8, $dd, $00, $08, $13, $04, $01, $05, $00, $10, $06, $10, $07, $34, $01, $0a, $01, $01, $05, $1f, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1f, $12, $0a, $11, $0a, $2e, $1e, $0b, $0f, $03, $13, $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00, $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $09, $04, $00, $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00, $03, $04, $08, $05, $01, $01, $00, $04, $00, $22, $1e, $5f, $00, $00, $05, $04, $09, $05, $01, $01, $00, $04, $00, $22, $a8, $5f, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $31, $60, $00, $00, $07, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $b7, $60, $00, $00, $ff, $00, $07, $03, $06, $01, $00, $04, $00, $22, $15, $61, $00, $00
ELIF DEF(STAR)
	db $7b, $fe, $02, $c2, $f8, $5d, $21, $6b, $00, $cd, $2e, $46, $b7, $c2, $f8, $5d, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $0e, $01, $11, $7e, $5d, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $77, $46, $21, $7b, $00, $cd, $a9, $44, $11, $f9, $5d, $21, $55, $5d, $cd, $d3, $4d, $b7, $c2, $ca, $5d, $c3, $f8, $5d, $1e, $01, $21, $6b, $00, $cd, $1b, $46, $21, $7c, $00, $cd, $a9, $44, $01, $82, $5d, $1e, $22, $af, $cd, $88, $46, $3e, $2e, $cd, $fe, $4e, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c9, $c1, $c8, $dd, $00, $08, $13, $04, $01, $05, $00, $10, $06, $10, $07, $34, $01, $0a, $01, $01, $05, $1f, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1f, $12, $0a, $11, $0a, $2e, $1e, $0b, $0f, $03, $13, $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00, $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00, $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00, $03, $04, $08, $05, $01, $01, $00, $04, $00, $22, $1e, $5f, $00, $00, $05, $04, $09, $05, $01, $01, $00, $04, $00, $22, $a8, $5f, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $31, $60, $00, $00, $07, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $b7, $60, $00, $00, $ff, $00, $07, $03, $06, $01, $00, $04, $00, $22, $15, $61, $00, $00
ENDC

Func_89eaf:: ; 89eaf
IF DEF(SUN)
	db $1e, $03, $21, $fd, $5d, $cd, $3a, $40, $1e, $01, $21, $1e, $5e, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $23, $5e, $cd, $24, $4d, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $de, $5e, $1e, $04, $21, $69, $5e, $cd, $fb, $40, $1e, $01, $21, $a1, $5e, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $dc, $02, $cd, $72, $4f, $c9, $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $04, $01, $08, $01, $06, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $74, $5f, $f8, $01, $7e, $cd, $4b, $44, $21, $76, $00, $cd, $2e, $46, $b7, $c2, $6e, $5f, $21, $2c, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $65, $5f, $11, $76, $5f, $21, $f5, $5e, $cd, $d3, $4d, $b7, $c2, $54, $5f, $c3, $74, $5f, $1e, $01, $21, $76, $00, $cd, $1b, $46, $21, $2d, $02, $cd, $98, $44, $c3, $6b, $5f, $21, $32, $02, $cd, $98, $44, $c3, $74, $5f, $21, $34, $02, $cd, $98, $44, $c1, $c9, $28, $d6, $cb, $de, $b8, $de, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $34, $01, $34, $01, $08, $17, $12, $11, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $fe, $5f, $f8, $01, $7e, $cd, $4b, $44, $21, $77, $00, $cd, $2e, $46, $b7, $c2, $f8, $5f, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $ef, $5f, $11, $00, $60, $21, $7f, $5f, $cd, $d3, $4d, $b7, $c2, $de, $5f, $c3, $fe, $5f, $1e, $01, $21, $77, $00, $cd, $1b, $46, $21, $2f, $02, $cd, $98, $44, $c3, $f5, $5f, $21, $33, $02, $cd, $98, $44, $c3, $fe, $5f, $21, $2a, $02, $cd, $98, $44, $c1, $c9, $ca, $de, $b1, $28, $bb, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $0a, $01, $17, $01, $08, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $87, $60, $f8, $01, $7e, $cd, $4b, $44, $21, $78, $00, $cd, $2e, $46, $b7, $c2, $81, $60, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $78, $60, $11, $89, $60, $21, $08, $60, $cd, $d3, $4d, $b7, $c2, $67, $60, $c3, $87, $60, $1e, $01, $21, $78, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $7e, $60, $21, $33, $02, $cd, $98, $44, $c3, $87, $60, $21, $29, $02, $cd, $98, $44, $c1, $c9, $db, $af, $b6, $b0, $00, $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $51, $01, $51, $01, $08, $17, $17, $17, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $0d, $61, $f8, $01, $7e, $cd, $4b, $44, $21, $79, $00, $cd, $2e, $46, $b7, $c2, $07, $61, $21, $2b, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $fe, $60, $11, $0f, $61, $21, $8e, $60, $cd, $d3, $4d, $b7, $c2, $ed, $60, $c3, $0d, $61, $1e, $01, $21, $79, $00, $cd, $1b, $46, $21, $2b, $02, $cd, $98, $44, $c3, $04, $61, $21, $2b, $02, $cd, $98, $44, $c3, $0d, $61, $21, $2b, $02, $cd, $98, $44, $c1, $c9, $b5, $ca, $de, $bb, $dd, $00, $7b, $b7, $c2, $2f, $61, $fa, $90, $c7, $b7, $ca, $29, $61, $fa, $90, $c7, $fe, $07, $c2, $2f, $61, $21, $96, $03, $cd, $98, $44, $c9, $01, $0a, $01, $01, $05, $1e, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $11, $0a, $2e, $23, $0b, $0b, $03, $0b, $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00, $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $03, $04, $00, $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00, $0c, $04, $08, $05, $01, $01, $00, $04, $00, $22, $84, $62, $00, $00, $00, $04, $09, $05, $01, $01, $00, $04, $00, $22, $0a, $63, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $94, $63, $00, $00, $03, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $1d, $64, $00, $00, $ff, $00, $07, $03, $06, $01, $00, $04, $00, $22, $a5, $65, $00, $00, $0f, $04, $0e, $0f, $01, $01, $02, $04, $00, $22, $00, $00, $00, $00, $ff, $00, $0e, $0f, $01, $01, $02, $04, $00, $22, $80, $64, $00, $00
ELIF DEF(STAR)
	db $1e, $03, $21, $fd, $5d, $cd, $3a, $40, $1e, $01, $21, $1e, $5e, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $23, $5e, $cd, $24, $4d, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $de, $5e, $1e, $04, $21, $69, $5e, $cd, $fb, $40, $1e, $01, $21, $a1, $5e, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $dc, $02, $cd, $72, $4f, $c9, $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $45, $01, $08, $14, $14, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $74, $5f, $f8, $01, $7e, $cd, $4b, $44, $21, $76, $00, $cd, $2e, $46, $b7, $c2, $6e, $5f, $21, $2c, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $65, $5f, $11, $76, $5f, $21, $f5, $5e, $cd, $d3, $4d, $b7, $c2, $54, $5f, $c3, $74, $5f, $1e, $01, $21, $76, $00, $cd, $1b, $46, $21, $2d, $02, $cd, $98, $44, $c3, $6b, $5f, $21, $32, $02, $cd, $98, $44, $c3, $74, $5f, $21, $34, $02, $cd, $98, $44, $c1, $c9, $28, $d6, $cb, $de, $b8, $de, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $34, $01, $34, $01, $08, $17, $12, $11, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $fe, $5f, $f8, $01, $7e, $cd, $4b, $44, $21, $77, $00, $cd, $2e, $46, $b7, $c2, $f8, $5f, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $ef, $5f, $11, $00, $60, $21, $7f, $5f, $cd, $d3, $4d, $b7, $c2, $de, $5f, $c3, $fe, $5f, $1e, $01, $21, $77, $00, $cd, $1b, $46, $21, $2f, $02, $cd, $98, $44, $c3, $f5, $5f, $21, $33, $02, $cd, $98, $44, $c3, $fe, $5f, $21, $2a, $02, $cd, $98, $44, $c1, $c9, $ca, $de, $b1, $28, $bb, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $0a, $01, $17, $01, $08, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $87, $60, $f8, $01, $7e, $cd, $4b, $44, $21, $78, $00, $cd, $2e, $46, $b7, $c2, $81, $60, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $78, $60, $11, $89, $60, $21, $08, $60, $cd, $d3, $4d, $b7, $c2, $67, $60, $c3, $87, $60, $1e, $01, $21, $78, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $7e, $60, $21, $33, $02, $cd, $98, $44, $c3, $87, $60, $21, $29, $02, $cd, $98, $44, $c1, $c9, $db, $af, $b6, $b0, $00, $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $51, $01, $51, $01, $08, $17, $17, $17, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $0d, $61, $f8, $01, $7e, $cd, $4b, $44, $21, $79, $00, $cd, $2e, $46, $b7, $c2, $07, $61, $21, $2b, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $fe, $60, $11, $0f, $61, $21, $8e, $60, $cd, $d3, $4d, $b7, $c2, $ed, $60, $c3, $0d, $61, $1e, $01, $21, $79, $00, $cd, $1b, $46, $21, $2b, $02, $cd, $98, $44, $c3, $04, $61, $21, $2b, $02, $cd, $98, $44, $c3, $0d, $61, $21, $2b, $02, $cd, $98, $44, $c1, $c9, $b5, $ca, $de, $bb, $dd, $00, $7b, $b7, $c2, $2f, $61, $fa, $90, $c7, $b7, $ca, $29, $61, $fa, $90, $c7, $fe, $07, $c2, $2f, $61, $21, $96, $03, $cd, $98, $44, $c9, $01, $0a, $01, $01, $05, $1e, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $11, $0a, $2e, $23, $0b, $0b, $03, $0b, $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00, $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00, $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00, $0c, $04, $08, $05, $01, $01, $00, $04, $00, $22, $84, $62, $00, $00, $00, $04, $09, $05, $01, $01, $00, $04, $00, $22, $0a, $63, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $94, $63, $00, $00, $03, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $1d, $64, $00, $00, $ff, $00, $07, $03, $06, $01, $00, $04, $00, $22, $a5, $65, $00, $00, $0f, $04, $0e, $0f, $01, $01, $02, $04, $00, $22, $00, $00, $00, $00, $ff, $00, $0e, $0f, $01, $01, $02, $04, $00, $22, $80, $64, $00, $00
ENDC

Func_8a1f3:: ; 8a1f3
IF DEF(SUN)
	db $cd, $e7, $65, $21, $e7, $65, $cd, $11, $4f, $1e, $02, $21, $30, $61, $cd, $3a, $40, $1e, $01, $21, $46, $61, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $4b, $61, $cd, $24, $4d, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $3d, $62, $1e, $04, $21, $91, $61, $cd, $fb, $40, $1e, $03, $21, $c9, $61, $cd, $fb, $40, $1e, $00, $3e, $05, $cd, $3d, $41, $c3, $4c, $62, $1e, $03, $21, $c9, $61, $cd, $fb, $40, $1e, $00, $3e, $01, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $dd, $02, $cd, $72, $4f, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $18, $01, $18, $01, $09, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $da, $62, $f8, $01, $7e, $cd, $4b, $44, $21, $7a, $00, $cd, $2e, $46, $b7, $c2, $d4, $62, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $cb, $62, $11, $dc, $62, $21, $5b, $62, $cd, $d3, $4d, $b7, $c2, $ba, $62, $c3, $da, $62, $1e, $01, $21, $7a, $00, $cd, $1b, $46, $21, $2f, $02, $cd, $98, $44, $c3, $d1, $62, $21, $33, $02, $cd, $98, $44, $c3, $da, $62, $21, $2d, $02, $cd, $98, $44, $c1, $c9, $db, $af, $b6, $b0, $00, $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $52, $01, $52, $01, $09, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $60, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $7b, $00, $cd, $2e, $46, $b7, $c2, $5a, $63, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $51, $63, $11, $62, $63, $21, $e1, $62, $cd, $d3, $4d, $b7, $c2, $40, $63, $c3, $60, $63, $1e, $01, $21, $7b, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $57, $63, $21, $33, $02, $cd, $98, $44, $c3, $60, $63, $21, $31, $02, $cd, $98, $44, $c1, $c9, $28, $b6, $b2, $bc, $ac, $b2, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $33, $01, $33, $01, $09, $17, $05, $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $ea, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $7c, $00, $cd, $2e, $46, $b7, $c2, $e4, $63, $21, $2b, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $db, $63, $11, $ec, $63, $21, $6b, $63, $cd, $d3, $4d, $b7, $c2, $ca, $63, $c3, $ea, $63, $1e, $01, $21, $7c, $00, $cd, $1b, $46, $21, $2b, $02, $cd, $98, $44, $c3, $e1, $63, $21, $2b, $02, $cd, $98, $44, $c3, $ea, $63, $21, $2b, $02, $cd, $98, $44, $c1, $c9, $28, $b5, $c8, $b4, $bb, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $af, $00, $00, $90, $01, $90, $02, $09, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $73, $64, $f8, $01, $7e, $cd, $4b, $44, $21, $7d, $00, $cd, $2e, $46, $b7, $c2, $6d, $64, $21, $2c, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $64, $64, $11, $75, $64, $21, $f4, $63, $cd, $d3, $4d, $b7, $c2, $53, $64, $c3, $73, $64, $1e, $01, $21, $7d, $00, $cd, $1b, $46, $21, $2d, $02, $cd, $98, $44, $c3, $6a, $64, $21, $32, $02, $cd, $98, $44, $c3, $73, $64, $21, $34, $02, $cd, $98, $44, $c1, $c9, $28, $bc, $de, $ae, $bc, $ba, $b3, $be, $b2, $29, $00, $f5, $f8, $01, $7e, $3d, $f8, $01, $77, $7b, $b7, $c2, $a3, $65, $21, $d8, $00, $cd, $2e, $46, $b7, $c2, $9d, $65, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76, $41, $1e, $0f, $3e, $0e, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28, $cd, $fe, $4e, $1e, $01, $f8, $01, $7e, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $14, $cd, $e6, $4e, $f8, $01, $7e, $cd, $4b, $44, $21, $1e, $00, $cd, $8f, $46, $0e, $0e, $1e, $0d, $3e, $0c, $cd, $8d, $4e, $1e, $01, $21, $d8, $00, $cd, $1b, $46, $3e, $60, $cd, $fe, $4e, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $09, $cd, $e6, $4e, $f8, $01, $7e, $cd, $4b, $44, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c3, $a3, $65, $21, $5c, $01, $cd, $98, $44, $c1, $c9, $7b, $b7, $c2, $bf, $65, $fa, $90, $c7, $b7, $ca, $b9, $65, $fa, $90, $c7, $fe, $07, $c2, $bf, $65, $21, $96, $03, $cd, $98, $44, $c9, $01, $0a, $01, $01, $05, $1e, $01, $0a, $01, $0b, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $12, $0b, $2e, $0f, $04, $01, $01, $05, $20, $0f, $04, $0f, $05, $2e, $13, $13, $01, $01, $0f, $04, $21, $86, $00, $cd, $2e, $46, $fe, $01, $c2, $06, $66, $21, $e1, $65, $cd, $9b, $4d, $cd, $02, $4f, $cd, $2b, $40, $1e, $03, $21, $c0, $65, $cd, $3a, $40, $c9, $0d, $11, $01, $01, $05, $21, $0d, $11, $0e, $11, $2e, $0f, $04, $01, $01, $05, $1f, $0f, $04, $0e, $04, $2e, $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $08, $00, $00, $02, $14, $11, $6c, $0a, $0c, $03, $17, $17, $0a, $02, $06, $00, $00, $02, $14, $11, $14, $0d, $0f, $17, $09, $0f, $00, $02, $04, $00, $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00, $ff, $00, $0b, $02, $03, $03, $00, $04, $00, $22, $24, $67, $00, $00, $01, $04, $08, $0b, $01, $01, $01, $04, $00, $22, $79, $67, $00, $00, $01, $04, $01, $0b, $01, $01, $00, $04, $00, $22, $01, $68, $00, $00, $0b, $0c, $0f, $04, $01, $01, $02, $04, $00, $22, $92, $68, $00, $00
ELIF DEF(STAR)
	db $cd, $e7, $65, $21, $e7, $65, $cd, $11, $4f, $1e, $02, $21, $30, $61, $cd, $3a, $40, $1e, $01, $21, $46, $61, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $4b, $61, $cd, $24, $4d, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $3d, $62, $1e, $04, $21, $91, $61, $cd, $fb, $40, $1e, $03, $21, $c9, $61, $cd, $fb, $40, $1e, $00, $3e, $05, $cd, $3d, $41, $c3, $4c, $62, $1e, $03, $21, $c9, $61, $cd, $fb, $40, $1e, $00, $3e, $01, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $dd, $02, $cd, $72, $4f, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $18, $01, $18, $01, $09, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $da, $62, $f8, $01, $7e, $cd, $4b, $44, $21, $7a, $00, $cd, $2e, $46, $b7, $c2, $d4, $62, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $cb, $62, $11, $dc, $62, $21, $5b, $62, $cd, $d3, $4d, $b7, $c2, $ba, $62, $c3, $da, $62, $1e, $01, $21, $7a, $00, $cd, $1b, $46, $21, $2f, $02, $cd, $98, $44, $c3, $d1, $62, $21, $33, $02, $cd, $98, $44, $c3, $da, $62, $21, $2d, $02, $cd, $98, $44, $c1, $c9, $db, $af, $b6, $b0, $00, $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $52, $01, $52, $01, $09, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $60, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $7b, $00, $cd, $2e, $46, $b7, $c2, $5a, $63, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $51, $63, $11, $62, $63, $21, $e1, $62, $cd, $d3, $4d, $b7, $c2, $40, $63, $c3, $60, $63, $1e, $01, $21, $7b, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $57, $63, $21, $33, $02, $cd, $98, $44, $c3, $60, $63, $21, $31, $02, $cd, $98, $44, $c1, $c9, $28, $b6, $b2, $bc, $ac, $b2, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $33, $01, $33, $01, $09, $17, $05, $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $ea, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $7c, $00, $cd, $2e, $46, $b7, $c2, $e4, $63, $21, $2b, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $db, $63, $11, $ec, $63, $21, $6b, $63, $cd, $d3, $4d, $b7, $c2, $ca, $63, $c3, $ea, $63, $1e, $01, $21, $7c, $00, $cd, $1b, $46, $21, $2b, $02, $cd, $98, $44, $c3, $e1, $63, $21, $2b, $02, $cd, $98, $44, $c3, $ea, $63, $21, $2b, $02, $cd, $98, $44, $c1, $c9, $28, $b5, $c8, $b4, $bb, $dd, $29, $00, $00, $00, $00, $01, $00, $c5, $af, $00, $00, $90, $01, $90, $02, $09, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $73, $64, $f8, $01, $7e, $cd, $4b, $44, $21, $7d, $00, $cd, $2e, $46, $b7, $c2, $6d, $64, $21, $2c, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $64, $64, $11, $75, $64, $21, $f4, $63, $cd, $d3, $4d, $b7, $c2, $53, $64, $c3, $73, $64, $1e, $01, $21, $7d, $00, $cd, $1b, $46, $21, $2d, $02, $cd, $98, $44, $c3, $6a, $64, $21, $32, $02, $cd, $98, $44, $c3, $73, $64, $21, $34, $02, $cd, $98, $44, $c1, $c9, $28, $bc, $de, $ae, $bc, $ba, $b3, $be, $b2, $29, $00, $f5, $f8, $01, $7e, $3d, $f8, $01, $77, $7b, $b7, $c2, $a3, $65, $21, $d8, $00, $cd, $2e, $46, $b7, $c2, $9d, $65, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76, $41, $1e, $0f, $3e, $0e, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28, $cd, $fe, $4e, $1e, $01, $f8, $01, $7e, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $14, $cd, $e6, $4e, $f8, $01, $7e, $cd, $4b, $44, $21, $1e, $00, $cd, $8f, $46, $0e, $0e, $1e, $0d, $3e, $0c, $cd, $8d, $4e, $1e, $01, $21, $d8, $00, $cd, $1b, $46, $3e, $60, $cd, $fe, $4e, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $03, $f8, $01, $7e, $cd, $95, $40, $1e, $00, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $f8, $01, $7e, $cd, $95, $40, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $09, $cd, $e6, $4e, $f8, $01, $7e, $cd, $4b, $44, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c3, $a3, $65, $21, $5c, $01, $cd, $98, $44, $c1, $c9, $7b, $b7, $c2, $bf, $65, $fa, $90, $c7, $b7, $ca, $b9, $65, $fa, $90, $c7, $fe, $07, $c2, $bf, $65, $21, $96, $03, $cd, $98, $44, $c9, $01, $0a, $01, $01, $05, $1e, $01, $0a, $01, $0b, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $12, $0b, $2e, $0f, $04, $01, $01, $05, $20, $0f, $04, $0f, $05, $2e, $13, $13, $01, $01, $0f, $04, $21, $86, $00, $cd, $2e, $46, $fe, $01, $c2, $06, $66, $21, $e1, $65, $cd, $9b, $4d, $cd, $02, $4f, $cd, $2b, $40, $1e, $03, $21, $c0, $65, $cd, $3a, $40, $c9, $0d, $11, $01, $01, $05, $21, $0d, $11, $0e, $11, $2e, $0f, $04, $01, $01, $05, $1f, $0f, $04, $0e, $04, $2e, $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $4c, $0c, $0e, $45, $01, $01, $01, $02, $08, $00, $00, $02, $14, $11, $74, $0a, $0c, $7f, $0c, $08, $00, $02, $06, $00, $00, $02, $14, $11, $35, $0d, $0f, $77, $17, $12, $11, $02, $04, $00, $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00, $ff, $00, $0b, $02, $03, $03, $00, $04, $00, $22, $24, $67, $00, $00, $01, $04, $08, $0b, $01, $01, $01, $04, $00, $22, $79, $67, $00, $00, $01, $04, $01, $0b, $01, $01, $00, $04, $00, $22, $01, $68, $00, $00, $0b, $0c, $0f, $04, $01, $01, $02, $04, $00, $22, $92, $68, $00, $00
ENDC

Func_8a69b:: ; 8a69b
IF DEF(SUN)
	db $cd, $3c, $69, $21, $3c, $69, $cd, $11, $4f, $1e, $02, $21, $07, $66, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1d, $66, $cd, $24, $4d, $1e, $04, $21, $63, $66, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $de, $66, $fa, $90, $c7, $fe, $07, $d2, $de, $66, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $3e, $03, $ea, $e2, $c7, $21, $86, $00, $cd, $2e, $46, $fe, $01, $c2, $1a, $67, $21, $07, $01, $cd, $2e, $46, $fe, $01, $c2, $0a, $67, $0e, $03, $1e, $0e, $3e, $03, $cd, $80, $40, $c3, $1a, $67, $0e, $05, $1e, $10, $3e, $03, $cd, $80, $40, $1e, $03, $3e, $03, $cd, $95, $40, $cd, $1c, $40, $21, $de, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $4f, $67, $cd, $e0, $42, $af, $cd, $e6, $4e, $3e, $16, $cd, $e6, $4e, $0e, $01, $1e, $02, $3e, $08, $cd, $76, $41, $cd, $d5, $41, $cd, $8b, $41, $21, $22, $03, $cd, $98, $44, $3e, $09, $cd, $e6, $4e, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $6b, $01, $6b, $03, $0f, $17, $17, $0a, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $cf, $67, $f8, $01, $7e, $cd, $4b, $44, $21, $7e, $00, $cd, $2e, $46, $b7, $c2, $c9, $67, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $c0, $67, $11, $d1, $67, $21, $50, $67, $cd, $d3, $4d, $b7, $c2, $af, $67, $c3, $cf, $67, $1e, $01, $21, $7e, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $c6, $67, $21, $2e, $02, $cd, $98, $44, $c3, $cf, $67, $21, $2d, $02, $cd, $98, $44, $c1, $c9, $b3, $de, $ab, $b0, $b6, $d9, $00, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $57, $68, $f8, $01, $7e, $cd, $4b, $44, $21, $7f, $00, $cd, $2e, $46, $b7, $c2, $51, $68, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $48, $68, $11, $59, $68, $21, $d8, $67, $cd, $d3, $4d, $b7, $c2, $37, $68, $c3, $57, $68, $1e, $01, $21, $7f, $00, $cd, $1b, $46, $21, $2c, $02, $cd, $98, $44, $c3, $4e, $68, $21, $32, $02, $cd, $98, $44, $c3, $57, $68, $21, $2f, $02, $cd, $98, $44, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0e, $03, $ff, $ff, $0f, $05, $10, $05, $ff, $ff, $f5, $7b, $b7, $c2, $2e, $69, $f8, $01, $7e, $cd, $4b, $44, $21, $86, $00, $cd, $2e, $46, $b7, $c2, $15, $69, $21, $26, $04, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $0c, $69, $11, $30, $69, $21, $5f, $68, $cd, $d3, $4d, $b7, $c2, $c8, $68, $c3, $2e, $69, $21, $3b, $04, $cd, $98, $44, $fa, $38, $c8, $b7, $c2, $eb, $68, $01, $88, $68, $1e, $22, $f8, $01, $7e, $cd, $88, $46, $1e, $01, $21, $07, $01, $cd, $1b, $46, $c3, $f6, $68, $01, $8c, $68, $1e, $22, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $21, $86, $00, $cd, $1b, $46, $c3, $12, $69, $21, $37, $04, $cd, $98, $44, $c3, $2e, $69, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $28, $69, $21, $3b, $04, $cd, $98, $44, $c3, $2e, $69, $21, $0f, $01, $cd, $98, $44, $c1, $c9, $bf, $de, $af, $b7, $b0, $00, $13, $13, $01, $01, $0f, $04, $21, $36, $69, $cd, $9b, $4d, $cd, $02, $4f, $c9, $0d, $04, $01, $01, $05, $22, $0d, $04, $0c, $04, $2e, $0d, $11, $01, $01, $05, $20, $0d, $11, $0c, $11, $2e, $25, $10, $09, $03, $1b, $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $08, $00, $00, $02, $14, $11, $6c, $0a, $0c, $03, $17, $17, $0a, $02, $06, $00, $00, $02, $14, $11, $14, $0d, $0f, $17, $09, $0f, $00, $02, $04, $00, $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00, $01, $0c, $08, $0a, $01, $01, $02, $04, $00, $22, $d8, $6a, $00, $00, $ff, $00, $09, $0a, $03, $01, $00, $04, $01, $22, $e9, $6a, $00, $00, $01, $0c, $09, $09, $01, $01, $02, $04, $00, $22, $bf, $6b, $00, $00, $ff, $00, $08, $09, $01, $01, $00, $04, $01, $22, $cc, $6b, $00, $00, $ff, $00, $0a, $09, $02, $01, $00, $04, $01, $22, $cc, $6b, $00, $00, $01, $0c, $0a, $08, $01, $01, $02, $04, $00, $22, $b3, $6c, $00, $00, $ff, $00, $08, $08, $02, $01, $00, $04, $01, $22, $c0, $6c, $00, $00, $ff, $00, $0b, $08, $01, $01, $00, $04, $01, $22, $c0, $6c, $00, $00, $01, $0c, $0b, $07, $01, $01, $02, $04, $00, $22, $b3, $6d, $00, $00, $ff, $00, $08, $07, $03, $01, $00, $04, $01, $22, $c4, $6d, $00, $00
ELIF DEF(STAR)
	db $cd, $3c, $69, $21, $3c, $69, $cd, $11, $4f, $1e, $02, $21, $07, $66, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1d, $66, $cd, $24, $4d, $1e, $04, $21, $63, $66, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $de, $66, $fa, $90, $c7, $fe, $07, $d2, $de, $66, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $3e, $03, $ea, $e2, $c7, $21, $86, $00, $cd, $2e, $46, $fe, $01, $c2, $1a, $67, $21, $07, $01, $cd, $2e, $46, $fe, $01, $c2, $0a, $67, $0e, $03, $1e, $0e, $3e, $03, $cd, $80, $40, $c3, $1a, $67, $0e, $05, $1e, $10, $3e, $03, $cd, $80, $40, $1e, $03, $3e, $03, $cd, $95, $40, $cd, $1c, $40, $21, $de, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $4f, $67, $cd, $e0, $42, $af, $cd, $e6, $4e, $3e, $16, $cd, $e6, $4e, $0e, $01, $1e, $02, $3e, $08, $cd, $76, $41, $cd, $d5, $41, $cd, $8b, $41, $21, $22, $03, $cd, $98, $44, $3e, $09, $cd, $e6, $4e, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $6b, $01, $6b, $03, $0f, $17, $17, $0a, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $cf, $67, $f8, $01, $7e, $cd, $4b, $44, $21, $7e, $00, $cd, $2e, $46, $b7, $c2, $c9, $67, $21, $30, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $c0, $67, $11, $d1, $67, $21, $50, $67, $cd, $d3, $4d, $b7, $c2, $af, $67, $c3, $cf, $67, $1e, $01, $21, $7e, $00, $cd, $1b, $46, $21, $31, $02, $cd, $98, $44, $c3, $c6, $67, $21, $2e, $02, $cd, $98, $44, $c3, $cf, $67, $21, $2d, $02, $cd, $98, $44, $c1, $c9, $b3, $de, $ab, $b0, $b6, $d9, $00, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $57, $68, $f8, $01, $7e, $cd, $4b, $44, $21, $7f, $00, $cd, $2e, $46, $b7, $c2, $51, $68, $21, $2e, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $48, $68, $11, $59, $68, $21, $d8, $67, $cd, $d3, $4d, $b7, $c2, $37, $68, $c3, $57, $68, $1e, $01, $21, $7f, $00, $cd, $1b, $46, $21, $2c, $02, $cd, $98, $44, $c3, $4e, $68, $21, $32, $02, $cd, $98, $44, $c3, $57, $68, $21, $2f, $02, $cd, $98, $44, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0e, $03, $ff, $ff, $0f, $05, $10, $05, $ff, $ff, $f5, $7b, $b7, $c2, $2e, $69, $f8, $01, $7e, $cd, $4b, $44, $21, $86, $00, $cd, $2e, $46, $b7, $c2, $15, $69, $21, $26, $04, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $0c, $69, $11, $30, $69, $21, $5f, $68, $cd, $d3, $4d, $b7, $c2, $c8, $68, $c3, $2e, $69, $21, $3b, $04, $cd, $98, $44, $fa, $38, $c8, $b7, $c2, $eb, $68, $01, $88, $68, $1e, $22, $f8, $01, $7e, $cd, $88, $46, $1e, $01, $21, $07, $01, $cd, $1b, $46, $c3, $f6, $68, $01, $8c, $68, $1e, $22, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $1e, $01, $21, $86, $00, $cd, $1b, $46, $c3, $12, $69, $21, $37, $04, $cd, $98, $44, $c3, $2e, $69, $21, $1f, $00, $cd, $2e, $46, $b7, $c2, $28, $69, $21, $3b, $04, $cd, $98, $44, $c3, $2e, $69, $21, $0f, $01, $cd, $98, $44, $c1, $c9, $bf, $de, $af, $b7, $b0, $00, $13, $13, $01, $01, $0f, $04, $21, $36, $69, $cd, $9b, $4d, $cd, $02, $4f, $c9, $0d, $04, $01, $01, $05, $22, $0d, $04, $0c, $04, $2e, $0d, $11, $01, $01, $05, $20, $0d, $11, $0c, $11, $2e, $25, $10, $09, $03, $1b, $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $4c, $0c, $0e, $45, $01, $01, $01, $02, $08, $00, $00, $02, $14, $11, $74, $0a, $0c, $7f, $0c, $08, $00, $02, $06, $00, $00, $02, $14, $11, $35, $0d, $0f, $77, $17, $12, $11, $02, $04, $00, $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00, $01, $0c, $08, $0a, $01, $01, $02, $04, $00, $22, $d8, $6a, $00, $00, $ff, $00, $09, $0a, $03, $01, $00, $04, $01, $22, $e9, $6a, $00, $00, $01, $0c, $09, $09, $01, $01, $02, $04, $00, $22, $bf, $6b, $00, $00, $ff, $00, $08, $09, $01, $01, $00, $04, $01, $22, $cc, $6b, $00, $00, $ff, $00, $0a, $09, $02, $01, $00, $04, $01, $22, $cc, $6b, $00, $00, $01, $0c, $0a, $08, $01, $01, $02, $04, $00, $22, $b3, $6c, $00, $00, $ff, $00, $08, $08, $02, $01, $00, $04, $01, $22, $c0, $6c, $00, $00, $ff, $00, $0b, $08, $01, $01, $00, $04, $01, $22, $c0, $6c, $00, $00, $01, $0c, $0b, $07, $01, $01, $02, $04, $00, $22, $b3, $6d, $00, $00, $ff, $00, $08, $07, $03, $01, $00, $04, $01, $22, $c4, $6d, $00, $00
ENDC

Func_8aa33:: ; 8aa33
IF DEF(SUN)
	db $1e, $02, $21, $46, $69, $cd, $3a, $40, $1e, $01, $21, $5c, $69, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $61, $69, $cd, $24, $4d, $1e, $0a, $21, $a7, $69, $cd, $fb, $40, $21, $80, $00, $cd, $2e, $46, $fe, $01, $c2, $70, $6a, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $21, $81, $00, $cd, $2e, $46, $fe, $01, $c2, $90, $6a, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $00, $3e, $04, $cd, $3d, $41, $21, $82, $00, $cd, $2e, $46, $fe, $01, $c2, $b0, $6a, $1e, $00, $3e, $05, $cd, $3d, $41, $1e, $00, $3e, $06, $cd, $3d, $41, $1e, $00, $3e, $07, $cd, $3d, $41, $21, $83, $00, $cd, $2e, $46, $fe, $01, $c2, $c9, $6a, $1e, $00, $3e, $08, $cd, $3d, $41, $1e, $00, $3e, $09, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $df, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $e0, $6a, $cd, $66, $6b, $c9, $09, $0a, $ff, $ff, $0a, $0a, $ff, $ff, $7b, $fe, $02, $c2, $38, $6b, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $24, $6b, $fe, $0a, $ca, $15, $6b, $fe, $09, $c2, $30, $6b, $1e, $01, $af, $cd, $95, $40, $c3, $30, $6b, $01, $e1, $6a, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $c3, $30, $6b, $01, $e5, $6a, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $cd, $66, $6b, $c9, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $17, $01, $10, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $08, $05, $ff, $ff, $21, $2f, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $b9, $6b, $21, $39, $6b, $cd, $ef, $42, $b7, $c2, $88, $6b, $fa, $c4, $c7, $fe, $01, $c2, $72, $6b, $c9, $21, $2f, $02, $cd, $98, $44, $01, $62, $6b, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $01, $21, $80, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c9, $ba, $b7, $de, $ac, $d9, $00, $7b, $b7, $c2, $c7, $6b, $cd, $50, $6c, $c9, $0a, $09, $ff, $ff, $7b, $fe, $02, $c2, $22, $6c, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $0d, $6c, $fe, $0a, $ca, $fe, $6b, $fe, $08, $c2, $1f, $6c, $1e, $03, $3e, $02, $cd, $95, $40, $3e, $01, $cd, $77, $46, $c3, $1f, $6c, $1e, $01, $3e, $02, $cd, $95, $40, $3e, $03, $cd, $77, $46, $c3, $1f, $6c, $01, $c8, $6b, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $cd, $50, $6c, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $0e, $01, $10, $04, $17, $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $09, $04, $ff, $ff, $21, $2d, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $ac, $6c, $21, $23, $6c, $cd, $ef, $42, $b7, $c2, $72, $6c, $fa, $c4, $c7, $fe, $01, $c2, $5c, $6c, $c9, $21, $2d, $02, $cd, $98, $44, $01, $4c, $6c, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $00, $3e, $04, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $81, $00, $cd, $1b, $46, $c9, $b3, $de, $ab, $b0, $b6, $d9, $00, $7b, $b7, $c2, $bb, $6c, $cd, $46, $6d, $c9, $09, $08, $ff, $ff, $7b, $fe, $02, $c2, $16, $6d, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $07, $6d, $fe, $09, $ca, $f8, $6c, $fe, $08, $c2, $13, $6d, $01, $bc, $6c, $1e, $22, $3e, $05, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $13, $6d, $1e, $03, $3e, $05, $cd, $95, $40, $3e, $01, $cd, $77, $46, $c3, $13, $6d, $1e, $01, $3e, $05, $cd, $95, $40, $3e, $03, $cd, $77, $46, $cd, $46, $6d, $c9, $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a, $04, $0d, $04, $ff, $ff, $21, $33, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $a8, $6d, $21, $17, $6d, $cd, $ef, $42, $b7, $c2, $68, $6d, $fa, $c4, $c7, $fe, $01, $c2, $52, $6d, $c9, $21, $2c, $02, $cd, $98, $44, $21, $34, $02, $cd, $98, $44, $01, $40, $6d, $1e, $22, $3e, $05, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $05, $cd, $3d, $41, $1e, $00, $3e, $06, $cd, $3d, $41, $1e, $00, $3e, $07, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $82, $00, $cd, $1b, $46, $c9, $28, $bc, $de, $ae, $bc, $ba, $b3, $be, $b2, $29, $00, $7b, $b7, $c2, $bb, $6d, $cd, $50, $6e, $c9, $09, $07, $ff, $ff, $0a, $07, $ff, $ff, $7b, $fe, $02, $c2, $20, $6e, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0a, $ca, $11, $6e, $fe, $09, $ca, $fc, $6d, $fe, $08, $c2, $1d, $6e, $01, $bc, $6d, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $1d, $6e, $01, $c0, $6d, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $1d, $6e, $1e, $03, $3e, $08, $cd, $95, $40, $3e, $01, $cd, $77, $46, $cd, $50, $6e, $c9, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0b, $04, $0d, $04, $ff, $ff, $21, $2e, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $a5, $6e, $21, $21, $6e, $cd, $ef, $42, $b7, $c2, $72, $6e, $fa, $c4, $c7, $fe, $01, $c2, $5c, $6e, $c9, $21, $2e, $02, $cd, $98, $44, $01, $4a, $6e, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $08, $cd, $3d, $41, $1e, $00, $3e, $09, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $83, $00, $cd, $1b, $46, $c9, $ba, $b7, $de, $ac, $d9, $00, $0d, $04, $01, $01, $05, $21, $0d, $04, $0c, $04, $2e, $12, $0a, $01, $01, $05, $23, $12, $0a, $12, $0b, $2e, $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00, $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00, $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00, $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $46, $69, $cd, $3a, $40, $1e, $01, $21, $5c, $69, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $61, $69, $cd, $24, $4d, $1e, $0a, $21, $a7, $69, $cd, $fb, $40, $21, $80, $00, $cd, $2e, $46, $fe, $01, $c2, $70, $6a, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $21, $81, $00, $cd, $2e, $46, $fe, $01, $c2, $90, $6a, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $00, $3e, $04, $cd, $3d, $41, $21, $82, $00, $cd, $2e, $46, $fe, $01, $c2, $b0, $6a, $1e, $00, $3e, $05, $cd, $3d, $41, $1e, $00, $3e, $06, $cd, $3d, $41, $1e, $00, $3e, $07, $cd, $3d, $41, $21, $83, $00, $cd, $2e, $46, $fe, $01, $c2, $c9, $6a, $1e, $00, $3e, $08, $cd, $3d, $41, $1e, $00, $3e, $09, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $df, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $e0, $6a, $cd, $66, $6b, $c9, $09, $0a, $ff, $ff, $0a, $0a, $ff, $ff, $7b, $fe, $02, $c2, $38, $6b, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $24, $6b, $fe, $0a, $ca, $15, $6b, $fe, $09, $c2, $30, $6b, $1e, $01, $af, $cd, $95, $40, $c3, $30, $6b, $01, $e1, $6a, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $c3, $30, $6b, $01, $e5, $6a, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $cd, $66, $6b, $c9, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $17, $01, $10, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $08, $05, $ff, $ff, $21, $2f, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $b9, $6b, $21, $39, $6b, $cd, $ef, $42, $b7, $c2, $88, $6b, $fa, $c4, $c7, $fe, $01, $c2, $72, $6b, $c9, $21, $2f, $02, $cd, $98, $44, $01, $62, $6b, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $01, $21, $80, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c9, $ba, $b7, $de, $ac, $d9, $00, $7b, $b7, $c2, $c7, $6b, $cd, $50, $6c, $c9, $0a, $09, $ff, $ff, $7b, $fe, $02, $c2, $22, $6c, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $0d, $6c, $fe, $0a, $ca, $fe, $6b, $fe, $08, $c2, $1f, $6c, $1e, $03, $3e, $02, $cd, $95, $40, $3e, $01, $cd, $77, $46, $c3, $1f, $6c, $1e, $01, $3e, $02, $cd, $95, $40, $3e, $03, $cd, $77, $46, $c3, $1f, $6c, $01, $c8, $6b, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $cd, $50, $6c, $c9, $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $0e, $01, $10, $04, $17, $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $09, $04, $ff, $ff, $21, $2d, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $ac, $6c, $21, $23, $6c, $cd, $ef, $42, $b7, $c2, $72, $6c, $fa, $c4, $c7, $fe, $01, $c2, $5c, $6c, $c9, $21, $2d, $02, $cd, $98, $44, $01, $4c, $6c, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $00, $3e, $04, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $81, $00, $cd, $1b, $46, $c9, $b3, $de, $ab, $b0, $b6, $d9, $00, $7b, $b7, $c2, $bb, $6c, $cd, $46, $6d, $c9, $09, $08, $ff, $ff, $7b, $fe, $02, $c2, $16, $6d, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0b, $ca, $07, $6d, $fe, $09, $ca, $f8, $6c, $fe, $08, $c2, $13, $6d, $01, $bc, $6c, $1e, $22, $3e, $05, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $13, $6d, $1e, $03, $3e, $05, $cd, $95, $40, $3e, $01, $cd, $77, $46, $c3, $13, $6d, $1e, $01, $3e, $05, $cd, $95, $40, $3e, $03, $cd, $77, $46, $cd, $46, $6d, $c9, $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a, $04, $0d, $04, $ff, $ff, $21, $33, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $a8, $6d, $21, $17, $6d, $cd, $ef, $42, $b7, $c2, $68, $6d, $fa, $c4, $c7, $fe, $01, $c2, $52, $6d, $c9, $21, $2c, $02, $cd, $98, $44, $21, $34, $02, $cd, $98, $44, $01, $40, $6d, $1e, $22, $3e, $05, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $05, $cd, $3d, $41, $1e, $00, $3e, $06, $cd, $3d, $41, $1e, $00, $3e, $07, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $82, $00, $cd, $1b, $46, $c9, $28, $bc, $de, $ae, $bc, $ba, $b3, $be, $b2, $29, $00, $7b, $b7, $c2, $bb, $6d, $cd, $50, $6e, $c9, $09, $07, $ff, $ff, $0a, $07, $ff, $ff, $7b, $fe, $02, $c2, $20, $6e, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $fa, $d8, $c2, $c6, $05, $fe, $0a, $ca, $11, $6e, $fe, $09, $ca, $fc, $6d, $fe, $08, $c2, $1d, $6e, $01, $bc, $6d, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $1d, $6e, $01, $c0, $6d, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $c3, $1d, $6e, $1e, $03, $3e, $08, $cd, $95, $40, $3e, $01, $cd, $77, $46, $cd, $50, $6e, $c9, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0b, $04, $0d, $04, $ff, $ff, $21, $2e, $02, $cd, $98, $44, $21, $7a, $01, $cd, $98, $44, $11, $a5, $6e, $21, $21, $6e, $cd, $ef, $42, $b7, $c2, $72, $6e, $fa, $c4, $c7, $fe, $01, $c2, $5c, $6e, $c9, $21, $2e, $02, $cd, $98, $44, $01, $4a, $6e, $1e, $22, $3e, $08, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $08, $cd, $3d, $41, $1e, $00, $3e, $09, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $83, $00, $cd, $1b, $46, $c9, $ba, $b7, $de, $ac, $d9, $00, $0d, $04, $01, $01, $05, $21, $0d, $04, $0c, $04, $2e, $12, $0a, $01, $01, $05, $23, $12, $0a, $12, $0b, $2e, $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00, $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00, $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00, $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Func_8af07:: ; 8af07
IF DEF(SUN)
	db $1e, $02, $21, $ab, $6e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $c1, $6e, $cd, $24, $4d, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e0, $02, $cd, $72, $4f, $c9, $05, $05, $01, $01, $05, $24, $05, $05, $04, $05, $2e, $12, $0a, $01, $01, $05, $22, $12, $0a, $11, $0a, $2e, $26, $09, $0d, $01, $4a, $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00, $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00, $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00, $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00, $01, $0c, $05, $12, $01, $01, $01, $04, $00, $22, $5e, $70, $00, $00, $01, $0c, $06, $11, $01, $01, $01, $04, $00, $22, $50, $71, $00, $00, $01, $0c, $0d, $06, $01, $01, $02, $04, $00, $22, $43, $72, $00, $00, $01, $0c, $0e, $06, $01, $01, $02, $04, $00, $22, $45, $73, $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $ab, $6e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $c1, $6e, $cd, $24, $4d, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e0, $02, $cd, $72, $4f, $c9, $05, $05, $01, $01, $05, $24, $05, $05, $04, $05, $2e, $12, $0a, $01, $01, $05, $22, $12, $0a, $11, $0a, $2e, $26, $09, $0d, $01, $4a, $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00, $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00, $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00, $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00, $01, $0c, $05, $12, $01, $01, $01, $04, $00, $22, $5e, $70, $00, $00, $01, $0c, $06, $11, $01, $01, $01, $04, $00, $22, $50, $71, $00, $00, $01, $0c, $0d, $06, $01, $01, $02, $04, $00, $22, $43, $72, $00, $00, $01, $0c, $0e, $06, $01, $01, $02, $04, $00, $22, $45, $73, $00, $00
ENDC

Func_8afc4:: ; 8afc4
IF DEF(SUN)
	db $1e, $02, $21, $2b, $6f, $cd, $3a, $40, $1e, $01, $21, $41, $6f, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $46, $6f, $cd, $24, $4d, $1e, $04, $21, $8c, $6f, $cd, $fb, $40, $21, $84, $00, $cd, $2e, $46, $fe, $01, $c2, $01, $70, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $21, $85, $00, $cd, $2e, $46, $fe, $01, $c2, $1a, $70, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e1, $02, $cd, $72, $4f, $c9, $05, $0e, $03, $0c, $ff, $ff, $04, $0f, $03, $0c, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $18, $01, $18, $03, $11, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $09, $71, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $2b, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $0b, $71, $21, $35, $70, $cd, $f4, $43, $b7, $c2, $97, $70, $fa, $c4, $c7, $fe, $01, $c2, $7f, $70, $c3, $09, $71, $21, $2b, $02, $cd, $98, $44, $01, $29, $70, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $af, $cd, $77, $46, $1e, $02, $3e, $01, $cd, $95, $40, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $11, $71, $21, $35, $70, $cd, $f4, $43, $b7, $c2, $de, $70, $fa, $c4, $c7, $fe, $01, $c2, $c6, $70, $c3, $09, $71, $21, $30, $02, $cd, $98, $44, $01, $2f, $70, $1e, $22, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $01, $21, $84, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $05, $0e, $03, $0c, $ff, $ff, $04, $0f, $03, $0c, $ff, $ff, $06, $11, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $52, $03, $11, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $7b, $b7, $c2, $fd, $71, $3e, $01, $cd, $4b, $44, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $fe, $71, $21, $27, $71, $cd, $f4, $43, $b7, $c2, $7e, $71, $fa, $c4, $c7, $fe, $01, $c2, $66, $71, $c3, $fd, $71, $21, $30, $02, $cd, $98, $44, $01, $1d, $71, $1e, $22, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $fa, $38, $c8, $b7, $c2, $a7, $71, $3e, $03, $cd, $77, $46, $c3, $b9, $71, $01, $23, $71, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $af, $cd, $95, $40, $21, $2b, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $04, $72, $21, $27, $71, $cd, $f4, $43, $b7, $c2, $dd, $71, $fa, $c4, $c7, $fe, $01, $c2, $c5, $71, $c3, $fd, $71, $21, $2b, $02, $cd, $98, $44, $01, $17, $71, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $1e, $01, $21, $84, $00, $cd, $1b, $46, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $0d, $05, $06, $05, $ff, $ff, $0e, $07, $ff, $ff, $0e, $05, $06, $05, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $38, $01, $38, $03, $11, $0e, $0b, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $fe, $72, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $2b, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $00, $73, $21, $1a, $72, $cd, $f4, $43, $b7, $c2, $7c, $72, $fa, $c4, $c7, $fe, $01, $c2, $64, $72, $c3, $fe, $72, $21, $2b, $02, $cd, $98, $44, $01, $0a, $72, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $01, $10, $72, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $03, $3e, $03, $cd, $95, $40, $3e, $01, $cd, $77, $46, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $06, $73, $21, $1a, $72, $cd, $f4, $43, $b7, $c2, $d3, $72, $fa, $c4, $c7, $fe, $01, $c2, $bb, $72, $c3, $fe, $72, $21, $30, $02, $cd, $98, $44, $01, $14, $72, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $01, $21, $85, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $0e, $05, $06, $05, $ff, $ff, $0d, $07, $ff, $ff, $0d, $05, $06, $05, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $25, $01, $25, $03, $11, $01, $01, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $00, $74, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $30, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $02, $74, $21, $1c, $73, $cd, $f4, $43, $b7, $c2, $7e, $73, $fa, $c4, $c7, $fe, $01, $c2, $66, $73, $c3, $00, $74, $21, $30, $02, $cd, $98, $44, $01, $0c, $73, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $03, $cd, $3d, $41, $01, $12, $73, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $3e, $02, $cd, $95, $40, $3e, $03, $cd, $77, $46, $21, $2b, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $08, $74, $21, $1c, $73, $cd, $f4, $43, $b7, $c2, $d5, $73, $fa, $c4, $c7, $fe, $01, $c2, $bd, $73, $c3, $00, $74, $21, $2b, $02, $cd, $98, $44, $01, $16, $73, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $01, $21, $85, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $05, $05, $01, $01, $05, $23, $05, $05, $06, $05, $2e, $27, $09, $0e, $01, $39, $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $74, $0e, $10, $7f, $0c, $08, $00, $02, $08, $00, $00, $02, $14, $11, $6c, $0c, $0e, $03, $17, $17, $0a, $02, $06, $00, $00, $02, $14, $11, $14, $0f, $11, $17, $09, $0f, $00, $02, $04, $00, $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00, $1e, $0c, $0a, $04, $01, $01, $02, $04, $00, $22, $00, $00, $00, $00, $ff, $00, $09, $08, $03, $01, $00, $04, $01, $22, $ea, $74, $00, $00, $ff, $00, $0d, $03, $01, $01, $00, $04, $00, $22, $3d, $75, $00, $00, $ff, $00, $0e, $03, $01, $01, $00, $04, $00, $22, $8c, $75, $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $2b, $6f, $cd, $3a, $40, $1e, $01, $21, $41, $6f, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $46, $6f, $cd, $24, $4d, $1e, $04, $21, $8c, $6f, $cd, $fb, $40, $21, $84, $00, $cd, $2e, $46, $fe, $01, $c2, $01, $70, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $21, $85, $00, $cd, $2e, $46, $fe, $01, $c2, $1a, $70, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e1, $02, $cd, $72, $4f, $c9, $05, $0e, $03, $0c, $ff, $ff, $04, $0f, $03, $0c, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $18, $01, $18, $03, $11, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $09, $71, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $2b, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $0b, $71, $21, $35, $70, $cd, $f4, $43, $b7, $c2, $97, $70, $fa, $c4, $c7, $fe, $01, $c2, $7f, $70, $c3, $09, $71, $21, $2b, $02, $cd, $98, $44, $01, $29, $70, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $af, $cd, $77, $46, $1e, $02, $3e, $01, $cd, $95, $40, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $11, $71, $21, $35, $70, $cd, $f4, $43, $b7, $c2, $de, $70, $fa, $c4, $c7, $fe, $01, $c2, $c6, $70, $c3, $09, $71, $21, $30, $02, $cd, $98, $44, $01, $2f, $70, $1e, $22, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $01, $21, $84, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $05, $0e, $03, $0c, $ff, $ff, $04, $0f, $03, $0c, $ff, $ff, $06, $11, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $52, $03, $11, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $7b, $b7, $c2, $fd, $71, $3e, $01, $cd, $4b, $44, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $fe, $71, $21, $27, $71, $cd, $f4, $43, $b7, $c2, $7e, $71, $fa, $c4, $c7, $fe, $01, $c2, $66, $71, $c3, $fd, $71, $21, $30, $02, $cd, $98, $44, $01, $1d, $71, $1e, $22, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $fa, $38, $c8, $b7, $c2, $a7, $71, $3e, $03, $cd, $77, $46, $c3, $b9, $71, $01, $23, $71, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $af, $cd, $95, $40, $21, $2b, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $04, $72, $21, $27, $71, $cd, $f4, $43, $b7, $c2, $dd, $71, $fa, $c4, $c7, $fe, $01, $c2, $c5, $71, $c3, $fd, $71, $21, $2b, $02, $cd, $98, $44, $01, $17, $71, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $1e, $01, $21, $84, $00, $cd, $1b, $46, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $0d, $05, $06, $05, $ff, $ff, $0e, $07, $ff, $ff, $0e, $05, $06, $05, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $38, $01, $38, $03, $11, $0e, $0b, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $fe, $72, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $2b, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $00, $73, $21, $1a, $72, $cd, $f4, $43, $b7, $c2, $7c, $72, $fa, $c4, $c7, $fe, $01, $c2, $64, $72, $c3, $fe, $72, $21, $2b, $02, $cd, $98, $44, $01, $0a, $72, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $01, $10, $72, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $03, $3e, $03, $cd, $95, $40, $3e, $01, $cd, $77, $46, $21, $30, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $06, $73, $21, $1a, $72, $cd, $f4, $43, $b7, $c2, $d3, $72, $fa, $c4, $c7, $fe, $01, $c2, $bb, $72, $c3, $fe, $72, $21, $30, $02, $cd, $98, $44, $01, $14, $72, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $03, $cd, $3d, $41, $1e, $01, $21, $85, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $0e, $05, $06, $05, $ff, $ff, $0d, $07, $ff, $ff, $0d, $05, $06, $05, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $25, $01, $25, $03, $11, $01, $01, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $00, $74, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $30, $02, $cd, $98, $44, $f8, $01, $7e, $cd, $4b, $44, $21, $5e, $01, $cd, $98, $44, $11, $02, $74, $21, $1c, $73, $cd, $f4, $43, $b7, $c2, $7e, $73, $fa, $c4, $c7, $fe, $01, $c2, $66, $73, $c3, $00, $74, $21, $30, $02, $cd, $98, $44, $01, $0c, $73, $1e, $22, $3e, $03, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $03, $cd, $3d, $41, $01, $12, $73, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $3e, $02, $cd, $95, $40, $3e, $03, $cd, $77, $46, $21, $2b, $02, $cd, $98, $44, $21, $5e, $01, $cd, $98, $44, $11, $08, $74, $21, $1c, $73, $cd, $f4, $43, $b7, $c2, $d5, $73, $fa, $c4, $c7, $fe, $01, $c2, $bd, $73, $c3, $00, $74, $21, $2b, $02, $cd, $98, $44, $01, $16, $73, $1e, $22, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $01, $21, $85, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $c1, $c9, $ba, $b7, $de, $ac, $d9, $00, $ba, $b7, $de, $ac, $d9, $00, $05, $05, $01, $01, $05, $23, $05, $05, $06, $05, $2e, $27, $09, $0e, $01, $39, $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00, $00, $02, $14, $11, $4c, $0e, $10, $45, $01, $01, $01, $02, $08, $00, $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $06, $00, $00, $02, $14, $11, $35, $0f, $11, $77, $17, $12, $11, $02, $04, $00, $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00, $1e, $0c, $0a, $04, $01, $01, $02, $04, $00, $22, $00, $00, $00, $00, $ff, $00, $09, $08, $03, $01, $00, $04, $01, $22, $ea, $74, $00, $00, $ff, $00, $0d, $03, $01, $01, $00, $04, $00, $22, $3d, $75, $00, $00, $ff, $00, $0e, $03, $01, $01, $00, $04, $00, $22, $8c, $75, $00, $00
ENDC

Func_8b49c:: ; 8b49c
IF DEF(SUN)
	db $1e, $01, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $19, $74, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1e, $74, $cd, $24, $4d, $21, $3c, $00, $cd, $2e, $46, $b7, $c2, $cb, $74, $1e, $02, $21, $64, $74, $cd, $fb, $40, $1e, $02, $21, $80, $74, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e2, $02, $cd, $72, $4f, $c9, $0a, $06, $ff, $ff, $0d, $04, $ff, $ff, $7b, $fe, $02, $c2, $3c, $75, $af, $cd, $e6, $4e, $0e, $01, $11, $e2, $74, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $3e, $01, $cd, $e6, $4e, $21, $7d, $00, $cd, $a9, $44, $01, $e6, $74, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $3c, $00, $cd, $1b, $46, $c9, $7b, $b7, $c2, $8b, $75, $fa, $38, $c8, $b7, $ca, $4c, $75, $c3, $8b, $75, $21, $59, $00, $cd, $2e, $46, $fe, $01, $c2, $60, $75, $21, $83, $02, $cd, $98, $44, $c3, $8b, $75, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1c, $cd, $ff, $4d, $c1, $21, $1e, $00, $cd, $8f, $46, $c9, $7b, $b7, $c2, $dc, $75, $fa, $90, $c7, $b7, $ca, $a9, $75, $fa, $90, $c7, $fe, $07, $d2, $a9, $75, $21, $dd, $03, $cd, $98, $44, $c3, $dc, $75, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $c9, $75, $1e, $01, $21, $59, $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3, $dc, $75, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21, $5c, $03, $cd, $98, $44, $c9, $07, $04, $01, $01, $03, $0c, $15, $12, $16, $12, $2e, $01, $0b, $02, $01, $03, $0e, $10, $08, $10, $09, $2e, $03, $08, $0b, $03, $18, $00, $03, $09, $09, $05, $09, $0b, $2d, $01, $06, $00, $0a, $0a, $00, $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00, $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00, $00, $03, $09, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0c, $06, $00, $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00, $ff, $00, $03, $09, $03, $01, $00, $04, $00, $22, $ae, $76, $00, $00, $0a, $04, $01, $03, $01, $01, $02, $04, $00, $22, $67, $77, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $19, $74, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1e, $74, $cd, $24, $4d, $21, $3c, $00, $cd, $2e, $46, $b7, $c2, $cb, $74, $1e, $02, $21, $64, $74, $cd, $fb, $40, $1e, $02, $21, $80, $74, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e2, $02, $cd, $72, $4f, $c9, $0a, $06, $ff, $ff, $0d, $04, $ff, $ff, $7b, $fe, $02, $c2, $3c, $75, $af, $cd, $e6, $4e, $0e, $01, $11, $e2, $74, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $3e, $01, $cd, $e6, $4e, $21, $7d, $00, $cd, $a9, $44, $01, $e6, $74, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $3c, $00, $cd, $1b, $46, $c9, $7b, $b7, $c2, $8b, $75, $fa, $38, $c8, $b7, $ca, $4c, $75, $c3, $8b, $75, $21, $59, $00, $cd, $2e, $46, $fe, $01, $c2, $60, $75, $21, $83, $02, $cd, $98, $44, $c3, $8b, $75, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1c, $cd, $ff, $4d, $c1, $21, $1e, $00, $cd, $8f, $46, $c9, $7b, $b7, $c2, $dc, $75, $fa, $90, $c7, $b7, $ca, $a9, $75, $fa, $90, $c7, $fe, $07, $d2, $a9, $75, $21, $dd, $03, $cd, $98, $44, $c3, $dc, $75, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $c9, $75, $1e, $01, $21, $59, $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3, $dc, $75, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21, $5c, $03, $cd, $98, $44, $c9, $07, $04, $01, $01, $03, $0c, $15, $12, $16, $12, $2e, $01, $0b, $02, $01, $03, $0e, $10, $08, $10, $09, $2e, $03, $08, $0b, $03, $18, $00, $03, $09, $09, $46, $09, $0b, $78, $14, $14, $00, $0a, $0a, $00, $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00, $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00, $00, $03, $09, $09, $25, $0c, $0e, $79, $18, $18, $00, $0c, $06, $00, $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00, $ff, $00, $03, $09, $03, $01, $00, $04, $00, $22, $ae, $76, $00, $00, $0a, $04, $01, $03, $01, $01, $02, $04, $00, $22, $67, $77, $00, $00
ENDC

Func_8b65a:: ; 8b65a
	db $1e, $02, $21, $dd, $75, $cd, $3a, $40, $1e, $01, $21, $f3, $75, $cd, $e7, $4c, $1e, $02, $21, $3e, $76, $cd, $fb, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $f8, $75, $cd, $24, $4d, $3e, $04, $ea, $e2, $c7, $21, $00, $00, $cd, $2e, $46, $b7, $c2, $96, $76, $3e, $01, $ea, $da, $c7, $c3, $9a, $76, $af, $ea, $da, $c7, $3e, $01, $cd, $c6, $4c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $d8, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $3d, $77, $3e, $0f, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $41, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $50, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $64, $cd, $6d, $4e, $fe, $ff, $ca, $37, $77, $fa, $90, $c7, $b7, $ca, $2e, $77, $fa, $90, $c7, $fe, $06, $d2, $2e, $77, $21, $2d, $03, $cd, $ba, $44, $b7, $c2, $2b, $77, $af, $cd, $e6, $4e, $3e, $0a, $cd, $e6, $4e, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $0b, $cd, $76, $41, $3e, $44, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $04, $cd, $c6, $4c, $af, $cd, $77, $46, $2e, $1e, $e5, $0e, $2e, $1e, $03, $3e, $1e, $cd, $ff, $4d, $c1, $c3, $34, $77, $21, $77, $03, $cd, $98, $44, $c3, $3d, $77, $21, $76, $03, $cd, $98, $44, $c9, $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $39, $01, $39, $02, $0e, $1f, $1e, $08, $19, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $bd, $77, $f8, $01, $7e, $cd, $4b, $44, $21, $72, $00, $cd, $2e, $46, $b7, $c2, $b7, $77, $21, $50, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $ae, $77, $11, $bf, $77, $21, $3e, $77, $cd, $d3, $4d, $b7, $c2, $9d, $77, $c3, $bd, $77, $1e, $01, $21, $72, $00, $cd, $1b, $46, $21, $51, $02, $cd, $98, $44, $c3, $b4, $77, $21, $5d, $02, $cd, $98, $44, $c3, $bd, $77, $21, $51, $02, $cd, $98, $44, $c1, $c9, $b1, $d4, $bc, $b9, $de, $28, $b8, $dd, $29, $00

