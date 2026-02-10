Pointers_56d8e:
	dw Data_56d90

Data_56d90:
	dstr "(ちょっとまってね)" ; Please wait...

SaveGame:: ; 56d9b (15:6d9b)
	ld hl, -$404
	add hl, sp
	ld sp, hl
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
	set_farcall_addrs_hli Func_da901
	ld de, $b03
	ld hl, $507
	call FarCall
	push hl
	ld c, $5
	read_hl_from Pointers_56d8e
	reg16swap de, hl
	ld hl, $ff07
	call Func_2951
	push hl
	callba_hli Func_4fef1
	xor a
.loop
	cp $9
	jp nc, .break1
	push af
	set_farcall_addrs_hli Func_933c1
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wc938
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	inc hl
	inc hl
	call FarCall
	pop af
	inc a
	jp .loop

.break1
	ldh a, [hSRAMBank]
	push af
	ld bc, 136 * 35
	ld hl, sWarehouse
	call WriteHLToSPPlus10
	ld hl, sSavedWarehouse
	call WriteHLToSPPlus8
.loop2
	ld e, c
	ld d, b
	dec d
	dec d
	dec d
	dec d
	ld hl, $0
	call CompareHLtoDE
	jp c, .saveBoxes
	jp .break2

.saveBoxes
	push bc
	ld a, BANK(sWarehouse)
	call GetSRAMBank_ReadOnly
	ld bc, $400
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld hl, sp+$c
	call CopyFromDEtoHL
	ld a, BANK(sSavedWarehouse)
	call GetSRAMBank
	ld bc, $400
	ld hl, sp+$c
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CopyFromDEtoHL
	pop bc
	dec b
	dec b
	dec b
	dec b
	call GetHLAtSPPlus10
	ld de, $400
	add hl, de
	call WriteHLToSPPlus10
	call GetHLAtSPPlus8
	ld de, $400
	add hl, de
	call WriteHLToSPPlus8
	jp .loop2

.break2
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld hl, sp+$c
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	pop bc
	ld hl, sp+$a
	push hl
	call GetHLAtSPPlus10
	pop de
	call CopyFromDEtoHL
	ld bc, $32
	ld de, wEventFlags
	ld hl, wSaveScratchEventFlags
	call CopyFromDEtoHL
	ld bc, $64
	ld de, wc789
	ld hl, wSaveScratchc789
	call CopyFromDEtoHL
	ld bc, $3c
	ld de, wc347
	ld hl, wSaveScratchc347
	call CopyFromDEtoHL
	read_hl_from wGameTimer
	write_hl_to wcb3b
	read_hl_from wGameTimer + 2
	write_hl_to wcb3b + 2
	ld de, wPlayerName
	ld hl, wSaveScratchPlayerName
	call CopyUntilNull
	ld a, $1
	call GetSRAMBank
	ld bc, $214
	ld de, wSaveBlock1
	ld hl, sSaveBlock1
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	ld bc, $a0
	ld de, wSaveBlock2
	ld hl, sSaveBlock2
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	ld bc, $dc
	ld de, wSaveBlock3
	ld hl, sSaveBlock3
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	ld bc, $fa
	ld de, wSaveBlock4
	ld hl, sSaveBlock4
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli CalcSaveChecksum
	xor a
	call FarCall
	push hl
	set_farcall_addrs_hli StoreSaveChecksum
	pop hl
	push hl
	ld e, $1
	call FarCall
	set_farcall_addrs_hli CalcSaveChecksum
	ld a, $1
	call FarCall
	reg16swap de, hl
	push de
	callba_hli SignSaveFiles
	set_farcall_addrs_hli ValidateSaveGameSignature
	pop de
	pop hl
	call CompareHLtoDE
	jp nz, .saveError
	call FarCall
	cp $ff
	jp nz, .quitOkay
.saveError
	ld e, $0
	ld hl, Data_56fb9
	call Func_2a3e
.quitOkay
	pop hl
	call Func_2887
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	ld hl, $404
	add hl, sp
	ld sp, hl
	ret

Data_56fb9:
	dstr "セーフﾞ エラー"

LoadGame:: ; 56fc2 (15:6fc2)
	ld hl, -$404
	add hl, sp
	ld sp, hl
	ldh a, [hSRAMBank]
	push af
	ld bc, 136 * 35
	ld hl, sSavedWarehouse
	call WriteHLToSPPlus6
	ld hl, sWarehouse
	call WriteHLToSPPlus4
.loop
	ld e, c
	ld d, b
	dec d
	dec d
	dec d
	dec d
	ld hl, $0
	call CompareHLtoDE
	jp c, .loadBoxes
	jp .load_game

.loadBoxes
	push bc
	ld a, BANK(sSavedWarehouse)
	call GetSRAMBank_ReadOnly
	ld bc, $400
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$8
	call CopyFromDEtoHL
	ld a, BANK(sWarehouse)
	call GetSRAMBank
	ld bc, $400
	ld hl, sp+$8
	push hl
	call GetHLAtSPPlus8
	pop de
	call CopyFromDEtoHL
	pop bc
	dec b
	dec b
	dec b
	dec b
	call GetHLAtSPPlus6
	ld de, $400
	add hl, de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	ld de, $400
	add hl, de
	call WriteHLToSPPlus4
	jp .loop

.load_game
	push bc
	ld a, $1
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$8
	call CopyFromDEtoHL
	ld a, $2
	call GetSRAMBank
	pop bc
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus6
	pop de
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld bc, $214
	ld de, sSaveBlock1
	ld hl, wSaveBlock1
	call CopyFromDEtoHL
	ld bc, $32
	ld de, wSaveBlock1 + $11d
	ld hl, wEventFlags
	call CopyFromDEtoHL
	ld bc, $64
	ld de, wSaveBlock1 + $14f
	ld hl, wc789
	call CopyFromDEtoHL
	ld bc, $3c
	ld de, wSaveBlock1 + $1d8
	ld hl, wc347
	call CopyFromDEtoHL
	read_hl_from wSaveBlock1 + $1bb
	write_hl_to wGameTimer
	read_hl_from wSaveBlock1 + $1bd
	write_hl_to wGameTimer + 2
	ld de, wSaveScratchPlayerName
	ld hl, wPlayerName
	call CopyUntilNull
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld bc, $a0
	ld de, sSaveBlock2
	ld hl, wSaveBlock2
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld bc, $dc
	ld de, sSaveBlock3
	ld hl, wSaveBlock3
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld bc, $fa
	ld de, sSaveBlock4
	ld hl, wSaveBlock4
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli CalcSaveChecksum
	xor a
	call FarCall
	push hl
	set_farcall_addrs_hli GetSaveChecksum
	ld a, $1
	call FarCall
	reg16swap de, hl
	push de
	set_farcall_addrs_hli ValidateSaveGameSignature
	pop de
	pop hl
	call CompareHLtoDE
	jp nz, .not_equal
	call FarCall
	cp $ff
	jp nz, .okay
.not_equal
	call NewSaveFileInWRam
	ld a, $ff
	jp .quit

.okay
	ld a, $1
	ld [wSaveFileExists], a
	xor a
.quit
	ld hl, $404
	add hl, sp
	ld sp, hl
	ret
