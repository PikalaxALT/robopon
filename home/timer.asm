TimerInterrupt::
	push af
	push hl
	ld a, $0
	ld [rTAC], a
	ld a, -68
	ld [rTMA], a
	ld a, $4
	ld [rTAC], a
	ld hl, rIE
	res 2, [hl]
	ei
	push bc
	push de
	ld a, [wTimerCounter]
	inc a
	ld [wTimerCounter], a
	jr nz, .increment_frame_counter
	ld a, [wTimerCounter + 1]
	inc a
	ld [wTimerCounter + 1], a
.increment_frame_counter
	call UpdateSound
	call Func_2a49
	ld a, [wc208]
	or a
	jr z, .set_wc208
	inc a
	and $1f
	jr nz, .set_wc208
	ld [wJoyLast], a
	ld a, $18
.set_wc208
	ld [wc208], a
	ld a, [wc2e8]
	or a
	jr z, .check_stack_overflow
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank
	ld a, [hROMBank]
	push af
	ld a, BANK(Func_62ce4)
	call BankSwitch
	call Func_62ce4
	pop af
	call BankSwitch
	pop af
	call GetSRAMBank
.check_stack_overflow
	ld hl, sp+$0
	ld bc, $10000 - wStackBottom
	add hl, bc
	bit 7, h
	jr z, .no_stack_overflow
	ld hl, sp+$0
	ld a, [wFarCallDestAddr]
	ld e, a
	ld a, [wFarCallDestAddr + 1]
	ld d, a
	ld a, [wFarCallDestBank]
	ld c, a
	ld b, $0
	di
	ld sp, wStackTop
	jp Crash

.no_stack_overflow
	pop de
	pop bc
	ld hl, rIE
	set 2, [hl]
	pop hl
	pop af
	reti
