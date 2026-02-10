INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 3e 2", ROMX [$6fb2], BANK [$3e]
Func_fafb2:
	ret

Data_fafb3: ; fafb3
	db $04, $04, $0b, $09, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $3e, $ce, $7d, $05, $6c, $74, $05, $00, $00, $05, $00, $00, $03, $5a, $5d, $00, $00, $00, $da, $6f, $e7, $6f, $f4, $6f, $ff, $6f, $28, $c2, $c2, $de, $b7, $b6, $d7, $b1, $bf, $cc, $de, $29, $00, $28, $ca, $bc, $de, $d2, $b6, $d7, $b1, $bf, $cc, $de, $29, $00, $28, $c6, $c1, $bc, $de, $be, $af, $c3, $b2, $29, $00, $c3, $de, $ca, $de, $af, $b8, $de, $00

Data_fb007: ; fb007
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $04, $00, $00, $00, $d2, $6f, $02

Data_fb016: ; fb016
	db $04, $05, $0b, $07, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $3e, $ce, $7d, $05, $6c, $74, $05, $00, $00, $05, $00, $00, $03, $5a, $5d, $00, $00, $00

Data_fb035: ; fb035
	db $00, $00, $00, $00, $ff, $ff, $03, $00, $03, $00, $00, $00, $d2, $6f, $02

Data_fb044: ; fb044
	db $04, $05, $0b, $07, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $3e, $f7, $7e, $05, $6c, $74, $05, $00, $00, $05, $00, $00, $03, $5a, $5d, $00, $00, $00, $69, $70, $76, $70, $81, $70, $28, $ca, $bc, $de, $d2, $b6, $d7, $b1, $bf, $cc, $de, $29, $00, $28, $c6, $c1, $bc, $de, $be, $af, $c3, $b2, $29, $00, $c3, $de, $ca, $de, $af, $b8, $de, $00

Data_fb089: ; fb089
	db $00, $00, $00, $00, $ff, $ff, $03, $00, $03, $00, $00, $00, $63, $70, $02

Data_fb098: ; fb098
	db $04, $06, $0b, $05, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $3e, $f7, $7e, $05, $6c, $74, $05, $00, $00, $05, $00, $00, $03, $5a, $5d, $00, $00, $00

Data_fb0b7: ; fb0b7
	db $00, $00, $00, $00, $ff, $ff, $02, $00, $02, $00, $00, $00, $63, $70, $02

Func_fb0c6: ; fb0c6 (3e:70c6)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_fb0db:: ; fb0db (3e:70db)
	push hl
	add sp, -$30
	push de
	ldh a, [hSRAMBank]
	push af
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $38
	pop de
	ld bc, $2f
	call MemCopy
	ld a, $1
	call GetSRAMBank
	pop af
	pop de
	push af
	ld l, e
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	ld de, sSRAMRobots
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $2f
	call MemCopy
	pop af
	call GetSRAMBank
	add sp, $32
	ret

Func_fb118::
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
	cp $2
	jp z, Func_fb16e
	cp $1
	jp z, Func_fb15a
	or a
	jp nz, Func_fb187
	call FillVisibleAreaWithBlankTile
Func_fb13d: ; fb13d (3e:713d)
	callba_hli Func_59c89
	ld a, l
	and h
	inc a
	jp z, Func_fb154
	jp Func_fb157

Func_fb154: ; fb154 (3e:7154)
	jp Func_fb13d

Func_fb157: ; fb157 (3e:7157)
	jp Func_fb187

Func_fb15a: ; fb15a (3e:715a)
	callba_hli Func_5a3e1
	ld hl, $0
	jp Func_fb187

Func_fb16e: ; fb16e (3e:716e)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58cf2)
	ld de, Data_58cf2
	ld hl, Data_58cd3
	call FarCall
	ld hl, $0
Func_fb187: ; fb187 (3e:7187)
	call Func_3af6
	ld hl, $8000
	ret

Func_fb18e:: ; fb18e (3e:718e)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, $1
	ld [wSaveScratchBirthMonth], a
	ld a, $1
	ld [wSaveScratchBirthDay], a
	ld a, $9
	ld [wSaveScratchZodiacSign], a
	ld a, l
	call GetSRAMBank
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_fb1c8
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_fb1dc
Func_fb1c8: ; fb1c8 (3e:71c8)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_fb1dc: ; fb1dc (3e:71dc)
	ld hl, $1
	ret

Pointers_fb1e0:
	dw Data_fb1e6
	dw Data_fb1f9
	dw $0000

Data_fb1e6:
	dstr "(もちものかﾞ いっはﾟいなのてﾞ)"

Data_fb1f9:
	dstr "(そうこに おくるよ)"

Func_fb205:: ; fb205 (3e:7205)
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpAttrMapRectangle
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_fb0c6
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText
	ld bc, BANK(Pointers_fb1e0)
	ld de, Pointers_fb1e0
	ld hl, $10e
	call FarCall
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	pop hl
	pop de
	push hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	pop hl
	push de
	push hl
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreAttrMapRectangle
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_fb2ed:: ; fb2ed (3e:72ed)
	push af
	push bc
	push bc
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	get_party_bot
	ld de, $20
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$7
	ld [hl], $0
Func_fb328: ; fb328 (3e:7328)
	ld hl, sp+$7
	ld a, [hl]
	cp $3
	jp nc, Func_fb368
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	and $3f
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_fb328

Func_fb368: ; fb368 (3e:7368)
	pop af
	call GetSRAMBank
	pop hl
	push hl
	ld a, l
	and $f
	ld l, a
	ld h, $0
	pop de
	push hl
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$0
	call Func_fb3bb
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop hl
	push hl
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	get_party_bot
	ld de, $20
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetSRAMBank
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_fb3bb: ; fb3bb (3e:73bb)
	push hl
	add sp, -$14
	push de
	read_hl_from_sp_plus $18
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $15
	ld c, $0
	pop de
Func_fb3ce: ; fb3ce (3e:73ce)
	ld a, c
	cp $3
	jp nc, Func_fb41d
	push de
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_fb418
	push bc
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$4
	call GetMove
	pop bc
	read_hl_from_sp_plus $10
	ld h, $0
	ld a, l
	sub $aa
	or h
	jp nz, Func_fb418
	ld a, c
	inc a
	add a
	add a
	ld b, a
	read_hl_from_sp_plus $10
	ld l, h
	ld h, $0
	call LeftShiftHL
	push hl
	read_hl_from_sp_plus $17
	pop de
	ld a, l
	or e
	ld l, a
	ld a, h
	or d
	ld h, a
	write_hl_to_sp_plus $15
Func_fb418: ; fb418 (3e:7418)
	inc c
	pop de
	jp Func_fb3ce

Func_fb41d: ; fb41d (3e:741d)
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $18
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	add sp, $16
	ret

Func_fb42d:: ; fb42d (3e:742d)
	push af
	xor a
	ld [wc316], a
	ld hl, $0
	write_hl_to wc312
	ld hl, $0
	write_hl_to wc314
	pop af
	cp $27
	jp z, Func_fb556
	cp $26
	jp z, Func_fb54b
	cp $42
	jp z, Func_fb538
	cp $41
	jp z, Func_fb538
	cp $39
	jp z, Func_fb538
	cp $38
	jp z, Func_fb525
	cp $37
	jp z, Func_fb512
	cp $36
	jp z, Func_fb507
	cp $35
	jp z, Func_fb4fc
	cp $34
	jp z, Func_fb4f1
	cp $33
	jp z, Func_fb4e6
	cp $29
	jp z, Func_fb4db
	cp $32
	jp z, Func_fb4db
	cp $28
	jp z, Func_fb4d0
	cp $31
	jp z, Func_fb4d0
	cp $25
	jp z, Func_fb4c5
	cp $30
	jp z, Func_fb4c5
	cp $24
	jp z, Func_fb4ba
	cp $2f
	jp z, Func_fb4ba
	cp $c
	jp nz, Func_fb55e
	ld hl, $a
	write_hl_to wc312
	ld hl, $a
	write_hl_to wc314
	jp Func_fb55e

Func_fb4ba: ; fb4ba (3e:74ba)
	ld hl, $14
	write_hl_to wc312
	jp Func_fb55e

Func_fb4c5: ; fb4c5 (3e:74c5)
	ld hl, $32
	write_hl_to wc312
	jp Func_fb55e

Func_fb4d0: ; fb4d0 (3e:74d0)
	ld hl, $c8
	write_hl_to wc312
	jp Func_fb55e

Func_fb4db: ; fb4db (3e:74db)
	ld hl, 999
	write_hl_to wc312
	jp Func_fb55e

Func_fb4e6: ; fb4e6 (3e:74e6)
	ld hl, $14
	write_hl_to wc314
	jp Func_fb55e

Func_fb4f1: ; fb4f1 (3e:74f1)
	ld hl, $32
	write_hl_to wc314
	jp Func_fb55e

Func_fb4fc: ; fb4fc (3e:74fc)
	ld hl, $c8
	write_hl_to wc314
	jp Func_fb55e

Func_fb507: ; fb507 (3e:7507)
	ld hl, 999
	write_hl_to wc314
	jp Func_fb55e

Func_fb512: ; fb512 (3e:7512)
	ld hl, $64
	write_hl_to wc312
	ld hl, $64
	write_hl_to wc314
	jp Func_fb55e

Func_fb525: ; fb525 (3e:7525)
	ld hl, $c8
	write_hl_to wc312
	ld hl, $c8
	write_hl_to wc314
	jp Func_fb55e

Func_fb538: ; fb538 (3e:7538)
	ld hl, 999
	write_hl_to wc312
	ld hl, 999
	write_hl_to wc314
	jp Func_fb55e

Func_fb54b: ; fb54b (3e:754b)
	ld hl, $50
	write_hl_to wc312
	jp Func_fb55e

Func_fb556: ; fb556 (3e:7556)
	ld hl, $64
	write_hl_to wc312
Func_fb55e: ; fb55e (3e:755e)
	ret

Func_fb55f:: ; fb55f (3e:755f)
	add sp, -$24
	push af
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2
	reg16swap de, hl
	xor a
	call FarCall
	pop af
	ld l, a
	ld h, $0
	write_hl_to_sp_plus $16
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	xor a
	call FarCall
	add sp, $24
	ret

OptionsMenu_Redraw::
	ld c, l
	ld b, h
	push bc
	ld c, $3
	ld e, $7
	ld hl, $209
	call Func_fb0c6
	ld c, $3
	ld e, $7
	ld hl, $909
	call Func_fb0c6
	ld c, $5
	ld e, $7
	ld hl, $20b
	call Func_fb0c6
	ld c, $5
	ld e, $7
	ld hl, $90b
	call Func_fb0c6
	ld de, Data_fb67f
	ld hl, $40a
	call PlaceStringDEatCoordHL
	ld de, Data_fb683
	ld hl, $50c
	call PlaceStringDEatCoordHL
	ld de, Data_fb686
	ld hl, $50e
	call PlaceStringDEatCoordHL
	ld de, Data_fb689
	ld hl, $a0a
	call PlaceStringDEatCoordHL
	ld de, Data_fb690
	ld hl, $c0c
	call PlaceStringDEatCoordHL
	ld de, Data_fb693
	ld hl, $c0e
	call PlaceStringDEatCoordHL
	ld a, [wOptionsMenu_BattleScene]
	and $1
	add a
	add $c
	ld l, a
	push hl
	ld a, [wOptionsMenu_BattleScene]
	ld b, $2
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $3
	pop de
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_fb696
	push hl
	call PlaceString
	pop bc
	pop bc
	ld a, [wOptionsMenu_StereoSelect]
	add $2
	and $1
	add a
	add $c
	ld l, a
	push hl
	ld a, [wOptionsMenu_StereoSelect]
	add $2
	ld b, $2
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $3
	pop de
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_fb699
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $7
	push hl
	ld c, $e
	ld e, $9
	ld a, $2
	call DoublePushBGMapRegion
	pop bc
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $b
	add hl, bc
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	ret

Data_fb67f:
	dstr "アニメ"

Data_fb683:
	dstr "オン"

Data_fb686:
	dstr "オフ"

Data_fb689:
	dstr "スヒﾟーカー"

Data_fb690:
	dstr "オン"

Data_fb693:
	dstr "オフ"

Data_fb696:
	dstr "%c"

Data_fb699:
	dstr "%c"

Func_fb69c:
	push hl
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	add $2
	ld hl, sp+$0
	ld [hl], a
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	inc a
	ld c, a
	push bc
	call GetHLAtSPPlus6
	ld de, $9
	add hl, de
	ld c, [hl]
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld l, [hl]
	cp c
	jp nc, Func_fb6d4
	ld c, a
Func_fb6d4: ; fb6d4 (3e:76d4)
	ld a, l
	add c
	ld e, a
	pop bc
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_fb733
Func_fb6df: ; fb6df (3e:76df)
	ld a, l
	cp e
	jp nc, Func_fb730
	push de
	push bc
	push hl
	ld e, c
	ld hl, sp+$6
	ld a, [hl]
	call SetStringStartState
	pop hl
	inc l
	dec l
	jp nz, Func_fb701
	push hl
	ld hl, Data_fb773
	push hl
	call PlaceString
	pop bc
	pop hl
	jp Func_fb726

Func_fb701: ; fb701 (3e:7701)
	ld a, l
	cp $a
	jp nc, Func_fb718
	push hl
	ld h, $0
	push hl
	ld hl, Data_fb778
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
	jp Func_fb726

Func_fb718: ; fb718 (3e:7718)
	push hl
	ld h, $0
	push hl
	ld hl, Data_fb77c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
Func_fb726: ; fb726 (3e:7726)
	pop bc
	ld a, c
	add $2
	ld c, a
	inc l
	pop de
	jp Func_fb6df

Func_fb730: ; fb730 (3e:7730)
	jp Func_fb75f

Func_fb733: ; fb733 (3e:7733)
	ld a, l
Func_fb734: ; fb734 (3e:7734)
	cp e
	jp nc, Func_fb75f
	push de
	push bc
	push af
	ld e, c
	ld hl, sp+$6
	ld a, [hl]
	call SetStringStartState
	pop af
	pop bc
	push af
	push bc
	ld l, a
	ld h, $0
	inc hl
	push hl
	ld hl, Data_fb77f
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld a, c
	add $2
	ld c, a
	pop af
	inc a
	pop de
	jp Func_fb734

Func_fb75f: ; fb75f (3e:775f)
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus4
	call FarCall
	pop bc
	pop bc
	ret

Data_fb773:
	dstr "(ちか)"

Data_fb778:
	dstr " %d"

Data_fb77c:
	dstr "%d"

Data_fb77f:
	dstr " %d"

Func_fb783:: ; fb783 (3e:7783)
	push bc
	push hl
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
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
	ld l, [hl]
	push hl
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
	push af
	ld a, $2
.asm_fb7b5
	ld [wEnableAttrMapTransfer], a
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_fb0c6
	ld de, Data_fb7ee
	ld hl, $10e
	call PlaceStringDEatCoordHL
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_fb0c6
	pop hl
	call Func_fb69c
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	ret

Data_fb7ee:
	dstr "(なんかいにいく)?"

Func_fb7f9:: ; fb7f9 (3e:77f9)
	push bc
	push bc
	push bc
	push de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld a, e
	or d
	jp nz, Func_fb85a
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_fb857
	ld hl, $0
	call WriteHLToSPPlus4
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_fb857
	ld bc, $0
.asm_fb857
	jp Func_fb88c

Func_fb85a: ; fb85a (3e:785a)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	pop de
	call CompareHLtoDE
	jp c, Func_fb88c
	pop hl
	push hl
	dec hl
	call WriteHLToSPPlus4
	inc bc
	pop hl
	push hl
	add hl, bc
	push hl
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_fb88c
	dec bc
Func_fb88c: ; fb88c (3e:788c)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, $b
	push hl
	ld c, $4
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus6
	call Func_fb69c
	ld l, $b
	push hl
	ld c, $4
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Pointers_fb8c9:
	dw Data_fb8cd
	dw $0000

Data_fb8cd:
	dstr "(かいにいとﾞうするよ)"

Pointers_fb8da:
	dw Data_fb8de
	dw $0000

Data_fb8de:
	dstr "(にいとﾞうするよ)"

Func_fb8e9:: ; fb8e9 (3e:78e9)
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
	push hl
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_fb0c6
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop hl
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_fb945
	inc l
	dec l
	jp nz, Func_fb934
	push hl
	ld hl, Data_fba37
	push hl
	call PlaceString
	pop bc
	pop hl
	jp Func_fb942

Func_fb934: ; fb934 (3e:7934)
	push hl
	ld h, $0
	push hl
	ld hl, Data_fba3c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
Func_fb942: ; fb942 (3e:7942)
	jp Func_fb954

Func_fb945: ; fb945 (3e:7945)
	push hl
	ld h, $0
	inc hl
	push hl
	ld hl, Data_fba3f
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
Func_fb954: ; fb954 (3e:7954)
	push hl
	set_farcall_addrs_hli PrintMapText
	pop hl
	push hl
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_fb98c
	inc l
	dec l
	jp nz, Func_fb97d
	ld bc, BANK(Pointers_fb8da)
	ld de, Pointers_fb8da
	ld hl, $30e
	call FarCall
	jp Func_fb989

Func_fb97d: ; fb97d (3e:797d)
	ld bc, BANK(Pointers_fb8c9)
	ld de, Pointers_fb8c9
	ld hl, $30e
	call FarCall
Func_fb989: ; fb989 (3e:7989)
	jp Func_fb998

Func_fb98c: ; fb98c (3e:798c)
	ld bc, BANK(Pointers_fb8c9)
	ld de, Pointers_fb8c9
	ld hl, $30e
	call FarCall
Func_fb998: ; fb998 (3e:7998)
	callba_hli StartShakingScreen
	ld a, $5f
	call OverworldPlaySFX
	set_farcall_addrs_hli Func_b5db
	ld hl, $3c
	call FarCall
	callba_hli StopShakingScreen
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_fb0c6
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop hl
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_fba06
	inc l
	dec l
	jp nz, Func_fb9f5
	push hl
	ld hl, Data_fba42
	push hl
	call PlaceString
	pop bc
	pop hl
	jp Func_fba03

Func_fb9f5: ; fb9f5 (3e:79f5)
	push hl
	ld h, $0
	push hl
	ld hl, Data_fba4b
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
Func_fba03: ; fba03 (3e:7a03)
	jp Func_fba15

Func_fba06: ; fba06 (3e:7a06)
	push hl
	ld h, $0
	inc hl
	push hl
	ld hl, Data_fba56
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
Func_fba15: ; fba15 (3e:7a15)
	push hl
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	ld a, l
	ld [wc7de], a
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_fba33
	ld h, $0
	jp Func_fba36

Func_fba33: ; fba33 (3e:7a33)
	ld h, $0
	inc hl
Func_fba36: ; fba36 (3e:7a36)
	ret

Data_fba37:
	dstr "(ちか)"

Data_fba3c:
	dstr "%d"

Data_fba3f:
	dstr "%d"

Data_fba42:
	dstr "(ちか たﾞよ)"

Data_fba4b:
	dstr "%d (かいたﾞよ)"

Data_fba56:
	dstr "%d (かいたﾞよ)"

Pointers_fba61:
	dw Data_fba65
	dw $0000

Data_fba65:
	dstr "セーフﾞ(したよ)"

MainMenuSubmenu_Title:: ; fba6f (3e:7a6f)
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
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
	call Func_fb0c6
	ld de, Data_fbb91
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_fbb9d
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	reg16swap de, hl
	pop hl
	push de
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop de
	ld a, e
	or d
	jp nz, Func_fbb90
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
	call Func_fb0c6
	ld de, Data_fbbab
	ld hl, $10e
	call PlaceStringDEatCoordHL
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
	jp nz, Func_fbb6e
	callba_hli SaveGame
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_fb0c6
	set_farcall_addrs_hli PrintMapText
	ld bc, BANK(Pointers_fba61)
	ld de, Pointers_fba61
	ld hl, $10e
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
Func_fbb6e: ; fbb6e (3e:7b6e)
	call FillVisibleAreaWithBlankTile
	callba_hli Func_237be
	callba_hli Func_2380f
	call Func_03a4
Func_fbb90: ; fbb90 (3e:7b90)
	ret

Data_fbb91:
	dstr "タイトルメニュー(に)"

Data_fbb9d:
	dstr "(もとﾞるけとﾞ いい)?"

Data_fbbab:
	dstr "セーフﾞ(する)?"

Func_fbbb5:: ; fbbb5 (3e:7bb5)
	push bc
	push bc
	push hl
	check_cgb
	jp nz, Func_fbbe7
	set_farcall_addrs_hli Func_613fc
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_fbbfb

Func_fbbe7: ; fbbe7 (3e:7be7)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_fbbfb: ; fbbfb (3e:7bfb)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_1503d
	pop hl
	call FarCall
	ld c, $4
	ld e, $a
	ld hl, $0
	call Func_fb0c6
	ld de, Data_fbd22
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld e, $2
	ld a, $1
	call SetStringStartState
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_fbc70
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd2b
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_fbd13

Func_fbc70: ; fbc70 (3e:7c70)
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_fbc95
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd36
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_fbd13

Func_fbc95: ; fbc95 (3e:7c95)
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $3e8
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_fbcba
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd40
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_fbd13

Func_fbcba: ; fbcba (3e:7cba)
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_fbcdf
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd49
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_fbd13

Func_fbcdf: ; fbcdf (3e:7cdf)
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $1
	push hl
	ld hl, $86a0
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_fbd04
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd51
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_fbd13

Func_fbd04: ; fbd04 (3e:7d04)
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, Data_fbd58
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
Func_fbd13: ; fbd13 (3e:7d13)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop bc
	ret

Data_fbd22:
	dstr "(しょしﾞきん)"

Data_fbd2b:
	dstr "      %ldG"

Data_fbd36:
	dstr "     %ldG"

Data_fbd40:
	dstr "    %ldG"

Data_fbd49:
	dstr "   %ldG"

Data_fbd51:
	dstr "  %ldG"

Data_fbd58:
	dstr " %ldG"

Func_fbd5e:: ; fbd5e (3e:7d5e)
	or a
	jp nz, Func_fbd99
	inc e
	dec e
	jp nz, Func_fbd80
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_fb007)
	ld de, Data_fb007
	ld hl, Data_fafb3
	call FarCall
	jp Func_fbd96

Func_fbd80: ; fbd80 (3e:7d80)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_fb035)
	ld de, Data_fb035
	ld hl, Data_fb016
	call FarCall
Func_fbd96: ; fbd96 (3e:7d96)
	jp Func_fbdcd

Func_fbd99: ; fbd99 (3e:7d99)
	inc e
	dec e
	jp nz, Func_fbdb7
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_fb089)
	ld de, Data_fb089
	ld hl, Data_fb044
	call FarCall
	jp Func_fbdcd

Func_fbdb7: ; fbdb7 (3e:7db7)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_fb0b7)
	ld de, Data_fb0b7
	ld hl, Data_fb098
	call FarCall
Func_fbdcd: ; fbdcd (3e:7dcd)
	ret

Func_fbdce:
	ld c, l
	ld b, h
	push bc
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call PushBGMapRegion
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
	ld a, l
	sub $3
	or h
	jp z, Func_fbeb5
	ld a, l
	sub $2
	or h
	jp z, Func_fbe7f
	ld a, l
	dec a
	or h
	jp z, Func_fbe55
	ld a, l
	or h
	jp nz, Func_fbef3
	callba_hli LoadGame
	cp $ff
	jp z, Func_fbe52
	callba_hli Func_58df9
	or a
	jp nz, Func_fbe52
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $1
	ld e, $0
	xor a
	call FarCall
Func_fbe52: ; fbe52 (3e:7e52)
	jp Func_fbef3

Func_fbe55: ; fbe55 (3e:7e55)
	call NewSaveFileInWRam
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_fbef3

Func_fbe7f: ; fbe7f (3e:7e7f)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp Func_fbef3

Func_fbeb5: ; fbeb5 (3e:7eb5)
	callba_hli LoadDebugSaveState
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
Func_fbef3: ; fbef3 (3e:7ef3)
	ld hl, $8000
	ret

Func_fbef7:
	ld c, l
	ld b, h
	push bc
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call PushBGMapRegion
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
	ld a, l
	sub $2
	or h
	jp z, Func_fbf8b
	ld a, l
	dec a
	or h
	jp z, Func_fbf55
	ld a, l
	or h
	jp nz, Func_fbfc9
	call NewSaveFileInWRam
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_fbfc9

Func_fbf55: ; fbf55 (3e:7f55)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp Func_fbfc9

Func_fbf8b: ; fbf8b (3e:7f8b)
	callba_hli LoadDebugSaveState
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
Func_fbfc9: ; fbfc9 (3e:7fc9)
	ld hl, $8000
	ret

