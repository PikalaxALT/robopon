INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 32", ROMX
	script_library 32

Data_c90b4:
	warpdef $10, $1d, $03, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $11, $09, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $05, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $1d, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $0b, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $17, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $0b, $0c, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $17, $0c, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $0a, $14, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $18, $14, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $11, $13, $01, $01, MAP_21_20, $09, $13, $09, $12, $34

Data_c912d:
	dw $2bd
	dw -1

Data_c9131:
	dw $0bd
	dw -1

Data_c9135:
	person_event $ff, $00, $12, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $ff, $00, $10, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $09, $04, $12, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_32, Data_c9131
	person_event $1d, $04, $04, $12, $01, $01, $02, $04, $00, NULL, NULL

Func_c916d:: ; c916d
	call Func_c91a4 ; C916D (32:516d) -> CD A4 51
	ld hl, Func_c91a4 ; C9170 (32:5170) -> 21 A4 51
	scall Func_80f11 ; C9173 (32:5173) -> CD 11 4F
	ld a, $06 ; C9176 (32:5176) -> 3E 06
	ld [wc789], a ; C9178 (32:5178) -> EA 89 C7
	ld a, $09 ; C917B (32:517b) -> 3E 09
	ld [wc7e2], a ; C917D (32:517d) -> EA E2 C7
	ld e, $0b ; C9180 (32:5180) -> 1E 0B
	ld hl, Data_c90b4 ; C9182 (32:5182) -> 21 B4 50
	scall LoadWarps ; C9185 (32:5185) -> CD 3A 40
	ld e, $04 ; C9188 (32:5188) -> 1E 04
	ld hl, Data_c9135 ; C918A (32:518a) -> 21 35 51
	scall LoadMapObjects ; C918D (32:518d) -> CD FB 40
	ld a, $13 ; C9190 (32:5190) -> 3E 13
	scall PlayMusic ; C9192 (32:5192) -> CD E6 4E
	ld a, $01 ; C9195 (32:5195) -> 3E 01
	scall LoadPlayerSprite ; C9197 (32:5197) -> CD C6 4C
	scall Func_8001c ; C919A (32:519a) -> CD 1C 40
	ret  ; C919D (32:519d) -> C9

Data_c919e:
	db $10, $1e, $03, $01, $10, $1d

Func_c91a4:
	ld hl, $001f ; C91A4 (32:51a4) -> 21 1F 00
	scall CheckEventFlag ; C91A7 (32:51a7) -> CD 2E 46
	cp $01 ; C91AA (32:51aa) -> FE 01
	jp nz, .asm_c91b8 ; C91AC (32:51ac) -> C2 B8 51
	ld hl, Data_c919e ; C91AF (32:51af) -> 21 9E 51
	scall Func_80d9b ; C91B2 (32:51b2) -> CD 9B 4D
	scall Func_80f02 ; C91B5 (32:51b5) -> CD 02 4F
.asm_c91b8:
	ret  ; C91B8 (32:51b8) -> C9

Data_c91b9:
	warpdef $09, $13, $02, $01, MAP_21_00, $17, $1a, $17, $1b, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91cf:
	warpdef $09, $13, $02, $01, MAP_21_00, $0b, $1a, $0b, $1b, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91e5:
	warpdef $09, $13, $02, $01, MAP_21_00, $1d, $11, $1d, $12, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91fb:
	warpdef $09, $13, $02, $01, MAP_21_00, $05, $11, $05, $12, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c9211:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $09, $11, $0a, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c9227:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $16, $18, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $16, $18, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c926d:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c92b3:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ENDC

Data_c92f9:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c933f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0f, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c9385:
	person_event $09, $04, $09, $0f, $01, $01, $02, $04, $00, Func_c9614, NULL
	person_event $ff, $00, $0a, $0f, $01, $01, $00, $04, $01, Func_c95da, NULL

Func_c93a1:: ; c93a1
	ld a, [wBackupMapGroup] ; C93A1 (32:53a1) -> FA DF C7
	cp $15 ; C93A4 (32:53a4) -> FE 15
	jp nz, .asm_c9424 ; C93A6 (32:53a6) -> C2 24 54
	ld a, [wBackupMapNumber] ; C93A9 (32:53a9) -> FA E0 C7
	or a ; C93AC (32:53ac) -> B7
	jp nz, .asm_c9424 ; C93AD (32:53ad) -> C2 24 54
	ld a, [wBackupMapX] ; C93B0 (32:53b0) -> FA DB C7
	cp $11 ; C93B3 (32:53b3) -> FE 11
	jp nz, .asm_c93c8 ; C93B5 (32:53b5) -> C2 C8 53
	ld a, [wBackupMapY] ; C93B8 (32:53b8) -> FA DC C7
	cp $09 ; C93BB (32:53bb) -> FE 09
	jp nz, .asm_c93c8 ; C93BD (32:53bd) -> C2 C8 53
	ld a, $04 ; C93C0 (32:53c0) -> 3E 04
	ld [wc78b], a ; C93C2 (32:53c2) -> EA 8B C7
	jp .asm_c9424 ; C93C5 (32:53c5) -> C3 24 54
.asm_c93c8:
	ld a, [wBackupMapX] ; C93C8 (32:53c8) -> FA DB C7
	cp $05 ; C93CB (32:53cb) -> FE 05
	jp nz, .asm_c93e0 ; C93CD (32:53cd) -> C2 E0 53
	ld a, [wBackupMapY] ; C93D0 (32:53d0) -> FA DC C7
	cp $11 ; C93D3 (32:53d3) -> FE 11
	jp nz, .asm_c93e0 ; C93D5 (32:53d5) -> C2 E0 53
	ld a, $03 ; C93D8 (32:53d8) -> 3E 03
	ld [wc78b], a ; C93DA (32:53da) -> EA 8B C7
	jp .asm_c9424 ; C93DD (32:53dd) -> C3 24 54
.asm_c93e0:
	ld a, [wBackupMapX] ; C93E0 (32:53e0) -> FA DB C7
	cp $1d ; C93E3 (32:53e3) -> FE 1D
	jp nz, .asm_c93f8 ; C93E5 (32:53e5) -> C2 F8 53
	ld a, [wBackupMapY] ; C93E8 (32:53e8) -> FA DC C7
	cp $11 ; C93EB (32:53eb) -> FE 11
	jp nz, .asm_c93f8 ; C93ED (32:53ed) -> C2 F8 53
	ld a, $02 ; C93F0 (32:53f0) -> 3E 02
	ld [wc78b], a ; C93F2 (32:53f2) -> EA 8B C7
	jp .asm_c9424 ; C93F5 (32:53f5) -> C3 24 54
.asm_c93f8:
	ld a, [wBackupMapX] ; C93F8 (32:53f8) -> FA DB C7
	cp $0b ; C93FB (32:53fb) -> FE 0B
	jp nz, .asm_c9410 ; C93FD (32:53fd) -> C2 10 54
	ld a, [wBackupMapY] ; C9400 (32:5400) -> FA DC C7
	cp $1a ; C9403 (32:5403) -> FE 1A
	jp nz, .asm_c9410 ; C9405 (32:5405) -> C2 10 54
	ld a, $01 ; C9408 (32:5408) -> 3E 01
	ld [wc78b], a ; C940A (32:540a) -> EA 8B C7
	jp .asm_c9424 ; C940D (32:540d) -> C3 24 54
.asm_c9410:
	ld a, [wBackupMapX] ; C9410 (32:5410) -> FA DB C7
	cp $17 ; C9413 (32:5413) -> FE 17
	jp nz, .asm_c9424 ; C9415 (32:5415) -> C2 24 54
	ld a, [wBackupMapY] ; C9418 (32:5418) -> FA DC C7
	cp $1a ; C941B (32:541b) -> FE 1A
	jp nz, .asm_c9424 ; C941D (32:541d) -> C2 24 54
	xor a ; C9420 (32:5420) -> AF
	ld [wc78b], a ; C9421 (32:5421) -> EA 8B C7
.asm_c9424:
	ld e, $02 ; C9424 (32:5424) -> 1E 02
	ld hl, Data_c9385 ; C9426 (32:5426) -> 21 85 53
	scall LoadMapObjects ; C9429 (32:5429) -> CD FB 40
	ld a, [wc78b] ; C942C (32:542c) -> FA 8B C7
	cp $04 ; C942F (32:542f) -> FE 04
	jp z, .asm_c94df ; C9431 (32:5431) -> CA DF 54
	cp $03 ; C9434 (32:5434) -> FE 03
	jp z, .asm_c94b9 ; C9436 (32:5436) -> CA B9 54
	cp $02 ; C9439 (32:5439) -> FE 02
	jp z, .asm_c9493 ; C943B (32:543b) -> CA 93 54
	cp $01 ; C943E (32:543e) -> FE 01
	jp z, .asm_c946d ; C9440 (32:5440) -> CA 6D 54
	or a ; C9443 (32:5443) -> B7
	jp nz, .asm_c9502 ; C9444 (32:5444) -> C2 02 55
	ld e, $02 ; C9447 (32:5447) -> 1E 02
	ld hl, Data_c91b9 ; C9449 (32:5449) -> 21 B9 51
	scall LoadWarps ; C944C (32:544c) -> CD 3A 40
	ld a, $03 ; C944F (32:544f) -> 3E 03
	scall Func_80d01 ; C9451 (32:5451) -> CD 01 4D
	ld e, $05 ; C9454 (32:5454) -> 1E 05
	ld hl, Data_c9227 ; C9456 (32:5456) -> 21 27 52
	scall LoadEncounters ; C9459 (32:5459) -> CD 24 4D
	ld a, $09 ; C945C (32:545c) -> 3E 09
	scall PlayMusic ; C945E (32:545e) -> CD E6 4E
	scall Func_8001c ; C9461 (32:5461) -> CD 1C 40
	ld hl, $02e6 ; C9464 (32:5464) -> 21 E6 02
	scall LandmarkSign ; C9467 (32:5467) -> CD 72 4F
	jp .asm_c9502 ; C946A (32:546a) -> C3 02 55
.asm_c946d:
	ld e, $02 ; C946D (32:546d) -> 1E 02
	ld hl, Data_c91cf ; C946F (32:546f) -> 21 CF 51
	scall LoadWarps ; C9472 (32:5472) -> CD 3A 40
	ld a, $03 ; C9475 (32:5475) -> 3E 03
	scall Func_80d01 ; C9477 (32:5477) -> CD 01 4D
	ld e, $05 ; C947A (32:547a) -> 1E 05
	ld hl, Data_c926d ; C947C (32:547c) -> 21 6D 52
	scall LoadEncounters ; C947F (32:547f) -> CD 24 4D
	ld a, $0e ; C9482 (32:5482) -> 3E 0E
	scall PlayMusic ; C9484 (32:5484) -> CD E6 4E
	scall Func_8001c ; C9487 (32:5487) -> CD 1C 40
	ld hl, $02f5 ; C948A (32:548a) -> 21 F5 02
	scall LandmarkSign ; C948D (32:548d) -> CD 72 4F
	jp .asm_c9502 ; C9490 (32:5490) -> C3 02 55
.asm_c9493:
	ld e, $02 ; C9493 (32:5493) -> 1E 02
	ld hl, Data_c91e5 ; C9495 (32:5495) -> 21 E5 51
	scall LoadWarps ; C9498 (32:5498) -> CD 3A 40
	ld a, $03 ; C949B (32:549b) -> 3E 03
	scall Func_80d01 ; C949D (32:549d) -> CD 01 4D
	ld e, $05 ; C94A0 (32:54a0) -> 1E 05
	ld hl, Data_c92b3 ; C94A2 (32:54a2) -> 21 B3 52
	scall LoadEncounters ; C94A5 (32:54a5) -> CD 24 4D
	ld a, $0d ; C94A8 (32:54a8) -> 3E 0D
	scall PlayMusic ; C94AA (32:54aa) -> CD E6 4E
	scall Func_8001c ; C94AD (32:54ad) -> CD 1C 40
	ld hl, $02f0 ; C94B0 (32:54b0) -> 21 F0 02
	scall LandmarkSign ; C94B3 (32:54b3) -> CD 72 4F
	jp .asm_c9502 ; C94B6 (32:54b6) -> C3 02 55
.asm_c94b9:
	ld e, $02 ; C94B9 (32:54b9) -> 1E 02
	ld hl, Data_c91fb ; C94BB (32:54bb) -> 21 FB 51
	scall LoadWarps ; C94BE (32:54be) -> CD 3A 40
	ld a, $03 ; C94C1 (32:54c1) -> 3E 03
	scall Func_80d01 ; C94C3 (32:54c3) -> CD 01 4D
	ld e, $05 ; C94C6 (32:54c6) -> 1E 05
	ld hl, Data_c92f9 ; C94C8 (32:54c8) -> 21 F9 52
	scall LoadEncounters ; C94CB (32:54cb) -> CD 24 4D
	ld a, $0f ; C94CE (32:54ce) -> 3E 0F
	scall PlayMusic ; C94D0 (32:54d0) -> CD E6 4E
	scall Func_8001c ; C94D3 (32:54d3) -> CD 1C 40
	ld hl, $02eb ; C94D6 (32:54d6) -> 21 EB 02
	scall LandmarkSign ; C94D9 (32:54d9) -> CD 72 4F
	jp .asm_c9502 ; C94DC (32:54dc) -> C3 02 55
.asm_c94df:
	ld e, $02 ; C94DF (32:54df) -> 1E 02
	ld hl, Data_c9211 ; C94E1 (32:54e1) -> 21 11 52
	scall LoadWarps ; C94E4 (32:54e4) -> CD 3A 40
	ld a, $03 ; C94E7 (32:54e7) -> 3E 03
	scall Func_80d01 ; C94E9 (32:54e9) -> CD 01 4D
	ld e, $05 ; C94EC (32:54ec) -> 1E 05
	ld hl, Data_c933f ; C94EE (32:54ee) -> 21 3F 53
	scall LoadEncounters ; C94F1 (32:54f1) -> CD 24 4D
	ld a, $10 ; C94F4 (32:54f4) -> 3E 10
	scall PlayMusic ; C94F6 (32:54f6) -> CD E6 4E
	scall Func_8001c ; C94F9 (32:54f9) -> CD 1C 40
	ld hl, $02fa ; C94FC (32:54fc) -> 21 FA 02
	scall LandmarkSign ; C94FF (32:54ff) -> CD 72 4F
.asm_c9502:
	ret  ; C9502 (32:5502) -> C9

Func_c9503:
	ld a, [wc78b] ; C9503 (32:5503) -> FA 8B C7
	cp $04 ; C9506 (32:5506) -> FE 04
	jp z, .asm_c95b2 ; C9508 (32:5508) -> CA B2 55
	cp $03 ; C950B (32:550b) -> FE 03
	jp z, .asm_c958d ; C950D (32:550d) -> CA 8D 55
	cp $02 ; C9510 (32:5510) -> FE 02
	jp z, .asm_c9568 ; C9512 (32:5512) -> CA 68 55
	cp $01 ; C9515 (32:5515) -> FE 01
	jp z, .asm_c9543 ; C9517 (32:5517) -> CA 43 55
	or a ; C951A (32:551a) -> B7
	jp nz, .asm_c95d4 ; C951B (32:551b) -> C2 D4 55
	ld hl, $0095 ; C951E (32:551e) -> 21 95 00
	scall CheckEventFlag ; C9521 (32:5521) -> CD 2E 46
	cp $01 ; C9524 (32:5524) -> FE 01
	jp nz, .asm_c952e ; C9526 (32:5526) -> C2 2E 55
	ld l, $02 ; C9529 (32:5529) -> 2E 02
	jp .asm_c9540 ; C952B (32:552b) -> C3 40 55
.asm_c952e:
	ld hl, $003d ; C952E (32:552e) -> 21 3D 00
	scall CheckEventFlag ; C9531 (32:5531) -> CD 2E 46
	cp $01 ; C9534 (32:5534) -> FE 01
	jp nz, .asm_c953e ; C9536 (32:5536) -> C2 3E 55
	ld l, $00 ; C9539 (32:5539) -> 2E 00
	jp .asm_c9540 ; C953B (32:553b) -> C3 40 55
.asm_c953e:
	ld l, $01 ; C953E (32:553e) -> 2E 01
.asm_c9540:
	jp .asm_c95d4 ; C9540 (32:5540) -> C3 D4 55
.asm_c9543:
	ld hl, $009a ; C9543 (32:5543) -> 21 9A 00
	scall CheckEventFlag ; C9546 (32:5546) -> CD 2E 46
	cp $01 ; C9549 (32:5549) -> FE 01
	jp nz, .asm_c9553 ; C954B (32:554b) -> C2 53 55
	ld l, $02 ; C954E (32:554e) -> 2E 02
	jp .asm_c9565 ; C9550 (32:5550) -> C3 65 55
.asm_c9553:
	ld hl, $003e ; C9553 (32:5553) -> 21 3E 00
	scall CheckEventFlag ; C9556 (32:5556) -> CD 2E 46
	cp $01 ; C9559 (32:5559) -> FE 01
	jp nz, .asm_c9563 ; C955B (32:555b) -> C2 63 55
	ld l, $00 ; C955E (32:555e) -> 2E 00
	jp .asm_c9565 ; C9560 (32:5560) -> C3 65 55
.asm_c9563:
	ld l, $01 ; C9563 (32:5563) -> 2E 01
.asm_c9565:
	jp .asm_c95d4 ; C9565 (32:5565) -> C3 D4 55
.asm_c9568:
	ld hl, $009f ; C9568 (32:5568) -> 21 9F 00
	scall CheckEventFlag ; C956B (32:556b) -> CD 2E 46
	cp $01 ; C956E (32:556e) -> FE 01
	jp nz, .asm_c9578 ; C9570 (32:5570) -> C2 78 55
	ld l, $02 ; C9573 (32:5573) -> 2E 02
	jp .asm_c958a ; C9575 (32:5575) -> C3 8A 55
.asm_c9578:
	ld hl, $003f ; C9578 (32:5578) -> 21 3F 00
	scall CheckEventFlag ; C957B (32:557b) -> CD 2E 46
	cp $01 ; C957E (32:557e) -> FE 01
	jp nz, .asm_c9588 ; C9580 (32:5580) -> C2 88 55
	ld l, $00 ; C9583 (32:5583) -> 2E 00
	jp .asm_c958a ; C9585 (32:5585) -> C3 8A 55
.asm_c9588:
	ld l, $01 ; C9588 (32:5588) -> 2E 01
.asm_c958a:
	jp .asm_c95d4 ; C958A (32:558a) -> C3 D4 55
.asm_c958d:
	ld hl, $00a4 ; C958D (32:558d) -> 21 A4 00
	scall CheckEventFlag ; C9590 (32:5590) -> CD 2E 46
	cp $01 ; C9593 (32:5593) -> FE 01
	jp nz, .asm_c959d ; C9595 (32:5595) -> C2 9D 55
	ld l, $02 ; C9598 (32:5598) -> 2E 02
	jp .asm_c95af ; C959A (32:559a) -> C3 AF 55
.asm_c959d:
	ld hl, $0040 ; C959D (32:559d) -> 21 40 00
	scall CheckEventFlag ; C95A0 (32:55a0) -> CD 2E 46
	cp $01 ; C95A3 (32:55a3) -> FE 01
	jp nz, .asm_c95ad ; C95A5 (32:55a5) -> C2 AD 55
	ld l, $00 ; C95A8 (32:55a8) -> 2E 00
	jp .asm_c95af ; C95AA (32:55aa) -> C3 AF 55
.asm_c95ad:
	ld l, $01 ; C95AD (32:55ad) -> 2E 01
.asm_c95af:
	jp .asm_c95d4 ; C95AF (32:55af) -> C3 D4 55
.asm_c95b2:
	ld hl, $00a9 ; C95B2 (32:55b2) -> 21 A9 00
	scall CheckEventFlag ; C95B5 (32:55b5) -> CD 2E 46
	cp $01 ; C95B8 (32:55b8) -> FE 01
	jp nz, .asm_c95c2 ; C95BA (32:55ba) -> C2 C2 55
	ld l, $02 ; C95BD (32:55bd) -> 2E 02
	jp .asm_c95d4 ; C95BF (32:55bf) -> C3 D4 55
.asm_c95c2:
	ld hl, $0041 ; C95C2 (32:55c2) -> 21 41 00
	scall CheckEventFlag ; C95C5 (32:55c5) -> CD 2E 46
	cp $01 ; C95C8 (32:55c8) -> FE 01
	jp nz, .asm_c95d2 ; C95CA (32:55ca) -> C2 D2 55
	ld l, $00 ; C95CD (32:55cd) -> 2E 00
	jp .asm_c95d4 ; C95CF (32:55cf) -> C3 D4 55
.asm_c95d2:
	ld l, $01 ; C95D2 (32:55d2) -> 2E 01
.asm_c95d4:
	ld a, l ; C95D4 (32:55d4) -> 7D
	ret  ; C95D5 (32:55d5) -> C9

Data_c95d6:
	db $0a, $10, $ff, $ff

Func_c95da:
	push de ; C95DA (32:55da) -> D5
	ld a, $ff ; C95DB (32:55db) -> 3E FF
	call Func_c9503 ; C95DD (32:55dd) -> CD 03 55
	pop de ; C95E0 (32:55e0) -> D1
	cp $01 ; C95E1 (32:55e1) -> FE 01
	jp nz, .asm_c9613 ; C95E3 (32:55e3) -> C2 13 56
	ld a, e ; C95E6 (32:55e6) -> 7B
	cp $02 ; C95E7 (32:55e7) -> FE 02
	jp nz, .asm_c9613 ; C95E9 (32:55e9) -> C2 13 56
	ld e, $01 ; C95EC (32:55ec) -> 1E 01
	xor a ; C95EE (32:55ee) -> AF
	scall SpriteFace ; C95EF (32:55ef) -> CD 95 40
	ld hl, $001e ; C95F2 (32:55f2) -> 21 1E 00
	scall ScriptSleep ; C95F5 (32:55f5) -> CD 8F 46
	ld a, $03 ; C95F8 (32:55f8) -> 3E 03
	scall PlayerFace ; C95FA (32:55fa) -> CD 77 46
	ld hl, $00d4 ; C95FD (32:55fd) -> 21 D4 00
	scall PrintTextStandard ; C9600 (32:5600) -> CD 98 44
	ld c, $01 ; C9603 (32:5603) -> 0E 01
	ld de, Data_c95d6 ; C9605 (32:5605) -> 11 D6 55
	ld a, $32 ; C9608 (32:5608) -> 3E 32
	scall MovePlayer ; C960A (32:560a) -> CD 3E 46
	ld e, $02 ; C960D (32:560d) -> 1E 02
	xor a ; C960F (32:560f) -> AF
	scall SpriteFace ; C9610 (32:5610) -> CD 95 40
.asm_c9613:
	ret  ; C9613 (32:5613) -> C9

Func_c9614:
	push af ; C9614 (32:5614) -> F5
	push de ; C9615 (32:5615) -> D5
	ld a, $ff ; C9616 (32:5616) -> 3E FF
	call Func_c9503 ; C9618 (32:5618) -> CD 03 55
	ld l, a ; C961B (32:561b) -> 6F
	pop de ; C961C (32:561c) -> D1
	ld a, e ; C961D (32:561d) -> 7B
	or a ; C961E (32:561e) -> B7
	jp nz, .asm_c9651 ; C961F (32:561f) -> C2 51 56
	push hl ; C9622 (32:5622) -> E5
	ld hl, sp+$03 ; C9623 (32:5623) -> F8 03
	ld a, [hl] ; C9625 (32:5625) -> 7E
	scall FacePlayer ; C9626 (32:5626) -> CD 4B 44
	pop hl ; C9629 (32:5629) -> E1
	ld a, l ; C962A (32:562a) -> 7D
	cp $02 ; C962B (32:562b) -> FE 02
	jp z, .asm_c964b ; C962D (32:562d) -> CA 4B 56
	cp $01 ; C9630 (32:5630) -> FE 01
	jp z, .asm_c9642 ; C9632 (32:5632) -> CA 42 56
	or a ; C9635 (32:5635) -> B7
	jp nz, .asm_c9651 ; C9636 (32:5636) -> C2 51 56
	ld hl, $00d3 ; C9639 (32:5639) -> 21 D3 00
	scall PrintTextStandard ; C963C (32:563c) -> CD 98 44
	jp .asm_c9651 ; C963F (32:563f) -> C3 51 56
.asm_c9642:
	ld hl, $00d4 ; C9642 (32:5642) -> 21 D4 00
	scall PrintTextStandard ; C9645 (32:5645) -> CD 98 44
	jp .asm_c9651 ; C9648 (32:5648) -> C3 51 56
.asm_c964b:
	ld hl, $010f ; C964B (32:564b) -> 21 0F 01
	scall PrintTextStandard ; C964E (32:564e) -> CD 98 44
.asm_c9651:
	pop bc ; C9651 (32:5651) -> C1
	ret  ; C9652 (32:5652) -> C9

Data_c9653:
	db $01, $08, $01, $01, $15, $0c, $01, $08, $01, $09, $2e
	db $08, $08, $01, $01, $15, $0a, $08, $08, $08, $09, $2e

Data_c9669:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $16, $18, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $16, $18, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c96af:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c96f5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_c973b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c9781:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c97c7:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9915, NULL

Data_c97d5:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c999b, NULL

Data_c97e3:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9a2f, NULL

Data_c97f1:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9ac3, NULL

Data_c97ff:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9b57, NULL

Func_c980d:: ; c980d
	ld e, $02 ; C980D (32:580d) -> 1E 02
	ld hl, Data_c9653 ; C980F (32:580f) -> 21 53 56
	scall LoadWarps ; C9812 (32:5812) -> CD 3A 40
	ld a, [wc78b] ; C9815 (32:5815) -> FA 8B C7
	cp $04 ; C9818 (32:5818) -> FE 04
	jp z, .asm_c98c8 ; C981A (32:581a) -> CA C8 58
	cp $03 ; C981D (32:581d) -> FE 03
	jp z, .asm_c98a2 ; C981F (32:581f) -> CA A2 58
	cp $02 ; C9822 (32:5822) -> FE 02
	jp z, .asm_c987c ; C9824 (32:5824) -> CA 7C 58
	cp $01 ; C9827 (32:5827) -> FE 01
	jp z, .asm_c9856 ; C9829 (32:5829) -> CA 56 58
	or a ; C982C (32:582c) -> B7
	jp nz, .asm_c98eb ; C982D (32:582d) -> C2 EB 58
	ld a, $03 ; C9830 (32:5830) -> 3E 03
	scall Func_80d01 ; C9832 (32:5832) -> CD 01 4D
	ld e, $05 ; C9835 (32:5835) -> 1E 05
	ld hl, Data_c9669 ; C9837 (32:5837) -> 21 69 56
	scall LoadEncounters ; C983A (32:583a) -> CD 24 4D
	ld e, $01 ; C983D (32:583d) -> 1E 01
	ld hl, Data_c97c7 ; C983F (32:583f) -> 21 C7 57
	scall LoadMapObjects ; C9842 (32:5842) -> CD FB 40
	ld a, $09 ; C9845 (32:5845) -> 3E 09
	scall PlayMusic ; C9847 (32:5847) -> CD E6 4E
	scall Func_8001c ; C984A (32:584a) -> CD 1C 40
	ld hl, $02e7 ; C984D (32:584d) -> 21 E7 02
	scall LandmarkSign ; C9850 (32:5850) -> CD 72 4F
	jp .asm_c98eb ; C9853 (32:5853) -> C3 EB 58
.asm_c9856:
	ld a, $03 ; C9856 (32:5856) -> 3E 03
	scall Func_80d01 ; C9858 (32:5858) -> CD 01 4D
	ld e, $05 ; C985B (32:585b) -> 1E 05
	ld hl, Data_c96af ; C985D (32:585d) -> 21 AF 56
	scall LoadEncounters ; C9860 (32:5860) -> CD 24 4D
	ld e, $01 ; C9863 (32:5863) -> 1E 01
	ld hl, Data_c97d5 ; C9865 (32:5865) -> 21 D5 57
	scall LoadMapObjects ; C9868 (32:5868) -> CD FB 40
	ld a, $0e ; C986B (32:586b) -> 3E 0E
	scall PlayMusic ; C986D (32:586d) -> CD E6 4E
	scall Func_8001c ; C9870 (32:5870) -> CD 1C 40
	ld hl, $02f6 ; C9873 (32:5873) -> 21 F6 02
	scall LandmarkSign ; C9876 (32:5876) -> CD 72 4F
	jp .asm_c98eb ; C9879 (32:5879) -> C3 EB 58
.asm_c987c:
	ld a, $03 ; C987C (32:587c) -> 3E 03
	scall Func_80d01 ; C987E (32:587e) -> CD 01 4D
	ld e, $05 ; C9881 (32:5881) -> 1E 05
	ld hl, Data_c96f5 ; C9883 (32:5883) -> 21 F5 56
	scall LoadEncounters ; C9886 (32:5886) -> CD 24 4D
	ld e, $01 ; C9889 (32:5889) -> 1E 01
	ld hl, Data_c97e3 ; C988B (32:588b) -> 21 E3 57
	scall LoadMapObjects ; C988E (32:588e) -> CD FB 40
	ld a, $0d ; C9891 (32:5891) -> 3E 0D
	scall PlayMusic ; C9893 (32:5893) -> CD E6 4E
	scall Func_8001c ; C9896 (32:5896) -> CD 1C 40
	ld hl, $02f1 ; C9899 (32:5899) -> 21 F1 02
	scall LandmarkSign ; C989C (32:589c) -> CD 72 4F
	jp .asm_c98eb ; C989F (32:589f) -> C3 EB 58
.asm_c98a2:
	ld a, $03 ; C98A2 (32:58a2) -> 3E 03
	scall Func_80d01 ; C98A4 (32:58a4) -> CD 01 4D
	ld e, $05 ; C98A7 (32:58a7) -> 1E 05
	ld hl, Data_c973b ; C98A9 (32:58a9) -> 21 3B 57
	scall LoadEncounters ; C98AC (32:58ac) -> CD 24 4D
	ld e, $01 ; C98AF (32:58af) -> 1E 01
	ld hl, Data_c97f1 ; C98B1 (32:58b1) -> 21 F1 57
	scall LoadMapObjects ; C98B4 (32:58b4) -> CD FB 40
	ld a, $0f ; C98B7 (32:58b7) -> 3E 0F
	scall PlayMusic ; C98B9 (32:58b9) -> CD E6 4E
	scall Func_8001c ; C98BC (32:58bc) -> CD 1C 40
	ld hl, $02ec ; C98BF (32:58bf) -> 21 EC 02
	scall LandmarkSign ; C98C2 (32:58c2) -> CD 72 4F
	jp .asm_c98eb ; C98C5 (32:58c5) -> C3 EB 58
.asm_c98c8:
	ld a, $03 ; C98C8 (32:58c8) -> 3E 03
	scall Func_80d01 ; C98CA (32:58ca) -> CD 01 4D
	ld e, $05 ; C98CD (32:58cd) -> 1E 05
	ld hl, Data_c9781 ; C98CF (32:58cf) -> 21 81 57
	scall LoadEncounters ; C98D2 (32:58d2) -> CD 24 4D
	ld e, $01 ; C98D5 (32:58d5) -> 1E 01
	ld hl, Data_c97ff ; C98D7 (32:58d7) -> 21 FF 57
	scall LoadMapObjects ; C98DA (32:58da) -> CD FB 40
	ld a, $10 ; C98DD (32:58dd) -> 3E 10
	scall PlayMusic ; C98DF (32:58df) -> CD E6 4E
	scall Func_8001c ; C98E2 (32:58e2) -> CD 1C 40
	ld hl, $02fb ; C98E5 (32:58e5) -> 21 FB 02
	scall LandmarkSign ; C98E8 (32:58e8) -> CD 72 4F
.asm_c98eb:
	ret  ; C98EB (32:58eb) -> C9

Data_c98ec:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $08, $01, $08, $04, $1b, $03, $0f
	db $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9915:
	ld a, e ; C9915 (32:5915) -> 7B
	or a ; C9916 (32:5916) -> B7
	jp nz, .asm_c9968 ; C9917 (32:5917) -> C2 68 59
	xor a ; C991A (32:591a) -> AF
	scall FacePlayer ; C991B (32:591b) -> CD 4B 44
	ld hl, $0092 ; C991E (32:591e) -> 21 92 00
	scall CheckEventFlag ; C9921 (32:5921) -> CD 2E 46
	or a ; C9924 (32:5924) -> B7
	jp nz, .asm_c9962 ; C9925 (32:5925) -> C2 62 59
	ld hl, $025f ; C9928 (32:5928) -> 21 5F 02
	scall PrintTextStandard ; C992B (32:592b) -> CD 98 44
	ld hl, $032c ; C992E (32:592e) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9931 (32:5931) -> CD BA 44
	or a ; C9934 (32:5934) -> B7
	jp nz, .asm_c9959 ; C9935 (32:5935) -> C2 59 59
	ld de, Data_c9969 ; C9938 (32:5938) -> 11 69 59
	ld hl, Data_c98ec ; C993B (32:593b) -> 21 EC 58
	scall ScriptedBattle ; C993E (32:593e) -> CD D3 4D
	or a ; C9941 (32:5941) -> B7
	jp nz, .asm_c9948 ; C9942 (32:5942) -> C2 48 59
	jp .asm_c9968 ; C9945 (32:5945) -> C3 68 59
.asm_c9948:
	ld e, $01 ; C9948 (32:5948) -> 1E 01
	ld hl, $0092 ; C994A (32:594a) -> 21 92 00
	scall EventFlagAction ; C994D (32:594d) -> CD 1B 46
	ld hl, $0266 ; C9950 (32:5950) -> 21 66 02
	scall PrintTextStandard ; C9953 (32:5953) -> CD 98 44
	jp .asm_c995f ; C9956 (32:5956) -> C3 5F 59
.asm_c9959:
	ld hl, $0268 ; C9959 (32:5959) -> 21 68 02
	scall PrintTextStandard ; C995C (32:595c) -> CD 98 44
.asm_c995f:
	jp .asm_c9968 ; C995F (32:595f) -> C3 68 59
.asm_c9962:
	ld hl, $0266 ; C9962 (32:5962) -> 21 66 02
	scall PrintTextStandard ; C9965 (32:5965) -> CD 98 44
.asm_c9968:
	ret  ; C9968 (32:5968) -> C9

Data_c9969:
	dstr "(くﾞんしﾞん)"

Data_c9972:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $3f, $01
	db $3f, $04, $1b, $02, $09, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c999b:
	ld a, e ; C999B (32:599b) -> 7B
	or a ; C999C (32:599c) -> B7
	jp nz, .asm_c99fc ; C999D (32:599d) -> C2 FC 59
	xor a ; C99A0 (32:59a0) -> AF
	scall FacePlayer ; C99A1 (32:59a1) -> CD 4B 44
	ld hl, $0097 ; C99A4 (32:59a4) -> 21 97 00
	scall CheckEventFlag ; C99A7 (32:59a7) -> CD 2E 46
	or a ; C99AA (32:59aa) -> B7
	jp nz, .asm_c99f6 ; C99AB (32:59ab) -> C2 F6 59
	ld hl, $0261 ; C99AE (32:59ae) -> 21 61 02
	scall PrintTextStandard ; C99B1 (32:59b1) -> CD 98 44
	ld hl, $032c ; C99B4 (32:59b4) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C99B7 (32:59b7) -> CD BA 44
	or a ; C99BA (32:59ba) -> B7
	jp nz, .asm_c99ed ; C99BB (32:59bb) -> C2 ED 59
	ld hl, $015e ; C99BE (32:59be) -> 21 5E 01
	scall PrintTextStandard ; C99C1 (32:59c1) -> CD 98 44
.asm_c99c4:
	ld de, Data_c99fd ; C99C4 (32:59c4) -> 11 FD 59
	ld hl, Data_c9972 ; C99C7 (32:59c7) -> 21 72 59
	scall Func_803f5 ; C99CA (32:59ca) -> CD F4 43
	or a ; C99CD (32:59cd) -> B7
	jp nz, .asm_c99dc ; C99CE (32:59ce) -> C2 DC 59
	ld a, [wc7c4] ; C99D1 (32:59d1) -> FA C4 C7
	cp $01 ; C99D4 (32:59d4) -> FE 01
	jp nz, .asm_c99c4 ; C99D6 (32:59d6) -> C2 C4 59
	jp .asm_c99fc ; C99D9 (32:59d9) -> C3 FC 59
.asm_c99dc:
	ld e, $01 ; C99DC (32:59dc) -> 1E 01
	ld hl, $0097 ; C99DE (32:59de) -> 21 97 00
	scall EventFlagAction ; C99E1 (32:59e1) -> CD 1B 46
	ld hl, $0262 ; C99E4 (32:59e4) -> 21 62 02
	scall PrintTextStandard ; C99E7 (32:59e7) -> CD 98 44
	jp .asm_c99f3 ; C99EA (32:59ea) -> C3 F3 59
.asm_c99ed:
	ld hl, $0269 ; C99ED (32:59ed) -> 21 69 02
	scall PrintTextStandard ; C99F0 (32:59f0) -> CD 98 44
.asm_c99f3:
	jp .asm_c99fc ; C99F3 (32:59f3) -> C3 FC 59
.asm_c99f6:
	ld hl, $0263 ; C99F6 (32:59f6) -> 21 63 02
	scall PrintTextStandard ; C99F9 (32:59f9) -> CD 98 44
.asm_c99fc:
	ret  ; C99FC (32:59fc) -> C9

Data_c99fd:
	dstr "(くﾞんしﾞん)"

Data_c9a06:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $7e, $01, $7e, $04, $1b, $28, $12, $00, $71, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_c9a2f:
	ld a, e ; C9A2F (32:5a2f) -> 7B
	or a ; C9A30 (32:5a30) -> B7
	jp nz, .asm_c9a90 ; C9A31 (32:5a31) -> C2 90 5A
	xor a ; C9A34 (32:5a34) -> AF
	scall FacePlayer ; C9A35 (32:5a35) -> CD 4B 44
	ld hl, $009c ; C9A38 (32:5a38) -> 21 9C 00
	scall CheckEventFlag ; C9A3B (32:5a3b) -> CD 2E 46
	or a ; C9A3E (32:5a3e) -> B7
	jp nz, .asm_c9a8a ; C9A3F (32:5a3f) -> C2 8A 5A
	ld hl, $0261 ; C9A42 (32:5a42) -> 21 61 02
	scall PrintTextStandard ; C9A45 (32:5a45) -> CD 98 44
	ld hl, $032c ; C9A48 (32:5a48) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9A4B (32:5a4b) -> CD BA 44
	or a ; C9A4E (32:5a4e) -> B7
	jp nz, .asm_c9a81 ; C9A4F (32:5a4f) -> C2 81 5A
	ld hl, $017a ; C9A52 (32:5a52) -> 21 7A 01
	scall PrintTextStandard ; C9A55 (32:5a55) -> CD 98 44
.asm_c9a58:
	ld de, Data_c9a91 ; C9A58 (32:5a58) -> 11 91 5A
	ld hl, Data_c9a06 ; C9A5B (32:5a5b) -> 21 06 5A
	scall Func_802ef ; C9A5E (32:5a5e) -> CD EF 42
	or a ; C9A61 (32:5a61) -> B7
	jp nz, .asm_c9a70 ; C9A62 (32:5a62) -> C2 70 5A
	ld a, [wc7c4] ; C9A65 (32:5a65) -> FA C4 C7
	cp $01 ; C9A68 (32:5a68) -> FE 01
	jp nz, .asm_c9a58 ; C9A6A (32:5a6a) -> C2 58 5A
	jp .asm_c9a90 ; C9A6D (32:5a6d) -> C3 90 5A
.asm_c9a70:
	ld e, $01 ; C9A70 (32:5a70) -> 1E 01
	ld hl, $009c ; C9A72 (32:5a72) -> 21 9C 00
	scall EventFlagAction ; C9A75 (32:5a75) -> CD 1B 46
	ld hl, $0262 ; C9A78 (32:5a78) -> 21 62 02
	scall PrintTextStandard ; C9A7B (32:5a7b) -> CD 98 44
	jp .asm_c9a87 ; C9A7E (32:5a7e) -> C3 87 5A
.asm_c9a81:
	ld hl, $0268 ; C9A81 (32:5a81) -> 21 68 02
	scall PrintTextStandard ; C9A84 (32:5a84) -> CD 98 44
.asm_c9a87:
	jp .asm_c9a90 ; C9A87 (32:5a87) -> C3 90 5A
.asm_c9a8a:
	ld hl, $0260 ; C9A8A (32:5a8a) -> 21 60 02
	scall PrintTextStandard ; C9A8D (32:5a8d) -> CD 98 44
.asm_c9a90:
	ret  ; C9A90 (32:5a90) -> C9

Data_c9a91:
	dstr "(くﾞんしﾞん)"

Data_c9a9a:
	db $00, $00, $00
	db $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e, $04, $1b, $01, $02, $00, $05, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_c9ac3:
	ld a, e ; C9AC3 (32:5ac3) -> 7B
	or a ; C9AC4 (32:5ac4) -> B7
	jp nz, .asm_c9b24 ; C9AC5 (32:5ac5) -> C2 24 5B
	xor a ; C9AC8 (32:5ac8) -> AF
	scall FacePlayer ; C9AC9 (32:5ac9) -> CD 4B 44
	ld hl, $00a1 ; C9ACC (32:5acc) -> 21 A1 00
	scall CheckEventFlag ; C9ACF (32:5acf) -> CD 2E 46
	or a ; C9AD2 (32:5ad2) -> B7
	jp nz, .asm_c9b1e ; C9AD3 (32:5ad3) -> C2 1E 5B
	ld hl, $0261 ; C9AD6 (32:5ad6) -> 21 61 02
	scall PrintTextStandard ; C9AD9 (32:5ad9) -> CD 98 44
	ld hl, $032c ; C9ADC (32:5adc) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9ADF (32:5adf) -> CD BA 44
	or a ; C9AE2 (32:5ae2) -> B7
	jp nz, .asm_c9b15 ; C9AE3 (32:5ae3) -> C2 15 5B
	ld hl, $016b ; C9AE6 (32:5ae6) -> 21 6B 01
	scall PrintTextStandard ; C9AE9 (32:5ae9) -> CD 98 44
.asm_c9aec:
	ld de, Data_c9b25 ; C9AEC (32:5aec) -> 11 25 5B
	ld hl, Data_c9a9a ; C9AEF (32:5aef) -> 21 9A 5A
	scall Func_80347 ; C9AF2 (32:5af2) -> CD 46 43
	or a ; C9AF5 (32:5af5) -> B7
	jp nz, .asm_c9b04 ; C9AF6 (32:5af6) -> C2 04 5B
	ld a, [wc7c4] ; C9AF9 (32:5af9) -> FA C4 C7
	cp $01 ; C9AFC (32:5afc) -> FE 01
	jp nz, .asm_c9aec ; C9AFE (32:5afe) -> C2 EC 5A
	jp .asm_c9b24 ; C9B01 (32:5b01) -> C3 24 5B
.asm_c9b04:
	ld e, $01 ; C9B04 (32:5b04) -> 1E 01
	ld hl, $00a1 ; C9B06 (32:5b06) -> 21 A1 00
	scall EventFlagAction ; C9B09 (32:5b09) -> CD 1B 46
	ld hl, $0266 ; C9B0C (32:5b0c) -> 21 66 02
	scall PrintTextStandard ; C9B0F (32:5b0f) -> CD 98 44
	jp .asm_c9b1b ; C9B12 (32:5b12) -> C3 1B 5B
.asm_c9b15:
	ld hl, $0269 ; C9B15 (32:5b15) -> 21 69 02
	scall PrintTextStandard ; C9B18 (32:5b18) -> CD 98 44
.asm_c9b1b:
	jp .asm_c9b24 ; C9B1B (32:5b1b) -> C3 24 5B
.asm_c9b1e:
	ld hl, $0266 ; C9B1E (32:5b1e) -> 21 66 02
	scall PrintTextStandard ; C9B21 (32:5b21) -> CD 98 44
.asm_c9b24:
	ret  ; C9B24 (32:5b24) -> C9

Data_c9b25:
	dstr "(くﾞんしﾞん)"

Data_c9b2e:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $62, $01, $62, $04, $1b, $02
	db $03, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9b57:
	ld a, e ; C9B57 (32:5b57) -> 7B
	or a ; C9B58 (32:5b58) -> B7
	jp nz, .asm_c9bb8 ; C9B59 (32:5b59) -> C2 B8 5B
	xor a ; C9B5C (32:5b5c) -> AF
	scall FacePlayer ; C9B5D (32:5b5d) -> CD 4B 44
	ld hl, $00a6 ; C9B60 (32:5b60) -> 21 A6 00
	scall CheckEventFlag ; C9B63 (32:5b63) -> CD 2E 46
	or a ; C9B66 (32:5b66) -> B7
	jp nz, .asm_c9bb2 ; C9B67 (32:5b67) -> C2 B2 5B
	ld hl, $0261 ; C9B6A (32:5b6a) -> 21 61 02
	scall PrintTextStandard ; C9B6D (32:5b6d) -> CD 98 44
	ld hl, $032c ; C9B70 (32:5b70) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9B73 (32:5b73) -> CD BA 44
	or a ; C9B76 (32:5b76) -> B7
	jp nz, .asm_c9ba9 ; C9B77 (32:5b77) -> C2 A9 5B
	ld hl, $015d ; C9B7A (32:5b7a) -> 21 5D 01
	scall PrintTextStandard ; C9B7D (32:5b7d) -> CD 98 44
.asm_c9b80:
	ld de, Data_c9bb9 ; C9B80 (32:5b80) -> 11 B9 5B
	ld hl, Data_c9b2e ; C9B83 (32:5b83) -> 21 2E 5B
	scall Func_8039e ; C9B86 (32:5b86) -> CD 9D 43
	or a ; C9B89 (32:5b89) -> B7
	jp nz, .asm_c9b98 ; C9B8A (32:5b8a) -> C2 98 5B
	ld a, [wc7c4] ; C9B8D (32:5b8d) -> FA C4 C7
	cp $01 ; C9B90 (32:5b90) -> FE 01
	jp nz, .asm_c9b80 ; C9B92 (32:5b92) -> C2 80 5B
	jp .asm_c9bb8 ; C9B95 (32:5b95) -> C3 B8 5B
.asm_c9b98:
	ld e, $01 ; C9B98 (32:5b98) -> 1E 01
	ld hl, $00a6 ; C9B9A (32:5b9a) -> 21 A6 00
	scall EventFlagAction ; C9B9D (32:5b9d) -> CD 1B 46
	ld hl, $0260 ; C9BA0 (32:5ba0) -> 21 60 02
	scall PrintTextStandard ; C9BA3 (32:5ba3) -> CD 98 44
	jp .asm_c9baf ; C9BA6 (32:5ba6) -> C3 AF 5B
.asm_c9ba9:
	ld hl, $0267 ; C9BA9 (32:5ba9) -> 21 67 02
	scall PrintTextStandard ; C9BAC (32:5bac) -> CD 98 44
.asm_c9baf:
	jp .asm_c9bb8 ; C9BAF (32:5baf) -> C3 B8 5B
.asm_c9bb2:
	ld hl, $0266 ; C9BB2 (32:5bb2) -> 21 66 02
	scall PrintTextStandard ; C9BB5 (32:5bb5) -> CD 98 44
.asm_c9bb8:
	ret  ; C9BB8 (32:5bb8) -> C9

Data_c9bb9:
	dstr "(くﾞんしﾞん)"

Data_c9bc2:
	warpdef $01, $08, $01, $01, MAP_21_11, $01, $08, $02, $08, $2e
	warpdef $0c, $12, $01, $01, MAP_21_13, $0c, $12, $0b, $12, $2e
	warpdef $10, $06, $01, $01, MAP_21_13, $10, $06, $10, $07, $2e

Data_c9be3:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $15, $17, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $15, $17, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c9c29:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c9c6f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_c9cb5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c9cfb:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c9d41:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9ea5, NULL

Data_c9d4f:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9f2b, NULL

Data_c9d5d:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9fbf, NULL

Data_c9d6b:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_ca053, NULL

Data_c9d79:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_ca0e7, NULL

Data_c9d87:
	person_event $ff, $00, $11, $09, $03, $03, $00, $04, $00, Func_ca152, NULL

Func_c9d95:: ; c9d95
	ld e, $03 ; C9D95 (32:5d95) -> 1E 03
	ld hl, Data_c9bc2 ; C9D97 (32:5d97) -> 21 C2 5B
	scall LoadWarps ; C9D9A (32:5d9a) -> CD 3A 40
	ld a, [wc78b] ; C9D9D (32:5d9d) -> FA 8B C7
	cp $04 ; C9DA0 (32:5da0) -> FE 04
	jp z, .asm_c9e50 ; C9DA2 (32:5da2) -> CA 50 5E
	cp $03 ; C9DA5 (32:5da5) -> FE 03
	jp z, .asm_c9e2a ; C9DA7 (32:5da7) -> CA 2A 5E
	cp $02 ; C9DAA (32:5daa) -> FE 02
	jp z, .asm_c9e04 ; C9DAC (32:5dac) -> CA 04 5E
	cp $01 ; C9DAF (32:5daf) -> FE 01
	jp z, .asm_c9dde ; C9DB1 (32:5db1) -> CA DE 5D
	or a ; C9DB4 (32:5db4) -> B7
	jp nz, .asm_c9e73 ; C9DB5 (32:5db5) -> C2 73 5E
	ld a, $03 ; C9DB8 (32:5db8) -> 3E 03
	scall Func_80d01 ; C9DBA (32:5dba) -> CD 01 4D
	ld e, $05 ; C9DBD (32:5dbd) -> 1E 05
	ld hl, Data_c9be3 ; C9DBF (32:5dbf) -> 21 E3 5B
	scall LoadEncounters ; C9DC2 (32:5dc2) -> CD 24 4D
	ld e, $01 ; C9DC5 (32:5dc5) -> 1E 01
	ld hl, Data_c9d41 ; C9DC7 (32:5dc7) -> 21 41 5D
	scall LoadMapObjects ; C9DCA (32:5dca) -> CD FB 40
	ld a, $09 ; C9DCD (32:5dcd) -> 3E 09
	scall PlayMusic ; C9DCF (32:5dcf) -> CD E6 4E
	scall Func_8001c ; C9DD2 (32:5dd2) -> CD 1C 40
	ld hl, $02e8 ; C9DD5 (32:5dd5) -> 21 E8 02
	scall LandmarkSign ; C9DD8 (32:5dd8) -> CD 72 4F
	jp .asm_c9e73 ; C9DDB (32:5ddb) -> C3 73 5E
.asm_c9dde:
	ld a, $03 ; C9DDE (32:5dde) -> 3E 03
	scall Func_80d01 ; C9DE0 (32:5de0) -> CD 01 4D
	ld e, $05 ; C9DE3 (32:5de3) -> 1E 05
	ld hl, Data_c9c29 ; C9DE5 (32:5de5) -> 21 29 5C
	scall LoadEncounters ; C9DE8 (32:5de8) -> CD 24 4D
	ld e, $01 ; C9DEB (32:5deb) -> 1E 01
	ld hl, Data_c9d4f ; C9DED (32:5ded) -> 21 4F 5D
	scall LoadMapObjects ; C9DF0 (32:5df0) -> CD FB 40
	ld a, $0e ; C9DF3 (32:5df3) -> 3E 0E
	scall PlayMusic ; C9DF5 (32:5df5) -> CD E6 4E
	scall Func_8001c ; C9DF8 (32:5df8) -> CD 1C 40
	ld hl, $02f7 ; C9DFB (32:5dfb) -> 21 F7 02
	scall LandmarkSign ; C9DFE (32:5dfe) -> CD 72 4F
	jp .asm_c9e73 ; C9E01 (32:5e01) -> C3 73 5E
.asm_c9e04:
	ld a, $03 ; C9E04 (32:5e04) -> 3E 03
	scall Func_80d01 ; C9E06 (32:5e06) -> CD 01 4D
	ld e, $05 ; C9E09 (32:5e09) -> 1E 05
	ld hl, Data_c9c6f ; C9E0B (32:5e0b) -> 21 6F 5C
	scall LoadEncounters ; C9E0E (32:5e0e) -> CD 24 4D
	ld e, $01 ; C9E11 (32:5e11) -> 1E 01
	ld hl, Data_c9d5d ; C9E13 (32:5e13) -> 21 5D 5D
	scall LoadMapObjects ; C9E16 (32:5e16) -> CD FB 40
	ld a, $0d ; C9E19 (32:5e19) -> 3E 0D
	scall PlayMusic ; C9E1B (32:5e1b) -> CD E6 4E
	scall Func_8001c ; C9E1E (32:5e1e) -> CD 1C 40
	ld hl, $02f2 ; C9E21 (32:5e21) -> 21 F2 02
	scall LandmarkSign ; C9E24 (32:5e24) -> CD 72 4F
	jp .asm_c9e73 ; C9E27 (32:5e27) -> C3 73 5E
.asm_c9e2a:
	ld a, $03 ; C9E2A (32:5e2a) -> 3E 03
	scall Func_80d01 ; C9E2C (32:5e2c) -> CD 01 4D
	ld e, $05 ; C9E2F (32:5e2f) -> 1E 05
	ld hl, Data_c9cb5 ; C9E31 (32:5e31) -> 21 B5 5C
	scall LoadEncounters ; C9E34 (32:5e34) -> CD 24 4D
	ld e, $01 ; C9E37 (32:5e37) -> 1E 01
	ld hl, Data_c9d6b ; C9E39 (32:5e39) -> 21 6B 5D
	scall LoadMapObjects ; C9E3C (32:5e3c) -> CD FB 40
	ld a, $0f ; C9E3F (32:5e3f) -> 3E 0F
	scall PlayMusic ; C9E41 (32:5e41) -> CD E6 4E
	scall Func_8001c ; C9E44 (32:5e44) -> CD 1C 40
	ld hl, $02ed ; C9E47 (32:5e47) -> 21 ED 02
	scall LandmarkSign ; C9E4A (32:5e4a) -> CD 72 4F
	jp .asm_c9e73 ; C9E4D (32:5e4d) -> C3 73 5E
.asm_c9e50:
	ld a, $03 ; C9E50 (32:5e50) -> 3E 03
	scall Func_80d01 ; C9E52 (32:5e52) -> CD 01 4D
	ld e, $05 ; C9E55 (32:5e55) -> 1E 05
	ld hl, Data_c9cfb ; C9E57 (32:5e57) -> 21 FB 5C
	scall LoadEncounters ; C9E5A (32:5e5a) -> CD 24 4D
	ld e, $01 ; C9E5D (32:5e5d) -> 1E 01
	ld hl, Data_c9d79 ; C9E5F (32:5e5f) -> 21 79 5D
	scall LoadMapObjects ; C9E62 (32:5e62) -> CD FB 40
	ld a, $10 ; C9E65 (32:5e65) -> 3E 10
	scall PlayMusic ; C9E67 (32:5e67) -> CD E6 4E
	scall Func_8001c ; C9E6A (32:5e6a) -> CD 1C 40
	ld hl, $02fc ; C9E6D (32:5e6d) -> 21 FC 02
	scall LandmarkSign ; C9E70 (32:5e70) -> CD 72 4F
.asm_c9e73:
	ld e, $01 ; C9E73 (32:5e73) -> 1E 01
	ld hl, Data_c9d87 ; C9E75 (32:5e75) -> 21 87 5D
	scall LoadMapObjects ; C9E78 (32:5e78) -> CD FB 40
	ret  ; C9E7B (32:5e7b) -> C9

Data_c9e7c:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $0b, $01, $0b, $04, $1c, $05, $17, $00, $08, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9ea5:
	ld a, e ; C9EA5 (32:5ea5) -> 7B
	or a ; C9EA6 (32:5ea6) -> B7
	jp nz, .asm_c9ef8 ; C9EA7 (32:5ea7) -> C2 F8 5E
	xor a ; C9EAA (32:5eaa) -> AF
	scall FacePlayer ; C9EAB (32:5eab) -> CD 4B 44
	ld hl, $0093 ; C9EAE (32:5eae) -> 21 93 00
	scall CheckEventFlag ; C9EB1 (32:5eb1) -> CD 2E 46
	or a ; C9EB4 (32:5eb4) -> B7
	jp nz, .asm_c9ef2 ; C9EB5 (32:5eb5) -> C2 F2 5E
	ld hl, $025f ; C9EB8 (32:5eb8) -> 21 5F 02
	scall PrintTextStandard ; C9EBB (32:5ebb) -> CD 98 44
	ld hl, $032c ; C9EBE (32:5ebe) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9EC1 (32:5ec1) -> CD BA 44
	or a ; C9EC4 (32:5ec4) -> B7
	jp nz, .asm_c9ee9 ; C9EC5 (32:5ec5) -> C2 E9 5E
	ld de, Data_c9ef9 ; C9EC8 (32:5ec8) -> 11 F9 5E
	ld hl, Data_c9e7c ; C9ECB (32:5ecb) -> 21 7C 5E
	scall ScriptedBattle ; C9ECE (32:5ece) -> CD D3 4D
	or a ; C9ED1 (32:5ed1) -> B7
	jp nz, .asm_c9ed8 ; C9ED2 (32:5ed2) -> C2 D8 5E
	jp .asm_c9ef8 ; C9ED5 (32:5ed5) -> C3 F8 5E
.asm_c9ed8:
	ld e, $01 ; C9ED8 (32:5ed8) -> 1E 01
	ld hl, $0093 ; C9EDA (32:5eda) -> 21 93 00
	scall EventFlagAction ; C9EDD (32:5edd) -> CD 1B 46
	ld hl, $0260 ; C9EE0 (32:5ee0) -> 21 60 02
	scall PrintTextStandard ; C9EE3 (32:5ee3) -> CD 98 44
	jp .asm_c9eef ; C9EE6 (32:5ee6) -> C3 EF 5E
.asm_c9ee9:
	ld hl, $0269 ; C9EE9 (32:5ee9) -> 21 69 02
	scall PrintTextStandard ; C9EEC (32:5eec) -> CD 98 44
.asm_c9eef:
	jp .asm_c9ef8 ; C9EEF (32:5eef) -> C3 F8 5E
.asm_c9ef2:
	ld hl, $0266 ; C9EF2 (32:5ef2) -> 21 66 02
	scall PrintTextStandard ; C9EF5 (32:5ef5) -> CD 98 44
.asm_c9ef8:
	ret  ; C9EF8 (32:5ef8) -> C9

Data_c9ef9:
	dstr "(くﾞんしﾞん)"

Data_c9f02:
	db $00, $00, $00
	db $01, $00, $c5, $ba, $00, $00, $01, $01, $01, $04, $1c, $17, $17, $00, $71, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_c9f2b:
	ld a, e ; C9F2B (32:5f2b) -> 7B
	or a ; C9F2C (32:5f2c) -> B7
	jp nz, .asm_c9f8c ; C9F2D (32:5f2d) -> C2 8C 5F
	xor a ; C9F30 (32:5f30) -> AF
	scall FacePlayer ; C9F31 (32:5f31) -> CD 4B 44
	ld hl, $0098 ; C9F34 (32:5f34) -> 21 98 00
	scall CheckEventFlag ; C9F37 (32:5f37) -> CD 2E 46
	or a ; C9F3A (32:5f3a) -> B7
	jp nz, .asm_c9f86 ; C9F3B (32:5f3b) -> C2 86 5F
	ld hl, $0260 ; C9F3E (32:5f3e) -> 21 60 02
	scall PrintTextStandard ; C9F41 (32:5f41) -> CD 98 44
	ld hl, $032c ; C9F44 (32:5f44) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9F47 (32:5f47) -> CD BA 44
	or a ; C9F4A (32:5f4a) -> B7
	jp nz, .asm_c9f7d ; C9F4B (32:5f4b) -> C2 7D 5F
	ld hl, $015e ; C9F4E (32:5f4e) -> 21 5E 01
	scall PrintTextStandard ; C9F51 (32:5f51) -> CD 98 44
.asm_c9f54:
	ld de, Data_c9f8d ; C9F54 (32:5f54) -> 11 8D 5F
	ld hl, Data_c9f02 ; C9F57 (32:5f57) -> 21 02 5F
	scall Func_803f5 ; C9F5A (32:5f5a) -> CD F4 43
	or a ; C9F5D (32:5f5d) -> B7
	jp nz, .asm_c9f6c ; C9F5E (32:5f5e) -> C2 6C 5F
	ld a, [wc7c4] ; C9F61 (32:5f61) -> FA C4 C7
	cp $01 ; C9F64 (32:5f64) -> FE 01
	jp nz, .asm_c9f54 ; C9F66 (32:5f66) -> C2 54 5F
	jp .asm_c9f8c ; C9F69 (32:5f69) -> C3 8C 5F
.asm_c9f6c:
	ld e, $01 ; C9F6C (32:5f6c) -> 1E 01
	ld hl, $0098 ; C9F6E (32:5f6e) -> 21 98 00
	scall EventFlagAction ; C9F71 (32:5f71) -> CD 1B 46
	ld hl, $0263 ; C9F74 (32:5f74) -> 21 63 02
	scall PrintTextStandard ; C9F77 (32:5f77) -> CD 98 44
	jp .asm_c9f83 ; C9F7A (32:5f7a) -> C3 83 5F
.asm_c9f7d:
	ld hl, $0267 ; C9F7D (32:5f7d) -> 21 67 02
	scall PrintTextStandard ; C9F80 (32:5f80) -> CD 98 44
.asm_c9f83:
	jp .asm_c9f8c ; C9F83 (32:5f83) -> C3 8C 5F
.asm_c9f86:
	ld hl, $0264 ; C9F86 (32:5f86) -> 21 64 02
	scall PrintTextStandard ; C9F89 (32:5f89) -> CD 98 44
.asm_c9f8c:
	ret  ; C9F8C (32:5f8c) -> C9

Data_c9f8d:
	dstr "(くﾞんしﾞん)"

Data_c9f96:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4f, $01, $4f, $04, $1c, $14
	db $14, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9fbf:
	ld a, e ; C9FBF (32:5fbf) -> 7B
	or a ; C9FC0 (32:5fc0) -> B7
	jp nz, .asm_ca020 ; C9FC1 (32:5fc1) -> C2 20 60
	xor a ; C9FC4 (32:5fc4) -> AF
	scall FacePlayer ; C9FC5 (32:5fc5) -> CD 4B 44
	ld hl, $009d ; C9FC8 (32:5fc8) -> 21 9D 00
	scall CheckEventFlag ; C9FCB (32:5fcb) -> CD 2E 46
	or a ; C9FCE (32:5fce) -> B7
	jp nz, .asm_ca01a ; C9FCF (32:5fcf) -> C2 1A 60
	ld hl, $0263 ; C9FD2 (32:5fd2) -> 21 63 02
	scall PrintTextStandard ; C9FD5 (32:5fd5) -> CD 98 44
	ld hl, $032c ; C9FD8 (32:5fd8) -> 21 2C 03
	scall PrintTextWithYesNoBox ; C9FDB (32:5fdb) -> CD BA 44
	or a ; C9FDE (32:5fde) -> B7
	jp nz, .asm_ca011 ; C9FDF (32:5fdf) -> C2 11 60
	ld hl, $017a ; C9FE2 (32:5fe2) -> 21 7A 01
	scall PrintTextStandard ; C9FE5 (32:5fe5) -> CD 98 44
.asm_c9fe8:
	ld de, Data_ca021 ; C9FE8 (32:5fe8) -> 11 21 60
	ld hl, Data_c9f96 ; C9FEB (32:5feb) -> 21 96 5F
	scall Func_802ef ; C9FEE (32:5fee) -> CD EF 42
	or a ; C9FF1 (32:5ff1) -> B7
	jp nz, .asm_ca000 ; C9FF2 (32:5ff2) -> C2 00 60
	ld a, [wc7c4] ; C9FF5 (32:5ff5) -> FA C4 C7
	cp $01 ; C9FF8 (32:5ff8) -> FE 01
	jp nz, .asm_c9fe8 ; C9FFA (32:5ffa) -> C2 E8 5F
	jp .asm_ca020 ; C9FFD (32:5ffd) -> C3 20 60
.asm_ca000:
	ld e, $01 ; CA000 (32:6000) -> 1E 01
	ld hl, $009d ; CA002 (32:6002) -> 21 9D 00
	scall EventFlagAction ; CA005 (32:6005) -> CD 1B 46
	ld hl, $0264 ; CA008 (32:6008) -> 21 64 02
	scall PrintTextStandard ; CA00B (32:600b) -> CD 98 44
	jp .asm_ca017 ; CA00E (32:600e) -> C3 17 60
.asm_ca011:
	ld hl, $0262 ; CA011 (32:6011) -> 21 62 02
	scall PrintTextStandard ; CA014 (32:6014) -> CD 98 44
.asm_ca017:
	jp .asm_ca020 ; CA017 (32:6017) -> C3 20 60
.asm_ca01a:
	ld hl, $0263 ; CA01A (32:601a) -> 21 63 02
	scall PrintTextStandard ; CA01D (32:601d) -> CD 98 44
.asm_ca020:
	ret  ; CA020 (32:6020) -> C9

Data_ca021:
	dstr "(くﾞんしﾞん)"

Data_ca02a:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $3d, $01
	db $3d, $04, $1c, $1f, $17, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca053:
	ld a, e ; CA053 (32:6053) -> 7B
	or a ; CA054 (32:6054) -> B7
	jp nz, .asm_ca0b4 ; CA055 (32:6055) -> C2 B4 60
	xor a ; CA058 (32:6058) -> AF
	scall FacePlayer ; CA059 (32:6059) -> CD 4B 44
	ld hl, $00a2 ; CA05C (32:605c) -> 21 A2 00
	scall CheckEventFlag ; CA05F (32:605f) -> CD 2E 46
	or a ; CA062 (32:6062) -> B7
	jp nz, .asm_ca0ae ; CA063 (32:6063) -> C2 AE 60
	ld hl, $0260 ; CA066 (32:6066) -> 21 60 02
	scall PrintTextStandard ; CA069 (32:6069) -> CD 98 44
	ld hl, $032c ; CA06C (32:606c) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA06F (32:606f) -> CD BA 44
	or a ; CA072 (32:6072) -> B7
	jp nz, .asm_ca0a5 ; CA073 (32:6073) -> C2 A5 60
	ld hl, $016b ; CA076 (32:6076) -> 21 6B 01
	scall PrintTextStandard ; CA079 (32:6079) -> CD 98 44
.asm_ca07c:
	ld de, Data_ca0b5 ; CA07C (32:607c) -> 11 B5 60
	ld hl, Data_ca02a ; CA07F (32:607f) -> 21 2A 60
	scall Func_80347 ; CA082 (32:6082) -> CD 46 43
	or a ; CA085 (32:6085) -> B7
	jp nz, .asm_ca094 ; CA086 (32:6086) -> C2 94 60
	ld a, [wc7c4] ; CA089 (32:6089) -> FA C4 C7
	cp $01 ; CA08C (32:608c) -> FE 01
	jp nz, .asm_ca07c ; CA08E (32:608e) -> C2 7C 60
	jp .asm_ca0b4 ; CA091 (32:6091) -> C3 B4 60
.asm_ca094:
	ld e, $01 ; CA094 (32:6094) -> 1E 01
	ld hl, $00a2 ; CA096 (32:6096) -> 21 A2 00
	scall EventFlagAction ; CA099 (32:6099) -> CD 1B 46
	ld hl, $0262 ; CA09C (32:609c) -> 21 62 02
	scall PrintTextStandard ; CA09F (32:609f) -> CD 98 44
	jp .asm_ca0ab ; CA0A2 (32:60a2) -> C3 AB 60
.asm_ca0a5:
	ld hl, $0268 ; CA0A5 (32:60a5) -> 21 68 02
	scall PrintTextStandard ; CA0A8 (32:60a8) -> CD 98 44
.asm_ca0ab:
	jp .asm_ca0b4 ; CA0AB (32:60ab) -> C3 B4 60
.asm_ca0ae:
	ld hl, $0266 ; CA0AE (32:60ae) -> 21 66 02
	scall PrintTextStandard ; CA0B1 (32:60b1) -> CD 98 44
.asm_ca0b4:
	ret  ; CA0B4 (32:60b4) -> C9

Data_ca0b5:
	dstr "(くﾞんしﾞん)"

Data_ca0be:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $6b, $01, $6b, $04, $1c, $17, $17, $0a, $04, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_ca0e7:
	ld a, e ; CA0E7 (32:60e7) -> 7B
	or a ; CA0E8 (32:60e8) -> B7
	jp nz, .asm_ca148 ; CA0E9 (32:60e9) -> C2 48 61
	xor a ; CA0EC (32:60ec) -> AF
	scall FacePlayer ; CA0ED (32:60ed) -> CD 4B 44
	ld hl, $00a7 ; CA0F0 (32:60f0) -> 21 A7 00
	scall CheckEventFlag ; CA0F3 (32:60f3) -> CD 2E 46
	or a ; CA0F6 (32:60f6) -> B7
	jp nz, .asm_ca142 ; CA0F7 (32:60f7) -> C2 42 61
	ld hl, $025f ; CA0FA (32:60fa) -> 21 5F 02
	scall PrintTextStandard ; CA0FD (32:60fd) -> CD 98 44
	ld hl, $032c ; CA100 (32:6100) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA103 (32:6103) -> CD BA 44
	or a ; CA106 (32:6106) -> B7
	jp nz, .asm_ca139 ; CA107 (32:6107) -> C2 39 61
	ld hl, $015d ; CA10A (32:610a) -> 21 5D 01
	scall PrintTextStandard ; CA10D (32:610d) -> CD 98 44
.asm_ca110:
	ld de, Data_ca149 ; CA110 (32:6110) -> 11 49 61
	ld hl, Data_ca0be ; CA113 (32:6113) -> 21 BE 60
	scall Func_8039e ; CA116 (32:6116) -> CD 9D 43
	or a ; CA119 (32:6119) -> B7
	jp nz, .asm_ca128 ; CA11A (32:611a) -> C2 28 61
	ld a, [wc7c4] ; CA11D (32:611d) -> FA C4 C7
	cp $01 ; CA120 (32:6120) -> FE 01
	jp nz, .asm_ca110 ; CA122 (32:6122) -> C2 10 61
	jp .asm_ca148 ; CA125 (32:6125) -> C3 48 61
.asm_ca128:
	ld e, $01 ; CA128 (32:6128) -> 1E 01
	ld hl, $00a7 ; CA12A (32:612a) -> 21 A7 00
	scall EventFlagAction ; CA12D (32:612d) -> CD 1B 46
	ld hl, $0266 ; CA130 (32:6130) -> 21 66 02
	scall PrintTextStandard ; CA133 (32:6133) -> CD 98 44
	jp .asm_ca13f ; CA136 (32:6136) -> C3 3F 61
.asm_ca139:
	ld hl, $0269 ; CA139 (32:6139) -> 21 69 02
	scall PrintTextStandard ; CA13C (32:613c) -> CD 98 44
.asm_ca13f:
	jp .asm_ca148 ; CA13F (32:613f) -> C3 48 61
.asm_ca142:
	ld hl, $0266 ; CA142 (32:6142) -> 21 66 02
	scall PrintTextStandard ; CA145 (32:6145) -> CD 98 44
.asm_ca148:
	ret  ; CA148 (32:6148) -> C9

Data_ca149:
	dstr "(くﾞんしﾞん)"

Func_ca152:
	ld a, e ; CA152 (32:6152) -> 7B
	or a ; CA153 (32:6153) -> B7
	jp nz, .asm_ca1b3 ; CA154 (32:6154) -> C2 B3 61
	scall RepairRobots ; CA157 (32:6157) -> CD E0 42
	xor a ; CA15A (32:615a) -> AF
	scall PlayMusic ; CA15B (32:615b) -> CD E6 4E
	ld a, $16 ; CA15E (32:615e) -> 3E 16
	scall PlayMusic ; CA160 (32:6160) -> CD E6 4E
	ld c, $01 ; CA163 (32:6163) -> 0E 01
	ld e, $02 ; CA165 (32:6165) -> 1E 02
	ld a, $08 ; CA167 (32:6167) -> 3E 08
	scall LoadEmote ; CA169 (32:6169) -> CD 76 41
	scall WaitEmote ; CA16C (32:616c) -> CD D5 41
	scall HideEmote ; CA16F (32:616f) -> CD 8B 41
	ld hl, $0322 ; CA172 (32:6172) -> 21 22 03
	scall PrintTextStandard ; CA175 (32:6175) -> CD 98 44
	ld a, [wc78b] ; CA178 (32:6178) -> FA 8B C7
	cp $03 ; CA17B (32:617b) -> FE 03
	jp z, .asm_ca1a6 ; CA17D (32:617d) -> CA A6 61
	cp $02 ; CA180 (32:6180) -> FE 02
	jp z, .asm_ca19e ; CA182 (32:6182) -> CA 9E 61
	cp $01 ; CA185 (32:6185) -> FE 01
	jp z, .asm_ca196 ; CA187 (32:6187) -> CA 96 61
	or a ; CA18A (32:618a) -> B7
	jp nz, .asm_ca1ae ; CA18B (32:618b) -> C2 AE 61
	ld a, $09 ; CA18E (32:618e) -> 3E 09
	scall PlayMusic ; CA190 (32:6190) -> CD E6 4E
	jp .asm_ca1b3 ; CA193 (32:6193) -> C3 B3 61
.asm_ca196:
	ld a, $0e ; CA196 (32:6196) -> 3E 0E
	scall PlayMusic ; CA198 (32:6198) -> CD E6 4E
	jp .asm_ca1b3 ; CA19B (32:619b) -> C3 B3 61
.asm_ca19e:
	ld a, $0d ; CA19E (32:619e) -> 3E 0D
	scall PlayMusic ; CA1A0 (32:61a0) -> CD E6 4E
	jp .asm_ca1b3 ; CA1A3 (32:61a3) -> C3 B3 61
.asm_ca1a6:
	ld a, $0f ; CA1A6 (32:61a6) -> 3E 0F
	scall PlayMusic ; CA1A8 (32:61a8) -> CD E6 4E
	jp .asm_ca1b3 ; CA1AB (32:61ab) -> C3 B3 61
.asm_ca1ae:
	ld a, $10 ; CA1AE (32:61ae) -> 3E 10
	scall PlayMusic ; CA1B0 (32:61b0) -> CD E6 4E
.asm_ca1b3:
	ret  ; CA1B3 (32:61b3) -> C9

Data_ca1b4:
	warpdef $06, $03, $01, $01, MAP_21_14, $06, $03, $06, $04, $2e
	warpdef $0c, $12, $01, $01, MAP_21_12, $0c, $12, $0c, $11, $2e
	warpdef $10, $06, $01, $01, MAP_21_12, $10, $06, $10, $07, $2e

Data_ca1d5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $17, $19, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $18, $1a, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $19, $1b, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $1a, $1c, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $17, $19, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $18, $1a, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $19, $1b, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $1a, $1c, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_ca21b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $16, $18, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $19, $1b, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $16, $18, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $19, $1b, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_ca261:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_ca2a7:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $18, $1a, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $18, $1a, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $19, $1b, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1b, $1d, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $18, $1a, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $18, $1a, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $19, $1b, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1b, $1d, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_ca2ed:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $19, $1b, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1c, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1d, $1f, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $19, $1b, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1c, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1d, $1f, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_ca333:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca481, NULL

Data_ca341:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca507, NULL

Data_ca34f:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca59b, NULL

Data_ca35d:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca62f, NULL

Data_ca36b:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca6c3, NULL

Func_ca379:: ; ca379
	ld e, $03 ; CA379 (32:6379) -> 1E 03
	ld hl, Data_ca1b4 ; CA37B (32:637b) -> 21 B4 61
	scall LoadWarps ; CA37E (32:637e) -> CD 3A 40
	ld a, [wc78b] ; CA381 (32:6381) -> FA 8B C7
	cp $04 ; CA384 (32:6384) -> FE 04
	jp z, .asm_ca434 ; CA386 (32:6386) -> CA 34 64
	cp $03 ; CA389 (32:6389) -> FE 03
	jp z, .asm_ca40e ; CA38B (32:638b) -> CA 0E 64
	cp $02 ; CA38E (32:638e) -> FE 02
	jp z, .asm_ca3e8 ; CA390 (32:6390) -> CA E8 63
	cp $01 ; CA393 (32:6393) -> FE 01
	jp z, .asm_ca3c2 ; CA395 (32:6395) -> CA C2 63
	or a ; CA398 (32:6398) -> B7
	jp nz, .asm_ca457 ; CA399 (32:6399) -> C2 57 64
	ld a, $03 ; CA39C (32:639c) -> 3E 03
	scall Func_80d01 ; CA39E (32:639e) -> CD 01 4D
	ld e, $05 ; CA3A1 (32:63a1) -> 1E 05
	ld hl, Data_ca1d5 ; CA3A3 (32:63a3) -> 21 D5 61
	scall LoadEncounters ; CA3A6 (32:63a6) -> CD 24 4D
	ld e, $01 ; CA3A9 (32:63a9) -> 1E 01
	ld hl, Data_ca333 ; CA3AB (32:63ab) -> 21 33 63
	scall LoadMapObjects ; CA3AE (32:63ae) -> CD FB 40
	ld a, $09 ; CA3B1 (32:63b1) -> 3E 09
	scall PlayMusic ; CA3B3 (32:63b3) -> CD E6 4E
	scall Func_8001c ; CA3B6 (32:63b6) -> CD 1C 40
	ld hl, $02e9 ; CA3B9 (32:63b9) -> 21 E9 02
	scall LandmarkSign ; CA3BC (32:63bc) -> CD 72 4F
	jp .asm_ca457 ; CA3BF (32:63bf) -> C3 57 64
.asm_ca3c2:
	ld a, $03 ; CA3C2 (32:63c2) -> 3E 03
	scall Func_80d01 ; CA3C4 (32:63c4) -> CD 01 4D
	ld e, $05 ; CA3C7 (32:63c7) -> 1E 05
	ld hl, Data_ca21b ; CA3C9 (32:63c9) -> 21 1B 62
	scall LoadEncounters ; CA3CC (32:63cc) -> CD 24 4D
	ld e, $01 ; CA3CF (32:63cf) -> 1E 01
	ld hl, Data_ca341 ; CA3D1 (32:63d1) -> 21 41 63
	scall LoadMapObjects ; CA3D4 (32:63d4) -> CD FB 40
	ld a, $0e ; CA3D7 (32:63d7) -> 3E 0E
	scall PlayMusic ; CA3D9 (32:63d9) -> CD E6 4E
	scall Func_8001c ; CA3DC (32:63dc) -> CD 1C 40
	ld hl, $02f8 ; CA3DF (32:63df) -> 21 F8 02
	scall LandmarkSign ; CA3E2 (32:63e2) -> CD 72 4F
	jp .asm_ca457 ; CA3E5 (32:63e5) -> C3 57 64
.asm_ca3e8:
	ld a, $03 ; CA3E8 (32:63e8) -> 3E 03
	scall Func_80d01 ; CA3EA (32:63ea) -> CD 01 4D
	ld e, $05 ; CA3ED (32:63ed) -> 1E 05
	ld hl, Data_ca261 ; CA3EF (32:63ef) -> 21 61 62
	scall LoadEncounters ; CA3F2 (32:63f2) -> CD 24 4D
	ld e, $01 ; CA3F5 (32:63f5) -> 1E 01
	ld hl, Data_ca34f ; CA3F7 (32:63f7) -> 21 4F 63
	scall LoadMapObjects ; CA3FA (32:63fa) -> CD FB 40
	ld a, $0d ; CA3FD (32:63fd) -> 3E 0D
	scall PlayMusic ; CA3FF (32:63ff) -> CD E6 4E
	scall Func_8001c ; CA402 (32:6402) -> CD 1C 40
	ld hl, $02f3 ; CA405 (32:6405) -> 21 F3 02
	scall LandmarkSign ; CA408 (32:6408) -> CD 72 4F
	jp .asm_ca457 ; CA40B (32:640b) -> C3 57 64
.asm_ca40e:
	ld a, $03 ; CA40E (32:640e) -> 3E 03
	scall Func_80d01 ; CA410 (32:6410) -> CD 01 4D
	ld e, $05 ; CA413 (32:6413) -> 1E 05
	ld hl, Data_ca2a7 ; CA415 (32:6415) -> 21 A7 62
	scall LoadEncounters ; CA418 (32:6418) -> CD 24 4D
	ld e, $01 ; CA41B (32:641b) -> 1E 01
	ld hl, Data_ca35d ; CA41D (32:641d) -> 21 5D 63
	scall LoadMapObjects ; CA420 (32:6420) -> CD FB 40
	ld a, $0f ; CA423 (32:6423) -> 3E 0F
	scall PlayMusic ; CA425 (32:6425) -> CD E6 4E
	scall Func_8001c ; CA428 (32:6428) -> CD 1C 40
	ld hl, $02ee ; CA42B (32:642b) -> 21 EE 02
	scall LandmarkSign ; CA42E (32:642e) -> CD 72 4F
	jp .asm_ca457 ; CA431 (32:6431) -> C3 57 64
.asm_ca434:
	ld a, $03 ; CA434 (32:6434) -> 3E 03
	scall Func_80d01 ; CA436 (32:6436) -> CD 01 4D
	ld e, $05 ; CA439 (32:6439) -> 1E 05
	ld hl, Data_ca2ed ; CA43B (32:643b) -> 21 ED 62
	scall LoadEncounters ; CA43E (32:643e) -> CD 24 4D
	ld e, $01 ; CA441 (32:6441) -> 1E 01
	ld hl, Data_ca36b ; CA443 (32:6443) -> 21 6B 63
	scall LoadMapObjects ; CA446 (32:6446) -> CD FB 40
	ld a, $10 ; CA449 (32:6449) -> 3E 10
	scall PlayMusic ; CA44B (32:644b) -> CD E6 4E
	scall Func_8001c ; CA44E (32:644e) -> CD 1C 40
	ld hl, $02fd ; CA451 (32:6451) -> 21 FD 02
	scall LandmarkSign ; CA454 (32:6454) -> CD 72 4F
.asm_ca457:
	ret  ; CA457 (32:6457) -> C9

Data_ca458:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $7b, $01, $7b, $04, $1c, $02, $05
	db $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca481:
	ld a, e ; CA481 (32:6481) -> 7B
	or a ; CA482 (32:6482) -> B7
	jp nz, .asm_ca4d4 ; CA483 (32:6483) -> C2 D4 64
	xor a ; CA486 (32:6486) -> AF
	scall FacePlayer ; CA487 (32:6487) -> CD 4B 44
	ld hl, $0094 ; CA48A (32:648a) -> 21 94 00
	scall CheckEventFlag ; CA48D (32:648d) -> CD 2E 46
	or a ; CA490 (32:6490) -> B7
	jp nz, .asm_ca4ce ; CA491 (32:6491) -> C2 CE 64
	ld hl, $0260 ; CA494 (32:6494) -> 21 60 02
	scall PrintTextStandard ; CA497 (32:6497) -> CD 98 44
	ld hl, $032c ; CA49A (32:649a) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA49D (32:649d) -> CD BA 44
	or a ; CA4A0 (32:64a0) -> B7
	jp nz, .asm_ca4c5 ; CA4A1 (32:64a1) -> C2 C5 64
	ld de, Data_ca4d5 ; CA4A4 (32:64a4) -> 11 D5 64
	ld hl, Data_ca458 ; CA4A7 (32:64a7) -> 21 58 64
	scall ScriptedBattle ; CA4AA (32:64aa) -> CD D3 4D
	or a ; CA4AD (32:64ad) -> B7
	jp nz, .asm_ca4b4 ; CA4AE (32:64ae) -> C2 B4 64
	jp .asm_ca4d4 ; CA4B1 (32:64b1) -> C3 D4 64
.asm_ca4b4:
	ld e, $01 ; CA4B4 (32:64b4) -> 1E 01
	ld hl, $0094 ; CA4B6 (32:64b6) -> 21 94 00
	scall EventFlagAction ; CA4B9 (32:64b9) -> CD 1B 46
	ld hl, $0264 ; CA4BC (32:64bc) -> 21 64 02
	scall PrintTextStandard ; CA4BF (32:64bf) -> CD 98 44
	jp .asm_ca4cb ; CA4C2 (32:64c2) -> C3 CB 64
.asm_ca4c5:
	ld hl, $0269 ; CA4C5 (32:64c5) -> 21 69 02
	scall PrintTextStandard ; CA4C8 (32:64c8) -> CD 98 44
.asm_ca4cb:
	jp .asm_ca4d4 ; CA4CB (32:64cb) -> C3 D4 64
.asm_ca4ce:
	ld hl, $0267 ; CA4CE (32:64ce) -> 21 67 02
	scall PrintTextStandard ; CA4D1 (32:64d1) -> CD 98 44
.asm_ca4d4:
	ret  ; CA4D4 (32:64d4) -> C9

Data_ca4d5:
	dstr "(くﾞんしﾞん)"

Data_ca4de:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $1c, $01, $13
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca507:
	ld a, e ; CA507 (32:6507) -> 7B
	or a ; CA508 (32:6508) -> B7
	jp nz, .asm_ca568 ; CA509 (32:6509) -> C2 68 65
	xor a ; CA50C (32:650c) -> AF
	scall FacePlayer ; CA50D (32:650d) -> CD 4B 44
	ld hl, $0099 ; CA510 (32:6510) -> 21 99 00
	scall CheckEventFlag ; CA513 (32:6513) -> CD 2E 46
	or a ; CA516 (32:6516) -> B7
	jp nz, .asm_ca562 ; CA517 (32:6517) -> C2 62 65
	ld hl, $0262 ; CA51A (32:651a) -> 21 62 02
	scall PrintTextStandard ; CA51D (32:651d) -> CD 98 44
	ld hl, $032c ; CA520 (32:6520) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA523 (32:6523) -> CD BA 44
	or a ; CA526 (32:6526) -> B7
	jp nz, .asm_ca559 ; CA527 (32:6527) -> C2 59 65
	ld hl, $015e ; CA52A (32:652a) -> 21 5E 01
	scall PrintTextStandard ; CA52D (32:652d) -> CD 98 44
.asm_ca530:
	ld de, Data_ca569 ; CA530 (32:6530) -> 11 69 65
	ld hl, Data_ca4de ; CA533 (32:6533) -> 21 DE 64
	scall Func_803f5 ; CA536 (32:6536) -> CD F4 43
	or a ; CA539 (32:6539) -> B7
	jp nz, .asm_ca548 ; CA53A (32:653a) -> C2 48 65
	ld a, [wc7c4] ; CA53D (32:653d) -> FA C4 C7
	cp $01 ; CA540 (32:6540) -> FE 01
	jp nz, .asm_ca530 ; CA542 (32:6542) -> C2 30 65
	jp .asm_ca568 ; CA545 (32:6545) -> C3 68 65
.asm_ca548:
	ld e, $01 ; CA548 (32:6548) -> 1E 01
	ld hl, $0099 ; CA54A (32:654a) -> 21 99 00
	scall EventFlagAction ; CA54D (32:654d) -> CD 1B 46
	ld hl, $0264 ; CA550 (32:6550) -> 21 64 02
	scall PrintTextStandard ; CA553 (32:6553) -> CD 98 44
	jp .asm_ca55f ; CA556 (32:6556) -> C3 5F 65
.asm_ca559:
	ld hl, $0268 ; CA559 (32:6559) -> 21 68 02
	scall PrintTextStandard ; CA55C (32:655c) -> CD 98 44
.asm_ca55f:
	jp .asm_ca568 ; CA55F (32:655f) -> C3 68 65
.asm_ca562:
	ld hl, $0262 ; CA562 (32:6562) -> 21 62 02
	scall PrintTextStandard ; CA565 (32:6565) -> CD 98 44
.asm_ca568:
	ret  ; CA568 (32:6568) -> C9

Data_ca569:
	dstr "(くﾞんしﾞん)"

Data_ca572:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4a, $01, $4a, $04, $1c, $0e, $08
	db $14, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca59b:
	ld a, e ; CA59B (32:659b) -> 7B
	or a ; CA59C (32:659c) -> B7
	jp nz, .asm_ca5fc ; CA59D (32:659d) -> C2 FC 65
	xor a ; CA5A0 (32:65a0) -> AF
	scall FacePlayer ; CA5A1 (32:65a1) -> CD 4B 44
	ld hl, $009e ; CA5A4 (32:65a4) -> 21 9E 00
	scall CheckEventFlag ; CA5A7 (32:65a7) -> CD 2E 46
	or a ; CA5AA (32:65aa) -> B7
	jp nz, .asm_ca5f6 ; CA5AB (32:65ab) -> C2 F6 65
	ld hl, $0265 ; CA5AE (32:65ae) -> 21 65 02
	scall PrintTextStandard ; CA5B1 (32:65b1) -> CD 98 44
	ld hl, $032c ; CA5B4 (32:65b4) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA5B7 (32:65b7) -> CD BA 44
	or a ; CA5BA (32:65ba) -> B7
	jp nz, .asm_ca5ed ; CA5BB (32:65bb) -> C2 ED 65
	ld hl, $017a ; CA5BE (32:65be) -> 21 7A 01
	scall PrintTextStandard ; CA5C1 (32:65c1) -> CD 98 44
.asm_ca5c4:
	ld de, Data_ca5fd ; CA5C4 (32:65c4) -> 11 FD 65
	ld hl, Data_ca572 ; CA5C7 (32:65c7) -> 21 72 65
	scall Func_802ef ; CA5CA (32:65ca) -> CD EF 42
	or a ; CA5CD (32:65cd) -> B7
	jp nz, .asm_ca5dc ; CA5CE (32:65ce) -> C2 DC 65
	ld a, [wc7c4] ; CA5D1 (32:65d1) -> FA C4 C7
	cp $01 ; CA5D4 (32:65d4) -> FE 01
	jp nz, .asm_ca5c4 ; CA5D6 (32:65d6) -> C2 C4 65
	jp .asm_ca5fc ; CA5D9 (32:65d9) -> C3 FC 65
.asm_ca5dc:
	ld e, $01 ; CA5DC (32:65dc) -> 1E 01
	ld hl, $009e ; CA5DE (32:65de) -> 21 9E 00
	scall EventFlagAction ; CA5E1 (32:65e1) -> CD 1B 46
	ld hl, $0266 ; CA5E4 (32:65e4) -> 21 66 02
	scall PrintTextStandard ; CA5E7 (32:65e7) -> CD 98 44
	jp .asm_ca5f3 ; CA5EA (32:65ea) -> C3 F3 65
.asm_ca5ed:
	ld hl, $0269 ; CA5ED (32:65ed) -> 21 69 02
	scall PrintTextStandard ; CA5F0 (32:65f0) -> CD 98 44
.asm_ca5f3:
	jp .asm_ca5fc ; CA5F3 (32:65f3) -> C3 FC 65
.asm_ca5f6:
	ld hl, $0266 ; CA5F6 (32:65f6) -> 21 66 02
	scall PrintTextStandard ; CA5F9 (32:65f9) -> CD 98 44
.asm_ca5fc:
	ret  ; CA5FC (32:65fc) -> C9

Data_ca5fd:
	dstr "(くﾞんしﾞん)"

Data_ca606:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $33, $01, $33, $04, $1c, $17, $05
	db $1e, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca62f:
	ld a, e ; CA62F (32:662f) -> 7B
	or a ; CA630 (32:6630) -> B7
	jp nz, .asm_ca690 ; CA631 (32:6631) -> C2 90 66
	xor a ; CA634 (32:6634) -> AF
	scall FacePlayer ; CA635 (32:6635) -> CD 4B 44
	ld hl, $00a3 ; CA638 (32:6638) -> 21 A3 00
	scall CheckEventFlag ; CA63B (32:663b) -> CD 2E 46
	or a ; CA63E (32:663e) -> B7
	jp nz, .asm_ca68a ; CA63F (32:663f) -> C2 8A 66
	ld hl, $025f ; CA642 (32:6642) -> 21 5F 02
	scall PrintTextStandard ; CA645 (32:6645) -> CD 98 44
	ld hl, $032c ; CA648 (32:6648) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA64B (32:664b) -> CD BA 44
	or a ; CA64E (32:664e) -> B7
	jp nz, .asm_ca681 ; CA64F (32:664f) -> C2 81 66
	ld hl, $016b ; CA652 (32:6652) -> 21 6B 01
	scall PrintTextStandard ; CA655 (32:6655) -> CD 98 44
.asm_ca658:
	ld de, Data_ca691 ; CA658 (32:6658) -> 11 91 66
	ld hl, Data_ca606 ; CA65B (32:665b) -> 21 06 66
	scall Func_80347 ; CA65E (32:665e) -> CD 46 43
	or a ; CA661 (32:6661) -> B7
	jp nz, .asm_ca670 ; CA662 (32:6662) -> C2 70 66
	ld a, [wc7c4] ; CA665 (32:6665) -> FA C4 C7
	cp $01 ; CA668 (32:6668) -> FE 01
	jp nz, .asm_ca658 ; CA66A (32:666a) -> C2 58 66
	jp .asm_ca690 ; CA66D (32:666d) -> C3 90 66
.asm_ca670:
	ld e, $01 ; CA670 (32:6670) -> 1E 01
	ld hl, $00a3 ; CA672 (32:6672) -> 21 A3 00
	scall EventFlagAction ; CA675 (32:6675) -> CD 1B 46
	ld hl, $0266 ; CA678 (32:6678) -> 21 66 02
	scall PrintTextStandard ; CA67B (32:667b) -> CD 98 44
	jp .asm_ca687 ; CA67E (32:667e) -> C3 87 66
.asm_ca681:
	ld hl, $0268 ; CA681 (32:6681) -> 21 68 02
	scall PrintTextStandard ; CA684 (32:6684) -> CD 98 44
.asm_ca687:
	jp .asm_ca690 ; CA687 (32:6687) -> C3 90 66
.asm_ca68a:
	ld hl, $0266 ; CA68A (32:668a) -> 21 66 02
	scall PrintTextStandard ; CA68D (32:668d) -> CD 98 44
.asm_ca690:
	ret  ; CA690 (32:6690) -> C9

Data_ca691:
	dstr "(くﾞんしﾞん)"

Data_ca69a:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4f, $01, $4f, $04, $1c, $14, $14
	db $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca6c3:
	ld a, e ; CA6C3 (32:66c3) -> 7B
	or a ; CA6C4 (32:66c4) -> B7
	jp nz, .asm_ca724 ; CA6C5 (32:66c5) -> C2 24 67
	xor a ; CA6C8 (32:66c8) -> AF
	scall FacePlayer ; CA6C9 (32:66c9) -> CD 4B 44
	ld hl, $00a8 ; CA6CC (32:66cc) -> 21 A8 00
	scall CheckEventFlag ; CA6CF (32:66cf) -> CD 2E 46
	or a ; CA6D2 (32:66d2) -> B7
	jp nz, .asm_ca71e ; CA6D3 (32:66d3) -> C2 1E 67
	ld hl, $0263 ; CA6D6 (32:66d6) -> 21 63 02
	scall PrintTextStandard ; CA6D9 (32:66d9) -> CD 98 44
	ld hl, $032c ; CA6DC (32:66dc) -> 21 2C 03
	scall PrintTextWithYesNoBox ; CA6DF (32:66df) -> CD BA 44
	or a ; CA6E2 (32:66e2) -> B7
	jp nz, .asm_ca715 ; CA6E3 (32:66e3) -> C2 15 67
	ld hl, $015d ; CA6E6 (32:66e6) -> 21 5D 01
	scall PrintTextStandard ; CA6E9 (32:66e9) -> CD 98 44
.asm_ca6ec:
	ld de, Data_ca725 ; CA6EC (32:66ec) -> 11 25 67
	ld hl, Data_ca69a ; CA6EF (32:66ef) -> 21 9A 66
	scall Func_8039e ; CA6F2 (32:66f2) -> CD 9D 43
	or a ; CA6F5 (32:66f5) -> B7
	jp nz, .asm_ca704 ; CA6F6 (32:66f6) -> C2 04 67
	ld a, [wc7c4] ; CA6F9 (32:66f9) -> FA C4 C7
	cp $01 ; CA6FC (32:66fc) -> FE 01
	jp nz, .asm_ca6ec ; CA6FE (32:66fe) -> C2 EC 66
	jp .asm_ca724 ; CA701 (32:6701) -> C3 24 67
.asm_ca704:
	ld e, $01 ; CA704 (32:6704) -> 1E 01
	ld hl, $00a8 ; CA706 (32:6706) -> 21 A8 00
	scall EventFlagAction ; CA709 (32:6709) -> CD 1B 46
	ld hl, $0264 ; CA70C (32:670c) -> 21 64 02
	scall PrintTextStandard ; CA70F (32:670f) -> CD 98 44
	jp .asm_ca71b ; CA712 (32:6712) -> C3 1B 67
.asm_ca715:
	ld hl, $0263 ; CA715 (32:6715) -> 21 63 02
	scall PrintTextStandard ; CA718 (32:6718) -> CD 98 44
.asm_ca71b:
	jp .asm_ca724 ; CA71B (32:671b) -> C3 24 67
.asm_ca71e:
	ld hl, $0263 ; CA71E (32:671e) -> 21 63 02
	scall PrintTextStandard ; CA721 (32:6721) -> CD 98 44
.asm_ca724:
	ret  ; CA724 (32:6724) -> C9

Data_ca725:
	dstr "(くﾞんしﾞん)"

Data_ca72e:
	warpdef $06, $03, $01, $01, MAP_21_13, $06, $03, $07, $03, $2e

Data_ca739:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $17, $19, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $18, $1a, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $19, $1b, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $1a, $1c, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $17, $19, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $18, $1a, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $19, $1b, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $1a, $1c, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_ca77f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $16, $18, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $19, $1b, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $16, $18, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $19, $1b, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_ca7c5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_ca80b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $18, $1a, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $18, $1a, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $19, $1b, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1b, $1d, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $18, $1a, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $18, $1a, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $19, $1b, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1b, $1d, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_ca851:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $19, $1b, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1b, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1d, $1f, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $19, $1b, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1b, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1d, $1f, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_ca897:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_caa1f, NULL

Data_ca8a5:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cab3c, NULL

Data_ca8b3:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cac75, NULL

Data_ca8c1:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cadae, NULL

Data_ca8cf:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_caee7, NULL

Func_ca8dd:: ; ca8dd
	ld e, $01 ; CA8DD (32:68dd) -> 1E 01
	ld hl, Data_ca72e ; CA8DF (32:68df) -> 21 2E 67
	scall LoadWarps ; CA8E2 (32:68e2) -> CD 3A 40
	ld a, [wc78b] ; CA8E5 (32:68e5) -> FA 8B C7
	cp $04 ; CA8E8 (32:68e8) -> FE 04
	jp z, .asm_ca9c0 ; CA8EA (32:68ea) -> CA C0 69
	cp $03 ; CA8ED (32:68ed) -> FE 03
	jp z, .asm_ca990 ; CA8EF (32:68ef) -> CA 90 69
	cp $02 ; CA8F2 (32:68f2) -> FE 02
	jp z, .asm_ca960 ; CA8F4 (32:68f4) -> CA 60 69
	cp $01 ; CA8F7 (32:68f7) -> FE 01
	jp z, .asm_ca930 ; CA8F9 (32:68f9) -> CA 30 69
	or a ; CA8FC (32:68fc) -> B7
	jp nz, .asm_ca9ed ; CA8FD (32:68fd) -> C2 ED 69
	ld a, $03 ; CA900 (32:6900) -> 3E 03
	scall Func_80d01 ; CA902 (32:6902) -> CD 01 4D
	ld e, $05 ; CA905 (32:6905) -> 1E 05
	ld hl, Data_ca739 ; CA907 (32:6907) -> 21 39 67
	scall LoadEncounters ; CA90A (32:690a) -> CD 24 4D
	ld hl, $0095 ; CA90D (32:690d) -> 21 95 00
	scall CheckEventFlag ; CA910 (32:6910) -> CD 2E 46
	or a ; CA913 (32:6913) -> B7
	jp nz, .asm_ca91f ; CA914 (32:6914) -> C2 1F 69
	ld e, $01 ; CA917 (32:6917) -> 1E 01
	ld hl, Data_ca897 ; CA919 (32:6919) -> 21 97 68
	scall LoadMapObjects ; CA91C (32:691c) -> CD FB 40
.asm_ca91f:
	ld a, $09 ; CA91F (32:691f) -> 3E 09
	scall PlayMusic ; CA921 (32:6921) -> CD E6 4E
	scall Func_8001c ; CA924 (32:6924) -> CD 1C 40
	ld hl, $02ea ; CA927 (32:6927) -> 21 EA 02
	scall LandmarkSign ; CA92A (32:692a) -> CD 72 4F
	jp .asm_ca9ed ; CA92D (32:692d) -> C3 ED 69
.asm_ca930:
	ld a, $03 ; CA930 (32:6930) -> 3E 03
	scall Func_80d01 ; CA932 (32:6932) -> CD 01 4D
	ld e, $05 ; CA935 (32:6935) -> 1E 05
	ld hl, Data_ca77f ; CA937 (32:6937) -> 21 7F 67
	scall LoadEncounters ; CA93A (32:693a) -> CD 24 4D
	ld hl, $009a ; CA93D (32:693d) -> 21 9A 00
	scall CheckEventFlag ; CA940 (32:6940) -> CD 2E 46
	or a ; CA943 (32:6943) -> B7
	jp nz, .asm_ca94f ; CA944 (32:6944) -> C2 4F 69
	ld e, $01 ; CA947 (32:6947) -> 1E 01
	ld hl, Data_ca8a5 ; CA949 (32:6949) -> 21 A5 68
	scall LoadMapObjects ; CA94C (32:694c) -> CD FB 40
.asm_ca94f:
	ld a, $0e ; CA94F (32:694f) -> 3E 0E
	scall PlayMusic ; CA951 (32:6951) -> CD E6 4E
	scall Func_8001c ; CA954 (32:6954) -> CD 1C 40
	ld hl, $02f9 ; CA957 (32:6957) -> 21 F9 02
	scall LandmarkSign ; CA95A (32:695a) -> CD 72 4F
	jp .asm_ca9ed ; CA95D (32:695d) -> C3 ED 69
.asm_ca960:
	ld a, $03 ; CA960 (32:6960) -> 3E 03
	scall Func_80d01 ; CA962 (32:6962) -> CD 01 4D
	ld e, $05 ; CA965 (32:6965) -> 1E 05
	ld hl, Data_ca7c5 ; CA967 (32:6967) -> 21 C5 67
	scall LoadEncounters ; CA96A (32:696a) -> CD 24 4D
	ld hl, $009f ; CA96D (32:696d) -> 21 9F 00
	scall CheckEventFlag ; CA970 (32:6970) -> CD 2E 46
	or a ; CA973 (32:6973) -> B7
	jp nz, .asm_ca97f ; CA974 (32:6974) -> C2 7F 69
	ld e, $01 ; CA977 (32:6977) -> 1E 01
	ld hl, Data_ca8b3 ; CA979 (32:6979) -> 21 B3 68
	scall LoadMapObjects ; CA97C (32:697c) -> CD FB 40
.asm_ca97f:
	ld a, $0d ; CA97F (32:697f) -> 3E 0D
	scall PlayMusic ; CA981 (32:6981) -> CD E6 4E
	scall Func_8001c ; CA984 (32:6984) -> CD 1C 40
	ld hl, $02f4 ; CA987 (32:6987) -> 21 F4 02
	scall LandmarkSign ; CA98A (32:698a) -> CD 72 4F
	jp .asm_ca9ed ; CA98D (32:698d) -> C3 ED 69
.asm_ca990:
	ld a, $03 ; CA990 (32:6990) -> 3E 03
	scall Func_80d01 ; CA992 (32:6992) -> CD 01 4D
	ld e, $05 ; CA995 (32:6995) -> 1E 05
	ld hl, Data_ca80b ; CA997 (32:6997) -> 21 0B 68
	scall LoadEncounters ; CA99A (32:699a) -> CD 24 4D
	ld hl, $00a4 ; CA99D (32:699d) -> 21 A4 00
	scall CheckEventFlag ; CA9A0 (32:69a0) -> CD 2E 46
	or a ; CA9A3 (32:69a3) -> B7
	jp nz, .asm_ca9af ; CA9A4 (32:69a4) -> C2 AF 69
	ld e, $01 ; CA9A7 (32:69a7) -> 1E 01
	ld hl, Data_ca8c1 ; CA9A9 (32:69a9) -> 21 C1 68
	scall LoadMapObjects ; CA9AC (32:69ac) -> CD FB 40
.asm_ca9af:
	ld a, $0f ; CA9AF (32:69af) -> 3E 0F
	scall PlayMusic ; CA9B1 (32:69b1) -> CD E6 4E
	scall Func_8001c ; CA9B4 (32:69b4) -> CD 1C 40
	ld hl, $02ef ; CA9B7 (32:69b7) -> 21 EF 02
	scall LandmarkSign ; CA9BA (32:69ba) -> CD 72 4F
	jp .asm_ca9ed ; CA9BD (32:69bd) -> C3 ED 69
.asm_ca9c0:
	ld a, $03 ; CA9C0 (32:69c0) -> 3E 03
	scall Func_80d01 ; CA9C2 (32:69c2) -> CD 01 4D
	ld e, $05 ; CA9C5 (32:69c5) -> 1E 05
	ld hl, Data_ca851 ; CA9C7 (32:69c7) -> 21 51 68
	scall LoadEncounters ; CA9CA (32:69ca) -> CD 24 4D
	ld hl, $00a9 ; CA9CD (32:69cd) -> 21 A9 00
	scall CheckEventFlag ; CA9D0 (32:69d0) -> CD 2E 46
	or a ; CA9D3 (32:69d3) -> B7
	jp nz, .asm_ca9df ; CA9D4 (32:69d4) -> C2 DF 69
	ld e, $01 ; CA9D7 (32:69d7) -> 1E 01
	ld hl, Data_ca8cf ; CA9D9 (32:69d9) -> 21 CF 68
	scall LoadMapObjects ; CA9DC (32:69dc) -> CD FB 40
.asm_ca9df:
	ld a, $10 ; CA9DF (32:69df) -> 3E 10
	scall PlayMusic ; CA9E1 (32:69e1) -> CD E6 4E
	scall Func_8001c ; CA9E4 (32:69e4) -> CD 1C 40
	ld hl, $02fe ; CA9E7 (32:69e7) -> 21 FE 02
	scall LandmarkSign ; CA9EA (32:69ea) -> CD 72 4F
.asm_ca9ed:
	ret  ; CA9ED (32:69ed) -> C9

Data_ca9ee:
	db $0a, $05, $ff, $ff

Data_ca9f2:
	db $0b, $05, $ff, $ff

Data_ca9f6:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $4f, $01, $4f, $05, $1d, $14, $14
	db $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_caa1f:
	ld a, e ; CAA1F (32:6a1f) -> 7B
	or a ; CAA20 (32:6a20) -> B7
	jp nz, .asm_cab02 ; CAA21 (32:6a21) -> C2 02 6B
	ld hl, $0095 ; CAA24 (32:6a24) -> 21 95 00
	scall CheckEventFlag ; CAA27 (32:6a27) -> CD 2E 46
	or a ; CAA2A (32:6a2a) -> B7
	jp nz, .asm_cab02 ; CAA2B (32:6a2b) -> C2 02 6B
	xor a ; CAA2E (32:6a2e) -> AF
	scall FacePlayer ; CAA2F (32:6a2f) -> CD 4B 44
	ld hl, $00c9 ; CAA32 (32:6a32) -> 21 C9 00
	scall PrintTextStandard ; CAA35 (32:6a35) -> CD 98 44
	ld de, Data_cab03 ; CAA38 (32:6a38) -> 11 03 6B
	ld hl, Data_ca9f6 ; CAA3B (32:6a3b) -> 21 F6 69
	scall ScriptedBattle ; CAA3E (32:6a3e) -> CD D3 4D
	or a ; CAA41 (32:6a41) -> B7
	jp nz, .asm_caa48 ; CAA42 (32:6a42) -> C2 48 6A
	jp .asm_cab02 ; CAA45 (32:6a45) -> C3 02 6B
.asm_caa48:
	ld hl, $00ca ; CAA48 (32:6a48) -> 21 CA 00
	scall PrintTextStandard ; CAA4B (32:6a4b) -> CD 98 44
	ld e, $01 ; CAA4E (32:6a4e) -> 1E 01
	ld hl, $0095 ; CAA50 (32:6a50) -> 21 95 00
	scall EventFlagAction ; CAA53 (32:6a53) -> CD 1B 46
	ld e, $00 ; CAA56 (32:6a56) -> 1E 00
	ld hl, $0042 ; CAA58 (32:6a58) -> 21 42 00
	scall EventFlagAction ; CAA5B (32:6a5b) -> CD 1B 46
	ld c, $01 ; CAA5E (32:6a5e) -> 0E 01
	ld e, $01 ; CAA60 (32:6a60) -> 1E 01
	ld a, $1e ; CAA62 (32:6a62) -> 3E 1E
	scall Func_80d4d ; CAA64 (32:6a64) -> CD 4D 4D
	cp $ff ; CAA67 (32:6a67) -> FE FF
	jp nz, .asm_caa75 ; CAA69 (32:6a69) -> C2 75 6A
	ld c, $03 ; CAA6C (32:6a6c) -> 0E 03
	ld e, $01 ; CAA6E (32:6a6e) -> 1E 01
	ld a, $1e ; CAA70 (32:6a70) -> 3E 1E
	scall Func_80d4d ; CAA72 (32:6a72) -> CD 4D 4D
.asm_caa75:
	ld hl, $0095 ; CAA75 (32:6a75) -> 21 95 00
	scall CheckEventFlag ; CAA78 (32:6a78) -> CD 2E 46
	cp $01 ; CAA7B (32:6a7b) -> FE 01
	jp nz, .asm_caaca ; CAA7D (32:6a7d) -> C2 CA 6A
	ld hl, $009a ; CAA80 (32:6a80) -> 21 9A 00
	scall CheckEventFlag ; CAA83 (32:6a83) -> CD 2E 46
	cp $01 ; CAA86 (32:6a86) -> FE 01
	jp nz, .asm_caaca ; CAA88 (32:6a88) -> C2 CA 6A
	ld hl, $009f ; CAA8B (32:6a8b) -> 21 9F 00
	scall CheckEventFlag ; CAA8E (32:6a8e) -> CD 2E 46
	cp $01 ; CAA91 (32:6a91) -> FE 01
	jp nz, .asm_caaca ; CAA93 (32:6a93) -> C2 CA 6A
	ld hl, $00a4 ; CAA96 (32:6a96) -> 21 A4 00
	scall CheckEventFlag ; CAA99 (32:6a99) -> CD 2E 46
	cp $01 ; CAA9C (32:6a9c) -> FE 01
	jp nz, .asm_caaca ; CAA9E (32:6a9e) -> C2 CA 6A
	ld hl, $00a9 ; CAAA1 (32:6aa1) -> 21 A9 00
	scall CheckEventFlag ; CAAA4 (32:6aa4) -> CD 2E 46
	cp $01 ; CAAA7 (32:6aa7) -> FE 01
	jp nz, .asm_caaca ; CAAA9 (32:6aa9) -> C2 CA 6A
	ld c, $00 ; CAAAC (32:6aac) -> 0E 00
	ld e, $01 ; CAAAE (32:6aae) -> 1E 01
	ld a, $21 ; CAAB0 (32:6ab0) -> 3E 21
	scall Func_80d4d ; CAAB2 (32:6ab2) -> CD 4D 4D
	ld hl, $046f ; CAAB5 (32:6ab5) -> 21 6F 04
	scall PrintTextStandard ; CAAB8 (32:6ab8) -> CD 98 44
	ld a, $2a ; CAABB (32:6abb) -> 3E 2A
	scall PlaySFX ; CAABD (32:6abd) -> CD FE 4E
	ld hl, $0470 ; CAAC0 (32:6ac0) -> 21 70 04
	scall PrintTextStandard ; CAAC3 (32:6ac3) -> CD 98 44
	xor a ; CAAC6 (32:6ac6) -> AF
	ld [wc78f], a ; CAAC7 (32:6ac7) -> EA 8F C7
.asm_caaca:
	ld a, [wPlayerFacing] ; CAACA (32:6aca) -> FA 38 C8
	cp $02 ; CAACD (32:6acd) -> FE 02
	jp nz, .asm_caade ; CAACF (32:6acf) -> C2 DE 6A
	ld bc, Data_ca9f2 ; CAAD2 (32:6ad2) -> 01 F2 69
	ld e, $32 ; CAAD5 (32:6ad5) -> 1E 32
	xor a ; CAAD7 (32:6ad7) -> AF
	scall MovePersonAndWait ; CAAD8 (32:6ad8) -> CD 88 46
	jp .asm_caae7 ; CAADB (32:6adb) -> C3 E7 6A
.asm_caade:
	ld bc, Data_ca9ee ; CAADE (32:6ade) -> 01 EE 69
	ld e, $32 ; CAAE1 (32:6ae1) -> 1E 32
	xor a ; CAAE3 (32:6ae3) -> AF
	scall MovePersonAndWait ; CAAE4 (32:6ae4) -> CD 88 46
.asm_caae7:
	ld a, $2e ; CAAE7 (32:6ae7) -> 3E 2E
	scall PlaySFX ; CAAE9 (32:6ae9) -> CD FE 4E
	scall WaitNPCStep ; CAAEC (32:6aec) -> CD 0C 42
	ld e, $00 ; CAAEF (32:6aef) -> 1E 00
	xor a ; CAAF1 (32:6af1) -> AF
	scall SetPersonVisibilityState ; CAAF2 (32:6af2) -> CD 3D 41
	ld l, $1b ; CAAF5 (32:6af5) -> 2E 1B
	push hl ; CAAF7 (32:6af7) -> E5
	ld c, $17 ; CAAF8 (32:6af8) -> 0E 17
	ld e, $00 ; CAAFA (32:6afa) -> 1E 00
	ld a, $15 ; CAAFC (32:6afc) -> 3E 15
	scall Func_80dff ; CAAFE (32:6afe) -> CD FF 4D
	pop bc ; CAB01 (32:6b01) -> C1
.asm_cab02:
	ret  ; CAB02 (32:6b02) -> C9

Data_cab03:
	dstr "(くﾞんそう)"

Data_cab0b:
	db $0a, $05, $ff, $ff

Data_cab0f:
	db $0b, $05, $ff, $ff

Data_cab13:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $03, $01, $03, $05, $1e, $01, $18
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cab3c:
	ld a, e ; CAB3C (32:6b3c) -> 7B
	or a ; CAB3D (32:6b3d) -> B7
	jp nz, .asm_cac3b ; CAB3E (32:6b3e) -> C2 3B 6C
	ld hl, $009a ; CAB41 (32:6b41) -> 21 9A 00
	scall CheckEventFlag ; CAB44 (32:6b44) -> CD 2E 46
	or a ; CAB47 (32:6b47) -> B7
	jp nz, .asm_cac3b ; CAB48 (32:6b48) -> C2 3B 6C
	xor a ; CAB4B (32:6b4b) -> AF
	scall FacePlayer ; CAB4C (32:6b4c) -> CD 4B 44
	ld hl, $00cb ; CAB4F (32:6b4f) -> 21 CB 00
	scall PrintTextStandard ; CAB52 (32:6b52) -> CD 98 44
	ld hl, $015e ; CAB55 (32:6b55) -> 21 5E 01
	scall PrintTextStandard ; CAB58 (32:6b58) -> CD 98 44
.asm_cab5b:
	ld de, Data_cac3c ; CAB5B (32:6b5b) -> 11 3C 6C
	ld hl, Data_cab13 ; CAB5E (32:6b5e) -> 21 13 6B
	scall Func_803f5 ; CAB61 (32:6b61) -> CD F4 43
	or a ; CAB64 (32:6b64) -> B7
	jp nz, .asm_cab73 ; CAB65 (32:6b65) -> C2 73 6B
	ld a, [wc7c4] ; CAB68 (32:6b68) -> FA C4 C7
	cp $01 ; CAB6B (32:6b6b) -> FE 01
	jp nz, .asm_cab5b ; CAB6D (32:6b6d) -> C2 5B 6B
	jp .asm_cac3b ; CAB70 (32:6b70) -> C3 3B 6C
.asm_cab73:
	ld hl, $00cc ; CAB73 (32:6b73) -> 21 CC 00
	scall PrintTextStandard ; CAB76 (32:6b76) -> CD 98 44
	ld e, $01 ; CAB79 (32:6b79) -> 1E 01
	ld hl, $009a ; CAB7B (32:6b7b) -> 21 9A 00
	scall EventFlagAction ; CAB7E (32:6b7e) -> CD 1B 46
	ld e, $00 ; CAB81 (32:6b81) -> 1E 00
	ld hl, $0042 ; CAB83 (32:6b83) -> 21 42 00
	scall EventFlagAction ; CAB86 (32:6b86) -> CD 1B 46
	ld c, $01 ; CAB89 (32:6b89) -> 0E 01
	ld e, $01 ; CAB8B (32:6b8b) -> 1E 01
	ld a, $1c ; CAB8D (32:6b8d) -> 3E 1C
	scall Func_80d4d ; CAB8F (32:6b8f) -> CD 4D 4D
	cp $ff ; CAB92 (32:6b92) -> FE FF
	jp nz, .asm_caba0 ; CAB94 (32:6b94) -> C2 A0 6B
	ld c, $03 ; CAB97 (32:6b97) -> 0E 03
	ld e, $01 ; CAB99 (32:6b99) -> 1E 01
	ld a, $1c ; CAB9B (32:6b9b) -> 3E 1C
	scall Func_80d4d ; CAB9D (32:6b9d) -> CD 4D 4D
.asm_caba0:
	ld hl, $0095 ; CABA0 (32:6ba0) -> 21 95 00
	scall CheckEventFlag ; CABA3 (32:6ba3) -> CD 2E 46
	cp $01 ; CABA6 (32:6ba6) -> FE 01
	jp nz, .asm_cabf5 ; CABA8 (32:6ba8) -> C2 F5 6B
	ld hl, $009a ; CABAB (32:6bab) -> 21 9A 00
	scall CheckEventFlag ; CABAE (32:6bae) -> CD 2E 46
	cp $01 ; CABB1 (32:6bb1) -> FE 01
	jp nz, .asm_cabf5 ; CABB3 (32:6bb3) -> C2 F5 6B
	ld hl, $009f ; CABB6 (32:6bb6) -> 21 9F 00
	scall CheckEventFlag ; CABB9 (32:6bb9) -> CD 2E 46
	cp $01 ; CABBC (32:6bbc) -> FE 01
	jp nz, .asm_cabf5 ; CABBE (32:6bbe) -> C2 F5 6B
	ld hl, $00a4 ; CABC1 (32:6bc1) -> 21 A4 00
	scall CheckEventFlag ; CABC4 (32:6bc4) -> CD 2E 46
	cp $01 ; CABC7 (32:6bc7) -> FE 01
	jp nz, .asm_cabf5 ; CABC9 (32:6bc9) -> C2 F5 6B
	ld hl, $00a9 ; CABCC (32:6bcc) -> 21 A9 00
	scall CheckEventFlag ; CABCF (32:6bcf) -> CD 2E 46
	cp $01 ; CABD2 (32:6bd2) -> FE 01
	jp nz, .asm_cabf5 ; CABD4 (32:6bd4) -> C2 F5 6B
	ld c, $00 ; CABD7 (32:6bd7) -> 0E 00
	ld e, $01 ; CABD9 (32:6bd9) -> 1E 01
	ld a, $21 ; CABDB (32:6bdb) -> 3E 21
	scall Func_80d4d ; CABDD (32:6bdd) -> CD 4D 4D
	ld hl, $046f ; CABE0 (32:6be0) -> 21 6F 04
	scall PrintTextStandard ; CABE3 (32:6be3) -> CD 98 44
	ld a, $2a ; CABE6 (32:6be6) -> 3E 2A
	scall PlaySFX ; CABE8 (32:6be8) -> CD FE 4E
	ld hl, $0470 ; CABEB (32:6beb) -> 21 70 04
	scall PrintTextStandard ; CABEE (32:6bee) -> CD 98 44
	xor a ; CABF1 (32:6bf1) -> AF
	ld [wc78f], a ; CABF2 (32:6bf2) -> EA 8F C7
.asm_cabf5:
	ld a, [wPlayerFacing] ; CABF5 (32:6bf5) -> FA 38 C8
	cp $02 ; CABF8 (32:6bf8) -> FE 02
	jp z, .asm_cac17 ; CABFA (32:6bfa) -> CA 17 6C
	cp $03 ; CABFD (32:6bfd) -> FE 03
	jp z, .asm_cac0b ; CABFF (32:6bff) -> CA 0B 6C
	cp $01 ; CAC02 (32:6c02) -> FE 01
	jp z, .asm_cac0b ; CAC04 (32:6c04) -> CA 0B 6C
	or a ; CAC07 (32:6c07) -> B7
	jp nz, .asm_cac20 ; CAC08 (32:6c08) -> C2 20 6C
.asm_cac0b:
	ld bc, Data_cab0b ; CAC0B (32:6c0b) -> 01 0B 6B
	ld e, $32 ; CAC0E (32:6c0e) -> 1E 32
	xor a ; CAC10 (32:6c10) -> AF
	scall MovePersonAndWait ; CAC11 (32:6c11) -> CD 88 46
	jp .asm_cac20 ; CAC14 (32:6c14) -> C3 20 6C
.asm_cac17:
	ld bc, Data_cab0f ; CAC17 (32:6c17) -> 01 0F 6B
	ld e, $32 ; CAC1A (32:6c1a) -> 1E 32
	xor a ; CAC1C (32:6c1c) -> AF
	scall MovePersonAndWait ; CAC1D (32:6c1d) -> CD 88 46
.asm_cac20:
	ld a, $2e ; CAC20 (32:6c20) -> 3E 2E
	scall PlaySFX ; CAC22 (32:6c22) -> CD FE 4E
	scall WaitNPCStep ; CAC25 (32:6c25) -> CD 0C 42
	ld e, $00 ; CAC28 (32:6c28) -> 1E 00
	xor a ; CAC2A (32:6c2a) -> AF
	scall SetPersonVisibilityState ; CAC2B (32:6c2b) -> CD 3D 41
	ld l, $1b ; CAC2E (32:6c2e) -> 2E 1B
	push hl ; CAC30 (32:6c30) -> E5
	ld c, $0b ; CAC31 (32:6c31) -> 0E 0B
	ld e, $00 ; CAC33 (32:6c33) -> 1E 00
	ld a, $15 ; CAC35 (32:6c35) -> 3E 15
	scall Func_80dff ; CAC37 (32:6c37) -> CD FF 4D
	pop bc ; CAC3A (32:6c3a) -> C1
.asm_cac3b:
	ret  ; CAC3B (32:6c3b) -> C9

Data_cac3c:
	dstr "(くﾞんそう)"

Data_cac44:
	db $0a, $05, $ff, $ff

Data_cac48:
	db $0b, $05, $ff, $ff

Data_cac4c:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $1d, $17, $17
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cac75:
	ld a, e ; CAC75 (32:6c75) -> 7B
	or a ; CAC76 (32:6c76) -> B7
	jp nz, .asm_cad74 ; CAC77 (32:6c77) -> C2 74 6D
	ld hl, $009f ; CAC7A (32:6c7a) -> 21 9F 00
	scall CheckEventFlag ; CAC7D (32:6c7d) -> CD 2E 46
	or a ; CAC80 (32:6c80) -> B7
	jp nz, .asm_cad74 ; CAC81 (32:6c81) -> C2 74 6D
	xor a ; CAC84 (32:6c84) -> AF
	scall FacePlayer ; CAC85 (32:6c85) -> CD 4B 44
	ld hl, $00cd ; CAC88 (32:6c88) -> 21 CD 00
	scall PrintTextStandard ; CAC8B (32:6c8b) -> CD 98 44
	ld hl, $017a ; CAC8E (32:6c8e) -> 21 7A 01
	scall PrintTextStandard ; CAC91 (32:6c91) -> CD 98 44
.asm_cac94:
	ld de, Data_cad75 ; CAC94 (32:6c94) -> 11 75 6D
	ld hl, Data_cac4c ; CAC97 (32:6c97) -> 21 4C 6C
	scall Func_802ef ; CAC9A (32:6c9a) -> CD EF 42
	or a ; CAC9D (32:6c9d) -> B7
	jp nz, .asm_cacac ; CAC9E (32:6c9e) -> C2 AC 6C
	ld a, [wc7c4] ; CACA1 (32:6ca1) -> FA C4 C7
	cp $01 ; CACA4 (32:6ca4) -> FE 01
	jp nz, .asm_cac94 ; CACA6 (32:6ca6) -> C2 94 6C
	jp .asm_cad74 ; CACA9 (32:6ca9) -> C3 74 6D
.asm_cacac:
	ld hl, $00ce ; CACAC (32:6cac) -> 21 CE 00
	scall PrintTextStandard ; CACAF (32:6caf) -> CD 98 44
	ld e, $01 ; CACB2 (32:6cb2) -> 1E 01
	ld hl, $009f ; CACB4 (32:6cb4) -> 21 9F 00
	scall EventFlagAction ; CACB7 (32:6cb7) -> CD 1B 46
	ld e, $00 ; CACBA (32:6cba) -> 1E 00
	ld hl, $0042 ; CACBC (32:6cbc) -> 21 42 00
	scall EventFlagAction ; CACBF (32:6cbf) -> CD 1B 46
	ld c, $01 ; CACC2 (32:6cc2) -> 0E 01
	ld e, $01 ; CACC4 (32:6cc4) -> 1E 01
	ld a, $1d ; CACC6 (32:6cc6) -> 3E 1D
	scall Func_80d4d ; CACC8 (32:6cc8) -> CD 4D 4D
	cp $ff ; CACCB (32:6ccb) -> FE FF
	jp nz, .asm_cacd9 ; CACCD (32:6ccd) -> C2 D9 6C
	ld c, $03 ; CACD0 (32:6cd0) -> 0E 03
	ld e, $01 ; CACD2 (32:6cd2) -> 1E 01
	ld a, $1d ; CACD4 (32:6cd4) -> 3E 1D
	scall Func_80d4d ; CACD6 (32:6cd6) -> CD 4D 4D
.asm_cacd9:
	ld hl, $0095 ; CACD9 (32:6cd9) -> 21 95 00
	scall CheckEventFlag ; CACDC (32:6cdc) -> CD 2E 46
	cp $01 ; CACDF (32:6cdf) -> FE 01
	jp nz, .asm_cad2e ; CACE1 (32:6ce1) -> C2 2E 6D
	ld hl, $009a ; CACE4 (32:6ce4) -> 21 9A 00
	scall CheckEventFlag ; CACE7 (32:6ce7) -> CD 2E 46
	cp $01 ; CACEA (32:6cea) -> FE 01
	jp nz, .asm_cad2e ; CACEC (32:6cec) -> C2 2E 6D
	ld hl, $009f ; CACEF (32:6cef) -> 21 9F 00
	scall CheckEventFlag ; CACF2 (32:6cf2) -> CD 2E 46
	cp $01 ; CACF5 (32:6cf5) -> FE 01
	jp nz, .asm_cad2e ; CACF7 (32:6cf7) -> C2 2E 6D
	ld hl, $00a4 ; CACFA (32:6cfa) -> 21 A4 00
	scall CheckEventFlag ; CACFD (32:6cfd) -> CD 2E 46
	cp $01 ; CAD00 (32:6d00) -> FE 01
	jp nz, .asm_cad2e ; CAD02 (32:6d02) -> C2 2E 6D
	ld hl, $00a9 ; CAD05 (32:6d05) -> 21 A9 00
	scall CheckEventFlag ; CAD08 (32:6d08) -> CD 2E 46
	cp $01 ; CAD0B (32:6d0b) -> FE 01
	jp nz, .asm_cad2e ; CAD0D (32:6d0d) -> C2 2E 6D
	ld c, $00 ; CAD10 (32:6d10) -> 0E 00
	ld e, $01 ; CAD12 (32:6d12) -> 1E 01
	ld a, $21 ; CAD14 (32:6d14) -> 3E 21
	scall Func_80d4d ; CAD16 (32:6d16) -> CD 4D 4D
	ld hl, $046f ; CAD19 (32:6d19) -> 21 6F 04
	scall PrintTextStandard ; CAD1C (32:6d1c) -> CD 98 44
	ld a, $2a ; CAD1F (32:6d1f) -> 3E 2A
	scall PlaySFX ; CAD21 (32:6d21) -> CD FE 4E
	ld hl, $0470 ; CAD24 (32:6d24) -> 21 70 04
	scall PrintTextStandard ; CAD27 (32:6d27) -> CD 98 44
	xor a ; CAD2A (32:6d2a) -> AF
	ld [wc78f], a ; CAD2B (32:6d2b) -> EA 8F C7
.asm_cad2e:
	ld a, [wPlayerFacing] ; CAD2E (32:6d2e) -> FA 38 C8
	cp $02 ; CAD31 (32:6d31) -> FE 02
	jp z, .asm_cad50 ; CAD33 (32:6d33) -> CA 50 6D
	cp $03 ; CAD36 (32:6d36) -> FE 03
	jp z, .asm_cad44 ; CAD38 (32:6d38) -> CA 44 6D
	cp $01 ; CAD3B (32:6d3b) -> FE 01
	jp z, .asm_cad44 ; CAD3D (32:6d3d) -> CA 44 6D
	or a ; CAD40 (32:6d40) -> B7
	jp nz, .asm_cad59 ; CAD41 (32:6d41) -> C2 59 6D
.asm_cad44:
	ld bc, Data_cac44 ; CAD44 (32:6d44) -> 01 44 6C
	ld e, $32 ; CAD47 (32:6d47) -> 1E 32
	xor a ; CAD49 (32:6d49) -> AF
	scall MovePersonAndWait ; CAD4A (32:6d4a) -> CD 88 46
	jp .asm_cad59 ; CAD4D (32:6d4d) -> C3 59 6D
.asm_cad50:
	ld bc, Data_cac48 ; CAD50 (32:6d50) -> 01 48 6C
	ld e, $32 ; CAD53 (32:6d53) -> 1E 32
	xor a ; CAD55 (32:6d55) -> AF
	scall MovePersonAndWait ; CAD56 (32:6d56) -> CD 88 46
.asm_cad59:
	ld a, $2e ; CAD59 (32:6d59) -> 3E 2E
	scall PlaySFX ; CAD5B (32:6d5b) -> CD FE 4E
	scall WaitNPCStep ; CAD5E (32:6d5e) -> CD 0C 42
	ld e, $00 ; CAD61 (32:6d61) -> 1E 00
	xor a ; CAD63 (32:6d63) -> AF
	scall SetPersonVisibilityState ; CAD64 (32:6d64) -> CD 3D 41
	ld l, $12 ; CAD67 (32:6d67) -> 2E 12
	push hl ; CAD69 (32:6d69) -> E5
	ld c, $1d ; CAD6A (32:6d6a) -> 0E 1D
	ld e, $00 ; CAD6C (32:6d6c) -> 1E 00
	ld a, $15 ; CAD6E (32:6d6e) -> 3E 15
	scall Func_80dff ; CAD70 (32:6d70) -> CD FF 4D
	pop bc ; CAD73 (32:6d73) -> C1
.asm_cad74:
	ret  ; CAD74 (32:6d74) -> C9

Data_cad75:
	dstr "(くﾞんそう)"

Data_cad7d:
	db $0a, $05, $ff, $ff

Data_cad81:
	db $0b, $05, $ff, $ff

Data_cad85:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $1d, $26, $12
	db $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cadae:
	ld a, e ; CADAE (32:6dae) -> 7B
	or a ; CADAF (32:6daf) -> B7
	jp nz, .asm_caead ; CADB0 (32:6db0) -> C2 AD 6E
	ld hl, $00a4 ; CADB3 (32:6db3) -> 21 A4 00
	scall CheckEventFlag ; CADB6 (32:6db6) -> CD 2E 46
	or a ; CADB9 (32:6db9) -> B7
	jp nz, .asm_caead ; CADBA (32:6dba) -> C2 AD 6E
	xor a ; CADBD (32:6dbd) -> AF
	scall FacePlayer ; CADBE (32:6dbe) -> CD 4B 44
	ld hl, $00cf ; CADC1 (32:6dc1) -> 21 CF 00
	scall PrintTextStandard ; CADC4 (32:6dc4) -> CD 98 44
	ld hl, $016b ; CADC7 (32:6dc7) -> 21 6B 01
	scall PrintTextStandard ; CADCA (32:6dca) -> CD 98 44
.asm_cadcd:
	ld de, Data_caeae ; CADCD (32:6dcd) -> 11 AE 6E
	ld hl, Data_cad85 ; CADD0 (32:6dd0) -> 21 85 6D
	scall Func_80347 ; CADD3 (32:6dd3) -> CD 46 43
	or a ; CADD6 (32:6dd6) -> B7
	jp nz, .asm_cade5 ; CADD7 (32:6dd7) -> C2 E5 6D
	ld a, [wc7c4] ; CADDA (32:6dda) -> FA C4 C7
	cp $01 ; CADDD (32:6ddd) -> FE 01
	jp nz, .asm_cadcd ; CADDF (32:6ddf) -> C2 CD 6D
	jp .asm_caead ; CADE2 (32:6de2) -> C3 AD 6E
.asm_cade5:
	ld hl, $00d0 ; CADE5 (32:6de5) -> 21 D0 00
	scall PrintTextStandard ; CADE8 (32:6de8) -> CD 98 44
	ld e, $01 ; CADEB (32:6deb) -> 1E 01
	ld hl, $00a4 ; CADED (32:6ded) -> 21 A4 00
	scall EventFlagAction ; CADF0 (32:6df0) -> CD 1B 46
	ld e, $00 ; CADF3 (32:6df3) -> 1E 00
	ld hl, $0042 ; CADF5 (32:6df5) -> 21 42 00
	scall EventFlagAction ; CADF8 (32:6df8) -> CD 1B 46
	ld c, $01 ; CADFB (32:6dfb) -> 0E 01
	ld e, $01 ; CADFD (32:6dfd) -> 1E 01
	ld a, $20 ; CADFF (32:6dff) -> 3E 20
	scall Func_80d4d ; CAE01 (32:6e01) -> CD 4D 4D
	cp $ff ; CAE04 (32:6e04) -> FE FF
	jp nz, .asm_cae12 ; CAE06 (32:6e06) -> C2 12 6E
	ld c, $03 ; CAE09 (32:6e09) -> 0E 03
	ld e, $01 ; CAE0B (32:6e0b) -> 1E 01
	ld a, $20 ; CAE0D (32:6e0d) -> 3E 20
	scall Func_80d4d ; CAE0F (32:6e0f) -> CD 4D 4D
.asm_cae12:
	ld hl, $0095 ; CAE12 (32:6e12) -> 21 95 00
	scall CheckEventFlag ; CAE15 (32:6e15) -> CD 2E 46
	cp $01 ; CAE18 (32:6e18) -> FE 01
	jp nz, .asm_cae67 ; CAE1A (32:6e1a) -> C2 67 6E
	ld hl, $009a ; CAE1D (32:6e1d) -> 21 9A 00
	scall CheckEventFlag ; CAE20 (32:6e20) -> CD 2E 46
	cp $01 ; CAE23 (32:6e23) -> FE 01
	jp nz, .asm_cae67 ; CAE25 (32:6e25) -> C2 67 6E
	ld hl, $009f ; CAE28 (32:6e28) -> 21 9F 00
	scall CheckEventFlag ; CAE2B (32:6e2b) -> CD 2E 46
	cp $01 ; CAE2E (32:6e2e) -> FE 01
	jp nz, .asm_cae67 ; CAE30 (32:6e30) -> C2 67 6E
	ld hl, $00a4 ; CAE33 (32:6e33) -> 21 A4 00
	scall CheckEventFlag ; CAE36 (32:6e36) -> CD 2E 46
	cp $01 ; CAE39 (32:6e39) -> FE 01
	jp nz, .asm_cae67 ; CAE3B (32:6e3b) -> C2 67 6E
	ld hl, $00a9 ; CAE3E (32:6e3e) -> 21 A9 00
	scall CheckEventFlag ; CAE41 (32:6e41) -> CD 2E 46
	cp $01 ; CAE44 (32:6e44) -> FE 01
	jp nz, .asm_cae67 ; CAE46 (32:6e46) -> C2 67 6E
	ld c, $00 ; CAE49 (32:6e49) -> 0E 00
	ld e, $01 ; CAE4B (32:6e4b) -> 1E 01
	ld a, $21 ; CAE4D (32:6e4d) -> 3E 21
	scall Func_80d4d ; CAE4F (32:6e4f) -> CD 4D 4D
	ld hl, $046f ; CAE52 (32:6e52) -> 21 6F 04
	scall PrintTextStandard ; CAE55 (32:6e55) -> CD 98 44
	ld a, $2a ; CAE58 (32:6e58) -> 3E 2A
	scall PlaySFX ; CAE5A (32:6e5a) -> CD FE 4E
	ld hl, $0470 ; CAE5D (32:6e5d) -> 21 70 04
	scall PrintTextStandard ; CAE60 (32:6e60) -> CD 98 44
	xor a ; CAE63 (32:6e63) -> AF
	ld [wc78f], a ; CAE64 (32:6e64) -> EA 8F C7
.asm_cae67:
	ld a, [wPlayerFacing] ; CAE67 (32:6e67) -> FA 38 C8
	cp $02 ; CAE6A (32:6e6a) -> FE 02
	jp z, .asm_cae89 ; CAE6C (32:6e6c) -> CA 89 6E
	cp $03 ; CAE6F (32:6e6f) -> FE 03
	jp z, .asm_cae7d ; CAE71 (32:6e71) -> CA 7D 6E
	cp $01 ; CAE74 (32:6e74) -> FE 01
	jp z, .asm_cae7d ; CAE76 (32:6e76) -> CA 7D 6E
	or a ; CAE79 (32:6e79) -> B7
	jp nz, .asm_cae92 ; CAE7A (32:6e7a) -> C2 92 6E
.asm_cae7d:
	ld bc, Data_cad7d ; CAE7D (32:6e7d) -> 01 7D 6D
	ld e, $32 ; CAE80 (32:6e80) -> 1E 32
	xor a ; CAE82 (32:6e82) -> AF
	scall MovePersonAndWait ; CAE83 (32:6e83) -> CD 88 46
	jp .asm_cae92 ; CAE86 (32:6e86) -> C3 92 6E
.asm_cae89:
	ld bc, Data_cad81 ; CAE89 (32:6e89) -> 01 81 6D
	ld e, $32 ; CAE8C (32:6e8c) -> 1E 32
	xor a ; CAE8E (32:6e8e) -> AF
	scall MovePersonAndWait ; CAE8F (32:6e8f) -> CD 88 46
.asm_cae92:
	ld a, $2e ; CAE92 (32:6e92) -> 3E 2E
	scall PlaySFX ; CAE94 (32:6e94) -> CD FE 4E
	scall WaitNPCStep ; CAE97 (32:6e97) -> CD 0C 42
	ld e, $00 ; CAE9A (32:6e9a) -> 1E 00
	xor a ; CAE9C (32:6e9c) -> AF
	scall SetPersonVisibilityState ; CAE9D (32:6e9d) -> CD 3D 41
	ld l, $12 ; CAEA0 (32:6ea0) -> 2E 12
	push hl ; CAEA2 (32:6ea2) -> E5
	ld c, $05 ; CAEA3 (32:6ea3) -> 0E 05
	ld e, $00 ; CAEA5 (32:6ea5) -> 1E 00
	ld a, $15 ; CAEA7 (32:6ea7) -> 3E 15
	scall Func_80dff ; CAEA9 (32:6ea9) -> CD FF 4D
	pop bc ; CAEAC (32:6eac) -> C1
.asm_caead:
	ret  ; CAEAD (32:6ead) -> C9

Data_caeae:
	dstr "(くﾞんそう)"

Data_caeb6:
	db $0a, $05, $ff, $ff

Data_caeba:
	db $0b, $05, $ff, $ff

Data_caebe:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $04, $1d, $14, $1e
	db $1e, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_caee7:
	ld a, e ; CAEE7 (32:6ee7) -> 7B
	or a ; CAEE8 (32:6ee8) -> B7
	jp nz, .asm_cafe6 ; CAEE9 (32:6ee9) -> C2 E6 6F
	ld hl, $00a9 ; CAEEC (32:6eec) -> 21 A9 00
	scall CheckEventFlag ; CAEEF (32:6eef) -> CD 2E 46
	or a ; CAEF2 (32:6ef2) -> B7
	jp nz, .asm_cafe6 ; CAEF3 (32:6ef3) -> C2 E6 6F
	xor a ; CAEF6 (32:6ef6) -> AF
	scall FacePlayer ; CAEF7 (32:6ef7) -> CD 4B 44
	ld hl, $00d1 ; CAEFA (32:6efa) -> 21 D1 00
	scall PrintTextStandard ; CAEFD (32:6efd) -> CD 98 44
	ld hl, $015d ; CAF00 (32:6f00) -> 21 5D 01
	scall PrintTextStandard ; CAF03 (32:6f03) -> CD 98 44
.asm_caf06:
	ld de, Data_cafe7 ; CAF06 (32:6f06) -> 11 E7 6F
	ld hl, Data_caebe ; CAF09 (32:6f09) -> 21 BE 6E
	scall Func_8039e ; CAF0C (32:6f0c) -> CD 9D 43
	or a ; CAF0F (32:6f0f) -> B7
	jp nz, .asm_caf1e ; CAF10 (32:6f10) -> C2 1E 6F
	ld a, [wc7c4] ; CAF13 (32:6f13) -> FA C4 C7
	cp $01 ; CAF16 (32:6f16) -> FE 01
	jp nz, .asm_caf06 ; CAF18 (32:6f18) -> C2 06 6F
	jp .asm_cafe6 ; CAF1B (32:6f1b) -> C3 E6 6F
.asm_caf1e:
	ld hl, $00d2 ; CAF1E (32:6f1e) -> 21 D2 00
	scall PrintTextStandard ; CAF21 (32:6f21) -> CD 98 44
	ld e, $01 ; CAF24 (32:6f24) -> 1E 01
	ld hl, $00a9 ; CAF26 (32:6f26) -> 21 A9 00
	scall EventFlagAction ; CAF29 (32:6f29) -> CD 1B 46
	ld e, $00 ; CAF2C (32:6f2c) -> 1E 00
	ld hl, $0042 ; CAF2E (32:6f2e) -> 21 42 00
	scall EventFlagAction ; CAF31 (32:6f31) -> CD 1B 46
	ld c, $01 ; CAF34 (32:6f34) -> 0E 01
	ld e, $01 ; CAF36 (32:6f36) -> 1E 01
	ld a, $1f ; CAF38 (32:6f38) -> 3E 1F
	scall Func_80d4d ; CAF3A (32:6f3a) -> CD 4D 4D
	cp $ff ; CAF3D (32:6f3d) -> FE FF
	jp nz, .asm_caf4b ; CAF3F (32:6f3f) -> C2 4B 6F
	ld c, $03 ; CAF42 (32:6f42) -> 0E 03
	ld e, $01 ; CAF44 (32:6f44) -> 1E 01
	ld a, $1f ; CAF46 (32:6f46) -> 3E 1F
	scall Func_80d4d ; CAF48 (32:6f48) -> CD 4D 4D
.asm_caf4b:
	ld hl, $0095 ; CAF4B (32:6f4b) -> 21 95 00
	scall CheckEventFlag ; CAF4E (32:6f4e) -> CD 2E 46
	cp $01 ; CAF51 (32:6f51) -> FE 01
	jp nz, .asm_cafa0 ; CAF53 (32:6f53) -> C2 A0 6F
	ld hl, $009a ; CAF56 (32:6f56) -> 21 9A 00
	scall CheckEventFlag ; CAF59 (32:6f59) -> CD 2E 46
	cp $01 ; CAF5C (32:6f5c) -> FE 01
	jp nz, .asm_cafa0 ; CAF5E (32:6f5e) -> C2 A0 6F
	ld hl, $009f ; CAF61 (32:6f61) -> 21 9F 00
	scall CheckEventFlag ; CAF64 (32:6f64) -> CD 2E 46
	cp $01 ; CAF67 (32:6f67) -> FE 01
	jp nz, .asm_cafa0 ; CAF69 (32:6f69) -> C2 A0 6F
	ld hl, $00a4 ; CAF6C (32:6f6c) -> 21 A4 00
	scall CheckEventFlag ; CAF6F (32:6f6f) -> CD 2E 46
	cp $01 ; CAF72 (32:6f72) -> FE 01
	jp nz, .asm_cafa0 ; CAF74 (32:6f74) -> C2 A0 6F
	ld hl, $00a9 ; CAF77 (32:6f77) -> 21 A9 00
	scall CheckEventFlag ; CAF7A (32:6f7a) -> CD 2E 46
	cp $01 ; CAF7D (32:6f7d) -> FE 01
	jp nz, .asm_cafa0 ; CAF7F (32:6f7f) -> C2 A0 6F
	ld hl, $046f ; CAF82 (32:6f82) -> 21 6F 04
	scall PrintTextStandard ; CAF85 (32:6f85) -> CD 98 44
	ld a, $2a ; CAF88 (32:6f88) -> 3E 2A
	scall PlaySFX ; CAF8A (32:6f8a) -> CD FE 4E
	ld hl, $0470 ; CAF8D (32:6f8d) -> 21 70 04
	scall PrintTextStandard ; CAF90 (32:6f90) -> CD 98 44
	ld c, $00 ; CAF93 (32:6f93) -> 0E 00
	ld e, $01 ; CAF95 (32:6f95) -> 1E 01
	ld a, $21 ; CAF97 (32:6f97) -> 3E 21
	scall Func_80d4d ; CAF99 (32:6f99) -> CD 4D 4D
	xor a ; CAF9C (32:6f9c) -> AF
	ld [wc78f], a ; CAF9D (32:6f9d) -> EA 8F C7
.asm_cafa0:
	ld a, [wPlayerFacing] ; CAFA0 (32:6fa0) -> FA 38 C8
	cp $02 ; CAFA3 (32:6fa3) -> FE 02
	jp z, .asm_cafc2 ; CAFA5 (32:6fa5) -> CA C2 6F
	cp $03 ; CAFA8 (32:6fa8) -> FE 03
	jp z, .asm_cafb6 ; CAFAA (32:6faa) -> CA B6 6F
	cp $01 ; CAFAD (32:6fad) -> FE 01
	jp z, .asm_cafb6 ; CAFAF (32:6faf) -> CA B6 6F
	or a ; CAFB2 (32:6fb2) -> B7
	jp nz, .asm_cafcb ; CAFB3 (32:6fb3) -> C2 CB 6F
.asm_cafb6:
	ld bc, Data_caeb6 ; CAFB6 (32:6fb6) -> 01 B6 6E
	ld e, $32 ; CAFB9 (32:6fb9) -> 1E 32
	xor a ; CAFBB (32:6fbb) -> AF
	scall MovePersonAndWait ; CAFBC (32:6fbc) -> CD 88 46
	jp .asm_cafcb ; CAFBF (32:6fbf) -> C3 CB 6F
.asm_cafc2:
	ld bc, Data_caeba ; CAFC2 (32:6fc2) -> 01 BA 6E
	ld e, $32 ; CAFC5 (32:6fc5) -> 1E 32
	xor a ; CAFC7 (32:6fc7) -> AF
	scall MovePersonAndWait ; CAFC8 (32:6fc8) -> CD 88 46
.asm_cafcb:
	ld a, $2e ; CAFCB (32:6fcb) -> 3E 2E
	scall PlaySFX ; CAFCD (32:6fcd) -> CD FE 4E
	scall WaitNPCStep ; CAFD0 (32:6fd0) -> CD 0C 42
	ld e, $00 ; CAFD3 (32:6fd3) -> 1E 00
	xor a ; CAFD5 (32:6fd5) -> AF
	scall SetPersonVisibilityState ; CAFD6 (32:6fd6) -> CD 3D 41
	ld l, $0a ; CAFD9 (32:6fd9) -> 2E 0A
	push hl ; CAFDB (32:6fdb) -> E5
	ld c, $11 ; CAFDC (32:6fdc) -> 0E 11
	ld e, $00 ; CAFDE (32:6fde) -> 1E 00
	ld a, $15 ; CAFE0 (32:6fe0) -> 3E 15
	scall Func_80dff ; CAFE2 (32:6fe2) -> CD FF 4D
	pop bc ; CAFE5 (32:6fe5) -> C1
.asm_cafe6:
	ret  ; CAFE6 (32:6fe6) -> C9

Data_cafe7:
	dstr "(くﾞんそう)"

Data_cafef:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $13, $11, $14, $2e
	warpdef $06, $0a, $01, $01, MAP_21_21, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_21, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_21, $0d, $0a, $0d, $09, $2e

Data_cb01b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb061:
	person_event $09, $0c, $0a, $0c, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $04, $09, $06, $01, $01, $00, $04, $00, Func_cb1e9, NULL
	person_event $ff, $00, $09, $08, $02, $01, $02, $04, $01, Func_cb10e, NULL
	person_event $ff, $00, $0a, $06, $01, $01, $00, $04, $01, Func_cb183, NULL

Func_cb099:: ; cb099
	ld e, $04 ; CB099 (32:7099) -> 1E 04
	ld hl, Data_cafef ; CB09B (32:709b) -> 21 EF 6F
	scall LoadWarps ; CB09E (32:709e) -> CD 3A 40
	ld a, $03 ; CB0A1 (32:70a1) -> 3E 03
	scall Func_80d01 ; CB0A3 (32:70a3) -> CD 01 4D
	ld e, $05 ; CB0A6 (32:70a6) -> 1E 05
	ld hl, Data_cb01b ; CB0A8 (32:70a8) -> 21 1B 70
	scall LoadEncounters ; CB0AB (32:70ab) -> CD 24 4D
	ld e, $04 ; CB0AE (32:70ae) -> 1E 04
	ld hl, Data_cb061 ; CB0B0 (32:70b0) -> 21 61 70
	scall LoadMapObjects ; CB0B3 (32:70b3) -> CD FB 40
	ld hl, $00aa ; CB0B6 (32:70b6) -> 21 AA 00
	scall CheckEventFlag ; CB0B9 (32:70b9) -> CD 2E 46
	cp $01 ; CB0BC (32:70bc) -> FE 01
	jp nz, .asm_cb0ce ; CB0BE (32:70be) -> C2 CE 70
	ld e, $00 ; CB0C1 (32:70c1) -> 1E 00
	xor a ; CB0C3 (32:70c3) -> AF
	scall SetPersonVisibilityState ; CB0C4 (32:70c4) -> CD 3D 41
	ld e, $00 ; CB0C7 (32:70c7) -> 1E 00
	ld a, $02 ; CB0C9 (32:70c9) -> 3E 02
	scall SetPersonVisibilityState ; CB0CB (32:70cb) -> CD 3D 41
.asm_cb0ce:
	ld a, $07 ; CB0CE (32:70ce) -> 3E 07
	scall PlayMusic ; CB0D0 (32:70d0) -> CD E6 4E
	scall Func_8001c ; CB0D3 (32:70d3) -> CD 1C 40
	ld hl, $02ff ; CB0D6 (32:70d6) -> 21 FF 02
	scall LandmarkSign ; CB0D9 (32:70d9) -> CD 72 4F
	ret  ; CB0DC (32:70dc) -> C9

Data_cb0dd:
	db $0a, $0b, $ff, $ff

Data_cb0e1:
	db $09, $06, $ff, $ff

Data_cb0e5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $2e, $05, $1f, $04, $0e
	db $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $5c, $05, $1f, $05, $05
	db $05, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_cb10e:
	ld a, e ; CB10E (32:710e) -> 7B
	cp $02 ; CB10F (32:710f) -> FE 02
	jp nz, .asm_cb176 ; CB111 (32:7111) -> C2 76 71
	ld hl, $00aa ; CB114 (32:7114) -> 21 AA 00
	scall CheckEventFlag ; CB117 (32:7117) -> CD 2E 46
	or a ; CB11A (32:711a) -> B7
	jp nz, .asm_cb176 ; CB11B (32:711b) -> C2 76 71
	ld c, $01 ; CB11E (32:711e) -> 0E 01
	ld de, Data_cb0dd ; CB120 (32:7120) -> 11 DD 70
	ld a, $32 ; CB123 (32:7123) -> 3E 32
	scall MovePlayer ; CB125 (32:7125) -> CD 3E 46
	ld e, $00 ; CB128 (32:7128) -> 1E 00
	xor a ; CB12A (32:712a) -> AF
	scall SpriteFace ; CB12B (32:712b) -> CD 95 40
	xor a ; CB12E (32:712e) -> AF
	scall PlayMusic ; CB12F (32:712f) -> CD E6 4E
	ld a, $1a ; CB132 (32:7132) -> 3E 1A
	scall PlayMusic ; CB134 (32:7134) -> CD E6 4E
	ld hl, $00d9 ; CB137 (32:7137) -> 21 D9 00
	scall PrintTextStandard ; CB13A (32:713a) -> CD 98 44
	ld de, Data_cb177 ; CB13D (32:713d) -> 11 77 71
	ld hl, Data_cb0e5 ; CB140 (32:7140) -> 21 E5 70
	scall ScriptedBattle ; CB143 (32:7143) -> CD D3 4D
	or a ; CB146 (32:7146) -> B7
	jp nz, .asm_cb14d ; CB147 (32:7147) -> C2 4D 71
	jp .asm_cb176 ; CB14A (32:714a) -> C3 76 71
.asm_cb14d:
	ld hl, $00da ; CB14D (32:714d) -> 21 DA 00
	scall PrintTextStandard ; CB150 (32:7150) -> CD 98 44
	ld bc, Data_cb0e1 ; CB153 (32:7153) -> 01 E1 70
	ld e, $32 ; CB156 (32:7156) -> 1E 32
	xor a ; CB158 (32:7158) -> AF
	scall MovePersonAndWait ; CB159 (32:7159) -> CD 88 46
	scall WaitNPCStep ; CB15C (32:715c) -> CD 0C 42
	ld e, $00 ; CB15F (32:715f) -> 1E 00
	xor a ; CB161 (32:7161) -> AF
	scall SetPersonVisibilityState ; CB162 (32:7162) -> CD 3D 41
	ld e, $01 ; CB165 (32:7165) -> 1E 01
	ld hl, $00aa ; CB167 (32:7167) -> 21 AA 00
	scall EventFlagAction ; CB16A (32:716a) -> CD 1B 46
	xor a ; CB16D (32:716d) -> AF
	scall PlayMusic ; CB16E (32:716e) -> CD E6 4E
	ld a, $07 ; CB171 (32:7171) -> 3E 07
	scall PlayMusic ; CB173 (32:7173) -> CD E6 4E
.asm_cb176:
	ret  ; CB176 (32:7176) -> C9

Data_cb177:
	dstr "(くﾞんそう)"

Data_cb17f:
	db $0a, $05, $ff, $ff

Func_cb183:
	push de ; CB183 (32:7183) -> D5
	ld hl, $0095 ; CB184 (32:7184) -> 21 95 00
	scall CheckEventFlag ; CB187 (32:7187) -> CD 2E 46
	or a ; CB18A (32:718a) -> B7
	jp z, .asm_cb1b6 ; CB18B (32:718b) -> CA B6 71
	ld hl, $009a ; CB18E (32:718e) -> 21 9A 00
	scall CheckEventFlag ; CB191 (32:7191) -> CD 2E 46
	or a ; CB194 (32:7194) -> B7
	jp z, .asm_cb1b6 ; CB195 (32:7195) -> CA B6 71
	ld hl, $009f ; CB198 (32:7198) -> 21 9F 00
	scall CheckEventFlag ; CB19B (32:719b) -> CD 2E 46
	or a ; CB19E (32:719e) -> B7
	jp z, .asm_cb1b6 ; CB19F (32:719f) -> CA B6 71
	ld hl, $00a4 ; CB1A2 (32:71a2) -> 21 A4 00
	scall CheckEventFlag ; CB1A5 (32:71a5) -> CD 2E 46
	or a ; CB1A8 (32:71a8) -> B7
	jp z, .asm_cb1b6 ; CB1A9 (32:71a9) -> CA B6 71
	ld hl, $00a9 ; CB1AC (32:71ac) -> 21 A9 00
	scall CheckEventFlag ; CB1AF (32:71af) -> CD 2E 46
	or a ; CB1B2 (32:71b2) -> B7
	jp nz, .asm_cb1e7 ; CB1B3 (32:71b3) -> C2 E7 71
.asm_cb1b6:
	ld hl, sp+$00 ; CB1B6 (32:71b6) -> F8 00
	ld a, [hl] ; CB1B8 (32:71b8) -> 7E
	cp $02 ; CB1B9 (32:71b9) -> FE 02
	jp nz, .asm_cb1e7 ; CB1BB (32:71bb) -> C2 E7 71
	ld e, $01 ; CB1BE (32:71be) -> 1E 01
	ld a, $01 ; CB1C0 (32:71c0) -> 3E 01
	scall SpriteFace ; CB1C2 (32:71c2) -> CD 95 40
	ld hl, $001e ; CB1C5 (32:71c5) -> 21 1E 00
	scall ScriptSleep ; CB1C8 (32:71c8) -> CD 8F 46
	ld a, $03 ; CB1CB (32:71cb) -> 3E 03
	scall PlayerFace ; CB1CD (32:71cd) -> CD 77 46
	ld hl, $00be ; CB1D0 (32:71d0) -> 21 BE 00
	scall PrintTextStandard ; CB1D3 (32:71d3) -> CD 98 44
	ld c, $01 ; CB1D6 (32:71d6) -> 0E 01
	ld de, Data_cb17f ; CB1D8 (32:71d8) -> 11 7F 71
	ld a, $32 ; CB1DB (32:71db) -> 3E 32
	scall MovePlayer ; CB1DD (32:71dd) -> CD 3E 46
	ld e, $00 ; CB1E0 (32:71e0) -> 1E 00
	ld a, $01 ; CB1E2 (32:71e2) -> 3E 01
	scall SpriteFace ; CB1E4 (32:71e4) -> CD 95 40
.asm_cb1e7:
	pop bc ; CB1E7 (32:71e7) -> C1
	ret  ; CB1E8 (32:71e8) -> C9

Func_cb1e9:
	push af ; CB1E9 (32:71e9) -> F5
	ld a, e ; CB1EA (32:71ea) -> 7B
	or a ; CB1EB (32:71eb) -> B7
	jp nz, .asm_cb236 ; CB1EC (32:71ec) -> C2 36 72
	ld hl, sp+$01 ; CB1EF (32:71ef) -> F8 01
	ld a, [hl] ; CB1F1 (32:71f1) -> 7E
	scall FacePlayer ; CB1F2 (32:71f2) -> CD 4B 44
	ld hl, $0095 ; CB1F5 (32:71f5) -> 21 95 00
	scall CheckEventFlag ; CB1F8 (32:71f8) -> CD 2E 46
	or a ; CB1FB (32:71fb) -> B7
	jp z, .asm_cb227 ; CB1FC (32:71fc) -> CA 27 72
	ld hl, $009a ; CB1FF (32:71ff) -> 21 9A 00
	scall CheckEventFlag ; CB202 (32:7202) -> CD 2E 46
	or a ; CB205 (32:7205) -> B7
	jp z, .asm_cb227 ; CB206 (32:7206) -> CA 27 72
	ld hl, $009f ; CB209 (32:7209) -> 21 9F 00
	scall CheckEventFlag ; CB20C (32:720c) -> CD 2E 46
	or a ; CB20F (32:720f) -> B7
	jp z, .asm_cb227 ; CB210 (32:7210) -> CA 27 72
	ld hl, $00a4 ; CB213 (32:7213) -> 21 A4 00
	scall CheckEventFlag ; CB216 (32:7216) -> CD 2E 46
	or a ; CB219 (32:7219) -> B7
	jp z, .asm_cb227 ; CB21A (32:721a) -> CA 27 72
	ld hl, $00a9 ; CB21D (32:721d) -> 21 A9 00
	scall CheckEventFlag ; CB220 (32:7220) -> CD 2E 46
	or a ; CB223 (32:7223) -> B7
	jp nz, .asm_cb230 ; CB224 (32:7224) -> C2 30 72
.asm_cb227:
	ld hl, $00be ; CB227 (32:7227) -> 21 BE 00
	scall PrintTextStandard ; CB22A (32:722a) -> CD 98 44
	jp .asm_cb236 ; CB22D (32:722d) -> C3 36 72
.asm_cb230:
	ld hl, $03be ; CB230 (32:7230) -> 21 BE 03
	scall PrintTextStandard ; CB233 (32:7233) -> CD 98 44
.asm_cb236:
	pop bc ; CB236 (32:7236) -> C1
	ret  ; CB237 (32:7237) -> C9

Data_cb238:
	warpdef $06, $0a, $01, $01, MAP_21_20, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_20, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_20, $0d, $0a, $0d, $0b, $2e
	warpdef $01, $0d, $01, $01, MAP_21_22, $01, $0d, $02, $0d, $2e
	warpdef $09, $09, $01, $01, MAP_21_22, $09, $09, $09, $0a, $2e
	warpdef $12, $08, $01, $01, MAP_21_22, $12, $08, $11, $08, $2e

Data_cb27a:
	db $30, $0a, $02, $03, $19

Data_cb27f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb2c5:
	person_event $09, $0c, $03, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $03, $06, $01, $04, $00, $04, $01, Func_cb335, NULL
	person_event $ff, $00, $04, $04, $01, $05, $00, $04, $01, Func_cb335, NULL

Func_cb2ef:: ; cb2ef
	ld e, $06 ; CB2EF (32:72ef) -> 1E 06
	ld hl, Data_cb238 ; CB2F1 (32:72f1) -> 21 38 72
	scall LoadWarps ; CB2F4 (32:72f4) -> CD 3A 40
	ld e, $01 ; CB2F7 (32:72f7) -> 1E 01
	ld hl, Data_cb27a ; CB2F9 (32:72f9) -> 21 7A 72
	scall Func_80ce7 ; CB2FC (32:72fc) -> CD E7 4C
	ld a, $03 ; CB2FF (32:72ff) -> 3E 03
	scall Func_80d01 ; CB301 (32:7301) -> CD 01 4D
	ld e, $05 ; CB304 (32:7304) -> 1E 05
	ld hl, Data_cb27f ; CB306 (32:7306) -> 21 7F 72
	scall LoadEncounters ; CB309 (32:7309) -> CD 24 4D
	ld hl, $00ab ; CB30C (32:730c) -> 21 AB 00
	scall CheckEventFlag ; CB30F (32:730f) -> CD 2E 46
	or a ; CB312 (32:7312) -> B7
	jp nz, .asm_cb31e ; CB313 (32:7313) -> C2 1E 73
	ld e, $03 ; CB316 (32:7316) -> 1E 03
	ld hl, Data_cb2c5 ; CB318 (32:7318) -> 21 C5 72
	scall LoadMapObjects ; CB31B (32:731b) -> CD FB 40
.asm_cb31e:
	ld a, $07 ; CB31E (32:731e) -> 3E 07
	scall PlayMusic ; CB320 (32:7320) -> CD E6 4E
	scall Func_8001c ; CB323 (32:7323) -> CD 1C 40
	ld hl, $0300 ; CB326 (32:7326) -> 21 00 03
	scall LandmarkSign ; CB329 (32:7329) -> CD 72 4F
	ret  ; CB32C (32:732c) -> C9

Data_cb32d:
	db $03, $06, $ff, $ff

Data_cb331:
	db $04, $05, $ff, $ff

Func_cb335:
	push af ; CB335 (32:7335) -> F5
	ld a, e ; CB336 (32:7336) -> 7B
	cp $02 ; CB337 (32:7337) -> FE 02
	jp nz, .asm_cb391 ; CB339 (32:7339) -> C2 91 73
	ld hl, $00ab ; CB33C (32:733c) -> 21 AB 00
	scall CheckEventFlag ; CB33F (32:733f) -> CD 2E 46
	or a ; CB342 (32:7342) -> B7
	jp nz, .asm_cb391 ; CB343 (32:7343) -> C2 91 73
	xor a ; CB346 (32:7346) -> AF
	scall PlayMusic ; CB347 (32:7347) -> CD E6 4E
	ld a, $1a ; CB34A (32:734a) -> 3E 1A
	scall PlayMusic ; CB34C (32:734c) -> CD E6 4E
	ld hl, sp+$01 ; CB34F (32:734f) -> F8 01
	ld a, [hl] ; CB351 (32:7351) -> 7E
	cp $01 ; CB352 (32:7352) -> FE 01
	jp nz, .asm_cb368 ; CB354 (32:7354) -> C2 68 73
	ld c, $01 ; CB357 (32:7357) -> 0E 01
	ld de, Data_cb32d ; CB359 (32:7359) -> 11 2D 73
	ld a, $32 ; CB35C (32:735c) -> 3E 32
	scall MovePlayer ; CB35E (32:735e) -> CD 3E 46
	xor a ; CB361 (32:7361) -> AF
	scall PlayerFace ; CB362 (32:7362) -> CD 77 46
	jp .asm_cb37d ; CB365 (32:7365) -> C3 7D 73
.asm_cb368:
	ld c, $01 ; CB368 (32:7368) -> 0E 01
	ld de, Data_cb331 ; CB36A (32:736a) -> 11 31 73
	ld a, $32 ; CB36D (32:736d) -> 3E 32
	scall MovePlayer ; CB36F (32:736f) -> CD 3E 46
	ld a, $03 ; CB372 (32:7372) -> 3E 03
	scall PlayerFace ; CB374 (32:7374) -> CD 77 46
	ld e, $01 ; CB377 (32:7377) -> 1E 01
	xor a ; CB379 (32:7379) -> AF
	scall SpriteFace ; CB37A (32:737a) -> CD 95 40
.asm_cb37d:
	call Func_cb3c6 ; CB37D (32:737d) -> CD C6 73
	ld e, $01 ; CB380 (32:7380) -> 1E 01
	ld hl, $00ab ; CB382 (32:7382) -> 21 AB 00
	scall EventFlagAction ; CB385 (32:7385) -> CD 1B 46
	xor a ; CB388 (32:7388) -> AF
	scall PlayMusic ; CB389 (32:7389) -> CD E6 4E
	ld a, $07 ; CB38C (32:738c) -> 3E 07
	scall PlayMusic ; CB38E (32:738e) -> CD E6 4E
.asm_cb391:
	pop bc ; CB391 (32:7391) -> C1
	ret  ; CB392 (32:7392) -> C9

Data_cb393:
	db $0c, $05, $ff, $ff

Data_cb397:
	db $03, $06, $0c, $06, $ff, $ff

Data_cb39d:
	db $00, $00
	db $00, $01, $00, $c5, $ca, $00, $00, $03, $01, $03, $05, $1f, $01, $18, $00, $70
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c

Func_cb3c6:
	ld hl, $00d7 ; CB3C6 (32:73c6) -> 21 D7 00
	scall PrintTextStandard ; CB3C9 (32:73c9) -> CD 98 44
	ld de, Data_cb406 ; CB3CC (32:73cc) -> 11 06 74
	ld hl, Data_cb39d ; CB3CF (32:73cf) -> 21 9D 73
	scall ScriptedBattle ; CB3D2 (32:73d2) -> CD D3 4D
	or a ; CB3D5 (32:73d5) -> B7
	jp nz, Func_cb3da ; CB3D6 (32:73d6) -> C2 DA 73
	ret  ; CB3D9 (32:73d9) -> C9

Func_cb3da:
	ld hl, $00d8 ; CB3DA (32:73da) -> 21 D8 00
	scall PrintTextStandard ; CB3DD (32:73dd) -> CD 98 44
	ld a, [wPlayerFacing] ; CB3E0 (32:73e0) -> FA 38 C8
	or a ; CB3E3 (32:73e3) -> B7
	jp nz, .asm_cb3f3 ; CB3E4 (32:73e4) -> C2 F3 73
	ld bc, Data_cb393 ; CB3E7 (32:73e7) -> 01 93 73
	ld e, $32 ; CB3EA (32:73ea) -> 1E 32
	xor a ; CB3EC (32:73ec) -> AF
	scall MovePersonAndWait ; CB3ED (32:73ed) -> CD 88 46
	jp .asm_cb3fc ; CB3F0 (32:73f0) -> C3 FC 73
.asm_cb3f3:
	ld bc, Data_cb397 ; CB3F3 (32:73f3) -> 01 97 73
	ld e, $32 ; CB3F6 (32:73f6) -> 1E 32
	xor a ; CB3F8 (32:73f8) -> AF
	scall MovePersonAndWait ; CB3F9 (32:73f9) -> CD 88 46
.asm_cb3fc:
	scall WaitNPCStep ; CB3FC (32:73fc) -> CD 0C 42
	ld e, $00 ; CB3FF (32:73ff) -> 1E 00
	xor a ; CB401 (32:7401) -> AF
	scall SetPersonVisibilityState ; CB402 (32:7402) -> CD 3D 41
	ret  ; CB405 (32:7405) -> C9

Data_cb406:
	dstr "(くﾞんそう)"

Data_cb40e:
IF DEF(SUN)
	db $01
	db $0d, $01, $01, $15, $15, $01, $0d, $01, $0c, $2e, $09, $09, $01, $01, $15, $15
	db $09, $09, $09, $0a, $2e, $12, $08, $01, $01, $15, $15, $12, $08, $12, $09, $2e
	db $01, $0a, $01, $01, $15, $17, $01, $0a, $01, $09, $2e, $0d, $0b, $01, $01, $15
	db $17, $0d, $0b, $0c, $0b, $2e, $12, $0d, $01, $01, $15, $17, $12, $0d, $11, $0d
	db $2e, $32, $06, $0b, $03, $1b, $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18
	db $00, $04, $0a, $00, $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04
	db $09, $00, $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	db $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00, $00, $03
	db $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00, $09, $0c, $0b, $0b
	db $01, $01, $02, $04, $00, $32, $34, $75, $00, $00, $ff, $00, $0b, $09, $01, $02
	db $00, $04, $01, $32, $34, $75, $00, $00, $ff, $00, $0b, $0c, $01, $03, $00, $04
	db $01, $32, $34, $75, $00, $00
ELIF DEF(STAR)
	db $01
	db $0d, $01, $01, $15, $15, $01, $0d, $01, $0c, $2e, $09, $09, $01, $01, $15, $15
	db $09, $09, $09, $0a, $2e, $12, $08, $01, $01, $15, $15, $12, $08, $12, $09, $2e
	db $01, $0a, $01, $01, $15, $17, $01, $0a, $01, $09, $2e, $0d, $0b, $01, $01, $15
	db $17, $0d, $0b, $0c, $0b, $2e, $12, $0d, $01, $01, $15, $17, $12, $0d, $11, $0d
	db $2e, $32, $06, $0b, $03, $1b, $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18
	db $00, $04, $0a, $00, $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e
	db $0a, $00, $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	db $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00, $00, $03
	db $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00, $09, $0c, $0b, $0b
	db $01, $01, $02, $04, $00, $32, $34, $75, $00, $00, $ff, $00, $0b, $09, $01, $02
	db $00, $04, $01, $32, $34, $75, $00, $00, $ff, $00, $0b, $0c, $01, $03, $00, $04
	db $01, $32, $34, $75, $00, $00
ENDC

Func_cb4c5:: ; cb4c5
IF DEF(SUN)
	db $1e, $06, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $50, $74, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $55, $74, $cd, $24, $4d, $21, $ac, $00
	db $cd, $2e, $46, $b7, $c2, $f4, $74, $1e, $03, $21, $9b, $74, $cd, $fb, $40, $3e
	db $07, $cd, $e6, $4e, $cd, $1c, $40, $21, $01, $03, $cd, $72, $4f, $c9, $00, $00
	db $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $20, $17, $17, $17, $71
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c, $0b, $0a, $ff, $ff, $0b, $0c, $ff, $ff, $f5
	db $2e, $ff, $7b, $fe, $02, $ca, $41, $75, $b7, $c2, $80, $75, $fa, $d9, $c2, $c6
	db $04, $fe, $0b, $c2, $50, $75, $2e, $01, $c3, $80, $75, $7b, $fe, $02, $c2, $80
	db $75, $f8, $01, $7e, $fe, $01, $c2, $70, $75, $0e, $01, $11, $2c, $75, $3e, $32
	db $cd, $3e, $46, $3e, $02, $cd, $77, $46, $c3, $7e, $75, $0e, $01, $11, $30, $75
	db $3e, $32, $cd, $3e, $46, $af, $cd, $77, $46, $2e, $01, $7d, $fe, $01, $c2, $04
	db $76, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $af, $cd, $4b, $44, $21, $dd
	db $00, $cd, $98, $44, $11, $06, $76, $21, $03, $75, $cd, $d3, $4d, $b7, $c2, $a9
	db $75, $c3, $04, $76, $21, $de, $00, $cd, $98, $44, $1e, $00, $af, $cd, $95, $40
	db $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd
	db $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02
	db $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41
	db $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $01
	db $21, $ac, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6, $4e, $c1
	db $c9, $28, $b8, $de, $dd, $bf, $b3, $29, $00, $01, $0a, $01, $01, $15, $16, $01
	db $0a, $01, $09, $2e, $0d, $0b, $01, $01, $15, $16, $0d, $0b, $0c, $0b, $2e, $12
	db $0d, $01, $01, $15, $16, $12, $0d, $11, $0d, $2e, $07, $13, $01, $01, $15, $18
	db $07, $13, $07, $12, $2e, $0c, $02, $01, $01, $15, $18, $0c, $02, $0c, $03, $2e
	db $11, $09, $01, $01, $15, $18, $11, $09, $11, $0a, $2e, $33, $0c, $05, $03, $18
	db $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00, $00, $03
	db $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00, $00, $03, $14, $11
	db $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00, $00, $03, $14, $11, $75, $1f
	db $21, $3b, $07, $10, $00, $05, $04, $00, $00, $03, $14, $11, $78, $21, $23, $78
	db $21, $12, $00, $05, $02, $00, $09, $0c, $0e, $03, $01, $01, $02, $04, $00, $32
	db $00, $00, $00, $00, $ff, $00, $0d, $03, $01, $03, $00, $04, $01, $32, $21, $77
	db $00, $00, $ff, $00, $0e, $06, $04, $01, $00, $04, $01, $32, $21, $77, $00, $00
	db $ff, $00, $09, $0a, $02, $02, $00, $04, $00, $32, $09, $78, $00, $00
ELIF DEF(STAR)
	db $1e, $06, $21, $0e, $74, $cd, $3a, $40, $1e, $01, $21, $50, $74, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $55, $74, $cd, $24, $4d, $21, $ac, $00
	db $cd, $2e, $46, $b7, $c2, $f4, $74, $1e, $03, $21, $9b, $74, $cd, $fb, $40, $3e
	db $07, $cd, $e6, $4e, $cd, $1c, $40, $21, $01, $03, $cd, $72, $4f, $c9, $00, $00
	db $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $20, $17, $17, $17, $71
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c, $0b, $0a, $ff, $ff, $0b, $0c, $ff, $ff, $f5
	db $2e, $ff, $7b, $fe, $02, $ca, $41, $75, $b7, $c2, $80, $75, $fa, $d9, $c2, $c6
	db $04, $fe, $0b, $c2, $50, $75, $2e, $01, $c3, $80, $75, $7b, $fe, $02, $c2, $80
	db $75, $f8, $01, $7e, $fe, $01, $c2, $70, $75, $0e, $01, $11, $2c, $75, $3e, $32
	db $cd, $3e, $46, $3e, $02, $cd, $77, $46, $c3, $7e, $75, $0e, $01, $11, $30, $75
	db $3e, $32, $cd, $3e, $46, $af, $cd, $77, $46, $2e, $01, $7d, $fe, $01, $c2, $04
	db $76, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $af, $cd, $4b, $44, $21, $dd
	db $00, $cd, $98, $44, $11, $06, $76, $21, $03, $75, $cd, $d3, $4d, $b7, $c2, $a9
	db $75, $c3, $04, $76, $21, $de, $00, $cd, $98, $44, $1e, $00, $af, $cd, $95, $40
	db $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd
	db $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02
	db $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41
	db $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $01
	db $21, $ac, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6, $4e, $c1
	db $c9, $28, $b8, $de, $dd, $bf, $b3, $29, $00, $01, $0a, $01, $01, $15, $16, $01
	db $0a, $01, $09, $2e, $0d, $0b, $01, $01, $15, $16, $0d, $0b, $0c, $0b, $2e, $12
	db $0d, $01, $01, $15, $16, $12, $0d, $11, $0d, $2e, $07, $13, $01, $01, $15, $18
	db $07, $13, $07, $12, $2e, $0c, $02, $01, $01, $15, $18, $0c, $02, $0c, $03, $2e
	db $11, $09, $01, $01, $15, $18, $11, $09, $11, $0a, $2e, $33, $0c, $05, $03, $18
	db $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00, $00, $03
	db $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00, $00, $03, $14, $11
	db $54, $1e, $20, $46, $20, $12, $00, $0f, $08, $00, $00, $03, $14, $11, $75, $1f
	db $21, $3b, $07, $10, $00, $05, $04, $00, $00, $03, $14, $11, $78, $20, $23, $78
	db $21, $12, $00, $05, $02, $00, $09, $0c, $0e, $03, $01, $01, $02, $04, $00, $32
	db $00, $00, $00, $00, $ff, $00, $0d, $03, $01, $03, $00, $04, $01, $32, $21, $77
	db $00, $00, $ff, $00, $0e, $06, $04, $01, $00, $04, $01, $32, $21, $77, $00, $00
	db $ff, $00, $09, $0a, $02, $02, $00, $04, $00, $32, $09, $78, $00, $00
ENDC

Func_cb6d3:: ; cb6d3
IF DEF(SUN)
	db $1e, $06, $21, $0e, $76, $cd, $3a, $40, $1e, $01, $21, $50, $76, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $55, $76, $cd, $24, $4d, $21, $ad, $00
	db $cd, $2e, $46, $b7, $c2, $02, $77, $1e, $03, $21, $9b, $76, $cd, $fb, $40, $1e
	db $01, $21, $c5, $76, $cd, $fb, $40, $3e, $07, $cd, $e6, $4e, $cd, $1c, $40, $21
	db $02, $03, $cd, $72, $4f, $c9, $0d, $03, $ff, $ff, $0e, $04, $ff, $ff, $f5, $7b
	db $fe, $02, $c2, $74, $77, $21, $ad, $00, $cd, $2e, $46, $b7, $c2, $74, $77, $af
	db $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $f8, $01, $7e, $fe, $01, $c2, $56, $77
	db $0e, $01, $11, $19, $77, $3e, $32, $cd, $3e, $46, $1e, $03, $af, $cd, $95, $40
	db $c3, $60, $77, $0e, $01, $11, $1d, $77, $3e, $32, $cd, $3e, $46, $cd, $a9, $77
	db $1e, $01, $21, $ad, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6
	db $4e, $c1, $c9, $0e, $06, $11, $09, $ff, $ff, $0c, $02, $ff, $ff, $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $20, $26, $12, $00, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $21, $db, $00, $cd, $98, $44, $11, $01, $78, $21
	db $80, $77, $cd, $d3, $4d, $b7, $c2, $bd, $77, $c9, $21, $dc, $00, $cd, $98, $44
	db $fa, $38, $c8, $fe, $01, $c2, $d7, $77, $01, $76, $77, $1e, $32, $af, $cd, $88
	db $46, $c3, $e0, $77, $01, $7c, $77, $1e, $32, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e
	db $02, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6, $4e, $c9, $28, $b8
	db $de, $dd, $bf, $b3, $29, $00, $7b, $b7, $c2, $34, $78, $cd, $e0, $42, $af, $cd
	db $e6, $4e, $3e, $16, $cd, $e6, $4e, $0e, $01, $1e, $02, $3e, $08, $cd, $76, $41
	db $cd, $d5, $41, $cd, $8b, $41, $21, $22, $03, $cd, $98, $44, $3e, $07, $cd, $e6
	db $4e, $c9, $07, $13, $01, $01, $15, $17, $07, $13, $07, $12, $2e, $0c, $02, $01
	db $01, $15, $17, $0c, $02, $0c, $03, $2e, $11, $09, $01, $01, $15, $17, $11, $09
	db $11, $08, $2e, $02, $0d, $01, $01, $15, $19, $02, $0d, $03, $0d, $2e, $34, $0f
	db $06, $02, $35, $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a
	db $00, $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00, $00
	db $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00, $00, $03, $14
	db $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00, $00, $03, $14, $11, $78
	db $21, $23, $78, $21, $12, $00, $05, $02, $00, $09, $0c, $01, $08, $01, $01, $01
	db $04, $00, $32, $00, $00, $00, $00, $ff, $00, $03, $05, $01, $05, $00, $04, $01
	db $32, $1e, $79, $00, $00, $ff, $00, $00, $0a, $03, $01, $00, $04, $01, $32, $1e
	db $79, $00, $00
ELIF DEF(STAR)
	db $1e, $06, $21, $0e, $76, $cd, $3a, $40, $1e, $01, $21, $50, $76, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $55, $76, $cd, $24, $4d, $21, $ad, $00
	db $cd, $2e, $46, $b7, $c2, $02, $77, $1e, $03, $21, $9b, $76, $cd, $fb, $40, $1e
	db $01, $21, $c5, $76, $cd, $fb, $40, $3e, $07, $cd, $e6, $4e, $cd, $1c, $40, $21
	db $02, $03, $cd, $72, $4f, $c9, $0d, $03, $ff, $ff, $0e, $04, $ff, $ff, $f5, $7b
	db $fe, $02, $c2, $74, $77, $21, $ad, $00, $cd, $2e, $46, $b7, $c2, $74, $77, $af
	db $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $f8, $01, $7e, $fe, $01, $c2, $56, $77
	db $0e, $01, $11, $19, $77, $3e, $32, $cd, $3e, $46, $1e, $03, $af, $cd, $95, $40
	db $c3, $60, $77, $0e, $01, $11, $1d, $77, $3e, $32, $cd, $3e, $46, $cd, $a9, $77
	db $1e, $01, $21, $ad, $00, $cd, $1b, $46, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6
	db $4e, $c1, $c9, $0e, $06, $11, $09, $ff, $ff, $0c, $02, $ff, $ff, $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $20, $26, $12, $00, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $21, $db, $00, $cd, $98, $44, $11, $01, $78, $21
	db $80, $77, $cd, $d3, $4d, $b7, $c2, $bd, $77, $c9, $21, $dc, $00, $cd, $98, $44
	db $fa, $38, $c8, $fe, $01, $c2, $d7, $77, $01, $76, $77, $1e, $32, $af, $cd, $88
	db $46, $c3, $e0, $77, $01, $7c, $77, $1e, $32, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $1e, $00, $3e
	db $02, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $07, $cd, $e6, $4e, $c9, $28, $b8
	db $de, $dd, $bf, $b3, $29, $00, $7b, $b7, $c2, $34, $78, $cd, $e0, $42, $af, $cd
	db $e6, $4e, $3e, $16, $cd, $e6, $4e, $0e, $01, $1e, $02, $3e, $08, $cd, $76, $41
	db $cd, $d5, $41, $cd, $8b, $41, $21, $22, $03, $cd, $98, $44, $3e, $07, $cd, $e6
	db $4e, $c9, $07, $13, $01, $01, $15, $17, $07, $13, $07, $12, $2e, $0c, $02, $01
	db $01, $15, $17, $0c, $02, $0c, $03, $2e, $11, $09, $01, $01, $15, $17, $11, $09
	db $11, $08, $2e, $02, $0d, $01, $01, $15, $19, $02, $0d, $03, $0d, $2e, $34, $0f
	db $06, $02, $35, $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a
	db $00, $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00, $00
	db $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00, $00, $03, $14
	db $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00, $00, $03, $14, $11, $78
	db $21, $23, $78, $21, $12, $00, $05, $02, $00, $09, $0c, $01, $08, $01, $01, $01
	db $04, $00, $32, $00, $00, $00, $00, $ff, $00, $03, $05, $01, $05, $00, $04, $01
	db $32, $1e, $79, $00, $00, $ff, $00, $00, $0a, $03, $01, $00, $04, $01, $32, $1e
	db $79, $00, $00
ENDC

Func_cb8d6:: ; cb8d6
IF DEF(SUN)
	db $1e, $04, $21, $35, $78, $cd, $3a, $40, $1e, $01, $21, $61, $78, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $66, $78, $cd, $24, $4d, $21, $ae, $00
	db $cd, $2e, $46, $b7, $c2, $05, $79, $1e, $03, $21, $ac, $78, $cd, $fb, $40, $3e
	db $07, $cd, $e6, $4e, $cd, $1c, $40, $21, $03, $03, $cd, $72, $4f, $c9, $03, $08
	db $02, $08, $ff, $ff, $01, $09, $ff, $ff, $f5, $7b, $fe, $02, $c2, $69, $79, $21
	db $ae, $00, $cd, $2e, $46, $b7, $c2, $69, $79, $af, $cd, $e6, $4e, $3e, $1a, $cd
	db $e6, $4e, $f8, $01, $7e, $fe, $01, $c2, $4d, $79, $0e, $01, $11, $14, $79, $3e
	db $32, $cd, $3e, $46, $c3, $5d, $79, $0e, $01, $11, $1a, $79, $3e, $32, $cd, $3e
	db $46, $1e, $02, $af, $cd, $95, $40, $cd, $9c, $79, $af, $cd, $e6, $4e, $3e, $07
	db $cd, $e6, $4e, $c1, $c9, $01, $0d, $ff, $ff, $02, $0d, $ff, $ff, $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $05, $21, $14, $1e, $1e, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $21, $d5, $00, $cd, $98, $44, $11, $e5, $79, $21
	db $73, $79, $cd, $d3, $4d, $b7, $c2, $b0, $79, $c9, $21, $d6, $00, $cd, $98, $44
	db $1e, $01, $21, $ae, $00, $cd, $1b, $46, $fa, $38, $c8, $fe, $03, $c2, $d2, $79
	db $01, $6b, $79, $1e, $32, $af, $cd, $88, $46, $c3, $db, $79, $01, $6f, $79, $1e
	db $32, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $c9, $28
	db $b8, $de, $dd, $bf, $b3, $29, $00, $02, $0d, $01, $01, $15, $18, $02, $0d, $02
	db $0c, $2e, $35, $0e, $07, $03, $0b, $00, $03, $14, $11, $77, $1c, $1e, $78, $09
	db $18, $00, $04, $0a, $00, $00, $03, $14, $11, $38, $1d, $1f, $19, $0d, $0b, $00
	db $04, $09, $00, $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $10, $08
	db $00, $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00, $00
	db $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00, $20, $0c, $0b
	db $04, $01, $01, $02, $04, $00, $32, $00, $00, $00, $00, $ff, $00, $05, $04, $01
	db $01, $00, $04, $01, $32, $c1, $7a, $00, $00, $ff, $00, $0e, $03, $01, $01, $00
	db $04, $00, $32, $24, $7b, $00, $00
ELIF DEF(STAR)
	db $1e, $04, $21, $35, $78, $cd, $3a, $40, $1e, $01, $21, $61, $78, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $66, $78, $cd, $24, $4d, $21, $ae, $00
	db $cd, $2e, $46, $b7, $c2, $05, $79, $1e, $03, $21, $ac, $78, $cd, $fb, $40, $3e
	db $07, $cd, $e6, $4e, $cd, $1c, $40, $21, $03, $03, $cd, $72, $4f, $c9, $03, $08
	db $02, $08, $ff, $ff, $01, $09, $ff, $ff, $f5, $7b, $fe, $02, $c2, $69, $79, $21
	db $ae, $00, $cd, $2e, $46, $b7, $c2, $69, $79, $af, $cd, $e6, $4e, $3e, $1a, $cd
	db $e6, $4e, $f8, $01, $7e, $fe, $01, $c2, $4d, $79, $0e, $01, $11, $14, $79, $3e
	db $32, $cd, $3e, $46, $c3, $5d, $79, $0e, $01, $11, $1a, $79, $3e, $32, $cd, $3e
	db $46, $1e, $02, $af, $cd, $95, $40, $cd, $9c, $79, $af, $cd, $e6, $4e, $3e, $07
	db $cd, $e6, $4e, $c1, $c9, $01, $0d, $ff, $ff, $02, $0d, $ff, $ff, $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $05, $21, $14, $1e, $1e, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $21, $d5, $00, $cd, $98, $44, $11, $e5, $79, $21
	db $73, $79, $cd, $d3, $4d, $b7, $c2, $b0, $79, $c9, $21, $d6, $00, $cd, $98, $44
	db $1e, $01, $21, $ae, $00, $cd, $1b, $46, $fa, $38, $c8, $fe, $03, $c2, $d2, $79
	db $01, $6b, $79, $1e, $32, $af, $cd, $88, $46, $c3, $db, $79, $01, $6f, $79, $1e
	db $32, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41, $c9, $28
	db $b8, $de, $dd, $bf, $b3, $29, $00, $02, $0d, $01, $01, $15, $18, $02, $0d, $02
	db $0c, $2e, $35, $0e, $07, $03, $0b, $00, $03, $14, $11, $77, $1c, $1e, $78, $09
	db $18, $00, $04, $0a, $00, $00, $03, $14, $11, $1c, $1d, $1f, $77, $1f, $17, $11
	db $0e, $0a, $00, $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $0f, $08
	db $00, $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00, $00
	db $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00, $20, $0c, $0b
	db $04, $01, $01, $02, $04, $00, $32, $00, $00, $00, $00, $ff, $00, $05, $04, $01
	db $01, $00, $04, $01, $32, $c1, $7a, $00, $00, $ff, $00, $0e, $03, $01, $01, $00
	db $04, $00, $32, $24, $7b, $00, $00
ENDC

Func_cba6d:: ; cba6d
	db $1e, $01, $21, $ed, $79, $cd, $3a, $40, $1e, $01, $21, $f8, $79, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $fd, $79, $cd, $24, $4d, $1e, $03, $21
	db $43, $7a, $cd, $fb, $40, $21, $16, $00, $cd, $2e, $46, $fe, $01, $c2, $aa, $7a
	db $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $3e, $07, $cd
	db $e6, $4e, $cd, $1c, $40, $21, $04, $03, $cd, $72, $4f, $c9, $09, $04, $ff, $ff
	db $0e, $04, $ff, $ff, $7b, $fe, $02, $c2, $23, $7b, $21, $16, $00, $cd, $2e, $46
	db $b7, $c2, $23, $7b, $af, $cd, $e6, $4e, $1e, $03, $af, $cd, $95, $40, $0e, $01
	db $11, $b9, $7a, $3e, $32, $cd, $3e, $46, $cd, $0c, $42, $3e, $01, $cd, $e6, $4e
	db $21, $df, $00, $cd, $a9, $44, $01, $bd, $7a, $1e, $32, $af, $cd, $88, $46, $cd
	db $0c, $42, $1e, $00, $af, $cd, $95, $40, $1e, $00, $af, $cd, $3d, $41, $1e, $00
	db $3e, $01, $cd, $3d, $41, $1e, $01, $21, $16, $00, $cd, $1b, $46, $af, $cd, $e6
	db $4e, $3e, $07, $cd, $e6, $4e, $c9, $7b, $b7, $c2, $5e, $7b, $fa, $38, $c8, $b7
	db $ca, $33, $7b, $c3, $5e, $7b, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09
	db $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $2e, $06
	db $e5, $0e, $07, $1e, $00, $3e, $1c, $cd, $ff, $4d, $c1, $21, $1e, $00, $cd, $8f
	db $46, $c9

