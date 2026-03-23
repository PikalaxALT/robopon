INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 05", ROMX
INCLUDE "engine/menu/menu.asm"

Data_15399: ; 15399
	db $0d, $0d, $0f, $0b, $10, $10, $14, $07, $14, $06, $0b, $0b, $0a, $0a, $12, $05
	db $0f, $0e, $04, $0d, $03, $03, $0f, $09, $02, $03, $03, $02, $03, $0e, $0f, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01

Data_153c6: ; 153c6
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $17, $00, $03, $0c
	db $0d, $0e, $0f, $10, $11, $12, $13, $14, $2b, $61, $00, $04, $0e, $15, $16, $17
	db $18, $19, $1a, $1b, $1c, $1d, $2b, $4c, $60, $00, $05, $14, $1e, $1f, $20, $21
	db $22, $23, $24, $25, $00, $06, $10, $1b, $1c, $26, $27, $28, $29, $2a, $2b, $2c
	db $2d, $62, $78, $79, $00, $07, $0f, $18, $28, $2e, $2f, $30, $31, $32, $33, $34
	db $58, $59, $5f, $6c, $00, $08, $30, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
	db $3e, $3f, $55, $5c, $64, $7d, $7e, $7f, $00, $4d, $5a, $6d, $7b, $83, $84, $00
	db $12, $2c, $33, $38, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $56, $62
	db $6c, $86, $93, $00, $24, $45, $6b, $76, $86, $00, $3e, $48, $49, $4f, $54, $5b
	db $6a, $6b, $6c, $93, $00, $1d, $39, $47, $4a, $4b, $4c, $4d, $4e, $4f, $5d, $00
	db $3f, $4e, $6a, $6e, $71, $74, $75, $86, $87, $00, $21, $44, $50, $51, $52, $53
	db $54, $5d, $6d, $00, $13, $19, $20, $29, $43, $4b, $52, $55, $56, $57, $58, $59
	db $5a, $5b, $5d, $5e, $6e, $00, $09, $1a, $22, $3d, $00, $11, $31, $32, $3a, $3b
	db $42, $5f, $60, $61, $77, $79, $7c, $7f, $81, $00, $3c, $77, $88, $89, $8a, $8b
	db $8c, $8d, $8e, $8f, $90, $91, $92, $00, $0a, $2d, $53, $00, $37, $3a, $6d, $6e
	db $6f, $70, $71, $72, $73, $74, $75, $87, $00, $5f, $60, $00, $7d, $80, $00, $23
	db $2a, $57, $5e, $61, $63, $65, $66, $76, $77, $78, $7a, $7b, $7c, $00, $0b, $25
	db $46, $5c, $68, $69, $7e, $82, $00, $5e, $00, $96, $97, $00, $62, $63, $00, $63
	db $00, $94, $95, $00, $34, $64, $67, $69, $72, $73, $74, $78, $80, $81, $82, $83
	db $85, $00, $64, $75, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85
	db $00, $88, $00, $89, $00, $8a, $00, $8b, $00, $8c, $00, $8d, $00, $8e, $00, $8f
	db $00, $90, $00, $91, $00, $92, $00, $00, $00

Func_1551f::
	push bc
	push bc
	push hl
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	pop de
	push hl
	ld hl, $64
	call malloc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	xor a
	ld de, $19
	ld a, $3
	call GetBanks
	ld c, a
	pop hl
	push hl
	ld de, wSaveBlock1_c98e
	add hl, de
IF DEF(LANG_JP)
	ld l, [hl]
	ld h, $0
	swap_de_hl
	ld a, e
	and $3f
	ld l, a
ELIF DEF(LANG_EN)
	ld a, [hl]
	and $3f
	ld l, a
ENDC
	ld h, $0
	swap_de_hl
	push de
	ld a, c
	call GetSRAMBank
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
ELIF DEF(LANG_EN)
	call Func_14001
ENDC
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	call GetHLAtSPPlus4
	ld de, -1
	call Func_1564a
	ld c, a
	push bc
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	xor a
	pop bc
	pop de
.asm_155bb: ; 155bb (5:55bb)
	push de
	push bc
	call WaitAorBButtonOverworld_17a44
	pop bc
	pop de
	cp $10
	jp nz, .asm_15619
	ld a, c
	ld hl, Data_15399 - 1
	add hl, de
	cp [hl]
	jp nc, .asm_155f9
	push de
	push bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	pop bc
	call GetHLAtSPPlus4
	ld e, c
	ld d, $0
	call Func_1564a
	ld c, a
	push bc
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	pop de
	jp .asm_15616

.asm_155f9: ; 155f9 (5:55f9)
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	jp .asm_1563e

.asm_15616: ; 15616 (5:5616)
	jp .asm_1563b

.asm_15619: ; 15619 (5:5619)
	cp $20
	jp nz, .asm_1563b
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	jp .asm_1563e

.asm_1563b: ; 1563b (5:563b)
	jp .asm_155bb

.asm_1563e: ; 1563e (5:563e)
	call GetHLAtSPPlus4
	call free
	ld hl, $8000
	pop bc
	pop bc
	ret

Func_1564a: ; 1564a (5:564a)
	push hl
	push de
	add sp, -$16
	ld de, $19
	ld a, $3
	call GetBanks
	ld c, a
	read_hl_from_sp_plus $1a
	ld de, wSaveBlock1_c98e
	add hl, de
IF DEF(LANG_JP)
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $1a
	read_hl_from_sp_plus $1a
	ld a, l
ELIF DEF(LANG_EN)
	ld a, [hl]
ENDC
	and $3f
	ld l, a
	ld h, $0
	write_hl_to_sp_plus $1a
	ld a, c
	call GetSRAMBank
	ld hl, sp+$15
	ld [hl], $1
	read_hl_from_sp_plus $18
	ld c, l
	ld b, h
	ld a, c
	and b
	inc a
	jp nz, .asm_15703
	ld bc, -1
	read_hl_from_sp_plus $1a
	ld e, l
	ld hl, sp+$0
	call Func_157c5
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call Func_16019
	ld de, Data_157b6
IF DEF(LANG_JP)
	lb hl, -1, -1
ELIF DEF(LANG_EN)
	lb hl, 1, 14
ENDC
	call PlaceStringDEatCoordHL
IF DEF(LANG_EN)
	ld de, Data_157b6_2
	lb hl, 1, 15
	call PlaceStringDEatCoordHL
ENDC
	ld bc, $0
	xor a
.asm_156af: ; 156af (5:56af)
	cp $3
	jp nc, .asm_156f9
	push af
	push bc
	read_hl_from_sp_plus $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call FindFirstNonzero
	swap_de_hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, .asm_156ec
	inc bc
	push bc
	ld hl, sp+$6
	ld c, l
	ld b, h
	ld de, $10
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	call Func_16019
	pop bc
.asm_156ec: ; 156ec (5:56ec)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp .asm_156af

.asm_156f9: ; 156f9 (5:56f9)
	ld hl, $0
	write_hl_to_sp_plus $18
	jp .asm_15780

.asm_15703: ; 15703 (5:5703)
	ld hl, sp+$14
	ld [hl], $0
.asm_15707: ; 15707 (5:5707)
	ld hl, sp+$14
	ld a, [hl]
	cp $2
	jp nc, .asm_15780
	ld hl, sp+$15
	ld [hl], $1
	xor a
.asm_15714: ; 15714 (5:5714)
	cp $3
	jp nc, .asm_15769
	push af
	push bc
	read_hl_from_sp_plus $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call FindFirstNonzero
	swap_de_hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, .asm_1575c
	push bc
	ld hl, sp+$6
	ld c, l
	ld b, h
	ld hl, sp+$1a
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $e
	add hl, de
	swap_de_hl
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	call Func_16019
	pop bc
	inc bc
.asm_1575c: ; 1575c (5:575c)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp .asm_15714

.asm_15769: ; 15769 (5:5769)
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp nz, .asm_15776
	ld l, c
	ld h, b
	write_hl_to_sp_plus $18
.asm_15776: ; 15776 (5:5776)
	ld hl, sp+$14
	ld a, [hl]
	inc a
	ld hl, sp+$14
.asm_1577b
	ld [hl], a
	jp .asm_15707

.asm_15780: ; 15780 (5:5780)
	read_hl_from_sp_plus $1a
	ld de, Data_15399 - 1
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, .asm_157aa
	ld e, $10
	ld a, $12
	call text_cursor_pos_set
IF DEF(LANG_EN)
	ld hl, $8a
	push hl
ENDC
	ld hl, Data_157c3
	push hl
	call printf
	pop bc
IF DEF(LANG_EN)
	pop bc
ENDC
	read_hl_from_sp_plus $18
	ld a, l
	jp .asm_157b3

.asm_157aa: ; 157aa (5:57aa)
	read_hl_from_sp_plus $1a
	ld de, Data_15399 - 1
	add hl, de
	ld a, [hl]
.asm_157b3: ; 157b3 (5:57b3)
	add sp, $1a
	ret

Data_157b6: ; 157b6
IF DEF(LANG_JP)
	dstr "(てﾞ つかえるわさﾞ)"
ELIF DEF(LANG_EN)
	dstr "The move you can"
Data_157b6_2:
	dstr "use with "
ENDC

Data_157c3: ; 157c3
IF DEF(LANG_JP)
	dstr "^"
ELIF DEF(LANG_EN)
	dstr "%c"
ENDC

Func_157c5: ; 157c5 (5:57c5)
	push hl
	push de
	push bc
	push bc
	ld hl, $0
	call WriteHLToSPPlus4
	ld a, c
	and b
	inc a
	jp nz, .asm_157ea
	ld c, $5
	call GetHLAtSPPlus8
	swap_de_hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, GETNAME_SOFTWARE
	dec hl
	call GetName
	jp .asm_15887

.asm_157ea: ; 157ea (5:57ea)
	push bc
	ld e, $0
.asm_157ed: ; 157ed (5:57ed)
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld l, a
	ld a, e
	cp l
	jp nc, .asm_1580d
	push de
	ld d, $0
	ld hl, Data_15399
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	pop de
	inc e
	jp .asm_157ed

.asm_1580d: ; 1580d (5:580d)
	pop bc
	call GetHLAtSPPlus4
	add hl, bc
	ld de, Data_153c6
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, Data_15399 - 1
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, .asm_1587e
	pop hl
	push hl
	ld a, l
	or h
	jp nz, .asm_1584b
	ld c, SOFTWARE_NAME_LENGTH
	call GetHLAtSPPlus8
	swap_de_hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, GETNAME_SOFTWARE
	dec hl
	call GetName
	jp .asm_1585a

.asm_1584b: ; 1584b (5:584b)
	ld c, $9
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus4
	inc h
	dec hl
	pop de
	call GetName
.asm_1585a: ; 1585a (5:585a)
	call GetHLAtSPPlus8
	call FindFirstNonzero
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld [hl], $7f
	inc hl
	call WriteHLToSPPlus8
IF DEF(LANG_JP)
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
	jp .asm_15887
ENDC

.asm_1587e: ; 1587e (5:587e)
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
.asm_15887: ; 15887 (5:5887)
	call GetHLAtSPPlus8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Pointers_1588f:
IF DEF(LANG_JP)
	dw Data_15895
	dw Data_158ae
	dw $0

Data_15895:
	dstr "フﾞート(そﾞくは) ソフト(の つけかえかﾞ)"

Data_158ae:
	dstr "(てﾞきないよ)"
ELIF DEF(LANG_EN)
	dw .line1
	dw .line2
	dw .line3
	dw .line4
	dw NULL

.line1 dstr "You can't install"
.line2 dstr "software"
.line3 dstr "into Boot Type"
.line4 dstr "Robopon."
ENDC

Func_158b7: ; 158b7
	add sp, -$76
	push af
IF DEF(LANG_JP)
	ld hl, sp+$2
	swap_de_hl
	ld hl, Pointers_1588f
	ld bc, $6
	call MemCopy
ENDC
	ld de, $19
	ld a, $3
	call GetBanks
IF DEF(LANG_JP)
	ld l, a
ELIF DEF(LANG_EN)
	ld c, a
ENDC
	pop af
IF DEF(LANG_JP)
	push hl
ENDC
	ld e, a
	ld d, $0
	ld hl, wSaveBlock1_c98e
	add hl, de
	ld a, [hl]
	and $3f
IF DEF(LANG_JP)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	ld e, [hl]
	ld hl, sp+$75
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08+1
	add hl, de
	ld e, [hl]
	ld hl, sp+$76
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08+2
	add hl, de
	ld e, [hl]
	ld hl, sp+$77
	ld [hl], e
ENDC
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
IF DEF(LANG_JP)
	pop hl
	push af
	push hl
ELIF DEF(LANG_EN)
	push af
	push bc
ENDC
	ld bc, $0
.asm_15951: ; 15951 (5:5951)
	ld l, c
	ld h, b
	ld de, $3
	call CompareHLtoDE
	jp nc, .asm_1598d
IF DEF(LANG_JP)
	ld hl, sp+$77
ELIF DEF(LANG_EN)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$72
	add hl, bc
	ld [hl], a
	ld hl, sp+$72
ENDC
	add hl, bc
	ld a, [hl]
	or a
	jp z, .asm_15989
	push bc
	set_farcall_addrs_hli Func_5601b
	pop bc
	push bc
	ld l, c
	ld h, b
	mulhl 20
	swap_de_hl
IF DEF(LANG_JP)
	ld hl, sp+$3d
ELIF DEF(LANG_EN)
	ld hl, sp+$38
ENDC
	add hl, de
	ld e, c
	ld c, $1
	call FarCall
	pop bc
.asm_15989: ; 15989 (5:5989)
	inc bc
	jp .asm_15951

.asm_1598d: ; 1598d (5:598d)
	pop hl
	ld a, l
	call GetSRAMBank
	pop af
	ld e, a
	dec e
	ld hl, sp+$6
	call GetRobotBaseStats
	ld hl, sp+$b
	ld a, [hl]
	push af
	call Func_15ff9
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $10d
	call Func_2230
	ld hl, Data_15aa2
	push hl
	call printf
	pop bc
IF DEF(LANG_JP)
	ld de, Data_15aa4
	ld hl, $a01
	call PlaceStringDEatCoordHL
	ld de, Data_15aae
	ld hl, $101
	call PlaceStringDEatCoordHL
ELIF DEF(LANG_EN)
	ld de, Data_15a8c_en
	ld hl, $a00
	call PlaceStringDEatCoordHL
	ld de, Data_15a96_en
	ld hl, $b01
	call PlaceStringDEatCoordHL
	ld de, Data_15a9a_en
	ld hl, $100
	call PlaceStringDEatCoordHL
	ld de, Data_15aa2_en
	ld hl, $201
	call PlaceStringDEatCoordHL
ENDC
	ld c, $7
	ld e, $a
	ld hl, $a02
	call Func_17e95
	ld c, $5
	ld e, $a
	ld hl, $a09
	call Func_17e95
IF DEF(LANG_JP)
	ld de, Data_15ab8
	ld hl, $c0a
	call PlaceStringDEatCoordHL
	ld de, Data_15ac3
	ld hl, $c0c
	call PlaceStringDEatCoordHL
ELIF DEF(LANG_EN)
	ld de, Data_15aa6_en
	ld hl, $b0a
	call PlaceStringDEatCoordHL
	ld de, Data_15aad_en
	ld hl, $c0b
	call PlaceStringDEatCoordHL
	ld de, Data_15ab2_en
	ld hl, $b0c
	call PlaceStringDEatCoordHL
ENDC
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, .asm_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, .asm_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, .asm_15a0e
IF DEF(LANG_JP)
	ld de, Data_15ace
ELIF DEF(LANG_EN)
	ld de, Data_15ab7_en
ENDC
	ld hl, $c03
	call PlaceStringDEatCoordHL
	jp .asm_15a64

.asm_15a0e: ; 15a0e (5:5a0e)
	ld hl, $0
	write_hl_to_sp_plus $39
.asm_15a15: ; 15a15 (5:5a15)
	read_hl_from_sp_plus $39
	ld de, $3
	call CompareHLtoDE
	jp nc, .asm_15a64
	read_hl_from_sp_plus $39
	swap_de_hl
	ld hl, sp+$75
	add hl, de
	ld a, [hl]
	or a
	jp z, .asm_15a58
	read_hl_from_sp_plus $39
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	swap_de_hl
	ld hl, sp+$39
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $39
	add hl, hl
	inc hl
	inc hl
	inc hl
	swap_de_hl
	ld hl, $c
	call Func_16019
.asm_15a58: ; 15a58 (5:5a58)
	read_hl_from_sp_plus $39
	inc hl
	write_hl_to_sp_plus $39
	jp .asm_15a15

.asm_15a64: ; 15a64 (5:5a64)
	pop af
	cp $b
	jp nz, .asm_15a9e
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	set_farcall_addrs_hli PrintMapText_
	ld c, $5
IF DEF(LANG_JP)
	ld hl, sp+$0
	swap_de_hl
ELIF DEF(LANG_EN)
	ld de, Pointers_1588f
ENDC
	ld hl, $10e
	call FarCall
	ld a, $ff
	jp .asm_15a9f

.asm_15a9e: ; 15a9e (5:5a9e)
	xor a
.asm_15a9f: ; 15a9f (5:5a9f)
	add sp, $76
	ret

Data_15aa2: ; 15aa2
	dstr "M"

IF DEF(LANG_JP)
Data_15aa4: ; 15aa4
	dstr "(そうひﾞ)ソフト"

Data_15aae: ; 15aae
	dstr "(もちもの)ソフト"

Data_15ab8: ; 15ab8
	dstr "(すへﾞてはすﾞす)"

Data_15ac3: ; 15ac3
	dstr "(つかえる わさﾞ)"

Data_15ace: ; 15ace
	dstr "ソフト(なし)"
ELIF DEF(LANG_EN)
Data_15a8c_en: dstr "Installed"
Data_15a96_en: dstr "S/W"
Data_15a9a_en: dstr "S/W you"
Data_15aa2_en: dstr "Own"
Data_15aa6_en: dstr "Remove"
Data_15aad_en: dstr "All?"
Data_15ab2_en: dstr "Move"
Data_15ab7_en: dstr "No S/W"
ENDC
INCLUDE "engine/get_name.asm"

Func_15bde:: ; 15bde
	push bc
	push bc
	push bc
	push bc
	push hl
	ld l, $f
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	call WriteHLToSPPlus7
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	ld de, $14
	call CompareHLtoDE
	jp nc, .asm_15c59
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld [wCurItem], a
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	call Func_16128
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
ELSE
	call Func_1401b
ENDC
	ld hl, $4000
	jp .asm_15fe4

.asm_15c59: ; 15c59 (5:5c59)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	ld de, $14
	call CompareHLtoDE
	jp c, .asm_15e9c
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	ld de, $17
	call CompareHLtoDE
	jp nc, .asm_15e9c
	ld a, [wCurItem]
	cp $ff
	jp z, .asm_15df5
	call Func_15ff9
	ld hl, sp+$2
	ld [hl], a
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$4
	ld [hl], a
	ld hl, wCurItem
	ld l, [hl]
	ld h, $0
	ld de, wSaveBlock1_c98e
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$1
	ld [hl], $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	add hl, bc
	ld a, [hl]
	or a
	jp z, .asm_15d0b
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
.asm_15d0b: ; 15d0b (5:5d0b)
	ld hl, sp+$3
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, .asm_15d27
	ld hl, sp+$1
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld c, a
	jp .asm_15d29

.asm_15d27: ; 15d27 (5:5d27)
	ld c, $0
.asm_15d29: ; 15d29 (5:5d29)
	ld a, e
	add a
	ld d, a
	add a
	add a
	add d
	ld e, a
	ld a, c
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, sp+$2
	add [hl]
	cp e
	jp c, .asm_15de5
	ld hl, sp+$3
	ld a, [hl]
IF DEF(LANG_EN)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	push hl
ENDC
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
IF DEF(LANG_JP)
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	add hl, bc
ELIF DEF(LANG_EN)
	pop de
	add hl, de
ENDC
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
IF DEF(LANG_JP)
	set_farcall_addrs_hli Func_4ec2b
	ld e, $1
	ld a, [wCurItem]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, .asm_15da0
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	jp .asm_15db0
.asm_15da0: ; 15da0 (5:5da0)
ELIF DEF(LANG_EN)
	set_farcall_addrs_hli Func_53c88
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	cp $1
	jp nz, .asm_15db0
ENDC
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
IF DEF(LANG_EN)
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	ld de, $9
	add hl, de
	ld a, c
	sub [hl]
	ld c, a
	inc hl
	ld a, b
	sbc a, [hl]
	ld b, a
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp c, .asm_15db0
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, .asm_15db0
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc a, $0
	ld [hl], a
ENDC
.asm_15db0: ; 15db0 (5:5db0)
IF DEF(LANG_EN)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], d
	inc hl
	ld [hl], e
ENDC
	set_farcall_addrs_hli Func_fb2ed
	ld a, [wc2e9]
	call FarCall
IF DEF(LANG_JP)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
ENDC
	ld a, $ff
	ld [wCurItem], a
	ld hl, $8000
	jp .asm_15fe4

.asm_15de5: ; 15de5 (5:5de5)
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	xor a
	call Func_15fe9
	ld hl, $4000
	jp .asm_15fe4

.asm_15df5: ; 15df5 (5:5df5)
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$4
	ld [hl], a
IF DEF(LANG_JP)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	add hl, bc
ELIF DEF(LANG_EN)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	pop de
	add hl, de
ENDC
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, .asm_15e96
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -$14
	add hl, de
	ld a, l
	ld [wCurItem], a
	ld a, $2
	call Func_15fe9
	or a
	jp z, .asm_15e59
	cp $2
	jp nz, .asm_15e91
.asm_15e59: ; 15e59 (5:5e59)
	or a
	jp nz, .asm_15e6d
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
.asm_15e6d: ; 15e6d (5:5e6d)
	ld a, $ff
	ld [wCurItem], a
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $8000
	jp .asm_15fe4

.asm_15e91: ; 15e91 (5:5e91)
	ld a, $ff
	ld [wCurItem], a
.asm_15e96: ; 15e96 (5:5e96)
	ld hl, $4000
	jp .asm_15fe4

.asm_15e9c: ; 15e9c (5:5e9c)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $17
	inc hl
	or [hl]
	jp nz, .asm_15fcb
	ld a, $1
	call Func_15fe9
	or a
	jp nz, .asm_15fc5
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
.asm_15ec2: ; 15ec2 (5:5ec2)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, .asm_15f9b
IF DEF(LANG_EN)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
ENDC
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
IF DEF(LANG_JP)
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
ELIF DEF(LANG_EN)
	add hl, bc
ENDC
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, .asm_15f91
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, .asm_15f5c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, .asm_15f34
	ld a, $3
	call Func_15fe9
	ld hl, sp+$0
	ld [hl], $3
	jp .asm_15f59

.asm_15f34: ; 15f34 (5:5f34)
IF DEF(LANG_JP)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
ELIF DEF(LANG_EN)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	add hl, bc
ENDC
	ld [hl], $0
.asm_15f59: ; 15f59 (5:5f59)
	jp .asm_15f91

.asm_15f5c: ; 15f5c (5:5f5c)
IF DEF(LANG_JP)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
ELIF DEF(LANG_EN)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	add hl, bc
ENDC
	ld [hl], $0
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
.asm_15f91: ; 15f91 (5:5f91)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp .asm_15ec2

.asm_15f9b: ; 15f9b (5:5f9b)
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $ff
	ld [wCurItem], a
	ld hl, $8000
	jp .asm_15fe4

.asm_15fc5: ; 15fc5 (5:5fc5)
	ld hl, $4000
	jp .asm_15fe4

.asm_15fcb: ; 15fcb (5:5fcb)
	ld a, [wc2e9]
	ld [wc310], a
	set_farcall_addrs_hli Func_56b35
	ld a, $1
	call FarCall
	ld hl, $4000
.asm_15fe4: ; 15fe4 (5:5fe4)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_15fe9: ; 15fe9 (5:5fe9)
	push af
	set_farcall_addrs_hli Func_624af
	pop af
	jp FarCall

Func_15ff9: ; 15ff9 (5:5ff9)
	jpba_hli Func_623d0

	; Opens SRAM to bank (a) and sets farcall dest ROM bank (e)
	; a: SRAM bank
	; e: ROM bank
	; returns: l = previous SRAM bank
GetBanks:: ; 16007 (5:6007)
	push de
	push af
	ldh a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	call GetSRAMBank
	pop hl
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	ld a, l
	ret

Func_16019:: ; 16019 (5:6019)
	push hl
	push de
	add sp, -$1e
	ld e, c
	ld d, b
	ld hl, sp+$0
	call LiteralStringInTree
	ld hl, sp+$0
	ld c, l
	ld b, h
	read_hl_from_sp_plus $20
	push hl
	read_hl_from_sp_plus $24
	pop de
	call Func_173a1
	add sp, $22
	ret

Func_16038:: ; 16038
	push bc
	push bc
	push bc
	push hl
	ld c, l
	ld b, h
	ld hl, $d
	add hl, bc
	ld a, [hl]
	pop hl
	cp $3
	jp nz, .asm_16052
	ld de, $2
	call Func_16377
	jp .asm_160be

.asm_16052: ; 16052 (5:6052)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, $7
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus6
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, .asm_160a8
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus4
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlus4
.asm_160a8: ; 160a8 (5:60a8)
	call GetHLAtSPPlus4
	swap_de_hl
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	call Func_16777
	ld hl, $4000
.asm_160be: ; 160be (5:60be)
	pop bc
	pop bc
	pop bc
	ret

Func_160c2:: ; 160c2
	push hl
	ld c, l
	ld b, h
	ld hl, $d
	add hl, bc
	ld a, [hl]
	pop hl
	cp $3
	jp nz, .asm_160d9
	ld de, $3
	call Func_16377
	jp .asm_16103

.asm_160d9: ; 160d9 (5:60d9)
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $9
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	inc d
	dec d
	bit 7, d
	jr z, .asm_160f4
	ld de, $0
.asm_160f4
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	call Func_16777
	ld hl, $4000
.asm_16103: ; 16103 (5:6103)
	ret

Func_16104:: ; 16104 (5:6104)
	push de
IF DEF(LANG_JP)
	ld l, a
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
ELIF DEF(LANG_EN)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld l, a
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
	add hl, bc
ENDC
	ld a, [hl]
	pop bc
	ret

Func_16128: ; 16128 (5:6128)
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus10
	ld a, l
	and h
	inc a
	jp z, .asm_1620c
	call GetHLAtSPPlus10
	ld de, $14
	call CompareHLtoDE
	jp c, .asm_161c9
	call GetHLAtSPPlus10
	swap_de_hl
	ld hl, $16
	call CompareHLtoDE
	jp c, .asm_161c9
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	ld de, hFFD2 + 6
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call text_cursor_pos_set
	jp .asm_16204

.asm_161c9: ; 161c9 (5:61c9)
	call GetHLAtSPPlus10
	ld de, $17
	call CompareHLtoDE
	jp c, .asm_161f1
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	ld de, hFFD2 + 6
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call text_cursor_pos_set
	jp .asm_16204

.asm_161f1: ; 161f1 (5:61f1)
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call text_cursor_pos_set
.asm_16204: ; 16204 (5:6204)
	ld hl, Data_16367
	push hl
	call printf
	pop bc
.asm_1620c: ; 1620c (5:620c)
	ld c, $0
.asm_1620e: ; 1620e (5:620e)
	read_hl_from_sp_plus $e
	swap_de_hl
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, .asm_16281
	push bc
	read_hl_from_sp_plus $e
	ld e, c
	ld d, $0
	call CompareHLtoDE
	jp z, .asm_1624a
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	call text_cursor_pos_set
	ld hl, $8f
	push hl
	ld hl, Data_16369
	push hl
	call printf
	pop bc
	pop bc
.asm_1624a: ; 1624a (5:624a)
	pop bc
	push bc
	call GetHLAtSPPlus10
	ld e, c
	ld d, $0
	add hl, de
	ld a, [wCurItem]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp nz, .asm_1627c
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	call text_cursor_pos_set
	ld hl, $8c
	push hl
	ld hl, Data_1636c
	push hl
	call printf
	pop bc
	pop bc
.asm_1627c: ; 1627c (5:627c)
	pop bc
	inc c
	jp .asm_1620e

.asm_16281: ; 16281 (5:6281)
	read_hl_from_sp_plus $c
	ld de, $14
	call CompareHLtoDE
	jp c, .asm_162bb
	read_hl_from_sp_plus $c
	swap_de_hl
	ld hl, $16
	call CompareHLtoDE
	jp c, .asm_162bb
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	read_hl_from_sp_plus $c
	add hl, hl
	ld de, -$28
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call text_cursor_pos_set
	jp .asm_162f9

.asm_162bb: ; 162bb (5:62bb)
	read_hl_from_sp_plus $c
	ld de, $17
	call CompareHLtoDE
	jp c, .asm_162e5
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	read_hl_from_sp_plus $c
	add hl, hl
	ld de, -$28
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call text_cursor_pos_set
	jp .asm_162f9

.asm_162e5: ; 162e5 (5:62e5)
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	read_hl_from_sp_plus $c
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call text_cursor_pos_set
.asm_162f9: ; 162f9 (5:62f9)
	ld hl, $8b
	push hl
	ld hl, Data_1636f
	push hl
	call printf
	pop bc
	pop bc
	pop bc
	read_hl_from_sp_plus $c
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp z, .asm_16364
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	add [hl]
	add $fe
	ld l, a
	push hl
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$7
	add [hl]
	add $fe
	pop de
	call text_cursor_pos_set
	pop bc
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, .asm_1635c
	ld hl, $8a
	push hl
	ld hl, Data_16372
	push hl
	call printf
	pop bc
	pop bc
	jp .asm_16364

.asm_1635c: ; 1635c (5:635c)
	ld hl, Data_16375
	push hl
	call printf
	pop bc
.asm_16364: ; 16364 (5:6364)
	add sp, $c
	ret

Data_16367: ; 16367
	dstr " "

Data_16369: ; 16369
	dstr "%c"

Data_1636c: ; 1636c
	dstr "%c"

Data_1636f: ; 1636f
	dstr "%c"

Data_16372: ; 16372
	dstr "%c"

Data_16375: ; 16375
	dstr " "

Func_16377:: ; 16377 (5:6377)
	push hl
IF DEF(LANG_JP)
	add sp, -$12
	ld hl, sp+$12
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	pop hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $15
ELIF DEF(LANG_EN)
	push de
	add sp, $f0
	ld hl, sp+$02
	ld [hl], $00
	read_hl_from_sp_plus $14
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $10
ENDC
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $15
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $15
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $15
ELIF DEF(LANG_EN)
	call WriteHLToSPPlus10
	read_hl_from_sp_plus $10
ENDC
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$c
	ld [hl], a
	read_hl_from_sp_plus $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$b
	ld [hl], a
	read_hl_from_sp_plus $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$a
	ld [hl], a
	read_hl_from_sp_plus $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$9
	ld [hl], a
	read_hl_from_sp_plus $15
	ld de, $d
	add hl, de
	ld e, [hl]
IF DEF(LANG_JP)
	ld hl, sp+$7
	ld [hl], e
ELIF DEF(LANG_EN)
	push bc
ENDC
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $17
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call CompareHLtoDE
	jp nc, .asm_16427
	read_hl_from_sp_plus $15
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
.asm_16427: ; 16427 (5:6427)
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $17
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld de, $19
	ld a, $3
	call GetBanks
IF DEF(LANG_JP)
	ld hl, sp+$8
	ld [hl], a
ELIF DEF(LANG_EN)
	ld e, a
ENDC
	ld hl, sp+$6
	ld [hl], $0
	ld a, [wSaveBlock1_c9a2]
	ld c, a
	push bc
IF DEF(LANG_JP)
	ld hl, sp+$7
	ld [hl], $0
ELIF DEF(LANG_EN)
	push de
	ld c, $0
ENDC
.asm_16450: ; 16450 (5:6450)
IF DEF(LANG_JP)
	ld hl, sp+$7
	ld a, [hl]
ELIF DEF(LANG_EN)
	ld a, c
ENDC
	cp $3
	jp nc, .asm_16497
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, warehouseBot_Unk08
	add hl, de
IF DEF(LANG_JP)
	swap_de_hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
ELIF DEF(LANG_EN)
	ld e, c
	ld d, $0
ENDC
	add hl, de
	ld a, [hl]
	or a
	jp z, .asm_1648a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp .asm_1648d

.asm_1648a: ; 1648a (5:648a)
	jp .asm_16497

.asm_1648d: ; 1648d (5:648d)
IF DEF(LANG_JP)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
ELIF DEF(LANG_EN)
	inc c
ENDC
	jp .asm_16450

.asm_16497: ; 16497 (5:6497)
	ld hl, sp+$8
	ld a, [hl]
	cp $3
	jp nz, .asm_164a3
	ld hl, sp+$8
	ld [hl], $2
.asm_164a3: ; 164a3 (5:64a3)
IF DEF(LANG_JP)
	ld hl, sp+$a
	ld a, [hl]
ELIF DEF(LANG_EN)
	pop de
	push de
	ld a, e
ENDC
	call GetSRAMBank
IF DEF(LANG_JP)
	pop bc
	pop de
	ld a, e
ELIF DEF(LANG_EN)
	pop de
	pop bc
	push de
	read_hl_from_sp_plus $16
	ld a, l
ENDC
	sub $3
IF DEF(LANG_JP)
	or d
ELIF DEF(LANG_EN)
	or h
ENDC
	jp z, .asm_16627
IF DEF(LANG_JP)
	ld a, e
ELIF DEF(LANG_EN)
	ld a, l
ENDC
	sub $2
IF DEF(LANG_JP)
	or d
ELIF DEF(LANG_EN)
	or h
ENDC
	jp z, .asm_16610
IF DEF(LANG_JP)
	ld a, e
ELIF DEF(LANG_EN)
	ld a, l
ENDC
	dec a
IF DEF(LANG_JP)
	or d
ELIF DEF(LANG_EN)
	or h
ENDC
	jp z, .asm_16558
IF DEF(LANG_JP)
	ld a, e
	or d
ELIF DEF(LANG_EN)
	ld a, l
	or h
ENDC
	jp nz, .asm_16645
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, .asm_16507
	read_hl_from_sp_plus $11
	dec hl
	write_hl_to_sp_plus $11
	inc h
	dec h
	bit 7, h
	jr z, .asm_16504
	ld hl, $0
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $d
	inc h
	dec h
	bit 7, h
	jr z, .asm_16500
IF DEF(LANG_JP)
	ld hl, $0
	write_hl_to_sp_plus $d
ELIF DEF(LANG_EN)
	read_hl_from_sp_plus $10
	dec hl
	write_hl_to_sp_plus $12
	read_hl_from_sp_plus $14
	ld de, $0007
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $10
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc a, h
	ld h, a
	write_hl_to_sp_plus $e
	ld hl, sp+$06
	ld [hl], $05
ENDC
	jp .asm_16504

.asm_16500
	ld hl, sp+$2
	ld [hl], $1
.asm_16504
	jp .asm_16555

.asm_16507: ; 16507 (5:6507)
	read_hl_from_sp_plus $11
	ld de, $17
	call CompareHLtoDE
	jp nc, .asm_16531
	read_hl_from_sp_plus $11
	swap_de_hl
	ld hl, $14
	call CompareHLtoDE
	jp nc, .asm_1652e
	read_hl_from_sp_plus $11
	dec hl
	write_hl_to_sp_plus $11
.asm_1652e: ; 1652e (5:652e)
	jp .asm_16555

.asm_16531: ; 16531 (5:6531)
	read_hl_from_sp_plus $11
	ld a, l
	sub $17
	or h
	jp nz, .asm_1654c
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	write_hl_to_sp_plus $11
	jp .asm_16555

.asm_1654c: ; 1654c (5:654c)
	read_hl_from_sp_plus $11
	dec hl
	write_hl_to_sp_plus $11
.asm_16555: ; 16555 (5:6555)
	jp .asm_16645

.asm_16558: ; 16558 (5:6558)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, .asm_165c1
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $13
	inc hl
	write_hl_to_sp_plus $13
	pop de
	call CompareHLtoDE
	jp c, .asm_165be
	read_hl_from_sp_plus $f
	dec hl
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $d
	inc hl
	write_hl_to_sp_plus $d
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $f
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $15
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call CompareHLtoDE
	jp nc, .asm_165ba
IF DEF(LANG_JP)
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $d
ELIF DEF(LANG_EN)
	ld hl, sp+$06
	ld [hl], $05
	ld hl, $0000
	write_hl_to_sp_plus $e
	ld hl, $0000
	write_hl_to_sp_plus $12
ENDC
	jp .asm_165be

.asm_165ba: ; 165ba (5:65ba)
	ld hl, sp+$2
	ld [hl], $2
.asm_165be: ; 165be (5:65be)
	jp .asm_1660d

.asm_165c1: ; 165c1 (5:65c1)
	read_hl_from_sp_plus $11
	ld de, $17
	call CompareHLtoDE
	jp nc, .asm_165f9
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	push hl
	read_hl_from_sp_plus $13
	pop de
	call CompareHLtoDE
	jp nc, .asm_165ef
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
	jp .asm_165f6

.asm_165ef: ; 165ef (5:65ef)
	ld hl, $17
	write_hl_to_sp_plus $11
.asm_165f6: ; 165f6 (5:65f6)
	jp .asm_1660d

.asm_165f9: ; 165f9 (5:65f9)
	read_hl_from_sp_plus $11
	ld a, l
	sub $17
	or h
	jp nz, .asm_1660d
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
.asm_1660d: ; 1660d (5:660d)
	jp .asm_16645

.asm_16610: ; 16610 (5:6610)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, .asm_16624
	ld hl, $14
	write_hl_to_sp_plus $11
.asm_16624: ; 16624 (5:6624)
	jp .asm_16645

.asm_16627: ; 16627 (5:6627)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp c, .asm_16645
	ld a, c
	cp $1
	jp c, .asm_16645
	ld hl, $0
	write_hl_to_sp_plus $11
	ld hl, sp+$2
	ld [hl], $4
.asm_16645: ; 16645 (5:6645)
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $15
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $d
	push hl
	read_hl_from_sp_plus $15
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
IF DEF(LANG_EN)
	pop de
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $5
	jp nz, .asm_1667f_en
	read_hl_from_sp_plus $14
	call Func_16777
	ld hl, $4000
	jp .asm_16742
.asm_1667f_en
ENDC
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_16748
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp nc, .asm_16748
IF DEF(LANG_EN)
	push de
	push bc
ENDC
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	call Coord2TileMap
IF DEF(LANG_JP)
	pop de
	push hl
	ld hl, sp+$2
ELIF DEF(LANG_EN)
	call WriteHLToSPPlus6
	ld hl, sp+$6
ENDC
	ld a, [hl]
	dec a
	ld c, a
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	dec de
	dec de
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	dec h
	dec h
	dec h
	add hl, de
	push hl
	ld hl, sp+$b
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	pop de
	call Func_17ef7
	ld a, $3
	call GetSRAMBank
IF DEF(LANG_EN)
	pop bc
ENDC
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, .asm_166f2
IF DEF(LANG_JP)
	ld hl, sp+$5
	ld l, [hl]
ELIF DEF(LANG_EN)
	ld l, c
ENDC
	push hl
	read_hl_from_sp_plus $f
	ld c, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add $2
	call Func_171ab
	pop bc
IF DEF(LANG_JP)
	pop hl
	push hl
ELIF DEF(LANG_EN)
	call GetHLAtSPPlus4
ENDC
	ld [hl], $8a
	jp .asm_16742

.asm_166f2: ; 166f2 (5:66f2)
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp nz, .asm_16742
IF DEF(LANG_JP)
	ld hl, sp+$5
	ld l, [hl]
ELIF DEF(LANG_EN)
	ld l, c
ENDC
	push hl
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $11
	pop de
	add hl, de
	dec hl
	push hl
	ld hl, sp+$d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $13
	add hl, hl
	add hl, bc
	dec hl
	ld e, l
	ld hl, sp+$e
	ld a, [hl]
	add $2
	pop bc
	call Func_171ab
	pop bc
	read_hl_from_sp_plus $13
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $f
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, .asm_16742
IF DEF(LANG_JP)
	pop hl
	push hl
ELIF DEF(LANG_EN)
	call GetHLAtSPPlus4
ENDC
	ld [hl], $8f
.asm_16742: ; 16742 (5:6742)
IF DEF(LANG_JP)
	ld hl, sp+$6
	ld a, [hl]
ELIF DEF(LANG_EN)
	pop de
	ld a, e
ENDC
	call GetSRAMBank
.asm_16748: ; 16748 (5:6748)
	read_hl_from_sp_plus $13
	call Func_16128
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1401b
ENDC
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp c, .asm_16769
	ld hl, $8000
	jp .asm_1676c

.asm_16769: ; 16769 (5:6769)
	ld hl, $4000
.asm_1676c: ; 1676c (5:676c)
	swap_de_hl
	add sp, $14
	swap_de_hl
	ret

Func_16777:: ; 16777 (5:6777)
	push hl
	add sp, -$e
	ld hl, sp+$e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	pop hl
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $e
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $10
	ld e, [hl]
	ld hl, sp+$9
	ld [hl], e
	read_hl_from_sp_plus $10
	inc hl
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	read_hl_from_sp_plus $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	read_hl_from_sp_plus $12
	ld de, $b
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	read_hl_from_sp_plus $12
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop af
	push af
	push bc
	read_hl_from_sp_plus $14
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	add $fe
	ld b, $2
	call DivideAbyB
	ld hl, sp+$10
	ld [hl], a
	pop bc
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, .asm_1681b
	ld hl, sp+$e
	ld [hl], c
.asm_1681b: ; 1681b (5:681b)
	ld hl, sp+$e
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $12
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$8
	ld a, [hl]
	cp $8
	jp nz, .asm_16841
	callba_hli Func_566fe
.asm_16841: ; 16841 (5:6841)
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call Func_17e95
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp nz, .asm_16866
	ld a, $ff
	ld [wCurItem], a
	read_hl_from_sp_plus $e
	call Func_16128
	jp .asm_1686d

.asm_16866: ; 16866 (5:6866)
	read_hl_from_sp_plus $e
	call Func_17863
.asm_1686d: ; 1686d (5:686d)
	call GetHLAtSPPlus4
	push hl
	read_hl_from_sp_plus $10
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$b
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	cp $1b
	jp z, .asm_16ae2
	cp $1a
	jp z, .asm_16ae2
	cp $21
	jp z, .asm_16ae2
	cp $15
	jp z, .asm_16ae2
	cp $11
	jp z, .asm_16ae2
	cp $6
	jp z, .asm_16a92
	cp $1f
	jp z, .asm_16a5c
	cp $8
	jp z, .asm_16a5c
	cp $a
	jp z, .asm_16a31
	cp $7
	jp z, .asm_169e0
	cp $3
	jp z, .asm_169e0
	cp $1
	jp z, .asm_169e0
	cp $b
	jp z, .asm_169b5
	cp $5
	jp z, .asm_16966
	cp $9
	jp z, .asm_16926
	cp $2
	jp z, .asm_16926
	cp $e
	jp z, .asm_16910
	cp $d
	jp z, .asm_168e9
	or a
	jp nz, .asm_16b21
.asm_168e9: ; 168e9 (5:68e9)
	ld a, [wSaveBlock1_ca6c]
	or a
	jp nz, .asm_168fc
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp .asm_16ce3

.asm_168fc: ; 168fc (5:68fc)
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [wSaveBlock1_ca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp .asm_16b21

.asm_16910: ; 16910 (5:6910)
	ld a, [wSaveBlock2]
	or a
	jp nz, .asm_16923
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp .asm_16ce3

.asm_16923: ; 16923 (5:6923)
	jp .asm_16b21

.asm_16926: ; 16926 (5:6926)
	ld a, [wSaveBlock1_c9b7]
	or a
	jp nz, .asm_16963
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	ld hl, sp+$4
	ld a, [hl]
	cp $9
	jp z, .asm_1694e
	read_hl_from_sp_plus $e
	call Func_15388
	call Func_16d1a
	jp .asm_1695d

.asm_1694e: ; 1694e (5:694e)
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
.asm_1695d: ; 1695d (5:695d)
	ld hl, -1
	jp .asm_16ce3

.asm_16963: ; 16963 (5:6963)
	jp .asm_16b21

.asm_16966: ; 16966 (5:6966)
	ld a, [wSaveBlock1_c9b7]
	or a
	jp nz, .asm_169b2
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	callba_hli Func_33bd0
	set_farcall_addrs_hli Func_569d9
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp .asm_16ce3

.asm_169b2: ; 169b2 (5:69b2)
	jp .asm_16b21

.asm_169b5: ; 169b5 (5:69b5)
	ld a, [wSaveBlock3]
	or a
	jp nz, .asm_169dd
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp .asm_16ce3

.asm_169dd: ; 169dd (5:69dd)
	jp .asm_16b21

.asm_169e0: ; 169e0 (5:69e0)
	ld a, [wSaveBlock1_c9a2]
	or a
	jp nz, .asm_16a2e
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d6b
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, .asm_16a02
	read_hl_from_sp_plus $e
	call Func_15388
.asm_16a02: ; 16a02 (5:6a02)
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, .asm_16a13
	call Func_16d1a
	ld hl, -1
	jp .asm_16ce3

.asm_16a13: ; 16a13 (5:6a13)
	read_hl_from_sp_plus $e
	ld de, $b
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
.asm_16a2e: ; 16a2e (5:6a2e)
	jp .asm_16b21

.asm_16a31: ; 16a31 (5:6a31)
	ld a, [wSaveBlock4]
	or a
	jp nz, .asm_16a59
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d6b
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp .asm_16ce3

.asm_16a59: ; 16a59 (5:6a59)
	jp .asm_16b21

.asm_16a5c: ; 16a5c (5:6a5c)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, .asm_16a8f
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $6cee
	call PlaceStringDEatCoordHL
	call Func_16d1a
	ld hl, -1
	jp .asm_16ce3

.asm_16a8f: ; 16a8f (5:6a8f)
	jp .asm_16b21

.asm_16a92: ; 16a92 (5:6a92)
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld de, $96
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$7
	ld [hl], $96
.asm_16aa4: ; 16aa4 (5:6aa4)
	ld hl, sp+$7
	ld a, [hl]
	cp $a8
	jp nc, .asm_16adf
	set_farcall_addrs_hli Func_53b1e
	ld e, $0
	ld hl, sp+$7
	ld a, [hl]
	call FarCall
	cp $1
	jp nz, .asm_16ad5
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld de, $a8
	ld [hl], e
	inc hl
	ld [hl], d
	jp .asm_16adf

.asm_16ad5: ; 16ad5 (5:6ad5)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp .asm_16aa4

.asm_16adf: ; 16adf (5:6adf)
	jp .asm_16b21

.asm_16ae2: ; 16ae2 (5:6ae2)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, .asm_16b21
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $6cf7
	call PlaceStringDEatCoordHL
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp .asm_16ce3

.asm_16b21: ; 16b21 (5:6b21)
	ld hl, sp+$9
	ld a, [hl]
	add $2
	ld hl, sp+$6
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	xor a
.asm_16b31: ; 16b31 (5:6b31)
	ld hl, sp+$a
	cp [hl]
	jp nc, .asm_16b5b
	push af
	ld hl, sp+$6
	ld l, [hl]
	push hl
	call GetHLAtSPPlus6
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld hl, sp+$9
	ld e, [hl]
	ld hl, sp+$a
	ld a, [hl]
	call Func_171ab
	pop bc
	ld hl, sp+$7
	ld a, [hl]
	add $2
	ld hl, sp+$7
	ld [hl], a
	pop af
	inc a
	jp .asm_16b31

.asm_16b5b: ; 16b5b (5:6b5b)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, .asm_16c8e
	cp $21
	jp z, .asm_16c78
	cp $1a
	jp z, .asm_16c4f
	cp $6
	jp z, .asm_16c3e
	cp $5
	jp z, .asm_16c17
	cp $2
	jp z, .asm_16bf7
	cp $3
	jp z, .asm_16bab
	cp $1
	jp nz, .asm_16cd4
	read_hl_from_sp_plus $e
	call Func_15388
	set_farcall_addrs_hli Func_5712f
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp .asm_16cd4

.asm_16bab: ; 16bab (5:6bab)
	callba_hli Func_5615c
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, l
	call Func_158b7
	cp $ff
	jp nz, .asm_16bd0
	ld hl, -1
	jp .asm_16ce3

.asm_16bd0: ; 16bd0 (5:6bd0)
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $14
	inc hl
	or [hl]
	jp nz, .asm_16bf4
	read_hl_from_sp_plus $e
	call Func_16128
	read_hl_from_sp_plus $e
	ld de, $b
	add hl, de
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
.asm_16bf4: ; 16bf4 (5:6bf4)
	jp .asm_16cd4

.asm_16bf7: ; 16bf7 (5:6bf7)
	read_hl_from_sp_plus $e
	call Func_15388
	set_farcall_addrs_hli Func_56abf
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp .asm_16cd4

.asm_16c17: ; 16c17 (5:6c17)
	callba_hli Func_33bd0
	set_farcall_addrs_hli Func_569d9
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp .asm_16cd4

.asm_16c3e: ; 16c3e (5:6c3e)
	callba_hli Func_57840
	jp .asm_16cd4

.asm_16c4f: ; 16c4f (5:6c4f)
	callba_hli Func_681a6
	set_farcall_addrs_hli Func_681bd
	ld hl, sp+$a
	ld c, [hl]
	pop hl
	push hl
	ld a, l
	call GetHLAtSPPlus4
	ld e, l
	call FarCall
	jp .asm_16cd4

.asm_16c78: ; 16c78 (5:6c78)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	ld de, Data_16d03
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp .asm_16cd4

.asm_16c8e: ; 16c8e (5:6c8e)
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$b
	ld [hl], a
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, wSaveBlock1_BagItems
	add hl, de
	ld a, [hl]
	push af
	ld hl, sp+$d
	ld a, [hl]
	call GetSRAMBank
	ld c, $3
	ld e, $14
	ld hl, $0
	call Func_17e95
	set_farcall_addrs_hli Func_61133
	pop af
	ld l, a
	ld h, $0
	ld de, $a9 - 1 ; TreeBitstreamText_4b486
	add hl, de
	swap_de_hl
	ld hl, $101
	call FarCall
.asm_16cd4: ; 16cd4 (5:6cd4)
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_14001
ENDC
	ld hl, $4000
.asm_16ce3: ; 16ce3 (5:6ce3)
	swap_de_hl
	add sp, $10
	swap_de_hl
	ret

Data_16cee: ; 16cee
IF DEF(LANG_JP)
	dstr "(わさﾞ なし)"
ELIF DEF(LANG_EN)
	dstr "no techniqe"
ENDC

Data_16cf7: ; 16cf7
IF DEF(LANG_JP)
	dstr "ロホﾞホﾟン (なし)"
ELIF DEF(LANG_EN)
	dstr "No Robopon"
ENDC

Data_16d03: ; 16d03
IF DEF(LANG_JP)
	dstr "(とﾞの)ロホﾞホﾟン(をさくしﾞょする)?"
ELIF DEF(LANG_EN)
	dstr "Scrap the Robopon?"
ENDC

Func_16d1a: ; 16d1a (5:6d1a)
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_1400e
ENDC
	call WaitAorBButtonOverworld_17a44
.asm_16d27
	call Func_3af6
	ret

Func_16d2d: ; 16d2d (5:6d2d)
	call GetSRAMBank
	ld de, Data_16d3d
	ld hl, $104
	call PlaceStringDEatCoordHL
	call Func_16d1a
	ret

Data_16d3d: ; 16d3d
IF DEF(LANG_JP)
	dstr "アイテム (なし)"
ELIF DEF(LANG_EN)
	dstr "No Items."
ENDC

Func_16d47: ; 16d47 (5:6d47)
	push de
	push af
	ld a, c
	call GetSRAMBank
	pop af
	pop de
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	ld d, $0
	inc de
	add hl, de
	ld de, Data_16d61
	call PlaceStringDEatCoordHL
	ret

Data_16d61: ; 16d61
IF DEF(LANG_JP)
	dstr "ハﾟーツ (なし)"
ELIF DEF(LANG_EN)
	dstr "No parts"
ENDC

Func_16d6b: ; 16d6b (5:6d6b)
	push de
	push af
	ld a, c
	call GetSRAMBank
	pop af
	pop de
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	ld d, $0
	inc de
	add hl, de
	ld de, Data_16d85
	call PlaceStringDEatCoordHL
	ret

Data_16d85: ; 16d85
IF DEF(LANG_JP)
	dstr "ソフト (なし)"
ELIF DEF(LANG_EN)
	dstr "No S/W"
ENDC

Func_16d8e:: ; 16d8e
	push hl
	add sp, -$e
	ld hl, sp+$e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	pop hl
	write_hl_to_sp_plus $12
	read_hl_from_sp_plus $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $12
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $12
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
IF DEF(LANG_EN)
	read_hl_from_sp_plus $13
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
ENDC
	read_hl_from_sp_plus $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$9
	ld [hl], a
	read_hl_from_sp_plus $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$8
	ld [hl], a
	read_hl_from_sp_plus $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$7
	ld [hl], a
	read_hl_from_sp_plus $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld [hl], a
	read_hl_from_sp_plus $12
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	read_hl_from_sp_plus $e
IF DEF(LANG_JP)
	push hl
	read_hl_from_sp_plus $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
ELIF DEF(LANG_EN)
	swap_de_hl
	ld l, c
	ld h, b
ENDC
	call CompareHLtoDE
	jp nc, .asm_16e3e
IF DEF(LANG_JP)
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
ELIF DEF(LANG_EN)
	ld c, l
	ld h, b
	write_hl_to_sp_plus $f
ENDC
.asm_16e3e: ; 16e3e (5:6e3e)
IF DEF(LANG_JP)
	ldh a, [hSRAMBank]
	ld c, a
ELIF DEF(LANG_EN)
	ld hl, sp+$6
	ldh a, [hSRAMBank]
	ld [hl], a
ENDC
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $14
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
IF DEF(LANG_JP)
	push bc
ENDC
	ld a, e
	dec a
	or d
	jp z, .asm_16e95
	ld a, e
	or d
	jp nz, .asm_16eee
	read_hl_from_sp_plus $10
	dec hl
	write_hl_to_sp_plus $10
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e92
IF DEF(LANG_JP)
	ld hl, $0
	write_hl_to_sp_plus $10
ENDC
	read_hl_from_sp_plus $c
	dec hl
	write_hl_to_sp_plus $c
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e8e
IF DEF(LANG_JP)
	ld hl, $0
	write_hl_to_sp_plus $c
ELIF DEF(LANG_EN)
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $d
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc h
	ld h, a
	write_hl_to_sp_plus $b
	ld hl, sp+$2
	ld [hl], $3
ENDC
	jp .asm_16e92

.asm_16e8e
IF DEF(LANG_JP)
	ld hl, sp+$4
ELIF DEF(LANG_EN)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld hl, sp+$2
ENDC
	ld [hl], $1
.asm_16e92
	jp .asm_16eee

.asm_16e95: ; 16e95 (5:6e95)
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $12
	inc hl
	write_hl_to_sp_plus $12
	pop de
	call CompareHLtoDE
	jp c, .asm_16eee
IF DEF(LANG_JP)
	read_hl_from_sp_plus $e
	dec hl
	write_hl_to_sp_plus $10
ENDC
	read_hl_from_sp_plus $c
	inc hl
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
IF DEF(LANG_JP)
	push hl
	read_hl_from_sp_plus $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
ELIF DEF(LANG_EN)
	swap_de_hl
	ld l, c
	ld h, b
ENDC
	call CompareHLtoDE
	jp nc, .asm_16eea
IF DEF(LANG_JP)
	read_hl_from_sp_plus $c
	dec hl
	write_hl_to_sp_plus $c
ELIF DEF(LANG_EN)
	ld hl, $0
	write_hl_to_sp_plus $b
	write_hl_to_sp_plus $f
	ld hl, sp+$2
	ld [hl], $3
ENDC
	jp .asm_16eee

.asm_16eea: ; 16eea (5:6eea)
IF DEF(LANG_JP)
	ld hl, sp+$4
ELIF DEF(LANG_EN)
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $f
	ld hl, sp+$02
ENDC
	ld [hl], $2
.asm_16eee: ; 16eee (5:6eee)
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $14
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $14
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, .asm_16fee
IF DEF(LANG_EN)
	push bc
	ld hl, sp+$04
	ld a, [hl]
	cp $03
	jp z, .asm_16f45_en
ENDC
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	call Coord2TileMap
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld c, a
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	dec de
	dec de
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	dec h
	dec h
	dec h
	add hl, de
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	pop de
	call Func_17ef7
.asm_16f45_en
	ld hl, sp+$5
	ld a, [hl]
	cp $8
	jp z, .asm_16f7e
	ld hl, sp+$5
	ld a, [hl]
	cp $1f
	jp z, .asm_16f7e
	ld a, $3
	call GetSRAMBank
.asm_16f7e: ; 16f7e (5:6f7e)
IF DEF(LANG_JP)
	ld hl, sp+$4
ELIF DEF(LANG_EN)
	pop bc
	ld hl, sp+$2
ENDC
	ld a, [hl]
	cp $1
	jp nz, .asm_16fa5
	ld hl, sp+$5
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $e
	ld c, l
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add $2
	call Func_171ab
	pop bc
IF DEF(LANG_JP)
	call GetHLAtSPPlus4
ELIF DEF(LANG_EN)
	pop hl
	push hl
ENDC
	ld [hl], $8a
	jp .asm_16fee

.asm_16fa5: ; 16fa5 (5:6fa5)
IF DEF(LANG_EN)
	ld hl, sp+$02
	ld a, [hl]
	cp $02
	jp nz, .asm_16fcd_en
	push bc
ENDC
	ld hl, sp+$5
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	dec hl
	push hl
	ld hl, sp+$c
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $12
	add hl, hl
	add hl, bc
	dec hl
	ld e, l
	ld hl, sp+$d
	ld a, [hl]
	add $2
	pop bc
	call Func_171ab
	pop bc
IF DEF(LANG_JP)
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
ELIF DEF(LANG_EN)
	pop bc
ENDC
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, .asm_16fee
	call GetHLAtSPPlus4
	ld [hl], $8f
.asm_16fee: ; 16fee (5:6fee)
IF DEF(LANG_JP)
	pop bc
ELIF DEF(LANG_EN)
	jp .asm_16fd4_en
.asm_16fcd_en:
	read_hl_from_sp_plus $11
	call Func_16777
.asm_16fd4_en
ENDC
	ld hl, sp+$3
	ld a, [hl]
	cp $8
	jp z, .asm_17003
	ld hl, sp+$3
	ld a, [hl]
	cp $1f
	jp z, .asm_17003
	ld a, c
	call GetSRAMBank
.asm_17003: ; 17003 (5:7003)
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, .asm_17080
	cp $5
	jp z, .asm_17065
	cp $3
	jp z, .asm_17054
	cp $2
	jp z, .asm_17039
	cp $1
	jp nz, .asm_170c4
	set_farcall_addrs_hli Func_5712f
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp .asm_170c4

.asm_17039: ; 17039 (5:7039)
	set_farcall_addrs_hli Func_56abf
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp .asm_170c4

.asm_17054: ; 17054 (5:7054)
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld a, l
	call Func_158b7
	jp .asm_170c4

.asm_17065: ; 17065 (5:7065)
	set_farcall_addrs_hli Func_569d9
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp .asm_170c4

.asm_17080: ; 17080 (5:7080)
	ld de, $19
	ld a, $3
	call GetBanks
	ld c, a
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld de, wSaveBlock1_BagItems
	add hl, de
	ld a, [hl]
	push af
	ld a, c
	call GetSRAMBank
	ld c, $3
	ld e, $14
	ld hl, $0
	call Func_17e95
	set_farcall_addrs_hli Func_61133
	pop af
	ld l, a
	ld h, $0
	ld de, $a9 - 1 ; TreeBitstreamText_4b486
	add hl, de
	swap_de_hl
	ld hl, $101
	call FarCall
.asm_170c4: ; 170c4 (5:70c4)
	read_hl_from_sp_plus $10
	call Func_17863
	ld hl, sp+$3
	ld a, [hl]
	cp $1a
	jp nz, .asm_170ef
	set_farcall_addrs_hli Func_681bd
	read_hl_from_sp_plus $c
	ld c, l
	call GetHLAtSPPlus10
	ld a, l
	read_hl_from_sp_plus $e
	ld e, l
	call FarCall
.asm_170ef: ; 170ef (5:70ef)
	ld a, [wc39b]
	cp $ff
	jp z, .asm_17195
	ld c, $0
.asm_170f9: ; 170f9 (5:70f9)
	read_hl_from_sp_plus $10
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, .asm_17195
	read_hl_from_sp_plus $10
	ld de, $5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, de
	ld a, [wc39b]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp nz, .asm_1715d
	push bc
	read_hl_from_sp_plus $12
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, .asm_17159
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	inc a
	call text_cursor_pos_set
	ld hl, $8c
	push hl
	ld hl, Data_171a6
	push hl
	call printf
	pop bc
	pop bc
.asm_17159: ; 17159 (5:7159)
	pop bc
	jp .asm_17191

.asm_1715d: ; 1715d (5:715d)
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, .asm_17191
	push bc
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	swap_de_hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_171a9
	call PlaceStringDEatCoordHL
	pop bc
.asm_17191: ; 17191 (5:7191)
	inc c
	jp .asm_170f9

.asm_17195: ; 17195 (5:7195)
	call Func_1401b
	ld hl, $4000
	swap_de_hl
	add sp, $10
	swap_de_hl
	ret

Data_171a6: ; 171a6
	dstr "%c"

Data_171a9: ; 171a9
	dstr " "

Func_171ab: ; 171ab (5:71ab)
	push af
	push bc
	add sp, -$20
	push de
	ld hl, sp+$28
	ld a, [hl]
	cp $1b
	jp z, .asm_172cd
	cp $1a
	jp z, .asm_172cd
	cp $21
	jp z, .asm_172cd
	cp $15
	jp z, .asm_172cd
	cp $11
	jp z, .asm_172cd
	cp $1f
	jp z, .asm_172b7
	cp $8
	jp z, .asm_172b7
	cp $6
	jp z, .asm_172a1
	cp $b
	jp z, .asm_17289
	cp $9
	jp z, .asm_17271
	cp $5
	jp z, .asm_17271
	cp $2
	jp z, .asm_17271
	cp $a
	jp z, .asm_17259
	cp $7
	jp z, .asm_17241
	cp $3
	jp z, .asm_17241
	cp $1
	jp z, .asm_17241
	cp $e
	jp z, .asm_17229
	cp $d
	jp z, .asm_17211
	or a
	jp nz, .asm_17352
.asm_17211: ; 17211 (5:7211)
	set_farcall_addrs_hli Func_55ed2
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_17229: ; 17229 (5:7229)
	set_farcall_addrs_hli Func_55ed2
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_17241: ; 17241 (5:7241)
	set_farcall_addrs_hli Func_5601b
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_17259: ; 17259 (5:7259)
	set_farcall_addrs_hli Func_5601b
	ld c, $2
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_17271: ; 17271 (5:7271)
	set_farcall_addrs_hli Func_55f95
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_17289: ; 17289 (5:7289)
	set_farcall_addrs_hli Func_55f95
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_172a1: ; 172a1 (5:72a1)
	set_farcall_addrs_hli Func_576c1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_172b7: ; 172b7 (5:72b7)
	set_farcall_addrs_hli Func_56d87
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp .asm_17352

.asm_172cd: ; 172cd (5:72cd)
	set_farcall_addrs_hli Func_55dd6
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$28
	ld a, [hl]
	cp $1a
	jp nz, .asm_17352
	ld hl, sp+$3
	ld [hl], $0
.asm_172ec: ; 172ec (5:72ec)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nc, .asm_17352
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, .asm_17348
	ld hl, sp+$2
	ld [hl], $0
.asm_17312: ; 17312 (5:7312)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, .asm_17348
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$22
	cp [hl]
	jp nz, .asm_1733e
	ld hl, sp+$d
	ld [hl], $80
	jp .asm_17348

.asm_1733e: ; 1733e (5:733e)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp .asm_17312

.asm_17348: ; 17348 (5:7348)
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp .asm_172ec

.asm_17352: ; 17352 (5:7352)
	pop de
	push de
	ld a, [wc39b]
	ld hl, sp+$22
	cp [hl]
	jp nz, .asm_17371
	ld hl, sp+$25
	ld a, [hl]
	dec a
	call text_cursor_pos_set
	ld hl, $8c
	push hl
	ld hl, Data_1739e
	push hl
	call printf
	pop bc
	pop bc
.asm_17371: ; 17371 (5:7371)
	pop de
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld d, $0
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	call Func_16019
	ld hl, sp+$26
	ld a, [hl]
	cp $5
	jp nz, .asm_1739b
	set_farcall_addrs_hli Func_6810b
	ld e, $0
	ld hl, sp+$20
	ld a, [hl]
	call FarCall
.asm_1739b: ; 1739b (5:739b)
	add sp, $24
	ret

Data_1739e: ; 1739e
	dstr "%c"

Func_173a1: ; 173a1 (5:73a1)
	push bc
	ld a, l
	and h
	inc a
	jp z, .asm_173b2
	ld a, e
	and d
	inc a
	jp z, .asm_173b2
	ld a, l
	call text_cursor_pos_set
.asm_173b2: ; 173b2 (5:73b2)
	pop bc
	push bc
	ld hl, Data_173c1
	push hl
	call printf
	pop bc
	pop bc
	ld hl, $4000
	ret

Data_173c1: ; 173c1
	dstr "%s"

Func_173c4: ; 173c4 (5:73c4)
	push bc
	push bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$1
	ld [hl], a
	swap_de_hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
.asm_173df: ; 173df (5:73df)
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, .asm_17429
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, .asm_17424
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	swap_de_hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_1743d
	call PlaceStringDEatCoordHL
.asm_17424: ; 17424 (5:7424)
	pop bc
	inc c
	jp .asm_173df

.asm_17429: ; 17429 (5:7429)
IF DEF(LANG_JP)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
ELIF DEF(LANG_EN)
	call Func_14001
ENDC
	ld a, $ff
	ld [wc39b], a
	pop bc
	pop bc
	ret

Data_1743d: ; 1743d
	dstr " "

StartMenu_PressB:: ; 1743f
	ld a, [wc39b]
	cp $ff
	jp z, .asm_17450
	call Func_173c4
	ld hl, $8000
	jp .asm_17453

.asm_17450: ; 17450 (5:7450)
	ld hl, -1
.asm_17453: ; 17453 (5:7453)
	ret

Func_17454:: ; 17454
	ld a, [wc39b]
	cp $ff
	jp z, .asm_17465
	call Func_173c4
	ld hl, $8000
	jp .asm_1746b

.asm_17465: ; 17465 (5:7465)
	call Func_3af6
	ld hl, -1
.asm_1746b: ; 1746b (5:746b)
	ret

Func_1746c:: ; 1746c
	ld hl, $4000
	ret

Func_17470:: ; 17470 (5:7470)
	call WaitVideoTransfer
	ld a, BANK(GFX_4122)
	ld [wFarCallDestBank], a
	ld bc, $10
IF DEF(SUN)
	ld de, GFX_4122 + $cb0
ELIF DEF(STAR)
	ld de, GFX_4122 + $cc0
ENDC
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	ret

Func_17488:: ; 17488 (5:7488)
	call FillVisibleAreaWithBlankTile
	call WaitVideoTransfer
	ld a, BANK(GFX_4122)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4122 + $8e0
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	ret

Data_174a3: ; 174a3
	dw 1000
	dw  100
	dw   10
	dw    1

INCLUDE "engine/menu/func_174ab.asm"

Func_17863:: ; 17863 (5:7863)
	push bc
	push bc
	push bc
	push bc
	push bc
	pop de
	push hl
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	call GetHLAtSPPlus4
	ld de, $d
	add hl, de
	ld a, [hl]
	ld a, c
	and b
	inc a
	jp z, .asm_178e5
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, b
	add hl, hl
	add hl, de
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call text_cursor_pos_set
	ld hl, Data_1796b
	push hl
	call printf
	pop bc
.asm_178e5: ; 178e5 (5:78e5)
	pop bc
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, b
	add hl, hl
	add hl, de
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	inc a
	call text_cursor_pos_set
	ld hl, $8b
	push hl
	ld hl, Data_1796d
	push hl
	call printf
	pop bc
	pop bc
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CompareHLtoDE
	jp z, .asm_17965
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$2
	add [hl]
	add $fe
	ld l, a
	push hl
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$5
	add [hl]
	add $fe
	pop de
	call text_cursor_pos_set
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus10
	pop de
	add hl, de
	pop de
	call CompareHLtoDE
	jp nc, .asm_1795d
	ld hl, $8a
	push hl
	ld hl, Data_17970
	push hl
	call printf
	pop bc
	pop bc
	jp .asm_17965

.asm_1795d: ; 1795d (5:795d)
	ld hl, Data_17973
	push hl
	call printf
	pop bc
.asm_17965: ; 17965 (5:7965)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_1796b: ; 1796b
	dstr " "

Data_1796d: ; 1796d
	dstr "%c"

Data_17970: ; 17970
	dstr "%c"

Data_17973: ; 17973
	dstr " "

Func_17975:: ; 17975
	push hl
	push bc
	push bc
	push bc
	xor a
	ld a, c
	and $80
	ld hl, sp+$2
	ld [hl], a
	ld a, c
	and $7f
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, .asm_1799c
	push de
	ld hl, Data_174a3
	call WriteHLToSPPlus4
	ld hl, sp+$6
	ld [hl], $4
	pop de
	jp .asm_179ba

.asm_1799c: ; 1799c (5:799c)
	push de
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	ld de, Data_174a3
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	pop de
.asm_179ba: ; 179ba (5:79ba)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp c, .asm_17a39
	push de
	ld c, $0
.asm_179c5: ; 179c5 (5:79c5)
	call GetHLAtSPPlus10
	inc h
	dec h
	bit 7, h
	jr nz, .asm_179e8
	push bc
	call GetHLAtSPPlus6
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $c
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	write_hl_to_sp_plus $c
	pop bc
	inc c
	jp .asm_179c5

.asm_179e8
	push bc
	call GetHLAtSPPlus6
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $c
	add hl, bc
	write_hl_to_sp_plus $c
	pop bc
	pop de
	ld a, c
	cp $2
	jp nc, .asm_17a0f
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_17a0f
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, .asm_17a19
.asm_17a0f: ; 17a0f (5:7a0f)
	ld hl, sp+$2
	ld [hl], $0
	ld a, c
	ld [de], a
	inc de
	jp .asm_17a25

.asm_17a19: ; 17a19 (5:7a19)
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp c, .asm_17a25
	ld a, $90
	ld [de], a
	inc de
.asm_17a25: ; 17a25 (5:7a25)
	push de
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlus4
	inc hl
	inc hl
	call WriteHLToSPPlus4
	pop de
	jp .asm_179ba

.asm_17a39: ; 17a39 (5:7a39)
	xor a
	ld [de], a
	swap_de_hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

WaitAorBButtonOverworld_17a44:: ; 17a44 (5:7a44)
	call NextOverworldFrame
	call CheckButton
	ld l, a
	ld h, $0
	ld a, l
	and A_BUTTON
	jp z, .asm_17a58
	ld a, A_BUTTON
	jp .asm_17a66

.asm_17a58: ; 17a58 (5:7a58)
	ld a, l
	and B_BUTTON
	jp z, .asm_17a63
	ld a, B_BUTTON
	jp .asm_17a66

.asm_17a63: ; 17a63 (5:7a63)
	jp WaitAorBButtonOverworld_17a44

.asm_17a66: ; 17a66 (5:7a66)
	ret

INCLUDE "engine/malloc.asm"

Func_17e95:: ; 17e95 (5:7e95)
	push bc
	push de
	push hl
	ld b, e
	push bc
	call Coord2TileMap
	pop bc
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
	add hl, de
.asm_17ea2
	push hl
	ld d, b
	xor a
.asm_17ea5
	ld [hli], a
	dec b
	jr nz, .asm_17ea5
	ld b, d
	pop hl
	ld de, $14
	add hl, de
	dec c
	jr nz, .asm_17ea2
	pop hl
	pop de
	pop bc
	ld d, c
	call Coord2TileMap
	ld a, $14
	sub e
	ld c, a
	ld b, $0
	dec e
	dec d
	push de
	ld a, $80
	ld [hli], a
	ld a, $81
	jr .asm_17eca

.asm_17ec9
	ld [hli], a
.asm_17eca
	dec e
	jr nz, .asm_17ec9
	ld a, $82
	ld [hli], a
	add hl, bc
	pop de
	jr .asm_17ee5

.asm_17ed4
	push de
	ld a, $86
	ld [hli], a
	ld a, $8f
	jr .asm_17edd

.asm_17edc
	ld [hli], a
.asm_17edd
	dec e
	jr nz, .asm_17edc
	ld a, $87
	ld [hli], a
	add hl, bc
	pop de
.asm_17ee5
	dec d
	jr nz, .asm_17ed4
	ld a, $83
	ld [hli], a
	ld a, $84
	jr .asm_17ef0

.asm_17eef
	ld [hli], a
.asm_17ef0
	dec e
	jr nz, .asm_17eef
	ld a, $85
	ld [hli], a
	ret

Func_17ef7:: ; 17ef7 (5:7ef7)
	bit 0, c
	jr nz, .asm_17f48
	ld a, h
	add d
	ld h, a
	dec h
	ld a, l
	add e
	ld l, a
	dec l
	call Coord2TileMap
	ld a, e
	push af
	ld a, $14
	sub d
	ld e, a
	ld a, l
	sub $28
	ld c, a
	ld a, h
	sbc $0
	ld b, a
	pop af
	sub $3
.asm_17f17
	push af
	push de
.asm_17f19
	ld a, [bc]
	dec bc
	ld [hld], a
	dec d
	jr nz, .asm_17f19
	pop de
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	pop af
	dec a
	jr nz, .asm_17f17
.asm_17f32
	ld a, [bc]
	dec bc
	ld e, $42
	cp $88
	jr z, .asm_17f42
	ld e, $43
	cp $89
	jr z, .asm_17f42
	ld e, $8f
.asm_17f42
	ld a, e
	ld [hld], a
	dec d
	jr nz, .asm_17f32
	ret

.asm_17f48
	call Coord2TileMap
	ld a, e
	push af
	ld a, $14
	sub d
	ld e, a
	ld a, l
	add $28
	ld c, a
	ld a, h
	adc $0
	ld b, a
	pop af
	sub $3
	push af
	push de
.asm_17f5e
	ld a, [bc]
	inc bc
	ld e, $88
	cp $42
	jr z, .asm_17f6e
	ld e, $89
	cp $43
	jr z, .asm_17f6e
	ld e, $81
.asm_17f6e
	ld a, e
	ld [hli], a
	dec d
	jr nz, .asm_17f5e
	pop de
	ld a, c
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, l
	add e
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af
.asm_17f83
	push af
	push de
.asm_17f85
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, .asm_17f85
	pop de
	ld a, c
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, l
	add e
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af
	dec a
	jr nz, .asm_17f83
	ret

