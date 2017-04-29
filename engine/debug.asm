Func_bc000:
	ret

Func_bc001:
	ret

Func_bc002: ; bc002 (2f:4002)
	call Func_bc000
	ld c, $7
	predef GetJUTFCharacter_1bpp
	ret

Func_bc00a:
	set_farcall_addrs_hli Func_62a3
	ld bc, $0
	ld de, $1311
	ld hl, wc2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
Func_bc029: ; bc029 (2f:4029)
	call CheckButton
	or a
	jp z, Func_bc029
	set_farcall_addrs_hli Func_62a3
	ld bc, $0
	ld de, $1311
	ld hl, wc2cd
	ld l, [hl]
	ld h, $0
	ld a, l
	xor $1
	ld l, a
	ld h, l
	ld l, $0
	inc hl
	inc hl
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_62a3
	ld bc, $0
	ld de, $1311
	ld hl, wc2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ret

Func_bc076:
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	ret

Data_bc08e:
	dr $bc08e, $bc092

Func_bc092: ; bc092 (2f:4092)
	ld hl, -$340
	add hl, sp
	ld sp, hl
	ld e, $a
	ld l, $0
	ld a, $61
Func_bc09d: ; bc09d (2f:409d)
	cp $7b
	jp nc, Func_bc0c1
	push hl
	push de
	push af
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	add $a0
	ld e, a
	call Func_bc002
	pop af
	inc a
	pop de
	inc e
	pop hl
	inc l
	jp Func_bc09d

Func_bc0c1: ; bc0c1 (2f:40c1)
	ld a, $41
Func_bc0c3: ; bc0c3 (2f:40c3)
	cp $5b
	jp nc, Func_bc0e5
	push hl
	push de
	push af
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	ld e, a
	call Func_bc002
	pop af
	inc a
	pop de
	inc e
	pop hl
	inc l
	jp Func_bc0c3

Func_bc0e5: ; bc0e5 (2f:40e5)
	push de
	ld bc, $340
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $90a0
	call RequestVideoData
	call WaitVideoTransfer
	pop de
	push de
	ld c, $0
	xor a
Func_bc0fd: ; bc0fd (2f:40fd)
	cp $5
	jp nc, Func_bc129
	push bc
	push de
	push af
	ld e, a
	ld d, $0
	ld hl, Data_bc08e
	add hl, de
	ld l, [hl]
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$a
	add hl, de
	pop de
	call Func_bc002
	pop af
	inc a
	pop de
	inc e
	pop bc
	inc c
	jp Func_bc0fd

Func_bc129: ; bc129 (2f:4129)
	pop de
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	ld hl, sp+$0
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $9000
	add hl, de
	pop de
	call RequestVideoData
	call WaitVideoTransfer
	ld hl, $340
	add hl, sp
	ld sp, hl
	ret

Func_bc14e: ; bc14e (2f:414e)
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $800
	ld de, GFX_4122
	ld hl, $9000
	call FarRequestVideoData
	ret

Func_bc160: ; bc160 (2f:4160)
	call CheckButton
	or a
	jp nz, Func_bc160
Func_bc167: ; bc167 (2f:4167)
	call CheckButton
	and $10
	jp z, Func_bc167
	ret

Func_bc170: ; bc170 (2f:4170)
	push bc
	cp "a"
	jp c, .checkCapital
	cp "z" + 1
	jp nc, .checkCapital
	add $a9
	ld hl, sp+$0
	ld [hl], a
	jp .placeDirectly

.checkCapital: ; bc183 (2f:4183)
	cp "A"
	jp c, .checkLeftParenthesis
	cp "Z" + 1
	jp nc, .checkLeftParenthesis
	add $e3
	ld hl, sp+$0
	ld [hl], a
	jp .placeDirectly

.checkLeftParenthesis: ; bc195 (2f:4195)
	cp "["
	jp nz, .checkRightParenthesis
	ld hl, sp+$0
	ld [hl], $3e
	jp .placeDirectly

.checkRightParenthesis: ; bc1a1 (2f:41a1)
	cp "]"
	jp nz, .checkColon
	ld hl, sp+$0
	ld [hl], $3f
	jp .placeDirectly

.checkColon: ; bc1ad (2f:41ad)
	cp ":"
	jp nz, .checkPeriod
	ld hl, sp+$0
	ld [hl], $40
	jp .placeDirectly

.checkPeriod: ; bc1b9 (2f:41b9)
	cp "."
	jp nz, .autoCharacter
	ld hl, sp+$0
	ld [hl], $41
	jp .placeDirectly

.autoCharacter: ; bc1c5 (2f:41c5)
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_bc1f1
	push hl
	call PlaceString
	pop bc
	pop bc
	jp .quit

.placeDirectly: ; bc1d5 (2f:41d5)
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Coord2TileMap
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	ld [de], a
	ld a, [wStringDestX]
	inc a
	ld [wStringDestX], a
.quit: ; bc1ef (2f:41ef)
	pop bc
	ret

Data_bc1f1:
	TX_STACK
	db $0

Func_bc1f4: ; bc1f4 (2f:41f4)
	push hl
	push bc
	push bc
	ld hl, $0
	pop de
	push hl
	call GetHLAtSPPlus6
	call FindFirstNonzero
	dec hl
	ld c, l
	ld b, h
.loop: ; bc205 (2f:4205)
	pop hl
	push hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, .break
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus4
	ld a, l
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	pop hl
	push hl
	inc hl
	pop de
	push hl
	dec bc
	jp .loop

.break: ; bc23d (2f:423d)
	pop bc
	pop bc
	pop bc
	ret

Func_bc241: ; bc241 (2f:4241)
	push hl
	push de
	push bc
	push bc
	ld hl, $10
	call WriteHLToSPPlus4
	ld hl, sp+$1
	ld [hl], $0
.loop: ; bc24f (2f:424f)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus10
	pop de
	call DivideHLbyDE
	ld hl, sp+$0
	ld [hl], e
	ld hl, sp+$0
	ld a, [hl]
	cp $a
	jp nc, .more_than_10
	ld hl, sp+$0
	ld a, [hl]
	add "0"
	ld hl, sp+$0
	ld [hl], a
	jp .next

.more_than_10: ; bc270 (2f:4270)
	ld hl, sp+$0
	ld a, [hl]
	add "A" - 10
	ld hl, sp+$0
	ld [hl], a
.next: ; bc278 (2f:4278)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	dec a
	ld c, a
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	ld [de], a
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus10
	pop de
	call DivideHLbyDE
	call WriteHLToSPPlus8
	xor a
	sub l
	ld a, $0
	sbc h
	jp c, .loop
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], $0
	call GetHLAtSPPlus6
	call Func_bc1f4
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	pop bc
	ret

PrintDebugMenuText: ; bc2be (2f:42be)
	add sp, -$e
	ld hl, sp+$12
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $12
.nextCharacter
	ld a, [hl]
	or a
	jp z, Func_bc352
	ld a, [hl]
	cp $a
	jp nz, .not_newline
	xor a
	ld [wStringDestX], a
	ld a, [wStringDestY]
	inc a
	ld [wStringDestY], a
	jp .incrementPointer

.not_newline: ; bc2e3 (2f:42e3)
	ld a, [wStringDestX]
	cp $12
	jp c, .xCoordOnScreen
	jp .incrementPointer

.xCoordOnScreen: ; bc2ee (2f:42ee)
	ld a, [hl]
	cp $25
	jp z, .specialCommand
	push hl
	ld a, [hl]
	call Func_bc170
	pop hl
	jp .incrementPointer

.specialCommand: ; bc2fd (2f:42fd)
	inc hl
	ld a, [hl]
	cp $70
	jp z, .printHex
	cp $64
	jp nz, .incrementPointer
	push hl
	ld hl, sp+$2
	push hl
	read_hl_from_sp_plus $12
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	write_hl_to_sp_plus $12
	ld l, c
	ld h, b
	pop de
	ld bc, $a
	call PrintNumSigned
	ld hl, sp+$2
	push hl
	call PlaceString
	pop bc
	pop hl
	jp .incrementPointer

.printHex: ; bc32d (2f:432d)
	push hl
	ld hl, sp+$2
	push hl
	read_hl_from_sp_plus $12
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	write_hl_to_sp_plus $12
	ld l, c
	ld h, b
	pop de
	ld bc, $10
	call Func_bc241
	ld hl, sp+$2
	push hl
	call PrintDebugMenuText
	pop bc
	pop hl
.incrementPointer: ; bc34e (2f:434e)
	inc hl
	jp .nextCharacter

Func_bc352: ; bc352 (2f:4352)
	add sp, $e
	ret

DebugMenu_WaitButton: ; bc355 (2f:4355)
	call CheckButton
	or a
	jp z, DebugMenu_WaitButton
	ret

Func_bc35d: ; bc35d
	call FillVisibleAreaWithBlankTile
	call Func_bc092
	ld hl, Data_bc3a5
	push hl
	call PrintDebugMenuText
	pop bc
	ld hl, Data_bc3bd
	push hl
	call PrintDebugMenuText
	pop bc
	xor a
Func_bc374: ; bc374 (2f:4374)
	cp $5
	jp nc, Func_bc392
	push af
	ld l, a
	ld h, $0
	add hl, hl
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_bc3c2
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	pop af
	inc a
	jp Func_bc374

Func_bc392: ; bc392 (2f:4392)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call DebugMenu_WaitButton
	call Func_bc14e
	ret

Data_bc3a5:
	db "abcdefghijkl", $a
	db "ABCDEFGHI", $a, $0

Data_bc3bd:
	db "[]:", $a, $0

Data_bc3c2:
	db "No["
	TX_SNUM
	db "]:"
	TX_SNUM
	db $a, $0

Func_bc3cd:
	ld bc, $f
	call CopyFromDEtoHL
	ret

Func_bc3d4:
	ld bc, $1f
	call CopyFromDEtoHL
	ret

Func_bc3db:
	push de
	push bc
	push af
	read_hl_from_sp_plus $10
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$8
	add [hl]
	add $2
	cp $12
	jp c, Func_bc41b
	ld hl, sp+$4
	ld a, [hl]
	add $2
	ld l, a
	ld a, $12
	sub l
	ld hl, sp+$8
	ld [hl], a
Func_bc41b: ; bc41b (2f:441b)
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $10
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $10
	ld de, $8
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $12
	ld de, $a
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	read_hl_from_sp_plus $10
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	read_hl_from_sp_plus $10
	inc hl
	ld [hl], a
	pop bc
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	ld [hl], c
	ld hl, sp+$4
	ld a, [hl]
	add $2
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ret

Debug_MenuWithSecondaryHeader:
	push hl
	push de
	set_farcall_addrs_hli MenuWithSecondaryHeader
	pop de
	pop hl
	ld c, BANK(Debug_MenuWithSecondaryHeader)
	jp FarCall

Func_bc486:
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_bc49b: ; bc49b (2f:449b)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_bc49b
	ret

Func_bc4a6:
	push hl
	push de
	set_farcall_addrs_hli AllocateMemory
	ld hl, $3c
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld de, $1403
	ld hl, $7
	call BackUpTileMapRectangle
	ld c, $3
	ld e, $14
	ld hl, $7
	call Func_bc486
	ld e, $8
	ld a, $1
	call SetStringStartState
	pop bc
	pop de
	pop hl
	push bc
	push de
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld l, $3
	push hl
	ld c, $14
	ld e, $7
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	pop bc
	push bc
	ld de, $1403
	ld hl, $7
	call RestoreTileMapRectangle
	ld l, $3
	push hl
	ld c, $14
	ld e, $7
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ret

Data_bc517:
	dr $bc517, $bc540

Data_bc540: ; bc540
	dr $bc540, $bc671

Data_bc671: ; bc671
	dr $bc671, $bc71f

Func_bc71f: ; bc71f (2f:471f)
	push af
	push de
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Data_bc517
	call CompareHLtoDE
	jp z, Func_bc738
	jp Func_bc773

Func_bc738: ; bc738 (2f:4738)
	push bc
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call FindFirstNonzero
	ld c, l
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$5
	ld a, [hl]
	add $2
	add c
	call SetStringStartState
	pop bc
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bc776
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
Func_bc773: ; bc773 (2f:4773)
	pop bc
	pop bc
	ret

Data_bc776:
	db ":"
	TX_SNUM
	db $0

Func_bc77a: ; bc77a (2f:477a)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PrintDebugMenuText
	pop bc
	ret

Func_bc788: ; bc788 (2f:4788)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus6
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld c, [hl]
	push bc
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus10
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	set_farcall_addrs_hli Func_667d
	pop de
	pop af
	pop bc
	push de
	ld e, a
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	push hl
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	pop de
	ld bc, $8f02
	call FarCall
	ld c, $0
	pop de
Func_bc81b: ; bc81b (2f:481b)
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_bc874
	push de
	push bc
	ld hl, sp+$6
	ld a, [hl]
	add c
	inc a
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	add $2
	call SetStringStartState
	pop bc
	push bc
	call GetHLAtSPPlus10
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus8
	ld e, c
	ld d, $0
	add hl, de
	ld a, l
	pop de
	call Func_bc77a
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_bc86e
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp nz, Func_bc86e
	call GetHLAtSPPlus10
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$7
	ld a, [hl]
	call Func_bc71f
Func_bc86e: ; bc86e (2f:486e)
	pop bc
	inc c
	pop de
	jp Func_bc81b

Func_bc874: ; bc874 (2f:4874)
	pop bc
	pop bc
	pop bc
	ret

Func_bc878:
	push bc
	push bc
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$5
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call FillVisibleAreaWithBlankTile
	pop de
	pop hl
	pop af
	push hl
	push de
	push af
	ld c, l
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$a
	ld l, [hl]
	ld h, a
	call Func_bc486
	pop af
	pop de
	pop hl
	pop bc
	push bc
	push hl
	push af
	push de
	ld l, c
	ld h, b
	call Func_bc788
	call GetHLAtSPPlus10
	ld a, l
	and h
	inc a
	jp z, Func_bc8ff
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8f
	call Func_bc170
Func_bc8ff: ; bc8ff (2f:48ff)
	pop de
	push de
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	inc hl
	ld e, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8b
	call Func_bc170
	pop de
	pop af
	pop hl
	push de
	push hl
	ld c, a
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_3ca1
	pop bc
	pop de
	pop bc
	ld hl, $b
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	pop bc
	pop bc
	ret

Func_bc934:
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $f
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$c
	ld [hl], a
	read_hl_from_sp_plus $f
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$b
	ld [hl], a
	read_hl_from_sp_plus $f
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$a
	ld [hl], a
	read_hl_from_sp_plus $f
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	read_hl_from_sp_plus $11
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $11
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $11
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	read_hl_from_sp_plus $11
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	read_hl_from_sp_plus $11
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop af
	pop de
	push af
	ld a, e
	cp $1
	jp z, Func_bc9f8
	or a
	jp nz, Func_bca2f
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	inc h
	dec h
	bit 7, h
	jr z, .asm_bc9f5
	ld hl, $0
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_bc9f5
	ld hl, $0
	call WriteHLToSPPlus4
.asm_bc9f5
	jp Func_bca2f

Func_bc9f8: ; bc9f8 (2f:49f8)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_bca2f
	ld l, c
	ld h, b
	dec hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	pop de
	call CompareHLtoDE
	jp c, Func_bca2f
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
Func_bca2f: ; bca2f (2f:4a2f)
	read_hl_from_sp_plus $f
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp z, Func_bca6b
	call GetHLAtSPPlus4
	push hl
	read_hl_from_sp_plus $11
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $f
	ld de, $b
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $f
	call Func_bc788
	jp Func_bcaa2

Func_bca6b: ; bca6b (2f:4a6b)
	call GetHLAtSPPlus8
	ld a, l
	and h
	inc a
	jp z, Func_bca8b
	ld hl, sp+$b
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$c
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8f
	call Func_bc170
Func_bca8b: ; bca8b (2f:4a8b)
	ld hl, sp+$b
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$c
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8b
	call Func_bc170
Func_bcaa2: ; bcaa2 (2f:4aa2)
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	read_hl_from_sp_plus $f
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $11
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	push hl
	read_hl_from_sp_plus $11
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	ld l, a
	push hl
	ld hl, sp+$a
	ld c, [hl]
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$c
	ld a, [hl]
	call Func_3ca1
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_bcaec:
	dr $bcaec, $bcafb

Data_bcafb:
	dr $bcafb, $bcb1a

Func_bcb1a:
	push bc
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$5
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	pop af
	push hl
	push af
	ld c, l
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_bc486
	pop af
	pop hl
	pop bc
	push hl
	push af
	push bc
	ld l, c
	ld h, b
	call Func_bc788
	pop bc
	pop af
	push af
	ld hl, sp+$5
	ld e, [hl]
	call Func_bc71f
	pop af
	pop hl
	push hl
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$2
	ld c, [hl]
	call Func_3ca1
	pop bc
	ld hl, $4000
	pop bc
	ret

Func_bcb7d:
	push bc
	push bc
	push de
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$4
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop de
	push af
	ld a, e
	cp $1
	jp z, Func_bcbba
	or a
	jp nz, Func_bcbc8
Func_bcbba: ; bcbba (2f:4bba)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, $1
	xor [hl]
	ld [hl], a
Func_bcbc8: ; bcbc8 (2f:4bc8)
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call Func_bc71f
	pop af
	ld l, a
	push hl
	ld hl, sp+$2
	ld c, [hl]
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call Func_3ca1
	pop bc
Func_bcbe1: ; bcbe1 (2f:4be1)
	call CheckButton
	or a
	jp nz, Func_bcbe1
	ld hl, $4000
	pop bc
	pop bc
	ret

Data_bcbee:
	dr $bcbee, $bcbfd

Data_bcbfd:
	dr $bcbfd, $bcc1c

Func_bcc1c:
	ret

Func_bcc1d:
	ret

Func_bcc1e:
	ret

Func_bcc1f:
	ret

Func_bcc20:
	ret

Func_bcc21:
	ret

Func_bcc22:
	ret

Func_bcc23:
	ret

Func_bcc24:
	ret

Func_bcc25:
	ret

Func_bcc26:
	ret

Func_bcc27:
	ret

Func_bcc28:
	ret

Func_bcc29:
	ret

Func_bcc2a:
	ret

Func_bcc2b:
	ret

Func_bcc2c:
	ret

Func_bcc2d:
	ret

Func_bcc2e:
	ret

Func_bcc2f:
	ret

Func_bcc30:
	ret

Pointers_bcc31:
	dw Func_bcc1c
	dw Func_bcc1d
	dw Func_bcc1e
	dw Func_bcc1f
	dw Func_bcc20
	dw Func_bcc21
	dw Func_bcc22
	dw Func_bcc23
	dw Func_bcc24
	dw Func_bcc25
	dw Func_bcc26
	dw Func_bcc27
	dw Func_bcc28
	dw Func_bcc29
	dw Func_bcc2a
	dw Func_bcc2b
	dw Func_bcc2c
	dw Func_bcc2e
	dw Func_bcc2f
	dw Func_bcc30

Func_bcc59: ; bcc59 (2f:4c59)
	push hl
	pop hl
	push hl
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcda9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, Data_bcdb5
	push hl
	call PrintDebugMenuText
	pop bc
	xor a
Func_bcc72: ; bcc72 (2f:4c72)
	cp $3
	jp nc, Func_bcc95
	push af
	call GetHLAtSPPlus4
	ld de, $8
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcdbb
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop af
	inc a
	jp Func_bcc72

Func_bcc95: ; bcc95 (2f:4c95)
	ld hl, Data_bcdc0
	push hl
	call PrintDebugMenuText
	pop bc
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcdc2
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcdcc
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcdd6
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcddd
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $10
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcde8
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $12
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcdef
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $14
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcdf9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $16
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bce01
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $17
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bce0a
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $19
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bce15
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $1b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bce22
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $1d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bce2d
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $20
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bce3a
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $22
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bce4c
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bcda9:
	db "TypeNum:"
	TX_SNUM
	db $a
	db $0

Data_bcdb5:
	db "Soft:", $0

Data_bcdbb:
	db "["
	TX_SNUM
	db "]", $0

Data_bcdc0:
	db $a
	db $0

Data_bcdc2:
	db "Parts:"
	TX_SNUM
	db $a
	db $0

Data_bcdcc:
	db "Level:"
	TX_SNUM
	db $a
	db $0

Data_bcdd6:
	db "Hp:"
	TX_SNUM
	db $a
	db $0

Data_bcddd:
	db "HppMax:"
	TX_SNUM
	db $a
	db $0

Data_bcde8:
	db "Ep:"
	TX_SNUM
	db $a
	db $0

Data_bcdef:
	db "EpMax:"
	TX_SNUM
	db $a
	db $0

Data_bcdf9:
	db "Exp:"
	TX_SNUM
	db $a
	db $0

Data_bce01:
	db "Mode:"
	TX_SNUM
	db $a
	db $0

Data_bce0a:
	db "AtackP:"
	TX_SNUM
	db $a
	db $0

Data_bce15:
	db "DefenceP:"
	TX_SNUM
	db $a
	db $0

Data_bce22:
	db "SpeedP:"
	TX_SNUM
	db $a
	db $0

Data_bce2d:
	db "EnedamaP:"
	TX_SNUM
	db $a
	db $0

Data_bce3a:
	db "DefenceType:0x"
	TX_HNUM
	db $a
	db $0

Data_bce4c:
	db "CPU:"
	TX_SNUM
	db $a
	db $0

Func_bce54:
	push hl
	pop hl
	push hl
	ld de, $c
	add hl, de
	push hl
	ld hl, sp+$2
	push hl
	ld hl, Data_bce80
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	call FillVisibleAreaWithBlankTile
	pop hl
	call Func_bcc59
	pop bc
	ret

Data_bce80:
	db "RSRM ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Func_bce93:
	push hl
	inc hl
	inc hl
	push hl
	ld hl, Data_bceb1
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcebf
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ret

Data_bceb1:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcebf:
	db "sinnka:"
	TX_SNUM
	db $a
	db $0

Func_bceca:
	push hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, Data_bceea
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_bcef8
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ret

Data_bceea:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcef8:
	db "Enadama:"
	TX_SNUM
	db $a
	db $0

Func_bcf04:
	ret

Func_bcf05:
	push hl
	pop hl
	push hl
	ld de, $5
	add hl, de
	push hl
	ld hl, Data_bcf2b
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcf39
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bcf2b:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcf39:
	db "Zokusei:"
	TX_SNUM
	db $a
	db $0

Func_bcf45:
	push hl
	pop hl
	push hl
	ld de, $6
	add hl, de
	push hl
	ld hl, Data_bcf6b
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcf79
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bcf6b:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcf79:
	db "HpKeisu:"
	TX_SNUM
	db $a
	db $0

Func_bcf85:
	push hl
	pop hl
	push hl
	ld de, $7
	add hl, de
	push hl
	ld hl, Data_bcfab
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcfb9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bcfab:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcfb9:
	db "EpKeisu:"
	TX_SNUM
	db $a
	db $0

Func_bcfc5:
	push hl
	pop hl
	push hl
	ld de, $8
	add hl, de
	push hl
	ld hl, Data_bcfeb
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bcff9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bcfeb:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bcff9:
	db "AtackPKeisu:"
	TX_SNUM
	db $a
	db $0

Func_bd009:
	push hl
	pop hl
	push hl
	ld de, $9
	add hl, de
	push hl
	ld hl, Data_bd02f
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd03d
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bd02f:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bd03d:
	db "DefencePKeisu:"
	TX_SNUM
	db $a
	db $0

Func_bd04f:
	push hl
	pop hl
	push hl
	ld de, $a
	add hl, de
	push hl
	ld hl, Data_bd075
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $a
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd083
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop bc
	ret

Data_bd075:
	db "ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bd083:
	db "SpeedPKeisu:"
	TX_SNUM
	db $a
	db $0

Func_bd093:
	ret

Func_bd094:
	ret

Func_bd095:
	ret

Func_bd096:
	ret

Func_bd097: ; bd097 (2f:5097)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	reg16swap de, hl
	push de
	call FillVisibleAreaWithBlankTile
	pop de
	push de
	push de
	ld hl, Data_bd1a7
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop de
	push de
	ld a, [de]
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_bd1b9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop de
	push de
	reg16swap de, hl
	inc hl
	push hl
	ld hl, Data_bd1c6
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop de
	push de
	reg16swap de, hl
	inc hl
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd1d7
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd1df
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, Data_bd1e9
	push hl
	call PrintDebugMenuText
	pop bc
	xor a
	pop de
Func_bd10f: ; bd10f (2f:510f)
	cp $3
	jp nc, Func_bd134
	push de
	push af
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd1f2
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop af
	inc a
	pop de
	jp Func_bd10f

Func_bd134: ; bd134 (2f:5134)
	push de
	ld hl, Data_bd1f7
	push hl
	call PrintDebugMenuText
	pop bc
	pop de
	push de
	ld hl, $6
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd1f9
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop de
	push de
	ld hl, $7
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd203
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, Data_bd211
	push hl
	call PrintDebugMenuText
	pop bc
	xor a
	pop de
Func_bd16d: ; bd16d (2f:516d)
	cp $2
	jp nc, Func_bd18f
	push de
	push af
	ld hl, $8
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd21f
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	pop af
	inc a
	pop de
	jp Func_bd16d

Func_bd18f: ; bd18f (2f:518f)
	ld hl, Data_bd224
	push hl
	call PrintDebugMenuText
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	ret

Data_bd1a7:
	db "EBM ADDRESS:0x"
	TX_HNUM
	db $a
	db $0

Data_bd1b9:
	db "DispFlag:"
	TX_SNUM
	db $a
	db $0

Data_bd1c6:
	db "EBM.efbs2m:0x"
	TX_HNUM
	db $a
	db $0

Data_bd1d7:
	db "CPU:"
	TX_SNUM
	db $a
	db $0

Data_bd1df:
	db "Level:"
	TX_SNUM
	db $a
	db $0

Data_bd1e9:
	db "Soft[3]", $a
	db $0

Data_bd1f2:
	db "["
	TX_SNUM
	db "]", $0

Data_bd1f7:
	db $a
	db $0

Data_bd1f9:
	db "Parts:"
	TX_SNUM
	db $a
	db $0

Data_bd203:
	db "EndFlag:0x"
	TX_HNUM
	db $a
	db $0

Data_bd211:
	db "EnterFlag[2]", $a
	db $0

Data_bd21f:
	db "["
	TX_SNUM
	db "]", $0

Data_bd224:
	db $a
	db $0

Pointers_bd226:
	dw Func_bce54
	dw Func_bce93
	dw Func_bceca
	dw Func_bcf04
	dw Func_bcf05
	dw Func_bcf45
	dw Func_bcf85
	dw Func_bcfc5
	dw Func_bd009
	dw Func_bd04f
	dw Func_bd093
	dw Func_bd094
	dw Func_bd095
	dw Func_bd096

Func_bd242:
	push hl
	add sp, -$14
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $168
	call FarCall
	push hl
	decoord 0, 0
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli AllocateMemory
	ld hl, $f
	call FarCall
	call WriteHLToSPPlus6
	set_farcall_addrs_hli AllocateMemory
	ld hl, $1f
	call FarCall
	call WriteHLToSPPlus4
	call FillVisibleAreaWithBlankTile
	call Func_bc092
	ld hl, sp+$6
	ld de, Data_bc517
	ld [hl], e
	ld hl, Data_bc517
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$8
	ld [hl], $0
	read_hl_from_sp_plus $18
	ld e, l
	ld hl, sp+$9
	ld [hl], e
	read_hl_from_sp_plus $18
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$a
	ld [hl], a
Func_bd2c7: ; bd2c7 (2f:52c7)
	call GetHLAtSPPlus6
	ld de, Data_bcaec
	call Func_bc3cd
	call GetHLAtSPPlus4
	ld de, Data_bcafb
	call Func_bc3d4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	ld hl, -1
	push hl
	ld l, $6
	push hl
	ld l, $6
	push hl
	ld c, $8
	ld e, $0
	xor a
	call Func_bc3db
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	call Debug_MenuWithSecondaryHeader
	reg16swap de, hl
	ld a, e
	cp $3
	jp z, Func_bd4eb
	cp $2
	jp z, Func_bd424
	cp $1
	jp z, Func_bd37b
	or a
	jp nz, Func_bd4f1
	call GetHLAtSPPlus6
	ld de, Data_bcbee
	call Func_bc3cd
	call GetHLAtSPPlus4
	ld de, Data_bcbfd
	call Func_bc3d4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	ld hl, $0
	push hl
	ld l, $1
	push hl
	ld l, $1
	push hl
	ld c, $8
	ld e, $a
	ld a, $5
	call Func_bc3db
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	call Debug_MenuWithSecondaryHeader
	reg16swap de, hl
	jp Func_bd2c7

Func_bd37b: ; bd37b (2f:537b)
	call GetHLAtSPPlus6
	ld de, Data_bcaec
	call Func_bc3cd
	call GetHLAtSPPlus4
	ld de, Data_bcafb
	call Func_bc3d4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	ld hl, -1
	push hl
	ld l, $14
	push hl
	ld l, $14
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_bc3db
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld de, Data_bc540
	ld [hl], e
	ld hl, Data_bc540
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	call Debug_MenuWithSecondaryHeader
	reg16swap de, hl
	ld a, e
	and d
	inc a
	jp z, Func_bd40e
	push de
	call FillVisibleAreaWithBlankTile
	pop de
	ld hl, .return
	push hl
	reg16swap de, hl
	add hl, hl
	ld de, Pointers_bcc31
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$c
	ld a, [hl]
	ret

.return
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	jp Func_bd37b

Func_bd40e: ; bd40e (2f:540e)
	ld hl, sp+$6
	ld de, Data_bc517
	ld [hl], e
	ld hl, Data_bc517
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	jp Func_bd2c7

Func_bd424: ; bd424 (2f:5424)
	call GetHLAtSPPlus6
	ld de, Data_bcaec
	call Func_bc3cd
	call GetHLAtSPPlus4
	ld de, Data_bcafb
	call Func_bc3d4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	ld hl, -1
	push hl
	ld l, $e
	push hl
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_bc3db
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld de, Data_bc671
	ld [hl], e
	ld hl, Data_bc671
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	call Debug_MenuWithSecondaryHeader
	reg16swap de, hl
	ld a, e
	and d
	inc a
	jp z, Func_bd4d5
	push de
	call FillVisibleAreaWithBlankTile
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$a
	ld a, [hl]
	or a
	jp nz, Func_bd4a8
	ld hl, $0
	jp Func_bd4ab

Func_bd4a8: ; bd4a8 (2f:54a8)
	ld hl, $2f
Func_bd4ab: ; bd4ab (2f:54ab)
	add hl, de
	ld c, l
	ld b, h
	pop de
	ld hl, .return
	push hl
	reg16swap de, hl
	add hl, hl
	ld de, Pointers_bd226
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, c
	ld h, b
	ret

.return
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	jp Func_bd424

Func_bd4d5: ; bd4d5 (2f:54d5)
	ld hl, sp+$6
	ld de, Data_bc517
	ld [hl], e
	ld hl, Data_bc517
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	jp Func_bd2c7

Func_bd4eb: ; bd4eb (2f:54eb)
	call Func_bd097
	jp Func_bd2c7

Func_bd4f1: ; bd4f1 (2f:54f1)
	call Func_bc14e
	pop hl
	push hl
	reg16swap de, hl
	hlcoord 0, 0
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	set_farcall_addrs_hli FreeMemory
	call GetHLAtSPPlus4
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	push hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	add sp, $16
	ret

Func_bd542:
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $168
	call FarCall
	reg16swap de, hl
	push de
	reg16swap de, hl
	ld de, wOAMBufferEnd
	ld bc, $168
	call CopyFromDEtoHL
	call FillVisibleAreaWithBlankTile
	call Func_bc092
	pop de
	pop hl
	push de
	call Func_bcc59
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	call Func_bc14e
	pop de
	push de
	ld hl, wOAMBufferEnd
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Func_bd5b7:
	push hl
	add sp, -$10
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $168
	call FarCall
	reg16swap de, hl
	push de
	reg16swap de, hl
	decoord 0, 0
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli AllocateMemory
	ld hl, $f
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $1f
	call FarCall
	push hl
	call FillVisibleAreaWithBlankTile
	call Func_bc092
	pop hl
	pop bc
	push bc
	push hl
	ld l, c
	ld h, b
	ld de, Data_bcaec
	call Func_bc3cd
	pop hl
	push hl
	ld de, Data_bcafb
	call Func_bc3d4
	pop hl
	pop bc
	push hl
	push bc
	push hl
	push bc
	ld hl, -1
	push hl
	ld l, $e
	push hl
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_bc3db
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	push bc
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $c
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld de, Data_bc671
	ld [hl], e
	ld hl, Data_bc671
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	call FillVisibleAreaWithBlankTile
	pop bc
	pop hl
Func_bd66d: ; bd66d (2f:566d)
	push hl
	push bc
	ld e, c
	ld d, b
	call Debug_MenuWithSecondaryHeader
	reg16swap de, hl
	pop bc
	pop hl
	ld a, e
	and d
	inc a
	jp z, Func_bd6ac
	push hl
	push bc
	ld hl, .return
	push hl
	reg16swap de, hl
	add hl, hl
	ld de, Pointers_bd226
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $1c
	ret

.return
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	pop bc
	pop hl
	jp Func_bd66d

Func_bd6ac: ; bd6ac (2f:56ac)
	pop de
	push hl
	push bc
	push de
	call Func_bc14e
	pop de
	push de
	hlcoord 0, 0
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	add sp, $12
	ret

Func_bd6fa:: ; bd6fa (2f:56fa)
	call Func_bc000
	ld a, [hSRAMBank]
	push af
	ld a, $0
	call GetSRAMBank
	push hl
	push de
	call Func_bc092
	pop de
	pop hl
	push de
	add sp, -$3c
	push hl
	ld hl, sp+$45
	ld c, [hl]
	pop de
	ld hl, sp+$0
	push hl
	call FarCopyUntilNull
	ld hl, sp+$3e
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	call Func_bc4a6
	add sp, $3e
	pop af
	call GetSRAMBank
	call Func_bc14e
	ret

Func_bd72d:
	push hl
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $168
	call FarCall
	push hl
	ld de, wOAMBufferEnd
	ld bc, $168
	call CopyFromDEtoHL
	call FillVisibleAreaWithBlankTile
	call Func_bc092
Func_bd75c: ; bd75c (2f:575c)
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_bd7bd
	ld a, [wStringDestX]
	add $3
	cp $14
	jp c, Func_bd79c
	xor a
	ld [wStringDestX], a
	ld a, [wStringDestY]
	inc a
	ld [wStringDestY], a
	cp $12
	jp c, Func_bd79c
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	xor a
	ld [wStringDestY], a
	call FillVisibleAreaWithBlankTile
Func_bd79c: ; bd79c (2f:579c)
	call GetHLAtSPPlus4
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bd7fc
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	jp Func_bd75c

Func_bd7bd: ; bd7bd (2f:57bd)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	call Func_bc14e
	pop hl
	push hl
	reg16swap de, hl
	hlcoord 0, 0
	ld bc, $168
	call CopyFromDEtoHL
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	ret

Data_bd7fc:
	TX_HNUM
	db ":", $0

Func_bd800: ; bd800 (2f:5800)
	push de
	push bc
	push af
	read_hl_from_sp_plus $10
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$8
	ld a, [hl]
	add a
	ld hl, sp+$4
	add [hl]
	add $2
	cp $12
	jp c, Func_bd846
	ld hl, sp+$4
	ld a, [hl]
	add $2
	ld l, a
	ld a, $12
	sub l
	ld b, $2
	call DivideAbyB
	ld hl, sp+$8
	ld [hl], a
Func_bd846: ; bd846 (2f:5846)
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $10
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $10
	ld de, $8
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $12
	ld de, $a
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	read_hl_from_sp_plus $10
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	read_hl_from_sp_plus $10
	inc hl
	ld [hl], a
	pop bc
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	ld [hl], c
	ld hl, sp+$4
	ld a, [hl]
	add a
	inc a
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ret

DebugMenu_GetJoypad: ; bd89d (2f:589d)
	call NextOverworldFrame
	ld l, a
	xor a
	ld [wJoyLast], a
	xor a
	ld [wJoyHeld], a
	ld a, l
	ret

Func_bd8ab: ; bd8ab (2f:58ab)
	push hl
	push de
	push bc
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_bd8b3: ; bd8b3 (2f:58b3)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_bd8ec
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	dec bc
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	push af
	call GetHLAtSPPlus10
	call Coord2TileMap
	pop af
	ld [hl], a
	call GetHLAtSPPlus8
	inc h
	call WriteHLToSPPlus8
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_bd8b3

Func_bd8ec: ; bd8ec (2f:58ec)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_bd8f1: ; bd8f1 (2f:58f1)
	push hl
	push de
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_bd8f8: ; bd8f8 (2f:58f8)
	ld hl, sp+$0
	ld a, [hl]
	cp c
	jp nc, Func_bd92b
	push bc
	call GetHLAtSPPlus8
	ld de, $a
	call DivideHLByDESigned
	ld a, e
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	call GetHLAtSPPlus8
	ld de, $a
	call DivideHLByDESigned
	call WriteHLToSPPlus8
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
	jp Func_bd8f8

Func_bd92b: ; bd92b (2f:592b)
	pop bc
	pop bc
	pop bc
	ret

Func_bd92f:
	push hl
	add sp, -$14
	ld hl, sp+$12
	ld [hl], $0
	read_hl_from_sp_plus $16
	ld e, [hl]
	ld hl, sp+$11
	ld [hl], e
	read_hl_from_sp_plus $16
	inc hl
	ld e, [hl]
	ld hl, sp+$10
	ld [hl], e
	read_hl_from_sp_plus $16
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$f
	ld [hl], e
	read_hl_from_sp_plus $16
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$e
	ld [hl], e
	read_hl_from_sp_plus $16
	ld de, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $16
	ld de, $8
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $16
	ld de, $a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	read_hl_from_sp_plus $16
	ld de, $f
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$7
	ld a, [hl]
	and $10
	jp nz, Func_bd9a2
	call Func_1fbe
Func_bd9a2: ; bd9a2 (2f:59a2)
	read_hl_from_sp_plus $16
	ld de, $5
	add hl, de
	ld a, [hl]
	ld [wBlinkerOffTile], a
	ld hl, sp+$f
	ld c, [hl]
	ld hl, sp+$1
	push hl
	read_hl_from_sp_plus $10
	pop de
	call Func_bd8f1
	read_hl_from_sp_plus $16
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $ff
	jp z, Func_bd9e8
	ld e, a
	ld d, $0
	ld hl, sp+$11
	ld a, [hl]
	ld hl, sp+$f
	ld l, [hl]
	ld h, a
	dec hl
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, de
	inc hl
	ld de, Data_bdd87
	call PlaceStringDEatCoordHL
Func_bd9e8: ; bd9e8 (2f:59e8)
	ld c, $0
Func_bd9ea: ; bd9ea (2f:59ea)
	ld hl, sp+$12
	ld a, [hl]
	or a
	jp nz, Func_bdc9d
	push bc
	ld hl, sp+$11
	ld c, [hl]
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$12
	ld l, [hl]
	ld h, a
	call Func_bd8ab
	ld l, $1
	push hl
	ld hl, sp+$13
	ld c, [hl]
	ld hl, sp+$14
	ld e, [hl]
	ld hl, sp+$15
	ld a, [hl]
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli Func_60001
	ld c, $0
	ld hl, sp+$12
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$11
	add [hl]
	dec a
	ld hl, sp+$10
	sub [hl]
	call FarCall
	pop bc
	read_hl_from_sp_plus $16
	ld de, $d
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $16
	ld de, $e
	add hl, de
	or [hl]
	or $3
	and c
	jp z, Func_bda87
	ld a, c
	and $3
	jp z, Func_bda61
	ld hl, sp+$0
	ld [hl], $0
Func_bda57: ; bda57 (2f:5a57)
	call DebugMenu_GetJoypad
	or a
	jp nz, Func_bda57
	jp Func_bda84

Func_bda61: ; bda61 (2f:5a61)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
Func_bda67: ; bda67 (2f:5a67)
	call DebugMenu_GetJoypad
	or a
	jp z, Func_bda80
	ld hl, sp+$6
	ld a, [hl]
	cp $14
	jp nc, Func_bda80
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_bda67

Func_bda80: ; bda80 (2f:5a80)
	ld hl, sp+$0
	ld [hl], $f
Func_bda84: ; bda84 (2f:5a84)
	jp Func_bda8b

Func_bda87: ; bda87 (2f:5a87)
	ld hl, sp+$0
	ld [hl], $0
Func_bda8b: ; bda8b (2f:5a8b)
	call DebugMenu_GetJoypad
	ld c, a
	inc c
	dec c
	jp z, Func_bda8b
	push bc
	set_farcall_addrs_hli Func_60001
	ld c, $1
	ld hl, sp+$12
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$11
	add [hl]
	dec a
	ld hl, sp+$10
	sub [hl]
	call FarCall
	pop bc
	read_hl_from_sp_plus $16
	ld de, $c
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_bdac9
	ld hl, sp+$12
	ld [hl], $1
	jp Func_bdc0f

Func_bdac9: ; bdac9 (2f:5ac9)
	read_hl_from_sp_plus $16
	ld de, $d
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $16
	ld de, $e
	add hl, de
	or [hl]
	and c
	jp z, Func_bdbb8
	read_hl_from_sp_plus $16
	ld de, $d
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_bdafb
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
	jp Func_bdb15

Func_bdafb: ; bdafb (2f:5afb)
	read_hl_from_sp_plus $16
	ld de, $e
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_bdb15
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_bdb15: ; bdb15 (2f:5b15)
	push bc
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	cp $ff
	jp nz, Func_bdb67
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], $9
	ld hl, sp+$9
	ld a, [hl]
	and $4
	jp z, Func_bdb64
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld c, a
Func_bdb3b: ; bdb3b (2f:5b3b)
	ld a, c
	ld hl, sp+$11
	cp [hl]
	jp nc, Func_bdb64
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	cp $ff
	jp nz, Func_bdb5d
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], $9
	jp Func_bdb60

Func_bdb5d: ; bdb5d (2f:5b5d)
	jp Func_bdb64

Func_bdb60: ; bdb60 (2f:5b60)
	inc c
	jp Func_bdb3b

Func_bdb64: ; bdb64 (2f:5b64)
	jp Func_bdbb4

Func_bdb67: ; bdb67 (2f:5b67)
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	cp $a
	jp nz, Func_bdbb4
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], $0
	ld hl, sp+$9
	ld a, [hl]
	and $4
	jp z, Func_bdbb4
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld c, a
Func_bdb8c: ; bdb8c (2f:5b8c)
	ld a, c
	ld hl, sp+$11
	cp [hl]
	jp nc, Func_bdbb4
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
	cp $a
	jp nz, Func_bdbad
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], $0
	jp Func_bdbb0

Func_bdbad: ; bdbad (2f:5bad)
	jp Func_bdbb4

Func_bdbb0: ; bdbb0 (2f:5bb0)
	inc c
	jp Func_bdb8c

Func_bdbb4: ; bdbb4 (2f:5bb4)
	pop bc
	jp Func_bdc0f

Func_bdbb8: ; bdbb8 (2f:5bb8)
	ld a, c
	and $2
	jp z, Func_bdbe1
	ld hl, sp+$e
	ld a, [hl]
	inc a
	ld hl, sp+$e
	ld [hl], a
	ld hl, sp+$f
	cp [hl]
	jp c, Func_bdbde
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$e
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	and $1
	jp z, Func_bdbde
	ld hl, sp+$12
	ld [hl], $1
Func_bdbde: ; bdbde (2f:5bde)
	jp Func_bdc0f

Func_bdbe1: ; bdbe1 (2f:5be1)
	ld a, c
	and $1
	jp z, Func_bdc06
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld hl, sp+$e
	ld [hl], a
	cp $ff
	jp nz, Func_bdc03
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$7
	ld a, [hl]
	and $2
	jp z, Func_bdc03
	ld hl, sp+$12
	ld [hl], $1
Func_bdc03: ; bdc03 (2f:5c03)
	jp Func_bdc0f

Func_bdc06: ; bdc06 (2f:5c06)
	ld a, c
	and $20
	jp z, Func_bdc0f
	jp Func_bdc9d

Func_bdc0f: ; bdc0f (2f:5c0f)
	push bc
	ld hl, sp+$9
	ld a, [hl]
	and $20
	jp z, Func_bdc99
	ld hl, $0
	write_hl_to_sp_plus $10
	xor a
Func_bdc20: ; bdc20 (2f:5c20)
	ld hl, sp+$11
	cp [hl]
	jp nc, Func_bdc58
	push af
	read_hl_from_sp_plus $12
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	write_hl_to_sp_plus $12
	ld e, a
	ld d, $0
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	dec hl
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, sp+$5
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $12
	add hl, bc
	write_hl_to_sp_plus $12
	pop af
	inc a
	jp Func_bdc20

Func_bdc58: ; bdc58 (2f:5c58)
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $10
	pop de
	call CompareHLtoDE
	jp nc, Func_bdc73
	read_hl_from_sp_plus $e
	write_hl_to_sp_plus $10
	jp Func_bdc8b

Func_bdc73: ; bdc73 (2f:5c73)
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $12
	pop de
	call CompareHLtoDE
	jp nc, Func_bdc8b
	read_hl_from_sp_plus $c
	write_hl_to_sp_plus $10
Func_bdc8b: ; bdc8b (2f:5c8b)
	ld hl, sp+$11
	ld c, [hl]
	ld hl, sp+$3
	push hl
	read_hl_from_sp_plus $12
	pop de
	call Func_bd8f1
Func_bdc99: ; bdc99 (2f:5c99)
	pop bc
	jp Func_bd9ea

Func_bdc9d: ; bdc9d (2f:5c9d)
	call CheckButton
	push af
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp z, Func_bdcfc
	ld hl, $0
	write_hl_to_sp_plus $10
	xor a
Func_bdcb0: ; bdcb0 (2f:5cb0)
	ld hl, sp+$11
	cp [hl]
	jp nc, Func_bdce8
	push af
	read_hl_from_sp_plus $12
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	write_hl_to_sp_plus $12
	ld e, a
	ld d, $0
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	dec hl
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, sp+$5
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $12
	add hl, bc
	write_hl_to_sp_plus $12
	pop af
	inc a
	jp Func_bdcb0

Func_bdce8: ; bdce8 (2f:5ce8)
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $1a
	ld de, $6
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_bdd0c

Func_bdcfc: ; bdcfc (2f:5cfc)
	read_hl_from_sp_plus $18
	ld de, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $10
Func_bdd0c: ; bdd0c (2f:5d0c)
	ld hl, sp+$11
	ld c, [hl]
	ld hl, sp+$3
	push hl
	read_hl_from_sp_plus $12
	pop de
	call Func_bd8f1
	ld hl, sp+$11
	ld c, [hl]
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$12
	ld l, [hl]
	ld h, a
	call Func_bd8ab
	ld hl, sp+$10
	ld a, [hl]
	read_hl_from_sp_plus $18
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$9
	ld a, [hl]
	and $8
	jp z, Func_bdd68
	ld hl, sp+$10
	ld a, [hl]
	read_hl_from_sp_plus $18
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$12
	ld c, [hl]
	ld b, $0
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	add hl, bc
	inc hl
	call Coord2TileMap
	ld a, [wBlinkerOffTile]
Func_bdd67:
	ld [hl], a
Func_bdd68: ; bdd68 (2f:5d68)
	ld l, $2
	push hl
	ld hl, sp+$13
	ld c, [hl]
	ld hl, sp+$14
	ld e, [hl]
	ld hl, sp+$15
	ld a, [hl]
	call Func_3ca1
	pop bc
	ld hl, sp+$9
	ld a, [hl]
	and $10
	jp nz, Func_bdd83
	call Func_2009
Func_bdd83: ; bdd83 (2f:5d83)
	pop af
	add sp, $16
	ret

Data_bdd87:
	db " ", $0

Pointers_bdd89:
	dw Data_bdda7
	dw Data_bddb7
	dw Data_bddc3
	dw Data_bddd0
	dw Data_bddd9
	dw Data_bdde6
	dw Data_bddf0
	dw Data_bddfb
	dw Data_bde07
	dw Data_bde14
	dw Data_bde1d
	dw Data_bde2b
	dw Data_bde35
	dw Data_bde40
	dw Data_bde47

Data_bdda7:
	db "ハﾞイト (すう) タﾞンフﾟ", $0

Data_bddb7:
	db "シリアル (てんそう)", $0

Data_bddc3:
	db "アイアール (てんそう)", $0

Data_bddd0:
	db "ハﾞトル アニメ", $0

Data_bddd9:
	db "ハﾞトル (しﾞっこう)", $0

Data_bdde6:
	db "(おとの) テスト", $0

Data_bddf0:
	db "アイアール リモコン", $0

Data_bddfb:
	db "(つうしん) ハﾞトル", $0

Data_bde07:
	db "(しﾞかん ひょうしﾞ)", $0

Data_bde14:
	db "エンテﾞィンクﾞ", $0

Data_bde1d:
	db "スーハﾟ ケﾞームホﾞーイ", $0

Data_bde2b:
	db "64テﾞータセット", $0

Data_bde35:
	db "ハﾞトルキャラ ミル", $0

Data_bde40:
	db "テﾞハﾞック", $0

Data_bde47:
	db "カラー", $0

Func_bde4b: ; bde4b (2f:5e4b)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PlaceString
	pop bc
	ret

Func_bde59: ; bde59 (2f:5e59)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus6
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld c, [hl]
	push bc
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus10
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	set_farcall_addrs_hli Func_667d
	pop de
	pop af
	pop bc
	push de
	ld e, a
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	push hl
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	pop de
	ld bc, $8f02
	call FarCall
	ld c, $0
	pop de
Func_bdeec: ; bdeec (2f:5eec)
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_bdf23
	push de
	push bc
	ld a, c
	add a
	ld hl, sp+$6
	add [hl]
	inc a
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	add $2
	call SetStringStartState
	pop bc
	push bc
	call GetHLAtSPPlus6
	ld e, c
	ld d, $0
	add hl, de
	ld a, l
	call GetHLAtSPPlus10
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_bde4b
	pop bc
	inc c
	pop de
	jp Func_bdeec

Func_bdf23: ; bdf23 (2f:5f23)
	pop bc
	pop bc
	pop bc
	ret

Func_bdf27:
	push bc
	push bc
	push bc
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$7
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call FillVisibleAreaWithBlankTile
	pop hl
	pop af
	push hl
	push af
	ld c, l
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$a
	ld l, [hl]
	ld h, a
	call Func_bc486
	pop af
	pop hl
	pop bc
	push bc
	push hl
	push af
	ld l, c
	ld h, b
	call Func_bde59
	call GetHLAtSPPlus10
	ld a, l
	and h
	inc a
	jp z, Func_bdfaf
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, hl
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8f
	call Func_bc170
Func_bdfaf: ; bdfaf (2f:5faf)
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, hl
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8b
	call Func_bc170
	pop af
	pop hl
	push hl
	ld c, a
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_3ca1
	pop bc
	pop bc
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $b
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Func_bdfea:
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $10
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$d
	ld [hl], a
	read_hl_from_sp_plus $10
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$c
	ld [hl], a
	read_hl_from_sp_plus $10
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	read_hl_from_sp_plus $12
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	read_hl_from_sp_plus $12
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $12
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $12
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
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
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop af
	pop de
	push af
	push bc
	ld a, e
	cp $1
	jp z, Func_be0b2
	or a
	jp nz, Func_be0f0
	call GetHLAtSPPlus8
	dec hl
	call WriteHLToSPPlus8
	inc h
	dec h
	bit 7, h
	jr z, .asm_be0af
	ld hl, $0
	call WriteHLToSPPlus8
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	inc h
	dec h
	bit 7, h
	jr z, .asm_be0af
	ld hl, $0
	call WriteHLToSPPlus6
.asm_be0af
	jp Func_be0f0

Func_be0b2: ; be0b2 (2f:60b2)
	read_hl_from_sp_plus $e
	push hl
	call GetHLAtSPPlus10
	inc hl
	call WriteHLToSPPlus10
	pop de
	call CompareHLtoDE
	jp c, Func_be0f0
	read_hl_from_sp_plus $e
	dec hl
	call WriteHLToSPPlus8
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	pop de
	add hl, de
	pop de
	call CompareHLtoDE
	jp c, Func_be0f0
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
Func_be0f0: ; be0f0 (2f:60f0)
	read_hl_from_sp_plus $12
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	call CompareHLtoBC
	jp z, Func_be12c
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $14
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $12
	ld de, $b
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $12
	call Func_bde59
	jp Func_be165

Func_be12c: ; be12c (2f:612c)
	call GetHLAtSPPlus10
	ld a, l
	and h
	inc a
	jp z, Func_be14d
	ld hl, sp+$e
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, hl
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$f
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8f
	call Func_bc170
Func_be14d: ; be14d (2f:614d)
	ld hl, sp+$e
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, hl
	add hl, bc
	inc hl
	ld e, l
	ld hl, sp+$f
	ld a, [hl]
	inc a
	call SetStringStartState
	ld a, $8b
	call Func_bc170
Func_be165: ; be165 (2f:6165)
	call GetHLAtSPPlus8
	ld c, l
	ld b, h
	read_hl_from_sp_plus $12
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $14
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $14
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	pop af
	ld l, c
	push hl
	ld c, a
	ld hl, sp+$c
	ld e, [hl]
	ld hl, sp+$d
	ld a, [hl]
	call Func_3ca1
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_be1ae: ; be1ae
	dr $be1ae, $be1bd

Data_be1bd: ; be1bd
	db $0, $0
	db $14, $b
	dba Func_bdf27
	dbw $2f, $0000
	dba Func_bdfea
	dba Func_15281
	dba Func_1743f
	dbw $2f, $0000
	dbw $2f, $0000
	dbw $00, $0000
	dbw $00, $0000

Func_be1dc: ; be1dc (2f:61dc)
	ld hl, $0
	ld hl, $0
	ld bc, $0
	ld e, c
	ld d, b
	ld hl, $1298
	add hl, de
	reg16swap de, hl
	ld hl, $214
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $a0
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $dc
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $fa
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $1298
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $214
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $a0
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $dc
	add hl, bc
	ld c, l
	ld b, h
	ld hl, $fa
	add hl, bc
	ld c, l
	ld b, h
	call FillVisibleAreaWithBlankTile
	call Func_bc092
	ld hl, wSaveScratchPlayerName
	push hl
	ld hl, Data_be27f
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, wSaveScratchParty
	push hl
	ld hl, Data_be28e
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, wSaveBlock2
	push hl
	ld hl, Data_be29c
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, wSaveBlock3
	push hl
	ld hl, Data_be2ab
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld hl, wSaveBlock4
	push hl
	ld hl, Data_be2ba
	push hl
	call PrintDebugMenuText
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_bc160
	call Func_bc14e
	ret

Data_be27f:
	db "HSRM_TBL:0x"
	TX_HNUM
	db $a
	db $0

Data_be28e:
	db "Robopon:0x"
	TX_HNUM
	db $a
	db $0

Data_be29c:
	db "SIRM_TBL:0x"
	TX_HNUM
	db $a
	db $0

Data_be2ab:
	db "SPRM_TBL:0x"
	TX_HNUM
	db $a
	db $0

Data_be2ba:
	db "SSRM_TBL:0x"
	TX_HNUM
	db $a
	db $0

DebugMenu_SerialTest: ; be2c9 (2f:62c9)
	push bc
	push bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $168
	call FarCall
	pop de
	push hl
	callba_hli Func_6fe0
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	ld hl, $0
	call WriteHLToSPPlus4
Func_be309: ; be309 (2f:6309)
	call GetHLAtSPPlus4
	ld de, $168
	call CompareHLtoDE
	jp nc, Func_be32e
	ld a, $64
	call Func_bdd67 ; this can only end in tears
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	pop de
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	jp Func_be309

Func_be32e: ; be32e (2f:632e)
	ld a, [wc319]
	cp $80
	jp nz, Func_be381
	ld bc, $0
Func_be339: ; be339 (2f:6339)
	ld l, c
	ld h, b
	ld de, $168
	call CompareHLtoDE
	jp nc, Func_be351
	pop hl
	push hl
	add hl, bc
	ld a, [hl]
	hlcoord 0, 0
	add hl, bc
	ld [hl], a
	inc bc
	jp Func_be339

Func_be351: ; be351 (2f:6351)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $168
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld e, $0
	ld hl, Data_be3dc
	call Func_2a3e
	jp Func_be3c9

Func_be381: ; be381 (2f:6381)
	set_farcall_addrs_hli Func_7748
	ld c, $1
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $168
	call FarCall
	ld bc, $0
Func_be39d: ; be39d (2f:639d)
	ld l, c
	ld h, b
	ld de, $168
	call CompareHLtoDE
	jp nc, Func_be3b5
	pop hl
	push hl
	add hl, bc
	ld a, [hl]
	ld hl, wOAMBufferEnd
	add hl, bc
	ld [hl], a
	inc bc
	jp Func_be39d

Func_be3b5: ; be3b5 (2f:63b5)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld e, $0
	ld hl, Data_be3e9
	call Func_2a3e
Func_be3c9: ; be3c9 (2f:63c9)
	set_farcall_addrs_hli FreeMemory
	pop hl
	push hl
	call FarCall
	pop bc
	pop bc
	ret

Data_be3dc:
	db "(しゅうりょう おくり)", $0

Data_be3e9:
	db "(しゅうりょう よみこみ)", $0

Data_be3f7:
	dr $be3f7, $be4f7

DebugMenu_IRTest: ; be4f7 (2f:64f7)
	ld hl, -$102
	add hl, sp
	ld sp, hl
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_be3f7
	ld bc, $100
	call MemCopy
	call Func_1fbe
	ld e, $5
	ld hl, Data_be627
	call Func_2a3e
	push hl
	callba_hli Func_1c3b
	pop hl
	call Func_2887
	ld e, $5
	ld hl, Data_be636
	call Func_2a3e
	write_hl_to_sp_plus $102
	ld a, [wc326]
	cp $80
	jp nz, Func_be579
Func_be53e: ; be53e (2f:653e)
	call CheckButton
	and B_BUTTON
	jp nz, Func_be53e
	callba_hli Func_1c83
	or a
	jp z, Func_be579
	push af
	read_hl_from_sp_plus $104
	call Func_2887
	set_farcall_addrs_hli Func_bd6fa
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_be643
	call FarCall
	jp Func_be621

Func_be579: ; be579 (2f:6579)
	ld a, [wc326]
	cp $80
	jp nz, Func_be5b1
	ld de, $0
Func_be584: ; be584 (2f:6584)
	ld a, e
	sub $0
	ld a, d
	sbc $1
	jp nc, Func_be595
	ld hl, sp+$0
	add hl, de
	ld [hl], e
	inc de
	jp Func_be584

Func_be595: ; be595 (2f:6595)
	set_farcall_addrs_hli Func_790f
	ld c, $5
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $100
	call FarCall
	jp Func_be5ca

Func_be5b1: ; be5b1 (2f:65b1)
	set_farcall_addrs_hli Func_7882
	ld c, $5
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $100
	call FarCall
Func_be5ca: ; be5ca (2f:65ca)
	push af
	read_hl_from_sp_plus $104
	call Func_2887
	pop af
	or a
	jp nz, Func_be608
	push af
	set_farcall_addrs_hli Func_bd6fa
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_be64c
	call FarCall
	set_farcall_addrs_hli Func_bd72d
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $100
	call FarCall
	jp Func_be61e

Func_be608: ; be608 (2f:6608)
	push af
	set_farcall_addrs_hli Func_bd6fa
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_be652
	call FarCall
Func_be61e: ; be61e (2f:661e)
	call Func_2009
Func_be621: ; be621 (2f:6621)
	ld hl, $102
	add hl, sp
	ld sp, hl
	ret

Data_be627:
	db "B ホﾞタン(を おしてね)", $0

Data_be636:
	db "B ホﾞタン キャンセル", $0

Data_be643:
	db "Error:"
	TX_SNUM
	db $0

Data_be64c:
	db "OK:"
	TX_SNUM
	db $0

Data_be652:
	db "Error:"
	TX_SNUM
	db $0

Data_be65b:
	dr $be65b, $be66b

Data_be66b:
	dr $be66b, $be67b

Data_be67b:
	dr $be67b, $be682

Data_be682:
	dr $be682, $be6ab

Func_be6ab: ; be6ab (2f:66ab)
	add sp, -$52
	ld hl, sp+$41
	reg16swap de, hl
	ld hl, Data_be65b
	ld bc, $10
	call MemCopy
	ld hl, sp+$31
	reg16swap de, hl
	ld hl, Data_be66b
	ld bc, $10
	call MemCopy
	ld hl, sp+$2a
	reg16swap de, hl
	ld hl, Data_be67b
	ld bc, $7
	call MemCopy
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, Data_be682
	ld bc, $29
	call MemCopy
	ld hl, sp+$0
	ld [hl], $0
	ld a, $1
	ld [wInBattle], a
	callba_hli AllocateMonsterStruct
	callba_hli LoadBattlePals
	set_farcall_addrs_hli Func_bd6fa
	ld de, $34a
	ld hl, Data_be86e
	call FarCall
	set_farcall_addrs_hli Func_bd6fa
	read_hl_from wCurRobotPointer
	ld de, $6
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	pop de
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, Data_be875
	call FarCall
	ld hl, sp+$2a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1
	ld bc, $29
	call MemCopy
	callba_hli BattleIntro
	ld de, Data_be880
	ld hl, $10f
	call PlaceStringDEatCoordHL
	ld hl, sp+$42
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$41
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $49
	ld c, l
	ld b, h
	ld hl, sp+$43
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld a, [wStringDestX]
	inc a
	ld [wStringDestX], a
	ld de, Data_be885
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$32
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$31
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $39
	ld c, l
	ld b, h
	ld hl, sp+$33
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_be7ee: ; be7ee (2f:67ee)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_be82b
	ld hl, sp+$41
	call Func_bd92f
	ld l, a
	and $20
	jp z, Func_be803
	jp Func_be855

Func_be803: ; be803 (2f:6803)
	ld a, l
	and $10
	jp z, Func_be820
	set_farcall_addrs_hli Func_dcaf
	read_hl_from_sp_plus $49
	ld e, l
	xor a
	call FarCall
	jp Func_be828

Func_be820: ; be820 (2f:6820)
	ld hl, sp+$0
	ld a, [hl]
	xor $1
	ld hl, sp+$0
	ld [hl], a
Func_be828: ; be828 (2f:6828)
	jp Func_be852

Func_be82b: ; be82b (2f:682b)
	ld hl, sp+$31
	call Func_bd92f
	ld l, a
	and $20
	jp z, Func_be839
	jp Func_be855

Func_be839: ; be839 (2f:6839)
	ld a, l
	and $10
	jp z, Func_be84a
	read_hl_from_sp_plus $39
	ld a, l
	call OverworldPlaySong
	jp Func_be852

Func_be84a: ; be84a (2f:684a)
	ld hl, sp+$0
	ld a, [hl]
	xor $1
	ld hl, sp+$0
	ld [hl], a
Func_be852: ; be852 (2f:6852)
	jp Func_be7ee

Func_be855: ; be855 (2f:6855)
	callba_hli FreeMonsterStruct
	xor a
	ld [wInBattle], a
	xor a
	call OverworldPlaySong
	add sp, $52
	ret

Data_be86e:
	db "BBM:"
	TX_SNUM
	db $0

Data_be875:
	db "address:"
	TX_SNUM
	db $0

Data_be880:
	db "アニメ:", $0

Data_be885:
	db "オト:", $0

Data_be889:
	db "0(あかﾞはﾟ)アカﾞハﾟ", $0

Data_be897:
	dr $be897, $be8c0

Func_be8c0: ; be8c0 (2f:68c0)
	add sp, -$38
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, Data_be889
	ld bc, $e
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_be897
	ld bc, $29
	call MemCopy
	ld a, $1
	ld [wInBattle], a
	callba_hli AllocateMonsterStruct
	ld hl, sp+$29
	call WriteHLToSPPlus3
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld bc, $29
	call MemCopy
	callba_hli BattleIntro
	callba_hli DoBattle
	callba_hli FreeMonsterStruct
	xor a
	ld [wInBattle], a
	add sp, $38
	ret

Data_be945:
	dr $be945, $be955

Data_be955:
	dr $be955, $be965

Func_be965: ; be965 (2f:6965)
	add sp, -$22
	ld hl, sp+$11
	reg16swap de, hl
	ld hl, Data_be945
	ld bc, $10
	call MemCopy
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, Data_be955
	ld bc, $10
	call MemCopy
	ld hl, sp+$0
	ld [hl], $0
	ld c, $4
	ld e, $14
	ld hl, $0
	call Func_bc486
	ld de, Data_bea69
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld hl, sp+$12
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$11
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld hl, sp+$13
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld a, [wStringDestX]
	inc a
	ld [wStringDestX], a
	ld de, Data_bea71
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$2
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$1
	ld a, [wStringDestX]
	ld [hl], a
	call GetHLAtSPPlus9
	ld c, l
	ld b, h
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_bea04: ; bea04 (2f:6a04)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_bea35
	ld hl, sp+$11
	call Func_bd92f
	ld l, a
	and $20
	jp z, Func_bea19
	jp Func_bea5e

Func_bea19: ; bea19 (2f:6a19)
	ld a, l
	and $10
	jp z, Func_bea2a
	read_hl_from_sp_plus $19
	ld a, l
	call OverworldPlaySong
	jp Func_bea32

Func_bea2a: ; bea2a (2f:6a2a)
	ld hl, sp+$0
	ld a, [hl]
	xor $1
	ld hl, sp+$0
	ld [hl], a
Func_bea32: ; bea32 (2f:6a32)
	jp Func_bea5b

Func_bea35: ; bea35 (2f:6a35)
	ld hl, sp+$1
	call Func_bd92f
	ld l, a
	and $20
	jp z, Func_bea43
	jp Func_bea5e

Func_bea43: ; bea43 (2f:6a43)
	ld a, l
	and $10
	jp z, Func_bea53
	call GetHLAtSPPlus9
	ld a, l
	call OverworldPlaySFX
	jp Func_bea5b

Func_bea53: ; bea53 (2f:6a53)
	ld hl, sp+$0
	ld a, [hl]
	xor $1
	ld hl, sp+$0
	ld [hl], a
Func_bea5b: ; bea5b (2f:6a5b)
	jp Func_bea04

Func_bea5e: ; bea5e (2f:6a5e)
	xor a
	call OverworldPlaySong
	xor a
	call OverworldPlaySFX
	add sp, $22
	ret

Data_bea69:
	db "ヒﾞーシﾞー:", $0

Data_bea71:
	db "エスイー:", $0

Data_bea77:
	dr $bea77, $bea7d

Func_bea7d: ; bea7d (2f:6a7d)
	ld hl, -$206
	add hl, sp
	ld sp, hl
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_bea77
	ld bc, $6
	call MemCopy
	callba_hli AllocateMonsterStruct
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_bc49b
	call FillVisibleAreaWithBlankTile
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_bc49b
	ld a, [wLCDC]
	push af
	set_farcall_addrs_hli Func_6183
	pop af
	push af
	or $6
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_f723
	ld hl, sp+$2
	call FarCall
	ld e, $7
	ld hl, Data_beb8c
	call Func_2a3e
	set_farcall_addrs_hli Func_1c11
	ld hl, $108
	add hl, sp
	reg16swap de, hl
	ld hl, $100
	call FarCall
	set_farcall_addrs_hli Func_1c27
	ld hl, $108
	add hl, sp
	reg16swap de, hl
	ld hl, sp+$8
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_bd6fa
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, Data_beb94
	call FarCall
	set_farcall_addrs_hli Func_bd72d
	pop bc
	ld hl, sp+$8
	reg16swap de, hl
	ld l, c
	ld h, $0
	call FarCall
	set_farcall_addrs_hli Func_6183
	pop af
	call FarCall
	callba_hli FreeMonsterStruct
	ld hl, $206
	add hl, sp
	ld sp, hl
	ret

Data_beb8c:
	db "(あいあーる)", $0

Data_beb94:
	db "KISIYU:0x"
	TX_HNUM
	db $0

Func_beba0: ; beba0 (2f:6ba0)
	callba_hli AllocateMonsterStruct2
	callba_hli Func_6fe0
	set_farcall_addrs_hli Func_60e81
	ld a, $1
	call FarCall
	callba_hli FreeMonsterStruct
	ret

Func_bebdb: ; bebdb (2f:6bdb)
	ld c, $7
	ld e, $14
	ld hl, $0
	call Func_bc486
Func_bebe5: ; bebe5 (2f:6be5)
	ld e, $1
	ld a, $1
	call SetStringStartState
	read_hl_from wc391 + 2
	push hl
	read_hl_from wc391
	push hl
	ld hl, 216840 / $10000
	push hl
	ld hl, 216840 % $10000
	push hl
	call StackDivideLongSigned
	ld hl, Data_bec5b
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $3
	ld a, $1
	call SetStringStartState
	read_hl_from wc391 + 2
	push hl
	read_hl_from wc391
	push hl
	ld hl, 3614 / $10000
	push hl
	ld hl, 3614 % $10000
	push hl
	call StackDivideLongSigned
	ld hl, $0
	push hl
	ld hl, $3c
	push hl
	call StackModulusLongSigned
	ld hl, Data_bec5e
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld l, $7
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call CheckButton
	and $20
	jp z, Func_bec57
	jp Func_bec5a

Func_bec57: ; bec57 (2f:6c57)
	jp Func_bebe5

Func_bec5a: ; bec5a (2f:6c5a)
	ret

Data_bec5b:
	TX_SNUM
	db $0

Data_bec5e:
	TX_SNUM
	db $0

Func_bec61: ; bec61 (2f:6c61)
	ld a, SONG_CREDITS
	call OverworldPlaySong
	callba_hli Credits
	call DebugMenu_WaitButton
	ld a, $e4
	ld [wOBP1], a
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
.wait: ; bec8a (2f:6c8a)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .wait
	call DebugMenu_WaitButton
	ld a, SONG_VICTORY
	call OverworldPlaySong
	callba_hli Credits2
	ret

Data_becab:
	dr $becab, $becba

Data_becba:
	dr $becba, $becc2

Func_becc2: ; becc2 (2f:6cc2)
	add sp, -$18
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, Data_becab
	ld bc, $f
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_becba
	ld bc, $8
	call MemCopy
	ld c, $0
	ld l, $0
	xor a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	write_hl_to_sp_plus $b
	ld de, $f
	ld hl, sp+$8
	call Func_2b83
	ld de, $8
	ld hl, sp+$0
	call Func_2b83
	add sp, $18
	ret

Func_bed16: ; bed16 (2f:6d16)
	ld hl, -$384
	add hl, sp
	ld sp, hl
	ld a, [hSRAMBank]
	push af
	ld e, $0
	ld hl, $356
	add hl, sp
	call GetRobotOrTrainerBaseStats
	ld a, $1
	call GetSRAMBank
	ld bc, $2f
	ld hl, $356
	add hl, sp
	reg16swap de, hl
	ld hl, $ba24
	call CopyFromDEtoHL
	ld a, $3
	call GetSRAMBank
	ld a, $ab
	ld [wSaveScratchParty], a
	ld a, $3a
	ld [wFarCallDestBank], a
	ld bc, $4
	ld de, $4000
	ld hl, sp+$2
	call FarCopyVideoData
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	reg16swap de, hl
	reg16swap de, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $40
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld c, e
	ld b, d
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	pop de
	call FarDecompressVideoData
	ld a, $2
	call GetSRAMBank
	xor a
	ld [$b29f], a
	ld bc, $350
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $b2a0
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ld hl, $384
	add hl, sp
	ld sp, hl
	ret

Data_beda4:
	dr $beda4, $bedb4

Data_bedb4:
	dr $bedb4, $bedc4

DebugTest_SeeBattleChara: ; bedc4 (2f:6dc4)
	add sp, -$24
	ld hl, sp+$13
	reg16swap de, hl
	ld hl, Data_beda4
	ld bc, $10
	call MemCopy
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, Data_bedb4
	ld bc, $10
	call MemCopy
	ld hl, sp+$2
	ld [hl], $0
	ld hl, sp+$1
	ld [hl], $0
	xor a
	ld a, $1
	ld [wInBattle], a
	callba_hli AllocateMonsterStruct
	ld a, $1
	ld [wPoncotPicAlignment], a
	call FillVisibleAreaWithBlankTile
Func_bee08: ; bee08 (2f:6e08)
	ld de, Data_befd3
	ld hl, $10f
	call PlaceStringDEatCoordHL
	ld hl, sp+$14
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$13
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $1b
	ld c, l
	ld b, h
	ld hl, sp+$15
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	set_farcall_addrs_hli Func_dc0a
	read_hl_from_sp_plus $1b
	dec hl
	ld e, l
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_bee6f
	set_farcall_addrs_hli Func_613fc
	read_hl_from_sp_plus $b
	ld a, l
	read_hl_from_sp_plus $b
	ld e, l
	call FarCall
	jp Func_bee8a

Func_bee6f: ; bee6f (2f:6e6f)
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $1c8
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $b
	read_hl_from_sp_plus $1b
	ld a, l
Func_bee8a: ; bee8a (2f:6e8a)
	ld de, Data_befd8
	ld hl, $a0f
	call PlaceStringDEatCoordHL
	ld hl, sp+$4
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$3
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $b
	ld c, l
	ld b, h
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_beedd
	ld hl, $0
	jp Func_beee0

Func_beedd: ; beedd (2f:6edd)
	ld hl, $40
Func_beee0: ; beee0 (2f:6ee0)
	add hl, de
	reg16swap de, hl
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld hl, sp+$2
	ld a, [hl]
	add $2
	ld e, a
	ld hl, sp+$2
	ld a, [hl]
	add $2
	call FarCall
	ld a, $2
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_bef2f
	ld hl, sp+$13
	call Func_bd92f
	ld e, a
	and $20
	jp z, Func_bef2c
	jp Func_befa5

Func_bef2c: ; bef2c (2f:6f2c)
	jp Func_bef3d

Func_bef2f: ; bef2f (2f:6f2f)
	ld hl, sp+$3
	call Func_bd92f
	ld e, a
	and $20
	jp z, Func_bef3d
	jp Func_befa5

Func_bef3d: ; bef3d (2f:6f3d)
	ld a, e
	and $40
	jp z, Func_bef4b
	ld hl, sp+$1
	ld a, [hl]
	xor $1
	ld hl, sp+$1
	ld [hl], a
Func_bef4b: ; bef4b (2f:6f4b)
	ld a, e
	and $80
	jp z, Func_bef9a
	read_hl_from_sp_plus $1b
	inc hl
	ld e, l
	ld hl, sp+$0
	ld [hl], e
Func_bef5a: ; bef5a (2f:6f5a)
	ld hl, sp+$0
	ld a, [hl]
	cp $aa
	jp c, Func_bef66
	ld hl, sp+$0
	ld [hl], $1
Func_bef66: ; bef66 (2f:6f66)
	set_farcall_addrs_hli Func_615be
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $b
	cp l
	jp nz, Func_bef87
	ld a, $2a
	call OverworldPlaySFX
	jp Func_bef91

Func_bef87: ; bef87 (2f:6f87)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_bef5a

Func_bef91: ; bef91 (2f:6f91)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $1b
Func_bef9a: ; bef9a (2f:6f9a)
	ld hl, sp+$2
	ld a, [hl]
	xor $1
	ld hl, sp+$2
	ld [hl], a
	jp Func_bee08

Func_befa5: ; befa5 (2f:6fa5)
	xor a
	ld [wPoncotPicAlignment], a
	callba_hli FreeMonsterStruct
	ld a, $1
	ld [wInBattle], a
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	add sp, $24
	ret

Data_befd3:
	db "キャラ:", $0

Data_befd8:
	db "イロ:", $0

Pointers_befdc:
	dw Data_befe6
	dw Data_beff4
	dw Data_befff
	dw Data_bf00d
	dw $0000

Data_befe6:
	db "(かんしを おこないます)", $0

Data_beff4:
	db "キー(を おしてね)", $0

Data_befff:
	db "アアアアアアアアアアアアア", $0

Data_bf00d:
	db "(いいいいいいいいいいいいいい)", $0

Func_bf01e: ; bf01e (2f:701e)
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Pointers_befdc
	ld bc, $a
	call MemCopy
Func_bf032: ; bf032 (2f:7032)
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli PrintMapText
	ld bc, $42f
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	jp Func_bf032

Data_bf064:
	dr $bf064, $bf074

Data_bf074:
	dr $bf074, $bf084

Data_bf084:
	dr $bf084, $bf094

Func_bf094: ; bf094 (2f:7094)
	add sp, -$30
	push de
	ld hl, sp+$22
	reg16swap de, hl
	ld hl, Data_bf064
	ld bc, $10
	call MemCopy
	ld hl, sp+$12
	reg16swap de, hl
	ld hl, Data_bf074
	ld bc, $10
	call MemCopy
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_bf084
	ld bc, $10
	call MemCopy
	ld l, $0
	push hl
	call FillVisibleAreaWithBlankTile
	pop hl
	pop de
Func_bf0cc: ; bf0cc (2f:70cc)
	push de
	push hl
	ld de, Data_bf206
	ld hl, $10
	call PlaceStringDEatCoordHL
	ld hl, sp+$25
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$24
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $2c
	ld c, l
	ld b, h
	ld hl, sp+$26
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld de, Data_bf20c
	ld hl, $710
	call PlaceStringDEatCoordHL
	ld hl, sp+$15
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$14
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $1c
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	ld de, Data_bf210
	ld hl, $d10
	call PlaceStringDEatCoordHL
	ld hl, sp+$5
	ld a, [wStringDestY]
	ld [hl], a
	ld hl, sp+$4
	ld a, [wStringDestX]
	ld [hl], a
	read_hl_from_sp_plus $c
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	inc d
	inc d
	ld a, [wStringDestY]
	ld l, a
	ld a, [wStringDestX]
	ld h, a
	call Func_2230
	set_farcall_addrs_hli Func_667d
	ld bc, $103
	ld de, $1311
	ld hl, $10
	call FarCall
	ld a, $1
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop hl
	pop de
	push hl
	ld a, l
	cp $2
	jp z, Func_bf1a1
	cp $1
	jp z, Func_bf198
	or a
	jp nz, Func_bf1a7
	ld hl, sp+$22
	call Func_bd92f
	ld e, a
	jp Func_bf1a7

Func_bf198: ; bf198 (2f:7198)
	ld hl, sp+$12
	call Func_bd92f
	ld e, a
	jp Func_bf1a7

Func_bf1a1: ; bf1a1 (2f:71a1)
	ld hl, sp+$2
	call Func_bd92f
	ld e, a
Func_bf1a7: ; bf1a7 (2f:71a7)
	pop hl
	ld a, e
	and $20
	jp z, Func_bf1b1
	jp Func_bf203

Func_bf1b1: ; bf1b1 (2f:71b1)
	push de
	ld a, e
	and $40
	jp z, Func_bf1c1
	inc l
	ld a, l
	cp $3
	jp c, Func_bf1c1
	ld l, $0
Func_bf1c1: ; bf1c1 (2f:71c1)
	push hl
	call WaitVideoTransfer
Func_bf1c5: ; bf1c5 (2f:71c5)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_bf1c5
	read_hl_from_sp_plus $1c
	push hl
	read_hl_from_sp_plus $2e
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $10
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	pop de
	add hl, de
	pop de
	add hl, de
	write_hl_to wCGB_BGPalsBuffer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_bf1f6: ; bf1f6 (2f:71f6)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_bf1f6
	pop hl
	pop de
	jp Func_bf0cc

Func_bf203: ; bf203 (2f:7203)
	add sp, $30
	ret

Data_bf206:
	db "ミトﾞリ:", $0

Data_bf20c:
	db "アカ:", $0

Data_bf210:
	db "アオ:", $0

Func_bf214: ; bf214 (2f:7214)
	push bc
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank
	ld a, $19
	ld [wFarCallDestBank], a
	ld bc, $214
	ld de, DebugSaveState
	ld hl, wSaveScratch
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli AllocateMemory
	ld hl, $f
	call FarCall
	pop de
	push hl
	set_farcall_addrs_hli AllocateMemory
	ld hl, $1f
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call GetHLAtSPPlus4
	ld de, Data_be1ae
	call Func_bc3cd
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, Data_be1bd
	call Func_bc3d4
	ld a, $f
	pop bc
	push bc
	push bc
	call GetHLAtSPPlus6
	push hl
	ld hl, -1
	push hl
	ld l, a
	push hl
	ld l, a
	push hl
	ld c, $10
	ld e, $0
	xor a
	call Func_bd800
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
Func_bf297: ; bf297 (2f:7297)
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, b
	call Debug_MenuWithSecondaryHeader
	pop bc
	ld a, l
	cp $e
	jp z, Func_bf360
	cp $d
	jp z, Func_bf358
	cp $c
	jp z, Func_bf350
	cp $b
	jp z, Func_bf348
	cp $a
	jp z, Func_bf340
	cp $9
	jp z, Func_bf338
	cp $8
	jp z, Func_bf330
	cp $7
	jp z, Func_bf328
	cp $6
	jp z, Func_bf320
	cp $5
	jp z, Func_bf318
	cp $4
	jp z, Func_bf310
	cp $3
	jp z, Func_bf308
	cp $2
	jp z, Func_bf300
	cp $1
	jp z, Func_bf2f8
	or a
	jp nz, Func_bf368
	push bc
	call Func_be1dc
	pop bc
	jp Func_bf297

Func_bf2f8: ; bf2f8 (2f:72f8)
	push bc
	call DebugMenu_SerialTest
	pop bc
	jp Func_bf297

Func_bf300: ; bf300 (2f:7300)
	push bc
	call DebugMenu_IRTest
	pop bc
	jp Func_bf297

Func_bf308: ; bf308 (2f:7308)
	push bc
	call Func_be6ab
	pop bc
	jp Func_bf297

Func_bf310: ; bf310 (2f:7310)
	push bc
	call Func_be8c0
	pop bc
	jp Func_bf297

Func_bf318: ; bf318 (2f:7318)
	push bc
	call Func_be965
	pop bc
	jp Func_bf297

Func_bf320: ; bf320 (2f:7320)
	push bc
	call Func_bea7d
	pop bc
	jp Func_bf297

Func_bf328: ; bf328 (2f:7328)
	push bc
	call Func_beba0
	pop bc
	jp Func_bf297

Func_bf330: ; bf330 (2f:7330)
	push bc
	call Func_bebdb
	pop bc
	jp Func_bf297

Func_bf338: ; bf338 (2f:7338)
	push bc
	call Func_bec61
	pop bc
	jp Func_bf297

Func_bf340: ; bf340 (2f:7340)
	push bc
	call Func_becc2
	pop bc
	jp Func_bf297

Func_bf348: ; bf348 (2f:7348)
	push bc
	call Func_bed16
	pop bc
	jp Func_bf297

Func_bf350: ; bf350 (2f:7350)
	push bc
	call DebugTest_SeeBattleChara
	pop bc
	jp Func_bf297

Func_bf358: ; bf358 (2f:7358)
	push bc
	call Func_bf01e
	pop bc
	jp Func_bf297

Func_bf360: ; bf360 (2f:7360)
	push bc
	call Func_bf094
	pop bc
	jp Func_bf297

Func_bf368: ; bf368 (2f:7368)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli FreeMemory
	call GetHLAtSPPlus4
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	pop bc
	ret

Func_bf397: ; bf397 (2f:7397)
	push bc
	push bc
	push bc
	push bc
	read_hl_from wMemoryAllocationPointer
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus6
	ld hl, $0
	call WriteHLToSPPlus4
	ld c, l
	ld b, h
	ld hl, $0
	pop de
	push hl
Func_bf3b6: ; bf3b6 (2f:73b6)
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, Func_bf428
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $55
	jp nz, Func_bf411
	call GetHLAtSPPlus8
	ld a, l
	sub $0
	ld a, h
	sbc $c0
	jp c, Func_bf3e1
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	jp Func_bf3f1

Func_bf3e1: ; bf3e1 (2f:73e1)
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop bc
Func_bf3f1: ; bf3f1 (2f:73f1)
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, Func_bf40d
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
Func_bf40d: ; bf40d (2f:740d)
	pop bc
	jp Func_bf418

Func_bf411: ; bf411 (2f:7411)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
Func_bf418: ; bf418 (2f:7418)
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	jp Func_bf3b6

Func_bf428: ; bf428 (2f:7428)
	call GetHLAtSPPlus4
	add hl, bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

PrintMemoryAllocationErrorDetails: ; bf431 (2f:7431)
	push hl
	ld hl, -$148
	add hl, sp
	ld sp, hl
	ld hl, $148
	add hl, sp
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $0
	call WriteHLToSPPlus9
	ld hl, -1
	call WriteHLToSPPlus7
	ld hl, sp+$4
	ld a, [wBGP]
	ld [hl], a
	pop hl
	ld a, l
	and h
	inc a
	jp nz, Func_bf599
	read_hl_from wMemoryAllocationPointer
	pop de
	push hl
Func_bf460: ; bf460 (2f:7460)
	pop hl
	push hl
	ld a, l
	or h
	jp z, Func_bf583
	ld hl, sp+$7
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	cp $aa
	jp z, Func_bf4d8
	pop hl
	push hl
	ld a, [hl]
	cp $55
	jp z, Func_bf4d8
Func_bf47b: ; bf47b (2f:747b)
	call FillVisibleAreaWithBlankTile
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $800
	ld de, GFX_4122
	ld hl, $9000
	call FarRequestVideoData
	ld e, $1
	xor a
	call SetStringStartState
	call GetHLAtSPPlus7
	push hl
	ld hl, Data_bf707
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $3
	xor a
	call SetStringStartState
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_bf714
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $5
	xor a
	call SetStringStartState
	pop hl
	push hl
	push hl
	ld hl, Data_bf71b
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
Func_bf4d5: ; bf4d5 (2f:74d5)
	jp Func_bf4d5

Func_bf4d8: ; bf4d8 (2f:74d8)
	ld hl, sp+$7
	ld [hl], $1
	pop hl
	push hl
	ld a, l
	sub $0
	ld a, h
	sbc $a0
	jp c, Func_bf4f4
	pop hl
	push hl
	xor a
	sub l
	ld a, $c0
	sbc h
	jp c, Func_bf4f4
	jp Func_bf517

Func_bf4f4: ; bf4f4 (2f:74f4)
	ld hl, sp+$7
	ld [hl], $2
	pop hl
	push hl
	ld a, l
	sub $0
	ld a, h
	sbc $ce
	jp c, Func_bf510
	pop hl
	push hl
	xor a
	sub l
	ld a, $d8
	sbc h
	jp c, Func_bf510
	jp Func_bf517

Func_bf510: ; bf510 (2f:7510)
	ld hl, sp+$7
	ld [hl], $3
	jp Func_bf47b

Func_bf517: ; bf517 (2f:7517)
	ld hl, sp+$7
	ld [hl], $4
	call GetHLAtSPPlus5
	ld a, l
	and h
	inc a
	jp z, Func_bf535
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus7
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_bf535
	jp Func_bf47b

Func_bf535: ; bf535 (2f:7535)
	pop hl
	push hl
	call WriteHLToSPPlus5
	pop hl
	push hl
	ld a, [hl]
	cp $55
	jp nz, Func_bf55b
	pop hl
	push hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	call CompareHLtoBC
	jp nc, Func_bf55b
	pop hl
	push hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
Func_bf55b: ; bf55b (2f:755b)
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	cp $2
	jp nz, Func_bf575
	ld a, d
	cp $a0
	jp nz, Func_bf575
	ld hl, -1
	call WriteHLToSPPlus5
Func_bf575: ; bf575 (2f:7575)
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	jp Func_bf460

Func_bf583: ; bf583 (2f:7583)
	ld hl, sp+$7
	ld [hl], $5
	call GetHLAtSPPlus7
	ld de, $400
	call CompareHLtoDE
	jp nc, Func_bf596
	jp Func_bf47b

Func_bf596: ; bf596 (2f:7596)
	jp Func_bf701

Func_bf599: ; bf599 (2f:7599)
	push hl
	ld a, [rLCDC]
	ld [wLCDC], a
	ld c, a
	push bc
	ld a, [wLCDC]
	or $81
	ld [wLCDC], a
	ld a, [wLCDC]
	ld [rLCDC], a
	ld a, c
	and $8
	jp nz, Func_bf5b8
	xor a
	jp Func_bf5ba

Func_bf5b8: ; bf5b8 (2f:75b8)
	ld a, $1
Func_bf5ba: ; bf5ba (2f:75ba)
	push af
	ld hl, sp+$e
	ld a, [rIE]
	ld [hl], a
	ld a, [rIE]
	and $fd
	ld [rIE], a
	ld a, [rIE]
	or $1
	ld [rIE], a
	ld a, [hSRAMBank]
	ld e, a
	push de
	ld a, $3
	call GetSRAMBank
	ld bc, $a0
	ld de, wOAMBuffer
	ld hl, $b1
	add hl, sp
	call CopyFromDEtoHL
	call ClearSprites
	ld a, $e8
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $22
	ld [wNextVBlankFlags], a
	call Func_bc49b
	ld bc, $50
	ld de, wOAMBufferEnd
	ld hl, sp+$61
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_62a3
	pop de
	pop af
	push de
	push af
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	ld de, $1303
	ld bc, $0
	call FarCall
	call WaitVideoTransfer
	ld bc, $50
	decoord 0, 0
	ld hl, sp+$11
	call CopyFromDEtoHL
	ld bc, $50
	ld e, $8f
	hlcoord 0, 0
	call FillMemory
	ld e, $1
	xor a
	call SetStringStartState
	pop af
	pop de
	pop bc
	pop hl
	push bc
	push de
	push af
	push hl
	ld hl, Data_bf724
	push hl
	call PlaceString
	pop bc
	pop bc
	call Func_bf397
	push hl
	ld e, $3
	xor a
	call SetStringStartState
	pop hl
	push hl
	ld hl, Data_bf730
	push hl
	call PlaceString
	pop bc
	pop bc
	set_farcall_addrs_hli Func_62a3
	pop af
	push af
	ld l, a
	ld h, $0
	inc h
	inc h
	ld de, $1303
	ld bc, $0
	call FarCall
Func_bf680: ; bf680 (2f:7680)
	call CheckButton
	and $30
	jp z, Func_bf680
	ld bc, $50
	ld hl, sp+$f
	reg16swap de, hl
	hlcoord 0, 0
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_62a3
	pop af
	ld l, a
	ld h, $0
	inc h
	inc h
	ld de, $1303
	ld bc, $0
	call FarCall
	call WaitVideoTransfer
	ld bc, $50
	ld hl, sp+$5d
	reg16swap de, hl
	hlcoord 0, 0
	call CopyFromDEtoHL
	ld bc, $a0
	ld hl, $ad
	add hl, sp
	reg16swap de, hl
	ld hl, wOAM00YCoord
	call CopyFromDEtoHL
	ld hl, sp+$6
	ld a, [hl]
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $22
	ld [wNextVBlankFlags], a
	call Func_bc49b
	pop de
	ld a, e
	call GetSRAMBank
	pop bc
	ld a, c
	ld [rLCDC], a
	ld [wLCDC], a
	ld hl, sp+$8
	ld a, [hl]
	ld [rIE], a
	set_farcall_addrs_hli AllocateMemory
Func_bf701: ; bf701 (2f:7701)
	ld hl, $14a
	add hl, sp
	ld sp, hl
	ret

Data_bf707:
	db "ハﾞッファ エラー:"
	TX_SNUM
	db $0

Data_bf714:
	db "エラー:"
	TX_SNUM
	db $0

Data_bf71b:
	db "アトﾞレス:"
	TX_SNUM
	db $0

Data_bf724:
	db "ケﾞットサイスﾞ:"
	TX_SNUM
	db $0

Data_bf730:
	db "ノコリサイスﾞ:"
	TX_SNUM
	db $0
