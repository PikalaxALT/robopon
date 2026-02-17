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
	if_true .asm_89180
	loadpeople $04, MapObjects_890b9
.asm_89180:
	loadpeople $03, MapObjects_890f1
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8911b
	playmusic $09
	scall Func_8001c
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
	jp nz, .asm_89348
	checkevent $0073
	if_true .asm_89348
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
.asm_89272:
	ld de, Data_89349
	ld hl, Data_891bc
	scall Func_8039e
	if_true .asm_8928a
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_89272
	jp .asm_89348
.asm_8928a:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_891ac
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
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
.asm_892bb:
	ld de, Data_8934c
	ld hl, Data_891e5
	scall Func_8039e
	if_true .asm_892d3
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_892bb
	jp .asm_89348
.asm_892d3:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_891b0
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld bc, Data_891b4
	ld e, $22
	ld a, $01
	scall MovePersonAndWait
	xor a
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_47192
	scall PrintTextStandard
.asm_89305:
	ld de, Data_89350
	ld hl, Data_8920e
	scall Func_8039e
	if_true .asm_8931d
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_89305
	jp .asm_89348
.asm_8931d:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld e, $01
	ld hl, $0073
	scall EventFlagAction
	ld bc, Data_891b8
	ld e, $22
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	hideperson $01
	playmusic 0
	playmusic $09
.asm_89348:
	ret

Data_89349:
	dstr "ゆき"

Data_8934c:
	dstr "なつこ"

Data_89350:
	dstr "あい"

Func_89353:
	ld a, e
	if_true .asm_893a5
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89362
	jp .asm_893a5
.asm_89362:
	checkevent $0059
	cp $01
	jp nz, .asm_89376
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_893a5
.asm_89376:
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
.asm_893a5:
	ret

Func_893a6:
	ld a, e
	if_true .asm_893f8
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_893b5
	jp .asm_893f8
.asm_893b5:
	checkevent $0059
	cp $01
	jp nz, .asm_893c9
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_893f8
.asm_893c9:
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
.asm_893f8:
	ret

Func_893f9:
	ld a, e
	if_true .asm_89431
	checkevent $0059
	if_true .asm_8941e
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	playsfx $31
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp .asm_89431
.asm_8941e:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	playsfx $32
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
.asm_89431:
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
	jp z, .asm_896db
	ld a, [wc790]
	cp $07
	jp nc, .asm_896db
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
	jp .asm_896f3
.asm_896db:
	loadwarps $08, Data_89432
	loadpeople $0b, MapObjects_8950f
	loadpeople $07, MapObjects_895a9
.asm_896f3:
	scall Func_8001c
	ret

Func_896f7:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	if_true .asm_8992c
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	ld a, [wc796]
	cp $01
	jp nz, .asm_89792
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_8978f
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	ld a, $26
	scall Func_80e7d
	cp $01
	jp nz, .asm_89786
	hltext_tree_pointer TreeBitstreamText_44392
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	if_true .asm_89775
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
	jp .asm_89783
.asm_89775:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_4445d
	scall PrintTextWithNPCName
	jp .asm_8992c
.asm_89783:
	jp .asm_8978f
.asm_89786:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_8992c
.asm_8978f:
	jp .asm_898d7
.asm_89792:
	ld a, [wc796]
	cp $09
	jp nz, .asm_8981c
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_89819
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	ld a, $69
	scall Func_80e7d
	cp $01
	jp nz, .asm_89810
	hltext_tree_pointer TreeBitstreamText_44507
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_458e0
	scall PrintTextWithYesNoBox
	if_true .asm_897ff
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
	jp .asm_8980d
.asm_897ff:
	playsfx $69
	hltext_tree_pointer TreeBitstreamText_4445d
	scall PrintTextWithNPCName
	jp .asm_8992c
.asm_8980d:
	jp .asm_89819
.asm_89810:
	hltext_tree_pointer TreeBitstreamText_45a40
	scall PrintTextStandard
	jp .asm_8992c
.asm_89819:
	jp .asm_898d7
.asm_8981c:
	ld a, $26
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_89836
	ld a, $69
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_898d7
.asm_89836:
	ld a, [wc796]
	cp $08
	jp z, .asm_898bf
	cp $06
	jp z, .asm_898bf
	cp $0a
	jp z, .asm_898b0
	cp $05
	jp z, .asm_898b0
	cp $0c
	jp z, .asm_898a1
	cp $04
	jp z, .asm_898a1
	cp $0d
	jp z, .asm_89892
	cp $03
	jp z, .asm_89892
	cp $0b
	jp z, .asm_89883
	cp $02
	jp z, .asm_89883
	cp $07
	jp z, .asm_89874
	if_true .asm_898ce
.asm_89874:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45abb
	scall PrintTextStandard
	jp .asm_898d4
.asm_89883:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45add
	scall PrintTextStandard
	jp .asm_898d4
.asm_89892:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aee
	scall PrintTextStandard
	jp .asm_898d4
.asm_898a1:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45aff
	scall PrintTextStandard
	jp .asm_898d4
.asm_898b0:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b10
	scall PrintTextStandard
	jp .asm_898d4
.asm_898bf:
	hltext_tree_pointer TreeBitstreamText_45a76
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_45b20
	scall PrintTextStandard
	jp .asm_898d4
.asm_898ce:
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
.asm_898d4:
	jp .asm_8992c
.asm_898d7:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_8992c
	ld a, [wc796]
	cp $0a
	jp nc, .asm_898fe
	ld a, [wc796]
	cp $02
	jp c, .asm_898fe
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_44486
	scall PrintTextWithNPCName
	jp .asm_8992c
.asm_898fe:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_8990f
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	jp .asm_8992c
.asm_8990f:
	ld a, [wc796]
	cp $0a
	jp c, .asm_89920
	hltext_tree_pointer TreeBitstreamText_445b1
	scall PrintTextWithNPCName
	jp .asm_8992c
.asm_89920:
	hltext_tree_pointer TreeBitstreamText_442ef
	scall PrintTextWithNPCName
	hltext_tree_pointer TreeBitstreamText_4434a
	scall PrintTextWithNPCName
.asm_8992c:
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
	jp z, .asm_89995
	ld a, [wc790]
	cp $07
	jp nc, .asm_89995
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
.asm_89995:
	ret

Func_89996:	ld a, e
	cp $02
	jp nz, .asm_89a02
	ld a, [wMapX]
	add a, $05
	cp $19
	jp z, .asm_899f4
	cp $16
	jp z, .asm_899ec
	cp $13
	jp z, .asm_899e4
	cp $10
	jp z, .asm_899dc
	cp $0d
	jp z, .asm_899d4
	cp $0a
	jp z, .asm_899cc
	cp $08
	jp nz, .asm_899fc
	ld a, $04
	ld [wc78a], a
	jp .asm_89a02
.asm_899cc:
	ld a, $08
	ld [wc78a], a
	jp .asm_89a02
.asm_899d4:
	ld a, $0a
	ld [wc78a], a
	jp .asm_89a02
.asm_899dc:
	ld a, $0e
	ld [wc78a], a
	jp .asm_89a02
.asm_899e4:
	ld a, $0b
	ld [wc78a], a
	jp .asm_89a02
.asm_899ec:
	ld a, $09
	ld [wc78a], a
	jp .asm_89a02
.asm_899f4:
	ld a, $05
	ld [wc78a], a
	jp .asm_89a02
.asm_899fc:
	hltext_tree_pointer DummyTextTreeBitstream_001
	scall PrintTextStandard
.asm_89a02:
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
	if_true .asm_89ab4
	ld a, [wBackupMapNumber]
	cp $02
	jp nz, .asm_89ab4
	call Func_89b79
	jp .asm_89ac2
.asm_89ab4:
	playmusic $09
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468ae
	scall LandmarkSign
.asm_89ac2:
	ret

Func_89ac3:
	ld a, e
	if_true .asm_89b27
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89ad2
	jp .asm_89b27
.asm_89ad2:
	checkevent $0059
	cp $01
	jp nz, .asm_89ae6
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_89b27
.asm_89ae6:
	ld a, [wc790]
	or a
	jp z, .asm_89afe
	ld a, [wc790]
	cp $07
	jp nc, .asm_89afe
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_89b27
.asm_89afe:
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
.asm_89b27:
	ret

Func_89b28:
	ld a, e
	if_true .asm_89b78
	ld a, [wc790]
	or a
	jp z, .asm_89b45
	ld a, [wc790]
	cp $07
	jp nc, .asm_89b45
	hltext_tree_pointer TreeBitstreamText_47041
	scall PrintTextStandard
	jp .asm_89b78
.asm_89b45:
	checkevent $0059
	if_true .asm_89b65
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	playsfx $32
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp .asm_89b78
.asm_89b65:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	playsfx $28
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
.asm_89b78:
	ret

Func_89b79:
	checkevent $00fc
	if_true .asm_89bc4
	playmusic $09
	xor a
	scall Func_80653
	ld a, $02
	scall PlayerFace
	scall Func_8001c
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
	jp .asm_89bc9
.asm_89bc4:
	ld a, $01
	scall Func_80653
.asm_89bc9:
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
	jp nz, .asm_89c9f ; 89C8F (22:5c8f) -> C2 9F 5C
	ld e, $00 ; 89C92 (22:5c92) -> 1E 00
	xor a ; 89C94 (22:5c94) -> AF
	scall SetPersonVisibilityState ; 89C95 (22:5c95) -> CD 3D 41
	ld e, $00 ; 89C98 (22:5c98) -> 1E 00
	ld a, $01 ; 89C9A (22:5c9a) -> 3E 01
	scall SetPersonVisibilityState ; 89C9C (22:5c9c) -> CD 3D 41
.asm_89c9f:
	scall Func_8001c ; 89C9F (22:5c9f) -> CD 1C 40
	ld hl, $02db ; 89CA2 (22:5ca2) -> 21 DB 02
	scall LandmarkSign ; 89CA5 (22:5ca5) -> CD 72 4F
	ret  ; 89CA8 (22:5ca8) -> C9

Func_89ca9:
	ld a, e ; 89CA9 (22:5ca9) -> 7B
	or a ; 89CAA (22:5caa) -> B7
	jp nz, .asm_89d03 ; 89CAB (22:5cab) -> C2 03 5D
	ld a, [wPlayerFacing] ; 89CAE (22:5cae) -> FA 38 C8
	or a ; 89CB1 (22:5cb1) -> B7
	jp z, .asm_89cb8 ; 89CB2 (22:5cb2) -> CA B8 5C
	jp .asm_89d03 ; 89CB5 (22:5cb5) -> C3 03 5D
.asm_89cb8:
	ld hl, $0059 ; 89CB8 (22:5cb8) -> 21 59 00
	scall CheckEventFlag ; 89CBB (22:5cbb) -> CD 2E 46
	cp $01 ; 89CBE (22:5cbe) -> FE 01
	jp nz, .asm_89ccc ; 89CC0 (22:5cc0) -> C2 CC 5C
	ld hl, $0283 ; 89CC3 (22:5cc3) -> 21 83 02
	scall PrintTextStandard ; 89CC6 (22:5cc6) -> CD 98 44
	jp .asm_89d03 ; 89CC9 (22:5cc9) -> C3 03 5D
.asm_89ccc:
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
.asm_89d03:
	ret  ; 89D03 (22:5d03) -> C9

Func_89d04:
	ld a, e ; 89D04 (22:5d04) -> 7B
	or a ; 89D05 (22:5d05) -> B7
	jp nz, .asm_89d54 ; 89D06 (22:5d06) -> C2 54 5D
	ld a, [wc790] ; 89D09 (22:5d09) -> FA 90 C7
	or a ; 89D0C (22:5d0c) -> B7
	jp z, .asm_89d21 ; 89D0D (22:5d0d) -> CA 21 5D
	ld a, [wc790] ; 89D10 (22:5d10) -> FA 90 C7
	cp $07 ; 89D13 (22:5d13) -> FE 07
	jp nc, .asm_89d21 ; 89D15 (22:5d15) -> D2 21 5D
	ld hl, $03dd ; 89D18 (22:5d18) -> 21 DD 03
	scall PrintTextStandard ; 89D1B (22:5d1b) -> CD 98 44
	jp .asm_89d54 ; 89D1E (22:5d1e) -> C3 54 5D
.asm_89d21:
	ld hl, $0059 ; 89D21 (22:5d21) -> 21 59 00
	scall CheckEventFlag ; 89D24 (22:5d24) -> CD 2E 46
	or a ; 89D27 (22:5d27) -> B7
	jp nz, .asm_89d41 ; 89D28 (22:5d28) -> C2 41 5D
	ld e, $01 ; 89D2B (22:5d2b) -> 1E 01
	ld hl, $0059 ; 89D2D (22:5d2d) -> 21 59 00
	scall EventFlagAction ; 89D30 (22:5d30) -> CD 1B 46
	ld a, $32 ; 89D33 (22:5d33) -> 3E 32
	scall PlaySFX ; 89D35 (22:5d35) -> CD FE 4E
	ld hl, $035b ; 89D38 (22:5d38) -> 21 5B 03
	scall PrintTextStandard ; 89D3B (22:5d3b) -> CD 98 44
	jp .asm_89d54 ; 89D3E (22:5d3e) -> C3 54 5D
.asm_89d41:
	ld e, $00 ; 89D41 (22:5d41) -> 1E 00
	ld hl, $0059 ; 89D43 (22:5d43) -> 21 59 00
	scall EventFlagAction ; 89D46 (22:5d46) -> CD 1B 46
	ld a, $28 ; 89D49 (22:5d49) -> 3E 28
	scall PlaySFX ; 89D4B (22:5d4b) -> CD FE 4E
	ld hl, $035c ; 89D4E (22:5d4e) -> 21 5C 03
	scall PrintTextStandard ; 89D51 (22:5d51) -> CD 98 44
.asm_89d54:
	ret  ; 89D54 (22:5d54) -> C9

Data_89d55:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $90, $01, $90, $02, $0a, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_89d7e:
	db $10, $0a, $ff, $ff

Data_89d82:
	db $10, $06, $09, $06, $09, $04, $ff, $ff

Func_89d8a:
	ld a, e ; 89D8A (22:5d8a) -> 7B
	cp $02 ; 89D8B (22:5d8b) -> FE 02
	jp nz, .asm_89df8 ; 89D8D (22:5d8d) -> C2 F8 5D
	ld hl, $006b ; 89D90 (22:5d90) -> 21 6B 00
	scall CheckEventFlag ; 89D93 (22:5d93) -> CD 2E 46
	or a ; 89D96 (22:5d96) -> B7
	jp nz, .asm_89df8 ; 89D97 (22:5d97) -> C2 F8 5D
	xor a ; 89D9A (22:5d9a) -> AF
	scall PlayMusic ; 89D9B (22:5d9b) -> CD E6 4E
	ld a, $1a ; 89D9E (22:5d9e) -> 3E 1A
	scall PlayMusic ; 89DA0 (22:5da0) -> CD E6 4E
	ld c, $01 ; 89DA3 (22:5da3) -> 0E 01
	ld de, Data_89d7e ; 89DA5 (22:5da5) -> 11 7E 5D
	ld a, $22 ; 89DA8 (22:5da8) -> 3E 22
	scall MovePlayer ; 89DAA (22:5daa) -> CD 3E 46
	scall WaitNPCStep ; 89DAD (22:5dad) -> CD 0C 42
	xor a ; 89DB0 (22:5db0) -> AF
	scall PlayerFace ; 89DB1 (22:5db1) -> CD 77 46
	ld hl, $007b ; 89DB4 (22:5db4) -> 21 7B 00
	scall PrintTextWithNPCName ; 89DB7 (22:5db7) -> CD A9 44
	ld de, Data_89df9 ; 89DBA (22:5dba) -> 11 F9 5D
	ld hl, Data_89d55 ; 89DBD (22:5dbd) -> 21 55 5D
	scall ScriptedBattle ; 89DC0 (22:5dc0) -> CD D3 4D
	or a ; 89DC3 (22:5dc3) -> B7
	jp nz, .asm_89dca ; 89DC4 (22:5dc4) -> C2 CA 5D
	jp .asm_89df8 ; 89DC7 (22:5dc7) -> C3 F8 5D
.asm_89dca:
	ld e, $01 ; 89DCA (22:5dca) -> 1E 01
	ld hl, $006b ; 89DCC (22:5dcc) -> 21 6B 00
	scall EventFlagAction ; 89DCF (22:5dcf) -> CD 1B 46
	ld hl, $007c ; 89DD2 (22:5dd2) -> 21 7C 00
	scall PrintTextWithNPCName ; 89DD5 (22:5dd5) -> CD A9 44
	ld bc, Data_89d82 ; 89DD8 (22:5dd8) -> 01 82 5D
	ld e, $22 ; 89DDB (22:5ddb) -> 1E 22
	xor a ; 89DDD (22:5ddd) -> AF
	scall MovePersonAndWait ; 89DDE (22:5dde) -> CD 88 46
	ld a, $2e ; 89DE1 (22:5de1) -> 3E 2E
	scall PlaySFX ; 89DE3 (22:5de3) -> CD FE 4E
	scall WaitNPCStep ; 89DE6 (22:5de6) -> CD 0C 42
	ld e, $00 ; 89DE9 (22:5de9) -> 1E 00
	xor a ; 89DEB (22:5deb) -> AF
	scall SetPersonVisibilityState ; 89DEC (22:5dec) -> CD 3D 41
	xor a ; 89DEF (22:5def) -> AF
	scall PlayMusic ; 89DF0 (22:5df0) -> CD E6 4E
	ld a, $09 ; 89DF3 (22:5df3) -> 3E 09
	scall PlayMusic ; 89DF5 (22:5df5) -> CD E6 4E
.asm_89df8:
	ret  ; 89DF8 (22:5df8) -> C9

Data_89df9:
	dstr "チネン"

Data_89dfd:
	db $08, $13, $04, $01, $05, $00, $10, $06, $10, $07, $34, $01, $0a, $01, $01, $05, $1f, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1f, $12, $0a, $11, $0a, $2e

Data_89e1e:
	db $1e, $0b, $0f, $03, $13

Data_89e23:
IF DEF(SUN)
	db $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00, $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $09, $04, $00, $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00, $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00, $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00
ENDC

Data_89e69:
	db $03, $04, $08, $05, $01, $01, $00, $04, $00, $22, $1e, $5f, $00, $00, $05, $04, $09, $05, $01, $01, $00, $04, $00, $22, $a8, $5f, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $31, $60, $00, $00, $07, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $b7, $60, $00, $00

Data_89ea1:
	map_object $ff, $00, $07, $03, $06, $01, $00, $04, $00, Func_8a115, 0

Func_89eaf:: ; 89eaf
	ld e, $03 ; 89EAF (22:5eaf) -> 1E 03
	ld hl, Data_89dfd ; 89EB1 (22:5eb1) -> 21 FD 5D
	scall LoadWarps ; 89EB4 (22:5eb4) -> CD 3A 40
	ld e, $01 ; 89EB7 (22:5eb7) -> 1E 01
	ld hl, Data_89e1e ; 89EB9 (22:5eb9) -> 21 1E 5E
	scall Func_80ce7 ; 89EBC (22:5ebc) -> CD E7 4C
	ld a, $03 ; 89EBF (22:5ebf) -> 3E 03
	scall Func_80d01 ; 89EC1 (22:5ec1) -> CD 01 4D
	ld e, $05 ; 89EC4 (22:5ec4) -> 1E 05
	ld hl, Data_89e23 ; 89EC6 (22:5ec6) -> 21 23 5E
	scall LoadEncounters ; 89EC9 (22:5ec9) -> CD 24 4D
	ld hl, $001f ; 89ECC (22:5ecc) -> 21 1F 00
	scall CheckEventFlag ; 89ECF (22:5ecf) -> CD 2E 46
	or a ; 89ED2 (22:5ed2) -> B7
	jp nz, .asm_89ede ; 89ED3 (22:5ed3) -> C2 DE 5E
	ld e, $04 ; 89ED6 (22:5ed6) -> 1E 04
	ld hl, Data_89e69 ; 89ED8 (22:5ed8) -> 21 69 5E
	scall LoadMapObjects ; 89EDB (22:5edb) -> CD FB 40
.asm_89ede:
	ld e, $01 ; 89EDE (22:5ede) -> 1E 01
	ld hl, Data_89ea1 ; 89EE0 (22:5ee0) -> 21 A1 5E
	scall LoadMapObjects ; 89EE3 (22:5ee3) -> CD FB 40
	ld a, $09 ; 89EE6 (22:5ee6) -> 3E 09
	scall PlayMusic ; 89EE8 (22:5ee8) -> CD E6 4E
	scall Func_8001c ; 89EEB (22:5eeb) -> CD 1C 40
	ld hl, $02dc ; 89EEE (22:5eee) -> 21 DC 02
	scall LandmarkSign ; 89EF1 (22:5ef1) -> CD 72 4F
	ret  ; 89EF4 (22:5ef4) -> C9

Data_89ef5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $04, $01, $08, $01, $06, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $45, $01, $08, $14, $14, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_89f1e:	push af ; 89F1E (22:5f1e) -> F5
	ld a, e ; 89F1F (22:5f1f) -> 7B
	or a ; 89F20 (22:5f20) -> B7
	jp nz, .asm_89f74 ; 89F21 (22:5f21) -> C2 74 5F
	ld hl, sp+$01 ; 89F24 (22:5f24) -> F8 01
	ld a, [hl] ; 89F26 (22:5f26) -> 7E
	scall FacePlayer ; 89F27 (22:5f27) -> CD 4B 44
	ld hl, $0076 ; 89F2A (22:5f2a) -> 21 76 00
	scall CheckEventFlag ; 89F2D (22:5f2d) -> CD 2E 46
	or a ; 89F30 (22:5f30) -> B7
	jp nz, .asm_89f6e ; 89F31 (22:5f31) -> C2 6E 5F
	ld hl, $022c ; 89F34 (22:5f34) -> 21 2C 02
	scall PrintTextStandard ; 89F37 (22:5f37) -> CD 98 44
	ld hl, $032c ; 89F3A (22:5f3a) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 89F3D (22:5f3d) -> CD BA 44
	or a ; 89F40 (22:5f40) -> B7
	jp nz, .asm_89f65 ; 89F41 (22:5f41) -> C2 65 5F
	ld de, Data_89f76 ; 89F44 (22:5f44) -> 11 76 5F
	ld hl, Data_89ef5 ; 89F47 (22:5f47) -> 21 F5 5E
	scall ScriptedBattle ; 89F4A (22:5f4a) -> CD D3 4D
	or a ; 89F4D (22:5f4d) -> B7
	jp nz, .asm_89f54 ; 89F4E (22:5f4e) -> C2 54 5F
	jp .asm_89f74 ; 89F51 (22:5f51) -> C3 74 5F
.asm_89f54:
	ld e, $01 ; 89F54 (22:5f54) -> 1E 01
	ld hl, $0076 ; 89F56 (22:5f56) -> 21 76 00
	scall EventFlagAction ; 89F59 (22:5f59) -> CD 1B 46
	ld hl, $022d ; 89F5C (22:5f5c) -> 21 2D 02
	scall PrintTextStandard ; 89F5F (22:5f5f) -> CD 98 44
	jp .asm_89f6b ; 89F62 (22:5f62) -> C3 6B 5F
.asm_89f65:
	ld hl, $0232 ; 89F65 (22:5f65) -> 21 32 02
	scall PrintTextStandard ; 89F68 (22:5f68) -> CD 98 44
.asm_89f6b:
	jp .asm_89f74 ; 89F6B (22:5f6b) -> C3 74 5F
.asm_89f6e:
	ld hl, $0234 ; 89F6E (22:5f6e) -> 21 34 02
	scall PrintTextStandard ; 89F71 (22:5f71) -> CD 98 44
.asm_89f74:
	pop bc ; 89F74 (22:5f74) -> C1
	ret  ; 89F75 (22:5f75) -> C9

Data_89f76:
	dstr "(よひﾞくﾞん)"

Data_89f7f:
	db $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $34, $01, $34, $01, $08, $17, $12, $11, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_89fa8:
	push af ; 89FA8 (22:5fa8) -> F5
	ld a, e ; 89FA9 (22:5fa9) -> 7B
	or a ; 89FAA (22:5faa) -> B7
	jp nz, .asm_89ffe ; 89FAB (22:5fab) -> C2 FE 5F
	ld hl, sp+$01 ; 89FAE (22:5fae) -> F8 01
	ld a, [hl] ; 89FB0 (22:5fb0) -> 7E
	scall FacePlayer ; 89FB1 (22:5fb1) -> CD 4B 44
	ld hl, $0077 ; 89FB4 (22:5fb4) -> 21 77 00
	scall CheckEventFlag ; 89FB7 (22:5fb7) -> CD 2E 46
	or a ; 89FBA (22:5fba) -> B7
	jp nz, .asm_89ff8 ; 89FBB (22:5fbb) -> C2 F8 5F
	ld hl, $022e ; 89FBE (22:5fbe) -> 21 2E 02
	scall PrintTextStandard ; 89FC1 (22:5fc1) -> CD 98 44
	ld hl, $032c ; 89FC4 (22:5fc4) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 89FC7 (22:5fc7) -> CD BA 44
	or a ; 89FCA (22:5fca) -> B7
	jp nz, .asm_89fef ; 89FCB (22:5fcb) -> C2 EF 5F
	ld de, Data_8a000 ; 89FCE (22:5fce) -> 11 00 60
	ld hl, Data_89f7f ; 89FD1 (22:5fd1) -> 21 7F 5F
	scall ScriptedBattle ; 89FD4 (22:5fd4) -> CD D3 4D
	or a ; 89FD7 (22:5fd7) -> B7
	jp nz, .asm_89fde ; 89FD8 (22:5fd8) -> C2 DE 5F
	jp .asm_89ffe ; 89FDB (22:5fdb) -> C3 FE 5F
.asm_89fde:
	ld e, $01 ; 89FDE (22:5fde) -> 1E 01
	ld hl, $0077 ; 89FE0 (22:5fe0) -> 21 77 00
	scall EventFlagAction ; 89FE3 (22:5fe3) -> CD 1B 46
	ld hl, $022f ; 89FE6 (22:5fe6) -> 21 2F 02
	scall PrintTextStandard ; 89FE9 (22:5fe9) -> CD 98 44
	jp .asm_89ff5 ; 89FEC (22:5fec) -> C3 F5 5F
.asm_89fef:
	ld hl, $0233 ; 89FEF (22:5fef) -> 21 33 02
	scall PrintTextStandard ; 89FF2 (22:5ff2) -> CD 98 44
.asm_89ff5:
	jp .asm_89ffe ; 89FF5 (22:5ff5) -> C3 FE 5F
.asm_89ff8:
	ld hl, $022a ; 89FF8 (22:5ff8) -> 21 2A 02
	scall PrintTextStandard ; 89FFB (22:5ffb) -> CD 98 44
.asm_89ffe:
	pop bc ; 89FFE (22:5ffe) -> C1
	ret  ; 89FFF (22:5fff) -> C9

Data_8a000:
	dstr "ハﾞア(さん)"

Data_8a008:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $0a, $01, $17, $01, $08, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a031:
	push af ; 8A031 (22:6031) -> F5
	ld a, e ; 8A032 (22:6032) -> 7B
	or a ; 8A033 (22:6033) -> B7
	jp nz, .asm_8a087 ; 8A034 (22:6034) -> C2 87 60
	ld hl, sp+$01 ; 8A037 (22:6037) -> F8 01
	ld a, [hl] ; 8A039 (22:6039) -> 7E
	scall FacePlayer ; 8A03A (22:603a) -> CD 4B 44
	ld hl, $0078 ; 8A03D (22:603d) -> 21 78 00
	scall CheckEventFlag ; 8A040 (22:6040) -> CD 2E 46
	or a ; 8A043 (22:6043) -> B7
	jp nz, .asm_8a081 ; 8A044 (22:6044) -> C2 81 60
	ld hl, $0230 ; 8A047 (22:6047) -> 21 30 02
	scall PrintTextStandard ; 8A04A (22:604a) -> CD 98 44
	ld hl, $032c ; 8A04D (22:604d) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A050 (22:6050) -> CD BA 44
	or a ; 8A053 (22:6053) -> B7
	jp nz, .asm_8a078 ; 8A054 (22:6054) -> C2 78 60
	ld de, Data_8a089 ; 8A057 (22:6057) -> 11 89 60
	ld hl, Data_8a008 ; 8A05A (22:605a) -> 21 08 60
	scall ScriptedBattle ; 8A05D (22:605d) -> CD D3 4D
	or a ; 8A060 (22:6060) -> B7
	jp nz, .asm_8a067 ; 8A061 (22:6061) -> C2 67 60
	jp .asm_8a087 ; 8A064 (22:6064) -> C3 87 60
.asm_8a067:
	ld e, $01 ; 8A067 (22:6067) -> 1E 01
	ld hl, $0078 ; 8A069 (22:6069) -> 21 78 00
	scall EventFlagAction ; 8A06C (22:606c) -> CD 1B 46
	ld hl, $0231 ; 8A06F (22:606f) -> 21 31 02
	scall PrintTextStandard ; 8A072 (22:6072) -> CD 98 44
	jp .asm_8a07e ; 8A075 (22:6075) -> C3 7E 60
.asm_8a078:
	ld hl, $0233 ; 8A078 (22:6078) -> 21 33 02
	scall PrintTextStandard ; 8A07B (22:607b) -> CD 98 44
.asm_8a07e:
	jp .asm_8a087 ; 8A07E (22:607e) -> C3 87 60
.asm_8a081:
	ld hl, $0229 ; 8A081 (22:6081) -> 21 29 02
	scall PrintTextStandard ; 8A084 (22:6084) -> CD 98 44
.asm_8a087:
	pop bc ; 8A087 (22:6087) -> C1
	ret  ; 8A088 (22:6088) -> C9

Data_8a089:
	dstr "ロッカー"

Data_8a08e:
	db $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $51, $01, $51, $01, $08, $17, $17, $17, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a0b7:
	push af ; 8A0B7 (22:60b7) -> F5
	ld a, e ; 8A0B8 (22:60b8) -> 7B
	or a ; 8A0B9 (22:60b9) -> B7
	jp nz, .asm_8a10d ; 8A0BA (22:60ba) -> C2 0D 61
	ld hl, sp+$01 ; 8A0BD (22:60bd) -> F8 01
	ld a, [hl] ; 8A0BF (22:60bf) -> 7E
	scall FacePlayer ; 8A0C0 (22:60c0) -> CD 4B 44
	ld hl, $0079 ; 8A0C3 (22:60c3) -> 21 79 00
	scall CheckEventFlag ; 8A0C6 (22:60c6) -> CD 2E 46
	or a ; 8A0C9 (22:60c9) -> B7
	jp nz, .asm_8a107 ; 8A0CA (22:60ca) -> C2 07 61
	ld hl, $022b ; 8A0CD (22:60cd) -> 21 2B 02
	scall PrintTextStandard ; 8A0D0 (22:60d0) -> CD 98 44
	ld hl, $032c ; 8A0D3 (22:60d3) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A0D6 (22:60d6) -> CD BA 44
	or a ; 8A0D9 (22:60d9) -> B7
	jp nz, .asm_8a0fe ; 8A0DA (22:60da) -> C2 FE 60
	ld de, Data_8a10f ; 8A0DD (22:60dd) -> 11 0F 61
	ld hl, Data_8a08e ; 8A0E0 (22:60e0) -> 21 8E 60
	scall ScriptedBattle ; 8A0E3 (22:60e3) -> CD D3 4D
	or a ; 8A0E6 (22:60e6) -> B7
	jp nz, .asm_8a0ed ; 8A0E7 (22:60e7) -> C2 ED 60
	jp .asm_8a10d ; 8A0EA (22:60ea) -> C3 0D 61
.asm_8a0ed:
	ld e, $01 ; 8A0ED (22:60ed) -> 1E 01
	ld hl, $0079 ; 8A0EF (22:60ef) -> 21 79 00
	scall EventFlagAction ; 8A0F2 (22:60f2) -> CD 1B 46
	ld hl, $022b ; 8A0F5 (22:60f5) -> 21 2B 02
	scall PrintTextStandard ; 8A0F8 (22:60f8) -> CD 98 44
	jp .asm_8a104 ; 8A0FB (22:60fb) -> C3 04 61
.asm_8a0fe:
	ld hl, $022b ; 8A0FE (22:60fe) -> 21 2B 02
	scall PrintTextStandard ; 8A101 (22:6101) -> CD 98 44
.asm_8a104:
	jp .asm_8a10d ; 8A104 (22:6104) -> C3 0D 61
.asm_8a107:
	ld hl, $022b ; 8A107 (22:6107) -> 21 2B 02
	scall PrintTextStandard ; 8A10A (22:610a) -> CD 98 44
.asm_8a10d:
	pop bc ; 8A10D (22:610d) -> C1
	ret  ; 8A10E (22:610e) -> C9

Data_8a10f:
	dstr "オハﾞサン"

Func_8a115:
	ld a, e ; 8A115 (22:6115) -> 7B
	or a ; 8A116 (22:6116) -> B7
	jp nz, .asm_8a12f ; 8A117 (22:6117) -> C2 2F 61
	ld a, [wc790] ; 8A11A (22:611a) -> FA 90 C7
	or a ; 8A11D (22:611d) -> B7
	jp z, .asm_8a129 ; 8A11E (22:611e) -> CA 29 61
	ld a, [wc790] ; 8A121 (22:6121) -> FA 90 C7
	cp $07 ; 8A124 (22:6124) -> FE 07
	jp nz, .asm_8a12f ; 8A126 (22:6126) -> C2 2F 61
.asm_8a129:
	ld hl, $0396 ; 8A129 (22:6129) -> 21 96 03
	scall PrintTextStandard ; 8A12C (22:612c) -> CD 98 44
.asm_8a12f:
	ret  ; 8A12F (22:612f) -> C9

Data_8a130:
	db $01, $0a, $01, $01, $05, $1e, $01, $0a, $02, $0a, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $11, $0a, $2e

Data_8a146:
	db $23, $0b, $0b, $03, $0b

Data_8a14b:
IF DEF(SUN)
	db $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00, $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $03, $04, $00, $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00, $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00, $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00, $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00, $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00
ENDC

Data_8a191:
	db $0c, $04, $08, $05, $01, $01, $00, $04, $00, $22, $84, $62, $00, $00, $00, $04, $09, $05, $01, $01, $00, $04, $00, $22, $0a, $63, $00, $00, $01, $04, $0a, $05, $01, $01, $00, $04, $00, $22, $94, $63, $00, $00, $03, $04, $0b, $05, $01, $01, $00, $04, $00, $22, $1d, $64, $00, $00

Data_8a1c9:
	map_object $ff, $00, $07, $03, $06, $01, $00, $04, $00, Func_8a5a5, 0
	map_object $0f, $04, $0e, $0f, $01, $01, $02, $04, $00, 0, 0
	map_object $ff, $00, $0e, $0f, $01, $01, $02, $04, $00, Func_8a480, 0

Func_8a1f3:: ; 8a1f3
	call Func_8a5e7 ; 8A1F3 (22:61f3) -> CD E7 65
	ld hl, Func_8a5e7 ; 8A1F6 (22:61f6) -> 21 E7 65
	scall Func_80f11 ; 8A1F9 (22:61f9) -> CD 11 4F
	ld e, $02 ; 8A1FC (22:61fc) -> 1E 02
	ld hl, Data_8a130 ; 8A1FE (22:61fe) -> 21 30 61
	scall LoadWarps ; 8A201 (22:6201) -> CD 3A 40
	ld e, $01 ; 8A204 (22:6204) -> 1E 01
	ld hl, Data_8a146 ; 8A206 (22:6206) -> 21 46 61
	scall Func_80ce7 ; 8A209 (22:6209) -> CD E7 4C
	ld a, $03 ; 8A20C (22:620c) -> 3E 03
	scall Func_80d01 ; 8A20E (22:620e) -> CD 01 4D
	ld e, $05 ; 8A211 (22:6211) -> 1E 05
	ld hl, Data_8a14b ; 8A213 (22:6213) -> 21 4B 61
	scall LoadEncounters ; 8A216 (22:6216) -> CD 24 4D
	ld hl, $001f ; 8A219 (22:6219) -> 21 1F 00
	scall CheckEventFlag ; 8A21C (22:621c) -> CD 2E 46
	or a ; 8A21F (22:621f) -> B7
	jp nz, .asm_8a23d ; 8A220 (22:6220) -> C2 3D 62
	ld e, $04 ; 8A223 (22:6223) -> 1E 04
	ld hl, Data_8a191 ; 8A225 (22:6225) -> 21 91 61
	scall LoadMapObjects ; 8A228 (22:6228) -> CD FB 40
	ld e, $03 ; 8A22B (22:622b) -> 1E 03
	ld hl, Data_8a1c9 ; 8A22D (22:622d) -> 21 C9 61
	scall LoadMapObjects ; 8A230 (22:6230) -> CD FB 40
	ld e, $00 ; 8A233 (22:6233) -> 1E 00
	ld a, $05 ; 8A235 (22:6235) -> 3E 05
	scall SetPersonVisibilityState ; 8A237 (22:6237) -> CD 3D 41
	jp .asm_8a24c ; 8A23A (22:623a) -> C3 4C 62
.asm_8a23d:
	ld e, $03 ; 8A23D (22:623d) -> 1E 03
	ld hl, Data_8a1c9 ; 8A23F (22:623f) -> 21 C9 61
	scall LoadMapObjects ; 8A242 (22:6242) -> CD FB 40
	ld e, $00 ; 8A245 (22:6245) -> 1E 00
	ld a, $01 ; 8A247 (22:6247) -> 3E 01
	scall SetPersonVisibilityState ; 8A249 (22:6249) -> CD 3D 41
.asm_8a24c:
	ld a, $09 ; 8A24C (22:624c) -> 3E 09
	scall PlayMusic ; 8A24E (22:624e) -> CD E6 4E
	scall Func_8001c ; 8A251 (22:6251) -> CD 1C 40
	ld hl, $02dd ; 8A254 (22:6254) -> 21 DD 02
	scall LandmarkSign ; 8A257 (22:6257) -> CD 72 4F
	ret  ; 8A25A (22:625a) -> C9

Data_8a25b:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $18, $01, $18, $01, $09, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a284:
	push af ; 8A284 (22:6284) -> F5
	ld a, e ; 8A285 (22:6285) -> 7B
	or a ; 8A286 (22:6286) -> B7
	jp nz, .asm_8a2da ; 8A287 (22:6287) -> C2 DA 62
	ld hl, sp+$01 ; 8A28A (22:628a) -> F8 01
	ld a, [hl] ; 8A28C (22:628c) -> 7E
	scall FacePlayer ; 8A28D (22:628d) -> CD 4B 44
	ld hl, $007a ; 8A290 (22:6290) -> 21 7A 00
	scall CheckEventFlag ; 8A293 (22:6293) -> CD 2E 46
	or a ; 8A296 (22:6296) -> B7
	jp nz, .asm_8a2d4 ; 8A297 (22:6297) -> C2 D4 62
	ld hl, $022e ; 8A29A (22:629a) -> 21 2E 02
	scall PrintTextStandard ; 8A29D (22:629d) -> CD 98 44
	ld hl, $032c ; 8A2A0 (22:62a0) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A2A3 (22:62a3) -> CD BA 44
	or a ; 8A2A6 (22:62a6) -> B7
	jp nz, .asm_8a2cb ; 8A2A7 (22:62a7) -> C2 CB 62
	ld de, Data_8a2dc ; 8A2AA (22:62aa) -> 11 DC 62
	ld hl, Data_8a25b ; 8A2AD (22:62ad) -> 21 5B 62
	scall ScriptedBattle ; 8A2B0 (22:62b0) -> CD D3 4D
	or a ; 8A2B3 (22:62b3) -> B7
	jp nz, .asm_8a2ba ; 8A2B4 (22:62b4) -> C2 BA 62
	jp .asm_8a2da ; 8A2B7 (22:62b7) -> C3 DA 62
.asm_8a2ba:
	ld e, $01 ; 8A2BA (22:62ba) -> 1E 01
	ld hl, $007a ; 8A2BC (22:62bc) -> 21 7A 00
	scall EventFlagAction ; 8A2BF (22:62bf) -> CD 1B 46
	ld hl, $022f ; 8A2C2 (22:62c2) -> 21 2F 02
	scall PrintTextStandard ; 8A2C5 (22:62c5) -> CD 98 44
	jp .asm_8a2d1 ; 8A2C8 (22:62c8) -> C3 D1 62
.asm_8a2cb:
	ld hl, $0233 ; 8A2CB (22:62cb) -> 21 33 02
	scall PrintTextStandard ; 8A2CE (22:62ce) -> CD 98 44
.asm_8a2d1:
	jp .asm_8a2da ; 8A2D1 (22:62d1) -> C3 DA 62
.asm_8a2d4:
	ld hl, $022d ; 8A2D4 (22:62d4) -> 21 2D 02
	scall PrintTextStandard ; 8A2D7 (22:62d7) -> CD 98 44
.asm_8a2da:
	pop bc ; 8A2DA (22:62da) -> C1
	ret  ; 8A2DB (22:62db) -> C9

Data_8a2dc:
	dstr "ロッカー"

Data_8a2e1:
	db $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $52, $01, $52, $01, $09, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a30a:
	push af ; 8A30A (22:630a) -> F5
	ld a, e ; 8A30B (22:630b) -> 7B
	or a ; 8A30C (22:630c) -> B7
	jp nz, .asm_8a360 ; 8A30D (22:630d) -> C2 60 63
	ld hl, sp+$01 ; 8A310 (22:6310) -> F8 01
	ld a, [hl] ; 8A312 (22:6312) -> 7E
	scall FacePlayer ; 8A313 (22:6313) -> CD 4B 44
	ld hl, $007b ; 8A316 (22:6316) -> 21 7B 00
	scall CheckEventFlag ; 8A319 (22:6319) -> CD 2E 46
	or a ; 8A31C (22:631c) -> B7
	jp nz, .asm_8a35a ; 8A31D (22:631d) -> C2 5A 63
	ld hl, $0230 ; 8A320 (22:6320) -> 21 30 02
	scall PrintTextStandard ; 8A323 (22:6323) -> CD 98 44
	ld hl, $032c ; 8A326 (22:6326) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A329 (22:6329) -> CD BA 44
	or a ; 8A32C (22:632c) -> B7
	jp nz, .asm_8a351 ; 8A32D (22:632d) -> C2 51 63
	ld de, Data_8a362 ; 8A330 (22:6330) -> 11 62 63
	ld hl, Data_8a2e1 ; 8A333 (22:6333) -> 21 E1 62
	scall ScriptedBattle ; 8A336 (22:6336) -> CD D3 4D
	or a ; 8A339 (22:6339) -> B7
	jp nz, .asm_8a340 ; 8A33A (22:633a) -> C2 40 63
	jp .asm_8a360 ; 8A33D (22:633d) -> C3 60 63
.asm_8a340:
	ld e, $01 ; 8A340 (22:6340) -> 1E 01
	ld hl, $007b ; 8A342 (22:6342) -> 21 7B 00
	scall EventFlagAction ; 8A345 (22:6345) -> CD 1B 46
	ld hl, $0231 ; 8A348 (22:6348) -> 21 31 02
	scall PrintTextStandard ; 8A34B (22:634b) -> CD 98 44
	jp .asm_8a357 ; 8A34E (22:634e) -> C3 57 63
.asm_8a351:
	ld hl, $0233 ; 8A351 (22:6351) -> 21 33 02
	scall PrintTextStandard ; 8A354 (22:6354) -> CD 98 44
.asm_8a357:
	jp .asm_8a360 ; 8A357 (22:6357) -> C3 60 63
.asm_8a35a:
	ld hl, $0231 ; 8A35A (22:635a) -> 21 31 02
	scall PrintTextStandard ; 8A35D (22:635d) -> CD 98 44
.asm_8a360:
	pop bc ; 8A360 (22:6360) -> C1
	ret  ; 8A361 (22:6361) -> C9

Data_8a362:
	dstr "(かいしゃいん)"

Data_8a36b:
	db $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $33, $01, $33, $01, $09, $17, $05, $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a393:
	push af ; 8A394 (22:6394) -> F5
	ld a, e ; 8A395 (22:6395) -> 7B
	or a ; 8A396 (22:6396) -> B7
	jp nz, .asm_8a3ea ; 8A397 (22:6397) -> C2 EA 63
	ld hl, sp+$01 ; 8A39A (22:639a) -> F8 01
	ld a, [hl] ; 8A39C (22:639c) -> 7E
	scall FacePlayer ; 8A39D (22:639d) -> CD 4B 44
	ld hl, $007c ; 8A3A0 (22:63a0) -> 21 7C 00
	scall CheckEventFlag ; 8A3A3 (22:63a3) -> CD 2E 46
	or a ; 8A3A6 (22:63a6) -> B7
	jp nz, .asm_8a3e4 ; 8A3A7 (22:63a7) -> C2 E4 63
	ld hl, $022b ; 8A3AA (22:63aa) -> 21 2B 02
	scall PrintTextStandard ; 8A3AD (22:63ad) -> CD 98 44
	ld hl, $032c ; 8A3B0 (22:63b0) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A3B3 (22:63b3) -> CD BA 44
	or a ; 8A3B6 (22:63b6) -> B7
	jp nz, .asm_8a3db ; 8A3B7 (22:63b7) -> C2 DB 63
	ld de, Data_8a3ec ; 8A3BA (22:63ba) -> 11 EC 63
	ld hl, Data_8a36b ; 8A3BD (22:63bd) -> 21 6B 63
	scall ScriptedBattle ; 8A3C0 (22:63c0) -> CD D3 4D
	or a ; 8A3C3 (22:63c3) -> B7
	jp nz, .asm_8a3ca ; 8A3C4 (22:63c4) -> C2 CA 63
	jp .asm_8a3ea ; 8A3C7 (22:63c7) -> C3 EA 63
.asm_8a3ca:
	ld e, $01 ; 8A3CA (22:63ca) -> 1E 01
	ld hl, $007c ; 8A3CC (22:63cc) -> 21 7C 00
	scall EventFlagAction ; 8A3CF (22:63cf) -> CD 1B 46
	ld hl, $022b ; 8A3D2 (22:63d2) -> 21 2B 02
	scall PrintTextStandard ; 8A3D5 (22:63d5) -> CD 98 44
	jp .asm_8a3e1 ; 8A3D8 (22:63d8) -> C3 E1 63
.asm_8a3db:
	ld hl, $022b ; 8A3DB (22:63db) -> 21 2B 02
	scall PrintTextStandard ; 8A3DE (22:63de) -> CD 98 44
.asm_8a3e1:
	jp .asm_8a3ea ; 8A3E1 (22:63e1) -> C3 EA 63
.asm_8a3e4:
	ld hl, $022b ; 8A3E4 (22:63e4) -> 21 2B 02
	scall PrintTextStandard ; 8A3E7 (22:63e7) -> CD 98 44
.asm_8a3ea:
	pop bc ; 8A3EA (22:63ea) -> C1
	ret  ; 8A3EB (22:63eb) -> C9

Data_8a3ec:
	dstr "(おねえさん)"

Data_8a3f4:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $90, $01, $90, $02, $09, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_84a1d:
	push af ; 8A41D (22:641d) -> F5
	ld a, e ; 8A41E (22:641e) -> 7B
	or a ; 8A41F (22:641f) -> B7
	jp nz, .asm_8a473 ; 8A420 (22:6420) -> C2 73 64
	ld hl, sp+$01 ; 8A423 (22:6423) -> F8 01
	ld a, [hl] ; 8A425 (22:6425) -> 7E
	scall FacePlayer ; 8A426 (22:6426) -> CD 4B 44
	ld hl, $007d ; 8A429 (22:6429) -> 21 7D 00
	scall CheckEventFlag ; 8A42C (22:642c) -> CD 2E 46
	or a ; 8A42F (22:642f) -> B7
	jp nz, .asm_8a46d ; 8A430 (22:6430) -> C2 6D 64
	ld hl, $022c ; 8A433 (22:6433) -> 21 2C 02
	scall PrintTextStandard ; 8A436 (22:6436) -> CD 98 44
	ld hl, $032c ; 8A439 (22:6439) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A43C (22:643c) -> CD BA 44
	or a ; 8A43F (22:643f) -> B7
	jp nz, .asm_8a464 ; 8A440 (22:6440) -> C2 64 64
	ld de, Data_8a475 ; 8A443 (22:6443) -> 11 75 64
	ld hl, Data_8a3f4 ; 8A446 (22:6446) -> 21 F4 63
	scall ScriptedBattle ; 8A449 (22:6449) -> CD D3 4D
	or a ; 8A44C (22:644c) -> B7
	jp nz, .asm_8a453 ; 8A44D (22:644d) -> C2 53 64
	jp .asm_8a473 ; 8A450 (22:6450) -> C3 73 64
.asm_8a453:
	ld e, $01 ; 8A453 (22:6453) -> 1E 01
	ld hl, $007d ; 8A455 (22:6455) -> 21 7D 00
	scall EventFlagAction ; 8A458 (22:6458) -> CD 1B 46
	ld hl, $022d ; 8A45B (22:645b) -> 21 2D 02
	scall PrintTextStandard ; 8A45E (22:645e) -> CD 98 44
	jp .asm_8a46a ; 8A461 (22:6461) -> C3 6A 64
.asm_8a464:
	ld hl, $0232 ; 8A464 (22:6464) -> 21 32 02
	scall PrintTextStandard ; 8A467 (22:6467) -> CD 98 44
.asm_8a46a:
	jp .asm_8a473 ; 8A46A (22:646a) -> C3 73 64
.asm_8a46d:
	ld hl, $0234 ; 8A46D (22:646d) -> 21 34 02
	scall PrintTextStandard ; 8A470 (22:6470) -> CD 98 44
.asm_8a473:
	pop bc ; 8A473 (22:6473) -> C1
	ret  ; 8A474 (22:6474) -> C9

Data_8a475:
	dstr "(しﾞょしこうせい)"

Func_8a480:
	push af ; 8A480 (22:6480) -> F5
	ld hl, sp+$01 ; 8A481 (22:6481) -> F8 01
	ld a, [hl] ; 8A483 (22:6483) -> 7E
	dec a ; 8A484 (22:6484) -> 3D
	ld hl, sp+$01 ; 8A485 (22:6485) -> F8 01
	ld [hl], a ; 8A487 (22:6487) -> 77
	ld a, e ; 8A488 (22:6488) -> 7B
	or a ; 8A489 (22:6489) -> B7
	jp nz, .asm_8a5a3 ; 8A48A (22:648a) -> C2 A3 65
	ld hl, $00d8 ; 8A48D (22:648d) -> 21 D8 00
	scall CheckEventFlag ; 8A490 (22:6490) -> CD 2E 46
	or a ; 8A493 (22:6493) -> B7
	jp nz, .asm_8a59d ; 8A494 (22:6494) -> C2 9D 65
	ld a, $5e ; 8A497 (22:6497) -> 3E 5E
	scall PlaySFX ; 8A499 (22:6499) -> CD FE 4E
	ld c, $02 ; 8A49C (22:649c) -> 0E 02
	ld e, $02 ; 8A49E (22:649e) -> 1E 02
	ld a, $08 ; 8A4A0 (22:64a0) -> 3E 08
	scall LoadEmote ; 8A4A2 (22:64a2) -> CD 76 41
	ld e, $0f ; 8A4A5 (22:64a5) -> 1E 0F
	ld a, $0e ; 8A4A7 (22:64a7) -> 3E 0E
	scall MoveEmote ; 8A4A9 (22:64a9) -> CD E4 41
	scall WaitEmote ; 8A4AC (22:64ac) -> CD D5 41
	scall HideEmote ; 8A4AF (22:64af) -> CD 8B 41
	ld a, $28 ; 8A4B2 (22:64b2) -> 3E 28
	scall PlaySFX ; 8A4B4 (22:64b4) -> CD FE 4E
	ld e, $01 ; 8A4B7 (22:64b7) -> 1E 01
	ld hl, sp+$01 ; 8A4B9 (22:64b9) -> F8 01
	ld a, [hl] ; 8A4BB (22:64bb) -> 7E
	scall SetPersonVisibilityState ; 8A4BC (22:64bc) -> CD 3D 41
	ld a, $60 ; 8A4BF (22:64bf) -> 3E 60
	scall PlaySFX ; 8A4C1 (22:64c1) -> CD FE 4E
	ld e, $03 ; 8A4C4 (22:64c4) -> 1E 03
	ld hl, sp+$01 ; 8A4C6 (22:64c6) -> F8 01
	ld a, [hl] ; 8A4C8 (22:64c8) -> 7E
	scall SpriteFace ; 8A4C9 (22:64c9) -> CD 95 40
	ld e, $00 ; 8A4CC (22:64cc) -> 1E 00
	ld hl, sp+$01 ; 8A4CE (22:64ce) -> F8 01
	ld a, [hl] ; 8A4D0 (22:64d0) -> 7E
	scall SpriteFace ; 8A4D1 (22:64d1) -> CD 95 40
	ld e, $01 ; 8A4D4 (22:64d4) -> 1E 01
	ld hl, sp+$01 ; 8A4D6 (22:64d6) -> F8 01
	ld a, [hl] ; 8A4D8 (22:64d8) -> 7E
	scall SpriteFace ; 8A4D9 (22:64d9) -> CD 95 40
	ld e, $02 ; 8A4DC (22:64dc) -> 1E 02
	ld hl, sp+$01 ; 8A4DE (22:64de) -> F8 01
	ld a, [hl] ; 8A4E0 (22:64e0) -> 7E
	scall SpriteFace ; 8A4E1 (22:64e1) -> CD 95 40
	ld e, $03 ; 8A4E4 (22:64e4) -> 1E 03
	ld hl, sp+$01 ; 8A4E6 (22:64e6) -> F8 01
	ld a, [hl] ; 8A4E8 (22:64e8) -> 7E
	scall SpriteFace ; 8A4E9 (22:64e9) -> CD 95 40
	ld e, $00 ; 8A4EC (22:64ec) -> 1E 00
	ld hl, sp+$01 ; 8A4EE (22:64ee) -> F8 01
	ld a, [hl] ; 8A4F0 (22:64f0) -> 7E
	scall SpriteFace ; 8A4F1 (22:64f1) -> CD 95 40
	ld e, $01 ; 8A4F4 (22:64f4) -> 1E 01
	ld hl, sp+$01 ; 8A4F6 (22:64f6) -> F8 01
	ld a, [hl] ; 8A4F8 (22:64f8) -> 7E
	scall SpriteFace ; 8A4F9 (22:64f9) -> CD 95 40
	ld e, $02 ; 8A4FC (22:64fc) -> 1E 02
	ld hl, sp+$01 ; 8A4FE (22:64fe) -> F8 01
	ld a, [hl] ; 8A500 (22:6500) -> 7E
	scall SpriteFace ; 8A501 (22:6501) -> CD 95 40
	ld a, $0f ; 8A504 (22:6504) -> 3E 0F
	scall FadeOutAudio ; 8A506 (22:6506) -> CD F1 4F
	xor a ; 8A509 (22:6509) -> AF
	scall PlayMusic ; 8A50A (22:650a) -> CD E6 4E
	ld a, $01 ; 8A50D (22:650d) -> 3E 01
	scall FadeInAudio ; 8A50F (22:650f) -> CD 1A 50
	ld a, $14 ; 8A512 (22:6512) -> 3E 14
	scall PlayMusic ; 8A514 (22:6514) -> CD E6 4E
	ld hl, sp+$01 ; 8A517 (22:6517) -> F8 01
	ld a, [hl] ; 8A519 (22:6519) -> 7E
	scall FacePlayer ; 8A51A (22:651a) -> CD 4B 44
	ld hl, $001e ; 8A51D (22:651d) -> 21 1E 00
	scall ScriptSleep ; 8A520 (22:6520) -> CD 8F 46
	ld c, $0e ; 8A523 (22:6523) -> 0E 0E
	ld e, $0d ; 8A525 (22:6525) -> 1E 0D
	ld a, $0c ; 8A527 (22:6527) -> 3E 0C
	scall Func_80e8d ; 8A529 (22:6529) -> CD 8D 4E
	ld e, $01 ; 8A52C (22:652c) -> 1E 01
	ld hl, $00d8 ; 8A52E (22:652e) -> 21 D8 00
	scall EventFlagAction ; 8A531 (22:6531) -> CD 1B 46
	ld a, $60 ; 8A534 (22:6534) -> 3E 60
	scall PlaySFX ; 8A536 (22:6536) -> CD FE 4E
	ld e, $03 ; 8A539 (22:6539) -> 1E 03
	ld hl, sp+$01 ; 8A53B (22:653b) -> F8 01
	ld a, [hl] ; 8A53D (22:653d) -> 7E
	scall SpriteFace ; 8A53E (22:653e) -> CD 95 40
	ld e, $00 ; 8A541 (22:6541) -> 1E 00
	ld hl, sp+$01 ; 8A543 (22:6543) -> F8 01
	ld a, [hl] ; 8A545 (22:6545) -> 7E
	scall SpriteFace ; 8A546 (22:6546) -> CD 95 40
	ld e, $01 ; 8A549 (22:6549) -> 1E 01
	ld hl, sp+$01 ; 8A54B (22:654b) -> F8 01
	ld a, [hl] ; 8A54D (22:654d) -> 7E
	scall SpriteFace ; 8A54E (22:654e) -> CD 95 40
	ld e, $02 ; 8A551 (22:6551) -> 1E 02
	ld hl, sp+$01 ; 8A553 (22:6553) -> F8 01
	ld a, [hl] ; 8A555 (22:6555) -> 7E
	scall SpriteFace ; 8A556 (22:6556) -> CD 95 40
	ld e, $03 ; 8A559 (22:6559) -> 1E 03
	ld hl, sp+$01 ; 8A55B (22:655b) -> F8 01
	ld a, [hl] ; 8A55D (22:655d) -> 7E
	scall SpriteFace ; 8A55E (22:655e) -> CD 95 40
	ld e, $00 ; 8A561 (22:6561) -> 1E 00
	ld hl, sp+$01 ; 8A563 (22:6563) -> F8 01
	ld a, [hl] ; 8A565 (22:6565) -> 7E
	scall SpriteFace ; 8A566 (22:6566) -> CD 95 40
	ld e, $01 ; 8A569 (22:6569) -> 1E 01
	ld hl, sp+$01 ; 8A56B (22:656b) -> F8 01
	ld a, [hl] ; 8A56D (22:656d) -> 7E
	scall SpriteFace ; 8A56E (22:656e) -> CD 95 40
	ld e, $02 ; 8A571 (22:6571) -> 1E 02
	ld hl, sp+$01 ; 8A573 (22:6573) -> F8 01
	ld a, [hl] ; 8A575 (22:6575) -> 7E
	scall SpriteFace ; 8A576 (22:6576) -> CD 95 40
	ld a, $0f ; 8A579 (22:6579) -> 3E 0F
	scall FadeOutAudio ; 8A57B (22:657b) -> CD F1 4F
	xor a ; 8A57E (22:657e) -> AF
	scall PlayMusic ; 8A57F (22:657f) -> CD E6 4E
	ld a, $01 ; 8A582 (22:6582) -> 3E 01
	scall FadeInAudio ; 8A584 (22:6584) -> CD 1A 50
	ld a, $09 ; 8A587 (22:6587) -> 3E 09
	scall PlayMusic ; 8A589 (22:6589) -> CD E6 4E
	ld hl, sp+$01 ; 8A58C (22:658c) -> F8 01
	ld a, [hl] ; 8A58E (22:658e) -> 7E
	scall FacePlayer ; 8A58F (22:658f) -> CD 4B 44
	ld e, $00 ; 8A592 (22:6592) -> 1E 00
	ld hl, sp+$01 ; 8A594 (22:6594) -> F8 01
	ld a, [hl] ; 8A596 (22:6596) -> 7E
	scall SetPersonVisibilityState ; 8A597 (22:6597) -> CD 3D 41
	jp .asm_8a5a3 ; 8A59A (22:659a) -> C3 A3 65
.asm_8a59d:
	ld hl, $015c ; 8A59D (22:659d) -> 21 5C 01
	scall PrintTextStandard ; 8A5A0 (22:65a0) -> CD 98 44
.asm_8a5a3:
	pop bc ; 8A5A3 (22:65a3) -> C1
	ret  ; 8A5A4 (22:65a4) -> C9

Func_8a5a5:
	ld a, e ; 8A5A5 (22:65a5) -> 7B
	or a ; 8A5A6 (22:65a6) -> B7
	jp nz, .asm_8a5bf ; 8A5A7 (22:65a7) -> C2 BF 65
	ld a, [wc790] ; 8A5AA (22:65aa) -> FA 90 C7
	or a ; 8A5AD (22:65ad) -> B7
	jp z, .asm_8a5b9 ; 8A5AE (22:65ae) -> CA B9 65
	ld a, [wc790] ; 8A5B1 (22:65b1) -> FA 90 C7
	cp $07 ; 8A5B4 (22:65b4) -> FE 07
	jp nz, .asm_8a5bf ; 8A5B6 (22:65b6) -> C2 BF 65
.asm_8a5b9:
	ld hl, $0396 ; 8A5B9 (22:65b9) -> 21 96 03
	scall PrintTextStandard ; 8A5BC (22:65bc) -> CD 98 44
.asm_8a5bf:
	ret  ; 8A5BF (22:65bf) -> C9

Data_8a5c0:
	db $01, $0a, $01, $01, $05, $1e, $01, $0a, $01, $0b, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $12, $0b, $2e, $0f, $04, $01, $01, $05, $20, $0f, $04, $0f, $05, $2e

Data_8a5e1:
	db $13, $13, $01, $01, $0f, $04

Func_8a5e7:
	ld hl, $0086 ; 8A5E7 (22:65e7) -> 21 86 00
	scall CheckEventFlag ; 8A5EA (22:65ea) -> CD 2E 46
	cp $01 ; 8A5ED (22:65ed) -> FE 01
	jp nz, .asm_8a606 ; 8A5EF (22:65ef) -> C2 06 66
	ld hl, Data_8a5e1 ; 8A5F2 (22:65f2) -> 21 E1 65
	scall Func_80d9b ; 8A5F5 (22:65f5) -> CD 9B 4D
	scall Func_80f02 ; 8A5F8 (22:65f8) -> CD 02 4F
	scall AllocateSpaceForWarps ; 8A5FB (22:65fb) -> CD 2B 40
	ld e, $03 ; 8A5FE (22:65fe) -> 1E 03
	ld hl, Data_8a5c0 ; 8A600 (22:6600) -> 21 C0 65
	scall LoadWarps ; 8A603 (22:6603) -> CD 3A 40
.asm_8a606:
	ret  ; 8A606 (22:6606) -> C9

Data_8a607:
	db $0d, $11, $01, $01, $05, $21, $0d, $11, $0e, $11, $2e, $0f, $04, $01, $01, $05, $1f, $0f, $04, $0e, $04, $2e

Data_8a61d:
IF DEF(SUN)
	db $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $08, $00
	db $00, $02, $14, $11, $6c, $0a, $0c, $03, $17, $17, $0a, $02, $06, $00
	db $00, $02, $14, $11, $14, $0d, $0f, $17, $09, $0f, $00, $02, $04, $00
	db $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $4c, $0c, $0e, $45, $01, $01, $01, $02, $08, $00
	db $00, $02, $14, $11, $74, $0a, $0c, $7f, $0c, $08, $00, $02, $06, $00
	db $00, $02, $14, $11, $35, $0d, $0f, $77, $17, $12, $11, $02, $04, $00
	db $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8a663:
	map_object $ff, $00, $0b, $02, $03, $03, $00, $04, $00, Func_8a724, 0
	map_object $01, $04, $08, $0b, $01, $01, $01, $04, $00, Func_8a779, 0
	map_object $01, $04, $01, $0b, $01, $01, $00, $04, $00, Func_8a801, 0
	map_object $0b, $0c, $0f, $04, $01, $01, $02, $04, $00, Func_8a892, 0

Func_8a69b:: ; 8a69b
	call Func_8a93c ; 8A69B (22:669b) -> CD 3C 69
	ld hl, Func_8a93c ; 8A69E (22:669e) -> 21 3C 69
	scall Func_80f11 ; 8A6A1 (22:66a1) -> CD 11 4F
	ld e, $02 ; 8A6A4 (22:66a4) -> 1E 02
	ld hl, Data_8a607 ; 8A6A6 (22:66a6) -> 21 07 66
	scall LoadWarps ; 8A6A9 (22:66a9) -> CD 3A 40
	ld a, $03 ; 8A6AC (22:66ac) -> 3E 03
	scall Func_80d01 ; 8A6AE (22:66ae) -> CD 01 4D
	ld e, $05 ; 8A6B1 (22:66b1) -> 1E 05
	ld hl, Data_8a61d ; 8A6B3 (22:66b3) -> 21 1D 66
	scall LoadEncounters ; 8A6B6 (22:66b6) -> CD 24 4D
	ld e, $04 ; 8A6B9 (22:66b9) -> 1E 04
	ld hl, Data_8a663 ; 8A6BB (22:66bb) -> 21 63 66
	scall LoadMapObjects ; 8A6BE (22:66be) -> CD FB 40
	ld a, [wc790] ; 8A6C1 (22:66c1) -> FA 90 C7
	or a ; 8A6C4 (22:66c4) -> B7
	jp z, .asm_8a6de ; 8A6C5 (22:66c5) -> CA DE 66
	ld a, [wc790] ; 8A6C8 (22:66c8) -> FA 90 C7
	cp $07 ; 8A6CB (22:66cb) -> FE 07
	jp nc, .asm_8a6de ; 8A6CD (22:66cd) -> D2 DE 66
	ld e, $00 ; 8A6D0 (22:66d0) -> 1E 00
	ld a, $01 ; 8A6D2 (22:66d2) -> 3E 01
	scall SetPersonVisibilityState ; 8A6D4 (22:66d4) -> CD 3D 41
	ld e, $00 ; 8A6D7 (22:66d7) -> 1E 00
	ld a, $02 ; 8A6D9 (22:66d9) -> 3E 02
	scall SetPersonVisibilityState ; 8A6DB (22:66db) -> CD 3D 41
.asm_8a6de:
	ld a, $09 ; 8A6DE (22:66de) -> 3E 09
	scall PlayMusic ; 8A6E0 (22:66e0) -> CD E6 4E
	ld a, $03 ; 8A6E3 (22:66e3) -> 3E 03
	ld [wc7e2], a ; 8A6E5 (22:66e5) -> EA E2 C7
	ld hl, $0086 ; 8A6E8 (22:66e8) -> 21 86 00
	scall CheckEventFlag ; 8A6EB (22:66eb) -> CD 2E 46
	cp $01 ; 8A6EE (22:66ee) -> FE 01
	jp nz, .asm_8a71a ; 8A6F0 (22:66f0) -> C2 1A 67
	ld hl, $0107 ; 8A6F3 (22:66f3) -> 21 07 01
	scall CheckEventFlag ; 8A6F6 (22:66f6) -> CD 2E 46
	cp $01 ; 8A6F9 (22:66f9) -> FE 01
	jp nz, .asm_8a70a ; 8A6FB (22:66fb) -> C2 0A 67
	ld c, $03 ; 8A6FE (22:66fe) -> 0E 03
	ld e, $0e ; 8A700 (22:6700) -> 1E 0E
	ld a, $03 ; 8A702 (22:6702) -> 3E 03
	scall Func_80080 ; 8A704 (22:6704) -> CD 80 40
	jp .asm_8a71a ; 8A707 (22:6707) -> C3 1A 67
.asm_8a70a:
	ld c, $05 ; 8A70A (22:670a) -> 0E 05
	ld e, $10 ; 8A70C (22:670c) -> 1E 10
	ld a, $03 ; 8A70E (22:670e) -> 3E 03
	scall Func_80080 ; 8A710 (22:6710) -> CD 80 40
	ld e, $03 ; 8A713 (22:6713) -> 1E 03
	ld a, $03 ; 8A715 (22:6715) -> 3E 03
	scall SpriteFace ; 8A717 (22:6717) -> CD 95 40
.asm_8a71a:
	scall Func_8001c ; 8A71A (22:671a) -> CD 1C 40
	ld hl, $02de ; 8A71D (22:671d) -> 21 DE 02
	scall LandmarkSign ; 8A720 (22:6720) -> CD 72 4F
	ret  ; 8A723 (22:6723) -> C9

Func_8a724:
	ld a, e ; 8A724 (22:6724) -> 7B
	or a ; 8A725 (22:6725) -> B7
	jp nz, .asm_8a74f ; 8A726 (22:6726) -> C2 4F 67
	scall RepairRobots ; 8A729 (22:6729) -> CD E0 42
	xor a ; 8A72C (22:672c) -> AF
	scall PlayMusic ; 8A72D (22:672d) -> CD E6 4E
	ld a, $16 ; 8A730 (22:6730) -> 3E 16
	scall PlayMusic ; 8A732 (22:6732) -> CD E6 4E
	ld c, $01 ; 8A735 (22:6735) -> 0E 01
	ld e, $02 ; 8A737 (22:6737) -> 1E 02
	ld a, $08 ; 8A739 (22:6739) -> 3E 08
	scall LoadEmote ; 8A73B (22:673b) -> CD 76 41
	scall WaitEmote ; 8A73E (22:673e) -> CD D5 41
	scall HideEmote ; 8A741 (22:6741) -> CD 8B 41
	ld hl, $0322 ; 8A744 (22:6744) -> 21 22 03
	scall PrintTextStandard ; 8A747 (22:6747) -> CD 98 44
	ld a, $09 ; 8A74A (22:674a) -> 3E 09
	scall PlayMusic ; 8A74C (22:674c) -> CD E6 4E
.asm_8a74f:
	ret  ; 8A74F (22:674f) -> C9

Data_8a750:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $6b, $01, $6b, $03, $0f, $17, $17, $0a, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a779:
	push af ; 8A779 (22:6779) -> F5
	ld a, e ; 8A77A (22:677a) -> 7B
	or a ; 8A77B (22:677b) -> B7
	jp nz, .asm_8a7cf ; 8A77C (22:677c) -> C2 CF 67
	ld hl, sp+$01 ; 8A77F (22:677f) -> F8 01
	ld a, [hl] ; 8A781 (22:6781) -> 7E
	scall FacePlayer ; 8A782 (22:6782) -> CD 4B 44
	ld hl, $007e ; 8A785 (22:6785) -> 21 7E 00
	scall CheckEventFlag ; 8A788 (22:6788) -> CD 2E 46
	or a ; 8A78B (22:678b) -> B7
	jp nz, .asm_8a7c9 ; 8A78C (22:678c) -> C2 C9 67
	ld hl, $0230 ; 8A78F (22:678f) -> 21 30 02
	scall PrintTextStandard ; 8A792 (22:6792) -> CD 98 44
	ld hl, $032c ; 8A795 (22:6795) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A798 (22:6798) -> CD BA 44
	or a ; 8A79B (22:679b) -> B7
	jp nz, .asm_8a7c0 ; 8A79C (22:679c) -> C2 C0 67
	ld de, Data_8a7d1 ; 8A79F (22:679f) -> 11 D1 67
	ld hl, Data_8a750 ; 8A7A2 (22:67a2) -> 21 50 67
	scall ScriptedBattle ; 8A7A5 (22:67a5) -> CD D3 4D
	or a ; 8A7A8 (22:67a8) -> B7
	jp nz, .asm_8a7af ; 8A7A9 (22:67a9) -> C2 AF 67
	jp .asm_8a7cf ; 8A7AC (22:67ac) -> C3 CF 67
.asm_8a7af:
	ld e, $01 ; 8A7AF (22:67af) -> 1E 01
	ld hl, $007e ; 8A7B1 (22:67b1) -> 21 7E 00
	scall EventFlagAction ; 8A7B4 (22:67b4) -> CD 1B 46
	ld hl, $0231 ; 8A7B7 (22:67b7) -> 21 31 02
	scall PrintTextStandard ; 8A7BA (22:67ba) -> CD 98 44
	jp .asm_8a7c6 ; 8A7BD (22:67bd) -> C3 C6 67
.asm_8a7c0:
	ld hl, $022e ; 8A7C0 (22:67c0) -> 21 2E 02
	scall PrintTextStandard ; 8A7C3 (22:67c3) -> CD 98 44
.asm_8a7c6:
	jp .asm_8a7cf ; 8A7C6 (22:67c6) -> C3 CF 67
.asm_8a7c9:
	ld hl, $022d ; 8A7C9 (22:67c9) -> 21 2D 02
	scall PrintTextStandard ; 8A7CC (22:67cc) -> CD 98 44
.asm_8a7cf:
	pop bc ; 8A7CF (22:67cf) -> C1
	ret  ; 8A7D0 (22:67d0) -> C9

Data_8a7d1:
	dstr "ウﾞォーカル"

Data_8a7d8:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a801:
	push af ; 8A801 (22:6801) -> F5
	ld a, e ; 8A802 (22:6802) -> 7B
	or a ; 8A803 (22:6803) -> B7
	jp nz, .asm_8a857 ; 8A804 (22:6804) -> C2 57 68
	ld hl, sp+$01 ; 8A807 (22:6807) -> F8 01
	ld a, [hl] ; 8A809 (22:6809) -> 7E
	scall FacePlayer ; 8A80A (22:680a) -> CD 4B 44
	ld hl, $007f ; 8A80D (22:680d) -> 21 7F 00
	scall CheckEventFlag ; 8A810 (22:6810) -> CD 2E 46
	or a ; 8A813 (22:6813) -> B7
	jp nz, .asm_8a851 ; 8A814 (22:6814) -> C2 51 68
	ld hl, $022e ; 8A817 (22:6817) -> 21 2E 02
	scall PrintTextStandard ; 8A81A (22:681a) -> CD 98 44
	ld hl, $032c ; 8A81D (22:681d) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A820 (22:6820) -> CD BA 44
	or a ; 8A823 (22:6823) -> B7
	jp nz, .asm_8a848 ; 8A824 (22:6824) -> C2 48 68
	ld de, Data_8a859 ; 8A827 (22:6827) -> 11 59 68
	ld hl, Data_8a7d8 ; 8A82A (22:682a) -> 21 D8 67
	scall ScriptedBattle ; 8A82D (22:682d) -> CD D3 4D
	or a ; 8A830 (22:6830) -> B7
	jp nz, .asm_8a837 ; 8A831 (22:6831) -> C2 37 68
	jp .asm_8a857 ; 8A834 (22:6834) -> C3 57 68
.asm_8a837:
	ld e, $01 ; 8A837 (22:6837) -> 1E 01
	ld hl, $007f ; 8A839 (22:6839) -> 21 7F 00
	scall EventFlagAction ; 8A83C (22:683c) -> CD 1B 46
	ld hl, $022c ; 8A83F (22:683f) -> 21 2C 02
	scall PrintTextStandard ; 8A842 (22:6842) -> CD 98 44
	jp .asm_8a84e ; 8A845 (22:6845) -> C3 4E 68
.asm_8a848:
	ld hl, $0232 ; 8A848 (22:6848) -> 21 32 02
	scall PrintTextStandard ; 8A84B (22:684b) -> CD 98 44
.asm_8a84e:
	jp .asm_8a857 ; 8A84E (22:684e) -> C3 57 68
.asm_8a851:
	ld hl, $022f ; 8A851 (22:6851) -> 21 2F 02
	scall PrintTextStandard ; 8A854 (22:6854) -> CD 98 44
.asm_8a857:
	pop bc ; 8A857 (22:6857) -> C1
	ret  ; 8A858 (22:6858) -> C9

Data_8a859:
	dstr "コキﾞャル"

Data_8a85f:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8a888:
	db $0e, $03, $ff, $ff

Data_8a88c:
	db $0f, $05, $10, $05, $ff, $ff

Func_8a892:
	push af ; 8A892 (22:6892) -> F5
	ld a, e ; 8A893 (22:6893) -> 7B
	or a ; 8A894 (22:6894) -> B7
	jp nz, .asm_8a92e ; 8A895 (22:6895) -> C2 2E 69
	ld hl, sp+$01 ; 8A898 (22:6898) -> F8 01
	ld a, [hl] ; 8A89A (22:689a) -> 7E
	scall FacePlayer ; 8A89B (22:689b) -> CD 4B 44
	ld hl, $0086 ; 8A89E (22:689e) -> 21 86 00
	scall CheckEventFlag ; 8A8A1 (22:68a1) -> CD 2E 46
	or a ; 8A8A4 (22:68a4) -> B7
	jp nz, .asm_8a915 ; 8A8A5 (22:68a5) -> C2 15 69
	ld hl, $0426 ; 8A8A8 (22:68a8) -> 21 26 04
	scall PrintTextStandard ; 8A8AB (22:68ab) -> CD 98 44
	ld hl, $032c ; 8A8AE (22:68ae) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 8A8B1 (22:68b1) -> CD BA 44
	or a ; 8A8B4 (22:68b4) -> B7
	jp nz, .asm_8a90c ; 8A8B5 (22:68b5) -> C2 0C 69
	ld de, Data_8a930 ; 8A8B8 (22:68b8) -> 11 30 69
	ld hl, Data_8a85f ; 8A8BB (22:68bb) -> 21 5F 68
	scall ScriptedBattle ; 8A8BE (22:68be) -> CD D3 4D
	or a ; 8A8C1 (22:68c1) -> B7
	jp nz, .asm_8a8c8 ; 8A8C2 (22:68c2) -> C2 C8 68
	jp .asm_8a92e ; 8A8C5 (22:68c5) -> C3 2E 69
.asm_8a8c8:
	ld hl, $043b ; 8A8C8 (22:68c8) -> 21 3B 04
	scall PrintTextStandard ; 8A8CB (22:68cb) -> CD 98 44
	ld a, [wPlayerFacing] ; 8A8CE (22:68ce) -> FA 38 C8
	or a ; 8A8D1 (22:68d1) -> B7
	jp nz, .asm_8a8eb ; 8A8D2 (22:68d2) -> C2 EB 68
	ld bc, Data_8a888 ; 8A8D5 (22:68d5) -> 01 88 68
	ld e, $22 ; 8A8D8 (22:68d8) -> 1E 22
	ld hl, sp+$01 ; 8A8DA (22:68da) -> F8 01
	ld a, [hl] ; 8A8DC (22:68dc) -> 7E
	scall MovePersonAndWait ; 8A8DD (22:68dd) -> CD 88 46
	ld e, $01 ; 8A8E0 (22:68e0) -> 1E 01
	ld hl, $0107 ; 8A8E2 (22:68e2) -> 21 07 01
	scall EventFlagAction ; 8A8E5 (22:68e5) -> CD 1B 46
	jp .asm_8a8f6 ; 8A8E8 (22:68e8) -> C3 F6 68
.asm_8a8eb:
	ld bc, Data_8a88c ; 8A8EB (22:68eb) -> 01 8C 68
	ld e, $22 ; 8A8EE (22:68ee) -> 1E 22
	ld hl, sp+$01 ; 8A8F0 (22:68f0) -> F8 01
	ld a, [hl] ; 8A8F2 (22:68f2) -> 7E
	scall MovePersonAndWait ; 8A8F3 (22:68f3) -> CD 88 46
.asm_8a8f6:
	scall WaitNPCStep ; 8A8F6 (22:68f6) -> CD 0C 42
	ld e, $02 ; 8A8F9 (22:68f9) -> 1E 02
	ld hl, sp+$01 ; 8A8FB (22:68fb) -> F8 01
	ld a, [hl] ; 8A8FD (22:68fd) -> 7E
	scall SpriteFace ; 8A8FE (22:68fe) -> CD 95 40
	ld e, $01 ; 8A901 (22:6901) -> 1E 01
	ld hl, $0086 ; 8A903 (22:6903) -> 21 86 00
	scall EventFlagAction ; 8A906 (22:6906) -> CD 1B 46
	jp .asm_8a912 ; 8A909 (22:6909) -> C3 12 69
.asm_8a90c:
	ld hl, $0437 ; 8A90C (22:690c) -> 21 37 04
	scall PrintTextStandard ; 8A90F (22:690f) -> CD 98 44
.asm_8a912:
	jp .asm_8a92e ; 8A912 (22:6912) -> C3 2E 69
.asm_8a915:
	ld hl, $001f ; 8A915 (22:6915) -> 21 1F 00
	scall CheckEventFlag ; 8A918 (22:6918) -> CD 2E 46
	or a ; 8A91B (22:691b) -> B7
	jp nz, .asm_8a928 ; 8A91C (22:691c) -> C2 28 69
	ld hl, $043b ; 8A91F (22:691f) -> 21 3B 04
	scall PrintTextStandard ; 8A922 (22:6922) -> CD 98 44
	jp .asm_8a92e ; 8A925 (22:6925) -> C3 2E 69
.asm_8a928:
	ld hl, $010f ; 8A928 (22:6928) -> 21 0F 01
	scall PrintTextStandard ; 8A92B (22:692b) -> CD 98 44
.asm_8a92e:
	pop bc ; 8A92E (22:692e) -> C1
	ret  ; 8A92F (22:692f) -> C9

Data_8a930:
	dstr "ソﾞッキー"

Data_8a936:
	db $13, $13, $01, $01, $0f, $04

Func_8a93c:
	ld hl, Data_8a936 ; 8A93C (22:693c) -> 21 36 69
	scall Func_80d9b ; 8A93F (22:693f) -> CD 9B 4D
	scall Func_80f02 ; 8A942 (22:6942) -> CD 02 4F
	ret  ; 8A945 (22:6945) -> C9

Data_8a946:
	db $0d, $04, $01, $01, $05, $22, $0d, $04, $0c, $04, $2e, $0d, $11, $01, $01, $05, $20, $0d, $11, $0c, $11, $2e

Data_8a95c:
	db $25, $10, $09, $03, $1b

Data_8a961:
IF DEF(SUN)
	db $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $08, $00
	db $00, $02, $14, $11, $6c, $0a, $0c, $03, $17, $17, $0a, $02, $06, $00
	db $00, $02, $14, $11, $14, $0d, $0f, $17, $09, $0f, $00, $02, $04, $00
	db $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $4c, $0c, $0e, $45, $01, $01, $01, $02, $08, $00
	db $00, $02, $14, $11, $74, $0a, $0c, $7f, $0c, $08, $00, $02, $06, $00
	db $00, $02, $14, $11, $35, $0d, $0f, $77, $17, $12, $11, $02, $04, $00
	db $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8a9a7:
	map_object $01, $0c, $08, $0a, $01, $01, $02, $04, $00, Func_8aad8, 0
	map_object $ff, $00, $09, $0a, $03, $01, $00, $04, $01, Func_8aae9, 0
	map_object $01, $0c, $09, $09, $01, $01, $02, $04, $00, Func_8abbf, 0
	map_object $ff, $00, $08, $09, $01, $01, $00, $04, $01, Func_8abcc, 0
	map_object $ff, $00, $0a, $09, $02, $01, $00, $04, $01, Func_8abcc, 0
	map_object $01, $0c, $0a, $08, $01, $01, $02, $04, $00, Func_8acb3, 0
	map_object $ff, $00, $08, $08, $02, $01, $00, $04, $01, Func_8acc0, 0
	map_object $ff, $00, $0b, $08, $01, $01, $00, $04, $01, Func_8acc0, 0
	map_object $01, $0c, $0b, $07, $01, $01, $02, $04, $00, Func_8adb3, 0
	map_object $ff, $00, $08, $07, $03, $01, $00, $04, $01, Func_8adc4, 0

Func_8aa33:: ; 8aa33
	ld e, $02 ; 8AA33 (22:6a33) -> 1E 02
	ld hl, Data_8a946 ; 8AA35 (22:6a35) -> 21 46 69
	scall LoadWarps ; 8AA38 (22:6a38) -> CD 3A 40
	ld e, $01 ; 8AA3B (22:6a3b) -> 1E 01
	ld hl, Data_8a95c ; 8AA3D (22:6a3d) -> 21 5C 69
	scall Func_80ce7 ; 8AA40 (22:6a40) -> CD E7 4C
	ld a, $03 ; 8AA43 (22:6a43) -> 3E 03
	scall Func_80d01 ; 8AA45 (22:6a45) -> CD 01 4D
	ld e, $05 ; 8AA48 (22:6a48) -> 1E 05
	ld hl, Data_8a961 ; 8AA4A (22:6a4a) -> 21 61 69
	scall LoadEncounters ; 8AA4D (22:6a4d) -> CD 24 4D
	ld e, $0a ; 8AA50 (22:6a50) -> 1E 0A
	ld hl, Data_8a9a7 ; 8AA52 (22:6a52) -> 21 A7 69
	scall LoadMapObjects ; 8AA55 (22:6a55) -> CD FB 40
	ld hl, $0080 ; 8AA58 (22:6a58) -> 21 80 00
	scall CheckEventFlag ; 8AA5B (22:6a5b) -> CD 2E 46
	cp $01 ; 8AA5E (22:6a5e) -> FE 01
	jp nz, .asm_8aa70 ; 8AA60 (22:6a60) -> C2 70 6A
	ld e, $00 ; 8AA63 (22:6a63) -> 1E 00
	xor a ; 8AA65 (22:6a65) -> AF
	scall SetPersonVisibilityState ; 8AA66 (22:6a66) -> CD 3D 41
	ld e, $00 ; 8AA69 (22:6a69) -> 1E 00
	ld a, $01 ; 8AA6B (22:6a6b) -> 3E 01
	scall SetPersonVisibilityState ; 8AA6D (22:6a6d) -> CD 3D 41
.asm_8aa70:
	ld hl, $0081 ; 8AA70 (22:6a70) -> 21 81 00
	scall CheckEventFlag ; 8AA73 (22:6a73) -> CD 2E 46
	cp $01 ; 8AA76 (22:6a76) -> FE 01
	jp nz, .asm_8aa90 ; 8AA78 (22:6a78) -> C2 90 6A
	ld e, $00 ; 8AA7B (22:6a7b) -> 1E 00
	ld a, $02 ; 8AA7D (22:6a7d) -> 3E 02
	scall SetPersonVisibilityState ; 8AA7F (22:6a7f) -> CD 3D 41
	ld e, $00 ; 8AA82 (22:6a82) -> 1E 00
	ld a, $03 ; 8AA84 (22:6a84) -> 3E 03
	scall SetPersonVisibilityState ; 8AA86 (22:6a86) -> CD 3D 41
	ld e, $00 ; 8AA89 (22:6a89) -> 1E 00
	ld a, $04 ; 8AA8B (22:6a8b) -> 3E 04
	scall SetPersonVisibilityState ; 8AA8D (22:6a8d) -> CD 3D 41
.asm_8aa90:
	ld hl, $0082 ; 8AA90 (22:6a90) -> 21 82 00
	scall CheckEventFlag ; 8AA93 (22:6a93) -> CD 2E 46
	cp $01 ; 8AA96 (22:6a96) -> FE 01
	jp nz, .asm_8aab0 ; 8AA98 (22:6a98) -> C2 B0 6A
	ld e, $00 ; 8AA9B (22:6a9b) -> 1E 00
	ld a, $05 ; 8AA9D (22:6a9d) -> 3E 05
	scall SetPersonVisibilityState ; 8AA9F (22:6a9f) -> CD 3D 41
	ld e, $00 ; 8AAA2 (22:6aa2) -> 1E 00
	ld a, $06 ; 8AAA4 (22:6aa4) -> 3E 06
	scall SetPersonVisibilityState ; 8AAA6 (22:6aa6) -> CD 3D 41
	ld e, $00 ; 8AAA9 (22:6aa9) -> 1E 00
	ld a, $07 ; 8AAAB (22:6aab) -> 3E 07
	scall SetPersonVisibilityState ; 8AAAD (22:6aad) -> CD 3D 41
.asm_8aab0:
	ld hl, $0083 ; 8AAB0 (22:6ab0) -> 21 83 00
	scall CheckEventFlag ; 8AAB3 (22:6ab3) -> CD 2E 46
	cp $01 ; 8AAB6 (22:6ab6) -> FE 01
	jp nz, .asm_8aac9 ; 8AAB8 (22:6ab8) -> C2 C9 6A
	ld e, $00 ; 8AABB (22:6abb) -> 1E 00
	ld a, $08 ; 8AABD (22:6abd) -> 3E 08
	scall SetPersonVisibilityState ; 8AABF (22:6abf) -> CD 3D 41
	ld e, $00 ; 8AAC2 (22:6ac2) -> 1E 00
	ld a, $09 ; 8AAC4 (22:6ac4) -> 3E 09
	scall SetPersonVisibilityState ; 8AAC6 (22:6ac6) -> CD 3D 41
.asm_8aac9:
	ld a, $09 ; 8AAC9 (22:6ac9) -> 3E 09
	scall PlayMusic ; 8AACB (22:6acb) -> CD E6 4E
	scall Func_8001c ; 8AACE (22:6ace) -> CD 1C 40
	ld hl, $02df ; 8AAD1 (22:6ad1) -> 21 DF 02
	scall LandmarkSign ; 8AAD4 (22:6ad4) -> CD 72 4F
	ret  ; 8AAD7 (22:6ad7) -> C9

Func_8aad8:
	ld a, e ; 8AAD8 (22:6ad8) -> 7B
	or a ; 8AAD9 (22:6ad9) -> B7
	jp nz, .asm_8aae0 ; 8AADA (22:6ada) -> C2 E0 6A
	call Func_8ab66 ; 8AADD (22:6add) -> CD 66 6B
.asm_8aae0:
	ret  ; 8AAE0 (22:6ae0) -> C9

Data_8aae1:
	db $09, $0a, $ff, $ff

Data_8aae5:
	db $0a, $0a, $ff, $ff

Func_8aae9:
	ld a, e ; 8AAE9 (22:6ae9) -> 7B
	cp $02 ; 8AAEA (22:6aea) -> FE 02
	jp nz, .asm_8ab38 ; 8AAEC (22:6aec) -> C2 38 6B
	xor a ; 8AAEF (22:6aef) -> AF
	scall PlayMusic ; 8AAF0 (22:6af0) -> CD E6 4E
	ld a, $1a ; 8AAF3 (22:6af3) -> 3E 1A
	scall PlayMusic ; 8AAF5 (22:6af5) -> CD E6 4E
	ld a, [wMapX] ; 8AAF8 (22:6af8) -> FA D8 C2
	add a, $05 ; 8AAFB (22:6afb) -> C6 05
	cp $0b ; 8AAFD (22:6afd) -> FE 0B
	jp z, .asm_8ab24 ; 8AAFF (22:6aff) -> CA 24 6B
	cp $0a ; 8AB02 (22:6b02) -> FE 0A
	jp z, .asm_8ab15 ; 8AB04 (22:6b04) -> CA 15 6B
	cp $09 ; 8AB07 (22:6b07) -> FE 09
	jp nz, .asm_8ab30 ; 8AB09 (22:6b09) -> C2 30 6B
	ld e, $01 ; 8AB0C (22:6b0c) -> 1E 01
	xor a ; 8AB0E (22:6b0e) -> AF
	scall SpriteFace ; 8AB0F (22:6b0f) -> CD 95 40
	jp .asm_8ab30 ; 8AB12 (22:6b12) -> C3 30 6B
.asm_8ab15:
	ld bc, Data_8aae1 ; 8AB15 (22:6b15) -> 01 E1 6A
	ld e, $22 ; 8AB18 (22:6b18) -> 1E 22
	xor a ; 8AB1A (22:6b1a) -> AF
	scall MovePersonAndWait ; 8AB1B (22:6b1b) -> CD 88 46
	scall WaitNPCStep ; 8AB1E (22:6b1e) -> CD 0C 42
	jp .asm_8ab30 ; 8AB21 (22:6b21) -> C3 30 6B
.asm_8ab24:
	ld bc, Data_8aae5 ; 8AB24 (22:6b24) -> 01 E5 6A
	ld e, $22 ; 8AB27 (22:6b27) -> 1E 22
	xor a ; 8AB29 (22:6b29) -> AF
	scall MovePersonAndWait ; 8AB2A (22:6b2a) -> CD 88 46
	scall WaitNPCStep ; 8AB2D (22:6b2d) -> CD 0C 42
.asm_8ab30:
	ld a, $03 ; 8AB30 (22:6b30) -> 3E 03
	scall PlayerFace ; 8AB32 (22:6b32) -> CD 77 46
	call Func_8ab66 ; 8AB35 (22:6b35) -> CD 66 6B
.asm_8ab38:
	ret  ; 8AB38 (22:6b38) -> C9

Data_8ab39:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $17, $01, $10, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ab62:
	db $08, $05, $ff, $ff

Func_8ab66:
	ld hl, $022f ; 8AB66 (22:6b66) -> 21 2F 02
	scall PrintTextStandard ; 8AB69 (22:6b69) -> CD 98 44
	ld hl, $017a ; 8AB6C (22:6b6c) -> 21 7A 01
	scall PrintTextStandard ; 8AB6F (22:6b6f) -> CD 98 44
.asm_8ab72:
	ld de, Data_8abb9 ; 8AB72 (22:6b72) -> 11 B9 6B
	ld hl, Data_8ab39 ; 8AB75 (22:6b75) -> 21 39 6B
	scall Func_802ef ; 8AB78 (22:6b78) -> CD EF 42
	or a ; 8AB7B (22:6b7b) -> B7
	jp nz, .asm_8ab88 ; 8AB7C (22:6b7c) -> C2 88 6B
	ld a, [wc7c4] ; 8AB7F (22:6b7f) -> FA C4 C7
	cp $01 ; 8AB82 (22:6b82) -> FE 01
	jp nz, .asm_8ab72 ; 8AB84 (22:6b84) -> C2 72 6B
	ret  ; 8AB87 (22:6b87) -> C9
.asm_8ab88:
	ld hl, $022f ; 8AB88 (22:6b88) -> 21 2F 02
	scall PrintTextStandard ; 8AB8B (22:6b8b) -> CD 98 44
	ld bc, Data_8ab62 ; 8AB8E (22:6b8e) -> 01 62 6B
	ld e, $22 ; 8AB91 (22:6b91) -> 1E 22
	xor a ; 8AB93 (22:6b93) -> AF
	scall MovePersonAndWait ; 8AB94 (22:6b94) -> CD 88 46
	scall WaitNPCStep ; 8AB97 (22:6b97) -> CD 0C 42
	ld e, $00 ; 8AB9A (22:6b9a) -> 1E 00
	xor a ; 8AB9C (22:6b9c) -> AF
	scall SetPersonVisibilityState ; 8AB9D (22:6b9d) -> CD 3D 41
	ld e, $00 ; 8ABA0 (22:6ba0) -> 1E 00
	ld a, $01 ; 8ABA2 (22:6ba2) -> 3E 01
	scall SetPersonVisibilityState ; 8ABA4 (22:6ba4) -> CD 3D 41
	ld e, $01 ; 8ABA7 (22:6ba7) -> 1E 01
	ld hl, $0080 ; 8ABA9 (22:6ba9) -> 21 80 00
	scall EventFlagAction ; 8ABAC (22:6bac) -> CD 1B 46
	xor a ; 8ABAF (22:6baf) -> AF
	scall PlayMusic ; 8ABB0 (22:6bb0) -> CD E6 4E
	ld a, $09 ; 8ABB3 (22:6bb3) -> 3E 09
	scall PlayMusic ; 8ABB5 (22:6bb5) -> CD E6 4E
	ret  ; 8ABB8 (22:6bb8) -> C9

Data_8abb9:
	dstr "コキﾞャル"

Func_8abbf:
	ld a, e ; 8ABBF (22:6bbf) -> 7B
	or a ; 8ABC0 (22:6bc0) -> B7
	jp nz, .asm_8abc7 ; 8ABC1 (22:6bc1) -> C2 C7 6B
	call Func_8ac50 ; 8ABC4 (22:6bc4) -> CD 50 6C
.asm_8abc7:
	ret  ; 8ABC7 (22:6bc7) -> C9

Data_8abc8:
	db $0a, $09, $ff, $ff

Func_8abcc:
	ld a, e ; 8ABCC (22:6bcc) -> 7B
	cp $02 ; 8ABCD (22:6bcd) -> FE 02
	jp nz, .asm_8ac22 ; 8ABCF (22:6bcf) -> C2 22 6C
	xor a ; 8ABD2 (22:6bd2) -> AF
	scall PlayMusic ; 8ABD3 (22:6bd3) -> CD E6 4E
	ld a, $1a ; 8ABD6 (22:6bd6) -> 3E 1A
	scall PlayMusic ; 8ABD8 (22:6bd8) -> CD E6 4E
	ld a, [wMapX] ; 8ABDB (22:6bdb) -> FA D8 C2
	add a, $05 ; 8ABDE (22:6bde) -> C6 05
	cp $0b ; 8ABE0 (22:6be0) -> FE 0B
	jp z, .asm_8ac0d ; 8ABE2 (22:6be2) -> CA 0D 6C
	cp $0a ; 8ABE5 (22:6be5) -> FE 0A
	jp z, .asm_8abfe ; 8ABE7 (22:6be7) -> CA FE 6B
	cp $08 ; 8ABEA (22:6bea) -> FE 08
	jp nz, .asm_8ac1f ; 8ABEC (22:6bec) -> C2 1F 6C
	ld e, $03 ; 8ABEF (22:6bef) -> 1E 03
	ld a, $02 ; 8ABF1 (22:6bf1) -> 3E 02
	scall SpriteFace ; 8ABF3 (22:6bf3) -> CD 95 40
	ld a, $01 ; 8ABF6 (22:6bf6) -> 3E 01
	scall PlayerFace ; 8ABF8 (22:6bf8) -> CD 77 46
	jp .asm_8ac1f ; 8ABFB (22:6bfb) -> C3 1F 6C
.asm_8abfe:
	ld e, $01 ; 8ABFE (22:6bfe) -> 1E 01
	ld a, $02 ; 8AC00 (22:6c00) -> 3E 02
	scall SpriteFace ; 8AC02 (22:6c02) -> CD 95 40
	ld a, $03 ; 8AC05 (22:6c05) -> 3E 03
	scall PlayerFace ; 8AC07 (22:6c07) -> CD 77 46
	jp .asm_8ac1f ; 8AC0A (22:6c0a) -> C3 1F 6C
.asm_8ac0d:
	ld bc, Data_8abc8 ; 8AC0D (22:6c0d) -> 01 C8 6B
	ld e, $22 ; 8AC10 (22:6c10) -> 1E 22
	ld a, $02 ; 8AC12 (22:6c12) -> 3E 02
	scall MovePersonAndWait ; 8AC14 (22:6c14) -> CD 88 46
	scall WaitNPCStep ; 8AC17 (22:6c17) -> CD 0C 42
	ld a, $03 ; 8AC1A (22:6c1a) -> 3E 03
	scall PlayerFace ; 8AC1C (22:6c1c) -> CD 77 46
.asm_8ac1f:
	call Func_8ac50 ; 8AC1F (22:6c1f) -> CD 50 6C
.asm_8ac22:
	ret  ; 8AC22 (22:6c22) -> C9

Data_8ac23:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $0e, $01, $10, $04, $17, $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ac4c:
	db $09, $04, $ff, $ff

Func_8ac50:
	ld hl, $022d ; 8AC50 (22:6c50) -> 21 2D 02
	scall PrintTextStandard ; 8AC53 (22:6c53) -> CD 98 44
	ld hl, $017a ; 8AC56 (22:6c56) -> 21 7A 01
	scall PrintTextStandard ; 8AC59 (22:6c59) -> CD 98 44
.asm_8ac5c:
	ld de, Data_8acac ; 8AC5C (22:6c5c) -> 11 AC 6C
	ld hl, Data_8ac23 ; 8AC5F (22:6c5f) -> 21 23 6C
	scall Func_802ef ; 8AC62 (22:6c62) -> CD EF 42
	or a ; 8AC65 (22:6c65) -> B7
	jp nz, .asm_8ac72 ; 8AC66 (22:6c66) -> C2 72 6C
	ld a, [wc7c4] ; 8AC69 (22:6c69) -> FA C4 C7
	cp $01 ; 8AC6C (22:6c6c) -> FE 01
	jp nz, .asm_8ac5c ; 8AC6E (22:6c6e) -> C2 5C 6C
	ret  ; 8AC71 (22:6c71) -> C9
.asm_8ac72:
	ld hl, $022d ; 8AC72 (22:6c72) -> 21 2D 02
	scall PrintTextStandard ; 8AC75 (22:6c75) -> CD 98 44
	ld bc, Data_8ac4c ; 8AC78 (22:6c78) -> 01 4C 6C
	ld e, $22 ; 8AC7B (22:6c7b) -> 1E 22
	ld a, $02 ; 8AC7D (22:6c7d) -> 3E 02
	scall MovePersonAndWait ; 8AC7F (22:6c7f) -> CD 88 46
	scall WaitNPCStep ; 8AC82 (22:6c82) -> CD 0C 42
	ld e, $00 ; 8AC85 (22:6c85) -> 1E 00
	ld a, $02 ; 8AC87 (22:6c87) -> 3E 02
	scall SetPersonVisibilityState ; 8AC89 (22:6c89) -> CD 3D 41
	ld e, $00 ; 8AC8C (22:6c8c) -> 1E 00
	ld a, $03 ; 8AC8E (22:6c8e) -> 3E 03
	scall SetPersonVisibilityState ; 8AC90 (22:6c90) -> CD 3D 41
	ld e, $00 ; 8AC93 (22:6c93) -> 1E 00
	ld a, $04 ; 8AC95 (22:6c95) -> 3E 04
	scall SetPersonVisibilityState ; 8AC97 (22:6c97) -> CD 3D 41
	xor a ; 8AC9A (22:6c9a) -> AF
	scall PlayMusic ; 8AC9B (22:6c9b) -> CD E6 4E
	ld a, $09 ; 8AC9E (22:6c9e) -> 3E 09
	scall PlayMusic ; 8ACA0 (22:6ca0) -> CD E6 4E
	ld e, $01 ; 8ACA3 (22:6ca3) -> 1E 01
	ld hl, $0081 ; 8ACA5 (22:6ca5) -> 21 81 00
	scall EventFlagAction ; 8ACA8 (22:6ca8) -> CD 1B 46
	ret  ; 8ACAB (22:6cab) -> C9

Data_8acac:
	dstr "ウﾞォーカル"

Func_8acb3:
	ld a, e ; 8ACB3 (22:6cb3) -> 7B
	or a ; 8ACB4 (22:6cb4) -> B7
	jp nz, .asm_8acbb ; 8ACB5 (22:6cb5) -> C2 BB 6C
	call Func_8ad46 ; 8ACB8 (22:6cb8) -> CD 46 6D
.asm_8acbb:
	ret  ; 8ACBB (22:6cbb) -> C9

Data_8acbc:
	db $09, $08, $ff, $ff

Func_8acc0:
	ld a, e ; 8ACC0 (22:6cc0) -> 7B
	cp $02 ; 8ACC1 (22:6cc1) -> FE 02
	jp nz, .asm_8ad16 ; 8ACC3 (22:6cc3) -> C2 16 6D
	xor a ; 8ACC6 (22:6cc6) -> AF
	scall PlayMusic ; 8ACC7 (22:6cc7) -> CD E6 4E
	ld a, $1a ; 8ACCA (22:6cca) -> 3E 1A
	scall PlayMusic ; 8ACCC (22:6ccc) -> CD E6 4E
	ld a, [wMapX] ; 8ACCF (22:6ccf) -> FA D8 C2
	add a, $05 ; 8ACD2 (22:6cd2) -> C6 05
	cp $0b ; 8ACD4 (22:6cd4) -> FE 0B
	jp z, .asm_8ad07 ; 8ACD6 (22:6cd6) -> CA 07 6D
	cp $09 ; 8ACD9 (22:6cd9) -> FE 09
	jp z, .asm_8acf8 ; 8ACDB (22:6cdb) -> CA F8 6C
	cp $08 ; 8ACDE (22:6cde) -> FE 08
	jp nz, .asm_8ad13 ; 8ACE0 (22:6ce0) -> C2 13 6D
	ld bc, Data_8acbc ; 8ACE3 (22:6ce3) -> 01 BC 6C
	ld e, $22 ; 8ACE6 (22:6ce6) -> 1E 22
	ld a, $05 ; 8ACE8 (22:6ce8) -> 3E 05
	scall MovePersonAndWait ; 8ACEA (22:6cea) -> CD 88 46
	scall WaitNPCStep ; 8ACED (22:6ced) -> CD 0C 42
	ld a, $01 ; 8ACF0 (22:6cf0) -> 3E 01
	scall PlayerFace ; 8ACF2 (22:6cf2) -> CD 77 46
	jp .asm_8ad13 ; 8ACF5 (22:6cf5) -> C3 13 6D
.asm_8acf8:
	ld e, $03 ; 8ACF8 (22:6cf8) -> 1E 03
	ld a, $05 ; 8ACFA (22:6cfa) -> 3E 05
	scall SpriteFace ; 8ACFC (22:6cfc) -> CD 95 40
	ld a, $01 ; 8ACFF (22:6cff) -> 3E 01
	scall PlayerFace ; 8AD01 (22:6d01) -> CD 77 46
	jp .asm_8ad13 ; 8AD04 (22:6d04) -> C3 13 6D
.asm_8ad07:
	ld e, $01 ; 8AD07 (22:6d07) -> 1E 01
	ld a, $05 ; 8AD09 (22:6d09) -> 3E 05
	scall SpriteFace ; 8AD0B (22:6d0b) -> CD 95 40
	ld a, $03 ; 8AD0E (22:6d0e) -> 3E 03
	scall PlayerFace ; 8AD10 (22:6d10) -> CD 77 46
.asm_8ad13:
	call Func_8ad46 ; 8AD13 (22:6d13) -> CD 46 6D
.asm_8ad16:
	ret  ; 8AD16 (22:6d16) -> C9

Data_8ad17:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ad40:
	db $0a, $04, $0d, $04, $ff, $ff

Func_8ad46:
	ld hl, $0233 ; 8AD46 (22:6d46) -> 21 33 02
	scall PrintTextStandard ; 8AD49 (22:6d49) -> CD 98 44
	ld hl, $017a ; 8AD4C (22:6d4c) -> 21 7A 01
	scall PrintTextStandard ; 8AD4F (22:6d4f) -> CD 98 44
.asm_8ad52:
	ld de, Data_8ada8 ; 8AD52 (22:6d52) -> 11 A8 6D
	ld hl, Data_8ad17 ; 8AD55 (22:6d55) -> 21 17 6D
	scall Func_802ef ; 8AD58 (22:6d58) -> CD EF 42
	or a ; 8AD5B (22:6d5b) -> B7
	jp nz, .asm_8ad68 ; 8AD5C (22:6d5c) -> C2 68 6D
	ld a, [wc7c4] ; 8AD5F (22:6d5f) -> FA C4 C7
	cp $01 ; 8AD62 (22:6d62) -> FE 01
	jp nz, .asm_8ad52 ; 8AD64 (22:6d64) -> C2 52 6D
	ret  ; 8AD67 (22:6d67) -> C9
.asm_8ad68:
	ld hl, $022c ; 8AD68 (22:6d68) -> 21 2C 02
	scall PrintTextStandard ; 8AD6B (22:6d6b) -> CD 98 44
	ld hl, $0234 ; 8AD6E (22:6d6e) -> 21 34 02
	scall PrintTextStandard ; 8AD71 (22:6d71) -> CD 98 44
	ld bc, Data_8ad40 ; 8AD74 (22:6d74) -> 01 40 6D
	ld e, $22 ; 8AD77 (22:6d77) -> 1E 22
	ld a, $05 ; 8AD79 (22:6d79) -> 3E 05
	scall MovePersonAndWait ; 8AD7B (22:6d7b) -> CD 88 46
	scall WaitNPCStep ; 8AD7E (22:6d7e) -> CD 0C 42
	ld e, $00 ; 8AD81 (22:6d81) -> 1E 00
	ld a, $05 ; 8AD83 (22:6d83) -> 3E 05
	scall SetPersonVisibilityState ; 8AD85 (22:6d85) -> CD 3D 41
	ld e, $00 ; 8AD88 (22:6d88) -> 1E 00
	ld a, $06 ; 8AD8A (22:6d8a) -> 3E 06
	scall SetPersonVisibilityState ; 8AD8C (22:6d8c) -> CD 3D 41
	ld e, $00 ; 8AD8F (22:6d8f) -> 1E 00
	ld a, $07 ; 8AD91 (22:6d91) -> 3E 07
	scall SetPersonVisibilityState ; 8AD93 (22:6d93) -> CD 3D 41
	xor a ; 8AD96 (22:6d96) -> AF
	scall PlayMusic ; 8AD97 (22:6d97) -> CD E6 4E
	ld a, $09 ; 8AD9A (22:6d9a) -> 3E 09
	scall PlayMusic ; 8AD9C (22:6d9c) -> CD E6 4E
	ld e, $01 ; 8AD9F (22:6d9f) -> 1E 01
	ld hl, $0082 ; 8ADA1 (22:6da1) -> 21 82 00
	scall EventFlagAction ; 8ADA4 (22:6da4) -> CD 1B 46
	ret  ; 8ADA7 (22:6da7) -> C9

Data_8ada8:
	dstr "(しﾞょしこうせい)"

Func_8adb3:
	ld a, e ; 8ADB3 (22:6db3) -> 7B
	or a ; 8ADB4 (22:6db4) -> B7
	jp nz, .asm_8adbb ; 8ADB5 (22:6db5) -> C2 BB 6D
	call Func_8ae50 ; 8ADB8 (22:6db8) -> CD 50 6E
.asm_8adbb:
	ret  ; 8ADBB (22:6dbb) -> C9

Data_8adbc:
	db $09, $07, $ff, $ff

Data_8adc0:
	db $0a, $07, $ff, $ff

Func_8adc4:
	ld a, e ; 8ADC4 (22:6dc4) -> 7B
	cp $02 ; 8ADC5 (22:6dc5) -> FE 02
	jp nz, .asm_8ae20 ; 8ADC7 (22:6dc7) -> C2 20 6E
	xor a ; 8ADCA (22:6dca) -> AF
	scall PlayMusic ; 8ADCB (22:6dcb) -> CD E6 4E
	ld a, $1a ; 8ADCE (22:6dce) -> 3E 1A
	scall PlayMusic ; 8ADD0 (22:6dd0) -> CD E6 4E
	ld a, [wMapX] ; 8ADD3 (22:6dd3) -> FA D8 C2
	add a, $05 ; 8ADD6 (22:6dd6) -> C6 05
	cp $0a ; 8ADD8 (22:6dd8) -> FE 0A
	jp z, .asm_8ae11 ; 8ADDA (22:6dda) -> CA 11 6E
	cp $09 ; 8ADDD (22:6ddd) -> FE 09
	jp z, .asm_8adfc ; 8ADDF (22:6ddf) -> CA FC 6D
	cp $08 ; 8ADE2 (22:6de2) -> FE 08
	jp nz, .asm_8ae1d ; 8ADE4 (22:6de4) -> C2 1D 6E
	ld bc, Data_8adbc ; 8ADE7 (22:6de7) -> 01 BC 6D
	ld e, $22 ; 8ADEA (22:6dea) -> 1E 22
	ld a, $08 ; 8ADEC (22:6dec) -> 3E 08
	scall MovePersonAndWait ; 8ADEE (22:6dee) -> CD 88 46
	scall WaitNPCStep ; 8ADF1 (22:6df1) -> CD 0C 42
	ld a, $01 ; 8ADF4 (22:6df4) -> 3E 01
	scall PlayerFace ; 8ADF6 (22:6df6) -> CD 77 46
	jp .asm_8ae1d ; 8ADF9 (22:6df9) -> C3 1D 6E
.asm_8adfc:
	ld bc, Data_8adc0 ; 8ADFC (22:6dfc) -> 01 C0 6D
	ld e, $22 ; 8ADFF (22:6dff) -> 1E 22
	ld a, $08 ; 8AE01 (22:6e01) -> 3E 08
	scall MovePersonAndWait ; 8AE03 (22:6e03) -> CD 88 46
	scall WaitNPCStep ; 8AE06 (22:6e06) -> CD 0C 42
	ld a, $01 ; 8AE09 (22:6e09) -> 3E 01
	scall PlayerFace ; 8AE0B (22:6e0b) -> CD 77 46
	jp .asm_8ae1d ; 8AE0E (22:6e0e) -> C3 1D 6E
.asm_8ae11:
	ld e, $03 ; 8AE11 (22:6e11) -> 1E 03
	ld a, $08 ; 8AE13 (22:6e13) -> 3E 08
	scall SpriteFace ; 8AE15 (22:6e15) -> CD 95 40
	ld a, $01 ; 8AE18 (22:6e18) -> 3E 01
	scall PlayerFace ; 8AE1A (22:6e1a) -> CD 77 46
.asm_8ae1d:
	call Func_8ae50 ; 8AE1D (22:6e1d) -> CD 50 6E
.asm_8ae20:
	ret  ; 8AE20 (22:6e20) -> C9

Data_8ae21:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ae4a:
	db $0b, $04, $0d, $04, $ff, $ff

Func_8ae50:
	ld hl, $022e ; 8AE50 (22:6e50) -> 21 2E 02
	scall PrintTextStandard ; 8AE53 (22:6e53) -> CD 98 44
	ld hl, $017a ; 8AE56 (22:6e56) -> 21 7A 01
	scall PrintTextStandard ; 8AE59 (22:6e59) -> CD 98 44
.asm_8ae5c:
	ld de, Data_8aea5 ; 8AE5C (22:6e5c) -> 11 A5 6E
	ld hl, Data_8ae21 ; 8AE5F (22:6e5f) -> 21 21 6E
	scall Func_802ef ; 8AE62 (22:6e62) -> CD EF 42
	or a ; 8AE65 (22:6e65) -> B7
	jp nz, .asm_8ae72 ; 8AE66 (22:6e66) -> C2 72 6E
	ld a, [wc7c4] ; 8AE69 (22:6e69) -> FA C4 C7
	cp $01 ; 8AE6C (22:6e6c) -> FE 01
	jp nz, .asm_8ae5c ; 8AE6E (22:6e6e) -> C2 5C 6E
	ret  ; 8AE71 (22:6e71) -> C9
.asm_8ae72:
	ld hl, $022e ; 8AE72 (22:6e72) -> 21 2E 02
	scall PrintTextStandard ; 8AE75 (22:6e75) -> CD 98 44
	ld bc, Data_8ae4a ; 8AE78 (22:6e78) -> 01 4A 6E
	ld e, $22 ; 8AE7B (22:6e7b) -> 1E 22
	ld a, $08 ; 8AE7D (22:6e7d) -> 3E 08
	scall MovePersonAndWait ; 8AE7F (22:6e7f) -> CD 88 46
	scall WaitNPCStep ; 8AE82 (22:6e82) -> CD 0C 42
	ld e, $00 ; 8AE85 (22:6e85) -> 1E 00
	ld a, $08 ; 8AE87 (22:6e87) -> 3E 08
	scall SetPersonVisibilityState ; 8AE89 (22:6e89) -> CD 3D 41
	ld e, $00 ; 8AE8C (22:6e8c) -> 1E 00
	ld a, $09 ; 8AE8E (22:6e8e) -> 3E 09
	scall SetPersonVisibilityState ; 8AE90 (22:6e90) -> CD 3D 41
	xor a ; 8AE93 (22:6e93) -> AF
	scall PlayMusic ; 8AE94 (22:6e94) -> CD E6 4E
	ld a, $09 ; 8AE97 (22:6e97) -> 3E 09
	scall PlayMusic ; 8AE99 (22:6e99) -> CD E6 4E
	ld e, $01 ; 8AE9C (22:6e9c) -> 1E 01
	ld hl, $0083 ; 8AE9E (22:6e9e) -> 21 83 00
	scall EventFlagAction ; 8AEA1 (22:6ea1) -> CD 1B 46
	ret  ; 8AEA4 (22:6ea4) -> C9

Data_8aea5:
	dstr "コキﾞャル"

Data_8aeab:
	db $0d, $04, $01, $01, $05, $21, $0d, $04, $0c, $04, $2e
	db $12, $0a, $01, $01, $05, $23, $12, $0a, $12, $0b, $2e

Data_8aec1:
IF DEF(SUN)
	db $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00
	db $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00
	db $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00
	db $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00
	db $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00
	db $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00
	db $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Func_8af07:: ; 8af07
	ld e, $02 ; 8AF07 (22:6f07) -> 1E 02
	ld hl, Data_8aeab ; 8AF09 (22:6f09) -> 21 AB 6E
	scall LoadWarps ; 8AF0C (22:6f0c) -> CD 3A 40
	ld a, $03 ; 8AF0F (22:6f0f) -> 3E 03
	scall Func_80d01 ; 8AF11 (22:6f11) -> CD 01 4D
	ld e, $05 ; 8AF14 (22:6f14) -> 1E 05
	ld hl, Data_8aec1 ; 8AF16 (22:6f16) -> 21 C1 6E
	scall LoadEncounters ; 8AF19 (22:6f19) -> CD 24 4D
	ld a, $09 ; 8AF1C (22:6f1c) -> 3E 09
	scall PlayMusic ; 8AF1E (22:6f1e) -> CD E6 4E
	scall Func_8001c ; 8AF21 (22:6f21) -> CD 1C 40
	ld hl, $02e0 ; 8AF24 (22:6f24) -> 21 E0 02
	scall LandmarkSign ; 8AF27 (22:6f27) -> CD 72 4F
	ret  ; 8AF2A (22:6f2a) -> C9

Data_8af2b:
	db $05, $05, $01, $01, $05, $24, $05, $05, $04, $05, $2e
	db $12, $0a, $01, $01, $05, $22, $12, $0a, $11, $0a, $2e

Data_8af41:
	db $26, $09, $0d, $01, $4a

Data_8af46:
IF DEF(SUN)
	db $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00
	db $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00
	db $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00
	db $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db 00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00
	db $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00
	db $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00
	db $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8af8c:
	map_object $01, $0c, $05, $12, $01, $01, $01, $04, $00, Func_8b05e, 0
	map_object $01, $0c, $06, $11, $01, $01, $01, $04, $00, Func_8b150, 0
	map_object $01, $0c, $0d, $06, $01, $01, $02, $04, $00, Func_8b243, 0
	map_object $01, $0c, $0e, $06, $01, $01, $02, $04, $00, Func_8b345, 0

Func_8afc4:: ; 8afc4
	ld e, $02 ; 8AFC4 (22:6fc4) -> 1E 02
	ld hl, Data_8af2b ; 8AFC6 (22:6fc6) -> 21 2B 6F
	scall LoadWarps ; 8AFC9 (22:6fc9) -> CD 3A 40
	ld e, $01 ; 8AFCC (22:6fcc) -> 1E 01
	ld hl, Data_8af41 ; 8AFCE (22:6fce) -> 21 41 6F
	scall Func_80ce7 ; 8AFD1 (22:6fd1) -> CD E7 4C
	ld a, $03 ; 8AFD4 (22:6fd4) -> 3E 03
	scall Func_80d01 ; 8AFD6 (22:6fd6) -> CD 01 4D
	ld e, $05 ; 8AFD9 (22:6fd9) -> 1E 05
	ld hl, Data_8af46 ; 8AFDB (22:6fdb) -> 21 46 6F
	scall LoadEncounters ; 8AFDE (22:6fde) -> CD 24 4D
	ld e, $04 ; 8AFE1 (22:6fe1) -> 1E 04
	ld hl, Data_8af8c ; 8AFE3 (22:6fe3) -> 21 8C 6F
	scall LoadMapObjects ; 8AFE6 (22:6fe6) -> CD FB 40
	ld hl, $0084 ; 8AFE9 (22:6fe9) -> 21 84 00
	scall CheckEventFlag ; 8AFEC (22:6fec) -> CD 2E 46
	cp $01 ; 8AFEF (22:6fef) -> FE 01
	jp nz, .asm_8b001 ; 8AFF1 (22:6ff1) -> C2 01 70
	ld e, $00 ; 8AFF4 (22:6ff4) -> 1E 00
	xor a ; 8AFF6 (22:6ff6) -> AF
	scall SetPersonVisibilityState ; 8AFF7 (22:6ff7) -> CD 3D 41
	ld e, $00 ; 8AFFA (22:6ffa) -> 1E 00
	ld a, $01 ; 8AFFC (22:6ffc) -> 3E 01
	scall SetPersonVisibilityState ; 8AFFE (22:6ffe) -> CD 3D 41
.asm_8b001:
	ld hl, $0085 ; 8B001 (22:7001) -> 21 85 00
	scall CheckEventFlag ; 8B004 (22:7004) -> CD 2E 46
	cp $01 ; 8B007 (22:7007) -> FE 01
	jp nz, .asm_8b01a ; 8B009 (22:7009) -> C2 1A 70
	ld e, $00 ; 8B00C (22:700c) -> 1E 00
	ld a, $02 ; 8B00E (22:700e) -> 3E 02
	scall SetPersonVisibilityState ; 8B010 (22:7010) -> CD 3D 41
	ld e, $00 ; 8B013 (22:7013) -> 1E 00
	ld a, $03 ; 8B015 (22:7015) -> 3E 03
	scall SetPersonVisibilityState ; 8B017 (22:7017) -> CD 3D 41
.asm_8b01a:
	ld a, $09 ; 8B01A (22:701a) -> 3E 09
	scall PlayMusic ; 8B01C (22:701c) -> CD E6 4E
	scall Func_8001c ; 8B01F (22:701f) -> CD 1C 40
	ld hl, $02e1 ; 8B022 (22:7022) -> 21 E1 02
	scall LandmarkSign ; 8B025 (22:7025) -> CD 72 4F
	ret  ; 8B028 (22:7028) -> C9

Data_8b029:
	db $05, $0e, $03, $0c, $ff, $ff

Data_8b02f:
	db $04, $0f, $03, $0c, $ff, $ff

Data_8b035:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $18, $01, $18, $03, $11, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b05e:
	push af ; 8B05E (22:705e) -> F5
	ld a, e ; 8B05F (22:705f) -> 7B
	or a ; 8B060 (22:7060) -> B7
	jp nz, .asm_8b109 ; 8B061 (22:7061) -> C2 09 71
	xor a ; 8B064 (22:7064) -> AF
	scall PlayMusic ; 8B065 (22:7065) -> CD E6 4E
	ld a, $1a ; 8B068 (22:7068) -> 3E 1A
	scall PlayMusic ; 8B06A (22:706a) -> CD E6 4E
	ld hl, $022b ; 8B06D (22:706d) -> 21 2B 02
	scall PrintTextStandard ; 8B070 (22:7070) -> CD 98 44
	ld hl, sp+$01 ; 8B073 (22:7073) -> F8 01
	ld a, [hl] ; 8B075 (22:7075) -> 7E
	scall FacePlayer ; 8B076 (22:7076) -> CD 4B 44
	ld hl, $015e ; 8B079 (22:7079) -> 21 5E 01
	scall PrintTextStandard ; 8B07C (22:707c) -> CD 98 44
.asm_8b07f:
	ld de, Data_8b10b ; 8B07F (22:707f) -> 11 0B 71
	ld hl, Data_8b035 ; 8B082 (22:7082) -> 21 35 70
	scall Func_803f5 ; 8B085 (22:7085) -> CD F4 43
	or a ; 8B088 (22:7088) -> B7
	jp nz, .asm_8b097 ; 8B089 (22:7089) -> C2 97 70
	ld a, [wc7c4] ; 8B08C (22:708c) -> FA C4 C7
	cp $01 ; 8B08F (22:708f) -> FE 01
	jp nz, .asm_8b07f ; 8B091 (22:7091) -> C2 7F 70
	jp .asm_8b109 ; 8B094 (22:7094) -> C3 09 71
.asm_8b097:
	ld hl, $022b ; 8B097 (22:7097) -> 21 2B 02
	scall PrintTextStandard ; 8B09A (22:709a) -> CD 98 44
	ld bc, Data_8b029 ; 8B09D (22:709d) -> 01 29 70
	ld e, $22 ; 8B0A0 (22:70a0) -> 1E 22
	xor a ; 8B0A2 (22:70a2) -> AF
	scall MovePersonAndWait ; 8B0A3 (22:70a3) -> CD 88 46
	scall WaitNPCStep ; 8B0A6 (22:70a6) -> CD 0C 42
	ld e, $00 ; 8B0A9 (22:70a9) -> 1E 00
	xor a ; 8B0AB (22:70ab) -> AF
	scall SetPersonVisibilityState ; 8B0AC (22:70ac) -> CD 3D 41
	xor a ; 8B0AF (22:70af) -> AF
	scall PlayerFace ; 8B0B0 (22:70b0) -> CD 77 46
	ld e, $02 ; 8B0B3 (22:70b3) -> 1E 02
	ld a, $01 ; 8B0B5 (22:70b5) -> 3E 01
	scall SpriteFace ; 8B0B7 (22:70b7) -> CD 95 40
	ld hl, $0230 ; 8B0BA (22:70ba) -> 21 30 02
	scall PrintTextStandard ; 8B0BD (22:70bd) -> CD 98 44
	ld hl, $015e ; 8B0C0 (22:70c0) -> 21 5E 01
	scall PrintTextStandard ; 8B0C3 (22:70c3) -> CD 98 44
.asm_8b0c6:
	ld de, Data_8b111 ; 8B0C6 (22:70c6) -> 11 11 71
	ld hl, Data_8b035 ; 8B0C9 (22:70c9) -> 21 35 70
	scall Func_803f5 ; 8B0CC (22:70cc) -> CD F4 43
	or a ; 8B0CF (22:70cf) -> B7
	jp nz, .asm_8b0de ; 8B0D0 (22:70d0) -> C2 DE 70
	ld a, [wc7c4] ; 8B0D3 (22:70d3) -> FA C4 C7
	cp $01 ; 8B0D6 (22:70d6) -> FE 01
	jp nz, .asm_8b0c6 ; 8B0D8 (22:70d8) -> C2 C6 70
	jp .asm_8b109 ; 8B0DB (22:70db) -> C3 09 71
.asm_8b0de:
	ld hl, $0230 ; 8B0DE (22:70de) -> 21 30 02
	scall PrintTextStandard ; 8B0E1 (22:70e1) -> CD 98 44
	ld bc, Data_8b02f ; 8B0E4 (22:70e4) -> 01 2F 70
	ld e, $22 ; 8B0E7 (22:70e7) -> 1E 22
	ld a, $01 ; 8B0E9 (22:70e9) -> 3E 01
	scall MovePersonAndWait ; 8B0EB (22:70eb) -> CD 88 46
	scall WaitNPCStep ; 8B0EE (22:70ee) -> CD 0C 42
	ld e, $00 ; 8B0F1 (22:70f1) -> 1E 00
	ld a, $01 ; 8B0F3 (22:70f3) -> 3E 01
	scall SetPersonVisibilityState ; 8B0F5 (22:70f5) -> CD 3D 41
	ld e, $01 ; 8B0F8 (22:70f8) -> 1E 01
	ld hl, $0084 ; 8B0FA (22:70fa) -> 21 84 00
	scall EventFlagAction ; 8B0FD (22:70fd) -> CD 1B 46
	xor a ; 8B100 (22:7100) -> AF
	scall PlayMusic ; 8B101 (22:7101) -> CD E6 4E
	ld a, $09 ; 8B104 (22:7104) -> 3E 09
	scall PlayMusic ; 8B106 (22:7106) -> CD E6 4E
.asm_8b109:
	pop bc ; 8B109 (22:7109) -> C1
	ret  ; 8B10A (22:710a) -> C9

Data_8b10b:
	dstr "コキﾞャル"

Data_8b111:
	dstr "コキﾞャル"

Data_8b117:
	db $05, $0e, $03, $0c, $ff, $ff

Data_8b11d:
	db $04, $0f, $03, $0c, $ff, $ff

Data_8b123:
	db $06, $11, $ff, $ff

Data_8b127:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $52, $03, $11, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b150:
	ld a, e ; 8B150 (22:7150) -> 7B
	or a ; 8B151 (22:7151) -> B7
	jp nz, .asm_8b1fd ; 8B152 (22:7152) -> C2 FD 71
	ld a, $01 ; 8B155 (22:7155) -> 3E 01
	scall FacePlayer ; 8B157 (22:7157) -> CD 4B 44
	ld hl, $0230 ; 8B15A (22:715a) -> 21 30 02
	scall PrintTextStandard ; 8B15D (22:715d) -> CD 98 44
	ld hl, $015e ; 8B160 (22:7160) -> 21 5E 01
	scall PrintTextStandard ; 8B163 (22:7163) -> CD 98 44
.asm_8b166:
	ld de, Data_8b1fe ; 8B166 (22:7166) -> 11 FE 71
	ld hl, Data_8b127 ; 8B169 (22:7169) -> 21 27 71
	scall Func_803f5 ; 8B16C (22:716c) -> CD F4 43
	or a ; 8B16F (22:716f) -> B7
	jp nz, .asm_8b17e ; 8B170 (22:7170) -> C2 7E 71
	ld a, [wc7c4] ; 8B173 (22:7173) -> FA C4 C7
	cp $01 ; 8B176 (22:7176) -> FE 01
	jp nz, .asm_8b166 ; 8B178 (22:7178) -> C2 66 71
	jp .asm_8b1fd ; 8B17B (22:717b) -> C3 FD 71
.asm_8b17e:
	ld hl, $0230 ; 8B17E (22:717e) -> 21 30 02
	scall PrintTextStandard ; 8B181 (22:7181) -> CD 98 44
	ld bc, Data_8b11d ; 8B184 (22:7184) -> 01 1D 71
	ld e, $22 ; 8B187 (22:7187) -> 1E 22
	ld a, $01 ; 8B189 (22:7189) -> 3E 01
	scall MovePersonAndWait ; 8B18B (22:718b) -> CD 88 46
	scall WaitNPCStep ; 8B18E (22:718e) -> CD 0C 42
	ld e, $00 ; 8B191 (22:7191) -> 1E 00
	ld a, $01 ; 8B193 (22:7193) -> 3E 01
	scall SetPersonVisibilityState ; 8B195 (22:7195) -> CD 3D 41
	ld a, [wPlayerFacing] ; 8B198 (22:7198) -> FA 38 C8
	or a ; 8B19B (22:719b) -> B7
	jp nz, .asm_8b1a7 ; 8B19C (22:719c) -> C2 A7 71
	ld a, $03 ; 8B19F (22:719f) -> 3E 03
	scall PlayerFace ; 8B1A1 (22:71a1) -> CD 77 46
	jp .asm_8b1b9 ; 8B1A4 (22:71a4) -> C3 B9 71
.asm_8b1a7:
	ld bc, Data_8b123 ; 8B1A7 (22:71a7) -> 01 23 71
	ld e, $22 ; 8B1AA (22:71aa) -> 1E 22
	xor a ; 8B1AC (22:71ac) -> AF
	scall MovePersonAndWait ; 8B1AD (22:71ad) -> CD 88 46
	scall WaitNPCStep ; 8B1B0 (22:71b0) -> CD 0C 42
	ld e, $01 ; 8B1B3 (22:71b3) -> 1E 01
	xor a ; 8B1B5 (22:71b5) -> AF
	scall SpriteFace ; 8B1B6 (22:71b6) -> CD 95 40
.asm_8b1b9:
	ld hl, $022b ; 8B1B9 (22:71b9) -> 21 2B 02
	scall PrintTextStandard ; 8B1BC (22:71bc) -> CD 98 44
	ld hl, $015e ; 8B1BF (22:71bf) -> 21 5E 01
	scall PrintTextStandard ; 8B1C2 (22:71c2) -> CD 98 44
.asm_8b1c5:
	ld de, Data_8b204 ; 8B1C5 (22:71c5) -> 11 04 72
	ld hl, Data_8b127 ; 8B1C8 (22:71c8) -> 21 27 71
	scall Func_803f5 ; 8B1CB (22:71cb) -> CD F4 43
	or a ; 8B1CE (22:71ce) -> B7
	jp nz, .asm_8b1dd ; 8B1CF (22:71cf) -> C2 DD 71
	ld a, [wc7c4] ; 8B1D2 (22:71d2) -> FA C4 C7
	cp $01 ; 8B1D5 (22:71d5) -> FE 01
	jp nz, .asm_8b1c5 ; 8B1D7 (22:71d7) -> C2 C5 71
	jp .asm_8b1fd ; 8B1DA (22:71da) -> C3 FD 71
.asm_8b1dd:
	ld hl, $022b ; 8B1DD (22:71dd) -> 21 2B 02
	scall PrintTextStandard ; 8B1E0 (22:71e0) -> CD 98 44
	ld bc, Data_8b117 ; 8B1E3 (22:71e3) -> 01 17 71
	ld e, $22 ; 8B1E6 (22:71e6) -> 1E 22
	xor a ; 8B1E8 (22:71e8) -> AF
	scall MovePersonAndWait ; 8B1E9 (22:71e9) -> CD 88 46
	scall WaitNPCStep ; 8B1EC (22:71ec) -> CD 0C 42
	ld e, $00 ; 8B1EF (22:71ef) -> 1E 00
	xor a ; 8B1F1 (22:71f1) -> AF
	scall SetPersonVisibilityState ; 8B1F2 (22:71f2) -> CD 3D 41
	ld e, $01 ; 8B1F5 (22:71f5) -> 1E 01
	ld hl, $0084 ; 8B1F7 (22:71f7) -> 21 84 00
	scall EventFlagAction ; 8B1FA (22:71fa) -> CD 1B 46
.asm_8b1fd:
	ret  ; 8B1FD (22:71fd) -> C9

Data_8b1fe:
	dstr "コキﾞャル"

Data_8b204:
	dstr "コキﾞャル"

Data_8b20a:
	db $0d, $05, $06, $05, $ff, $ff

Data_8b210:
	db $0e, $07, $ff, $ff

Data_8b214:
	db $0e, $05, $06, $05, $ff, $ff

Data_8b21a:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $38, $01, $38, $03, $11, $0e, $0b, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b243:
	push af ; 8B243 (22:7243) -> F5
	ld a, e ; 8B244 (22:7244) -> 7B
	or a ; 8B245 (22:7245) -> B7
	jp nz, .asm_8b2fe ; 8B246 (22:7246) -> C2 FE 72
	xor a ; 8B249 (22:7249) -> AF
	scall PlayMusic ; 8B24A (22:724a) -> CD E6 4E
	ld a, $1a ; 8B24D (22:724d) -> 3E 1A
	scall PlayMusic ; 8B24F (22:724f) -> CD E6 4E
	ld hl, $022b ; 8B252 (22:7252) -> 21 2B 02
	scall PrintTextStandard ; 8B255 (22:7255) -> CD 98 44
	ld hl, sp+$01 ; 8B258 (22:7258) -> F8 01
	ld a, [hl] ; 8B25A (22:725a) -> 7E
	scall FacePlayer ; 8B25B (22:725b) -> CD 4B 44
	ld hl, $015e ; 8B25E (22:725e) -> 21 5E 01
	scall PrintTextStandard ; 8B261 (22:7261) -> CD 98 44
.asm_8b264:
	ld de, Data_8b300 ; 8B264 (22:7264) -> 11 00 73
	ld hl, Data_8b21a ; 8B267 (22:7267) -> 21 1A 72
	scall Func_803f5 ; 8B26A (22:726a) -> CD F4 43
	or a ; 8B26D (22:726d) -> B7
	jp nz, .asm_8b27c ; 8B26E (22:726e) -> C2 7C 72
	ld a, [wc7c4] ; 8B271 (22:7271) -> FA C4 C7
	cp $01 ; 8B274 (22:7274) -> FE 01
	jp nz, .asm_8b264 ; 8B276 (22:7276) -> C2 64 72
	jp .asm_8b2fe ; 8B279 (22:7279) -> C3 FE 72
.asm_8b27c:
	ld hl, $022b ; 8B27C (22:727c) -> 21 2B 02
	scall PrintTextStandard ; 8B27F (22:727f) -> CD 98 44
	ld bc, Data_8b20a ; 8B282 (22:7282) -> 01 0A 72
	ld e, $22 ; 8B285 (22:7285) -> 1E 22
	ld a, $02 ; 8B287 (22:7287) -> 3E 02
	scall MovePersonAndWait ; 8B289 (22:7289) -> CD 88 46
	scall WaitNPCStep ; 8B28C (22:728c) -> CD 0C 42
	ld e, $00 ; 8B28F (22:728f) -> 1E 00
	ld a, $02 ; 8B291 (22:7291) -> 3E 02
	scall SetPersonVisibilityState ; 8B293 (22:7293) -> CD 3D 41
	ld bc, Data_8b210 ; 8B296 (22:7296) -> 01 10 72
	ld e, $22 ; 8B299 (22:7299) -> 1E 22
	ld a, $03 ; 8B29B (22:729b) -> 3E 03
	scall MovePersonAndWait ; 8B29D (22:729d) -> CD 88 46
	scall WaitNPCStep ; 8B2A0 (22:72a0) -> CD 0C 42
	ld e, $03 ; 8B2A3 (22:72a3) -> 1E 03
	ld a, $03 ; 8B2A5 (22:72a5) -> 3E 03
	scall SpriteFace ; 8B2A7 (22:72a7) -> CD 95 40
	ld a, $01 ; 8B2AA (22:72aa) -> 3E 01
	scall PlayerFace ; 8B2AC (22:72ac) -> CD 77 46
	ld hl, $0230 ; 8B2AF (22:72af) -> 21 30 02
	scall PrintTextStandard ; 8B2B2 (22:72b2) -> CD 98 44
	ld hl, $015e ; 8B2B5 (22:72b5) -> 21 5E 01
	scall PrintTextStandard ; 8B2B8 (22:72b8) -> CD 98 44
.asm_8b2bb:
	ld de, Data_8b306 ; 8B2BB (22:72bb) -> 11 06 73
	ld hl, Data_8b21a ; 8B2BE (22:72be) -> 21 1A 72
	scall Func_803f5 ; 8B2C1 (22:72c1) -> CD F4 43
	or a ; 8B2C4 (22:72c4) -> B7
	jp nz, .asm_8b2d3 ; 8B2C5 (22:72c5) -> C2 D3 72
	ld a, [wc7c4] ; 8B2C8 (22:72c8) -> FA C4 C7
	cp $01 ; 8B2CB (22:72cb) -> FE 01
	jp nz, .asm_8b2bb ; 8B2CD (22:72cd) -> C2 BB 72
	jp .asm_8b2fe ; 8B2D0 (22:72d0) -> C3 FE 72
.asm_8b2d3:
	ld hl, $0230 ; 8B2D3 (22:72d3) -> 21 30 02
	scall PrintTextStandard ; 8B2D6 (22:72d6) -> CD 98 44
	ld bc, Data_8b214 ; 8B2D9 (22:72d9) -> 01 14 72
	ld e, $22 ; 8B2DC (22:72dc) -> 1E 22
	ld a, $03 ; 8B2DE (22:72de) -> 3E 03
	scall MovePersonAndWait ; 8B2E0 (22:72e0) -> CD 88 46
	scall WaitNPCStep ; 8B2E3 (22:72e3) -> CD 0C 42
	ld e, $00 ; 8B2E6 (22:72e6) -> 1E 00
	ld a, $03 ; 8B2E8 (22:72e8) -> 3E 03
	scall SetPersonVisibilityState ; 8B2EA (22:72ea) -> CD 3D 41
	ld e, $01 ; 8B2ED (22:72ed) -> 1E 01
	ld hl, $0085 ; 8B2EF (22:72ef) -> 21 85 00
	scall EventFlagAction ; 8B2F2 (22:72f2) -> CD 1B 46
	xor a ; 8B2F5 (22:72f5) -> AF
	scall PlayMusic ; 8B2F6 (22:72f6) -> CD E6 4E
	ld a, $09 ; 8B2F9 (22:72f9) -> 3E 09
	scall PlayMusic ; 8B2FB (22:72fb) -> CD E6 4E
.asm_8b2fe:
	pop bc ; 8B2FE (22:72fe) -> C1
	ret  ; 8B2FF (22:72ff) -> C9

Data_8b300:
	dstr "コキﾞャル"

Data_8b306:
	dstr "コキﾞャル"

Data_8b30c:
	db $0e, $05, $06, $05, $ff, $ff

Data_8b312:
	db $0d, $07, $ff, $ff

Data_8b316:
	db $0d, $05, $06, $05, $ff, $ff

Data_8b31c:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $25, $01, $25, $03, $11, $01, $01, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b345:
	push af ; 8B345 (22:7345) -> F5
	ld a, e ; 8B346 (22:7346) -> 7B
	or a ; 8B347 (22:7347) -> B7
	jp nz, label_8b400 ; 8B348 (22:7348) -> C2 00 74
	xor a ; 8B34B (22:734b) -> AF
	scall PlayMusic ; 8B34C (22:734c) -> CD E6 4E
	ld a, $1a ; 8B34F (22:734f) -> 3E 1A
	scall PlayMusic ; 8B351 (22:7351) -> CD E6 4E
	ld hl, $0230 ; 8B354 (22:7354) -> 21 30 02
	scall PrintTextStandard ; 8B357 (22:7357) -> CD 98 44
	ld hl, sp+$01 ; 8B35A (22:735a) -> F8 01
	ld a, [hl] ; 8B35C (22:735c) -> 7E
	scall FacePlayer ; 8B35D (22:735d) -> CD 4B 44
	ld hl, $015e ; 8B360 (22:7360) -> 21 5E 01
	scall PrintTextStandard ; 8B363 (22:7363) -> CD 98 44
label_8b366:
	ld de, Data_8b402 ; 8B366 (22:7366) -> 11 02 74
	ld hl, Data_8b31c ; 8B369 (22:7369) -> 21 1C 73
	scall Func_803f5 ; 8B36C (22:736c) -> CD F4 43
	or a ; 8B36F (22:736f) -> B7
	jp nz, label_8b37e ; 8B370 (22:7370) -> C2 7E 73
	ld a, [wc7c4] ; 8B373 (22:7373) -> FA C4 C7
	cp $01 ; 8B376 (22:7376) -> FE 01
	jp nz, label_8b366 ; 8B378 (22:7378) -> C2 66 73
	jp label_8b400 ; 8B37B (22:737b) -> C3 00 74
label_8b37e:
	ld hl, $0230 ; 8B37E (22:737e) -> 21 30 02
	scall PrintTextStandard ; 8B381 (22:7381) -> CD 98 44
	ld bc, Data_8b30c ; 8B384 (22:7384) -> 01 0C 73
	ld e, $22 ; 8B387 (22:7387) -> 1E 22
	ld a, $03 ; 8B389 (22:7389) -> 3E 03
	scall MovePersonAndWait ; 8B38B (22:738b) -> CD 88 46
	scall WaitNPCStep ; 8B38E (22:738e) -> CD 0C 42
	ld e, $00 ; 8B391 (22:7391) -> 1E 00
	ld a, $03 ; 8B393 (22:7393) -> 3E 03
	scall SetPersonVisibilityState ; 8B395 (22:7395) -> CD 3D 41
	ld bc, Data_8b312 ; 8B398 (22:7398) -> 01 12 73
	ld e, $22 ; 8B39B (22:739b) -> 1E 22
	ld a, $02 ; 8B39D (22:739d) -> 3E 02
	scall MovePersonAndWait ; 8B39F (22:739f) -> CD 88 46
	scall WaitNPCStep ; 8B3A2 (22:73a2) -> CD 0C 42
	ld e, $01 ; 8B3A5 (22:73a5) -> 1E 01
	ld a, $02 ; 8B3A7 (22:73a7) -> 3E 02
	scall SpriteFace ; 8B3A9 (22:73a9) -> CD 95 40
	ld a, $03 ; 8B3AC (22:73ac) -> 3E 03
	scall PlayerFace ; 8B3AE (22:73ae) -> CD 77 46
	ld hl, $022b ; 8B3B1 (22:73b1) -> 21 2B 02
	scall PrintTextStandard ; 8B3B4 (22:73b4) -> CD 98 44
	ld hl, $015e ; 8B3B7 (22:73b7) -> 21 5E 01
	scall PrintTextStandard ; 8B3BA (22:73ba) -> CD 98 44
label_8b3bd:
	ld de, Data_8b408 ; 8B3BD (22:73bd) -> 11 08 74
	ld hl, Data_8b31c ; 8B3C0 (22:73c0) -> 21 1C 73
	scall Func_803f5 ; 8B3C3 (22:73c3) -> CD F4 43
	or a ; 8B3C6 (22:73c6) -> B7
	jp nz, label_8b3d5 ; 8B3C7 (22:73c7) -> C2 D5 73
	ld a, [wc7c4] ; 8B3CA (22:73ca) -> FA C4 C7
	cp $01 ; 8B3CD (22:73cd) -> FE 01
	jp nz, label_8b3bd ; 8B3CF (22:73cf) -> C2 BD 73
	jp label_8b400 ; 8B3D2 (22:73d2) -> C3 00 74
label_8b3d5:
	ld hl, $022b ; 8B3D5 (22:73d5) -> 21 2B 02
	scall PrintTextStandard ; 8B3D8 (22:73d8) -> CD 98 44
	ld bc, Data_8b316 ; 8B3DB (22:73db) -> 01 16 73
	ld e, $22 ; 8B3DE (22:73de) -> 1E 22
	ld a, $02 ; 8B3E0 (22:73e0) -> 3E 02
	scall MovePersonAndWait ; 8B3E2 (22:73e2) -> CD 88 46
	scall WaitNPCStep ; 8B3E5 (22:73e5) -> CD 0C 42
	ld e, $00 ; 8B3E8 (22:73e8) -> 1E 00
	ld a, $02 ; 8B3EA (22:73ea) -> 3E 02
	scall SetPersonVisibilityState ; 8B3EC (22:73ec) -> CD 3D 41
	ld e, $01 ; 8B3EF (22:73ef) -> 1E 01
	ld hl, $0085 ; 8B3F1 (22:73f1) -> 21 85 00
	scall EventFlagAction ; 8B3F4 (22:73f4) -> CD 1B 46
	xor a ; 8B3F7 (22:73f7) -> AF
	scall PlayMusic ; 8B3F8 (22:73f8) -> CD E6 4E
	ld a, $09 ; 8B3FB (22:73fb) -> 3E 09
	scall PlayMusic ; 8B3FD (22:73fd) -> CD E6 4E
label_8b400:
	pop bc ; 8B400 (22:7400) -> C1
	ret  ; 8B401 (22:7401) -> C9


Data_8b402:
	dstr "コキﾞャル"

Data_8b408:
	dstr "コキﾞャル"

Data_8b40e:
	db $05, $05, $01, $01, $05, $23, $05, $05, $06, $05, $2e, $27, $09, $0e, $01, $39

Data_8b41e:
IF DEF(SUN)
	db $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $74, $0e, $10, $7f, $0c, $08, $00, $02, $08, $00
	db $00, $02, $14, $11, $6c, $0c, $0e, $03, $17, $17, $0a, $02, $06, $00
	db $00, $02, $14, $11, $14, $0f, $11, $17, $09, $0f, $00, $02, $04, $00
	db $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	db $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00
	db $00, $02, $14, $11, $4c, $0e, $10, $45, $01, $01, $01, $02, $08, $00
	db $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $06, $00
	db $00, $02, $14, $11, $35, $0f, $11, $77, $17, $12, $11, $02, $04, $00
	db $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8b464:
	db $1e, $0c, $0a, $04, $01, $01, $02, $04, $00, $22, $00, $00, $00, $00, $ff, $00, $09, $08, $03, $01, $00, $04, $01, $22, $ea, $74, $00, $00, $ff, $00, $0d, $03, $01, $01, $00, $04, $00, $22, $3d, $75, $00, $00, $ff, $00, $0e, $03, $01, $01, $00, $04, $00, $22, $8c, $75, $00, $00

Func_8b49c:: ; 8b49c
IF DEF(SUN)
	db $1e, $01, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $19, $74, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1e, $74, $cd, $24, $4d, $21, $3c, $00, $cd, $2e, $46, $b7, $c2, $cb, $74, $1e, $02, $21, $64, $74, $cd, $fb, $40, $1e, $02, $21, $80, $74, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e2, $02, $cd, $72, $4f, $c9, $0a, $06, $ff, $ff, $0d, $04, $ff, $ff, $7b, $fe, $02, $c2, $3c, $75, $af, $cd, $e6, $4e, $0e, $01, $11, $e2, $74, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $3e, $01, $cd, $e6, $4e, $21, $7d, $00, $cd, $a9, $44, $01, $e6, $74, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $3c, $00, $cd, $1b, $46, $c9, $7b, $b7, $c2, $8b, $75, $fa, $38, $c8, $b7, $ca, $4c, $75, $c3, $8b, $75, $21, $59, $00, $cd, $2e, $46, $fe, $01, $c2, $60, $75, $21, $83, $02, $cd, $98, $44, $c3, $8b, $75, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1c, $cd, $ff, $4d, $c1, $21, $1e, $00, $cd, $8f, $46, $c9, $7b, $b7, $c2, $dc, $75, $fa, $90, $c7, $b7, $ca, $a9, $75, $fa, $90, $c7, $fe, $07, $d2, $a9, $75, $21, $dd, $03, $cd, $98, $44, $c3, $dc, $75, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $c9, $75, $1e, $01, $21, $59, $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3, $dc, $75, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21, $5c, $03, $cd, $98, $44, $c9, $07, $04, $01, $01, $03, $0c, $15, $12, $16, $12, $2e, $01, $0b, $02, $01, $03, $0e, $10, $08, $10, $09, $2e, $03, $08, $0b, $03, $18, $00, $03, $09, $09, $05, $09, $0b, $2d, $01, $06, $00, $0a, $0a, $00, $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00, $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00, $00, $03, $09, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0c, $06, $00, $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00, $ff, $00, $03, $09, $03, $01, $00, $04, $00, $22, $ae, $76, $00, $00, $0a, $04, $01, $03, $01, $01, $02, $04, $00, $22, $67, $77, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $19, $74, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $1e, $74, $cd, $24, $4d, $21, $3c, $00, $cd, $2e, $46, $b7, $c2, $cb, $74, $1e, $02, $21, $64, $74, $cd, $fb, $40, $1e, $02, $21, $80, $74, $cd, $fb, $40, $3e, $09, $cd, $e6, $4e, $cd, $1c, $40, $21, $e2, $02, $cd, $72, $4f, $c9, $0a, $06, $ff, $ff, $0d, $04, $ff, $ff, $7b, $fe, $02, $c2, $3c, $75, $af, $cd, $e6, $4e, $0e, $01, $11, $e2, $74, $3e, $22, $cd, $3e, $46, $cd, $0c, $42, $3e, $01, $cd, $e6, $4e, $21, $7d, $00, $cd, $a9, $44, $01, $e6, $74, $1e, $22, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $09, $cd, $e6, $4e, $1e, $01, $21, $3c, $00, $cd, $1b, $46, $c9, $7b, $b7, $c2, $8b, $75, $fa, $38, $c8, $b7, $ca, $4c, $75, $c3, $8b, $75, $21, $59, $00, $cd, $2e, $46, $fe, $01, $c2, $60, $75, $21, $83, $02, $cd, $98, $44, $c3, $8b, $75, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1c, $cd, $ff, $4d, $c1, $21, $1e, $00, $cd, $8f, $46, $c9, $7b, $b7, $c2, $dc, $75, $fa, $90, $c7, $b7, $ca, $a9, $75, $fa, $90, $c7, $fe, $07, $d2, $a9, $75, $21, $dd, $03, $cd, $98, $44, $c3, $dc, $75, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $c9, $75, $1e, $01, $21, $59, $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3, $dc, $75, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21, $5c, $03, $cd, $98, $44, $c9, $07, $04, $01, $01, $03, $0c, $15, $12, $16, $12, $2e, $01, $0b, $02, $01, $03, $0e, $10, $08, $10, $09, $2e, $03, $08, $0b, $03, $18, $00, $03, $09, $09, $46, $09, $0b, $78, $14, $14, $00, $0a, $0a, $00, $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00, $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00, $00, $03, $09, $09, $25, $0c, $0e, $79, $18, $18, $00, $0c, $06, $00, $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00, $ff, $00, $03, $09, $03, $01, $00, $04, $00, $22, $ae, $76, $00, $00, $0a, $04, $01, $03, $01, $01, $02, $04, $00, $22, $67, $77, $00, $00
ENDC

Func_8b65a:: ; 8b65a
	db $1e, $02, $21, $dd, $75, $cd, $3a, $40, $1e, $01, $21, $f3, $75, $cd, $e7, $4c, $1e, $02, $21, $3e, $76, $cd, $fb, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21, $f8, $75, $cd, $24, $4d, $3e, $04, $ea, $e2, $c7, $21, $00, $00, $cd, $2e, $46, $b7, $c2, $96, $76, $3e, $01, $ea, $da, $c7, $c3, $9a, $76, $af, $ea, $da, $c7, $3e, $01, $cd, $c6, $4c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $d8, $02, $cd, $72, $4f, $c9, $7b, $b7, $c2, $3d, $77, $3e, $0f, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $41, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $50, $cd, $6d, $4e, $fe, $ff, $c2, $db, $76, $3e, $64, $cd, $6d, $4e, $fe, $ff, $ca, $37, $77, $fa, $90, $c7, $b7, $ca, $2e, $77, $fa, $90, $c7, $fe, $06, $d2, $2e, $77, $21, $2d, $03, $cd, $ba, $44, $b7, $c2, $2b, $77, $af, $cd, $e6, $4e, $3e, $0a, $cd, $e6, $4e, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $0b, $cd, $76, $41, $3e, $44, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $04, $cd, $c6, $4c, $af, $cd, $77, $46, $2e, $1e, $e5, $0e, $2e, $1e, $03, $3e, $1e, $cd, $ff, $4d, $c1, $c3, $34, $77, $21, $77, $03, $cd, $98, $44, $c3, $3d, $77, $21, $76, $03, $cd, $98, $44, $c9, $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $39, $01, $39, $02, $0e, $1f, $1e, $08, $19, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $bd, $77, $f8, $01, $7e, $cd, $4b, $44, $21, $72, $00, $cd, $2e, $46, $b7, $c2, $b7, $77, $21, $50, $02, $cd, $98, $44, $21, $2c, $03, $cd, $ba, $44, $b7, $c2, $ae, $77, $11, $bf, $77, $21, $3e, $77, $cd, $d3, $4d, $b7, $c2, $9d, $77, $c3, $bd, $77, $1e, $01, $21, $72, $00, $cd, $1b, $46, $21, $51, $02, $cd, $98, $44, $c3, $b4, $77, $21, $5d, $02, $cd, $98, $44, $c3, $bd, $77, $21, $51, $02, $cd, $98, $44, $c1, $c9, $b1, $d4, $bc, $b9, $de, $28, $b8, $dd, $29, $00

