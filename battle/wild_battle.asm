StartBattle:: ; bbee (2:7bee)
	push bc
	add sp, -$1e
	push de
	push af
	ld c, a
	read_hl_from_sp_plus $24
	reg16swap de, hl
	ld hl, sp+$4
	call FarCopyUntilNull
	pop af
	pop de
	ld hl, sp+$0
	ld c, l
	ld b, h
	call Func_ba47
	callba_hli BattleIntro
	callba_hli Func_62865
	callba_hli DoBattle
	callba_hli Func_cced
	xor a
	ld [wc2fa], a
	ld a, $1
	call Func_bf4a
	push af
	or a
	jp z, Func_bc5a
	ld e, $0
	ld a, $1
	call Func_bb37
	jp Func_bc5e

Func_bc5a: ; bc5a (2:7c5a)
	xor a
	call FadeInMap
Func_bc5e: ; bc5e (2:7c5e)
	pop af
	cp $1
	jp nz, Func_bc68
	xor a
	jp Func_bc6a

Func_bc68: ; bc68 (2:7c68)
	ld a, $1
Func_bc6a: ; bc6a (2:7c6a)
	add sp, $20
	ret
