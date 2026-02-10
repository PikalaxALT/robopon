INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 18", ROMX
Func_60000: ; 60000 (18:4000)
	ret

Func_60001:: ; 60001 (18:4001)
	; c = 0: start cursor at (a, e)
	inc c
	dec c
	jp nz, .dont_do_callback
	ld [wBlinkerX], a
	ld a, e
	ld [wBlinkerY], a
	ld a, BANK(BlinkTextCursor)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, BlinkTextCursor
	write_hl_to wVBlankCallbackAddress
	call WaitVideoTransfer
	ld a, $3
	ld [wc24d], a
	ld a, $bc
	ld [wTextBlinkerFrameCounter], a
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	jp .done

.dont_do_callback
	; clobber a
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8f00 ; clobbers e
	add hl, de
	ld c, l
	ld b, h
	ld a, [wBlinkerY]
	ld e, a
	ld a, [wBlinkerX]
	ld d, a
	ld a, [wBlinkerY]
	ld l, a
	ld a, [wBlinkerX]
	ld h, a
	call FarCall
	ld a, $4
	ld [wc24d], a
	call WaitVideoTransfer
.done
	ret

StartCursorBlinking: ; 60075 (18:4075)
	push af
	ld a, $8a
	ld [wBlinkerOffTile], a
	ld hl, sp+$1 ; get previous value of a without popping flags (clobbers hl)
	ld a, [hl]
	and $80
	jp nz, .bit_7
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	jp .okay

.bit_7
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
.okay
	ld hl, sp+$1
	ld a, [hl]
	and $1
	jp nz, .okay2
	ld c, $0
	ld e, $10
	ld a, $12
	call Func_60001
.okay2
	xor a
	ld [wTimerCounter], a
.loop
	call CheckButton
	ld e, a
	inc e
	dec e
	jp nz, .check_bits_4_5
	ld hl, sp+$1
	ld a, [hl]
	and $1
	jp z, .next
	ld a, [wTimerCounter]
	cp $1e
	jp c, .next
	jp .done

.next
	jp .loop

.check_bits_4_5
	ld a, e
	and $30
	jp z, .next2
	jp .done

.next2
	jp .loop

.done
	push de
	ld hl, sp+$3
	ld a, [hl]
	and $1
	jp nz, .skip
	ld c, $1
	ld e, $10
	ld a, $12
	call Func_60001
.skip
	pop de
	ld a, e
	pop bc
	ret

Func_600f4: ; 600f4 (18:40f4)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_60109: ; 60109 (18:4109)
	push af
	push de
	set_farcall_addrs_hli Func_e015
	pop de
	pop af
	call FarCall
	ret

Func_6011c: ; 6011c (18:411c)
	push hl
	push de
	push bc
	set_farcall_addrs_hli PrintMapText ; same bank
	pop bc
	ld a, c
	and $e0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, c
	and $1f
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	pop bc
	ret

Func_6014a: ; 6014a (18:414a)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_6015e: ; 6015e (18:415e)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_60172: ; 60172
	callba_hli Func_6fe0
	ret

Func_60181: ; 60181 (18:4181)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_601a6
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_6015e
	jp Func_601b4

Func_601a6: ; 601a6 (18:41a6)
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_6014a
Func_601b4: ; 601b4 (18:41b4)
	pop bc
	ret

Func_601b6: ; 601b6
	callba_hli AllocateMonsterStruct
	ret

Func_601c5: ; 601c5
	callba_hli FreeMonsterStruct
	ret

Func_601d4: ; 601d4 (18:41d4)
	callba_hli DoBattle
	ret

Data_601e3: ; 601e3
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

Data_601eb: ; 601eb
	db $00, $00, $00, $00, $00, $00

Data_601f1: ; 601f1
	db $ca, $de, $c4, $db, $ce, $de, $28, $bc, $ae, $b3, $cc, $de, $a6, $20, $b2, $c4, $de, $dd, $c3, $de, $b7, $c0, $21, $29, $00

Func_6020a: ; 6020a (18:420a)
	ld hl, -$86
	add hl, sp
	ld sp, hl
	ld hl, sp+$7e
	reg16swap de, hl
	ld hl, Data_601e3
	ld bc, $8
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_601eb
	ld bc, $6
	call MemCopy
	ld hl, sp+$b
	pop de
	push hl
	ld hl, Data_601f1
	call WriteHLToSPPlus4
	ld hl, $0
	call WriteHLToSPPlus6
	ld e, $c5
	ld a, $c5
	call Func_60109
	call FillVisibleAreaWithBlankTile
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6037e
	ld hl, sp+$7e
	write_hl_to_sp_plus $7d
	ld c, $0
Func_60268: ; 60268 (18:4268)
	ld a, c
	cp $4
	jp nc, Func_6037b
	ldh a, [hSRAMBank]
	push af
	push bc
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	ld hl, sp+$5c
	push hl
	ld l, c
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	pop af
	push bc
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$5a
	reg16swap de, hl
	ld hl, $1
	call Func_6015e
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_60302
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	reg16swap de, hl
	ld hl, $23
	call Func_6015e
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $7f
	ld [hl], a
	ld hl, sp+$5b
	reg16swap de, hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_60302: ; 60302 (18:4302)
	push bc
	ld c, $1
	ld hl, sp+$5a
	reg16swap de, hl
	ld hl, $1
	call Func_6014a
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_6036e
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	reg16swap de, hl
	ld hl, $23
	call Func_6014a
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $7f
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$5b
	reg16swap de, hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_6036e: ; 6036e (18:436e)
	inc c
	read_hl_from_sp_plus $7d
	inc hl
	write_hl_to_sp_plus $7d
	jp Func_60268

Func_6037b: ; 6037b (18:437b)
	jp Func_60499

Func_6037e: ; 6037e (18:437e)
	ld hl, sp+$7e
	write_hl_to_sp_plus $7d
	ld c, $0
Func_60386: ; 60386 (18:4386)
	ld a, c
	cp $4
	jp nc, Func_60499
	push bc
	ld c, $1
	ld hl, sp+$5a
	reg16swap de, hl
	ld hl, $1
	call Func_6014a
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_603f8
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	reg16swap de, hl
	ld hl, $23
	call Func_6014a
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $7f
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$5b
	reg16swap de, hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_603f8: ; 603f8 (18:43f8)
	ldh a, [hSRAMBank]
	push af
	push bc
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	ld hl, sp+$5c
	push hl
	ld l, c
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	pop af
	push bc
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$5a
	reg16swap de, hl
	ld hl, $1
	call Func_6015e
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_6048c
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	reg16swap de, hl
	ld hl, $23
	call Func_6015e
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $7f
	ld [hl], a
	ld hl, sp+$5b
	reg16swap de, hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_6048c: ; 6048c (18:448c)
	inc c
	read_hl_from_sp_plus $7d
	inc hl
	write_hl_to_sp_plus $7d
	jp Func_60386

Func_60499: ; 60499 (18:4499)
	call ClearSprites
	ld hl, sp+$7e
	reg16swap de, hl
	xor a
	ld hl, sp+$7d
	ld [hl], a
Func_604a6: ; 604a6 (18:44a6)
	cp $8
	jp nc, Func_604e7
	push af
	ld a, [de]
	cp $ff
	jp z, Func_604e1
	push de
	set_farcall_addrs_hli LoadSpriteGFX
	pop de
	push de
	ld a, [de]
	ld e, a
	ld d, $0
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld e, $0
	ld c, $4
	call FarCall
	pop de
Func_604e1: ; 604e1 (18:44e1)
	pop af
	inc a
	inc de
	jp Func_604a6

Func_604e7: ; 604e7 (18:44e7)
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld hl, sp+$7e
	ld c, l
	ld b, h
	ld e, $0
	ld hl, sp+$7d
	ld [hl], e
Func_604ff: ; 604ff (18:44ff)
	ld a, e
	cp $8
	jp nc, Func_60556
	push bc
	ld a, [bc]
	cp $ff
	jp z, Func_60550
	push de
	ld a, e
	ld b, $4
	call DivideAbyB
	add a
	add a
	add a
	add a
	add a
	add a
	add a
	add $10
	ld l, a
	pop de
	push de
	push hl
	ld a, e
	and $3
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	push af
	set_farcall_addrs_hli UpdateCurSprite
	pop af
	pop hl
	ld d, l
	ld e, a
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
	dec a
	add a
	add a
	ld bc, $200
	call FarCall
	pop de
Func_60550: ; 60550 (18:4550)
	inc e
	pop bc
	inc bc
	jp Func_604ff

Func_60556: ; 60556 (18:4556)
	callba_hli QueueMoveAnimScriptGFXUpdate
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_605be
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveScratchPlayerName
	ld hl, sp+$8
	call CopyUntilNull
	pop af
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $5
	call Func_6015e
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $5
	call Func_6014a
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, sp+$b
	call LiteralStringInTree
	dec hl
	jp Func_605fc

Func_605be: ; 605be (18:45be)
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $5
	call Func_6014a
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, sp+$b
	call LiteralStringInTree
	dec hl
	push hl
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveScratchPlayerName
	ld hl, sp+$a
	call CopyUntilNull
	pop af
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $5
	call Func_6015e
	pop hl
Func_605fc: ; 605fc (18:45fc)
	ld de, Data_60619
	call CopyUntilNull
	ld c, $98
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call Func_6011c
	call Func_60181
	ld hl, $86
	add hl, sp
	ld sp, hl
	ret

Data_60619: ; 60619
	dstr " (かﾞ)"

INCLUDE "engine/map_text_18.asm"

Func_6086c:: ; 6086c (18:486c)
	push hl
	push de
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $1e
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $1c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $23
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $23
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $a
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $27
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $25
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop bc
	ret

Func_6095c: ; 6095c (18:495c)
	push hl
	push de
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	pop de
	push hl
	ld hl, sp+$2
	ld l, [hl]
	push hl
	call GetHLAtSPPlus8
	pop de
	call GetRobotOrTrainerBaseStats
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus8
	ld e, a
	call Func_6086c
	pop af
	call GetHLAtSPPlus6
	ld de, $13
	add hl, de
	ld [hl], a
	ld c, $0
Func_60994: ; 60994 (18:4994)
	ld a, c
	cp $3
	jp nc, Func_609b4
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $14
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	jp Func_60994

Func_609b4: ; 609b4 (18:49b4)
	pop hl
	push hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $2e
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $17
	add hl, de
	ld [hl], a
	pop bc
	pop bc
	pop bc
	ret

Func_609d3:: ; 609d3 (18:49d3)
	push af
	push de
	ld hl, -$356
	add hl, sp
	ld sp, hl
	push bc
	ld hl, $357
	add hl, sp
	ldh a, [hSRAMBank]
	ld [hl], a
	ld hl, $35b
	add hl, sp
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $35b
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_60a20
	ld hl, $0
	jp Func_60a23

Func_60a20: ; 60a20 (18:4a20)
	ld hl, $2f
Func_60a23: ; 60a23 (18:4a23)
	add hl, de
	write_hl_to_sp_plus $357
	pop bc
	push bc
	ld a, c
	cp $8
	jp z, Func_60d7b
	cp $7
	jp z, Func_60d07
	cp $6
	jp z, Func_60c66
	cp $5
	jp z, Func_60b8a
	cp $4
	jp z, Func_60b73
	cp $3
	jp z, Func_60b42
	cp $2
	jp z, Func_60af2
	cp $1
	jp z, Func_60abb
	or a
	jp nz, Func_60d8c
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	read_hl_from_sp_plus $359
	pop de
	call GetRobotOrTrainerBaseStats
	ld bc, $23
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_5c6e3
	read_hl_from_sp_plus $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60abb: ; 60abb (18:4abb)
	ld hl, $358
	add hl, sp
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $359
	pop de
	call Func_6095c
	set_farcall_addrs_hli Func_5c6e3
	read_hl_from_sp_plus $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60af2: ; 60af2 (18:4af2)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	read_hl_from_sp_plus $359
	pop de
	call GetRobotOrTrainerBaseStats
	ld bc, $23
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60b42: ; 60b42 (18:4b42)
	ld bc, $23
	read_hl_from_sp_plus $357
	ld de, $c
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	call CopyFromDEtoHL
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	jp Func_60d8c

Func_60b73: ; 60b73 (18:4b73)
	set_farcall_addrs_hli Func_bd6fa
	ld de, $0
	ld hl, Data_60e6f
	call FarCall
	jp @ ; better luck next time

Func_60b8a: ; 60b8a (18:4b8a)
	ld hl, $358
	add hl, sp
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
	ld de, $5
	add hl, de
	ld a, [hl]
	dec a
	ld l, a
	push hl
	read_hl_from_sp_plus $359
	pop de
	call Func_6095c
	call GetHLAtSPPlus4
	ld de, $71
	add hl, de
	push hl
	ld hl, $35a
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	ld de, $82
	add hl, de
	pop de
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $357
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, $358
	add hl, sp
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
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $357
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $358
	add hl, sp
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
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $357
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $358
	add hl, sp
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
	ld a, [hl]
	read_hl_from_sp_plus $357
	ld de, $13
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60c66: ; 60c66 (18:4c66)
	read_hl_from_sp_plus $357
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $358
	add hl, sp
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
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $357
	ld de, $1a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $358
	add hl, sp
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
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $357
	ld de, $13
	add hl, de
	ld a, [hl]
	ld hl, $358
	add hl, sp
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
	ld [hl], a
	read_hl_from_sp_plus $357
	ld de, $c
	add hl, de
	ld a, [hl]
	ld hl, $358
	add hl, sp
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
	ld de, $5
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60d07: ; 60d07 (18:4d07)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	read_hl_from_sp_plus $359
	pop de
	call GetRobotOrTrainerBaseStats
	ld bc, $23
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_5c6e3
	read_hl_from_sp_plus $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $357
	ld de, $22
	add hl, de
	ld [hl], a
	ld c, $1
	read_hl_from_sp_plus $357
	reg16swap de, hl
	ld hl, $2f
	call Func_6015e
	jp Func_60d8c

Func_60d7b: ; 60d7b (18:4d7b)
	ld c, $1
	read_hl_from_sp_plus $357
	reg16swap de, hl
	ld hl, $2f
	call Func_6014a
Func_60d8c: ; 60d8c (18:4d8c)
	pop bc
	ld a, c
	cp $3
	jp c, Func_60da5
	ld a, c
	cp $5
	jp z, Func_60da5
	ld a, c
	cp $7
	jp z, Func_60da5
	ld a, c
	cp $8
	jp nz, Func_60e69
Func_60da5: ; 60da5 (18:4da5)
	push bc
	set_farcall_addrs_hli Func_673ff
	ld hl, $35b
	add hl, sp
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $357
	ld de, $c
	add hl, de
	ld l, [hl]
	pop bc
	ld a, c
	cp $8
	jp z, Func_60e24
	cp $7
	jp nz, Func_60e69
	push hl
	ld c, $1
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $c8
	call Func_6015e
	pop hl
	ld a, l
	cp $ab
	jp c, Func_60e21
	ld a, l
	cp $af
	jp nc, Func_60e21
	push hl
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop hl
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, (s2_b29f - $351 * $ab) & $ffff
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $351
	call CopyFromDEtoHL
	ld hl, $355
	add hl, sp
	ld a, [hl]
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $351
	call Func_6015e
Func_60e21: ; 60e21 (18:4e21)
	jp Func_60e69

Func_60e24: ; 60e24 (18:4e24)
	push hl
	ld c, $1
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $c8
	call Func_6014a
	pop hl
	ld a, l
	cp $ab
	jp c, Func_60e69
	ld a, l
	cp $af
	jp nc, Func_60e69
	ld c, $1
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $351
	call Func_6014a
	ld bc, $351
	ld hl, sp+$2
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CopyFromDEtoHL
Func_60e69: ; 60e69 (18:4e69)
	ld hl, $35a
	add hl, sp
	ld sp, hl
	ret

Data_60e6f:
	dstr "ODE_TEL"

Data_60e77: ; 60e77
	db $00, $00, $00, $00, $00, $00, $00, $00, $03, $03

Func_60e81:: ; 60e81
	add sp, -$2e
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	ld a, [wSongCurrentlyPlaying]
	ld e, a
	push de
	ld hl, sp+$6
	ld [hl], $0
Func_60e9e: ; 60e9e (18:4e9e)
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_60ef4
	set_farcall_addrs_hli malloc
	ld hl, $23
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_60e9e

Func_60ef4: ; 60ef4 (18:4ef4)
	pop de
	pop hl
	pop af
	push de
	push hl
	cp $ff
	jp z, Func_60f5a
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	push af
	ld hl, sp+$7
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$7
	reg16swap de, hl
	xor a
	call FarCall
	ld hl, sp+$7
	ld [hl], $0
	ld a, $1
Func_60f30: ; 60f30 (18:4f30)
	cp $4
	jp nc, Func_60f51
	push af
	set_farcall_addrs_hli StackGetRobotInParty
	pop af
	push af
	ld hl, sp+$9
	reg16swap de, hl
	call FarCall
	pop af
	inc a
	jp Func_60f30

Func_60f51: ; 60f51 (18:4f51)
	ld a, $4
	call OverworldPlaySong
	pop af
	jp Func_60f61

Func_60f5a: ; 60f5a (18:4f5a)
	push af
	ld a, $6
	call OverworldPlaySong
	pop af
Func_60f61: ; 60f61 (18:4f61)
	push af
	ld a, $1
	ld [wInBattle], a
	ld a, [wc319]
	cp $81
	jp nz, Func_60f7d
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld [hl], $3
	jp Func_60f88

Func_60f7d: ; 60f7d (18:4f7d)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld [hl], $1
Func_60f88: ; 60f88 (18:4f88)
	pop af
	push af
	cp $ff
	jp nz, Func_60f92
	call Func_6020a
Func_60f92: ; 60f92 (18:4f92)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $34
	ld hl, sp+$6
	ld [hl], $0
Func_60fa3: ; 60fa3 (18:4fa3)
	ld hl, sp+$6
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_6103d
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_6103d
	ld c, $0
	ld hl, sp+$6
	ld e, [hl]
	xor a
	call Func_609d3
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from_sp_plus $36
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $36
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	read_hl_from_sp_plus $34
	ld de, $75
	add hl, de
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli StackGetRobotInParty
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_60fa3

Func_6103d: ; 6103d (18:503d)
	ld c, $0
Func_6103f: ; 6103f (18:503f)
	ld a, c
	cp $4
	jp nc, Func_61076
	push bc
	set_farcall_addrs_hli GetRobotInParty
	pop bc
	push bc
	ld a, c
	ld hl, sp+$9
	reg16swap de, hl
	call FarCall
	pop bc
	read_hl_from_sp_plus $15
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_61072
	jp Func_61076

Func_61072: ; 61072 (18:5072)
	inc c
	jp Func_6103f

Func_61076: ; 61076 (18:5076)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld [hl], c
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank
	pop hl
	pop bc
	ld a, c
	ld [wc98d], a
	ld a, l
	call GetSRAMBank
	pop af
	pop hl
	cp $ff
	jp z, Func_610b1
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $7
	call FarCall
	jp Func_610d1

Func_610b1: ; 610b1 (18:50b1)
	reg16swap de, hl
	ld hl, Data_60e77
	ld bc, $a
	call MemCopy
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $4
	call FarCall
Func_610d1: ; 610d1 (18:50d1)
	call LoadBattlePals
	call Func_601d4
	pop de
	push af
	push de
	xor a
	ld [wInBattle], a
	xor a
Func_610df: ; 610df (18:50df)
	cp $4
	jp nc, Func_6112a
	push af
	set_farcall_addrs_hli StackGetRobotInParty
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	set_farcall_addrs_hli free
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	pop af
	inc a
	jp Func_610df

Func_6112a: ; 6112a (18:512a)
	pop de
	ld a, e
	call OverworldPlaySong
	pop af
	add sp, $2e
	ret

Func_61133:: ; 61133
	push hl
	add sp, -$44
	push de
	ld a, $1
	ld hl, -1
	write_hl_to_sp_plus $45
	pop hl
	write_hl_to_sp_plus $41
.loop
	or a
	jp z, .break
	set_farcall_addrs_hli Func_4b8ac
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, sp+$3f
	call FarCall
	push af
	ld hl, sp+$2
	push hl
	read_hl_from_sp_plus $4a
	pop de
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $48
	inc hl
	inc hl
	write_hl_to_sp_plus $48
	pop af
	jp .loop

.break
	add sp, $46
	ret

Data_6117c: ; 6117c
	db $09, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Palettes_6118b: ; 6118b
	RGB 29, 22, 14
	RGB 24, 07, 07

	RGB 31, 20, 16
	RGB 31, 09, 00

	RGB 31, 18, 18
	RGB 31, 00, 00

	RGB 19, 19, 31
	RGB 00, 00, 31

	RGB 31, 27, 24
	RGB 23, 15, 13

	RGB 21, 29, 00
	RGB 00, 20, 00

	RGB 24, 24, 24
	RGB 14, 14, 14

	RGB 16, 25, 16
	RGB 08, 19, 08

	RGB 31, 21, 31
	RGB 31, 00, 21

	RGB 31, 16, 00
	RGB 16, 09, 00

	RGB 23, 31, 00
	RGB 16, 20, 00

	RGB 19, 28, 31
	RGB 05, 18, 31

	RGB 30, 30, 17
	RGB 30, 21, 00

	RGB 23, 19, 16
	RGB 18, 12, 08

	RGB 31, 20, 27
	RGB 22, 09, 13

	RGB 31, 28, 27
	RGB 28, 20, 19

	RGB 30, 22, 19
	RGB 23, 12, 06

	RGB 27, 21, 31
	RGB 11, 09, 19

	RGB 31, 27, 11
	RGB 23, 17, 03

	RGB 16, 16, 16
	RGB 10, 10, 10

	RGB 24, 25, 24
	RGB 14, 15, 14

	RGB 14, 18, 26
	RGB 00, 00, 09

	RGB 12, 21, 00
	RGB 00, 14, 00

	RGB 24, 18, 28
	RGB 15, 09, 19

	RGB 15, 15, 25
	RGB 07, 07, 19

	RGB 24, 26, 28
	RGB 15, 15, 17

	RGB 31, 27, 08
	RGB 26, 14, 00

LoadRobotPaletteSGB: ; 611f7
	push af
	add sp, -$10
	push de
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_6117c
	ld bc, $f
	call MemCopy
	ld hl, $7fff
	call WriteHLToSPPlus5
	xor a
Func_61211: ; 61211 (18:5211)
	cp $2
	jp nc, Func_6123f
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Palettes_6118b
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$5
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp Func_61211

Func_6123f: ; 6123f (18:523f)
	ld hl, $0
	call WriteHLToSPPlusParam8
	dec bc
	xor a
	pop de
Func_61248: ; 61248 (18:5248)
	cp $2
	jp nc, Func_61276
	push de
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Palettes_6118b
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	pop de
	jp Func_61248

Func_61276: ; 61276 (18:5276)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld de, $f
	ld hl, sp+$0
	call Func_2b83
	add sp, $12
	ret

RobotPicPalettes: ; 61288
	RGB 29, 22, 14
	RGB 24, 07, 07

	RGB 29, 10, 00
	RGB 15, 05, 00

	RGB 31, 10, 10
	RGB 31, 00, 00

	RGB 10, 16, 30
	RGB 02, 00, 23

	RGB 24, 13, 10
	RGB 13, 05, 06

	RGB 00, 21, 00
	RGB 00, 12, 00

	RGB 15, 15, 15
	RGB 09, 09, 09

	RGB 10, 20, 00
	RGB 00, 11, 00

	RGB 30, 08, 23
	RGB 18, 05, 00

	RGB 26, 08, 05
	RGB 13, 05, 00

	RGB 00, 31, 00
	RGB 00, 14, 00

	RGB 14, 20, 30
	RGB 09, 00, 30

	RGB 31, 31, 00
	RGB 16, 16, 00

	RGB 18, 10, 04
	RGB 12, 05, 05

	RGB 28, 00, 31
	RGB 16, 00, 16

	RGB 23, 12, 09
	RGB 12, 04, 05

	RGB 20, 10, 02
	RGB 09, 05, 00

	RGB 24, 00, 31
	RGB 14, 00, 21

	RGB 24, 14, 00
	RGB 17, 07, 00

	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 17, 17, 17
	RGB 11, 11, 11

	RGB 08, 14, 28
	RGB 00, 00, 21

	RGB 00, 19, 00
	RGB 00, 10, 00

	RGB 29, 00, 31
	RGB 14, 05, 20

	RGB 06, 12, 26
	RGB 00, 00, 19

	RGB 17, 17, 17
	RGB 07, 07, 07

	RGB 30, 21, 00
	RGB 14, 07, 00

LoadRobotPaletteCGB: ; 612f4
	push af
	push de
.wait0: ; 612f6 (18:52f6)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait0
	ld hl, $7fff
	write_hl_to wCGB_BGPalsBuffer + 3 * 8
	write_hl_to wCGB_BGPalsBuffer + 2 * 8
	write_hl_to wCGB_BGPalsBuffer
	ld hl, $0
	write_hl_to wCGB_BGPalsBuffer + 3 * 8 + 6
	write_hl_to wCGB_BGPalsBuffer + 2 * 8 + 6
	write_hl_to wCGB_BGPalsBuffer + 6
	ld a, [wInBattle]
	cp $3
	jp z, .bgpal0
	ld hl, $7fff
	write_hl_to wCGB_BGPalsBuffer + 1 * 8
	ld hl, $0
	write_hl_to wCGB_BGPalsBuffer + 1 * 8 + 6
	xor a
.bgpal1_loop: ; 6133b (18:533b)
	cp $2
	jp nc, .bgpal0
	ld l, a
	ld h, $0
	add hl, hl
	ld de, RobotPicPalettes
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 1 * 8 + 2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp .bgpal1_loop

.bgpal0: ; 6135a (18:535a)
	xor a
.bgpal0_loop: ; 6135b (18:535b)
	cp $2
	jp nc, .bgpal2
	ld l, a
	ld h, $0
	add hl, hl
	ld de, RobotPicPalettes
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp .bgpal0_loop

.bgpal2: ; 6137a (18:537a)
	xor a
.bgpal2_loop: ; 6137b (18:537b)
	cp $2
	jp nc, .bgpal3
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, RobotPicPalettes
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2 * 8 + 2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp .bgpal2_loop

.bgpal3: ; 613a6 (18:53a6)
	xor a
	pop de
.bgpal3_loop: ; 613a8 (18:53a8)
	cp $2
	jp nc, .to_obpals
	push de
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, RobotPicPalettes
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 3 * 8 + 2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	pop de
	jp .bgpal3_loop

.to_obpals: ; 613d3 (18:53d3)
	ld bc, $40
	ld de, wCGB_BGPalsBuffer
	ld hl, wCGB_OBPalsBuffer
	call CopyFromDEtoHL
	ld a, [wInBattle]
	cp $4
	jp z, .quit
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
.wait: ; 613f2 (18:53f2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait
.quit: ; 613fa (18:53fa)
	pop bc
	ret

Func_613fc:: ; 613fc (18:53fc)
	push af
	check_cgb
	jp nz, Func_6140e
	ld hl, sp+$1
	ld a, [hl]
	call LoadRobotPaletteCGB
	jp Func_61414

Func_6140e: ; 6140e (18:540e)
	ld hl, sp+$1
	ld a, [hl]
	call LoadRobotPaletteSGB
Func_61414: ; 61414 (18:5414)
	pop bc
	ret

Data_61416: ; 61416
	db $21, $02, $07, $00, $00, $05, $09, $0c, $03, $00, $0a, $05, $13, $0c

Func_61424:: ; 61424 (18:5424)
	push af
	add sp, -$e
	push de
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_61416
	ld bc, $e
	call MemCopy
	pop bc
	pop de
	ld a, [wSystemType]
	cp $ff
	jp z, Func_614c8
	cp $1
	jp z, Func_614c8
	cp $11
	jp nz, Func_614f0
	push de
	push bc
	set_farcall_addrs_hli Func_c7109
	pop bc
	pop de
	push bc
	push de
	ld de, $1405
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_c7109
	ld hl, sp+$13
	ld c, [hl]
	ld de, $908
	ld hl, $5
	call FarCall
	set_farcall_addrs_hli Func_c7109
	pop de
	ld c, e
	ld de, $908
	ld hl, $a05
	call FarCall
	set_farcall_addrs_hli Func_c7109
	pop bc
	ld de, $1405
	ld hl, $d
	call FarCall
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	jp Func_614f0

Func_614c8: ; 614c8 (18:54c8)
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
Func_614f0: ; 614f0 (18:54f0)
	add sp, $10
	ret

Data_614f3: ; 614f3
	db $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0a, $03, $01, $09, $0b, $02, $02, $03, $0b, $02, $0b, $0c, $0d, $0e, $08, $03, $08, $0d, $04, $0d, $0f, $10, $11, $12, $03, $0d, $0c, $09, $09, $02, $03, $04, $04, $04, $03, $05, $04, $06, $13, $11, $0d, $0d, $0b, $0b, $08, $08, $14, $0e, $0e, $15, $10, $16, $09, $0b, $03, $17, $14, $09, $03, $02, $0f, $02, $06, $02, $0e, $10, $0b, $16, $16, $0e, $03, $0e, $03, $0d, $0d, $06, $0a, $03, $02, $06, $06, $0c, $0c, $02, $12, $12, $0d, $0c, $0b, $16, $0a, $05, $0d, $13, $12, $13, $0c, $0c, $09, $0e, $06, $0b, $09, $06, $04, $04, $0e, $08, $17, $06, $10, $0e, $08, $09, $03, $0d, $18, $0c, $09, $02, $0c, $19, $19, $19, $1a, $1a, $1a, $13, $13, $13, $0e, $11, $04, $0b, $12, $09, $06, $16, $02, $09, $06, $16, $0b, $1a, $03, $03, $06, $0e, $09, $09, $08, $08, $02, $02, $0b, $01, $08, $0c, $1a, $19, $00, $00, $00, $00, $0a, $18, $13, $0d, $0c, $01, $16, $17, $07, $08, $0b, $06, $12, $17, $0c, $01, $16, $08, $18, $14, $11, $1a, $19, $02, $09, $0a, $0e, $15, $10

Func_615be:: ; 615be
	cp $cb
	jp nc, Func_615cc
	ld e, a
	ld d, $0
	ld hl, Data_614f3
	add hl, de
	ld a, [hl]
	ret

Func_615cc: ; 615cc (18:55cc)
	xor a
	ret

INCLUDE "battle/damage_anim.asm"

Func_61a3e:: ; 61a3e
	push af
	push de
	add sp, -$14
	ld e, $2
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp nz, Func_61a78
	ld hl, $2
	write_hl_to_sp_plus $15
	ld hl, $703
	write_hl_to_sp_plus $13
	ld hl, sp+$15
	ld [hl], $1
	xor a
	jp Func_61a88

Func_61a78: ; 61a78 (18:5a78)
	ld hl, $b02
	write_hl_to_sp_plus $15
	ld hl, $1203
	write_hl_to_sp_plus $13
	ld a, $b
Func_61a88: ; 61a88 (18:5a88)
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_61aa2
	ld hl, $0
	jp Func_61aa5

Func_61aa2: ; 61aa2 (18:5aa2)
	ld hl, $2f
Func_61aa5: ; 61aa5 (18:5aa5)
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $15
	ld hl, $18
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $1c
	push hl
	read_hl_from_sp_plus $15
	pop de
	add hl, de
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $15
	push hl
	read_hl_from_sp_plus $13
	pop de
	call CompareHLtoDE
	jp c, Func_61ae8
	read_hl_from_sp_plus $15
	write_hl_to_sp_plus $11
Func_61ae8: ; 61ae8 (18:5ae8)
	ld hl, sp+$a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $15
	push hl
	read_hl_from_sp_plus $15
	pop de
	call Func_2617
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$a
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$c
	ld a, [hl]
	and $80
	jp z, Func_61b14
	ld hl, sp+$b
	ld a, [hl]
	inc a
	ld hl, sp+$b
	ld [hl], a
Func_61b14: ; 61b14 (18:5b14)
	ld hl, sp+$b
	ld a, [hl]
	push af
	ld hl, sp+$8
	ld c, l
	ld b, h
	read_hl_from_sp_plus $17
	push hl
	read_hl_from_sp_plus $15
	pop de
	call Func_2617
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$8
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$a
	ld a, [hl]
	and $80
	jp z, Func_61b44
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
Func_61b44: ; 61b44 (18:5b44)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$10
	ld [hl], a
	read_hl_from_sp_plus $15
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$c
	ld [hl], a
	read_hl_from_sp_plus $15
	ld e, l
	ld hl, sp+$d
	ld [hl], e
	ld hl, sp+$f
	xor a
	ld [hl], a
	ld hl, sp+$e
	ld [hl], a
	pop af
	push af
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld e, a
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	read_hl_from_sp_plus $17
	push hl
	read_hl_from_sp_plus $17
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call Func_2617
	pop af
	ld e, a
Func_61b92: ; 61b92 (18:5b92)
	ld a, e
	ld hl, sp+$e
	cp [hl]
	jp nc, Func_61c21
	push de
	ld hl, sp+$1f
	ld a, [hl]
	ld l, e
	ld h, a
	push hl
	read_hl_from_sp_plus $1d
	pop de
	call DrawHPBar
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, sp+$f
	call Func_63cf3
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp z, Func_61bcc
	ld hl, sp+$d
	ld e, [hl]
	ld hl, sp+$c
	ld h, [hl]
	ld d, h
	push de
	read_hl_from_sp_plus $1d
	inc h
	inc hl
	pop de
	call Func_63d05
Func_61bcc: ; 61bcc (18:5bcc)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	read_hl_from_sp_plus $1b
	ld c, l
	ld b, h
	read_hl_from_sp_plus $19
	reg16swap de, hl
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call Func_63e6f
	call WaitVideoTransfer
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_61c02
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_61c0a

Func_61c02: ; 61c02 (18:5c02)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_61c0a: ; 61c0a (18:5c0a)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
Func_61c12: ; 61c12 (18:5c12)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_61c12
	pop de
	inc e
	jp Func_61b92

Func_61c21: ; 61c21 (18:5c21)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp nz, Func_61c3d
	read_hl_from_sp_plus $11
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_61c3d
	ld hl, sp+$e
	ld [hl], $1
Func_61c3d: ; 61c3d (18:5c3d)
	ld hl, sp+$e
	ld e, [hl]
	ld hl, sp+$1d
	ld h, [hl]
	ld d, h
	push de
	read_hl_from_sp_plus $1b
	pop de
	call DrawHPBar
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_61c63
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $1b
	inc h
	inc hl
	pop de
	call Func_63d05
Func_61c63: ; 61c63 (18:5c63)
	call WaitVideoTransfer
	pop bc
	read_hl_from_sp_plus $f
	reg16swap de, hl
	ld hl, $18
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	pop de
	ld l, $2
	push hl
	ld c, $8
	call DoublePushBGMapRegion
	pop bc
	read_hl_from_sp_plus $b
	reg16swap de, hl
	add sp, $18
	reg16swap de, hl
	ret

Func_61c90:: ; 61c90
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus4
	ld de, $d
	add hl, de
	ld c, [hl]
	push bc
	cp $ff
	jp z, Func_61cc6
	push af
	ld d, a
	add a
	add d
	inc a
	ld l, a
	ld h, $0
	ld de, Data_61d32
	call PlaceStringDEatCoordHL
	pop af
	ld e, a
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $0
Func_61cc6: ; 61cc6 (18:5cc6)
	pop bc
	pop af
	push bc
	push af
	ld d, a
	add a
	add d
	inc a
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_61d34
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	pop bc
	push af
	ld e, a
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp z, Func_61d23
	ld a, c
	cp $10
	jp nz, Func_61d23
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	inc hl
	ld a, l
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_61d37
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61d23: ; 61d23 (18:5d23)
	pop af
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ret

Data_61d32: ; 61d32
	dstr " "

Data_61d34: ; 61d34
	dstr "%c"

Data_61d37: ; 61d37
	dstr "%c"

Data_61d3a: ; 61d3a
	db $00, $01, $00, $02

Func_61d3e:: ; 61d3e
	push hl
	push de
	push bc
	push bc
	callba_hli Func_da4dc
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld c, $0
Func_61d61: ; 61d61 (18:5d61)
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_61dd8
	push bc
	ld a, c
	add a
	add a
	ld d, a
	add a
	add d
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$4
	ld [hl], $10
	ld a, c
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $1
	jp c, Func_61da6
	inc a
	cp $5
	jp nz, Func_61d9f
	ld a, $1
Func_61d9f: ; 61d9f (18:5d9f)
	call GetHLAtSPPlus8
	ld [hl], a
	jp Func_61da8

Func_61da6: ; 61da6 (18:5da6)
	ld a, $1
Func_61da8: ; 61da8 (18:5da8)
	push af
	set_farcall_addrs_hli UpdateCurSprite
	pop af
	ld e, a
	ld d, $0
	ld hl, $5d39
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld h, [hl]
	ld d, h
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	pop bc
	inc c
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_61d61

Func_61dd8: ; 61dd8 (18:5dd8)
	callba_hli QueueMoveAnimScriptGFXUpdate
	pop bc
	pop bc
	pop bc
	pop bc
	ret

NamingScreen_:: ; 61deb
	push af
.loop
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, .not_eq_1
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli DisplayPartyMenu_
	xor a
	call FarCall
	reg16swap de, hl
	ld hl, $3
	call CompareHLtoDE
	jp c, .next_
	ld a, e
	and d
	inc a
	jp nz, .not_eq_1
.next_
	jp .quit

.not_eq_1
	set_farcall_addrs_hli NamingScreen
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, .not_eq_1_
	jp .quit

.not_eq_1_
	set_farcall_addrs_hli Func_14d93
	ld hl, $0
	call FarCall
	reg16swap de, hl
	ld a, e
	dec a
	or d
	jp z, .next
	jp .quit

.next
	jp .loop

.quit
	pop bc
	ret

Func_61e5b:: ; 61e5b
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
	push af
	ld l, $d
	push hl
	ld c, $b
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop af
	cp $5
	jp z, Func_61eeb
	cp $4
	jp z, Func_61eda
	cp $3
	jp z, Func_61ec9
	cp $2
	jp z, Func_61eb8
	cp $1
	jp z, Func_61ea7
	or a
	jp nz, Func_61ef0
	callba_hli Func_804c
	jp Func_61ef0

Func_61ea7: ; 61ea7 (18:5ea7)
	callba_hli Func_cd9a
	jp Func_61ef0

Func_61eb8: ; 61eb8 (18:5eb8)
	callba_hli Func_10011
	jp Func_61ef0

Func_61ec9: ; 61ec9 (18:5ec9)
	callba_hli Func_144dd
	jp Func_61ef0

Func_61eda: ; 61eda (18:5eda)
	callba_hli Func_5190c
	jp Func_61ef0

Func_61eeb: ; 61eeb (18:5eeb)
	ld a, $3
	call OverworldPlaySong
Func_61ef0: ; 61ef0 (18:5ef0)
	ld hl, $8000
	ret

Func_61ef4:: ; 61ef3
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	ld de, Data_61f11
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_61f23
	ld hl, $110
	call PlaceStringDEatCoordHL
	ret

Data_61f11: ; 61f11
	dstr "(はけんする) ロホﾞホﾟン(を)"

Data_61f23: ; 61f23
	dstr "4(たい えらんてﾞくたﾞさい)"

Func_61f34:: ; 61f34
	push af
	push de
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_61f3b: ; 61f3b (18:5f3b)
	ld hl, sp+$0
	ld a, [hl]
	cp c
	jp nc, Func_61fae
	push bc
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp z, Func_61f64
	ld hl, sp+$2
	ld a, [hl]
	add a
	inc a
	ld e, a
	ld a, $8
	call SetStringStartState
	ld hl, $8f
	push hl
	ld hl, Data_61fb2
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61f64: ; 61f64 (18:5f64)
	ld e, $0
Func_61f66: ; 61f66 (18:5f66)
	ld a, e
	cp $4
	jp nc, Func_61fa3
	push de
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$4
	add [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	cp [hl]
	jp nz, Func_61f9e
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$6
	cp [hl]
	jp z, Func_61f9e
	ld hl, sp+$4
	ld a, [hl]
	add a
	inc a
	ld e, a
	ld a, $8
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, $5fb5
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61f9e: ; 61f9e (18:5f9e)
	pop de
	inc e
	jp Func_61f66

Func_61fa3: ; 61fa3 (18:5fa3)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
	jp Func_61f3b

Func_61fae: ; 61fae (18:5fae)
	pop bc
	pop bc
	pop bc
	ret

Data_61fb2: ; 61fb2
	dstr "%c"

Data_61fb5: ; 61fb5
	dstr "%c"

Func_61fb8:: ; 61fb8
	push hl
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld a, [hl]
	push af
	cp $2
	jp z, Func_61fd8
	cp $5
	jp nz, Func_61fe5
	ld c, $3
	ld e, $d
	ld hl, $0
	call Func_600f4
	jp Func_61fef

Func_61fd8: ; 61fd8 (18:5fd8)
	ld c, $9
	ld e, $a
	ld hl, $6
	call Func_600f4
	jp Func_61fef

Func_61fe5: ; 61fe5 (18:5fe5)
	ld c, $7
	ld e, $a
	ld hl, $6
	call Func_600f4
Func_61fef: ; 61fef (18:5fef)
	pop af
	cp $5
	jp z, Func_62044
	cp $2
	jp z, Func_6201d
	cp $1
	jp nz, Func_62068
	ld de, Data_6206a
	ld hl, $107
	call PlaceStringDEatCoordHL
	ld de, Data_6206f
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_62076
	ld hl, $10b
	call PlaceStringDEatCoordHL
	jp Func_62068

Func_6201d: ; 6201d (18:601d)
	ld de, Data_62079
	ld hl, $107
	call PlaceStringDEatCoordHL
	ld de, Data_62085
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_62092
	ld hl, $10b
	call PlaceStringDEatCoordHL
	ld de, Data_6209e
	ld hl, $10d
	call PlaceStringDEatCoordHL
	jp Func_62068

Func_62044: ; 62044 (18:6044)
	ld de, Data_620a7
	ld hl, $c05
	call PlaceStringDEatCoordHL
	ld de, Data_620b3
	ld hl, $c07
	call PlaceStringDEatCoordHL
	ld de, Data_620c0
	ld hl, $c09
	call PlaceStringDEatCoordHL
	ld de, Data_620cc
	ld hl, $c0b
	call PlaceStringDEatCoordHL
Func_62068: ; 62068 (18:6068)
	pop bc
	ret

Data_6206a: ; 6206a
	dstr "RAM:"

Data_6206f: ; 6206f
	dstr "(いりょく)"

Data_62076: ; 62076
	dstr "EP"

Data_62079: ; 62079
	dstr "(こうけﾞき)   0"

Data_62085: ; 62085
	dstr "(ほﾞうきﾞょ)   0"

Data_62092: ; 62092
	dstr "(すはﾞやさ)   0"

Data_6209e: ; 6209e
	dstr "RAM:  0M"

Data_620a7: ; 620a7
	dstr "(こうけﾞき)   0"

Data_620b3: ; 620b3
	dstr "(ほﾞうきﾞょ)   0"

Data_620c0: ; 620c0
	dstr "(すはﾞやさ)   0"

Data_620cc: ; 620cc
	dstr "RAM:  0M"

Func_620d5:: ; 620d5
	push hl
	push de
	push bc
	add sp, -$3a
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
	read_hl_from_sp_plus $40
	ld e, h
	ld hl, sp+$36
	ld [hl], e
	read_hl_from_sp_plus $40
	ld h, $0
	write_hl_to_sp_plus $40
	ld a, l
	ld hl, sp+$35
	ld [hl], a
	ld hl, $17
	add hl, bc
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, $15
	add hl, bc
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
	ld hl, $16
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld hl, sp+$37
	ld [hl], $ff
	ld hl, sp+$36
	ld a, [hl]
	cp $5
	jp z, Func_622e9
	or a
	jp nz, Func_62389
	push de
	ld hl, sp+$3a
	ld [hl], $0
Func_6214b: ; 6214b (18:614b)
	ld hl, sp+$3a
	ld a, [hl]
	cp $4
	jp nc, Func_6217d
	ld hl, sp+$3a
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_62173
	ld hl, sp+$39
	ld [hl], $1
	jp Func_6217d

Func_62173: ; 62173 (18:6173)
	ld hl, sp+$3a
	ld a, [hl]
	inc a
	ld hl, sp+$3a
	ld [hl], a
	jp Func_6214b

Func_6217d: ; 6217d (18:617d)
	pop de
	ld hl, sp+$37
	ld a, [hl]
	cp $ff
	jp nz, Func_6218f
	ld a, e
	call GetSRAMBank
	ld a, $ff
	jp Func_623cd

Func_6218f: ; 6218f (18:618f)
	push de
	ld hl, sp+$3c
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$8
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$3c
	ld a, [hl]
	ld hl, sp+$3a
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld [hl], a
	ld hl, sp+$14
	push hl
	ld hl, sp+$3c
	ld l, [hl]
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call CopyFromDEtoHL
	ld hl, sp+$3a
	ld l, [hl]
	ld h, 0
	get_party_bot
	call WriteHLToSPPlus8
	ld hl, sp+$37
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $22
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $e
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $40
	push hl
	call GetHLAtSPPlus10
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $26
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $12
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus8
	ld de, $10
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $2d
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $17
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $31
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $1b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $2f
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus8
	ld de, $1d
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$5
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $b
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $a
	add hl, de
	ld [hl], a
	pop de
	jp Func_62389

Func_622e9: ; 622e9 (18:62e9)
	push de
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $2
	call FarCall
	callba_hli Func_7d01
	ld hl, sp+$3a
	ld [hl], a
	pop de
	ld hl, sp+$38
	ld a, [hl]
	cp $ff
	jp z, Func_62389
	push de
	ld hl, sp+$38
	ld a, [hl]
	cp $5
	jp nz, Func_62381
	ld hl, sp+$3c
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$8
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli Func_6086c
	ld hl, sp+$37
	ld e, [hl]
	ld hl, sp+$8
	call FarCall
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$1f
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$1d
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$1e
	ld [hl], a
	ld hl, sp+$37
	ld a, [hl]
	ld hl, sp+$1b
	ld [hl], a
	read_hl_from_sp_plus $40
	write_hl_to_sp_plus $22
	ld hl, $0
	write_hl_to_sp_plus $33
	set_farcall_addrs_hli Func_7db0
	ld hl, sp+$14
	reg16swap de, hl
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
Func_62381: ; 62381 (18:6381)
	ld hl, sp+$39
	ld [hl], $1
	pop de
	jp Func_62389

Func_62389: ; 62389 (18:6389)
	ld a, e
	call GetSRAMBank
	ld hl, sp+$37
	ld a, [hl]
	cp $1
	jp nz, Func_623ca
	ld hl, sp+$36
	ld a, [hl]
	or a
	jp z, Func_623a4
	ld hl, sp+$36
	ld a, [hl]
	cp $5
	jp nz, Func_623ca
Func_623a4: ; 623a4 (18:63a4)
	set_farcall_addrs_hli Func_53a0d
	ld e, $0
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $1
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
Func_623ca: ; 623ca (18:63ca)
	ld hl, sp+$37
	ld a, [hl]
Func_623cd: ; 623cd (18:63cd)
	add sp, $40
	ret

Func_623d0:: ; 623d0
	add sp, -$1c
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$1d
	xor a
	ld [hl], a
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1b
	ld [hl], a
	set_farcall_addrs_hli Func_16104
	ld e, $0
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$1b
	ld [hl], a
	ld e, $1
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$1c
	ld [hl], a
	ld e, $2
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$1d
	ld [hl], a
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld a, [hl]
	ld e, a
	ld hl, sp+$2
	call Func_241f
	ld hl, sp+$11
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, sp+$1a
	ld [hl], a
	ld c, $0
Func_62449: ; 62449 (18:6449)
	ld a, c
	cp $3
	jp nc, Func_62478
	ld e, c
	ld d, $0
	ld hl, sp+$1b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_62474
	ld e, c
	ld d, $0
	ld hl, sp+$1b
	add hl, de
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	add a
	ld d, a
	add a
	add a
	add d
	ld e, a
	ld hl, sp+$1a
	ld a, [hl]
	sub e
	ld hl, sp+$1a
	ld [hl], a
Func_62474: ; 62474 (18:6474)
	inc c
	jp Func_62449

Func_62478: ; 62478 (18:6478)
	pop af
	call GetSRAMBank
	ld hl, sp+$18
	ld a, [hl]
	add sp, $1c
	ret

Data_62482: ; 62482
	dw Data_62486, $0

Data_62486: ; 62486
	dstr "(RAMかﾞたりないよ)"

Data_62493: ; 62493
	dw Data_62497, $0

Data_62497: ; 62497
	dstr "ソフト(かﾞ いっはﾟいてﾞ はすﾞせません)"

Func_624af:: ; 624af
	push af
	add sp, -$2c
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_62482
	ld bc, $4
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_62493
	ld bc, $4
	call MemCopy
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
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
	call Func_600f4
	ld hl, sp+$2f
	ld a, [hl]
	cp $2
	jp z, Func_6251c
	cp $1
	jp nz, Func_6256a
	ld de, Data_6273a
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_6256a

Func_6251c: ; 6251c (18:651c)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	set_farcall_addrs_hli Func_5601b
	ld c, $1
	ld a, [wCurItem]
	ld e, a
	ld hl, sp+$11
	call FarCall
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$f
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld hl, Data_6274e
	push hl
	call PlaceString
	pop bc
Func_6256a: ; 6256a (18:656a)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$2f
	ld a, [hl]
	cp $3
	jp z, Func_6259a
	or a
	jp nz, Func_625ab
	ld c, $18
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $10e
	call Func_6011c
	ld hl, $0
	write_hl_to_sp_plus $c
	jp Func_625bd

Func_6259a: ; 6259a (18:659a)
	ld c, $18
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $10e
	call Func_6011c
	jp Func_625bd

Func_625ab: ; 625ab (18:65ab)
	callba_hli Func_1482e
	write_hl_to_sp_plus $c
Func_625bd: ; 625bd (18:65bd)
	read_hl_from_sp_plus $c
	ld a, l
	or h
	jp nz, Func_626ff
	ld hl, sp+$2f
	ld a, [hl]
	cp $2
	jp nz, Func_626ff
	ld hl, sp+$c
	ld [hl], $0
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld a, [wCurItem]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$f
	ld [hl], a
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$f
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_62656
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$f
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6264f
	ld c, $18
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $10e
	call Func_6011c
	ld hl, sp+$e
	ld [hl], $1
	jp Func_62656

Func_6264f: ; 6264f (18:664f)
	ld hl, $2
	write_hl_to_sp_plus $e
Func_62656: ; 62656 (18:6656)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp nz, Func_626fb
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld a, [wCurItem]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	ld hl, sp+$10
	ld a, [wCurItem]
	ld [hl], a
Func_62685: ; 62685 (18:6685)
	ld hl, sp+$10
	ld a, [hl]
	cp $2
	jp nc, Func_626e0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, [hl]
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], a
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld hl, sp+$10
	ld [hl], a
	jp Func_62685

Func_626e0: ; 626e0 (18:66e0)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $a
.asm_626f6
	add hl, de
.asm_626f9
	ld [hl], $0
Func_626fb: ; 626fb (18:66fb)
	pop af
	call GetSRAMBank
Func_626ff: ; 626ff (18:66ff)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	ld l, $12
	push hl
	ld c, $14
.asm_6271c
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	call GetHLAtSPPlus10
	ld a, l
	add sp, $2e
	ret

Data_6273a: ; 6273a
	dstr "(すへﾞてはすﾞして いいてﾞすか?)"

Data_6274e: ; 6274e
	dstr "(を はすﾞしますか?)"

Func_6275b:: ; 6275b
	push bc
	push bc
	push hl
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
	ld hl, sp+$4
	ld [hl], a
	set_farcall_addrs_hli Func_524b6
	pop hl
	call FarCall
	cp $ff
	jp nz, Func_6278f
	ld hl, $4000
	jp Func_62822

Func_6278f: ; 6278f (18:678f)
	ld hl, sp+$1
	ld [hl], $0
Func_62793: ; 62793 (18:6793)
	ld hl, sp+$1
	ld a, [hl]
	cp $3
	jp nc, Func_6280a
	ld hl, sp+$1
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
	jp nz, Func_62800
	ld hl, sp+$0
	ld [hl], $0
Func_627b9: ; 627b9 (18:67b9)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_62800
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$1
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
	ld hl, sp+$2
	cp [hl]
	jp nz, Func_627f6
	set_farcall_addrs_hli Func_6bbf3
	ld e, $0
	ld a, $8
	call FarCall
	ld hl, $8000
	jp Func_62822

Func_627f6: ; 627f6 (18:67f6)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_627b9

Func_62800: ; 62800 (18:6800)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_62793

Func_6280a: ; 6280a (18:680a)
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $4
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld hl, -1
Func_62822: ; 62822 (18:6822)
	pop bc
	pop bc
	ret

Data_62825: ; 62825
	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 00
	RGB 20, 20, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 31, 31
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 20, 00, 00
	RGB 00, 00, 00

Data_62845: ; 62845
	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 00
	RGB 20, 20, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 31, 31
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 20, 00, 00
	RGB 00, 00, 00

LoadBattlePals:: ; 62865 (18:6865)
	check_cgb
	jp z, .wait1
	jp .not_cgb

.wait1
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait1
	ld bc, $20
	ld de, Data_62825
	ld hl, wCGB_BGPalsBuffer + 4 * 8
	call CopyFromDEtoHL
	ld bc, $20
	ld de, Data_62845
	ld hl, wCGB_OBPalsBuffer + 4 * 8
	call CopyFromDEtoHL
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
.wait2
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, .wait2
.not_cgb
	ret

Data_628a4: ; 628a4
	db $00, $02, $04, $06, $08, $0a, $0c, $0e, $10, $11, $13, $15, $17, $19, $1b, $1d, $1f, $01, $03, $05, $07, $09, $0a, $0c, $0e, $10, $12, $14, $16, $18, $19, $1b, $1d, $1f, $02, $04, $06, $07, $09, $0b, $0d, $0f, $11, $12, $14, $16, $18, $1a, $1b, $1d, $1f, $03, $05, $07, $08, $0a, $0c, $0e, $0f, $11, $13, $15, $16, $18, $1a, $1c, $1d, $1f, $04, $06, $07, $09, $0b, $0c, $0e, $10, $12, $13, $15, $17, $18, $1a, $1c, $1d, $1f, $05, $07, $08, $0a, $0c, $0d, $0f, $10, $12, $14, $15, $17, $19, $1a, $1c, $1d, $1f, $06, $08, $09, $0b, $0c, $0e, $0f, $11, $13, $14, $16, $17, $19, $1a, $1c, $1d, $1f, $07, $09, $0a, $0c, $0d, $0f, $10, $12, $13, $15, $16, $18, $19, $1b, $1c, $1e, $1f, $08, $09, $0b, $0c, $0e, $0f, $11, $12, $14, $15, $16, $18, $19, $1b, $1c, $1e, $1f, $09, $0a, $0c, $0d, $0f, $10, $11, $13, $14, $15, $17, $18, $1a, $1b, $1c, $1e, $1f, $0a, $0b, $0d, $0e, $0f, $11, $12, $13, $15, $16, $17, $18, $1a, $1b, $1c, $1e, $1f, $0b, $0c, $0e, $0f, $10, $11, $13, $14, $15, $16, $18, $19, $1a, $1b, $1d, $1e, $1f, $0c, $0d, $0e, $10, $11, $12, $13, $14, $16, $17, $18, $19, $1a, $1b, $1d, $1e, $1f, $0d, $0e, $0f, $10, $12, $13, $14, $15, $16, $17, $18, $19, $1b, $1c, $1d, $1e, $1f, $0e, $0f, $10, $11, $12, $13, $14, $15, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $11, $12, $13, $14, $15, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1c, $1d, $1e, $1f, $12, $13, $14, $14, $15, $16, $17, $18, $19, $19, $1a, $1b, $1c, $1d, $1d, $1e, $1f, $13, $14, $15, $15, $16, $17, $18, $18, $19, $1a, $1b, $1b, $1c, $1d, $1e, $1e, $1f, $14, $15, $15, $16, $17, $17, $18, $19, $1a, $1a, $1b, $1c, $1c, $1d, $1e, $1e, $1f, $15, $16, $16, $17, $18, $18, $19, $19, $1a, $1b, $1b, $1c, $1d, $1d, $1e, $1e, $1f, $16, $17, $17, $18, $18, $19, $19, $1a, $1b, $1b, $1c, $1c, $1d, $1d, $1e, $1e, $1f, $17, $18, $18, $19, $19, $1a, $1a, $1b, $1b, $1c, $1c, $1d, $1d, $1e, $1e, $1f, $1f, $18, $18, $19, $19, $1a, $1a, $1b, $1b, $1c, $1c, $1c, $1d, $1d, $1e, $1e, $1f, $1f, $19, $19, $1a, $1a, $1b, $1b, $1b, $1c, $1c, $1c, $1d, $1d, $1e, $1e, $1e, $1f, $1f, $1a, $1a, $1b, $1b, $1b, $1c, $1c, $1c, $1d, $1d, $1d, $1d, $1e, $1e, $1e, $1f, $1f, $1b, $1b, $1c, $1c, $1c, $1c, $1d, $1d, $1d, $1d, $1e, $1e, $1e, $1e, $1f, $1f, $1f, $1c, $1c, $1c, $1d, $1d, $1d, $1d, $1d, $1e, $1e, $1e, $1e, $1e, $1e, $1f, $1f, $1f, $1d, $1d, $1d, $1d, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1f, $1f, $1f, $1f, $1f, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f

Data_62ac4: ; 62ac4
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $03, $03, $03, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $00, $00, $00, $04, $04, $04, $03, $03, $03, $03, $02, $02, $02, $02, $01, $01, $01, $01, $00, $00, $05, $05, $04, $04, $04, $03, $03, $03, $03, $02, $02, $02, $01, $01, $01, $00, $00, $06, $06, $05, $05, $05, $04, $04, $03, $03, $03, $02, $02, $02, $01, $01, $00, $00, $07, $07, $06, $06, $05, $05, $04, $04, $04, $03, $03, $02, $02, $01, $01, $00, $00, $08, $08, $07, $07, $06, $06, $05, $05, $04, $04, $03, $03, $02, $02, $01, $01, $00, $09, $08, $08, $07, $07, $06, $06, $05, $05, $04, $03, $03, $02, $02, $01, $01, $00, $0a, $09, $09, $08, $08, $07, $06, $06, $05, $04, $04, $03, $03, $02, $01, $01, $00, $0b, $0a, $0a, $09, $08, $08, $07, $06, $06, $05, $04, $03, $03, $02, $01, $01, $00, $0c, $0b, $0b, $0a, $09, $08, $08, $07, $06, $05, $05, $04, $03, $02, $02, $01, $00, $0d, $0c, $0b, $0b, $0a, $09, $08, $07, $07, $06, $05, $04, $03, $02, $02, $01, $00, $0e, $0d, $0c, $0b, $0b, $0a, $09, $08, $07, $06, $05, $04, $04, $03, $02, $01, $00, $0f, $0e, $0d, $0c, $0b, $0a, $09, $08, $08, $07, $06, $05, $04, $03, $02, $01, $00, $10, $0f, $0e, $0d, $0c, $0b, $0a, $09, $08, $07, $06, $05, $04, $03, $02, $01, $00, $11, $10, $0f, $0e, $0d, $0c, $0b, $0a, $09, $07, $06, $05, $04, $03, $02, $01, $00, $12, $11, $10, $0f, $0e, $0c, $0b, $0a, $09, $08, $07, $06, $05, $03, $02, $01, $00, $13, $12, $11, $0f, $0e, $0d, $0c, $0b, $0a, $08, $07, $06, $05, $04, $02, $01, $00, $14, $13, $12, $10, $0f, $0e, $0d, $0b, $0a, $09, $08, $06, $05, $04, $03, $01, $00, $15, $14, $12, $11, $10, $0e, $0d, $0c, $0b, $09, $08, $07, $05, $04, $03, $01, $00, $16, $15, $13, $12, $11, $0f, $0e, $0c, $0b, $0a, $08, $07, $06, $04, $03, $01, $00, $17, $16, $14, $13, $11, $10, $0e, $0d, $0c, $0a, $09, $07, $06, $04, $03, $01, $00, $18, $17, $15, $14, $12, $11, $0f, $0e, $0c, $0b, $09, $08, $06, $05, $03, $02, $00, $19, $17, $16, $14, $13, $11, $10, $0e, $0d, $0b, $09, $08, $06, $05, $03, $02, $00, $1a, $18, $17, $15, $14, $12, $10, $0f, $0d, $0b, $0a, $08, $07, $05, $03, $02, $00, $1b, $19, $18, $16, $14, $13, $11, $0f, $0e, $0c, $0a, $08, $07, $05, $03, $02, $00, $1c, $1a, $19, $17, $15, $13, $12, $10, $0e, $0c, $0b, $09, $07, $05, $04, $02, $00, $1d, $1b, $19, $18, $16, $14, $12, $10, $0f, $0d, $0b, $09, $07, $05, $04, $02, $00, $1e, $1c, $1a, $18, $17, $15, $13, $11, $0f, $0d, $0b, $09, $08, $06, $04, $02, $00, $1f, $1d, $1b, $19, $17, $15, $13, $11, $10, $0e, $0c, $0a, $08, $06, $04, $02, $00

Func_62ce4:: ; 62ce4 (18:6ce4)
	ld a, [wNextVBlankFlags]
	bit 6, a
	ret nz
	ld a, [wCurRobotPointer]
	ld l, a
	ld a, [wCurRobotPointer + 1]
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp b
	ret c
	xor a
	ld [hli], a
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add c
	pop hl
	cp $ff
	ret z
	cp $11
	ret z
	ld [hli], a
	ld c, a
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	cp $3
	jp z, Func_62d2c
	cp $5
	jp z, Func_62d37
	cp $7
	jp z, Func_62d42
	cp $2
	jp z, Func_62de6
	cp $4
	jp z, Func_62df1
	cp $6
	jp z, Func_62dfc
	ret

Func_62d2c: ; 62d2c (18:6d2c)
	ld de, CheckSongFinishedPredef
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $20
	jr asm_62d4b

Func_62d37: ; 62d37 (18:6d37)
	ld de, $2a5
	add hl, de
	ld de, wCGB_OBPalsBuffer
	ld a, $20
	jr asm_62d4b

Func_62d42: ; 62d42 (18:6d42)
	ld de, CheckSongFinishedPredef
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $40
asm_62d4b:
	push af
	push de
	ld de, $0
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld e, [hl]
	sla e
	sla e
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	reg8rot e, a, c
	ld b, d
	pop de
	pop hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	push hl
	ld l, e
	ld h, d
	pop de
	ld c, a
	ld b, $0
	pop af
	dec a
	jp nz, asm_62d4b
	ld a, [wNextVBlankFlags]
	set 6, a
	ld [wNextVBlankFlags], a
	ret

Func_62de6: ; 62de6 (18:6de6)
	ld de, CheckSongFinishedPredef
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $20
	jr asm_62e05

Func_62df1: ; 62df1 (18:6df1)
	ld de, $2a5
	add hl, de
	ld de, wCGB_OBPalsBuffer
	ld a, $20
	jr asm_62e05

Func_62dfc: ; 62dfc (18:6dfc)
	ld de, CheckSongFinishedPredef
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $40
asm_62e05:
	push af
	push de
	ld de, $0
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld e, [hl]
	sla e
	sla e
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	ld a, c
	ld c, e
	ld b, d
	pop de
	pop hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	push hl
	ld l, e
	ld h, d
	pop de
	ld c, a
	ld b, $0
	pop af
	dec a
	jp nz, asm_62e05
	ld a, [wNextVBlankFlags]
	set 6, a
	ld [wNextVBlankFlags], a
	ret

SGBWait: ; 62ea0
	ld de, 1750
.delay
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .delay
	dec bc
	ld a, b
	or c
	jr nz, SGBWait
	ret

Func_62eb1: ; 62eb1 (18:6eb1)
	ld a, [hl]
	and $7
	ret z
	ld b, a
	ld c, $0
.asm_62eb8
	push bc
	ld a, $0
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	ld b, $10
.asm_62ec1
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_62ec5
	bit 0, d
	ld a, $10
	jr nz, .asm_62ecd
	ld a, $20
.asm_62ecd
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	rr d
	dec e
	jr nz, .asm_62ec5
	dec b
	jr nz, .asm_62ec1
	ld a, $20
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	pop bc
	dec b
	ret z
	jr .asm_62eb8

SGBInit: ; 62ee4
	ld hl, Data_62f52
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .is_sgb
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, $30
	ldh [rJOYP], a
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .is_sgb
	ld hl, Data_62f42
	call Func_62eb1
	ld bc, $4
	call SGBWait
	sub a
	ret

.is_sgb
	ld hl, Data_62f42
	call Func_62eb1
	ld bc, $4
	call SGBWait
	scf
	ret

Data_62f42: ; 62f42
	db $89, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_62f52: ; 62f52
	db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Func_62f62: ; 62f62
	ldh a, [rLCDC]
	push af
	push de
	rlca
	jr nc, .asm_62f73
.asm_62f69
	ldh a, [rLY]
	cp $94
	jr nz, .asm_62f69
	ld a, $41
	ldh [rLCDC], a
.asm_62f73
	ld a, $e4
	ldh [rBGP], a
	ld de, $8800
.asm_62f7a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_62f7a
	hlbgcoord 0, 0
	ld de, $c
	ld a, $80
	ld c, $d
.asm_62f8c
	ld b, $14
.asm_62f8e
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_62f8e
	add hl, de
	dec c
	jr nz, .asm_62f8c
	ld a, $c1
	ldh [rLCDC], a
	pop hl
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld bc, $1
	call SGBWait
	pop af
	bit 7, a
	jr nz, .asm_62fb8
	push af
.asm_62fb1
	ldh a, [rLY]
	cp $94
	jr nz, .asm_62fb1
	pop af
.asm_62fb8
	ldh [rLCDC], a
	ret

Func_62fbb: ; 62fbb
	ld hl, Data_630f2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ret

Func_62fc8: ; 62fc8
	ld hl, Data_63102
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ret

Func_62fd5: ; 62fd5
	ld hl, Data_63072
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_63082
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_63092
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_630a2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_630b2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_630c2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_630d2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_630e2
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ld hl, Data_63042
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ret

Data_63042: ; 63042
	db $01, $ff, $7f, $7f, $0f, $e4, $58, $00, $00, $7f, $0f, $e4, $58, $00, $00, $00, $99, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $a1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_63072: ; 63072
	db $79, $5d, $08, $00, $0b, $8c, $d0, $f4, $60, $00, $00, $00, $00, $00, $00, $00

Data_63082: ; 63082
	db $79, $52, $08, $00, $0b, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0

Data_63092: ; 63092
	db $79, $47, $08, $00, $0b, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28

Data_630a2: ; 630a2
	db $79, $3c, $08, $00, $0b, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9

Data_630b2: ; 630b2
	db $79, $31, $08, $00, $0b, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e

Data_630c2: ; 630c2
	db $79, $26, $08, $00, $0b, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0

Data_630d2: ; 630d2
	db $79, $1b, $08, $00, $0b, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0

Data_630e2: ; 630e2
	db $79, $10, $08, $00, $0b, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea

Data_630f2: ; 630f2
	db $b9, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_63102: ; 63102
	db $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Func_63112: ; 63112
	ld a, $80
	ldh [rBGPI], a
	ld hl, rBGPD
	call Func_63123
	ld a, $80
	ldh [rOBPI], a
	ld hl, rOBPD
Func_63123: ; 63123 (18:7123)
	ld a, $4
.asm_63125
	ld [hl], $ff
	ld [hl], $7f
	ld [hl], c
	ld [hl], b
	ld [hl], e
	ld [hl], d
	ld [hl], $0
	ld [hl], $0
	ld [hl], $ff
	ld [hl], $7f
	ld [hl], e
	ld [hl], d
	ld [hl], c
	ld [hl], b
	ld [hl], $0
	ld [hl], $0
	dec a
	jr nz, .asm_63125
	ret

Func_63141:: ; 63141 (18:7141)
; a: system type
; returns: a = 1 if SGB, 0 else
	cp $11
	jr z, .cgb
	push af
	di
	ld bc, $3c
	call SGBWait
	call SGBInit
	jr c, .is_sgb
	; DMG
	pop af
	ld a, $20
	predef Func_7d753
	call Func_631f7
	ld a, $f0
	ldh [hBGP], a
	ld a, $1
	predef Func_7d78e
	call .Delay120
	xor a
	ret

.Delay120: ; 63167 (18:7167)
	ld b, 120
.delayLoop
	predef DelayFrame
	dec b
	jr nz, .delayLoop
	ret

.cgb
	ld a, $20
	predef Func_7d753
	call Func_631d0
	call Func_631f7
	ld a, $1
	predef Func_7d78e
	call .Delay120
	xor a
	ret

.is_sgb
	pop af
	ld a, $0
	predef Func_7d753
	ld bc, $2
	call SGBWait
	ld a, $20
	predef Func_7d753
	di
	call Func_62fd5
	call Func_631f7
	ld a, $1
	predef Func_7d78e
	ld bc, $2
	call SGBWait
	call .Delay120
	ld a, $0
	predef Func_7d753
	di
	ld bc, $2
	call SGBWait
	ld hl, Data_631c0
	call Func_62eb1
	ld bc, $4
	call SGBWait
	ei
	ld a, $1
	ret

Data_631c0: ; 631c0
	db $01, $ff, $7f, $10, $42, $08, $21, $00, $00, $10, $42, $08, $21, $00, $00, $00

Func_631d0: ; 631d0 (18:71d0)
	ld a, $1
	ldh [rVBK], a
	hlbgcoord 0, 0
	xor a
	ld bc, $800
.asm_631db
	ld [hli], a
	dec c
	jr nz, .asm_631db
	dec b
	jr nz, .asm_631db
	xor a
	ldh [rVBK], a
	bcRGB 31, 27, 03
	deRGB 04, 07, 22
	jp Func_63112

Func_631ee: ; 631ee
	bcRGB 23, 23, 23
	deRGB 15, 15, 15
	jp Func_63112

Func_631f7: ; 631f7 (18:71f7)
	ei
	ld de, HudsonLogoGFX
	ld hl, $9000
	ld bc, $800 ; bleeds into next file
	predef CopyPredef
	ld de, Data_639af
	hlbgcoord 0, 0
	ld bc, $400 ; bleeds into next file
	predef CopyPredef
	ret

HudsonLogoGFX: INCBIN "gfx/logo/6320f.w128.t6.2bpp" ; 6320f
Data_639af: INCBIN "gfx/logo/639af.tilemap" ; 639af

INCLUDE "engine/draw_hp_bar.asm"

Func_63ce1: ; 63ce1 (18:7ce1)
	ld c, $4
	scf
	ccf
.asm_63ce5
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_63ce5
	ld a, c
	jr nc, .asm_63cf2
	inc a
.asm_63cf2
	ret

Func_63cf3: ; 63cf3 (18:7cf3)
	ld c, $4
	scf
	ccf
.asm_63cf7
	ld a, [de]
	ld b, a
	ld a, [hl]
	adc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_63cf7
	ld a, c
	jr nc, .asm_63d04
	inc a
.asm_63d04
	ret

Func_63d05: ; 63d05 (18:7d05)
	call Coord2TileMap
	push hl
	ld l, e
	ld h, d
	pop de
	ld a, $0
	ld bc, hBGP
.asm_63d11
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d11
	ld bc, $64
	add hl, bc
	dec a
	jr nz, .asm_63d3a
	ld a, $8f
	ld [de], a
	inc de
	ld a, $0
	ld bc, -10
.asm_63d27
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d27
	ld bc, $a
	add hl, bc
	dec a
	jr nz, .asm_63d4c
	ld a, $8f
	ld [de], a
	inc de
	jr .asm_63d4e

.asm_63d3a
	ld [de], a
	inc de
	ld a, $0
	ld bc, -10
.asm_63d41
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d41
	dec a
	ld bc, $a
	add hl, bc
.asm_63d4c
	ld [de], a
	inc de
.asm_63d4e
	ld a, $0
	ld bc, -1
.asm_63d53
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d53
	dec a
	ld [de], a
	ret

Func_63d5c: ; 63d5c (18:7d5c)
	or a
	jr nz, .asm_63d71
	ld a, $98
	ld [wCurBGMapHi], a
	ld a, [wSCX]
	ld [wCurScreenX], a
	ld a, [wSCY]
	ld [wCurScreenY], a
	ret

.asm_63d71
	ld a, $9c
	ld [wCurBGMapHi], a
	ld a, [wSCX2]
	ld [wCurScreenX], a
	ld a, [wSCY2]
	ld [wCurScreenY], a
	ret

Func_63d83: ; 63d83 (18:7d83)
	ld a, c
	or a
	jp z, PutOnVideoTransferQueue
	cp $1
	jp z, Func_63e01
	cp $2
	jp z, Func_63d93
	ret

Func_63d93: ; 63d93 (18:7d93)
	ld a, [wCurScreenY]
	srl a
	srl a
	srl a
	add e
	and $1f
	ld c, $0
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	ld [wBGMapTransferRowStart], a
	ld a, [wCurBGMapHi]
	add c
	ld [wBGMapTransferRowStart + 1], a
	ld a, [wCurScreenX]
	srl a
	srl a
	srl a
	add d
	and $1f
	ld [wBGMapTransferColumnStart], a
	add b
	cp $21
	jr nc, asm_63de5
Func_63dd3: ; 63dd3 (18:7dd3)
	ld a, [wBGMapTransferRowStart]
	ld e, a
	ld a, [wBGMapTransferColumnStart]
	add e
	ld e, a
	ld a, [wBGMapTransferRowStart + 1]
	adc $0
	ld d, a
	jp PutOnVideoTransferQueue

asm_63de5:
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push hl
	call Func_63dd3
	xor a
	ld [wBGMapTransferColumnStart], a
	pop hl
	pop bc
	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld b, c
	jp Func_63dd3

Func_63e01: ; 63e01 (18:7e01)
	ld a, [wCurScreenY]
	srl a
	srl a
	srl a
	add l
	and $1f
	ld c, $0
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	ld [wBGMapTransferRowStart], a
	ld a, [wCurBGMapHi]
	add c
	ld [wBGMapTransferRowStart + 1], a
	ld a, [wCurScreenX]
	srl a
	srl a
	srl a
	add h
	and $1f
	ld [wBGMapTransferColumnStart], a
	add b
	cp $21
	jr nc, asm_63e53
Func_63e41: ; 63e41 (18:7e41)
	ld a, [wBGMapTransferRowStart]
	ld l, a
	ld a, [wBGMapTransferColumnStart]
	add l
	ld l, a
	ld a, [wBGMapTransferRowStart + 1]
	adc $0
	ld h, a
	jp PutOnVideoTransferQueue

asm_63e53:
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push de
	call Func_63e41
	xor a
	ld [wBGMapTransferColumnStart], a
	pop de
	pop bc
	ld a, e
	add b
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld b, c
	jp Func_63e41

Func_63e6f: ; 63e6f (18:7e6f)
	push bc
	ld b, $0
	ld a, h
	or a
	jr z, .asm_63e7e
	ld b, $1
	cp $1
	jr z, .asm_63e7e
	ld b, $ff
.asm_63e7e
	ld c, $0
	ld a, l
	or a
	jr z, .asm_63e8c
	ld c, $1
	cp $1
	jr z, .asm_63e8c
	ld c, $ff
.asm_63e8c
	ld a, b
	cp $ff
	jr z, asm_63ec7
	call Func_63d5c
	pop bc
	ld a, d
	sub b
	inc a
	ld d, b
	ld b, a
	ld a, e
	sub c
	inc a
	ld e, c
	ld c, a
	push bc
	ld l, e
	ld h, d
	call Coord2TileMap
	pop bc
	ld a, e
	cp $12
	jp c, Func_63eaf
	sub $12
	ld e, a
Func_63eaf: ; 63eaf (18:7eaf)
	push bc
	push hl
	push de
	ld c, $2
	call Func_63d83
	pop de
	inc e
	pop hl
	ld a, l
	add $14
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop bc
	dec c
	jr nz, Func_63eaf
	ret

asm_63ec7:
	ld a, c
	call Func_63d5c
	pop bc
	ld a, d
	sub b
	inc a
	ld d, b
	ld b, a
	ld a, e
	sub c
	inc a
	ld e, c
	ld c, a
	push bc
	ld l, e
	ld h, d
	call Coord2TileMap
	pop bc
	reg16swap de, hl
	ld a, l
	cp $12
	jp c, Func_63eea
	sub $12
	ld l, a
Func_63eea: ; 63eea (18:7eea)
	push bc
	push de
	push hl
	ld c, $1
	call Func_63d83
	pop hl
	inc l
	pop de
	ld a, e
	add $14
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop bc
	dec c
	jr nz, Func_63eea
	ret

