INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 27", ROMX
	script_library 27

Data_9d0b4:
	warpdef $11, $1c, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $1b, $0e, $01, $01, MAP_18_01, $03, $0b, $03, $0a, $34
	warpdef $1e, $1a, $01, $01, MAP_18_10, $05, $15, $05, $14, $2e

Data_9d0d5:
IF DEF(SUN)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4d, $20, $25, $39, $2a, $12, $00, $10, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ELIF DEF(STAR)
	wildbot $05, $04, $0e, $2c, $74, $1e, $23, $17, $0d, $09, $0a, $05, $0a, $00
	wildbot $05, $04, $0e, $2c, $4c, $20, $25, $46, $01, $01, $01, $05, $09, $00
	wildbot $05, $04, $0e, $2c, $32, $21, $26, $17, $07, $0c, $00, $11, $08, $00
	wildbot $05, $04, $0e, $2c, $72, $21, $26, $17, $09, $09, $00, $10, $07, $00
ENDC

Data_9d10d:
	dtext_tree_pointer TreeBitstreamText_42df1
	dw -1

Data_9d111:
	dtext_tree_pointer TreeBitstreamText_43c84
	dw -1

Data_9d115:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, Func_9d36b, NULL
	person_event $ff, $00, $0b, $07, $01, $01, $00, $04, $00, Func_9d3a1, NULL
	person_event $ff, $00, $0b, $14, $01, $01, $00, $04, $00, Func_9d3d7, NULL
	person_event $ff, $00, $11, $18, $01, $01, $00, $04, $00, Func_9d42b, NULL
	person_event $ff, $00, $19, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9d10d

Data_9d15b:
	person_event $0f, $04, $1d, $1b, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0a, $0c, $23, $1b, $01, $01, $00, $04, $00, NULL, NULL
	person_event $08, $04, $20, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d185:
	person_event $0a, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_808fc_27, Data_9d111

Data_9d193:
	person_event $06, $04, $1e, $1b, $01, $01, $02, $04, $00, Func_9daea, NULL
	person_event $1d, $04, $1e, $1b, $01, $01, $02, $04, $00, NULL, NULL

Data_9d1af:
	person_event $0f, $04, $1e, $0e, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $1e, $0e, $01, $01, $02, $04, $00, Func_9db30, NULL

Func_9d1cb:: ; 9d1cb
	push bc ; 9D1CB (27:51cb) -> C5
	push bc ; 9D1CC (27:51cc) -> C5
	push bc ; 9D1CD (27:51cd) -> C5
	push bc ; 9D1CE (27:51ce) -> C5
	ld hl, sp+$02 ; 9D1CF (27:51cf) -> F8 02
	scall Func_80f94 ; 9D1D1 (27:51d1) -> CD 94 4F
	ld hl, sp+$05 ; 9D1D4 (27:51d4) -> F8 05
	ld l, [hl] ; 9D1D6 (27:51d6) -> 6E
	ld h, $00 ; 9D1D7 (27:51d7) -> 26 00
	ld de, $003c ; 9D1D9 (27:51d9) -> 11 3C 00
	call MultiplyHLbyDE ; 9D1DC (27:51dc) -> CD 59 37
	push de ; 9D1DF (27:51df) -> D5
	push hl ; 9D1E0 (27:51e0) -> E5
	pop de ; 9D1E1 (27:51e1) -> D1
	pop hl ; 9D1E2 (27:51e2) -> E1
	ld hl, sp+$06 ; 9D1E3 (27:51e3) -> F8 06
	ld l, [hl] ; 9D1E5 (27:51e5) -> 6E
	ld h, $00 ; 9D1E6 (27:51e6) -> 26 00
	add hl, de ; 9D1E8 (27:51e8) -> 19
	pop de ; 9D1E9 (27:51e9) -> D1
	push hl ; 9D1EA (27:51ea) -> E5
	ld a, $0b ; 9D1EB (27:51eb) -> 3E 0B
	ld [wc7e2], a ; 9D1ED (27:51ed) -> EA E2 C7
	ld hl, $00f2 ; 9D1F0 (27:51f0) -> 21 F2 00
	scall CheckEventFlag ; 9D1F3 (27:51f3) -> CD 2E 46
	cp $01 ; 9D1F6 (27:51f6) -> FE 01
	jp nz, .asm_9d203 ; 9D1F8 (27:51f8) -> C2 03 52
	ld a, $06 ; 9D1FB (27:51fb) -> 3E 06
	ld [wc795], a ; 9D1FD (27:51fd) -> EA 95 C7
	jp .asm_9d207 ; 9D200 (27:5200) -> C3 07 52
.asm_9d203:
	xor a ; 9D203 (27:5203) -> AF
	ld [wc795], a ; 9D204 (27:5204) -> EA 95 C7
.asm_9d207:
	call Func_9d344 ; 9D207 (27:5207) -> CD 44 53
	ld hl, Func_9d344 ; 9D20A (27:520a) -> 21 44 53
	scall Func_80f11 ; 9D20D (27:520d) -> CD 11 4F
	ld e, $00 ; 9D210 (27:5210) -> 1E 00
	ld hl, $0010 ; 9D212 (27:5212) -> 21 10 00
	scall EventFlagAction ; 9D215 (27:5215) -> CD 1B 46
	ld e, $03 ; 9D218 (27:5218) -> 1E 03
	ld hl, Data_9d0b4 ; 9D21A (27:521a) -> 21 B4 50
	scall LoadWarps ; 9D21D (27:521d) -> CD 3A 40
	ld a, $03 ; 9D220 (27:5220) -> 3E 03
	scall Func_80d01 ; 9D222 (27:5222) -> CD 01 4D
	ld e, $04 ; 9D225 (27:5225) -> 1E 04
	ld hl, Data_9d0d5 ; 9D227 (27:5227) -> 21 D5 50
	scall LoadEncounters ; 9D22A (27:522a) -> CD 24 4D
	ld a, $03 ; 9D22D (27:522d) -> 3E 03
	scall PlayMusic ; 9D22F (27:522f) -> CD E6 4E
	ld a, $01 ; 9D232 (27:5232) -> 3E 01
	scall LoadPlayerSprite ; 9D234 (27:5234) -> CD C6 4C
	ld e, $02 ; 9D237 (27:5237) -> 1E 02
	ld hl, Data_9d1af ; 9D239 (27:5239) -> 21 AF 51
	scall LoadMapObjects ; 9D23C (27:523c) -> CD FB 40
	ld e, $00 ; 9D23F (27:523f) -> 1E 00
	xor a ; 9D241 (27:5241) -> AF
	scall SetPersonVisibilityState ; 9D242 (27:5242) -> CD 3D 41
	ld a, [wBackupMapGroup] ; 9D245 (27:5245) -> FA DF C7
	cp $12 ; 9D248 (27:5248) -> FE 12
	jp nz, .asm_9d255 ; 9D24A (27:524a) -> C2 55 52
	ld a, [wBackupMapNumber] ; 9D24D (27:524d) -> FA E0 C7
	cp $01 ; 9D250 (27:5250) -> FE 01
	jp z, .asm_9d25d ; 9D252 (27:5252) -> CA 5D 52
.asm_9d255:
	ld a, [wBackupMapGroup] ; 9D255 (27:5255) -> FA DF C7
	cp $ff ; 9D258 (27:5258) -> FE FF
	jp nz, .asm_9d2ab ; 9D25A (27:525a) -> C2 AB 52
.asm_9d25d:
	ld hl, $00b9 ; 9D25D (27:525d) -> 21 B9 00
	scall CheckEventFlag ; 9D260 (27:5260) -> CD 2E 46
	cp $01 ; 9D263 (27:5263) -> FE 01
	jp nz, .asm_9d29d ; 9D265 (27:5265) -> C2 9D 52
	ld e, $02 ; 9D268 (27:5268) -> 1E 02
	ld hl, Data_9d193 ; 9D26A (27:526a) -> 21 93 51
	scall LoadMapObjects ; 9D26D (27:526d) -> CD FB 40
	pop hl ; 9D270 (27:5270) -> E1
	push hl ; 9D271 (27:5271) -> E5
	ld de, $0438 ; 9D272 (27:5272) -> 11 38 04
	call CompareHLtoDE ; 9D275 (27:5275) -> CD 08 36
	jp c, .asm_9d290 ; 9D278 (27:5278) -> DA 90 52
	pop hl ; 9D27B (27:527b) -> E1
	push hl ; 9D27C (27:527c) -> E5
	ld de, $04b0 ; 9D27D (27:527d) -> 11 B0 04
	call CompareHLtoDE ; 9D280 (27:5280) -> CD 08 36
	jp nc, .asm_9d290 ; 9D283 (27:5283) -> D2 90 52
	ld e, $00 ; 9D286 (27:5286) -> 1E 00
	ld a, $03 ; 9D288 (27:5288) -> 3E 03
	scall SetPersonVisibilityState ; 9D28A (27:528a) -> CD 3D 41
	jp .asm_9d297 ; 9D28D (27:528d) -> C3 97 52
.asm_9d290:
	ld e, $00 ; 9D290 (27:5290) -> 1E 00
	ld a, $02 ; 9D292 (27:5292) -> 3E 02
	scall SetPersonVisibilityState ; 9D294 (27:5294) -> CD 3D 41
.asm_9d297:
	scall Func_8001c ; 9D297 (27:5297) -> CD 1C 40
	jp .asm_9d2a8 ; 9D29A (27:529a) -> C3 A8 52
.asm_9d29d:
	ld e, $01 ; 9D29D (27:529d) -> 1E 01
	ld hl, Data_9d185 ; 9D29F (27:529f) -> 21 85 51
	scall LoadMapObjects ; 9D2A2 (27:52a2) -> CD FB 40
	scall Func_8001c ; 9D2A5 (27:52a5) -> CD 1C 40
.asm_9d2a8:
	jp .asm_9d31f ; 9D2A8 (27:52a8) -> C3 1F 53
.asm_9d2ab:
	ld a, [wBackupMapGroup] ; 9D2AB (27:52ab) -> FA DF C7
	cp $12 ; 9D2AE (27:52ae) -> FE 12
	jp nz, .asm_9d31c ; 9D2B0 (27:52b0) -> C2 1C 53
	ld a, [wBackupMapNumber] ; 9D2B3 (27:52b3) -> FA E0 C7
	cp $11 ; 9D2B6 (27:52b6) -> FE 11
	jp nz, .asm_9d31c ; 9D2B8 (27:52b8) -> C2 1C 53
	ld hl, $00bb ; 9D2BB (27:52bb) -> 21 BB 00
	scall CheckEventFlag ; 9D2BE (27:52be) -> CD 2E 46
	or a ; 9D2C1 (27:52c1) -> B7
	jp z, .asm_9d2ed ; 9D2C2 (27:52c2) -> CA ED 52
	ld hl, $00bc ; 9D2C5 (27:52c5) -> 21 BC 00
	scall CheckEventFlag ; 9D2C8 (27:52c8) -> CD 2E 46
	or a ; 9D2CB (27:52cb) -> B7
	jp z, .asm_9d2ed ; 9D2CC (27:52cc) -> CA ED 52
	ld hl, $00bd ; 9D2CF (27:52cf) -> 21 BD 00
	scall CheckEventFlag ; 9D2D2 (27:52d2) -> CD 2E 46
	or a ; 9D2D5 (27:52d5) -> B7
	jp z, .asm_9d2ed ; 9D2D6 (27:52d6) -> CA ED 52
	ld hl, $00be ; 9D2D9 (27:52d9) -> 21 BE 00
	scall CheckEventFlag ; 9D2DC (27:52dc) -> CD 2E 46
	or a ; 9D2DF (27:52df) -> B7
	jp z, .asm_9d2ed ; 9D2E0 (27:52e0) -> CA ED 52
	ld hl, $00ee ; 9D2E3 (27:52e3) -> 21 EE 00
	scall CheckEventFlag ; 9D2E6 (27:52e6) -> CD 2E 46
	or a ; 9D2E9 (27:52e9) -> B7
	jp nz, .asm_9d316 ; 9D2EA (27:52ea) -> C2 16 53
.asm_9d2ed:
	ld e, $03 ; 9D2ED (27:52ed) -> 1E 03
	ld hl, Data_9d15b ; 9D2EF (27:52ef) -> 21 5B 51
	scall LoadMapObjects ; 9D2F2 (27:52f2) -> CD FB 40
	ld e, $00 ; 9D2F5 (27:52f5) -> 1E 00
	ld a, $02 ; 9D2F7 (27:52f7) -> 3E 02
	scall SetPersonVisibilityState ; 9D2F9 (27:52f9) -> CD 3D 41
	ld e, $00 ; 9D2FC (27:52fc) -> 1E 00
	ld a, $04 ; 9D2FE (27:52fe) -> 3E 04
	scall SetPersonVisibilityState ; 9D300 (27:5300) -> CD 3D 41
	ld a, $12 ; 9D303 (27:5303) -> 3E 12
	ld [wBackupMapGroup], a ; 9D305 (27:5305) -> EA DF C7
	ld a, $0a ; 9D308 (27:5308) -> 3E 0A
	ld [wBackupMapNumber], a ; 9D30A (27:530a) -> EA E0 C7
	scall Func_8001c ; 9D30D (27:530d) -> CD 1C 40
	call Func_9d4a7 ; 9D310 (27:5310) -> CD A7 54
	jp .asm_9d319 ; 9D313 (27:5313) -> C3 19 53
.asm_9d316:
	scall Func_8001c ; 9D316 (27:5316) -> CD 1C 40
.asm_9d319:
	jp .asm_9d31f ; 9D319 (27:5319) -> C3 1F 53
.asm_9d31c:
	scall Func_8001c ; 9D31C (27:531c) -> CD 1C 40
.asm_9d31f:
	ld e, $05 ; 9D31F (27:531f) -> 1E 05
	ld hl, Data_9d115 ; 9D321 (27:5321) -> 21 15 51
	scall LoadMapObjects ; 9D324 (27:5324) -> CD FB 40
	pop bc ; 9D327 (27:5327) -> C1
	pop bc ; 9D328 (27:5328) -> C1
	pop bc ; 9D329 (27:5329) -> C1
	pop bc ; 9D32A (27:532a) -> C1
	ret  ; 9D32B (27:532b) -> C9

Data_9d32c:
	db $00, $00, $01, $01, $17, $09

Data_9d332:
	db $00, $00, $01, $01, $17, $14

Data_9d338:
	db $06, $04, $01, $01, $17, $09

Data_9d33e:
	db $06, $04, $01, $01, $17, $14

Func_9d344:
	ld a, [wc795] ; 9D344 (27:5344) -> FA 95 C7
	cp $06 ; 9D347 (27:5347) -> FE 06
	jp z, .asm_9d35b ; 9D349 (27:5349) -> CA 5B 53
	ld hl, Data_9d32c ; 9D34C (27:534c) -> 21 2C 53
	scall Func_80d9b ; 9D34F (27:534f) -> CD 9B 4D
	ld hl, Data_9d332 ; 9D352 (27:5352) -> 21 32 53
	scall Func_80d9b ; 9D355 (27:5355) -> CD 9B 4D
	jp .asm_9d367 ; 9D358 (27:5358) -> C3 67 53
.asm_9d35b:
	ld hl, Data_9d338 ; 9D35B (27:535b) -> 21 38 53
	scall Func_80d9b ; 9D35E (27:535e) -> CD 9B 4D
	ld hl, Data_9d33e ; 9D361 (27:5361) -> 21 3E 53
	scall Func_80d9b ; 9D364 (27:5364) -> CD 9B 4D
.asm_9d367:
	scall Func_80f02 ; 9D367 (27:5367) -> CD 02 4F
	ret  ; 9D36A (27:536a) -> C9

Func_9d36b:
	ld a, e ; 9D36B (27:536b) -> 7B
	or a ; 9D36C (27:536c) -> B7
	jp nz, .asm_9d3a0 ; 9D36D (27:536d) -> C2 A0 53
	ld a, [wc795] ; 9D370 (27:5370) -> FA 95 C7
	cp $06 ; 9D373 (27:5373) -> FE 06
	jp z, .asm_9d3a0 ; 9D375 (27:5375) -> CA A0 53
	ld a, [wc795] ; 9D378 (27:5378) -> FA 95 C7
	cp $03 ; 9D37B (27:537b) -> FE 03
	jp z, .asm_9d388 ; 9D37D (27:537d) -> CA 88 53
	ld a, [wc795] ; 9D380 (27:5380) -> FA 95 C7
	cp $04 ; 9D383 (27:5383) -> FE 04
	jp nz, .asm_9d396 ; 9D385 (27:5385) -> C2 96 53
.asm_9d388:
	ld a, $04 ; 9D388 (27:5388) -> 3E 04
	ld [wc795], a ; 9D38A (27:538a) -> EA 95 C7
	ld hl, $0198 ; 9D38D (27:538d) -> 21 98 01
	scall PrintTextStandard ; 9D390 (27:5390) -> CD 98 44
	jp .asm_9d3a0 ; 9D393 (27:5393) -> C3 A0 53
.asm_9d396:
	xor a ; 9D396 (27:5396) -> AF
	ld [wc795], a ; 9D397 (27:5397) -> EA 95 C7
	ld hl, $0361 ; 9D39A (27:539a) -> 21 61 03
	scall PrintTextStandard ; 9D39D (27:539d) -> CD 98 44
.asm_9d3a0:
	ret  ; 9D3A0 (27:53a0) -> C9

Func_9d3a1:
	ld a, e ; 9D3A1 (27:53a1) -> 7B
	or a ; 9D3A2 (27:53a2) -> B7
	jp nz, .asm_9d3d6 ; 9D3A3 (27:53a3) -> C2 D6 53
	ld a, [wc795] ; 9D3A6 (27:53a6) -> FA 95 C7
	cp $06 ; 9D3A9 (27:53a9) -> FE 06
	jp z, .asm_9d3d6 ; 9D3AB (27:53ab) -> CA D6 53
	ld a, [wc795] ; 9D3AE (27:53ae) -> FA 95 C7
	cp $02 ; 9D3B1 (27:53b1) -> FE 02
	jp z, .asm_9d3be ; 9D3B3 (27:53b3) -> CA BE 53
	ld a, [wc795] ; 9D3B6 (27:53b6) -> FA 95 C7
	cp $03 ; 9D3B9 (27:53b9) -> FE 03
	jp nz, .asm_9d3cc ; 9D3BB (27:53bb) -> C2 CC 53
.asm_9d3be:
	ld a, $03 ; 9D3BE (27:53be) -> 3E 03
	ld [wc795], a ; 9D3C0 (27:53c0) -> EA 95 C7
	ld hl, $045a ; 9D3C3 (27:53c3) -> 21 5A 04
	scall PrintTextStandard ; 9D3C6 (27:53c6) -> CD 98 44
	jp .asm_9d3d6 ; 9D3C9 (27:53c9) -> C3 D6 53
.asm_9d3cc:
	xor a ; 9D3CC (27:53cc) -> AF
	ld [wc795], a ; 9D3CD (27:53cd) -> EA 95 C7
	ld hl, $0361 ; 9D3D0 (27:53d0) -> 21 61 03
	scall PrintTextStandard ; 9D3D3 (27:53d3) -> CD 98 44
.asm_9d3d6:
	ret  ; 9D3D6 (27:53d6) -> C9

Func_9d3d7:
	ld a, e ; 9D3D7 (27:53d7) -> 7B
	or a ; 9D3D8 (27:53d8) -> B7
	jp nz, .asm_9d42a ; 9D3D9 (27:53d9) -> C2 2A 54
	ld a, [wc795] ; 9D3DC (27:53dc) -> FA 95 C7
	cp $06 ; 9D3DF (27:53df) -> FE 06
	jp z, .asm_9d42a ; 9D3E1 (27:53e1) -> CA 2A 54
	ld a, [wc795] ; 9D3E4 (27:53e4) -> FA 95 C7
	cp $01 ; 9D3E7 (27:53e7) -> FE 01
	jp z, .asm_9d3f4 ; 9D3E9 (27:53e9) -> CA F4 53
	ld a, [wc795] ; 9D3EC (27:53ec) -> FA 95 C7
	cp $02 ; 9D3EF (27:53ef) -> FE 02
	jp nz, .asm_9d402 ; 9D3F1 (27:53f1) -> C2 02 54
.asm_9d3f4:
	ld a, $02 ; 9D3F4 (27:53f4) -> 3E 02
	ld [wc795], a ; 9D3F6 (27:53f6) -> EA 95 C7
	ld hl, $035f ; 9D3F9 (27:53f9) -> 21 5F 03
	scall PrintTextStandard ; 9D3FC (27:53fc) -> CD 98 44
	jp .asm_9d42a ; 9D3FF (27:53ff) -> C3 2A 54
.asm_9d402:
	ld a, [wc795] ; 9D402 (27:5402) -> FA 95 C7
	cp $04 ; 9D405 (27:5405) -> FE 04
	jp z, .asm_9d412 ; 9D407 (27:5407) -> CA 12 54
	ld a, [wc795] ; 9D40A (27:540a) -> FA 95 C7
	cp $05 ; 9D40D (27:540d) -> FE 05
	jp nz, .asm_9d420 ; 9D40F (27:540f) -> C2 20 54
.asm_9d412:
	ld a, $05 ; 9D412 (27:5412) -> 3E 05
	ld [wc795], a ; 9D414 (27:5414) -> EA 95 C7
	ld hl, $0459 ; 9D417 (27:5417) -> 21 59 04
	scall PrintTextStandard ; 9D41A (27:541a) -> CD 98 44
	jp .asm_9d42a ; 9D41D (27:541d) -> C3 2A 54
.asm_9d420:
	xor a ; 9D420 (27:5420) -> AF
	ld [wc795], a ; 9D421 (27:5421) -> EA 95 C7
	ld hl, $0361 ; 9D424 (27:5424) -> 21 61 03
	scall PrintTextStandard ; 9D427 (27:5427) -> CD 98 44
.asm_9d42a:
	ret  ; 9D42A (27:542a) -> C9

Func_9d42b:
	ld a, e ; 9D42B (27:542b) -> 7B
	or a ; 9D42C (27:542c) -> B7
	jp nz, .asm_9d4a2 ; 9D42D (27:542d) -> C2 A2 54
	ld a, [wc795] ; 9D430 (27:5430) -> FA 95 C7
	cp $06 ; 9D433 (27:5433) -> FE 06
	jp z, .asm_9d49c ; 9D435 (27:5435) -> CA 9C 54
	ld a, [wc795] ; 9D438 (27:5438) -> FA 95 C7
	or a ; 9D43B (27:543b) -> B7
	jp z, .asm_9d447 ; 9D43C (27:543c) -> CA 47 54
	ld a, [wc795] ; 9D43F (27:543f) -> FA 95 C7
	cp $01 ; 9D442 (27:5442) -> FE 01
	jp nz, .asm_9d455 ; 9D444 (27:5444) -> C2 55 54
.asm_9d447:
	ld a, $01 ; 9D447 (27:5447) -> 3E 01
	ld [wc795], a ; 9D449 (27:5449) -> EA 95 C7
	ld hl, $035d ; 9D44C (27:544c) -> 21 5D 03
	scall PrintTextStandard ; 9D44F (27:544f) -> CD 98 44
	jp .asm_9d499 ; 9D452 (27:5452) -> C3 99 54
.asm_9d455:
	ld a, [wc795] ; 9D455 (27:5455) -> FA 95 C7
	cp $05 ; 9D458 (27:5458) -> FE 05
	jp nz, .asm_9d48e ; 9D45A (27:545a) -> C2 8E 54
	ld a, $06 ; 9D45D (27:545d) -> 3E 06
	ld [wc795], a ; 9D45F (27:545f) -> EA 95 C7
	ld hl, $035e ; 9D462 (27:5462) -> 21 5E 03
	scall PrintTextStandard ; 9D465 (27:5465) -> CD 98 44
	ld hl, $003c ; 9D468 (27:5468) -> 21 3C 00
	scall ScriptSleep ; 9D46B (27:546b) -> CD 8F 46
	scall StartShakingScreen ; 9D46E (27:546e) -> CD A2 4E
	ld hl, $0078 ; 9D471 (27:5471) -> 21 78 00
	scall ScriptSleep ; 9D474 (27:5474) -> CD 8F 46
	ld hl, $0360 ; 9D477 (27:5477) -> 21 60 03
	scall PrintTextStandard ; 9D47A (27:547a) -> CD 98 44
	scall StopShakingScreen ; 9D47D (27:547d) -> CD B1 4E
	call Func_9d344 ; 9D480 (27:5480) -> CD 44 53
	ld e, $01 ; 9D483 (27:5483) -> 1E 01
	ld hl, $00f2 ; 9D485 (27:5485) -> 21 F2 00
	scall EventFlagAction ; 9D488 (27:5488) -> CD 1B 46
	jp .asm_9d499 ; 9D48B (27:548b) -> C3 99 54
.asm_9d48e:
	ld a, $01 ; 9D48E (27:548e) -> 3E 01
	ld [wc795], a ; 9D490 (27:5490) -> EA 95 C7
	ld hl, $0361 ; 9D493 (27:5493) -> 21 61 03
	scall PrintTextStandard ; 9D496 (27:5496) -> CD 98 44
.asm_9d499:
	jp .asm_9d4a2 ; 9D499 (27:5499) -> C3 A2 54
.asm_9d49c:
	ld hl, $0284 ; 9D49C (27:549c) -> 21 84 02
	scall PrintTextStandard ; 9D49F (27:549f) -> CD 98 44
.asm_9d4a2:
	ret  ; 9D4A2 (27:54a2) -> C9

Data_9d4a3:
	db $21, $1b, $ff, $ff

Func_9d4a7:
	ld hl, $001e ; 9D4A7 (27:54a7) -> 21 1E 00
	scall ScriptSleep ; 9D4AA (27:54aa) -> CD 8F 46
	ld hl, $03b2 ; 9D4AD (27:54ad) -> 21 B2 03
	scall PrintTextWithNPCName ; 9D4B0 (27:54b0) -> CD A9 44
	ld a, $67 ; 9D4B3 (27:54b3) -> 3E 67
	scall PlaySFX ; 9D4B5 (27:54b5) -> CD FE 4E
	ld c, $01 ; 9D4B8 (27:54b8) -> 0E 01
	ld e, $01 ; 9D4BA (27:54ba) -> 1E 01
	ld a, $2a ; 9D4BC (27:54bc) -> 3E 2A
	scall LoadEmote ; 9D4BE (27:54be) -> CD 76 41
	xor a ; 9D4C1 (27:54c1) -> AF
	scall Func_80653 ; 9D4C2 (27:54c2) -> CD 53 46
	scall WaitEmote ; 9D4C5 (27:54c5) -> CD D5 41
	ld a, $01 ; 9D4C8 (27:54c8) -> 3E 01
	scall Func_80653 ; 9D4CA (27:54ca) -> CD 53 46
	ld e, $01 ; 9D4CD (27:54cd) -> 1E 01
	ld a, $02 ; 9D4CF (27:54cf) -> 3E 02
	scall SetPersonVisibilityState ; 9D4D1 (27:54d1) -> CD 3D 41
	scall HideEmote ; 9D4D4 (27:54d4) -> CD 8B 41
	ld hl, $003c ; 9D4D7 (27:54d7) -> 21 3C 00
	scall ScriptSleep ; 9D4DA (27:54da) -> CD 8F 46
	ld bc, Data_9d4a3 ; 9D4DD (27:54dd) -> 01 A3 54
	ld e, $27 ; 9D4E0 (27:54e0) -> 1E 27
	ld a, $03 ; 9D4E2 (27:54e2) -> 3E 03
	scall MovePerson ; 9D4E4 (27:54e4) -> CD F7 41
	ld a, $01 ; 9D4E7 (27:54e7) -> 3E 01
	scall PlayerFace ; 9D4E9 (27:54e9) -> CD 77 46
	scall WaitNPCStep ; 9D4EC (27:54ec) -> CD 0C 42
	ld hl, $001e ; 9D4EF (27:54ef) -> 21 1E 00
	scall ScriptSleep ; 9D4F2 (27:54f2) -> CD 8F 46
	ld hl, $00bb ; 9D4F5 (27:54f5) -> 21 BB 00
	scall CheckEventFlag ; 9D4F8 (27:54f8) -> CD 2E 46
	or a ; 9D4FB (27:54fb) -> B7
	jp nz, .asm_9d50d ; 9D4FC (27:54fc) -> C2 0D 55
	call Func_9d56e ; 9D4FF (27:54ff) -> CD 6E 55
	ld e, $01 ; 9D502 (27:5502) -> 1E 01
	ld hl, $00bb ; 9D504 (27:5504) -> 21 BB 00
	scall EventFlagAction ; 9D507 (27:5507) -> CD 1B 46
	jp .asm_9d56a ; 9D50A (27:550a) -> C3 6A 55
.asm_9d50d:
	ld hl, $00bc ; 9D50D (27:550d) -> 21 BC 00
	scall CheckEventFlag ; 9D510 (27:5510) -> CD 2E 46
	or a ; 9D513 (27:5513) -> B7
	jp nz, .asm_9d525 ; 9D514 (27:5514) -> C2 25 55
	call Func_9d61e ; 9D517 (27:5517) -> CD 1E 56
	ld e, $01 ; 9D51A (27:551a) -> 1E 01
	ld hl, $00bc ; 9D51C (27:551c) -> 21 BC 00
	scall EventFlagAction ; 9D51F (27:551f) -> CD 1B 46
	jp .asm_9d56a ; 9D522 (27:5522) -> C3 6A 55
.asm_9d525:
	ld hl, $00bd ; 9D525 (27:5525) -> 21 BD 00
	scall CheckEventFlag ; 9D528 (27:5528) -> CD 2E 46
	or a ; 9D52B (27:552b) -> B7
	jp nz, .asm_9d53d ; 9D52C (27:552c) -> C2 3D 55
	call Func_9d6ce ; 9D52F (27:552f) -> CD CE 56
	ld e, $01 ; 9D532 (27:5532) -> 1E 01
	ld hl, $00bd ; 9D534 (27:5534) -> 21 BD 00
	scall EventFlagAction ; 9D537 (27:5537) -> CD 1B 46
	jp .asm_9d56a ; 9D53A (27:553a) -> C3 6A 55
.asm_9d53d:
	ld hl, $00be ; 9D53D (27:553d) -> 21 BE 00
	scall CheckEventFlag ; 9D540 (27:5540) -> CD 2E 46
	or a ; 9D543 (27:5543) -> B7
	jp nz, .asm_9d555 ; 9D544 (27:5544) -> C2 55 55
	call Func_9d77e ; 9D547 (27:5547) -> CD 7E 57
	ld e, $01 ; 9D54A (27:554a) -> 1E 01
	ld hl, $00be ; 9D54C (27:554c) -> 21 BE 00
	scall EventFlagAction ; 9D54F (27:554f) -> CD 1B 46
	jp .asm_9d56a ; 9D552 (27:5552) -> C3 6A 55
.asm_9d555:
	ld hl, $00ee ; 9D555 (27:5555) -> 21 EE 00
	scall CheckEventFlag ; 9D558 (27:5558) -> CD 2E 46
	or a ; 9D55B (27:555b) -> B7
	jp nz, .asm_9d56a ; 9D55C (27:555c) -> C2 6A 55
	call Func_9d83b ; 9D55F (27:555f) -> CD 3B 58
	ld e, $01 ; 9D562 (27:5562) -> 1E 01
	ld hl, $00ee ; 9D564 (27:5564) -> 21 EE 00
	scall EventFlagAction ; 9D567 (27:5567) -> CD 1B 46
.asm_9d56a:
	call Func_9d8fa ; 9D56A (27:556a) -> CD FA 58
	ret  ; 9D56D (27:556d) -> C9

Func_9d56e:
	ld hl, $0272 ; 9D56E (27:556e) -> 21 72 02
	scall PrintTextWithNPCName ; 9D571 (27:5571) -> CD A9 44
	ld e, $01 ; 9D574 (27:5574) -> 1E 01
	ld a, $02 ; 9D576 (27:5576) -> 3E 02
	scall SpriteFace ; 9D578 (27:5578) -> CD 95 40
	ld hl, $001e ; 9D57B (27:557b) -> 21 1E 00
	scall ScriptSleep ; 9D57E (27:557e) -> CD 8F 46
	ld hl, $0273 ; 9D581 (27:5581) -> 21 73 02
	scall PrintTextWithNPCName ; 9D584 (27:5584) -> CD A9 44
	ld a, $59 ; 9D587 (27:5587) -> 3E 59
	scall PlaySFX ; 9D589 (27:5589) -> CD FE 4E
	ld c, $01 ; 9D58C (27:558c) -> 0E 01
	ld e, $01 ; 9D58E (27:558e) -> 1E 01
	ld a, $22 ; 9D590 (27:5590) -> 3E 22
	scall LoadEmote ; 9D592 (27:5592) -> CD 76 41
	ld e, $00 ; 9D595 (27:5595) -> 1E 00
	ld a, $02 ; 9D597 (27:5597) -> 3E 02
	scall SetPersonVisibilityState ; 9D599 (27:5599) -> CD 3D 41
	scall WaitEmote ; 9D59C (27:559c) -> CD D5 41
	ld c, $1b ; 9D59F (27:559f) -> 0E 1B
	ld e, $20 ; 9D5A1 (27:55a1) -> 1E 20
	ld a, $02 ; 9D5A3 (27:55a3) -> 3E 02
	scall Func_80080 ; 9D5A5 (27:55a5) -> CD 80 40
	ld e, $01 ; 9D5A8 (27:55a8) -> 1E 01
	ld a, $02 ; 9D5AA (27:55aa) -> 3E 02
	scall SetPersonVisibilityState ; 9D5AC (27:55ac) -> CD 3D 41
	scall HideEmote ; 9D5AF (27:55af) -> CD 8B 41
	ld hl, $001e ; 9D5B2 (27:55b2) -> 21 1E 00
	scall ScriptSleep ; 9D5B5 (27:55b5) -> CD 8F 46
	ld e, $02 ; 9D5B8 (27:55b8) -> 1E 02
	ld a, $02 ; 9D5BA (27:55ba) -> 3E 02
	scall SpriteFace ; 9D5BC (27:55bc) -> CD 95 40
	ld hl, $001e ; 9D5BF (27:55bf) -> 21 1E 00
	scall ScriptSleep ; 9D5C2 (27:55c2) -> CD 8F 46
	xor a ; 9D5C5 (27:55c5) -> AF
	scall PlayMusic ; 9D5C6 (27:55c6) -> CD E6 4E
	ld a, $19 ; 9D5C9 (27:55c9) -> 3E 19
	scall PlayMusic ; 9D5CB (27:55cb) -> CD E6 4E
	ld c, $01 ; 9D5CE (27:55ce) -> 0E 01
	ld e, $06 ; 9D5D0 (27:55d0) -> 1E 06
	ld a, $22 ; 9D5D2 (27:55d2) -> 3E 22
	scall LoadEmote ; 9D5D4 (27:55d4) -> CD 76 41
	ld e, $00 ; 9D5D7 (27:55d7) -> 1E 00
	ld a, $02 ; 9D5D9 (27:55d9) -> 3E 02
	scall SetPersonVisibilityState ; 9D5DB (27:55db) -> CD 3D 41
	scall WaitEmote ; 9D5DE (27:55de) -> CD D5 41
	ld e, $01 ; 9D5E1 (27:55e1) -> 1E 01
	ld a, $02 ; 9D5E3 (27:55e3) -> 3E 02
	scall SetPersonVisibilityState ; 9D5E5 (27:55e5) -> CD 3D 41
	scall HideEmote ; 9D5E8 (27:55e8) -> CD 8B 41
	ld e, $01 ; 9D5EB (27:55eb) -> 1E 01
	ld a, $02 ; 9D5ED (27:55ed) -> 3E 02
	scall SpriteFace ; 9D5EF (27:55ef) -> CD 95 40
	ld hl, $001e ; 9D5F2 (27:55f2) -> 21 1E 00
	scall ScriptSleep ; 9D5F5 (27:55f5) -> CD 8F 46
	ld hl, $0274 ; 9D5F8 (27:55f8) -> 21 74 02
	scall PrintTextWithNPCName ; 9D5FB (27:55fb) -> CD A9 44
	xor a ; 9D5FE (27:55fe) -> AF
	scall PlayMusic ; 9D5FF (27:55ff) -> CD E6 4E
	ld a, $03 ; 9D602 (27:5602) -> 3E 03
	scall PlayMusic ; 9D604 (27:5604) -> CD E6 4E
	ld a, $68 ; 9D607 (27:5607) -> 3E 68
	scall PlaySFX ; 9D609 (27:5609) -> CD FE 4E
	ld hl, $002d ; 9D60C (27:560c) -> 21 2D 00
	scall ScriptSleep ; 9D60F (27:560f) -> CD 8F 46
	ld a, $68 ; 9D612 (27:5612) -> 3E 68
	scall PlaySFX ; 9D614 (27:5614) -> CD FE 4E
	ld hl, $0275 ; 9D617 (27:5617) -> 21 75 02
	scall PrintTextWithNPCName ; 9D61A (27:561a) -> CD A9 44
	ret  ; 9D61D (27:561d) -> C9

Func_9d61e:
	ld hl, $0277 ; 9D61E (27:561e) -> 21 77 02
	scall PrintTextWithNPCName ; 9D621 (27:5621) -> CD A9 44
	ld e, $01 ; 9D624 (27:5624) -> 1E 01
	ld a, $02 ; 9D626 (27:5626) -> 3E 02
	scall SpriteFace ; 9D628 (27:5628) -> CD 95 40
	ld hl, $001e ; 9D62B (27:562b) -> 21 1E 00
	scall ScriptSleep ; 9D62E (27:562e) -> CD 8F 46
	ld hl, $0273 ; 9D631 (27:5631) -> 21 73 02
	scall PrintTextWithNPCName ; 9D634 (27:5634) -> CD A9 44
	ld a, $59 ; 9D637 (27:5637) -> 3E 59
	scall PlaySFX ; 9D639 (27:5639) -> CD FE 4E
	ld c, $01 ; 9D63C (27:563c) -> 0E 01
	ld e, $01 ; 9D63E (27:563e) -> 1E 01
	ld a, $22 ; 9D640 (27:5640) -> 3E 22
	scall LoadEmote ; 9D642 (27:5642) -> CD 76 41
	ld e, $00 ; 9D645 (27:5645) -> 1E 00
	ld a, $02 ; 9D647 (27:5647) -> 3E 02
	scall SetPersonVisibilityState ; 9D649 (27:5649) -> CD 3D 41
	scall WaitEmote ; 9D64C (27:564c) -> CD D5 41
	ld c, $1b ; 9D64F (27:564f) -> 0E 1B
	ld e, $20 ; 9D651 (27:5651) -> 1E 20
	ld a, $02 ; 9D653 (27:5653) -> 3E 02
	scall Func_80080 ; 9D655 (27:5655) -> CD 80 40
	ld e, $01 ; 9D658 (27:5658) -> 1E 01
	ld a, $02 ; 9D65A (27:565a) -> 3E 02
	scall SetPersonVisibilityState ; 9D65C (27:565c) -> CD 3D 41
	scall HideEmote ; 9D65F (27:565f) -> CD 8B 41
	ld hl, $001e ; 9D662 (27:5662) -> 21 1E 00
	scall ScriptSleep ; 9D665 (27:5665) -> CD 8F 46
	ld e, $02 ; 9D668 (27:5668) -> 1E 02
	ld a, $02 ; 9D66A (27:566a) -> 3E 02
	scall SpriteFace ; 9D66C (27:566c) -> CD 95 40
	ld hl, $001e ; 9D66F (27:566f) -> 21 1E 00
	scall ScriptSleep ; 9D672 (27:5672) -> CD 8F 46
	xor a ; 9D675 (27:5675) -> AF
	scall PlayMusic ; 9D676 (27:5676) -> CD E6 4E
	ld a, $19 ; 9D679 (27:5679) -> 3E 19
	scall PlayMusic ; 9D67B (27:567b) -> CD E6 4E
	ld c, $01 ; 9D67E (27:567e) -> 0E 01
	ld e, $18 ; 9D680 (27:5680) -> 1E 18
	ld a, $22 ; 9D682 (27:5682) -> 3E 22
	scall LoadEmote ; 9D684 (27:5684) -> CD 76 41
	ld e, $00 ; 9D687 (27:5687) -> 1E 00
	ld a, $02 ; 9D689 (27:5689) -> 3E 02
	scall SetPersonVisibilityState ; 9D68B (27:568b) -> CD 3D 41
	scall WaitEmote ; 9D68E (27:568e) -> CD D5 41
	ld e, $01 ; 9D691 (27:5691) -> 1E 01
	ld a, $02 ; 9D693 (27:5693) -> 3E 02
	scall SetPersonVisibilityState ; 9D695 (27:5695) -> CD 3D 41
	scall HideEmote ; 9D698 (27:5698) -> CD 8B 41
	ld e, $01 ; 9D69B (27:569b) -> 1E 01
	ld a, $02 ; 9D69D (27:569d) -> 3E 02
	scall SpriteFace ; 9D69F (27:569f) -> CD 95 40
	ld hl, $001e ; 9D6A2 (27:56a2) -> 21 1E 00
	scall ScriptSleep ; 9D6A5 (27:56a5) -> CD 8F 46
	ld hl, $0274 ; 9D6A8 (27:56a8) -> 21 74 02
	scall PrintTextWithNPCName ; 9D6AB (27:56ab) -> CD A9 44
	xor a ; 9D6AE (27:56ae) -> AF
	scall PlayMusic ; 9D6AF (27:56af) -> CD E6 4E
	ld a, $03 ; 9D6B2 (27:56b2) -> 3E 03
	scall PlayMusic ; 9D6B4 (27:56b4) -> CD E6 4E
	ld a, $68 ; 9D6B7 (27:56b7) -> 3E 68
	scall PlaySFX ; 9D6B9 (27:56b9) -> CD FE 4E
	ld hl, $002d ; 9D6BC (27:56bc) -> 21 2D 00
	scall ScriptSleep ; 9D6BF (27:56bf) -> CD 8F 46
	ld a, $68 ; 9D6C2 (27:56c2) -> 3E 68
	scall PlaySFX ; 9D6C4 (27:56c4) -> CD FE 4E
	ld hl, $0278 ; 9D6C7 (27:56c7) -> 21 78 02
	scall PrintTextWithNPCName ; 9D6CA (27:56ca) -> CD A9 44
	ret  ; 9D6CD (27:56cd) -> C9

Func_9d6ce:
	ld hl, $0279 ; 9D6CE (27:56ce) -> 21 79 02
	scall PrintTextWithNPCName ; 9D6D1 (27:56d1) -> CD A9 44
	ld hl, $001e ; 9D6D4 (27:56d4) -> 21 1E 00
	scall ScriptSleep ; 9D6D7 (27:56d7) -> CD 8F 46
	ld e, $01 ; 9D6DA (27:56da) -> 1E 01
	ld a, $02 ; 9D6DC (27:56dc) -> 3E 02
	scall SpriteFace ; 9D6DE (27:56de) -> CD 95 40
	ld hl, $0273 ; 9D6E1 (27:56e1) -> 21 73 02
	scall PrintTextWithNPCName ; 9D6E4 (27:56e4) -> CD A9 44
	ld a, $59 ; 9D6E7 (27:56e7) -> 3E 59
	scall PlaySFX ; 9D6E9 (27:56e9) -> CD FE 4E
	ld c, $01 ; 9D6EC (27:56ec) -> 0E 01
	ld e, $01 ; 9D6EE (27:56ee) -> 1E 01
	ld a, $22 ; 9D6F0 (27:56f0) -> 3E 22
	scall LoadEmote ; 9D6F2 (27:56f2) -> CD 76 41
	ld e, $00 ; 9D6F5 (27:56f5) -> 1E 00
	ld a, $02 ; 9D6F7 (27:56f7) -> 3E 02
	scall SetPersonVisibilityState ; 9D6F9 (27:56f9) -> CD 3D 41
	scall WaitEmote ; 9D6FC (27:56fc) -> CD D5 41
	ld c, $1b ; 9D6FF (27:56ff) -> 0E 1B
	ld e, $20 ; 9D701 (27:5701) -> 1E 20
	ld a, $02 ; 9D703 (27:5703) -> 3E 02
	scall Func_80080 ; 9D705 (27:5705) -> CD 80 40
	ld e, $01 ; 9D708 (27:5708) -> 1E 01
	ld a, $02 ; 9D70A (27:570a) -> 3E 02
	scall SetPersonVisibilityState ; 9D70C (27:570c) -> CD 3D 41
	scall HideEmote ; 9D70F (27:570f) -> CD 8B 41
	ld hl, $001e ; 9D712 (27:5712) -> 21 1E 00
	scall ScriptSleep ; 9D715 (27:5715) -> CD 8F 46
	ld e, $02 ; 9D718 (27:5718) -> 1E 02
	ld a, $02 ; 9D71A (27:571a) -> 3E 02
	scall SpriteFace ; 9D71C (27:571c) -> CD 95 40
	ld hl, $001e ; 9D71F (27:571f) -> 21 1E 00
	scall ScriptSleep ; 9D722 (27:5722) -> CD 8F 46
	xor a ; 9D725 (27:5725) -> AF
	scall PlayMusic ; 9D726 (27:5726) -> CD E6 4E
	ld a, $19 ; 9D729 (27:5729) -> 3E 19
	scall PlayMusic ; 9D72B (27:572b) -> CD E6 4E
	ld c, $01 ; 9D72E (27:572e) -> 0E 01
	ld e, $60 ; 9D730 (27:5730) -> 1E 60
	ld a, $22 ; 9D732 (27:5732) -> 3E 22
	scall LoadEmote ; 9D734 (27:5734) -> CD 76 41
	ld e, $00 ; 9D737 (27:5737) -> 1E 00
	ld a, $02 ; 9D739 (27:5739) -> 3E 02
	scall SetPersonVisibilityState ; 9D73B (27:573b) -> CD 3D 41
	scall WaitEmote ; 9D73E (27:573e) -> CD D5 41
	ld e, $01 ; 9D741 (27:5741) -> 1E 01
	ld a, $02 ; 9D743 (27:5743) -> 3E 02
	scall SetPersonVisibilityState ; 9D745 (27:5745) -> CD 3D 41
	scall HideEmote ; 9D748 (27:5748) -> CD 8B 41
	ld e, $01 ; 9D74B (27:574b) -> 1E 01
	ld a, $02 ; 9D74D (27:574d) -> 3E 02
	scall SpriteFace ; 9D74F (27:574f) -> CD 95 40
	ld hl, $001e ; 9D752 (27:5752) -> 21 1E 00
	scall ScriptSleep ; 9D755 (27:5755) -> CD 8F 46
	ld hl, $0274 ; 9D758 (27:5758) -> 21 74 02
	scall PrintTextWithNPCName ; 9D75B (27:575b) -> CD A9 44
	xor a ; 9D75E (27:575e) -> AF
	scall PlayMusic ; 9D75F (27:575f) -> CD E6 4E
	ld a, $03 ; 9D762 (27:5762) -> 3E 03
	scall PlayMusic ; 9D764 (27:5764) -> CD E6 4E
	ld a, $68 ; 9D767 (27:5767) -> 3E 68
	scall PlaySFX ; 9D769 (27:5769) -> CD FE 4E
	ld hl, $002d ; 9D76C (27:576c) -> 21 2D 00
	scall ScriptSleep ; 9D76F (27:576f) -> CD 8F 46
	ld a, $68 ; 9D772 (27:5772) -> 3E 68
	scall PlaySFX ; 9D774 (27:5774) -> CD FE 4E
	ld hl, $027a ; 9D777 (27:5777) -> 21 7A 02
	scall PrintTextWithNPCName ; 9D77A (27:577a) -> CD A9 44
	ret  ; 9D77D (27:577d) -> C9

Func_9d77e:
	ld hl, $027b ; 9D77E (27:577e) -> 21 7B 02
	scall PrintTextWithNPCName ; 9D781 (27:5781) -> CD A9 44
	ld e, $01 ; 9D784 (27:5784) -> 1E 01
	ld a, $02 ; 9D786 (27:5786) -> 3E 02
	scall SpriteFace ; 9D788 (27:5788) -> CD 95 40
	ld hl, $001e ; 9D78B (27:578b) -> 21 1E 00
	scall ScriptSleep ; 9D78E (27:578e) -> CD 8F 46
	ld hl, $027c ; 9D791 (27:5791) -> 21 7C 02
	scall PrintTextWithNPCName ; 9D794 (27:5794) -> CD A9 44
	ld a, $59 ; 9D797 (27:5797) -> 3E 59
	scall PlaySFX ; 9D799 (27:5799) -> CD FE 4E
	ld c, $01 ; 9D79C (27:579c) -> 0E 01
	ld e, $01 ; 9D79E (27:579e) -> 1E 01
	ld a, $22 ; 9D7A0 (27:57a0) -> 3E 22
	scall LoadEmote ; 9D7A2 (27:57a2) -> CD 76 41
	ld e, $00 ; 9D7A5 (27:57a5) -> 1E 00
	ld a, $02 ; 9D7A7 (27:57a7) -> 3E 02
	scall SetPersonVisibilityState ; 9D7A9 (27:57a9) -> CD 3D 41
	scall WaitEmote ; 9D7AC (27:57ac) -> CD D5 41
	ld c, $1b ; 9D7AF (27:57af) -> 0E 1B
	ld e, $20 ; 9D7B1 (27:57b1) -> 1E 20
	ld a, $02 ; 9D7B3 (27:57b3) -> 3E 02
	scall Func_80080 ; 9D7B5 (27:57b5) -> CD 80 40
	ld e, $01 ; 9D7B8 (27:57b8) -> 1E 01
	ld a, $02 ; 9D7BA (27:57ba) -> 3E 02
	scall SetPersonVisibilityState ; 9D7BC (27:57bc) -> CD 3D 41
	scall HideEmote ; 9D7BF (27:57bf) -> CD 8B 41
	ld hl, $001e ; 9D7C2 (27:57c2) -> 21 1E 00
	scall ScriptSleep ; 9D7C5 (27:57c5) -> CD 8F 46
	ld e, $02 ; 9D7C8 (27:57c8) -> 1E 02
	ld a, $02 ; 9D7CA (27:57ca) -> 3E 02
	scall SpriteFace ; 9D7CC (27:57cc) -> CD 95 40
	ld hl, $001e ; 9D7CF (27:57cf) -> 21 1E 00
	scall ScriptSleep ; 9D7D2 (27:57d2) -> CD 8F 46
	xor a ; 9D7D5 (27:57d5) -> AF
	scall PlayMusic ; 9D7D6 (27:57d6) -> CD E6 4E
	ld a, $19 ; 9D7D9 (27:57d9) -> 3E 19
	scall PlayMusic ; 9D7DB (27:57db) -> CD E6 4E
	ld c, $01 ; 9D7DE (27:57de) -> 0E 01
	ld e, $03 ; 9D7E0 (27:57e0) -> 1E 03
	ld a, $23 ; 9D7E2 (27:57e2) -> 3E 23
	scall LoadEmote ; 9D7E4 (27:57e4) -> CD 76 41
	ld e, $00 ; 9D7E7 (27:57e7) -> 1E 00
	ld a, $02 ; 9D7E9 (27:57e9) -> 3E 02
	scall SetPersonVisibilityState ; 9D7EB (27:57eb) -> CD 3D 41
	scall WaitEmote ; 9D7EE (27:57ee) -> CD D5 41
	ld c, $19 ; 9D7F1 (27:57f1) -> 0E 19
	ld e, $20 ; 9D7F3 (27:57f3) -> 1E 20
	ld a, $02 ; 9D7F5 (27:57f5) -> 3E 02
	scall Func_80080 ; 9D7F7 (27:57f7) -> CD 80 40
	ld e, $01 ; 9D7FA (27:57fa) -> 1E 01
	ld a, $02 ; 9D7FC (27:57fc) -> 3E 02
	scall SetPersonVisibilityState ; 9D7FE (27:57fe) -> CD 3D 41
	ld e, $01 ; 9D801 (27:5801) -> 1E 01
	ld a, $04 ; 9D803 (27:5803) -> 3E 04
	scall SetPersonVisibilityState ; 9D805 (27:5805) -> CD 3D 41
	scall HideEmote ; 9D808 (27:5808) -> CD 8B 41
	ld hl, $001e ; 9D80B (27:580b) -> 21 1E 00
	scall ScriptSleep ; 9D80E (27:580e) -> CD 8F 46
	ld hl, $0274 ; 9D811 (27:5811) -> 21 74 02
	scall PrintTextWithNPCName ; 9D814 (27:5814) -> CD A9 44
	xor a ; 9D817 (27:5817) -> AF
	scall PlayMusic ; 9D818 (27:5818) -> CD E6 4E
	ld a, $03 ; 9D81B (27:581b) -> 3E 03
	scall PlayMusic ; 9D81D (27:581d) -> CD E6 4E
	ld a, $68 ; 9D820 (27:5820) -> 3E 68
	scall PlaySFX ; 9D822 (27:5822) -> CD FE 4E
	ld hl, $002d ; 9D825 (27:5825) -> 21 2D 00
	scall ScriptSleep ; 9D828 (27:5828) -> CD 8F 46
	ld a, $68 ; 9D82B (27:582b) -> 3E 68
	scall PlaySFX ; 9D82D (27:582d) -> CD FE 4E
	ld hl, $027d ; 9D830 (27:5830) -> 21 7D 02
	scall PrintTextWithNPCName ; 9D833 (27:5833) -> CD A9 44
	ret  ; 9D836 (27:5836) -> C9

Data_9d837:
	db $20, $1b, $ff, $ff

Func_9d83b:
	ld hl, $027e ; 9D83B (27:583b) -> 21 7E 02
	scall PrintTextWithNPCName ; 9D83E (27:583e) -> CD A9 44
	ld e, $01 ; 9D841 (27:5841) -> 1E 01
	ld a, $02 ; 9D843 (27:5843) -> 3E 02
	scall SpriteFace ; 9D845 (27:5845) -> CD 95 40
	ld hl, $001e ; 9D848 (27:5848) -> 21 1E 00
	scall ScriptSleep ; 9D84B (27:584b) -> CD 8F 46
	ld hl, $027f ; 9D84E (27:584e) -> 21 7F 02
	scall PrintTextWithNPCName ; 9D851 (27:5851) -> CD A9 44
	ld a, $59 ; 9D854 (27:5854) -> 3E 59
	scall PlaySFX ; 9D856 (27:5856) -> CD FE 4E
	ld c, $01 ; 9D859 (27:5859) -> 0E 01
	ld e, $01 ; 9D85B (27:585b) -> 1E 01
	ld a, $22 ; 9D85D (27:585d) -> 3E 22
	scall LoadEmote ; 9D85F (27:585f) -> CD 76 41
	ld e, $00 ; 9D862 (27:5862) -> 1E 00
	ld a, $02 ; 9D864 (27:5864) -> 3E 02
	scall SetPersonVisibilityState ; 9D866 (27:5866) -> CD 3D 41
	scall WaitEmote ; 9D869 (27:5869) -> CD D5 41
	ld c, $1b ; 9D86C (27:586c) -> 0E 1B
	ld e, $20 ; 9D86E (27:586e) -> 1E 20
	ld a, $02 ; 9D870 (27:5870) -> 3E 02
	scall Func_80080 ; 9D872 (27:5872) -> CD 80 40
	ld e, $01 ; 9D875 (27:5875) -> 1E 01
	ld a, $02 ; 9D877 (27:5877) -> 3E 02
	scall SetPersonVisibilityState ; 9D879 (27:5879) -> CD 3D 41
	scall HideEmote ; 9D87C (27:587c) -> CD 8B 41
	ld hl, $001e ; 9D87F (27:587f) -> 21 1E 00
	scall ScriptSleep ; 9D882 (27:5882) -> CD 8F 46
	ld e, $02 ; 9D885 (27:5885) -> 1E 02
	ld a, $02 ; 9D887 (27:5887) -> 3E 02
	scall SpriteFace ; 9D889 (27:5889) -> CD 95 40
	ld hl, $001e ; 9D88C (27:588c) -> 21 1E 00
	scall ScriptSleep ; 9D88F (27:588f) -> CD 8F 46
	xor a ; 9D892 (27:5892) -> AF
	scall PlayMusic ; 9D893 (27:5893) -> CD E6 4E
	ld a, $19 ; 9D896 (27:5896) -> 3E 19
	scall PlayMusic ; 9D898 (27:5898) -> CD E6 4E
	ld c, $01 ; 9D89B (27:589b) -> 0E 01
	ld e, $0c ; 9D89D (27:589d) -> 1E 0C
	ld a, $23 ; 9D89F (27:589f) -> 3E 23
	scall LoadEmote ; 9D8A1 (27:58a1) -> CD 76 41
	ld e, $00 ; 9D8A4 (27:58a4) -> 1E 00
	ld a, $02 ; 9D8A6 (27:58a6) -> 3E 02
	scall SetPersonVisibilityState ; 9D8A8 (27:58a8) -> CD 3D 41
	ld bc, Data_9d837 ; 9D8AB (27:58ab) -> 01 37 58
	ld e, $27 ; 9D8AE (27:58ae) -> 1E 27
	ld a, $03 ; 9D8B0 (27:58b0) -> 3E 03
	scall MovePerson ; 9D8B2 (27:58b2) -> CD F7 41
	scall WaitNPCStep ; 9D8B5 (27:58b5) -> CD 0C 42
	ld e, $00 ; 9D8B8 (27:58b8) -> 1E 00
	ld a, $03 ; 9D8BA (27:58ba) -> 3E 03
	scall SetPersonVisibilityState ; 9D8BC (27:58bc) -> CD 3D 41
	scall WaitEmote ; 9D8BF (27:58bf) -> CD D5 41
	ld hl, $001e ; 9D8C2 (27:58c2) -> 21 1E 00
	scall ScriptSleep ; 9D8C5 (27:58c5) -> CD 8F 46
	ld hl, $0274 ; 9D8C8 (27:58c8) -> 21 74 02
	scall PrintTextWithNPCName ; 9D8CB (27:58cb) -> CD A9 44
	xor a ; 9D8CE (27:58ce) -> AF
	scall PlayMusic ; 9D8CF (27:58cf) -> CD E6 4E
	ld a, $03 ; 9D8D2 (27:58d2) -> 3E 03
	scall PlayMusic ; 9D8D4 (27:58d4) -> CD E6 4E
	ld a, $68 ; 9D8D7 (27:58d7) -> 3E 68
	scall PlaySFX ; 9D8D9 (27:58d9) -> CD FE 4E
	ld hl, $002d ; 9D8DC (27:58dc) -> 21 2D 00
	scall ScriptSleep ; 9D8DF (27:58df) -> CD 8F 46
	ld a, $68 ; 9D8E2 (27:58e2) -> 3E 68
	scall PlaySFX ; 9D8E4 (27:58e4) -> CD FE 4E
	ld hl, $0280 ; 9D8E7 (27:58e7) -> 21 80 02
	scall PrintTextWithNPCName ; 9D8EA (27:58ea) -> CD A9 44
	ret  ; 9D8ED (27:58ed) -> C9

Data_9d8ee:
	db $23, $1b, $ff, $ff

Data_9d8f2:
	db $1f, $1b, $ff, $ff

Data_9d8f6:
	db $20, $1b, $ff, $ff

Func_9d8fa:
	push bc ; 9D8FA (27:58fa) -> C5
	ld hl, sp+$00 ; 9D8FB (27:58fb) -> F8 00
	ld [hl], $00 ; 9D8FD (27:58fd) -> 36 00
	ld hl, $0053 ; 9D8FF (27:58ff) -> 21 53 00
	scall CheckEventFlag ; 9D902 (27:5902) -> CD 2E 46
	or a ; 9D905 (27:5905) -> B7
	jp nz, .asm_9d910 ; 9D906 (27:5906) -> C2 10 59
	ld hl, sp+$00 ; 9D909 (27:5909) -> F8 00
	ld a, [hl] ; 9D90B (27:590b) -> 7E
	inc a ; 9D90C (27:590c) -> 3C
	ld hl, sp+$00 ; 9D90D (27:590d) -> F8 00
	ld [hl], a ; 9D90F (27:590f) -> 77
.asm_9d910:
	ld hl, $0054 ; 9D910 (27:5910) -> 21 54 00
	scall CheckEventFlag ; 9D913 (27:5913) -> CD 2E 46
	or a ; 9D916 (27:5916) -> B7
	jp nz, .asm_9d921 ; 9D917 (27:5917) -> C2 21 59
	ld hl, sp+$00 ; 9D91A (27:591a) -> F8 00
	ld a, [hl] ; 9D91C (27:591c) -> 7E
	inc a ; 9D91D (27:591d) -> 3C
	ld hl, sp+$00 ; 9D91E (27:591e) -> F8 00
	ld [hl], a ; 9D920 (27:5920) -> 77
.asm_9d921:
	ld hl, $0055 ; 9D921 (27:5921) -> 21 55 00
	scall CheckEventFlag ; 9D924 (27:5924) -> CD 2E 46
	or a ; 9D927 (27:5927) -> B7
	jp nz, .asm_9d932 ; 9D928 (27:5928) -> C2 32 59
	ld hl, sp+$00 ; 9D92B (27:592b) -> F8 00
	ld a, [hl] ; 9D92D (27:592d) -> 7E
	inc a ; 9D92E (27:592e) -> 3C
	ld hl, sp+$00 ; 9D92F (27:592f) -> F8 00
	ld [hl], a ; 9D931 (27:5931) -> 77
.asm_9d932:
	ld hl, $0056 ; 9D932 (27:5932) -> 21 56 00
	scall CheckEventFlag ; 9D935 (27:5935) -> CD 2E 46
	or a ; 9D938 (27:5938) -> B7
	jp nz, .asm_9d943 ; 9D939 (27:5939) -> C2 43 59
	ld hl, sp+$00 ; 9D93C (27:593c) -> F8 00
	ld a, [hl] ; 9D93E (27:593e) -> 7E
	inc a ; 9D93F (27:593f) -> 3C
	ld hl, sp+$00 ; 9D940 (27:5940) -> F8 00
	ld [hl], a ; 9D942 (27:5942) -> 77
.asm_9d943:
	ld hl, $0057 ; 9D943 (27:5943) -> 21 57 00
	scall CheckEventFlag ; 9D946 (27:5946) -> CD 2E 46
	or a ; 9D949 (27:5949) -> B7
	jp nz, .asm_9d954 ; 9D94A (27:594a) -> C2 54 59
	ld hl, sp+$00 ; 9D94D (27:594d) -> F8 00
	ld a, [hl] ; 9D94F (27:594f) -> 7E
	inc a ; 9D950 (27:5950) -> 3C
	ld hl, sp+$00 ; 9D951 (27:5951) -> F8 00
	ld [hl], a ; 9D953 (27:5953) -> 77
.asm_9d954:
	ld hl, sp+$00 ; 9D954 (27:5954) -> F8 00
	ld a, [hl] ; 9D956 (27:5956) -> 7E
	or a ; 9D957 (27:5957) -> B7
	jp z, .asm_9da64 ; 9D958 (27:5958) -> CA 64 5A
	cp $01 ; 9D95B (27:595b) -> FE 01
	jp z, .asm_9d9fd ; 9D95D (27:595d) -> CA FD 59
	cp $02 ; 9D960 (27:5960) -> FE 02
	jp z, .asm_9d96f ; 9D962 (27:5962) -> CA 6F 59
	cp $03 ; 9D965 (27:5965) -> FE 03
	jp z, .asm_9d96f ; 9D967 (27:5967) -> CA 6F 59
	cp $04 ; 9D96A (27:596a) -> FE 04
	jp nz, .asm_9dae4 ; 9D96C (27:596c) -> C2 E4 5A
.asm_9d96f:
	ld hl, $001e ; 9D96F (27:596f) -> 21 1E 00
	scall ScriptSleep ; 9D972 (27:5972) -> CD 8F 46
	ld hl, $0276 ; 9D975 (27:5975) -> 21 76 02
	scall PrintTextWithNPCName ; 9D978 (27:5978) -> CD A9 44
	ld a, $59 ; 9D97B (27:597b) -> 3E 59
	scall PlaySFX ; 9D97D (27:597d) -> CD FE 4E
	ld bc, Data_9d8f2 ; 9D980 (27:5980) -> 01 F2 58
	ld e, $27 ; 9D983 (27:5983) -> 1E 27
	ld a, $02 ; 9D985 (27:5985) -> 3E 02
	scall MovePerson ; 9D987 (27:5987) -> CD F7 41
	ld bc, Data_9d8f6 ; 9D98A (27:598a) -> 01 F6 58
	ld e, $27 ; 9D98D (27:598d) -> 1E 27
	ld a, $03 ; 9D98F (27:598f) -> 3E 03
	scall MovePersonAndWait ; 9D991 (27:5991) -> CD 88 46
	scall WaitNPCStep ; 9D994 (27:5994) -> CD 0C 42
	ld hl, $001e ; 9D997 (27:5997) -> 21 1E 00
	scall ScriptSleep ; 9D99A (27:599a) -> CD 8F 46
	ld c, $01 ; 9D99D (27:599d) -> 0E 01
	ld e, $20 ; 9D99F (27:599f) -> 1E 20
	ld a, $23 ; 9D9A1 (27:59a1) -> 3E 23
	scall LoadEmote ; 9D9A3 (27:59a3) -> CD 76 41
	ld e, $1b ; 9D9A6 (27:59a6) -> 1E 1B
	ld a, $1f ; 9D9A8 (27:59a8) -> 3E 1F
	scall MoveEmote ; 9D9AA (27:59aa) -> CD E4 41
	ld e, $00 ; 9D9AD (27:59ad) -> 1E 00
	ld a, $02 ; 9D9AF (27:59af) -> 3E 02
	scall SetPersonVisibilityState ; 9D9B1 (27:59b1) -> CD 3D 41
	scall WaitEmote ; 9D9B4 (27:59b4) -> CD D5 41
	scall HideEmote ; 9D9B7 (27:59b7) -> CD 8B 41
	ld bc, Data_9d8f2 ; 9D9BA (27:59ba) -> 01 F2 58
	ld e, $27 ; 9D9BD (27:59bd) -> 1E 27
	ld a, $02 ; 9D9BF (27:59bf) -> 3E 02
	scall MovePerson ; 9D9C1 (27:59c1) -> CD F7 41
	scall WaitNPCStep ; 9D9C4 (27:59c4) -> CD 0C 42
	ld e, $01 ; 9D9C7 (27:59c7) -> 1E 01
	ld a, $03 ; 9D9C9 (27:59c9) -> 3E 03
	scall SpriteFace ; 9D9CB (27:59cb) -> CD 95 40
	ld hl, $001e ; 9D9CE (27:59ce) -> 21 1E 00
	scall ScriptSleep ; 9D9D1 (27:59d1) -> CD 8F 46
	ld e, $03 ; 9D9D4 (27:59d4) -> 1E 03
	ld a, $03 ; 9D9D6 (27:59d6) -> 3E 03
	scall SpriteFace ; 9D9D8 (27:59d8) -> CD 95 40
	ld hl, $001e ; 9D9DB (27:59db) -> 21 1E 00
	scall ScriptSleep ; 9D9DE (27:59de) -> CD 8F 46
	ld bc, Data_9d8ee ; 9D9E1 (27:59e1) -> 01 EE 58
	ld e, $27 ; 9D9E4 (27:59e4) -> 1E 27
	ld a, $03 ; 9D9E6 (27:59e6) -> 3E 03
	scall MovePerson ; 9D9E8 (27:59e8) -> CD F7 41
	scall WaitNPCStep ; 9D9EB (27:59eb) -> CD 0C 42
	ld e, $00 ; 9D9EE (27:59ee) -> 1E 00
	ld a, $03 ; 9D9F0 (27:59f0) -> 3E 03
	scall SetPersonVisibilityState ; 9D9F2 (27:59f2) -> CD 3D 41
	ld a, $2e ; 9D9F5 (27:59f5) -> 3E 2E
	scall PlaySFX ; 9D9F7 (27:59f7) -> CD FE 4E
	jp .asm_9dae4 ; 9D9FA (27:59fa) -> C3 E4 5A
.asm_9d9fd:
	ld hl, $001e ; 9D9FD (27:59fd) -> 21 1E 00
	scall ScriptSleep ; 9DA00 (27:5a00) -> CD 8F 46
	ld hl, $0276 ; 9DA03 (27:5a03) -> 21 76 02
	scall PrintTextWithNPCName ; 9DA06 (27:5a06) -> CD A9 44
	ld a, $59 ; 9DA09 (27:5a09) -> 3E 59
	scall PlaySFX ; 9DA0B (27:5a0b) -> CD FE 4E
	ld hl, $001e ; 9DA0E (27:5a0e) -> 21 1E 00
	scall ScriptSleep ; 9DA11 (27:5a11) -> CD 8F 46
	ld c, $01 ; 9DA14 (27:5a14) -> 0E 01
	ld e, $20 ; 9DA16 (27:5a16) -> 1E 20
	ld a, $23 ; 9DA18 (27:5a18) -> 3E 23
	scall LoadEmote ; 9DA1A (27:5a1a) -> CD 76 41
	ld e, $19 ; 9DA1D (27:5a1d) -> 1E 19
	ld a, $20 ; 9DA1F (27:5a1f) -> 3E 20
	scall MoveEmote ; 9DA21 (27:5a21) -> CD E4 41
	ld e, $00 ; 9DA24 (27:5a24) -> 1E 00
	ld a, $02 ; 9DA26 (27:5a26) -> 3E 02
	scall SetPersonVisibilityState ; 9DA28 (27:5a28) -> CD 3D 41
	scall WaitEmote ; 9DA2B (27:5a2b) -> CD D5 41
	scall HideEmote ; 9DA2E (27:5a2e) -> CD 8B 41
	ld hl, $001e ; 9DA31 (27:5a31) -> 21 1E 00
	scall ScriptSleep ; 9DA34 (27:5a34) -> CD 8F 46
	ld bc, Data_9d8ee ; 9DA37 (27:5a37) -> 01 EE 58
	ld e, $27 ; 9DA3A (27:5a3a) -> 1E 27
	ld a, $03 ; 9DA3C (27:5a3c) -> 3E 03
	scall MovePerson ; 9DA3E (27:5a3e) -> CD F7 41
	ld bc, Data_9d8ee ; 9DA41 (27:5a41) -> 01 EE 58
	ld e, $27 ; 9DA44 (27:5a44) -> 1E 27
	ld a, $04 ; 9DA46 (27:5a46) -> 3E 04
	scall MovePersonAndWait ; 9DA48 (27:5a48) -> CD 88 46
	scall WaitNPCStep ; 9DA4B (27:5a4b) -> CD 0C 42
	ld e, $00 ; 9DA4E (27:5a4e) -> 1E 00
	ld a, $03 ; 9DA50 (27:5a50) -> 3E 03
	scall SetPersonVisibilityState ; 9DA52 (27:5a52) -> CD 3D 41
	ld e, $00 ; 9DA55 (27:5a55) -> 1E 00
	ld a, $04 ; 9DA57 (27:5a57) -> 3E 04
	scall SetPersonVisibilityState ; 9DA59 (27:5a59) -> CD 3D 41
	ld a, $2e ; 9DA5C (27:5a5c) -> 3E 2E
	scall PlaySFX ; 9DA5E (27:5a5e) -> CD FE 4E
	jp .asm_9dae4 ; 9DA61 (27:5a61) -> C3 E4 5A
.asm_9da64:
	ld hl, $001e ; 9DA64 (27:5a64) -> 21 1E 00
	scall ScriptSleep ; 9DA67 (27:5a67) -> CD 8F 46
	ld c, $01 ; 9DA6A (27:5a6a) -> 0E 01
	ld e, $10 ; 9DA6C (27:5a6c) -> 1E 10
	ld a, $23 ; 9DA6E (27:5a6e) -> 3E 23
	scall LoadEmote ; 9DA70 (27:5a70) -> CD 76 41
	ld e, $1b ; 9DA73 (27:5a73) -> 1E 1B
	ld a, $1e ; 9DA75 (27:5a75) -> 3E 1E
	scall MoveEmote ; 9DA77 (27:5a77) -> CD E4 41
	ld c, $19 ; 9DA7A (27:5a7a) -> 0E 19
	ld e, $20 ; 9DA7C (27:5a7c) -> 1E 20
	ld a, $02 ; 9DA7E (27:5a7e) -> 3E 02
	scall Func_80080 ; 9DA80 (27:5a80) -> CD 80 40
	ld e, $01 ; 9DA83 (27:5a83) -> 1E 01
	ld a, $02 ; 9DA85 (27:5a85) -> 3E 02
	scall SetPersonVisibilityState ; 9DA87 (27:5a87) -> CD 3D 41
	ld a, $33 ; 9DA8A (27:5a8a) -> 3E 33
	scall PlaySFX ; 9DA8C (27:5a8c) -> CD FE 4E
	ld hl, $001e ; 9DA8F (27:5a8f) -> 21 1E 00
	scall ScriptSleep ; 9DA92 (27:5a92) -> CD 8F 46
	ld a, $33 ; 9DA95 (27:5a95) -> 3E 33
	scall PlaySFX ; 9DA97 (27:5a97) -> CD FE 4E
	ld hl, $001e ; 9DA9A (27:5a9a) -> 21 1E 00
	scall ScriptSleep ; 9DA9D (27:5a9d) -> CD 8F 46
	ld a, $33 ; 9DAA0 (27:5aa0) -> 3E 33
	scall PlaySFX ; 9DAA2 (27:5aa2) -> CD FE 4E
	ld hl, $001e ; 9DAA5 (27:5aa5) -> 21 1E 00
	scall ScriptSleep ; 9DAA8 (27:5aa8) -> CD 8F 46
	ld a, $33 ; 9DAAB (27:5aab) -> 3E 33
	scall PlaySFX ; 9DAAD (27:5aad) -> CD FE 4E
	scall WaitEmote ; 9DAB0 (27:5ab0) -> CD D5 41
	scall HideEmote ; 9DAB3 (27:5ab3) -> CD 8B 41
	ld hl, $003c ; 9DAB6 (27:5ab6) -> 21 3C 00
	scall ScriptSleep ; 9DAB9 (27:5ab9) -> CD 8F 46
	ld hl, $0276 ; 9DABC (27:5abc) -> 21 76 02
	scall PrintTextWithNPCName ; 9DABF (27:5abf) -> CD A9 44
	ld a, $59 ; 9DAC2 (27:5ac2) -> 3E 59
	scall PlaySFX ; 9DAC4 (27:5ac4) -> CD FE 4E
	ld c, $01 ; 9DAC7 (27:5ac7) -> 0E 01
	ld e, $20 ; 9DAC9 (27:5ac9) -> 1E 20
	ld a, $23 ; 9DACB (27:5acb) -> 3E 23
	scall LoadEmote ; 9DACD (27:5acd) -> CD 76 41
	ld e, $19 ; 9DAD0 (27:5ad0) -> 1E 19
	ld a, $20 ; 9DAD2 (27:5ad2) -> 3E 20
	scall MoveEmote ; 9DAD4 (27:5ad4) -> CD E4 41
	ld e, $00 ; 9DAD7 (27:5ad7) -> 1E 00
	ld a, $02 ; 9DAD9 (27:5ad9) -> 3E 02
	scall SetPersonVisibilityState ; 9DADB (27:5adb) -> CD 3D 41
	scall WaitEmote ; 9DADE (27:5ade) -> CD D5 41
	scall HideEmote ; 9DAE1 (27:5ae1) -> CD 8B 41
.asm_9dae4:
	pop bc ; 9DAE4 (27:5ae4) -> C1
	ret  ; 9DAE5 (27:5ae5) -> C9

Data_9dae6:
	db $1d, $1b, $ff, $ff

Func_9daea:
	ld a, e ; 9DAEA (27:5aea) -> 7B
	or a ; 9DAEB (27:5aeb) -> B7
	jp nz, .asm_9db2f ; 9DAEC (27:5aec) -> C2 2F 5B
	ld a, $02 ; 9DAEF (27:5aef) -> 3E 02
	scall FacePlayer ; 9DAF1 (27:5af1) -> CD 4B 44
	ld hl, $0010 ; 9DAF4 (27:5af4) -> 21 10 00
	scall CheckEventFlag ; 9DAF7 (27:5af7) -> CD 2E 46
	or a ; 9DAFA (27:5afa) -> B7
	jp nz, .asm_9db29 ; 9DAFB (27:5afb) -> C2 29 5B
	ld hl, $0281 ; 9DAFE (27:5afe) -> 21 81 02
	scall PrintTextWithNPCName ; 9DB01 (27:5b01) -> CD A9 44
	ld hl, $001e ; 9DB04 (27:5b04) -> 21 1E 00
	scall ScriptSleep ; 9DB07 (27:5b07) -> CD 8F 46
	ld bc, Data_9dae6 ; 9DB0A (27:5b0a) -> 01 E6 5A
	ld e, $27 ; 9DB0D (27:5b0d) -> 1E 27
	ld a, $02 ; 9DB0F (27:5b0f) -> 3E 02
	scall MovePerson ; 9DB11 (27:5b11) -> CD F7 41
	scall WaitNPCStep ; 9DB14 (27:5b14) -> CD 0C 42
	ld e, $01 ; 9DB17 (27:5b17) -> 1E 01
	ld a, $02 ; 9DB19 (27:5b19) -> 3E 02
	scall SpriteFace ; 9DB1B (27:5b1b) -> CD 95 40
	ld e, $01 ; 9DB1E (27:5b1e) -> 1E 01
	ld hl, $0010 ; 9DB20 (27:5b20) -> 21 10 00
	scall EventFlagAction ; 9DB23 (27:5b23) -> CD 1B 46
	jp .asm_9db2f ; 9DB26 (27:5b26) -> C3 2F 5B
.asm_9db29:
	ld hl, $0281 ; 9DB29 (27:5b29) -> 21 81 02
	scall PrintTextWithNPCName ; 9DB2C (27:5b2c) -> CD A9 44
.asm_9db2f:
	ret  ; 9DB2F (27:5b2f) -> C9

Func_9db30:
	ld a, e ; 9DB30 (27:5b30) -> 7B
	or a ; 9DB31 (27:5b31) -> B7
	jp nz, .asm_9dc23 ; 9DB32 (27:5b32) -> C2 23 5C
	ld hl, $00dc ; 9DB35 (27:5b35) -> 21 DC 00
	scall CheckEventFlag ; 9DB38 (27:5b38) -> CD 2E 46
	or a ; 9DB3B (27:5b3b) -> B7
	jp nz, .asm_9dc1d ; 9DB3C (27:5b3c) -> C2 1D 5C
	ld a, $5e ; 9DB3F (27:5b3f) -> 3E 5E
	scall PlaySFX ; 9DB41 (27:5b41) -> CD FE 4E
	ld c, $02 ; 9DB44 (27:5b44) -> 0E 02
	ld e, $02 ; 9DB46 (27:5b46) -> 1E 02
	ld a, $08 ; 9DB48 (27:5b48) -> 3E 08
	scall LoadEmote ; 9DB4A (27:5b4a) -> CD 76 41
	ld e, $0e ; 9DB4D (27:5b4d) -> 1E 0E
	ld a, $1e ; 9DB4F (27:5b4f) -> 3E 1E
	scall MoveEmote ; 9DB51 (27:5b51) -> CD E4 41
	scall WaitEmote ; 9DB54 (27:5b54) -> CD D5 41
	scall HideEmote ; 9DB57 (27:5b57) -> CD 8B 41
	ld a, $28 ; 9DB5A (27:5b5a) -> 3E 28
	scall PlaySFX ; 9DB5C (27:5b5c) -> CD FE 4E
	ld e, $01 ; 9DB5F (27:5b5f) -> 1E 01
	xor a ; 9DB61 (27:5b61) -> AF
	scall SetPersonVisibilityState ; 9DB62 (27:5b62) -> CD 3D 41
	ld a, $60 ; 9DB65 (27:5b65) -> 3E 60
	scall PlaySFX ; 9DB67 (27:5b67) -> CD FE 4E
	ld e, $03 ; 9DB6A (27:5b6a) -> 1E 03
	xor a ; 9DB6C (27:5b6c) -> AF
	scall SpriteFace ; 9DB6D (27:5b6d) -> CD 95 40
	ld e, $00 ; 9DB70 (27:5b70) -> 1E 00
	xor a ; 9DB72 (27:5b72) -> AF
	scall SpriteFace ; 9DB73 (27:5b73) -> CD 95 40
	ld e, $01 ; 9DB76 (27:5b76) -> 1E 01
	xor a ; 9DB78 (27:5b78) -> AF
	scall SpriteFace ; 9DB79 (27:5b79) -> CD 95 40
	ld e, $02 ; 9DB7C (27:5b7c) -> 1E 02
	xor a ; 9DB7E (27:5b7e) -> AF
	scall SpriteFace ; 9DB7F (27:5b7f) -> CD 95 40
	ld e, $03 ; 9DB82 (27:5b82) -> 1E 03
	xor a ; 9DB84 (27:5b84) -> AF
	scall SpriteFace ; 9DB85 (27:5b85) -> CD 95 40
	ld e, $00 ; 9DB88 (27:5b88) -> 1E 00
	xor a ; 9DB8A (27:5b8a) -> AF
	scall SpriteFace ; 9DB8B (27:5b8b) -> CD 95 40
	ld e, $01 ; 9DB8E (27:5b8e) -> 1E 01
	xor a ; 9DB90 (27:5b90) -> AF
	scall SpriteFace ; 9DB91 (27:5b91) -> CD 95 40
	ld e, $02 ; 9DB94 (27:5b94) -> 1E 02
	xor a ; 9DB96 (27:5b96) -> AF
	scall SpriteFace ; 9DB97 (27:5b97) -> CD 95 40
	ld a, $0f ; 9DB9A (27:5b9a) -> 3E 0F
	scall FadeOutAudio ; 9DB9C (27:5b9c) -> CD F1 4F
	xor a ; 9DB9F (27:5b9f) -> AF
	scall PlayMusic ; 9DBA0 (27:5ba0) -> CD E6 4E
	ld a, $01 ; 9DBA3 (27:5ba3) -> 3E 01
	scall FadeInAudio ; 9DBA5 (27:5ba5) -> CD 1A 50
	ld a, $14 ; 9DBA8 (27:5ba8) -> 3E 14
	scall PlayMusic ; 9DBAA (27:5baa) -> CD E6 4E
	xor a ; 9DBAD (27:5bad) -> AF
	scall FacePlayer ; 9DBAE (27:5bae) -> CD 4B 44
	ld hl, $001e ; 9DBB1 (27:5bb1) -> 21 1E 00
	scall ScriptSleep ; 9DBB4 (27:5bb4) -> CD 8F 46
	ld c, $0c ; 9DBB7 (27:5bb7) -> 0E 0C
	ld e, $09 ; 9DBB9 (27:5bb9) -> 1E 09
	ld a, $06 ; 9DBBB (27:5bbb) -> 3E 06
	scall Func_80e8d ; 9DBBD (27:5bbd) -> CD 8D 4E
	ld e, $01 ; 9DBC0 (27:5bc0) -> 1E 01
	ld hl, $00dc ; 9DBC2 (27:5bc2) -> 21 DC 00
	scall EventFlagAction ; 9DBC5 (27:5bc5) -> CD 1B 46
	ld a, $60 ; 9DBC8 (27:5bc8) -> 3E 60
	scall PlaySFX ; 9DBCA (27:5bca) -> CD FE 4E
	ld e, $03 ; 9DBCD (27:5bcd) -> 1E 03
	xor a ; 9DBCF (27:5bcf) -> AF
	scall SpriteFace ; 9DBD0 (27:5bd0) -> CD 95 40
	ld e, $00 ; 9DBD3 (27:5bd3) -> 1E 00
	xor a ; 9DBD5 (27:5bd5) -> AF
	scall SpriteFace ; 9DBD6 (27:5bd6) -> CD 95 40
	ld e, $01 ; 9DBD9 (27:5bd9) -> 1E 01
	xor a ; 9DBDB (27:5bdb) -> AF
	scall SpriteFace ; 9DBDC (27:5bdc) -> CD 95 40
	ld e, $02 ; 9DBDF (27:5bdf) -> 1E 02
	xor a ; 9DBE1 (27:5be1) -> AF
	scall SpriteFace ; 9DBE2 (27:5be2) -> CD 95 40
	ld e, $03 ; 9DBE5 (27:5be5) -> 1E 03
	xor a ; 9DBE7 (27:5be7) -> AF
	scall SpriteFace ; 9DBE8 (27:5be8) -> CD 95 40
	ld e, $00 ; 9DBEB (27:5beb) -> 1E 00
	xor a ; 9DBED (27:5bed) -> AF
	scall SpriteFace ; 9DBEE (27:5bee) -> CD 95 40
	ld e, $01 ; 9DBF1 (27:5bf1) -> 1E 01
	xor a ; 9DBF3 (27:5bf3) -> AF
	scall SpriteFace ; 9DBF4 (27:5bf4) -> CD 95 40
	ld e, $02 ; 9DBF7 (27:5bf7) -> 1E 02
	xor a ; 9DBF9 (27:5bf9) -> AF
	scall SpriteFace ; 9DBFA (27:5bfa) -> CD 95 40
	ld a, $0f ; 9DBFD (27:5bfd) -> 3E 0F
	scall FadeOutAudio ; 9DBFF (27:5bff) -> CD F1 4F
	xor a ; 9DC02 (27:5c02) -> AF
	scall PlayMusic ; 9DC03 (27:5c03) -> CD E6 4E
	ld a, $01 ; 9DC06 (27:5c06) -> 3E 01
	scall FadeInAudio ; 9DC08 (27:5c08) -> CD 1A 50
	ld a, $03 ; 9DC0B (27:5c0b) -> 3E 03
	scall PlayMusic ; 9DC0D (27:5c0d) -> CD E6 4E
	xor a ; 9DC10 (27:5c10) -> AF
	scall FacePlayer ; 9DC11 (27:5c11) -> CD 4B 44
	ld e, $00 ; 9DC14 (27:5c14) -> 1E 00
	xor a ; 9DC16 (27:5c16) -> AF
	scall SetPersonVisibilityState ; 9DC17 (27:5c17) -> CD 3D 41
	jp .asm_9dc23 ; 9DC1A (27:5c1a) -> C3 23 5C
.asm_9dc1d:
	ld hl, $015c ; 9DC1D (27:5c1d) -> 21 5C 01
	scall PrintTextStandard ; 9DC20 (27:5c20) -> CD 98 44
.asm_9dc23:
	ret  ; 9DC23 (27:5c23) -> C9

Data_9dc24:
	warpdef $02, $0b, $02, $01, MAP_18_00, $1b, $0e, $1b, $0f, $2e

Data_9dc2f:
	db $88, $0f, $02, $12, $2a
	db $89, $11, $02, $12, $15
	db $8a, $00, $06, $12, $20

Data_9dc3e:
	dtext_tree_pointer TreeBitstreamText_42f84
	dw -1

Data_9dc42:
	dtext_tree_pointer TreeBitstreamText_4380b
	dtext_tree_pointer TreeBitstreamText_43945
	dw -1

Data_9dc48:
	dtext_tree_pointer TreeBitstreamText_4393b
	dw -1

Data_9dc4c:
	dtext_tree_pointer TreeBitstreamText_43b4c
	dw -1

Data_9dc50:
	dtext_tree_pointer TreeBitstreamText_43d46
	dw -1

Data_9dc54:
	dtext_tree_pointer TreeBitstreamText_43cbb
	dw -1

Data_9dc58:
	dtext_tree_pointer TreeBitstreamText_472d8
	dw -1

Data_9dc5c:
	person_event $0a, $04, $06, $04, $01, $01, $00, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $00, $04, $00, Func_9df90, NULL

Data_9dc78:
	person_event $0a, $04, $06, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $02, $04, $00, Func_9df90, NULL

Data_9dc94:
	person_event $0a, $04, $06, $04, $01, $01, $03, $04, $00, Func_808fc_27, Data_9dc42
	person_event $06, $04, $08, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc50
	person_event $08, $04, $05, $04, $01, $01, $01, $04, $00, Func_808fc_27, Data_9dc48

Data_9dcbe:
	person_event $ff, $00, $03, $04, $01, $02, $02, $04, $00, Func_808fc_27, Data_9dc4c

Data_9dccc:
	person_event $ff, $00, $0f, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $11, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $00, $05, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58

Func_9dcf6:: ; 9dcf6
	call Func_9ddbb ; 9DCF6 (27:5cf6) -> CD BB 5D
	ld hl, Func_9ddbb ; 9DCF9 (27:5cf9) -> 21 BB 5D
	scall Func_80f11 ; 9DCFC (27:5cfc) -> CD 11 4F
	ld e, $00 ; 9DCFF (27:5cff) -> 1E 00
	ld hl, $0010 ; 9DD01 (27:5d01) -> 21 10 00
	scall EventFlagAction ; 9DD04 (27:5d04) -> CD 1B 46
	ld e, $01 ; 9DD07 (27:5d07) -> 1E 01
	ld hl, Data_9dc24 ; 9DD09 (27:5d09) -> 21 24 5C
	scall LoadWarps ; 9DD0C (27:5d0c) -> CD 3A 40
	ld a, $0d ; 9DD0F (27:5d0f) -> 3E 0D
	scall PlayMusic ; 9DD11 (27:5d11) -> CD E6 4E
	ld hl, $00ba ; 9DD14 (27:5d14) -> 21 BA 00
	scall CheckEventFlag ; 9DD17 (27:5d17) -> CD 2E 46
	or a ; 9DD1A (27:5d1a) -> B7
	jp nz, .asm_9dd37 ; 9DD1B (27:5d1b) -> C2 37 5D
	ld e, $02 ; 9DD1E (27:5d1e) -> 1E 02
	ld hl, Data_9dc5c ; 9DD20 (27:5d20) -> 21 5C 5C
	scall LoadMapObjects ; 9DD23 (27:5d23) -> CD FB 40
	ld e, $03 ; 9DD26 (27:5d26) -> 1E 03
	ld hl, Data_9dccc ; 9DD28 (27:5d28) -> 21 CC 5C
	scall LoadMapObjects ; 9DD2B (27:5d2b) -> CD FB 40
	scall Func_8001c ; 9DD2E (27:5d2e) -> CD 1C 40
	call Func_9ddf2 ; 9DD31 (27:5d31) -> CD F2 5D
	jp .asm_9dda8 ; 9DD34 (27:5d34) -> C3 A8 5D
.asm_9dd37:
	ld hl, $00be ; 9DD37 (27:5d37) -> 21 BE 00
	scall CheckEventFlag ; 9DD3A (27:5d3a) -> CD 2E 46
	cp $01 ; 9DD3D (27:5d3d) -> FE 01
	jp nz, .asm_9dd62 ; 9DD3F (27:5d3f) -> C2 62 5D
	ld hl, $00ee ; 9DD42 (27:5d42) -> 21 EE 00
	scall CheckEventFlag ; 9DD45 (27:5d45) -> CD 2E 46
	or a ; 9DD48 (27:5d48) -> B7
	jp nz, .asm_9dd62 ; 9DD49 (27:5d49) -> C2 62 5D
	ld e, $03 ; 9DD4C (27:5d4c) -> 1E 03
	ld hl, Data_9dc94 ; 9DD4E (27:5d4e) -> 21 94 5C
	scall LoadMapObjects ; 9DD51 (27:5d51) -> CD FB 40
	ld e, $03 ; 9DD54 (27:5d54) -> 1E 03
	ld hl, Data_9dccc ; 9DD56 (27:5d56) -> 21 CC 5C
	scall LoadMapObjects ; 9DD59 (27:5d59) -> CD FB 40
	scall Func_8001c ; 9DD5C (27:5d5c) -> CD 1C 40
	jp .asm_9dda8 ; 9DD5F (27:5d5f) -> C3 A8 5D
.asm_9dd62:
	ld hl, $00ee ; 9DD62 (27:5d62) -> 21 EE 00
	scall CheckEventFlag ; 9DD65 (27:5d65) -> CD 2E 46
	cp $01 ; 9DD68 (27:5d68) -> FE 01
	jp nz, .asm_9dd83 ; 9DD6A (27:5d6a) -> C2 83 5D
	ld e, $01 ; 9DD6D (27:5d6d) -> 1E 01
	ld hl, Data_9dcbe ; 9DD6F (27:5d6f) -> 21 BE 5C
	scall LoadMapObjects ; 9DD72 (27:5d72) -> CD FB 40
	ld e, $03 ; 9DD75 (27:5d75) -> 1E 03
	ld hl, Data_9dc2f ; 9DD77 (27:5d77) -> 21 2F 5C
	scall Func_80ce7 ; 9DD7A (27:5d7a) -> CD E7 4C
	scall Func_8001c ; 9DD7D (27:5d7d) -> CD 1C 40
	jp .asm_9dda8 ; 9DD80 (27:5d80) -> C3 A8 5D
.asm_9dd83:
	ld e, $02 ; 9DD83 (27:5d83) -> 1E 02
	ld hl, Data_9dc78 ; 9DD85 (27:5d85) -> 21 78 5C
	scall LoadMapObjects ; 9DD88 (27:5d88) -> CD FB 40
	ld e, $03 ; 9DD8B (27:5d8b) -> 1E 03
	ld hl, Data_9dccc ; 9DD8D (27:5d8d) -> 21 CC 5C
	scall LoadMapObjects ; 9DD90 (27:5d90) -> CD FB 40
	ld hl, $00bb ; 9DD93 (27:5d93) -> 21 BB 00
	scall CheckEventFlag ; 9DD96 (27:5d96) -> CD 2E 46
	cp $01 ; 9DD99 (27:5d99) -> FE 01
	jp nz, .asm_9dda5 ; 9DD9B (27:5d9b) -> C2 A5 5D
	ld de, Data_9dc54 ; 9DD9E (27:5d9e) -> 11 54 5C
	xor a ; 9DDA1 (27:5da1) -> AF
	scall SetPersonTextPointer ; 9DDA2 (27:5da2) -> CD 50 41
.asm_9dda5:
	scall Func_8001c ; 9DDA5 (27:5da5) -> CD 1C 40
.asm_9dda8:
	ret  ; 9DDA8 (27:5da8) -> C9

Data_9dda9:
	db $16, $06, $01, $02, $06, $01

Data_9ddaf:
	db $16, $08, $01, $02, $07, $01

Data_9ddb5:
	db $16, $0a, $01, $02, $03, $04

Func_9ddbb:
	ld hl, $00ba ; 9DDBB (27:5dbb) -> 21 BA 00
	scall CheckEventFlag ; 9DDBE (27:5dbe) -> CD 2E 46
	cp $01 ; 9DDC1 (27:5dc1) -> FE 01
	jp nz, .asm_9ddd5 ; 9DDC3 (27:5dc3) -> C2 D5 5D
	ld hl, Data_9dda9 ; 9DDC6 (27:5dc6) -> 21 A9 5D
	scall Func_80d9b ; 9DDC9 (27:5dc9) -> CD 9B 4D
	ld hl, Data_9ddaf ; 9DDCC (27:5dcc) -> 21 AF 5D
	scall Func_80d9b ; 9DDCF (27:5dcf) -> CD 9B 4D
	scall Func_80f02 ; 9DDD2 (27:5dd2) -> CD 02 4F
.asm_9ddd5:
	ld hl, $00ee ; 9DDD5 (27:5dd5) -> 21 EE 00
	scall CheckEventFlag ; 9DDD8 (27:5dd8) -> CD 2E 46
	cp $01 ; 9DDDB (27:5ddb) -> FE 01
	jp nz, .asm_9dde9 ; 9DDDD (27:5ddd) -> C2 E9 5D
	ld hl, Data_9ddb5 ; 9DDE0 (27:5de0) -> 21 B5 5D
	scall Func_80d9b ; 9DDE3 (27:5de3) -> CD 9B 4D
	scall Func_80f02 ; 9DDE6 (27:5de6) -> CD 02 4F
.asm_9dde9:
	ret  ; 9DDE9 (27:5de9) -> C9

Data_9ddea:
	db $05, $07, $ff, $ff

Data_9ddee:
	db $07, $07, $ff, $ff

Func_9ddf2:
	ld hl, $001e ; 9DDF2 (27:5df2) -> 21 1E 00
	scall ScriptSleep ; 9DDF5 (27:5df5) -> CD 8F 46
	ld a, $68 ; 9DDF8 (27:5df8) -> 3E 68
	scall PlaySFX ; 9DDFA (27:5dfa) -> CD FE 4E
	ld hl, $026a ; 9DDFD (27:5dfd) -> 21 6A 02
	scall PrintTextWithNPCName ; 9DE00 (27:5e00) -> CD A9 44
	ld a, $68 ; 9DE03 (27:5e03) -> 3E 68
	scall PlaySFX ; 9DE05 (27:5e05) -> CD FE 4E
	ld hl, $001e ; 9DE08 (27:5e08) -> 21 1E 00
	scall ScriptSleep ; 9DE0B (27:5e0b) -> CD 8F 46
	ld c, $00 ; 9DE0E (27:5e0e) -> 0E 00
	ld de, Data_9ddea ; 9DE10 (27:5e10) -> 11 EA 5D
	ld a, $27 ; 9DE13 (27:5e13) -> 3E 27
	scall MovePlayer ; 9DE15 (27:5e15) -> CD 3E 46
	scall WaitNPCStep ; 9DE18 (27:5e18) -> CD 0C 42
	ld c, $00 ; 9DE1B (27:5e1b) -> 0E 00
	ld de, Data_9ddee ; 9DE1D (27:5e1d) -> 11 EE 5D
	ld a, $27 ; 9DE20 (27:5e20) -> 3E 27
	scall MovePlayer ; 9DE22 (27:5e22) -> CD 3E 46
	scall WaitNPCStep ; 9DE25 (27:5e25) -> CD 0C 42
	xor a ; 9DE28 (27:5e28) -> AF
	scall PlayerFace ; 9DE29 (27:5e29) -> CD 77 46
	ld hl, $001e ; 9DE2C (27:5e2c) -> 21 1E 00
	scall ScriptSleep ; 9DE2F (27:5e2f) -> CD 8F 46
	xor a ; 9DE32 (27:5e32) -> AF
.asm_9de33:
	cp $03 ; 9DE33 (27:5e33) -> FE 03
	jp nc, .asm_9de44 ; 9DE35 (27:5e35) -> D2 44 5E
	push af ; 9DE38 (27:5e38) -> F5
	ld e, $01 ; 9DE39 (27:5e39) -> 1E 01
	xor a ; 9DE3B (27:5e3b) -> AF
	scall PlayerStep ; 9DE3C (27:5e3c) -> CD 1E 4E
	pop af ; 9DE3F (27:5e3f) -> F1
	inc a ; 9DE40 (27:5e40) -> 3C
	jp .asm_9de33 ; 9DE41 (27:5e41) -> C3 33 5E
.asm_9de44:
	ld hl, $001e ; 9DE44 (27:5e44) -> 21 1E 00
	scall ScriptSleep ; 9DE47 (27:5e47) -> CD 8F 46
	ld c, $01 ; 9DE4A (27:5e4a) -> 0E 01
	ld e, $01 ; 9DE4C (27:5e4c) -> 1E 01
	ld a, $0a ; 9DE4E (27:5e4e) -> 3E 0A
	scall LoadEmote ; 9DE50 (27:5e50) -> CD 76 41
	ld e, $01 ; 9DE53 (27:5e53) -> 1E 01
	ld a, $06 ; 9DE55 (27:5e55) -> 3E 06
	scall MoveEmote ; 9DE57 (27:5e57) -> CD E4 41
	ld a, $62 ; 9DE5A (27:5e5a) -> 3E 62
	scall PlaySFX ; 9DE5C (27:5e5c) -> CD FE 4E
	scall WaitEmote ; 9DE5F (27:5e5f) -> CD D5 41
	scall HideEmote ; 9DE62 (27:5e62) -> CD 8B 41
	ld c, $01 ; 9DE65 (27:5e65) -> 0E 01
	ld e, $01 ; 9DE67 (27:5e67) -> 1E 01
	ld a, $0a ; 9DE69 (27:5e69) -> 3E 0A
	scall LoadEmote ; 9DE6B (27:5e6b) -> CD 76 41
	ld e, $02 ; 9DE6E (27:5e6e) -> 1E 02
	ld a, $07 ; 9DE70 (27:5e70) -> 3E 07
	scall MoveEmote ; 9DE72 (27:5e72) -> CD E4 41
	scall WaitEmote ; 9DE75 (27:5e75) -> CD D5 41
	scall HideEmote ; 9DE78 (27:5e78) -> CD 8B 41
	ld c, $01 ; 9DE7B (27:5e7b) -> 0E 01
	ld e, $01 ; 9DE7D (27:5e7d) -> 1E 01
	ld a, $0a ; 9DE7F (27:5e7f) -> 3E 0A
	scall LoadEmote ; 9DE81 (27:5e81) -> CD 76 41
	ld e, $01 ; 9DE84 (27:5e84) -> 1E 01
	ld a, $06 ; 9DE86 (27:5e86) -> 3E 06
	scall MoveEmote ; 9DE88 (27:5e88) -> CD E4 41
	ld a, $62 ; 9DE8B (27:5e8b) -> 3E 62
	scall PlaySFX ; 9DE8D (27:5e8d) -> CD FE 4E
	scall WaitEmote ; 9DE90 (27:5e90) -> CD D5 41
	scall HideEmote ; 9DE93 (27:5e93) -> CD 8B 41
	ld c, $01 ; 9DE96 (27:5e96) -> 0E 01
	ld e, $01 ; 9DE98 (27:5e98) -> 1E 01
	ld a, $0a ; 9DE9A (27:5e9a) -> 3E 0A
	scall LoadEmote ; 9DE9C (27:5e9c) -> CD 76 41
	ld e, $02 ; 9DE9F (27:5e9f) -> 1E 02
	ld a, $07 ; 9DEA1 (27:5ea1) -> 3E 07
	scall MoveEmote ; 9DEA3 (27:5ea3) -> CD E4 41
	scall WaitEmote ; 9DEA6 (27:5ea6) -> CD D5 41
	scall HideEmote ; 9DEA9 (27:5ea9) -> CD 8B 41
	xor a ; 9DEAC (27:5eac) -> AF
	scall PlayMusic ; 9DEAD (27:5ead) -> CD E6 4E
	ld a, $1c ; 9DEB0 (27:5eb0) -> 3E 1C
	scall PlayMusic ; 9DEB2 (27:5eb2) -> CD E6 4E
	ld hl, $00b4 ; 9DEB5 (27:5eb5) -> 21 B4 00
	scall ScriptSleep ; 9DEB8 (27:5eb8) -> CD 8F 46
	ld e, $01 ; 9DEBB (27:5ebb) -> 1E 01
	ld hl, $00ba ; 9DEBD (27:5ebd) -> 21 BA 00
	scall EventFlagAction ; 9DEC0 (27:5ec0) -> CD 1B 46
	call Func_9ddbb ; 9DEC3 (27:5ec3) -> CD BB 5D
	ld c, $01 ; 9DEC6 (27:5ec6) -> 0E 01
	ld e, $03 ; 9DEC8 (27:5ec8) -> 1E 03
	ld a, $27 ; 9DECA (27:5eca) -> 3E 27
	scall LoadEmote ; 9DECC (27:5ecc) -> CD 76 41
	ld e, $01 ; 9DECF (27:5ecf) -> 1E 01
	ld a, $06 ; 9DED1 (27:5ed1) -> 3E 06
	scall MoveEmote ; 9DED3 (27:5ed3) -> CD E4 41
	ld e, $80 ; 9DED6 (27:5ed6) -> 1E 80
	xor a ; 9DED8 (27:5ed8) -> AF
	scall SetPersonVisibilityState ; 9DED9 (27:5ed9) -> CD 3D 41
	ld e, $80 ; 9DEDC (27:5edc) -> 1E 80
	ld a, $01 ; 9DEDE (27:5ede) -> 3E 01
	scall SetPersonVisibilityState ; 9DEE0 (27:5ee0) -> CD 3D 41
	ld a, $51 ; 9DEE3 (27:5ee3) -> 3E 51
	scall PlaySFX ; 9DEE5 (27:5ee5) -> CD FE 4E
	scall WaitEmote ; 9DEE8 (27:5ee8) -> CD D5 41
	ld e, $81 ; 9DEEB (27:5eeb) -> 1E 81
	xor a ; 9DEED (27:5eed) -> AF
	scall SetPersonVisibilityState ; 9DEEE (27:5eee) -> CD 3D 41
	ld e, $81 ; 9DEF1 (27:5ef1) -> 1E 81
	ld a, $01 ; 9DEF3 (27:5ef3) -> 3E 01
	scall SetPersonVisibilityState ; 9DEF5 (27:5ef5) -> CD 3D 41
	ld hl, $003c ; 9DEF8 (27:5ef8) -> 21 3C 00
	scall ScriptSleep ; 9DEFB (27:5efb) -> CD 8F 46
	ld a, $69 ; 9DEFE (27:5efe) -> 3E 69
	scall PlaySFX ; 9DF00 (27:5f00) -> CD FE 4E
	ld hl, $001e ; 9DF03 (27:5f03) -> 21 1E 00
	scall ScriptSleep ; 9DF06 (27:5f06) -> CD 8F 46
	xor a ; 9DF09 (27:5f09) -> AF
	scall PlayMusic ; 9DF0A (27:5f0a) -> CD E6 4E
	ld a, $0d ; 9DF0D (27:5f0d) -> 3E 0D
	scall PlayMusic ; 9DF0F (27:5f0f) -> CD E6 4E
	ld hl, $026b ; 9DF12 (27:5f12) -> 21 6B 02
	scall PrintTextWithNPCName ; 9DF15 (27:5f15) -> CD A9 44
	ld hl, $003c ; 9DF18 (27:5f18) -> 21 3C 00
	scall ScriptSleep ; 9DF1B (27:5f1b) -> CD 8F 46
	ld c, $01 ; 9DF1E (27:5f1e) -> 0E 01
	ld e, $07 ; 9DF20 (27:5f20) -> 1E 07
	ld a, $28 ; 9DF22 (27:5f22) -> 3E 28
	scall LoadEmote ; 9DF24 (27:5f24) -> CD 76 41
	ld e, $01 ; 9DF27 (27:5f27) -> 1E 01
	ld a, $06 ; 9DF29 (27:5f29) -> 3E 06
	scall MoveEmote ; 9DF2B (27:5f2b) -> CD E4 41
	ld e, $80 ; 9DF2E (27:5f2e) -> 1E 80
	xor a ; 9DF30 (27:5f30) -> AF
	scall SetPersonVisibilityState ; 9DF31 (27:5f31) -> CD 3D 41
	ld e, $80 ; 9DF34 (27:5f34) -> 1E 80
	ld a, $01 ; 9DF36 (27:5f36) -> 3E 01
	scall SetPersonVisibilityState ; 9DF38 (27:5f38) -> CD 3D 41
	scall WaitEmote ; 9DF3B (27:5f3b) -> CD D5 41
	ld e, $81 ; 9DF3E (27:5f3e) -> 1E 81
	xor a ; 9DF40 (27:5f40) -> AF
	scall SetPersonVisibilityState ; 9DF41 (27:5f41) -> CD 3D 41
	ld e, $81 ; 9DF44 (27:5f44) -> 1E 81
	ld a, $01 ; 9DF46 (27:5f46) -> 3E 01
	scall SetPersonVisibilityState ; 9DF48 (27:5f48) -> CD 3D 41
	call NextOverworldFrame ; 9DF4B (27:5f4b) -> CD 65 04
	scall Func_801b8 ; 9DF4E (27:5f4e) -> CD B8 41
	ld hl, $003c ; 9DF51 (27:5f51) -> 21 3C 00
	scall ScriptSleep ; 9DF54 (27:5f54) -> CD 8F 46
	xor a ; 9DF57 (27:5f57) -> AF
.asm_9df58:
	cp $03 ; 9DF58 (27:5f58) -> FE 03
	jp nc, .asm_9df6a ; 9DF5A (27:5f5a) -> D2 6A 5F
	push af ; 9DF5D (27:5f5d) -> F5
	ld e, $01 ; 9DF5E (27:5f5e) -> 1E 01
	ld a, $02 ; 9DF60 (27:5f60) -> 3E 02
	scall PlayerStep ; 9DF62 (27:5f62) -> CD 1E 4E
	pop af ; 9DF65 (27:5f65) -> F1
	inc a ; 9DF66 (27:5f66) -> 3C
	jp .asm_9df58 ; 9DF67 (27:5f67) -> C3 58 5F
.asm_9df6a:
	ld hl, $001e ; 9DF6A (27:5f6a) -> 21 1E 00
	scall ScriptSleep ; 9DF6D (27:5f6d) -> CD 8F 46
	ld e, $02 ; 9DF70 (27:5f70) -> 1E 02
	xor a ; 9DF72 (27:5f72) -> AF
	scall SpriteFace ; 9DF73 (27:5f73) -> CD 95 40
	ld hl, $001e ; 9DF76 (27:5f76) -> 21 1E 00
	scall ScriptSleep ; 9DF79 (27:5f79) -> CD 8F 46
	ld e, $02 ; 9DF7C (27:5f7c) -> 1E 02
	ld a, $01 ; 9DF7E (27:5f7e) -> 3E 01
	scall SpriteFace ; 9DF80 (27:5f80) -> CD 95 40
	ld hl, $001e ; 9DF83 (27:5f83) -> 21 1E 00
	scall ScriptSleep ; 9DF86 (27:5f86) -> CD 8F 46
	ld hl, $026c ; 9DF89 (27:5f89) -> 21 6C 02
	scall PrintTextWithNPCName ; 9DF8C (27:5f8c) -> CD A9 44
	ret  ; 9DF8F (27:5f8f) -> C9

Func_9df90:
	ld a, e ; 9DF90 (27:5f90) -> 7B
	or a ; 9DF91 (27:5f91) -> B7
	jp nz, .asm_9dfe3 ; 9DF92 (27:5f92) -> C2 E3 5F
	ld a, $01 ; 9DF95 (27:5f95) -> 3E 01
	scall FacePlayer ; 9DF97 (27:5f97) -> CD 4B 44
	ld hl, $00b9 ; 9DF9A (27:5f9a) -> 21 B9 00
	scall CheckEventFlag ; 9DF9D (27:5f9d) -> CD 2E 46
	cp $01 ; 9DFA0 (27:5fa0) -> FE 01
	jp nz, .asm_9dfc2 ; 9DFA2 (27:5fa2) -> C2 C2 5F
	ld hl, $00bb ; 9DFA5 (27:5fa5) -> 21 BB 00
	scall CheckEventFlag ; 9DFA8 (27:5fa8) -> CD 2E 46
	cp $01 ; 9DFAB (27:5fab) -> FE 01
	jp nz, .asm_9dfb9 ; 9DFAD (27:5fad) -> C2 B9 5F
	ld hl, $037f ; 9DFB0 (27:5fb0) -> 21 7F 03
	scall PrintTextWithNPCName ; 9DFB3 (27:5fb3) -> CD A9 44
	jp .asm_9dfbf ; 9DFB6 (27:5fb6) -> C3 BF 5F
.asm_9dfb9:
	ld hl, $0271 ; 9DFB9 (27:5fb9) -> 21 71 02
	scall PrintTextWithNPCName ; 9DFBC (27:5fbc) -> CD A9 44
.asm_9dfbf:
	jp .asm_9dfe3 ; 9DFBF (27:5fbf) -> C3 E3 5F
.asm_9dfc2:
	ld hl, $026e ; 9DFC2 (27:5fc2) -> 21 6E 02
	scall PrintTextWithNPCNameAndYesNoBox ; 9DFC5 (27:5fc5) -> CD CA 44
	or a ; 9DFC8 (27:5fc8) -> B7
	jp nz, .asm_9dfdd ; 9DFC9 (27:5fc9) -> C2 DD 5F
	ld hl, $026f ; 9DFCC (27:5fcc) -> 21 6F 02
	scall PrintTextWithNPCName ; 9DFCF (27:5fcf) -> CD A9 44
	ld e, $01 ; 9DFD2 (27:5fd2) -> 1E 01
	ld hl, $00b9 ; 9DFD4 (27:5fd4) -> 21 B9 00
	scall EventFlagAction ; 9DFD7 (27:5fd7) -> CD 1B 46
	jp .asm_9dfe3 ; 9DFDA (27:5fda) -> C3 E3 5F
.asm_9dfdd:
	ld hl, $0270 ; 9DFDD (27:5fdd) -> 21 70 02
	scall PrintTextWithNPCName ; 9DFE0 (27:5fe0) -> CD A9 44
.asm_9dfe3:
	ret  ; 9DFE3 (27:5fe3) -> C9

Data_9dfe4:
	db $04, $15, $03, $01, $12, $00, $1e, $1a, $1e, $1b, $2e
	db $05, $03, $01, $01, $12, $10, $01, $09, $02, $09, $2e

Data_9dffa:
IF DEF(SUN)
	db $00, $03, $0b, $12, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	db $00, $03, $0b, $12, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	db $00, $03, $0b, $12, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	db $00, $03, $0b, $12, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
	db $00, $03, $0b, $12, $3b, $22, $24, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	db $00, $03, $0b, $12, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	db $00, $03, $0b, $12, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	db $00, $03, $0b, $12, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	db $00, $03, $0b, $12, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
	db $00, $03, $0b, $12, $33, $22, $24, $34, $07, $07, $14, $11, $02, $00
ENDC

Data_9e040:
	db $2f, $03, $ff, $ff

Data_9e044:
	person_event $ff, $00, $03, $10, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9e040

Func_9e052:: ; 9e052
	ld l, $00 ; 9E052 (27:6052) -> 2E 00
	push hl ; 9E054 (27:6054) -> E5
	ld c, $03 ; 9E055 (27:6055) -> 0E 03
	ld e, $05 ; 9E057 (27:6057) -> 1E 05
	ld a, $04 ; 9E059 (27:6059) -> 3E 04
	scall Func_80f24 ; 9E05B (27:605b) -> CD 24 4F
	pop bc ; 9E05E (27:605e) -> C1
	ld a, $01 ; 9E05F (27:605f) -> 3E 01
	ld [wc792], a ; 9E061 (27:6061) -> EA 92 C7
	ld e, $02 ; 9E064 (27:6064) -> 1E 02
	ld hl, Data_9dfe4 ; 9E066 (27:6066) -> 21 E4 5F
	scall LoadWarps ; 9E069 (27:6069) -> CD 3A 40
	ld e, $00 ; 9E06C (27:606c) -> 1E 00
	ld hl, $0010 ; 9E06E (27:606e) -> 21 10 00
	scall EventFlagAction ; 9E071 (27:6071) -> CD 1B 46
	ld e, $01 ; 9E074 (27:6074) -> 1E 01
	ld hl, Data_9e044 ; 9E076 (27:6076) -> 21 44 60
	scall LoadMapObjects ; 9E079 (27:6079) -> CD FB 40
	ld a, $03 ; 9E07C (27:607c) -> 3E 03
	scall Func_80d01 ; 9E07E (27:607e) -> CD 01 4D
	ld e, $05 ; 9E081 (27:6081) -> 1E 05
	ld hl, Data_9dffa ; 9E083 (27:6083) -> 21 FA 5F
	scall LoadEncounters ; 9E086 (27:6086) -> CD 24 4D
	ld a, $08 ; 9E089 (27:6089) -> 3E 08
	scall PlayMusic ; 9E08B (27:608b) -> CD E6 4E
	scall Func_8001c ; 9E08E (27:608e) -> CD 1C 40
	ret  ; 9E091 (27:6091) -> C9

Data_9e092:
	warpdef $02, $08, $01, $01, MAP_18_18, $01, $09, $00, $09, $2e
	warpdef $20, $12, $01, $01, MAP_18_16, $01, $09, $02, $09, $2e
	warpdef $20, $06, $01, $01, MAP_18_15, $07, $15, $07, $14, $2e

Data_9e0b3:
IF DEF(SUN)
	wildbot $00, $03, $0b, $12, $90, $21, $23, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $12, $72, $22, $24, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $0b, $12, $79, $22, $24, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $0b, $12, $33, $23, $25, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $0b, $12, $3b, $24, $26, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $12, $79, $21, $23, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $0b, $12, $90, $22, $24, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $0b, $12, $72, $22, $24, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $0b, $12, $3b, $23, $25, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $0b, $12, $33, $24, $26, $34, $07, $07, $14, $11, $02, $00
ENDC

Func_9e0f9:: ; 9e0f9
	ld l, $00 ; 9E0F9 (27:60f9) -> 2E 00
	push hl ; 9E0FB (27:60fb) -> E5
	ld c, $03 ; 9E0FC (27:60fc) -> 0E 03
	ld e, $03 ; 9E0FE (27:60fe) -> 1E 03
	ld a, $12 ; 9E100 (27:6100) -> 3E 12
	scall Func_80f24 ; 9E102 (27:6102) -> CD 24 4F
	pop bc ; 9E105 (27:6105) -> C1
	ld a, $04 ; 9E106 (27:6106) -> 3E 04
	ld [wc792], a ; 9E108 (27:6108) -> EA 92 C7
	xor a ; 9E10B (27:610b) -> AF
	ld [wc794], a ; 9E10C (27:610c) -> EA 94 C7
	ld e, $03 ; 9E10F (27:610f) -> 1E 03
	ld hl, Data_9e092 ; 9E111 (27:6111) -> 21 92 60
	scall LoadWarps ; 9E114 (27:6114) -> CD 3A 40
	ld a, $03 ; 9E117 (27:6117) -> 3E 03
	scall Func_80d01 ; 9E119 (27:6119) -> CD 01 4D
	ld e, $05 ; 9E11C (27:611c) -> 1E 05
	ld hl, Data_9e0b3 ; 9E11E (27:611e) -> 21 B3 60
	scall LoadEncounters ; 9E121 (27:6121) -> CD 24 4D
	ld a, $08 ; 9E124 (27:6124) -> 3E 08
	scall PlayMusic ; 9E126 (27:6126) -> CD E6 4E
	scall Func_8001c ; 9E129 (27:6129) -> CD 1C 40
	ret  ; 9E12C (27:612c) -> C9

Data_9e12d:
	warpdef $02, $08, $01, $01, MAP_18_18, $01, $09, $00, $09, $2e
	warpdef $20, $12, $01, $01, MAP_18_13, $02, $08, $03, $08, $2e
	warpdef $20, $06, $01, $01, MAP_18_15, $07, $15, $07, $14, $2e

Data_9e14e:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $23, $25, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $23, $25, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $24, $26, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $25, $27, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $28, $11, $3b, $26, $28, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $23, $25, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $23, $25, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $24, $26, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $25, $27, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $28, $11, $33, $26, $28, $34, $07, $07, $14, $11, $02, $00
ENDC

Func_9e194:: ; 9e194
	ld l, $00 ; 9E194 (27:6194) -> 2E 00
	push hl ; 9E196 (27:6196) -> E5
	ld c, $03 ; 9E197 (27:6197) -> 0E 03
	ld e, $03 ; 9E199 (27:6199) -> 1E 03
	ld a, $12 ; 9E19B (27:619b) -> 3E 12
	scall Func_80f24 ; 9E19D (27:619d) -> CD 24 4F
	pop bc ; 9E1A0 (27:61a0) -> C1
	ld a, $07 ; 9E1A1 (27:61a1) -> 3E 07
	ld [wc792], a ; 9E1A3 (27:61a3) -> EA 92 C7
	xor a ; 9E1A6 (27:61a6) -> AF
	ld [wc794], a ; 9E1A7 (27:61a7) -> EA 94 C7
	ld e, $03 ; 9E1AA (27:61aa) -> 1E 03
	ld hl, Data_9e12d ; 9E1AC (27:61ac) -> 21 2D 61
	scall LoadWarps ; 9E1AF (27:61af) -> CD 3A 40
	ld a, $03 ; 9E1B2 (27:61b2) -> 3E 03
	scall Func_80d01 ; 9E1B4 (27:61b4) -> CD 01 4D
	ld e, $05 ; 9E1B7 (27:61b7) -> 1E 05
	ld hl, Data_9e14e ; 9E1B9 (27:61b9) -> 21 4E 61
	scall LoadEncounters ; 9E1BC (27:61bc) -> CD 24 4D
	ld a, $08 ; 9E1BF (27:61bf) -> 3E 08
	scall PlayMusic ; 9E1C1 (27:61c1) -> CD E6 4E
	scall Func_8001c ; 9E1C4 (27:61c4) -> CD 1C 40
	ret  ; 9E1C7 (27:61c7) -> C9

Data_9e1c8:
	warpdef $02, $08, $01, $01, MAP_18_12, $20, $12, $1f, $12, $2e
	warpdef $20, $06, $01, $01, MAP_18_15, $07, $15, $07, $14, $2e

Data_9e1de:
	db $1d, $17, $03

Data_9e1e1:
	db $1d, $17, $03, $00, $00

Data_9e1e6:
	person_event $00, $04, $17, $04, $01, $01, $02, $04, $00, Func_806dd_27, Data_9e1de

Data_9e1f4:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $24, $26, $3c, $25, $12, $00, $06, $0a, $00
	wildbot $00, $03, $28, $11, $72, $24, $26, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $25, $27, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $26, $28, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $28, $11, $3b, $27, $29, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $24, $26, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $24, $26, $3c, $25, $12, $00, $06, $09, $00
	wildbot $00, $03, $28, $11, $72, $25, $27, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $26, $28, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $28, $11, $33, $27, $29, $34, $07, $07, $14, $11, $02, $00
ENDC

Func_9e23a:: ; 9e23a
	ld l, $00 ; 9E23A (27:623a) -> 2E 00
	push hl ; 9E23C (27:623c) -> E5
	ld c, $03 ; 9E23D (27:623d) -> 0E 03
	ld e, $03 ; 9E23F (27:623f) -> 1E 03
	ld a, $12 ; 9E241 (27:6241) -> 3E 12
	scall Func_80f24 ; 9E243 (27:6243) -> CD 24 4F
	pop bc ; 9E246 (27:6246) -> C1
	ld a, $08 ; 9E247 (27:6247) -> 3E 08
	ld [wc792], a ; 9E249 (27:6249) -> EA 92 C7
	xor a ; 9E24C (27:624c) -> AF
	ld [wc794], a ; 9E24D (27:624d) -> EA 94 C7
	ld e, $02 ; 9E250 (27:6250) -> 1E 02
	ld hl, Data_9e1c8 ; 9E252 (27:6252) -> 21 C8 61
	scall LoadWarps ; 9E255 (27:6255) -> CD 3A 40
	ld e, $01 ; 9E258 (27:6258) -> 1E 01
	ld hl, Data_9e1e1 ; 9E25A (27:625a) -> 21 E1 61
	scall Func_80ce7 ; 9E25D (27:625d) -> CD E7 4C
	ld a, $03 ; 9E260 (27:6260) -> 3E 03
	scall Func_80d01 ; 9E262 (27:6262) -> CD 01 4D
	ld e, $05 ; 9E265 (27:6265) -> 1E 05
	ld hl, Data_9e1f4 ; 9E267 (27:6267) -> 21 F4 61
	scall LoadEncounters ; 9E26A (27:626a) -> CD 24 4D
	ld e, $01 ; 9E26D (27:626d) -> 1E 01
	ld hl, Data_9e1e6 ; 9E26F (27:626f) -> 21 E6 61
	scall LoadMapObjects ; 9E272 (27:6272) -> CD FB 40
	ld a, $08 ; 9E275 (27:6275) -> 3E 08
	scall PlayMusic ; 9E277 (27:6277) -> CD E6 4E
	scall Func_8001c ; 9E27A (27:627a) -> CD 1C 40
	ret  ; 9E27D (27:627d) -> C9

Data_9e27e:
	warpdef $03, $0e, $03, $01, MAP_18_15, $07, $02, $07, $03, $2e

Data_9e289:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
ENDC

Data_9e2c1:
	person_event $ff, $00, $02, $04, $05, $04, $00, $04, $00, Func_9e305, NULL

Func_9e2cf:: ; 9e2cf
	ld e, $01 ; 9E2CF (27:62cf) -> 1E 01
	ld hl, Data_9e27e ; 9E2D1 (27:62d1) -> 21 7E 62
	scall LoadWarps ; 9E2D4 (27:62d4) -> CD 3A 40
	ld e, $01 ; 9E2D7 (27:62d7) -> 1E 01
	ld hl, Data_9e2c1 ; 9E2D9 (27:62d9) -> 21 C1 62
	scall LoadMapObjects ; 9E2DC (27:62dc) -> CD FB 40
	ld a, $03 ; 9E2DF (27:62df) -> 3E 03
	scall Func_80d01 ; 9E2E1 (27:62e1) -> CD 01 4D
	ld e, $04 ; 9E2E4 (27:62e4) -> 1E 04
	ld hl, Data_9e289 ; 9E2E6 (27:62e6) -> 21 89 62
	scall LoadEncounters ; 9E2E9 (27:62e9) -> CD 24 4D
	ld a, $08 ; 9E2EC (27:62ec) -> 3E 08
	scall PlayMusic ; 9E2EE (27:62ee) -> CD E6 4E
	scall Func_8001c ; 9E2F1 (27:62f1) -> CD 1C 40
	ret  ; 9E2F4 (27:62f4) -> C9

Data_9e2f5:
	db $07, $08, $04, $08, $ff, $ff

Data_9e2fb:
	db $04, $08, $ff, $ff

Data_9e2ff:
	db $01, $08, $04, $08, $ff, $ff

Func_9e305:
	ld a, e ; 9E305 (27:6305) -> 7B
	or a ; 9E306 (27:6306) -> B7
	jp nz, .asm_9e3c8 ; 9E307 (27:6307) -> C2 C8 63
	ld a, $0f ; 9E30A (27:630a) -> 3E 0F
	scall Func_80e6d ; 9E30C (27:630c) -> CD 6D 4E
	cp $ff ; 9E30F (27:630f) -> FE FF
	jp nz, .asm_9e332 ; 9E311 (27:6311) -> C2 32 63
	ld a, $41 ; 9E314 (27:6314) -> 3E 41
	scall Func_80e6d ; 9E316 (27:6316) -> CD 6D 4E
	cp $ff ; 9E319 (27:6319) -> FE FF
	jp nz, .asm_9e332 ; 9E31B (27:631b) -> C2 32 63
	ld a, $50 ; 9E31E (27:631e) -> 3E 50
	scall Func_80e6d ; 9E320 (27:6320) -> CD 6D 4E
	cp $ff ; 9E323 (27:6323) -> FE FF
	jp nz, .asm_9e332 ; 9E325 (27:6325) -> C2 32 63
	ld a, $64 ; 9E328 (27:6328) -> 3E 64
	scall Func_80e6d ; 9E32A (27:632a) -> CD 6D 4E
	cp $ff ; 9E32D (27:632d) -> FE FF
	jp z, .asm_9e3c2 ; 9E32F (27:632f) -> CA C2 63
.asm_9e332:
	ld a, [wc790] ; 9E332 (27:6332) -> FA 90 C7
	or a ; 9E335 (27:6335) -> B7
	jp z, .asm_9e3b9 ; 9E336 (27:6336) -> CA B9 63
	ld a, [wc790] ; 9E339 (27:6339) -> FA 90 C7
	cp $06 ; 9E33C (27:633c) -> FE 06
	jp nc, .asm_9e3b9 ; 9E33E (27:633e) -> D2 B9 63
	ld hl, $032d ; 9E341 (27:6341) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 9E344 (27:6344) -> CD BA 44
	or a ; 9E347 (27:6347) -> B7
	jp nz, .asm_9e3b6 ; 9E348 (27:6348) -> C2 B6 63
	ld a, [wPlayerFacing] ; 9E34B (27:634b) -> FA 38 C8
	cp $01 ; 9E34E (27:634e) -> FE 01
	jp z, .asm_9e364 ; 9E350 (27:6350) -> CA 64 63
	or a ; 9E353 (27:6353) -> B7
	jp nz, .asm_9e371 ; 9E354 (27:6354) -> C2 71 63
	ld c, $01 ; 9E357 (27:6357) -> 0E 01
	ld de, Data_9e2fb ; 9E359 (27:6359) -> 11 FB 62
	ld a, $27 ; 9E35C (27:635c) -> 3E 27
	scall MovePlayer ; 9E35E (27:635e) -> CD 3E 46
	jp .asm_9e37b ; 9E361 (27:6361) -> C3 7B 63
.asm_9e364:
	ld c, $01 ; 9E364 (27:6364) -> 0E 01
	ld de, Data_9e2ff ; 9E366 (27:6366) -> 11 FF 62
	ld a, $27 ; 9E369 (27:6369) -> 3E 27
	scall MovePlayer ; 9E36B (27:636b) -> CD 3E 46
	jp .asm_9e37b ; 9E36E (27:636e) -> C3 7B 63
.asm_9e371:
	ld c, $01 ; 9E371 (27:6371) -> 0E 01
	ld de, Data_9e2f5 ; 9E373 (27:6373) -> 11 F5 62
	ld a, $27 ; 9E376 (27:6376) -> 3E 27
	scall MovePlayer ; 9E378 (27:6378) -> CD 3E 46
.asm_9e37b:
	scall WaitNPCStep ; 9E37B (27:637b) -> CD 0C 42
	xor a ; 9E37E (27:637e) -> AF
	scall PlayMusic ; 9E37F (27:637f) -> CD E6 4E
	ld a, $0a ; 9E382 (27:6382) -> 3E 0A
	scall PlayMusic ; 9E384 (27:6384) -> CD E6 4E
	xor a ; 9E387 (27:6387) -> AF
	scall Func_80653 ; 9E388 (27:6388) -> CD 53 46
	ld c, $01 ; 9E38B (27:638b) -> 0E 01
	ld e, $01 ; 9E38D (27:638d) -> 1E 01
	ld a, $0b ; 9E38F (27:638f) -> 3E 0B
	scall LoadEmote ; 9E391 (27:6391) -> CD 76 41
	ld a, $44 ; 9E394 (27:6394) -> 3E 44
	scall PlaySFX ; 9E396 (27:6396) -> CD FE 4E
	scall WaitEmote ; 9E399 (27:6399) -> CD D5 41
	scall HideEmote ; 9E39C (27:639c) -> CD 8B 41
	ld a, $04 ; 9E39F (27:639f) -> 3E 04
	scall LoadPlayerSprite ; 9E3A1 (27:63a1) -> CD C6 4C
	ld a, $03 ; 9E3A4 (27:63a4) -> 3E 03
	scall PlayerFace ; 9E3A6 (27:63a6) -> CD 77 46
	ld l, $09 ; 9E3A9 (27:63a9) -> 2E 09
	push hl ; 9E3AB (27:63ab) -> E5
	ld c, $07 ; 9E3AC (27:63ac) -> 0E 07
	ld e, $11 ; 9E3AE (27:63ae) -> 1E 11
	ld a, $12 ; 9E3B0 (27:63b0) -> 3E 12
	scall Func_80dff ; 9E3B2 (27:63b2) -> CD FF 4D
	pop bc ; 9E3B5 (27:63b5) -> C1
.asm_9e3b6:
	jp .asm_9e3bf ; 9E3B6 (27:63b6) -> C3 BF 63
.asm_9e3b9:
	ld hl, $0377 ; 9E3B9 (27:63b9) -> 21 77 03
	scall PrintTextStandard ; 9E3BC (27:63bc) -> CD 98 44
.asm_9e3bf:
	jp .asm_9e3c8 ; 9E3BF (27:63bf) -> C3 C8 63
.asm_9e3c2:
	ld hl, $0376 ; 9E3C2 (27:63c2) -> 21 76 03
	scall PrintTextStandard ; 9E3C5 (27:63c5) -> CD 98 44
.asm_9e3c8:
	ret  ; 9E3C8 (27:63c8) -> C9

Data_9e3c9:
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e3d4:
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e3df:
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e

Data_9e3ea:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
	wildbot $00, $03, $28, $11, $3b, $22, $24, $45, $07, $09, $00, $11, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
	wildbot $00, $03, $28, $11, $33, $22, $24, $34, $07, $07, $14, $11, $02, $00
ENDC

Data_9e430:
	person_event $1d, $04, $04, $0b, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $07, $0f, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $08, $07, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $1d, $04, $0a, $0d, $01, $01, $02, $04, $00, Func_9e5f6, NULL
	person_event $ff, $00, $07, $09, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $08, $0a, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $08, $0c, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $07, $15, $01, $01, $00, $04, $01, NULL, NULL

Func_9e4d8:: ; 9e4d8
	ld l, $00 ; 9E4D8 (27:64d8) -> 2E 00
	push hl ; 9E4DA (27:64da) -> E5
	ld c, $09 ; 9E4DB (27:64db) -> 0E 09
	ld e, $04 ; 9E4DD (27:64dd) -> 1E 04
	ld a, $03 ; 9E4DF (27:64df) -> 3E 03
	scall Func_80f24 ; 9E4E1 (27:64e1) -> CD 24 4F
	pop bc ; 9E4E4 (27:64e4) -> C1
	ld a, [wc794] ; 9E4E5 (27:64e5) -> FA 94 C7
	or a ; 9E4E8 (27:64e8) -> B7
	jp z, .asm_9e4f7 ; 9E4E9 (27:64e9) -> CA F7 64
	ld a, $01 ; 9E4EC (27:64ec) -> 3E 01
	call Func_9e7f4 ; 9E4EE (27:64ee) -> CD F4 67
	ld hl, Func_9e7f4 ; 9E4F1 (27:64f1) -> 21 F4 67
	scall Func_80f11 ; 9E4F4 (27:64f4) -> CD 11 4F
.asm_9e4f7:
	ld a, [wBackupMapNumber] ; 9E4F7 (27:64f7) -> FA E0 C7
	cp $0b ; 9E4FA (27:64fa) -> FE 0B
	jp nz, .asm_9e50f ; 9E4FC (27:64fc) -> C2 0F 65
	ld e, $01 ; 9E4FF (27:64ff) -> 1E 01
	ld hl, Data_9e3c9 ; 9E501 (27:6501) -> 21 C9 63
	scall LoadWarps ; 9E504 (27:6504) -> CD 3A 40
	ld a, $04 ; 9E507 (27:6507) -> 3E 04
	ld [wc792], a ; 9E509 (27:6509) -> EA 92 C7
	jp .asm_9e585 ; 9E50C (27:650c) -> C3 85 65
.asm_9e50f:
	ld a, [wBackupMapNumber] ; 9E50F (27:650f) -> FA E0 C7
	cp $0c ; 9E512 (27:6512) -> FE 0C
	jp nz, .asm_9e527 ; 9E514 (27:6514) -> C2 27 65
	ld e, $01 ; 9E517 (27:6517) -> 1E 01
	ld hl, Data_9e3d4 ; 9E519 (27:6519) -> 21 D4 63
	scall LoadWarps ; 9E51C (27:651c) -> CD 3A 40
	ld a, $07 ; 9E51F (27:651f) -> 3E 07
	ld [wc792], a ; 9E521 (27:6521) -> EA 92 C7
	jp .asm_9e585 ; 9E524 (27:6524) -> C3 85 65
.asm_9e527:
	ld a, [wBackupMapNumber] ; 9E527 (27:6527) -> FA E0 C7
	cp $0d ; 9E52A (27:652a) -> FE 0D
	jp nz, .asm_9e53f ; 9E52C (27:652c) -> C2 3F 65
	ld e, $01 ; 9E52F (27:652f) -> 1E 01
	ld hl, Data_9e3df ; 9E531 (27:6531) -> 21 DF 63
	scall LoadWarps ; 9E534 (27:6534) -> CD 3A 40
	ld a, $08 ; 9E537 (27:6537) -> 3E 08
	ld [wc792], a ; 9E539 (27:6539) -> EA 92 C7
	jp .asm_9e585 ; 9E53C (27:653c) -> C3 85 65
.asm_9e53f:
	ld a, [wBackupMapNumber] ; 9E53F (27:653f) -> FA E0 C7
	cp $11 ; 9E542 (27:6542) -> FE 11
	jp z, .asm_9e54f ; 9E544 (27:6544) -> CA 4F 65
	ld a, [wBackupMapNumber] ; 9E547 (27:6547) -> FA E0 C7
	cp $0e ; 9E54A (27:654a) -> FE 0E
	jp nz, .asm_9e585 ; 9E54C (27:654c) -> C2 85 65
.asm_9e54f:
	ld a, [wc792] ; 9E54F (27:654f) -> FA 92 C7
	cp $04 ; 9E552 (27:6552) -> FE 04
	jp nz, .asm_9e562 ; 9E554 (27:6554) -> C2 62 65
	ld e, $01 ; 9E557 (27:6557) -> 1E 01
	ld hl, Data_9e3c9 ; 9E559 (27:6559) -> 21 C9 63
	scall LoadWarps ; 9E55C (27:655c) -> CD 3A 40
	jp .asm_9e585 ; 9E55F (27:655f) -> C3 85 65
.asm_9e562:
	ld a, [wc792] ; 9E562 (27:6562) -> FA 92 C7
	cp $07 ; 9E565 (27:6565) -> FE 07
	jp nz, .asm_9e575 ; 9E567 (27:6567) -> C2 75 65
	ld e, $01 ; 9E56A (27:656a) -> 1E 01
	ld hl, Data_9e3d4 ; 9E56C (27:656c) -> 21 D4 63
	scall LoadWarps ; 9E56F (27:656f) -> CD 3A 40
	jp .asm_9e585 ; 9E572 (27:6572) -> C3 85 65
.asm_9e575:
	ld a, [wc792] ; 9E575 (27:6575) -> FA 92 C7
	cp $08 ; 9E578 (27:6578) -> FE 08
	jp nz, .asm_9e585 ; 9E57A (27:657a) -> C2 85 65
	ld e, $01 ; 9E57D (27:657d) -> 1E 01
	ld hl, Data_9e3df ; 9E57F (27:657f) -> 21 DF 63
	scall LoadWarps ; 9E582 (27:6582) -> CD 3A 40
.asm_9e585:
	ld e, $0c ; 9E585 (27:6585) -> 1E 0C
	ld hl, Data_9e430 ; 9E587 (27:6587) -> 21 30 64
	scall LoadMapObjects ; 9E58A (27:658a) -> CD FB 40
	ld a, $03 ; 9E58D (27:658d) -> 3E 03
	scall Func_80d01 ; 9E58F (27:658f) -> CD 01 4D
	ld e, $05 ; 9E592 (27:6592) -> 1E 05
	ld hl, Data_9e3ea ; 9E594 (27:6594) -> 21 EA 63
	scall LoadEncounters ; 9E597 (27:6597) -> CD 24 4D
	ld a, $08 ; 9E59A (27:659a) -> 3E 08
	scall PlayMusic ; 9E59C (27:659c) -> CD E6 4E
	ld a, [wc794] ; 9E59F (27:659f) -> FA 94 C7
	or a ; 9E5A2 (27:65a2) -> B7
	jp z, .asm_9e5d2 ; 9E5A3 (27:65a3) -> CA D2 65
	ld a, [wBackupMapNumber] ; 9E5A6 (27:65a6) -> FA E0 C7
	cp $11 ; 9E5A9 (27:65a9) -> FE 11
	jp z, .asm_9e5b6 ; 9E5AB (27:65ab) -> CA B6 65
	ld a, [wBackupMapNumber] ; 9E5AE (27:65ae) -> FA E0 C7
	cp $0e ; 9E5B1 (27:65b1) -> FE 0E
	jp nz, .asm_9e5c4 ; 9E5B3 (27:65b3) -> C2 C4 65
.asm_9e5b6:
	scall Func_8001c ; 9E5B6 (27:65b6) -> CD 1C 40
	xor a ; 9E5B9 (27:65b9) -> AF
	call Func_9e7f4 ; 9E5BA (27:65ba) -> CD F4 67
	xor a ; 9E5BD (27:65bd) -> AF
	ld [wc794], a ; 9E5BE (27:65be) -> EA 94 C7
	jp .asm_9e5cf ; 9E5C1 (27:65c1) -> C3 CF 65
.asm_9e5c4:
	xor a ; 9E5C4 (27:65c4) -> AF
	ld [wc794], a ; 9E5C5 (27:65c5) -> EA 94 C7
	xor a ; 9E5C8 (27:65c8) -> AF
	call Func_9e7f4 ; 9E5C9 (27:65c9) -> CD F4 67
	scall Func_8001c ; 9E5CC (27:65cc) -> CD 1C 40
.asm_9e5cf:
	jp .asm_9e5dd ; 9E5CF (27:65cf) -> C3 DD 65
.asm_9e5d2:
	xor a ; 9E5D2 (27:65d2) -> AF
	ld [wc794], a ; 9E5D3 (27:65d3) -> EA 94 C7
	xor a ; 9E5D6 (27:65d6) -> AF
	call Func_9e7f4 ; 9E5D7 (27:65d7) -> CD F4 67
	scall Func_8001c ; 9E5DA (27:65da) -> CD 1C 40
.asm_9e5dd:
	ret  ; 9E5DD (27:65dd) -> C9

Data_9e5de:
	db $04, $07, $08, $00

Data_9e5e2:
	db $04, $07, $0a, $00

Data_9e5e6:
	db $04, $05, $0a, $00

Data_9e5ea:
	db $04, $05, $08, $0a

Data_9e5ee:
	db $04, $05, $07, $0a

Data_9e5f2:
	db $00, $00, $00, $00

Func_9e5f6:
	push af ; 9E5F6 (27:65f6) -> F5
	push bc ; 9E5F7 (27:65f7) -> C5
	push bc ; 9E5F8 (27:65f8) -> C5
	push bc ; 9E5F9 (27:65f9) -> C5
	push bc ; 9E5FA (27:65fa) -> C5
	push bc ; 9E5FB (27:65fb) -> C5
	push bc ; 9E5FC (27:65fc) -> C5
	push de ; 9E5FD (27:65fd) -> D5
	ld hl, sp+$09 ; 9E5FE (27:65fe) -> F8 09
	push de ; 9E600 (27:6600) -> D5
	push hl ; 9E601 (27:6601) -> E5
	pop de ; 9E602 (27:6602) -> D1
	pop hl ; 9E603 (27:6603) -> E1
	ld hl, Data_9e5f2 ; 9E604 (27:6604) -> 21 F2 65
	ld bc, $0004 ; 9E607 (27:6607) -> 01 04 00
	call MemCopy ; 9E60A (27:660a) -> CD E8 35
	ld hl, sp+$02 ; 9E60D (27:660d) -> F8 02
	ld a, $ff ; 9E60F (27:660f) -> 3E FF
	ld [hl], a ; 9E611 (27:6611) -> 77
	ld hl, sp+$03 ; 9E612 (27:6612) -> F8 03
	ld [hl], a ; 9E614 (27:6614) -> 77
	ld hl, sp+$04 ; 9E615 (27:6615) -> F8 04
	ld [hl], a ; 9E617 (27:6617) -> 77
	ld hl, sp+$05 ; 9E618 (27:6618) -> F8 05
	ld [hl], a ; 9E61A (27:661a) -> 77
	ld hl, sp+$06 ; 9E61B (27:661b) -> F8 06
	ld [hl], a ; 9E61D (27:661d) -> 77
	pop de ; 9E61E (27:661e) -> D1
	ld a, e ; 9E61F (27:661f) -> 7B
	cp $03 ; 9E620 (27:6620) -> FE 03
	jp z, .asm_9e63d ; 9E622 (27:6622) -> CA 3D 66
	cp $01 ; 9E625 (27:6625) -> FE 01
	jp nz, .asm_9e7e5 ; 9E627 (27:6627) -> C2 E5 67
	ld hl, sp+$0d ; 9E62A (27:662a) -> F8 0D
	ld a, [hl] ; 9E62C (27:662c) -> 7E
	scall Func_80bde ; 9E62D (27:662d) -> CD DE 4B
	cp $01 ; 9E630 (27:6630) -> FE 01
	jp nz, .asm_9e63a ; 9E632 (27:6632) -> C2 3A 66
	ld a, $01 ; 9E635 (27:6635) -> 3E 01
	ld [wc7c4], a ; 9E637 (27:6637) -> EA C4 C7
.asm_9e63a:
	jp .asm_9e7e5 ; 9E63A (27:663a) -> C3 E5 67
.asm_9e63d:
	ld a, [wc794] ; 9E63D (27:663d) -> FA 94 C7
	ld l, a ; 9E640 (27:6640) -> 6F
	push hl ; 9E641 (27:6641) -> E5
	xor a ; 9E642 (27:6642) -> AF
	ld [wc794], a ; 9E643 (27:6643) -> EA 94 C7
	ld hl, sp+$07 ; 9E646 (27:6646) -> F8 07
	ld [hl], $00 ; 9E648 (27:6648) -> 36 00
	ld hl, sp+$08 ; 9E64A (27:664a) -> F8 08
	ld [hl], $04 ; 9E64C (27:664c) -> 36 04
.asm_9e64e:
	ld hl, sp+$08 ; 9E64E (27:664e) -> F8 08
	ld a, [hl] ; 9E650 (27:6650) -> 7E
	cp $0b ; 9E651 (27:6651) -> FE 0B
	jp nc, .asm_9e6a6 ; 9E653 (27:6653) -> D2 A6 66
	ld hl, sp+$08 ; 9E656 (27:6656) -> F8 08
	ld e, [hl] ; 9E658 (27:6658) -> 5E
	xor a ; 9E659 (27:6659) -> AF
	scall CheckObjectsOccupyingSameTile ; 9E65A (27:665a) -> CD E9 40
	cp $01 ; 9E65D (27:665d) -> FE 01
	jp z, .asm_9e689 ; 9E65F (27:665f) -> CA 89 66
	ld hl, sp+$08 ; 9E662 (27:6662) -> F8 08
	ld e, [hl] ; 9E664 (27:6664) -> 5E
	ld a, $01 ; 9E665 (27:6665) -> 3E 01
	scall CheckObjectsOccupyingSameTile ; 9E667 (27:6667) -> CD E9 40
	cp $01 ; 9E66A (27:666a) -> FE 01
	jp z, .asm_9e689 ; 9E66C (27:666c) -> CA 89 66
	ld hl, sp+$08 ; 9E66F (27:666f) -> F8 08
	ld e, [hl] ; 9E671 (27:6671) -> 5E
	ld a, $02 ; 9E672 (27:6672) -> 3E 02
	scall CheckObjectsOccupyingSameTile ; 9E674 (27:6674) -> CD E9 40
	cp $01 ; 9E677 (27:6677) -> FE 01
	jp z, .asm_9e689 ; 9E679 (27:6679) -> CA 89 66
	ld hl, sp+$08 ; 9E67C (27:667c) -> F8 08
	ld e, [hl] ; 9E67E (27:667e) -> 5E
	ld a, $03 ; 9E67F (27:667f) -> 3E 03
	scall CheckObjectsOccupyingSameTile ; 9E681 (27:6681) -> CD E9 40
	cp $01 ; 9E684 (27:6684) -> FE 01
	jp nz, .asm_9e69c ; 9E686 (27:6686) -> C2 9C 66
.asm_9e689:
	ld hl, sp+$08 ; 9E689 (27:6689) -> F8 08
	ld a, [hl] ; 9E68B (27:668b) -> 7E
	ld hl, sp+$07 ; 9E68C (27:668c) -> F8 07
	ld e, [hl] ; 9E68E (27:668e) -> 5E
	ld d, $00 ; 9E68F (27:668f) -> 16 00
	ld hl, sp+$09 ; 9E691 (27:6691) -> F8 09
	add hl, de ; 9E693 (27:6693) -> 19
	ld [hl], a ; 9E694 (27:6694) -> 77
	ld hl, sp+$07 ; 9E695 (27:6695) -> F8 07
	ld a, [hl] ; 9E697 (27:6697) -> 7E
	inc a ; 9E698 (27:6698) -> 3C
	ld hl, sp+$07 ; 9E699 (27:6699) -> F8 07
	ld [hl], a ; 9E69B (27:669b) -> 77
.asm_9e69c:
	ld hl, sp+$08 ; 9E69C (27:669c) -> F8 08
	ld a, [hl] ; 9E69E (27:669e) -> 7E
	inc a ; 9E69F (27:669f) -> 3C
	ld hl, sp+$08 ; 9E6A0 (27:66a0) -> F8 08
	ld [hl], a ; 9E6A2 (27:66a2) -> 77
	jp .asm_9e64e ; 9E6A3 (27:66a3) -> C3 4E 66
.asm_9e6a6:
	ld hl, sp+$08 ; 9E6A6 (27:66a6) -> F8 08
	ld [hl], $00 ; 9E6A8 (27:66a8) -> 36 00
.asm_9e6aa:
	ld hl, sp+$08 ; 9E6AA (27:66aa) -> F8 08
	ld a, [hl] ; 9E6AC (27:66ac) -> 7E
	cp $04 ; 9E6AD (27:66ad) -> FE 04
	jp nc, .asm_9e6d1 ; 9E6AF (27:66af) -> D2 D1 66
	ld e, $0b ; 9E6B2 (27:66b2) -> 1E 0B
	ld hl, sp+$08 ; 9E6B4 (27:66b4) -> F8 08
	ld a, [hl] ; 9E6B6 (27:66b6) -> 7E
	scall CheckObjectsOccupyingSameTile ; 9E6B7 (27:66b7) -> CD E9 40
	cp $01 ; 9E6BA (27:66ba) -> FE 01
	jp nz, .asm_9e6c7 ; 9E6BC (27:66bc) -> C2 C7 66
	ld e, $00 ; 9E6BF (27:66bf) -> 1E 00
	ld hl, sp+$08 ; 9E6C1 (27:66c1) -> F8 08
	ld a, [hl] ; 9E6C3 (27:66c3) -> 7E
	scall SetPersonVisibilityState ; 9E6C4 (27:66c4) -> CD 3D 41
.asm_9e6c7:
	ld hl, sp+$08 ; 9E6C7 (27:66c7) -> F8 08
	ld a, [hl] ; 9E6C9 (27:66c9) -> 7E
	inc a ; 9E6CA (27:66ca) -> 3C
	ld hl, sp+$08 ; 9E6CB (27:66cb) -> F8 08
	ld [hl], a ; 9E6CD (27:66cd) -> 77
	jp .asm_9e6aa ; 9E6CE (27:66ce) -> C3 AA 66
.asm_9e6d1:
	ld c, $00 ; 9E6D1 (27:66d1) -> 0E 00
.asm_9e6d3:
	ld a, c ; 9E6D3 (27:66d3) -> 79
	cp $04 ; 9E6D4 (27:66d4) -> FE 04
	jp nc, .asm_9e773 ; 9E6D6 (27:66d6) -> D2 73 67
	ld hl, sp+$06 ; 9E6D9 (27:66d9) -> F8 06
	ld a, [hl] ; 9E6DB (27:66db) -> 7E
	cp $ff ; 9E6DC (27:66dc) -> FE FF
	jp nz, .asm_9e6f7 ; 9E6DE (27:66de) -> C2 F7 66
	ld e, c ; 9E6E1 (27:66e1) -> 59
	ld d, $00 ; 9E6E2 (27:66e2) -> 16 00
	ld hl, Data_9e5de ; 9E6E4 (27:66e4) -> 21 DE 65
	add hl, de ; 9E6E7 (27:66e7) -> 19
	ld a, [hl] ; 9E6E8 (27:66e8) -> 7E
	ld e, c ; 9E6E9 (27:66e9) -> 59
	ld d, $00 ; 9E6EA (27:66ea) -> 16 00
	ld hl, sp+$09 ; 9E6EC (27:66ec) -> F8 09
	add hl, de ; 9E6EE (27:66ee) -> 19
	cp [hl] ; 9E6EF (27:66ef) -> BE
	jp z, .asm_9e6f7 ; 9E6F0 (27:66f0) -> CA F7 66
	ld hl, sp+$06 ; 9E6F3 (27:66f3) -> F8 06
	ld [hl], $00 ; 9E6F5 (27:66f5) -> 36 00
.asm_9e6f7:
	ld hl, sp+$05 ; 9E6F7 (27:66f7) -> F8 05
	ld a, [hl] ; 9E6F9 (27:66f9) -> 7E
	cp $ff ; 9E6FA (27:66fa) -> FE FF
	jp nz, .asm_9e715 ; 9E6FC (27:66fc) -> C2 15 67
	ld e, c ; 9E6FF (27:66ff) -> 59
	ld d, $00 ; 9E700 (27:6700) -> 16 00
	ld hl, Data_9e5e2 ; 9E702 (27:6702) -> 21 E2 65
	add hl, de ; 9E705 (27:6705) -> 19
	ld a, [hl] ; 9E706 (27:6706) -> 7E
	ld e, c ; 9E707 (27:6707) -> 59
	ld d, $00 ; 9E708 (27:6708) -> 16 00
	ld hl, sp+$09 ; 9E70A (27:670a) -> F8 09
	add hl, de ; 9E70C (27:670c) -> 19
	cp [hl] ; 9E70D (27:670d) -> BE
	jp z, .asm_9e715 ; 9E70E (27:670e) -> CA 15 67
	ld hl, sp+$05 ; 9E711 (27:6711) -> F8 05
	ld [hl], $00 ; 9E713 (27:6713) -> 36 00
.asm_9e715:
	ld hl, sp+$04 ; 9E715 (27:6715) -> F8 04
	ld a, [hl] ; 9E717 (27:6717) -> 7E
	cp $ff ; 9E718 (27:6718) -> FE FF
	jp nz, .asm_9e733 ; 9E71A (27:671a) -> C2 33 67
	ld e, c ; 9E71D (27:671d) -> 59
	ld d, $00 ; 9E71E (27:671e) -> 16 00
	ld hl, Data_9e5e6 ; 9E720 (27:6720) -> 21 E6 65
	add hl, de ; 9E723 (27:6723) -> 19
	ld a, [hl] ; 9E724 (27:6724) -> 7E
	ld e, c ; 9E725 (27:6725) -> 59
	ld d, $00 ; 9E726 (27:6726) -> 16 00
	ld hl, sp+$09 ; 9E728 (27:6728) -> F8 09
	add hl, de ; 9E72A (27:672a) -> 19
	cp [hl] ; 9E72B (27:672b) -> BE
	jp z, .asm_9e733 ; 9E72C (27:672c) -> CA 33 67
	ld hl, sp+$04 ; 9E72F (27:672f) -> F8 04
	ld [hl], $00 ; 9E731 (27:6731) -> 36 00
.asm_9e733:
	ld hl, sp+$03 ; 9E733 (27:6733) -> F8 03
	ld a, [hl] ; 9E735 (27:6735) -> 7E
	cp $ff ; 9E736 (27:6736) -> FE FF
	jp nz, .asm_9e751 ; 9E738 (27:6738) -> C2 51 67
	ld e, c ; 9E73B (27:673b) -> 59
	ld d, $00 ; 9E73C (27:673c) -> 16 00
	ld hl, Data_9e5ea ; 9E73E (27:673e) -> 21 EA 65
	add hl, de ; 9E741 (27:6741) -> 19
	ld a, [hl] ; 9E742 (27:6742) -> 7E
	ld e, c ; 9E743 (27:6743) -> 59
	ld d, $00 ; 9E744 (27:6744) -> 16 00
	ld hl, sp+$09 ; 9E746 (27:6746) -> F8 09
	add hl, de ; 9E748 (27:6748) -> 19
	cp [hl] ; 9E749 (27:6749) -> BE
	jp z, .asm_9e751 ; 9E74A (27:674a) -> CA 51 67
	ld hl, sp+$03 ; 9E74D (27:674d) -> F8 03
	ld [hl], $00 ; 9E74F (27:674f) -> 36 00
.asm_9e751:
	ld hl, sp+$02 ; 9E751 (27:6751) -> F8 02
	ld a, [hl] ; 9E753 (27:6753) -> 7E
	cp $ff ; 9E754 (27:6754) -> FE FF
	jp nz, .asm_9e76f ; 9E756 (27:6756) -> C2 6F 67
	ld e, c ; 9E759 (27:6759) -> 59
	ld d, $00 ; 9E75A (27:675a) -> 16 00
	ld hl, Data_9e5ee ; 9E75C (27:675c) -> 21 EE 65
	add hl, de ; 9E75F (27:675f) -> 19
	ld a, [hl] ; 9E760 (27:6760) -> 7E
	ld e, c ; 9E761 (27:6761) -> 59
	ld d, $00 ; 9E762 (27:6762) -> 16 00
	ld hl, sp+$09 ; 9E764 (27:6764) -> F8 09
	add hl, de ; 9E766 (27:6766) -> 19
	cp [hl] ; 9E767 (27:6767) -> BE
	jp z, .asm_9e76f ; 9E768 (27:6768) -> CA 6F 67
	ld hl, sp+$02 ; 9E76B (27:676b) -> F8 02
	ld [hl], $00 ; 9E76D (27:676d) -> 36 00
.asm_9e76f:
	inc c ; 9E76F (27:676f) -> 0C
	jp .asm_9e6d3 ; 9E770 (27:6770) -> C3 D3 66
.asm_9e773:
	ld hl, sp+$06 ; 9E773 (27:6773) -> F8 06
	ld a, [hl] ; 9E775 (27:6775) -> 7E
	cp $ff ; 9E776 (27:6776) -> FE FF
	jp nz, .asm_9e780 ; 9E778 (27:6778) -> C2 80 67
	ld a, $02 ; 9E77B (27:677b) -> 3E 02
	ld [wc794], a ; 9E77D (27:677d) -> EA 94 C7
.asm_9e780:
	ld hl, sp+$05 ; 9E780 (27:6780) -> F8 05
	ld a, [hl] ; 9E782 (27:6782) -> 7E
	cp $ff ; 9E783 (27:6783) -> FE FF
	jp nz, .asm_9e78d ; 9E785 (27:6785) -> C2 8D 67
	ld a, $03 ; 9E788 (27:6788) -> 3E 03
	ld [wc794], a ; 9E78A (27:678a) -> EA 94 C7
.asm_9e78d:
	ld hl, sp+$04 ; 9E78D (27:678d) -> F8 04
	ld a, [hl] ; 9E78F (27:678f) -> 7E
	cp $ff ; 9E790 (27:6790) -> FE FF
	jp nz, .asm_9e79a ; 9E792 (27:6792) -> C2 9A 67
	ld a, $05 ; 9E795 (27:6795) -> 3E 05
	ld [wc794], a ; 9E797 (27:6797) -> EA 94 C7
.asm_9e79a:
	ld hl, sp+$03 ; 9E79A (27:679a) -> F8 03
	ld a, [hl] ; 9E79C (27:679c) -> 7E
	cp $ff ; 9E79D (27:679d) -> FE FF
	jp nz, .asm_9e7a7 ; 9E79F (27:679f) -> C2 A7 67
	ld a, $06 ; 9E7A2 (27:67a2) -> 3E 06
	ld [wc794], a ; 9E7A4 (27:67a4) -> EA 94 C7
.asm_9e7a7:
	ld hl, sp+$02 ; 9E7A7 (27:67a7) -> F8 02
	ld a, [hl] ; 9E7A9 (27:67a9) -> 7E
	cp $ff ; 9E7AA (27:67aa) -> FE FF
	jp nz, .asm_9e7b4 ; 9E7AC (27:67ac) -> C2 B4 67
	ld a, $09 ; 9E7AF (27:67af) -> 3E 09
	ld [wc794], a ; 9E7B1 (27:67b1) -> EA 94 C7
.asm_9e7b4:
	pop hl ; 9E7B4 (27:67b4) -> E1
	ld a, [wc794] ; 9E7B5 (27:67b5) -> FA 94 C7
	or a ; 9E7B8 (27:67b8) -> B7
	jp z, .asm_9e7da ; 9E7B9 (27:67b9) -> CA DA 67
	ld a, [wc794] ; 9E7BC (27:67bc) -> FA 94 C7
	cp l ; 9E7BF (27:67bf) -> BD
	jp z, .asm_9e7d7 ; 9E7C0 (27:67c0) -> CA D7 67
	scall StartShakingScreen ; 9E7C3 (27:67c3) -> CD A2 4E
	ld hl, $0078 ; 9E7C6 (27:67c6) -> 21 78 00
	scall ScriptSleep ; 9E7C9 (27:67c9) -> CD 8F 46
	scall StopShakingScreen ; 9E7CC (27:67cc) -> CD B1 4E
	ld a, $01 ; 9E7CF (27:67cf) -> 3E 01
	call Func_9e7f4 ; 9E7D1 (27:67d1) -> CD F4 67
	call Func_9e88f ; 9E7D4 (27:67d4) -> CD 8F 68
.asm_9e7d7:
	jp .asm_9e7e5 ; 9E7D7 (27:67d7) -> C3 E5 67
.asm_9e7da:
	ld a, [wc794] ; 9E7DA (27:67da) -> FA 94 C7
	cp l ; 9E7DD (27:67dd) -> BD
	jp z, .asm_9e7e5 ; 9E7DE (27:67de) -> CA E5 67
	xor a ; 9E7E1 (27:67e1) -> AF
	call Func_9e7f4 ; 9E7E2 (27:67e2) -> CD F4 67
.asm_9e7e5:
	add sp, $0e ; 9E7E5 (27:67e5) -> E8 0E
	ret  ; 9E7E7 (27:67e7) -> C9

Data_9e7e8:
	db $00, $01, $01, $01, $07, $02

Data_9e7ee:
	db $13, $00, $01, $01, $07, $02

Func_9e7f4:
	or a ; 9E7F4 (27:67f4) -> B7
	jp nz, .asm_9e801 ; 9E7F5 (27:67f5) -> C2 01 68
	ld hl, Data_9e7e8 ; 9E7F8 (27:67f8) -> 21 E8 67
	scall Func_80d9b ; 9E7FB (27:67fb) -> CD 9B 4D
	jp .asm_9e807 ; 9E7FE (27:67fe) -> C3 07 68
.asm_9e801:
	ld hl, Data_9e7ee ; 9E801 (27:6801) -> 21 EE 67
	scall Func_80d9b ; 9E804 (27:6804) -> CD 9B 4D
.asm_9e807:
	scall Func_80f02 ; 9E807 (27:6807) -> CD 02 4F
	ret  ; 9E80A (27:680a) -> C9

Data_9e80b:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e821:
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_11, $20, $06, $20, $07, $2e

Data_9e837:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e84d:
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_12, $20, $06, $20, $07, $2e

Data_9e863:
	warpdef $07, $02, $01, $01, MAP_18_17, $04, $0e, $04, $0d, $2e
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e

Data_9e879:
	warpdef $07, $15, $01, $01, MAP_18_13, $20, $06, $20, $07, $2e
	warpdef $07, $02, $01, $01, MAP_18_14, $04, $0e, $04, $0d, $2e

Func_9e88f:
    scall AllocateSpaceForWarps ; 9E88F (27:688f) -> CD 2B 40
	ld a, [wc792] ; 9E892 (27:6892) -> FA 92 C7
	cp $04 ; 9E895 (27:6895) -> FE 04
	jp nz, .asm_9e8b8 ; 9E897 (27:6897) -> C2 B8 68
	ld a, [wc794] ; 9E89A (27:689a) -> FA 94 C7
	cp $09 ; 9E89D (27:689d) -> FE 09
	jp nz, .asm_9e8ad ; 9E89F (27:689f) -> C2 AD 68
	ld e, $02 ; 9E8A2 (27:68a2) -> 1E 02
	ld hl, Data_9e821 ; 9E8A4 (27:68a4) -> 21 21 68
	scall LoadWarps ; 9E8A7 (27:68a7) -> CD 3A 40
	jp .asm_9e8b5 ; 9E8AA (27:68aa) -> C3 B5 68
.asm_9e8ad:
	ld e, $02 ; 9E8AD (27:68ad) -> 1E 02
	ld hl, Data_9e80b ; 9E8AF (27:68af) -> 21 0B 68
	scall LoadWarps ; 9E8B2 (27:68b2) -> CD 3A 40
.asm_9e8b5:
	jp .asm_9e8f9 ; 9E8B5 (27:68b5) -> C3 F9 68
.asm_9e8b8:
	ld a, [wc792] ; 9E8B8 (27:68b8) -> FA 92 C7
	cp $07 ; 9E8BB (27:68bb) -> FE 07
	jp nz, .asm_9e8de ; 9E8BD (27:68bd) -> C2 DE 68
	ld a, [wc794] ; 9E8C0 (27:68c0) -> FA 94 C7
	cp $09 ; 9E8C3 (27:68c3) -> FE 09
	jp nz, .asm_9e8d3 ; 9E8C5 (27:68c5) -> C2 D3 68
	ld e, $02 ; 9E8C8 (27:68c8) -> 1E 02
	ld hl, Data_9e84d ; 9E8CA (27:68ca) -> 21 4D 68
	scall LoadWarps ; 9E8CD (27:68cd) -> CD 3A 40
	jp .asm_9e8db ; 9E8D0 (27:68d0) -> C3 DB 68
.asm_9e8d3:
	ld e, $02 ; 9E8D3 (27:68d3) -> 1E 02
	ld hl, Data_9e837 ; 9E8D5 (27:68d5) -> 21 37 68
	scall LoadWarps ; 9E8D8 (27:68d8) -> CD 3A 40
.asm_9e8db:
	jp .asm_9e8f9 ; 9E8DB (27:68db) -> C3 F9 68
.asm_9e8de:
	ld a, [wc794] ; 9E8DE (27:68de) -> FA 94 C7
	cp $09 ; 9E8E1 (27:68e1) -> FE 09
	jp nz, .asm_9e8f1 ; 9E8E3 (27:68e3) -> C2 F1 68
	ld e, $02 ; 9E8E6 (27:68e6) -> 1E 02
	ld hl, Data_9e879 ; 9E8E8 (27:68e8) -> 21 79 68
	scall LoadWarps ; 9E8EB (27:68eb) -> CD 3A 40
	jp .asm_9e8f9 ; 9E8EE (27:68ee) -> C3 F9 68
.asm_9e8f1:
	ld e, $02 ; 9E8F1 (27:68f1) -> 1E 02
	ld hl, Data_9e863 ; 9E8F3 (27:68f3) -> 21 63 68
	scall LoadWarps ; 9E8F6 (27:68f6) -> CD 3A 40
.asm_9e8f9:
	ret  ; 9E8F9 (27:68f9) -> C9

Data_9e8fa:
	warpdef $06, $04, $01, $01, MAP_18_18, $06, $04, $07, $04, $2e
	warpdef $01, $09, $01, $01, MAP_18_10, $05, $03, $04, $03, $2e

Data_9e910:
	warpdef $06, $04, $01, $01, MAP_18_18, $06, $04, $07, $04, $2e
	warpdef $01, $09, $01, $01, MAP_18_11, $20, $12, $1f, $12, $2e

Data_9e926:
IF DEF(SUN)
	wildbot $00, $03, $28, $11, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $28, $11, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $28, $11, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
ENDC

Func_9e95e:: ; 9e95e
	ld a, [wc792] ; 9E95E (27:695e) -> FA 92 C7
	cp $01 ; 9E961 (27:6961) -> FE 01
	jp z, .asm_9e976 ; 9E963 (27:6963) -> CA 76 69
	ld a, [wc792] ; 9E966 (27:6966) -> FA 92 C7
	cp $03 ; 9E969 (27:6969) -> FE 03
	jp z, .asm_9e976 ; 9E96B (27:696b) -> CA 76 69
	ld a, [wc792] ; 9E96E (27:696e) -> FA 92 C7
	cp $02 ; 9E971 (27:6971) -> FE 02
	jp nz, .asm_9e986 ; 9E973 (27:6973) -> C2 86 69
.asm_9e976:
	ld e, $02 ; 9E976 (27:6976) -> 1E 02
	ld hl, Data_9e8fa ; 9E978 (27:6978) -> 21 FA 68
	scall LoadWarps ; 9E97B (27:697b) -> CD 3A 40
	ld a, $02 ; 9E97E (27:697e) -> 3E 02
	ld [wc792], a ; 9E980 (27:6980) -> EA 92 C7
	jp .asm_9e993 ; 9E983 (27:6983) -> C3 93 69
.asm_9e986:
	ld e, $02 ; 9E986 (27:6986) -> 1E 02
	ld hl, Data_9e910 ; 9E988 (27:6988) -> 21 10 69
	scall LoadWarps ; 9E98B (27:698b) -> CD 3A 40
	ld a, $05 ; 9E98E (27:698e) -> 3E 05
	ld [wc792], a ; 9E990 (27:6990) -> EA 92 C7
.asm_9e993:
	ld a, $03 ; 9E993 (27:6993) -> 3E 03
	scall Func_80d01 ; 9E995 (27:6995) -> CD 01 4D
	ld e, $04 ; 9E998 (27:6998) -> 1E 04
	ld hl, Data_9e926 ; 9E99A (27:699a) -> 21 26 69
	scall LoadEncounters ; 9E99D (27:699d) -> CD 24 4D
	ld a, $08 ; 9E9A0 (27:69a0) -> 3E 08
	scall PlayMusic ; 9E9A2 (27:69a2) -> CD E6 4E
	scall Func_8001c ; 9E9A5 (27:69a5) -> CD 1C 40
	ret  ; 9E9A8 (27:69a8) -> C9

Data_9e9a9:
	warpdef $03, $0e, $03, $01, MAP_18_15, $07, $02, $07, $03, $2e

Data_9e9b4:
IF DEF(SUN)
	wildbot $00, $03, $09, $0c, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $09, $0c, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $09, $0c, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $09, $0c, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
ENDC

Data_9e9ec:
	person_event $0f, $04, $04, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $04, $04, $01, $01, $00, $04, $00, Func_9eb3c, NULL

Data_9ea08:
	person_event $ff, $00, $00, $08, $04, $01, $00, $04, $00, Func_9ed0f, NULL
	person_event $ff, $00, $05, $08, $04, $01, $00, $04, $00, Func_9eda0, NULL

Func_9ea24:: ; 9ea24
	ld e, $00 ; 9EA24 (27:6a24) -> 1E 00
	ld hl, $0045 ; 9EA26 (27:6a26) -> 21 45 00
	scall EventFlagAction ; 9EA29 (27:6a29) -> CD 1B 46
	ld e, $01 ; 9EA2C (27:6a2c) -> 1E 01
	ld hl, Data_9e9a9 ; 9EA2E (27:6a2e) -> 21 A9 69
	scall LoadWarps ; 9EA31 (27:6a31) -> CD 3A 40
	ld a, $03 ; 9EA34 (27:6a34) -> 3E 03
	scall Func_80d01 ; 9EA36 (27:6a36) -> CD 01 4D
	ld e, $04 ; 9EA39 (27:6a39) -> 1E 04
	ld hl, Data_9e9b4 ; 9EA3B (27:6a3b) -> 21 B4 69
	scall LoadEncounters ; 9EA3E (27:6a3e) -> CD 24 4D
	ld a, $01 ; 9EA41 (27:6a41) -> 3E 01
	scall LoadPlayerSprite ; 9EA43 (27:6a43) -> CD C6 4C
	ld a, [wc794] ; 9EA46 (27:6a46) -> FA 94 C7
	cp $02 ; 9EA49 (27:6a49) -> FE 02
	jp nz, .asm_9ea69 ; 9EA4B (27:6a4b) -> C2 69 6A
	ld hl, $0053 ; 9EA4E (27:6a4e) -> 21 53 00
	scall CheckEventFlag ; 9EA51 (27:6a51) -> CD 2E 46
	or a ; 9EA54 (27:6a54) -> B7
	jp nz, .asm_9ea69 ; 9EA55 (27:6a55) -> C2 69 6A
	ld e, $02 ; 9EA58 (27:6a58) -> 1E 02
	ld hl, Data_9e9ec ; 9EA5A (27:6a5a) -> 21 EC 69
	scall LoadMapObjects ; 9EA5D (27:6a5d) -> CD FB 40
	ld e, $00 ; 9EA60 (27:6a60) -> 1E 00
	xor a ; 9EA62 (27:6a62) -> AF
	scall SetPersonVisibilityState ; 9EA63 (27:6a63) -> CD 3D 41
	jp .asm_9eaf2 ; 9EA66 (27:6a66) -> C3 F2 6A
.asm_9ea69:
	ld a, [wc794] ; 9EA69 (27:6a69) -> FA 94 C7
	cp $03 ; 9EA6C (27:6a6c) -> FE 03
	jp nz, .asm_9ea8c ; 9EA6E (27:6a6e) -> C2 8C 6A
	ld hl, $0054 ; 9EA71 (27:6a71) -> 21 54 00
	scall CheckEventFlag ; 9EA74 (27:6a74) -> CD 2E 46
	or a ; 9EA77 (27:6a77) -> B7
	jp nz, .asm_9ea8c ; 9EA78 (27:6a78) -> C2 8C 6A
	ld e, $02 ; 9EA7B (27:6a7b) -> 1E 02
	ld hl, Data_9e9ec ; 9EA7D (27:6a7d) -> 21 EC 69
	scall LoadMapObjects ; 9EA80 (27:6a80) -> CD FB 40
	ld e, $00 ; 9EA83 (27:6a83) -> 1E 00
	xor a ; 9EA85 (27:6a85) -> AF
	scall SetPersonVisibilityState ; 9EA86 (27:6a86) -> CD 3D 41
	jp .asm_9eaf2 ; 9EA89 (27:6a89) -> C3 F2 6A
.asm_9ea8c:
	ld a, [wc794] ; 9EA8C (27:6a8c) -> FA 94 C7
	cp $05 ; 9EA8F (27:6a8f) -> FE 05
	jp nz, .asm_9eaaf ; 9EA91 (27:6a91) -> C2 AF 6A
	ld hl, $0055 ; 9EA94 (27:6a94) -> 21 55 00
	scall CheckEventFlag ; 9EA97 (27:6a97) -> CD 2E 46
	or a ; 9EA9A (27:6a9a) -> B7
	jp nz, .asm_9eaaf ; 9EA9B (27:6a9b) -> C2 AF 6A
	ld e, $02 ; 9EA9E (27:6a9e) -> 1E 02
	ld hl, Data_9e9ec ; 9EAA0 (27:6aa0) -> 21 EC 69
	scall LoadMapObjects ; 9EAA3 (27:6aa3) -> CD FB 40
	ld e, $00 ; 9EAA6 (27:6aa6) -> 1E 00
	xor a ; 9EAA8 (27:6aa8) -> AF
	scall SetPersonVisibilityState ; 9EAA9 (27:6aa9) -> CD 3D 41
	jp .asm_9eaf2 ; 9EAAC (27:6aac) -> C3 F2 6A
.asm_9eaaf:
	ld a, [wc794] ; 9EAAF (27:6aaf) -> FA 94 C7
	cp $06 ; 9EAB2 (27:6ab2) -> FE 06
	jp nz, .asm_9ead2 ; 9EAB4 (27:6ab4) -> C2 D2 6A
	ld hl, $0056 ; 9EAB7 (27:6ab7) -> 21 56 00
	scall CheckEventFlag ; 9EABA (27:6aba) -> CD 2E 46
	or a ; 9EABD (27:6abd) -> B7
	jp nz, .asm_9ead2 ; 9EABE (27:6abe) -> C2 D2 6A
	ld e, $02 ; 9EAC1 (27:6ac1) -> 1E 02
	ld hl, Data_9e9ec ; 9EAC3 (27:6ac3) -> 21 EC 69
	scall LoadMapObjects ; 9EAC6 (27:6ac6) -> CD FB 40
	ld e, $00 ; 9EAC9 (27:6ac9) -> 1E 00
	xor a ; 9EACB (27:6acb) -> AF
	scall SetPersonVisibilityState ; 9EACC (27:6acc) -> CD 3D 41
	jp .asm_9eaf2 ; 9EACF (27:6acf) -> C3 F2 6A
.asm_9ead2:
	ld a, [wc794] ; 9EAD2 (27:6ad2) -> FA 94 C7
	cp $09 ; 9EAD5 (27:6ad5) -> FE 09
	jp nz, .asm_9eaf2 ; 9EAD7 (27:6ad7) -> C2 F2 6A
	ld hl, $0057 ; 9EADA (27:6ada) -> 21 57 00
	scall CheckEventFlag ; 9EADD (27:6add) -> CD 2E 46
	or a ; 9EAE0 (27:6ae0) -> B7
	jp nz, .asm_9eaf2 ; 9EAE1 (27:6ae1) -> C2 F2 6A
	ld e, $02 ; 9EAE4 (27:6ae4) -> 1E 02
	ld hl, Data_9e9ec ; 9EAE6 (27:6ae6) -> 21 EC 69
	scall LoadMapObjects ; 9EAE9 (27:6ae9) -> CD FB 40
	ld e, $00 ; 9EAEC (27:6aec) -> 1E 00
	xor a ; 9EAEE (27:6aee) -> AF
	scall SetPersonVisibilityState ; 9EAEF (27:6aef) -> CD 3D 41
.asm_9eaf2:
	ld a, [wBackupMapGroup] ; 9EAF2 (27:6af2) -> FA DF C7
	cp $12 ; 9EAF5 (27:6af5) -> FE 12
	jp nz, .asm_9eb0a ; 9EAF7 (27:6af7) -> C2 0A 6B
	ld a, [wBackupMapNumber] ; 9EAFA (27:6afa) -> FA E0 C7
	cp $0e ; 9EAFD (27:6afd) -> FE 0E
	jp nz, .asm_9eb0a ; 9EAFF (27:6aff) -> C2 0A 6B
	ld e, $02 ; 9EB02 (27:6b02) -> 1E 02
	ld hl, Data_9ea08 ; 9EB04 (27:6b04) -> 21 08 6A
	scall LoadMapObjects ; 9EB07 (27:6b07) -> CD FB 40
.asm_9eb0a:
	ld a, $08 ; 9EB0A (27:6b0a) -> 3E 08
	scall PlayMusic ; 9EB0C (27:6b0c) -> CD E6 4E
	scall Func_8001c ; 9EB0F (27:6b0f) -> CD 1C 40
	ret  ; 9EB12 (27:6b12) -> C9

Data_9eb13:
	db $00, $00, $00, $01, $00, $c5, $bb, $00, $00, $30, $01, $30, $07, $32, $07, $11
	db $1f, $09, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_9eb3c:
	push bc ; 9EB3C (27:6b3c) -> C5
	ld a, e ; 9EB3D (27:6b3d) -> 7B
	or a ; 9EB3E (27:6b3e) -> B7
	jp nz, .asm_9ecf8 ; 9EB3F (27:6b3f) -> C2 F8 6C
	ld hl, $0045 ; 9EB42 (27:6b42) -> 21 45 00
	scall CheckEventFlag ; 9EB45 (27:6b45) -> CD 2E 46
	or a ; 9EB48 (27:6b48) -> B7
	jp nz, .asm_9eba0 ; 9EB49 (27:6b49) -> C2 A0 6B
	ld c, $03 ; 9EB4C (27:6b4c) -> 0E 03
	ld e, $02 ; 9EB4E (27:6b4e) -> 1E 02
	ld a, $08 ; 9EB50 (27:6b50) -> 3E 08
	scall LoadEmote ; 9EB52 (27:6b52) -> CD 76 41
	ld e, $04 ; 9EB55 (27:6b55) -> 1E 04
	ld a, $04 ; 9EB57 (27:6b57) -> 3E 04
	scall MoveEmote ; 9EB59 (27:6b59) -> CD E4 41
	scall WaitEmote ; 9EB5C (27:6b5c) -> CD D5 41
	scall HideEmote ; 9EB5F (27:6b5f) -> CD 8B 41
	ld e, $01 ; 9EB62 (27:6b62) -> 1E 01
	xor a ; 9EB64 (27:6b64) -> AF
	scall SetPersonVisibilityState ; 9EB65 (27:6b65) -> CD 3D 41
	ld e, $03 ; 9EB68 (27:6b68) -> 1E 03
	xor a ; 9EB6A (27:6b6a) -> AF
	scall SpriteFace ; 9EB6B (27:6b6b) -> CD 95 40
	ld e, $00 ; 9EB6E (27:6b6e) -> 1E 00
	xor a ; 9EB70 (27:6b70) -> AF
	scall SpriteFace ; 9EB71 (27:6b71) -> CD 95 40
	ld e, $01 ; 9EB74 (27:6b74) -> 1E 01
	xor a ; 9EB76 (27:6b76) -> AF
	scall SpriteFace ; 9EB77 (27:6b77) -> CD 95 40
	ld e, $02 ; 9EB7A (27:6b7a) -> 1E 02
	xor a ; 9EB7C (27:6b7c) -> AF
	scall SpriteFace ; 9EB7D (27:6b7d) -> CD 95 40
	ld e, $03 ; 9EB80 (27:6b80) -> 1E 03
	xor a ; 9EB82 (27:6b82) -> AF
	scall SpriteFace ; 9EB83 (27:6b83) -> CD 95 40
	ld e, $00 ; 9EB86 (27:6b86) -> 1E 00
	xor a ; 9EB88 (27:6b88) -> AF
	scall SpriteFace ; 9EB89 (27:6b89) -> CD 95 40
	ld e, $01 ; 9EB8C (27:6b8c) -> 1E 01
	xor a ; 9EB8E (27:6b8e) -> AF
	scall SpriteFace ; 9EB8F (27:6b8f) -> CD 95 40
	ld e, $02 ; 9EB92 (27:6b92) -> 1E 02
	xor a ; 9EB94 (27:6b94) -> AF
	scall SpriteFace ; 9EB95 (27:6b95) -> CD 95 40
	ld e, $01 ; 9EB98 (27:6b98) -> 1E 01
	ld hl, $0045 ; 9EB9A (27:6b9a) -> 21 45 00
	scall EventFlagAction ; 9EB9D (27:6b9d) -> CD 1B 46
.asm_9eba0:
	xor a ; 9EBA0 (27:6ba0) -> AF
	scall FacePlayer ; 9EBA1 (27:6ba1) -> CD 4B 44
	ld hl, sp+$00 ; 9EBA4 (27:6ba4) -> F8 00
	ld [hl], $00 ; 9EBA6 (27:6ba6) -> 36 00
	ld hl, $0053 ; 9EBA8 (27:6ba8) -> 21 53 00
	scall CheckEventFlag ; 9EBAB (27:6bab) -> CD 2E 46
	or a ; 9EBAE (27:6bae) -> B7
	jp nz, .asm_9ebb9 ; 9EBAF (27:6baf) -> C2 B9 6B
	ld hl, sp+$00 ; 9EBB2 (27:6bb2) -> F8 00
	ld a, [hl] ; 9EBB4 (27:6bb4) -> 7E
	inc a ; 9EBB5 (27:6bb5) -> 3C
	ld hl, sp+$00 ; 9EBB6 (27:6bb6) -> F8 00
	ld [hl], a ; 9EBB8 (27:6bb8) -> 77
.asm_9ebb9:
	ld hl, $0054 ; 9EBB9 (27:6bb9) -> 21 54 00
	scall CheckEventFlag ; 9EBBC (27:6bbc) -> CD 2E 46
	or a ; 9EBBF (27:6bbf) -> B7
	jp nz, .asm_9ebca ; 9EBC0 (27:6bc0) -> C2 CA 6B
	ld hl, sp+$00 ; 9EBC3 (27:6bc3) -> F8 00
	ld a, [hl] ; 9EBC5 (27:6bc5) -> 7E
	inc a ; 9EBC6 (27:6bc6) -> 3C
	ld hl, sp+$00 ; 9EBC7 (27:6bc7) -> F8 00
	ld [hl], a ; 9EBC9 (27:6bc9) -> 77
.asm_9ebca:
	ld hl, $0055 ; 9EBCA (27:6bca) -> 21 55 00
	scall CheckEventFlag ; 9EBCD (27:6bcd) -> CD 2E 46
	or a ; 9EBD0 (27:6bd0) -> B7
	jp nz, .asm_9ebdb ; 9EBD1 (27:6bd1) -> C2 DB 6B
	ld hl, sp+$00 ; 9EBD4 (27:6bd4) -> F8 00
	ld a, [hl] ; 9EBD6 (27:6bd6) -> 7E
	inc a ; 9EBD7 (27:6bd7) -> 3C
	ld hl, sp+$00 ; 9EBD8 (27:6bd8) -> F8 00
	ld [hl], a ; 9EBDA (27:6bda) -> 77
.asm_9ebdb:
	ld hl, $0056 ; 9EBDB (27:6bdb) -> 21 56 00
	scall CheckEventFlag ; 9EBDE (27:6bde) -> CD 2E 46
	or a ; 9EBE1 (27:6be1) -> B7
	jp nz, .asm_9ebec ; 9EBE2 (27:6be2) -> C2 EC 6B
	ld hl, sp+$00 ; 9EBE5 (27:6be5) -> F8 00
	ld a, [hl] ; 9EBE7 (27:6be7) -> 7E
	inc a ; 9EBE8 (27:6be8) -> 3C
	ld hl, sp+$00 ; 9EBE9 (27:6be9) -> F8 00
	ld [hl], a ; 9EBEB (27:6beb) -> 77
.asm_9ebec:
	ld hl, $0057 ; 9EBEC (27:6bec) -> 21 57 00
	scall CheckEventFlag ; 9EBEF (27:6bef) -> CD 2E 46
	or a ; 9EBF2 (27:6bf2) -> B7
	jp nz, .asm_9ebfd ; 9EBF3 (27:6bf3) -> C2 FD 6B
	ld hl, sp+$00 ; 9EBF6 (27:6bf6) -> F8 00
	ld a, [hl] ; 9EBF8 (27:6bf8) -> 7E
	inc a ; 9EBF9 (27:6bf9) -> 3C
	ld hl, sp+$00 ; 9EBFA (27:6bfa) -> F8 00
	ld [hl], a ; 9EBFC (27:6bfc) -> 77
.asm_9ebfd:
	ld hl, sp+$00 ; 9EBFD (27:6bfd) -> F8 00
	ld a, [hl] ; 9EBFF (27:6bff) -> 7E
	cp $05 ; 9EC00 (27:6c00) -> FE 05
	jp z, .asm_9ec3d ; 9EC02 (27:6c02) -> CA 3D 6C
	cp $04 ; 9EC05 (27:6c05) -> FE 04
	jp z, .asm_9ec34 ; 9EC07 (27:6c07) -> CA 34 6C
	cp $03 ; 9EC0A (27:6c0a) -> FE 03
	jp z, .asm_9ec2b ; 9EC0C (27:6c0c) -> CA 2B 6C
	cp $02 ; 9EC0F (27:6c0f) -> FE 02
	jp z, .asm_9ec22 ; 9EC11 (27:6c11) -> CA 22 6C
	cp $01 ; 9EC14 (27:6c14) -> FE 01
	jp nz, .asm_9ec43 ; 9EC16 (27:6c16) -> C2 43 6C
	ld hl, $028b ; 9EC19 (27:6c19) -> 21 8B 02
	scall PrintTextWithNPCName ; 9EC1C (27:6c1c) -> CD A9 44
	jp .asm_9ec43 ; 9EC1F (27:6c1f) -> C3 43 6C
.asm_9ec22:
	ld hl, $028a ; 9EC22 (27:6c22) -> 21 8A 02
	scall PrintTextWithNPCName ; 9EC25 (27:6c25) -> CD A9 44
	jp .asm_9ec43 ; 9EC28 (27:6c28) -> C3 43 6C
.asm_9ec2b:
	ld hl, $0289 ; 9EC2B (27:6c2b) -> 21 89 02
	scall PrintTextWithNPCName ; 9EC2E (27:6c2e) -> CD A9 44
	jp .asm_9ec43 ; 9EC31 (27:6c31) -> C3 43 6C
.asm_9ec34:
	ld hl, $0288 ; 9EC34 (27:6c34) -> 21 88 02
	scall PrintTextWithNPCName ; 9EC37 (27:6c37) -> CD A9 44
	jp .asm_9ec43 ; 9EC3A (27:6c3a) -> C3 43 6C
.asm_9ec3d:
	ld hl, $0287 ; 9EC3D (27:6c3d) -> 21 87 02
	scall PrintTextWithNPCName ; 9EC40 (27:6c40) -> CD A9 44
.asm_9ec43:
	ld hl, $032c ; 9EC43 (27:6c43) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 9EC46 (27:6c46) -> CD BA 44
	or a ; 9EC49 (27:6c49) -> B7
	jp nz, .asm_9ecf8 ; 9EC4A (27:6c4a) -> C2 F8 6C
	ld de, Data_9ecfa ; 9EC4D (27:6c4d) -> 11 FA 6C
	ld hl, Data_9eb13 ; 9EC50 (27:6c50) -> 21 13 6B
	scall ScriptedBattle ; 9EC53 (27:6c53) -> CD D3 4D
	or a ; 9EC56 (27:6c56) -> B7
	jp nz, .asm_9ec5d ; 9EC57 (27:6c57) -> C2 5D 6C
	jp .asm_9ecf8 ; 9EC5A (27:6c5a) -> C3 F8 6C
.asm_9ec5d:
	ld a, [wc794] ; 9EC5D (27:6c5d) -> FA 94 C7
	cp $02 ; 9EC60 (27:6c60) -> FE 02
	jp nz, .asm_9ec7a ; 9EC62 (27:6c62) -> C2 7A 6C
	ld hl, $0053 ; 9EC65 (27:6c65) -> 21 53 00
	scall CheckEventFlag ; 9EC68 (27:6c68) -> CD 2E 46
	or a ; 9EC6B (27:6c6b) -> B7
	jp nz, .asm_9ec7a ; 9EC6C (27:6c6c) -> C2 7A 6C
	ld e, $01 ; 9EC6F (27:6c6f) -> 1E 01
	ld hl, $0053 ; 9EC71 (27:6c71) -> 21 53 00
	scall EventFlagAction ; 9EC74 (27:6c74) -> CD 1B 46
	jp .asm_9eceb ; 9EC77 (27:6c77) -> C3 EB 6C
.asm_9ec7a:
	ld a, [wc794] ; 9EC7A (27:6c7a) -> FA 94 C7
	cp $03 ; 9EC7D (27:6c7d) -> FE 03
	jp nz, .asm_9ec97 ; 9EC7F (27:6c7f) -> C2 97 6C
	ld hl, $0054 ; 9EC82 (27:6c82) -> 21 54 00
	scall CheckEventFlag ; 9EC85 (27:6c85) -> CD 2E 46
	or a ; 9EC88 (27:6c88) -> B7
	jp nz, .asm_9ec97 ; 9EC89 (27:6c89) -> C2 97 6C
	ld e, $01 ; 9EC8C (27:6c8c) -> 1E 01
	ld hl, $0054 ; 9EC8E (27:6c8e) -> 21 54 00
	scall EventFlagAction ; 9EC91 (27:6c91) -> CD 1B 46
	jp .asm_9eceb ; 9EC94 (27:6c94) -> C3 EB 6C
.asm_9ec97:
	ld a, [wc794] ; 9EC97 (27:6c97) -> FA 94 C7
	cp $05 ; 9EC9A (27:6c9a) -> FE 05
	jp nz, .asm_9ecb4 ; 9EC9C (27:6c9c) -> C2 B4 6C
	ld hl, $0055 ; 9EC9F (27:6c9f) -> 21 55 00
	scall CheckEventFlag ; 9ECA2 (27:6ca2) -> CD 2E 46
	or a ; 9ECA5 (27:6ca5) -> B7
	jp nz, .asm_9ecb4 ; 9ECA6 (27:6ca6) -> C2 B4 6C
	ld e, $01 ; 9ECA9 (27:6ca9) -> 1E 01
	ld hl, $0055 ; 9ECAB (27:6cab) -> 21 55 00
	scall EventFlagAction ; 9ECAE (27:6cae) -> CD 1B 46
	jp .asm_9eceb ; 9ECB1 (27:6cb1) -> C3 EB 6C
.asm_9ecb4:
	ld a, [wc794] ; 9ECB4 (27:6cb4) -> FA 94 C7
	cp $06 ; 9ECB7 (27:6cb7) -> FE 06
	jp nz, .asm_9ecd1 ; 9ECB9 (27:6cb9) -> C2 D1 6C
	ld hl, $0056 ; 9ECBC (27:6cbc) -> 21 56 00
	scall CheckEventFlag ; 9ECBF (27:6cbf) -> CD 2E 46
	or a ; 9ECC2 (27:6cc2) -> B7
	jp nz, .asm_9ecd1 ; 9ECC3 (27:6cc3) -> C2 D1 6C
	ld e, $01 ; 9ECC6 (27:6cc6) -> 1E 01
	ld hl, $0056 ; 9ECC8 (27:6cc8) -> 21 56 00
	scall EventFlagAction ; 9ECCB (27:6ccb) -> CD 1B 46
	jp .asm_9eceb ; 9ECCE (27:6cce) -> C3 EB 6C
.asm_9ecd1:
	ld a, [wc794] ; 9ECD1 (27:6cd1) -> FA 94 C7
	cp $09 ; 9ECD4 (27:6cd4) -> FE 09
	jp nz, .asm_9eceb ; 9ECD6 (27:6cd6) -> C2 EB 6C
	ld hl, $0057 ; 9ECD9 (27:6cd9) -> 21 57 00
	scall CheckEventFlag ; 9ECDC (27:6cdc) -> CD 2E 46
	or a ; 9ECDF (27:6cdf) -> B7
	jp nz, .asm_9eceb ; 9ECE0 (27:6ce0) -> C2 EB 6C
	ld e, $01 ; 9ECE3 (27:6ce3) -> 1E 01
	ld hl, $0057 ; 9ECE5 (27:6ce5) -> 21 57 00
	scall EventFlagAction ; 9ECE8 (27:6ce8) -> CD 1B 46
.asm_9eceb:
	ld l, $1b ; 9ECEB (27:6ceb) -> 2E 1B
	push hl ; 9ECED (27:6ced) -> E5
	ld c, $1e ; 9ECEE (27:6cee) -> 0E 1E
	ld e, $00 ; 9ECF0 (27:6cf0) -> 1E 00
	ld a, $12 ; 9ECF2 (27:6cf2) -> 3E 12
	scall Func_80dff ; 9ECF4 (27:6cf4) -> CD FF 4D
	pop bc ; 9ECF7 (27:6cf7) -> C1
.asm_9ecf8:
	pop bc ; 9ECF8 (27:6cf8) -> C1
	ret  ; 9ECF9 (27:6cf9) -> C9

Data_9ecfa:
	dstr "オヤシﾞ(ようせい)"

Data_9ed05:
	db $04, $09, $01, $09, $ff, $ff

Data_9ed0b:
	db $01, $09, $ff, $ff

Func_9ed0f:
	ld a, e ; 9ED0F (27:6d0f) -> 7B
	or a ; 9ED10 (27:6d10) -> B7
	jp nz, .asm_9ed95 ; 9ED11 (27:6d11) -> C2 95 6D
	ld a, $0f ; 9ED14 (27:6d14) -> 3E 0F
	scall Func_80e6d ; 9ED16 (27:6d16) -> CD 6D 4E
	cp $ff ; 9ED19 (27:6d19) -> FE FF
	jp nz, .asm_9ed3c ; 9ED1B (27:6d1b) -> C2 3C 6D
	ld a, $41 ; 9ED1E (27:6d1e) -> 3E 41
	scall Func_80e6d ; 9ED20 (27:6d20) -> CD 6D 4E
	cp $ff ; 9ED23 (27:6d23) -> FE FF
	jp nz, .asm_9ed3c ; 9ED25 (27:6d25) -> C2 3C 6D
	ld a, $50 ; 9ED28 (27:6d28) -> 3E 50
	scall Func_80e6d ; 9ED2A (27:6d2a) -> CD 6D 4E
	cp $ff ; 9ED2D (27:6d2d) -> FE FF
	jp nz, .asm_9ed3c ; 9ED2F (27:6d2f) -> C2 3C 6D
	ld a, $64 ; 9ED32 (27:6d32) -> 3E 64
	scall Func_80e6d ; 9ED34 (27:6d34) -> CD 6D 4E
	cp $ff ; 9ED37 (27:6d37) -> FE FF
	jp z, .asm_9ed8f ; 9ED39 (27:6d39) -> CA 8F 6D
.asm_9ed3c:
	ld a, [wc790] ; 9ED3C (27:6d3c) -> FA 90 C7
	or a ; 9ED3F (27:6d3f) -> B7
	jp z, .asm_9ed86 ; 9ED40 (27:6d40) -> CA 86 6D
	ld a, [wc790] ; 9ED43 (27:6d43) -> FA 90 C7
	cp $06 ; 9ED46 (27:6d46) -> FE 06
	jp nc, .asm_9ed86 ; 9ED48 (27:6d48) -> D2 86 6D
	ld hl, $032d ; 9ED4B (27:6d4b) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 9ED4E (27:6d4e) -> CD BA 44
	or a ; 9ED51 (27:6d51) -> B7
	jp nz, .asm_9ed83 ; 9ED52 (27:6d52) -> C2 83 6D
	ld a, [wPlayerFacing] ; 9ED55 (27:6d55) -> FA 38 C8
	or a ; 9ED58 (27:6d58) -> B7
	jp nz, .asm_9ed69 ; 9ED59 (27:6d59) -> C2 69 6D
	ld c, $01 ; 9ED5C (27:6d5c) -> 0E 01
	ld de, Data_9ed0b ; 9ED5E (27:6d5e) -> 11 0B 6D
	ld a, $27 ; 9ED61 (27:6d61) -> 3E 27
	scall MovePlayer ; 9ED63 (27:6d63) -> CD 3E 46
	jp .asm_9ed73 ; 9ED66 (27:6d66) -> C3 73 6D
.asm_9ed69:
	ld c, $01 ; 9ED69 (27:6d69) -> 0E 01
	ld de, Data_9ed05 ; 9ED6B (27:6d6b) -> 11 05 6D
	ld a, $27 ; 9ED6E (27:6d6e) -> 3E 27
	scall MovePlayer ; 9ED70 (27:6d70) -> CD 3E 46
.asm_9ed73:
	scall WaitNPCStep ; 9ED73 (27:6d73) -> CD 0C 42
	xor a ; 9ED76 (27:6d76) -> AF
	scall PlayerFace ; 9ED77 (27:6d77) -> CD 77 46
	ld hl, $001e ; 9ED7A (27:6d7a) -> 21 1E 00
	scall ScriptSleep ; 9ED7D (27:6d7d) -> CD 8F 46
	call Func_9ee27 ; 9ED80 (27:6d80) -> CD 27 6E
.asm_9ed83:
	jp .asm_9ed8c ; 9ED83 (27:6d83) -> C3 8C 6D
.asm_9ed86:
	ld hl, $0377 ; 9ED86 (27:6d86) -> 21 77 03
	scall PrintTextStandard ; 9ED89 (27:6d89) -> CD 98 44
.asm_9ed8c:
	jp .asm_9ed95 ; 9ED8C (27:6d8c) -> C3 95 6D
.asm_9ed8f:
	ld hl, $0376 ; 9ED8F (27:6d8f) -> 21 76 03
	scall PrintTextStandard ; 9ED92 (27:6d92) -> CD 98 44
.asm_9ed95:
	ret  ; 9ED95 (27:6d95) -> C9

Data_9ed96:
	db $04, $09, $07, $09, $ff, $ff

Data_9ed9c:
	db $07, $09, $ff, $ff

Func_9eda0:
	ld a, e ; 9EDA0 (27:6da0) -> 7B
	or a ; 9EDA1 (27:6da1) -> B7
	jp nz, .asm_9ee26 ; 9EDA2 (27:6da2) -> C2 26 6E
	ld a, $0f ; 9EDA5 (27:6da5) -> 3E 0F
	scall Func_80e6d ; 9EDA7 (27:6da7) -> CD 6D 4E
	cp $ff ; 9EDAA (27:6daa) -> FE FF
	jp nz, .asm_9edcd ; 9EDAC (27:6dac) -> C2 CD 6D
	ld a, $41 ; 9EDAF (27:6daf) -> 3E 41
	scall Func_80e6d ; 9EDB1 (27:6db1) -> CD 6D 4E
	cp $ff ; 9EDB4 (27:6db4) -> FE FF
	jp nz, .asm_9edcd ; 9EDB6 (27:6db6) -> C2 CD 6D
	ld a, $50 ; 9EDB9 (27:6db9) -> 3E 50
	scall Func_80e6d ; 9EDBB (27:6dbb) -> CD 6D 4E
	cp $ff ; 9EDBE (27:6dbe) -> FE FF
	jp nz, .asm_9edcd ; 9EDC0 (27:6dc0) -> C2 CD 6D
	ld a, $64 ; 9EDC3 (27:6dc3) -> 3E 64
	scall Func_80e6d ; 9EDC5 (27:6dc5) -> CD 6D 4E
	cp $ff ; 9EDC8 (27:6dc8) -> FE FF
	jp z, .asm_9ee20 ; 9EDCA (27:6dca) -> CA 20 6E
.asm_9edcd:
	ld a, [wc790] ; 9EDCD (27:6dcd) -> FA 90 C7
	or a ; 9EDD0 (27:6dd0) -> B7
	jp z, .asm_9ee17 ; 9EDD1 (27:6dd1) -> CA 17 6E
	ld a, [wc790] ; 9EDD4 (27:6dd4) -> FA 90 C7
	cp $06 ; 9EDD7 (27:6dd7) -> FE 06
	jp nc, .asm_9ee17 ; 9EDD9 (27:6dd9) -> D2 17 6E
	ld hl, $032d ; 9EDDC (27:6ddc) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 9EDDF (27:6ddf) -> CD BA 44
	or a ; 9EDE2 (27:6de2) -> B7
	jp nz, .asm_9ee14 ; 9EDE3 (27:6de3) -> C2 14 6E
	ld a, [wPlayerFacing] ; 9EDE6 (27:6de6) -> FA 38 C8
	or a ; 9EDE9 (27:6de9) -> B7
	jp nz, .asm_9edfa ; 9EDEA (27:6dea) -> C2 FA 6D
	ld c, $01 ; 9EDED (27:6ded) -> 0E 01
	ld de, Data_9ed9c ; 9EDEF (27:6def) -> 11 9C 6D
	ld a, $27 ; 9EDF2 (27:6df2) -> 3E 27
	scall MovePlayer ; 9EDF4 (27:6df4) -> CD 3E 46
	jp .asm_9ee04 ; 9EDF7 (27:6df7) -> C3 04 6E
.asm_9edfa:
	ld c, $01 ; 9EDFA (27:6dfa) -> 0E 01
	ld de, Data_9ed96 ; 9EDFC (27:6dfc) -> 11 96 6D
	ld a, $27 ; 9EDFF (27:6dff) -> 3E 27
	scall MovePlayer ; 9EE01 (27:6e01) -> CD 3E 46
.asm_9ee04:
	scall WaitNPCStep ; 9EE04 (27:6e04) -> CD 0C 42
	xor a ; 9EE07 (27:6e07) -> AF
	scall PlayerFace ; 9EE08 (27:6e08) -> CD 77 46
	ld hl, $001e ; 9EE0B (27:6e0b) -> 21 1E 00
	scall ScriptSleep ; 9EE0E (27:6e0e) -> CD 8F 46
	call Func_9ee27 ; 9EE11 (27:6e11) -> CD 27 6E
.asm_9ee14:
	jp .asm_9ee1d ; 9EE14 (27:6e14) -> C3 1D 6E
.asm_9ee17:
	ld hl, $0377 ; 9EE17 (27:6e17) -> 21 77 03
	scall PrintTextStandard ; 9EE1A (27:6e1a) -> CD 98 44
.asm_9ee1d:
	jp .asm_9ee26 ; 9EE1D (27:6e1d) -> C3 26 6E
.asm_9ee20:
	ld hl, $0376 ; 9EE20 (27:6e20) -> 21 76 03
	scall PrintTextStandard ; 9EE23 (27:6e23) -> CD 98 44
.asm_9ee26:
	ret  ; 9EE26 (27:6e26) -> C9

Func_9ee27:
	xor a ; 9EE27 (27:6e27) -> AF
	scall PlayMusic ; 9EE28 (27:6e28) -> CD E6 4E
	ld a, $0a ; 9EE2B (27:6e2b) -> 3E 0A
	scall PlayMusic ; 9EE2D (27:6e2d) -> CD E6 4E
	xor a ; 9EE30 (27:6e30) -> AF
	scall Func_80653 ; 9EE31 (27:6e31) -> CD 53 46
	ld c, $01 ; 9EE34 (27:6e34) -> 0E 01
	ld e, $01 ; 9EE36 (27:6e36) -> 1E 01
	ld a, $0b ; 9EE38 (27:6e38) -> 3E 0B
	scall LoadEmote ; 9EE3A (27:6e3a) -> CD 76 41
	ld a, $44 ; 9EE3D (27:6e3d) -> 3E 44
	scall PlaySFX ; 9EE3F (27:6e3f) -> CD FE 4E
	scall WaitEmote ; 9EE42 (27:6e42) -> CD D5 41
	scall HideEmote ; 9EE45 (27:6e45) -> CD 8B 41
	ld a, $04 ; 9EE48 (27:6e48) -> 3E 04
	scall LoadPlayerSprite ; 9EE4A (27:6e4a) -> CD C6 4C
	ld a, $03 ; 9EE4D (27:6e4d) -> 3E 03
	scall PlayerFace ; 9EE4F (27:6e4f) -> CD 77 46
	ld l, $08 ; 9EE52 (27:6e52) -> 2E 08
	push hl ; 9EE54 (27:6e54) -> E5
	ld c, $04 ; 9EE55 (27:6e55) -> 0E 04
	ld e, $0e ; 9EE57 (27:6e57) -> 1E 0E
	ld a, $12 ; 9EE59 (27:6e59) -> 3E 12
	scall Func_80dff ; 9EE5B (27:6e5b) -> CD FF 4D
	pop bc ; 9EE5E (27:6e5e) -> C1
	ret  ; 9EE5F (27:6e5f) -> C9

Data_9ee60:
	warpdef $01, $09, $01, $01, MAP_18_11, $02, $08, $03, $08, $2e
	warpdef $06, $04, $01, $01, MAP_18_16, $06, $04, $05, $04, $2e

Data_9ee76:
	warpdef $01, $09, $01, $01, MAP_18_12, $02, $08, $03, $08, $2e
	warpdef $06, $04, $01, $01, MAP_18_16, $06, $04, $05, $04, $2e

Data_9ee8c:
IF DEF(SUN)
	wildbot $00, $03, $08, $08, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $08, $08, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $08, $08, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $08, $08, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $08, $08, $74, $1e, $20, $79, $0c, $08, $00, $05, $0a, $00
	wildbot $00, $03, $08, $08, $4c, $20, $22, $30, $2a, $12, $00, $10, $09, $00
	wildbot $00, $03, $08, $08, $32, $21, $23, $79, $07, $0c, $00, $11, $08, $00
	wildbot $00, $03, $08, $08, $72, $21, $23, $79, $09, $09, $00, $10, $07, $00
ENDC

Func_9eec4:: ; 9eec4
	ld a, [wc792] ; 9EEC4 (27:6ec4) -> FA 92 C7
	cp $05 ; 9EEC7 (27:6ec7) -> FE 05
	jp z, .asm_9eedc ; 9EEC9 (27:6ec9) -> CA DC 6E
	ld a, [wc792] ; 9EECC (27:6ecc) -> FA 92 C7
	cp $07 ; 9EECF (27:6ecf) -> FE 07
	jp z, .asm_9eedc ; 9EED1 (27:6ed1) -> CA DC 6E
	ld a, [wc792] ; 9EED4 (27:6ed4) -> FA 92 C7
	cp $06 ; 9EED7 (27:6ed7) -> FE 06
	jp nz, .asm_9eeec ; 9EED9 (27:6ed9) -> C2 EC 6E
.asm_9eedc:
	ld e, $02 ; 9EEDC (27:6edc) -> 1E 02
	ld hl, Data_9ee76 ; 9EEDE (27:6ede) -> 21 76 6E
	scall LoadWarps ; 9EEE1 (27:6ee1) -> CD 3A 40
	ld a, $06 ; 9EEE4 (27:6ee4) -> 3E 06
	ld [wc792], a ; 9EEE6 (27:6ee6) -> EA 92 C7
	jp .asm_9eef9 ; 9EEE9 (27:6ee9) -> C3 F9 6E
.asm_9eeec:
	ld e, $02 ; 9EEEC (27:6eec) -> 1E 02
	ld hl, Data_9ee60 ; 9EEEE (27:6eee) -> 21 60 6E
	scall LoadWarps ; 9EEF1 (27:6ef1) -> CD 3A 40
	ld a, $03 ; 9EEF4 (27:6ef4) -> 3E 03
	ld [wc792], a ; 9EEF6 (27:6ef6) -> EA 92 C7
.asm_9eef9:
	ld a, $03 ; 9EEF9 (27:6ef9) -> 3E 03
	scall Func_80d01 ; 9EEFB (27:6efb) -> CD 01 4D
	ld e, $04 ; 9EEFE (27:6efe) -> 1E 04
	ld hl, Data_9ee8c ; 9EF00 (27:6f00) -> 21 8C 6E
	scall LoadEncounters ; 9EF03 (27:6f03) -> CD 24 4D
	ld a, $08 ; 9EF06 (27:6f06) -> 3E 08
	scall PlayMusic ; 9EF08 (27:6f08) -> CD E6 4E
	scall Func_8001c ; 9EF0B (27:6f0b) -> CD 1C 40
	ret  ; 9EF0E (27:6f0e) -> C9

Func_9ef0f:: ; 9ef0f
	ret

Func_9ef10:: ; 9ef10
	ret

Data_9ef11:
	warpdef $05, $02, $01, $01, MAP_19_03, $08, $11, $08, $12, $2e
	warpdef $04, $1a, $03, $01, MAP_19_22, $13, $16, $13, $17, $2e

Data_9ef27:
	dw $3ea
	dw -1

Data_9ef2b:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f017, NULL
	person_event $ff, $00, $04, $12, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9ef27

Data_9ef47:
IF DEF(SUN)
	wildbot $00, $03, $0b, $18, $5f, $1f, $22, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $18, $34, $1f, $22, $1a, $17, $05, $1e, $05, $09, $00
	wildbot $00, $03, $0b, $18, $60, $20, $23, $79, $05, $02, $03, $05, $08, $00
	wildbot $00, $03, $0b, $18, $35, $20, $23, $79, $17, $12, $11, $05, $07, $00
	wildbot $00, $03, $0b, $18, $26, $20, $23, $5d, $01, $01, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $18, $26, $1f, $22, $5b, $01, $00, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $18, $34, $1f, $22, $1a, $17, $05, $1e, $05, $09, $00
	wildbot $00, $03, $0b, $18, $27, $20, $23, $5d, $01, $03, $00, $05, $08, $00
	wildbot $00, $03, $0b, $18, $35, $20, $23, $79, $17, $12, $11, $05, $07, $00
	wildbot $00, $03, $0b, $18, $5f, $20, $23, $79, $05, $06, $00, $05, $06, $00
ENDC

Func_9ef8d:: ; 9ef8d
	ld e, $02 ; 9EF8D (27:6f8d) -> 1E 02
	ld hl, Data_9ef11 ; 9EF8F (27:6f8f) -> 21 11 6F
	scall LoadWarps ; 9EF92 (27:6f92) -> CD 3A 40
	ld a, $03 ; 9EF95 (27:6f95) -> 3E 03
	scall Func_80d01 ; 9EF97 (27:6f97) -> CD 01 4D
	ld e, $05 ; 9EF9A (27:6f9a) -> 1E 05
	ld hl, Data_9ef47 ; 9EF9C (27:6f9c) -> 21 47 6F
	scall LoadEncounters ; 9EF9F (27:6f9f) -> CD 24 4D
	ld e, $02 ; 9EFA2 (27:6fa2) -> 1E 02
	ld hl, Data_9ef2b ; 9EFA4 (27:6fa4) -> 21 2B 6F
	scall LoadMapObjects ; 9EFA7 (27:6fa7) -> CD FB 40
	ld a, $08 ; 9EFAA (27:6faa) -> 3E 08
	scall PlayMusic ; 9EFAC (27:6fac) -> CD E6 4E
	ld hl, $00e8 ; 9EFAF (27:6faf) -> 21 E8 00
	scall CheckEventFlag ; 9EFB2 (27:6fb2) -> CD 2E 46
	or a ; 9EFB5 (27:6fb5) -> B7
	jp nz, .asm_9efe3 ; 9EFB6 (27:6fb6) -> C2 E3 6F
	ld a, $01 ; 9EFB9 (27:6fb9) -> 3E 01
	ld [wc7da], a ; 9EFBB (27:6fbb) -> EA DA C7
	scall Func_8001c ; 9EFBE (27:6fbe) -> CD 1C 40
	ld hl, $043d ; 9EFC1 (27:6fc1) -> 21 3D 04
	scall PrintTextWithNPCName ; 9EFC4 (27:6fc4) -> CD A9 44
	ld e, $01 ; 9EFC7 (27:6fc7) -> 1E 01
	ld hl, $00e8 ; 9EFC9 (27:6fc9) -> 21 E8 00
	scall EventFlagAction ; 9EFCC (27:6fcc) -> CD 1B 46
	xor a ; 9EFCF (27:6fcf) -> AF
	ld [wc7da], a ; 9EFD0 (27:6fd0) -> EA DA C7
	ld l, $19 ; 9EFD3 (27:6fd3) -> 2E 19
	push hl ; 9EFD5 (27:6fd5) -> E5
	ld c, $05 ; 9EFD6 (27:6fd6) -> 0E 05
	ld e, $02 ; 9EFD8 (27:6fd8) -> 1E 02
	ld a, $13 ; 9EFDA (27:6fda) -> 3E 13
	scall Func_80dff ; 9EFDC (27:6fdc) -> CD FF 4D
	pop bc ; 9EFDF (27:6fdf) -> C1
	jp .asm_9efe6 ; 9EFE0 (27:6fe0) -> C3 E6 6F
.asm_9efe3:
	scall Func_8001c ; 9EFE3 (27:6fe3) -> CD 1C 40
.asm_9efe6:
	ret  ; 9EFE6 (27:6fe6) -> C9

Data_9efe7:
	db $01, $09, $09, $09, $02, $0a, $03, $0a, $07, $0a, $08, $0a, $00, $0b, $04, $0b
	db $00, $0c, $08, $0c, $09, $0c, $02, $0d, $04, $0d, $05, $0d, $06, $0d, $00, $0e
	db $02, $0e, $09, $0e, $0a, $0e, $00, $0f, $05, $0f, $05, $10, $07, $10, $08, $10

Func_9f017:
	add sp, $ce ; 9F017 (27:7017) -> E8 CE
	push de ; 9F019 (27:7019) -> D5
	ld hl, sp+$04 ; 9F01A (27:701a) -> F8 04
	push de ; 9F01C (27:701c) -> D5
	push hl ; 9F01D (27:701d) -> E5
	pop de ; 9F01E (27:701e) -> D1
	pop hl ; 9F01F (27:701f) -> E1
	ld hl, Data_9efe7 ; 9F020 (27:7020) -> 21 E7 6F
	ld bc, $0030 ; 9F023 (27:7023) -> 01 30 00
	call MemCopy ; 9F026 (27:7026) -> CD E8 35
	pop de ; 9F029 (27:7029) -> D1
	ld a, e ; 9F02A (27:702a) -> 7B
	cp $02 ; 9F02B (27:702b) -> FE 02
	jp nz, .asm_9f0d8 ; 9F02D (27:702d) -> C2 D8 70
	ld c, $00 ; 9F030 (27:7030) -> 0E 00
.asm_9f032:
	ld a, c ; 9F032 (27:7032) -> 79
	cp $18 ; 9F033 (27:7033) -> FE 18
	jp nc, .asm_9f069 ; 9F035 (27:7035) -> D2 69 70
	ld l, c ; 9F038 (27:7038) -> 69
	ld h, $00 ; 9F039 (27:7039) -> 26 00
	add hl, hl ; 9F03B (27:703b) -> 29
	push de ; 9F03C (27:703c) -> D5
	push hl ; 9F03D (27:703d) -> E5
	pop de ; 9F03E (27:703e) -> D1
	pop hl ; 9F03F (27:703f) -> E1
	ld hl, sp+$02 ; 9F040 (27:7040) -> F8 02
	add hl, de ; 9F042 (27:7042) -> 19
	ld a, [wMapX] ; 9F043 (27:7043) -> FA D8 C2
	add a, $05 ; 9F046 (27:7046) -> C6 05
	cp [hl] ; 9F048 (27:7048) -> BE
	jp nz, .asm_9f065 ; 9F049 (27:7049) -> C2 65 70
	ld l, c ; 9F04C (27:704c) -> 69
	ld h, $00 ; 9F04D (27:704d) -> 26 00
	add hl, hl ; 9F04F (27:704f) -> 29
	push de ; 9F050 (27:7050) -> D5
	push hl ; 9F051 (27:7051) -> E5
	pop de ; 9F052 (27:7052) -> D1
	pop hl ; 9F053 (27:7053) -> E1
	ld hl, sp+$03 ; 9F054 (27:7054) -> F8 03
	add hl, de ; 9F056 (27:7056) -> 19
	ld a, [wMapY] ; 9F057 (27:7057) -> FA D9 C2
	add a, $04 ; 9F05A (27:705a) -> C6 04
	cp [hl] ; 9F05C (27:705c) -> BE
	jp nz, .asm_9f065 ; 9F05D (27:705d) -> C2 65 70
	ld c, $ff ; 9F060 (27:7060) -> 0E FF
	jp .asm_9f069 ; 9F062 (27:7062) -> C3 69 70
.asm_9f065:
	inc c ; 9F065 (27:7065) -> 0C
	jp .asm_9f032 ; 9F066 (27:7066) -> C3 32 70
.asm_9f069:
	ld a, c ; 9F069 (27:7069) -> 79
	cp $ff ; 9F06A (27:706a) -> FE FF
	jp nz, .asm_9f0d8 ; 9F06C (27:706c) -> C2 D8 70
	ld c, $01 ; 9F06F (27:706f) -> 0E 01
	ld e, $01 ; 9F071 (27:7071) -> 1E 01
	ld a, $0a ; 9F073 (27:7073) -> 3E 0A
	scall LoadEmote ; 9F075 (27:7075) -> CD 76 41
	ld a, $35 ; 9F078 (27:7078) -> 3E 35
	call OverworldPlaySFX ; 9F07A (27:707a) -> CD 02 15
	scall StartShakingScreen ; 9F07D (27:707d) -> CD A2 4E
	scall WaitEmote ; 9F080 (27:7080) -> CD D5 41
	scall StopShakingScreen ; 9F083 (27:7083) -> CD B1 4E
	scall HideEmote ; 9F086 (27:7086) -> CD 8B 41
	ld c, $00 ; 9F089 (27:7089) -> 0E 00
.asm_9f08b:
	ld a, c ; 9F08B (27:708b) -> 79
	cp $04 ; 9F08C (27:708c) -> FE 04
	jp nc, .asm_9f0d8 ; 9F08E (27:708e) -> D2 D8 70
	push bc ; 9F091 (27:7091) -> C5
	ld l, c ; 9F092 (27:7092) -> 69
	ld h, $00 ; 9F093 (27:7093) -> 26 00
	scall Func_80488 ; 9F095 (27:7095) -> CD 88 44
	call WriteHLToSPPlus4 ; 9F098 (27:7098) -> CD 97 37
	pop bc ; 9F09B (27:709b) -> C1
	pop hl ; 9F09C (27:709c) -> E1
	push hl ; 9F09D (27:709d) -> E5
	ld a, l ; 9F09E (27:709e) -> 7D
	or h ; 9F09F (27:709f) -> B4
	jp nz, .asm_9f0a6 ; 9F0A0 (27:70a0) -> C2 A6 70
	jp .asm_9f0d4 ; 9F0A3 (27:70a3) -> C3 D4 70
.asm_9f0a6:
	pop hl ; 9F0A6 (27:70a6) -> E1
	push hl ; 9F0A7 (27:70a7) -> E5
	push de ; 9F0A8 (27:70a8) -> D5
	push hl ; 9F0A9 (27:70a9) -> E5
	pop de ; 9F0AA (27:70aa) -> D1
	pop hl ; 9F0AB (27:70ab) -> E1
	ld hl, $0015 ; 9F0AC (27:70ac) -> 21 15 00
	call CompareHLtoDE ; 9F0AF (27:70af) -> CD 08 36
	jp c, .asm_9f0bd ; 9F0B2 (27:70b2) -> DA BD 70
	pop hl ; 9F0B5 (27:70b5) -> E1
	push hl ; 9F0B6 (27:70b6) -> E5
	dec hl ; 9F0B7 (27:70b7) -> 2B
	pop de ; 9F0B8 (27:70b8) -> D1
	push hl ; 9F0B9 (27:70b9) -> E5
	jp .asm_9f0c2 ; 9F0BA (27:70ba) -> C3 C2 70
.asm_9f0bd:
	ld hl, $0014 ; 9F0BD (27:70bd) -> 21 14 00
	pop de ; 9F0C0 (27:70c0) -> D1
	push hl ; 9F0C1 (27:70c1) -> E5
.asm_9f0c2:
	push bc ; 9F0C2 (27:70c2) -> C5
	call GetHLAtSPPlus4 ; 9F0C3 (27:70c3) -> CD 29 38
	ld a, l ; 9F0C6 (27:70c6) -> 7D
	cpl  ; 9F0C7 (27:70c7) -> 2F
	ld l, a ; 9F0C8 (27:70c8) -> 6F
	ld a, h ; 9F0C9 (27:70c9) -> 7C
	cpl  ; 9F0CA (27:70ca) -> 2F
	ld h, a ; 9F0CB (27:70cb) -> 67
	inc hl ; 9F0CC (27:70cc) -> 23
	ld e, c ; 9F0CD (27:70cd) -> 59
	ld d, $00 ; 9F0CE (27:70ce) -> 16 00
	scall Func_80e31 ; 9F0D0 (27:70d0) -> CD 31 4E
	pop bc ; 9F0D3 (27:70d3) -> C1
.asm_9f0d4:
	inc c ; 9F0D4 (27:70d4) -> 0C
	jp .asm_9f08b ; 9F0D5 (27:70d5) -> C3 8B 70
.asm_9f0d8:
	add sp, $32 ; 9F0D8 (27:70d8) -> E8 32
	ret  ; 9F0DA (27:70da) -> C9

Data_9f0db:
	warpdef $08, $11, $01, $01, MAP_19_02, $05, $02, $05, $03, $2e
	warpdef $1d, $04, $01, $01, MAP_19_10, $06, $1d, $06, $1c, $2e

Data_9f0f1:
IF DEF(SUN)
	wildbot $05, $05, $1a, $17, $60, $20, $23, $79, $05, $02, $03, $05, $0a, $00
	wildbot $05, $05, $1a, $17, $35, $20, $23, $79, $17, $12, $11, $05, $09, $00
	wildbot $05, $05, $1a, $17, $26, $20, $23, $5d, $01, $01, $00, $05, $08, $00
	wildbot $05, $05, $1a, $17, $27, $22, $25, $5d, $01, $03, $00, $05, $07, $00
	wildbot $05, $05, $1a, $17, $61, $22, $25, $5d, $05, $09, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $05, $05, $1a, $17, $27, $20, $23, $5d, $01, $03, $00, $05, $0a, $00
	wildbot $05, $05, $1a, $17, $35, $20, $23, $79, $17, $12, $11, $05, $09, $00
	wildbot $05, $05, $1a, $17, $5f, $20, $23, $77, $05, $06, $00, $05, $08, $00
	wildbot $05, $05, $1a, $17, $60, $22, $25, $79, $05, $02, $03, $05, $07, $00
	wildbot $05, $05, $1a, $17, $28, $22, $25, $5d, $0e, $0f, $00, $05, $06, $00
ENDC

Func_9f137:: ; 9f137
	ld e, $02 ; 9F137 (27:7137) -> 1E 02
	ld hl, Data_9f0db ; 9F139 (27:7139) -> 21 DB 70
	scall LoadWarps ; 9F13C (27:713c) -> CD 3A 40
	ld a, $03 ; 9F13F (27:713f) -> 3E 03
	scall Func_80d01 ; 9F141 (27:7141) -> CD 01 4D
	ld e, $05 ; 9F144 (27:7144) -> 1E 05
	ld hl, Data_9f0f1 ; 9F146 (27:7146) -> 21 F1 70
	scall LoadEncounters ; 9F149 (27:7149) -> CD 24 4D
	ld a, $13 ; 9F14C (27:714c) -> 3E 13
	scall PlayMusic ; 9F14E (27:714e) -> CD E6 4E
	scall Func_8001c ; 9F151 (27:7151) -> CD 1C 40
	ret  ; 9F154 (27:7154) -> C9

Data_9f155:
	warpdef $05, $1d, $03, $01, MAP_19_03, $1d, $04, $1d, $05, $2e
	warpdef $06, $02, $01, $01, MAP_19_20, $09, $27, $09, $26, $2e

Data_9f16b:
IF DEF(SUN)
	wildbot $00, $03, $0e, $1b, $26, $20, $23, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $00, $03, $0e, $1b, $27, $22, $25, $5d, $01, $03, $00, $05, $09, $00
	wildbot $00, $03, $0e, $1b, $61, $22, $25, $5d, $05, $09, $00, $05, $08, $00
	wildbot $00, $03, $0e, $1b, $36, $24, $27, $79, $0f, $0b, $00, $05, $07, $00
	wildbot $00, $03, $0e, $1b, $28, $24, $27, $5d, $0e, $0f, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $1b, $5f, $20, $23, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $03, $0e, $1b, $60, $22, $25, $5d, $01, $03, $00, $05, $09, $00
	wildbot $00, $03, $0e, $1b, $28, $22, $25, $5d, $0e, $0f, $00, $05, $08, $00
	wildbot $00, $03, $0e, $1b, $36, $24, $27, $79, $0f, $0b, $00, $05, $07, $00
	wildbot $00, $03, $0e, $1b, $61, $24, $27, $5d, $05, $09, $00, $05, $06, $00
ENDC

Data_9f1b1:
	db $8b, $01, $13, $01, $38
	db $8c, $0c, $14, $01, $49

Data_9f1bb:
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f214, NULL

Func_9f1c9:: ; 9f1c9
	ld e, $02 ; 9F1C9 (27:71c9) -> 1E 02
	ld hl, Data_9f155 ; 9F1CB (27:71cb) -> 21 55 71
	scall LoadWarps ; 9F1CE (27:71ce) -> CD 3A 40
	ld e, $01 ; 9F1D1 (27:71d1) -> 1E 01
	ld hl, Data_9f1bb ; 9F1D3 (27:71d3) -> 21 BB 71
	scall LoadMapObjects ; 9F1D6 (27:71d6) -> CD FB 40
	ld a, $08 ; 9F1D9 (27:71d9) -> 3E 08
	scall PlayMusic ; 9F1DB (27:71db) -> CD E6 4E
	ld a, $03 ; 9F1DE (27:71de) -> 3E 03
	scall Func_80d01 ; 9F1E0 (27:71e0) -> CD 01 4D
	ld e, $05 ; 9F1E3 (27:71e3) -> 1E 05
	ld hl, Data_9f16b ; 9F1E5 (27:71e5) -> 21 6B 71
	scall LoadEncounters ; 9F1E8 (27:71e8) -> CD 24 4D
	ld e, $02 ; 9F1EB (27:71eb) -> 1E 02
	ld hl, Data_9f1b1 ; 9F1ED (27:71ed) -> 21 B1 71
	scall Func_80ce7 ; 9F1F0 (27:71f0) -> CD E7 4C
	ld a, $44 ; 9F1F3 (27:71f3) -> 3E 44
	scall Func_80f43 ; 9F1F5 (27:71f5) -> CD 43 4F
	scall Func_8001c ; 9F1F8 (27:71f8) -> CD 1C 40
	ret  ; 9F1FB (27:71fb) -> C9

Data_9f1fc:
	db $09, $0b, $0a, $0b, $01, $0c, $0b, $0d, $02, $0e, $04, $10, $05, $10, $0a, $10
	db $00, $11, $06, $12, $01, $14, $0c, $15

Func_9f214:
	add sp, $e6 ; 9F214 (27:7214) -> E8 E6
	push de ; 9F216 (27:7216) -> D5
	ld hl, sp+$04 ; 9F217 (27:7217) -> F8 04
	push de ; 9F219 (27:7219) -> D5
	push hl ; 9F21A (27:721a) -> E5
	pop de ; 9F21B (27:721b) -> D1
	pop hl ; 9F21C (27:721c) -> E1
	ld hl, Data_9f1fc ; 9F21D (27:721d) -> 21 FC 71
	ld bc, $0018 ; 9F220 (27:7220) -> 01 18 00
	call MemCopy ; 9F223 (27:7223) -> CD E8 35
	pop de ; 9F226 (27:7226) -> D1
	ld a, e ; 9F227 (27:7227) -> 7B
	cp $02 ; 9F228 (27:7228) -> FE 02
	jp nz, .asm_9f2d9 ; 9F22A (27:722a) -> C2 D9 72
	ld c, $00 ; 9F22D (27:722d) -> 0E 00
.asm_9f22f:
	ld a, c ; 9F22F (27:722f) -> 79
	cp $0c ; 9F230 (27:7230) -> FE 0C
	jp nc, .asm_9f266 ; 9F232 (27:7232) -> D2 66 72
	ld l, c ; 9F235 (27:7235) -> 69
	ld h, $00 ; 9F236 (27:7236) -> 26 00
	add hl, hl ; 9F238 (27:7238) -> 29
	push de ; 9F239 (27:7239) -> D5
	push hl ; 9F23A (27:723a) -> E5
	pop de ; 9F23B (27:723b) -> D1
	pop hl ; 9F23C (27:723c) -> E1
	ld hl, sp+$02 ; 9F23D (27:723d) -> F8 02
	add hl, de ; 9F23F (27:723f) -> 19
	ld a, [wMapX] ; 9F240 (27:7240) -> FA D8 C2
	add a, $05 ; 9F243 (27:7243) -> C6 05
	cp [hl] ; 9F245 (27:7245) -> BE
	jp nz, .asm_9f262 ; 9F246 (27:7246) -> C2 62 72
	ld l, c ; 9F249 (27:7249) -> 69
	ld h, $00 ; 9F24A (27:724a) -> 26 00
	add hl, hl ; 9F24C (27:724c) -> 29
	push de ; 9F24D (27:724d) -> D5
	push hl ; 9F24E (27:724e) -> E5
	pop de ; 9F24F (27:724f) -> D1
	pop hl ; 9F250 (27:7250) -> E1
	ld hl, sp+$03 ; 9F251 (27:7251) -> F8 03
	add hl, de ; 9F253 (27:7253) -> 19
	ld a, [wMapY] ; 9F254 (27:7254) -> FA D9 C2
	add a, $04 ; 9F257 (27:7257) -> C6 04
	cp [hl] ; 9F259 (27:7259) -> BE
	jp nz, .asm_9f262 ; 9F25A (27:725a) -> C2 62 72
	ld c, $ff ; 9F25D (27:725d) -> 0E FF
	jp .asm_9f266 ; 9F25F (27:725f) -> C3 66 72
.asm_9f262:
	inc c ; 9F262 (27:7262) -> 0C
	jp .asm_9f22f ; 9F263 (27:7263) -> C3 2F 72
.asm_9f266:
	ld a, c ; 9F266 (27:7266) -> 79
	cp $ff ; 9F267 (27:7267) -> FE FF
	jp nz, .asm_9f2d9 ; 9F269 (27:7269) -> C2 D9 72
	ld c, $01 ; 9F26C (27:726c) -> 0E 01
	ld e, $01 ; 9F26E (27:726e) -> 1E 01
	ld a, $0a ; 9F270 (27:7270) -> 3E 0A
	scall LoadEmote ; 9F272 (27:7272) -> CD 76 41
	ld a, $35 ; 9F275 (27:7275) -> 3E 35
	call OverworldPlaySFX ; 9F277 (27:7277) -> CD 02 15
	scall StartShakingScreen ; 9F27A (27:727a) -> CD A2 4E
	scall WaitEmote ; 9F27D (27:727d) -> CD D5 41
	scall StopShakingScreen ; 9F280 (27:7280) -> CD B1 4E
	scall HideEmote ; 9F283 (27:7283) -> CD 8B 41
	ld c, $00 ; 9F286 (27:7286) -> 0E 00
.asm_9f288:
	ld a, c ; 9F288 (27:7288) -> 79
	cp $04 ; 9F289 (27:7289) -> FE 04
	jp nc, .asm_9f2d5 ; 9F28B (27:728b) -> D2 D5 72
	push bc ; 9F28E (27:728e) -> C5
	ld l, c ; 9F28F (27:728f) -> 69
	ld h, $00 ; 9F290 (27:7290) -> 26 00
	scall Func_80488 ; 9F292 (27:7292) -> CD 88 44
	call WriteHLToSPPlus4 ; 9F295 (27:7295) -> CD 97 37
	pop bc ; 9F298 (27:7298) -> C1
	pop hl ; 9F299 (27:7299) -> E1
	push hl ; 9F29A (27:729a) -> E5
	ld a, l ; 9F29B (27:729b) -> 7D
	or h ; 9F29C (27:729c) -> B4
	jp nz, .asm_9f2a3 ; 9F29D (27:729d) -> C2 A3 72
	jp .asm_9f2d1 ; 9F2A0 (27:72a0) -> C3 D1 72
.asm_9f2a3:
	pop hl ; 9F2A3 (27:72a3) -> E1
	push hl ; 9F2A4 (27:72a4) -> E5
	push de ; 9F2A5 (27:72a5) -> D5
	push hl ; 9F2A6 (27:72a6) -> E5
	pop de ; 9F2A7 (27:72a7) -> D1
	pop hl ; 9F2A8 (27:72a8) -> E1
	ld hl, $0015 ; 9F2A9 (27:72a9) -> 21 15 00
	call CompareHLtoDE ; 9F2AC (27:72ac) -> CD 08 36
	jp c, .asm_9f2ba ; 9F2AF (27:72af) -> DA BA 72
	pop hl ; 9F2B2 (27:72b2) -> E1
	push hl ; 9F2B3 (27:72b3) -> E5
	dec hl ; 9F2B4 (27:72b4) -> 2B
	pop de ; 9F2B5 (27:72b5) -> D1
	push hl ; 9F2B6 (27:72b6) -> E5
	jp .asm_9f2bf ; 9F2B7 (27:72b7) -> C3 BF 72
.asm_9f2ba:
	ld hl, $0014 ; 9F2BA (27:72ba) -> 21 14 00
	pop de ; 9F2BD (27:72bd) -> D1
	push hl ; 9F2BE (27:72be) -> E5
.asm_9f2bf:
	push bc ; 9F2BF (27:72bf) -> C5
	call GetHLAtSPPlus4 ; 9F2C0 (27:72c0) -> CD 29 38
	ld a, l ; 9F2C3 (27:72c3) -> 7D
	cpl  ; 9F2C4 (27:72c4) -> 2F
	ld l, a ; 9F2C5 (27:72c5) -> 6F
	ld a, h ; 9F2C6 (27:72c6) -> 7C
	cpl  ; 9F2C7 (27:72c7) -> 2F
	ld h, a ; 9F2C8 (27:72c8) -> 67
	inc hl ; 9F2C9 (27:72c9) -> 23
	ld e, c ; 9F2CA (27:72ca) -> 59
	ld d, $00 ; 9F2CB (27:72cb) -> 16 00
	scall Func_80e31 ; 9F2CD (27:72cd) -> CD 31 4E
	pop bc ; 9F2D0 (27:72d0) -> C1
.asm_9f2d1:
	inc c ; 9F2D1 (27:72d1) -> 0C
	jp .asm_9f288 ; 9F2D2 (27:72d2) -> C3 88 72
.asm_9f2d5:
	xor a ; 9F2D5 (27:72d5) -> AF
	ld [wSliding], a ; 9F2D6 (27:72d6) -> EA 58 C8
.asm_9f2d9:
	add sp, $1a ; 9F2D9 (27:72d9) -> E8 1A
	ret  ; 9F2DB (27:72db) -> C9

Data_9f2dc:
	warpdef $00, $1b, $03, $01, MAP_19_37, $06, $02, $06, $03, $2e
	warpdef $05, $06, $03, $01, MAP_09_00, $0b, $12, $0b, $13, $2e

Data_9f2f2:
IF DEF(SUN)
	wildbot $00, $03, $15, $19, $5f, $14, $18, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $15, $19, $50, $14, $18, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $15, $19, $34, $15, $19, $17, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $15, $19, $35, $15, $19, $77, $17, $12, $11, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $15, $19, $50, $14, $18, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $15, $19, $57, $14, $18, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $15, $19, $26, $15, $19, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $15, $19, $5f, $15, $19, $77, $05, $06, $00, $04, $06, $00
ENDC

Data_9f32a:
	person_event $ff, $00, $12, $11, $03, $03, $00, $04, $00, Func_9f369, NULL

Func_9f338:: ; 9f338
	ld e, $02 ; 9F338 (27:7338) -> 1E 02
	ld hl, Data_9f2dc ; 9F33A (27:733a) -> 21 DC 72
	scall LoadWarps ; 9F33D (27:733d) -> CD 3A 40
	ld e, $01 ; 9F340 (27:7340) -> 1E 01
	ld hl, Data_9f32a ; 9F342 (27:7342) -> 21 2A 73
	scall LoadMapObjects ; 9F345 (27:7345) -> CD FB 40
	ld a, $03 ; 9F348 (27:7348) -> 3E 03
	scall Func_80d01 ; 9F34A (27:734a) -> CD 01 4D
	ld e, $04 ; 9F34D (27:734d) -> 1E 04
	ld hl, Data_9f2f2 ; 9F34F (27:734f) -> 21 F2 72
	scall LoadEncounters ; 9F352 (27:7352) -> CD 24 4D
	ld a, $08 ; 9F355 (27:7355) -> 3E 08
	scall PlayMusic ; 9F357 (27:7357) -> CD E6 4E
	ld a, $01 ; 9F35A (27:735a) -> 3E 01
	scall LoadPlayerSprite ; 9F35C (27:735c) -> CD C6 4C
	scall Func_8001c ; 9F35F (27:735f) -> CD 1C 40
	ld hl, $02e3 ; 9F362 (27:7362) -> 21 E3 02
	scall LandmarkSign ; 9F365 (27:7365) -> CD 72 4F
	ret  ; 9F368 (27:7368) -> C9

Func_9f369:
	ld a, e ; 9F369 (27:7369) -> 7B
	or a ; 9F36A (27:736a) -> B7
	jp nz, .asm_9f394 ; 9F36B (27:736b) -> C2 94 73
	scall RepairRobots ; 9F36E (27:736e) -> CD E0 42
	xor a ; 9F371 (27:7371) -> AF
	scall PlayMusic ; 9F372 (27:7372) -> CD E6 4E
	ld a, $16 ; 9F375 (27:7375) -> 3E 16
	scall PlayMusic ; 9F377 (27:7377) -> CD E6 4E
	ld c, $01 ; 9F37A (27:737a) -> 0E 01
	ld e, $02 ; 9F37C (27:737c) -> 1E 02
	ld a, $08 ; 9F37E (27:737e) -> 3E 08
	scall LoadEmote ; 9F380 (27:7380) -> CD 76 41
	scall WaitEmote ; 9F383 (27:7383) -> CD D5 41
	scall HideEmote ; 9F386 (27:7386) -> CD 8B 41
	ld hl, $0322 ; 9F389 (27:7389) -> 21 22 03
	scall PrintTextStandard ; 9F38C (27:738c) -> CD 98 44
	ld a, $08 ; 9F38F (27:738f) -> 3E 08
	scall PlayMusic ; 9F391 (27:7391) -> CD E6 4E
.asm_9f394:
	ret  ; 9F394 (27:7394) -> C9

Data_9f395:
	db $08, $27, $03, $01, $13, $0a, $06, $02, $06, $03, $2e
	db $0c, $02, $01, $01, $13, $28, $05, $0c, $05, $0b, $2e

Data_9f3ab:
	db $1c, $09, $14

Data_9f3ae:
	db $1c, $09, $14, $00, $00

Data_9f3b3:
	db $86, $04, $0e, $02, $0b
	db $87, $10, $0e, $02, $4c

Data_9f3bd:
	db $ea, $03, $ff, $ff

Data_9f3c1:
	person_event $ff, $00, $03, $04, $03, $03, $00, $04, $00, Func_9f574, NULL
	person_event $00, $04, $08, $14, $01, $01, $03, $04, $00, Func_806dd_27, Data_9f3ab
	person_event $ff, $00, $00, $00, $64, $64, $00, $04, $01, Func_9f4ac, NULL
	person_event $ff, $00, $08, $1f, $01, $01, $00, $04, $00, PrintTextFacePlayer_27, Data_9f3bd

Data_9f3f9:
IF DEF(SUN)
	wildbot $01, $03, $11, $25, $27, $23, $26, $5d, $01, $03, $00, $05, $0a, $00
	wildbot $01, $03, $11, $25, $61, $23, $26, $5d, $05, $09, $00, $05, $09, $00
	wildbot $01, $03, $11, $25, $36, $25, $28, $79, $0f, $0b, $00, $05, $08, $00
	wildbot $01, $03, $11, $25, $28, $25, $28, $5d, $0e, $0f, $00, $05, $07, $00
	wildbot $01, $03, $11, $25, $37, $27, $2a, $5d, $24, $12, $00, $05, $06, $00
ELIF DEF(STAR)
	wildbot $01, $03, $11, $25, $60, $23, $26, $79, $05, $02, $03, $05, $0a, $00
	wildbot $01, $03, $11, $25, $28, $23, $26, $5d, $0e, $0f, $00, $05, $09, $00
	wildbot $01, $03, $11, $25, $36, $25, $28, $79, $0f, $0b, $00, $05, $08, $00
	wildbot $01, $03, $11, $25, $61, $25, $28, $5d, $05, $09, $00, $05, $07, $00
	wildbot $01, $03, $11, $25, $37, $27, $2a, $5d, $24, $12, $00, $05, $06, $00
ENDC

Func_9f43f:: ; 9f43f
	ld e, $02 ; 9F43F (27:743f) -> 1E 02
	ld hl, Data_9f395 ; 9F441 (27:7441) -> 21 95 73
	scall LoadWarps ; 9F444 (27:7444) -> CD 3A 40
	ld e, $01 ; 9F447 (27:7447) -> 1E 01
	ld hl, Data_9f3ae ; 9F449 (27:7449) -> 21 AE 73
	scall Func_80ce7 ; 9F44C (27:744c) -> CD E7 4C
	ld e, $02 ; 9F44F (27:744f) -> 1E 02
	ld hl, Data_9f3b3 ; 9F451 (27:7451) -> 21 B3 73
	scall Func_80ce7 ; 9F454 (27:7454) -> CD E7 4C
	ld a, $03 ; 9F457 (27:7457) -> 3E 03
	scall Func_80d01 ; 9F459 (27:7459) -> CD 01 4D
	ld e, $05 ; 9F45C (27:745c) -> 1E 05
	ld hl, Data_9f3f9 ; 9F45E (27:745e) -> 21 F9 73
	scall LoadEncounters ; 9F461 (27:7461) -> CD 24 4D
	ld e, $04 ; 9F464 (27:7464) -> 1E 04
	ld hl, Data_9f3c1 ; 9F466 (27:7466) -> 21 C1 73
	scall LoadMapObjects ; 9F469 (27:7469) -> CD FB 40
	ld a, $08 ; 9F46C (27:746c) -> 3E 08
	scall PlayMusic ; 9F46E (27:746e) -> CD E6 4E
	ld a, $44 ; 9F471 (27:7471) -> 3E 44
	scall Func_80f43 ; 9F473 (27:7473) -> CD 43 4F
	scall Func_8001c ; 9F476 (27:7476) -> CD 1C 40
	ret  ; 9F479 (27:7479) -> C9

Data_9f47a:
	db $0f, $09, $11, $09, $04, $0c, $07, $0c, $0a, $0c, $0e, $0c, $10, $0c, $04, $0d
	db $10, $0d, $03, $0e, $05, $0e, $0f, $0e, $11, $0e, $04, $0f, $10, $0f, $09, $13
	db $08, $14, $0a, $14, $09, $15, $10, $17, $03, $18, $0d, $19, $06, $1a, $03, $1b
	db $10, $1c

Func_9f4ac:
	add sp, $cc ; 9F4AC (27:74ac) -> E8 CC
	push de ; 9F4AE (27:74ae) -> D5
	ld hl, sp+$04 ; 9F4AF (27:74af) -> F8 04
	push de ; 9F4B1 (27:74b1) -> D5
	push hl ; 9F4B2 (27:74b2) -> E5
	pop de ; 9F4B3 (27:74b3) -> D1
	pop hl ; 9F4B4 (27:74b4) -> E1
	ld hl, Data_9f47a ; 9F4B5 (27:74b5) -> 21 7A 74
	ld bc, $0032 ; 9F4B8 (27:74b8) -> 01 32 00
	call MemCopy ; 9F4BB (27:74bb) -> CD E8 35
	pop de ; 9F4BE (27:74be) -> D1
	ld a, e ; 9F4BF (27:74bf) -> 7B
	cp $02 ; 9F4C0 (27:74c0) -> FE 02
	jp nz, .asm_9f571 ; 9F4C2 (27:74c2) -> C2 71 75
	ld c, $00 ; 9F4C5 (27:74c5) -> 0E 00
.asm_9f4c7:
	ld a, c ; 9F4C7 (27:74c7) -> 79
	cp $19 ; 9F4C8 (27:74c8) -> FE 19
	jp nc, .asm_9f4fe ; 9F4CA (27:74ca) -> D2 FE 74
	ld l, c ; 9F4CD (27:74cd) -> 69
	ld h, $00 ; 9F4CE (27:74ce) -> 26 00
	add hl, hl ; 9F4D0 (27:74d0) -> 29
	push de ; 9F4D1 (27:74d1) -> D5
	push hl ; 9F4D2 (27:74d2) -> E5
	pop de ; 9F4D3 (27:74d3) -> D1
	pop hl ; 9F4D4 (27:74d4) -> E1
	ld hl, sp+$02 ; 9F4D5 (27:74d5) -> F8 02
	add hl, de ; 9F4D7 (27:74d7) -> 19
	ld a, [wMapX] ; 9F4D8 (27:74d8) -> FA D8 C2
	add a, $05 ; 9F4DB (27:74db) -> C6 05
	cp [hl] ; 9F4DD (27:74dd) -> BE
	jp nz, .asm_9f4fa ; 9F4DE (27:74de) -> C2 FA 74
	ld l, c ; 9F4E1 (27:74e1) -> 69
	ld h, $00 ; 9F4E2 (27:74e2) -> 26 00
	add hl, hl ; 9F4E4 (27:74e4) -> 29
	push de ; 9F4E5 (27:74e5) -> D5
	push hl ; 9F4E6 (27:74e6) -> E5
	pop de ; 9F4E7 (27:74e7) -> D1
	pop hl ; 9F4E8 (27:74e8) -> E1
	ld hl, sp+$03 ; 9F4E9 (27:74e9) -> F8 03
	add hl, de ; 9F4EB (27:74eb) -> 19
	ld a, [wMapY] ; 9F4EC (27:74ec) -> FA D9 C2
	add a, $04 ; 9F4EF (27:74ef) -> C6 04
	cp [hl] ; 9F4F1 (27:74f1) -> BE
	jp nz, .asm_9f4fa ; 9F4F2 (27:74f2) -> C2 FA 74
	ld c, $ff ; 9F4F5 (27:74f5) -> 0E FF
	jp .asm_9f4fe ; 9F4F7 (27:74f7) -> C3 FE 74
.asm_9f4fa:
	inc c ; 9F4FA (27:74fa) -> 0C
	jp .asm_9f4c7 ; 9F4FB (27:74fb) -> C3 C7 74
.asm_9f4fe:
	ld a, c ; 9F4FE (27:74fe) -> 79
	cp $ff ; 9F4FF (27:74ff) -> FE FF
	jp nz, .asm_9f571 ; 9F501 (27:7501) -> C2 71 75
	ld c, $01 ; 9F504 (27:7504) -> 0E 01
	ld e, $01 ; 9F506 (27:7506) -> 1E 01
	ld a, $0a ; 9F508 (27:7508) -> 3E 0A
	scall LoadEmote ; 9F50A (27:750a) -> CD 76 41
	ld a, $35 ; 9F50D (27:750d) -> 3E 35
	call OverworldPlaySFX ; 9F50F (27:750f) -> CD 02 15
	scall StartShakingScreen ; 9F512 (27:7512) -> CD A2 4E
	scall WaitEmote ; 9F515 (27:7515) -> CD D5 41
	scall StopShakingScreen ; 9F518 (27:7518) -> CD B1 4E
	scall HideEmote ; 9F51B (27:751b) -> CD 8B 41
	ld c, $00 ; 9F51E (27:751e) -> 0E 00
.asm_9f520:
	ld a, c ; 9F520 (27:7520) -> 79
	cp $04 ; 9F521 (27:7521) -> FE 04
	jp nc, .asm_9f56d ; 9F523 (27:7523) -> D2 6D 75
	push bc ; 9F526 (27:7526) -> C5
	ld l, c ; 9F527 (27:7527) -> 69
	ld h, $00 ; 9F528 (27:7528) -> 26 00
	scall Func_80488 ; 9F52A (27:752a) -> CD 88 44
	call WriteHLToSPPlus4 ; 9F52D (27:752d) -> CD 97 37
	pop bc ; 9F530 (27:7530) -> C1
	pop hl ; 9F531 (27:7531) -> E1
	push hl ; 9F532 (27:7532) -> E5
	ld a, l ; 9F533 (27:7533) -> 7D
	or h ; 9F534 (27:7534) -> B4
	jp nz, .asm_9f53b ; 9F535 (27:7535) -> C2 3B 75
	jp .asm_9f569 ; 9F538 (27:7538) -> C3 69 75
.asm_9f53b:
	pop hl ; 9F53B (27:753b) -> E1
	push hl ; 9F53C (27:753c) -> E5
	push de ; 9F53D (27:753d) -> D5
	push hl ; 9F53E (27:753e) -> E5
	pop de ; 9F53F (27:753f) -> D1
	pop hl ; 9F540 (27:7540) -> E1
	ld hl, $0015 ; 9F541 (27:7541) -> 21 15 00
	call CompareHLtoDE ; 9F544 (27:7544) -> CD 08 36
	jp c, .asm_9f552 ; 9F547 (27:7547) -> DA 52 75
	pop hl ; 9F54A (27:754a) -> E1
	push hl ; 9F54B (27:754b) -> E5
	dec hl ; 9F54C (27:754c) -> 2B
	pop de ; 9F54D (27:754d) -> D1
	push hl ; 9F54E (27:754e) -> E5
	jp .asm_9f557 ; 9F54F (27:754f) -> C3 57 75
.asm_9f552:
	ld hl, $0014 ; 9F552 (27:7552) -> 21 14 00
	pop de ; 9F555 (27:7555) -> D1
	push hl ; 9F556 (27:7556) -> E5
.asm_9f557:
	push bc ; 9F557 (27:7557) -> C5
	call GetHLAtSPPlus4 ; 9F558 (27:7558) -> CD 29 38
	ld a, l ; 9F55B (27:755b) -> 7D
	cpl  ; 9F55C (27:755c) -> 2F
	ld l, a ; 9F55D (27:755d) -> 6F
	ld a, h ; 9F55E (27:755e) -> 7C
	cpl  ; 9F55F (27:755f) -> 2F
	ld h, a ; 9F560 (27:7560) -> 67
	inc hl ; 9F561 (27:7561) -> 23
	ld e, c ; 9F562 (27:7562) -> 59
	ld d, $00 ; 9F563 (27:7563) -> 16 00
	scall Func_80e31 ; 9F565 (27:7565) -> CD 31 4E
	pop bc ; 9F568 (27:7568) -> C1
.asm_9f569:
	inc c ; 9F569 (27:7569) -> 0C
	jp .asm_9f520 ; 9F56A (27:756a) -> C3 20 75
.asm_9f56d:
	xor a ; 9F56D (27:756d) -> AF
	ld [wSliding], a ; 9F56E (27:756e) -> EA 58 C8
.asm_9f571:
	add sp, $34 ; 9F571 (27:7571) -> E8 34
	ret  ; 9F573 (27:7573) -> C9

Func_9f574:
	ld a, e ; 9F574 (27:7574) -> 7B
	or a ; 9F575 (27:7575) -> B7
	jp nz, .asm_9f59f ; 9F576 (27:7576) -> C2 9F 75
	scall RepairRobots ; 9F579 (27:7579) -> CD E0 42
	xor a ; 9F57C (27:757c) -> AF
	scall PlayMusic ; 9F57D (27:757d) -> CD E6 4E
	ld a, $16 ; 9F580 (27:7580) -> 3E 16
	scall PlayMusic ; 9F582 (27:7582) -> CD E6 4E
	ld c, $01 ; 9F585 (27:7585) -> 0E 01
	ld e, $02 ; 9F587 (27:7587) -> 1E 02
	ld a, $08 ; 9F589 (27:7589) -> 3E 08
	scall LoadEmote ; 9F58B (27:758b) -> CD 76 41
	scall WaitEmote ; 9F58E (27:758e) -> CD D5 41
	scall HideEmote ; 9F591 (27:7591) -> CD 8B 41
	ld hl, $0322 ; 9F594 (27:7594) -> 21 22 03
	scall PrintTextStandard ; 9F597 (27:7597) -> CD 98 44
	ld a, $08 ; 9F59A (27:759a) -> 3E 08
	scall PlayMusic ; 9F59C (27:759c) -> CD E6 4E
.asm_9f59f:
	ret  ; 9F59F (27:759f) -> C9

Func_9f5a0:: ; 9f5a0
	ret

Data_9f5a1:
	warpdef $13, $16, $01, $01, MAP_19_02, $05, $1a, $05, $19, $2e
	warpdef $0e, $04, $03, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e

Data_9f5b7:
IF DEF(SUN)
	wildbot $05, $0a, $10, $14, $5f, $1e, $21, $79, $05, $06, $00, $05, $0a, $00
	wildbot $05, $0a, $10, $14, $34, $1e, $21, $1a, $17, $05, $1e, $05, $0a, $00,
	wildbot $05, $0a, $10, $14, $26, $1e, $21, $5d, $01, $01, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $05, $0a, $10, $14, $26, $1e, $21, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $05, $0a, $10, $14, $34, $1e, $21, $1a, $17, $05, $1e, $05, $0a, $00,
	wildbot $05, $0a, $10, $14, $5f, $1e, $21, $79, $05, $06, $00, $05, $0a, $00
ENDC

Func_9f5e1:: ; 9f5e1
	ld a, $11 ; 9F5E1 (27:75e1) -> 3E 11
	ld [wc7e2], a ; 9F5E3 (27:75e3) -> EA E2 C7
	ld e, $02 ; 9F5E6 (27:75e6) -> 1E 02
	ld hl, Data_9f5a1 ; 9F5E8 (27:75e8) -> 21 A1 75
	scall LoadWarps ; 9F5EB (27:75eb) -> CD 3A 40
	ld a, $03 ; 9F5EE (27:75ee) -> 3E 03
	scall Func_80d01 ; 9F5F0 (27:75f0) -> CD 01 4D
	ld e, $03 ; 9F5F3 (27:75f3) -> 1E 03
	ld hl, Data_9f5b7 ; 9F5F5 (27:75f5) -> 21 B7 75
	scall LoadEncounters ; 9F5F8 (27:75f8) -> CD 24 4D
	ld a, [wBackupMapGroup] ; 9F5FB (27:75fb) -> FA DF C7
	cp $20 ; 9F5FE (27:75fe) -> FE 20
	jp nz, .asm_9f632 ; 9F600 (27:7600) -> C2 32 76
	ld a, [wBackupMapNumber] ; 9F603 (27:7603) -> FA E0 C7
	cp $0b ; 9F606 (27:7606) -> FE 0B
	jp nz, .asm_9f632 ; 9F608 (27:7608) -> C2 32 76
	ld hl, $00f9 ; 9F60B (27:760b) -> 21 F9 00
	scall CheckEventFlag ; 9F60E (27:760e) -> CD 2E 46
	or a ; 9F611 (27:7611) -> B7
	jp nz, .asm_9f627 ; 9F612 (27:7612) -> C2 27 76
	ld a, $0e ; 9F615 (27:7615) -> 3E 0E
	scall PlayMusic ; 9F617 (27:7617) -> CD E6 4E
	xor a ; 9F61A (27:761a) -> AF
	scall Func_80653 ; 9F61B (27:761b) -> CD 53 46
	scall Func_8001c ; 9F61E (27:761e) -> CD 1C 40
	call Func_9f63b ; 9F621 (27:7621) -> CD 3B 76
	jp .asm_9f62f ; 9F624 (27:7624) -> C3 2F 76
.asm_9f627:
	ld a, $13 ; 9F627 (27:7627) -> 3E 13
	scall PlayMusic ; 9F629 (27:7629) -> CD E6 4E
	scall Func_8001c ; 9F62C (27:762c) -> CD 1C 40
.asm_9f62f:
	jp .asm_9f63a ; 9F62F (27:762f) -> C3 3A 76
.asm_9f632:
	ld a, $13 ; 9F632 (27:7632) -> 3E 13
	scall PlayMusic ; 9F634 (27:7634) -> CD E6 4E
	scall Func_8001c ; 9F637 (27:7637) -> CD 1C 40
.asm_9f63a:
	ret  ; 9F63A (27:763a) -> C9

Func_9f63b:
	ld c, $01 ; 9F63B (27:763b) -> 0E 01
	ld e, $08 ; 9F63D (27:763d) -> 1E 08
	ld a, $26 ; 9F63F (27:763f) -> 3E 26
	scall LoadEmote ; 9F641 (27:7641) -> CD 76 41
	scall WaitEmote ; 9F644 (27:7644) -> CD D5 41
	ld a, $02 ; 9F647 (27:7647) -> 3E 02
	scall PlayerFace ; 9F649 (27:7649) -> CD 77 46
	ld a, $01 ; 9F64C (27:764c) -> 3E 01
	scall Func_80653 ; 9F64E (27:764e) -> CD 53 46
	ld hl, $0001 ; 9F651 (27:7651) -> 21 01 00
	scall ScriptSleep ; 9F654 (27:7654) -> CD 8F 46
	scall HideEmote ; 9F657 (27:7657) -> CD 8B 41
	ld hl, $001e ; 9F65A (27:765a) -> 21 1E 00
	scall ScriptSleep ; 9F65D (27:765d) -> CD 8F 46
	xor a ; 9F660 (27:7660) -> AF
	scall PlayMusic ; 9F661 (27:7661) -> CD E6 4E
	ld a, $13 ; 9F664 (27:7664) -> 3E 13
	scall PlayMusic ; 9F666 (27:7666) -> CD E6 4E
	ld e, $01 ; 9F669 (27:7669) -> 1E 01
	ld hl, $00f9 ; 9F66B (27:766b) -> 21 F9 00
	scall EventFlagAction ; 9F66E (27:766e) -> CD 1B 46
	ret  ; 9F671 (27:7671) -> C9
