lib_bank_20: MACRO
IF DEF(cbank) & DEF(scall)
PURGE scall
PURGE cbank
ENDC
cbank EQUS "\1"

scall: MACRO
label EQUS "\1_{cbank}"
	call label
PURGE label
	ENDM

ScriptLibrary_\1::
Func_80000_\1:
	jpba_hli Func_50d85

GetZodiacSign_\1:
	jpba_hli GetZodiacSign

Func_8001c_\1: ; 8001c (20:401c)
	callba_hli Func_ae4d
	ret

AllocateSpaceForWarps_\1: ; 8002b (20:402b)
	callba_hli AllocateSpaceForWarps
	ret

LoadWarps_\1: ; 8003a (20:403a)
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	xor a
.loop
	cp e
	jp nc, .done
	push de
	push af
	; bc = a * 11
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $12
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $b
	call CopyFromDEtoHL
	set_farcall_addrs_hli LoadWarp
	ld hl, sp+$4
	call FarCall
	pop af
	inc a
	pop de
	jp .loop

.done
	add sp, $e
	ret

Func_80080_\1: ; 80080 (20:4080)
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_a60f
	pop bc
	pop de
	pop af
	call FarCall
	ret

SpriteFace_\1: ; 80095 (20:4095)
	push af
	push de
	set_farcall_addrs_hli ChangePersonFacing
	pop de
	pop af
	call FarCall
	ld a, [rLCDC]
	and $80
	jp z, .skip
	call NextOverworldFrame
	call NextOverworldFrame
	call NextOverworldFrame
.skip
	ret

Func_800b8_\1:
	push af
	set_farcall_addrs_hli Func_50b19
	pop af
	jp FarCall

ChangeSprite_\1: ; 800c8
	push af
	push de
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld [hl], a
	pop bc
	pop bc
	ret

CheckObjectsOccupyingSameTile_\1:
	push af
	push de
	set_farcall_addrs_hli CheckObjectsOccupyingSameTile
	pop de
	pop af
	jp FarCall

LoadMapObjects_\1: ; 800fb (20:40fb)
	push hl
	add sp, -$e
	xor a
.loop
	cp e
	jp nc, .quit
	push de
	push af
	ld l, a
	ld h, $0
	add hl, hl
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
	read_hl_from_sp_plus $14
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $e
	call CopyFromDEtoHL
	set_farcall_addrs_hli LoadMapObject
	ld hl, sp+$4
	call FarCall
	pop af
	inc a
	pop de
	jp .loop

.quit
	add sp, $10
	ret

SetPersonVisibilityState_\1: ; 8013d (20:413d)
	push af
	push de
	set_farcall_addrs_hli SetPersonVisibilityState
	pop de
	pop af
	call FarCall
	ret

Func_80150_\1: ; 80150 (20:4150)
	push af
	push de
	set_farcall_addrs_hli Func_a580
	pop de
	pop af
	call FarCall
	ret

Func_80163_\1:
	push hl
	push de
	set_farcall_addrs_hli Func_a5a4
	pop de
	pop hl
	call FarCall
	ret

LoadEmote_\1: ; 80176 (20:4176)
	push af
	push de
	push bc
	set_farcall_addrs_hli LoadEmote
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_8018b_\1: ; 8018b (20:418b)
	callba_hli Func_da4fc
	callba_hli Func_9a87c
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ret

Func_801b8_\1:
	callba_hli Func_da4fc
	callba_hli Func_9a87c
	ret

Func_801d5_\1: ; 801d5 (20:41d5)
	callba_hli Func_9a84a
	ret

ShowEmote_\1: ; 801e4 (20:41e4)
	push af
	push de
	set_farcall_addrs_hli ShowEmote
	pop de
	pop af
	call FarCall
	ret

Func_801f7_\1: ; 801f7 (20:41f7)
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_b01b
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_8020c_\1: ; 8020c (20:420c)
	callba_hli Func_b3ab
	ret

NamingScreen_\1: ; 8021b (20:421b)
	push af
	callba_hli Func_da4dc
	callba_hli Func_d9f55
	set_farcall_addrs_hli NamingScreen__
	pop af
	call FarCall
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ret

Func_80257_\1:
	callba_hli Func_14d93
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ret

Func_80275_\1:
	ld a, $3
	ld [wc39a], a
	callba_hli Func_14ca9
	ret

Func_80289_\1:
	callba_hli Func_17470
	callba_hli Func_14940
	callba_hli Func_17488
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ret

AskRepairRobots_\1:
	callba_hli AskRepairRobots
	callba_hli Func_8f44
	ret

RepairRobots_\1: ; 802e0
	callba_hli RepairRobots
	ret

Func_802ef_\1:
	push bc
	push hl
	ld hl, sp+$2
	ld [hl], $1
	pop hl
	ld a, [wc793]
	or a
	jp z, Func_8030d_\1
	ld a, [wc793]
	cp $1
	jp z, Func_8030d_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_80341_\1
Func_8030d_\1: ; 8030d (20:430d)
	push hl
	push de
	set_farcall_addrs_hli Func_bc6d
	pop de
	pop hl
	ld c, e
	ld b, d
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	or a
	jp z, Func_80332_\1
	ld hl, sp+$0
	ld [hl], $0
	jp Func_80341_\1

Func_80332_\1: ; 80332 (20:4332)
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
Func_80341_\1: ; 80341 (20:4341)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_80347_\1:
	push bc
	push hl
	ld hl, sp+$2
	ld [hl], $1
	pop hl
	ld a, [wc793]
	or a
	jp z, Func_80364_\1
	ld a, [wc793]
	cp $1
	jp z, Func_80364_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_80398_\1
Func_80364_\1: ; 80364 (20:4364)
	push hl
	push de
	set_farcall_addrs_hli Func_bd5d
	pop de
	pop hl
	ld c, e
	ld b, d
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	or a
	jp z, Func_80389_\1
	ld hl, sp+$0
	ld [hl], $0
	jp Func_80398_\1

Func_80389_\1: ; 80389 (20:4389)
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
Func_80398_\1: ; 80398 (20:4398)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_8039e_\1:
	push bc
	push hl
	ld hl, sp+$2
	ld [hl], $1
	pop hl
	ld a, [wc793]
	or a
	jp z, Func_803bb_\1
	ld a, [wc793]
	cp $1
	jp z, Func_803bb_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_803ef_\1
Func_803bb_\1: ; 803bb (20:43bb)
	push hl
	push de
	set_farcall_addrs_hli Func_bce5
	pop de
	pop hl
	ld c, e
	ld b, d
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	or a
	jp z, Func_803e0_\1
	ld hl, sp+$0
	ld [hl], $0
	jp Func_803ef_\1

Func_803e0_\1: ; 803e0 (20:43e0)
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
Func_803ef_\1: ; 803ef (20:43ef)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_803f5_\1:
	push bc
	push hl
	ld hl, sp+$2
	ld [hl], $1
	pop hl
	ld a, [wc793]
	or a
	jp z, Func_80412_\1
	ld a, [wc793]
	cp $1
	jp z, Func_80412_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_80446_\1
Func_80412_\1: ; 80412 (20:4412)
	push hl
	push de
	set_farcall_addrs_hli Func_bdd5
	pop de
	pop hl
	ld c, e
	ld b, d
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	or a
	jp z, Func_80437_\1
	ld hl, sp+$0
	ld [hl], $0
	jp Func_80446_\1

Func_80437_\1: ; 80437 (20:4437)
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
Func_80446_\1: ; 80446 (20:4446)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

FacePlayer_\1: ; 8044b (20:444b)
	push af
	set_farcall_addrs_hli FacePlayer
	pop af
	call FarCall
	ret

Func_8045c_\1:
	callba_hli Func_14b44
	callba_hli Func_8f44
	ret

Func_80479_\1:
	callba_hli Func_53c88
	ret

Func_80488_\1:
	push hl
	set_farcall_addrs_hli Func_6e1b
	pop hl
	jp FarCall

PrintTextStandard_\1: ; 80498 (20:4498)
	push hl
	set_farcall_addrs_hli PrintOverworldTextIndexUnadorned
	pop hl
	call FarCall
	ret

PrintTextWithNPCName_\1: ; 804a9 (20:44a9)
	push hl
	set_farcall_addrs_hli PrintOverworldTextIndexWithNPCName
	pop hl
	call FarCall
	ret

PrintTextWithYesNoBox_\1: ; 804ba (20:44ba)
	push hl
	set_farcall_addrs_hli PrintOverworldTextIndexWithYesNoBox
	pop hl
	jp FarCall

PrintTextWithNPCNameAndYesNoBox_\1: ; 804ca (20:44ca)
	push hl
	set_farcall_addrs_hli PrintOverworldTextIndexWithNPCNameAndYesNoBox
	pop hl
	jp FarCall

Func_804da_\1:
	push hl
	set_farcall_addrs_hli AllocateMemory
	ld hl, $154
	call FarCall
	ld c, l
	ld b, h
	pop hl
	push bc
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call CopyUntilNull
	set_farcall_addrs_hli Func_ac35
	pop bc
	push bc
	ld l, c
	ld h, b
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ret

Func_80519_\1: ; 80519 (20:4519)
	push bc
	push bc
	push bc
	push bc
	push bc
	push hl
	push de
	set_farcall_addrs_hli AllocateMemory
	ld hl, $154
	call FarCall
	ld c, l
	ld b, h
	pop de
	push bc
	ld l, c
	ld h, b
	call CopyUntilNull
	pop bc
	pop hl
	push bc
	reg16swap de, hl
	ld hl, sp+$2
	call CopyUntilNull
	set_farcall_addrs_hli Func_ac36
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, sp+$2
	call FarCall
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_8056f_\1:
	push hl
	set_farcall_addrs_hli AllocateMemory
	ld hl, $154
	call FarCall
	ld c, l
	ld b, h
	pop hl
	push bc
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call CopyUntilNull
	set_farcall_addrs_hli Func_ac9b
	pop bc
	push bc
	ld l, c
	ld h, b
	call FarCall
	pop bc
	push af
	push bc
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	pop af
	ret

Func_805b2_\1: ; 805b2 (20:45b2)
	push bc
	push bc
	push bc
	push bc
	push bc
	push hl
	push de
	set_farcall_addrs_hli AllocateMemory
	ld hl, $154
	call FarCall
	ld c, l
	ld b, h
	pop de
	push bc
	ld l, c
	ld h, b
	call CopyUntilNull
	pop bc
	pop hl
	push bc
	reg16swap de, hl
	ld hl, sp+$2
	call CopyUntilNull
	set_farcall_addrs_hli Func_aca4
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, sp+$2
	call FarCall
	pop bc
	push af
	push bc
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	pop af
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_8060c_\1:
	callba_hli Func_ac37
	ret

EventFlagAction_\1: ; 8061b (20:461b)
	push hl
	push de
	set_farcall_addrs_hli EventFlagAction
	pop de
	pop hl
	call FarCall
	ret

CheckEventFlag_\1: ; 8062e (20:462e)
	push hl
	set_farcall_addrs_hli CheckEventFlag
	pop hl
	jp FarCall

MovePlayer_\1: ; 8063e (20:463e)
	push af
	push de
	push bc
	set_farcall_addrs_hli StartMovement
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_80653_\1: ; 80653 (20:4653)
	push af
	set_farcall_addrs_hli Func_b52c
	pop af
	call FarCall
	ret

Func_80664_\1: ; 80664 (20:4664)
	push af
	push de
	set_farcall_addrs_hli SpawnPlayerAt
	pop de
	pop af
	call FarCall
	ret

PlayerFace_\1: ; 80677 (20:4677)
	push af
	set_farcall_addrs_hli Func_b58e
	pop af
	call FarCall
	ret

Func_80688_\1: ; 80688 (20:4688)
	call Func_801f7_\1
	call Func_8020c_\1
	ret

ScriptSleep_\1: ; 8068f (20:468f)
	push hl
	set_farcall_addrs_hli Func_b5db
	pop hl
	call FarCall
	ret

Func_806a0_\1:
	push de
	ld [wc2f8], a
	set_farcall_addrs_hli Func_30348
	pop de
	push de
	ld a, e
	call FarCall
	pop de
	ld a, e
	cp $3
	jp c, Func_806ce_\1
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	jp Func_806dc_\1

Func_806ce_\1: ; 806ce (20:46ce)
	callba_hli Func_8f44
Func_806dc_\1: ; 806dc (20:46dc)
	ret

Func_806dd_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_80796_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	checkevent $c8
	or a
	jp nz, Func_80732_\1
	writenpctext TreeBitstreamText_471e4
	setevent $c8
	jp Func_80796_\1

Func_80732_\1: ; 80732 (20:4732)
	pop hl
	push hl
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld c, [hl]
	pop hl
	push hl
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and c
	jp z, Func_8075a_\1
	writenpctext TreeBitstreamText_472b9
	jp Func_80796_\1

Func_8075a_\1: ; 8075a (20:475a)
	writenpctext_yesorno TreeBitstreamText_4725f
	or a
	jp nz, Func_80796_\1
	set_farcall_addrs_hli Func_9ace0
	pop hl
	push hl
	inc hl
	inc hl
	ld c, [hl]
	pop hl
	push hl
	ld a, [hl]
	pop hl
	push hl
	inc hl
	ld e, [hl]
	call FarCall
	cp $2
	jp nz, Func_8078c_\1
	writetext TreeBitstreamText_4728d
	jp Func_80796_\1

Func_8078c_\1: ; 8078c (20:478c)
	or a
	jp nz, Func_80796_\1
	writetext TreeBitstreamText_472ce
Func_80796_\1: ; 80796 (20:4796)
	pop bc
	pop bc
	ret

Func_80799_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, e
	or a
	jp nz, Func_8085c_\1
	push bc
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$5
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
Func_807e7_\1: ; 807e7 (20:47e7)
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_8081a_\1
	ld hl, sp+$2
	ld [hl], $fe
	jp Func_8081d_\1

Func_8081a_\1: ; 8081a (20:481a)
	jp Func_80828_\1

Func_8081d_\1: ; 8081d (20:481d)
	ld hl, sp+$2
	ld a, [hl]
	add $2
	ld hl, sp+$2
	ld [hl], a
	jp Func_807e7_\1

Func_80828_\1: ; 80828 (20:4828)
	pop bc
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	inc hl
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_80519_\1
	ld hl, sp+$0
	ld a, [hl]
	add $2
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld [hl], a
Func_8085c_\1: ; 8085c (20:485c)
	pop bc
	pop bc
	ret

PrintTextFacePlayer_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_808f9_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld c, [hl]
Func_808ad_\1: ; 808ad (20:48ad)
	pop hl
	push hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp nz, Func_808c4_\1
	ld c, $ff
	jp Func_808c7_\1

Func_808c4_\1: ; 808c4 (20:48c4)
	jp Func_808cb_\1

Func_808c7_\1: ; 808c7 (20:48c7)
	inc c
	jp Func_808ad_\1

Func_808cb_\1: ; 808cb (20:48cb)
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextStandard_\1
	pop bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld e, c
	inc e
	ld [hl], e
Func_808f9_\1: ; 808f9 (20:48f9)
	pop bc
	pop bc
	ret

Func_808fc_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_80996_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld c, [hl]
Func_8094a_\1: ; 8094a (20:494a)
	pop hl
	push hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp nz, Func_80961_\1
	ld c, $ff
	jp Func_80964_\1

Func_80961_\1: ; 80961 (20:4961)
	jp Func_80968_\1

Func_80964_\1: ; 80964 (20:4964)
	inc c
	jp Func_8094a_\1

Func_80968_\1: ; 80968 (20:4968)
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithNPCName_\1
	pop bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld e, c
	inc e
	ld [hl], e
Func_80996_\1: ; 80996 (20:4996)
	pop bc
	pop bc
	ret

Func_80999_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_80a79_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp z, Func_80a5d_\1
	or a
	jp nz, Func_80a79_\1
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_805b2_\1
	or a
	jp nz, Func_80a3e_\1
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_80519_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld [hl], $1
	jp Func_80a5a_\1

Func_80a3e_\1: ; 80a3e (20:4a3e)
	pop hl
	push hl
	ld de, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	ld de, $8
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_80519_\1
Func_80a5a_\1: ; 80a5a (20:4a5a)
	jp Func_80a79_\1

Func_80a5d_\1: ; 80a5d (20:4a5d)
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_80519_\1
Func_80a79_\1: ; 80a79 (20:4a79)
	pop bc
	pop bc
	ret

PrintTextFacePlayerYesOrNo_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_80b2a_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp z, Func_80b1c_\1
	or a
	jp nz, Func_80b2a_\1
	pop hl
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithYesNoBox_\1
	or a
	jp nz, Func_80b09_\1
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextStandard_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld [hl], $1
	jp Func_80b19_\1

Func_80b09_\1: ; 80b09 (20:4b09)
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextStandard_\1
Func_80b19_\1: ; 80b19 (20:4b19)
	jp Func_80b2a_\1

Func_80b1c_\1: ; 80b1c (20:4b1c)
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextStandard_\1
Func_80b2a_\1: ; 80b2a (20:4b2a)
	pop bc
	pop bc
	ret

Func_80b2d_\1:
	push af
	push bc
	push de
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	or a
	jp nz, Func_80bdb_\1
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call SpriteFace_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp z, Func_80bcd_\1
	or a
	jp nz, Func_80bdb_\1
	pop hl
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithNPCNameAndYesNoBox_\1
	or a
	jp nz, Func_80bba_\1
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithNPCName_\1
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	ld [hl], $1
	jp Func_80bca_\1

Func_80bba_\1: ; 80bba (20:4bba)
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithNPCName_\1
Func_80bca_\1: ; 80bca (20:4bca)
	jp Func_80bdb_\1

Func_80bcd_\1: ; 80bcd (20:4bcd)
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PrintTextWithNPCName_\1
Func_80bdb_\1: ; 80bdb (20:4bdb)
	pop bc
	pop bc
	ret

Func_80bde_\1:
	push af
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	ld [wc846], a
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wc847], a
	ld a, $ff
	ld [wc848], a
	ld a, $ff
	ld [wc849], a
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_80c5a_\1
	cp $2
	jp z, Func_80c50_\1
	cp $1
	jp z, Func_80c46_\1
	or a
	jp nz, Func_80c61_\1
	ld a, [wc847]
	dec a
	ld [wc847], a
	jp Func_80c61_\1

Func_80c46_\1: ; 80c46 (20:4c46)
	ld a, [wc846]
	inc a
	ld [wc846], a
	jp Func_80c61_\1

Func_80c50_\1: ; 80c50 (20:4c50)
	ld a, [wc847]
	inc a
	ld [wc847], a
	jp Func_80c61_\1

Func_80c5a_\1: ; 80c5a (20:4c5a)
	ld a, [wc846]
	dec a
	ld [wc846], a
Func_80c61_\1: ; 80c61 (20:4c61)
	set_farcall_addrs_hli CheckBackgroundCollision
	ld c, $1
	ld a, [wc847]
	ld e, a
	ld a, [wc846]
	call FarCall
	or a
	jp nz, Func_80c91_\1
	ld a, $33
	call OverworldPlaySFX
	ld bc, wc846
	ld e, BANK(ScriptLibrary_\1)
	ld hl, sp+$1
	ld a, [hl]
	call Func_801f7_\1
	ld a, $1
	jp Func_80c92_\1

Func_80c91_\1: ; 80c91 (20:4c91)
	xor a
Func_80c92_\1: ; 80c92 (20:4c92)
	pop bc
	ret

Func_80c94_\1: ; 80c94 (20:4c94)
	push af
	set_farcall_addrs_hli Func_e2780
	pop af
	call FarCall
	ret

Func_80ca5_\1:
	push af
	set_farcall_addrs_hli Func_e2829
	pop af
	jp FarCall

Func_80cb5_\1:
	push af
	set_farcall_addrs_hli Func_e2807
	pop af
	call FarCall
	ret

Func_80cc6_\1: ; 80cc6 (20:4cc6)
	push af
	set_farcall_addrs_hli Func_be77
	pop af
	call FarCall
	ret

Func_80cd7_\1:
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	jp FarCall

Func_80ce7_\1: ; 80ce7 (20:4ce7)
	push hl
	push de
	set_farcall_addrs_hli Func_9b262
	pop de
	pop hl
	ld c, e
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	ret

Func_80d01_\1: ; 80d01 (20:4d01)
	push af
	ld a, [wc793]
	or a
	jp z, Func_80d11_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_80d22_\1
Func_80d11_\1: ; 80d11 (20:4d11)
	set_farcall_addrs_hli Func_b785
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
Func_80d22_\1: ; 80d22 (20:4d22)
	pop bc
	ret

LoadEncounters_\1: ; 80d24 (20:4d24)
	ld a, [wc793]
	or a
	jp z, .okay
	ld a, [wc793]
	cp $3
	jp nz, .quit
.okay
	push hl
	push de
	set_farcall_addrs_hli LoadEncounterTable
	pop de
	pop hl
	ld c, e
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
.quit
	ret

Func_80d4d_\1:
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_5a0e0
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_80d62_\1:
	push af
	push de
	set_farcall_addrs_hli Func_4ed5d
	pop de
	pop af
	jp FarCall

Func_80d74_\1:
	push af
	push de
	set_farcall_addrs_hli Func_6af0d
	pop de
	pop af
	inc a
	jp FarCall

GiveRobot_\1: ; 80d87 (20:4d87)
	push af
	push de
	push bc
	set_farcall_addrs_hli GiveRobot
	pop bc
	pop de
	pop af
	jp FarCall

Func_80d9b_\1: ; 80d9b (20:4d9b)
	push hl
	set_farcall_addrs_hli Func_e3714
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld c, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld h, [hl]
	ld b, h
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, a
	push hl
	call GetHLAtSPPlus4
	ld a, [hl]
	call GetHLAtSPPlus4
	inc hl
	ld l, [hl]
	ld h, a
	pop de
	call FarCall
	pop bc
	ret

ScriptedBattle_\1: ; 80dd3 (20:4dd3)
	ld a, [wc793]
	or a
	jp z, Func_80de2_\1
	ld a, [wc793]
	cp $3
	jp nz, Func_80dfd_\1
Func_80de2_\1: ; 80de2 (20:4de2)
	push hl
	push de
	set_farcall_addrs_hli StartBattle
	pop de
	pop hl
	ld c, e
	ld b, d
	reg16swap de, hl
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	ld l, a
Func_80dfd_\1: ; 80dfd (20:4dfd)
	ld a, l
	ret

Func_80dff_\1: ; 80dff (20:4dff)
	push de
	push af
	push bc
	set_farcall_addrs_hli Func_af7a
	pop bc
	pop af
	ld hl, sp+$4
	ld l, [hl]
	ld h, c
	ld e, l
	ld d, h
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call FarCall
	pop bc
	ret

Func_80e1e_\1: ; 80e1e (20:4e1e)
	push af
	push de
	set_farcall_addrs_hli HandlePlayerStep
	pop de
	pop af
	call FarCall
	ret

Func_80e31_\1:
	push hl
	push de
	set_farcall_addrs_hli Func_6b94
	pop de
	pop hl
	call FarCall
	ret

Func_80e44_\1:
	set_farcall_addrs_hli Func_9f64
	ld a, [wMapY]
	add $4
	ld e, a
	ld a, [wMapX]
	add $5
	jp FarCall

Func_80e5d_\1:
	push af
	set_farcall_addrs_hli Func_e1f2d
	pop af
	jp FarCall

Func_80e6d_\1:
	push af
	set_farcall_addrs_hli Func_6aad4
	pop af
	jp FarCall

Func_80e7d_\1:
	push af
	set_farcall_addrs_hli Func_6ab29
	pop af
	jp FarCall

Func_80e8d_\1:
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_e1513
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_80ea2_\1: ; 80ea2 (20:4ea2)
	callba_hli Func_9d3e
	ret

Func_80eb1_\1: ; 80eb1 (20:4eb1)
	callba_hli Func_9d4d
	ret

Func_80ec0_\1:
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $7
	call FarCall
	push hl
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	pop hl
	ld a, l
	ret

PlayMusic_\1: ; 80ee6 (20:4ee6)
	push af
	ld a, [wMapMusic]
	ld hl, sp+$1
	cp [hl]
	jp z, .nope
	ld hl, sp+$1
	ld a, [hl]
	call OverworldPlaySong
	ld hl, sp+$1
	ld a, [hl]
	ld [wMapMusic], a
.nope
	pop bc
	ret

PlaySFX_\1: ; 80efe (20:4efe)
	call OverworldPlaySFX
	ret

Func_80f02_\1: ; 80f02 (20:4f02)
	callba_hli Func_8f44
	ret

Func_80f11_\1: ; 80f11 (20:4f11)
	push hl
	set_farcall_addrs_hli Func_bf39
	pop de
	ld a, BANK(ScriptLibrary_\1)
	call FarCall
	ret

Func_80f24_\1:
	push de
	push bc
	push af
	set_farcall_addrs_hli Func_e3619
	pop af
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call FarCall
	pop bc
	pop bc
	ret

Func_80f43_\1:
	push af
	set_farcall_addrs_hli Func_bf46
	pop af
	call FarCall
	ret

Func_80f54_\1:
	callba_hli Func_b65f
	ret

Func_80f63_\1:
	callba_hli Func_b6f2
	ret

Func_80f72_\1:
	push hl
	set_farcall_addrs_hli Func_9a1bb
	pop hl
	call FarCall
	ret

Func_80f83_\1:
	push hl
	set_farcall_addrs_hli Func_9a28c
	pop hl
	call FarCall
	ret

Func_80f94_\1:
	push hl
	set_farcall_addrs_hli Func_93370
	pop hl
	call FarCall
	ret

Func_80fa5_\1:
	push hl
	add sp, -$66
	set_farcall_addrs_hli Func_1c11
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $66
	call FarCall
	set_farcall_addrs_hli Func_1c27
	ld hl, sp+$0
	push hl
	read_hl_from_sp_plus $6a
	pop de
	call FarCall
	reg16swap de, hl
	add sp, $68
	reg16swap de, hl
	ret

Func_80fe0_\1:
	push af
	set_farcall_addrs_hli Func_333ba
	pop af
	call FarCall
	ret

FadeOutAudio_\1: ; 80ff1 (20:4ff1)
; a = frames per tick (8 ticks total)
	push af
	ld l, $0
.loop
	ld a, l
	cp $8
	jp nc, .done
	push hl
	xor a
.wait
	ld hl, sp+$3
	cp [hl]
	jp nc, .next
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp .wait

.next
	pop hl
	push hl
	ld a, $7
	sub l
	call SetVolume
	pop hl
	inc l
	jp .loop

.done
	pop bc
	ret

FadeInAudio_\1: ; 8101a (20:501a)
; a = frames per tick (8 ticks total)
	push af
	xor a
.loop
	cp $8
	jp nc, .done
	push af
	xor a
.wait
	ld hl, sp+$3
	cp [hl]
	jp nc, .next
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp .wait

.next
	pop af
	push af
	call SetVolume
	pop af
	inc a
	jp .loop

.done
	pop bc
	ret

Func_8103e_\1:
	push af
	set_farcall_addrs_hli Func_6ae47
	pop af
	call FarCall
	ret

Func_8104f_\1:
	callba_hli Func_6ac44
	cp $ff
	jp nz, Func_81071_\1
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
Func_81071_\1: ; 81071 (20:5071)
	ret

Func_81072_\1:
	callba_hli Func_6b31a
	ret

Func_81081_\1:
	push hl
	push de
	set_farcall_addrs_hli Func_c796a
	pop de
	pop hl
	call FarCall
	ret

Func_81094_\1:
	callba_hli Func_53b6e
	ret

Func_810a3_\1:
	push af
	set_farcall_addrs_hli Func_fb55f
	pop af
	call FarCall
	ret
ENDM
