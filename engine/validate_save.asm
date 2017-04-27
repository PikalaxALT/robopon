Data_798b: ; 798b
	db BANK(sWarehouse), BANK(sAllocatableBlock1), BANK(sAllocatableBlock1), BANK(sAllocatableBlock1), BANK(sAllocatableBlock1)
	db BANK(sSavedWarehouse), BANK(sSaveBlock1), BANK(sSaveBlock2), BANK(sSaveBlock3), BANK(sSaveBlock4)

Data_7995: ; 7995
	dw sWarehouse,      wSaveBlock1, wSaveBlock2, wSaveBlock3, wSaveBlock4
	dw sSavedWarehouse, sSaveBlock1, sSaveBlock2, sSaveBlock3, sSaveBlock4

Data_79a9: ; 79a9
	dw sSavedWarehouseEnd - sSavedWarehouse, sSaveBlock1End - sSaveBlock1, sSaveBlock2End - sSaveBlock2, sSaveBlock3End - sSaveBlock3, sSaveBlock4End - sSaveBlock4

CalcSaveChecksum:: ; 79b3 (1:79b3)
; a: Which to validate
	push af
	push bc
	ld a, [hSRAMBank]
	push af
	ld hl, $0
	call WriteHLToSPPlus4
	xor a
.loop
	cp $5
	jp nc, .done
	push af
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_798b
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetSRAMBank_ReadOnly
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_79a9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_7995
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CalcChecksum
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop af
	inc a
	jp .loop

.done
	pop af
	call GetSRAMBank
	pop hl
	push hl
	pop bc
	pop bc
	ret

SaveGameSignature: ; 7a23
	db "Robopon", $0

ValidateSaveGameSignature:: ; 7a2b (1:7a2b)
	push bc
	ld a, [hSRAMBank]
	push af
	ld hl, sp+$2
	ld [hl], $0
	ld a, BANK(sRoboponTitle)
	call GetSRAMBank_ReadOnly
	ld c, $0
.loop1
	ld a, c
	cp $7
	jp nc, .break1
	ld e, c
	ld d, $0
	ld hl, SaveGameSignature
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sRoboponTitle
	add hl, de
	cp [hl]
	jp z, .next1
	ld hl, sp+$2
	ld [hl], $ff
	jp .break1

.next1
	inc c
	jp .loop1

.break1
	ld a, BANK(sSavedRoboponTitle)
	call GetSRAMBank_ReadOnly
	ld c, $0
.loop2
	ld a, c
	cp $7
	jp nc, .break2
	ld e, c
	ld d, $0
	ld hl, SaveGameSignature
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sSavedRoboponTitle
	add hl, de
	cp [hl]
	jp z, .next2
	ld hl, sp+$2
	ld [hl], $ff
	jp .break2

.next2
	inc c
	jp .loop2

.break2
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

SignSaveFiles: ; 7a92
	ld a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank
	ld bc, $7
	ld de, SaveGameSignature
	ld hl, sRoboponTitle
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	ld bc, $7
	ld de, SaveGameSignature
	ld hl, sSavedRoboponTitle
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ret

StoreSaveChecksum: ; 7abc
	ld a, [hSRAMBank]
	push af
	inc e
	dec e
	jp nz, .saveToSRAM
	push hl
	ld a, BANK(sAllocatableBlock1)
	call GetSRAMBank
	pop hl
	write_hl_to wCheckSum
	jp .done

.saveToSRAM
	push hl
	ld a, BANK(sCheckSum)
	call GetSRAMBank
	pop hl
	write_hl_to sCheckSum
.done
	pop af
	call GetSRAMBank
	ret

GetSaveChecksum:: ; 7ae4 (1:7ae4)
	push af
	ld a, [hSRAMBank]
	ld e, a
	pop af
	push de
	or a
	jp nz, .save
	ld a, BANK(sAllocatableBlock1)
	call GetSRAMBank_ReadOnly
	read_hl_from wCheckSum
	jp .done

.save
	ld a, BANK(sCheckSum)
	call GetSRAMBank_ReadOnly
	read_hl_from sCheckSum
.done
	pop de
	push hl
	ld a, e
	call GetSRAMBank
	pop hl
	ret
