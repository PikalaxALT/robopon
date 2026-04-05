INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 8 part 2", ROMX

IF DEF(LANG_JP)
PUSHC
SETCHARMAP kana
Text_202d7: ; 202d7
	dstr "エネルギー ポイントが"

Text_202e3: ; 202e3
	dstr "たりません!"

Pointers_202ea:: ; 202ea
	dw Text_202d7
	dw Text_202e3
	dw $0
POPC
ELIF DEF(LANG_EN)
Func_2026f_en:
	push hl
	push bc
	ld a, $37
	ld [wFarCallDestBank], a
	ld hl, sp+$0
	ld bc, $2
	call FarCopyVideoData
	ld c, $37
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call strcpy_far
	pop bc
	pop bc
	ret
ENDC

Func_202f0: ; 202f0 (8:42f0)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20304: ; 20304 (8:4304)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20318: ; 20318
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, .asm_2033d
	ld c, $0
	ld hl, sp+$0
	swap_de_hl
	ld hl, $1
	call Func_20304
	jp .asm_2034b

.asm_2033d: ; 2033d (8:433d)
	ld c, $0
	ld hl, sp+$0
	swap_de_hl
	ld hl, $1
	call Func_202f0
.asm_2034b: ; 2034b (8:434b)
	pop bc
	ret

BattleRandom: ; 2034d (8:434d)
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	call FarCall
	ret

Func_2035e: ; 2035e
	callba_hli Func_5ec5e
	ret

Func_2036d: ; 2036d (8:436d)
	push hl
	push de
	set_farcall_addrs_hli Func_667d
	pop de
	pop hl
	ld bc, $8f02
	call FarCall
	ret

Func_20383: ; 20383 (8:4383)
IF DEF(LANG_JP)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
ELIF DEF(LANG_EN)
	push hl
	push bc
	push de
	set_farcall_addrs_hli Func_17e95
	pop de
	pop bc
	pop hl
	push hl
	push bc
	push de
	call FarCall
	set_farcall_addrs_hli Func_de228
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_de3e7
	pop de
	pop bc
	pop hl
	ld b, $0
	ld d, $0
	call FarCall
ENDC
	ret

Func_20398: ; 20398 (8:4398)
IF DEF(LANG_JP)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_20383
ELIF DEF(LANG_EN)
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_de228
	ld hl, $0
	call FarCall
ENDC
	ret

IF DEF(LANG_EN)
Func_20385_en:
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ret
ENDC

Func_203a3: ; 203a3 (8:43a3)
	push hl
	push de
	call GetHLAtSPPlus4
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli PrintMapText_
	ld c, $a8
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, $10e
	call FarCall
	pop bc
	call GetHLAtSPPlus4
	swap_de_hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop bc
	ret

Func_203fa: ; 203fa (8:43fa)
	push hl
	push de
	call Func_20398
	pop de
	pop hl
	call Func_203a3
	ret

Func_203fd_en:
IF DEF(LANG_EN)
	push hl
	push de
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	pop de
	pop hl
	call Func_203a3
	ret
ENDC

Func_20405: ; 20405
	push af
	push de
	set_farcall_addrs_hli Func_d3a2
	pop de
	pop af
	jp FarCall

Func_20417: ; 20417
	ld hl, $4000
	ret

Func_2041b: ; 2041b (8:441b)
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, .asm_2042d
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp .asm_20435

.asm_2042d: ; 2042d (8:442d)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
.asm_20435: ; 20435 (8:4435)
	ret

Func_20436: ; 20436 (8:4436)
.asm_20436
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .asm_20436
	ret

Pointers_20441: ; 20441
	dw Data_2044d
	dw Data_20454
	dw Data_2045b
	dw Data_20460
	dw Data_20467
	dw Data_20470

Data_2044d: ; 2044d
IF DEF(LANG_JP)
	dstr "(たたかう)"
ELIF DEF(LANG_EN)
	dstr "Fight"
ENDC

Data_20454: ; 20454
IF DEF(LANG_JP)
	dstr "ロホﾞホﾟン"
ELIF DEF(LANG_EN)
	dstr "Robopon"
ENDC

Data_2045b: ; 2045b
IF DEF(LANG_JP)
	dstr "アイテム"
ELIF DEF(LANG_EN)
	dstr "Items"
ENDC

Data_20460: ; 20460
IF DEF(LANG_JP)
	dstr "(にけﾞる)"
ELIF DEF(LANG_EN)
	dstr "Escape"
ENDC

Data_20467: ; 20467
IF DEF(LANG_JP)
	dstr "(ほﾞうきﾞょ)"
ELIF DEF(LANG_EN)
	dstr "Defend"
ENDC

Data_20470: ; 20470
IF DEF(LANG_JP)
	dstr "(かいひ)"
ELIF DEF(LANG_EN)
	dstr "Evade"
ENDC

DrawBattleSelectionMenu: ; 20476 (8:4476)
	push hl
IF DEF(LANG_JP)
	push bc
ENDC
	ld c, $5
IF DEF(LANG_JP)
	ld e, $d
	ld hl, $70d
ELIF DEF(LANG_EN)
	ld e, $14
	ld hl, $d
ENDC
	call Func_20383
IF DEF(LANG_JP)
	call GetHLAtSPPlus4
ELIF DEF(LANG_EN)
	pop hl
	push hl
ENDC
	ld de, $b
	add hl, de
IF DEF(LANG_JP)
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
ELIF DEF(LANG_EN)
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
ENDC
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
IF DEF(LANG_JP)
	push bc
ELIF DEF(LANG_EN)
	pop de
	push bc
	push de
ENDC
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jp nz, .second_row
	ld e, $0
	jp .got_starting_string

.second_row
	ld e, $2
.got_starting_string
	ld l, $0
.loop
	ld a, l
IF DEF(LANG_JP)
	cp $4
ELIF DEF(LANG_EN)
	cp $6
ENDC
	jp nc, .done
	push hl
	push de
	ld a, l
	and $1
	jp nz, .column_2
IF DEF(LANG_JP)
	ld a, $9
ELIF DEF(LANG_EN)
	ld a, $2
ENDC
	jp .got_x_coord

.column_2
IF DEF(LANG_JP)
	ld a, $e
ELIF DEF(LANG_EN)
	ld a, $b
ENDC
.got_x_coord
	ld c, a
	push bc
	ld a, l
	ld b, $2
	call DivideAbyB
IF DEF(LANG_JP)
	add a
ENDC
	add $e
	pop bc
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Pointers_20441
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, c
	ld l, a
	call PlaceStringDEatCoordHL
	pop de
	pop hl
	inc l
	inc e
	jp .loop

.done
IF DEF(LANG_JP)
	pop bc
	push de
	push bc
	call GetHLAtSPPlus6
	ld a, l
	and h
ELIF DEF(LANG_EN)
	pop de
	ld a, e
	and d
ENDC
	inc a
	jp z, .skip_blank_tile
IF DEF(LANG_JP)
	call GetHLAtSPPlus6
	ld a, l
ELIF DEF(LANG_EN)
	ld l, e
	ld a, l
ENDC
	and $1
	jp nz, .blank_tile_column_2
IF DEF(LANG_JP)
	ld a, $8
ELIF DEF(LANG_EN)
	ld a, $1
ENDC
	jp .got_blank_tile_x

.blank_tile_column_2
IF DEF(LANG_JP)
	ld a, $d
ELIF DEF(LANG_EN)
	ld a, $a
ENDC
.got_blank_tile_x
	ld e, a
	push de
	ld a, l
	ld b, $2
	call DivideAbyB
IF DEF(LANG_JP)
	add a
ENDC
	add $e
	pop de
	ld h, e
	ld l, a
	ld de, Data_2058f
	call PlaceStringDEatCoordHL
.skip_blank_tile
	pop bc
	push bc
	ld l, c
	ld a, l
	and $1
	jp nz, .cursor_column_2
IF DEF(LANG_JP)
	ld a, $8
ELIF DEF(LANG_EN)
	ld a, $1
ENDC
	jp .got_cursor_x

.cursor_column_2
IF DEF(LANG_JP)
	ld a, $d
ELIF DEF(LANG_EN)
	ld a, $a
ENDC
.got_cursor_x
	ld c, a
	push bc
	ld a, l
	ld b, $2
	call DivideAbyB
IF DEF(LANG_JP)
	add a
ENDC
	add $e
	pop bc
	ld e, a
	ld a, c
	call text_cursor_pos_set
	ld hl, $8b ; selection cursor
	push hl
	ld hl, Data_20591
	push hl
	call printf
	pop bc
	pop bc
IF DEF(LANG_JP)
	ld e, $10
	ld a, $12
	call text_cursor_pos_set
	pop bc
	pop de
	push bc
	ld a, e
	cp $5
	jp nc, .clear_down_arrow
	ld hl, $8a ; down arrow
	push hl
	ld hl, Data_20594
	push hl
	call printf
	pop bc
	pop bc
	jp .finish

.clear_down_arrow
	ld hl, Data_20597
	push hl
	call printf
	pop bc
.finish
ENDC
	ld l, $5
	push hl
IF DEF(LANG_JP)
	ld c, $d
ELIF DEF(LANG_EN)
	ld c, $14
ENDC
	ld e, $d
IF DEF(LANG_JP)
	ld a, $7
ELIF DEF(LANG_EN)
	xor a
ENDC
	call DoublePushBGMapRegion
	pop bc
	pop bc
IF DEF(LANG_JP)
	call GetHLAtSPPlus4
ELIF DEF(LANG_EN)
	pop hl
	push hl
ENDC
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $4000
	pop bc
IF DEF(LANG_JP)
	pop bc
ENDC
	ret

Data_2058f: ; 2058f
	dstr " "

Data_20591: ; 20591
	dstr "%c"

IF DEF(LANG_JP)
Data_20594: ; 20594
	dstr "%c"

Data_20597: ; 20597
	dstr " "
ENDC

Func_20599: ; 20599
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	sub $3
	or d
	jp z, .asm_20616
	ld a, e
	sub $2
	or d
	jp z, .asm_2060c
	ld a, e
	dec a
	or d
	jp z, .asm_205ee
	ld a, e
	or d
	jp nz, .asm_2061d
	dec bc
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_205eb
	inc bc
	inc bc
IF DEF(LANG_JP)
	pop hl
	push hl
	swap_de_hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, .asm_205eb
	ld hl, $0
	pop de
	push hl
ENDC
.asm_205eb
	jp .asm_2061d

.asm_205ee: ; 205ee (8:45ee)
	inc bc
	inc bc
	ld l, c
	ld h, b
	ld de, $4
	call CompareHLtoDE
	jp c, .asm_20609
	dec bc
	dec bc
IF DEF(LANG_JP)
	pop hl
	push hl
	ld a, l
	or h
	jp nz, .asm_20609
	ld hl, $2
	pop de
	push hl
ENDC
.asm_20609: ; 20609 (8:4609)
	jp .asm_2061d

.asm_2060c: ; 2060c (8:460c)
	ld a, c
	and $1
	jp z, .asm_20613
	dec bc
.asm_20613: ; 20613 (8:4613)
	jp .asm_2061d

.asm_20616: ; 20616 (8:4616)
	ld a, c
	and $1
	jp nz, .asm_2061d
	inc bc
.asm_2061d: ; 2061d (8:461d)
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	call DrawBattleSelectionMenu
	pop hl
	pop bc
	pop bc
	ret

Func_20640: ; 20640
	ld de, $2
	jp Func_20599

Func_20646: ; 20646
	ld de, $3
	jp Func_20599

Func_2064c: ; 2064c (8:464c)
	add sp, -$3e
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $40
	ld hl, $17
	add hl, bc
	ld e, [hl]
	ld hl, sp+$26
	call GetPart
	pop af
	read_hl_from_sp_plus $3e
	swap_de_hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $fe
	jp z, .asm_20692
	or a
	jp nz, .asm_206ae
	read_hl_from_sp_plus $39
	jp .asm_206d5

.asm_20692: ; 20692 (8:4692)
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $3e
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$13
	call GetMove
	read_hl_from_sp_plus $21
	jp .asm_206d5

.asm_206ae: ; 206ae (8:46ae)
	ld a, BANK(Moves)
	ld [wFarCallDestBank], a
	ld a, [hl]
	ld l, a
	ld h, $0
	mulhl 19
	ld de, Moves - $13
	add hl, de
	swap_de_hl
	ld hl, sp+$0
	ld bc, $13
	call FarCopyVideoData
	read_hl_from_sp_plus $e
.asm_206d5: ; 206d5 (8:46d5)
	ld a, l
	and $80
	jp z, .asm_206e1
	ld a, l
	and $7f
	jp .asm_206e4

.asm_206e1: ; 206e1 (8:46e1)
	ld a, l
	and $f
.asm_206e4: ; 206e4 (8:46e4)
	add sp, $3e
	ret

Data_206e7: ; 206e7
	db $21, $02, $03, $00, $0a, $0a, $13, $11, $03, $00, $00, $0b, $05, $0d

Func_206f5: ; 206f5
	push af
	add sp, -$e
	push de
	push bc
	ld hl, sp+$4
	swap_de_hl
	ld hl, Data_206e7
	ld bc, $e
	call MemCopy
	pop bc
	pop de
	ld a, [wSystemType]
	cp $1
	jp z, .asm_2071b
	ld a, [wSystemType]
	cp $ff
	jp nz, .asm_20743
.asm_2071b: ; 2071b (8:471b)
	ld hl, sp+$f
	ld a, [hl]
	add a
	add a
	ld hl, sp+$f
	add [hl]
	ld l, a
	ld a, c
	add a
	add a
	add a
	add a
	add l
	ld hl, sp+$3
	ld [hl], a
	ld a, c
	add a
	add a
	add a
	add a
	ld l, a
	ld a, e
	add a
	add a
	add e
	add l
	ld hl, sp+$9
	ld [hl], a
	ld de, $e
	ld hl, sp+$0
	call Func_2b83
.asm_20743: ; 20743 (8:4743)
	add sp, $10
	ret

Data_20746: ; 20746
IF DEF(LANG_JP)
	db $21, $02, $03, $15, $00, $0b, $05, $0d, $03, $15, $0a, $0b, $13, $11
ELIF DEF(LANG_EN)
	db $21, $02, $03, $15, $00, $0b, $09, $0d, $03, $15, $0a, $09, $13, $11
ENDC

PrintMoveInfoInBattle: ; 20754 (8:4754)
	push hl
	add sp, -$34
	xor a
	read_hl_from_sp_plus $36
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $34
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	push bc
IF DEF(LANG_JP)
	ld c, $7
	ld e, $a
	ld hl, $a0b
ELIF DEF(LANG_EN)
	ld c, $3
	ld e, $9
	ld hl, $b09
ENDC
	call Func_20383
	ld c, $4
IF DEF(LANG_JP)
	ld e, $b
ELIF DEF(LANG_EN)
	ld e, $14
ENDC
	ld hl, $e
	call Func_20383
IF DEF(LANG_JP)
	ld c, $3
	ld e, $6
ELIF DEF(LANG_EN)
	ld c, $4
	ld e, $14
ENDC
	ld hl, $b
	call Func_20383
	pop bc
	pop de
	push bc
	push de
	ld hl, $1c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $c0c
	call Func_2230
	ld de, Data_2094f
	ld hl, $f0c
	call PlaceStringDEatCoordHL
	pop de
	ld hl, $1e
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $100
	ld hl, $100c
	call Func_2230
	ld a, BANK(TypeNames)
	ld [wFarCallDestBank], a
	pop bc
	push bc
	read_hl_from_sp_plus $36
	swap_de_hl
	ld hl, $36
	add hl, bc
	add hl, de
	ld l, [hl]
	ld h, $0
	mulhl 5
	ld de, TypeNames
	add hl, de
	swap_de_hl
	ld hl, sp+$16
	call LiteralStringInTree
IF DEF(LANG_JP)
	ld e, $e
	ld a, $b
	call text_cursor_pos_set
	ld hl, sp+$16
	push hl
	ld hl, Data_20951
	push hl
	call printf
	pop bc
	pop bc
ELIF DEF(LANG_EN)
	ld de, Data_20951
	ld hl, $10f
	call PlaceStringDEatCoordHL
	ld hl, sp+$16
	swap_de_hl
	ld hl, $210
	call PlaceStringDEatCoordHL
ENDC
	pop bc
	push bc
	read_hl_from_sp_plus $36
	add hl, hl
	swap_de_hl
	ld hl, $26
	add hl, bc
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $10c
	call Func_2230
	ld de, Data_20959
	ld hl, $40c
	call PlaceStringDEatCoordHL
	ld de, Data_2095b
	ld hl, $b10
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $36
	ld a, l
	call Func_2064c
	ld l, a
	ld a, BANK(Pointers_2027f)
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	ld de, Pointers_2027f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$16
	call LiteralStringInTree
	ld hl, sp+$16
IF DEF(LANG_JP)
	push hl
	call printf
	pop bc
ELIF DEF(LANG_EN)
	call FindFirstNonzero
	ld de, $11
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc a, h
	ld h, a
	ld a, l
	cp $b
	jp c, .asm_20823_en
	ld a, $a
.asm_20823_en
	ld hl, sp+$16
	push hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $10
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
ENDC
	set_farcall_addrs_hli Func_56d87
	read_hl_from_sp_plus $36
	ld e, l
	ld hl, sp+$2
	call FarCall
	ld hl, sp+$2
	swap_de_hl
	ld hl, sp+$16
	call LiteralStringInTree
	ld hl, sp+$16
	swap_de_hl
	ld hl, $10f
	call PlaceStringDEatCoordHL
	pop bc
	read_hl_from_sp_plus $34
	ld de, $7
	call CompareHLtoDE
	jp nc, .no_more_moves
	read_hl_from_sp_plus $34
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, .no_more_moves
	ld e, $10
	ld a, $9
	call text_cursor_pos_set
	ld hl, $8a ; down arrow
	push hl
	ld hl, Data_20962
	push hl
	call printf
	pop bc
	pop bc
.no_more_moves
	ld a, [wSystemType]
	cp $1
	jp z, .sgb
	ld a, [wSystemType]
	cp $ff
	jp nz, .check_cgb
.sgb
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	call Func_2041b
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $b
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ld c, $1
	ld de, $e
	ld hl, Data_20746
	call Func_2a79
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_20436
	ld l, $7
	push hl
	ld c, $14
	ld e, $b
	xor a
	call PushBGMapRegion
	pop bc
	jp .finish

.check_cgb
	check_cgb
	jp nz, .not_cgb
	ld a, $2
	ld [wEnableAttrMapTransfer], a
.not_cgb
	ld l, $7
	push hl
	ld c, $14
	ld e, $b
	xor a
	call DoublePushBGMapRegion
	pop bc
.finish
	read_hl_from_sp_plus $34
	push hl
	read_hl_from_sp_plus $38
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	swap_de_hl
	add sp, $36
	swap_de_hl
	ret

Data_2094f: ; 2094f
	dstr "/"

Data_20951: ; 20951
IF DEF(LANG_JP)
	dstr "タイフﾟ:%s"
ELIF DEF(LANG_EN)
	dstr "Type"
ENDC

Data_20959: ; 20959
	dstr "P"

Data_2095b: ; 2095b
IF DEF(LANG_JP)
	dstr "(こうか:)"
ELIF DEF(LANG_EN)
	dstr "Effect"
ENDC

Data_20962: ; 20962
	dstr "%c"

Func_20965: ; 20965
	push bc
	push bc
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $26
	add hl, bc
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus5
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call CompareHLtoDE
	jp c, .asm_209bb
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	jp .asm_209e5

.asm_209bb: ; 209bb (8:49bb)
	ld de, $1405
	ld hl, $d
	call Func_2801
	push hl
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
IF DEF(LANG_JP)
	ld c, $a0 | BANK(Pointers_202ea)
	ld de, Pointers_202ea
ELIF DEF(LANG_EN)
	lb bc, $01, BANK(Pointers_dca11)
	ld de, Pointers_dca11
ENDC
	ld hl, $10e
	call FarCall
	pop hl
	call Func_2887
	ld hl, $8000
.asm_209e5: ; 209e5 (8:49e5)
	pop bc
	pop bc
	ret

Func_209e8: ; 209e8
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	pop de
	ld a, e
	dec a
	or d
	jp z, .asm_20a1e
	ld a, e
	or d
	jp nz, .asm_20a3c
	pop hl
	push hl
	ld a, l
	or h
	jp z, .asm_20a1b
	pop hl
	push hl
	dec hl
	pop de
	push hl
.asm_20a1b: ; 20a1b (8:4a1b)
	jp .asm_20a3c

.asm_20a1e: ; 20a1e (8:4a1e)
	pop hl
	push hl
	ld de, $7
	call CompareHLtoDE
	jp nc, .asm_20a3c
	pop hl
	push hl
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, .asm_20a3c
	pop hl
	push hl
	inc hl
	pop de
	push hl
.asm_20a3c: ; 20a3c (8:4a3c)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	call PrintMoveInfoInBattle
	pop hl
	push hl
	pop bc
	pop bc
	ret

Data_20a54: ; 20a54
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $04, $00, $ff, $ff, $00, $00, $00

Data_20a63: ; 20a63
	db $08, $0d, $0c, $05, $08, $76, $44, $00, $00, $00, $08, $99, $45, $05, $81, $52
	db $08, $17, $44, $08, $46, $46, $08, $40, $46, $00, $00, $00, $00, $00, $00

Data_20a82: ; 20a82
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $04, $00, $ff, $ff, $00, $00, $00

Data_20a91: ; 20a91
	db $08, $0d, $0c, $05, $08, $54, $47, $00, $00, $00, $08, $e8, $49, $08, $65, $49
	db $05, $3f, $74, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Battle_ItemMenu_AButtonReactor: ; 20ab0
	push hl
	add sp, -$2e
	ld hl, sp+$2e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $32
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	swap_de_hl
	push de
	set_farcall_addrs_hli Func_15281
	pop de
	pop hl
	push de
	call FarCall
	write_hl_to_sp_plus $30
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	read_hl_from_sp_plus $32
	ld de, wSaveBlock1_BagItems
	add hl, de
	ld e, [hl]
	ld hl, sp+$2f
	ld [hl], e
	pop af
	call GetSRAMBank
	ld hl, sp+$2d
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$20
	call GetItemAttributes
	pop de
	ld hl, sp+$28
	ld a, [hl]
	and $2
	jp nz, .asm_20b38
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
IF DEF(LANG_JP)
	ld c, $a0 | BANK(Pointers_20199)
ELIF DEF(LANG_EN)
	ld bc, $0537
ENDC
	ld de, Pointers_20199
	ld hl, $10e
	call FarCall
	jp .asm_20c68

.asm_20b38: ; 20b38 (8:4b38)
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, .asm_20ba3
	ld hl, sp+$2b
	ld a, [hl]
	cp $48
	jp nz, .asm_20b67
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
IF DEF(LANG_JP)
	ld c, $a0 | BANK(Pointers_20199)
ELIF DEF(LANG_EN)
	ld bc, $0537
ENDC
	ld de, Pointers_20199
	ld hl, $10e
	call FarCall
	jp .asm_20c68

.asm_20b67: ; 20b67 (8:4b67)
	ld hl, sp+$2b
	ld a, [hl]
	cp BAR_MAGNET
	jp z, .is_magnet
	ld hl, sp+$2b
	ld a, [hl]
	cp U_MAGNET
	jp z, .is_magnet
	ld hl, sp+$2b
	ld a, [hl]
	cp ELECTROMAGNET
	jp z, .is_magnet
	ld hl, sp+$2b
	ld a, [hl]
	cp SUPERCONDUCTOR
	jp nz, .asm_20ba3
.is_magnet
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
IF DEF(LANG_JP)
	ld c, $a0 | BANK(Pointers_201b1)
ELIF DEF(LANG_EN)
	ld bc, $0537
ENDC
	ld de, Pointers_201b1
	ld hl, $10e
	call FarCall
	jp .asm_20c68

.asm_20ba3: ; 20ba3 (8:4ba3)
	call Func_20398
IF DEF(LANG_EN)
	ld de, Data_20c99
	ld hl, $010e
	call PlaceStringDEatCoordHL
ENDC
	ld hl, sp+$1e
	swap_de_hl
	ld hl, sp+$0
	call LiteralStringInTree
	ld hl, sp+$0
	swap_de_hl
	ld hl, $10e
	call PlaceStringDEatCoordHL
IF DEF(LANG_JP)
	ld de, Data_20c99
	ld hl, $110
	call PlaceStringDEatCoordHL
ELIF DEF(LANG_EN)
	ld hl, Data_20cce_en
	push hl
	call printf
	pop bc
ENDC
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp z, .asm_20be8
	jp .asm_20c68

.asm_20be8: ; 20be8 (8:4be8)
	ld hl, sp+$2b
	ld a, [hl]
	dec a
	ld [wCurItem], a
	ld hl, sp+$28
	ld a, [hl]
	and $4
	jp z, .asm_20c61
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	read_hl_from_sp_plus $30
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $8
	call FarCall
	ld a, l
	and h
	inc a
	jp nz, .asm_20c33
	call Func_3af6
	ld hl, $8000
	jp .asm_20c8e

.asm_20c33: ; 20c33 (8:4c33)
	set_farcall_addrs_hli Func_fb42d
	ld a, [wCurItem]
	inc a
	call FarCall
	callba_hli Func_54af8
	cp $ff
	jp nz, .asm_20c61
	call Func_3af6
	ld hl, $8000
	jp .asm_20c8e

.asm_20c61: ; 20c61 (8:4c61)
	read_hl_from_sp_plus $2e
	jp .asm_20c8e

.asm_20c68: ; 20c68 (8:4c68)
	set_farcall_addrs_hli Func_667d
	ld bc, $8e02
	ld de, $1311
	ld hl, $d
	call FarCall
IF DEF(LANG_EN)
	set_farcall_addrs_hli Func_667d
	ld bc, $8302
	ld de, $d
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8402
	ld de, $100d
	ld hl, $010d
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8502
	ld de, $110d
	ld hl, $110d
	call FarCall
ENDC
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
.asm_20c8e: ; 20c8e (8:4c8e)
	swap_de_hl
	add sp, $30
.asm_20c93
	swap_de_hl
	ret

Data_20c99: ; 20c99
IF DEF(LANG_JP)
	dstr "(を つかいますか?)"
ELIF DEF(LANG_EN)
	dstr "Will you use"

Data_20cce_en:
	dstr "?"
ENDC

Data_20ca5: ; 20ca5
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $04, $00, $ff, $ff, $00, $00, $03

Data_20cb4: ; 20cb4
	db  0,  3
	db 15, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Battle_ItemMenu_AButtonReactor
	dba Func_17454
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_20cd3:
	dw Data_20cd7
	dw Data_20cde

Data_20cd7:
IF DEF(LANG_JP)
	dstr "(コウカン)"
ELIF DEF(LANG_EN)
	dstr "Change"
ENDC

Data_20cde:
IF DEF(LANG_JP)
	dstr "ステータス"
ELIF DEF(LANG_EN)
	dstr "Status"
ENDC

Data_20ce3:
	db $00, $00, $00, $00, $ff, $ff, $02, $00, $02, $00, $00, $00
	dw Data_20cd3
	db $00, $0b, $0d, $09, $05, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $05, $81
	db $52, $05, $3f, $74, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00
	db $ff, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $10, $00, $14

Func_20d21: ; 20d21 (8:4d21)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17975
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20d35: ; 20d35 (8:4d35)
	ld c, $80
	jp Func_20d21

Func_20d3a: ; 20d3a (8:4d3a)
	push bc
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus10
	ld hl, $0
	call WriteHLToSPPlus6
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, e
	cp $1
	jp nc, .asm_20d74
	ld a, $ff
	jp .asm_20e6f

.asm_20d74: ; 20d74 (8:4d74)
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$6
	ld [hl], $0
.asm_20d7b: ; 20d7b (8:4d7b)
	ld hl, sp+$6
	ld a, [hl]
	cp e
	jp nc, .asm_20e52
	push de
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, .asm_20da8
	jp .asm_20e47

.asm_20da8: ; 20da8 (8:4da8)
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call Func_2617
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $64
	ld hl, sp+$2
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$3
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, .asm_20e0c
	jp .asm_20e47

.asm_20e0c: ; 20e0c (8:4e0c)
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	mulhl 5
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, .asm_20e47
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld l, c
	ld h, b
	call WriteHLToSPPlus8
.asm_20e47: ; 20e47 (8:4e47)
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	pop de
	jp .asm_20d7b

.asm_20e52: ; 20e52 (8:4e52)
	ld hl, sp+$7
	ld a, [hl]
	cp e
	jp nc, .asm_20e67
	ld hl, sp+$7
	ld a, [hl]
	call GetHLAtSPPlus10
	ld de, $c6
	add hl, de
	cp [hl]
	jp nz, .asm_20e6c
.asm_20e67: ; 20e67 (8:4e67)
	ld a, $ff
	jp .asm_20e6f

.asm_20e6c: ; 20e6c (8:4e6c)
	ld hl, sp+$7
	ld a, [hl]
.asm_20e6f: ; 20e6f (8:4e6f)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_20e75: ; 20e75 (8:4e75)
	push bc
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlus10
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus8
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $c6
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call Func_2617
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $64
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nc, .asm_20f12
	xor a
	jp .asm_20f9b

.asm_20f12: ; 20f12 (8:4f12)
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, .asm_20f22
	xor a
	jp .asm_20f9b

.asm_20f22: ; 20f22 (8:4f22)
	ld a, $64
	call BattleRandom
	ld e, a
	ld d, $0
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	call CompareHLtoDE
	jp nc, .asm_20f5e
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $2
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $5f
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	ld a, $1
	jp .asm_20f9b

.asm_20f5e: ; 20f5e (8:4f5e)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	ld de, $32
	call CompareHLtoDE
	jp c, .asm_20f7c
	ld a, $64
	call BattleRandom
	cp $46
	jp nc, .asm_20f7c
	xor a
	jp .asm_20f9b

.asm_20f7c: ; 20f7c (8:4f7c)
	call Func_20d3a
	cp $ff
	jp nz, .asm_20f88
	xor a
	jp .asm_20f9b

.asm_20f88: ; 20f88 (8:4f88)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus8
	ld de, $5f
	add hl, de
	ld [hl], a
	ld a, $1
.asm_20f9b: ; 20f9b (8:4f9b)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_20fa1: ; 20fa1
	db $64

Data_20fa2: ; 20fa2
	db $28, $64

Data_20fa4: ; 20fa4
	db $14, $32, $64

Data_20fa7: ; 20fa7
	db $0a, $1e, $3c, $64

Data_20fab: ; 20fab
	db $05, $14, $28, $41, $64

Data_20fb0: ; 20fb0
	db $05, $0f, $1e, $32, $4b, $64

Data_20fb6: ; 20fb6
	db $05, $0a, $14, $23, $37, $4b, $64

Data_20fbd: ; 20fbd
	db $05, $0a, $0f, $19, $28, $3c, $50, $64

Pointers_20fc5: ; 20fc5
	dw Data_20fa1
	dw Data_20fa2
	dw Data_20fa4
	dw Data_20fa7
	dw Data_20fab
	dw Data_20fb0
	dw Data_20fb6
	dw Data_20fbd

Func_20fd5: ; 20fd5
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlus7
	read_hl_from wCurRobotPointer
.asm_20ff0
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus5
	call GetHLAtSPPlus5
	ld de, $75
	add hl, de
.asm_20fff
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	call GetHLAtSPPlus5
	ld de, $6f
.asm_21008
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	jp z, .asm_21020
	ld hl, sp+$0
	ld [hl], $18
.asm_21020: ; 21020 (8:5020)
	ld hl, sp+$0
	ld a, [hl]
	cp $a
	jp z, .asm_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, .asm_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, .asm_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, .asm_21056
	ld a, $64
	call BattleRandom
	cp $3c
	jp nc, .asm_21056
.asm_2104a: ; 2104a (8:504a)
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $ff
	jp .asm_2114d

.asm_21056: ; 21056 (8:5056)
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp nz, .asm_21073
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus5
	ld de, $5f
	add hl, de
	ld [hl], $0
	jp .asm_2114d

.asm_21073: ; 21073 (8:5073)
	call Func_20e75
	or a
	jp z, .asm_2107d
	jp .asm_2114d

.asm_2107d: ; 2107d (8:507d)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $13
	add hl, bc
	ld a, [hl]
	ld hl, $13
	add hl, de
	cp [hl]
	jp c, .asm_210af
	ld hl, sp+$2
	ld [hl], $1
	jp .asm_210bc

.asm_210af: ; 210af (8:50af)
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld hl, $13
	add hl, bc
	sub [hl]
	ld hl, sp+$2
	ld [hl], a
.asm_210bc: ; 210bc (8:50bc)
	ld a, $64
	call BattleRandom
	ld hl, sp+$2
	cp [hl]
	jp nc, .asm_210de
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, .asm_210de
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $3
	jp .asm_2114d

.asm_210de: ; 210de (8:50de)
	call GetHLAtSPPlus5
	inc hl
	inc hl
	inc hl
	inc hl
	swap_de_hl
	ld hl, sp+$2
	ld [hl], $1
.asm_210ed: ; 210ed (8:50ed)
	ld hl, sp+$2
	ld a, [hl]
	cp $8
	jp nc, .asm_2110b
	ld a, [de]
	or a
	jp nz, .asm_210fd
	jp .asm_2110b

.asm_210fd: ; 210fd (8:50fd)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	inc de
	inc de
	inc de
	inc de
	jp .asm_210ed

.asm_2110b: ; 2110b (8:510b)
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_20fc5 - 2
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	ld a, $64
	call BattleRandom
	ld e, a
	ld hl, sp+$3
	ld [hl], $0
	pop bc
.asm_21124: ; 21124 (8:5124)
	ld a, [bc]
	ld l, a
	ld a, e
	cp l
	jp nc, .asm_2112e
	jp .asm_21139

.asm_2112e: ; 2112e (8:512e)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	inc bc
	jp .asm_21124

.asm_21139: ; 21139 (8:5139)
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $0
	ld hl, sp+$1
	ld a, [hl]
	call GetHLAtSPPlus5
	ld de, $5f
	add hl, de
	ld [hl], a
.asm_2114d: ; 2114d (8:514d)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_21152: ; 21152
	db $21, $02, $07, $1a, $00, $05, $09, $0c, $03, $1f, $0a, $05, $13, $0c

Func_21160: ; 21160 (8:5160)
IF DEF(LANG_EN)
	push hl
	ld a, l
	or h
	jp nz, .asm_211a3_en
ENDC
	callba_hli Func_d767
IF DEF(LANG_EN)
	jp .asm_211b1_en

.asm_211a3_en
	callba_hli Func_d767_2
.asm_211b1_en
ENDC
	ld de, $130d
	ld hl, $5
	call Func_2036d
	callba_hli Func_5d113
IF DEF(LANG_EN)
	pop hl
	ld a, l
	or h
	jp nz, .asm_211d4_en
ENDC
	call Func_20398
IF DEF(LANG_EN)
	jp .asm_211d7_en

.asm_211d4_en
	call Func_20385_en
.asm_211d7_en
ENDC
	ld a, [wSystemType]
	cp $1
	jp z, .asm_21198
	ld a, [wSystemType]
	cp $ff
	jp nz, .asm_211e1
.asm_21198: ; 21198 (8:5198)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	call Func_2041b
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ld c, $1
	ld de, $e
	ld hl, Data_21152
	call Func_2a79
	ld a, [wLCDC]
	ldh [rLCDC], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	jp .asm_211fa

.asm_211e1: ; 211e1 (8:51e1)
	check_cgb
	jp nz, .asm_211ee
	ld a, $2
	ld [wEnableAttrMapTransfer], a
.asm_211ee: ; 211ee (8:51ee)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
.asm_211fa: ; 211fa (8:51fa)
	ret

Func_211fb: ; 211fb (8:51fb)
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus8
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$1
	ldh a, [hSRAMBank]
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, .asm_2133c
	push bc
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp z, .asm_2126c
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, .asm_212cb
.asm_2126c: ; 2126c (8:526c)
	ld c, $1
	call GetHLAtSPPlus8
	swap_de_hl
	ld hl, $2f
	call Func_20304
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	ld c, [hl]
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, .asm_212c2
	ld a, c
	cp $ab
	jp c, .asm_212c2
	ld a, c
	cp $af
	jp nc, .asm_212c2
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld l, c
	ld h, $0
	mulhl $351
	ld de, (s2_b29f - $351 * $ab) & $ffff
	add hl, de
	swap_de_hl
	ld hl, $351
	ld c, $1
	call Func_20304
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
.asm_212c2: ; 212c2 (8:52c2)
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld [hl], $ff
.asm_212cb: ; 212cb (8:52cb)
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, .asm_212e0
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $2
	jp nz, .asm_21339
.asm_212e0: ; 212e0 (8:52e0)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, $2f
	call Func_202f0
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_212ff
	ld hl, sp+$0
	ld [hl], $1
.asm_212ff: ; 212ff (8:52ff)
	push bc
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld e, [hl]
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_21332
	ld a, e
	cp $ab
	jp c, .asm_21332
	ld a, e
	cp $af
	jp nc, .asm_21332
	ld c, $1
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $351
	call Func_202f0
.asm_21332: ; 21332 (8:5332)
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
.asm_21339: ; 21339 (8:5339)
	jp .asm_21422

.asm_2133c: ; 2133c (8:533c)
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, .asm_21350
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $2
	jp nz, .asm_213a9
.asm_21350: ; 21350 (8:5350)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, $2f
	call Func_202f0
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_2136f
	ld hl, sp+$0
	ld [hl], $1
.asm_2136f: ; 2136f (8:536f)
	push bc
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld e, [hl]
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_213a2
	ld a, e
	cp $ab
	jp c, .asm_213a2
	ld a, e
	cp $af
	jp nc, .asm_213a2
	ld c, $1
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $351
	call Func_202f0
.asm_213a2: ; 213a2 (8:53a2)
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
.asm_213a9: ; 213a9 (8:53a9)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp z, .asm_213c3
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, .asm_21422
.asm_213c3: ; 213c3 (8:53c3)
	ld c, $1
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, $2f
	call Func_20304
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld c, [hl]
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, .asm_21419
	ld a, c
	cp $ab
	jp c, .asm_21419
	ld a, c
	cp $af
	jp nc, .asm_21419
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld l, c
	ld h, $0
	mulhl $351
	ld de, (s2_b29f - $351 * $ab) & $ffff
	add hl, de
	swap_de_hl
	ld hl, $351
	ld c, $1
	call Func_20304
	ld hl, sp+$1
	ld a, [hl]
	call GetSRAMBank
.asm_21419: ; 21419 (8:5419)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $ff
.asm_21422: ; 21422 (8:5422)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, .asm_2143c
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $6
	call FarCall
.asm_2143c: ; 2143c (8:543c)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_21441: ; 21441 (8:5441)
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_2152f
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	xor a
	ld c, $3
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	swap_de_hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	push bc
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld hl, $c6
	add hl, bc
	ld [hl], a
	push af
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	set_farcall_addrs_hli Func_dbf5
	pop af
	push af
	ld e, a
	xor a
	ld c, $0
	call FarCall
	pop af
	pop bc
	push bc
	ld l, a
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $75
	add hl, bc
	ld [hl], a
	call GetHLAtSPPlus4
	ld de, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $5
	call FarCall
	pop bc
.asm_2152f: ; 2152f (8:552f)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, .asm_2155a
	ld e, c
	ld d, b
	ld hl, $c8
	ld c, $1
	call Func_20304
	ld c, $1
	call GetHLAtSPPlus4
	swap_de_hl
	ld hl, $c8
	call Func_202f0
	jp .asm_21573

.asm_2155a: ; 2155a (8:555a)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	swap_de_hl
	ld hl, $c8
	call Func_202f0
	pop de
	ld hl, $c8
	ld c, $1
	call Func_20304
.asm_21573: ; 21573 (8:5573)
	call Func_211fb
	pop hl
	push hl
	ld de, $2f
	add hl, de
	pop de
	push hl
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	pop hl
	push hl
	ld de, $22
	add hl, de
	ld [hl], a
IF DEF(LANG_EN)
	ld hl, $0
ENDC
	call Func_21160
	pop bc
	pop bc
	ret

Func_21593: ; 21593
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	ld [hl], $0
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, .asm_215b1
	ld hl, sp+$1
	ld [hl], $1
	jp .asm_215b5

.asm_215b1: ; 215b1 (8:55b1)
	ld hl, sp+$1
	ld [hl], $0
.asm_215b5: ; 215b5 (8:55b5)
	ld e, $0
.asm_215b7: ; 215b7 (8:55b7)
	ld a, e
	cp $2
	jp nc, .asm_216cd
	push de
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	mulhl 200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus9
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, .asm_215f8
	ld hl, $0
	jp .asm_215fb

.asm_215f8: ; 215f8 (8:55f8)
	ld hl, $2f
.asm_215fb: ; 215fb (8:55fb)
	add hl, de
	call WriteHLToSPPlus7
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $6
	jp z, .asm_21634
	cp $4
	jp nz, .asm_216b5
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, .asm_21631
	ld a, $64
	call BattleRandom
	cp $32
	jp nc, .asm_21631
	ld hl, sp+$4
	ld [hl], $fe
.asm_21631: ; 21631 (8:5631)
	jp .asm_216b5

.asm_21634: ; 21634 (8:5634)
	ld a, $64
	call BattleRandom
	ld c, a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, .asm_2169e
	ld a, c
	cp $14
	jp nc, .asm_21654
	ld hl, sp+$4
	ld [hl], $0
	call GetHLAtSPPlus9
	ld de, $5f
	add hl, de
	ld [hl], $0
.asm_21654: ; 21654 (8:5654)
	ld a, c
	cp $28
	jp nc, .asm_21661
	ld hl, sp+$4
	ld [hl], $ff
	jp .asm_2169e

.asm_21661: ; 21661 (8:5661)
	ld a, c
	cp $46
	jp nc, .asm_2166e
	ld hl, sp+$4
	ld [hl], $fe
	jp .asm_2169e

.asm_2166e: ; 2166e (8:566e)
	ld a, c
	cp $50
	jp nc, .asm_2168d
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld [hl], $9
	ld a, [hl]
	call GetHLAtSPPlus7
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $1
	jp .asm_2169e

.asm_2168d: ; 2168d (8:568d)
	ld a, c
	cp $55
	jp nc, .asm_2169a
	ld hl, sp+$4
	ld [hl], $3
	jp .asm_2169e

.asm_2169a: ; 2169a (8:569a)
	ld hl, sp+$4
	ld [hl], $fd
.asm_2169e: ; 2169e (8:569e)
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp z, .asm_216b5
	call GetHLAtSPPlus9
	ld de, $5f
	add hl, de
	ld [hl], $0
.asm_216b5: ; 216b5 (8:56b5)
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$1
	ld a, [hl]
	xor $1
	ld hl, sp+$1
	ld [hl], a
	jp .asm_215b7

.asm_216cd: ; 216cd (8:56cd)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, .asm_216d7
IF DEF(LANG_EN)
	ld hl, $0
ENDC
	call Func_21160
.asm_216d7: ; 216d7 (8:56d7)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_216dc: ; 216dc
	ds 6

Func_216e2: ; 216e2 (8:56e2)
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	write_hl_to_sp_plus $e
	ld hl, sp+$6
	swap_de_hl
	ld hl, Data_216dc
	ld bc, $6
	call MemCopy
	pop de
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, .asm_21744
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $fc
	jp nz, .asm_21820
.asm_21744: ; 21744 (8:5744)
	push de
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	ld a, $1
	ld c, $6
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	swap_de_hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	pop de
	push bc
	push de
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e
	ld de, $b
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$b
	ld [hl], $5
	pop de
	push af
	ld l, e
	ld h, d
	ld a, $fe
	and [hl]
	ld [hl], a
	inc de
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop af
	pop bc
	push af
	push bc
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop bc
	pop af
	push af
	ld hl, $c6
	add hl, bc
	ld [hl], a
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	add $4
	ld b, a
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlus10
	or [hl]
	ld [hl], a
	set_farcall_addrs_hli Func_d7f5
	ld hl, sp+$2
	swap_de_hl
	ld a, $3
	call FarCall
.asm_21820: ; 21820 (8:5820)
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, .asm_218dd
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	xor a
	ld c, $3
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	swap_de_hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	push bc
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	push af
	ld hl, sp+$7
	ld [hl], $2
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	mulhl 17
	swap_de_hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop af
	push af
	ld b, a
	ld a, $1
	call LeftShiftA
	read_hl_from_sp_plus $c
	or [hl]
	ld [hl], a
	pop af
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld [hl], a
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_d7f5
	ld hl, sp+$2
	swap_de_hl
	ld a, $2
	call FarCall
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
.asm_218dd: ; 218dd (8:58dd)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_218e2: ; 218e2
	add sp, -$46
	xor a
	ld hl, sp+$44
	ld [hl], a
.asm_218e8: ; 218e8 (8:58e8)
	cp $4
	jp nc, .asm_21912
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$0
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, sp+$3e
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_218e8

.asm_21912: ; 21912 (8:5912)
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, sp+$3c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_2016b
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dc974
	call Func_2026f_en
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, sp+$3c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dc976
	call Func_2026f_en
ENDC
	ld hl, sp+$44
	ld e, [hl]
	ld hl, sp+$3c
	call Func_203fa
	add sp, $46
	ret

Func_2193a: ; 2193a
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $1
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, .asm_21a35
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, .asm_219b7
	ld hl, sp+$4
	ld [hl], $1
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveBlock1_Party
	ld c, $0
.asm_21988: ; 21988 (8:5988)
	ld a, c
	cp $4
	jp nc, .asm_219b0
	ld a, [de]
	or a
	jp z, .asm_219a4
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .asm_219a4
	ld hl, sp+$6
	ld [hl], $0
	jp .asm_219b0

.asm_219a4: ; 219a4 (8:59a4)
	inc c
	ld hl, $23
	add hl, de
	swap_de_hl
	jp .asm_21988

.asm_219b0: ; 219b0 (8:59b0)
	pop af
	call GetSRAMBank
	jp .asm_219bb

.asm_219b7: ; 219b7 (8:59b7)
	ld hl, sp+$4
	ld [hl], $0
.asm_219bb: ; 219bb (8:59bb)
	ld c, $1
	ld hl, sp+$4
	swap_de_hl
	ld hl, $1
	call Func_20304
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_219d6
	ld a, $2
	jp .asm_21b0a

.asm_219d6: ; 219d6 (8:59d6)
	push bc
	ld c, $1
	ld hl, sp+$4
	swap_de_hl
	ld hl, $1
	call Func_202f0
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_219f2
	ld a, $1
	jp .asm_21b0a

.asm_219f2: ; 219f2 (8:59f2)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, .asm_21a32
	ld hl, sp+$2
	ld [hl], $1
.asm_21a08: ; 21a08 (8:5a08)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, .asm_21a2f
IF DEF(LANG_EN)
	ld hl, $0
ENDC
	call Func_21160
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld de, $5f
	add hl, de
	ld a, [wc2e9]
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $0
	jp .asm_21a32

.asm_21a2f: ; 21a2f (8:5a2f)
	jp .asm_21a08

.asm_21a32: ; 21a32 (8:5a32)
	jp .asm_21afb

.asm_21a35: ; 21a35 (8:5a35)
	push bc
	ld c, $1
	ld hl, sp+$4
	swap_de_hl
	ld hl, $1
	call Func_202f0
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_21a51
	ld a, $1
	jp .asm_21b0a

.asm_21a51: ; 21a51 (8:5a51)
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, .asm_21a9c
	ld hl, sp+$4
	ld [hl], $1
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveBlock1_Party
	ld c, $0
.asm_21a6d: ; 21a6d (8:5a6d)
	ld a, c
	cp $4
	jp nc, .asm_21a95
	ld a, [de]
	or a
	jp z, .asm_21a89
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .asm_21a89
	ld hl, sp+$6
	ld [hl], $0
	jp .asm_21a95

.asm_21a89: ; 21a89 (8:5a89)
	inc c
	ld hl, $23
	add hl, de
	swap_de_hl
	jp .asm_21a6d

.asm_21a95: ; 21a95 (8:5a95)
	pop af
	call GetSRAMBank
	jp .asm_21aa0

.asm_21a9c: ; 21a9c (8:5a9c)
	ld hl, sp+$4
	ld [hl], $0
.asm_21aa0: ; 21aa0 (8:5aa0)
	ld c, $1
	ld hl, sp+$4
	swap_de_hl
	ld hl, $1
	call Func_20304
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_21abb
	ld a, $2
	jp .asm_21b0a

.asm_21abb: ; 21abb (8:5abb)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, .asm_21afb
	ld hl, sp+$2
	ld [hl], $1
.asm_21ad1: ; 21ad1 (8:5ad1)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, .asm_21af8
IF DEF(LANG_EN)
	ld hl, $0
ENDC
	call Func_21160
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld de, $5f
	add hl, de
	ld a, [wc2e9]
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $0
	jp .asm_21afb

.asm_21af8: ; 21af8 (8:5af8)
	jp .asm_21ad1

.asm_21afb: ; 21afb (8:5afb)
	read_hl_from wCurRobotPointer
	ld de, $142
	add hl, de
	ld [hl], $ff
	call Func_21441
	xor a
.asm_21b0a: ; 21b0a (8:5b0a)
	pop bc
	pop bc
	ret

Func_21b0d: ; 21b0d
	push bc
	push bc
	push bc
	ld hl, sp+$4
	ld [hl], $1
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	pop de
	push hl
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, .asm_21bc0
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveBlock1_Party
	ld c, $0
.asm_21b54: ; 21b54 (8:5b54)
	ld a, c
	cp $4
	jp nc, .asm_21b7c
	ld a, [de]
	or a
	jp z, .asm_21b70
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .asm_21b70
	ld hl, sp+$6
	ld [hl], $0
	jp .asm_21b7c

.asm_21b70: ; 21b70 (8:5b70)
	inc c
	ld hl, $23
	add hl, de
	swap_de_hl
	jp .asm_21b54

.asm_21b7c: ; 21b7c (8:5b7c)
	pop af
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, .asm_21b8d
	ld hl, sp+$4
	ld a, [hl]
	jp .asm_21bc1

.asm_21b8d: ; 21b8d (8:5b8d)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, .asm_21bb2
IF DEF(LANG_EN)
	ld hl, $0
ENDC
	call Func_21160
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld a, [wc2e9]
	ld [hl], a
	jp .asm_21bb5

.asm_21bb2: ; 21bb2 (8:5bb2)
	jp .asm_21b8d

.asm_21bb5: ; 21bb5 (8:5bb5)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	call Func_216e2
.asm_21bc0: ; 21bc0 (8:5bc0)
	xor a
.asm_21bc1: ; 21bc1 (8:5bc1)
	pop bc
	pop bc
	pop bc
	ret

Func_21bc5: ; 21bc5 (8:5bc5)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli DisplayPartyMenu
	ld de, $0
	ld a, $1
	call FarCall
	ret

Func_21bf5: ; 21bf5
	push af
IF DEF(LANG_EN)
	push de
ENDC
	ld hl, -$114
	add hl, sp
	ld sp, hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $113
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $111
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld a, [hl]
IF DEF(LANG_EN)
	ld hl, $0
	write_hl_to_sp_plus $116
ENDC
	cp $b
	jp z, .asm_21c4b
	cp $a
	jp z, .asm_21c3d
	cp $9
	jp nz, .asm_21c51
	ld hl, $115
	add hl, sp
	ld [hl], $5
	jp .asm_21c51

.asm_21c3d: ; 21c3d (8:5c3d)
	ld hl, $115
	add hl, sp
	ld a, [hl]
	add a
	ld hl, $115
	add hl, sp
	ld [hl], a
	jp .asm_21c51

.asm_21c4b: ; 21c4b (8:5c4b)
	ld hl, $115
	add hl, sp
	ld [hl], $1
.asm_21c51: ; 21c51 (8:5c51)
	xor a
.asm_21c52: ; 21c52 (8:5c52)
	cp $a
	jp nc, .asm_21c7e
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$31
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fc
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_21c52

.asm_21c7e: ; 21c7e (8:5c7e)
	ld hl, $f9
	add hl, sp
	ld [hl], $0
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_200fd
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc08
	call Func_2026f_en
ENDC
	swap_de_hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call Func_20d35
IF DEF(LANG_JP)
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call strcpy
ELIF DEF(LANG_EN)
	ld c, $1
	ld hl, $117
	add hl, sp
	ld a, [hl]
	cp $a
	jp c, .asm_21d47_en
	ld c, $2
.asm_21d47_en
	ld hl, $117
	add hl, sp
	ld a, [hl]
	cp $64
	jp c, .asm_21d53_en
	ld c, $3
.asm_21d53_en
	push bc
	ld hl, $fc
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fc
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fd
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc0a
	call Func_2026f_en
	swap_de_hl
	pop bc
	ld l, c
	ld h, $00
	add hl, de
	ld de, Data_dcc0c
	call Func_2026f_en
	swap_de_hl
ENDC
	ld hl, $10e
	add hl, sp
	ld [hl], $0
.asm_21cde: ; 21cde (8:5cde)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, .asm_21d47
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$c
	swap_de_hl
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $2b
	ld c, l
	ld b, h
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, .asm_21d11
	jp .asm_21d39

.asm_21d11: ; 21d11 (8:5d11)
	push bc
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotBaseStats
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, .asm_21d33
	call GetHLAtSPPlus5
	swap_de_hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp c, .asm_21d36
.asm_21d33: ; 21d33 (8:5d33)
	jp .asm_21d39

.asm_21d36: ; 21d36 (8:5d36)
	jp .asm_21d47

.asm_21d39: ; 21d39 (8:5d39)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $10e
	add hl, sp
	ld [hl], a
	jp .asm_21cde

.asm_21d47: ; 21d47 (8:5d47)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, .asm_21d74
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_2015d
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc41
	call Func_2026f_en
	ld hl, $fa
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fa
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fb
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc43
	call Func_2026f_en
ENDC
.asm_21d74: ; 21d74 (8:5d74)
IF DEF(LANG_EN)
	read_hl_from_sp_plus $116
	ld a, l
	or h
	jp nz, .asm_21e65_en
ENDC
	ld hl, $f9
	add hl, sp
	ld e, [hl]
	ld hl, $fa
	add hl, sp
	call Func_203fa
	call Func_20398
IF DEF(LANG_EN)
	jp .asm_21e74_en

.asm_21e65_en
	ld hl, $fa
	add hl, sp
	ld e, [hl]
	ld hl, $fb
	add hl, sp
	call Func_203fd_en
	call Func_20385_en
.asm_21e74_en
ENDC
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, .asm_21d90
	jp .asm_21f1c

.asm_21d90: ; 21d90 (8:5d90)
	ld de, Data_21f22
	ld hl, $10e
	call PlaceStringDEatCoordHL
IF DEF(LANG_EN)
	ld de, Data_22046_en
	ld hl, $110
	call PlaceStringDEatCoordHL
ENDC
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp z, .asm_21dbb
	jp .asm_21f1c

.asm_21dbb: ; 21dbb (8:5dbb)
	set_farcall_addrs_hli DisplayPartyMenu
	ld hl, $115
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld a, $3
	call FarCall
	push hl
IF DEF(LANG_EN)
	read_hl_from_sp_plus $118
ENDC
	call Func_21160
	pop hl
	ld a, l
	and h
	inc a
	jp nz, .asm_21de0
	jp .asm_21d90

.asm_21de0: ; 21de0 (8:5de0)
	set_farcall_addrs_hli Func_6b94
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	swap_de_hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call FarCall
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$e
	swap_de_hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotBaseStats
	call GetHLAtSPPlus7
	write_hl_to_sp_plus $33
	pop bc
	ld a, [wc2e9]
	read_hl_from_sp_plus $111
	ld de, $c6
	add hl, de
	cp [hl]
	jp nz, .asm_21e63
	read_hl_from_sp_plus $113
	ld de, $29
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
.asm_21e63: ; 21e63 (8:5e63)
	read_hl_from_sp_plus $31
	swap_de_hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, .asm_21e76
	jp .asm_21f1c

.asm_21e76: ; 21e76 (8:5e76)
	read_hl_from_sp_plus $31
	push hl
	read_hl_from_sp_plus $115
	ld de, $29
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_6ebf
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	push hl
	read_hl_from_sp_plus $33
	pop de
	call FarCall
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$c
	swap_de_hl
	ld a, [wc2e9]
	call FarCall
	ld hl, $f9
	add hl, sp
	ld [hl], $0
	ld hl, sp+$d
	push hl
	ld hl, $fb
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fb
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fc
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
IF DEF(LANG_JP)
	ld de, Text_20102
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc26
	call Func_2026f_en
ENDC
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_2011d
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc28
	call Func_2026f_en
	read_hl_from_sp_plus $116
	ld a, l
	or h
	jp nz, .asm_22046_en
ENDC
	ld hl, $f9
	add hl, sp
	ld e, [hl]
	ld hl, $fa
	add hl, sp
	call Func_203fa
IF DEF(LANG_EN)
	jp .asm_21f1c
.asm_22046_en
	ld hl, $fa
	add hl, sp
	ld e, [hl]
	ld hl, $fb
	add hl, sp
	call Func_203fd_en
ENDC
.asm_21f1c: ; 21f1c (8:5f1c)
	ld hl, $116
	add hl, sp
	ld sp, hl
	ret

Data_21f22: ; 21f22
IF DEF(LANG_JP)
	dstr "(たへﾞさせますか?)"
ELIF DEF(LANG_EN)
	dstr "Use them on"

Data_22046_en:
	dstr "your Robopon?"
ENDC

Func_21f2e: ; 21f2e
	push af
	ld hl, -$ea
	add hl, sp
	ld sp, hl
IF DEF(LANG_EN)
	push de
ENDC
	xor a
.asm_21f35: ; 21f35 (8:5f35)
	cp $a
	jp nc, .asm_21f61
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d8
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_21f35

.asm_21f61: ; 21f61 (8:5f61)
	ld hl, $d5
	add hl, sp
	ld [hl], $0
IF DEF(LANG_EN)
	ld hl, $00d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $00d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	swap_de_hl
	ld hl, $00d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc78
	call Func_2026f_en
ENDC
	ld hl, $eb
	add hl, sp
	ld e, [hl]
	ld hl, sp+$0
	call GetItemAttributes
	ld hl, sp+$0
	push hl
	ld hl, $d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
IF DEF(LANG_JP)
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc7a
	call Func_2026f_en
ENDC
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $eb
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $0
	ld e, $1
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, .asm_21ff6
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $1
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	call FarCall
.asm_21ff6: ; 21ff6 (8:5ff6)
	cp $ff
	jp nz, .asm_2201e
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_20124
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc8b
	call Func_2026f_en
	ld hl, $00d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $00d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	swap_de_hl
	ld hl, $00d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc8d
	call Func_2026f_en
	ld hl, $00d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $00d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	swap_de_hl
	ld hl, $00d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc8f
	call Func_2026f_en
ENDC
.asm_2201e: ; 2201e (8:601e)
IF DEF(LANG_EN)
	pop de
	ld a, e
	or d
	jp nz, .asm_221a6_en
ENDC
	ld hl, $d5
	add hl, sp
	ld e, [hl]
	ld hl, $d6
	add hl, sp
	call Func_203fa
IF DEF(LANG_EN)
	jp .asm_221b2_en

.asm_221a6_en
	ld hl, $d5
	add hl, sp
	ld e, [hl]
	ld hl, $d6
	add hl, sp
	call Func_203fd_en
.asm_221b2_en
ENDC
	ld hl, $ec
	add hl, sp
	ld sp, hl
	ret

Func_22030: ; 22030
	push af
	ld hl, -$f6
	add hl, sp
	ld sp, hl
	xor a
.asm_22037: ; 22037 (8:6037)
	cp $a
	jp nc, .asm_22063
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$18
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $e3
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_22037

.asm_22063: ; 22063 (8:6063)
	ld hl, $e0
	add hl, sp
	ld [hl], $0
	ld hl, $f7
	add hl, sp
	ld e, [hl]
	ld hl, sp+$0
	call GetPart
IF DEF(LANG_EN)
	ld hl, $00e2
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $00e2
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	swap_de_hl
	ld hl, $00e3
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc78
	call Func_2026f_en
ENDC
	ld hl, sp+$0
	push hl
	ld hl, $e2
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e2
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $e3
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
IF DEF(LANG_JP)
	ld hl, $e0
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e0
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $e1
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call strcpy
ENDC
	ld hl, $f7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f7
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli Func_4ed70
	ld e, $0
	ld hl, $f7
	add hl, sp
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, .asm_220f4
	set_farcall_addrs_hli Func_4ed70
	ld e, $2
	ld hl, $f7
	add hl, sp
	ld a, [hl]
	call FarCall
.asm_220f4: ; 220f4 (8:60f4)
	cp $ff
	jp nz, .asm_2211c
	ld hl, $e0
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e0
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $e1
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
IF DEF(LANG_JP)
	ld de, Text_20124
	call strcpy
ELIF DEF(LANG_EN)
	ld de, Data_dcc8d
	call Func_2026f_en
	ld hl, $00e2
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $00e2
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	swap_de_hl
	ld hl, $00e3
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Data_dcc8f
	call Func_2026f_en
ENDC
.asm_2211c: ; 2211c (8:611c)
	ld hl, $e0
	add hl, sp
	ld e, [hl]
	ld hl, $e1
	add hl, sp
	call Func_203fa
	ld hl, $f8
	add hl, sp
	ld sp, hl
	ret

Func_2212e: ; 2212e
	push hl
	ld hl, -$e4
	add hl, sp
	ld sp, hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	ld hl, $b
	add hl, bc
	write_hl_to_sp_plus $e3
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc c
	dec c
	jp nz, .asm_22166
	ld c, $1
.asm_22166: ; 22166 (8:6166)
	ld hl, $0
	write_hl_to_sp_plus $e1
	xor a
.asm_2216e: ; 2216e (8:616e)
	cp c
	jp nc, .asm_22196
	push bc
	read_hl_from_sp_plus $e7
	inc hl
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $e3
	add hl, bc
	write_hl_to_sp_plus $e3
	inc a
	read_hl_from_sp_plus $e7
	ld de, $7
	add hl, de
	write_hl_to_sp_plus $e7
	pop bc
	jp .asm_2216e

.asm_22196: ; 22196 (8:6196)
	read_hl_from_sp_plus $e1
	push hl
	read_hl_from_sp_plus $ea
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	write_hl_to_sp_plus $e3
	pop af
	cp $e
	jp z, .asm_221e2
	cp $d
	jp z, .asm_221d6
	cp $c
	jp nz, .asm_221f0
	read_hl_from_sp_plus $e1
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e1
	add hl, bc
	write_hl_to_sp_plus $e1
	jp .asm_221f0

.asm_221d6: ; 221d6 (8:61d6)
	read_hl_from_sp_plus $e1
	add hl, hl
	write_hl_to_sp_plus $e1
	jp .asm_221f0

.asm_221e2: ; 221e2 (8:61e2)
	read_hl_from_sp_plus $e1
	ld de, $2
	call DivideHLByDESigned
	write_hl_to_sp_plus $e1
.asm_221f0: ; 221f0 (8:61f0)
	read_hl_from_sp_plus $e1
	swap_de_hl
	ld hl, $0
	call CompareHLtoDE
	jp c, .asm_2220b
	ld hl, $1
	write_hl_to_sp_plus $e1
	jp .asm_22223

.asm_2220b: ; 2220b (8:620b)
	read_hl_from_sp_plus $e1
	swap_de_hl
	ld hl, 9990
	call CompareHLtoDE
	jp nc, .asm_22223
	ld hl, 9990
	write_hl_to_sp_plus $e1
.asm_22223: ; 22223 (8:6223)
	xor a
.asm_22224: ; 22224 (8:6224)
	cp $a
	jp nc, .asm_22250
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$0
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $cb
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_22224

.asm_22250: ; 22250 (8:6250)
	ld hl, $c8
	add hl, sp
	ld [hl], $0
	ld hl, $c8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $c8
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $c9
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $e3
	pop de
	call Func_20d35
	ld de, Text_20104
	call strcpy
	ld de, Text_20116
	call strcpy
	ld hl, $c8
	add hl, sp
	ld e, [hl]
	ld hl, $c9
	add hl, sp
	call Func_203fa
	push hl
	push hl
	read_hl_from_sp_plus $e5
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_222a3
	dec bc
.asm_222a3
	push bc
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $e6
	add hl, sp
	ld sp, hl
	ret

Data_222b2: ; 222b2
	db $01, $03, $05, $0a, $14

Func_222b7:: ; 222b7 (8:62b7)
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $28
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4001
	add hl, de
	call WriteHLToSPPlus5
	ld hl, $28
	add hl, bc
	ld a, [hl]
	cp $15
	jp c, .asm_22304
	ld hl, $28
	add hl, bc
	ld [hl], $0
	ld hl, $28
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4001
	add hl, de
	call WriteHLToSPPlus5
.asm_22304: ; 22304 (8:6304)
	ld a, $64
	call BattleRandom
	ld hl, sp+$2
	ld [hl], a
	ld c, $0
.asm_2230e: ; 2230e (8:630e)
	ld a, c
	cp $5
	jp nc, .asm_22329
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus5
	ld e, c
	ld d, $0
	add hl, de
	cp [hl]
	jp nc, .asm_22325
	jp .asm_22329

.asm_22325: ; 22325 (8:6325)
	inc c
	jp .asm_2230e

.asm_22329: ; 22329 (8:6329)
	ld e, c
	ld d, $0
	ld hl, Data_222b2
	add hl, de
	ld c, [hl]
	ld a, [wInBattle]
	cp $2
	jp nz, .asm_2234d
	push bc
	set_farcall_addrs_hli Func_6c11d
	pop bc
	ld a, c
	call FarCall
	jp .asm_22351

.asm_2234d: ; 2234d (8:634d)
	ld a, c
	call Func_21bf5
.asm_22351: ; 22351 (8:6351)
	ld a, $64
	call BattleRandom
	cp $28
	jp nc, .asm_223a3
	ld a, $64
	call BattleRandom
	ld hl, sp+$2
	ld [hl], a
	ld c, $0
.asm_22365: ; 22365 (8:6365)
	ld a, c
	cp $2
	jp nc, .asm_22384
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus5
	ld de, $8
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	cp [hl]
	jp nc, .asm_22380
	jp .asm_22384

.asm_22380: ; 22380 (8:6380)
	inc c
	jp .asm_22365

.asm_22384: ; 22384 (8:6384)
	call GetHLAtSPPlus5
	ld de, $5
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld c, [hl]
	ld a, c
	and $80
	jp nz, .asm_2239d
	ld a, c
	call Func_21f2e
	jp .asm_223a3

.asm_2239d: ; 2239d (8:639d)
	ld a, c
	and $7f
	call Func_22030
.asm_223a3: ; 223a3 (8:63a3)
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, .asm_223b5
	call GetHLAtSPPlus3
	call Func_2212e
.asm_223b5: ; 223b5 (8:63b5)
	pop bc
	pop bc
	ret

Func_223b8: ; 223b8 (8:63b8)
	ld hl, -$13a
	add hl, sp
	ld sp, hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	write_hl_to_sp_plus $11f
	read_hl_from_sp_plus $11f
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld a, [hl]
	push af
	ld hl, $0
	write_hl_to_sp_plus $11e
	xor a
.asm_223f1: ; 223f1 (8:63f1)
	cp $a
	jp nc, .asm_2241d
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $124
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_223f1

.asm_2241d: ; 2241d (8:641d)
	xor a
	read_hl_from_sp_plus $121
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	inc l
	dec l
	jp nz, .asm_2242e
	ld l, $1
.asm_2242e: ; 2242e (8:642e)
	ld e, $0
.asm_22430: ; 22430 (8:6430)
	ld a, e
	cp l
	jp nc, .asm_2248c
	push hl
	push de
	push bc
	ld a, [bc]
	ld e, a
	ld hl, $f3
	add hl, sp
	call GetRobotBaseStats
	ld hl, $f8
	add hl, sp
	ld a, [hl]
	cp $8
	jp nc, .asm_22450
	ld a, $4
	jp .asm_22461

.asm_22450: ; 22450 (8:6450)
	ld hl, $f8
	add hl, sp
	ld a, [hl]
	cp $b
	jp nc, .asm_2245f
	ld a, $3
	jp .asm_22461

.asm_2245f: ; 2245f (8:645f)
	ld a, $2
.asm_22461: ; 22461 (8:6461)
	pop bc
	pop de
	push bc
	push de
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $124
	add hl, bc
	write_hl_to_sp_plus $124
	pop de
	inc e
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	jp .asm_22430

.asm_2248c: ; 2248c (8:648c)
	pop af
	cp $11
	jp z, .asm_224c5
	cp $10
	jp z, .asm_224b7
	cp $f
	jp nz, .asm_224d5
	read_hl_from_sp_plus $11c
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $11c
	add hl, bc
	write_hl_to_sp_plus $11c
	jp .asm_224d5

.asm_224b7: ; 224b7 (8:64b7)
	read_hl_from_sp_plus $11c
	add hl, hl
	write_hl_to_sp_plus $11c
	jp .asm_224d5

.asm_224c5: ; 224c5 (8:64c5)
	read_hl_from_sp_plus $11c
	ld de, $2
	call DivideHLByDESigned
	write_hl_to_sp_plus $11c
.asm_224d5: ; 224d5 (8:64d5)
	ld c, $0
	ld hl, $138
	add hl, sp
	ld [hl], c
.asm_224dc: ; 224dc (8:64dc)
	ld a, c
	cp $4
	jp nc, .asm_2253a
	push bc
	set_farcall_addrs_hli GetRobotInParty
	pop bc
	push bc
	ld a, c
	ld hl, $ca
	add hl, sp
	swap_de_hl
	call FarCall
	pop bc
	read_hl_from_sp_plus $d6
	ld a, l
	or h
	jp z, .asm_2250f
	ld hl, $c8
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_22512
.asm_2250f: ; 2250f (8:650f)
	jp .asm_22536

.asm_22512: ; 22512 (8:6512)
	ld b, c
	ld a, $1
	call LeftShiftA
	read_hl_from_sp_plus $11f
	and [hl]
	jp z, .asm_22536
	ld hl, $138
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $138
	add hl, sp
	ld [hl], a
	dec a
	ld e, a
	ld d, $0
	ld hl, $134
	add hl, sp
	add hl, de
	ld [hl], c
.asm_22536: ; 22536 (8:6536)
	inc c
	jp .asm_224dc

.asm_2253a: ; 2253a (8:653a)
	ld hl, $138
	add hl, sp
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $11e
	pop de
	call DivideHLByDESigned
	write_hl_to_sp_plus $11c
	ld a, l
	or h
	jp nz, .asm_2255d
	ld hl, $1
	write_hl_to_sp_plus $11c
.asm_2255d: ; 2255d (8:655d)
	ld e, $0
.asm_2255f: ; 2255f (8:655f)
	ld a, e
	ld hl, $138
	add hl, sp
	cp [hl]
	jp nc, .asm_228c5
	push de
	ld hl, $11e
	add hl, sp
	ld [hl], $0
	read_hl_from_sp_plus $11e
	ld c, l
	ld b, h
	pop de
	push bc
	push de
	set_farcall_addrs_hli GetRobotInParty
	pop de
	push de
	ld d, $0
	ld hl, $138
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $cc
	add hl, sp
	swap_de_hl
	call FarCall
	pop de
	pop bc
	ld hl, $cf
	add hl, sp
	ld a, [hl]
	cp $63
	jp c, .asm_225a8
	jp .asm_228c1

.asm_225a8: ; 225a8 (8:65a8)
	push de
	push bc
	ld hl, $123
	add hl, sp
	ld [hl], $0
	ld hl, $cd
	add hl, sp
	push hl
	ld hl, $125
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $125
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $126
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
	ld de, Text_20102
	call strcpy
	pop bc
	push bc
	ld hl, $123
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $123
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $124
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	call Func_20d35
	ld de, Text_20134
	call strcpy
	ld hl, $123
	add hl, sp
	ld e, [hl]
	ld hl, $124
	add hl, sp
	call Func_203fa
	pop bc
	read_hl_from_sp_plus $e0
	add hl, bc
	write_hl_to_sp_plus $e0
	ld hl, $ca
	add hl, sp
	ld a, [hl]
	dec a
	ld e, a
	ld hl, $ed
	add hl, sp
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, $d1
	add hl, sp
	ld e, [hl]
	ld hl, $ed
	add hl, sp
	call FarCall
	read_hl_from_sp_plus $109
	push hl
	read_hl_from_sp_plus $dc
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $da
	read_hl_from_sp_plus $10d
	push hl
	read_hl_from_sp_plus $e0
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $de
	read_hl_from_sp_plus $112
	push hl
	read_hl_from_sp_plus $e5
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $e3
	read_hl_from_sp_plus $116
	push hl
	read_hl_from_sp_plus $e9
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $e7
	read_hl_from_sp_plus $114
	push hl
	read_hl_from_sp_plus $e7
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $e5
	ld de, $0
	ld hl, $f2
	add hl, sp
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e0
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .asm_227d3
	push bc
	ld hl, $120
	add hl, sp
	ld [hl], $1
	ld hl, $123
	add hl, sp
	ld [hl], $0
	ld hl, $cd
	add hl, sp
	push hl
	ld hl, $125
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $125
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $126
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
	ld de, Text_20102
	call strcpy
	pop bc
.asm_22701: ; 22701 (8:6701)
	read_hl_from_sp_plus $e0
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .music
	ld hl, $d1
	add hl, sp
	ld a, [hl]
	cp $63
	jp nc, .music
	push bc
	ld hl, $123
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $123
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $124
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20106
	call strcpy
	swap_de_hl
	ld hl, $d3
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d3
	add hl, sp
	ld [hl], a
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	call Func_20d35
	swap_de_hl
	swap_de_hl
	ld de, Text_2013f
	call strcpy
	swap_de_hl
	ld hl, $123
	add hl, sp
	ld e, [hl]
	ld hl, $124
	add hl, sp
	call Func_203fa
	ld hl, $123
	add hl, sp
	ld [hl], $0
	pop bc
	read_hl_from_sp_plus $e0
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	write_hl_to_sp_plus $e0
	ld de, $0
	ld hl, $f2
	add hl, sp
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	jp .okay

.music
	ld a, $17
	call OverworldPlaySong
.loop
	call CheckSongFinished
	or a
	jp nz, .loop
	jp .next

.okay
	jp .asm_22701

.next
	ld hl, $ca
	add hl, sp
	ld a, [hl]
	dec a
	ld e, a
	ld hl, $ed
	add hl, sp
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, $d1
	add hl, sp
	ld e, [hl]
	ld hl, $ed
	add hl, sp
	call FarCall
.asm_227d3: ; 227d3 (8:67d3)
	read_hl_from_sp_plus $109
	push hl
	read_hl_from_sp_plus $dc
	pop de
	add hl, de
	write_hl_to_sp_plus $da
	swap_de_hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .asm_227f7
	ld hl, 999
	write_hl_to_sp_plus $da
.asm_227f7: ; 227f7 (8:67f7)
	read_hl_from_sp_plus $10d
	push hl
	read_hl_from_sp_plus $e0
	pop de
	add hl, de
	write_hl_to_sp_plus $de
	swap_de_hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .asm_2281b
	ld hl, 999
	write_hl_to_sp_plus $de
.asm_2281b: ; 2281b (8:681b)
	read_hl_from_sp_plus $112
	push hl
	read_hl_from_sp_plus $e5
	pop de
	add hl, de
	write_hl_to_sp_plus $e3
	swap_de_hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .asm_2283f
	ld hl, 999
	write_hl_to_sp_plus $e3
.asm_2283f: ; 2283f (8:683f)
	read_hl_from_sp_plus $116
	push hl
	read_hl_from_sp_plus $e9
	pop de
	add hl, de
	write_hl_to_sp_plus $e7
	swap_de_hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .asm_22863
	ld hl, 999
	write_hl_to_sp_plus $e7
.asm_22863: ; 22863 (8:6863)
	read_hl_from_sp_plus $114
	push hl
	read_hl_from_sp_plus $e7
	pop de
	add hl, de
	write_hl_to_sp_plus $e5
	swap_de_hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .asm_22887
	ld hl, 999
	write_hl_to_sp_plus $e5
.asm_22887: ; 22887 (8:6887)
	ld hl, $11e
	add hl, sp
	ld a, [hl]
	or a
	jp z, .asm_228a0
	read_hl_from_sp_plus $da
	write_hl_to_sp_plus $d8
	read_hl_from_sp_plus $de
	write_hl_to_sp_plus $dc
.asm_228a0: ; 228a0 (8:68a0)
	set_farcall_addrs_hli StackGetRobotInParty
	pop de
	push de
	ld d, $0
	ld hl, $136
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $ca
	add hl, sp
	swap_de_hl
	call FarCall
	pop de
.asm_228c1: ; 228c1 (8:68c1)
	inc e
	jp .asm_2255f

.asm_228c5: ; 228c5 (8:68c5)
	ld hl, $13a
	add hl, sp
	ld sp, hl
	ret

Data_228cb: ; 228cb
	dw 10, 20, 30, 1000

Func_228d3:: ; 228d3
	ld hl, -$f0
	add hl, sp
	ld sp, hl
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	write_hl_to_sp_plus $f0
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	write_hl_to_sp_plus $f0
	read_hl_from_sp_plus $f2
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $f0
	ld de, $b
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	write_hl_to_sp_plus $ee
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	write_hl_to_sp_plus $ec
	ld hl, $d2
	add hl, sp
	ld [hl], $0
	read_hl_from_sp_plus $ec
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $cc
	xor a
.asm_22962: ; 22962 (8:6962)
	cp $a
	jp nc, .asm_2298e
	ld l, a
	ld h, $0
	mulhl 20
	swap_de_hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d8
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .asm_22962

.asm_2298e: ; 2298e (8:698e)
	ld hl, $d5
	add hl, sp
	ld [hl], $0
	pop de
	push bc
	ld hl, $5f
	add hl, de
	ld a, [hl]
	add $b4
	ld hl, $d4
	add hl, sp
	ld [hl], a
	read_hl_from_sp_plus $ee
	ld de, $9
	add hl, de
	ld a, [hl]
	and $2
	jp z, .asm_229b9
	ld hl, $d2
	add hl, sp
	ld [hl], $2
	jp .asm_22ae7

.asm_229b9: ; 229b9 (8:69b9)
	ld hl, $ce
	add hl, sp
	ld c, l
	ld b, h
	read_hl_from_sp_plus $ec
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $ee
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	swap_de_hl
	pop de
	call Func_2617
	ld hl, $ce
	add hl, sp
	ld c, l
	ld b, h
	ld de, $64
	ld hl, $ce
	add hl, sp
	call MultiplyULongAtHLByUShortDE
	ld hl, $ce
	add hl, sp
	ld a, [hl]
	ld hl, $cf
	add hl, sp
	ld l, [hl]
	ld h, a
	write_hl_to_sp_plus $ce
	read_hl_from_sp_plus $ce
	ld de, $64
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	write_hl_to_sp_plus $ce
	read_hl_from_sp_plus $ec
	ld de, $13
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $ce
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	write_hl_to_sp_plus $ce
	ld hl, $d4
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_228cb
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $ce
	add hl, bc
	write_hl_to_sp_plus $ce
	read_hl_from_sp_plus $ce
	swap_de_hl
	ld hl, $0
	call CompareHLtoDE
	jp c, .asm_22a57
	ld hl, $0
	write_hl_to_sp_plus $ce
.asm_22a57: ; 22a57 (8:6a57)
	read_hl_from_sp_plus $f2
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	swap_de_hl
	ld b, $4
	call RightShiftHL
	ld a, l
	or h
	jp z, .asm_22a83
	read_hl_from_sp_plus $ce
	ld de, $32
	add hl, de
	write_hl_to_sp_plus $ce
	jp .asm_22acd

.asm_22a83: ; 22a83 (8:6a83)
	read_hl_from_sp_plus $f2
	ld de, $75
	add hl, de
	ld a, [hl]
	or a
	jp z, .asm_22acd
	read_hl_from_sp_plus $f2
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $4
	jp z, .asm_22ab2
	cp $7
	jp nz, .asm_22ac1
	read_hl_from_sp_plus $ce
	ld de, $1e
	add hl, de
	write_hl_to_sp_plus $ce
	jp .asm_22acd

.asm_22ab2: ; 22ab2 (8:6ab2)
	read_hl_from_sp_plus $ce
	ld de, $14
	add hl, de
	write_hl_to_sp_plus $ce
	jp .asm_22acd

.asm_22ac1: ; 22ac1 (8:6ac1)
	read_hl_from_sp_plus $ce
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $ce
.asm_22acd: ; 22acd (8:6acd)
	read_hl_from_sp_plus $ce
	push hl
	ld a, $64
	call BattleRandom
	ld l, a
	ld h, $0
	pop de
	call CompareHLtoDE
	jp c, .asm_22ae7
	ld hl, $d2
	add hl, sp
	ld [hl], $1
.asm_22ae7: ; 22ae7 (8:6ae7)
	read_hl_from_sp_plus $ec
	ld de, $d
	add hl, de
	push hl
	ld hl, $d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call strcpy
	ld de, Text_2010a
	call strcpy
	ld hl, $d2
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, .asm_22baa
	cp $1
	jp z, .asm_22b6f
	or a
	jp nz, .asm_22baa
	read_hl_from_sp_plus $ee
	ld de, $9
	add hl, de
	ld a, $4
	or [hl]
	ld [hl], a
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20145
	call strcpy
	set_farcall_addrs_hli Func_dd29
	ld hl, $d4
	add hl, sp
	ld a, [hl]
	call FarCall
	jp .asm_22baa

.asm_22b6f: ; 22b6f (8:6b6f)
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	swap_de_hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20151
	call strcpy
	set_farcall_addrs_hli Func_dd29
	ld hl, $d4
	add hl, sp
	ld a, [hl]
	add $4
	call FarCall
	jp .asm_22baa

.asm_22baa: ; 22baa (8:6baa)
	ld hl, $d5
	add hl, sp
	ld e, [hl]
	ld hl, $d6
	add hl, sp
	call Func_203fa
	pop bc
	ld hl, $d0
	add hl, sp
	ld a, [hl]
	or a
	jp z, .asm_22bc3
	jp .asm_22cca

.asm_22bc3: ; 22bc3 (8:6bc3)
	ld a, [bc]
	inc a
	ld hl, $d2
	add hl, sp
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	read_hl_from_sp_plus $ca
	swap_de_hl
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, $0
	call FarCall
	cp $ff
	jp z, .asm_22bfe
	jp .asm_22cb6

.asm_22bfe: ; 22bfe (8:6bfe)
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	read_hl_from_sp_plus $ca
	push hl
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $500
	add hl, de
	pop de
	call FarCall
	cp $ff
	jp z, .asm_22c2a
	jp .asm_22cb6

.asm_22c2a: ; 22c2a (8:6c2a)
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	read_hl_from wCurRobotPointer
	ld de, $1c8
	add hl, de
	ld a, [hl]
	ld [wOptionsMenu_BattleScene], a
	read_hl_from wCurRobotPointer
	ld de, $1c9
	add hl, de
	ld a, [hl]
	ld [wOptionsMenu_StereoSelect], a
	callba_hli Func_52d1f
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
	set_farcall_addrs_hli Func_613fc
	ld a, [wOptionsMenu_StereoSelect]
	ld e, a
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	read_hl_from_sp_plus $ca
	push hl
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $500
	add hl, de
	pop de
	call FarCall
.asm_22cb6: ; 22cb6 (8:6cb6)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $65
	add hl, de
	ld a, $10
	or [hl]
	ld [hl], a
.asm_22cca: ; 22cca (8:6cca)
	ld hl, $f0
	add hl, sp
	ld sp, hl
	ret

Func_22cd0: ; 22cd0
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	pop de
	push hl
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $2
	jp z, .asm_22d50
	call Func_20d3a
	cp $ff
	jp nz, .asm_22d2b
	ld a, SONG_VICTORY
	call OverworldPlaySong
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, .asm_22d26
	call Func_222b7
	call Func_223b8
.asm_22d26: ; 22d26 (8:6d26)
	ld a, $1
	jp .asm_22d60

.asm_22d2b: ; 22d2b (8:6d2b)
	push af
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld [hl], $ff
	call Func_21160
	call GetHLAtSPPlus6
	ld de, $5e
	add hl, de
	ld [hl], $fc
	pop af
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld [hl], a
	call Func_216e2
	jp .asm_22d5f

.asm_22d50: ; 22d50 (8:6d50)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $10
	jp z, .asm_22d5f
	ld a, $1
	jp .asm_22d60

.asm_22d5f: ; 22d5f (8:6d5f)
	xor a
.asm_22d60: ; 22d60 (8:6d60)
	pop bc
	pop bc
	ret

Func_22d63: ; 22d63 (8:6d63)
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $f
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld [hl], $0
	ld a, [hl]
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $f
	add hl, de
	ld bc, $0
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

Func_22db3: ; 22db3 (8:6db3)
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $f
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld [hl], $0
	ld a, [hl]
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $f
	add hl, de
	ld bc, $0
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

Func_22e03:: ; 22e03
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	swap_de_hl
	ld hl, $5f
	add hl, de
	ld a, [hl]
	cp $32
	jp z, .asm_22e3b
	cp $31
	jp z, .asm_22e35
	cp $30
	jp z, .asm_22e2f
	cp $2f
	jp nz, .asm_22e3e
	ld bc, $14
	jp .asm_22e3e

.asm_22e2f: ; 22e2f (8:6e2f)
	ld bc, $32
	jp .asm_22e3e

.asm_22e35: ; 22e35 (8:6e35)
	ld bc, $c8
	jp .asm_22e3e

.asm_22e3b: ; 22e3b (8:6e3b)
	ld bc, $3e8
.asm_22e3e: ; 22e3e (8:6e3e)
	ld e, c
	ld d, b
	ld a, $1
	call Func_20405
	ld c, l
	ld b, h
	ret

Func_22e48: ; 22e48 (8:6e48)
	add sp, -$16
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $16
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $12
	ld hl, sp+$f
	ld a, [wCurItem]
	inc a
	ld [hl], a
	ld hl, sp+$e
	ld [hl], $0
	ld a, [wCurItem]
	ld e, a
	ld hl, sp+$0
	call GetItemAttributes
	ld hl, sp+$a
	ld a, [hl]
	and $4
	jp z, .asm_23137
	read_hl_from_sp_plus $16
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	mulhl 17
	push hl
	read_hl_from_sp_plus $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $16
	ld de, $71
	add hl, de
	ld e, c
	ld d, b
	ld bc, $11
	call MemCopy
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	mulhl 17
	push hl
	read_hl_from_sp_plus $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $14
	read_hl_from_sp_plus $14
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$d
	ld [hl], e
	set_farcall_addrs_hli GetRobotInParty
	read_hl_from_sp_plus $12
	ld de, $c
	add hl, de
	swap_de_hl
	ld a, [wc2e9]
	call FarCall
	set_farcall_addrs_hli Func_5c6e3
	read_hl_from_sp_plus $12
	call FarCall
	ld c, a
	ld hl, sp+$f
	ld a, [hl]
	cp $42
	jp z, .asm_23061
	cp $41
	jp z, .asm_2305b
	cp $40
	jp z, .asm_23049
	cp $3f
	jp z, .asm_23036
	cp $3e
	jp z, .asm_23021
	cp $3d
	jp z, .asm_2300b
	cp $3c
	jp z, .asm_22ffc
	cp $3b
	jp z, .asm_22fe5
	cp $3a
	jp z, .asm_22fce
	cp $29
	jp z, .asm_22fc0
	cp $28
	jp z, .asm_22fa4
	cp $27
	jp z, .asm_22f8d
	cp $26
	jp z, .asm_22f7e
	cp $25
	jp z, .asm_22f68
	cp $24
	jp nz, .asm_23064
	ld hl, sp+$d
	ld a, [hl]
	cp $3
	jp nz, .asm_22f65
	ld hl, sp+$d
	ld [hl], $0
.asm_22f65: ; 22f65 (8:6f65)
	jp .asm_23064

.asm_22f68: ; 22f68 (8:6f68)
	ld hl, sp+$d
	ld a, [hl]
	cp $2
	jp nz, .asm_22f7b
	ld hl, sp+$d
	ld [hl], $0
	read_hl_from_sp_plus $14
	call Func_22d63
.asm_22f7b: ; 22f7b (8:6f7b)
	jp .asm_23064

.asm_22f7e: ; 22f7e (8:6f7e)
	ld hl, sp+$d
	ld a, [hl]
	cp $4
	jp nz, .asm_22f8a
	ld hl, sp+$d
	ld [hl], $0
.asm_22f8a: ; 22f8a (8:6f8a)
	jp .asm_23064

.asm_22f8d: ; 22f8d (8:6f8d)
	ld hl, sp+$d
	ld a, [hl]
	cp $7
	jp z, .asm_22f9d
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp nz, .asm_22fa1
.asm_22f9d: ; 22f9d (8:6f9d)
	ld hl, sp+$d
	ld [hl], $0
.asm_22fa1: ; 22fa1 (8:6fa1)
	jp .asm_23064

.asm_22fa4: ; 22fa4 (8:6fa4)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp nz, .asm_22fb0
	ld hl, sp+$d
	ld [hl], $0
.asm_22fb0: ; 22fb0 (8:6fb0)
	read_hl_from_sp_plus $14
	ld a, [hl]
	and $f7
	ld [hl], a
	inc hl
	ld hl, sp+$e
	ld [hl], $1
	jp .asm_23064

.asm_22fc0: ; 22fc0 (8:6fc0)
	ld hl, sp+$d
	ld [hl], $0
	read_hl_from_sp_plus $14
	call Func_22d63
	jp .asm_23064

.asm_22fce: ; 22fce (8:6fce)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp z, .asm_22fde
	ld hl, sp+$d
	ld a, [hl]
	cp $7
	jp nz, .asm_22fe2
.asm_22fde: ; 22fde (8:6fde)
	ld hl, sp+$d
	ld [hl], $0
.asm_22fe2: ; 22fe2 (8:6fe2)
	jp .asm_23064

.asm_22fe5: ; 22fe5 (8:6fe5)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp z, .asm_22ff5
	ld hl, sp+$d
	ld a, [hl]
	cp $3
	jp nz, .asm_22ff9
.asm_22ff5: ; 22ff5 (8:6ff5)
	ld hl, sp+$d
	ld [hl], $0
.asm_22ff9: ; 22ff9 (8:6ff9)
	jp .asm_23064

.asm_22ffc: ; 22ffc (8:6ffc)
	ld hl, sp+$d
	ld a, [hl]
	cp $4
	jp nz, .asm_23008
	ld hl, sp+$d
	ld [hl], $0
.asm_23008: ; 23008 (8:7008)
	jp .asm_23064

.asm_2300b: ; 2300b (8:700b)
	ld hl, sp+$d
	ld a, [hl]
	cp $2
	jp nz, .asm_2301e
	ld hl, sp+$d
	ld [hl], $0
	read_hl_from_sp_plus $14
	call Func_22d63
.asm_2301e: ; 2301e (8:701e)
	jp .asm_23064

.asm_23021: ; 23021 (8:7021)
	ld hl, sp+$d
	ld a, [hl]
	cp $1
	jp nz, .asm_23036
	push bc
	ld hl, sp+$f
	ld [hl], $0
	read_hl_from_sp_plus $16
	call Func_22db3
	pop bc
.asm_23036: ; 23036 (8:7036)
	read_hl_from_sp_plus $14
	ld a, [hl]
	and $f7
	ld [hl], a
	inc hl
	ld hl, sp+$e
	ld [hl], $1
	ld hl, sp+$d
	ld [hl], c
	jp .asm_23064

.asm_23049: ; 23049 (8:7049)
	ld hl, sp+$d
	ld [hl], $0
	read_hl_from_sp_plus $14
	call Func_22d63
	ld hl, sp+$e
	ld [hl], $1
	jp .asm_23064

.asm_2305b: ; 2305b (8:705b)
	ld hl, sp+$d
	ld [hl], c
	jp .asm_23064

.asm_23061: ; 23061 (8:7061)
	ld hl, sp+$d
	ld [hl], c
.asm_23064: ; 23064 (8:7064)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp z, .asm_230ad
	read_hl_from_sp_plus $16
	ld de, $71
	add hl, de
	push hl
	read_hl_from_sp_plus $16
	pop de
	ld bc, $11
	call MemCopy
	read_hl_from_sp_plus $16
	ld de, $71
	add hl, de
	ld [hl], $0
	inc hl
	set_farcall_addrs_hli Func_673ff
	xor a
	call FarCall
	read_hl_from_sp_plus $14
	push hl
	read_hl_from_sp_plus $18
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
.asm_230ad: ; 230ad (8:70ad)
	ld hl, sp+$d
	ld a, [hl]
	read_hl_from_sp_plus $14
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $16
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	mulhl 17
	push hl
	read_hl_from_sp_plus $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $16
	ld de, $71
	add hl, de
	swap_de_hl
	ld l, c
	ld h, b
	ld bc, $11
	call MemCopy
	set_farcall_addrs_hli GetRobotInParty
	read_hl_from_sp_plus $16
	ld de, $c6
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $12
.asm_23104
	ld de, $c
	add hl, de
	swap_de_hl
	call FarCall
.asm_2310f
	read_hl_from_sp_plus $16
	ld de, $75
.asm_23114
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $12
	ld de, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $1
	ld e, $1
	ld a, [wCurItem]
	inc a
	call FarCall
.asm_23137: ; 23137 (8:7137)
	add sp, $16
	ret

Pointers_2313a: ; 2313a
	dw Data_23140
	dw Data_23150
	dw $0

Data_23140: ; 23140
	dstr "(つうしん)ハﾞトル(てﾞは)"

Data_23150: ; 23150
	dstr "(つかえない)!"

Battle_ItemMenu: ; 23159
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, .asm_23184
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_2313a)
	ld de, Pointers_2313a
	ld hl, $10e
	call FarCall
	ld hl, -1
	ret

.asm_23184: ; 23184 (8:7184)
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, .asm_23197
	ld a, [wSystemType]
	cp $ff
	jp nz, .asm_231ab
.asm_23197: ; 23197 (8:7197)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
.asm_231ab: ; 231ab (8:71ab)
	call Func_1fbe
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
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_20ca5)
	ld de, Data_20ca5
	ld hl, Data_20cb4
	call FarCall
	ld a, l
	and h
	inc a
	jp z, .asm_231e5
	call Func_22e48
	ld hl, wCurItem
	ld l, [hl]
	ld h, $0
	inc hl
.asm_231e5: ; 231e5 (8:71e5)
	push hl
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, .asm_231f9
	ld a, [wSystemType]
	cp $ff
	jp nz, .asm_2320d
.asm_231f9: ; 231f9 (8:71f9)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
.asm_2320d: ; 2320d (8:720d)
	call Func_2009
	ld a, BANK(GFX_4122)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4122 + $8e0
	ld hl, $88e0
	call FarRequestVideoData
	set_farcall_addrs_hli Func_dc0a
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_dc0a
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $3b
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	call WaitVideoTransfer
	pop hl
	ret

INCLUDE "battle/core.asm"

Func_237be:: ; 237be
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	check_cgb
	jp nz, .asm_237fb
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	ld bc, $800
	ld e, $0
	hlbgcoord 0, 0
	call FillMemory
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
.asm_237fb: ; 237fb (8:77fb)
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	or $80
	call FarCall
	ret

Func_2380f:: ; 2380f
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
.asm_23824: ; 23824 (8:7824)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .asm_23824
	check_cgb
	jp nz, .asm_238c7
	call WaitVideoTransfer
.asm_23839: ; 23839 (8:7839)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .asm_23839
	ld c, $0
.asm_23843: ; 23843 (8:7843)
	ld a, c
	cp $8
	jp nc, .asm_23896
	ld a, c
	and $1
	jp nz, .asm_23872
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	ld de, $f7f
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 4
	add hl, de
	deRGB 04, 07, 22
	ld [hl], e
	inc hl
	ld [hl], d
	jp .asm_23892

.asm_23872: ; 23872 (8:7872)
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	deRGB 04, 07, 22
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 4
	add hl, de
	deRGB 31, 27, 03
	ld [hl], e
	inc hl
	ld [hl], d
.asm_23892: ; 23892 (8:7892)
	inc c
	jp .asm_23843

.asm_23896: ; 23896 (8:7896)
	ld bc, $40
	ld de, wCGB_BGPalsBuffer
	ld hl, wCGB_OBPalsBuffer
	call CopyFromDEtoHL
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
.asm_238ad: ; 238ad (8:78ad)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .asm_238ad
.asm_238b5: ; 238b5 (8:78b5)
	ld a, [wRTCTicker]
	cp $11
	jp nc, .asm_238c3
	call NextOverworldFrame
	jp .asm_238b5

.asm_238c3: ; 238c3 (8:78c3)
	xor a
	ld [wRTCTicker], a
.asm_238c7: ; 238c7 (8:78c7)
	ret

LoadDebugSaveState:: ; 238c8 (8:78c8)
	ld a, BANK(DebugSaveState)
	ld [wFarCallDestBank], a
	ld bc, DebugSaveState_end-DebugSaveState
	ld de, DebugSaveState
	ld hl, wSaveBlock1
	call FarCopyVideoData
	ld bc, $32
	ld de, wSaveBlock1_EventFlags
	ld hl, wEventFlags
	call CopyFromDEtoHL
	ld bc, $64
	ld de, wSaveBlock1_c789
	ld hl, wc789
	call CopyFromDEtoHL
	ld bc, $3c
	ld de, wSaveBlock1_c347
	ld hl, wc347
	call CopyFromDEtoHL
	read_hl_from wSaveBlock1_cb3b
	write_hl_to wGameTimer
	read_hl_from wSaveBlock1_cb3b + 2
	write_hl_to wGameTimer + 2
	ld bc, $5
	ld de, wSaveBlock1_PlayerName
	ld hl, wPlayerName
	call CopyFromDEtoHL
	ret

Func_2391e:: ; 2391e
	ld c, l
	ld b, h
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
	ld a, l
	push af
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call PushBGMapRegion
	pop bc
	pop af
	cp $4
	jp z, .asm_23a31
	cp $3
	jp z, .asm_23a05
	cp $2
	jp z, .asm_239cf
	cp $1
	jp z, .asm_239a5
	or a
	jp nz, .asm_23a64
	callba_hli LoadGame
	cp $ff
	jp z, .asm_239a2
	callba_hli Func_58df9
	or a
	jp nz, .asm_239a2
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $1
	ld e, $0
	xor a
	call FarCall
.asm_239a2: ; 239a2 (8:79a2)
	jp .asm_23a64

.asm_239a5: ; 239a5 (8:79a5)
	call NewSaveFileInWRam
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp .asm_23a64

.asm_239cf: ; 239cf (8:79cf)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp .asm_23a64

.asm_23a05: ; 23a05 (8:7a05)
	call FillVisibleAreaWithBlankTile
	call Func_237be
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_17488
	call Func_2097
	call Func_2380f
	call GBKiss
	jp .asm_23a64

.asm_23a31: ; 23a31 (8:7a31)
	call LoadDebugSaveState
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
.asm_23a64: ; 23a64 (8:7a64)
	ld hl, $8000
	ret

Func_23a68:: ; 23a68
	ld c, l
	ld b, h
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
	ld a, l
	push af
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call PushBGMapRegion
	pop bc
	pop af
	cp $3
	jp z, .asm_23b2a
	cp $2
	jp z, .asm_23afe
	cp $1
	jp z, .asm_23ac8
	or a
	jp nz, .asm_23b5d
	; New Game
	call NewSaveFileInWRam
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp .asm_23b5d

.asm_23ac8: ; 23ac8 (8:7ac8)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp .asm_23b5d

.asm_23afe: ; 23afe (8:7afe)
	call FillVisibleAreaWithBlankTile
	call Func_237be
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_17488
	call Func_2097
	call Func_2380f
	call GBKiss
	jp .asm_23b5d

.asm_23b2a: ; 23b2a (8:7b2a)
	call LoadDebugSaveState
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
.asm_23b5d: ; 23b5d (8:7b5d)
	ld hl, $8000
	ret

