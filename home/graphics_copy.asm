
Decompress_ReadCBits:: ; 124e (0:124e)
	push de
	ld e, $0
.loop
	ld a, [hl]
	and b
	jr z, .no_carry
	scf
.no_carry
	rl e
	rrc b
	jr nc, .no_carry2
	inc hl
.no_carry2
	dec c
	jr nz, .loop
	ld a, e
	pop de
	ret

Decompress:: ; 1263 (0:1263)
	; source hl
	; dest de
	; size bc
	ld a, c
	add e
	ld [wDecompressEndAddress + 1], a
	ld a, b
	adc d
	ld [wDecompressEndAddress], a
	ld b, $80
.loop
	ld c, $1
	call Decompress_ReadCBits
	or a
	jr z, .not_literal
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld a, [wDecompressEndAddress]
	cp d
	jr nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jr nz, .loop
	jp .done

.not_literal
	ld c, $1
	call Decompress_ReadCBits
	or a
	jr nz, .not_one_byte
	; copy one byte literal from C bytes back in the destination
	; 5-bit param
	ld c, $5
	call Decompress_ReadCBits
	push hl
	inc a
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc $0
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ld a, [wDecompressEndAddress]
	cp d
	jr nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jr nz, .loop
	jp .done

.not_one_byte
; dest pointer de
; copy (u3)(c + $2) bytes from de - (u8)
; for copies $5 bytes and larger, use .asm_12de
	ld a, $0
	ld [wDecompressLiteralCopySize], a
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $2
	call Decompress_ReadCBits
	cp $3
	jr z, .asm_12de
	add $2
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc $0
	ld h, a
	jp .copy_block

.asm_12de
; dest pointer de
; copy (u5)(c + $5) bytes from de - (u9)
; for copies $14 bytes and larger, use .asm_1308
	ld c, $4
	call Decompress_ReadCBits
	cp $f
	jr z, .asm_1308
	add $5
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $1
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp .copy_block

.asm_1308
; dest pointer de
; copy (u8)(c + $20) bytes from de - (u10)
; for copies $275 bytes and larger, use .asm_1339
	ld c, $8
	call Decompress_ReadCBits
	cp $ff
	jr z, .asm_1339
	add $14
	ld [wDecompressLiteralCopySize + 1], a
	ld a, $0
	adc $0
	ld [wDecompressLiteralCopySize], a
	ld c, $2
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp .copy_block

.asm_1339
; dest pointer de
; copy (u12)(c + $113) bytes from de - (u11)
	ld c, $4
	call Decompress_ReadCBits
	ld c, a
	push bc
	ld c, $8
	call Decompress_ReadCBits
	add $13
	ld [wDecompressLiteralCopySize + 1], a
	pop bc
	ld a, c
	adc $1
	ld [wDecompressLiteralCopySize], a
	ld c, $3
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
.copy_block
	push bc
	ld a, [wDecompressLiteralCopySize + 1]
	ld c, a
	ld a, [wDecompressLiteralCopySize]
	ld b, a
	dec hl
.copy_block_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_block_loop
	pop bc
	pop hl
	ld a, [wDecompressEndAddress]
	cp d
	jp nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jp nz, .loop
.done
	ret

DecompressRequestRoboponPic::
	; index a
	; destination de
	push hl
	ld l, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(PoncotPicHeaders)
	call BankSwitch
	push bc
	push de
	ld h, $0
	sla l
	rl h
	sla l
	rl h
	ld bc, PoncotPicHeaders
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call BankSwitch
	; size = $40 + (c << 4)
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, $40
	add hl, bc
	ld c, l
	ld b, h
	ld l, e
	ld h, d
	pop de
	push bc
	push de
	call Decompress
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, -$40
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	ld a, BANK(FixAndLoadPoncotPicWithTilemap)
	call BankSwitch
	call FixAndLoadPoncotPicWithTilemap
	pop af
	call BankSwitch
	pop hl
	ret

RequestVideoTransferQueue:: ; 13ed (0:13ed)
	ld a, [wc24d]
	ld c, a
	ld hl, wVideoTransferQueue
.loop
	ld a, [hl]
	or a
	jr z, .done
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec c
	jr nz, .loop
	scf
.done
	ret

PutOnVideoTransferQueue:: ; 1405 (0:1405)
	ld a, [wLCDC]
	bit 7, a
	jr nz, .lcd_enabled
	ld c, b
	ld b, $0
	jp CopyFromDEtoHL

.lcd_enabled
	push hl
	push bc
.wait
	call RequestVideoTransferQueue
	jr c, .wait
	pop bc
	di
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop bc
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ei
	ret

RequestVideoData:: ; 1428 (0:1428)
; request bc bytes from de to hl
; requests are handled during vblank
	ld a, [wLCDC]
	bit 7, a
	jp z, CopyFromDEtoHL
.loop
	ld a, c
	sub $40
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	jr nc, .not_final_tile
	ld a, c
	add $40
	jr z, .done
	ld b, a
	call PutOnVideoTransferQueue
.done
	ret

.not_final_tile
	push bc
	push hl
	push de
	ld b, $40
	call PutOnVideoTransferQueue
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	pop bc
	jr .loop

FarCopyVideoData::
	ldh a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call CopyFromDEtoHL
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarRequestVideoData::
	ldh a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call RequestVideoData
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarDecompressVideoData::
	ldh a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call Decompress
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret
