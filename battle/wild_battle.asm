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
	call LoadEnemyData
	callba_hli BattleIntro
	callba_hli LoadBattlePals
	callba_hli DoBattle
	callba_hli FreeMonsterStruct
	xor a
	ld [wInBattle], a
	ld a, $1
	call CheckBlackedOut
	push af
	or a
	jp z, .won
	ld e, $0
	ld a, $1
	call Func_bb37
	jp .get_return_value

.won: ; bc5a (2:7c5a)
	xor a
	call FadeInMap
.get_return_value: ; bc5e (2:7c5e)
	pop af
	cp $1
	jp nz, .return_success
	xor a
	jp .quit

.return_success: ; bc68 (2:7c68)
	ld a, $1
.quit: ; bc6a (2:7c6a)
	add sp, $20
	ret
