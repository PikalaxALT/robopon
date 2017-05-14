Data_6061f: ; 6061f
	dw $0

PrintMapText:: ; 60621
; h - x coordinate
; l - y coordinate
; de - string pointer table
; c - bank
; b - flags
	push hl
	push de
	add sp, -$4c
	push bc
	ld hl, sp+$4c
	ld [hl], $0
	ld hl, sp+$4b
	ld [hl], $1
	ld hl, sp+$4a
	ld [hl], $0
	ld hl, sp+$49
	ld [hl], $0
	ld hl, sp+$48
	ld [hl], $0
	read_hl_from Data_6061f
	write_hl_to_sp_plus $46
	read_hl_from_sp_plus $52
	ld e, h
	ld hl, sp+$47
	ld [hl], e
	read_hl_from_sp_plus $52
	ld e, l
	ld hl, sp+$46
	ld [hl], e
	ld hl, sp+$43
	ld [hl], c
	ld l, b
	ld h, $0
	ld a, l
	and $3
	ld l, a
	ld h, $0
	ld e, l
	push de
	ld a, b
	and $4
	jp nz, .bit_2_set
	ld hl, sp+$4c
	ld [hl], $1
.bit_2_set
	ld a, b
	and $8
	jp z, .bit_3_unset
	ld hl, sp+$4b
	ld a, $1
	ld [hl], a
	ld hl, sp+$4a
	ld [hl], a
.bit_3_unset
	ld a, b
	and $10
	jp z, .bit_4_unset
	ld hl, sp+$4a
	ld [hl], $1
.bit_4_unset
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop de
	pop bc
	ld a, e
	cp $2
	jp nz, .put_ffff_on_stack
	push de
	read_hl_from_sp_plus $50
	ld c, l
	ld b, h
	ld hl, sp+$41
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
.put_ffff_on_stack
	push bc
	push de
	ld hl, sp+$48
	ld e, [hl]
	ld hl, sp+$49
	ld a, [hl]
	call SetStringStartState
	pop de
	push de
	ld a, e
	cp $1
	jp z, .do_copy
	or a
	jp nz, .no_copy
.do_copy
	ld hl, sp+$45
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $2
	read_hl_from_sp_plus $52
	inc hl
	inc hl
	write_hl_to_sp_plus $52
	dec hl
	dec hl
	reg16swap de, hl
	ld hl, sp+$43
	call FarCopyVideoData
.no_copy
	pop de
	pop bc
	push de
	ld a, e
	cp $2
	jp z, .two
	cp $1
	jp z, .one
	or a
	jp nz, .next
	push bc
	ld hl, sp+$45
	ld c, [hl]
	read_hl_from_sp_plus $45
	reg16swap de, hl
	ld hl, sp+$4
	call FarCopyUntilNull
	pop bc
	jp .next

.one
	push bc
	read_hl_from_sp_plus $45
	reg16swap de, hl
	ld hl, sp+$4
	call LiteralStringInTree
	pop bc
	jp .next

.two
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld l, c
	ld h, b
	call PrintCharacterFromTree
	ld hl, sp+$4d
	ld [hl], a
	pop bc
.next
	push bc
	ld hl, sp+$4
	write_hl_to_sp_plus $45
	ld hl, sp+$4c
	ld a, [hl]
	or a
	jp z, .stack_manip
	ld hl, sp+$4
	push hl
	call PlaceString
	pop bc
	jp .asm_607dc

.stack_manip: ; 60744 (18:4744)
	read_hl_from_sp_plus $45
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $45
	ld hl, sp+$46
	ld [hl], a
	ld hl, sp+$46
	ld a, [hl]
	or a
	jp nz, .asm_6075b
	jp .asm_607dc

.asm_6075b: ; 6075b (18:475b)
	ld hl, sp+$46
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$46
	ld a, [hl]
	cp $28
	jp z, .asm_60772
	ld hl, sp+$46
	ld a, [hl]
	cp $29
	jp nz, .asm_60775
.asm_60772: ; 60772 (18:4772)
	jp .asm_607d9

.asm_60775: ; 60775 (18:4775)
	read_hl_from_sp_plus $45
	ld e, [hl]
	ld hl, sp+$46
	ld [hl], e
	ld hl, sp+$46
	ld a, [hl]
	cp "ﾞ"
	jp z, .asm_6078d
	ld hl, sp+$46
	ld a, [hl]
	cp "ﾟ"
	jp nz, .asm_6079d
.asm_6078d: ; 6078d (18:478d)
	ld hl, sp+$46
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $45
	inc hl
	write_hl_to_sp_plus $45
.asm_6079d: ; 6079d (18:479d)
	ld l, $2
	push hl
	ld c, $2
	ld hl, sp+$4a
	ld a, [hl]
	dec a
	ld e, a
	ld a, [wStringDestX]
	dec a
	call PushBGMapRegion
	pop bc
	ld l, $2
	push hl
	ld c, $2
	ld hl, sp+$4a
	ld a, [hl]
	dec a
	ld e, a
	ld a, [wStringDestX]
	dec a
	call PushBGMapRegion
	pop bc
	call CheckButton
	and $30
	jp z, .asm_607d9
	ld hl, sp+$4c
	ld [hl], $1
	read_hl_from_sp_plus $45
	push hl
	call PlaceString
	pop bc
	jp .asm_607dc

.asm_607d9: ; 607d9 (18:47d9)
	jp .stack_manip

.asm_607dc: ; 607dc (18:47dc)
	pop bc
	pop de
	push bc
	push de
	ld a, e
	cp $1
	jp z, .asm_607ea
	or a
	jp nz, .check_done_string
.asm_607ea: ; 607ea (18:47ea)
	ld hl, sp+$45
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $2
	read_hl_from_sp_plus $52
	reg16swap de, hl
	ld hl, sp+$43
	call FarCopyVideoData
	read_hl_from_sp_plus $45
	ld a, l
	or h
	jp nz, .check_done_string
	ld hl, sp+$4d
	ld [hl], $0
.check_done_string: ; 6080d (18:480d)
	pop de
	pop bc
	ld hl, sp+$49
	ld a, [hl]
	or a
	jp nz, .text_continues
	jp .blink_and_return

.text_continues: ; 60819 (18:4819)
	push bc
	push de
	ld hl, sp+$48
	ld a, [hl]
	cp $10
	jp nz, .not_newline
	ld hl, sp+$4e
	ld a, [hl]
	ld hl, sp+$4b
	add [hl]
	call StartCursorBlinking
	ld hl, sp+$4e
	ld [hl], $80
	ld hl, sp+$48
	ld [hl], $c
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
.not_newline: ; 6084a (18:484a)
	ld hl, sp+$48
	ld a, [hl]
	add $2
	ld hl, sp+$48
	ld [hl], a
	pop de
	pop bc
	jp .put_ffff_on_stack

.blink_and_return: ; 60857 (18:4857)
	ld hl, sp+$4a
	ld a, [hl]
	ld hl, sp+$46
	add [hl]
	call StartCursorBlinking
	push af
.blink_loop_before_return: ; 60861 (18:4861)
	call CheckButton
	or a
	jp nz, .blink_loop_before_return
	pop af
	add sp, $50
	ret
