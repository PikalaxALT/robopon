INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 15, 2", ROMX
INCLUDE "charmap.asm"
Func_56ba1:: ; 56ba1 (15:6ba1)
	push hl
	push de
	add sp, -$3e
	push bc
	read_hl_from_sp_plus $44
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $44
	ld a, l
	or h
	jp nz, Func_56bc6
	ld hl, $0
	jp Func_56bc9

Func_56bc6: ; 56bc6 (15:6bc6)
	ld hl, $2f
Func_56bc9: ; 56bc9 (15:6bc9)
	add hl, bc
	reg16swap de, hl
	ld hl, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$2a
	call GetPart
	read_hl_from_sp_plus $44
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus6
	pop hl
	pop bc
	push hl
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $fe
	jp z, Func_56c23
	or a
	jp nz, Func_56c8f
	read_hl_from_sp_plus $44
	ld de, Text_56b9c
	call CopyUntilNull
	write_hl_to_sp_plus $44
	jp Func_56d4b

Func_56c23: ; 56c23 (15:6c23)
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	inc hl
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$17
	call GetMove
	ld hl, sp+$31
	ld a, [hl]
	cp $91
	jp nz, Func_56c6d
	ld hl, sp+$17
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	ld hl, sp+$32
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	jp Func_56c8c

Func_56c6d: ; 56c6d (15:6c6d)
	ld hl, sp+$31
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	ld hl, sp+$17
	push hl
	read_hl_from_sp_plus $46
	dec hl
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
Func_56c8c: ; 56c8c (15:6c8c)
	jp Func_56d4b

Func_56c8f: ; 56c8f (15:6c8f)
	push bc
	ld a, BANK(Moves)
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld l, [hl]
	ld h, $0
	mulhlby19
	ld de, Moves - $13
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld bc, $13
	call FarCopyVideoData
	ld hl, sp+$6
	call FindFirstNonzero
	ld a, l
	pop bc
	cp $5
	jp nc, Func_56cf1
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $5e
	jp c, Func_56d03
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $61
	jp nc, Func_56d03
Func_56cf1: ; 56cf1 (15:6cf1)
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	jp Func_56d4b

Func_56d03: ; 56d03 (15:6d03)
	ld hl, sp+$31
	ld a, [hl]
	cp $91
	jp nz, Func_56d2c
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	ld hl, sp+$32
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	jp Func_56d4b

Func_56d2c: ; 56d2c (15:6d2c)
	ld hl, sp+$31
	push hl
	read_hl_from_sp_plus $46
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $46
	dec hl
	pop de
	call CopyUntilNull
	write_hl_to_sp_plus $44
Func_56d4b: ; 56d4b (15:6d4b)
	pop hl
	call FindFirstNonzero
	ld c, l
	ld b, h
	ld a, [wInBattle]
	or a
	jp nz, Func_56d72
Func_56d58: ; 56d58 (15:6d58)
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_56d72
	read_hl_from_sp_plus $42
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $42
	inc bc
	jp Func_56d58

Func_56d72: ; 56d72 (15:6d72)
	read_hl_from_sp_plus $42
	ld [hl], $0
	read_hl_from_sp_plus $42
	reg16swap de, hl
	add sp, $42
	reg16swap de, hl
	ret

Func_56d87:: ; 56d87 (15:6d87)
	ld c, e
	ld de, $0
	jp Func_56ba1

INCLUDE "engine/save.asm"

Func_5712f:: ; 5712f (15:712f)
	push hl
	add sp, -$12
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld c, a
	read_hl_from_sp_plus $14
	ld de, wc98e
	add hl, de
	ld a, [hl]
	push af
	push bc
	and $3f
	ld l, a
	ld h, $0
	mulhlby17
	ld de, Software - 17
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $11
	call FarCopyVideoData
	pop bc
	ld a, c
	call GetSRAMBank
	ld e, $7
	ld a, $6
	call SetStringStartState
	pop af
	rlca
	rlca
	and $3
	inc a
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	ld hl, Data_571bb
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	push af
	call GetHLAtSPPlus10
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, l
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $509
	call Func_2230
	pop af
	read_hl_from_sp_plus $c
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, l
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $50b
	call Func_2230
	add sp, $14
	ret

Data_571bb:
	dstr "%dM"

Func_571bf:
	push hl
	push de
	add sp, -$18
	push bc
	read_hl_from_sp_plus $1e
	ld de, Init
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$16
	ld [hl], a
	read_hl_from_sp_plus $1e
	reg16swap de, hl
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld hl, sp+$15
	ld [hl], e
	ld hl, sp+$16
	ld a, [hl]
	and $3f
	ld hl, sp+$16
	ld [hl], a
	ld hl, sp+$15
	ld a, [hl]
	and $3f
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$1a
	ld a, [hl]
	and $3f
	ld hl, sp+$1a
	ld [hl], a
	pop bc
	ld a, c
	or b
	jp nz, Func_5720f
	ld hl, $1
	jp Func_5732a

Func_5720f: ; 5720f (15:720f)
	ldh a, [hSRAMBank]
	push af
	push bc
	ld a, BANK(Moves)
	ld [wFarCallDestBank], a
	ld a, $3
	call GetSRAMBank
	pop hl
	mulhlby19
	ld de, Moves - $13
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $13
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$16
	ld [hl], a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$17
	ld [hl], a
	ld hl, sp+$17
	ld a, [hl]
	or a
	jp nz, Func_5729d
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$15
	cp [hl]
	jp nz, Func_57279
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$16
	cp [hl]
	jp z, Func_57270
	ld hl, sp+$18
	ld a, [hl]
	ld hl, sp+$16
	cp [hl]
	jp nz, Func_57276
Func_57270: ; 57270 (15:7270)
	ld hl, $1
	jp Func_5732a

Func_57276: ; 57276 (15:7276)
	jp Func_5729a

Func_57279: ; 57279 (15:7279)
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$16
	cp [hl]
	jp nz, Func_5729a
	ld hl, sp+$13
	ld a, [hl]
	ld hl, sp+$15
	cp [hl]
	jp z, Func_57294
	ld hl, sp+$18
	ld a, [hl]
	ld hl, sp+$15
	cp [hl]
	jp nz, Func_5729a
Func_57294: ; 57294 (15:7294)
	ld hl, $1
	jp Func_5732a

Func_5729a: ; 5729a (15:729a)
	jp Func_57309

Func_5729d: ; 5729d (15:729d)
	ld c, $0
Func_5729f: ; 5729f (15:729f)
	ld a, c
	cp $3
	jp nc, Func_572c1
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld a, [hl]
	ld hl, sp+$14
	cp [hl]
	jp nz, Func_572bd
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld [hl], $ff
	jp Func_572c1

Func_572bd: ; 572bd (15:72bd)
	inc c
	jp Func_5729f

Func_572c1: ; 572c1 (15:72c1)
	ld c, $0
Func_572c3: ; 572c3 (15:72c3)
	ld a, c
	cp $3
	jp nc, Func_572e5
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld a, [hl]
	ld hl, sp+$13
	cp [hl]
	jp nz, Func_572e1
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld [hl], $ff
	jp Func_572e5

Func_572e1: ; 572e1 (15:72e1)
	inc c
	jp Func_572c3

Func_572e5: ; 572e5 (15:72e5)
	ld c, $0
Func_572e7: ; 572e7 (15:72e7)
	ld a, c
	cp $3
	jp nc, Func_57309
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld a, [hl]
	ld hl, sp+$18
	cp [hl]
	jp nz, Func_57305
	ld e, c
	ld d, $0
	ld hl, sp+$15
	add hl, de
	ld [hl], $ff
	jp Func_57309

Func_57305: ; 57305 (15:7305)
	inc c
	jp Func_572e7

Func_57309: ; 57309 (15:7309)
	ld hl, sp+$15
	ld a, [hl]
	cp $ff
	jp nz, Func_57327
	ld hl, sp+$16
	ld a, [hl]
	cp $ff
	jp nz, Func_57327
	ld hl, sp+$17
	ld a, [hl]
	cp $ff
	jp nz, Func_57327
	ld hl, $1
	jp Func_5732a

Func_57327: ; 57327 (15:7327)
	ld hl, -1
Func_5732a: ; 5732a (15:732a)
	reg16swap de, hl
	add sp, $1c
	reg16swap de, hl
	ret

Func_57335:
	reg16swap de, hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $5
	add hl, de
	ld l, [hl]
	add l
	cp $2
	jp z, Func_57381
	cp $1
	jp z, Func_57367
	or a
	jp nz, Func_57398
	set_farcall_addrs_hli Func_14980
	ld hl, $0
	call FarCall
	jp Func_57398

Func_57367: ; 57367 (15:7367)
	call Func_1fbe
	set_farcall_addrs_hli Func_149d5
	ld hl, $0
	call FarCall
	call Func_2009
	jp Func_57398

Func_57381: ; 57381 (15:7381)
	call Func_1fbe
	set_farcall_addrs_hli Func_14a64
	ld hl, $0
	call FarCall
	call Func_2009
Func_57398: ; 57398 (15:7398)
	ld hl, $8000
	ret

Data_5739c:
	db $21, $01, $03, $1a, $02, $00, $09, $07

Func_573a4::
	push hl
	add sp, -$1a
	ld hl, sp+$1a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld l, $0
	push hl
	ld hl, sp+$8
	ld [hl], $0
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld hl, $5
	push hl
	ld bc, $a
	ld de, $0
	ld hl, $a
	call Func_57e52
	pop bc
	ld hl, $6
	push hl
	ld bc, $a
	ld de, $5
	ld hl, $a
	call Func_57e52
	pop bc
	ld hl, $7
	push hl
	ld bc, $14
	ld de, $b
	ld hl, $0
	call Func_57e52
	pop bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, wSaveScratchPlayerName
	reg16swap de, hl
	ld hl, sp+$b
	ld bc, $5
	call CopyFromDEtoHL
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, $0
Func_5741d: ; 5741d (15:741d)
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_57447
	push hl
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_57442
	ld hl, sp+$c
	ld a, [hl]
	inc a
	ld hl, sp+$c
	ld [hl], a
Func_57442: ; 57442 (15:7442)
	pop hl
	inc hl
	jp Func_5741d

Func_57447: ; 57447 (15:7447)
	pop af
	call GetSRAMBank
	callba_hli Func_7cd1
	ld e, a
	ld hl, sp+$8
	ld a, [hl]
	add e
	ld hl, sp+$8
	ld [hl], a
	ld a, [wc790]
	pop hl
	push af
	push hl
	ld hl, $400
	call malloc_Bank15
	call WriteHLToSPPlus10
	pop hl
	inc l
	dec l
	jp nz, Func_5747c
	ld hl, $0
	jp Func_5747f

Func_5747c: ; 5747c (15:747c)
	ld hl, $310
Func_5747f: ; 5747f (15:747f)
	ld de, $89b0
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld a, $c5
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_615be
	ld a, $c5
	call FarCall
	push af
	set_farcall_addrs_hli Func_613fc
	pop af
	ld e, a
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_574c5
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_574ce
Func_574c5: ; 574c5 (15:74c5)
	ld de, $8
	ld hl, Data_5739c
	call Func_2b7d
Func_574ce: ; 574ce (15:74ce)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, $2
	call FarCall
	call WaitVideoTransfer
	call GetHLAtSPPlus8
	call free_Bank15
	ld hl, sp+$9
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $0
	call Func_57e8d
	ld de, Data_57655
	ld hl, $b01
	call PlaceStringDEatCoordHL
	ld a, [wc78c]
	cp $a
	jp nc, Func_57522
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_57659
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_57532

Func_57522: ; 57522 (15:7522)
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_57662
	push hl
	call PlaceString
	pop bc
	pop bc
Func_57532: ; 57532 (15:7532)
	set_farcall_addrs_hli Func_e26e0
	ld hl, sp+$9
	call FarCall
	ld e, $3
	ld a, $b
	call SetStringStartState
	ld hl, sp+$9
	push hl
	ld hl, Data_5766a
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_5766d
	ld hl, $b06
	call PlaceStringDEatCoordHL
	pop af
	cp $1
	jp c, Func_5757b
	cp $8
	jp z, Func_5757b
	push af
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_57675
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	jp Func_5758e

Func_5757b: ; 5757b (15:757b)
	cp $8
	jp z, Func_57584
	or a
	jp nz, Func_5758e
Func_57584: ; 57584 (15:7584)
	push af
	ld hl, Data_57678
	push hl
	call PlaceString
	pop bc
	pop af
Func_5758e: ; 5758e (15:758e)
	cp $2
	jp c, Func_575b5
	push af
	ld de, Data_5767a
	ld hl, $b08
	call PlaceStringDEatCoordHL
	pop af
	ld l, a
	ld h, $0
	dec hl
	push hl
	ld hl, Data_57682
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_57688
	ld hl, $b09
	call PlaceStringDEatCoordHL
Func_575b5: ; 575b5 (15:75b5)
	ld de, Data_57693
	ld hl, $10c
	call PlaceStringDEatCoordHL
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_5769d
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld de, Data_576a2
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_576b0
	push hl
	call PlaceString
	pop bc
	pop bc
	read_hl_from wGameTimer + 2
	push hl
	read_hl_from wGameTimer
	push hl
	ld hl, $0
	push hl
	ld hl, $e1e
	push hl
	call StackDivideLongSigned
	pop hl
	pop af
	push hl
	ld e, $10
	ld a, $1
	call SetStringStartState
	ld hl, Data_576b3
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld de, $3c
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld de, $203
	ld hl, -1
	call Func_2230
	ld hl, Data_576bf
	push hl
	call PlaceString
	pop bc
	pop hl
	ld de, $3c
	call DivideHLByDESigned
	ld c, e
	ld b, d
	ld de, $202
	ld hl, -1
	call Func_2230
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	reg16swap de, hl
	add sp, $1c
	reg16swap de, hl
	ret

Data_57655:
	dstr "ヒﾞル"

Data_57659:
	dstr "  %d(かい)"

Data_57662:
	dstr " %d(かい)"

Data_5766a:
	dstr "%s"

Data_5766d:
	dstr "クﾞレイテスト"

Data_57675:
	dstr "%d"

Data_57678:
	dstr "?"

Data_5767a:
	dstr "クﾞレイテスト"

Data_57682:
	dstr "%d(に)"

Data_57688:
	dstr "(ちょうせんかのう)"

Data_57693:
	dstr "(しょしﾞきん) "

Data_5769d:
	dstr "%ldG"

Data_576a2:
	dstr "ロホﾞホﾟン(のかすﾞ) "

Data_576b0:
	dstr "%d"

Data_576b3:
	dstr "フﾟレイ(しﾞかん) "

Data_576bf:
	dstr ":"

Func_576c1:: ; 576c1 (15:76c1)
	push hl
	push de
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld b, $64
	call DivideAbyB
	push af
	add a
	add a
	ld d, a
	add a
	add a
	add a
	ld e, a
	add a
	add d
	add e
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	sub e
	ld b, $a
	call DivideAbyB
	ld l, a
	push hl
	ld hl, sp+$6
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	ld c, b
	pop hl
	pop af
	push hl
	inc a
	call GetHLAtSPPlus8
	ld [hl], a
	inc hl
	call WriteHLToSPPlus8
	pop hl
	ld a, l
	inc a
	call GetHLAtSPPlus6
	ld [hl], a
	inc hl
	call WriteHLToSPPlus6
	ld a, c
	inc a
	call GetHLAtSPPlus6
	ld [hl], a
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$2
	ld a, [hl]
	dec a
	ld hl, sp+$2
	ld [hl], a
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, sWarehouse
	add hl, de
	ld a, [hl]
	cp $ff
	jp nz, Func_5774d
	call GetHLAtSPPlus6
	ld [hl], $e0
	inc hl
	call WriteHLToSPPlus6
	jp Func_57756

Func_5774d: ; 5774d (15:774d)
	call GetHLAtSPPlus6
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus6
Func_57756: ; 57756 (15:7756)
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp c, Func_57774
	ld hl, sp+$2
	ld a, [hl]
	ld b, $8
	call DivideAbyB
	push af
	add a
	add a
	add a
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	sub e
	ld c, a
	pop af
	jp Func_57777

Func_57774: ; 57774 (15:7774)
	xor a
	ld c, $0
Func_57777: ; 57777 (15:7777)
	push af
	push bc
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop bc
	pop af
	ld e, a
	ld d, $0
	ld hl, wSaveScratchDexSeenFlags
	add hl, de
	ld a, [hl]
	ld b, c
	call RightShiftA
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_53b1e
	ld e, $0
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	or a
	jp nz, Func_577cf
	xor a
Func_577a8: ; 577a8 (15:77a8)
	cp $5
	jp nc, Func_577ba
	call GetHLAtSPPlus4
	ld [hl], $7d
	inc hl
	call WriteHLToSPPlus4
	inc a
	jp Func_577a8

Func_577ba: ; 577ba (15:77ba)
	call GetHLAtSPPlus4
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
	jp Func_5783a

Func_577cf: ; 577cf (15:77cf)
	ld hl, $6
	push hl
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	ld hl, sp+$2
	ld e, [hl]
	ld a, $6
	call Func_57ea2
	pop bc
	call GetHLAtSPPlus4
	call FindFirstNonzero
	ld a, l
	call GetHLAtSPPlus4
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus4
Func_577f2: ; 577f2 (15:77f2)
	cp $5
	jp nc, Func_57804
	call GetHLAtSPPlus4
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus4
	inc a
	jp Func_577f2

Func_57804: ; 57804 (15:7804)
	set_farcall_addrs_hli Func_53b1e
	ld e, $1
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	cp $1
	jp nz, Func_57828
	call GetHLAtSPPlus4
	ld [hl], $db
	inc hl
	call WriteHLToSPPlus4
	jp Func_57831

Func_57828: ; 57828 (15:7828)
	call GetHLAtSPPlus4
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus4
Func_57831: ; 57831 (15:7831)
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
Func_5783a: ; 5783a (15:783a)
	call GetHLAtSPPlus4
	pop bc
	pop bc
	ret

Func_57840:: ; 57840 (15:7840)
	ld de, Data_57871
	ld hl, $d01
	call PlaceStringDEatCoordHL
	ld a, [wc39c]
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $1102
	call Func_2230
	ld de, Data_5787b
	ld hl, $d04
	call PlaceStringDEatCoordHL
	ld a, [wc39d]
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $1105
	call Func_2230
	ret

Data_57871:
	dstr "(みつけたかすﾞ)"

Data_5787b:
	dstr "(つかまえたかすﾞ)"

Pointers_57886:
	dw Data_5789e
	dw Data_578a3
	dw Data_578a9
	dw Data_578af
	dw Data_578b5
	dw Data_578ba
	dw Data_578c1
	dw Data_578c7
	dw Data_578cc
	dw Data_578d2
	dw Data_578d7
	dw Data_578dc

Data_5789e:
	dstr "ノーマル"

Data_578a3:
	dstr "(ほのお)"

Data_578a9:
	dstr "(みすﾞ)"

Data_578af:
	dstr "(かせﾞ)"

Data_578b5:
	dstr "(つち)"

Data_578ba:
	dstr "(かみなり)"

Data_578c1:
	dstr "(こおり)"

Data_578c7:
	dstr "(せい)"

Data_578cc:
	dstr "(しﾞゃ)"

Data_578d2:
	dstr "(りく)"

Data_578d7:
	dstr "(うみ)"

Data_578dc:
	dstr "(そら)"

Data_578e1:
	db $21, $01, $03, $1f, $00, $00, $07, $07

Func_578e9::
	push hl
	add sp, -$60
	ld hl, sp+$60
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
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
	ld c, l
	push bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld l, a
	pop bc
	push bc
	push hl
	ld a, c
	and $7
	push af
	ld l, c
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wSaveScratchDexSeenFlags
	add hl, de
	ld a, [hl]
	pop bc
	call RightShiftA
	pop hl
	pop bc
	push af
	push hl
	push bc
	ld hl, $6
	push hl
	ld e, c
	ld a, $6
	ld hl, sp+$56
	ld c, l
	ld b, h
	call Func_57ea2
	pop bc
	pop bc
	push bc
	ld e, c
	ld hl, sp+$6
	call GetRobotBaseStats
	read_hl_from_sp_plus $34
	dec hl
	ld e, l
	ld hl, sp+$35
	ld [hl], e
	ld hl, sp+$b
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
	ld de, Text_66ea7
	add hl, de
	reg16swap de, hl
	ld hl, sp+$36
	ld bc, $7
	call FarCopyVideoData
	xor a
	pop bc
	push bc
	ld a, c
	ld b, $8
	call DivideAbyB
	ld e, a
	pop bc
	push bc
	ld a, e
	add a
	add a
	add a
	ld l, a
	ld a, c
	sub l
	ld c, a
	ld d, $0
	ld hl, wSaveScratchDexCaughtFlags
	add hl, de
	ld a, [hl]
	ld b, c
	call RightShiftA
	ld e, a
	ld a, e
	and $1
	ld e, a
	pop bc
	pop hl
	push bc
	push de
	ld a, l
	call GetSRAMBank
	pop de
	pop bc
	pop af
	and $1
	jp nz, Func_579a5
	ld hl, $4000
	jp Func_57b8e

Func_579a5: ; 579a5 (15:79a5)
	push de
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	ld hl, $400
	call malloc_Bank15
	pop bc
	push bc
	push hl
	reg16swap de, hl
	ld a, c
	ld bc, $89b0
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_7c8a
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $0
	ld c, $2
	call FarCall
	call WaitVideoTransfer
	pop hl
	call free_Bank15
	set_farcall_addrs_hli Func_615be
	pop bc
	push bc
	ld a, c
	call FarCall
	push af
	set_farcall_addrs_hli Func_613fc
	pop af
	ld e, a
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_57a1f
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_57a28
Func_57a1f: ; 57a1f (15:7a1f)
	ld de, $8
	ld hl, Data_578e1
	call Func_2b7d
Func_57a28: ; 57a28 (15:7a28)
	pop bc
	push bc
	ld b, $0
	inc bc
	ld de, $1
	ld hl, $9
	call Func_57bf1
	ld hl, sp+$52
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $f
	call Func_57e8d
	ld de, Data_57b99
	ld hl, $903
	call PlaceStringDEatCoordHL
	ld hl, sp+$34
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $f
	call Func_57e8d
	ld de, Data_57ba1
	ld hl, $905
	call PlaceStringDEatCoordHL
	ld hl, sp+$f
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld e, a
	ld hl, sp+$f
	ld a, [hl]
	and $f
	push af
	push de
	ld de, Data_57ba9
	ld hl, $907
	call PlaceStringDEatCoordHL
	ld de, Data_57bb2
	ld hl, $909
	call PlaceStringDEatCoordHL
	ld e, $9
	ld a, $f
	call SetStringStartState
	ld hl, sp+$37
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_57886
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_57bba
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $5
	ld a, $f
	call SetStringStartState
	pop de
	ld a, e
	cp $3
	jp z, Func_57ae0
	cp $2
	jp z, Func_57ad5
	cp $1
	jp z, Func_57aca
	or a
	jp nz, Func_57ae8
	ld hl, Data_57bbd
	push hl
	call PlaceString
	pop bc
	jp Func_57ae8

Func_57aca: ; 57aca (15:7aca)
	ld hl, Data_57bc3
	push hl
	call PlaceString
	pop bc
	jp Func_57ae8

Func_57ad5: ; 57ad5 (15:7ad5)
	ld hl, Data_57bc9
	push hl
	call PlaceString
	pop bc
	jp Func_57ae8

Func_57ae0: ; 57ae0 (15:7ae0)
	ld hl, Data_57bcf
	push hl
	call PlaceString
	pop bc
Func_57ae8: ; 57ae8 (15:7ae8)
	ld e, $7
	ld a, $f
	call SetStringStartState
	pop af
	cp $3
	jp z, Func_57b24
	cp $2
	jp z, Func_57b19
	cp $1
	jp z, Func_57b0e
	or a
	jp nz, Func_57b2c
	ld hl, Data_57bd7
	push hl
	call PlaceString
	pop bc
	jp Func_57b2c

Func_57b0e: ; 57b0e (15:7b0e)
	ld hl, Data_57bdd
	push hl
	call PlaceString
	pop bc
	jp Func_57b2c

Func_57b19: ; 57b19 (15:7b19)
	ld hl, Data_57be3
	push hl
	call PlaceString
	pop bc
	jp Func_57b2c

Func_57b24: ; 57b24 (15:7b24)
	ld hl, Data_57be9
	push hl
	call PlaceString
	pop bc
Func_57b2c: ; 57b2c (15:7b2c)
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $a
	call FarCall
	pop bc
	pop de
	ld a, e
	cp $1
	jp nz, Func_57b62
	push bc
	set_farcall_addrs_hli Func_61133
	pop bc
	ld e, c
	ld d, $0
	inc de
	ld hl, $10b
	call FarCall
Func_57b62: ; 57b62 (15:7b62)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $0
	call WaitAorBButtonOverworld_57ec5
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld hl, $8000
Func_57b8e: ; 57b8e (15:7b8e)
	reg16swap de, hl
	add sp, $62
	reg16swap de, hl
	ret

Data_57b99:
	dstr "(ふﾞそﾞく)"

Data_57ba1:
	dstr "(しんちょう)"

Data_57ba9:
	dstr "(たいしﾞゅう)"

Data_57bb2:
	dstr "(そﾞくせい)"

Data_57bba:
	dstr "%s"

Data_57bbd:
	dstr "(しょう)"

Data_57bc3:
	dstr "(ちゅう)"

Data_57bc9:
	dstr "(たﾞい)"

Data_57bcf:
	dstr "(きょたﾞい)"

Data_57bd7:
	dstr "(かるい)"

Data_57bdd:
	dstr "(ふつう)"

Data_57be3:
	dstr "(おもい)"

Data_57be9:
	dstr "(おもすきﾞ)"

Func_57bf1: ; 57bf1 (15:7bf1)
	push bc
	ld a, l
	and h
	inc a
	jp z, Func_57c02
	ld a, e
	and d
	inc a
	jp z, Func_57c02
	ld a, l
	call SetStringStartState
Func_57c02: ; 57c02 (15:7c02)
	pop bc
	ld l, c
	ld h, b
	ld de, 10
	call CompareHLtoDE
	jp nc, Func_57c1b
	push bc
	ld hl, Data_57c3e
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_57c3d

Func_57c1b: ; 57c1b (15:7c1b)
	ld l, c
	ld h, b
	ld de, 100
	call CompareHLtoDE
	jp nc, Func_57c33
	push bc
	ld hl, Data_57c43
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_57c3d

Func_57c33: ; 57c33 (15:7c33)
	push bc
	ld hl, Data_57c47
	push hl
	call PlaceString
	pop bc
	pop bc
Func_57c3d: ; 57c3d (15:7c3d)
	ret

Data_57c3e:
	dstr "00%d"

Data_57c43:
	dstr "0%d"

Data_57c47:
	dstr "%d"

Func_57c4a:: ; 57c4a (15:7c4a)
	add sp, -$24
	push de
	push af
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	callba_hli Func_da4dc
	call FillVisibleAreaWithBlankTile
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld l, a
	pop af
	push hl
	push af
	ld l, a
	ld h, 0
	get_party_bot
	reg16swap de, hl
	ld hl, sp+$6
	ld bc, $23
	call FarCopyVideoData
	pop af
	pop hl
	pop de
	push hl
	push de
	ld l, e
	ld h, 0
	get_party_bot
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call FarCopyVideoData
	pop de
	ld hl, sp+$2
	push hl
	ld l, e
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call FarCopyVideoData
	pop hl
	ld a, l
	call GetSRAMBank
	add sp, $24
	ret

Func_57cf7:: ; 57cf7 (15:7cf7)
	push de
	push bc
	push bc
	push bc
	push hl
	ld hl, sp+$2
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	pop de
	call Func_2617
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$2
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$3
	ld c, [hl]
	ld hl, sp+$4
	ld a, [hl]
	cp $80
	jp c, Func_57d24
	inc c
Func_57d24: ; 57d24 (15:7d24)
	inc c
	dec c
	jp nz, Func_57d3b
	call GetHLAtSPPlus10
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_57d3b
	ld c, $1
Func_57d3b: ; 57d3b (15:7d3b)
	pop hl
	ld e, c
	ld d, $0
	ld bc, $102
	call Func_57d4a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_57d4a: ; 57d4a (15:7d4a)
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push de
	push bc
	read_hl_from_sp_plus $12
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	read_hl_from_sp_plus $12
	ld de, $100
	call DivideHLByDESigned
	ld a, e
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	pop hl
	ld de, $100
	call DivideHLByDESigned
	ld a, e
	ld hl, sp+$4
	ld [hl], $96
	ld hl, sp+$5
	ld [hl], $90
	ld hl, sp+$c
	ld [hl], $91
	ld hl, sp+$6
	call WriteHLToSPPlus4
	ld c, $0
	pop de
	push af
Func_57d91: ; 57d91 (15:7d91)
	ld hl, -8
	add hl, de
	inc h
	dec h
	bit 7, h
	jr nz, .asm_57db2
	push de
	call GetHLAtSPPlus6
	ld [hl], $92
	inc hl
	call WriteHLToSPPlus6
	pop de
	ld hl, -8
	add hl, de
	reg16swap de, hl
	inc c
	jp Func_57db5

.asm_57db2
	jp Func_57db8

Func_57db5: ; 57db5 (15:7db5)
	jp Func_57d91

Func_57db8: ; 57db8 (15:7db8)
	ld a, e
	or d
	jp z, Func_57dcb
	inc c
	ld hl, $dd
	add hl, de
	ld a, l
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
Func_57dcb: ; 57dcb (15:7dcb)
	ld a, c
	cp $6
	jp nc, Func_57dde
	call GetHLAtSPPlus4
	ld [hl], $93
	inc hl
	call WriteHLToSPPlus4
	inc c
	jp Func_57dcb

Func_57dde: ; 57dde (15:7dde)
	pop af
	push af
	or a
	jp nz, Func_57dec
	ld a, $98
	ld [wBGMapHi], a
	jp Func_57df1

Func_57dec: ; 57dec (15:7dec)
	ld a, $9c
	ld [wBGMapHi], a
Func_57df1: ; 57df1 (15:7df1)
	pop af
	cp $2
	jp z, Func_57e16
	set_farcall_addrs_hli Func_6193
	ld bc, $901
	ld hl, sp+$2
	push hl
	read_hl_from_sp_plus $10
	pop de
	call FarCall
	call WaitVideoTransfer
	jp Func_57e2d

Func_57e16: ; 57e16 (15:7e16)
	read_hl_from_sp_plus $e
	call Coord2TileMap
	ld c, l
	ld b, h
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $9
	call CopyFromDEtoHL
Func_57e2d: ; 57e2d (15:7e2d)
	add sp, $e
	ret

malloc_Bank15:: ; 57e30 (15:7e30)
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	call FarCall
	ret

free_Bank15:: ; 57e41 (15:7e41)
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_57e52:: ; 57e52 (15:7e52)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	call GetHLAtSPPlus10
	ld c, l
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	ld h, l
	ld l, $0
	pop de
	add hl, de
	pop de
	call FarCall
	pop bc
	pop bc
	pop bc
	ret

GetBanks_15:: ; 57e7b (15:7e7b)
	push af
	push de
	set_farcall_addrs_hli GetBanks
	pop de
	pop af
	jp FarCall

Func_57e8d:: ; 57e8d (15:7e8d)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_16019
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_57ea2:: ; 57ea2 (15:7ea2)
	push de
	push bc
	push af
	set_farcall_addrs_hli GetName
	pop af
	call GetHLAtSPPlus8
	ld c, l
	pop hl
	push hl
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call FarCall
	pop bc
	pop bc
	ret

WaitAorBButtonOverworld_57ec5:: ; 57ec5 (15:7ec5)
	jpba_hli WaitAorBButtonOverworld_17a44

