INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 05", ROMX
INCLUDE "engine/menu/menu.asm"

Data_15399: ; 15399
	db $0d, $0d, $0f, $0b, $10, $10, $14, $07, $14, $06, $0b, $0b, $0a, $0a, $12, $05, $0f, $0e, $04, $0d, $03, $03, $0f, $09, $02, $03, $03, $02, $03, $0e, $0f, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01

Data_153c6: ; 153c6
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $17, $00, $03, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $2b, $61, $00, $04, $0e, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $2b, $4c, $60, $00, $05, $14, $1e, $1f, $20, $21, $22, $23, $24, $25, $00, $06, $10, $1b, $1c, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $62, $78, $79, $00, $07, $0f, $18, $28, $2e, $2f, $30, $31, $32, $33, $34, $58, $59, $5f, $6c, $00, $08, $30, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $55, $5c, $64, $7d, $7e, $7f, $00, $4d, $5a, $6d, $7b, $83, $84, $00, $12, $2c, $33, $38, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $56, $62, $6c, $86, $93, $00, $24, $45, $6b, $76, $86, $00, $3e, $48, $49, $4f, $54, $5b, $6a, $6b, $6c, $93, $00, $1d, $39, $47, $4a, $4b, $4c, $4d, $4e, $4f, $5d, $00, $3f, $4e, $6a, $6e, $71, $74, $75, $86, $87, $00, $21, $44, $50, $51, $52, $53, $54, $5d, $6d, $00, $13, $19, $20, $29, $43, $4b, $52, $55, $56, $57, $58, $59, $5a, $5b, $5d, $5e, $6e, $00, $09, $1a, $22, $3d, $00, $11, $31, $32, $3a, $3b, $42, $5f, $60, $61, $77, $79, $7c, $7f, $81, $00, $3c, $77, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $91, $92, $00, $0a, $2d, $53, $00, $37, $3a, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $87, $00, $5f, $60, $00, $7d, $80, $00, $23, $2a, $57, $5e, $61, $63, $65, $66, $76, $77, $78, $7a, $7b, $7c, $00, $0b, $25, $46, $5c, $68, $69, $7e, $82, $00, $5e, $00, $96, $97, $00, $62, $63, $00, $63, $00, $94, $95, $00, $34, $64, $67, $69, $72, $73, $74, $78, $80, $81, $82, $83, $85, $00, $64, $75, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $00, $88, $00, $89, $00, $8a, $00, $8b, $00, $8c, $00, $8d, $00, $8e, $00, $8f, $00, $90, $00, $91, $00, $92, $00, $00, $00

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
	ld de, wc98e
	add hl, de
	ld l, [hl]
	ld h, $0
	reg16swap de, hl
	ld a, e
	and $3f
	ld l, a
	ld h, $0
	reg16swap de, hl
	push de
	ld a, c
	call GetSRAMBank
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	call GetHLAtSPPlus4
	ld de, -1
	call Func_1564a
	ld c, a
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	xor a
	pop bc
	pop de
Func_155bb: ; 155bb (5:55bb)
	push de
	push bc
	call WaitAorBButtonOverworld_17a44
	pop bc
	pop de
	cp $10
	jp nz, Func_15619
	ld a, c
	ld hl, Data_15399 - 1
	add hl, de
	cp [hl]
	jp nc, Func_155f9
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
	jp Func_15616

Func_155f9: ; 155f9 (5:55f9)
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
	jp Func_1563e

Func_15616: ; 15616 (5:5616)
	jp Func_1563b

Func_15619: ; 15619 (5:5619)
	cp $20
	jp nz, Func_1563b
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
	jp Func_1563e

Func_1563b: ; 1563b (5:563b)
	jp Func_155bb

Func_1563e: ; 1563e (5:563e)
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
	ld de, wc98e
	add hl, de
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $1a
	read_hl_from_sp_plus $1a
	ld a, l
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
	jp nz, Func_15703
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
	lb hl, -1, -1
	call PlaceStringDEatCoordHL
	ld bc, $0
	xor a
Func_156af: ; 156af (5:56af)
	cp $3
	jp nc, Func_156f9
	push af
	push bc
	read_hl_from_sp_plus $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call FindFirstNonzero
	reg16swap de, hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, Func_156ec
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
Func_156ec: ; 156ec (5:56ec)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp Func_156af

Func_156f9: ; 156f9 (5:56f9)
	ld hl, $0
	write_hl_to_sp_plus $18
	jp Func_15780

Func_15703: ; 15703 (5:5703)
	ld hl, sp+$14
	ld [hl], $0
Func_15707: ; 15707 (5:5707)
	ld hl, sp+$14
	ld a, [hl]
	cp $2
	jp nc, Func_15780
	ld hl, sp+$15
	ld [hl], $1
	xor a
Func_15714: ; 15714 (5:5714)
	cp $3
	jp nc, Func_15769
	push af
	push bc
	read_hl_from_sp_plus $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call FindFirstNonzero
	reg16swap de, hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, Func_1575c
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
	reg16swap de, hl
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	call Func_16019
	pop bc
	inc bc
Func_1575c: ; 1575c (5:575c)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp Func_15714

Func_15769: ; 15769 (5:5769)
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp nz, Func_15776
	ld l, c
	ld h, b
	write_hl_to_sp_plus $18
Func_15776: ; 15776 (5:5776)
	ld hl, sp+$14
	ld a, [hl]
	inc a
	ld hl, sp+$14
.asm_1577b
	ld [hl], a
	jp Func_15707

Func_15780: ; 15780 (5:5780)
	read_hl_from_sp_plus $1a
	ld de, Data_15399 - 1
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_157aa
	ld e, $10
	ld a, $12
	call SetStringStartState
	ld hl, Data_157c3
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $18
	ld a, l
	jp Func_157b3

Func_157aa: ; 157aa (5:57aa)
	read_hl_from_sp_plus $1a
	ld de, Data_15399 - 1
	add hl, de
	ld a, [hl]
Func_157b3: ; 157b3 (5:57b3)
	add sp, $1a
	ret

Data_157b6: ; 157b6
	dstr "(てﾞ つかえるわさﾞ)"

Data_157c3: ; 157c3
	dstr "^"

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
	jp nz, Func_157ea
	ld c, $5
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, GETNAME_SOFTWARE
	dec hl
	call GetName
	jp Func_15887

Func_157ea: ; 157ea (5:57ea)
	push bc
	ld e, $0
Func_157ed: ; 157ed (5:57ed)
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld l, a
	ld a, e
	cp l
	jp nc, Func_1580d
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
	jp Func_157ed

Func_1580d: ; 1580d (5:580d)
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
	jp nc, Func_1587e
	pop hl
	push hl
	ld a, l
	or h
	jp nz, Func_1584b
	ld c, $5
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, GETNAME_SOFTWARE
	dec hl
	call GetName
	jp Func_1585a

Func_1584b: ; 1584b (5:584b)
	ld c, $9
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus4
	inc h
	dec hl
	pop de
	call GetName
Func_1585a: ; 1585a (5:585a)
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
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
	jp Func_15887

Func_1587e: ; 1587e (5:587e)
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
Func_15887: ; 15887 (5:5887)
	call GetHLAtSPPlus8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Pointers_1588f:
	dw Data_15895
	dw Data_158ae
	dw $0

Data_15895:
	dstr "フﾞート(そﾞくは) ソフト(の つけかえかﾞ)"

Data_158ae:
	dstr "(てﾞきないよ)"

Func_158b7: ; 158b7
	add sp, -$76
	push af
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Pointers_1588f
	ld bc, $6
	call MemCopy
	ld de, $19
	ld a, $3
	call GetBanks
	ld l, a
	pop af
	push hl
	ld e, a
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld a, [hl]
	and $3f
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, sp+$75
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $9
	add hl, de
	ld e, [hl]
	ld hl, sp+$76
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $a
	add hl, de
	ld e, [hl]
	ld hl, sp+$77
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	pop hl
	push af
	push hl
	ld bc, $0
Func_15951: ; 15951 (5:5951)
	ld l, c
	ld h, b
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_1598d
	ld hl, sp+$77
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_15989
	push bc
	set_farcall_addrs_hli Func_5601b
	pop bc
	push bc
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3d
	add hl, de
	ld e, c
	ld c, $1
	call FarCall
	pop bc
Func_15989: ; 15989 (5:5989)
	inc bc
	jp Func_15951

Func_1598d: ; 1598d (5:598d)
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
	call PlaceString
	pop bc
	ld de, Data_15aa4
	ld hl, $a01
	call PlaceStringDEatCoordHL
	ld de, Data_15aae
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld c, $7
	ld e, $a
	ld hl, $a02
	call Func_17e95
	ld c, $5
	ld e, $a
	ld hl, $a09
	call Func_17e95
	ld de, Data_15ab8
	ld hl, $c0a
	call PlaceStringDEatCoordHL
	ld de, Data_15ac3
	ld hl, $c0c
	call PlaceStringDEatCoordHL
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld de, Data_15ace
	ld hl, $c03
	call PlaceStringDEatCoordHL
	jp Func_15a64

Func_15a0e: ; 15a0e (5:5a0e)
	ld hl, $0
	write_hl_to_sp_plus $39
Func_15a15: ; 15a15 (5:5a15)
	read_hl_from_sp_plus $39
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_15a64
	read_hl_from_sp_plus $39
	reg16swap de, hl
	ld hl, sp+$75
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_15a58
	read_hl_from_sp_plus $39
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$39
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $39
	add hl, hl
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $c
	call Func_16019
Func_15a58: ; 15a58 (5:5a58)
	read_hl_from_sp_plus $39
	inc hl
	write_hl_to_sp_plus $39
	jp Func_15a15

Func_15a64: ; 15a64 (5:5a64)
	pop af
	cp $b
	jp nz, Func_15a9e
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $5
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	ld a, $ff
	jp Func_15a9f

Func_15a9e: ; 15a9e (5:5a9e)
	xor a
Func_15a9f: ; 15a9f (5:5a9f)
	add sp, $76
	ret

Data_15aa2: ; 15aa2
	dstr "M"

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
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_15c59
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
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	jp Func_15fe4

Func_15c59: ; 15c59 (5:5c59)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp c, Func_15e9c
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_15e9c
	ld a, [wCurItem]
	cp $ff
	jp z, Func_15df5
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
	ld de, wc98e
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
	ld de, $8
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
	jp z, Func_15d0b
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
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
Func_15d0b: ; 15d0b (5:5d0b)
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
	jp z, Func_15d27
	ld hl, sp+$1
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld c, a
	jp Func_15d29

Func_15d27: ; 15d27 (5:5d27)
	ld c, $0
Func_15d29: ; 15d29 (5:5d29)
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
	jp c, Func_15de5
	ld hl, sp+$3
	ld a, [hl]
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
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
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ec2b
	ld e, $1
	ld a, [wCurItem]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_15da0
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	jp Func_15db0

Func_15da0: ; 15da0 (5:5da0)
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
Func_15db0: ; 15db0 (5:5db0)
	set_farcall_addrs_hli Func_fb2ed
	ld a, [wc2e9]
	call FarCall
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
	jp Func_15fe4

Func_15de5: ; 15de5 (5:5de5)
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	xor a
	call Func_15fe9
	ld hl, $4000
	jp Func_15fe4

Func_15df5: ; 15df5 (5:5df5)
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$4
	ld [hl], a
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
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
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_15e96
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
	jp z, Func_15e59
	cp $2
	jp nz, Func_15e91
Func_15e59: ; 15e59 (5:5e59)
	or a
	jp nz, Func_15e6d
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
Func_15e6d: ; 15e6d (5:5e6d)
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
	jp Func_15fe4

Func_15e91: ; 15e91 (5:5e91)
	ld a, $ff
	ld [wCurItem], a
Func_15e96: ; 15e96 (5:5e96)
	ld hl, $4000
	jp Func_15fe4

Func_15e9c: ; 15e9c (5:5e9c)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $17
	inc hl
	or [hl]
	jp nz, Func_15fcb
	ld a, $1
	call Func_15fe9
	or a
	jp nz, Func_15fc5
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
Func_15ec2: ; 15ec2 (5:5ec2)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_15f9b
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, Func_15f91
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_15f5c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_15f34
	ld a, $3
	call Func_15fe9
	ld hl, sp+$0
	ld [hl], $3
	jp Func_15f59

Func_15f34: ; 15f34 (5:5f34)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], $0
Func_15f59: ; 15f59 (5:5f59)
	jp Func_15f91

Func_15f5c: ; 15f5c (5:5f5c)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
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
Func_15f91: ; 15f91 (5:5f91)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_15ec2

Func_15f9b: ; 15f9b (5:5f9b)
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
	jp Func_15fe4

Func_15fc5: ; 15fc5 (5:5fc5)
	ld hl, $4000
	jp Func_15fe4

Func_15fcb: ; 15fcb (5:5fcb)
	ld a, [wc2e9]
	ld [wc310], a
	set_farcall_addrs_hli Func_56b35
	ld a, $1
	call FarCall
	ld hl, $4000
Func_15fe4: ; 15fe4 (5:5fe4)
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
	jp nz, Func_16052
	ld de, $2
	call Func_16377
	jp Func_160be

Func_16052: ; 16052 (5:6052)
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
	jp nc, Func_160a8
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
Func_160a8: ; 160a8 (5:60a8)
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	call Func_16777
	ld hl, $4000
Func_160be: ; 160be (5:60be)
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
	jp nz, Func_160d9
	ld de, $3
	call Func_16377
	jp Func_16103

Func_160d9: ; 160d9 (5:60d9)
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
Func_16103: ; 16103 (5:6103)
	ret

Func_16104:: ; 16104 (5:6104)
	push de
	ld l, a
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
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
	jp z, Func_1620c
	call GetHLAtSPPlus10
	ld de, $14
	call CompareHLtoDE
	jp c, Func_161c9
	call GetHLAtSPPlus10
	reg16swap de, hl
	ld hl, $16
	call CompareHLtoDE
	jp c, Func_161c9
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
	call SetStringStartState
	jp Func_16204

Func_161c9: ; 161c9 (5:61c9)
	call GetHLAtSPPlus10
	ld de, $17
	call CompareHLtoDE
	jp c, Func_161f1
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
	call SetStringStartState
	jp Func_16204

Func_161f1: ; 161f1 (5:61f1)
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
	call SetStringStartState
Func_16204: ; 16204 (5:6204)
	ld hl, Data_16367
	push hl
	call PlaceString
	pop bc
Func_1620c: ; 1620c (5:620c)
	ld c, $0
Func_1620e: ; 1620e (5:620e)
	read_hl_from_sp_plus $e
	reg16swap de, hl
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_16281
	push bc
	read_hl_from_sp_plus $e
	ld e, c
	ld d, $0
	call CompareHLtoDE
	jp z, Func_1624a
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
	call SetStringStartState
	ld hl, $8f
	push hl
	ld hl, Data_16369
	push hl
	call PlaceString
	pop bc
	pop bc
Func_1624a: ; 1624a (5:624a)
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
	jp nz, Func_1627c
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
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_1636c
	push hl
	call PlaceString
	pop bc
	pop bc
Func_1627c: ; 1627c (5:627c)
	pop bc
	inc c
	jp Func_1620e

Func_16281: ; 16281 (5:6281)
	read_hl_from_sp_plus $c
	ld de, $14
	call CompareHLtoDE
	jp c, Func_162bb
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld hl, $16
	call CompareHLtoDE
	jp c, Func_162bb
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
	call SetStringStartState
	jp Func_162f9

Func_162bb: ; 162bb (5:62bb)
	read_hl_from_sp_plus $c
	ld de, $17
	call CompareHLtoDE
	jp c, Func_162e5
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
	call SetStringStartState
	jp Func_162f9

Func_162e5: ; 162e5 (5:62e5)
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
	call SetStringStartState
Func_162f9: ; 162f9 (5:62f9)
	ld hl, $8b
	push hl
	ld hl, Data_1636f
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	read_hl_from_sp_plus $c
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp z, Func_16364
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
	call SetStringStartState
	pop bc
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_1635c
	ld hl, $8a
	push hl
	ld hl, Data_16372
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_16364

Func_1635c: ; 1635c (5:635c)
	ld hl, Data_16375
	push hl
	call PlaceString
	pop bc
Func_16364: ; 16364 (5:6364)
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
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $15
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
	ld hl, sp+$7
	ld [hl], e
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $17
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16427
	read_hl_from_sp_plus $15
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
Func_16427: ; 16427 (5:6427)
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
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$6
	ld [hl], $0
	ld a, [wc9a2]
	ld c, a
	push bc
	ld hl, sp+$7
	ld [hl], $0
Func_16450: ; 16450 (5:6450)
	ld hl, sp+$7
	ld a, [hl]
	cp $3
	jp nc, Func_16497
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_1648a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_1648d

Func_1648a: ; 1648a (5:648a)
	jp Func_16497

Func_1648d: ; 1648d (5:648d)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_16450

Func_16497: ; 16497 (5:6497)
	ld hl, sp+$8
	ld a, [hl]
	cp $3
	jp nz, Func_164a3
	ld hl, sp+$8
	ld [hl], $2
Func_164a3: ; 164a3 (5:64a3)
	ld hl, sp+$a
	ld a, [hl]
	call GetSRAMBank
	pop bc
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_16627
	ld a, e
	sub $2
	or d
	jp z, Func_16610
	ld a, e
	dec a
	or d
	jp z, Func_16558
	ld a, e
	or d
	jp nz, Func_16645
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_16507
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
	ld hl, $0
	write_hl_to_sp_plus $d
	jp .asm_16504

.asm_16500
	ld hl, sp+$2
	ld [hl], $1
.asm_16504
	jp Func_16555

Func_16507: ; 16507 (5:6507)
	read_hl_from_sp_plus $11
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_16531
	read_hl_from_sp_plus $11
	reg16swap de, hl
	ld hl, $14
	call CompareHLtoDE
	jp nc, Func_1652e
	read_hl_from_sp_plus $11
	dec hl
	write_hl_to_sp_plus $11
Func_1652e: ; 1652e (5:652e)
	jp Func_16555

Func_16531: ; 16531 (5:6531)
	read_hl_from_sp_plus $11
	ld a, l
	sub $17
	or h
	jp nz, Func_1654c
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	write_hl_to_sp_plus $11
	jp Func_16555

Func_1654c: ; 1654c (5:654c)
	read_hl_from_sp_plus $11
	dec hl
	write_hl_to_sp_plus $11
Func_16555: ; 16555 (5:6555)
	jp Func_16645

Func_16558: ; 16558 (5:6558)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_165c1
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $13
	inc hl
	write_hl_to_sp_plus $13
	pop de
	call CompareHLtoDE
	jp c, Func_165be
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
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_165ba
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $d
	jp Func_165be

Func_165ba: ; 165ba (5:65ba)
	ld hl, sp+$2
	ld [hl], $2
Func_165be: ; 165be (5:65be)
	jp Func_1660d

Func_165c1: ; 165c1 (5:65c1)
	read_hl_from_sp_plus $11
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_165f9
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	push hl
	read_hl_from_sp_plus $13
	pop de
	call CompareHLtoDE
	jp nc, Func_165ef
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
	jp Func_165f6

Func_165ef: ; 165ef (5:65ef)
	ld hl, $17
	write_hl_to_sp_plus $11
Func_165f6: ; 165f6 (5:65f6)
	jp Func_1660d

Func_165f9: ; 165f9 (5:65f9)
	read_hl_from_sp_plus $11
	ld a, l
	sub $17
	or h
	jp nz, Func_1660d
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
Func_1660d: ; 1660d (5:660d)
	jp Func_16645

Func_16610: ; 16610 (5:6610)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_16624
	ld hl, $14
	write_hl_to_sp_plus $11
Func_16624: ; 16624 (5:6624)
	jp Func_16645

Func_16627: ; 16627 (5:6627)
	read_hl_from_sp_plus $11
	ld de, $14
	call CompareHLtoDE
	jp c, Func_16645
	ld a, c
	cp $1
	jp c, Func_16645
	ld hl, $0
	write_hl_to_sp_plus $11
	ld hl, sp+$2
	ld [hl], $4
Func_16645: ; 16645 (5:6645)
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
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_16748
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp nc, Func_16748
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
	pop de
	push hl
	ld hl, sp+$2
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
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_166f2
	ld hl, sp+$5
	ld l, [hl]
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
	pop hl
	push hl
	ld [hl], $8a
	jp Func_16742

Func_166f2: ; 166f2 (5:66f2)
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp nz, Func_16742
	ld hl, sp+$5
	ld l, [hl]
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
	jp c, Func_16742
	pop hl
	push hl
	ld [hl], $8f
Func_16742: ; 16742 (5:6742)
	ld hl, sp+$6
	ld a, [hl]
	call GetSRAMBank
Func_16748: ; 16748 (5:6748)
	read_hl_from_sp_plus $13
	call Func_16128
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp c, Func_16769
	ld hl, $8000
	jp Func_1676c

Func_16769: ; 16769 (5:6769)
	ld hl, $4000
Func_1676c: ; 1676c (5:676c)
	reg16swap de, hl
	add sp, $14
	reg16swap de, hl
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
	jp nc, Func_1681b
	ld hl, sp+$e
	ld [hl], c
Func_1681b: ; 1681b (5:681b)
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
	jp nz, Func_16841
	callba_hli Func_566fe
Func_16841: ; 16841 (5:6841)
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
	jp nz, Func_16866
	ld a, $ff
	ld [wCurItem], a
	read_hl_from_sp_plus $e
	call Func_16128
	jp Func_1686d

Func_16866: ; 16866 (5:6866)
	read_hl_from_sp_plus $e
	call Func_17863
Func_1686d: ; 1686d (5:686d)
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
	jp z, Func_16ae2
	cp $1a
	jp z, Func_16ae2
	cp $21
	jp z, Func_16ae2
	cp $15
	jp z, Func_16ae2
	cp $11
	jp z, Func_16ae2
	cp $6
	jp z, Func_16a92
	cp $1f
	jp z, Func_16a5c
	cp $8
	jp z, Func_16a5c
	cp $a
	jp z, Func_16a31
	cp $7
	jp z, Func_169e0
	cp $3
	jp z, Func_169e0
	cp $1
	jp z, Func_169e0
	cp $b
	jp z, Func_169b5
	cp $5
	jp z, Func_16966
	cp $9
	jp z, Func_16926
	cp $2
	jp z, Func_16926
	cp $e
	jp z, Func_16910
	cp $d
	jp z, Func_168e9
	or a
	jp nz, Func_16b21
Func_168e9: ; 168e9 (5:68e9)
	ld a, [wSaveScratchca6c]
	or a
	jp nz, Func_168fc
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp Func_16ce3

Func_168fc: ; 168fc (5:68fc)
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [wSaveScratchca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_16b21

Func_16910: ; 16910 (5:6910)
	ld a, [wSaveBlock2]
	or a
	jp nz, Func_16923
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp Func_16ce3

Func_16923: ; 16923 (5:6923)
	jp Func_16b21

Func_16926: ; 16926 (5:6926)
	ld a, [wc9b7]
	or a
	jp nz, Func_16963
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
	jp z, Func_1694e
	read_hl_from_sp_plus $e
	call Func_15388
	call Func_16d1a
	jp Func_1695d

Func_1694e: ; 1694e (5:694e)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call WaitAorBButtonOverworld_17a44
Func_1695d: ; 1695d (5:695d)
	ld hl, -1
	jp Func_16ce3

Func_16963: ; 16963 (5:6963)
	jp Func_16b21

Func_16966: ; 16966 (5:6966)
	ld a, [wc9b7]
	or a
	jp nz, Func_169b2
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
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp Func_16ce3

Func_169b2: ; 169b2 (5:69b2)
	jp Func_16b21

Func_169b5: ; 169b5 (5:69b5)
	ld a, [wSaveBlock3]
	or a
	jp nz, Func_169dd
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp Func_16ce3

Func_169dd: ; 169dd (5:69dd)
	jp Func_16b21

Func_169e0: ; 169e0 (5:69e0)
	ld a, [wc9a2]
	or a
	jp nz, Func_16a2e
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
	jp nz, Func_16a02
	read_hl_from_sp_plus $e
	call Func_15388
Func_16a02: ; 16a02 (5:6a02)
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, Func_16a13
	call Func_16d1a
	ld hl, -1
	jp Func_16ce3

Func_16a13: ; 16a13 (5:6a13)
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
Func_16a2e: ; 16a2e (5:6a2e)
	jp Func_16b21

Func_16a31: ; 16a31 (5:6a31)
	ld a, [wSaveBlock4]
	or a
	jp nz, Func_16a59
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d6b
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp Func_16ce3

Func_16a59: ; 16a59 (5:6a59)
	jp Func_16b21

Func_16a5c: ; 16a5c (5:6a5c)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_16a8f
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
	jp Func_16ce3

Func_16a8f: ; 16a8f (5:6a8f)
	jp Func_16b21

Func_16a92: ; 16a92 (5:6a92)
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld de, $96
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$7
	ld [hl], $96
Func_16aa4: ; 16aa4 (5:6aa4)
	ld hl, sp+$7
	ld a, [hl]
	cp $a8
	jp nc, Func_16adf
	set_farcall_addrs_hli Func_53b1e
	ld e, $0
	ld hl, sp+$7
	ld a, [hl]
	call FarCall
	cp $1
	jp nz, Func_16ad5
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld de, $a8
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_16adf

Func_16ad5: ; 16ad5 (5:6ad5)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_16aa4

Func_16adf: ; 16adf (5:6adf)
	jp Func_16b21

Func_16ae2: ; 16ae2 (5:6ae2)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	read_hl_from_sp_plus $e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_16b21
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
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call WaitAorBButtonOverworld_17a44
	ld hl, -1
	jp Func_16ce3

Func_16b21: ; 16b21 (5:6b21)
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
Func_16b31: ; 16b31 (5:6b31)
	ld hl, sp+$a
	cp [hl]
	jp nc, Func_16b5b
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
	jp Func_16b31

Func_16b5b: ; 16b5b (5:6b5b)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_16c8e
	cp $21
	jp z, Func_16c78
	cp $1a
	jp z, Func_16c4f
	cp $6
	jp z, Func_16c3e
	cp $5
	jp z, Func_16c17
	cp $2
	jp z, Func_16bf7
	cp $3
	jp z, Func_16bab
	cp $1
	jp nz, Func_16cd4
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
	jp Func_16cd4

Func_16bab: ; 16bab (5:6bab)
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
	jp nz, Func_16bd0
	ld hl, -1
	jp Func_16ce3

Func_16bd0: ; 16bd0 (5:6bd0)
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $14
	inc hl
	or [hl]
	jp nz, Func_16bf4
	read_hl_from_sp_plus $e
	call Func_16128
	read_hl_from_sp_plus $e
	ld de, $b
	add hl, de
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
Func_16bf4: ; 16bf4 (5:6bf4)
	jp Func_16cd4

Func_16bf7: ; 16bf7 (5:6bf7)
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
	jp Func_16cd4

Func_16c17: ; 16c17 (5:6c17)
	callba_hli Func_33bd0
	set_farcall_addrs_hli Func_569d9
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp Func_16cd4

Func_16c3e: ; 16c3e (5:6c3e)
	callba_hli Func_57840
	jp Func_16cd4

Func_16c4f: ; 16c4f (5:6c4f)
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
	jp Func_16cd4

Func_16c78: ; 16c78 (5:6c78)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	ld de, Data_16d03
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_16cd4

Func_16c8e: ; 16c8e (5:6c8e)
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
	ld de, wSaveScratchBagItems
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
	reg16swap de, hl
	ld hl, $101
	call FarCall
Func_16cd4: ; 16cd4 (5:6cd4)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
Func_16ce3: ; 16ce3 (5:6ce3)
	reg16swap de, hl
	add sp, $10
	reg16swap de, hl
	ret

Data_16cee: ; 16cee
	dstr "(わさﾞ なし)"

Data_16cf7: ; 16cf7
	dstr "ロホﾞホﾟン (なし)"

Data_16d03: ; 16d03
	dstr "(とﾞの)ロホﾞホﾟン(をさくしﾞょする)?"

Func_16d1a: ; 16d1a (5:6d1a)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
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
	dstr "アイテム (なし)"

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
	dstr "ハﾟーツ (なし)"

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
	dstr "ソフト (なし)"

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
	push hl
	read_hl_from_sp_plus $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16e3e
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
Func_16e3e: ; 16e3e (5:6e3e)
	ldh a, [hSRAMBank]
	ld c, a
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
	push bc
	ld a, e
	dec a
	or d
	jp z, Func_16e95
	ld a, e
	or d
	jp nz, Func_16eee
	read_hl_from_sp_plus $10
	dec hl
	write_hl_to_sp_plus $10
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e92
	ld hl, $0
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $c
	dec hl
	write_hl_to_sp_plus $c
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e8e
	ld hl, $0
	write_hl_to_sp_plus $c
	jp .asm_16e92

.asm_16e8e
	ld hl, sp+$4
	ld [hl], $1
.asm_16e92
	jp Func_16eee

Func_16e95: ; 16e95 (5:6e95)
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $12
	inc hl
	write_hl_to_sp_plus $12
	pop de
	call CompareHLtoDE
	jp c, Func_16eee
	read_hl_from_sp_plus $e
	dec hl
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $c
	inc hl
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16eea
	read_hl_from_sp_plus $c
	dec hl
	write_hl_to_sp_plus $c
	jp Func_16eee

Func_16eea: ; 16eea (5:6eea)
	ld hl, sp+$4
	ld [hl], $2
Func_16eee: ; 16eee (5:6eee)
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
	jp z, Func_16fee
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
	ld hl, sp+$5
	ld a, [hl]
	cp $8
	jp z, Func_16f7e
	ld hl, sp+$5
	ld a, [hl]
	cp $1f
	jp z, Func_16f7e
	ld a, $3
	call GetSRAMBank
Func_16f7e: ; 16f7e (5:6f7e)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_16fa5
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
	call GetHLAtSPPlus4
	ld [hl], $8a
	jp Func_16fee

Func_16fa5: ; 16fa5 (5:6fa5)
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
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, Func_16fee
	call GetHLAtSPPlus4
	ld [hl], $8f
Func_16fee: ; 16fee (5:6fee)
	pop bc
	ld hl, sp+$3
	ld a, [hl]
	cp $8
	jp z, Func_17003
	ld hl, sp+$3
	ld a, [hl]
	cp $1f
	jp z, Func_17003
	ld a, c
	call GetSRAMBank
Func_17003: ; 17003 (5:7003)
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, Func_17080
	cp $5
	jp z, Func_17065
	cp $3
	jp z, Func_17054
	cp $2
	jp z, Func_17039
	cp $1
	jp nz, Func_170c4
	set_farcall_addrs_hli Func_5712f
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17039: ; 17039 (5:7039)
	set_farcall_addrs_hli Func_56abf
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17054: ; 17054 (5:7054)
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld a, l
	call Func_158b7
	jp Func_170c4

Func_17065: ; 17065 (5:7065)
	set_farcall_addrs_hli Func_569d9
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17080: ; 17080 (5:7080)
	ld de, $19
	ld a, $3
	call GetBanks
	ld c, a
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld de, wSaveScratchBagItems
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
	reg16swap de, hl
	ld hl, $101
	call FarCall
Func_170c4: ; 170c4 (5:70c4)
	read_hl_from_sp_plus $10
	call Func_17863
	ld hl, sp+$3
	ld a, [hl]
	cp $1a
	jp nz, Func_170ef
	set_farcall_addrs_hli Func_681bd
	read_hl_from_sp_plus $c
	ld c, l
	call GetHLAtSPPlus10
	ld a, l
	read_hl_from_sp_plus $e
	ld e, l
	call FarCall
Func_170ef: ; 170ef (5:70ef)
	ld a, [wc39b]
	cp $ff
	jp z, Func_17195
	ld c, $0
Func_170f9: ; 170f9 (5:70f9)
	read_hl_from_sp_plus $10
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_17195
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
	jp nz, Func_1715d
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
	jp z, Func_17159
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
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_171a6
	push hl
	call PlaceString
	pop bc
	pop bc
Func_17159: ; 17159 (5:7159)
	pop bc
	jp Func_17191

Func_1715d: ; 1715d (5:715d)
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
	jp z, Func_17191
	push bc
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
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
Func_17191: ; 17191 (5:7191)
	inc c
	jp Func_170f9

Func_17195: ; 17195 (5:7195)
	call Func_1401b
	ld hl, $4000
	reg16swap de, hl
	add sp, $10
	reg16swap de, hl
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
	jp z, Func_172cd
	cp $1a
	jp z, Func_172cd
	cp $21
	jp z, Func_172cd
	cp $15
	jp z, Func_172cd
	cp $11
	jp z, Func_172cd
	cp $1f
	jp z, Func_172b7
	cp $8
	jp z, Func_172b7
	cp $6
	jp z, Func_172a1
	cp $b
	jp z, Func_17289
	cp $9
	jp z, Func_17271
	cp $5
	jp z, Func_17271
	cp $2
	jp z, Func_17271
	cp $a
	jp z, Func_17259
	cp $7
	jp z, Func_17241
	cp $3
	jp z, Func_17241
	cp $1
	jp z, Func_17241
	cp $e
	jp z, Func_17229
	cp $d
	jp z, Func_17211
	or a
	jp nz, Func_17352
Func_17211: ; 17211 (5:7211)
	set_farcall_addrs_hli Func_55ed2
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17229: ; 17229 (5:7229)
	set_farcall_addrs_hli Func_55ed2
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17241: ; 17241 (5:7241)
	set_farcall_addrs_hli Func_5601b
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17259: ; 17259 (5:7259)
	set_farcall_addrs_hli Func_5601b
	ld c, $2
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17271: ; 17271 (5:7271)
	set_farcall_addrs_hli Func_55f95
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17289: ; 17289 (5:7289)
	set_farcall_addrs_hli Func_55f95
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172a1: ; 172a1 (5:72a1)
	set_farcall_addrs_hli Func_576c1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172b7: ; 172b7 (5:72b7)
	set_farcall_addrs_hli Func_56d87
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172cd: ; 172cd (5:72cd)
	set_farcall_addrs_hli Func_55dd6
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$28
	ld a, [hl]
	cp $1a
	jp nz, Func_17352
	ld hl, sp+$3
	ld [hl], $0
Func_172ec: ; 172ec (5:72ec)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nc, Func_17352
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
	jp nz, Func_17348
	ld hl, sp+$2
	ld [hl], $0
Func_17312: ; 17312 (5:7312)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_17348
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
	jp nz, Func_1733e
	ld hl, sp+$d
	ld [hl], $80
	jp Func_17348

Func_1733e: ; 1733e (5:733e)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_17312

Func_17348: ; 17348 (5:7348)
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_172ec

Func_17352: ; 17352 (5:7352)
	pop de
	push de
	ld a, [wc39b]
	ld hl, sp+$22
	cp [hl]
	jp nz, Func_17371
	ld hl, sp+$25
	ld a, [hl]
	dec a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_1739e
	push hl
	call PlaceString
	pop bc
	pop bc
Func_17371: ; 17371 (5:7371)
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
	jp nz, Func_1739b
	set_farcall_addrs_hli Func_6810b
	ld e, $0
	ld hl, sp+$20
	ld a, [hl]
	call FarCall
Func_1739b: ; 1739b (5:739b)
	add sp, $24
	ret

Data_1739e: ; 1739e
	dstr "%c"

Func_173a1: ; 173a1 (5:73a1)
	push bc
	ld a, l
	and h
	inc a
	jp z, Func_173b2
	ld a, e
	and d
	inc a
	jp z, Func_173b2
	ld a, l
	call SetStringStartState
Func_173b2: ; 173b2 (5:73b2)
	pop bc
	push bc
	ld hl, Data_173c1
	push hl
	call PlaceString
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
	reg16swap de, hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
Func_173df: ; 173df (5:73df)
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_17429
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
	jp z, Func_17424
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_1743d
	call PlaceStringDEatCoordHL
Func_17424: ; 17424 (5:7424)
	pop bc
	inc c
	jp Func_173df

Func_17429: ; 17429 (5:7429)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
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
	jp z, Func_17450
	call Func_173c4
	ld hl, $8000
	jp Func_17453

Func_17450: ; 17450 (5:7450)
	ld hl, -1
Func_17453: ; 17453 (5:7453)
	ret

Func_17454:: ; 17454
	ld a, [wc39b]
	cp $ff
	jp z, Func_17465
	call Func_173c4
	ld hl, $8000
	jp Func_1746b

Func_17465: ; 17465 (5:7465)
	call Func_3af6
	ld hl, -1
Func_1746b: ; 1746b (5:746b)
	ret

Func_1746c:: ; 1746c
	ld hl, $4000
	ret

Func_17470:: ; 17470 (5:7470)
	call WaitVideoTransfer
	ld a, BANK(GFX_4ce2)
	ld [wFarCallDestBank], a
	ld bc, $10
IF DEF(SUN)
	ld de, GFX_4ce2 + $f0
ELIF DEF(STAR)
	ld de, GFX_4ce2 + $100
ENDC
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	ret

Func_17488:: ; 17488 (5:7488)
	call FillVisibleAreaWithBlankTile
	call WaitVideoTransfer
	ld a, BANK(GFX_4a02)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4a02
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
	jp z, Func_178e5
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
	call SetStringStartState
	ld hl, Data_1796b
	push hl
	call PlaceString
	pop bc
Func_178e5: ; 178e5 (5:78e5)
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
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_1796d
	push hl
	call PlaceString
	pop bc
	pop bc
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CompareHLtoDE
	jp z, Func_17965
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
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus10
	pop de
	add hl, de
	pop de
	call CompareHLtoDE
	jp nc, Func_1795d
	ld hl, $8a
	push hl
	ld hl, Data_17970
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_17965

Func_1795d: ; 1795d (5:795d)
	ld hl, Data_17973
	push hl
	call PlaceString
	pop bc
Func_17965: ; 17965 (5:7965)
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
	jp nz, Func_1799c
	push de
	ld hl, Data_174a3
	call WriteHLToSPPlus4
	ld hl, sp+$6
	ld [hl], $4
	pop de
	jp Func_179ba

Func_1799c: ; 1799c (5:799c)
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
Func_179ba: ; 179ba (5:79ba)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp c, Func_17a39
	push de
	ld c, $0
Func_179c5: ; 179c5 (5:79c5)
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
	jp Func_179c5

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
	jp nc, Func_17a0f
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_17a0f
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_17a19
Func_17a0f: ; 17a0f (5:7a0f)
	ld hl, sp+$2
	ld [hl], $0
	ld a, c
	ld [de], a
	inc de
	jp Func_17a25

Func_17a19: ; 17a19 (5:7a19)
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp c, Func_17a25
	ld a, $90
	ld [de], a
	inc de
Func_17a25: ; 17a25 (5:7a25)
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
	jp Func_179ba

Func_17a39: ; 17a39 (5:7a39)
	xor a
	ld [de], a
	reg16swap de, hl
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
	jp z, Func_17a58
	ld a, A_BUTTON
	jp Func_17a66

Func_17a58: ; 17a58 (5:7a58)
	ld a, l
	and B_BUTTON
	jp z, Func_17a63
	ld a, B_BUTTON
	jp Func_17a66

Func_17a63: ; 17a63 (5:7a63)
	jp WaitAorBButtonOverworld_17a44

Func_17a66: ; 17a66 (5:7a66)
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

