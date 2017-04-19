Data_82e20:
	dr $82e20, $82e41

Data_82e41: ; 82e41
	dr $82e41, $82e46

Data_82e46: ; 82e46
	wildbot $00, $01, $0a, $09, $7b, $05, $0a, $2e, $17, $05, $1e, $01, $08
	wildbot $00, $01, $0a, $09, $7c, $05, $0a, $7f, $02, $05, $00, $01, $04
	wildbot $00, $01, $0a, $09, $92, $05, $0a, $0d, $0e, $13, $00, $01, $02

Func_82e70:
	ld l, $0
	push hl
	ld c, $8
	ld e, $4
	xor a
	call Func_80f24_20
	pop bc
	call Func_82ec2
	ld hl, Func_82ec2
	call Func_80f11_20
	ld a, $5
	ld [wc7de], a
	ld e, $3
	ld hl, Data_82e20
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_82e41
	call Func_80ce7_20
	ld a, $1
	call Func_80d01_20
	loadwilds $3, Data_82e46
	playmusic $b
	call Func_8001c_20
	ld hl, $3cc
	call Func_80f72_20
	ret

Data_82eb6:
	dr $82eb6, $82ebc

Data_82ebc: ; 82ebc
	dr $82ebc, $82ec2

Func_82ec2: ; 82ec2 (20:6ec2)
	ld a, [wc78c]
	cp $6
	jp nc, Func_82ed0
	ld hl, Data_82eb6
	call Func_80d9b_20
Func_82ed0: ; 82ed0 (20:6ed0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82ede
	ld hl, Data_82ebc
	call Func_80d9b_20
Func_82ede: ; 82ede (20:6ede)
	call Func_80f02_20
	ret
