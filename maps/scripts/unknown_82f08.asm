
Data_82ee2:
	dr $82ee2, $82f03

Data_82f03: ; 82f03
	dr $82f03, $82f08

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
	ld hl, $3cd
	call Func_80f72_20
	ret

Data_82f35:
	dr $82f35, $82f3b

Data_82f3b: ; 82f3b
	dr $82f3b, $82f41

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
