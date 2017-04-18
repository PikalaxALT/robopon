Data_82d42:
	dr $82d42, $82d63

Data_82d63: ; 82d63
	dr $82d63, $82d7f

Func_82d7f:
	call Func_82e00
	ld hl, Func_82e00
	call Func_80f11_20
	ld a, $4
	ld [wc7de], a
	ld e, $3
	ld hl, Data_82d42
	call LoadMapObjects_20
	ld e, $2
	ld hl, Data_82d63
	call Func_800fb_20
	playmusic $b
	call Func_8001c_20
	ld hl, $3cb
	call Func_80f72_20
	ret

Func_82dac:
	push af
	ld a, e
	or a
	jp nz, Func_82dce
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	writenpctext TreeBitstreamText_470a2
	playmusic $c
	ld e, $3
	xor a
	call Func_806a0_20
	playmusic $b
Func_82dce: ; 82dce (20:6dce)
	pop bc
	ret

Func_82dd0:
	push af
	ld a, e
	or a
	jp nz, Func_82df2
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	writenpctext TreeBitstreamText_470a2
	playmusic $c
	ld e, $4
	xor a
	call Func_806a0_20
	playmusic $b
Func_82df2: ; 82df2 (20:6df2)
	pop bc
	ret

Data_82df4:
	dr $82df4, $82dfa

Data_82dfa: ; 82dfa
	dr $82dfa, $82e00

Func_82e00: ; 82e00 (20:6e00)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82e0e
	ld hl, Data_82df4
	call Func_80d9b_20
Func_82e0e: ; 82e0e (20:6e0e)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82e1c
	ld hl, Data_82dfa
	call Func_80d9b_20
Func_82e1c: ; 82e1c (20:6e1c)
	call Func_80f02_20
	ret
