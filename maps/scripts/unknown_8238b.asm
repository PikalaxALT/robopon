Data_82362: ; 82362
	dr $82362, $8238b

Func_8238b:
	ld a, e
	or a
	jp nz, Func_823b3
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_823b3
	xor a
	ld [$c793], a
	startbattle Data_823b4, Data_82362
	or a
	jp nz, Func_823ae
	jp Func_823b3

Func_823ae: ; 823ae (20:63ae)
	ld a, $1
	ld [$c793], a
Func_823b3: ; 823b3 (20:63b3)
	ret

Data_823b4:
	db "イーヒﾟー$"
