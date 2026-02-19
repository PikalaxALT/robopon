INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 25", ROMX
	script_library 25

Data_950b4:
	db $23, $0e, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e
	db $09, $0c, $01, $01, $20, $08, $05, $09, $05, $08, $34
	db $0f, $0d, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $13, $11, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $1a, $07, $01, $01, $20, $07, $05, $09, $05, $08, $34
	db $1b, $10, $01, $01, $20, $00, $01, $05, $01, $04, $34
	db $1c, $0b, $01, $01, $20, $00, $01, $05, $01, $04, $34

Data_95101:
	db $80, $03, $ff, $ff

Data_95105:
	db $88, $03, $ff, $ff

Data_95109:
	person_event $03, $04, $18, $1a, $01, $01, $03, $04, $00, Func_951e4, NULL
	person_event $08, $04, $18, $0e, $01, $01, $03, $04, $00, Func_955fc, NULL
	person_event $08, $04, $12, $0a, $01, $01, $00, $04, $00, Func_95657, NULL
	person_event $00, $04, $0b, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95105
	person_event $08, $04, $0e, $10, $01, $01, $01, $04, $00, Func_956b2, NULL
	person_event $08, $04, $16, $12, $01, $01, $02, $04, $00, Func_9570d, NULL
	person_event $ff, $00, $09, $1a, $03, $01, $00, $04, $01, Func_9542c, NULL
	person_event $ff, $00, $16, $0a, $03, $03, $00, $04, $00, Func_95504, NULL
	person_event $ff, $00, $0d, $07, $03, $03, $00, $04, $00, Func_95540, NULL
	person_event $ff, $00, $22, $0d, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101
	person_event $ff, $00, $22, $0f, $01, $01, $02, $04, $00, PrintTextFacePlayer_25, Data_95101

Func_951a3:: ; 951a3
	ld hl, $0042 ; 951A3 (25:51a3) -> 21 42 00
	scall CheckEventFlag ; 951A6 (25:51a6) -> CD 2E 46
	or a ; 951A9 (25:51a9) -> B7
	jp nz, label_951bc ; 951AA (25:51aa) -> C2 BC 51
	ld a, $09 ; 951AD (25:51ad) -> 3E 09
	scall Func_80c94 ; 951AF (25:51af) -> CD 94 4C
	ld a, $10 ; 951B2 (25:51b2) -> 3E 10
	scall Func_80c94 ; 951B4 (25:51b4) -> CD 94 4C
	ld a, $11 ; 951B7 (25:51b7) -> 3E 11
	scall Func_80c94 ; 951B9 (25:51b9) -> CD 94 4C
label_951bc:
	ld a, $08 ; 951BC (25:51bc) -> 3E 08
	ld [wc789], a ; 951BE (25:51be) -> EA 89 C7
	ld a, $10 ; 951C1 (25:51c1) -> 3E 10
	ld [wc7e2], a ; 951C3 (25:51c3) -> EA E2 C7
	ld e, $0b ; 951C6 (25:51c6) -> 1E 0B
	ld hl, Data_95109 ; 951C8 (25:51c8) -> 21 09 51
	scall LoadMapObjects ; 951CB (25:51cb) -> CD FB 40
	ld e, $07 ; 951CE (25:51ce) -> 1E 07
	ld hl, Data_950b4 ; 951D0 (25:51d0) -> 21 B4 50
	scall LoadWarps ; 951D3 (25:51d3) -> CD 3A 40
	ld a, $0a ; 951D6 (25:51d6) -> 3E 0A
	scall PlayMusic ; 951D8 (25:51d8) -> CD E6 4E
	ld a, $01 ; 951DB (25:51db) -> 3E 01
	scall LoadPlayerSprite ; 951DD (25:51dd) -> CD C6 4C
	scall Func_8001c ; 951E0 (25:51e0) -> CD 1C 40
	ret  ; 951E3 (25:51e3) -> C9

Func_951e4:
	push af ; 951E4 (25:51e4) -> F5
	push bc ; 951E5 (25:51e5) -> C5
	ld hl, sp+$00 ; 951E6 (25:51e6) -> F8 00
	ld [hl], $ff ; 951E8 (25:51e8) -> 36 FF
	ld a, e ; 951EA (25:51ea) -> 7B
	or a ; 951EB (25:51eb) -> B7
	jp nz, label_95429 ; 951EC (25:51ec) -> C2 29 54
	ld hl, sp+$03 ; 951EF (25:51ef) -> F8 03
	ld a, [hl] ; 951F1 (25:51f1) -> 7E
	scall FacePlayer ; 951F2 (25:51f2) -> CD 4B 44
	ld a, [wc796] ; 951F5 (25:51f5) -> FA 96 C7
	cp $05 ; 951F8 (25:51f8) -> FE 05
	jp nz, label_95287 ; 951FA (25:51fa) -> C2 87 52
	ld a, $4a ; 951FD (25:51fd) -> 3E 4A
	scall Func_80e6d ; 951FF (25:51ff) -> CD 6D 4E
	ld hl, sp+$01 ; 95202 (25:5202) -> F8 01
	ld [hl], a ; 95204 (25:5204) -> 77
	cp $ff ; 95205 (25:5205) -> FE FF
	jp z, label_95284 ; 95207 (25:5207) -> CA 84 52
	ld hl, $0417 ; 9520A (25:520a) -> 21 17 04
	scall PrintTextWithNPCName ; 9520D (25:520d) -> CD A9 44
	ld a, $4a ; 95210 (25:5210) -> 3E 4A
	scall Func_80e7d ; 95212 (25:5212) -> CD 7D 4E
	cp $01 ; 95215 (25:5215) -> FE 01
	jp nz, label_9527b ; 95217 (25:5217) -> C2 7B 52
	ld hl, $0297 ; 9521A (25:521a) -> 21 97 02
	scall PrintTextWithNPCName ; 9521D (25:521d) -> CD A9 44
	ld hl, $0400 ; 95220 (25:5220) -> 21 00 04
	scall PrintTextWithYesNoBox ; 95223 (25:5223) -> CD BA 44
	or a ; 95226 (25:5226) -> B7
	jp nz, label_95262 ; 95227 (25:5227) -> C2 62 52
	ld a, $68 ; 9522A (25:522a) -> 3E 68
	scall PlaySFX ; 9522C (25:522c) -> CD FE 4E
	ld hl, $040e ; 9522F (25:522f) -> 21 0E 04
	scall PrintTextWithNPCName ; 95232 (25:5232) -> CD A9 44
	ld hl, sp+$01 ; 95235 (25:5235) -> F8 01
	ld l, [hl] ; 95237 (25:5237) -> 6E
	ld h, $00 ; 95238 (25:5238) -> 26 00
	ld de, $0b00 ; 9523A (25:523a) -> 11 00 0B
	add hl, de ; 9523D (25:523d) -> 19
	scall Func_80488 ; 9523E (25:523e) -> CD 88 44
	ld a, l ; 95241 (25:5241) -> 7D
	push af ; 95242 (25:5242) -> F5
	ld c, $00 ; 95243 (25:5243) -> 0E 00
	ld e, $01 ; 95245 (25:5245) -> 1E 01
	ld hl, sp+$03 ; 95247 (25:5247) -> F8 03
	ld a, [hl] ; 95249 (25:5249) -> 7E
	scall GiveRobot ; 9524A (25:524a) -> CD 87 4D
	pop af ; 9524D (25:524d) -> F1
	ld c, a ; 9524E (25:524e) -> 4F
	ld e, $00 ; 9524F (25:524f) -> 1E 00
	ld a, $4e ; 95251 (25:5251) -> 3E 4E
	scall GiveRobot ; 95253 (25:5253) -> CD 87 4D
	ld a, $06 ; 95256 (25:5256) -> 3E 06
	ld [wc796], a ; 95258 (25:5258) -> EA 96 C7
	ld hl, sp+$00 ; 9525B (25:525b) -> F8 00
	ld [hl], $01 ; 9525D (25:525d) -> 36 01
	jp label_95278 ; 9525F (25:525f) -> C3 78 52
label_95262:
	ld a, $69 ; 95262 (25:5262) -> 3E 69
	scall PlaySFX ; 95264 (25:5264) -> CD FE 4E
	ld hl, $040f ; 95267 (25:5267) -> 21 0F 04
	scall PrintTextWithNPCName ; 9526A (25:526a) -> CD A9 44
	ld e, $03 ; 9526D (25:526d) -> 1E 03
	ld hl, sp+$03 ; 9526F (25:526f) -> F8 03
	ld a, [hl] ; 95271 (25:5271) -> 7E
	scall SpriteFace ; 95272 (25:5272) -> CD 95 40
	jp label_95429 ; 95275 (25:5275) -> C3 29 54
label_95278:
	jp label_95284 ; 95278 (25:5278) -> C3 84 52
label_9527b:
	ld hl, $046e ; 9527B (25:527b) -> 21 6E 04
	scall PrintTextStandard ; 9527E (25:527e) -> CD 98 44
	jp label_95429 ; 95281 (25:5281) -> C3 29 54
label_95284:
	jp label_953d4 ; 95284 (25:5284) -> C3 D4 53
label_95287:
	ld a, [wc796] ; 95287 (25:5287) -> FA 96 C7
	cp $0a ; 9528A (25:528a) -> FE 0A
	jp nz, label_95319 ; 9528C (25:528c) -> C2 19 53
	ld a, $6f ; 9528F (25:528f) -> 3E 6F
	scall Func_80e6d ; 95291 (25:5291) -> CD 6D 4E
	ld hl, sp+$01 ; 95294 (25:5294) -> F8 01
	ld [hl], a ; 95296 (25:5296) -> 77
	cp $ff ; 95297 (25:5297) -> FE FF
	jp z, label_95316 ; 95299 (25:5299) -> CA 16 53
	ld hl, $0417 ; 9529C (25:529c) -> 21 17 04
	scall PrintTextWithNPCName ; 9529F (25:529f) -> CD A9 44
	ld a, $6f ; 952A2 (25:52a2) -> 3E 6F
	scall Func_80e7d ; 952A4 (25:52a4) -> CD 7D 4E
	cp $01 ; 952A7 (25:52a7) -> FE 01
	jp nz, label_9530d ; 952A9 (25:52a9) -> C2 0D 53
	ld hl, $0298 ; 952AC (25:52ac) -> 21 98 02
	scall PrintTextWithNPCName ; 952AF (25:52af) -> CD A9 44
	ld hl, $0400 ; 952B2 (25:52b2) -> 21 00 04
	scall PrintTextWithYesNoBox ; 952B5 (25:52b5) -> CD BA 44
	or a ; 952B8 (25:52b8) -> B7
	jp nz, label_952f4 ; 952B9 (25:52b9) -> C2 F4 52
	ld a, $68 ; 952BC (25:52bc) -> 3E 68
	scall PlaySFX ; 952BE (25:52be) -> CD FE 4E
	ld hl, $0436 ; 952C1 (25:52c1) -> 21 36 04
	scall PrintTextWithNPCName ; 952C4 (25:52c4) -> CD A9 44
	ld hl, sp+$01 ; 952C7 (25:52c7) -> F8 01
	ld l, [hl] ; 952C9 (25:52c9) -> 6E
	ld h, $00 ; 952CA (25:52ca) -> 26 00
	ld de, $0b00 ; 952CC (25:52cc) -> 11 00 0B
	add hl, de ; 952CF (25:52cf) -> 19
	scall Func_80488 ; 952D0 (25:52d0) -> CD 88 44
	ld a, l ; 952D3 (25:52d3) -> 7D
	push af ; 952D4 (25:52d4) -> F5
	ld c, $00 ; 952D5 (25:52d5) -> 0E 00
	ld e, $01 ; 952D7 (25:52d7) -> 1E 01
	ld hl, sp+$03 ; 952D9 (25:52d9) -> F8 03
	ld a, [hl] ; 952DB (25:52db) -> 7E
	scall GiveRobot ; 952DC (25:52dc) -> CD 87 4D
	pop af ; 952DF (25:52df) -> F1
	ld c, a ; 952E0 (25:52e0) -> 4F
	ld e, $00 ; 952E1 (25:52e1) -> 1E 00
	ld a, $72 ; 952E3 (25:52e3) -> 3E 72
	scall GiveRobot ; 952E5 (25:52e5) -> CD 87 4D
	ld a, $0b ; 952E8 (25:52e8) -> 3E 0B
	ld [wc796], a ; 952EA (25:52ea) -> EA 96 C7
	ld hl, sp+$00 ; 952ED (25:52ed) -> F8 00
	ld [hl], $01 ; 952EF (25:52ef) -> 36 01
	jp label_9530a ; 952F1 (25:52f1) -> C3 0A 53
label_952f4:
	ld a, $69 ; 952F4 (25:52f4) -> 3E 69
	scall PlaySFX ; 952F6 (25:52f6) -> CD FE 4E
	ld hl, $040f ; 952F9 (25:52f9) -> 21 0F 04
	scall PrintTextWithNPCName ; 952FC (25:52fc) -> CD A9 44
	ld e, $03 ; 952FF (25:52ff) -> 1E 03
	ld hl, sp+$03 ; 95301 (25:5301) -> F8 03
	ld a, [hl] ; 95303 (25:5303) -> 7E
	scall SpriteFace ; 95304 (25:5304) -> CD 95 40
	jp label_95429 ; 95307 (25:5307) -> C3 29 54
label_9530a:
	jp label_95316 ; 9530A (25:530a) -> C3 16 53
label_9530d:
	ld hl, $046e ; 9530D (25:530d) -> 21 6E 04
	scall PrintTextStandard ; 95310 (25:5310) -> CD 98 44
	jp label_95429 ; 95313 (25:5313) -> C3 29 54
label_95316:
	jp label_953d4 ; 95316 (25:5316) -> C3 D4 53
label_95319:
	ld a, $4a ; 95319 (25:5319) -> 3E 4A
	scall Func_80e6d ; 9531B (25:531b) -> CD 6D 4E
	ld hl, sp+$01 ; 9531E (25:531e) -> F8 01
	ld [hl], a ; 95320 (25:5320) -> 77
	cp $ff ; 95321 (25:5321) -> FE FF
	jp nz, label_95333 ; 95323 (25:5323) -> C2 33 53
	ld a, $6f ; 95326 (25:5326) -> 3E 6F
	scall Func_80e6d ; 95328 (25:5328) -> CD 6D 4E
	ld hl, sp+$01 ; 9532B (25:532b) -> F8 01
	ld [hl], a ; 9532D (25:532d) -> 77
	cp $ff ; 9532E (25:532e) -> FE FF
	jp z, label_953d4 ; 95330 (25:5330) -> CA D4 53
label_95333:
	ld a, [wc796] ; 95333 (25:5333) -> FA 96 C7
	cp $08 ; 95336 (25:5336) -> FE 08
	jp z, label_953bc ; 95338 (25:5338) -> CA BC 53
	cp $06 ; 9533B (25:533b) -> FE 06
	jp z, label_953bc ; 9533D (25:533d) -> CA BC 53
	cp $07 ; 95340 (25:5340) -> FE 07
	jp z, label_953ad ; 95342 (25:5342) -> CA AD 53
	or a ; 95345 (25:5345) -> B7
	jp z, label_953ad ; 95346 (25:5346) -> CA AD 53
	cp $0c ; 95349 (25:5349) -> FE 0C
	jp z, label_9539e ; 9534B (25:534b) -> CA 9E 53
	cp $04 ; 9534E (25:534e) -> FE 04
	jp z, label_9539e ; 95350 (25:5350) -> CA 9E 53
	cp $0d ; 95353 (25:5353) -> FE 0D
	jp z, label_9538f ; 95355 (25:5355) -> CA 8F 53
	cp $03 ; 95358 (25:5358) -> FE 03
	jp z, label_9538f ; 9535A (25:535a) -> CA 8F 53
	cp $0b ; 9535D (25:535d) -> FE 0B
	jp z, label_95380 ; 9535F (25:535f) -> CA 80 53
	cp $02 ; 95362 (25:5362) -> FE 02
	jp z, label_95380 ; 95364 (25:5364) -> CA 80 53
	cp $09 ; 95367 (25:5367) -> FE 09
	jp z, label_95371 ; 95369 (25:5369) -> CA 71 53
	cp $01 ; 9536C (25:536c) -> FE 01
	jp nz, label_953cb ; 9536E (25:536e) -> C2 CB 53
label_95371:
	ld hl, $0140 ; 95371 (25:5371) -> 21 40 01
	scall PrintTextStandard ; 95374 (25:5374) -> CD 98 44
	ld hl, $034d ; 95377 (25:5377) -> 21 4D 03
	scall PrintTextStandard ; 9537A (25:537a) -> CD 98 44
	jp label_953d1 ; 9537D (25:537d) -> C3 D1 53
label_95380:
	ld hl, $0140 ; 95380 (25:5380) -> 21 40 01
	scall PrintTextStandard ; 95383 (25:5383) -> CD 98 44
	ld hl, $0205 ; 95386 (25:5386) -> 21 05 02
	scall PrintTextStandard ; 95389 (25:5389) -> CD 98 44
	jp label_953d1 ; 9538C (25:538c) -> C3 D1 53
label_9538f:
	ld hl, $0140 ; 9538F (25:538f) -> 21 40 01
	scall PrintTextStandard ; 95392 (25:5392) -> CD 98 44
	ld hl, $020a ; 95395 (25:5395) -> 21 0A 02
	scall PrintTextStandard ; 95398 (25:5398) -> CD 98 44
	jp label_953d1 ; 9539B (25:539b) -> C3 D1 53
label_9539e:
	ld hl, $0140 ; 9539E (25:539e) -> 21 40 01
	scall PrintTextStandard ; 953A1 (25:53a1) -> CD 98 44
	ld hl, $0218 ; 953A4 (25:53a4) -> 21 18 02
	scall PrintTextStandard ; 953A7 (25:53a7) -> CD 98 44
	jp label_953d1 ; 953AA (25:53aa) -> C3 D1 53
label_953ad:
	ld hl, $0140 ; 953AD (25:53ad) -> 21 40 01
	scall PrintTextStandard ; 953B0 (25:53b0) -> CD 98 44
	ld hl, $034b ; 953B3 (25:53b3) -> 21 4B 03
	scall PrintTextStandard ; 953B6 (25:53b6) -> CD 98 44
	jp label_953d1 ; 953B9 (25:53b9) -> C3 D1 53
label_953bc:
	ld hl, $0140 ; 953BC (25:53bc) -> 21 40 01
	scall PrintTextStandard ; 953BF (25:53bf) -> CD 98 44
	ld hl, $0244 ; 953C2 (25:53c2) -> 21 44 02
	scall PrintTextStandard ; 953C5 (25:53c5) -> CD 98 44
	jp label_953d1 ; 953C8 (25:53c8) -> C3 D1 53
label_953cb:
	ld hl, $0417 ; 953CB (25:53cb) -> 21 17 04
	scall PrintTextWithNPCName ; 953CE (25:53ce) -> CD A9 44
label_953d1:
	jp label_95429 ; 953D1 (25:53d1) -> C3 29 54
label_953d4:
	ld hl, sp+$00 ; 953D4 (25:53d4) -> F8 00
	ld a, [hl] ; 953D6 (25:53d6) -> 7E
	cp $ff ; 953D7 (25:53d7) -> FE FF
	jp nz, label_95429 ; 953D9 (25:53d9) -> C2 29 54
	ld a, [wc796] ; 953DC (25:53dc) -> FA 96 C7
	cp $0b ; 953DF (25:53df) -> FE 0B
	jp nc, label_953fb ; 953E1 (25:53e1) -> D2 FB 53
	ld a, [wc796] ; 953E4 (25:53e4) -> FA 96 C7
	cp $06 ; 953E7 (25:53e7) -> FE 06
	jp c, label_953fb ; 953E9 (25:53e9) -> DA FB 53
	ld hl, $0417 ; 953EC (25:53ec) -> 21 17 04
	scall PrintTextWithNPCName ; 953EF (25:53ef) -> CD A9 44
	ld hl, $0435 ; 953F2 (25:53f2) -> 21 35 04
	scall PrintTextWithNPCName ; 953F5 (25:53f5) -> CD A9 44
	jp label_95429 ; 953F8 (25:53f8) -> C3 29 54
label_953fb:
	ld a, [wc796] ; 953FB (25:53fb) -> FA 96 C7
	cp $0f ; 953FE (25:53fe) -> FE 0F
	jp nz, label_9540c ; 95400 (25:5400) -> C2 0C 54
	ld hl, $0417 ; 95403 (25:5403) -> 21 17 04
	scall PrintTextWithNPCName ; 95406 (25:5406) -> CD A9 44
	jp label_95429 ; 95409 (25:5409) -> C3 29 54
label_9540c:
	ld a, [wc796] ; 9540C (25:540c) -> FA 96 C7
	cp $0b ; 9540F (25:540f) -> FE 0B
	jp c, label_9541d ; 95411 (25:5411) -> DA 1D 54
	ld hl, $0438 ; 95414 (25:5414) -> 21 38 04
	scall PrintTextWithNPCName ; 95417 (25:5417) -> CD A9 44
	jp label_95429 ; 9541A (25:541a) -> C3 29 54
label_9541d:
	ld hl, $0417 ; 9541D (25:541d) -> 21 17 04
	scall PrintTextWithNPCName ; 95420 (25:5420) -> CD A9 44
	ld hl, $018d ; 95423 (25:5423) -> 21 8D 01
	scall PrintTextWithNPCName ; 95426 (25:5426) -> CD A9 44
label_95429:
	pop bc ; 95429 (25:5429) -> C1
	pop bc ; 9542A (25:542a) -> C1
	ret  ; 9542B (25:542b) -> C9

Func_9542c:
	ld a, e ; 9542C (25:542c) -> 7B
	cp $02 ; 9542D (25:542d) -> FE 02
	jp nz, label_95503 ; 9542F (25:542f) -> C2 03 55
	ld a, $01 ; 95432 (25:5432) -> 3E 01
	scall Func_80e6d ; 95434 (25:5434) -> CD 6D 4E
	cp $ff ; 95437 (25:5437) -> FE FF
	jp nz, label_954aa ; 95439 (25:5439) -> C2 AA 54
	ld a, $03 ; 9543C (25:543c) -> 3E 03
	scall Func_80e6d ; 9543E (25:543e) -> CD 6D 4E
	cp $ff ; 95441 (25:5441) -> FE FF
	jp nz, label_954aa ; 95443 (25:5443) -> C2 AA 54
	ld a, $07 ; 95446 (25:5446) -> 3E 07
	scall Func_80e6d ; 95448 (25:5448) -> CD 6D 4E
	cp $ff ; 9544B (25:544b) -> FE FF
	jp nz, label_954aa ; 9544D (25:544d) -> C2 AA 54
	ld a, $25 ; 95450 (25:5450) -> 3E 25
	scall Func_80e6d ; 95452 (25:5452) -> CD 6D 4E
	cp $ff ; 95455 (25:5455) -> FE FF
	jp nz, label_954aa ; 95457 (25:5457) -> C2 AA 54
	ld a, $26 ; 9545A (25:545a) -> 3E 26
	scall Func_80e6d ; 9545C (25:545c) -> CD 6D 4E
	cp $ff ; 9545F (25:545f) -> FE FF
	jp nz, label_954aa ; 95461 (25:5461) -> C2 AA 54
	ld a, $27 ; 95464 (25:5464) -> 3E 27
	scall Func_80e6d ; 95466 (25:5466) -> CD 6D 4E
	cp $ff ; 95469 (25:5469) -> FE FF
	jp nz, label_954aa ; 9546B (25:546b) -> C2 AA 54
	ld a, $36 ; 9546E (25:546e) -> 3E 36
	scall Func_80e6d ; 95470 (25:5470) -> CD 6D 4E
	cp $ff ; 95473 (25:5473) -> FE FF
	jp nz, label_954aa ; 95475 (25:5475) -> C2 AA 54
	ld a, $60 ; 95478 (25:5478) -> 3E 60
	scall Func_80e6d ; 9547A (25:547a) -> CD 6D 4E
	cp $ff ; 9547D (25:547d) -> FE FF
	jp nz, label_954aa ; 9547F (25:547f) -> C2 AA 54
	ld a, $79 ; 95482 (25:5482) -> 3E 79
	scall Func_80e6d ; 95484 (25:5484) -> CD 6D 4E
	cp $ff ; 95487 (25:5487) -> FE FF
	jp nz, label_954aa ; 95489 (25:5489) -> C2 AA 54
	ld a, $88 ; 9548C (25:548c) -> 3E 88
	scall Func_80e6d ; 9548E (25:548e) -> CD 6D 4E
	cp $ff ; 95491 (25:5491) -> FE FF
	jp nz, label_954aa ; 95493 (25:5493) -> C2 AA 54
	ld a, $8e ; 95496 (25:5496) -> 3E 8E
	scall Func_80e6d ; 95498 (25:5498) -> CD 6D 4E
	cp $ff ; 9549B (25:549b) -> FE FF
	jp nz, label_954aa ; 9549D (25:549d) -> C2 AA 54
	ld a, $95 ; 954A0 (25:54a0) -> 3E 95
	scall Func_80e6d ; 954A2 (25:54a2) -> CD 6D 4E
	cp $ff ; 954A5 (25:54a5) -> FE FF
	jp z, label_954fd ; 954A7 (25:54a7) -> CA FD 54
label_954aa:
	ld a, [wc790] ; 954AA (25:54aa) -> FA 90 C7
	or a ; 954AD (25:54ad) -> B7
	jp z, label_954f4 ; 954AE (25:54ae) -> CA F4 54
	ld a, [wc790] ; 954B1 (25:54b1) -> FA 90 C7
	cp $05 ; 954B4 (25:54b4) -> FE 05
	jp nc, label_954f4 ; 954B6 (25:54b6) -> D2 F4 54
	ld hl, $0364 ; 954B9 (25:54b9) -> 21 64 03
	scall PrintTextWithYesNoBox ; 954BC (25:54bc) -> CD BA 44
	or a ; 954BF (25:54bf) -> B7
	jp nz, label_954f1 ; 954C0 (25:54c0) -> C2 F1 54
	xor a ; 954C3 (25:54c3) -> AF
	scall PlayMusic ; 954C4 (25:54c4) -> CD E6 4E
	ld a, $0e ; 954C7 (25:54c7) -> 3E 0E
	scall PlayMusic ; 954C9 (25:54c9) -> CD E6 4E
	xor a ; 954CC (25:54cc) -> AF
	scall Func_80653 ; 954CD (25:54cd) -> CD 53 46
	ld c, $01 ; 954D0 (25:54d0) -> 0E 01
	ld e, $01 ; 954D2 (25:54d2) -> 1E 01
	ld a, $26 ; 954D4 (25:54d4) -> 3E 26
	scall LoadEmote ; 954D6 (25:54d6) -> CD 76 41
	scall WaitEmote ; 954D9 (25:54d9) -> CD D5 41
	scall HideEmote ; 954DC (25:54dc) -> CD 8B 41
	ld a, $01 ; 954DF (25:54df) -> 3E 01
	scall PlayerFace ; 954E1 (25:54e1) -> CD 77 46
	ld l, $04 ; 954E4 (25:54e4) -> 2E 04
	push hl ; 954E6 (25:54e6) -> E5
	ld c, $05 ; 954E7 (25:54e7) -> 0E 05
	ld e, $0b ; 954E9 (25:54e9) -> 1E 0B
	ld a, $20 ; 954EB (25:54eb) -> 3E 20
	scall Func_80dff ; 954ED (25:54ed) -> CD FF 4D
	pop bc ; 954F0 (25:54f0) -> C1
label_954f1:
	jp label_954fa ; 954F1 (25:54f1) -> C3 FA 54
label_954f4:
	ld hl, $037d ; 954F4 (25:54f4) -> 21 7D 03
	scall PrintTextStandard ; 954F7 (25:54f7) -> CD 98 44
label_954fa:
	jp label_95503 ; 954FA (25:54fa) -> C3 03 55
label_954fd:
	ld hl, $037c ; 954FD (25:54fd) -> 21 7C 03
	scall PrintTextStandard ; 95500 (25:5500) -> CD 98 44
label_95503:
	ret  ; 95503 (25:5503) -> C9

Func_95504:
	ld a, e ; 95504 (25:5504) -> 7B
	or a ; 95505 (25:5505) -> B7
	jp nz, label_9552f ; 95506 (25:5506) -> C2 2F 55
	scall RepairRobots ; 95509 (25:5509) -> CD E0 42
	xor a ; 9550C (25:550c) -> AF
	scall PlayMusic ; 9550D (25:550d) -> CD E6 4E
	ld a, $16 ; 95510 (25:5510) -> 3E 16
	scall PlayMusic ; 95512 (25:5512) -> CD E6 4E
	ld c, $01 ; 95515 (25:5515) -> 0E 01
	ld e, $02 ; 95517 (25:5517) -> 1E 02
	ld a, $08 ; 95519 (25:5519) -> 3E 08
	scall LoadEmote ; 9551B (25:551b) -> CD 76 41
	scall WaitEmote ; 9551E (25:551e) -> CD D5 41
	scall HideEmote ; 95521 (25:5521) -> CD 8B 41
	ld hl, $0322 ; 95524 (25:5524) -> 21 22 03
	scall PrintTextStandard ; 95527 (25:5527) -> CD 98 44
	ld a, $0a ; 9552A (25:552a) -> 3E 0A
	scall PlayMusic ; 9552C (25:552c) -> CD E6 4E
label_9552f:
	ret  ; 9552F (25:552f) -> C9

Data_95530:
	db $0e, $0a, $ff, $ff

Data_95534:
	db $0c, $0a, $0e, $0a, $ff, $ff

Data_9553a:
	db $10, $0a, $0e, $0a, $ff, $ff

Func_95540:
	ld a, e ; 95540 (25:5540) -> 7B
	or a ; 95541 (25:5541) -> B7
	jp nz, label_955fb ; 95542 (25:5542) -> C2 FB 55
	ld a, $0f ; 95545 (25:5545) -> 3E 0F
	scall Func_80e6d ; 95547 (25:5547) -> CD 6D 4E
	cp $ff ; 9554A (25:554a) -> FE FF
	jp nz, label_9556d ; 9554C (25:554c) -> C2 6D 55
	ld a, $41 ; 9554F (25:554f) -> 3E 41
	scall Func_80e6d ; 95551 (25:5551) -> CD 6D 4E
	cp $ff ; 95554 (25:5554) -> FE FF
	jp nz, label_9556d ; 95556 (25:5556) -> C2 6D 55
	ld a, $50 ; 95559 (25:5559) -> 3E 50
	scall Func_80e6d ; 9555B (25:555b) -> CD 6D 4E
	cp $ff ; 9555E (25:555e) -> FE FF
	jp nz, label_9556d ; 95560 (25:5560) -> C2 6D 55
	ld a, $64 ; 95563 (25:5563) -> 3E 64
	scall Func_80e6d ; 95565 (25:5565) -> CD 6D 4E
	cp $ff ; 95568 (25:5568) -> FE FF
	jp z, label_955f5 ; 9556A (25:556a) -> CA F5 55
label_9556d:
	ld a, [wc790] ; 9556D (25:556d) -> FA 90 C7
	or a ; 95570 (25:5570) -> B7
	jp z, label_955ec ; 95571 (25:5571) -> CA EC 55
	ld a, [wc790] ; 95574 (25:5574) -> FA 90 C7
	cp $06 ; 95577 (25:5577) -> FE 06
	jp nc, label_955ec ; 95579 (25:5579) -> D2 EC 55
	ld hl, $032d ; 9557C (25:557c) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 9557F (25:557f) -> CD BA 44
	or a ; 95582 (25:5582) -> B7
	jp nz, label_955e9 ; 95583 (25:5583) -> C2 E9 55
	ld a, [wPlayerFacing] ; 95586 (25:5586) -> FA 38 C8
	cp $01 ; 95589 (25:5589) -> FE 01
	jp z, label_9559f ; 9558B (25:558b) -> CA 9F 55
	or a ; 9558E (25:558e) -> B7
	jp nz, label_955ac ; 9558F (25:558f) -> C2 AC 55
	ld c, $01 ; 95592 (25:5592) -> 0E 01
	ld de, Data_95530 ; 95594 (25:5594) -> 11 30 55
	ld a, $25 ; 95597 (25:5597) -> 3E 25
	scall MovePlayer ; 95599 (25:5599) -> CD 3E 46
	jp label_955b6 ; 9559C (25:559c) -> C3 B6 55
label_9559f:
	ld c, $01 ; 9559F (25:559f) -> 0E 01
	ld de, Data_95534 ; 955A1 (25:55a1) -> 11 34 55
	ld a, $25 ; 955A4 (25:55a4) -> 3E 25
	scall MovePlayer ; 955A6 (25:55a6) -> CD 3E 46
	jp label_955b6 ; 955A9 (25:55a9) -> C3 B6 55
label_955ac:
	ld c, $01 ; 955AC (25:55ac) -> 0E 01
	ld de, Data_9553a ; 955AE (25:55ae) -> 11 3A 55
	ld a, $25 ; 955B1 (25:55b1) -> 3E 25
	scall MovePlayer ; 955B3 (25:55b3) -> CD 3E 46
label_955b6:
	scall WaitNPCStep ; 955B6 (25:55b6) -> CD 0C 42
	scall WaitNPCStep ; 955B9 (25:55b9) -> CD 0C 42
	xor a ; 955BC (25:55bc) -> AF
	scall PlayerFace ; 955BD (25:55bd) -> CD 77 46
	xor a ; 955C0 (25:55c0) -> AF
	scall Func_80653 ; 955C1 (25:55c1) -> CD 53 46
	ld c, $01 ; 955C4 (25:55c4) -> 0E 01
	ld e, $01 ; 955C6 (25:55c6) -> 1E 01
	ld a, $0b ; 955C8 (25:55c8) -> 3E 0B
	scall LoadEmote ; 955CA (25:55ca) -> CD 76 41
	scall WaitEmote ; 955CD (25:55cd) -> CD D5 41
	scall HideEmote ; 955D0 (25:55d0) -> CD 8B 41
	ld a, $04 ; 955D3 (25:55d3) -> 3E 04
	scall LoadPlayerSprite ; 955D5 (25:55d5) -> CD C6 4C
	xor a ; 955D8 (25:55d8) -> AF
	scall PlayerFace ; 955D9 (25:55d9) -> CD 77 46
	ld l, $1e ; 955DC (25:55dc) -> 2E 1E
	push hl ; 955DE (25:55de) -> E5
	ld c, $18 ; 955DF (25:55df) -> 0E 18
	ld e, $03 ; 955E1 (25:55e1) -> 1E 03
	ld a, $1e ; 955E3 (25:55e3) -> 3E 1E
	scall Func_80dff ; 955E5 (25:55e5) -> CD FF 4D
	pop bc ; 955E8 (25:55e8) -> C1
label_955e9:
	jp label_955f2 ; 955E9 (25:55e9) -> C3 F2 55
label_955ec:
	ld hl, $0377 ; 955EC (25:55ec) -> 21 77 03
	scall PrintTextStandard ; 955EF (25:55ef) -> CD 98 44
label_955f2:
	jp label_955fb ; 955F2 (25:55f2) -> C3 FB 55
label_955f5:
	ld hl, $0376 ; 955F5 (25:55f5) -> 21 76 03
	scall PrintTextStandard ; 955F8 (25:55f8) -> CD 98 44
label_955fb:
	ret  ; 955FB (25:55fb) -> C9

Func_955fc:
	push af ; 955FC (25:55fc) -> F5
	ld a, e ; 955FD (25:55fd) -> 7B
	or a ; 955FE (25:55fe) -> B7
	jp nz, label_95655 ; 955FF (25:55ff) -> C2 55 56
	ld hl, sp+$01 ; 95602 (25:5602) -> F8 01
	ld a, [hl] ; 95604 (25:5604) -> 7E
	scall FacePlayer ; 95605 (25:5605) -> CD 4B 44
	ld hl, $010a ; 95608 (25:5608) -> 21 0A 01
	scall CheckEventFlag ; 9560B (25:560b) -> CD 2E 46
	or a ; 9560E (25:560e) -> B7
	jp nz, label_9564f ; 9560F (25:560f) -> C2 4F 56
	ld a, [wc79c] ; 95612 (25:5612) -> FA 9C C7
	cp $01 ; 95615 (25:5615) -> FE 01
	jp c, label_9564f ; 95617 (25:5617) -> DA 4F 56
	ld hl, $0114 ; 9561A (25:561a) -> 21 14 01
	scall CheckEventFlag ; 9561D (25:561d) -> CD 2E 46
	or a ; 95620 (25:5620) -> B7
	jp nz, label_9564f ; 95621 (25:5621) -> C2 4F 56
	ld hl, $015f ; 95624 (25:5624) -> 21 5F 01
	scall PrintTextStandard ; 95627 (25:5627) -> CD 98 44
	ld hl, $049d ; 9562A (25:562a) -> 21 9D 04
	scall PrintTextStandard ; 9562D (25:562d) -> CD 98 44
	ld a, $2a ; 95630 (25:5630) -> 3E 2A
	scall PlaySFX ; 95632 (25:5632) -> CD FE 4E
	ld hl, $049e ; 95635 (25:5635) -> 21 9E 04
	scall PrintTextStandard ; 95638 (25:5638) -> CD 98 44
	ld c, $00 ; 9563B (25:563b) -> 0E 00
	ld e, $01 ; 9563D (25:563d) -> 1E 01
	ld a, $10 ; 9563F (25:563f) -> 3E 10
	scall Func_80d4d ; 95641 (25:5641) -> CD 4D 4D
	ld e, $01 ; 95644 (25:5644) -> 1E 01
	ld hl, $010a ; 95646 (25:5646) -> 21 0A 01
	scall EventFlagAction ; 95649 (25:5649) -> CD 1B 46
	jp label_95655 ; 9564C (25:564c) -> C3 55 56
label_9564f:
	ld hl, $015f ; 9564F (25:564f) -> 21 5F 01
	scall PrintTextStandard ; 95652 (25:5652) -> CD 98 44
label_95655:
	pop bc ; 95655 (25:5655) -> C1
	ret  ; 95656 (25:5656) -> C9

Func_95657:
	push af ; 95657 (25:5657) -> F5
	ld a, e ; 95658 (25:5658) -> 7B
	or a ; 95659 (25:5659) -> B7
	jp nz, label_956b0 ; 9565A (25:565a) -> C2 B0 56
	ld hl, sp+$01 ; 9565D (25:565d) -> F8 01
	ld a, [hl] ; 9565F (25:565f) -> 7E
	scall FacePlayer ; 95660 (25:5660) -> CD 4B 44
	ld hl, $010b ; 95663 (25:5663) -> 21 0B 01
	scall CheckEventFlag ; 95666 (25:5666) -> CD 2E 46
	or a ; 95669 (25:5669) -> B7
	jp nz, label_956aa ; 9566A (25:566a) -> C2 AA 56
	ld a, [wc79c] ; 9566D (25:566d) -> FA 9C C7
	cp $01 ; 95670 (25:5670) -> FE 01
	jp c, label_956aa ; 95672 (25:5672) -> DA AA 56
	ld hl, $0114 ; 95675 (25:5675) -> 21 14 01
	scall CheckEventFlag ; 95678 (25:5678) -> CD 2E 46
	or a ; 9567B (25:567b) -> B7
	jp nz, label_956aa ; 9567C (25:567c) -> C2 AA 56
	ld hl, $0387 ; 9567F (25:567f) -> 21 87 03
	scall PrintTextStandard ; 95682 (25:5682) -> CD 98 44
	ld hl, $049d ; 95685 (25:5685) -> 21 9D 04
	scall PrintTextStandard ; 95688 (25:5688) -> CD 98 44
	ld a, $2a ; 9568B (25:568b) -> 3E 2A
	scall PlaySFX ; 9568D (25:568d) -> CD FE 4E
	ld hl, $049e ; 95690 (25:5690) -> 21 9E 04
	scall PrintTextStandard ; 95693 (25:5693) -> CD 98 44
	ld c, $00 ; 95696 (25:5696) -> 0E 00
	ld e, $01 ; 95698 (25:5698) -> 1E 01
	ld a, $10 ; 9569A (25:569a) -> 3E 10
	scall Func_80d4d ; 9569C (25:569c) -> CD 4D 4D
	ld e, $01 ; 9569F (25:569f) -> 1E 01
	ld hl, $010b ; 956A1 (25:56a1) -> 21 0B 01
	scall EventFlagAction ; 956A4 (25:56a4) -> CD 1B 46
	jp label_956b0 ; 956A7 (25:56a7) -> C3 B0 56
label_956aa:
	ld hl, $0387 ; 956AA (25:56aa) -> 21 87 03
	scall PrintTextStandard ; 956AD (25:56ad) -> CD 98 44
label_956b0:
	pop bc ; 956B0 (25:56b0) -> C1
	ret  ; 956B1 (25:56b1) -> C9

Func_956b2:
	push af ; 956B2 (25:56b2) -> F5
	ld a, e ; 956B3 (25:56b3) -> 7B
	or a ; 956B4 (25:56b4) -> B7
	jp nz, label_9570b ; 956B5 (25:56b5) -> C2 0B 57
	ld hl, sp+$01 ; 956B8 (25:56b8) -> F8 01
	ld a, [hl] ; 956BA (25:56ba) -> 7E
	scall FacePlayer ; 956BB (25:56bb) -> CD 4B 44
	ld hl, $010c ; 956BE (25:56be) -> 21 0C 01
	scall CheckEventFlag ; 956C1 (25:56c1) -> CD 2E 46
	or a ; 956C4 (25:56c4) -> B7
	jp nz, label_95705 ; 956C5 (25:56c5) -> C2 05 57
	ld a, [wc79c] ; 956C8 (25:56c8) -> FA 9C C7
	cp $01 ; 956CB (25:56cb) -> FE 01
	jp c, label_95705 ; 956CD (25:56cd) -> DA 05 57
	ld hl, $0114 ; 956D0 (25:56d0) -> 21 14 01
	scall CheckEventFlag ; 956D3 (25:56d3) -> CD 2E 46
	or a ; 956D6 (25:56d6) -> B7
	jp nz, label_95705 ; 956D7 (25:56d7) -> C2 05 57
	ld hl, $0389 ; 956DA (25:56da) -> 21 89 03
	scall PrintTextStandard ; 956DD (25:56dd) -> CD 98 44
	ld hl, $049d ; 956E0 (25:56e0) -> 21 9D 04
	scall PrintTextStandard ; 956E3 (25:56e3) -> CD 98 44
	ld a, $2a ; 956E6 (25:56e6) -> 3E 2A
	scall PlaySFX ; 956E8 (25:56e8) -> CD FE 4E
	ld hl, $049e ; 956EB (25:56eb) -> 21 9E 04
	scall PrintTextStandard ; 956EE (25:56ee) -> CD 98 44
	ld c, $00 ; 956F1 (25:56f1) -> 0E 00
	ld e, $01 ; 956F3 (25:56f3) -> 1E 01
	ld a, $10 ; 956F5 (25:56f5) -> 3E 10
	scall Func_80d4d ; 956F7 (25:56f7) -> CD 4D 4D
	ld e, $01 ; 956FA (25:56fa) -> 1E 01
	ld hl, $010c ; 956FC (25:56fc) -> 21 0C 01
	scall EventFlagAction ; 956FF (25:56ff) -> CD 1B 46
	jp label_9570b ; 95702 (25:5702) -> C3 0B 57
label_95705:
	ld hl, $0389 ; 95705 (25:5705) -> 21 89 03
	scall PrintTextStandard ; 95708 (25:5708) -> CD 98 44
label_9570b:
	pop bc ; 9570B (25:570b) -> C1
	ret  ; 9570C (25:570c) -> C9

Func_9570d:
	push af ; 9570D (25:570d) -> F5
	ld a, e ; 9570E (25:570e) -> 7B
	or a ; 9570F (25:570f) -> B7
	jp nz, label_95766 ; 95710 (25:5710) -> C2 66 57
	ld hl, sp+$01 ; 95713 (25:5713) -> F8 01
	ld a, [hl] ; 95715 (25:5715) -> 7E
	scall FacePlayer ; 95716 (25:5716) -> CD 4B 44
	ld hl, $010d ; 95719 (25:5719) -> 21 0D 01
	scall CheckEventFlag ; 9571C (25:571c) -> CD 2E 46
	or a ; 9571F (25:571f) -> B7
	jp nz, label_95760 ; 95720 (25:5720) -> C2 60 57
	ld a, [wc79c] ; 95723 (25:5723) -> FA 9C C7
	cp $01 ; 95726 (25:5726) -> FE 01
	jp c, label_95760 ; 95728 (25:5728) -> DA 60 57
	ld hl, $0114 ; 9572B (25:572b) -> 21 14 01
	scall CheckEventFlag ; 9572E (25:572e) -> CD 2E 46
	or a ; 95731 (25:5731) -> B7
	jp nz, label_95760 ; 95732 (25:5732) -> C2 60 57
	ld hl, $03a3 ; 95735 (25:5735) -> 21 A3 03
	scall PrintTextStandard ; 95738 (25:5738) -> CD 98 44
	ld hl, $049d ; 9573B (25:573b) -> 21 9D 04
	scall PrintTextStandard ; 9573E (25:573e) -> CD 98 44
	ld a, $2a ; 95741 (25:5741) -> 3E 2A
	scall PlaySFX ; 95743 (25:5743) -> CD FE 4E
	ld hl, $049e ; 95746 (25:5746) -> 21 9E 04
	scall PrintTextStandard ; 95749 (25:5749) -> CD 98 44
	ld c, $00 ; 9574C (25:574c) -> 0E 00
	ld e, $01 ; 9574E (25:574e) -> 1E 01
	ld a, $10 ; 95750 (25:5750) -> 3E 10
	scall Func_80d4d ; 95752 (25:5752) -> CD 4D 4D
	ld e, $01 ; 95755 (25:5755) -> 1E 01
	ld hl, $010d ; 95757 (25:5757) -> 21 0D 01
	scall EventFlagAction ; 9575A (25:575a) -> CD 1B 46
	jp label_95766 ; 9575D (25:575d) -> C3 66 57
label_95760:
	ld hl, $03a3 ; 95760 (25:5760) -> 21 A3 03
	scall PrintTextStandard ; 95763 (25:5763) -> CD 98 44
label_95766:
	pop bc ; 95766 (25:5766) -> C1
	ret  ; 95767 (25:5767) -> C9

Data_95768:
	db $01, $08, $02, $01, $00, $0a, $03, $01, $03, $02, $34
	db $05, $01, $01, $01, $00, $21, $02, $09, $02, $08, $34

Data_9577e:
	db $f0, $03, $ff, $ff

Data_95782:
	db $8e, $03, $ff, $ff

Data_95786:
	person_event $24, $0c, $02, $07, $01, $01, $01, $04, $00, NULL, NULL

Data_95794:
	person_event $ff, $00, $03, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_9577e
	person_event $ff, $00, $08, $01, $01, $01, $01, $04, $00, PrintTextFacePlayer_25, Data_95782

Func_957b0:: ; 957b0
	ld e, $02 ; 957B0 (25:57b0) -> 1E 02
	ld hl, Data_95768 ; 957B2 (25:57b2) -> 21 68 57
	scall LoadWarps ; 957B5 (25:57b5) -> CD 3A 40
	ld hl, $000e ; 957B8 (25:57b8) -> 21 0E 00
	scall CheckEventFlag ; 957BB (25:57bb) -> CD 2E 46
	or a ; 957BE (25:57be) -> B7
	jp nz, label_957e0 ; 957BF (25:57bf) -> C2 E0 57
	ld e, $01 ; 957C2 (25:57c2) -> 1E 01
	ld hl, Data_95786 ; 957C4 (25:57c4) -> 21 86 57
	scall LoadMapObjects ; 957C7 (25:57c7) -> CD FB 40
	ld a, $0b ; 957CA (25:57ca) -> 3E 0B
	scall PlayMusic ; 957CC (25:57cc) -> CD E6 4E
	scall Func_8001c ; 957CF (25:57cf) -> CD 1C 40
	call Func_957f5 ; 957D2 (25:57d2) -> CD F5 57
	ld e, $01 ; 957D5 (25:57d5) -> 1E 01
	ld hl, $000e ; 957D7 (25:57d7) -> 21 0E 00
	scall EventFlagAction ; 957DA (25:57da) -> CD 1B 46
	jp label_957f0 ; 957DD (25:57dd) -> C3 F0 57
label_957e0:
	ld a, $0b ; 957E0 (25:57e0) -> 3E 0B
	scall PlayMusic ; 957E2 (25:57e2) -> CD E6 4E
	ld e, $02 ; 957E5 (25:57e5) -> 1E 02
	ld hl, Data_95794 ; 957E7 (25:57e7) -> 21 94 57
	scall LoadMapObjects ; 957EA (25:57ea) -> CD FB 40
	scall Func_8001c ; 957ED (25:57ed) -> CD 1C 40
label_957f0:
	ret  ; 957F0 (25:57f0) -> C9

Data_957f1:
	db $05, $01, $ff, $ff

Func_957f5:
	ld bc, Data_957f1 ; 957F5 (25:57f5) -> 01 F1 57
	ld e, $25 ; 957F8 (25:57f8) -> 1E 25
	xor a ; 957FA (25:57fa) -> AF
	scall MovePerson ; 957FB (25:57fb) -> CD F7 41
	ld c, $01 ; 957FE (25:57fe) -> 0E 01
	ld de, Data_957f1 ; 95800 (25:5800) -> 11 F1 57
	ld a, $25 ; 95803 (25:5803) -> 3E 25
	scall MovePlayer ; 95805 (25:5805) -> CD 3E 46
	scall WaitNPCStep ; 95808 (25:5808) -> CD 0C 42
	ret  ; 9580B (25:580b) -> C9

Data_9580c:
	db $00, $0b, $09, $01, $00, $0a, $09, $04, $09, $05, $2e

Func_95817:: ; 95817
	ld e, $01 ; 95817 (25:5817) -> 1E 01
	ld hl, Data_9580c ; 95819 (25:5819) -> 21 0C 58
	scall LoadWarps ; 9581C (25:581c) -> CD 3A 40
	ld a, $14 ; 9581F (25:581f) -> 3E 14
	scall PlayMusic ; 95821 (25:5821) -> CD E6 4E
	scall Func_8001c ; 95824 (25:5824) -> CD 1C 40
	ret  ; 95827 (25:5827) -> C9

Data_95828: ; 95828
	db $02, $09, $02, $01, $00, $1f, $05, $01, $05, $02, $34

Data_95833: ; 95833
	db $5a, $02, $02, $11, $4f, $c7, $03, $ff, $ff, $ef, $03, $ff, $ff, $28, $03, $ff
	db $ff

Data_95844: ; 95844
	db $24, $0c, $03, $08, $01, $01, $01, $04, $00, $25, $b9, $5a, $00, $00, $00, $0c
	db $06, $01, $01, $01, $02, $04, $00, $25, $00, $00, $00, $00, $ff, $00, $06, $01
	db $01, $01, $02, $04, $00, $25, $5f, $48, $38, $58, $ff, $00, $03, $01, $02, $01
	db $02, $04, $00, $25, $5f, $48, $40, $58

Data_9587c: ; 9587c
	db $24, $04, $05, $04, $01, $01, $00, $04, $00, $25, $b9, $5a, $00, $00, $00, $04
	db $09, $07, $01, $01, $00, $04, $00, $25, $00, $00, $00, $00, $ff, $00, $06, $01
	db $01, $01, $02, $04, $00, $25, $5f, $48, $38, $58, $ff, $00, $03, $01, $02, $01
	db $02, $04, $00, $25, $5f, $48, $40, $58, $ff, $00, $0a, $05, $02, $02, $02, $04
	db $00, $25, $5f, $48, $3c, $58

Func_958c2:: ; 958c2 (25:58c2)
	call Func_9596a
	ld hl, Func_9596a
	scall Func_80f11
	loadwarps 1, Data_95828
	ld e, $1
	ld hl, Data_95833
	scall Func_80ce7
	playmusic $c
	checkevent $f
	or a
	jp nz, Func_9590a
	loadpeople 4, Data_95844
	hideperson $1
	scall Func_8001c
	call Func_959a9
	setevent $f
	jp Func_95957

Func_9590a: ; 9590a (25:590a)
	ld a, [wc78c]
	cp $a
	jp c, Func_95935
	loadpeople 5, Data_9587c
	ld c, $6
	ld e, $9
	xor a
	scall Func_80080
	ld e, $2
	xor a
	scall SpriteFace
	hideperson $1
	scall Func_8001c
	jp Func_95957

Func_95935: ; 95935 (25:5935)
	loadpeople 5, Data_9587c
	ld c, $0
	ld e, $0
	ld a, $1
	scall Func_80080
	hideperson $1
	hideperson $4
	scall Func_8001c
Func_95957: ; 95957 (25:5957)
	ret

Data_95958:
	db $00, $0f, $02, $01, $0a, $05

Data_9595e: ; 9595e
	db $02, $0f, $02, $01, $0a, $06

Data_95964: ; 95964
	db $04, $03, $02, $03, $0a, $05

Func_9596a: ; 9596a (25:596a)
	ld a, [wc78c]
	cp $a
	jp nc, Func_9597e
	ld hl, Data_95964
	scall Func_80d9b
	scall Func_80f02
	jp Func_95998

Func_9597e: ; 9597e (25:597e)
	checkevent $5b
	cp $1
	jp nz, Func_95998
	ld hl, Data_95958
	scall Func_80d9b
	ld hl, Data_9595e
	scall Func_80d9b
	scall Func_80f02
Func_95998: ; 95998 (25:5998)
	ret

Data_95999:
	db $05, $04, $ff, $ff

Data_9599d: ; 9599d
	db $06, $04, $ff, $ff

Data_959a1: ; 959a1
	db $06, $02, $ff, $ff

Data_959a5: ; 959a5
	db $06, $04, $ff, $ff

Func_959a9: ; 959a9 (25:59a9)
	ld bc, Data_95999
	ld e, BANK(Data_95999)
	xor a
	scall MovePerson
	ld c, $1
	ld de, Data_9599d
	ld a, BANK(Data_9599d)
	scall MovePlayer
	playsfx $31
	loademote $1, $2, $c
	scall WaitEmote
	ld hl, $1e
	scall ScriptSleep
	ld a, STARTER + 1
	scall GetRobotSprite
	ld e, a
	ld a, $1
	scall ChangeSprite
	ld e, $2
	ld a, $1
	scall SpriteFace
	showperson $1
	move_person $1, Data_959a1, 1
	scall WaitNPCStep
	playsfx $31
	loademote $1, $4, $c
	scall WaitEmote
	scall HideEmote
	ld e, $1
	xor a
	scall SpriteFace
	writenpctext TreeBitstreamText_3926c
	ld bc, Data_959a5
	ld e, BANK(Data_959a5)
	ld a, $1
	scall MovePerson
	scall WaitNPCStep
	hideperson $1
	playsfx $2a
	xor a
	scall PlayMusic
	playmusic $19
	ld hl, $b4
	scall ScriptSleep
	xor a
	scall PlayMusic
	playmusic $c
IF DEF(SUN)
	writetext TreeBitstreamText_39295
ELIF DEF(STAR)
	writetext TreeBitstreamText_392a8
ENDC
	ld a, $3
	scall PlayerFace
	writenpctext TreeBitstreamText_392ba
	playsfx $2a
	writetext TreeBitstreamText_39321
	ld a, [wc78c]
	cp $a
	jp nc, Func_95a7f
	checkevent $63
	cp $1
	jp nz, Func_95a7f
	writenpctext TreeBitstreamText_3933b
Func_95a7f: ; 95a7f (25:5a7f)
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, 1000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wc793]
	cp $3
	jp nz, Func_95aa4
	ld c, $4
	ld e, $0
	ld a, SUNNY + 1
	scall GiveRobot
	jp Func_95ab2

Func_95aa4: ; 95aa4 (25:5aa4)
	ld c, $5
	ld e, $0
	ld a, STARTER + 1
	scall GiveRobot
	ld a, $28
	scall Func_810a3
Func_95ab2: ; 95ab2 (25:5ab2)
	ret

Data_95ab3:
	db $08, $07, $09, $07, $ff, $ff

Func_95ab9:
	ld a, e
	or a
	jp nz, Func_95c0b
	checkevent $f3
	cp $1
	jp nz, Func_95b02
	checkevent $f5
	or a
	jp nz, Func_95b02
	xor a
	scall FacePlayer
	writenpctext TreeBitstreamText_39559
	playsfx $2a
	writetext TreeBitstreamText_395a3
	ld c, $0
	ld e, $1
	ld a, $1b
	scall Func_80d4d
	writenpctext TreeBitstreamText_395b4
	setevent $f5
	jp Func_95c0b

Func_95b02: ; 95b02 (25:5b02)
	checkevent $f4
	cp $1
	jp nz, Func_95b40
	checkevent $f6
	or a
	jp nz, Func_95b40
	xor a
	scall FacePlayer
	ld hl, CopyFromDEtoHL
	scall PrintTextWithNPCName
	playsfx $2a
	writetext TreeBitstreamText_3968a
	ld c, $0
	ld e, $1
	ld a, $1a
	scall Func_80d4d
	setevent $f6
	jp Func_95c0b

Func_95b40: ; 95b40 (25:5b40)
	ld a, [wc78c]
	cp $14
	jp nz, Func_95b81
	checkevent $e7
	or a
	jp nz, Func_95b81
	xor a
	scall FacePlayer
	writenpctext TreeBitstreamText_3949f
	playsfx $2a
	writetext TreeBitstreamText_39545
	ld c, $1e
	ld e, $0
	ld a, $16
	scall GiveRobot
	setevent $e7
	ld e, $2
	xor a
	scall SpriteFace
	jp Func_95c0b

Func_95b81: ; 95b81 (25:5b81)
	ld a, [wc78c]
	cp $a
	jp c, Func_95bdb
	ld a, [wPlayerFacing]
	cp $2
	jp z, Func_95b96
	cp $1
	jp nz, Func_95ba4
Func_95b96: ; 95b96 (25:5b96)
	ld c, $1
	ld de, Data_95ab3
	ld a, BANK(Data_95ab3)
	scall MovePlayer
	xor a
	scall PlayerFace
Func_95ba4: ; 95ba4 (25:5ba4)
	ld e, $2
	xor a
	scall SpriteFace
	checkevent $c4
	or a
	jp nz, Func_95bc2
	writenpctext TreeBitstreamText_393e9
	setevent $c4
Func_95bc2: ; 95bc2 (25:5bc2)
	writenpctext_yesorno TreeBitstreamText_3945b
	or a
	jp nz, Func_95bd2
	scall Func_80479
	jp Func_95bd8

Func_95bd2: ; 95bd2 (25:5bd2)
	writenpctext TreeBitstreamText_39471
Func_95bd8: ; 95bd8 (25:5bd8)
	jp Func_95c0b

Func_95bdb: ; 95bdb (25:5bdb)
	xor a
	scall FacePlayer
	heal
	xor a
	scall PlayMusic
	playmusic SONG_HEAL
	loademote $1, $2, $8
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	writenpctext TreeBitstreamText_39369
	playmusic SONG_CENTER
Func_95c0b: ; 95c0b (25:5c0b)
	ret

Data_95c0c:
	db $0a, $07, $ff, $ff

Data_95c10:
	db $0a, $06, $ff, $ff

Func_95c14:: ; 95c14
	push af ; 95C14 (25:5c14) -> F5
	set_farcall_addrs_hli FadeInMap
	xor a ; 95C20 (25:5c20) -> AF
	call FarCall ; 95C21 (25:5c21) -> CD F8 03
	ld hl, $003c ; 95C24 (25:5c24) -> 21 3C 00
	scall ScriptSleep ; 95C27 (25:5c27) -> CD 8F 46
	pop af ; 95C2A (25:5c2a) -> F1
	ld e, a ; 95C2B (25:5c2b) -> 5F
	ld a, $01 ; 95C2C (25:5c2c) -> 3E 01
	scall ChangeSprite ; 95C2E (25:5c2e) -> CD C8 40
	ld e, $02 ; 95C31 (25:5c31) -> 1E 02
	ld a, $01 ; 95C33 (25:5c33) -> 3E 01
	scall SpriteFace ; 95C35 (25:5c35) -> CD 95 40
	ld e, $01 ; 95C38 (25:5c38) -> 1E 01
	ld a, $01 ; 95C3A (25:5c3a) -> 3E 01
	scall SetPersonVisibilityState ; 95C3C (25:5c3c) -> CD 3D 41
	ld bc, Data_95c0c ; 95C3F (25:5c3f) -> 01 0C 5C
	ld e, $25 ; 95C42 (25:5c42) -> 1E 25
	ld a, $01 ; 95C44 (25:5c44) -> 3E 01
	scall MovePersonAndWait ; 95C46 (25:5c46) -> CD 88 46
	scall WaitNPCStep ; 95C49 (25:5c49) -> CD 0C 42
	ld e, $00 ; 95C4C (25:5c4c) -> 1E 00
	ld a, $01 ; 95C4E (25:5c4e) -> 3E 01
	scall SpriteFace ; 95C50 (25:5c50) -> CD 95 40
	ld e, $01 ; 95C53 (25:5c53) -> 1E 01
	ld hl, $005b ; 95C55 (25:5c55) -> 21 5B 00
	scall EventFlagAction ; 95C58 (25:5c58) -> CD 1B 46
	call Func_9596a ; 95C5B (25:5c5b) -> CD 6A 59
	ld bc, Data_95c10 ; 95C5E (25:5c5e) -> 01 10 5C
	ld e, $25 ; 95C61 (25:5c61) -> 1E 25
	ld a, $01 ; 95C63 (25:5c63) -> 3E 01
	scall MovePersonAndWait ; 95C65 (25:5c65) -> CD 88 46
	scall WaitNPCStep ; 95C68 (25:5c68) -> CD 0C 42
	ld e, $00 ; 95C6B (25:5c6b) -> 1E 00
	ld a, $01 ; 95C6D (25:5c6d) -> 3E 01
	scall SetPersonVisibilityState ; 95C6F (25:5c6f) -> CD 3D 41
	ret  ; 95C72 (25:5c72) -> C9

Data_957c3:
	db $0a, $07, $09, $07, $ff, $ff

Func_95c79:: ; 95c79
IF DEF(SUN)
	db $5f, $3e, $01, $cd, $c8, $40, $1e, $02, $3e, $01, $cd, $95, $40, $1e, $01, $3e
	db $01, $cd, $3d, $41, $01, $73, $5c, $1e, $25, $3e, $01, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $3e, $01, $cd, $3d, $41, $cd, $02, $4f, $c9, $21, $1a, $c2, $36
	db $14, $23, $36, $85, $23, $36, $4d, $c3, $f8, $03, $21, $1a, $c2, $36, $14, $23
	db $36, $09, $23, $36, $4d, $c3, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $4d
	db $23, $36, $6e, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $02, $23, $36, $a6, $23
	db $36, $6c, $cd, $f8, $03, $c9, $e5, $c5, $c5, $c5, $c5, $c5, $c5, $af, $bb, $d2
	db $22, $5d, $d5, $f5, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09
	db $4d, $44, $cd, $48, $38, $12, $09, $d5, $e5, $d1, $e1, $f8, $04, $01, $0b, $00
	db $cd, $7e, $04, $21, $1a, $c2, $36, $02, $23, $36, $c8, $23, $36, $6c, $f8, $04
	db $cd, $f8, $03, $f1, $3c, $d1, $c3, $e7, $5c, $e8, $0e, $c9, $f5, $d5, $c5, $21
	db $1a, $c2, $36, $02, $23, $36, $0f, $23, $36, $66, $c1, $d1, $f1, $cd, $f8, $03
	db $c9, $f5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $d8, $23, $36, $66, $d1, $f1
	db $cd, $f8, $03, $f0, $40, $e6, $80, $ca, $5c, $5d, $cd, $65, $04, $cd, $65, $04
	db $cd, $65, $04, $c9, $f5, $21, $1a, $c2, $36, $14, $23, $36, $19, $23, $36, $4b
	db $f1, $c3, $f8, $03, $f5, $d5, $f8, $00, $7e, $f8, $03, $6e, $26, $00, $29, $5d
	db $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7
	db $19, $77, $c1, $c1, $c9, $f5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $9e, $23
	db $36, $63, $d1, $f1, $c3, $f8, $03, $e5, $e8, $f2, $af, $bb, $d2, $df, $5d, $d5
	db $f5, $6f, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $4d, $44, $cd
	db $48, $38, $14, $09, $d5, $e5, $d1, $e1, $f8, $04, $01, $0e, $00, $cd, $7e, $04
	db $21, $1a, $c2, $36, $02, $23, $36, $eb, $23, $36, $62, $f8, $04, $cd, $f8, $03
	db $f1, $3c, $d1, $c3, $a4, $5d, $e8, $10, $c9, $f5, $d5, $21, $1a, $c2, $36, $02
	db $23, $36, $44, $23, $36, $64, $d1, $f1, $cd, $f8, $03, $c9, $f5, $d5, $21, $1a
	db $c2, $36, $02, $23, $36, $80, $23, $36, $65, $d1, $f1, $cd, $f8, $03, $c9, $e5
	db $d5, $21, $1a, $c2, $36, $02, $23, $36, $a4, $23, $36, $65, $d1, $e1, $cd, $f8
	db $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36, $26, $23, $36, $aa, $23, $36, $66
	db $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $36, $23, $36, $fc, $23
	db $36, $64, $cd, $f8, $03, $21, $1a, $c2, $36, $26, $23, $36, $7c, $23, $36, $68
	db $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6, $06
	db $ea, $03, $c2, $c9, $21, $1a, $c2, $36, $36, $23, $36, $fc, $23, $36, $64, $cd
	db $f8, $03, $21, $1a, $c2, $36, $26, $23, $36, $7c, $23, $36, $68, $cd, $f8, $03
	db $c9, $21, $1a, $c2, $36, $26, $23, $36, $4a, $23, $36, $68, $cd, $f8, $03, $c9
	db $f5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $97, $23, $36, $68, $d1, $f1, $cd
	db $f8, $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36, $02, $23, $36, $1b, $23, $36
	db $70, $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $02, $23, $36, $ab
	db $23, $36, $73, $cd, $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $36, $23, $36, $dc
	db $23, $36, $64, $cd, $f8, $03, $21, $1a, $c2, $36, $36, $23, $36, $55, $23, $36
	db $5f, $cd, $f8, $03, $21, $1a, $c2, $36, $16, $23, $36, $5d, $23, $36, $4d, $f1
	db $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd
	db $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $93, $23, $36, $4d, $cd, $f8
	db $03, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03
	db $c9, $3e, $03, $ea, $9a, $c3, $21, $1a, $c2, $36, $05, $23, $36, $a9, $23, $36
	db $4c, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $70, $23, $36, $74
	db $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $40, $23, $36, $49, $cd, $f8
	db $03, $21, $1a, $c2, $36, $05, $23, $36, $88, $23, $36, $74, $cd, $f8, $03, $21
	db $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $c9, $21
	db $1a, $c2, $36, $1b, $23, $36, $12, $23, $36, $75, $cd, $f8, $03, $21, $1a, $c2
	db $36, $02, $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $21, $1a, $c2, $36
	db $1a, $23, $36, $5b, $23, $36, $56, $cd, $f8, $03, $c9, $c5, $e5, $f8, $02, $36
	db $01, $e1, $fa, $93, $c7, $b7, $ca, $b2, $5f, $fa, $93, $c7, $fe, $01, $ca, $b2
	db $5f, $fa, $93, $c7, $fe, $03, $c2, $e6, $5f, $e5, $d5, $21, $1a, $c2, $36, $02
	db $23, $36, $6d, $23, $36, $7c, $d1, $e1, $4b, $42, $d5, $e5, $d1, $e1, $3e, $25
	db $cd, $f8, $03, $b7, $ca, $d7, $5f, $f8, $00, $36, $00, $c3, $e6, $5f, $21, $1a
	db $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $f8, $00, $7e
	db $c1, $c9, $c5, $e5, $f8, $02, $36, $01, $e1, $fa, $93, $c7, $b7, $ca, $09, $60
	db $fa, $93, $c7, $fe, $01, $ca, $09, $60, $fa, $93, $c7, $fe, $03, $c2, $3d, $60
	db $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $5d, $23, $36, $7d, $d1, $e1, $4b
	db $42, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $b7, $ca, $2e, $60, $f8, $00
	db $36, $00, $c3, $3d, $60, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b
	db $af, $cd, $f8, $03, $f8, $00, $7e, $c1, $c9, $c5, $e5, $f8, $02, $36, $01, $e1
	db $fa, $93, $c7, $b7, $ca, $60, $60, $fa, $93, $c7, $fe, $01, $ca, $60, $60, $fa
	db $93, $c7, $fe, $03, $c2, $94, $60, $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36
	db $e5, $23, $36, $7c, $d1, $e1, $4b, $42, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8
	db $03, $b7, $ca, $85, $60, $f8, $00, $36, $00, $c3, $94, $60, $21, $1a, $c2, $36
	db $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $f8, $00, $7e, $c1, $c9
	db $c5, $e5, $f8, $02, $36, $01, $e1, $fa, $93, $c7, $b7, $ca, $b7, $60, $fa, $93
	db $c7, $fe, $01, $ca, $b7, $60, $fa, $93, $c7, $fe, $03, $c2, $eb, $60, $e5, $d5
	db $21, $1a, $c2, $36, $02, $23, $36, $d5, $23, $36, $7d, $d1, $e1, $4b, $42, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $b7, $ca, $dc, $60, $f8, $00, $36, $00
	db $c3, $eb, $60, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd
	db $f8, $03, $f8, $00, $7e, $c1, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $ef
	db $23, $36, $73, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $44
	db $23, $36, $4b, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $44, $23, $36
	db $4f, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $14, $23, $36, $88, $23, $36, $7c
	db $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $01, $23, $36, $1b, $23, $36, $6e
	db $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $02, $23, $36, $24, $23, $36, $6c
	db $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02, $23, $36, $2c, $23, $36
	db $6c, $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02, $23, $36, $94, $23
	db $36, $6c, $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $02, $23, $36, $9d, $23
	db $36, $6c, $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $05, $23, $36, $ba, $23
	db $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $e1, $c5, $5d, $54, $69, $60
	db $cd, $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $35, $23, $36, $6c, $c1, $c5
	db $69, $60, $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36, $7c
	db $e1, $cd, $f8, $03, $c9, $c5, $c5, $c5, $c5, $c5, $e5, $d5, $21, $1a, $c2, $36
	db $05, $23, $36, $ba, $23, $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $d1
	db $c5, $69, $60, $cd, $d7, $26, $c1, $e1, $c5, $d5, $e5, $d1, $e1, $f8, $02, $cd
	db $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $36, $23, $36, $6c, $c1, $c5, $59
	db $50, $f8, $02, $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36
	db $7c, $e1, $cd, $f8, $03, $c1, $c1, $c1, $c1, $c1, $c9, $e5, $21, $1a, $c2, $36
	db $05, $23, $36, $ba, $23, $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $e1
	db $c5, $5d, $54, $69, $60, $cd, $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $9b
	db $23, $36, $6c, $c1, $c5, $69, $60, $cd, $f8, $03, $c1, $f5, $c5, $21, $1a, $c2
	db $36, $05, $23, $36, $57, $23, $36, $7c, $e1, $cd, $f8, $03, $f1, $c9, $c5, $c5
	db $c5, $c5, $c5, $e5, $d5, $21, $1a, $c2, $36, $05, $23, $36, $ba, $23, $36, $7a
	db $21, $54, $01, $cd, $f8, $03, $4d, $44, $d1, $c5, $69, $60, $cd, $d7, $26, $c1
	db $e1, $c5, $d5, $e5, $d1, $e1, $f8, $02, $cd, $d7, $26, $21, $1a, $c2, $36, $02
	db $23, $36, $a4, $23, $36, $6c, $c1, $c5, $59, $50, $f8, $02, $cd, $f8, $03, $c1
	db $f5, $c5, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36, $7c, $e1, $cd, $f8
	db $03, $f1, $c1, $c1, $c1, $c1, $c1, $c9, $21, $1a, $c2, $36, $02, $23, $36, $37
	db $23, $36, $6c, $cd, $f8, $03, $c9, $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36
	db $8b, $23, $36, $69, $d1, $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02
	db $23, $36, $36, $23, $36, $6a, $e1, $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2
	db $36, $02, $23, $36, $00, $23, $36, $74, $c1, $d1, $f1, $cd, $f8, $03, $c9, $f5
	db $21, $1a, $c2, $36, $02, $23, $36, $2c, $23, $36, $75, $f1, $cd, $f8, $03, $c9
	db $f5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $30, $23, $36, $75, $d1, $f1, $cd
	db $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $8e, $23, $36, $75, $f1
	db $cd, $f8, $03, $c9, $cd, $9c, $5e, $cd, $b1, $5e, $c9, $e5, $21, $1a, $c2, $36
	db $02, $23, $36, $db, $23, $36, $75, $e1, $cd, $f8, $03, $c9, $d5, $ea, $f8, $c2
	db $21, $1a, $c2, $36, $0c, $23, $36, $48, $23, $36, $43, $d1, $d5, $7b, $cd, $f8
	db $03, $d1, $7b, $fe, $03, $da, $73, $63, $21, $1a, $c2, $36, $02, $23, $36, $a8
	db $23, $36, $4b, $af, $cd, $f8, $03, $c3, $81, $63, $21, $1a, $c2, $36, $02, $23
	db $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26
	db $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1
	db $7b, $b7, $c2, $3b, $64, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e
	db $cd, $3a, $5d, $21, $c8, $00, $cd, $d3, $62, $b7, $c2, $d7, $63, $21, $6d, $03
	db $cd, $4e, $61, $1e, $01, $21, $c8, $00, $cd, $c0, $62, $c3, $3b, $64, $e1, $e5
	db $6e, $26, $00, $11, $08, $00, $cd, $c6, $36, $11, $c5, $c7, $19, $4e, $e1, $e5
	db $7e, $e6, $07, $47, $3e, $01, $cd, $45, $36, $a1, $ca, $ff, $63, $21, $74, $03
	db $cd, $4e, $61, $c3, $3b, $64, $21, $6e, $03, $cd, $6f, $61, $b7, $c2, $3b, $64
	db $21, $1a, $c2, $36, $26, $23, $36, $e0, $23, $36, $6c, $e1, $e5, $23, $23, $4e
	db $e1, $e5, $7e, $e1, $e5, $23, $5e, $cd, $f8, $03, $fe, $02, $c2, $31, $64, $21
	db $71, $03, $cd, $3d, $61, $c3, $3b, $64, $b7, $c2, $3b, $64, $21, $7c, $04, $cd
	db $3d, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00, $29, $5d, $54
	db $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19
	db $11, $0c, $00, $19, $4e, $23, $46, $d1, $7b, $b7, $c2, $01, $65, $c5, $fa, $38
	db $c8, $c6, $02, $e6, $03, $5f, $f8, $05, $7e, $cd, $3a, $5d, $f8, $05, $6e, $26
	db $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23, $5e
	db $f8, $02, $73, $f8, $05, $6e, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19
	db $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19, $11, $0c, $00, $19, $5e
	db $23, $56, $f8, $02, $6e, $26, $00, $29, $19, $7e, $23, $b6, $c2, $bf, $64, $f8
	db $02, $36, $fe, $c3, $c2, $64, $c3, $cd, $64, $f8, $02, $7e, $c6, $02, $f8, $02
	db $77, $c3, $8c, $64, $c1, $f8, $00, $6e, $26, $00, $29, $23, $23, $09, $5e, $23
	db $56, $f8, $00, $6e, $26, $00, $29, $09, $7e, $23, $66, $6f, $cd, $be, $61, $f8
	db $00, $7e, $c6, $02, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd
	db $75, $38, $76, $c7, $19, $23, $23, $77, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05
	db $6e, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1
	db $cd, $75, $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97
	db $37, $d1, $7b, $b7, $c2, $9e, $65, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8
	db $03, $7e, $cd, $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1
	db $cd, $75, $38, $76, $c7, $19, $23, $23, $4e, $e1, $e5, $d5, $e5, $d1, $e1, $69
	db $26, $00, $29, $19, $7e, $23, $a6, $3c, $c2, $69, $65, $0e, $ff, $c3, $6c, $65
	db $c3, $70, $65, $0c, $c3, $52, $65, $c5, $cd, $29, $38, $d5, $e5, $d1, $e1, $69
	db $26, $00, $29, $19, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $3d, $61, $c1, $f8
	db $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19
	db $23, $23, $59, $1c, $73, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b
	db $b7, $c2, $3b, $66, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd
	db $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $4e, $e1, $e5, $d5, $e5, $d1, $e1, $69, $26, $00, $29
	db $19, $7e, $23, $a6, $3c, $c2, $06, $66, $0e, $ff, $c3, $09, $66, $c3, $0d, $66
	db $0c, $c3, $ef, $65, $c5, $cd, $29, $38, $d5, $e5, $d1, $e1, $69, $26, $00, $29
	db $19, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $4e, $61, $c1, $f8, $03, $6e, $26
	db $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23, $59
	db $1c, $73, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00, $29, $5d, $54
	db $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19
	db $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b, $b7, $c2, $1e
	db $67, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd, $3a, $5d, $f8
	db $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19
	db $23, $23, $7e, $fe, $01, $ca, $02, $67, $b7, $c2, $1e, $67, $e1, $e5, $23, $23
	db $5e, $23, $56, $d5, $cd, $29, $38, $5e, $23, $56, $d5, $e5, $d1, $e1, $d1, $cd
	db $57, $62, $b7, $c2, $e3, $66, $e1, $e5, $11, $06, $00, $19, $5e, $23, $56, $d5
	db $cd, $29, $38, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $d1, $cd
	db $be, $61, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $36, $01, $c3, $ff, $66, $e1, $e5, $11, $0a, $00, $19
	db $5e, $23, $56, $d5, $cd, $29, $38, $11, $08, $00, $19, $5e, $23, $56, $d5, $e5
	db $d1, $e1, $d1, $cd, $be, $61, $c3, $1e, $67, $e1, $e5, $11, $06, $00, $19, $5e
	db $23, $56, $d5, $cd, $29, $38, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5, $d1
	db $e1, $d1, $cd, $be, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b
	db $b7, $c2, $cf, $67, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd
	db $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $7e, $fe, $01, $ca, $c1, $67, $b7, $c2, $cf, $67, $e1
	db $e5, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $5f, $61, $b7, $c2, $ae, $67, $e1
	db $e5, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $3d, $61, $f8, $03, $6e
	db $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23
	db $36, $01, $c3, $be, $67, $e1, $e5, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5
	db $d1, $e1, $cd, $3d, $61, $c3, $cf, $67, $e1, $e5, $23, $23, $5e, $23, $56, $d5
	db $e5, $d1, $e1, $cd, $3d, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26
	db $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1
	db $7b, $b7, $c2, $80, $68, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e
	db $cd, $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $76, $c7, $19, $23, $23, $7e, $fe, $01, $ca, $72, $68, $b7, $c2, $80, $68
	db $e1, $e5, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $6f, $61, $b7, $c2, $5f, $68
	db $e1, $e5, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $4e, $61, $f8, $03
	db $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23
	db $23, $36, $01, $c3, $6f, $68, $e1, $e5, $23, $23, $23, $23, $5e, $23, $56, $d5
	db $e5, $d1, $e1, $cd, $4e, $61, $c3, $80, $68, $e1, $e5, $23, $23, $5e, $23, $56
	db $d5, $e5, $d1, $e1, $cd, $4e, $61, $c1, $c1, $c9, $f5, $f8, $01, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $23, $23, $7e, $ea, $46, $c8, $f8, $01, $6e, $26, $00, $29, $5d
	db $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7
	db $19, $23, $23, $23, $7e, $ea, $47, $c8, $3e, $ff, $ea, $48, $c8, $3e, $ff, $ea
	db $49, $c8, $fa, $38, $c8, $fe, $03, $ca, $ff, $68, $fe, $02, $ca, $f5, $68, $fe
	db $01, $ca, $eb, $68, $b7, $c2, $06, $69, $fa, $47, $c8, $3d, $ea, $47, $c8, $c3
	db $06, $69, $fa, $46, $c8, $3c, $ea, $46, $c8, $c3, $06, $69, $fa, $47, $c8, $3c
	db $ea, $47, $c8, $c3, $06, $69, $fa, $46, $c8, $3d, $ea, $46, $c8, $21, $1a, $c2
	db $36, $02, $23, $36, $87, $23, $36, $5f, $0e, $01, $fa, $47, $c8, $5f, $fa, $46
	db $c8, $cd, $f8, $03, $b7, $c2, $36, $69, $3e, $33, $cd, $02, $15, $01, $46, $c8
	db $1e, $25, $f8, $01, $7e, $cd, $9c, $5e, $3e, $01, $c3, $37, $69, $af, $c1, $c9
	db $f5, $21, $1a, $c2, $36, $38, $23, $36, $80, $23, $36, $67, $f1, $cd, $f8, $03
	db $c9, $f5, $21, $1a, $c2, $36, $38, $23, $36, $29, $23, $36, $68, $f1, $c3, $f8
	db $03, $f5, $21, $1a, $c2, $36, $38, $23, $36, $07, $23, $36, $68, $f1, $cd, $f8
	db $03, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $77, $23, $36, $7e, $f1, $cd
	db $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $03, $23, $36, $67, $23, $36, $5d, $f1
	db $c3, $f8, $03, $e5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $62, $23, $36, $72
	db $d1, $e1, $4b, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $c9, $f5, $fa, $93
	db $c7, $b7, $ca, $b6, $69, $fa, $93, $c7, $fe, $03, $c2, $c7, $69, $21, $1a, $c2
	db $36, $02, $23, $36, $85, $23, $36, $77, $f8, $01, $7e, $cd, $f8, $03, $c1, $c9
	db $fa, $93, $c7, $b7, $ca, $d8, $69, $fa, $93, $c7, $fe, $03, $c2, $f1, $69, $e5
	db $d5, $21, $1a, $c2, $36, $02, $23, $36, $fd, $23, $36, $77, $d1, $e1, $4b, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36
	db $16, $23, $36, $e0, $23, $36, $60, $c1, $d1, $f1, $cd, $f8, $03, $c9, $f5, $d5
	db $21, $1a, $c2, $36, $13, $23, $36, $5d, $23, $36, $6d, $d1, $f1, $c3, $f8, $03
	db $f5, $d5, $21, $1a, $c2, $36, $1a, $23, $36, $0d, $23, $36, $6f, $d1, $f1, $3c
	db $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2, $36, $0c, $23, $36, $f1, $23, $36
	db $5a, $c1, $d1, $f1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $38, $23, $36, $14
	db $23, $36, $77, $e1, $e5, $11, $05, $00, $19, $4e, $e1, $e5, $23, $23, $23, $23
	db $66, $44, $e1, $e5, $23, $23, $7e, $e1, $e5, $23, $23, $23, $6e, $67, $e5, $cd
	db $29, $38, $7e, $cd, $29, $38, $23, $6e, $67, $d1, $cd, $f8, $03, $c1, $c9, $fa
	db $93, $c7, $b7, $ca, $87, $6a, $fa, $93, $c7, $fe, $03, $c2, $a2, $6a, $e5, $d5
	db $21, $1a, $c2, $36, $02, $23, $36, $ee, $23, $36, $7b, $d1, $e1, $4b, $42, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $6f, $7d, $c9, $d5, $f5, $c5, $21, $1a
	db $c2, $36, $02, $23, $36, $7a, $23, $36, $6f, $c1, $f1, $f8, $04, $6e, $61, $5d
	db $54, $f8, $00, $6e, $67, $cd, $f8, $03, $c1, $c9, $f5, $d5, $21, $1a, $c2, $36
	db $02, $23, $36, $3f, $23, $36, $54, $d1, $f1, $cd, $f8, $03, $c9, $e5, $d5, $21
	db $1a, $c2, $36, $01, $23, $36, $94, $23, $36, $6b, $d1, $e1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $02, $23, $36, $64, $23, $36, $5f, $fa, $d9, $c2, $c6, $04
	db $5f, $fa, $d8, $c2, $c6, $05, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $38, $23
	db $36, $2d, $23, $36, $5f, $f1, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $1a, $23
	db $36, $d4, $23, $36, $6a, $f1, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $1a, $23
	db $36, $29, $23, $36, $6b, $f1, $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2, $36
	db $38, $23, $36, $13, $23, $36, $55, $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a
	db $c2, $36, $02, $23, $36, $3e, $23, $36, $5d, $cd, $f8, $03, $c9, $21, $1a, $c2
	db $36, $02, $23, $36, $4d, $23, $36, $5d, $cd, $f8, $03, $c9, $cd, $a8, $3a, $21
	db $1a, $c2, $36, $05, $23, $36, $71, $23, $36, $47, $3e, $07, $cd, $f8, $03, $e5
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $e1
	db $7d, $c9, $f5, $fa, $be, $c7, $f8, $01, $be, $ca, $a1, $6b, $f8, $01, $7e, $cd
	db $fc, $14, $f8, $01, $7e, $ea, $be, $c7, $c1, $c9, $cd, $02, $15, $c9, $21, $1a
	db $c2, $36, $02, $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $e5, $21, $1a
	db $c2, $36, $02, $23, $36, $39, $23, $36, $7f, $d1, $3e, $25, $cd, $f8, $03, $c9
	db $d5, $c5, $f5, $21, $1a, $c2, $36, $38, $23, $36, $19, $23, $36, $76, $f1, $f8
	db $06, $4e, $f8, $00, $5e, $f8, $02, $6e, $67, $cd, $f8, $03, $c1, $c1, $c9, $f5
	db $21, $1a, $c2, $36, $02, $23, $36, $46, $23, $36, $7f, $f1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $02, $23, $36, $5f, $23, $36, $76, $cd, $f8, $03, $c9, $21
	db $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76, $cd, $f8, $03, $c9, $e5, $21
	db $1a, $c2, $36, $26, $23, $36, $bb, $23, $36, $61, $e1, $cd, $f8, $03, $c9, $e5
	db $21, $1a, $c2, $36, $26, $23, $36, $8c, $23, $36, $62, $e1, $cd, $f8, $03, $c9
	db $e5, $21, $1a, $c2, $36, $24, $23, $36, $70, $23, $36, $73, $e1, $cd, $f8, $03
	db $c9, $e5, $e8, $9a, $21, $1a, $c2, $36, $00, $23, $36, $11, $23, $36, $1c, $f8
	db $00, $d5, $e5, $d1, $e1, $21, $66, $00, $cd, $f8, $03, $21, $1a, $c2, $36, $00
	db $23, $36, $27, $23, $36, $1c, $f8, $00, $e5, $cd, $48, $38, $6a, $d1, $cd, $f8
	db $03, $d5, $e5, $d1, $e1, $e8, $68, $d5, $e5, $d1, $e1, $c9, $f5, $21, $1a, $c2
	db $36, $0c, $23, $36, $ba, $23, $36, $73, $f1, $cd, $f8, $03, $c9, $f5, $2e, $00
	db $7d, $fe, $08, $d2, $bd, $6c, $e5, $af, $f8, $03, $be, $d2, $b0, $6c, $f5, $cd
	db $65, $04, $f1, $3c, $c3, $a1, $6c, $e1, $e5, $3e, $07, $95, $cd, $d0, $1a, $e1
	db $2c, $c3, $99, $6c, $c1, $c9, $f5, $af, $fe, $08, $d2, $e1, $6c, $f5, $af, $f8
	db $03, $be, $d2, $d7, $6c, $f5, $cd, $65, $04, $f1, $3c, $c3, $c8, $6c, $f1, $f5
	db $cd, $d0, $1a, $f1, $3c, $c3, $c1, $6c, $c1, $c9, $f5, $21, $1a, $c2, $36, $1a
	db $23, $36, $47, $23, $36, $6e, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $1a
	db $23, $36, $44, $23, $36, $6c, $cd, $f8, $03, $fe, $ff, $c2, $16, $6d, $21, $1a
	db $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $c9, $21, $1a
	db $c2, $36, $1a, $23, $36, $1a, $23, $36, $73, $cd, $f8, $03, $c9, $e5, $d5, $21
	db $1a, $c2, $36, $31, $23, $36, $6a, $23, $36, $79, $d1, $e1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $14, $23, $36, $6e, $23, $36, $7b, $cd, $f8, $03, $c9, $f5
	db $21, $1a, $c2, $36, $3e, $23, $36, $5f, $23, $36, $75, $f1, $cd, $f8, $03, $c9
	db $0b, $0f, $05, $01, $1e, $00, $0c, $0b, $0b, $0b, $2e, $09, $04, $01, $01, $0c
	db $01, $09, $2c, $09, $2b, $2e, $0b, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b
	db $2e, $0d, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e, $0f, $04, $01, $01
	db $0c, $01, $09, $2c, $09, $2b, $2e, $11, $04, $01, $01, $0c, $01, $09, $2c, $09
	db $2b, $2e, $3b, $03, $ff, $ff, $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, $25
	db $04, $65, $9b, $6d, $ff, $00, $10, $0e, $01, $01, $00, $04, $00, $25, $04, $65
	db $9b, $6d
ELIF DEF(STAR)
	db $5f, $3e, $01, $cd, $c8, $40, $1e, $02, $3e, $01, $cd, $95, $40, $1e, $01, $3e
	db $01, $cd, $3d, $41, $01, $73, $5c, $1e, $25, $3e, $01, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $3e, $01, $cd, $3d, $41, $cd, $02, $4f, $c9, $21, $1a, $c2, $36
	db $14, $23, $36, $85, $23, $36, $4d, $c3, $f8, $03, $21, $1a, $c2, $36, $14, $23
	db $36, $09, $23, $36, $4d, $c3, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $4d
	db $23, $36, $6e, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $02, $23, $36, $a6, $23
	db $36, $6c, $cd, $f8, $03, $c9, $e5, $c5, $c5, $c5, $c5, $c5, $c5, $af, $bb, $d2
	db $22, $5d, $d5, $f5, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09
	db $4d, $44, $cd, $48, $38, $12, $09, $d5, $e5, $d1, $e1, $f8, $04, $01, $0b, $00
	db $cd, $7e, $04, $21, $1a, $c2, $36, $02, $23, $36, $c8, $23, $36, $6c, $f8, $04
	db $cd, $f8, $03, $f1, $3c, $d1, $c3, $e7, $5c, $e8, $0e, $c9, $f5, $d5, $c5, $21
	db $1a, $c2, $36, $02, $23, $36, $0f, $23, $36, $66, $c1, $d1, $f1, $cd, $f8, $03
	db $c9, $f5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $d8, $23, $36, $66, $d1, $f1
	db $cd, $f8, $03, $f0, $40, $e6, $80, $ca, $5c, $5d, $cd, $65, $04, $cd, $65, $04
	db $cd, $65, $04, $c9, $f5, $21, $1a, $c2, $36, $14, $23, $36, $19, $23, $36, $4b
	db $f1, $c3, $f8, $03, $f5, $d5, $f8, $00, $7e, $f8, $03, $6e, $26, $00, $29, $5d
	db $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7
	db $19, $77, $c1, $c1, $c9, $f5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $9e, $23
	db $36, $63, $d1, $f1, $c3, $f8, $03, $e5, $e8, $f2, $af, $bb, $d2, $df, $5d, $d5
	db $f5, $6f, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $4d, $44, $cd
	db $48, $38, $14, $09, $d5, $e5, $d1, $e1, $f8, $04, $01, $0e, $00, $cd, $7e, $04
	db $21, $1a, $c2, $36, $02, $23, $36, $eb, $23, $36, $62, $f8, $04, $cd, $f8, $03
	db $f1, $3c, $d1, $c3, $a4, $5d, $e8, $10, $c9, $f5, $d5, $21, $1a, $c2, $36, $02
	db $23, $36, $44, $23, $36, $64, $d1, $f1, $cd, $f8, $03, $c9, $f5, $d5, $21, $1a
	db $c2, $36, $02, $23, $36, $80, $23, $36, $65, $d1, $f1, $cd, $f8, $03, $c9, $e5
	db $d5, $21, $1a, $c2, $36, $02, $23, $36, $a4, $23, $36, $65, $d1, $e1, $cd, $f8
	db $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36, $26, $23, $36, $aa, $23, $36, $66
	db $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $36, $23, $36, $fc, $23
	db $36, $64, $cd, $f8, $03, $21, $1a, $c2, $36, $26, $23, $36, $7c, $23, $36, $68
	db $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6, $06
	db $ea, $03, $c2, $c9, $21, $1a, $c2, $36, $36, $23, $36, $fc, $23, $36, $64, $cd
	db $f8, $03, $21, $1a, $c2, $36, $26, $23, $36, $7c, $23, $36, $68, $cd, $f8, $03
	db $c9, $21, $1a, $c2, $36, $26, $23, $36, $4a, $23, $36, $68, $cd, $f8, $03, $c9
	db $f5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $97, $23, $36, $68, $d1, $f1, $cd
	db $f8, $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36, $02, $23, $36, $1b, $23, $36
	db $70, $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $02, $23, $36, $ab
	db $23, $36, $73, $cd, $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $36, $23, $36, $dc
	db $23, $36, $64, $cd, $f8, $03, $21, $1a, $c2, $36, $36, $23, $36, $55, $23, $36
	db $5f, $cd, $f8, $03, $21, $1a, $c2, $36, $16, $23, $36, $5d, $23, $36, $4d, $f1
	db $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd
	db $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $93, $23, $36, $4d, $cd, $f8
	db $03, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03
	db $c9, $3e, $03, $ea, $9a, $c3, $21, $1a, $c2, $36, $05, $23, $36, $a9, $23, $36
	db $4c, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $70, $23, $36, $74
	db $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $40, $23, $36, $49, $cd, $f8
	db $03, $21, $1a, $c2, $36, $05, $23, $36, $88, $23, $36, $74, $cd, $f8, $03, $21
	db $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $c9, $21
	db $1a, $c2, $36, $1b, $23, $36, $12, $23, $36, $75, $cd, $f8, $03, $21, $1a, $c2
	db $36, $02, $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $21, $1a, $c2, $36
	db $1a, $23, $36, $5b, $23, $36, $56, $cd, $f8, $03, $c9, $c5, $e5, $f8, $02, $36
	db $01, $e1, $fa, $93, $c7, $b7, $ca, $b2, $5f, $fa, $93, $c7, $fe, $01, $ca, $b2
	db $5f, $fa, $93, $c7, $fe, $03, $c2, $e6, $5f, $e5, $d5, $21, $1a, $c2, $36, $02
	db $23, $36, $6d, $23, $36, $7c, $d1, $e1, $4b, $42, $d5, $e5, $d1, $e1, $3e, $25
	db $cd, $f8, $03, $b7, $ca, $d7, $5f, $f8, $00, $36, $00, $c3, $e6, $5f, $21, $1a
	db $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $f8, $00, $7e
	db $c1, $c9, $c5, $e5, $f8, $02, $36, $01, $e1, $fa, $93, $c7, $b7, $ca, $09, $60
	db $fa, $93, $c7, $fe, $01, $ca, $09, $60, $fa, $93, $c7, $fe, $03, $c2, $3d, $60
	db $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $5d, $23, $36, $7d, $d1, $e1, $4b
	db $42, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $b7, $ca, $2e, $60, $f8, $00
	db $36, $00, $c3, $3d, $60, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b
	db $af, $cd, $f8, $03, $f8, $00, $7e, $c1, $c9, $c5, $e5, $f8, $02, $36, $01, $e1
	db $fa, $93, $c7, $b7, $ca, $60, $60, $fa, $93, $c7, $fe, $01, $ca, $60, $60, $fa
	db $93, $c7, $fe, $03, $c2, $94, $60, $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36
	db $e5, $23, $36, $7c, $d1, $e1, $4b, $42, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8
	db $03, $b7, $ca, $85, $60, $f8, $00, $36, $00, $c3, $94, $60, $21, $1a, $c2, $36
	db $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $f8, $00, $7e, $c1, $c9
	db $c5, $e5, $f8, $02, $36, $01, $e1, $fa, $93, $c7, $b7, $ca, $b7, $60, $fa, $93
	db $c7, $fe, $01, $ca, $b7, $60, $fa, $93, $c7, $fe, $03, $c2, $eb, $60, $e5, $d5
	db $21, $1a, $c2, $36, $02, $23, $36, $d5, $23, $36, $7d, $d1, $e1, $4b, $42, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $b7, $ca, $dc, $60, $f8, $00, $36, $00
	db $c3, $eb, $60, $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd
	db $f8, $03, $f8, $00, $7e, $c1, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $ef
	db $23, $36, $73, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $05, $23, $36, $44
	db $23, $36, $4b, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $44, $23, $36
	db $4f, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $14, $23, $36, $88, $23, $36, $7c
	db $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $01, $23, $36, $1b, $23, $36, $6e
	db $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $02, $23, $36, $24, $23, $36, $6c
	db $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02, $23, $36, $2c, $23, $36
	db $6c, $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02, $23, $36, $94, $23
	db $36, $6c, $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $02, $23, $36, $9d, $23
	db $36, $6c, $e1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $05, $23, $36, $ba, $23
	db $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $e1, $c5, $5d, $54, $69, $60
	db $cd, $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $35, $23, $36, $6c, $c1, $c5
	db $69, $60, $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36, $7c
	db $e1, $cd, $f8, $03, $c9, $c5, $c5, $c5, $c5, $c5, $e5, $d5, $21, $1a, $c2, $36
	db $05, $23, $36, $ba, $23, $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $d1
	db $c5, $69, $60, $cd, $d7, $26, $c1, $e1, $c5, $d5, $e5, $d1, $e1, $f8, $02, $cd
	db $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $36, $23, $36, $6c, $c1, $c5, $59
	db $50, $f8, $02, $cd, $f8, $03, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36
	db $7c, $e1, $cd, $f8, $03, $c1, $c1, $c1, $c1, $c1, $c9, $e5, $21, $1a, $c2, $36
	db $05, $23, $36, $ba, $23, $36, $7a, $21, $54, $01, $cd, $f8, $03, $4d, $44, $e1
	db $c5, $5d, $54, $69, $60, $cd, $d7, $26, $21, $1a, $c2, $36, $02, $23, $36, $9b
	db $23, $36, $6c, $c1, $c5, $69, $60, $cd, $f8, $03, $c1, $f5, $c5, $21, $1a, $c2
	db $36, $05, $23, $36, $57, $23, $36, $7c, $e1, $cd, $f8, $03, $f1, $c9, $c5, $c5
	db $c5, $c5, $c5, $e5, $d5, $21, $1a, $c2, $36, $05, $23, $36, $ba, $23, $36, $7a
	db $21, $54, $01, $cd, $f8, $03, $4d, $44, $d1, $c5, $69, $60, $cd, $d7, $26, $c1
	db $e1, $c5, $d5, $e5, $d1, $e1, $f8, $02, $cd, $d7, $26, $21, $1a, $c2, $36, $02
	db $23, $36, $a4, $23, $36, $6c, $c1, $c5, $59, $50, $f8, $02, $cd, $f8, $03, $c1
	db $f5, $c5, $21, $1a, $c2, $36, $05, $23, $36, $57, $23, $36, $7c, $e1, $cd, $f8
	db $03, $f1, $c1, $c1, $c1, $c1, $c1, $c9, $21, $1a, $c2, $36, $02, $23, $36, $37
	db $23, $36, $6c, $cd, $f8, $03, $c9, $e5, $d5, $21, $1a, $c2, $36, $02, $23, $36
	db $8b, $23, $36, $69, $d1, $e1, $cd, $f8, $03, $c9, $e5, $21, $1a, $c2, $36, $02
	db $23, $36, $36, $23, $36, $6a, $e1, $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2
	db $36, $02, $23, $36, $00, $23, $36, $74, $c1, $d1, $f1, $cd, $f8, $03, $c9, $f5
	db $21, $1a, $c2, $36, $02, $23, $36, $2c, $23, $36, $75, $f1, $cd, $f8, $03, $c9
	db $f5, $d5, $21, $1a, $c2, $36, $02, $23, $36, $30, $23, $36, $75, $d1, $f1, $cd
	db $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $8e, $23, $36, $75, $f1
	db $cd, $f8, $03, $c9, $cd, $9c, $5e, $cd, $b1, $5e, $c9, $e5, $21, $1a, $c2, $36
	db $02, $23, $36, $db, $23, $36, $75, $e1, $cd, $f8, $03, $c9, $d5, $ea, $f8, $c2
	db $21, $1a, $c2, $36, $0c, $23, $36, $48, $23, $36, $43, $d1, $d5, $7b, $cd, $f8
	db $03, $d1, $7b, $fe, $03, $da, $73, $63, $21, $1a, $c2, $36, $02, $23, $36, $a8
	db $23, $36, $4b, $af, $cd, $f8, $03, $c3, $81, $63, $21, $1a, $c2, $36, $02, $23
	db $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26
	db $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1
	db $7b, $b7, $c2, $3b, $64, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e
	db $cd, $3a, $5d, $21, $c8, $00, $cd, $d3, $62, $b7, $c2, $d7, $63, $21, $6d, $03
	db $cd, $4e, $61, $1e, $01, $21, $c8, $00, $cd, $c0, $62, $c3, $3b, $64, $e1, $e5
	db $6e, $26, $00, $11, $08, $00, $cd, $c6, $36, $11, $c5, $c7, $19, $4e, $e1, $e5
	db $7e, $e6, $07, $47, $3e, $01, $cd, $45, $36, $a1, $ca, $ff, $63, $21, $74, $03
	db $cd, $4e, $61, $c3, $3b, $64, $21, $6e, $03, $cd, $6f, $61, $b7, $c2, $3b, $64
	db $21, $1a, $c2, $36, $26, $23, $36, $e0, $23, $36, $6c, $e1, $e5, $23, $23, $4e
	db $e1, $e5, $7e, $e1, $e5, $23, $5e, $cd, $f8, $03, $fe, $02, $c2, $31, $64, $21
	db $71, $03, $cd, $3d, $61, $c3, $3b, $64, $b7, $c2, $3b, $64, $21, $7c, $04, $cd
	db $3d, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00, $29, $5d, $54
	db $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19
	db $11, $0c, $00, $19, $4e, $23, $46, $d1, $7b, $b7, $c2, $01, $65, $c5, $fa, $38
	db $c8, $c6, $02, $e6, $03, $5f, $f8, $05, $7e, $cd, $3a, $5d, $f8, $05, $6e, $26
	db $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23, $5e
	db $f8, $02, $73, $f8, $05, $6e, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19
	db $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19, $11, $0c, $00, $19, $5e
	db $23, $56, $f8, $02, $6e, $26, $00, $29, $19, $7e, $23, $b6, $c2, $bf, $64, $f8
	db $02, $36, $fe, $c3, $c2, $64, $c3, $cd, $64, $f8, $02, $7e, $c6, $02, $f8, $02
	db $77, $c3, $8c, $64, $c1, $f8, $00, $6e, $26, $00, $29, $23, $23, $09, $5e, $23
	db $56, $f8, $00, $6e, $26, $00, $29, $09, $7e, $23, $66, $6f, $cd, $be, $61, $f8
	db $00, $7e, $c6, $02, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd
	db $75, $38, $76, $c7, $19, $23, $23, $77, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05
	db $6e, $26, $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1
	db $cd, $75, $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97
	db $37, $d1, $7b, $b7, $c2, $9e, $65, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8
	db $03, $7e, $cd, $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1
	db $cd, $75, $38, $76, $c7, $19, $23, $23, $4e, $e1, $e5, $d5, $e5, $d1, $e1, $69
	db $26, $00, $29, $19, $7e, $23, $a6, $3c, $c2, $69, $65, $0e, $ff, $c3, $6c, $65
	db $c3, $70, $65, $0c, $c3, $52, $65, $c5, $cd, $29, $38, $d5, $e5, $d1, $e1, $69
	db $26, $00, $29, $19, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $3d, $61, $c1, $f8
	db $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19
	db $23, $23, $59, $1c, $73, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b
	db $b7, $c2, $3b, $66, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd
	db $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $4e, $e1, $e5, $d5, $e5, $d1, $e1, $69, $26, $00, $29
	db $19, $7e, $23, $a6, $3c, $c2, $06, $66, $0e, $ff, $c3, $09, $66, $c3, $0d, $66
	db $0c, $c3, $ef, $65, $c5, $cd, $29, $38, $d5, $e5, $d1, $e1, $69, $26, $00, $29
	db $19, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $4e, $61, $c1, $f8, $03, $6e, $26
	db $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23, $59
	db $1c, $73, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00, $29, $5d, $54
	db $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7, $19
	db $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b, $b7, $c2, $1e
	db $67, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd, $3a, $5d, $f8
	db $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19
	db $23, $23, $7e, $fe, $01, $ca, $02, $67, $b7, $c2, $1e, $67, $e1, $e5, $23, $23
	db $5e, $23, $56, $d5, $cd, $29, $38, $5e, $23, $56, $d5, $e5, $d1, $e1, $d1, $cd
	db $57, $62, $b7, $c2, $e3, $66, $e1, $e5, $11, $06, $00, $19, $5e, $23, $56, $d5
	db $cd, $29, $38, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $d1, $cd
	db $be, $61, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $36, $01, $c3, $ff, $66, $e1, $e5, $11, $0a, $00, $19
	db $5e, $23, $56, $d5, $cd, $29, $38, $11, $08, $00, $19, $5e, $23, $56, $d5, $e5
	db $d1, $e1, $d1, $cd, $be, $61, $c3, $1e, $67, $e1, $e5, $11, $06, $00, $19, $5e
	db $23, $56, $d5, $cd, $29, $38, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5, $d1
	db $e1, $d1, $cd, $be, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1, $7b
	db $b7, $c2, $cf, $67, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e, $cd
	db $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $76, $c7, $19, $23, $23, $7e, $fe, $01, $ca, $c1, $67, $b7, $c2, $cf, $67, $e1
	db $e5, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $5f, $61, $b7, $c2, $ae, $67, $e1
	db $e5, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $3d, $61, $f8, $03, $6e
	db $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23, $23
	db $36, $01, $c3, $be, $67, $e1, $e5, $23, $23, $23, $23, $5e, $23, $56, $d5, $e5
	db $d1, $e1, $cd, $3d, $61, $c3, $cf, $67, $e1, $e5, $23, $23, $5e, $23, $56, $d5
	db $e5, $d1, $e1, $cd, $3d, $61, $c1, $c1, $c9, $f5, $c5, $d5, $f8, $05, $6e, $26
	db $00, $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $74, $c7, $19, $11, $0c, $00, $19, $7e, $23, $66, $6f, $cd, $97, $37, $d1
	db $7b, $b7, $c2, $80, $68, $fa, $38, $c8, $c6, $02, $e6, $03, $5f, $f8, $03, $7e
	db $cd, $3a, $5d, $f8, $03, $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75
	db $38, $76, $c7, $19, $23, $23, $7e, $fe, $01, $ca, $72, $68, $b7, $c2, $80, $68
	db $e1, $e5, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $6f, $61, $b7, $c2, $5f, $68
	db $e1, $e5, $23, $23, $5e, $23, $56, $d5, $e5, $d1, $e1, $cd, $4e, $61, $f8, $03
	db $6e, $26, $00, $29, $29, $d5, $e5, $d1, $e1, $cd, $75, $38, $76, $c7, $19, $23
	db $23, $36, $01, $c3, $6f, $68, $e1, $e5, $23, $23, $23, $23, $5e, $23, $56, $d5
	db $e5, $d1, $e1, $cd, $4e, $61, $c3, $80, $68, $e1, $e5, $23, $23, $5e, $23, $56
	db $d5, $e5, $d1, $e1, $cd, $4e, $61, $c1, $c1, $c9, $f5, $f8, $01, $6e, $26, $00
	db $29, $5d, $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $74, $c7, $19, $23, $23, $7e, $ea, $46, $c8, $f8, $01, $6e, $26, $00, $29, $5d
	db $54, $29, $4d, $44, $29, $19, $09, $d5, $e5, $d1, $e1, $cd, $75, $38, $74, $c7
	db $19, $23, $23, $23, $7e, $ea, $47, $c8, $3e, $ff, $ea, $48, $c8, $3e, $ff, $ea
	db $49, $c8, $fa, $38, $c8, $fe, $03, $ca, $ff, $68, $fe, $02, $ca, $f5, $68, $fe
	db $01, $ca, $eb, $68, $b7, $c2, $06, $69, $fa, $47, $c8, $3d, $ea, $47, $c8, $c3
	db $06, $69, $fa, $46, $c8, $3c, $ea, $46, $c8, $c3, $06, $69, $fa, $47, $c8, $3c
	db $ea, $47, $c8, $c3, $06, $69, $fa, $46, $c8, $3d, $ea, $46, $c8, $21, $1a, $c2
	db $36, $02, $23, $36, $87, $23, $36, $5f, $0e, $01, $fa, $47, $c8, $5f, $fa, $46
	db $c8, $cd, $f8, $03, $b7, $c2, $36, $69, $3e, $33, $cd, $02, $15, $01, $46, $c8
	db $1e, $25, $f8, $01, $7e, $cd, $9c, $5e, $3e, $01, $c3, $37, $69, $af, $c1, $c9
	db $f5, $21, $1a, $c2, $36, $38, $23, $36, $80, $23, $36, $67, $f1, $cd, $f8, $03
	db $c9, $f5, $21, $1a, $c2, $36, $38, $23, $36, $29, $23, $36, $68, $f1, $c3, $f8
	db $03, $f5, $21, $1a, $c2, $36, $38, $23, $36, $07, $23, $36, $68, $f1, $cd, $f8
	db $03, $c9, $f5, $21, $1a, $c2, $36, $02, $23, $36, $77, $23, $36, $7e, $f1, $cd
	db $f8, $03, $c9, $f5, $21, $1a, $c2, $36, $03, $23, $36, $67, $23, $36, $5d, $f1
	db $c3, $f8, $03, $e5, $d5, $21, $1a, $c2, $36, $26, $23, $36, $62, $23, $36, $72
	db $d1, $e1, $4b, $d5, $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $c9, $f5, $fa, $93
	db $c7, $b7, $ca, $b6, $69, $fa, $93, $c7, $fe, $03, $c2, $c7, $69, $21, $1a, $c2
	db $36, $02, $23, $36, $85, $23, $36, $77, $f8, $01, $7e, $cd, $f8, $03, $c1, $c9
	db $fa, $93, $c7, $b7, $ca, $d8, $69, $fa, $93, $c7, $fe, $03, $c2, $f1, $69, $e5
	db $d5, $21, $1a, $c2, $36, $02, $23, $36, $fd, $23, $36, $77, $d1, $e1, $4b, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $c9, $f5, $d5, $c5, $21, $1a, $c2, $36
	db $16, $23, $36, $e0, $23, $36, $60, $c1, $d1, $f1, $cd, $f8, $03, $c9, $f5, $d5
	db $21, $1a, $c2, $36, $13, $23, $36, $5d, $23, $36, $6d, $d1, $f1, $c3, $f8, $03
	db $f5, $d5, $21, $1a, $c2, $36, $1a, $23, $36, $0d, $23, $36, $6f, $d1, $f1, $3c
	db $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2, $36, $0c, $23, $36, $f1, $23, $36
	db $5a, $c1, $d1, $f1, $c3, $f8, $03, $e5, $21, $1a, $c2, $36, $38, $23, $36, $14
	db $23, $36, $77, $e1, $e5, $11, $05, $00, $19, $4e, $e1, $e5, $23, $23, $23, $23
	db $66, $44, $e1, $e5, $23, $23, $7e, $e1, $e5, $23, $23, $23, $6e, $67, $e5, $cd
	db $29, $38, $7e, $cd, $29, $38, $23, $6e, $67, $d1, $cd, $f8, $03, $c1, $c9, $fa
	db $93, $c7, $b7, $ca, $87, $6a, $fa, $93, $c7, $fe, $03, $c2, $a2, $6a, $e5, $d5
	db $21, $1a, $c2, $36, $02, $23, $36, $ee, $23, $36, $7b, $d1, $e1, $4b, $42, $d5
	db $e5, $d1, $e1, $3e, $25, $cd, $f8, $03, $6f, $7d, $c9, $d5, $f5, $c5, $21, $1a
	db $c2, $36, $02, $23, $36, $7a, $23, $36, $6f, $c1, $f1, $f8, $04, $6e, $61, $5d
	db $54, $f8, $00, $6e, $67, $cd, $f8, $03, $c1, $c9, $f5, $d5, $21, $1a, $c2, $36
	db $02, $23, $36, $3f, $23, $36, $54, $d1, $f1, $cd, $f8, $03, $c9, $e5, $d5, $21
	db $1a, $c2, $36, $01, $23, $36, $94, $23, $36, $6b, $d1, $e1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $02, $23, $36, $64, $23, $36, $5f, $fa, $d9, $c2, $c6, $04
	db $5f, $fa, $d8, $c2, $c6, $05, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $38, $23
	db $36, $2d, $23, $36, $5f, $f1, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $1a, $23
	db $36, $d4, $23, $36, $6a, $f1, $c3, $f8, $03, $f5, $21, $1a, $c2, $36, $1a, $23
	db $36, $29, $23, $36, $6b, $f1, $c3, $f8, $03, $f5, $d5, $c5, $21, $1a, $c2, $36
	db $38, $23, $36, $13, $23, $36, $55, $c1, $d1, $f1, $cd, $f8, $03, $c9, $21, $1a
	db $c2, $36, $02, $23, $36, $3e, $23, $36, $5d, $cd, $f8, $03, $c9, $21, $1a, $c2
	db $36, $02, $23, $36, $4d, $23, $36, $5d, $cd, $f8, $03, $c9, $cd, $a8, $3a, $21
	db $1a, $c2, $36, $05, $23, $36, $71, $23, $36, $47, $3e, $07, $cd, $f8, $03, $e5
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $e1
	db $7d, $c9, $f5, $fa, $be, $c7, $f8, $01, $be, $ca, $a1, $6b, $f8, $01, $7e, $cd
	db $fc, $14, $f8, $01, $7e, $ea, $be, $c7, $c1, $c9, $cd, $02, $15, $c9, $21, $1a
	db $c2, $36, $02, $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $c9, $e5, $21, $1a
	db $c2, $36, $02, $23, $36, $39, $23, $36, $7f, $d1, $3e, $25, $cd, $f8, $03, $c9
	db $d5, $c5, $f5, $21, $1a, $c2, $36, $38, $23, $36, $19, $23, $36, $76, $f1, $f8
	db $06, $4e, $f8, $00, $5e, $f8, $02, $6e, $67, $cd, $f8, $03, $c1, $c1, $c9, $f5
	db $21, $1a, $c2, $36, $02, $23, $36, $46, $23, $36, $7f, $f1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $02, $23, $36, $5f, $23, $36, $76, $cd, $f8, $03, $c9, $21
	db $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76, $cd, $f8, $03, $c9, $e5, $21
	db $1a, $c2, $36, $26, $23, $36, $bb, $23, $36, $61, $e1, $cd, $f8, $03, $c9, $e5
	db $21, $1a, $c2, $36, $26, $23, $36, $8c, $23, $36, $62, $e1, $cd, $f8, $03, $c9
	db $e5, $21, $1a, $c2, $36, $24, $23, $36, $70, $23, $36, $73, $e1, $cd, $f8, $03
	db $c9, $e5, $e8, $9a, $21, $1a, $c2, $36, $00, $23, $36, $11, $23, $36, $1c, $f8
	db $00, $d5, $e5, $d1, $e1, $21, $66, $00, $cd, $f8, $03, $21, $1a, $c2, $36, $00
	db $23, $36, $27, $23, $36, $1c, $f8, $00, $e5, $cd, $48, $38, $6a, $d1, $cd, $f8
	db $03, $d5, $e5, $d1, $e1, $e8, $68, $d5, $e5, $d1, $e1, $c9, $f5, $21, $1a, $c2
	db $36, $0c, $23, $36, $c3, $23, $36, $73, $f1, $cd, $f8, $03, $c9, $f5, $2e, $00
	db $7d, $fe, $08, $d2, $bd, $6c, $e5, $af, $f8, $03, $be, $d2, $b0, $6c, $f5, $cd
	db $65, $04, $f1, $3c, $c3, $a1, $6c, $e1, $e5, $3e, $07, $95, $cd, $d0, $1a, $e1
	db $2c, $c3, $99, $6c, $c1, $c9, $f5, $af, $fe, $08, $d2, $e1, $6c, $f5, $af, $f8
	db $03, $be, $d2, $d7, $6c, $f5, $cd, $65, $04, $f1, $3c, $c3, $c8, $6c, $f1, $f5
	db $cd, $d0, $1a, $f1, $3c, $c3, $c1, $6c, $c1, $c9, $f5, $21, $1a, $c2, $36, $1a
	db $23, $36, $47, $23, $36, $6e, $f1, $cd, $f8, $03, $c9, $21, $1a, $c2, $36, $1a
	db $23, $36, $44, $23, $36, $6c, $cd, $f8, $03, $fe, $ff, $c2, $16, $6d, $21, $1a
	db $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $c9, $21, $1a
	db $c2, $36, $1a, $23, $36, $1a, $23, $36, $73, $cd, $f8, $03, $c9, $e5, $d5, $21
	db $1a, $c2, $36, $31, $23, $36, $6a, $23, $36, $79, $d1, $e1, $cd, $f8, $03, $c9
	db $21, $1a, $c2, $36, $14, $23, $36, $6e, $23, $36, $7b, $cd, $f8, $03, $c9, $f5
	db $21, $1a, $c2, $36, $3e, $23, $36, $5f, $23, $36, $75, $f1, $cd, $f8, $03, $c9
	db $0b, $0f, $05, $01, $1e, $00, $0c, $0b, $0b, $0b, $2e, $09, $04, $01, $01, $0c
	db $01, $09, $2c, $09, $2b, $2e, $0b, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b
	db $2e, $0d, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e, $0f, $04, $01, $01
	db $0c, $01, $09, $2c, $09, $2b, $2e, $11, $04, $01, $01, $0c, $01, $09, $2c, $09
	db $2b, $2e, $3b, $03, $ff, $ff, $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, $25
	db $04, $65, $9b, $6d, $ff, $00, $10, $0e, $01, $01, $00, $04, $00, $25, $04, $65
	db $9b, $6d
ENDC

Func_96dbb:: ; 96dbb
	db $1e, $06, $21, $59, $6d, $cd, $df, $5c, $1e, $02, $21, $9f, $6d, $cd, $a0, $5d
	db $3e, $0a, $cd, $8b, $6b, $3e, $04, $cd, $6b, $69, $cd, $c1, $5c, $c9, $08, $2c
	db $03, $01, $0c, $00, $0d, $04, $0d, $05, $2e, $09, $03, $01, $01, $0c, $02, $1c
	db $0a, $1b, $0a, $2e, $9f, $04, $ff, $ff, $a2, $04, $ff, $ff, $a3, $04, $ff, $ff
	db $a4, $04, $ff, $ff, $a5, $04, $ff, $ff, $a6, $04, $ff, $ff, $a7, $04, $ff, $ff
	db $08, $04, $07, $12, $01, $01, $02, $04, $00, $25, $2b, $6f, $00, $00, $08, $04
	db $03, $1e, $01, $01, $02, $04, $00, $25, $04, $65, $f3, $6d, $08, $04, $04, $1e
	db $01, $01, $02, $04, $00, $25, $04, $65, $f7, $6d, $08, $04, $05, $14, $01, $01
	db $02, $04, $00, $25, $04, $65, $fb, $6d, $08, $04, $06, $14, $01, $01, $02, $04
	db $00, $25, $04, $65, $ff, $6d, $08, $04, $0d, $19, $01, $01, $02, $04, $00, $25
	db $04, $65, $03, $6e, $08, $04, $0e, $19, $01, $01, $02, $04, $00, $25, $04, $65
	db $07, $6e, $04, $0c, $09, $23, $01, $01, $02, $04, $00, $25, $00, $00, $00, $00
	db $ff, $00, $08, $24, $03, $01, $02, $04, $01, $25, $d8, $70, $00, $00, $04, $04
	db $07, $22, $01, $01, $01, $04, $00, $25, $a1, $65, $ef, $6d

Func_96e97:: ; 96e97
	db $2e, $00, $e5, $0e, $06, $1e, $0d, $3e, $02, $cd, $c9, $6b, $c1, $2e, $00, $e5
	db $0e, $06, $1e, $0d, $3e, $0b, $cd, $c9, $6b, $c1, $2e, $01, $e5, $0e, $03, $1e
	db $0b, $3e, $07, $cd, $c9, $6b, $c1, $2e, $01, $e5, $0e, $03, $1e, $0b, $3e, $0a
	db $cd, $c9, $6b, $c1, $2e, $01, $e5, $0e, $03, $1e, $0e, $3e, $01, $cd, $c9, $6b
	db $c1, $2e, $01, $e5, $0e, $03, $1e, $0e, $3e, $10, $cd, $c9, $6b, $c1, $1e, $02
	db $21, $d9, $6d, $cd, $df, $5c, $1e, $0a, $21, $0b, $6e, $cd, $a0, $5d, $21, $0e
	db $01, $cd, $d3, $62, $fe, $01, $c2, $11, $6f, $1e, $00, $3e, $07, $cd, $e2, $5d
	db $1e, $00, $3e, $08, $cd, $e2, $5d, $c3, $18, $6f, $1e, $00, $3e, $09, $cd, $e2
	db $5d, $3e, $07, $cd, $8b, $6b, $cd, $c1, $5c, $c9, $09, $12, $ff, $ff, $06, $13
	db $09, $12, $ff, $ff, $7b, $b7, $c2, $c9, $70, $af, $cd, $f0, $60, $21, $f4, $00
	db $cd, $5f, $61, $b7, $c2, $c3, $70, $21, $1e, $00, $cd, $34, $63, $fa, $38, $c8
	db $fe, $01, $c2, $60, $6f, $0e, $01, $11, $25, $6f, $3e, $25, $cd, $e3, $62, $cd
	db $b1, $5e, $af, $cd, $1c, $63, $c3, $71, $6f, $0e, $01, $11, $21, $6f, $3e, $25
	db $cd, $e3, $62, $cd, $b1, $5e, $af, $cd, $1c, $63, $21, $a1, $03, $cd, $3d, $61
	db $21, $1e, $00, $cd, $34, $63, $3e, $0a, $cd, $96, $6c, $af, $cd, $8b, $6b, $3e
	db $01, $cd, $bf, $6c, $3e, $0d, $cd, $8b, $6b, $af, $fe, $05, $d2, $a2, $6f, $f5
	db $1e, $01, $af, $cd, $c3, $6a, $f1, $3c, $c3, $91, $6f, $21, $1e, $00, $cd, $34
	db $63, $1e, $00, $3e, $01, $cd, $e2, $5d, $1e, $00, $3e, $02, $cd, $e2, $5d, $1e
	db $00, $3e, $03, $cd, $e2, $5d, $1e, $00, $3e, $04, $cd, $e2, $5d, $1e, $00, $3e
	db $05, $cd, $e2, $5d, $1e, $00, $3e, $06, $cd, $e2, $5d, $1e, $00, $3e, $07, $cd
	db $e2, $5d, $1e, $00, $3e, $08, $cd, $e2, $5d, $1e, $00, $3e, $09, $cd, $e2, $5d
	db $0e, $01, $1e, $0f, $3e, $24, $cd, $1b, $5e, $1e, $06, $3e, $09, $cd, $89, $5e
	db $cd, $7a, $5e, $0e, $01, $1e, $4f, $3e, $25, $cd, $1b, $5e, $1e, $06, $3e, $09
	db $cd, $89, $5e, $21, $68, $01, $cd, $34, $63, $3e, $68, $cd, $a3, $6b, $21, $1e
	db $00, $cd, $34, $63, $3e, $68, $cd, $a3, $6b, $21, $1e, $00, $cd, $34, $63, $3e
	db $68, $cd, $a3, $6b, $21, $1e, $00, $cd, $34, $63, $3e, $68, $cd, $a3, $6b, $cd
	db $7a, $5e, $cd, $30, $5e, $3e, $0a, $cd, $96, $6c, $af, $cd, $8b, $6b, $21, $1e
	db $00, $cd, $34, $63, $1e, $01, $3e, $03, $cd, $e2, $5d, $1e, $01, $3e, $04, $cd
	db $e2, $5d, $af, $fe, $05, $d2, $6c, $70, $f5, $1e, $01, $3e, $02, $cd, $c3, $6a
	db $f1, $3c, $c3, $5a, $70, $21, $1e, $00, $cd, $34, $63, $cd, $85, $5f, $3e, $01
	db $cd, $bf, $6c, $af, $cd, $8b, $6b, $3e, $16, $cd, $8b, $6b, $0e, $01, $1e, $02
	db $3e, $08, $cd, $1b, $5e, $cd, $7a, $5e, $cd, $30, $5e, $21, $22, $03, $cd, $3d
	db $61, $1e, $01, $3e, $01, $cd, $e2, $5d, $1e, $01, $3e, $02, $cd, $e2, $5d, $1e
	db $01, $3e, $05, $cd, $e2, $5d, $1e, $01, $3e, $06, $cd, $e2, $5d, $1e, $01, $3e
	db $09, $cd, $e2, $5d, $3e, $07, $cd, $8b, $6b, $c3, $c9, $70, $21, $03, $02, $cd
	db $3d, $61, $c9, $09, $22, $07, $22, $ff, $ff, $09, $24, $ff, $ff, $09, $26, $ff
	db $ff, $7b, $fe, $02, $c2, $4f, $71, $0e, $01, $11, $d0, $70, $3e, $25, $cd, $e3
	db $62, $cd, $b1, $5e, $af, $cd, $1c, $63, $3e, $18, $cd, $02, $6b, $b7, $ca, $36
	db $71, $21, $a0, $04, $cd, $4e, $61, $21, $1e, $00, $cd, $34, $63, $01, $ca, $70
	db $1e, $25, $3e, $07, $cd, $2d, $63, $cd, $b1, $5e, $21, $1e, $00, $cd, $34, $63
	db $1e, $01, $3e, $07, $cd, $3a, $5d, $1e, $01, $21, $0e, $01, $cd, $c0, $62, $2e
	db $24, $e5, $0e, $09, $1e, $01, $3e, $0c, $cd, $a4, $6a, $c1, $c3, $4f, $71, $21
	db $a1, $04, $cd, $4e, $61, $21, $1e, $00, $cd, $34, $63, $0e, $01, $11, $d4, $70
	db $3e, $25, $cd, $e3, $62, $cd, $b1, $5e, $c9, $01, $0a, $01, $01, $0c, $03, $03
	db $0e, $03, $0d, $2e, $1c, $0a, $01, $01, $0c, $01, $09, $03, $09, $04, $2e, $0f
	db $04, $07, $0e, $01, $01, $02, $04, $00, $25, $00, $00, $00, $00, $ff, $00, $07
	db $0e, $01, $01, $02, $04, $00, $25, $f5, $71, $00, $00, $03, $04, $09, $04, $01
	db $01, $02, $04, $00, $25, $11, $73, $00, $00, $03, $04, $10, $04, $01, $01, $02
	db $04, $00, $25, $79, $73, $00, $00, $03, $04, $17, $04, $01, $01, $02, $04, $00
	db $25, $e1, $73, $00, $00, $ff, $00, $09, $09, $01, $01, $02, $04, $01, $25, $20
	db $74, $00, $00, $ff, $00, $10, $09, $01, $01, $02, $04, $01, $25, $37, $74, $00
	db $00, $ff, $00, $17, $09, $01, $01, $02, $04, $01, $25, $4e, $74, $00, $00

Func_971d6:: ; 971d6
	db $1e, $02, $21, $50, $71, $cd, $df, $5c, $1e, $08, $21, $66, $71, $cd, $a0, $5d
	db $3e, $07, $cd, $8b, $6b, $1e, $00, $af, $cd, $e2, $5d, $cd, $c1, $5c, $c9, $7b
	db $b7, $c2, $e7, $72, $21, $db, $00, $cd, $d3, $62, $b7, $c2, $e1, $72, $3e, $5e
	db $cd, $a3, $6b, $0e, $02, $1e, $02, $3e, $08, $cd, $1b, $5e, $1e, $0e, $3e, $07
	db $cd, $89, $5e, $cd, $7a, $5e, $cd, $30, $5e, $3e, $28, $cd, $a3, $6b, $1e, $01
	db $af, $cd, $e2, $5d, $3e, $60, $cd, $a3, $6b, $1e, $03, $af, $cd, $3a, $5d, $1e
	db $00, $af, $cd, $3a, $5d, $1e, $01, $af, $cd, $3a, $5d, $1e, $02, $af, $cd, $3a
	db $5d, $1e, $03, $af, $cd, $3a, $5d, $1e, $00, $af, $cd, $3a, $5d, $1e, $01, $af
	db $cd, $3a, $5d, $1e, $02, $af, $cd, $3a, $5d, $3e, $0f, $cd, $96, $6c, $af, $cd
	db $8b, $6b, $3e, $01, $cd, $bf, $6c, $3e, $14, $cd, $8b, $6b, $af, $cd, $f0, $60
	db $21, $1e, $00, $cd, $34, $63, $0e, $02, $1e, $01, $af, $cd, $32, $6b, $1e, $01
	db $21, $db, $00, $cd, $c0, $62, $3e, $60, $cd, $a3, $6b, $1e, $03, $af, $cd, $3a
	db $5d, $1e, $00, $af, $cd, $3a, $5d, $1e, $01, $af, $cd, $3a, $5d, $1e, $02, $af
	db $cd, $3a, $5d, $1e, $03, $af, $cd, $3a, $5d, $1e, $00, $af, $cd, $3a, $5d, $1e
	db $01, $af, $cd, $3a, $5d, $1e, $02, $af, $cd, $3a, $5d, $3e, $0f, $cd, $96, $6c
	db $af, $cd, $8b, $6b, $3e, $01, $cd, $bf, $6c, $3e, $07, $cd, $8b, $6b, $af, $cd
	db $f0, $60, $1e, $00, $af, $cd, $e2, $5d, $c3, $e7, $72, $21, $5c, $01, $cd, $3d
	db $61, $c9, $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $3f, $03, $14
	db $02, $09, $00, $78, $40, $03, $14, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $f5, $7b, $b7, $c2, $46
	db $73, $f8, $01, $7e, $cd, $f0, $60, $21, $d8, $01, $cd, $5f, $61, $b7, $c2, $40
	db $73, $11, $48, $73, $21, $e8, $72, $cd, $78, $6a, $b7, $c2, $37, $73, $c3, $46
	db $73, $21, $e5, $02, $cd, $3d, $61, $c3, $46, $73, $21, $e4, $02, $cd, $3d, $61
	db $c1, $c9, $28, $b5, $dd, $c5, $c9, $ba, $29, $00, $00, $00, $00, $02, $00, $c5
	db $b3, $00, $00, $01, $01, $62, $04, $1e, $02, $03, $00, $78, $63, $04, $1e, $0d
	db $09, $0a, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $02, $f5, $7b, $b7, $c2, $ae, $73, $f8, $01, $7e, $cd, $f0, $60, $21
	db $d8, $01, $cd, $5f, $61, $b7, $c2, $a8, $73, $11, $b0, $73, $21, $50, $73, $cd
	db $78, $6a, $b7, $c2, $9f, $73, $c3, $ae, $73, $21, $e5, $02, $cd, $3d, $61, $c3
	db $ae, $73, $21, $e4, $02, $cd, $3d, $61, $c1, $c9, $28, $b5, $dd, $c5, $c9, $ba
	db $29, $00, $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $41, $05, $28
	db $02, $02, $05, $67, $50, $05, $28, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $f5, $7b, $b7, $c2, $16
	db $74, $f8, $01, $7e, $cd, $f0, $60, $21, $d8, $01, $cd, $5f, $61, $b7, $c2, $10
	db $74, $11, $18, $74, $21, $b8, $73, $cd, $78, $6a, $b7, $c2, $07, $74, $c3, $16
	db $74, $21, $e5, $02, $cd, $3d, $61, $c3, $16, $74, $21, $e4, $02, $cd, $3d, $61
	db $c1, $c9, $28, $b5, $dd, $c5, $c9, $ba, $29, $00, $7b, $fe, $02, $c2, $36, $74
	db $fa, $38, $c8, $b7, $c2, $36, $74, $21, $08, $03, $cd, $17, $6c, $c3, $36, $74
	db $c9, $7b, $fe, $02, $c2, $4d, $74, $fa, $38, $c8, $b7, $c2, $4d, $74, $21, $09
	db $03, $cd, $17, $6c, $c3, $4d, $74, $c9, $7b, $fe, $02, $c2, $64, $74, $fa, $38
	db $c8, $b7, $c2, $64, $74, $21, $0a, $03, $cd, $17, $6c, $c3, $64, $74, $c9, $03
	db $0e, $01, $01, $0c, $02, $01, $0a, $02, $0a, $2e, $22, $03, $03, $22, $03, $03
	db $00, $00, $00, $04, $02, $03, $01, $01, $03, $04, $00, $25, $82, $63, $70, $74

Func_97486:: ; 97486
	db $1e, $01, $21, $65, $74, $cd, $df, $5c, $1e, $01, $21, $73, $74, $cd, $8c, $69
	db $1e, $01, $21, $78, $74, $cd, $a0, $5d, $3e, $07, $cd, $8b, $6b, $cd, $c1, $5c
	db $c9

