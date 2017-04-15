Data_82bc1:
	dr $82bc1, $82be2

Data_82be2: ; 82be2
	dr $82be2, $82bfe

Data_82bfe: ; 82bfe
	dr $82bfe, $82c28

Data_82c28: ; 82c28
	dr $82c28, $82c44

Func_82c44:
	call Func_82d22
	ld hl, Func_82d22
	call Func_80f11_20
	ld a, $3
	ld [$c7de], a
	ld e, $3
	ld hl, Data_82bc1
	call LoadMapObjects_20
	ld e, $2
	ld hl, Data_82be2
	call Func_800fb_20
	ld a, [$c78c]
	cp $a
	jp c, Func_82c72
	ld e, $3
	ld hl, Data_82bfe
	call Func_800fb_20
Func_82c72: ; 82c72 (20:6c72)
	ld a, [$c78c]
	cp $f
	jp c, Func_82c82
	ld e, $2
	ld hl, Data_82c28
	call Func_800fb_20
Func_82c82: ; 82c82 (20:6c82)
	playmusic $b
	call Func_8001c_20
	ld hl, $3ca
	call Func_80f72_20
	ret

Func_82c91:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp z, Func_82ca3
	or a
	jp nz, Func_82ca8
	ld l, $a
	jp Func_82caa

Func_82ca3: ; 82ca3 (20:6ca3)
	ld l, $b
	jp Func_82caa

Func_82ca8: ; 82ca8 (20:6ca8)
	ld l, $c
Func_82caa: ; 82caa (20:6caa)
	ld a, e
	or a
	jp nz, Func_82cc7
	push hl
	ld hl, sp+$3
	ld a, [hl]
	call Func_8044b_20
	playmusic $c
	pop hl
	ld a, l
	ld e, $2
	call Func_806a0_20
	playmusic $b
Func_82cc7: ; 82cc7 (20:6cc7)
	pop bc
	ret

Func_82cc9:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp z, Func_82ce1
	cp $3
	jp z, Func_82ce1
	cp $1
	jp nz, Func_82ce6
	ld l, $a
	jp Func_82ce8

Func_82ce1: ; 82ce1 (20:6ce1)
	ld l, $b
	jp Func_82ce8

Func_82ce6: ; 82ce6 (20:6ce6)
	ld l, $c
Func_82ce8: ; 82ce8 (20:6ce8)
	ld a, e
	or a
	jp nz, Func_82d14
	push hl
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_82cfd
	ld hl, sp+$3
	ld a, [hl]
	dec a
	ld hl, sp+$3
	ld [hl], a
Func_82cfd: ; 82cfd (20:6cfd)
	ld hl, sp+$3
	ld a, [hl]
	call Func_8044b_20
	playmusic $c
	pop hl
	ld a, l
	ld e, $1
	call Func_806a0_20
	playmusic $b
Func_82d14: ; 82d14 (20:6d14)
	pop bc
	ret

Data_82d16:
	dr $82d16, $82d1c

Data_82d1c: ; 82d1c
	dr $82d1c, $82d22

Func_82d22: ; 82d22 (20:6d22)
	ld a, [$c78c]
	cp $4
	jp nc, Func_82d30
	ld hl, Data_82d16
	call Func_80d9b_20
Func_82d30: ; 82d30 (20:6d30)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82d3e
	ld hl, Data_82d1c
	call Func_80d9b_20
Func_82d3e: ; 82d3e (20:6d3e)
	call Func_80f02_20
	ret
