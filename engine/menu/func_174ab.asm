HandleMenu:: ; 174ab (5:74ab)
; hl is the menu primary header.
; A 15-byte secondary header is loaded on the stack.  This header has not yet
; been deciphered.

; Menu primary headers are 31-byte structures with the following containers.
; First two bytes indicate the x and y coordinates of the top left corner.
; Next two bytes indicate the width and height of the window.
; If ???? is 0, the screen area behind this window is backed up to a
; dynamically-allocated location at the start and restored on exit.
; Each remaining three-byte object is a reactor function (bank, addr).
; If addr is 0, the reactor is undefined, and therefore it is not called.
; The reactors are identified below in the order in which they appear in the
; header:
; - Refresh
; - Exit
; - Up/Down
; - A
; - B
; - Right
; - Left
; - Loop
; - Select
; Menu reactors can return one of the following codes:
; $4000 - Loop back without refresh
; $8000 - Loop back with refresh
; $ffff - Exit

	push hl
	push bc
	push bc

	push bc
	ld hl, -1
	ld bc, $4000
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de

	push hl
	pop hl

	push hl
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	pop hl

	push hl
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop hl

	push hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	pop hl

	push hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e

	call GetHLAtSPPlus8
	ld de, $f
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, .trigger_enter_callback

	push bc
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	add hl, hl
	call malloc
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b

	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]

	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call BackUpTileMapRectangle

	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]

	push de
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call BackUpAttrMapRectangle
	pop bc

.trigger_enter_callback
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .skip_enter_callback

	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wFarCallDestBank], a

	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h

.skip_enter_callback
	push bc
	ld hl, sp+$4
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld hl, $0
	; clobbered
	pop bc
.loop
	ld a, c
	and b
	inc a
	jp nz, .enter_joypad_loop
	ld hl, -1
	jp .done

.enter_joypad_loop
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	; clobbered
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	; clobbered
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	; clobbered
	pop hl
	push hl
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .check_joypad
	pop hl
	push hl
	ld de, $19
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
.check_joypad
	push bc
	call CheckButton
	ld l, a
	pop bc
	ld a, l
	and D_UP
	jp z, .check_down
	push bc
	ld bc, $0
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_up
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	call FarCall
.no_action_up
	pop bc
	jp .next

.check_down
	ld a, l
	and D_DOWN
	jp z, .check_right
	push bc
	ld bc, $1
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_down
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	call FarCall
.no_action_down
	pop bc
	jp .next

.check_right
	ld a, l
	and D_RIGHT
	jp z, .check_left
	push bc
	ld hl, $2
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_right
	call GetHLAtSPPlus4
	ld de, $13
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus10
	call FarCall
.no_action_right
	pop bc
	jp .next

.check_left
	ld a, l
	and D_LEFT
	jp z, .check_a_button
	push bc
	ld hl, $3
	call GetHLAtSPPlus4
	ld de, $17
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_left
	call GetHLAtSPPlus4
	ld de, $16
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $17
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus10
	call FarCall
.no_action_left
	pop bc
	jp .next

.check_a_button
	ld a, l
	and A_BUTTON
	jp z, .check_select
	; pressed a button
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_a
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
.no_action_a
	jp .next

.check_select
	ld a, l
	and SELECT
	jp z, .check_b
	pop hl
	push hl
	ld de, $1d
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_action_select
	pop hl
	push hl
	ld de, $1c
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $1d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
.no_action_select
	jp .next

.check_b
	ld a, l
	and B_BUTTON
	jp z, .next
	pop hl
	push hl
	ld de, $11
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .press_b_quit
	pop hl
	push hl
	ld de, $10
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $11
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
	jp .next

.press_b_quit
	jp .done

.next
	ld hl, -1
	ld a, b
	sub high($8000)
	or c
	jp nz, .asm_1778d
	jp .trigger_enter_callback

.asm_1778d
	ld a, b
	sub high($4000)
	or c
	jp z, .jp_to_loop
	jp .done

.jp_to_loop
	jp .loop

.done
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .no_exit_callback
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
.no_exit_callback
	push bc
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp z, .quit
	ld a, [wc317]
	or a
	jp nz, .no_restore_window
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld hl, sp+$4
	ld l, [hl]
	push hl
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call RestoreTileMapRectangle
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call RestoreAttrMapRectangle
	ld hl, sp+$4
	ld l, [hl]
	push hl
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
.no_restore_window
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call free
.quit
	pop hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret
