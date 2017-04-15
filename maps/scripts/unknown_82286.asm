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
	ld [$c793], a
	ld de, Data_822af
	ld hl, Data_8225d
	call ScriptedBattle_20
	or a
	jp nz, Func_822a9
	jp Func_822ae

Func_822a9: ; 822a9 (20:62a9)
	ld a, $1
	ld [$c793], a
Func_822ae: ; 822ae (20:62ae)
	ret

Data_822af:
	db "ハﾞクﾞ$"

