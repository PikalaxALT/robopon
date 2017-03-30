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

Data_7129c_1c: ; $7129c
	dr $7129c, $712b9

Data_712b9_1c: ; $712b9
	dr $712b9, $74000

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

Data_7129c_1d: ; $7529c
	dr $7529c, $752b9

Data_712b9_1d: ; $752b9
	dr $752b9, $76800

SECTION "Audio Data 3", ROMX [$6a37], BANK [$1d]
Data_76a37:
	db $6c

Data_76a38:
	dr $76a38, $76c72

Data_76c72:
	dr $76c72, $78000
