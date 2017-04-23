Data_8225d:
	dr $8225d, $82286

Func_82286:
	ld a, e
	or a
	jp nz, Func_822ae
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_822ae
	xor a
	ld [wc793], a
	startbattle Data_822af, Data_8225d
	or a
	jp nz, Func_822a9
	jp Func_822ae

Func_822a9: ; 822a9 (20:62a9)
	ld a, $1
	ld [wc793], a
Func_822ae: ; 822ae (20:62ae)
	ret

Data_822af:
	db "ハﾞクﾞ", $0

