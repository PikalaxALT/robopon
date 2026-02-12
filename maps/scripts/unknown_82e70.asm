Data_82e20:
	db $08, $01, $01, $01, $00, $0d, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $0f, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_82e41: ; 82e41
	db $60, $02, $05, $11, $30

Data_82e46: ; 82e46
	wildbot $0, $1, $a, $9, $7b, $5, $a, $2e, $17, $5, $1e, $1, $8
	wildbot $0, $1, $a, $9, $7c, $5, $a, $7f, $2, $5, $0, $1, $4
	wildbot $0, $1, $a, $9, $92, $5, $a, $d, $e, $13, $0, $1, $2

Func_82e70::
	ld l, $0
	push hl
	ld c, $8
	ld e, $4
	xor a
	scall Func_80f24
	pop bc
	call Func_82ec2
	ld hl, Func_82ec2
	scall Func_80f11
	ld a, $5
	ld [wc7de], a
	loadwarps $3, Data_82e20
	ld e, $1
	ld hl, Data_82e41
	scall Func_80ce7
	ld a, $1
	scall Func_80d01
	loadwilds $3, Data_82e46
	playmusic SONG_SHOP
	scall FadeInMap
	landmarksign TreeBitstreamText_46c2b
	ret

Data_82eb6:
	db $06, $01, $01, $01, $09, $01

Data_82ebc: ; 82ebc
	db $06, $01, $01, $01, $0a, $01

Func_82ec2: ; 82ec2 (20:6ec2)
	ld a, [wc78c]
	cp $6
	jp nc, Func_82ed0
	ld hl, Data_82eb6
	scall Func_80d9b
Func_82ed0: ; 82ed0 (20:6ed0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82ede
	ld hl, Data_82ebc
	scall Func_80d9b
Func_82ede: ; 82ede (20:6ede)
	scall Func_80f02
	ret
