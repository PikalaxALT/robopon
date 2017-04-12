Data_81cb4:
	dr $81cb4, $81cbf

Data_81cbf: ; 81cbf
	dr $81cbf, $81cd0

Data_81cd0: ; 81cd0
	dr $81cd0, $81cfa

Data_81cfa: ; 81cfa
	dr $81cfa, $81d40

Data_81d40: ; 81d40
	dr $81d40, $81d4e

Data_81d4e: ; 81d4e
	dr $81d4e, $81d6a

Func_81d6a:
	xor a
	ld [$c793], a
	ld e, $1
	ld hl, Data_81cb4
	call Func_8003a_20
	ld e, $1
	ld hl, Data_81cbf
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_81d95
	ld a, [$c793]
	cp $2
	jp z, Func_81d95
	ld a, [$c793]
	cp $3
	jp nz, Func_81df9
Func_81d95: ; 81d95 (20:5d95)
	ld a, [$c7df]
	cp $1a
	jp nz, Func_81db2
	ld a, [$c7e0]
	or a
	jp nz, Func_81db2
	ld e, $1
	ld hl, Data_81d40
	call Func_800fb_20
	call Func_81f41
	jp Func_81df6

Func_81db2: ; 81db2 (20:5db2)
	ld e, $1
	ld hl, Data_81cb4
	call Func_8003a_20
	ld hl, $a
	call Func_8062e_20
	or a
	jp nz, Func_81de6
	xor a
	call Func_80ee6_20
	xor a
	call Func_80653_20
	ld e, $5
	ld a, $3
	call Func_80664_20
	call Func_81e2b
	ld e, $1
	ld hl, $a
	call Func_8061b_20
	ld a, $1
	ld [$c78c], a
	jp Func_81df6

Func_81de6: ; 81de6 (20:5de6)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81df6: ; 81df6 (20:5df6)
	jp Func_81e22

Func_81df9: ; 81df9 (20:5df9)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld e, $5
	ld hl, Data_81cfa
	call Func_800fb_20
	ld a, $5
	call Func_80d01_20
	ld e, $2
	ld hl, Data_81d4e
	call Func_80d24_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	xor a
	ld [$c793], a
Func_81e22: ; 81e22 (20:5e22)
	ret

Data_81e23:
	dr $81e23, $81e27

Data_81e27: ; 81e27
	dr $81e27, $81e2b

Func_81e2b: ; 81e2b (20:5e2b)
	ld c, $6
	ld e, $1
	ld a, $1f
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld a, $67
	call Func_80efe_20
	ld hl, $3c
	call Func_8068f_20
	ld a, $66
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $34
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $35
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80ea2_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $38
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $36
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3a
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80eb1_20
	ld c, $6
	ld e, $2
	ld a, $1f
	call Func_80176_20
	call Func_801d5_20
	ld hl, $2
	call Func_80498_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call Func_8068f_20
	ld c, $1
	ld de, Data_81e23
	ld a, BANK(Data_81e23)
	call Func_8063e_20
	call Func_801d5_20
	ld a, $3b
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3c
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	call Func_80ea2_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $39
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld a, $3a
	call Func_1502
	ld hl, $1e
	call Func_8068f_20
	ld hl, $1e
	call Func_8068f_20
	call Func_80eb1_20
	ld hl, $1
	call Func_8068f_20
	ld hl, $3
	call Func_80498_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call Func_8068f_20
	call Func_8018b_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81e27
	ld a, BANK(Data_81e27)
	call Func_8063e_20
	call Func_8020c_20
	ret

Data_81f2d:
	dr $81f2d, $81f33

Data_81f33: ; 81f33
	dr $81f33, $81f37

Data_81f37: ; 81f37
	dr $81f37, $81f3d

Data_81f3d: ; 81f3d
	dr $81f3d, $81f41

Func_81f41: ; 81f41 (20:5f41)
	ld bc, $0
Func_81f44: ; 81f44 (20:5f44)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f63
	ld hl, $0
Func_81f52: ; 81f52 (20:5f52)
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f5f
	inc hl
	jp Func_81f52

Func_81f5f: ; 81f5f (20:5f5f)
	inc bc
	jp Func_81f44

Func_81f63: ; 81f63 (20:5f63)
	ld a, $67
	call Func_80efe_20
	ld bc, $0
Func_81f6b: ; 81f6b (20:5f6b)
	ld l, c
	ld h, b
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f8a
	ld hl, $0
Func_81f79: ; 81f79 (20:5f79)
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f86
	inc hl
	jp Func_81f79

Func_81f86: ; 81f86 (20:5f86)
	inc bc
	jp Func_81f6b

Func_81f8a: ; 81f8a (20:5f8a)
	call Func_8002b_20
	xor a
	call Func_80ee6_20
	xor a
	call Func_80653_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $8
	ld e, $1
	ld a, $1f
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld hl, $3c
	call Func_8068f_20
	ld a, $2e
	call Func_80efe_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld bc, Data_81f2d
	ld e, BANK(Data_81f2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call Func_80095_20
	ld hl, $14d
	call Func_804a9_20
	ld bc, Data_81f33
	ld e, BANK(Data_81f33)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld a, $2e
	call Func_80efe_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call Func_8068f_20
	ld c, $1
	ld de, Data_81f37
	ld a, BANK(Data_81f37)
	call Func_8063e_20
	call Func_801d5_20
	xor a
	call Func_80677_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call Func_8068f_20
	call Func_8018b_20
	ld hl, $1e
	call Func_8068f_20
	ld hl, $14e
	call Func_80498_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81f3d
	ld a, BANK(Data_81f3d)
	call Func_8063e_20
	ld a, $2e
	call Func_80efe_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
	ret

Func_82047:
	push de
	xor a
Func_82049: ; 82049 (20:6049)
	cp $14
	jp nc, Func_82057
	push af
	call Func_80c94_20
	pop af
	inc a
	jp Func_82049

Func_82057: ; 82057 (20:6057)
	pop de
	ld a, e
	cp $2
	jp nz, Func_82078
	xor a
	call Func_80653_20
	ld c, $32
	ld e, $0
	ld a, $1e
	call Func_80d87_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
Func_82078: ; 82078 (20:6078)
	ret

Func_82079:
	ld a, e
	cp $2
	jp nz, Func_8208b
	ld c, $6
	ld e, $1
	ld a, $2b
	call Func_80176_20
	call Func_801d5_20
Func_8208b: ; 8208b (20:608b)
	ret

Func_8208c:: ; 8208c (20:608c)
	cp $11
	jp z, Func_8224a
	cp $10
	jp z, Func_82235
	cp $f
	jp z, Func_82220
	cp $e
	jp z, Func_8220b
	cp $d
	jp z, Func_821f6
	cp $c
	jp z, Func_821e1
	cp $b
	jp z, Func_821cc
	cp $a
	jp z, Func_821b7
	cp $9
	jp z, Func_821a2
	cp $8
	jp z, Func_8218d
	cp $7
	jp z, Func_82178
	cp $6
	jp z, Func_82163
	cp $5
	jp z, Func_8214e
	cp $4
	jp z, Func_82139
	cp $3
	jp z, Func_82124
	cp $2
	jp z, Func_8210f
	cp $1
	jp z, Func_820fa
	or a
	jp nz, Func_8225c
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $2b
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_820fa: ; 820fa (20:60fa)
	ld a, $5a
	call Func_80efe_20
	ld l, $13
	push hl
	ld c, $d
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8210f: ; 8210f (20:610f)
	ld a, $5a
	call Func_80efe_20
	ld l, $16
	push hl
	ld c, $5
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82124: ; 82124 (20:6124)
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $10
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82139: ; 82139 (20:6139)
	ld a, $5a
	call Func_80efe_20
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	ld a, $8
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8214e: ; 8214e (20:614e)
	ld a, $5a
	call Func_80efe_20
	ld l, $e
	push hl
	ld c, $6
	ld e, $0
	ld a, $2
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82163: ; 82163 (20:6163)
	ld a, $5a
	call Func_80efe_20
	ld l, $2d
	push hl
	ld c, $5
	ld e, $0
	ld a, $9
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82178: ; 82178 (20:6178)
	ld a, $5a
	call Func_80efe_20
	ld l, $14
	push hl
	ld c, $11
	ld e, $0
	ld a, $15
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8218d: ; 8218d (20:618d)
	ld a, $5a
	call Func_80efe_20
	ld l, $10
	push hl
	ld c, $7
	ld e, $0
	ld a, $18
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821a2: ; 821a2 (20:61a2)
	ld a, $5a
	call Func_80efe_20
	ld l, $5
	push hl
	ld c, $7
	ld e, $0
	ld a, $1c
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821b7: ; 821b7 (20:61b7)
	ld a, $5a
	call Func_80efe_20
	ld l, $7
	push hl
	ld c, $9
	ld e, $0
	ld a, $1b
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821cc: ; 821cc (20:61cc)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $6
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821e1: ; 821e1 (20:61e1)
	ld a, $5a
	call Func_80efe_20
	ld l, $6
	push hl
	ld c, $7
	ld e, $0
	ld a, $1a
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821f6: ; 821f6 (20:61f6)
	ld a, $5a
	call Func_80efe_20
	ld l, $a
	push hl
	ld c, $10
	ld e, $0
	ld a, $6
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8220b: ; 8220b (20:620b)
	ld a, $5a
	call Func_80efe_20
	ld l, $17
	push hl
	ld c, $13
	ld e, $16
	ld a, $13
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82220: ; 82220 (20:6220)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $a
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82235: ; 82235 (20:6235)
	ld a, $5a
	call Func_80efe_20
	ld l, $4
	push hl
	ld c, $e
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8224a: ; 8224a (20:624a)
	ld a, $5a
	call Func_80efe_20
	ld l, $14
	push hl
	ld c, $5
	ld e, $a
	ld a, $12
	call Func_80dff_20
	pop bc
Func_8225c: ; 8225c (20:625c)
	ret

Data_8225d:
	dr $8225d, $82286

Func_82286:
	ld a, e
	or a
	jp nz, Func_822ae
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_822ae
	xor a
	ld [$c793], a
	ld de, Data_822af
	ld hl, Data_8225d
	call Func_80dd3_20
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

Data_822b4: ; 822b4
	dr $822b4, $822dd

Func_822dd:
	ld a, e
	or a
	jp nz, Func_82305
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_82305
	xor a
	ld [$c793], a
	ld de, Data_82306
	ld hl, Data_822b4
	call Func_80dd3_20
	or a
	jp nz, Func_82300
	jp Func_82305

Func_82300: ; 82300 (20:6300)
	ld a, $1
	ld [$c793], a
Func_82305: ; 82305 (20:6305)
	ret

Data_82306:
	db "<HIRA>のうむ<KATA>$"

Data_8230c: ; 8230c
	dr $8230c, $82335

Func_82335:
	ld a, e
	or a
	jp nz, Func_8235d
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_8235d
	xor a
	ld [$c793], a
	ld de, Data_8235e
	ld hl, Data_8230c
	call Func_80dd3_20
	or a
	jp nz, Func_82358
	jp Func_8235d

Func_82358: ; 82358 (20:6358)
	ld a, $1
	ld [$c793], a
Func_8235d: ; 8235d (20:635d)
	ret

Data_8235e:
	db "サヒﾞ$"

Data_82362: ; 82362
	dr $82362, $8238b

Func_8238b:
	ld a, e
	or a
	jp nz, Func_823b3
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_823b3
	xor a
	ld [$c793], a
	ld de, Data_823b4
	ld hl, Data_82362
	call Func_80dd3_20
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
