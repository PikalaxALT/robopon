
Data_82f61:
	dr $82f61, $82f82

Data_82f82: ; 82f82
	dr $82f82, $82f8c

Data_82f8c: ; 82f8c
	dr $82f8c, $82fa8

Func_82fa8:
	call Func_83006
	ld hl, Func_83006
	call Func_80f11_20
	ld a, $7
	ld [wc7de], a
	loadwarps $3, Data_82f61
	ld e, $2
	ld hl, Data_82f82
	call Func_80ce7_20
	playmusic $11
	ld a, [wc793]
	or a
	jp z, Func_82fe2
	ld a, [wc793]
	cp $1
	jp z, Func_82fe2
	ld a, [wc793]
	cp $2
	jp nz, Func_82ff0
Func_82fe2: ; 82fe2 (20:6fe2)
	loadpeople $2, Data_82f8c
	ld e, $0
	xor a
	call Func_8013d_20
Func_82ff0: ; 82ff0 (20:6ff0)
	call Func_8001c_20
	ld hl, $3ce
	call Func_80f72_20
	ret

Data_82ffa:
	dr $82ffa, $83000

Data_83000: ; 83000
	dr $83000, $83006

Func_83006: ; 83006 (20:7006)
	ld a, [wc78c]
	cp $8
	jp nc, Func_83014
	ld hl, Data_82ffa
	call Func_80d9b_20
Func_83014: ; 83014 (20:7014)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83022
	ld hl, Data_83000
	call Func_80d9b_20
Func_83022: ; 83022 (20:7022)
	call Func_80f02_20
	ret
