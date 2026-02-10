
Data_82ee2:
	db $08, $01, $01, $01, $00, $10, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $0e, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_82f03: ; 82f03
	db $61, $02, $04, $11, $30

Func_82f08:
	call Func_82f41
	ld hl, Func_82f41
	call Func_80f11_20
	ld a, $6
	ld [wc7de], a
	loadwarps $3, Data_82ee2
	ld e, $1
	ld hl, Data_82f03
	call Func_80ce7_20
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c33
	ret

Data_82f35:
	db $07, $01, $01, $01, $08, $01

Data_82f3b: ; 82f3b
	db $07, $01, $01, $01, $0a, $01

Func_82f41:
	ld a, [wc78c]
	cp $7
	jp nc, Func_82f4f
	ld hl, Data_82f35
	call Func_80d9b_20
Func_82f4f: ; 82f4f (20:6f4f)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82f5d
	ld hl, Data_82f3b
	call Func_80d9b_20
Func_82f5d: ; 82f5d (20:6f5d)
	call Func_80f02_20
	ret
