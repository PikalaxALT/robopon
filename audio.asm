INCLUDE "includes.asm"

INCLUDE "audio/engine.asm"

SECTION "Audio Data 1", ROMX [$4c12], BANK [$1c]
Data_70c12_1c: ; $70c12
	dw $c17b

Data_70c14_1c: ; $70c14
	dw $c187

Data_70c16_1c: ; $70c16
	dw $c193

Data_70c18_1c: ; $70c18
	dw $c19f

Data_70c1a_1c: ; $70c1a
	dr $70c1a, $70c22

Data_70c22_1c: ; $70c22
	dr $70c22, $70ccc

Data_70ccc_1c: ; $70ccc
	dr $70ccc, $70de4

Data_70de4_1c: ; $70de4
	dr $70de4, $70fa4

Data_70fa4_1c: ; $70fa4
	dr $70fa4, $7122e

Data_7122e_1c: ; $7122e
	dr $7122e, $7129b

Data_7129b_1c: ; $7129b
	dr $7129b, $7129c

SongBanks_1c: ; $7129c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_71318)
	db BANK(SongHeader_71321)
	db BANK(SongHeader_7132a)
	db BANK(SongHeader_71333)
	db BANK(SongHeader_7133c)
	db BANK(SongHeader_71345)
	db BANK(SongHeader_7534e)
	db BANK(SongHeader_75357)
	db BANK(SongHeader_75360)
	db BANK(SongHeader_75369)
	db BANK(SongHeader_75372)
	db BANK(SongHeader_7537b)
	db BANK(SongHeader_71384)
	db BANK(SongHeader_7138d)
	db BANK(SongHeader_71396)
	db BANK(SongHeader_7139f)
	db BANK(SongHeader_713a8)
	db BANK(SongHeader_713b1)
	db BANK(SongHeader_713ba)
	db BANK(SongHeader_713c3)
	db BANK(SongHeader_713cc)
	db BANK(SongHeader_753d5)
	db BANK(SongHeader_753de)
	db BANK(SongHeader_713e7)

SongPointers_1c: ; $712b9
	dw SongHeader_712f3
	dw SongHeader_712f4
	dw SongHeader_712fd
	dw SongHeader_71306
	dw SongHeader_7130f
	dw SongHeader_71318
	dw SongHeader_71321
	dw SongHeader_7132a
	dw SongHeader_71333
	dw SongHeader_7133c
	dw SongHeader_71345
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_71384
	dw SongHeader_7138d
	dw SongHeader_71396
	dw SongHeader_7139f
	dw SongHeader_713a8
	dw SongHeader_713b1
	dw SongHeader_713ba
	dw SongHeader_713c3
	dw SongHeader_713cc
	dw $0000
	dw $0000
	dw SongHeader_713e7

SongHeader_712f3: ; 712f3
	dr $712f3, $712f4

SongHeader_712f4: ; 712f4
	dr $712f4, $712fd

SongHeader_712fd: ; 712fd
	dr $712fd, $71306

SongHeader_71306: ; 71306
	dr $71306, $7130f

SongHeader_7130f: ; 7130f
	dr $7130f, $71318

SongHeader_71318: ; 71318
	dr $71318, $71321

SongHeader_71321: ; 71321
	dr $71321, $7132a

SongHeader_7132a: ; 7132a
	dr $7132a, $71333

SongHeader_71333: ; 71333
	dr $71333, $7133c

SongHeader_7133c: ; 7133c
	dr $7133c, $71345

SongHeader_71345: ; 71345
	dr $71345, $71384

SongHeader_71384: ; 71384
	dr $71384, $7138d

SongHeader_7138d: ; 7138d
	dr $7138d, $71396

SongHeader_71396: ; 71396
	dr $71396, $7139f

SongHeader_7139f: ; 7139f
	dr $7139f, $713a8

SongHeader_713a8: ; 713a8
	dr $713a8, $713b1

SongHeader_713b1: ; 713b1
	dr $713b1, $713ba

SongHeader_713ba: ; 713ba
	dr $713ba, $713c3

SongHeader_713c3: ; 713c3
	dr $713c3, $713cc

SongHeader_713cc: ; 713cc
	dr $713cc, $713e7

SongHeader_713e7: ; 713e7
	dr $713e7, $73f18

REPT $74000 - $73f18
	db $ff
ENDR

SECTION "Audio Data 2", ROMX [$4c12], BANK [$1d]
Data_70c12_1d: ; $74c12
	dw $c17b

Data_70c14_1d: ; $74c14
	dw $c187

Data_70c16_1d: ; $74c16
	dw $c193

Data_70c18_1d: ; $74c18
	dw $c19f

Data_70c1a_1d: ; $74c1a
	dr $74c1a, $74c22

Data_70c22_1d: ; $74c22
	dr $74c22, $74ccc

Data_70ccc_1d: ; $74ccc
	dr $74ccc, $74de4

Data_70de4_1d: ; $74de4
	dr $74de4, $74fa4

Data_70fa4_1d: ; $74fa4
	dr $74fa4, $7522e

Data_7122e_1d: ; $7522e
	dr $7522e, $7529b

Data_7129b_1d: ; $7529b
	dr $7529b, $7529c

SongBanks_1d: ; $7529c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_71318)
	db BANK(SongHeader_71321)
	db BANK(SongHeader_7132a)
	db BANK(SongHeader_71333)
	db BANK(SongHeader_7133c)
	db BANK(SongHeader_71345)
	db BANK(SongHeader_7534e)
	db BANK(SongHeader_75357)
	db BANK(SongHeader_75360)
	db BANK(SongHeader_75369)
	db BANK(SongHeader_75372)
	db BANK(SongHeader_7537b)
	db BANK(SongHeader_71384)
	db BANK(SongHeader_7138d)
	db BANK(SongHeader_71396)
	db BANK(SongHeader_7139f)
	db BANK(SongHeader_713a8)
	db BANK(SongHeader_713b1)
	db BANK(SongHeader_713ba)
	db BANK(SongHeader_713c3)
	db BANK(SongHeader_713cc)
	db BANK(SongHeader_753d5)
	db BANK(SongHeader_753de)
	db BANK(SongHeader_713e7)

SongPointers_1d: ; $752b9
	dw SongHeader_752f3
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_7534e
	dw SongHeader_75357
	dw SongHeader_75360
	dw SongHeader_75369
	dw SongHeader_75372
	dw SongHeader_7537b
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_753d5
	dw SongHeader_753de
	dw $0000

SongHeader_752f3: ; 752f3
	dr $752f3, $7534e

SongHeader_7534e: ; 7534e
	dr $7534e, $75357

SongHeader_75357: ; 75357
	dr $75357, $75360

SongHeader_75360: ; 75360
	dr $75360, $75369

SongHeader_75369: ; 75369
	dr $75369, $75372

SongHeader_75372: ; 75372
	dr $75372, $7537b

SongHeader_7537b: ; 7537b
	dr $7537b, $753d5

SongHeader_753d5: ; 753d5
	dr $753d5, $753de

SongHeader_753de: ; 753de
	dr $753de, $76800

SECTION "Audio Data 3", ROMX [$6a37], BANK [$1d]
INCLUDE "audio/sfx.asm"

REPT $78000 - $77f10
	db $ff
ENDR
