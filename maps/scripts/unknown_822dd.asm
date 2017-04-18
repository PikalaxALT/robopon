Data_822b4: ; 822b4
	dr $822b4, $822dd

Func_822dd:
	ld a, e
	or a
	jp nz, Func_82305
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_82305
	xor a
	ld [wc793], a
	startbattle Data_82306, Data_822b4
	or a
	jp nz, Func_82300
	jp Func_82305

Func_82300: ; 82300 (20:6300)
	ld a, $1
	ld [wc793], a
Func_82305: ; 82305 (20:6305)
	ret

Data_82306:
	db "<HIRA>のうむ<KATA>$"

