Data_8230c: ; 8230c
	dr $8230c, $82335

Func_82335:
	ld a, e
	or a
	jp nz, Func_8235d
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_8235d
	xor a
	ld [wc793], a
	startbattle Data_8235e, Data_8230c
	or a
	jp nz, Func_82358
	jp Func_8235d

Func_82358: ; 82358 (20:6358)
	ld a, $1
	ld [wc793], a
Func_8235d: ; 8235d (20:635d)
	ret

Data_8235e:
	db "サヒﾞ", $00

