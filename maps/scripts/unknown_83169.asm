Data_8311a:
	dr $8311a, $8313f

Data_8313f: ; 8313f
	dr $8313f, $83169

Func_83169:
	call Func_831a2
	ld hl, Func_831a2
	call Func_80f11_20
	ld a, $8
	ld [wc7de], a
	loadwarps $3, Data_8311a
	loadpeople $3, Data_8313f
	playmusic $b
	call Func_8001c_20
	ld hl, $3cf
	call Func_80f72_20
	ret

Data_83196:
	dr $83196, $8319c

Data_8319c: ; 8319c
	dr $8319c, $831a2

Func_831a2: ; 831a2 (20:71a2)
	ld a, [wc78c]
	cp $9
	jp nc, Func_831b0
	ld hl, Data_83196
	call Func_80d9b_20
Func_831b0: ; 831b0 (20:71b0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_831be
	ld hl, Data_8319c
	call Func_80d9b_20
Func_831be: ; 831be (20:71be)
	call Func_80f02_20
	ret
