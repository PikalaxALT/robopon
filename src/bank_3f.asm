INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 3f", ROMX
INCLUDE "charmap2.asm"
Func_fc000:
	ret

Data_fc001:
	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 06, 19, 27
	RGB 30, 23, 00
	RGB 18, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 30, 23, 00
	RGB 18, 00, 00

	RGB 31, 31, 31
	RGB 06, 19, 27
	RGB 00, 00, 00
	RGB 18, 00, 00

	RGB 00, 00, 00
	RGB 06, 19, 27
	RGB 30, 23, 00
	RGB 18, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00

	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00

	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00

	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00

TitleScreenRandom: ; fc081
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	call FarCall
	ret

Func_fc092:: ; fc092 (3f:4092)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_fc092
	ret

IntroMovie_PlaySceneWaitButton: ; fc09d (3f:409d)
	ld a, [wJoyHeld]
	ld hl, wJoyPressed
	or [hl]
	and A_BUTTON | B_BUTTON | START
	jp z, .cancel
	call Func_1b01
.cancel
	xor a
	ret

Func_fc0ae: ; fc0ae (3f:40ae)
	push hl
	push bc
	push bc
	push de
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wOAMBuffer
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	call WriteHLToSPPlus8
	pop de
	ld hl, $10
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp z, Func_fc0ee
	ld hl, $30
	add hl, de
	reg16swap de, hl
	ld bc, -$10
	jp Func_fc0f1

Func_fc0ee: ; fc0ee (3f:40ee)
	ld bc, $10
Func_fc0f1: ; fc0f1 (3f:40f1)
	xor a
Func_fc0f2: ; fc0f2 (3f:40f2)
	cp $4
	jp nc, Func_fc1a2
	push af
	push bc
	push de
	ld c, e
	ld b, d
	inc b
	dec b
	bit 7, b
	jr nz, .asm_fc10d
	ld e, c
	ld d, b
	ld hl, $98
	call CompareHLtoDE
	jp nc, Func_fc110
.asm_fc10d
	ld bc, $0
Func_fc110: ; fc110 (3f:4110)
	ld hl, sp+$7
	ld [hl], $0
Func_fc114: ; fc114 (3f:4114)
	ld hl, sp+$7
	ld a, [hl]
	cp $8
	jp nc, Func_fc192
	push bc
	ld hl, sp+$8
	ld a, [hl]
	and $20
	jp z, Func_fc142
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, $7
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld c, l
	ld b, h
	jp Func_fc155

Func_fc142: ; fc142 (3f:4142)
	read_hl_from_sp_plus $e
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
Func_fc155: ; fc155 (3f:4155)
	inc b
	dec b
	bit 7, b
	jr nz, .asm_fc166
	ld e, c
	ld d, b
	ld hl, $a8
	call CompareHLtoDE
	jp nc, Func_fc169
.asm_fc166
	ld bc, $0
Func_fc169: ; fc169 (3f:4169)
	read_hl_from_sp_plus $c
	inc hl
	ld [hl], c
	pop bc
	call GetHLAtSPPlus10
	ld [hl], c
	ld hl, sp+$6
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus10
	jp Func_fc114

Func_fc192: ; fc192 (3f:4192)
	pop de
	pop bc
	reg16swap de, hl
	add hl, bc
	reg16swap de, hl
	pop af
	inc a
	jp Func_fc0f2

Func_fc1a2: ; fc1a2 (3f:41a2)
	pop bc
	pop bc
	pop bc
	ret

Func_fc1a6: ; fc1a6 (3f:41a6)
	push hl
	push bc
	push bc
	push bc
	push bc
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld l, a
	ld h, $0
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $80
	call CompareHLtoDE
	jp c, Func_fc1cc
	call GetHLAtSPPlus6
	dec h
	call WriteHLToSPPlus6
Func_fc1cc: ; fc1cc (3f:41cc)
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$6
	ld [hl], a
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_fc1f2
	call GetHLAtSPPlus6
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus6
Func_fc1f2: ; fc1f2 (3f:41f2)
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
Func_fc255: ; fc255 (3f:4255)
	ld hl, sp+$6
	ld a, [hl]
	cp $1
	jp c, Func_fc294
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call Func_fc0ae
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, Func_fc27e
	ld a, $1
	jp Func_fc2c8

Func_fc27e: ; fc27e (3f:427e)
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	jp Func_fc255

Func_fc294: ; fc294 (3f:4294)
	call GetHLAtSPPlus4
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
Func_fc2c8: ; fc2c8 (3f:42c8)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_fc2ce:
	db $03, $00, $f8, $05, $00

Data_fc2d3:
	db $04, $1c, $04, $2c

IntroMovie_SlideRobotLeftToRight: ; fc2d7 (3f:42d7)
	push bc
	push bc
	push bc
	push bc
	push bc
	push af
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, Data_fc2ce
	ld bc, $5
	call MemCopy
	read_hl_from Data_fc2d3
	call WriteHLToSPPlus6
	read_hl_from Data_fc2d3 + 2
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_dc0a
	pop af
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$2
	call Func_fc1a6
	or a
	jp z, Func_fc329
	jp Func_fc351

Func_fc329: ; fc329 (3f:4329)
	ld hl, sp+$9
	ld [hl], $0
Func_fc32d: ; fc32d (3f:432d)
	ld hl, sp+$9
	ld a, [hl]
	cp $1e
	jp nc, Func_fc34c
	call NextOverworldFrame
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, Func_fc342
	jp Func_fc351

Func_fc342: ; fc342 (3f:4342)
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
	jp Func_fc32d

Func_fc34c: ; fc34c (3f:434c)
	ld hl, sp+$0
	call Func_fc1a6
Func_fc351: ; fc351 (3f:4351)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_fc357:
	db $03, $01, $1c, $05, $00

Data_fc35c:
	db $fc, $2c, $fc, $1e

IntroMovie_SlideRobotRightToLeft: ; fc360 (3f:4360)
	push bc
	push bc
	push bc
	push bc
	push bc
	push af
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, Data_fc357
	ld bc, $5
	call MemCopy
	read_hl_from Data_fc35c
	call WriteHLToSPPlus6
	read_hl_from Data_fc35c + 2
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_dc0a
	pop af
	ld e, a
	ld a, $1
	call FarCall
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$2
	call Func_fc1a6
	or a
	jp z, Func_fc3b3
	jp Func_fc3db

Func_fc3b3: ; fc3b3 (3f:43b3)
	ld hl, sp+$9
	ld [hl], $0
Func_fc3b7: ; fc3b7 (3f:43b7)
	ld hl, sp+$9
	ld a, [hl]
	cp $1e
	jp nc, Func_fc3d6
	call NextOverworldFrame
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, Func_fc3cc
	jp Func_fc3db

Func_fc3cc: ; fc3cc (3f:43cc)
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
	jp Func_fc3b7

Func_fc3d6: ; fc3d6 (3f:43d6)
	ld hl, sp+$0
	call Func_fc1a6
Func_fc3db: ; fc3db (3f:43db)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_fc3e1:
	ld a, [wBlinkerOffTile]
	ld [wc31e], a
	ret

Func_fc3e8:
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_fc3fa
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_fc402

Func_fc3fa: ; fc3fa (3f:43fa)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_fc402: ; fc402 (3f:4402)
	xor a
	ldh [rSCX], a
	ld [wc31e], a
	ld a, [wLCDC]
	ldh [rLCDC], a
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ret

Func_fc416: ; fc416 (3f:4416)
	ld a, [wc31e]
	cpl
	inc a
	push af
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli Func_7c8a
	pop af
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, a
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld h, l
	ld l, $0
	ld de, $f805
	add hl, de
	pop de
	ld a, [wOverworldTilemapSelector]
	ld c, a
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push hl
	read_hl_from wc324 + 1
	ld de, $8
	call DivideHLByDESigned
	ld h, l
	ld l, $0
	ld de, $5
	add hl, de
	pop de
	ld a, [wOverworldTilemapSelector]
	ld c, a
	call FarCall
	call WaitVideoTransfer
	ld a, $3f
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, Func_fc3e8
	write_hl_to wVBlankCallbackAddress
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $82
	ld [wNextVBlankFlags], a
Func_fc4ab: ; fc4ab (3f:44ab)
	ld a, [wNextVBlankFlags]
	and $80
	jp nz, Func_fc4ab
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_fc4c9
	ld bc, Func_0300
	debgcoord 0, 5
	hlbgcoord 0, 5, vWindowMap
	call RequestVideoData
	jp Func_fc4d5

Func_fc4c9: ; fc4c9 (3f:44c9)
	ld bc, Func_0300
	debgcoord 0, 5, vWindowMap
	hlbgcoord 0, 5
	call RequestVideoData
Func_fc4d5: ; fc4d5 (3f:44d5)
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $5
	ld de, $130c
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	call FarCall
	ret

Data_fc4f5:
	db $04, $fc, $04, $fc, $08, $08, $08, $08, $02, $02, $02, $02

Func_fc501: ; fc501 (3f:4501)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_fc4f5
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_fc4f5
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_fc4f5
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_fc4f5
	add hl, de
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	pop de
	push hl
	pop hl
	push hl
	ld de, $80
	call CompareHLtoDE
	jp c, Func_fc55b
	pop hl
	push hl
	dec h
	pop de
	push hl
Func_fc55b: ; fc55b (3f:455b)
	xor a
	ld [wBlinkerOffTile], a
	ld a, $3f
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, Func_fc3e1
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	ld hl, sp+$5
	xor a
	ld [hl], a
	ld hl, sp+$6
	ld [hl], a
Func_fc580: ; fc580 (3f:4580)
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$d
	cp [hl]
	jp nc, Func_fc602
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$a
	cp [hl]
	jp nc, Func_fc602
	call GetHLAtSPPlus10
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call Func_fc0ae
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wc324 + 1
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$d
	cp [hl]
	jp nc, Func_fc5c9
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$4
	add [hl]
	ld hl, sp+$6
	ld [hl], a
	ld a, [wBlinkerOffTile]
	ld hl, sp+$3
	add [hl]
	ld [wBlinkerOffTile], a
Func_fc5c9: ; fc5c9 (3f:45c9)
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$a
	cp [hl]
	jp nc, Func_fc5ea
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld hl, sp+$5
	ld [hl], a
	pop hl
	push hl
	push hl
	read_hl_from_sp_plus $c
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_fc5ea: ; fc5ea (3f:45ea)
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, Func_fc5ff
	jp Func_fc602

Func_fc5ff: ; fc5ff (3f:45ff)
	jp Func_fc580

Func_fc602: ; fc602 (3f:4602)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call Func_fc092
	add sp, $e
	ret

Data_fc610:
	db $03, $01, $14, $05, $00

IntroMovie_SlideRobotsForCombat: ; fc615 (3f:4615)
	push bc
	push bc
	push bc
	push bc
	push de
	push af
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, Data_fc610
	ld bc, $5
	call MemCopy
	ld hl, $a0
	call WriteHLToSPPlus7
	set_farcall_addrs_hli Func_dc0a
	pop af
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld a, $1
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld hl, $a0
	call WriteHLToSPPlus3
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1805
	call FarCall
	ld c, $7
Func_fc67b: ; fc67b (3f:467b)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, de
	ld c, l
	ld b, h
	ld e, $0
Func_fc690: ; fc690 (3f:4690)
	ld a, e
	cp $8
	jp nc, Func_fc6a9
	ld a, [bc]
	cp $8f
	jp z, Func_fc69f
	jp Func_fc6a9

Func_fc69f: ; fc69f (3f:469f)
	inc e
	ld hl, $8
	add hl, bc
	ld c, l
	ld b, h
	jp Func_fc690

Func_fc6a9: ; fc6a9 (3f:46a9)
	pop bc
	ld a, e
	cp $8
	jp c, Func_fc6b6
	ld a, c
	cp $3
	jp nz, Func_fc6b9
Func_fc6b6: ; fc6b6 (3f:46b6)
	jp Func_fc6bd

Func_fc6b9: ; fc6b9 (3f:46b9)
	dec c
	jp Func_fc67b

Func_fc6bd: ; fc6bd (3f:46bd)
	inc c
	ld l, c
	dec l
	ld a, $7
	sub l
	add a
	add a
	add a
	add $50
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
Func_fc6cd: ; fc6cd (3f:46cd)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld c, l
	ld b, h
	ld e, $0
Func_fc6e6: ; fc6e6 (3f:46e6)
	ld a, e
	cp $8
	jp nc, Func_fc6ff
	ld a, [bc]
	cp $8f
	jp z, Func_fc6f5
	jp Func_fc6ff

Func_fc6f5: ; fc6f5 (3f:46f5)
	inc e
	ld hl, $8
	add hl, bc
	ld c, l
	ld b, h
	jp Func_fc6e6

Func_fc6ff: ; fc6ff (3f:46ff)
	pop bc
	ld a, e
	cp $8
	jp c, Func_fc70c
	ld a, c
	cp $3
	jp nz, Func_fc70f
Func_fc70c: ; fc70c (3f:470c)
	jp Func_fc713

Func_fc70f: ; fc70f (3f:470f)
	inc c
	jp Func_fc6cd

Func_fc713: ; fc713 (3f:4713)
	ld a, c
	add a
	add a
	add a
	add $50
	push af
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$5
	call FarCall
	pop af
	push af
	ld l, $0
	push hl
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$5
	ld c, l
	ld b, h
	call Func_fc501
	pop bc
	pop af
	ld b, $8
	call DivideAbyB
	ld l, a
	push hl
	ld hl, sp+$2
	ld a, [hl]
	ld b, $8
	call DivideAbyB
	add $f8
	pop de
	call Func_fc416
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_fc756:: ; fc756 (3f:4756)
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_fc768
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_fc770

Func_fc768: ; fc768 (3f:4768)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_fc770: ; fc770 (3f:4770)
	ret

Data_fc771:
	db $48, $50, $08, $00
	db $50, $48, $09, $00
	db $50, $50, $0a, $00
	db $48, $58, $08, $20
	db $50, $58, $0a, $20
	db $50, $60, $09, $20
	db $58, $48, $09, $40
	db $58, $50, $0a, $40
	db $60, $50, $08, $40
	db $58, $58, $0a, $60
	db $58, $60, $09, $60
	db $60, $58, $08, $60

IntroMovie_SpawnIntenseBattleOrb: ; fc7a1 (3f:47a1)
	call ClearSprites
	ld bc, $30
	ld de, Data_fc771
	ld hl, wOAMBuffer
	call CopyFromDEtoHL
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	ret

Data_fc7bc:
	db $40, $48, $00, $00
	db $40, $50, $01, $00
	db $48, $40, $02, $00
	db $48, $48, $03, $00
	db $48, $50, $04, $00
	db $50, $40, $05, $00
	db $50, $48, $06, $00
	db $50, $50, $07, $00
	db $40, $58, $01, $20
	db $40, $60, $00, $20
	db $48, $58, $04, $20
	db $48, $60, $03, $20
	db $48, $68, $02, $20
	db $50, $58, $07, $20
	db $50, $60, $06, $20
	db $50, $68, $05, $20
	db $58, $40, $05, $40
	db $58, $48, $06, $40
	db $58, $50, $07, $40
	db $60, $40, $02, $40
	db $60, $48, $03, $40
	db $60, $50, $04, $40
	db $68, $48, $00, $40
	db $68, $50, $01, $40
	db $58, $58, $07, $60
	db $58, $60, $06, $60
	db $58, $68, $05, $60
	db $60, $58, $04, $60
	db $60, $60, $03, $60
	db $60, $68, $02, $60
	db $68, $58, $01, $60
	db $68, $60, $00, $60

IntroMovie_SpawnLargerBattleOrb: ; fc83c (3f:483c)
	call ClearSprites
	ld bc, $80
	ld de, Data_fc7bc
	ld hl, wOAM00YCoord
	call CopyFromDEtoHL
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	ret

Data_fc857:
	db $16, $04, $07, $18, $00

IntroMovie_FadeToBlack:
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_fc857
	ld bc, $5
	call MemCopy
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	pop bc
	pop bc
	pop bc
	ret

Data_fc882:
	dw $11

Func_fc884: ; fc884 (3f:4884)
	push bc
	read_hl_from Data_fc882
	pop de
	push hl
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	pop bc
	ret

Func_fc89e:
	push bc
	ld a, BANK(GFX_d8000)
	ld [wFarCallDestBank], a
	ld bc, $790
	ld de, GFX_d8000
	ld hl, $9000
	call FarRequestVideoData
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $0
Func_fc8d6: ; fc8d6 (3f:48d6)
	ld a, e
	cp $12
	jp nc, Func_fc92b
	ld c, $0
Func_fc8de: ; fc8de (3f:48de)
	ld a, c
	cp $14
	jp nc, Func_fc927
	push de
	push bc
	ld a, BANK(Data_d8790)
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_d8790
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $1
	call FarCopyVideoData
	pop bc
	pop de
	push de
	ld hl, sp+$2
	ld a, [hl]
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	pop de
	jp Func_fc8de

Func_fc927: ; fc927 (3f:4927)
	inc e
	jp Func_fc8d6

Func_fc92b: ; fc92b (3f:492b)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	xor a
Func_fc938: ; fc938 (3f:4938)
	cp $78
	jp nc, Func_fc946
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_fc938

Func_fc946: ; fc946 (3f:4946)
	pop bc
	ret

Data_fc948:
	db ROCKER + 1
	db SUNNY + 1
	db RAMJET + 1
IF DEF(SUN)
	db MOLBOT + 1
	db DIGGER + 1
ENDC
	db COOKEY + 1
	db BOOMER + 1
	db COBALL + 1
	db UNIX + 1
	db ROMBY + 1
	db RAMBY + 1
	db DOTCOM + 1
	db DOSBOT + 1
	db PUNCHY + 1
	db K_O_ + 1
	db CARD + 1
IF DEF(SUN)
	db VIGGY + 1
	db HOGBOT + 1
ENDC
	db TEABOT + 1
	db GIDGET + 1
	db BETTY + 1
	db GRAMPS + 1
	db B_BOT + 1
	db SIGNOR + 1
	db UNIBOT + 1
	db CYCOOL + 1
	db SPEEDY + 1
IF DEF(SUN)
	db DOLLBY + 1
ENDC
	db MOABOT + 1
IF DEF(STAR)
	db TOPAZ + 1
ENDC
	db SPUTER + 1
	db ROTOR + 1
IF DEF(SUN)
	db SAMMI + 1
ELIF DEF(STAR)
	db MURI + 1
ENDC
	db SUMITO + 1
	db SUMO + 1
	db Q_ + 1
	db VIC + 1
	db RALPH + 1
	db SCREWY + 1
	db SKULBY + 1
	db REX + 1
	db FETCH + 1
	db GIDYUP + 1
	db MEDBOT + 1
	db MEDDY + 1
	db DOCBOT + 1
IF DEF(SUN)
	db SNIPES + 1
	db DEEMO + 1
ENDC
	db CADET + 1
	db PSS_T + 1
	db TOONA + 1
	db PING + 1
	db LEACHY + 1
	db BOOBOT + 1
IF DEF(STAR)
	db VIRUS + 1
	db HEXBOT + 1
ENDC
	db CHIMP + 1
	db SANDY + 1
	db WHACKY + 1
	db FILRUP + 1
	db BATTY + 1
	db WOLFE + 1
	db BOLTON + 1
	db BOILER + 1
	db URCHY + 1
	db SUBRIO + 1
	db SUMISU + 1
	db LOOPY + 1
	db BOOM + 1
	db KABOOM + 1
	db CHOMPS + 1
IF DEF(SUN)
	db DIGIT + 1
	db B_CELL + 1
	db C_CELL + 1
ELIF DEF(STAR)
	db ROBBY + 1
	db ROB_O + 1
	db BELLA + 1
	db CHARM + 1
ENDC
	db EGGER + 1
	db QUAK_D + 1
	db RAZOR + 1
	db ROOTIX + 1
	db ROOTER + 1
	db PALMER + 1
	db SPIKE + 1
	db ZAPPA + 1
	db VIPER + 1
	db PAWS + 1
IF DEF(STAR)
	db HEYLOW + 1
	db ANGIE + 1
	db UGGY + 1
ENDC
	db SCORCH + 1
	db CRYSTY + 1
	db BEAKER + 1
	db GRANIT + 1
	db SNORKS + 1
	db PEACH + 1
	db ORBIT + 1
	db SMACKS + 1
	db PEEDO + 1
	db ZEPPI + 1
	db SPLAT + 1
	db JOHNNY + 1
	db SLOTS + 1
	db CHECKS + 1
	db MACK + 1
	db HONEY + 1
	db SEABEE + 1
	db PUFF + 1
	db GIGO + 1
	db S_BOT + 1
	db SV_BOT + 1
	db SSTBOT + 1
IF DEF(SUN)
	db G_BOT + 1
	db GY_BOT + 1
	db GGTBOT + 1
ENDC
	db STIMY + 1
	db HYME + 1
	db STINKY + 1
	db INVISO + 1
	db MOCHI + 1
	db TACBOT + 1
	db GELLO + 1
	db TICKER + 1
	db RECYCO + 1
	db ZOMBOT + 1
IF DEF(STAR)
	db RUDY + 1
ENDC
Data_fc948End:

Func_fc9bc: ; fc9bc (3f:49bc)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	check_cgb
	jp nz, Func_fca19
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	jp Func_fca1c

Func_fca19: ; fca19 (3f:4a19)
	call WaitVideoTransfer
Func_fca1c: ; fca1c (3f:4a1c)
	ret

Data_fca1d:
IF DEF(SUN)
	db $04, $04, $08, $02, $01, $40, $01, $08
ELIF DEF(STAR)
	db $04, $04, $08, $02, $01, $40, $01, $08
ENDC

Func_fca25: ; fca25 (3f:4a25)
	push bc
	push bc
	set_farcall_addrs_hli StartMoveAnimScript
	ld e, $1
IF DEF(SUN)
	ld a, $3b
ELIF DEF(STAR)
	ld a, $3c
ENDC
	call FarCall
	call WriteHLToSPPlus3
	ld hl, wLCDInterrupt2
	write_hl_to wLCD + 1
	call Func_fe004
	xor a
	ld [wJoyHeld], a
Func_fca4b: ; fca4b (3f:4a4b)
	call CheckButton
	and $b0
	jp z, Func_fca56
	jp Func_fcbae

Func_fca56: ; fca56 (3f:4a56)
	ldh a, [rIE]
	and $2
	jp nz, Func_fca60
	jp Func_fca63

Func_fca60: ; fca60 (3f:4a60)
	jp Func_fca4b

Func_fca63: ; fca63 (3f:4a63)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld a, $1
	call OverworldPlaySong
	call Func_fc9bc
	call Func_fc756
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld hl, sp+$0
	ld [hl], $0
	ld a, $46
Func_fca8a: ; fca8a (3f:4a8a)
	ld a, Data_fc948End - Data_fc948
	call TitleScreenRandom
	ld e, a
	ld d, $0
	ld hl, Data_fc948
	add hl, de
	ld a, [hl]
	dec a
	push af
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	or a
	jp z, Func_fcabb
	ld a, $64
	call TitleScreenRandom
	cp $4b
	jp nc, Func_fcab7
	ld a, $1
	ld [wPoncotPicAlignment], a
	jp Func_fcabb

Func_fcab7: ; fcab7 (3f:4ab7)
	xor a
	ld [wPoncotPicAlignment], a
Func_fcabb: ; fcabb (3f:4abb)
	set_farcall_addrs_hli Func_dc0a
	pop af
	ld e, a
	ld a, [wOverworldTilemapSelector]
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $608
	call FarCall
	call Func_fc756
	ldh a, [rIE]
	and $2
	jp nz, Func_fcb12
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
Func_fcb12: ; fcb12 (3f:4b12)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
Func_fcb1d: ; fcb1d (3f:4b1d)
	set_farcall_addrs_hli PlayMoveAnimScript
	xor a
	call FarCall
	or a
	jp nz, Func_fcb33
	jp Func_fcb85

Func_fcb33: ; fcb33 (3f:4b33)
	callba_hli QueueMoveAnimScriptGFXUpdate
	call CheckButton
	ld c, a
	inc c
	dec c
	jp z, Func_fcb82
	ld a, c
	and $b0
	jp z, Func_fcb53
	jp Func_fcbae

Func_fcb53: ; fcb53 (3f:4b53)
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, Data_fca1d
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_fcb7e
	xor a
	ld [wc208], a
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	cp $8
	jp c, Func_fcb7b
	ld a, $2a
	call OverworldPlaySFX
	ld a, $ff
	ld [wc213], a
Func_fcb7b: ; fcb7b (3f:4b7b)
	jp Func_fcb82

Func_fcb7e: ; fcb7e (3f:4b7e)
	ld hl, sp+$0
	ld [hl], $0
Func_fcb82: ; fcb82 (3f:4b82)
	jp Func_fcb1d

Func_fcb85: ; fcb85 (3f:4b85)
	set_farcall_addrs_hli free
	call GetHLAtSPPlus3
	call FarCall
	set_farcall_addrs_hli StartMoveAnimScript
	ld e, $1
IF DEF(SUN)
	ld a, $3b
ELIF DEF(STAR)
	ld a, $3c
ENDC
	call FarCall
	call WriteHLToSPPlus3
	jp Func_fca8a

Func_fcbae: ; fcbae (3f:4bae)
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld a, [wOverworldTilemapSelector]
	ld e, a
	ld d, $0
	ld a, e
	xor $1
	ld e, a
	add hl, de
	ld de, $1311
	call FarCall
	check_cgb
	jp nz, Func_fcc1b
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld a, [wOverworldTilemapSelector]
	ld e, a
	ld d, $0
	ld a, e
	xor $1
	ld e, a
	add hl, de
	ld de, $1323
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	jp Func_fcc1e

Func_fcc1b: ; fcc1b (3f:4c1b)
	call WaitVideoTransfer
Func_fcc1e: ; fcc1e (3f:4c1e)
	set_farcall_addrs_hli free
	call GetHLAtSPPlus3
	call FarCall
	xor a
	ld [wPoncotPicAlignment], a
	pop bc
	pop bc
	ret

Data_fcc36:
IF DEF(SUN)
	db $00, $01, $01, $02, $02, $02, $02, $02, $01, $01, $01, $01, $03, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $03, $02, $02, $01, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $03, $02, $02, $01, $03, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
ELIF DEF(STAR)
	db $00, $01, $01, $02, $02, $02, $02, $02, $01, $01, $01, $01, $03, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $03, $02, $02, $01, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $03, $02, $02, $01, $03, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
ENDC

Func_fccaa:
	add sp, -$14
	ld hl, sp+$0
	reg16swap de, hl
	ld l, $0
Func_fccb4: ; fccb4 (3f:4cb4)
	ld a, l
	cp $10
	jp nc, Func_fccc2
	ld a, $ff
	ld [de], a
	inc de
	inc l
	jp Func_fccb4

Func_fccc2: ; fccc2 (3f:4cc2)
	ld bc, $10
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $88e0
	call FarRequestVideoData
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	check_cgb
	jp nz, Func_fcd66
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld a, [wOverworldTilemapSelector]
	ld c, a
	ld b, $0
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	jp Func_fcd69

Func_fcd66: ; fcd66 (3f:4d66)
	call WaitVideoTransfer
Func_fcd69: ; fcd69 (3f:4d69)
	call Func_fc756
	call ClearSprites
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wLCDC]
	or $2
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_fc092
	di
	ldh a, [rIE]
	and $fd
	ldh [rIE], a
	ei
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	call Func_fc884
	check_cgb
	jp nz, Func_fcddc
	call WaitVideoTransfer
Func_fcdb8: ; fcdb8 (3f:4db8)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_fcdb8
	ld bc, $80
	ld de, Data_fc001
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_fcdd4: ; fcdd4 (3f:4dd4)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_fcdd4
Func_fcddc: ; fcddc (3f:4ddc)
	check_cgb
	jp nz, Func_fcdf8
	ld a, BANK(GFX_d97e8)
	ld [wFarCallDestBank], a
	ld bc, $750
	ld de, GFX_d97e8
	ld hl, $9000
	call FarRequestVideoData
	jp Func_fce09

Func_fcdf8: ; fcdf8 (3f:4df8)
	ld a, BANK(GFX_d88f8)
	ld [wFarCallDestBank], a
	ld bc, $750
	ld de, GFX_d88f8
	ld hl, $9000
	call FarRequestVideoData
Func_fce09: ; fce09 (3f:4e09)
	ld hl, sp+$12
	ld [hl], $0
Func_fce0d: ; fce0d (3f:4e0d)
	ld hl, sp+$12
	ld a, [hl]
	cp $12
	jp nc, Func_fcea1
	ld hl, sp+$13
	ld [hl], $0
Func_fce19: ; fce19 (3f:4e19)
	ld hl, sp+$13
	ld a, [hl]
	cp $14
	jp nc, Func_fce97
	ld a, BANK(Data_d9048)
	ld [wFarCallDestBank], a
	ld hl, sp+$13
	ld c, [hl]
	ld b, $0
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_d9048
	add hl, de
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$10
	ld bc, $1
	call FarCopyVideoData
	ld hl, sp+$10
	ld a, [hl]
	ld hl, sp+$13
	ld c, [hl]
	ld b, $0
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	ld [hl], a
	check_cgb
	jp nz, Func_fce8d
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, Data_fcc36
	add hl, de
	ld a, [hl]
	add $4
	ld hl, sp+$13
	ld c, [hl]
	ld b, $0
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	ld [hl], a
Func_fce8d: ; fce8d (3f:4e8d)
	ld hl, sp+$13
	ld a, [hl]
	inc a
	ld hl, sp+$13
	ld [hl], a
	jp Func_fce19

Func_fce97: ; fce97 (3f:4e97)
	ld hl, sp+$12
	ld a, [hl]
	inc a
	ld hl, sp+$12
	ld [hl], a
	jp Func_fce0d

Func_fcea1: ; fcea1 (3f:4ea1)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call Func_fc756
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	call Func_fc9bc
	call Func_fc756
	call Func_fca25
	xor a
	call OverworldPlaySong
	di
	ldh a, [rIE]
	and $fd
	ldh [rIE], a
	ld hl, LCDInterrupt
	write_hl_to wLCD + 1
	ei
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	add sp, $14
	ret

Func_fcf0b:
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld a, $43
	call OverworldPlaySFX
IF DEF(SUN)
	ld a, ZAP
ELIF DEF(STAR)
	ld a, SUNNY
ENDC
	call IntroMovie_SlideRobotLeftToRight
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene2
	ret

.scene2
	ld a, $43
	call OverworldPlaySFX
IF DEF(SUN)
	ld a, BOOMER
ELIF DEF(STAR)
	ld a, PIRATE
ENDC
	call IntroMovie_SlideRobotRightToLeft
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene3
	ret

.scene3
	ld a, $43
	call OverworldPlaySFX
IF DEF(SUN)
	ld a, SUMO
ELIF DEF(STAR)
	ld a, MEDDY
ENDC
	call IntroMovie_SlideRobotLeftToRight
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene4
	ret

.scene4
	ld a, $43
	call OverworldPlaySFX
IF DEF(SUN)
	ld a, DEEMO
ELIF DEF(STAR)
	ld a, HEXBOT
ENDC
	call IntroMovie_SlideRobotRightToLeft
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene5
	ret

.scene5
	ld a, $43
	call OverworldPlaySFX
IF DEF(SUN)
	ld e, BOOMER
	ld a, ZAP
ELIF DEF(STAR)
	ld e, PIRATE
	ld a, SUNNY
ENDC
	call IntroMovie_SlideRobotsForCombat
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene6
	ret

.scene6
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	di
	ldh a, [rIE]
	and $fd
	ldh [rIE], a
	ld hl, LCDInterrupt
	write_hl_to wLCD + 1
	ei
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld a, BANK(GFX_4d32)
	ld [wFarCallDestBank], a
	ld bc, $70
	ld de, GFX_4d32
	ld hl, $8000
	call FarRequestVideoData
	ld a, BANK(GFX_4a12)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4a12
	ld hl, $8070
	call FarRequestVideoData
	ld a, BANK(GFX_4da2)
	ld [wFarCallDestBank], a
	ld bc, $30
	ld de, GFX_4da2
	ld hl, $8080
	call FarRequestVideoData
	ld a, $3a
	call OverworldPlaySFX
	call IntroMovie_SpawnIntenseBattleOrb
	call NextOverworldFrame
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene7
	ret

.scene7
	call IntroMovie_SpawnLargerBattleOrb
	call IntroMovie_PlaySceneWaitButton
	or a
	jp z, .scene8
	ret

.scene8
	call IntroMovie_FadeToBlack
	ret

GFX_fcffd: INCBIN "gfx/misc/fcffd.2bpp"

Func_fd03d:
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	call FillVisibleAreaWithBlankTile
	ldh a, [rLCDC]
	ld [wLCDC], a
	push af
	set_farcall_addrs_hli Func_6183
	pop af
	push af
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	ld a, BANK(GFX_4cd2)
	ld [wFarCallDestBank], a
	ld bc, $60
	ld de, GFX_4cd2
	ld hl, $9000
	call FarCopyVideoData
	check_cgb
	jp z, Func_fd0b1
	ld bc, $10
	ld e, $ff
	ld hl, $9060
	call FillMemory
	jp Func_fd0c2

Func_fd0b1: ; fd0b1 (3f:50b1)
	ld a, BANK(GFX_fcffd)
	ld [wFarCallDestBank], a
	ld bc, $40
	ld de, GFX_fcffd
	ld hl, $9060
	call FarCopyVideoData
Func_fd0c2: ; fd0c2 (3f:50c2)
	ld l, $1d
Func_fd0c4: ; fd0c4 (3f:50c4)
	ld a, l
	cp $37
	jp nc, Func_fd0fc
	ld c, $0
Func_fd0cc: ; fd0cc (3f:50cc)
	ld a, c
	cp $3
	jp nc, Func_fd0f5
	push hl
	ld a, l
	add c
	and $1f
	ld l, a
	ld h, $0
	debgcoord 0, 4
	add hl, de
	ld [hl], c
	pop hl
	push hl
	ld a, l
	add c
	and $1f
	ld l, a
	ld h, $0
	debgcoord 0, 13
	add hl, de
	ld a, c
	add $3
	ld [hl], a
	inc c
	pop hl
	jp Func_fd0cc

Func_fd0f5: ; fd0f5 (3f:50f5)
	ld a, l
	add $3
	ld l, a
	jp Func_fd0c4

Func_fd0fc: ; fd0fc (3f:50fc)
	check_cgb
	jp z, Func_fd11d
	ld bc, $80
	ld e, $6
	hlbgcoord 0, 0
	call FillMemory
	ld bc, $80
	ld e, $6
	hlbgcoord 0, 14
	call FillMemory
	jp Func_fd1bd

Func_fd11d: ; fd11d (3f:511d)
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	ld bc, $80
	ld e, $1
	hlbgcoord 0, 0
	call FillMemory
	ld bc, $80
	ld e, $1
	hlbgcoord 0, 14
	call FillMemory
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	ld e, $0
	ld l, e
Func_fd142: ; fd142 (3f:5142)
	ld a, e
	cp $a
	jp nc, Func_fd1bd
	push de
	ld a, e
	add a
	push af
	ld a, l
	and $3
	ld l, a
	push hl
	set_farcall_addrs_hli Func_667d
	pop hl
	pop af
	push hl
	push af
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $600
	add hl, de
	ld c, l
	ld b, h
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $103
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	pop af
	pop hl
	pop de
	push hl
	push de
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $600
	add hl, de
	ld c, l
	ld b, h
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $111
	add hl, de
	push hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $e
	add hl, de
	pop de
	call FarCall
	pop de
	inc e
	pop hl
	inc l
	jp Func_fd142

Func_fd1bd: ; fd1bd (3f:51bd)
	ld bc, $400
	debgcoord 0, 0
	hlbgcoord 0, 0, vWindowMap
	call CopyFromDEtoHL
	check_cgb
	jp nz, Func_fd1e9
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	ld bc, $400
	debgcoord 0, 0
	hlbgcoord 0, 0, vWindowMap
	call CopyFromDEtoHL
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_fd1e9: ; fd1e9 (3f:51e9)
	set_farcall_addrs_hli Func_6183
	pop af
	call FarCall
	xor a
	ld [wOverworldTilemapSelector], a
	call Func_fdfe5
	ld hl, wLCDInterrupt2
	write_hl_to wLCD + 1
	xor a
	ldh [rLYC], a
	di
	ldh a, [rIE]
	or $2
	ldh [rIE], a
	ei
	ret

TitleScreen:: ; fd213 (3f:5213)
	ld a, $9
	ld [wNextVBlankFlags], a
	call WaitVideoTransfer
	call Func_fccaa
	call WaitVideoTransfer
	check_cgb
	jp nz, .no_wait
.wait
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait
.no_wait
	call NextOverworldFrame
	ldh a, [rLCDC]
	ld [wLCDC], a
	push af
	set_farcall_addrs_hli Func_6183
	pop af
	and $7f
	call FarCall
	check_cgb
	jp nz, .no_attr_clear
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
.no_attr_clear
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	ld a, BANK(GFX_4122)
	ld [wFarCallDestBank], a
	ld bc, $800
	ld de, GFX_4122
	ld hl, $9000
	call FarCopyVideoData
	ld bc, $100
	ld de, GFX_4922
	ld hl, $8800
	call FarCopyVideoData
	di
	ldh a, [rIE]
	and $fd
	ldh [rIE], a
	ld hl, LCDInterrupt
	write_hl_to wLCD + 1
	ei
	ld a, $81
	ldh [rLCDC], a
	ld [wLCDC], a
	xor a
	ld [wOverworldTilemapSelector], a
	ld a, [wNextVBlankFlags]
	or $9
	ld [wNextVBlankFlags], a
	call Func_fc092
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_fc092
	call FillVisibleAreaWithBlankTile
	callba_hli FreeMonsterStruct
	xor a
	ld [wJoyHeld], a
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	xor a
	ld [wInBattle], a
	ret

Data_fd30c:
IF DEF(SUN)
	db $ff, $03, $1f, $00, $e0, $03, $00, $7c
ELIF DEF(STAR)
	db $ff, $03, $1f, $00, $e0, $03, $00, $7c
ENDC

IntroMovie:: ; fd314 (3f:5314)
	set_farcall_addrs_hli InitHeap
	ld de, $900
	ld hl, wAllocatableBlock0
	call FarCall
	callba_hli AllocateMonsterStruct
	ld a, $3
	ld [wInBattle], a
	xor a
	ld [wEnableAttrMapTransfer], a
	xor a
	ld [wVBlankTransferFlags], a
	xor a
	ld [wMapObjectCGBAttrsOverride], a
	check_cgb
	jp nz, .not_cgb
	ld bc, $80
	ld de, Data_fc001
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld bc, $8
	ld de, Data_fd30c
	ld hl, wCGB_BGPalsBuffer + 8
	call CopyFromDEtoHL
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	call WaitVideoTransfer
.wait1
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait1
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
.wait2
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait2
.not_cgb
	callba_hli Func_da4dc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_c7bd0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	call Func_fd03d
	call Func_fcf0b
	call TitleScreen
	ret

Text_fd3d1:
	dstr "プロデューサー"

Text_fd3d9:
	dstr "えんどう ひでとし"

Pointers_fd3e3::
	dw Text_fd3d1
	dw Text_fd3d9
	dw $0000

Text_fd3e9:
	dstr "プロデューサー"

Text_fd3f1:
	dstr "こばやし まさき"

Pointers_fd3fa:
	dw Text_fd3e9
	dw Text_fd3f1
	dw $0000

Text_fd400:
	dstr "プロダクトマネージャー"

Text_fd40c:
	dstr " わけ まさのり"

Text_fd415:
	dstr " "

Text_fd417:
	dstr " "

Text_fd419:
	dstr " "

Text_fd41b:
	dstr " "

Pointers_fd41d:
	dw Text_fd400
	dw Text_fd40c
	dw Text_fd415
	dw Text_fd417
	dw Text_fd419
	dw Text_fd41b
	dw $0000

Text_fd42b:
	dstr "サブプロダクトマネージャー"

Text_fd439:
	dstr "あおやま えいじ"

Text_fd442:
	dstr " "

Text_fd444:
	dstr " "

Text_fd446:
	dstr " "

Text_fd448:
	dstr " "

Pointers_fd44a:
	dw Text_fd42b
	dw Text_fd439
	dw Text_fd442
	dw Text_fd444
	dw Text_fd446
	dw Text_fd448
	dw $0000

Text_fd458:
	dstr "せいさくたんとう"

Text_fd461:
	dstr "おざき ただし"

Pointers_fd469:
	dw Text_fd458
	dw Text_fd461
	dw $0000

Text_fd46f:
	dstr "サウンド プロダクツ"

Text_fd47a:
	dstr "スタジオ グイド"

Pointers_fd483:
	dw Text_fd46f
	dw Text_fd47a
	dw $0000

Text_fd489:
	dstr "サウンドプロデュース"

Text_fd494:
	dstr "おおつき かるた"

Text_fd49d:
	dstr "くどう ともり"

Text_fd4a5:
	dstr "やまなか ちこ"

Pointers_fd4ad:
	dw Text_fd489
	dw Text_fd494
	dw Text_fd49d
	dw Text_fd4a5
	dw $0000

Text_fd4b7:
	dstr "きかくサポート"

Text_fd4bf:
	dstr "おおはし しげやす"

Text_fd4c9:
	dstr "いえなが やまと"

Text_fd4d2:
	dstr "いしかわ たかし"

Pointers_fd4db:
	dw Text_fd4b7
	dw Text_fd4bf
	dw Text_fd4c9
	dw Text_fd4d2
	dw $0000

Text_fd4e5:
	dstr "プログラム"

Text_fd4eb:
	dstr "まきしま かずゆき"

Text_fd4f5:
	dstr "おおで たかのり"

Text_fd4fe:
	dstr "やじま ひでたか"

Text_fd507:
	dstr "さえき のりゆき"

Pointers_fd510:
	dw Text_fd4e5
	dw Text_fd4eb
	dw Text_fd4f5
	dw Text_fd4fe
	dw Text_fd507
	dw $0000

Text_fd51c:
	dstr "グラフィック"

Text_fd523:
	dstr "ほしの なつこ"

Text_fd52b:
	dstr "くまい じゅんいち"

Pointers_fd535:
	dw Text_fd51c
	dw Text_fd523
	dw Text_fd52b
	dw $0000

Text_fd53d:
	dstr "スペシャルサンクス"

Text_fd547:
	dstr "なかもと しんいち"

Text_fd551:
	dstr "おかだ せつお"

Text_fd559:
	dstr "もとさこ よしお"

Text_fd562:
	dstr "おおた ひろゆき"

Text_fd56b:
	dstr "さとう とおる"

Pointers_fd573:
	dw Text_fd53d
	dw Text_fd547
	dw Text_fd551
	dw Text_fd559
	dw Text_fd562
	dw Text_fd56b
	dw $0000

Text_fd581:
	dstr "スペシャルサンクス"

Text_fd58b:
	dstr "みつい けいすけ"

Text_fd594:
	dstr "たかはし しょうた"

Text_fd59e:
	dstr "はんだ ゆきこ"

Text_fd5a6:
	dstr "いとう たいじ"

Pointers_fd5ae:
	dw Text_fd581
	dw Text_fd58b
	dw Text_fd594
	dw Text_fd59e
	dw Text_fd5a6
	dw $0000

Text_fd5ba:
	dstr "スペシャルサンクス"

Text_fd5c4:
	dstr "あおき コブた"

Text_fd5cc:
	dstr "あきたか みか"

Text_fd5d4:
	dstr "いい りつこ"

Text_fd5db:
	dstr "あらき ひろみ"

Text_fd5e3:
	dstr "いぶ としろう"

Pointers_fd5eb:
	dw Text_fd5ba
	dw Text_fd5c4
	dw Text_fd5cc
	dw Text_fd5d4
	dw Text_fd5db
	dw Text_fd5e3
	dw $0000

Text_fd5f9:
	dstr "スペシャルサンクス"

Text_fd603:
	dstr "はすぬま ひさお"

Text_fd60c:
	dstr "はすぬま みつお"

Text_fd615:
	dstr "くりもと ひろし"

Text_fd61e:
	dstr "よしはら りえ"

Text_fd626:
	dstr "おのでら のりひろ"

Text_fd630:
	dstr "といだ たかし"

Pointers_fd638:
	dw Text_fd5f9
	dw Text_fd603
	dw Text_fd60c
	dw Text_fd615
	dw Text_fd61e
	dw Text_fd626
	dw Text_fd630
	dw $0000

Text_fd648:
	dstr "スペシャルサンクス"

Text_fd652:
	dstr "コミックボンボンへんしゅうぶ"

Text_fd661:
	dstr " "

Text_fd663:
	dstr " "

Text_fd665:
	dstr " "

Text_fd667:
	dstr " "

Text_fd669:
	dstr " "

Pointers_fd66b:
	dw Text_fd648
	dw Text_fd652
	dw Text_fd661
	dw Text_fd663
	dw Text_fd665
	dw Text_fd667
	dw Text_fd669
	dw $0000

Text_fd67b:
	dstr "デザインさいようしゃ"

Text_fd686:
	dstr "いわした のりふみ"

Pointers_fd690:
	dw Text_fd67b
	dw Text_fd686
	dw $0000

Text_fd696:
	dstr "デザインさいようしゃ"

Text_fd6a1:
	dstr "かきもと だいじろう"

Pointers_fd6ac:
	dw Text_fd696
	dw Text_fd6a1
	dw $0000

Text_fd6b2:
	dstr "ゲームデザイン"

Text_fd6ba:
	dstr "ますだ たつお"

Pointers_fd6c2:
	dw Text_fd6b2
	dw Text_fd6ba
	dw $0000

Text_fd6c8:
	dstr "キャラクターデザイン"

Text_fd6d3:
	dstr "みずたに けんのすけ"

Pointers_fd6de:
	dw Text_fd6c8
	dw Text_fd6d3
	dw $0000

Text_fd6e4:
	dstr "ゲームディレクター"

Text_fd6ee:
	dstr "いい しゅんいち"

Pointers_fd6f7:
	dw Text_fd6e4
	dw Text_fd6ee
	dw $0000

Text_fd6fd:
	dstr "トータルデザイン"

Text_fd706:
	dstr "しもだ あつし"

Pointers_fd70e:
	dw Text_fd6fd
	dw Text_fd706
	dw $0000

Pointers_fd714::
	dw Pointers_fd3e3
	dw Pointers_fd3fa
	dw Pointers_fd41d
	dw Pointers_fd44a
	dw Pointers_fd469
	dw Pointers_fd483
	dw Pointers_fd4ad
	dw Pointers_fd4db
	dw Pointers_fd510
	dw Pointers_fd535
	dw Pointers_fd573
	dw Pointers_fd5ae
	dw Pointers_fd5eb
	dw Pointers_fd638
	dw Pointers_fd66b
	dw Pointers_fd690
	dw Pointers_fd6ac
	dw Pointers_fd6c2
	dw Pointers_fd6de
	dw Pointers_fd6f7
	dw Pointers_fd70e

IF DEF(SUN)
DEF __offset_3F_2 EQU $573e
DEF __offset_3F_3 EQU $7cd4
ELIF DEF(STAR)
DEF __offset_3F_2 EQU $573c
DEF __offset_3F_3 EQU $7cd2
ENDC

