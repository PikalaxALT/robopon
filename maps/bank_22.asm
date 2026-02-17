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
	ld e, $01
	ld hl, Data_89bca
	scall LoadWarps
	ld e, $01
	ld hl, Data_89bd5
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_89bda
	scall LoadEncounters
	ld e, $04
	ld hl, Data_89c20
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	ld a, $03
	ld [wc7e2], a
	ld hl, $006b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_89c9f
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_89c9f:
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468ba
	scall LandmarkSign
	ret

Func_89ca9:
	ld a, e
	or a
	jp nz, .asm_89d03
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89cb8
	jp .asm_89d03
.asm_89cb8:
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_89ccc
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_89d03
.asm_89ccc:
	ld a, $01
	ld [wc78a], a
	ld e, $00
	ld hl, $00fc
	scall EventFlagAction
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
.asm_89d03:
	ret

Func_89d04:
	ld a, e
	or a
	jp nz, .asm_89d54
	ld a, [wc790]
	or a
	jp z, .asm_89d21
	ld a, [wc790]
	cp $07
	jp nc, .asm_89d21
	hltext_tree_pointer TreeBitstreamText_47041
	scall PrintTextStandard
	jp .asm_89d54
.asm_89d21:
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_89d41
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	ld a, $32
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp .asm_89d54
.asm_89d41:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	ld a, $28
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
.asm_89d54:
	ret

Data_89d55:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $90, $01, $90, $02, $0a, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_89d7e:
	db $10, $0a, $ff, $ff

Data_89d82:
	db $10, $06, $09, $06, $09, $04, $ff, $ff

Func_89d8a:
	ld a, e
	cp $02
	jp nz, .asm_89df8
	ld hl, $006b
	scall CheckEventFlag
	or a
	jp nz, .asm_89df8
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld c, $01
	ld de, Data_89d7e
	ld a, $22
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_3af8c
	scall PrintTextWithNPCName
	ld de, Data_89df9
	ld hl, Data_89d55
	scall ScriptedBattle
	or a
	jp nz, .asm_89dca
	jp .asm_89df8
.asm_89dca:
	ld e, $01
	ld hl, $006b
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_3afbf
	scall PrintTextWithNPCName
	ld bc, Data_89d82
	ld e, $22
	xor a
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
.asm_89df8:
	ret

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
	ld e, $03
	ld hl, Data_89dfd
	scall LoadWarps
	ld e, $01
	ld hl, Data_89e1e
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_89e23
	scall LoadEncounters
	ld hl, $001f
	scall CheckEventFlag
	or a
	jp nz, .asm_89ede
	ld e, $04
	ld hl, Data_89e69
	scall LoadMapObjects
.asm_89ede:
	ld e, $01
	ld hl, Data_89ea1
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468c8
	scall LandmarkSign
	ret

Data_89ef5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $04, $01, $08, $01, $06, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $04, $01, $45, $01, $08, $14, $14, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_89f1e:	push af
	ld a, e
	or a
	jp nz, .asm_89f74
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0076
	scall CheckEventFlag
	or a
	jp nz, .asm_89f6e
	hltext_tree_pointer TreeBitstreamText_4297c
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_89f65
	ld de, Data_89f76
	ld hl, Data_89ef5
	scall ScriptedBattle
	or a
	jp nz, .asm_89f54
	jp .asm_89f74
.asm_89f54:
	ld e, $01
	ld hl, $0076
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
	jp .asm_89f6b
.asm_89f65:
	hltext_tree_pointer TreeBitstreamText_429ca
	scall PrintTextStandard
.asm_89f6b:
	jp .asm_89f74
.asm_89f6e:
	hltext_tree_pointer TreeBitstreamText_429dc
	scall PrintTextStandard
.asm_89f74:
	pop bc
	ret

Data_89f76:
	dstr "(よひﾞくﾞん)"

Data_89f7f:
	db $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $34, $01, $34, $01, $08, $17, $12, $11, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_89fa8:
	push af
	ld a, e
	or a
	jp nz, .asm_89ffe
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0077
	scall CheckEventFlag
	or a
	jp nz, .asm_89ff8
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_89fef
	ld de, Data_8a000
	ld hl, Data_89f7f
	scall ScriptedBattle
	or a
	jp nz, .asm_89fde
	jp .asm_89ffe
.asm_89fde:
	ld e, $01
	ld hl, $0077
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_429a1
	scall PrintTextStandard
	jp .asm_89ff5
.asm_89fef:
	hltext_tree_pointer TreeBitstreamText_429d1
	scall PrintTextStandard
.asm_89ff5:
	jp .asm_89ffe
.asm_89ff8:
	hltext_tree_pointer TreeBitstreamText_42937
	scall PrintTextStandard
.asm_89ffe:
	pop bc
	ret

Data_8a000:
	dstr "ハﾞア(さん)"

Data_8a008:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $0a, $01, $17, $01, $08, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a031:
	push af
	ld a, e
	or a
	jp nz, .asm_8a087
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0078
	scall CheckEventFlag
	or a
	jp nz, .asm_8a081
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a078
	ld de, Data_8a089
	ld hl, Data_8a008
	scall ScriptedBattle
	or a
	jp nz, .asm_8a067
	jp .asm_8a087
.asm_8a067:
	ld e, $01
	ld hl, $0078
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_429b8
	scall PrintTextStandard
	jp .asm_8a07e
.asm_8a078:
	hltext_tree_pointer TreeBitstreamText_429d1
	scall PrintTextStandard
.asm_8a07e:
	jp .asm_8a087
.asm_8a081:
	hltext_tree_pointer TreeBitstreamText_4290f
	scall PrintTextStandard
.asm_8a087:
	pop bc
	ret

Data_8a089:
	dstr "ロッカー"

Data_8a08e:
	db $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $51, $01, $51, $01, $08, $17, $17, $17, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a0b7:
	push af
	ld a, e
	or a
	jp nz, .asm_8a10d
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0079
	scall CheckEventFlag
	or a
	jp nz, .asm_8a107
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a0fe
	ld de, Data_8a10f
	ld hl, Data_8a08e
	scall ScriptedBattle
	or a
	jp nz, .asm_8a0ed
	jp .asm_8a10d
.asm_8a0ed:
	ld e, $01
	ld hl, $0079
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	jp .asm_8a104
.asm_8a0fe:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
.asm_8a104:
	jp .asm_8a10d
.asm_8a107:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
.asm_8a10d:
	pop bc
	ret

Data_8a10f:
	dstr "オハﾞサン"

Func_8a115:
	ld a, e
	or a
	jp nz, .asm_8a12f
	ld a, [wc790]
	or a
	jp z, .asm_8a129
	ld a, [wc790]
	cp $07
	jp nz, .asm_8a12f
.asm_8a129:
	hltext_tree_pointer TreeBitstreamText_4706a
	scall PrintTextStandard
.asm_8a12f:
	ret

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
	call Func_8a5e7
	ld hl, Func_8a5e7
	scall Func_80f11
	ld e, $02
	ld hl, Data_8a130
	scall LoadWarps
	ld e, $01
	ld hl, Data_8a146
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8a14b
	scall LoadEncounters
	ld hl, $001f
	scall CheckEventFlag
	or a
	jp nz, .asm_8a23d
	ld e, $04
	ld hl, Data_8a191
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_8a1c9
	scall LoadMapObjects
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	jp .asm_8a24c
.asm_8a23d:
	ld e, $03
	ld hl, Data_8a1c9
	scall LoadMapObjects
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_8a24c:
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468d4
	scall LandmarkSign
	ret

Data_8a25b:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $18, $01, $18, $01, $09, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a284:
	push af
	ld a, e
	or a
	jp nz, .asm_8a2da
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007a
	scall CheckEventFlag
	or a
	jp nz, .asm_8a2d4
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a2cb
	ld de, Data_8a2dc
	ld hl, Data_8a25b
	scall ScriptedBattle
	or a
	jp nz, .asm_8a2ba
	jp .asm_8a2da
.asm_8a2ba:
	ld e, $01
	ld hl, $007a
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_429a1
	scall PrintTextStandard
	jp .asm_8a2d1
.asm_8a2cb:
	hltext_tree_pointer TreeBitstreamText_429d1
	scall PrintTextStandard
.asm_8a2d1:
	jp .asm_8a2da
.asm_8a2d4:
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
.asm_8a2da:
	pop bc
	ret

Data_8a2dc:
	dstr "ロッカー"

Data_8a2e1:
	db $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $52, $01, $52, $01, $09, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a30a:
	push af
	ld a, e
	or a
	jp nz, .asm_8a360
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007b
	scall CheckEventFlag
	or a
	jp nz, .asm_8a35a
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a351
	ld de, Data_8a362
	ld hl, Data_8a2e1
	scall ScriptedBattle
	or a
	jp nz, .asm_8a340
	jp .asm_8a360
.asm_8a340:
	ld e, $01
	ld hl, $007b
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_429b8
	scall PrintTextStandard
	jp .asm_8a357
.asm_8a351:
	hltext_tree_pointer TreeBitstreamText_429d1
	scall PrintTextStandard
.asm_8a357:
	jp .asm_8a360
.asm_8a35a:
	hltext_tree_pointer TreeBitstreamText_429b8
	scall PrintTextStandard
.asm_8a360:
	pop bc
	ret

Data_8a362:
	dstr "(かいしゃいん)"

Data_8a36b:
	db $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $33, $01, $33, $01, $09, $17, $05, $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a393:
	push af
	ld a, e
	or a
	jp nz, .asm_8a3ea
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007c
	scall CheckEventFlag
	or a
	jp nz, .asm_8a3e4
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a3db
	ld de, Data_8a3ec
	ld hl, Data_8a36b
	scall ScriptedBattle
	or a
	jp nz, .asm_8a3ca
	jp .asm_8a3ea
.asm_8a3ca:
	ld e, $01
	ld hl, $007c
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	jp .asm_8a3e1
.asm_8a3db:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
.asm_8a3e1:
	jp .asm_8a3ea
.asm_8a3e4:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
.asm_8a3ea:
	pop bc
	ret

Data_8a3ec:
	dstr "(おねえさん)"

Data_8a3f4:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $90, $01, $90, $02, $09, $04, $17, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_84a1d:
	push af
	ld a, e
	or a
	jp nz, .asm_8a473
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007d
	scall CheckEventFlag
	or a
	jp nz, .asm_8a46d
	hltext_tree_pointer TreeBitstreamText_4297c
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a464
	ld de, Data_8a475
	ld hl, Data_8a3f4
	scall ScriptedBattle
	or a
	jp nz, .asm_8a453
	jp .asm_8a473
.asm_8a453:
	ld e, $01
	ld hl, $007d
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
	jp .asm_8a46a
.asm_8a464:
	hltext_tree_pointer TreeBitstreamText_429ca
	scall PrintTextStandard
.asm_8a46a:
	jp .asm_8a473
.asm_8a46d:
	hltext_tree_pointer TreeBitstreamText_429dc
	scall PrintTextStandard
.asm_8a473:
	pop bc
	ret

Data_8a475:
	dstr "(しﾞょしこうせい)"

Func_8a480:
	push af
	ld hl, sp+$01
	ld a, [hl]
	dec a
	ld hl, sp+$01
	ld [hl], a
	ld a, e
	or a
	jp nz, .asm_8a5a3
	ld hl, $00d8
	scall CheckEventFlag
	or a
	jp nz, .asm_8a59d
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $0f
	ld a, $0e
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $0e
	ld e, $0d
	ld a, $0c
	scall Func_80e8d
	ld e, $01
	ld hl, $00d8
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $09
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	jp .asm_8a5a3
.asm_8a59d:
	hltext_tree_pointer TreeBitstreamText_3f79e
	scall PrintTextStandard
.asm_8a5a3:
	pop bc
	ret

Func_8a5a5:
	ld a, e
	or a
	jp nz, .asm_8a5bf
	ld a, [wc790]
	or a
	jp z, .asm_8a5b9
	ld a, [wc790]
	cp $07
	jp nz, .asm_8a5bf
.asm_8a5b9:
	hltext_tree_pointer TreeBitstreamText_4706a
	scall PrintTextStandard
.asm_8a5bf:
	ret

Data_8a5c0:
	db $01, $0a, $01, $01, $05, $1e, $01, $0a, $01, $0b, $2e, $12, $0a, $01, $01, $05, $1e, $12, $0a, $12, $0b, $2e, $0f, $04, $01, $01, $05, $20, $0f, $04, $0f, $05, $2e

Data_8a5e1:
	db $13, $13, $01, $01, $0f, $04

Func_8a5e7:
	ld hl, $0086
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8a606
	ld hl, Data_8a5e1
	scall Func_80d9b
	scall Func_80f02
	scall AllocateSpaceForWarps
	ld e, $03
	ld hl, Data_8a5c0
	scall LoadWarps
.asm_8a606:
	ret

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
	call Func_8a93c
	ld hl, Func_8a93c
	scall Func_80f11
	ld e, $02
	ld hl, Data_8a607
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8a61d
	scall LoadEncounters
	ld e, $04
	ld hl, Data_8a663
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_8a6de
	ld a, [wc790]
	cp $07
	jp nc, .asm_8a6de
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
.asm_8a6de:
	ld a, $09
	scall PlayMusic
	ld a, $03
	ld [wc7e2], a
	ld hl, $0086
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8a71a
	ld hl, $0107
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8a70a
	ld c, $03
	ld e, $0e
	ld a, $03
	scall Func_80080
	jp .asm_8a71a
.asm_8a70a:
	ld c, $05
	ld e, $10
	ld a, $03
	scall Func_80080
	ld e, $03
	ld a, $03
	scall SpriteFace
.asm_8a71a:
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468e0
	scall LandmarkSign
	ret

Func_8a724:
	ld a, e
	or a
	jp nz, .asm_8a74f
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
	ld a, $09
	scall PlayMusic
.asm_8a74f:
	ret

Data_8a750:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $6b, $01, $6b, $03, $0f, $17, $17, $0a, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a779:
	push af
	ld a, e
	or a
	jp nz, .asm_8a7cf
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007e
	scall CheckEventFlag
	or a
	jp nz, .asm_8a7c9
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a7c0
	ld de, Data_8a7d1
	ld hl, Data_8a750
	scall ScriptedBattle
	or a
	jp nz, .asm_8a7af
	jp .asm_8a7cf
.asm_8a7af:
	ld e, $01
	ld hl, $007e
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_429b8
	scall PrintTextStandard
	jp .asm_8a7c6
.asm_8a7c0:
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
.asm_8a7c6:
	jp .asm_8a7cf
.asm_8a7c9:
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
.asm_8a7cf:
	pop bc
	ret

Data_8a7d1:
	dstr "ウﾞォーカル"

Data_8a7d8:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a801:
	push af
	ld a, e
	or a
	jp nz, .asm_8a857
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $007f
	scall CheckEventFlag
	or a
	jp nz, .asm_8a851
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a848
	ld de, Data_8a859
	ld hl, Data_8a7d8
	scall ScriptedBattle
	or a
	jp nz, .asm_8a837
	jp .asm_8a857
.asm_8a837:
	ld e, $01
	ld hl, $007f
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_4297c
	scall PrintTextStandard
	jp .asm_8a84e
.asm_8a848:
	hltext_tree_pointer TreeBitstreamText_429ca
	scall PrintTextStandard
.asm_8a84e:
	jp .asm_8a857
.asm_8a851:
	hltext_tree_pointer TreeBitstreamText_429a1
	scall PrintTextStandard
.asm_8a857:
	pop bc
	ret

Data_8a859:
	dstr "コキﾞャル"

Data_8a85f:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $71, $01, $71, $03, $0f, $09, $09, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8a888:
	db $0e, $03, $ff, $ff

Data_8a88c:
	db $0f, $05, $10, $05, $ff, $ff

Func_8a892:
	push af
	ld a, e
	or a
	jp nz, .asm_8a92e
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0086
	scall CheckEventFlag
	or a
	jp nz, .asm_8a915
	hltext_tree_pointer TreeBitstreamText_42cd5
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8a90c
	ld de, Data_8a930
	ld hl, Data_8a85f
	scall ScriptedBattle
	or a
	jp nz, .asm_8a8c8
	jp .asm_8a92e
.asm_8a8c8:
	hltext_tree_pointer TreeBitstreamText_42d27
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_8a8eb
	ld bc, Data_8a888
	ld e, $22
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	ld e, $01
	ld hl, $0107
	scall EventFlagAction
	jp .asm_8a8f6
.asm_8a8eb:
	ld bc, Data_8a88c
	ld e, $22
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_8a8f6:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, $0086
	scall EventFlagAction
	jp .asm_8a912
.asm_8a90c:
	hltext_tree_pointer TreeBitstreamText_42d11
	scall PrintTextStandard
.asm_8a912:
	jp .asm_8a92e
.asm_8a915:
	ld hl, $001f
	scall CheckEventFlag
	or a
	jp nz, .asm_8a928
	hltext_tree_pointer TreeBitstreamText_42d27
	scall PrintTextStandard
	jp .asm_8a92e
.asm_8a928:
	hltext_tree_pointer TreeBitstreamText_3d897
	scall PrintTextStandard
.asm_8a92e:
	pop bc
	ret

Data_8a930:
	dstr "ソﾞッキー"

Data_8a936:
	db $13, $13, $01, $01, $0f, $04

Func_8a93c:
	ld hl, Data_8a936
	scall Func_80d9b
	scall Func_80f02
	ret

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
	ld e, $02
	ld hl, Data_8a946
	scall LoadWarps
	ld e, $01
	ld hl, Data_8a95c
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8a961
	scall LoadEncounters
	ld e, $0a
	ld hl, Data_8a9a7
	scall LoadMapObjects
	ld hl, $0080
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8aa70
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_8aa70:
	ld hl, $0081
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8aa90
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
.asm_8aa90:
	ld hl, $0082
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8aab0
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
.asm_8aab0:
	ld hl, $0083
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8aac9
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
.asm_8aac9:
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468ec
	scall LandmarkSign
	ret

Func_8aad8:
	ld a, e
	or a
	jp nz, .asm_8aae0
	call Func_8ab66
.asm_8aae0:
	ret

Data_8aae1:
	db $09, $0a, $ff, $ff

Data_8aae5:
	db $0a, $0a, $ff, $ff

Func_8aae9:
	ld a, e
	cp $02
	jp nz, .asm_8ab38
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ab24
	cp $0a
	jp z, .asm_8ab15
	cp $09
	jp nz, .asm_8ab30
	ld e, $01
	xor a
	scall SpriteFace
	jp .asm_8ab30
.asm_8ab15:
	ld bc, Data_8aae1
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	jp .asm_8ab30
.asm_8ab24:
	ld bc, Data_8aae5
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
.asm_8ab30:
	ld a, $03
	scall PlayerFace
	call Func_8ab66
.asm_8ab38:
	ret

Data_8ab39:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $17, $01, $10, $1f, $07, $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ab62:
	db $08, $05, $ff, $ff

Func_8ab66:
	hltext_tree_pointer TreeBitstreamText_429a1
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471cf
	scall PrintTextStandard
.asm_8ab72:
	ld de, Data_8abb9
	ld hl, Data_8ab39
	scall Func_802ef
	or a
	jp nz, .asm_8ab88
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ab72
	ret
.asm_8ab88:
	hltext_tree_pointer TreeBitstreamText_429a1
	scall PrintTextStandard
	ld bc, Data_8ab62
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0080
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
	ret

Data_8abb9:
	dstr "コキﾞャル"

Func_8abbf:
	ld a, e
	or a
	jp nz, .asm_8abc7
	call Func_8ac50
.asm_8abc7:
	ret

Data_8abc8:
	db $0a, $09, $ff, $ff

Func_8abcc:
	ld a, e
	cp $02
	jp nz, .asm_8ac22
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ac0d
	cp $0a
	jp z, .asm_8abfe
	cp $08
	jp nz, .asm_8ac1f
	ld e, $03
	ld a, $02
	scall SpriteFace
	ld a, $01
	scall PlayerFace
	jp .asm_8ac1f
.asm_8abfe:
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	jp .asm_8ac1f
.asm_8ac0d:
	ld bc, Data_8abc8
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
.asm_8ac1f:
	call Func_8ac50
.asm_8ac22:
	ret

Data_8ac23:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $0e, $01, $10, $04, $17, $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ac4c:
	db $09, $04, $ff, $ff

Func_8ac50:
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471cf
	scall PrintTextStandard
.asm_8ac5c:
	ld de, Data_8acac
	ld hl, Data_8ac23
	scall Func_802ef
	or a
	jp nz, .asm_8ac72
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ac5c
	ret
.asm_8ac72:
	hltext_tree_pointer TreeBitstreamText_4298a
	scall PrintTextStandard
	ld bc, Data_8ac4c
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
	ld e, $01
	ld hl, $0081
	scall EventFlagAction
	ret

Data_8acac:
	dstr "ウﾞォーカル"

Func_8acb3:
	ld a, e
	or a
	jp nz, .asm_8acbb
	call Func_8ad46
.asm_8acbb:
	ret

Data_8acbc:
	db $09, $08, $ff, $ff

Func_8acc0:
	ld a, e
	cp $02
	jp nz, .asm_8ad16
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ad07
	cp $09
	jp z, .asm_8acf8
	cp $08
	jp nz, .asm_8ad13
	ld bc, Data_8acbc
	ld e, $22
	ld a, $05
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ad13
.asm_8acf8:
	ld e, $03
	ld a, $05
	scall SpriteFace
	ld a, $01
	scall PlayerFace
	jp .asm_8ad13
.asm_8ad07:
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld a, $03
	scall PlayerFace
.asm_8ad13:
	call Func_8ad46
.asm_8ad16:
	ret

Data_8ad17:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ad40:
	db $0a, $04, $0d, $04, $ff, $ff

Func_8ad46:
	hltext_tree_pointer TreeBitstreamText_429d1
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471cf
	scall PrintTextStandard
.asm_8ad52:
	ld de, Data_8ada8
	ld hl, Data_8ad17
	scall Func_802ef
	or a
	jp nz, .asm_8ad68
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ad52
	ret
.asm_8ad68:
	hltext_tree_pointer TreeBitstreamText_4297c
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_429dc
	scall PrintTextStandard
	ld bc, Data_8ad40
	ld e, $22
	ld a, $05
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
	ld e, $01
	ld hl, $0082
	scall EventFlagAction
	ret

Data_8ada8:
	dstr "(しﾞょしこうせい)"

Func_8adb3:
	ld a, e
	or a
	jp nz, .asm_8adbb
	call Func_8ae50
.asm_8adbb:
	ret

Data_8adbc:
	db $09, $07, $ff, $ff

Data_8adc0:
	db $0a, $07, $ff, $ff

Func_8adc4:
	ld a, e
	cp $02
	jp nz, .asm_8ae20
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld a, [wMapX]
	add a, $05
	cp $0a
	jp z, .asm_8ae11
	cp $09
	jp z, .asm_8adfc
	cp $08
	jp nz, .asm_8ae1d
	ld bc, Data_8adbc
	ld e, $22
	ld a, $08
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ae1d
.asm_8adfc:
	ld bc, Data_8adc0
	ld e, $22
	ld a, $08
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ae1d
.asm_8ae11:
	ld e, $03
	ld a, $08
	scall SpriteFace
	ld a, $01
	scall PlayerFace
.asm_8ae1d:
	call Func_8ae50
.asm_8ae20:
	ret

Data_8ae21:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $6b, $01, $10, $17, $17, $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ae4a:
	db $0b, $04, $0d, $04, $ff, $ff

Func_8ae50:
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471cf
	scall PrintTextStandard
.asm_8ae5c:
	ld de, Data_8aea5
	ld hl, Data_8ae21
	scall Func_802ef
	or a
	jp nz, .asm_8ae72
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ae5c
	ret
.asm_8ae72:
	hltext_tree_pointer TreeBitstreamText_42998
	scall PrintTextStandard
	ld bc, Data_8ae4a
	ld e, $22
	ld a, $08
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
	ld e, $01
	ld hl, $0083
	scall EventFlagAction
	ret

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
	ld e, $02
	ld hl, Data_8aeab
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8aec1
	scall LoadEncounters
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_468f8
	scall LandmarkSign
	ret

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
	ld e, $02
	ld hl, Data_8af2b
	scall LoadWarps
	ld e, $01
	ld hl, Data_8af41
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8af46
	scall LoadEncounters
	ld e, $04
	ld hl, Data_8af8c
	scall LoadMapObjects
	ld hl, $0084
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8b001
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_8b001:
	ld hl, $0085
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8b01a
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_8b01a:
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_46904
	scall LandmarkSign
	ret

Data_8b029:
	db $05, $0e, $03, $0c, $ff, $ff

Data_8b02f:
	db $04, $0f, $03, $0c, $ff, $ff

Data_8b035:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $18, $01, $18, $03, $11, $09, $09, $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b05e:
	push af
	ld a, e
	or a
	jp nz, .asm_8b109
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b07f:
	ld de, Data_8b10b
	ld hl, Data_8b035
	scall Func_803f5
	or a
	jp nz, .asm_8b097
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b07f
	jp .asm_8b109
.asm_8b097:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_8b029
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	xor a
	scall PlayerFace
	ld e, $02
	ld a, $01
	scall SpriteFace
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b0c6:
	ld de, Data_8b111
	ld hl, Data_8b035
	scall Func_803f5
	or a
	jp nz, .asm_8b0de
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b0c6
	jp .asm_8b109
.asm_8b0de:
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	ld bc, Data_8b02f
	ld e, $22
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0084
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
.asm_8b109:
	pop bc
	ret

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
	ld a, e
	or a
	jp nz, .asm_8b1fd
	ld a, $01
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b166:
	ld de, Data_8b1fe
	ld hl, Data_8b127
	scall Func_803f5
	or a
	jp nz, .asm_8b17e
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b166
	jp .asm_8b1fd
.asm_8b17e:
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	ld bc, Data_8b11d
	ld e, $22
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_8b1a7
	ld a, $03
	scall PlayerFace
	jp .asm_8b1b9
.asm_8b1a7:
	ld bc, Data_8b123
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	xor a
	scall SpriteFace
.asm_8b1b9:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b1c5:
	ld de, Data_8b204
	ld hl, Data_8b127
	scall Func_803f5
	or a
	jp nz, .asm_8b1dd
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b1c5
	jp .asm_8b1fd
.asm_8b1dd:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_8b117
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0084
	scall EventFlagAction
.asm_8b1fd:
	ret

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
	push af
	ld a, e
	or a
	jp nz, .asm_8b2fe
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b264:
	ld de, Data_8b300
	ld hl, Data_8b21a
	scall Func_803f5
	or a
	jp nz, .asm_8b27c
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b264
	jp .asm_8b2fe
.asm_8b27c:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_8b20a
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld bc, Data_8b210
	ld e, $22
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	ld a, $03
	scall SpriteFace
	ld a, $01
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b2bb:
	ld de, Data_8b306
	ld hl, Data_8b21a
	scall Func_803f5
	or a
	jp nz, .asm_8b2d3
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b2bb
	jp .asm_8b2fe
.asm_8b2d3:
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	ld bc, Data_8b214
	ld e, $22
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0085
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
.asm_8b2fe:
	pop bc
	ret

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
	push af
	ld a, e
	or a
	jp nz, .asm_8b400
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b366:
	ld de, Data_8b402
	ld hl, Data_8b31c
	scall Func_803f5
	or a
	jp nz, .asm_8b37e
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b366
	jp .asm_8b400
.asm_8b37e:
	hltext_tree_pointer TreeBitstreamText_429aa
	scall PrintTextStandard
	ld bc, Data_8b30c
	ld e, $22
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld bc, Data_8b312
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	ld a, $02
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_471a6
	scall PrintTextStandard
.asm_8b3bd:
	ld de, Data_8b408
	ld hl, Data_8b31c
	scall Func_803f5
	or a
	jp nz, .asm_8b3d5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b3bd
	jp .asm_8b400
.asm_8b3d5:
	hltext_tree_pointer TreeBitstreamText_42972
	scall PrintTextStandard
	ld bc, Data_8b316
	ld e, $22
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0085
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
.asm_8b400:
	pop bc
	ret


Data_8b402:
	dstr "コキﾞャル"

Data_8b408:
	dstr "コキﾞャル"

Data_8b40e:
	db $05, $05, $01, $01, $05, $23, $05, $05, $06, $05, $2e

Data_8b419:
	db $27, $09, $0e, $01, $39

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
	map_object $1e, $0c, $0a, $04, $01, $01, $02, $04, $00, 0, 0
	map_object $ff, $00, $09, $08, $03, $01, $00, $04, $01, Func_8b4ea, 0

Data_8b480:
	map_object $ff, $00, $0d, $03, $01, $01, $00, $04, $00, Func_8b53d, 0
	map_object $ff, $00, $0e, $03, $01, $01, $00, $04, $00, Func_8b58c, 0

Func_8b49c:: ; 8b49c
	ld e, $01
	ld hl, Data_8b40e
	scall LoadWarps
	ld e, $01
	ld hl, Data_8b419
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8b41e
	scall LoadEncounters
	ld hl, $003c
	scall CheckEventFlag
	or a
	jp nz, .asm_8b4cb
	ld e, $02
	ld hl, Data_8b464
	scall LoadMapObjects
.asm_8b4cb:
	ld e, $02
	ld hl, Data_8b480
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_46910
	scall LandmarkSign
	ret

Data_8b4e2:
	db $0a, $06, $ff, $ff

Data_8b4e6:
	db $0d, $04, $ff, $ff

Func_8b4ea:
	ld a, e
	cp $02
	jp nz, .asm_8b53c
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_8b4e2
	ld a, $22
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_3afdd
	scall PrintTextWithNPCName
	ld bc, Data_8b4e6
	ld e, $22
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $09
	scall PlayMusic
	ld e, $01
	ld hl, $003c
	scall EventFlagAction
.asm_8b53c:
	ret

Func_8b53d:
	ld a, e
	or a
	jp nz, .asm_8b58b
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_8b54c
	jp .asm_8b58b
.asm_8b54c:
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_8b560
	hltext_tree_pointer TreeBitstreamText_47037
	scall PrintTextStandard
	jp .asm_8b58b
.asm_8b560:
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld l, $06
	push hl
	ld c, $07
	ld e, $00
	ld a, $1c
	scall Func_80dff
	pop bc
	ld hl, $001e
	scall ScriptSleep
.asm_8b58b:
	ret

Func_8b58c:
	ld a, e
	or a
	jp nz, .asm_8b5dc
	ld a, [wc790]
	or a
	jp z, .asm_8b5a9
	ld a, [wc790]
	cp $07
	jp nc, .asm_8b5a9
	hltext_tree_pointer TreeBitstreamText_47041
	scall PrintTextStandard
	jp .asm_8b5dc
.asm_8b5a9:
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_8b5c9
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	ld a, $32
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_47029
	scall PrintTextStandard
	jp .asm_8b5dc
.asm_8b5c9:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	ld a, $28
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_4701b
	scall PrintTextStandard
.asm_8b5dc:
	ret

Data_8b5dd:
	db $07, $04, $01, $01, $03, $0c, $15, $12, $16, $12, $2e, $01, $0b, $02, $01, $03, $0e, $10, $08, $10, $09, $2e

Data_8b5f3:
	db $03, $08, $0b, $03, $18

Data_8b5f8:
IF DEF(SUN)
	db $00, $03, $09, $09, $05, $09, $0b, $2d, $01, $06, $00, $0a, $0a, $00
	db $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00
	db $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00
	db $00, $03, $09, $09, $23, $0c, $0e, $4f, $1e, $1e, $00, $0c, $06, $00
	db $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00
ELIF DEF(STAR)
	db $00, $03, $09, $09, $46, $09, $0b, $78, $14, $14, $00, $0a, $0a, $00
	db $00, $03, $09, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $03, $09, $00
	db $00, $03, $09, $09, $49, $0b, $0d, $02, $02, $02, $02, $03, $08, $00
	db $00, $03, $09, $09, $25, $0c, $0e, $79, $18, $18, $00, $0c, $06, $00
	db $00, $03, $09, $09, $6a, $0e, $10, $7f, $03, $0c, $00, $0d, $02, $00
ENDC

Data_8b63e:
	map_object $ff, $00, $03, $09, $03, $01, $00, $04, $00, Func_8b6ae, 0
	map_object $0a, $04, $01, $03, $01, $01, $02, $04, $00, Func_8b767, 0

Func_8b65a:: ; 8b65a
	ld e, $02
	ld hl, Data_8b5dd
	scall LoadWarps
	ld e, $01
	ld hl, Data_8b5f3
	scall Func_80ce7
	ld e, $02
	ld hl, Data_8b63e
	scall LoadMapObjects
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_8b5f8
	scall LoadEncounters
	ld a, $04
	ld [wc7e2], a
	ld hl, $0000
	scall CheckEventFlag
	or a
	jp nz, .asm_8b696
	ld a, $01
	ld [wc7da], a
	jp .asm_8b69a
.asm_8b696:
	xor a
	ld [wc7da], a
.asm_8b69a:
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	hltext_tree_pointer TreeBitstreamText_46894
	scall LandmarkSign
	ret

Func_8b6ae:
	ld a, e
	or a
	jp nz, .asm_8b73d
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_8b6db
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_8b737
.asm_8b6db:
	ld a, [wc790]
	or a
	jp z, .asm_8b72e
	ld a, [wc790]
	cp $06
	jp nc, .asm_8b72e
	hltext_tree_pointer TreeBitstreamText_46f30
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8b72b
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
	ld a, $44
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	xor a
	scall PlayerFace
	ld l, $1e
	push hl
	ld c, $2e
	ld e, $03
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_8b72b:
	jp .asm_8b734
.asm_8b72e:
	hltext_tree_pointer TreeBitstreamText_470f0
	scall PrintTextStandard
.asm_8b734:
	jp .asm_8b73d
.asm_8b737:
	hltext_tree_pointer TreeBitstreamText_470d8
	scall PrintTextStandard
.asm_8b73d:
	ret

Data_8b73e:
	db $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $39, $01, $39, $02, $0e, $1f, $1e, $08, $19, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b767:
	push af
	ld a, e
	or a
	jp nz, .asm_8b7bd
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0072
	scall CheckEventFlag
	or a
	jp nz, .asm_8b7b7
	hltext_tree_pointer TreeBitstreamText_42b7b
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_8b7ae
	ld de, Data_8b7bf
	ld hl, Data_8b73e
	scall ScriptedBattle
	or a
	jp nz, .asm_8b79d
	jp .asm_8b7bd
.asm_8b79d:
	ld e, $01
	ld hl, $0072
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42b85
	scall PrintTextStandard
	jp .asm_8b7b4
.asm_8b7ae:
	hltext_tree_pointer TreeBitstreamText_42c16
	scall PrintTextStandard
.asm_8b7b4:
	jp .asm_8b7bd
.asm_8b7b7:
	hltext_tree_pointer TreeBitstreamText_42b85
	scall PrintTextStandard
.asm_8b7bd:
	pop bc
	ret

Data_8b7bf:
	dstr "アヤシケﾞ(くん)"

