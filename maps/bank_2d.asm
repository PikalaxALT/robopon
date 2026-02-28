INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2d", ROMX
	script_library 2d

Data_b50b4:
	warpdef $00, $1f, $02, $01, MAP_30_02, $01, $00, $01, $01, $2e
	warpdef $2f, $03, $01, $03, MAP_30_01, $00, $04, $01, $04, $2e
	warpdef $0c, $0b, $01, $01, MAP_12_00, $0d, $0f, $0d, $0e, $2e
	warpdef $25, $0b, $01, $01, MAP_02_00, $16, $07, $16, $08, $2e
	warpdef $2d, $12, $01, $01, MAP_22_01, $0b, $06, $0b, $07, $2e

Data_b50eb:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $66, $02, $02, $05, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $19, $23, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $14, $1e, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $66, $02, $02, $00, $0e, $0a, $00
ENDC

Data_b5131:
	db $4c, $10, $0a, $01, $32
	db $4d, $17, $03, $01, $45
	db $4e, $2c, $0c, $01, $41

Data_b5140:
	dw $472
	dw -1

Data_b5144:
	person_event $26, $04, $2d, $12, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b5140

Func_b5152:: ; b5152
	ld a, $14 ; B5152 (2d:5152) -> 3E 14
	ld [wc7e2], a ; B5154 (2d:5154) -> EA E2 C7
	ld e, $05 ; B5157 (2d:5157) -> 1E 05
	ld hl, Data_b50b4 ; B5159 (2d:5159) -> 21 B4 50
	scall LoadWarps ; B515C (2d:515c) -> CD 3A 40
	ld a, $03 ; B515F (2d:515f) -> 3E 03
	scall Func_80d01 ; B5161 (2d:5161) -> CD 01 4D
	ld e, $05 ; B5164 (2d:5164) -> 1E 05
	ld hl, Data_b50eb ; B5166 (2d:5166) -> 21 EB 50
	scall LoadEncounters ; B5169 (2d:5169) -> CD 24 4D
	ld e, $03 ; B516C (2d:516c) -> 1E 03
	ld hl, Data_b5131 ; B516E (2d:516e) -> 21 31 51
	scall Func_80ce7 ; B5171 (2d:5171) -> CD E7 4C
	ld hl, $0021 ; B5174 (2d:5174) -> 21 21 00
	scall CheckEventFlag ; B5177 (2d:5177) -> CD 2E 46
	or a ; B517A (2d:517a) -> B7
	jp nz, .asm_b5186 ; B517B (2d:517b) -> C2 86 51
	ld e, $01 ; B517E (2d:517e) -> 1E 01
	ld hl, Data_b5144 ; B5180 (2d:5180) -> 21 44 51
	scall LoadMapObjects ; B5183 (2d:5183) -> CD FB 40
.asm_b5186:
	ld a, $0a ; B5186 (2d:5186) -> 3E 0A
	scall PlayMusic ; B5188 (2d:5188) -> CD E6 4E
	ld a, $04 ; B518B (2d:518b) -> 3E 04
	scall LoadPlayerSprite ; B518D (2d:518d) -> CD C6 4C
	scall Func_8001c ; B5190 (2d:5190) -> CD 1C 40
	ret  ; B5193 (2d:5193) -> C9

Data_b5194:
	warpdef $00, $03, $01, $03, MAP_30_00, $2f, $04, $2e, $04, $2e
	warpdef $2e, $1f, $02, $01, MAP_30_03, $2e, $00, $2e, $01, $2e
	warpdef $0a, $12, $01, $01, MAP_25_01, $13, $09, $13, $0a, $2e
	warpdef $2e, $04, $01, $01, MAP_08_01, $05, $16, $05, $17, $2e

Data_b51c0:
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0f, $0a, $00

Data_b5206:
	db $4f, $29, $04, $01, $44
	db $50, $1d, $0b, $01, $4e
	db $51, $25, $12, $01, $37

Func_b5215:: ; b5215
	ld a, $14 ; B5215 (2d:5215) -> 3E 14
	ld [wc7e2], a ; B5217 (2d:5217) -> EA E2 C7
	ld e, $04 ; B521A (2d:521a) -> 1E 04
	ld hl, Data_b5194 ; B521C (2d:521c) -> 21 94 51
	scall LoadWarps ; B521F (2d:521f) -> CD 3A 40
	ld a, $03 ; B5222 (2d:5222) -> 3E 03
	scall Func_80d01 ; B5224 (2d:5224) -> CD 01 4D
	ld e, $05 ; B5227 (2d:5227) -> 1E 05
	ld hl, Data_b51c0 ; B5229 (2d:5229) -> 21 C0 51
	scall LoadEncounters ; B522C (2d:522c) -> CD 24 4D
	ld e, $03 ; B522F (2d:522f) -> 1E 03
	ld hl, Data_b5206 ; B5231 (2d:5231) -> 21 06 52
	scall Func_80ce7 ; B5234 (2d:5234) -> CD E7 4C
	ld a, $0a ; B5237 (2d:5237) -> 3E 0A
	scall PlayMusic ; B5239 (2d:5239) -> CD E6 4E
	ld a, $04 ; B523C (2d:523c) -> 3E 04
	scall LoadPlayerSprite ; B523E (2d:523e) -> CD C6 4C
	scall Func_8001c ; B5241 (2d:5241) -> CD 1C 40
	ret  ; B5244 (2d:5244) -> C9

Data_b5245:
	warpdef $00, $00, $02, $01, MAP_30_00, $01, $1f, $01, $1e, $2e
	warpdef $2f, $1d, $01, $03, MAP_30_03, $00, $1e, $01, $1e, $2e
	warpdef $01, $10, $01, $01, MAP_22_01, $01, $06, $01, $07, $2e
	warpdef $2d, $09, $01, $01, MAP_01_00, $07, $06, $07, $07, $2e

Data_b5271:
IF DEF(SUN)
	db $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	db $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	db $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	db $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	db $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	db $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	db $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	db $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	db $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ENDC

Data_b52b7:
	db $52, $0a, $11, $03, $27
	db $53, $0e, $1e, $01, $0f

Data_b52c1:
	dw $472
	dw -1

Data_b52c5:
	person_event $26, $04, $01, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b52c1

Func_b52d3:: ; b52d3
	ld a, $14 ; B52D3 (2d:52d3) -> 3E 14
	ld [wc7e2], a ; B52D5 (2d:52d5) -> EA E2 C7
	ld e, $04 ; B52D8 (2d:52d8) -> 1E 04
	ld hl, Data_b5245 ; B52DA (2d:52da) -> 21 45 52
	scall LoadWarps ; B52DD (2d:52dd) -> CD 3A 40
	ld a, $03 ; B52E0 (2d:52e0) -> 3E 03
	scall Func_80d01 ; B52E2 (2d:52e2) -> CD 01 4D
	ld e, $05 ; B52E5 (2d:52e5) -> 1E 05
	ld hl, Data_b5271 ; B52E7 (2d:52e7) -> 21 71 52
	scall LoadEncounters ; B52EA (2d:52ea) -> CD 24 4D
	ld e, $02 ; B52ED (2d:52ed) -> 1E 02
	ld hl, Data_b52b7 ; B52EF (2d:52ef) -> 21 B7 52
	scall Func_80ce7 ; B52F2 (2d:52f2) -> CD E7 4C
	ld hl, $0021 ; B52F5 (2d:52f5) -> 21 21 00
	scall CheckEventFlag ; B52F8 (2d:52f8) -> CD 2E 46
	or a ; B52FB (2d:52fb) -> B7
	jp nz, .asm_b5307 ; B52FC (2d:52fc) -> C2 07 53
	ld e, $01 ; B52FF (2d:52ff) -> 1E 01
	ld hl, Data_b52c5 ; B5301 (2d:5301) -> 21 C5 52
	scall LoadMapObjects ; B5304 (2d:5304) -> CD FB 40
.asm_b5307:
	ld a, $0a ; B5307 (2d:5307) -> 3E 0A
	scall PlayMusic ; B5309 (2d:5309) -> CD E6 4E
	ld a, $04 ; B530C (2d:530c) -> 3E 04
	scall LoadPlayerSprite ; B530E (2d:530e) -> CD C6 4C
	scall Func_8001c ; B5311 (2d:5311) -> CD 1C 40
	ret  ; B5314 (2d:5314) -> C9

Data_b5315:
	warpdef $00, $1d, $01, $03, MAP_30_02, $2f, $1e, $2e, $1e, $2e
	warpdef $2e, $00, $02, $01, MAP_30_01, $2e, $1f, $2e, $1e, $2e
	warpdef $18, $1e, $01, $01, MAP_11_00, $0e, $09, $0e, $0a, $2e
	warpdef $2e, $1e, $01, $01, MAP_03_15, $04, $0a, $04, $0b, $2e

Data_b5341:
	db $54, $07, $16, $02, $1f
	db $55, $01, $08, $01, $39

Data_b534b:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
ENDC

Func_b5391:: ; b5391
	ld a, $14 ; B5391 (2d:5391) -> 3E 14
	ld [wc7e2], a ; B5393 (2d:5393) -> EA E2 C7
	ld e, $04 ; B5396 (2d:5396) -> 1E 04
	ld hl, Data_b5315 ; B5398 (2d:5398) -> 21 15 53
	scall LoadWarps ; B539B (2d:539b) -> CD 3A 40
	ld e, $02 ; B539E (2d:539e) -> 1E 02
	ld hl, Data_b5341 ; B53A0 (2d:53a0) -> 21 41 53
	scall Func_80ce7 ; B53A3 (2d:53a3) -> CD E7 4C
	ld a, $03 ; B53A6 (2d:53a6) -> 3E 03
	scall Func_80d01 ; B53A8 (2d:53a8) -> CD 01 4D
	ld e, $05 ; B53AB (2d:53ab) -> 1E 05
	ld hl, Data_b534b ; B53AD (2d:53ad) -> 21 4B 53
	scall LoadEncounters ; B53B0 (2d:53b0) -> CD 24 4D
	ld a, $0a ; B53B3 (2d:53b3) -> 3E 0A
	scall PlayMusic ; B53B5 (2d:53b5) -> CD E6 4E
	ld a, $04 ; B53B8 (2d:53b8) -> 3E 04
	scall LoadPlayerSprite ; B53BA (2d:53ba) -> CD C6 4C
	scall Func_8001c ; B53BD (2d:53bd) -> CD 1C 40
	ret  ; B53C0 (2d:53c0) -> C9

Data_b53c1:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b53cc:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $07, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b53e2:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $54, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $28, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $12, $06, $06, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b5428:
	person_event $19, $0c, $0c, $0b, $01, $01, $03, $04, $00, NULL, NULL

Data_b5436:
	person_event $ff, $00, $0d, $02, $01, $01, $00, $04, $01, Func_b5576, NULL
	person_event $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, Func_b55be, NULL

Func_b5452:: ; b5452
	ld a, [wc790] ; B5452 (2d:5452) -> FA 90 C7
	or a ; B5455 (2d:5455) -> B7
	jp z, .asm_b5475 ; B5456 (2d:5456) -> CA 75 54
	ld a, [wc790] ; B5459 (2d:5459) -> FA 90 C7
	cp $03 ; B545C (2d:545c) -> FE 03
	jp nc, .asm_b5475 ; B545E (2d:545e) -> D2 75 54
	call Func_b556c ; B5461 (2d:5461) -> CD 6C 55
	ld hl, Func_b556c ; B5464 (2d:5464) -> 21 6C 55
	scall Func_80f11 ; B5467 (2d:5467) -> CD 11 4F
	ld e, $02 ; B546A (2d:546a) -> 1E 02
	ld hl, Data_b53cc ; B546C (2d:546c) -> 21 CC 53
	scall LoadWarps ; B546F (2d:546f) -> CD 3A 40
	jp .asm_b547d ; B5472 (2d:5472) -> C3 7D 54
.asm_b5475:
	ld e, $01 ; B5475 (2d:5475) -> 1E 01
	ld hl, Data_b53c1 ; B5477 (2d:5477) -> 21 C1 53
	scall LoadWarps ; B547A (2d:547a) -> CD 3A 40
.asm_b547d:
	ld a, $03 ; B547D (2d:547d) -> 3E 03
	scall Func_80d01 ; B547F (2d:547f) -> CD 01 4D
	ld e, $05 ; B5482 (2d:5482) -> 1E 05
	ld hl, Data_b53e2 ; B5484 (2d:5484) -> 21 E2 53
	scall LoadEncounters ; B5487 (2d:5487) -> CD 24 4D
	ld a, $0f ; B548A (2d:548a) -> 3E 0F
	ld [wc7e2], a ; B548C (2d:548c) -> EA E2 C7
	ld hl, $0034 ; B548F (2d:548f) -> 21 34 00
	scall CheckEventFlag ; B5492 (2d:5492) -> CD 2E 46
	or a ; B5495 (2d:5495) -> B7
	jp nz, .asm_b54c0 ; B5496 (2d:5496) -> C2 C0 54
	ld e, $01 ; B5499 (2d:5499) -> 1E 01
	ld hl, Data_b5428 ; B549B (2d:549b) -> 21 28 54
	scall LoadMapObjects ; B549E (2d:549e) -> CD FB 40
	ld e, $02 ; B54A1 (2d:54a1) -> 1E 02
	ld hl, Data_b5436 ; B54A3 (2d:54a3) -> 21 36 54
	scall LoadMapObjects ; B54A6 (2d:54a6) -> CD FB 40
	scall Func_8001c ; B54A9 (2d:54a9) -> CD 1C 40
	ld hl, $0314 ; B54AC (2d:54ac) -> 21 14 03
	scall LandmarkSign ; B54AF (2d:54af) -> CD 72 4F
	call Func_b5526 ; B54B2 (2d:54b2) -> CD 26 55
	ld e, $01 ; B54B5 (2d:54b5) -> 1E 01
	ld hl, $0034 ; B54B7 (2d:54b7) -> 21 34 00
	scall EventFlagAction ; B54BA (2d:54ba) -> CD 1B 46
	jp .asm_b551f ; B54BD (2d:54bd) -> C3 1F 55
.asm_b54c0:
	ld e, $02 ; B54C0 (2d:54c0) -> 1E 02
	ld hl, Data_b5436 ; B54C2 (2d:54c2) -> 21 36 54
	scall LoadMapObjects ; B54C5 (2d:54c5) -> CD FB 40
	ld a, $09 ; B54C8 (2d:54c8) -> 3E 09
	scall PlayMusic ; B54CA (2d:54ca) -> CD E6 4E
	ld a, [wBackupMapGroup] ; B54CD (2d:54cd) -> FA DF C7
	cp $1e ; B54D0 (2d:54d0) -> FE 1E
	jp nz, .asm_b5516 ; B54D2 (2d:54d2) -> C2 16 55
	ld a, [wBackupMapNumber] ; B54D5 (2d:54d5) -> FA E0 C7
	cp $08 ; B54D8 (2d:54d8) -> FE 08
	jp nz, .asm_b5516 ; B54DA (2d:54da) -> C2 16 55
	ld a, [wBackupMapX] ; B54DD (2d:54dd) -> FA DB C7
	cp $0b ; B54E0 (2d:54e0) -> FE 0B
	jp nz, .asm_b5516 ; B54E2 (2d:54e2) -> C2 16 55
	ld a, [wBackupMapY] ; B54E5 (2d:54e5) -> FA DC C7
	cp $0c ; B54E8 (2d:54e8) -> FE 0C
	jp nz, .asm_b5516 ; B54EA (2d:54ea) -> C2 16 55
	ld hl, $00ff ; B54ED (2d:54ed) -> 21 FF 00
	scall CheckEventFlag ; B54F0 (2d:54f0) -> CD 2E 46
	or a ; B54F3 (2d:54f3) -> B7
	jp nz, .asm_b550a ; B54F4 (2d:54f4) -> C2 0A 55
	xor a ; B54F7 (2d:54f7) -> AF
	scall Func_80653 ; B54F8 (2d:54f8) -> CD 53 46
	scall Func_8001c ; B54FB (2d:54fb) -> CD 1C 40
	ld hl, $0314 ; B54FE (2d:54fe) -> 21 14 03
	scall LandmarkSign ; B5501 (2d:5501) -> CD 72 4F
	call Func_b55fd ; B5504 (2d:5504) -> CD FD 55
	jp .asm_b5513 ; B5507 (2d:5507) -> C3 13 55
.asm_b550a:
	scall Func_8001c ; B550A (2d:550a) -> CD 1C 40
	ld hl, $0314 ; B550D (2d:550d) -> 21 14 03
	scall LandmarkSign ; B5510 (2d:5510) -> CD 72 4F
.asm_b5513:
	jp .asm_b551f ; B5513 (2d:5513) -> C3 1F 55
.asm_b5516:
	scall Func_8001c ; B5516 (2d:5516) -> CD 1C 40
	ld hl, $0314 ; B5519 (2d:5519) -> 21 14 03
	scall LandmarkSign ; B551C (2d:551c) -> CD 72 4F
.asm_b551f:
	ret  ; B551F (2d:551f) -> C9

Data_b5520:
	db $0c, $0c, $0b, $0c, $ff, $ff

Func_b5526:
	ld a, $0a ; B5526 (2d:5526) -> 3E 0A
	scall FadeOutAudio ; B5528 (2d:5528) -> CD F1 4F
	xor a ; B552B (2d:552b) -> AF
	scall PlayMusic ; B552C (2d:552c) -> CD E6 4E
	ld a, $01 ; B552F (2d:552f) -> 3E 01
	scall PlayerFace ; B5531 (2d:5531) -> CD 77 46
	ld a, $01 ; B5534 (2d:5534) -> 3E 01
	scall FadeInAudio ; B5536 (2d:5536) -> CD 1A 50
	ld a, $18 ; B5539 (2d:5539) -> 3E 18
	scall PlayMusic ; B553B (2d:553b) -> CD E6 4E
	ld hl, $012a ; B553E (2d:553e) -> 21 2A 01
	scall PrintTextWithNPCName ; B5541 (2d:5541) -> CD A9 44
	ld a, $18 ; B5544 (2d:5544) -> 3E 18
	scall PlayMusic ; B5546 (2d:5546) -> CD E6 4E
	ld bc, Data_b5520 ; B5549 (2d:5549) -> 01 20 55
	ld e, $2d ; B554C (2d:554c) -> 1E 2D
	xor a ; B554E (2d:554e) -> AF
	scall MovePersonAndWait ; B554F (2d:554f) -> CD 88 46
	scall WaitNPCStep ; B5552 (2d:5552) -> CD 0C 42
	ld a, $2e ; B5555 (2d:5555) -> 3E 2E
	scall PlaySFX ; B5557 (2d:5557) -> CD FE 4E
	ld e, $00 ; B555A (2d:555a) -> 1E 00
	xor a ; B555C (2d:555c) -> AF
	scall SetPersonVisibilityState ; B555D (2d:555d) -> CD 3D 41
	ld a, $09 ; B5560 (2d:5560) -> 3E 09
	scall PlayMusic ; B5562 (2d:5562) -> CD E6 4E
	ret  ; B5565 (2d:5565) -> C9

Data_b5566:
	db $0d, $02, $01, $01, $07, $01

Func_b556c:
	ld hl, Data_b5566 ; B556C (2d:556c) -> 21 66 55
	scall Func_80d9b ; B556F (2d:556f) -> CD 9B 4D
	scall Func_80f02 ; B5572 (2d:5572) -> CD 02 4F
	ret  ; B5575 (2d:5575) -> C9

Func_b5576:
	push bc ; B5576 (2d:5576) -> C5
	push bc ; B5577 (2d:5577) -> C5
	ld hl, sp+$03 ; B5578 (2d:5578) -> F8 03
	ld a, $ff ; B557A (2d:557a) -> 3E FF
	ld [hl], a ; B557C (2d:557c) -> 77
	ld hl, sp+$02 ; B557D (2d:557d) -> F8 02
	ld [hl], a ; B557F (2d:557f) -> 77
	ld a, e ; B5580 (2d:5580) -> 7B
	cp $02 ; B5581 (2d:5581) -> FE 02
	jp nz, .asm_b55bb ; B5583 (2d:5583) -> C2 BB 55
	ld hl, $0327 ; B5586 (2d:5586) -> 21 27 03
	scall LandmarkSign ; B5589 (2d:5589) -> CD 72 4F
	ld hl, sp+$00 ; B558C (2d:558c) -> F8 00
	ld a, [wMapX] ; B558E (2d:558e) -> FA D8 C2
	add a, $05 ; B5591 (2d:5591) -> C6 05
	ld [hl], a ; B5593 (2d:5593) -> 77
	ld a, [wPlayerFacing] ; B5594 (2d:5594) -> FA 38 C8
	or a ; B5597 (2d:5597) -> B7
	jp nz, .asm_b55a6 ; B5598 (2d:5598) -> C2 A6 55
	ld hl, sp+$01 ; B559B (2d:559b) -> F8 01
	ld a, [wMapY] ; B559D (2d:559d) -> FA D9 C2
	add a, $05 ; B55A0 (2d:55a0) -> C6 05
	ld [hl], a ; B55A2 (2d:55a2) -> 77
	jp .asm_b55ae ; B55A3 (2d:55a3) -> C3 AE 55
.asm_b55a6:
	ld hl, sp+$01 ; B55A6 (2d:55a6) -> F8 01
	ld a, [wMapY] ; B55A8 (2d:55a8) -> FA D9 C2
	add a, $03 ; B55AB (2d:55ab) -> C6 03
	ld [hl], a ; B55AD (2d:55ad) -> 77
.asm_b55ae:
	ld c, $01 ; B55AE (2d:55ae) -> 0E 01
	ld hl, sp+$00 ; B55B0 (2d:55b0) -> F8 00
	push de ; B55B2 (2d:55b2) -> D5
	push hl ; B55B3 (2d:55b3) -> E5
	pop de ; B55B4 (2d:55b4) -> D1
	pop hl ; B55B5 (2d:55b5) -> E1
	ld a, $2d ; B55B6 (2d:55b6) -> 3E 2D
	scall MovePlayer ; B55B8 (2d:55b8) -> CD 3E 46
.asm_b55bb:
	pop bc ; B55BB (2d:55bb) -> C1
	pop bc ; B55BC (2d:55bc) -> C1
	ret  ; B55BD (2d:55bd) -> C9

Func_b55be:
	ld a, e ; B55BE (2d:55be) -> 7B
	cp $02 ; B55BF (2d:55bf) -> FE 02
	jp nz, .asm_b55fc ; B55C1 (2d:55c1) -> C2 FC 55
	ld hl, $00b4 ; B55C4 (2d:55c4) -> 21 B4 00
	scall LandmarkSign ; B55C7 (2d:55c7) -> CD 72 4F
	ld e, $00 ; B55CA (2d:55ca) -> 1E 00
	ld hl, $00fe ; B55CC (2d:55cc) -> 21 FE 00
	scall EventFlagAction ; B55CF (2d:55cf) -> CD 1B 46
	xor a ; B55D2 (2d:55d2) -> AF
	scall Func_80653 ; B55D3 (2d:55d3) -> CD 53 46
	ld c, $01 ; B55D6 (2d:55d6) -> 0E 01
	ld e, $01 ; B55D8 (2d:55d8) -> 1E 01
	ld a, $09 ; B55DA (2d:55da) -> 3E 09
	scall LoadEmote ; B55DC (2d:55dc) -> CD 76 41
	ld a, $5a ; B55DF (2d:55df) -> 3E 5A
	scall PlaySFX ; B55E1 (2d:55e1) -> CD FE 4E
	scall WaitEmote ; B55E4 (2d:55e4) -> CD D5 41
	scall HideEmote ; B55E7 (2d:55e7) -> CD 8B 41
	ld a, $02 ; B55EA (2d:55ea) -> 3E 02
	scall PlayerFace ; B55EC (2d:55ec) -> CD 77 46
	ld l, $0c ; B55EF (2d:55ef) -> 2E 0C
	push hl ; B55F1 (2d:55f1) -> E5
	ld c, $0b ; B55F2 (2d:55f2) -> 0E 0B
	ld e, $08 ; B55F4 (2d:55f4) -> 1E 08
	ld a, $1e ; B55F6 (2d:55f6) -> 3E 1E
	scall Func_80dff ; B55F8 (2d:55f8) -> CD FF 4D
	pop bc ; B55FB (2d:55fb) -> C1
.asm_b55fc:
	ret  ; B55FC (2d:55fc) -> C9

Func_b55fd:
	ld a, $09 ; B55FD (2d:55fd) -> 3E 09
	scall PlayMusic ; B55FF (2d:55ff) -> CD E6 4E
	ld a, $02 ; B5602 (2d:5602) -> 3E 02
	scall PlayerFace ; B5604 (2d:5604) -> CD 77 46
	ld c, $01 ; B5607 (2d:5607) -> 0E 01
	ld e, $02 ; B5609 (2d:5609) -> 1E 02
	ld a, $09 ; B560B (2d:560b) -> 3E 09
	scall LoadEmote ; B560D (2d:560d) -> CD 76 41
	ld a, $37 ; B5610 (2d:5610) -> 3E 37
	scall PlaySFX ; B5612 (2d:5612) -> CD FE 4E
	scall WaitEmote ; B5615 (2d:5615) -> CD D5 41
	ld a, $01 ; B5618 (2d:5618) -> 3E 01
	scall Func_80653 ; B561A (2d:561a) -> CD 53 46
	ld hl, $0001 ; B561D (2d:561d) -> 21 01 00
	scall ScriptSleep ; B5620 (2d:5620) -> CD 8F 46
	scall HideEmote ; B5623 (2d:5623) -> CD 8B 41
	ld e, $01 ; B5626 (2d:5626) -> 1E 01
	ld hl, $00ff ; B5628 (2d:5628) -> 21 FF 00
	scall EventFlagAction ; B562B (2d:562b) -> CD 1B 46
	ret  ; B562E (2d:562e) -> C9

Data_b562f:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b563a:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b5680:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b56ba, NULL

Func_b568e:: ; b568e
	ld e, $01 ; B568E (2d:568e) -> 1E 01
	ld hl, Data_b562f ; B5690 (2d:5690) -> 21 2F 56
	scall LoadWarps ; B5693 (2d:5693) -> CD 3A 40
	ld a, $03 ; B5696 (2d:5696) -> 3E 03
	scall Func_80d01 ; B5698 (2d:5698) -> CD 01 4D
	ld e, $05 ; B569B (2d:569b) -> 1E 05
	ld hl, Data_b563a ; B569D (2d:569d) -> 21 3A 56
	scall LoadEncounters ; B56A0 (2d:56a0) -> CD 24 4D
	ld e, $01 ; B56A3 (2d:56a3) -> 1E 01
	ld hl, Data_b5680 ; B56A5 (2d:56a5) -> 21 80 56
	scall LoadMapObjects ; B56A8 (2d:56a8) -> CD FB 40
	ld a, $09 ; B56AB (2d:56ab) -> 3E 09
	scall PlayMusic ; B56AD (2d:56ad) -> CD E6 4E
	scall Func_8001c ; B56B0 (2d:56b0) -> CD 1C 40
	ld hl, $0313 ; B56B3 (2d:56b3) -> 21 13 03
	scall LandmarkSign ; B56B6 (2d:56b6) -> CD 72 4F
	ret  ; B56B9 (2d:56b9) -> C9

Func_b56ba:
	push bc ; B56BA (2d:56ba) -> C5
	push bc ; B56BB (2d:56bb) -> C5
	ld hl, sp+$03 ; B56BC (2d:56bc) -> F8 03
	ld a, $ff ; B56BE (2d:56be) -> 3E FF
	ld [hl], a ; B56C0 (2d:56c0) -> 77
	ld hl, sp+$02 ; B56C1 (2d:56c1) -> F8 02
	ld [hl], a ; B56C3 (2d:56c3) -> 77
	ld a, e ; B56C4 (2d:56c4) -> 7B
	cp $02 ; B56C5 (2d:56c5) -> FE 02
	jp nz, .asm_b56ff ; B56C7 (2d:56c7) -> C2 FF 56
	ld hl, $0327 ; B56CA (2d:56ca) -> 21 27 03
	scall LandmarkSign ; B56CD (2d:56cd) -> CD 72 4F
	ld hl, sp+$00 ; B56D0 (2d:56d0) -> F8 00
	ld a, [wMapX] ; B56D2 (2d:56d2) -> FA D8 C2
	add a, $05 ; B56D5 (2d:56d5) -> C6 05
	ld [hl], a ; B56D7 (2d:56d7) -> 77
	ld a, [wPlayerFacing] ; B56D8 (2d:56d8) -> FA 38 C8
	or a ; B56DB (2d:56db) -> B7
	jp nz, .asm_b56ea ; B56DC (2d:56dc) -> C2 EA 56
	ld hl, sp+$01 ; B56DF (2d:56df) -> F8 01
	ld a, [wMapY] ; B56E1 (2d:56e1) -> FA D9 C2
	add a, $05 ; B56E4 (2d:56e4) -> C6 05
	ld [hl], a ; B56E6 (2d:56e6) -> 77
	jp .asm_b56f2 ; B56E7 (2d:56e7) -> C3 F2 56
.asm_b56ea:
	ld hl, sp+$01 ; B56EA (2d:56ea) -> F8 01
	ld a, [wMapY] ; B56EC (2d:56ec) -> FA D9 C2
	add a, $03 ; B56EF (2d:56ef) -> C6 03
	ld [hl], a ; B56F1 (2d:56f1) -> 77
.asm_b56f2:
	ld c, $01 ; B56F2 (2d:56f2) -> 0E 01
	ld hl, sp+$00 ; B56F4 (2d:56f4) -> F8 00
	push de ; B56F6 (2d:56f6) -> D5
	push hl ; B56F7 (2d:56f7) -> E5
	pop de ; B56F8 (2d:56f8) -> D1
	pop hl ; B56F9 (2d:56f9) -> E1
	ld a, $2d ; B56FA (2d:56fa) -> 3E 2D
	scall MovePlayer ; B56FC (2d:56fc) -> CD 3E 46
.asm_b56ff:
	pop bc ; B56FF (2d:56ff) -> C1
	pop bc ; B5700 (2d:5700) -> C1
	ret  ; B5701 (2d:5701) -> C9

Data_b5702:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5718:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b575e:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5798, NULL

Func_b576c:: ; b576c
	ld e, $02 ; B576C (2d:576c) -> 1E 02
	ld hl, Data_b5702 ; B576E (2d:576e) -> 21 02 57
	scall LoadWarps ; B5771 (2d:5771) -> CD 3A 40
	ld a, $03 ; B5774 (2d:5774) -> 3E 03
	scall Func_80d01 ; B5776 (2d:5776) -> CD 01 4D
	ld e, $05 ; B5779 (2d:5779) -> 1E 05
	ld hl, Data_b5718 ; B577B (2d:577b) -> 21 18 57
	scall LoadEncounters ; B577E (2d:577e) -> CD 24 4D
	ld e, $01 ; B5781 (2d:5781) -> 1E 01
	ld hl, Data_b575e ; B5783 (2d:5783) -> 21 5E 57
	scall LoadMapObjects ; B5786 (2d:5786) -> CD FB 40
	ld a, $09 ; B5789 (2d:5789) -> 3E 09
	scall PlayMusic ; B578B (2d:578b) -> CD E6 4E
	scall Func_8001c ; B578E (2d:578e) -> CD 1C 40
	ld hl, $0312 ; B5791 (2d:5791) -> 21 12 03
	scall LandmarkSign ; B5794 (2d:5794) -> CD 72 4F
	ret  ; B5797 (2d:5797) -> C9

Func_b5798:
	push bc ; B5798 (2d:5798) -> C5
	push bc ; B5799 (2d:5799) -> C5
	ld hl, sp+$03 ; B579A (2d:579a) -> F8 03
	ld a, $ff ; B579C (2d:579c) -> 3E FF
	ld [hl], a ; B579E (2d:579e) -> 77
	ld hl, sp+$02 ; B579F (2d:579f) -> F8 02
	ld [hl], a ; B57A1 (2d:57a1) -> 77
	ld a, e ; B57A2 (2d:57a2) -> 7B
	cp $02 ; B57A3 (2d:57a3) -> FE 02
	jp nz, .asm_b57dd ; B57A5 (2d:57a5) -> C2 DD 57
	ld hl, $0327 ; B57A8 (2d:57a8) -> 21 27 03
	scall LandmarkSign ; B57AB (2d:57ab) -> CD 72 4F
	ld hl, sp+$00 ; B57AE (2d:57ae) -> F8 00
	ld a, [wMapX] ; B57B0 (2d:57b0) -> FA D8 C2
	add a, $05 ; B57B3 (2d:57b3) -> C6 05
	ld [hl], a ; B57B5 (2d:57b5) -> 77
	ld a, [wPlayerFacing] ; B57B6 (2d:57b6) -> FA 38 C8
	or a ; B57B9 (2d:57b9) -> B7
	jp nz, .asm_b57c8 ; B57BA (2d:57ba) -> C2 C8 57
	ld hl, sp+$01 ; B57BD (2d:57bd) -> F8 01
	ld a, [wMapY] ; B57BF (2d:57bf) -> FA D9 C2
	add a, $05 ; B57C2 (2d:57c2) -> C6 05
	ld [hl], a ; B57C4 (2d:57c4) -> 77
	jp .asm_b57d0 ; B57C5 (2d:57c5) -> C3 D0 57
.asm_b57c8:
	ld hl, sp+$01 ; B57C8 (2d:57c8) -> F8 01
	ld a, [wMapY] ; B57CA (2d:57ca) -> FA D9 C2
	add a, $03 ; B57CD (2d:57cd) -> C6 03
	ld [hl], a ; B57CF (2d:57cf) -> 77
.asm_b57d0:
	ld c, $01 ; B57D0 (2d:57d0) -> 0E 01
	ld hl, sp+$00 ; B57D2 (2d:57d2) -> F8 00
	push de ; B57D4 (2d:57d4) -> D5
	push hl ; B57D5 (2d:57d5) -> E5
	pop de ; B57D6 (2d:57d6) -> D1
	pop hl ; B57D7 (2d:57d7) -> E1
	ld a, $2d ; B57D8 (2d:57d8) -> 3E 2D
	scall MovePlayer ; B57DA (2d:57da) -> CD 3E 46
.asm_b57dd:
	pop bc ; B57DD (2d:57dd) -> C1
	pop bc ; B57DE (2d:57de) -> C1
	ret  ; B57DF (2d:57df) -> C9

Data_b57e0:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b57f6:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b583c:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5876, NULL

Func_b584a:: ; b584a
	ld e, $02 ; B584A (2d:584a) -> 1E 02
	ld hl, Data_b57e0 ; B584C (2d:584c) -> 21 E0 57
	scall LoadWarps ; B584F (2d:584f) -> CD 3A 40
	ld a, $03 ; B5852 (2d:5852) -> 3E 03
	scall Func_80d01 ; B5854 (2d:5854) -> CD 01 4D
	ld e, $05 ; B5857 (2d:5857) -> 1E 05
	ld hl, Data_b57f6 ; B5859 (2d:5859) -> 21 F6 57
	scall LoadEncounters ; B585C (2d:585c) -> CD 24 4D
	ld e, $01 ; B585F (2d:585f) -> 1E 01
	ld hl, Data_b583c ; B5861 (2d:5861) -> 21 3C 58
	scall LoadMapObjects ; B5864 (2d:5864) -> CD FB 40
	ld a, $09 ; B5867 (2d:5867) -> 3E 09
	scall PlayMusic ; B5869 (2d:5869) -> CD E6 4E
	scall Func_8001c ; B586C (2d:586c) -> CD 1C 40
	ld hl, $0311 ; B586F (2d:586f) -> 21 11 03
	scall LandmarkSign ; B5872 (2d:5872) -> CD 72 4F
	ret  ; B5875 (2d:5875) -> C9

Func_b5876:
	push bc ; B5876 (2d:5876) -> C5
	push bc ; B5877 (2d:5877) -> C5
	ld hl, sp+$03 ; B5878 (2d:5878) -> F8 03
	ld a, $ff ; B587A (2d:587a) -> 3E FF
	ld [hl], a ; B587C (2d:587c) -> 77
	ld hl, sp+$02 ; B587D (2d:587d) -> F8 02
	ld [hl], a ; B587F (2d:587f) -> 77
	ld a, e ; B5880 (2d:5880) -> 7B
	cp $02 ; B5881 (2d:5881) -> FE 02
	jp nz, .asm_b58bb ; B5883 (2d:5883) -> C2 BB 58
	ld hl, $0327 ; B5886 (2d:5886) -> 21 27 03
	scall LandmarkSign ; B5889 (2d:5889) -> CD 72 4F
	ld hl, sp+$00 ; B588C (2d:588c) -> F8 00
	ld a, [wMapX] ; B588E (2d:588e) -> FA D8 C2
	add a, $05 ; B5891 (2d:5891) -> C6 05
	ld [hl], a ; B5893 (2d:5893) -> 77
	ld a, [wPlayerFacing] ; B5894 (2d:5894) -> FA 38 C8
	or a ; B5897 (2d:5897) -> B7
	jp nz, .asm_b58a6 ; B5898 (2d:5898) -> C2 A6 58
	ld hl, sp+$01 ; B589B (2d:589b) -> F8 01
	ld a, [wMapY] ; B589D (2d:589d) -> FA D9 C2
	add a, $05 ; B58A0 (2d:58a0) -> C6 05
	ld [hl], a ; B58A2 (2d:58a2) -> 77
	jp .asm_b58ae ; B58A3 (2d:58a3) -> C3 AE 58
.asm_b58a6:
	ld hl, sp+$01 ; B58A6 (2d:58a6) -> F8 01
	ld a, [wMapY] ; B58A8 (2d:58a8) -> FA D9 C2
	add a, $03 ; B58AB (2d:58ab) -> C6 03
	ld [hl], a ; B58AD (2d:58ad) -> 77
.asm_b58ae:
	ld c, $01 ; B58AE (2d:58ae) -> 0E 01
	ld hl, sp+$00 ; B58B0 (2d:58b0) -> F8 00
	push de ; B58B2 (2d:58b2) -> D5
	push hl ; B58B3 (2d:58b3) -> E5
	pop de ; B58B4 (2d:58b4) -> D1
	pop hl ; B58B5 (2d:58b5) -> E1
	ld a, $2d ; B58B6 (2d:58b6) -> 3E 2D
	scall MovePlayer ; B58B8 (2d:58b8) -> CD 3E 46
.asm_b58bb:
	pop bc ; B58BB (2d:58bb) -> C1
	pop bc ; B58BC (2d:58bc) -> C1
	ret  ; B58BD (2d:58bd) -> C9

Func_b58be:
	scall Func_8001c ; B58BE (2d:58be) -> CD 1C 40
	ld hl, $0310 ; B58C1 (2d:58c1) -> 21 10 03
	scall LandmarkSign ; B58C4 (2d:58c4) -> CD 72 4F
	ret  ; B58C7 (2d:58c7) -> C9

Data_b58c8:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00,
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00,
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b590e:
	db $83, $00, $07, $02, $7c
	db $84, $06, $0d, $03, $2b
	db $85, $0b, $04, $01, $4a

Data_b591d:
	db $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, $2d, $d9, $59, $00, $00
	db $ff, $00, $09, $0a, $01, $01, $00, $04, $01, $2d, $18, $5a, $00, $00

Func_b5939:: ; b5939
	ld a, $03 ; B5939 (2d:5939) -> 3E 03
	scall Func_80d01 ; B593B (2d:593b) -> CD 01 4D
	ld e, $05 ; B593E (2d:593e) -> 1E 05
	ld hl, Data_b58c8 ; B5940 (2d:5940) -> 21 C8 58
	scall LoadEncounters ; B5943 (2d:5943) -> CD 24 4D
	ld e, $03 ; B5946 (2d:5946) -> 1E 03
	ld hl, Data_b590e ; B5948 (2d:5948) -> 21 0E 59
	scall Func_80ce7 ; B594B (2d:594b) -> CD E7 4C
	ld e, $02 ; B594E (2d:594e) -> 1E 02
	ld hl, Data_b591d ; B5950 (2d:5950) -> 21 1D 59
	scall LoadMapObjects ; B5953 (2d:5953) -> CD FB 40
	ld a, $09 ; B5956 (2d:5956) -> 3E 09
	scall PlayMusic ; B5958 (2d:5958) -> CD E6 4E
	ld a, [wBackupMapGroup] ; B595B (2d:595b) -> FA DF C7
	cp $1e ; B595E (2d:595e) -> FE 1E
	jp nz, .asm_b5998 ; B5960 (2d:5960) -> C2 98 59
	ld a, [wBackupMapNumber] ; B5963 (2d:5963) -> FA E0 C7
	cp $0d ; B5966 (2d:5966) -> FE 0D
	jp nz, .asm_b5998 ; B5968 (2d:5968) -> C2 98 59
	ld a, [wBackupMapX] ; B596B (2d:596b) -> FA DB C7
	cp $09 ; B596E (2d:596e) -> FE 09
	jp nz, .asm_b5998 ; B5970 (2d:5970) -> C2 98 59
	ld a, [wBackupMapY] ; B5973 (2d:5973) -> FA DC C7
	cp $0a ; B5976 (2d:5976) -> FE 0A
	jp nz, .asm_b5998 ; B5978 (2d:5978) -> C2 98 59
	ld hl, $00fe ; B597B (2d:597b) -> 21 FE 00
	scall CheckEventFlag ; B597E (2d:597e) -> CD 2E 46
	or a ; B5981 (2d:5981) -> B7
	jp nz, .asm_b5992 ; B5982 (2d:5982) -> C2 92 59
	xor a ; B5985 (2d:5985) -> AF
	scall Func_80653 ; B5986 (2d:5986) -> CD 53 46
	call Func_b58be ; B5989 (2d:5989) -> CD BE 58
	call Func_b5a57 ; B598C (2d:598c) -> CD 57 5A
	jp .asm_b5995 ; B598F (2d:598f) -> C3 95 59
.asm_b5992:
	call Func_b58be ; B5992 (2d:5992) -> CD BE 58
.asm_b5995:
	jp .asm_b59d8 ; B5995 (2d:5995) -> C3 D8 59
.asm_b5998:
	ld a, [wBackupMapGroup] ; B5998 (2d:5998) -> FA DF C7
	cp $1e ; B599B (2d:599b) -> FE 1E
	jp nz, .asm_b59d5 ; B599D (2d:599d) -> C2 D5 59
	ld a, [wBackupMapNumber] ; B59A0 (2d:59a0) -> FA E0 C7
	cp $04 ; B59A3 (2d:59a3) -> FE 04
	jp nz, .asm_b59d5 ; B59A5 (2d:59a5) -> C2 D5 59
	ld a, [wBackupMapX] ; B59A8 (2d:59a8) -> FA DB C7
	cp $0b ; B59AB (2d:59ab) -> FE 0B
	jp nz, .asm_b59d5 ; B59AD (2d:59ad) -> C2 D5 59
	ld a, [wBackupMapY] ; B59B0 (2d:59b0) -> FA DC C7
	cp $0c ; B59B3 (2d:59b3) -> FE 0C
	jp nz, .asm_b59d5 ; B59B5 (2d:59b5) -> C2 D5 59
	ld hl, $00fe ; B59B8 (2d:59b8) -> 21 FE 00
	scall CheckEventFlag ; B59BB (2d:59bb) -> CD 2E 46
	or a ; B59BE (2d:59be) -> B7
	jp nz, .asm_b59cf ; B59BF (2d:59bf) -> C2 CF 59
	xor a ; B59C2 (2d:59c2) -> AF
	scall Func_80653 ; B59C3 (2d:59c3) -> CD 53 46
	call Func_b58be ; B59C6 (2d:59c6) -> CD BE 58
	call Func_b5a57 ; B59C9 (2d:59c9) -> CD 57 5A
	jp .asm_b59d2 ; B59CC (2d:59cc) -> C3 D2 59
.asm_b59cf:
	call Func_b58be ; B59CF (2d:59cf) -> CD BE 58
.asm_b59d2:
	jp .asm_b59d8 ; B59D2 (2d:59d2) -> C3 D8 59
.asm_b59d5:
	call Func_b58be ; B59D5 (2d:59d5) -> CD BE 58
.asm_b59d8:
	ret  ; B59D8 (2d:59d8) -> C9

Func_b59d9:
	ld a, e ; B59D9 (2d:59d9) -> 7B
	cp $02 ; B59DA (2d:59da) -> FE 02
	jp nz, .asm_b5a17 ; B59DC (2d:59dc) -> C2 17 5A
	ld hl, $046c ; B59DF (2d:59df) -> 21 6C 04
	scall LandmarkSign ; B59E2 (2d:59e2) -> CD 72 4F
	ld e, $00 ; B59E5 (2d:59e5) -> 1E 00
	ld hl, $00ff ; B59E7 (2d:59e7) -> 21 FF 00
	scall EventFlagAction ; B59EA (2d:59ea) -> CD 1B 46
	xor a ; B59ED (2d:59ed) -> AF
	scall Func_80653 ; B59EE (2d:59ee) -> CD 53 46
	ld c, $01 ; B59F1 (2d:59f1) -> 0E 01
	ld e, $01 ; B59F3 (2d:59f3) -> 1E 01
	ld a, $09 ; B59F5 (2d:59f5) -> 3E 09
	scall LoadEmote ; B59F7 (2d:59f7) -> CD 76 41
	ld a, $5a ; B59FA (2d:59fa) -> 3E 5A
	scall PlaySFX ; B59FC (2d:59fc) -> CD FE 4E
	scall WaitEmote ; B59FF (2d:59ff) -> CD D5 41
	scall HideEmote ; B5A02 (2d:5a02) -> CD 8B 41
	ld a, $02 ; B5A05 (2d:5a05) -> 3E 02
	scall PlayerFace ; B5A07 (2d:5a07) -> CD 77 46
	ld l, $0c ; B5A0A (2d:5a0a) -> 2E 0C
	push hl ; B5A0C (2d:5a0c) -> E5
	ld c, $0b ; B5A0D (2d:5a0d) -> 0E 0B
	ld e, $04 ; B5A0F (2d:5a0f) -> 1E 04
	ld a, $1e ; B5A11 (2d:5a11) -> 3E 1E
	scall Func_80dff ; B5A13 (2d:5a13) -> CD FF 4D
	pop bc ; B5A16 (2d:5a16) -> C1
.asm_b5a17:
	ret  ; B5A17 (2d:5a17) -> C9

Func_b5a18:
	ld a, e ; B5A18 (2d:5a18) -> 7B
	cp $02 ; B5A19 (2d:5a19) -> FE 02
	jp nz, .asm_b5a56 ; B5A1B (2d:5a1b) -> C2 56 5A
	ld hl, $0464 ; B5A1E (2d:5a1e) -> 21 64 04
	scall LandmarkSign ; B5A21 (2d:5a21) -> CD 72 4F
	ld e, $00 ; B5A24 (2d:5a24) -> 1E 00
	ld hl, $00fd ; B5A26 (2d:5a26) -> 21 FD 00
	scall EventFlagAction ; B5A29 (2d:5a29) -> CD 1B 46
	xor a ; B5A2C (2d:5a2c) -> AF
	scall Func_80653 ; B5A2D (2d:5a2d) -> CD 53 46
	ld c, $01 ; B5A30 (2d:5a30) -> 0E 01
	ld e, $01 ; B5A32 (2d:5a32) -> 1E 01
	ld a, $09 ; B5A34 (2d:5a34) -> 3E 09
	scall LoadEmote ; B5A36 (2d:5a36) -> CD 76 41
	ld a, $5a ; B5A39 (2d:5a39) -> 3E 5A
	scall PlaySFX ; B5A3B (2d:5a3b) -> CD FE 4E
	scall WaitEmote ; B5A3E (2d:5a3e) -> CD D5 41
	scall HideEmote ; B5A41 (2d:5a41) -> CD 8B 41
	ld a, $02 ; B5A44 (2d:5a44) -> 3E 02
	scall PlayerFace ; B5A46 (2d:5a46) -> CD 77 46
	ld l, $0a ; B5A49 (2d:5a49) -> 2E 0A
	push hl ; B5A4B (2d:5a4b) -> E5
	ld c, $09 ; B5A4C (2d:5a4c) -> 0E 09
	ld e, $0d ; B5A4E (2d:5a4e) -> 1E 0D
	ld a, $1e ; B5A50 (2d:5a50) -> 3E 1E
	scall Func_80dff ; B5A52 (2d:5a52) -> CD FF 4D
	pop bc ; B5A55 (2d:5a55) -> C1
.asm_b5a56:
	ret  ; B5A56 (2d:5a56) -> C9

Func_b5a57:
	ld a, $09 ; B5A57 (2d:5a57) -> 3E 09
	scall PlayMusic ; B5A59 (2d:5a59) -> CD E6 4E
	ld a, $02 ; B5A5C (2d:5a5c) -> 3E 02
	scall PlayerFace ; B5A5E (2d:5a5e) -> CD 77 46
	ld c, $01 ; B5A61 (2d:5a61) -> 0E 01
	ld e, $02 ; B5A63 (2d:5a63) -> 1E 02
	ld a, $09 ; B5A65 (2d:5a65) -> 3E 09
	scall LoadEmote ; B5A67 (2d:5a67) -> CD 76 41
	ld a, $37 ; B5A6A (2d:5a6a) -> 3E 37
	scall PlaySFX ; B5A6C (2d:5a6c) -> CD FE 4E
	scall WaitEmote ; B5A6F (2d:5a6f) -> CD D5 41
	ld a, $01 ; B5A72 (2d:5a72) -> 3E 01
	scall Func_80653 ; B5A74 (2d:5a74) -> CD 53 46
	ld hl, $0001 ; B5A77 (2d:5a77) -> 21 01 00
	scall ScriptSleep ; B5A7A (2d:5a7a) -> CD 8F 46
	scall HideEmote ; B5A7D (2d:5a7d) -> CD 8B 41
	ld e, $01 ; B5A80 (2d:5a80) -> 1E 01
	ld hl, $00fe ; B5A82 (2d:5a82) -> 21 FE 00
	scall EventFlagAction ; B5A85 (2d:5a85) -> CD 1B 46
	ret  ; B5A88 (2d:5a88) -> C9

Data_b5a89:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5a94:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5ada:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5b14, NULL

Func_b5ae8:: ; b5ae8
	ld e, $01 ; B5AE8 (2d:5ae8) -> 1E 01
	ld hl, Data_b5a89 ; B5AEA (2d:5aea) -> 21 89 5A
	scall LoadWarps ; B5AED (2d:5aed) -> CD 3A 40
	ld a, $03 ; B5AF0 (2d:5af0) -> 3E 03
	scall Func_80d01 ; B5AF2 (2d:5af2) -> CD 01 4D
	ld e, $05 ; B5AF5 (2d:5af5) -> 1E 05
	ld hl, Data_b5a94 ; B5AF7 (2d:5af7) -> 21 94 5A
	scall LoadEncounters ; B5AFA (2d:5afa) -> CD 24 4D
	ld e, $01 ; B5AFD (2d:5afd) -> 1E 01
	ld hl, Data_b5ada ; B5AFF (2d:5aff) -> 21 DA 5A
	scall LoadMapObjects ; B5B02 (2d:5b02) -> CD FB 40
	ld a, $09 ; B5B05 (2d:5b05) -> 3E 09
	scall PlayMusic ; B5B07 (2d:5b07) -> CD E6 4E
	scall Func_8001c ; B5B0A (2d:5b0a) -> CD 1C 40
	ld hl, $030f ; B5B0D (2d:5b0d) -> 21 0F 03
	scall LandmarkSign ; B5B10 (2d:5b10) -> CD 72 4F
	ret  ; B5B13 (2d:5b13) -> C9

Func_b5b14:
	push bc ; B5B14 (2d:5b14) -> C5
	push bc ; B5B15 (2d:5b15) -> C5
	ld hl, sp+$03 ; B5B16 (2d:5b16) -> F8 03
	ld a, $ff ; B5B18 (2d:5b18) -> 3E FF
	ld [hl], a ; B5B1A (2d:5b1a) -> 77
	ld hl, sp+$02 ; B5B1B (2d:5b1b) -> F8 02
	ld [hl], a ; B5B1D (2d:5b1d) -> 77
	ld a, e ; B5B1E (2d:5b1e) -> 7B
	cp $02 ; B5B1F (2d:5b1f) -> FE 02
	jp nz, .asm_b5b59 ; B5B21 (2d:5b21) -> C2 59 5B
	ld hl, $0327 ; B5B24 (2d:5b24) -> 21 27 03
	scall LandmarkSign ; B5B27 (2d:5b27) -> CD 72 4F
	ld hl, sp+$00 ; B5B2A (2d:5b2a) -> F8 00
	ld a, [wMapX] ; B5B2C (2d:5b2c) -> FA D8 C2
	add a, $05 ; B5B2F (2d:5b2f) -> C6 05
	ld [hl], a ; B5B31 (2d:5b31) -> 77
	ld a, [wPlayerFacing] ; B5B32 (2d:5b32) -> FA 38 C8
	or a ; B5B35 (2d:5b35) -> B7
	jp nz, .asm_b5b44 ; B5B36 (2d:5b36) -> C2 44 5B
	ld hl, sp+$01 ; B5B39 (2d:5b39) -> F8 01
	ld a, [wMapY] ; B5B3B (2d:5b3b) -> FA D9 C2
	add a, $05 ; B5B3E (2d:5b3e) -> C6 05
	ld [hl], a ; B5B40 (2d:5b40) -> 77
	jp .asm_b5b4c ; B5B41 (2d:5b41) -> C3 4C 5B
.asm_b5b44:
	ld hl, sp+$01 ; B5B44 (2d:5b44) -> F8 01
	ld a, [wMapY] ; B5B46 (2d:5b46) -> FA D9 C2
	add a, $03 ; B5B49 (2d:5b49) -> C6 03
	ld [hl], a ; B5B4B (2d:5b4b) -> 77
.asm_b5b4c:
	ld c, $01 ; B5B4C (2d:5b4c) -> 0E 01
	ld hl, sp+$00 ; B5B4E (2d:5b4e) -> F8 00
	push de ; B5B50 (2d:5b50) -> D5
	push hl ; B5B51 (2d:5b51) -> E5
	pop de ; B5B52 (2d:5b52) -> D1
	pop hl ; B5B53 (2d:5b53) -> E1
	ld a, $2d ; B5B54 (2d:5b54) -> 3E 2D
	scall MovePlayer ; B5B56 (2d:5b56) -> CD 3E 46
.asm_b5b59:
	pop bc ; B5B59 (2d:5b59) -> C1
	pop bc ; B5B5A (2d:5b5a) -> C1
	ret  ; B5B5B (2d:5b5b) -> C9

Data_b5b5c:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5b67:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $52, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3c, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5bad:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5be7, NULL

Func_b5bbb:: ; b5bbb
	ld e, $01 ; B5BBB (2d:5bbb) -> 1E 01
	ld hl, Data_b5b5c ; B5BBD (2d:5bbd) -> 21 5C 5B
	scall LoadWarps ; B5BC0 (2d:5bc0) -> CD 3A 40
	ld a, $03 ; B5BC3 (2d:5bc3) -> 3E 03
	scall Func_80d01 ; B5BC5 (2d:5bc5) -> CD 01 4D
	ld e, $05 ; B5BC8 (2d:5bc8) -> 1E 05
	ld hl, Data_b5b67 ; B5BCA (2d:5bca) -> 21 67 5B
	scall LoadEncounters ; B5BCD (2d:5bcd) -> CD 24 4D
	ld e, $01 ; B5BD0 (2d:5bd0) -> 1E 01
	ld hl, Data_b5bad ; B5BD2 (2d:5bd2) -> 21 AD 5B
	scall LoadMapObjects ; B5BD5 (2d:5bd5) -> CD FB 40
	ld a, $09 ; B5BD8 (2d:5bd8) -> 3E 09
	scall PlayMusic ; B5BDA (2d:5bda) -> CD E6 4E
	scall Func_8001c ; B5BDD (2d:5bdd) -> CD 1C 40
	ld hl, $030e ; B5BE0 (2d:5be0) -> 21 0E 03
	scall LandmarkSign ; B5BE3 (2d:5be3) -> CD 72 4F
	ret  ; B5BE6 (2d:5be6) -> C9

Func_b5be7:
	push bc ; B5BE7 (2d:5be7) -> C5
	push bc ; B5BE8 (2d:5be8) -> C5
	ld hl, sp+$03 ; B5BE9 (2d:5be9) -> F8 03
	ld a, $ff ; B5BEB (2d:5beb) -> 3E FF
	ld [hl], a ; B5BED (2d:5bed) -> 77
	ld hl, sp+$02 ; B5BEE (2d:5bee) -> F8 02
	ld [hl], a ; B5BF0 (2d:5bf0) -> 77
	ld a, e ; B5BF1 (2d:5bf1) -> 7B
	cp $02 ; B5BF2 (2d:5bf2) -> FE 02
	jp nz, .asm_b5c2c ; B5BF4 (2d:5bf4) -> C2 2C 5C
	ld hl, $0327 ; B5BF7 (2d:5bf7) -> 21 27 03
	scall LandmarkSign ; B5BFA (2d:5bfa) -> CD 72 4F
	ld hl, sp+$00 ; B5BFD (2d:5bfd) -> F8 00
	ld a, [wMapX] ; B5BFF (2d:5bff) -> FA D8 C2
	add a, $05 ; B5C02 (2d:5c02) -> C6 05
	ld [hl], a ; B5C04 (2d:5c04) -> 77
	ld a, [wPlayerFacing] ; B5C05 (2d:5c05) -> FA 38 C8
	or a ; B5C08 (2d:5c08) -> B7
	jp nz, .asm_b5c17 ; B5C09 (2d:5c09) -> C2 17 5C
	ld hl, sp+$01 ; B5C0C (2d:5c0c) -> F8 01
	ld a, [wMapY] ; B5C0E (2d:5c0e) -> FA D9 C2
	add a, $05 ; B5C11 (2d:5c11) -> C6 05
	ld [hl], a ; B5C13 (2d:5c13) -> 77
	jp .asm_b5c1f ; B5C14 (2d:5c14) -> C3 1F 5C
.asm_b5c17:
	ld hl, sp+$01 ; B5C17 (2d:5c17) -> F8 01
	ld a, [wMapY] ; B5C19 (2d:5c19) -> FA D9 C2
	add a, $03 ; B5C1C (2d:5c1c) -> C6 03
	ld [hl], a ; B5C1E (2d:5c1e) -> 77
.asm_b5c1f:
	ld c, $01 ; B5C1F (2d:5c1f) -> 0E 01
	ld hl, sp+$00 ; B5C21 (2d:5c21) -> F8 00
	push de ; B5C23 (2d:5c23) -> D5
	push hl ; B5C24 (2d:5c24) -> E5
	pop de ; B5C25 (2d:5c25) -> D1
	pop hl ; B5C26 (2d:5c26) -> E1
	ld a, $2d ; B5C27 (2d:5c27) -> 3E 2D
	scall MovePlayer ; B5C29 (2d:5c29) -> CD 3E 46
.asm_b5c2c:
	pop bc ; B5C2C (2d:5c2c) -> C1
	pop bc ; B5C2D (2d:5c2d) -> C1
	ret  ; B5C2E (2d:5c2e) -> C9

Data_b5c2f:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5c45:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $06, $07, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5c8b:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5cc5, NULL

Func_b5c99:: ; b5c99
	ld e, $02 ; B5C99 (2d:5c99) -> 1E 02
	ld hl, Data_b5c2f ; B5C9B (2d:5c9b) -> 21 2F 5C
	call LoadWarps_2d ; B5C9E (2d:5c9e) -> CD 3A 40
	ld a, $03 ; B5CA1 (2d:5ca1) -> 3E 03
	call Func_80d01_2d ; B5CA3 (2d:5ca3) -> CD 01 4D
	ld e, $05 ; B5CA6 (2d:5ca6) -> 1E 05
	ld hl, Data_b5c45 ; B5CA8 (2d:5ca8) -> 21 45 5C
	call LoadEncounters_2d ; B5CAB (2d:5cab) -> CD 24 4D
	ld e, $01 ; B5CAE (2d:5cae) -> 1E 01
	ld hl, Data_b5c8b ; B5CB0 (2d:5cb0) -> 21 8B 5C
	call LoadMapObjects_2d ; B5CB3 (2d:5cb3) -> CD FB 40
	ld a, $09 ; B5CB6 (2d:5cb6) -> 3E 09
	call PlayMusic_2d ; B5CB8 (2d:5cb8) -> CD E6 4E
	call Func_8001c_2d ; B5CBB (2d:5cbb) -> CD 1C 40
	ld hl, $030d ; B5CBE (2d:5cbe) -> 21 0D 03
	call LandmarkSign_2d ; B5CC1 (2d:5cc1) -> CD 72 4F
	ret  ; B5CC4 (2d:5cc4) -> C9

Func_b5cc5:
	push bc ; B5CC5 (2d:5cc5) -> C5
	push bc ; B5CC6 (2d:5cc6) -> C5
	ld hl, sp+$03 ; B5CC7 (2d:5cc7) -> F8 03
	ld a, $ff ; B5CC9 (2d:5cc9) -> 3E FF
	ld [hl], a ; B5CCB (2d:5ccb) -> 77
	ld hl, sp+$02 ; B5CCC (2d:5ccc) -> F8 02
	ld [hl], a ; B5CCE (2d:5cce) -> 77
	ld a, e ; B5CCF (2d:5ccf) -> 7B
	cp $02 ; B5CD0 (2d:5cd0) -> FE 02
	jp nz, label_b5d0a ; B5CD2 (2d:5cd2) -> C2 0A 5D
	ld hl, $0327 ; B5CD5 (2d:5cd5) -> 21 27 03
	call LandmarkSign_2d ; B5CD8 (2d:5cd8) -> CD 72 4F
	ld hl, sp+$00 ; B5CDB (2d:5cdb) -> F8 00
	ld a, [wMapX] ; B5CDD (2d:5cdd) -> FA D8 C2
	add a, $05 ; B5CE0 (2d:5ce0) -> C6 05
	ld [hl], a ; B5CE2 (2d:5ce2) -> 77
	ld a, [wPlayerFacing] ; B5CE3 (2d:5ce3) -> FA 38 C8
	or a ; B5CE6 (2d:5ce6) -> B7
	jp nz, label_b5cf5 ; B5CE7 (2d:5ce7) -> C2 F5 5C
	ld hl, sp+$01 ; B5CEA (2d:5cea) -> F8 01
	ld a, [wMapY] ; B5CEC (2d:5cec) -> FA D9 C2
	add a, $05 ; B5CEF (2d:5cef) -> C6 05
	ld [hl], a ; B5CF1 (2d:5cf1) -> 77
	jp label_b5cfd ; B5CF2 (2d:5cf2) -> C3 FD 5C
label_b5cf5:
	ld hl, sp+$01 ; B5CF5 (2d:5cf5) -> F8 01
	ld a, [wMapY] ; B5CF7 (2d:5cf7) -> FA D9 C2
	add a, $03 ; B5CFA (2d:5cfa) -> C6 03
	ld [hl], a ; B5CFC (2d:5cfc) -> 77
label_b5cfd:
	ld c, $01 ; B5CFD (2d:5cfd) -> 0E 01
	ld hl, sp+$00 ; B5CFF (2d:5cff) -> F8 00
	push de ; B5D01 (2d:5d01) -> D5
	push hl ; B5D02 (2d:5d02) -> E5
	pop de ; B5D03 (2d:5d03) -> D1
	pop hl ; B5D04 (2d:5d04) -> E1
	ld a, $2d ; B5D05 (2d:5d05) -> 3E 2D
	call MovePlayer_2d ; B5D07 (2d:5d07) -> CD 3E 46
label_b5d0a:
	pop bc ; B5D0A (2d:5d0a) -> C1
	pop bc ; B5D0B (2d:5d0b) -> C1
	ret  ; B5D0C (2d:5d0c) -> C9

Data_b5d0d:
IF DEF(SUN)
	db $0d, $02, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $00
	db $02, $0f, $0e, $4a, $29, $2c, $3d, $07, $11, $14, $06, $0a, $00, $00, $02, $0f
	db $0e, $4b, $2a, $2d, $26, $0e, $08, $14, $12, $09, $00, $00, $02, $0f, $0e, $7d
	db $2b, $2e, $11, $06, $08, $11, $13, $08, $00, $00, $02, $0f, $0e, $4f, $2c, $2f
	db $26, $06, $07, $00, $12, $07, $00, $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04
	db $04, $00, $06, $06, $00, $ff, $00, $01, $02, $01, $01, $00, $04, $01, $2d, $98
	db $5d, $00, $00
ELIF DEF(STAR)
	db $0d, $02, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $00
	db $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $0a, $00, $00, $02, $0f
	db $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $09, $00, $00, $02, $0f, $0e, $70
	db $2b, $2e, $53, $01, $10, $00, $10, $08, $00, $00, $02, $0f, $0e, $85, $2c, $2f
	db $7b, $14, $0d, $1f, $11, $07, $00, $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01
	db $02, $00, $13, $06, $00, $ff, $00, $01, $02, $01, $01, $00, $04, $01, $2d, $98
	db $5d, $00, $00
ENDC

Func_b5d6c:: ; b5d6c
IF DEF(SUN)
	db $1e, $01, $21, $0d, $5d, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $18, $5d, $cd, $24, $4d, $1e, $01, $21, $5e, $5d, $cd, $fb, $40, $3e, $09, $cd
	db $e6, $4e, $cd, $1c, $40, $21, $0c, $03, $cd, $72, $4f, $c9, $c5, $c5, $f8, $03
	db $3e, $ff, $77, $f8, $02, $77, $7b, $fe, $02, $c2, $dd, $5d, $21, $27, $03, $cd
	db $72, $4f, $f8, $00, $fa, $d8, $c2, $c6, $05, $77, $fa, $38, $c8, $b7, $c2, $c8
	db $5d, $f8, $01, $fa, $d9, $c2, $c6, $05, $77, $c3, $d0, $5d, $f8, $01, $fa, $d9
	db $c2, $c6, $03, $77, $0e, $01, $f8, $00, $d5, $e5, $d1, $e1, $3e, $2d, $cd, $3e
	db $46, $c1, $c1, $c9, $0d, $0f, $02, $01, $1a, $00, $07, $05, $07, $06, $2e, $01
	db $02, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $00, $02, $0f, $0e, $4a, $29
	db $2c, $3d, $07, $11, $14, $06, $0a, $00, $00, $02, $0f, $0e, $4b, $2a, $2d, $26
	db $0e, $08, $14, $12, $09, $00, $00, $02, $0f, $0e, $7d, $2b, $2e, $11, $06, $08
	db $11, $13, $08, $00, $00, $02, $0f, $0e, $4f, $2c, $2f, $26, $06, $07, $00, $12
	db $07, $00, $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04, $04, $00, $06, $06, $00
	db $ff, $00, $09, $0a, $01, $01, $00, $04, $01, $2d, $c4, $5e, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $0d, $5d, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $18, $5d, $cd, $24, $4d, $1e, $01, $21, $5e, $5d, $cd, $fb, $40, $3e, $09, $cd
	db $e6, $4e, $cd, $1c, $40, $21, $0c, $03, $cd, $72, $4f, $c9, $c5, $c5, $f8, $03
	db $3e, $ff, $77, $f8, $02, $77, $7b, $fe, $02, $c2, $dd, $5d, $21, $27, $03, $cd
	db $72, $4f, $f8, $00, $fa, $d8, $c2, $c6, $05, $77, $fa, $38, $c8, $b7, $c2, $c8
	db $5d, $f8, $01, $fa, $d9, $c2, $c6, $05, $77, $c3, $d0, $5d, $f8, $01, $fa, $d9
	db $c2, $c6, $03, $77, $0e, $01, $f8, $00, $d5, $e5, $d1, $e1, $3e, $2d, $cd, $3e
	db $46, $c1, $c1, $c9, $0d, $0f, $02, $01, $1a, $00, $07, $05, $07, $06, $2e, $01
	db $02, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $00, $02, $0f, $0e, $4a, $29
	db $2c, $3f, $07, $11, $14, $06, $0a, $00, $00, $02, $0f, $0e, $7d, $2a, $2d, $12
	db $06, $06, $11, $12, $09, $00, $00, $02, $0f, $0e, $70, $2b, $2e, $53, $01, $10
	db $00, $10, $08, $00, $00, $02, $0f, $0e, $85, $2c, $2f, $7b, $14, $0d, $1f, $11
	db $07, $00, $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01, $02, $00, $13, $06, $00
	db $ff, $00, $09, $0a, $01, $01, $00, $04, $01, $2d, $c4, $5e, $00, $00
ENDC

Func_b5e4a:: ; b5e4a
	db $1e, $02, $21, $e0, $5d, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $f6, $5d, $cd, $24, $4d, $1e, $01, $21, $3c, $5e, $cd, $fb, $40, $3e, $09, $cd
	db $e6, $4e, $3e, $0f, $ea, $e2, $c7, $fa, $df, $c7, $fe, $1e, $c2, $ba, $5e, $fa
	db $e0, $c7, $fe, $08, $c2, $ba, $5e, $fa, $db, $c7, $fe, $09, $c2, $ba, $5e, $fa
	db $dc, $c7, $fe, $0a, $c2, $ba, $5e, $21, $fd, $00, $cd, $2e, $46, $b7, $c2, $ae
	db $5e, $af, $cd, $53, $46, $cd, $1c, $40, $21, $0b, $03, $cd, $72, $4f, $cd, $03
	db $5f, $c3, $b7, $5e, $cd, $1c, $40, $21, $0b, $03, $cd, $72, $4f, $c3, $c3, $5e
	db $cd, $1c, $40, $21, $0b, $03, $cd, $72, $4f, $c9, $7b, $fe, $02, $c2, $02, $5f
	db $21, $b4, $00, $cd, $72, $4f, $1e, $00, $21, $fe, $00, $cd, $1b, $46, $af, $cd
	db $53, $46, $0e, $01, $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e
	db $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e, $0a, $e5, $0e, $09
	db $1e, $08, $3e, $1e, $cd, $ff, $4d, $c1, $c9, $3e, $09, $cd, $e6, $4e, $3e, $02
	db $cd, $77, $46, $0e, $01, $1e, $02, $3e, $09, $cd, $76, $41, $3e, $37, $cd, $fe
	db $4e, $cd, $d5, $41, $3e, $01, $cd, $53, $46, $21, $01, $00, $cd, $8f, $46, $cd
	db $8b, $41, $1e, $01, $21, $fd, $00, $cd, $1b, $46, $c9, $0c, $05, $01, $01, $20
	db $09, $01, $06, $01, $05, $2e, $1a, $04, $0c, $0a, $01, $01, $02, $04, $00, $2d
	db $00, $00, $00, $00, $19, $0c, $0c, $05, $01, $01, $02, $04, $00, $2d, $00, $00
	db $00, $00, $ff, $00, $0c, $0e, $01, $01, $00, $04, $01, $2d, $17, $61, $00, $00
	db $19, $0c, $0c, $0b, $01, $01, $02, $04, $00, $2d, $91, $62, $00, $00, $1e, $0c
	db $0b, $0a, $01, $01, $02, $04, $00, $2d, $4c, $63, $00, $00, $1f, $0c, $0d, $0a
	db $01, $01, $02, $04, $00, $2d, $22, $64, $00, $00, $20, $0c, $0a, $09, $01, $01
	db $02, $04, $00, $2d, $01, $65, $00, $00, $21, $0c, $0c, $09, $01, $01, $02, $04
	db $00, $2d, $e9, $65, $00, $00, $0d, $0c, $0e, $09, $01, $01, $02, $04, $00, $2d
	db $d1, $66, $00, $00

Func_b5fbe:: ; b5fbe
IF DEF(SUN)
	db $1e, $01, $21, $35, $5f, $cd, $3a, $40, $21, $5a, $00, $cd, $2e, $46, $b7, $c2
	db $e2, $5f, $1e, $03, $21, $40, $5f, $cd, $fb, $40, $1e, $00, $3e, $01, $cd, $3d
	db $41, $c3, $c9, $60, $21, $5a, $00, $cd, $2e, $46, $fe, $01, $c2, $c9, $60, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $29, $60, $21, $e3, $00, $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e4, $00
	db $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e5, $00, $cd, $2e, $46, $b7, $ca, $29
	db $60, $21, $e6, $00, $cd, $2e, $46, $b7, $c2, $c9, $60, $1e, $06, $21, $6a, $5f
	db $cd, $fb, $40, $21, $e1, $00, $cd, $2e, $46, $fe, $01, $c2, $4b, $60, $1e, $00
	db $af, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $01, $cd, $80, $40, $21, $e2, $00
	db $cd, $2e, $46, $fe, $01, $c2, $66, $60, $1e, $00, $3e, $01, $cd, $3d, $41, $0e
	db $0b, $1e, $0c, $3e, $02, $cd, $80, $40, $21, $e3, $00, $cd, $2e, $46, $fe, $01
	db $c2, $81, $60, $1e, $00, $3e, $02, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $03
	db $cd, $80, $40, $21, $e4, $00, $cd, $2e, $46, $fe, $01, $c2, $9c, $60, $1e, $00
	db $3e, $03, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $04, $cd, $80, $40, $21, $e5
	db $00, $cd, $2e, $46, $fe, $01, $c2, $b7, $60, $1e, $00, $3e, $04, $cd, $3d, $41
	db $0e, $0b, $1e, $0c, $3e, $05, $cd, $80, $40, $21, $e6, $00, $cd, $2e, $46, $fe
	db $01, $c2, $c9, $60, $1e, $00, $3e, $05, $cd, $3d, $41, $3e, $13, $cd, $e6, $4e
	db $cd, $1c, $40, $c9, $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $87
	db $06, $39, $04, $00, $00, $7b, $88, $06, $39, $04, $04, $00, $7b, $89, $06, $39
	db $04, $04, $04, $7c, $12, $07, $39, $1d, $1d, $1d, $09, $01, $0c, $0c, $0c, $ff
	db $ff, $0c, $07, $08, $07, $ff, $ff, $08, $10, $08, $10, $ff, $ff, $0c, $0d, $ff
	db $ff, $0c, $10, $08, $07, $0c, $05, $ff, $ff, $7b, $fe, $02, $c2, $5f, $62, $af
	db $cd, $e6, $4e, $cd, $2b, $40, $0e, $01, $11, $fb, $60, $3e, $2d, $cd, $3e, $46
	db $3e, $01, $cd, $e6, $4e, $21, $4a, $01, $cd, $a9, $44, $11, $60, $62, $21, $d2
	db $60, $cd, $d3, $4d, $b7, $c2, $49, $61, $c3, $5f, $62, $21, $4b, $01, $cd, $a9
	db $44, $3e, $0a, $cd, $f1, $4f, $af, $cd, $e6, $4e, $0e, $01, $1e, $01, $3e, $0a
	db $cd, $76, $41, $1e, $0a, $3e, $0c, $cd, $e4, $41, $3e, $01, $cd, $1a, $50, $3e
	db $43, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $1e, $00, $af, $cd, $3d, $41
	db $21, $3c, $00, $cd, $8f, $46, $cd, $a2, $4e, $0e, $01, $1e, $01, $3e, $05, $cd
	db $76, $41, $cd, $d5, $41, $3e, $28, $cd, $fe, $4e, $cd, $8b, $41, $21, $3c, $00
	db $cd, $8f, $46, $af, $fe, $04, $d2, $b3, $61, $f5, $1e, $01, $af, $cd, $1e, $4e
	db $f1, $3c, $c3, $a2, $61, $1e, $01, $3e, $01, $cd, $3d, $41, $3e, $18, $cd, $e6
	db $4e, $21, $78, $00, $cd, $8f, $46, $01, $ff, $60, $1e, $2d, $3e, $01, $cd, $88
	db $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $01, $05, $61, $1e, $2d, $3e, $01
	db $cd, $88, $46, $cd, $0c, $42, $1e, $01, $3e, $01, $cd, $95, $40, $af, $fe, $02
	db $d2, $fe, $61, $f5, $1e, $01, $3e, $02, $cd, $1e, $4e, $f1, $3c, $c3, $ec, $61
	db $3e, $02, $cd, $77, $46, $af, $fe, $02, $d2, $16, $62, $f5, $1e, $01, $3e, $02
	db $cd, $1e, $4e, $f1, $3c, $c3, $04, $62, $01, $0b, $61, $1e, $2d, $3e, $01, $cd
	db $88, $46, $cd, $0c, $42, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $cd, $b1
	db $4e, $21, $4c, $01, $cd, $a9, $44, $cd, $a2, $4e, $01, $0f, $61, $1e, $2d, $3e
	db $01, $cd, $f7, $41, $0e, $01, $11, $0f, $61, $3e, $2d, $cd, $3e, $46, $cd, $0c
	db $42, $cd, $b1, $4e, $2e, $05, $e5, $0e, $07, $1e, $00, $3e, $1a, $cd, $ff, $4d
	db $c1, $c9, $be, $de, $db, $00, $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $46, $07, $28, $07, $07, $07, $6b, $01, $0b, $0c
	db $0b, $ff, $ff, $f5, $7b, $b7, $c2, $12, $63, $f8, $01, $7e, $cd, $4b, $44, $21
	db $42, $04, $cd, $a9, $44, $11, $14, $63, $21, $64, $62, $cd, $d3, $4d, $b7, $c2
	db $b3, $62, $c3, $12, $63, $21, $43, $04, $cd, $a9, $44, $3e, $0a, $cd, $f1, $4f
	db $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $18, $cd, $e6, $4e, $21, $78
	db $00, $cd, $8f, $46, $af, $fe, $04, $d2, $e5, $62, $f5, $5f, $f8, $03, $7e, $cd
	db $95, $40, $f1, $3c, $c3, $d3, $62, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $af
	db $cd, $e6, $4e, $3e, $13, $cd, $e6, $4e, $01, $8d, $62, $1e, $2d, $f8, $01, $7e
	db $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $21, $e1, $00, $cd, $1b, $46, $3e
	db $01, $ea, $c4, $c7, $c1, $c9, $cb, $de, $bd, $ba, $00, $00, $00, $00, $04, $32
	db $c5, $bd, $00, $00, $90, $01, $0e, $06, $2d, $04, $17, $00, $53, $38, $06, $2d
	db $0e, $0b, $00, $1b, $18, $06, $2d, $09, $09, $0b, $1c, $07, $07, $2d, $01, $13
	db $00, $63, $01, $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c, $0b, $ff, $ff, $f5, $7b
	db $b7, $c2, $e6, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $e1, $00, $cd, $2e, $46
	db $b7, $c2, $73, $63, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd
	db $95, $40, $c3, $e6, $63, $21, $44, $04, $cd, $a9, $44, $11, $e8, $63, $21, $19
	db $63, $cd, $d3, $4d, $b7, $c2, $89, $63, $c3, $e6, $63, $21, $45, $04, $cd, $a9
	db $44, $af, $fe, $04, $d2, $a2, $63, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1
	db $3c, $c3, $90, $63, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe
	db $02, $c2, $c1, $63, $01, $42, $63, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46
	db $c3, $cd, $63, $01, $48, $63, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd
	db $0c, $42, $1e, $02, $f8, $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e2, $00
	db $cd, $1b, $46, $3e, $01, $ea, $c4, $c7, $c1, $c9, $b1, $d1, $db, $dd, $00, $00
	db $00, $00, $04, $32, $c5, $be, $00, $00, $4e, $01, $3a, $06, $32, $07, $0b, $00
	db $49, $0f, $06, $32, $28, $12, $00, $6a, $21, $06, $32, $0c, $0f, $00, $7a, $3b
	db $07, $32, $07, $09, $00, $4a, $01, $0b, $0b, $0b, $0c, $0b, $ff, $ff, $0b, $0a
	db $0c, $0b, $ff, $ff, $f5, $7b, $b7, $c2, $c6, $64, $f8, $01, $7e, $cd, $4b, $44
	db $21, $e1, $00, $cd, $2e, $46, $b7, $ca, $42, $64, $21, $e2, $00, $cd, $2e, $46
	db $b7, $c2, $53, $64, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd
	db $95, $40, $c3, $c6, $64, $21, $46, $04, $cd, $a9, $44, $11, $c8, $64, $21, $ed
	db $63, $cd, $d3, $4d, $b7, $c2, $69, $64, $c3, $c6, $64, $21, $47, $04, $cd, $a9
	db $44, $af, $fe, $04, $d2, $82, $64, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1
	db $3c, $c3, $70, $64, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe
	db $02, $c2, $a1, $64, $01, $16, $64, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46
	db $c3, $ad, $64, $01, $1c, $64, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd
	db $0c, $42, $1e, $02, $f8, $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e3, $00
	db $cd, $1b, $46, $3e, $01, $ea, $c4, $c7, $c1, $c9, $dc, $b2, $d9, $c4, $de, $00
	db $00, $00, $00, $04, $32, $c5, $bf, $00, $00, $75, $01, $31, $06, $37, $07, $0c
	db $00, $48, $73, $06, $37, $0c, $08, $00, $49, $74, $06, $37, $0d, $09, $00, $49
	db $32, $07, $37, $07, $07, $14, $4a, $01, $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c
	db $0b, $ff, $ff, $f5, $7b, $b7, $c2, $af, $65, $f8, $01, $7e, $cd, $4b, $44, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $2b, $65, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $2b, $65, $21, $e3, $00, $cd, $2e, $46, $b7, $c2, $3c, $65, $21, $7c, $01
	db $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3, $af, $65, $21, $48
	db $04, $cd, $a9, $44, $11, $b1, $65, $21, $ce, $64, $cd, $d3, $4d, $b7, $c2, $52
	db $65, $c3, $af, $65, $21, $49, $04, $cd, $a9, $44, $af, $fe, $04, $d2, $6b, $65
	db $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1, $3c, $c3, $59, $65, $1e, $00, $f8
	db $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe, $02, $c2, $8a, $65, $01, $f7, $64
	db $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $c3, $96, $65, $01, $fd, $64, $1e
	db $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8, $01, $7e
	db $3c, $cd, $95, $40, $1e, $01, $21, $e4, $00, $cd, $1b, $46, $3e, $01, $ea, $c4
	db $c7, $c1, $c9, $b6, $cf, $af, $c4, $00, $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0d, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c, $0b, $ff, $ff, $f5, $7b, $b7, $c2, $a1
	db $66, $f8, $01, $7e, $cd, $4b, $44, $21, $e1, $00, $cd, $2e, $46, $b7, $ca, $1d
	db $66, $21, $e2, $00, $cd, $2e, $46, $b7, $ca, $1d, $66, $21, $e3, $00, $cd, $2e
	db $46, $b7, $ca, $1d, $66, $21, $e4, $00, $cd, $2e, $46, $b7, $c2, $2e, $66, $21
	db $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3, $a1, $66
	db $21, $4a, $04, $cd, $a9, $44, $11, $a3, $66, $21, $b6, $65, $cd, $d3, $4d, $b7
	db $c2, $44, $66, $c3, $a1, $66, $21, $4b, $04, $cd, $a9, $44, $af, $fe, $04, $d2
	db $5d, $66, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1, $3c, $c3, $4b, $66, $1e
	db $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe, $02, $c2, $7c, $66, $01
	db $df, $65, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $c3, $88, $66, $01, $e5
	db $65, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8
	db $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e5, $00, $cd, $1b, $46, $3e, $01
	db $ea, $c4, $c7, $c1, $c9, $cd, $af, $c4, $de, $00, $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $03, $03, $03
	db $7b, $01, $0b, $f5, $7b, $b7, $c2, $51, $67, $f8, $01, $7e, $cd, $4b, $44, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $0f, $67, $21, $e3, $00, $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e4, $00
	db $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e5, $00, $cd, $2e, $46, $b7, $c2, $20
	db $67, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3
	db $51, $67, $21, $4c, $04, $cd, $a9, $44, $11, $53, $67, $21, $a8, $66, $cd, $d3
	db $4d, $b7, $c2, $36, $67, $c3, $51, $67, $21, $4d, $04, $cd, $a9, $44, $1e, $01
	db $21, $e6, $00, $cd, $1b, $46, $2e, $1a, $e5, $0e, $0f, $1e, $0a, $3e, $19, $cd
	db $ff, $4d, $c1, $c1, $c9, $c3, $b0, $d9, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $35, $5f, $cd, $3a, $40, $21, $5a, $00, $cd, $2e, $46, $b7, $c2
	db $e2, $5f, $1e, $03, $21, $40, $5f, $cd, $fb, $40, $1e, $00, $3e, $01, $cd, $3d
	db $41, $c3, $c9, $60, $21, $5a, $00, $cd, $2e, $46, $fe, $01, $c2, $c9, $60, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $29, $60, $21, $e3, $00, $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e4, $00
	db $cd, $2e, $46, $b7, $ca, $29, $60, $21, $e5, $00, $cd, $2e, $46, $b7, $ca, $29
	db $60, $21, $e6, $00, $cd, $2e, $46, $b7, $c2, $c9, $60, $1e, $06, $21, $6a, $5f
	db $cd, $fb, $40, $21, $e1, $00, $cd, $2e, $46, $fe, $01, $c2, $4b, $60, $1e, $00
	db $af, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $01, $cd, $80, $40, $21, $e2, $00
	db $cd, $2e, $46, $fe, $01, $c2, $66, $60, $1e, $00, $3e, $01, $cd, $3d, $41, $0e
	db $0b, $1e, $0c, $3e, $02, $cd, $80, $40, $21, $e3, $00, $cd, $2e, $46, $fe, $01
	db $c2, $81, $60, $1e, $00, $3e, $02, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $03
	db $cd, $80, $40, $21, $e4, $00, $cd, $2e, $46, $fe, $01, $c2, $9c, $60, $1e, $00
	db $3e, $03, $cd, $3d, $41, $0e, $0b, $1e, $0c, $3e, $04, $cd, $80, $40, $21, $e5
	db $00, $cd, $2e, $46, $fe, $01, $c2, $b7, $60, $1e, $00, $3e, $04, $cd, $3d, $41
	db $0e, $0b, $1e, $0c, $3e, $05, $cd, $80, $40, $21, $e6, $00, $cd, $2e, $46, $fe
	db $01, $c2, $c9, $60, $1e, $00, $3e, $05, $cd, $3d, $41, $3e, $13, $cd, $e6, $4e
	db $cd, $1c, $40, $c9, $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $84
	db $06, $39, $03, $00, $00, $7b, $85, $06, $39, $03, $03, $00, $7b, $86, $06, $39
	db $03, $03, $03, $7c, $12, $07, $39, $1a, $1a, $1a, $09, $01, $0c, $0c, $0c, $ff
	db $ff, $0c, $07, $08, $07, $ff, $ff, $08, $10, $08, $10, $ff, $ff, $0c, $0d, $ff
	db $ff, $0c, $10, $08, $07, $0c, $05, $ff, $ff, $7b, $fe, $02, $c2, $5f, $62, $af
	db $cd, $e6, $4e, $cd, $2b, $40, $0e, $01, $11, $fb, $60, $3e, $2d, $cd, $3e, $46
	db $3e, $01, $cd, $e6, $4e, $21, $4a, $01, $cd, $a9, $44, $11, $60, $62, $21, $d2
	db $60, $cd, $d3, $4d, $b7, $c2, $49, $61, $c3, $5f, $62, $21, $4b, $01, $cd, $a9
	db $44, $3e, $0a, $cd, $f1, $4f, $af, $cd, $e6, $4e, $0e, $01, $1e, $01, $3e, $0a
	db $cd, $76, $41, $1e, $0a, $3e, $0c, $cd, $e4, $41, $3e, $01, $cd, $1a, $50, $3e
	db $43, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $1e, $00, $af, $cd, $3d, $41
	db $21, $3c, $00, $cd, $8f, $46, $cd, $a2, $4e, $0e, $01, $1e, $01, $3e, $05, $cd
	db $76, $41, $cd, $d5, $41, $3e, $28, $cd, $fe, $4e, $cd, $8b, $41, $21, $3c, $00
	db $cd, $8f, $46, $af, $fe, $04, $d2, $b3, $61, $f5, $1e, $01, $af, $cd, $1e, $4e
	db $f1, $3c, $c3, $a2, $61, $1e, $01, $3e, $01, $cd, $3d, $41, $3e, $18, $cd, $e6
	db $4e, $21, $78, $00, $cd, $8f, $46, $01, $ff, $60, $1e, $2d, $3e, $01, $cd, $88
	db $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $01, $05, $61, $1e, $2d, $3e, $01
	db $cd, $88, $46, $cd, $0c, $42, $1e, $01, $3e, $01, $cd, $95, $40, $af, $fe, $02
	db $d2, $fe, $61, $f5, $1e, $01, $3e, $02, $cd, $1e, $4e, $f1, $3c, $c3, $ec, $61
	db $3e, $02, $cd, $77, $46, $af, $fe, $02, $d2, $16, $62, $f5, $1e, $01, $3e, $02
	db $cd, $1e, $4e, $f1, $3c, $c3, $04, $62, $01, $0b, $61, $1e, $2d, $3e, $01, $cd
	db $88, $46, $cd, $0c, $42, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $cd, $b1
	db $4e, $21, $4c, $01, $cd, $a9, $44, $cd, $a2, $4e, $01, $0f, $61, $1e, $2d, $3e
	db $01, $cd, $f7, $41, $0e, $01, $11, $0f, $61, $3e, $2d, $cd, $3e, $46, $cd, $0c
	db $42, $cd, $b1, $4e, $2e, $05, $e5, $0e, $07, $1e, $00, $3e, $1a, $cd, $ff, $4d
	db $c1, $c9, $be, $de, $db, $00, $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $05, $07, $28, $03, $03, $01, $09, $01, $0b, $0c
	db $0b, $ff, $ff, $f5, $7b, $b7, $c2, $12, $63, $f8, $01, $7e, $cd, $4b, $44, $21
	db $42, $04, $cd, $a9, $44, $11, $14, $63, $21, $64, $62, $cd, $d3, $4d, $b7, $c2
	db $b3, $62, $c3, $12, $63, $21, $43, $04, $cd, $a9, $44, $3e, $0a, $cd, $f1, $4f
	db $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $18, $cd, $e6, $4e, $21, $78
	db $00, $cd, $8f, $46, $af, $fe, $04, $d2, $e5, $62, $f5, $5f, $f8, $03, $7e, $cd
	db $95, $40, $f1, $3c, $c3, $d3, $62, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $af
	db $cd, $e6, $4e, $3e, $13, $cd, $e6, $4e, $01, $8d, $62, $1e, $2d, $f8, $01, $7e
	db $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $01, $21, $e1, $00, $cd, $1b, $46, $3e
	db $01, $ea, $c4, $c7, $c1, $c9, $cb, $de, $bd, $ba, $00, $00, $00, $00, $04, $32
	db $c5, $bd, $00, $00, $90, $01, $0e, $06, $2d, $04, $17, $00, $53, $38, $06, $2d
	db $0e, $0b, $00, $1b, $18, $06, $2d, $09, $09, $0b, $1c, $07, $07, $2d, $01, $13
	db $00, $63, $01, $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c, $0b, $ff, $ff, $f5, $7b
	db $b7, $c2, $e6, $63, $f8, $01, $7e, $cd, $4b, $44, $21, $e1, $00, $cd, $2e, $46
	db $b7, $c2, $73, $63, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd
	db $95, $40, $c3, $e6, $63, $21, $44, $04, $cd, $a9, $44, $11, $e8, $63, $21, $19
	db $63, $cd, $d3, $4d, $b7, $c2, $89, $63, $c3, $e6, $63, $21, $45, $04, $cd, $a9
	db $44, $af, $fe, $04, $d2, $a2, $63, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1
	db $3c, $c3, $90, $63, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe
	db $02, $c2, $c1, $63, $01, $42, $63, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46
	db $c3, $cd, $63, $01, $48, $63, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd
	db $0c, $42, $1e, $02, $f8, $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e2, $00
	db $cd, $1b, $46, $3e, $01, $ea, $c4, $c7, $c1, $c9, $b1, $d1, $db, $dd, $00, $00
	db $00, $00, $04, $32, $c5, $be, $00, $00, $4e, $01, $3a, $06, $32, $07, $0b, $00
	db $49, $0f, $06, $32, $28, $12, $00, $6a, $21, $06, $32, $0c, $0f, $00, $7a, $3b
	db $07, $32, $07, $09, $00, $4a, $01, $0b, $0b, $0b, $0c, $0b, $ff, $ff, $0b, $0a
	db $0c, $0b, $ff, $ff, $f5, $7b, $b7, $c2, $c6, $64, $f8, $01, $7e, $cd, $4b, $44
	db $21, $e1, $00, $cd, $2e, $46, $b7, $ca, $42, $64, $21, $e2, $00, $cd, $2e, $46
	db $b7, $c2, $53, $64, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd
	db $95, $40, $c3, $c6, $64, $21, $46, $04, $cd, $a9, $44, $11, $c8, $64, $21, $ed
	db $63, $cd, $d3, $4d, $b7, $c2, $69, $64, $c3, $c6, $64, $21, $47, $04, $cd, $a9
	db $44, $af, $fe, $04, $d2, $82, $64, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1
	db $3c, $c3, $70, $64, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe
	db $02, $c2, $a1, $64, $01, $16, $64, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46
	db $c3, $ad, $64, $01, $1c, $64, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd
	db $0c, $42, $1e, $02, $f8, $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e3, $00
	db $cd, $1b, $46, $3e, $01, $ea, $c4, $c7, $c1, $c9, $dc, $b2, $d9, $c4, $de, $00
	db $00, $00, $00, $04, $32, $c5, $bf, $00, $00, $75, $01, $31, $06, $37, $07, $0c
	db $00, $48, $73, $06, $37, $0c, $08, $00, $49, $74, $06, $37, $0d, $09, $00, $49
	db $32, $07, $37, $07, $07, $14, $4a, $01, $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c
	db $0b, $ff, $ff, $f5, $7b, $b7, $c2, $af, $65, $f8, $01, $7e, $cd, $4b, $44, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $2b, $65, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $2b, $65, $21, $e3, $00, $cd, $2e, $46, $b7, $c2, $3c, $65, $21, $7c, $01
	db $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3, $af, $65, $21, $48
	db $04, $cd, $a9, $44, $11, $b1, $65, $21, $ce, $64, $cd, $d3, $4d, $b7, $c2, $52
	db $65, $c3, $af, $65, $21, $49, $04, $cd, $a9, $44, $af, $fe, $04, $d2, $6b, $65
	db $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1, $3c, $c3, $59, $65, $1e, $00, $f8
	db $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe, $02, $c2, $8a, $65, $01, $f7, $64
	db $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $c3, $96, $65, $01, $fd, $64, $1e
	db $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8, $01, $7e
	db $3c, $cd, $95, $40, $1e, $01, $21, $e4, $00, $cd, $1b, $46, $3e, $01, $ea, $c4
	db $c7, $c1, $c9, $b6, $cf, $af, $c4, $00, $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0a, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b, $0d, $0b, $0c, $0b, $ff, $ff, $0c, $0b, $ff, $ff, $f5, $7b, $b7, $c2, $a1
	db $66, $f8, $01, $7e, $cd, $4b, $44, $21, $e1, $00, $cd, $2e, $46, $b7, $ca, $1d
	db $66, $21, $e2, $00, $cd, $2e, $46, $b7, $ca, $1d, $66, $21, $e3, $00, $cd, $2e
	db $46, $b7, $ca, $1d, $66, $21, $e4, $00, $cd, $2e, $46, $b7, $c2, $2e, $66, $21
	db $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3, $a1, $66
	db $21, $4a, $04, $cd, $a9, $44, $11, $a3, $66, $21, $b6, $65, $cd, $d3, $4d, $b7
	db $c2, $44, $66, $c3, $a1, $66, $21, $4b, $04, $cd, $a9, $44, $af, $fe, $04, $d2
	db $5d, $66, $f5, $5f, $f8, $03, $7e, $cd, $95, $40, $f1, $3c, $c3, $4b, $66, $1e
	db $00, $f8, $01, $7e, $cd, $3d, $41, $fa, $38, $c8, $fe, $02, $c2, $7c, $66, $01
	db $df, $65, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $c3, $88, $66, $01, $e5
	db $65, $1e, $2d, $f8, $01, $7e, $3c, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $f8
	db $01, $7e, $3c, $cd, $95, $40, $1e, $01, $21, $e5, $00, $cd, $1b, $46, $3e, $01
	db $ea, $c4, $c7, $c1, $c9, $cd, $af, $c4, $de, $00, $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $04, $04, $04
	db $7b, $01, $0b, $f5, $7b, $b7, $c2, $51, $67, $f8, $01, $7e, $cd, $4b, $44, $21
	db $e1, $00, $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e2, $00, $cd, $2e, $46, $b7
	db $ca, $0f, $67, $21, $e3, $00, $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e4, $00
	db $cd, $2e, $46, $b7, $ca, $0f, $67, $21, $e5, $00, $cd, $2e, $46, $b7, $c2, $20
	db $67, $21, $7c, $01, $cd, $98, $44, $1e, $02, $f8, $01, $7e, $cd, $95, $40, $c3
	db $51, $67, $21, $4c, $04, $cd, $a9, $44, $11, $53, $67, $21, $a8, $66, $cd, $d3
	db $4d, $b7, $c2, $36, $67, $c3, $51, $67, $21, $4d, $04, $cd, $a9, $44, $1e, $01
	db $21, $e6, $00, $cd, $1b, $46, $2e, $1a, $e5, $0e, $0f, $1e, $0a, $3e, $19, $cd
	db $ff, $4d, $c1, $c1, $c9, $c3, $b0, $d9, $00
ENDC

