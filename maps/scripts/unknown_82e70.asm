Data_82e20:
	dr $82e20, $82e41

Data_82e41: ; 82e41
	dr $82e41, $82e46

Data_82e46: ; 82e46
	wildbot $0, $1, $a, $9, $7b, $5, $a, $2e, $17, $5, $1e, $1, $8
	wildbot $0, $1, $a, $9, $7c, $5, $a, $7f, $2, $5, $0, $1, $4
	wildbot $0, $1, $a, $9, $92, $5, $a, $d, $e, $13, $0, $1, $2

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
	loadwarps $3, Data_82e20
	ld e, $1
	ld hl, Data_82e41
	call Func_80ce7_20
	ld a, $1
	call Func_80d01_20
	loadwilds $3, Data_82e46
	playmusic SONG_SHOP
	call FadeInMap_20
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
