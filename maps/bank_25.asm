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

Data_95c73:
	db $0a, $07, $09, $07, $ff, $ff

Func_95c79:: ; 95c79
	ld e, a ; 95C79 (25:5c79) -> 5F
	ld a, $01 ; 95C7A (25:5c7a) -> 3E 01
	scall ChangeSprite ; 95C7C (25:5c7c) -> CD C8 40
	ld e, $02 ; 95C7F (25:5c7f) -> 1E 02
	ld a, $01 ; 95C81 (25:5c81) -> 3E 01
	scall SpriteFace ; 95C83 (25:5c83) -> CD 95 40
	ld e, $01 ; 95C86 (25:5c86) -> 1E 01
	ld a, $01 ; 95C88 (25:5c88) -> 3E 01
	scall SetPersonVisibilityState ; 95C8A (25:5c8a) -> CD 3D 41
	ld bc, Data_95c73 ; 95C8D (25:5c8d) -> 01 73 5C
	ld e, $25 ; 95C90 (25:5c90) -> 1E 25
	ld a, $01 ; 95C92 (25:5c92) -> 3E 01
	scall MovePersonAndWait ; 95C94 (25:5c94) -> CD 88 46
	scall WaitNPCStep ; 95C97 (25:5c97) -> CD 0C 42
	ld e, $00 ; 95C9A (25:5c9a) -> 1E 00
	ld a, $01 ; 95C9C (25:5c9c) -> 3E 01
	scall SetPersonVisibilityState ; 95C9E (25:5c9e) -> CD 3D 41
	scall Func_80f02 ; 95CA1 (25:5ca1) -> CD 02 4F
	ret  ; 95CA4 (25:5ca4) -> C9

Func_95ca5:
	jpba_hli Func_50d85

Func_95cb3:
	jpba_hli GetZodiacSign

Func_95cc1:
	callba_hli Func_ae4d
	ret  ; 95CCF (25:5ccf) -> C9

Func_95cd0:
	callba_hli AllocateSpaceForWarps
	ret  ; 95CDE (25:5cde) -> C9

Func_95cdf:
	push hl ; 95CDF (25:5cdf) -> E5
	push bc ; 95CE0 (25:5ce0) -> C5
	push bc ; 95CE1 (25:5ce1) -> C5
	push bc ; 95CE2 (25:5ce2) -> C5
	push bc ; 95CE3 (25:5ce3) -> C5
	push bc ; 95CE4 (25:5ce4) -> C5
	push bc ; 95CE5 (25:5ce5) -> C5
	xor a ; 95CE6 (25:5ce6) -> AF
label_95ce7:
	cp e ; 95CE7 (25:5ce7) -> BB
	jp nc, label_95d22 ; 95CE8 (25:5ce8) -> D2 22 5D
	push de ; 95CEB (25:5ceb) -> D5
	push af ; 95CEC (25:5cec) -> F5
	ld l, a ; 95CED (25:5ced) -> 6F
	ld h, $00 ; 95CEE (25:5cee) -> 26 00
	ld e, l ; 95CF0 (25:5cf0) -> 5D
	ld d, h ; 95CF1 (25:5cf1) -> 54
	add hl, hl ; 95CF2 (25:5cf2) -> 29
	ld c, l ; 95CF3 (25:5cf3) -> 4D
	ld b, h ; 95CF4 (25:5cf4) -> 44
	add hl, hl ; 95CF5 (25:5cf5) -> 29
	add hl, hl ; 95CF6 (25:5cf6) -> 29
	add hl, de ; 95CF7 (25:5cf7) -> 19
	add hl, bc ; 95CF8 (25:5cf8) -> 09
	ld c, l ; 95CF9 (25:5cf9) -> 4D
	ld b, h ; 95CFA (25:5cfa) -> 44
	call GetHLAtSPPlusParam8 ; 95CFB (25:5cfb) -> CD 48 38
	ld [de], a ; 95CFE (25:5cfe) -> 12
	add hl, bc ; 95CFF (25:5cff) -> 09
	push de ; 95D00 (25:5d00) -> D5
	push hl ; 95D01 (25:5d01) -> E5
	pop de ; 95D02 (25:5d02) -> D1
	pop hl ; 95D03 (25:5d03) -> E1
	ld hl, sp+$04 ; 95D04 (25:5d04) -> F8 04
	ld bc, $000b ; 95D06 (25:5d06) -> 01 0B 00
	call CopyFromDEtoHL ; 95D09 (25:5d09) -> CD 7E 04
	set_farcall_addrs_hli LoadWarp
	ld hl, sp+$04 ; 95D17 (25:5d17) -> F8 04
	call FarCall ; 95D19 (25:5d19) -> CD F8 03
	pop af ; 95D1C (25:5d1c) -> F1
	inc a ; 95D1D (25:5d1d) -> 3C
	pop de ; 95D1E (25:5d1e) -> D1
	jp label_95ce7 ; 95D1F (25:5d1f) -> C3 E7 5C
label_95d22:
	add sp, $0e ; 95D22 (25:5d22) -> E8 0E
	ret  ; 95D24 (25:5d24) -> C9

Func_95d25:
	push af ; 95D25 (25:5d25) -> F5
	push de ; 95D26 (25:5d26) -> D5
	push bc ; 95D27 (25:5d27) -> C5
	set_farcall_addrs_hli Func_a60f
	pop bc ; 95D33 (25:5d33) -> C1
	pop de ; 95D34 (25:5d34) -> D1
	pop af ; 95D35 (25:5d35) -> F1
	call FarCall ; 95D36 (25:5d36) -> CD F8 03
	ret  ; 95D39 (25:5d39) -> C9

Func_95d3a:
	push af ; 95D3A (25:5d3a) -> F5
	push de ; 95D3B (25:5d3b) -> D5
	set_farcall_addrs_hli ChangePersonFacing
	pop de ; 95D47 (25:5d47) -> D1
	pop af ; 95D48 (25:5d48) -> F1
	call FarCall ; 95D49 (25:5d49) -> CD F8 03
	ldh a, [rLCDC] ; 95D4C (25:5d4c) -> F0 40
	and $80 ; 95D4E (25:5d4e) -> E6 80
	jp z, label_95d5c ; 95D50 (25:5d50) -> CA 5C 5D
	call NextOverworldFrame ; 95D53 (25:5d53) -> CD 65 04
	call NextOverworldFrame ; 95D56 (25:5d56) -> CD 65 04
	call NextOverworldFrame ; 95D59 (25:5d59) -> CD 65 04
label_95d5c:
	ret  ; 95D5C (25:5d5c) -> C9

Func_95d5d:
	push af ; 95D5D (25:5d5d) -> F5
	set_farcall_addrs_hli GetRobotSprite
	pop af ; 95D69 (25:5d69) -> F1
	jp FarCall ; 95D6A (25:5d6a) -> C3 F8 03

Func_95d6d:
	push af ; 95D6D (25:5d6d) -> F5
	push de ; 95D6E (25:5d6e) -> D5
	ld hl, sp+$00 ; 95D6F (25:5d6f) -> F8 00
	ld a, [hl] ; 95D71 (25:5d71) -> 7E
	ld hl, sp+$03 ; 95D72 (25:5d72) -> F8 03
	ld l, [hl] ; 95D74 (25:5d74) -> 6E
	ld h, $00 ; 95D75 (25:5d75) -> 26 00
	add hl, hl ; 95D77 (25:5d77) -> 29
	ld e, l ; 95D78 (25:5d78) -> 5D
	ld d, h ; 95D79 (25:5d79) -> 54
	add hl, hl ; 95D7A (25:5d7a) -> 29
	ld c, l ; 95D7B (25:5d7b) -> 4D
	ld b, h ; 95D7C (25:5d7c) -> 44
	add hl, hl ; 95D7D (25:5d7d) -> 29
	add hl, de ; 95D7E (25:5d7e) -> 19
	add hl, bc ; 95D7F (25:5d7f) -> 09
	push de ; 95D80 (25:5d80) -> D5
	push hl ; 95D81 (25:5d81) -> E5
	pop de ; 95D82 (25:5d82) -> D1
	pop hl ; 95D83 (25:5d83) -> E1
	call ReadHalfWordAt ; 95D84 (25:5d84) -> CD 75 38
	dw $c774
	add hl, de ; 95D89 (25:5d89) -> 19
	ld [hl], a ; 95D8A (25:5d8a) -> 77
	pop bc ; 95D8B (25:5d8b) -> C1
	pop bc ; 95D8C (25:5d8c) -> C1
	ret  ; 95D8D (25:5d8d) -> C9

Func_95d8e:
	push af ; 95D8E (25:5d8e) -> F5
	push de ; 95D8F (25:5d8f) -> D5
	set_farcall_addrs_hli CheckObjectsOccupyingSameTile
	pop de ; 95D9B (25:5d9b) -> D1
	pop af ; 95D9C (25:5d9c) -> F1
	jp FarCall ; 95D9D (25:5d9d) -> C3 F8 03

Func_95da0:
	push hl ; 95DA0 (25:5da0) -> E5
	add sp, $f2 ; 95DA1 (25:5da1) -> E8 F2
	xor a ; 95DA3 (25:5da3) -> AF
label_95da4:
	cp e ; 95DA4 (25:5da4) -> BB
	jp nc, label_95ddf ; 95DA5 (25:5da5) -> D2 DF 5D
	push de ; 95DA8 (25:5da8) -> D5
	push af ; 95DA9 (25:5da9) -> F5
	ld l, a ; 95DAA (25:5daa) -> 6F
	ld h, $00 ; 95DAB (25:5dab) -> 26 00
	add hl, hl ; 95DAD (25:5dad) -> 29
	ld e, l ; 95DAE (25:5dae) -> 5D
	ld d, h ; 95DAF (25:5daf) -> 54
	add hl, hl ; 95DB0 (25:5db0) -> 29
	ld c, l ; 95DB1 (25:5db1) -> 4D
	ld b, h ; 95DB2 (25:5db2) -> 44
	add hl, hl ; 95DB3 (25:5db3) -> 29
	add hl, de ; 95DB4 (25:5db4) -> 19
	add hl, bc ; 95DB5 (25:5db5) -> 09
	ld c, l ; 95DB6 (25:5db6) -> 4D
	ld b, h ; 95DB7 (25:5db7) -> 44
	call GetHLAtSPPlusParam8 ; 95DB8 (25:5db8) -> CD 48 38
	inc d ; 95DBB (25:5dbb) -> 14
	add hl, bc ; 95DBC (25:5dbc) -> 09
	push de ; 95DBD (25:5dbd) -> D5
	push hl ; 95DBE (25:5dbe) -> E5
	pop de ; 95DBF (25:5dbf) -> D1
	pop hl ; 95DC0 (25:5dc0) -> E1
	ld hl, sp+$04 ; 95DC1 (25:5dc1) -> F8 04
	ld bc, $000e ; 95DC3 (25:5dc3) -> 01 0E 00
	call CopyFromDEtoHL ; 95DC6 (25:5dc6) -> CD 7E 04
	set_farcall_addrs_hli LoadMapObject
	ld hl, sp+$04 ; 95DD4 (25:5dd4) -> F8 04
	call FarCall ; 95DD6 (25:5dd6) -> CD F8 03
	pop af ; 95DD9 (25:5dd9) -> F1
	inc a ; 95DDA (25:5dda) -> 3C
	pop de ; 95DDB (25:5ddb) -> D1
	jp label_95da4 ; 95DDC (25:5ddc) -> C3 A4 5D
label_95ddf:
	add sp, $10 ; 95DDF (25:5ddf) -> E8 10
	ret  ; 95DE1 (25:5de1) -> C9

Func_95de2:
	push af ; 95DE2 (25:5de2) -> F5
	push de ; 95DE3 (25:5de3) -> D5
	set_farcall_addrs_hli SetPersonVisibilityState
	pop de ; 95DEF (25:5def) -> D1
	pop af ; 95DF0 (25:5df0) -> F1
	call FarCall ; 95DF1 (25:5df1) -> CD F8 03
	ret  ; 95DF4 (25:5df4) -> C9

Func_95df5:
	push af ; 95DF5 (25:5df5) -> F5
	push de ; 95DF6 (25:5df6) -> D5
	set_farcall_addrs_hli Func_a580
	pop de ; 95E02 (25:5e02) -> D1
	pop af ; 95E03 (25:5e03) -> F1
	call FarCall ; 95E04 (25:5e04) -> CD F8 03
	ret  ; 95E07 (25:5e07) -> C9

Func_95e08:
	push hl ; 95E08 (25:5e08) -> E5
	push de ; 95E09 (25:5e09) -> D5
	set_farcall_addrs_hli Func_a5a4
	pop de ; 95E15 (25:5e15) -> D1
	pop hl ; 95E16 (25:5e16) -> E1
	call FarCall ; 95E17 (25:5e17) -> CD F8 03
	ret  ; 95E1A (25:5e1a) -> C9

Func_95e1b:
	push af ; 95E1B (25:5e1b) -> F5
	push de ; 95E1C (25:5e1c) -> D5
	push bc ; 95E1D (25:5e1d) -> C5
	set_farcall_addrs_hli LoadEmote
	pop bc ; 95E29 (25:5e29) -> C1
	pop de ; 95E2A (25:5e2a) -> D1
	pop af ; 95E2B (25:5e2b) -> F1
	call FarCall ; 95E2C (25:5e2c) -> CD F8 03
	ret  ; 95E2F (25:5e2f) -> C9

Func_95e30:
	callba_hli Func_da4fc
	callba_hli Func_9a87c
	ld a, [wLCDC] ; 95E4C (25:5e4c) -> FA 11 C2
	or $03 ; 95E4F (25:5e4f) -> F6 03
	ld [wLCDC], a ; 95E51 (25:5e51) -> EA 11 C2
	ld a, [wNextVBlankFlags] ; 95E54 (25:5e54) -> FA 03 C2
	or $06 ; 95E57 (25:5e57) -> F6 06
	ld [wNextVBlankFlags], a ; 95E59 (25:5e59) -> EA 03 C2
	ret  ; 95E5C (25:5e5c) -> C9

Func_95e5d:
	callba_hli Func_da4fc
	callba_hli Func_9a87c
	ret  ; 95E79 (25:5e79) -> C9

Func_95e7a:
	callba_hli Func_9a84a
	ret  ; 95E88 (25:5e88) -> C9

Func_95e89:
	push af ; 95E89 (25:5e89) -> F5
	push de ; 95E8A (25:5e8a) -> D5
	set_farcall_addrs_hli MoveEmote
	pop de ; 95E96 (25:5e96) -> D1
	pop af ; 95E97 (25:5e97) -> F1
	call FarCall ; 95E98 (25:5e98) -> CD F8 03
	ret  ; 95E9B (25:5e9b) -> C9

Func_95e9c:
	push af ; 95E9C (25:5e9c) -> F5
	push de ; 95E9D (25:5e9d) -> D5
	push bc ; 95E9E (25:5e9e) -> C5
	set_farcall_addrs_hli Func_b01b
	pop bc ; 95EAA (25:5eaa) -> C1
	pop de ; 95EAB (25:5eab) -> D1
	pop af ; 95EAC (25:5eac) -> F1
	call FarCall ; 95EAD (25:5ead) -> CD F8 03
	ret  ; 95EB0 (25:5eb0) -> C9

Func_95eb1:
	callba_hli Func_b3ab
	ret  ; 95EBF (25:5ebf) -> C9

Func_95ec0:
	push af ; 95EC0 (25:5ec0) -> F5
	callba_hli Func_da4dc
	callba_hli QueueMoveAnimScriptGFXUpdate
	set_farcall_addrs_hli NamingScreen__
	pop af ; 95EE8 (25:5ee8) -> F1
	call FarCall ; 95EE9 (25:5ee9) -> CD F8 03
	set_farcall_addrs_hli FadeInMap
	xor a ; 95EF7 (25:5ef7) -> AF
	call FarCall ; 95EF8 (25:5ef8) -> CD F8 03
	ret  ; 95EFB (25:5efb) -> C9

Func_95efc:
	callba_hli Func_14d93
	set_farcall_addrs_hli FadeInMap
	xor a ; 95F15 (25:5f15) -> AF
	call FarCall ; 95F16 (25:5f16) -> CD F8 03
	ret  ; 95F19 (25:5f19) -> C9

Func_95f1a:
	ld a, $03 ; 95F1A (25:5f1a) -> 3E 03
	ld [wc396End], a ; 95F1C (25:5f1c) -> EA 9A C3
	callba_hli ElevatorMenu
	ret  ; 95F2D (25:5f2d) -> C9

Func_95f2e:
	callba_hli Func_17470
	callba_hli MainMenuSubmenu_Warehouse
	callba_hli Func_17488
	set_farcall_addrs_hli FadeInMap
	xor a ; 95F63 (25:5f63) -> AF
	call FarCall ; 95F64 (25:5f64) -> CD F8 03
	ret  ; 95F67 (25:5f67) -> C9

Func_95f68:
	callba_hli AskRepairRobots
	callba_hli Func_8f44
	ret  ; 95F84 (25:5f84) -> C9

Func_95f85:
	callba_hli RepairRobots
	ret  ; 95F93 (25:5f93) -> C9

Func_95f94:
	push bc ; 95F94 (25:5f94) -> C5
	push hl ; 95F95 (25:5f95) -> E5
	ld hl, sp+$02 ; 95F96 (25:5f96) -> F8 02
	ld [hl], $01 ; 95F98 (25:5f98) -> 36 01
	pop hl ; 95F9A (25:5f9a) -> E1
	ld a, [wc793] ; 95F9B (25:5f9b) -> FA 93 C7
	or a ; 95F9E (25:5f9e) -> B7
	jp z, label_95fb2 ; 95F9F (25:5f9f) -> CA B2 5F
	ld a, [wc793] ; 95FA2 (25:5fa2) -> FA 93 C7
	cp $01 ; 95FA5 (25:5fa5) -> FE 01
	jp z, label_95fb2 ; 95FA7 (25:5fa7) -> CA B2 5F
	ld a, [wc793] ; 95FAA (25:5faa) -> FA 93 C7
	cp $03 ; 95FAD (25:5fad) -> FE 03
	jp nz, label_95fe6 ; 95FAF (25:5faf) -> C2 E6 5F
label_95fb2:
	push hl ; 95FB2 (25:5fb2) -> E5
	push de ; 95FB3 (25:5fb3) -> D5
	set_farcall_addrs_hli Func_bc6d
	pop de ; 95FBF (25:5fbf) -> D1
	pop hl ; 95FC0 (25:5fc0) -> E1
	ld c, e ; 95FC1 (25:5fc1) -> 4B
	ld b, d ; 95FC2 (25:5fc2) -> 42
	push de ; 95FC3 (25:5fc3) -> D5
	push hl ; 95FC4 (25:5fc4) -> E5
	pop de ; 95FC5 (25:5fc5) -> D1
	pop hl ; 95FC6 (25:5fc6) -> E1
	ld a, $25 ; 95FC7 (25:5fc7) -> 3E 25
	call FarCall ; 95FC9 (25:5fc9) -> CD F8 03
	or a ; 95FCC (25:5fcc) -> B7
	jp z, label_95fd7 ; 95FCD (25:5fcd) -> CA D7 5F
	ld hl, sp+$00 ; 95FD0 (25:5fd0) -> F8 00
	ld [hl], $00 ; 95FD2 (25:5fd2) -> 36 00
	jp label_95fe6 ; 95FD4 (25:5fd4) -> C3 E6 5F
label_95fd7:
	set_farcall_addrs_hli FadeInMap
	xor a ; 95FE2 (25:5fe2) -> AF
	call FarCall ; 95FE3 (25:5fe3) -> CD F8 03
label_95fe6:
	ld hl, sp+$00 ; 95FE6 (25:5fe6) -> F8 00
	ld a, [hl] ; 95FE8 (25:5fe8) -> 7E
	pop bc ; 95FE9 (25:5fe9) -> C1
	ret  ; 95FEA (25:5fea) -> C9

Func_95feb:
	push bc ; 95FEB (25:5feb) -> C5
	push hl ; 95FEC (25:5fec) -> E5
	ld hl, sp+$02 ; 95FED (25:5fed) -> F8 02
	ld [hl], $01 ; 95FEF (25:5fef) -> 36 01
	pop hl ; 95FF1 (25:5ff1) -> E1
	ld a, [wc793] ; 95FF2 (25:5ff2) -> FA 93 C7
	or a ; 95FF5 (25:5ff5) -> B7
	jp z, label_96009 ; 95FF6 (25:5ff6) -> CA 09 60
	ld a, [wc793] ; 95FF9 (25:5ff9) -> FA 93 C7
	cp $01 ; 95FFC (25:5ffc) -> FE 01
	jp z, label_96009 ; 95FFE (25:5ffe) -> CA 09 60
	ld a, [wc793] ; 96001 (25:6001) -> FA 93 C7
	cp $03 ; 96004 (25:6004) -> FE 03
	jp nz, label_9603d ; 96006 (25:6006) -> C2 3D 60
label_96009:
	push hl ; 96009 (25:6009) -> E5
	push de ; 9600A (25:600a) -> D5
	set_farcall_addrs_hli Func_bd5d
	pop de ; 96016 (25:6016) -> D1
	pop hl ; 96017 (25:6017) -> E1
	ld c, e ; 96018 (25:6018) -> 4B
	ld b, d ; 96019 (25:6019) -> 42
	push de ; 9601A (25:601a) -> D5
	push hl ; 9601B (25:601b) -> E5
	pop de ; 9601C (25:601c) -> D1
	pop hl ; 9601D (25:601d) -> E1
	ld a, $25 ; 9601E (25:601e) -> 3E 25
	call FarCall ; 96020 (25:6020) -> CD F8 03
	or a ; 96023 (25:6023) -> B7
	jp z, label_9602e ; 96024 (25:6024) -> CA 2E 60
	ld hl, sp+$00 ; 96027 (25:6027) -> F8 00
	ld [hl], $00 ; 96029 (25:6029) -> 36 00
	jp label_9603d ; 9602B (25:602b) -> C3 3D 60
label_9602e:
	set_farcall_addrs_hli FadeInMap
	xor a ; 96039 (25:6039) -> AF
	call FarCall ; 9603A (25:603a) -> CD F8 03
label_9603d:
	ld hl, sp+$00 ; 9603D (25:603d) -> F8 00
	ld a, [hl] ; 9603F (25:603f) -> 7E
	pop bc ; 96040 (25:6040) -> C1
	ret  ; 96041 (25:6041) -> C9

Func_96042:
	push bc ; 96042 (25:6042) -> C5
	push hl ; 96043 (25:6043) -> E5
	ld hl, sp+$02 ; 96044 (25:6044) -> F8 02
	ld [hl], $01 ; 96046 (25:6046) -> 36 01
	pop hl ; 96048 (25:6048) -> E1
	ld a, [wc793] ; 96049 (25:6049) -> FA 93 C7
	or a ; 9604C (25:604c) -> B7
	jp z, label_96060 ; 9604D (25:604d) -> CA 60 60
	ld a, [wc793] ; 96050 (25:6050) -> FA 93 C7
	cp $01 ; 96053 (25:6053) -> FE 01
	jp z, label_96060 ; 96055 (25:6055) -> CA 60 60
	ld a, [wc793] ; 96058 (25:6058) -> FA 93 C7
	cp $03 ; 9605B (25:605b) -> FE 03
	jp nz, label_96094 ; 9605D (25:605d) -> C2 94 60
label_96060:
	push hl ; 96060 (25:6060) -> E5
	push de ; 96061 (25:6061) -> D5
	set_farcall_addrs_hli Func_bce5
	pop de ; 9606D (25:606d) -> D1
	pop hl ; 9606E (25:606e) -> E1
	ld c, e ; 9606F (25:606f) -> 4B
	ld b, d ; 96070 (25:6070) -> 42
	push de ; 96071 (25:6071) -> D5
	push hl ; 96072 (25:6072) -> E5
	pop de ; 96073 (25:6073) -> D1
	pop hl ; 96074 (25:6074) -> E1
	ld a, $25 ; 96075 (25:6075) -> 3E 25
	call FarCall ; 96077 (25:6077) -> CD F8 03
	or a ; 9607A (25:607a) -> B7
	jp z, label_96085 ; 9607B (25:607b) -> CA 85 60
	ld hl, sp+$00 ; 9607E (25:607e) -> F8 00
	ld [hl], $00 ; 96080 (25:6080) -> 36 00
	jp label_96094 ; 96082 (25:6082) -> C3 94 60
label_96085:
	set_farcall_addrs_hli FadeInMap
	xor a ; 96090 (25:6090) -> AF
	call FarCall ; 96091 (25:6091) -> CD F8 03
label_96094:
	ld hl, sp+$00 ; 96094 (25:6094) -> F8 00
	ld a, [hl] ; 96096 (25:6096) -> 7E
	pop bc ; 96097 (25:6097) -> C1
	ret  ; 96098 (25:6098) -> C9

Func_96099:
	push bc ; 96099 (25:6099) -> C5
	push hl ; 9609A (25:609a) -> E5
	ld hl, sp+$02 ; 9609B (25:609b) -> F8 02
	ld [hl], $01 ; 9609D (25:609d) -> 36 01
	pop hl ; 9609F (25:609f) -> E1
	ld a, [wc793] ; 960A0 (25:60a0) -> FA 93 C7
	or a ; 960A3 (25:60a3) -> B7
	jp z, label_960b7 ; 960A4 (25:60a4) -> CA B7 60
	ld a, [wc793] ; 960A7 (25:60a7) -> FA 93 C7
	cp $01 ; 960AA (25:60aa) -> FE 01
	jp z, label_960b7 ; 960AC (25:60ac) -> CA B7 60
	ld a, [wc793] ; 960AF (25:60af) -> FA 93 C7
	cp $03 ; 960B2 (25:60b2) -> FE 03
	jp nz, label_960eb ; 960B4 (25:60b4) -> C2 EB 60
label_960b7:
	push hl ; 960B7 (25:60b7) -> E5
	push de ; 960B8 (25:60b8) -> D5
	set_farcall_addrs_hli Func_bdd5
	pop de ; 960C4 (25:60c4) -> D1
	pop hl ; 960C5 (25:60c5) -> E1
	ld c, e ; 960C6 (25:60c6) -> 4B
	ld b, d ; 960C7 (25:60c7) -> 42
	push de ; 960C8 (25:60c8) -> D5
	push hl ; 960C9 (25:60c9) -> E5
	pop de ; 960CA (25:60ca) -> D1
	pop hl ; 960CB (25:60cb) -> E1
	ld a, $25 ; 960CC (25:60cc) -> 3E 25
	call FarCall ; 960CE (25:60ce) -> CD F8 03
	or a ; 960D1 (25:60d1) -> B7
	jp z, label_960dc ; 960D2 (25:60d2) -> CA DC 60
	ld hl, sp+$00 ; 960D5 (25:60d5) -> F8 00
	ld [hl], $00 ; 960D7 (25:60d7) -> 36 00
	jp label_960eb ; 960D9 (25:60d9) -> C3 EB 60
label_960dc:
	set_farcall_addrs_hli FadeInMap
	xor a ; 960E7 (25:60e7) -> AF
	call FarCall ; 960E8 (25:60e8) -> CD F8 03
label_960eb:
	ld hl, sp+$00 ; 960EB (25:60eb) -> F8 00
	ld a, [hl] ; 960ED (25:60ed) -> 7E
	pop bc ; 960EE (25:60ee) -> C1
	ret  ; 960EF (25:60ef) -> C9

Func_960f0:
	push af ; 960F0 (25:60f0) -> F5
	set_farcall_addrs_hli FacePlayer
	pop af ; 960FC (25:60fc) -> F1
	call FarCall ; 960FD (25:60fd) -> CD F8 03
	ret  ; 96100 (25:6100) -> C9

Func_96101:
	callba_hli ReceptionCommandMenu
	callba_hli Func_8f44
	ret  ; 9611D (25:611d) -> C9

Func_9611e:
	callba_hli Func_53c88
	ret  ; 9612C (25:612c) -> C9

Func_9612d:
	push hl ; 9612D (25:612d) -> E5
	set_farcall_addrs_hli Func_6e1b
	pop hl ; 96139 (25:6139) -> E1
	jp FarCall ; 9613A (25:613a) -> C3 F8 03

Func_9613d:
	push hl ; 9613D (25:613d) -> E5
	set_farcall_addrs_hli PrintOverworldTextIndexUnadorned
	pop hl ; 96149 (25:6149) -> E1
	call FarCall ; 9614A (25:614a) -> CD F8 03
	ret  ; 9614D (25:614d) -> C9

Func_9614e:
	push hl ; 9614E (25:614e) -> E5
	set_farcall_addrs_hli PrintOverworldTextIndexWithNPCName
	pop hl ; 9615A (25:615a) -> E1
	call FarCall ; 9615B (25:615b) -> CD F8 03
	ret  ; 9615E (25:615e) -> C9

Func_9615f:
	push hl ; 9615F (25:615f) -> E5
	set_farcall_addrs_hli PrintOverworldTextIndexWithYesNoBox
	pop hl ; 9616B (25:616b) -> E1
	jp FarCall ; 9616C (25:616c) -> C3 F8 03

Func_9616f:
	push hl ; 9616F (25:616f) -> E5
	set_farcall_addrs_hli PrintOverworldTextIndexWithNPCNameAndYesNoBox
	pop hl ; 9617B (25:617b) -> E1
	jp FarCall ; 9617C (25:617c) -> C3 F8 03

Func_9617f:
	push hl ; 9617F (25:617f) -> E5
	set_farcall_addrs_hli malloc
	ld hl, $0154 ; 9618B (25:618b) -> 21 54 01
	call FarCall ; 9618E (25:618e) -> CD F8 03
	ld c, l ; 96191 (25:6191) -> 4D
	ld b, h ; 96192 (25:6192) -> 44
	pop hl ; 96193 (25:6193) -> E1
	push bc ; 96194 (25:6194) -> C5
	ld e, l ; 96195 (25:6195) -> 5D
	ld d, h ; 96196 (25:6196) -> 54
	ld l, c ; 96197 (25:6197) -> 69
	ld h, b ; 96198 (25:6198) -> 60
	call CopyUntilNull ; 96199 (25:6199) -> CD D7 26
	set_farcall_addrs_hli Func_ac35
	pop bc ; 961A7 (25:61a7) -> C1
	push bc ; 961A8 (25:61a8) -> C5
	ld l, c ; 961A9 (25:61a9) -> 69
	ld h, b ; 961AA (25:61aa) -> 60
	call FarCall ; 961AB (25:61ab) -> CD F8 03
	set_farcall_addrs_hli free
	pop hl ; 961B9 (25:61b9) -> E1
	call FarCall ; 961BA (25:61ba) -> CD F8 03
	ret  ; 961BD (25:61bd) -> C9

Func_961be:
	push bc ; 961BE (25:61be) -> C5
	push bc ; 961BF (25:61bf) -> C5
	push bc ; 961C0 (25:61c0) -> C5
	push bc ; 961C1 (25:61c1) -> C5
	push bc ; 961C2 (25:61c2) -> C5
	push hl ; 961C3 (25:61c3) -> E5
	push de ; 961C4 (25:61c4) -> D5
	set_farcall_addrs_hli malloc
	ld hl, $0154 ; 961D0 (25:61d0) -> 21 54 01
	call FarCall ; 961D3 (25:61d3) -> CD F8 03
	ld c, l ; 961D6 (25:61d6) -> 4D
	ld b, h ; 961D7 (25:61d7) -> 44
	pop de ; 961D8 (25:61d8) -> D1
	push bc ; 961D9 (25:61d9) -> C5
	ld l, c ; 961DA (25:61da) -> 69
	ld h, b ; 961DB (25:61db) -> 60
	call CopyUntilNull ; 961DC (25:61dc) -> CD D7 26
	pop bc ; 961DF (25:61df) -> C1
	pop hl ; 961E0 (25:61e0) -> E1
	push bc ; 961E1 (25:61e1) -> C5
	push de ; 961E2 (25:61e2) -> D5
	push hl ; 961E3 (25:61e3) -> E5
	pop de ; 961E4 (25:61e4) -> D1
	pop hl ; 961E5 (25:61e5) -> E1
	ld hl, sp+$02 ; 961E6 (25:61e6) -> F8 02
	call CopyUntilNull ; 961E8 (25:61e8) -> CD D7 26
	set_farcall_addrs_hli Func_ac36
	pop bc ; 961F6 (25:61f6) -> C1
	push bc ; 961F7 (25:61f7) -> C5
	ld e, c ; 961F8 (25:61f8) -> 59
	ld d, b ; 961F9 (25:61f9) -> 50
	ld hl, sp+$02 ; 961FA (25:61fa) -> F8 02
	call FarCall ; 961FC (25:61fc) -> CD F8 03
	set_farcall_addrs_hli free
	pop hl ; 9620A (25:620a) -> E1
	call FarCall ; 9620B (25:620b) -> CD F8 03
	pop bc ; 9620E (25:620e) -> C1
	pop bc ; 9620F (25:620f) -> C1
	pop bc ; 96210 (25:6210) -> C1
	pop bc ; 96211 (25:6211) -> C1
	pop bc ; 96212 (25:6212) -> C1
	ret  ; 96213 (25:6213) -> C9

Func_96214:
	push hl ; 96214 (25:6214) -> E5
	set_farcall_addrs_hli malloc
	ld hl, $0154 ; 96220 (25:6220) -> 21 54 01
	call FarCall ; 96223 (25:6223) -> CD F8 03
	ld c, l ; 96226 (25:6226) -> 4D
	ld b, h ; 96227 (25:6227) -> 44
	pop hl ; 96228 (25:6228) -> E1
	push bc ; 96229 (25:6229) -> C5
	ld e, l ; 9622A (25:622a) -> 5D
	ld d, h ; 9622B (25:622b) -> 54
	ld l, c ; 9622C (25:622c) -> 69
	ld h, b ; 9622D (25:622d) -> 60
	call CopyUntilNull ; 9622E (25:622e) -> CD D7 26
	set_farcall_addrs_hli Func_ac9b
	pop bc ; 9623C (25:623c) -> C1
	push bc ; 9623D (25:623d) -> C5
	ld l, c ; 9623E (25:623e) -> 69
	ld h, b ; 9623F (25:623f) -> 60
	call FarCall ; 96240 (25:6240) -> CD F8 03
	pop bc ; 96243 (25:6243) -> C1
	push af ; 96244 (25:6244) -> F5
	push bc ; 96245 (25:6245) -> C5
	set_farcall_addrs_hli free
	pop hl ; 96251 (25:6251) -> E1
	call FarCall ; 96252 (25:6252) -> CD F8 03
	pop af ; 96255 (25:6255) -> F1
	ret  ; 96256 (25:6256) -> C9

Func_96257:
	push bc ; 96257 (25:6257) -> C5
	push bc ; 96258 (25:6258) -> C5
	push bc ; 96259 (25:6259) -> C5
	push bc ; 9625A (25:625a) -> C5
	push bc ; 9625B (25:625b) -> C5
	push hl ; 9625C (25:625c) -> E5
	push de ; 9625D (25:625d) -> D5
	set_farcall_addrs_hli malloc
	ld hl, $0154 ; 96269 (25:6269) -> 21 54 01
	call FarCall ; 9626C (25:626c) -> CD F8 03
	ld c, l ; 9626F (25:626f) -> 4D
	ld b, h ; 96270 (25:6270) -> 44
	pop de ; 96271 (25:6271) -> D1
	push bc ; 96272 (25:6272) -> C5
	ld l, c ; 96273 (25:6273) -> 69
	ld h, b ; 96274 (25:6274) -> 60
	call CopyUntilNull ; 96275 (25:6275) -> CD D7 26
	pop bc ; 96278 (25:6278) -> C1
	pop hl ; 96279 (25:6279) -> E1
	push bc ; 9627A (25:627a) -> C5
	push de ; 9627B (25:627b) -> D5
	push hl ; 9627C (25:627c) -> E5
	pop de ; 9627D (25:627d) -> D1
	pop hl ; 9627E (25:627e) -> E1
	ld hl, sp+$02 ; 9627F (25:627f) -> F8 02
	call CopyUntilNull ; 96281 (25:6281) -> CD D7 26
	set_farcall_addrs_hli Func_aca4
	pop bc ; 9628F (25:628f) -> C1
	push bc ; 96290 (25:6290) -> C5
	ld e, c ; 96291 (25:6291) -> 59
	ld d, b ; 96292 (25:6292) -> 50
	ld hl, sp+$02 ; 96293 (25:6293) -> F8 02
	call FarCall ; 96295 (25:6295) -> CD F8 03
	pop bc ; 96298 (25:6298) -> C1
	push af ; 96299 (25:6299) -> F5
	push bc ; 9629A (25:629a) -> C5
	set_farcall_addrs_hli free
	pop hl ; 962A6 (25:62a6) -> E1
	call FarCall ; 962A7 (25:62a7) -> CD F8 03
	pop af ; 962AA (25:62aa) -> F1
	pop bc ; 962AB (25:62ab) -> C1
	pop bc ; 962AC (25:62ac) -> C1
	pop bc ; 962AD (25:62ad) -> C1
	pop bc ; 962AE (25:62ae) -> C1
	pop bc ; 962AF (25:62af) -> C1
	ret  ; 962B0 (25:62b0) -> C9

Func_962b1:
	callba_hli Func_ac37
	ret  ; 962BF (25:62bf) -> C9

Func_962c0:
	push hl ; 962C0 (25:62c0) -> E5
	push de ; 962C1 (25:62c1) -> D5
	set_farcall_addrs_hli EventFlagAction
	pop de ; 962CD (25:62cd) -> D1
	pop hl ; 962CE (25:62ce) -> E1
	call FarCall ; 962CF (25:62cf) -> CD F8 03
	ret  ; 962D2 (25:62d2) -> C9

Func_962d3:
	push hl ; 962D3 (25:62d3) -> E5
	set_farcall_addrs_hli CheckEventFlag
	pop hl ; 962DF (25:62df) -> E1
	jp FarCall ; 962E0 (25:62e0) -> C3 F8 03

Func_962e3:
	push af ; 962E3 (25:62e3) -> F5
	push de ; 962E4 (25:62e4) -> D5
	push bc ; 962E5 (25:62e5) -> C5
	set_farcall_addrs_hli StartMovement
	pop bc ; 962F1 (25:62f1) -> C1
	pop de ; 962F2 (25:62f2) -> D1
	pop af ; 962F3 (25:62f3) -> F1
	call FarCall ; 962F4 (25:62f4) -> CD F8 03
	ret  ; 962F7 (25:62f7) -> C9

Func_962f8:
	push af ; 962F8 (25:62f8) -> F5
	set_farcall_addrs_hli Func_b52c
	pop af ; 96304 (25:6304) -> F1
	call FarCall ; 96305 (25:6305) -> CD F8 03
	ret  ; 96308 (25:6308) -> C9

Func_96309:
	push af ; 96309 (25:6309) -> F5
	push de ; 9630A (25:630a) -> D5
	set_farcall_addrs_hli SpawnPlayerAt
	pop de ; 96316 (25:6316) -> D1
	pop af ; 96317 (25:6317) -> F1
	call FarCall ; 96318 (25:6318) -> CD F8 03
	ret  ; 9631B (25:631b) -> C9

Func_9631c:
	push af ; 9631C (25:631c) -> F5
	set_farcall_addrs_hli Func_b58e
	pop af ; 96328 (25:6328) -> F1
	call FarCall ; 96329 (25:6329) -> CD F8 03
	ret  ; 9632C (25:632c) -> C9

Func_9632d:
	call Func_95e9c ; 9632D (25:632d) -> CD 9C 5E
	call Func_95eb1 ; 96330 (25:6330) -> CD B1 5E
	ret  ; 96333 (25:6333) -> C9

Func_96334:
	push hl ; 96334 (25:6334) -> E5
	set_farcall_addrs_hli Func_b5db
	pop hl ; 96340 (25:6340) -> E1
	call FarCall ; 96341 (25:6341) -> CD F8 03
	ret  ; 96344 (25:6344) -> C9

Func_96345:
	push de ; 96345 (25:6345) -> D5
	ld [wCurShop], a ; 96346 (25:6346) -> EA F8 C2
	set_farcall_addrs_hli Func_30348
	pop de ; 96354 (25:6354) -> D1
	push de ; 96355 (25:6355) -> D5
	ld a, e ; 96356 (25:6356) -> 7B
	call FarCall ; 96357 (25:6357) -> CD F8 03
	pop de ; 9635A (25:635a) -> D1
	ld a, e ; 9635B (25:635b) -> 7B
	cp $03 ; 9635C (25:635c) -> FE 03
	jp c, label_96373 ; 9635E (25:635e) -> DA 73 63
	set_farcall_addrs_hli FadeInMap
	xor a ; 9636C (25:636c) -> AF
	call FarCall ; 9636D (25:636d) -> CD F8 03
	jp label_96381 ; 96370 (25:6370) -> C3 81 63
label_96373:
	callba_hli Func_8f44
label_96381:
	ret  ; 96381 (25:6381) -> C9

Func_96382:
	push af ; 96382 (25:6382) -> F5
	push bc ; 96383 (25:6383) -> C5
	push de ; 96384 (25:6384) -> D5
	ld hl, sp+$05 ; 96385 (25:6385) -> F8 05
	ld l, [hl] ; 96387 (25:6387) -> 6E
	ld h, $00 ; 96388 (25:6388) -> 26 00
	add hl, hl ; 9638A (25:638a) -> 29
	ld e, l ; 9638B (25:638b) -> 5D
	ld d, h ; 9638C (25:638c) -> 54
	add hl, hl ; 9638D (25:638d) -> 29
	ld c, l ; 9638E (25:638e) -> 4D
	ld b, h ; 9638F (25:638f) -> 44
	add hl, hl ; 96390 (25:6390) -> 29
	add hl, de ; 96391 (25:6391) -> 19
	add hl, bc ; 96392 (25:6392) -> 09
	push de ; 96393 (25:6393) -> D5
	push hl ; 96394 (25:6394) -> E5
	pop de ; 96395 (25:6395) -> D1
	pop hl ; 96396 (25:6396) -> E1
	call ReadHalfWordAt ; 96397 (25:6397) -> CD 75 38
	dw $c774 ; 9639B (25:639b) -> C7
	add hl, de ; 9639C (25:639c) -> 19
	ld de, $000c ; 9639D (25:639d) -> 11 0C 00
	add hl, de ; 963A0 (25:63a0) -> 19
	ld a, [hl] ; 963A1 (25:63a1) -> 7E
	inc hl ; 963A2 (25:63a2) -> 23
	ld h, [hl] ; 963A3 (25:63a3) -> 66
	ld l, a ; 963A4 (25:63a4) -> 6F
	call WriteHLToSPPlus4 ; 963A5 (25:63a5) -> CD 97 37
	pop de ; 963A8 (25:63a8) -> D1
	ld a, e ; 963A9 (25:63a9) -> 7B
	or a ; 963AA (25:63aa) -> B7
	jp nz, label_9643b ; 963AB (25:63ab) -> C2 3B 64
	ld a, [wPlayerFacing] ; 963AE (25:63ae) -> FA 38 C8
	add a, $02 ; 963B1 (25:63b1) -> C6 02
	and $03 ; 963B3 (25:63b3) -> E6 03
	ld e, a ; 963B5 (25:63b5) -> 5F
	ld hl, sp+$03 ; 963B6 (25:63b6) -> F8 03
	ld a, [hl] ; 963B8 (25:63b8) -> 7E
	call Func_95d3a ; 963B9 (25:63b9) -> CD 3A 5D
	ld hl, $00c8 ; 963BC (25:63bc) -> 21 C8 00
	call Func_962d3 ; 963BF (25:63bf) -> CD D3 62
	or a ; 963C2 (25:63c2) -> B7
	jp nz, label_963d7 ; 963C3 (25:63c3) -> C2 D7 63
	ld hl, $036d ; 963C6 (25:63c6) -> 21 6D 03
	call Func_9614e ; 963C9 (25:63c9) -> CD 4E 61
	ld e, $01 ; 963CC (25:63cc) -> 1E 01
	ld hl, $00c8 ; 963CE (25:63ce) -> 21 C8 00
	call Func_962c0 ; 963D1 (25:63d1) -> CD C0 62
	jp label_9643b ; 963D4 (25:63d4) -> C3 3B 64
label_963d7:
	pop hl ; 963D7 (25:63d7) -> E1
	push hl ; 963D8 (25:63d8) -> E5
	ld l, [hl] ; 963D9 (25:63d9) -> 6E
	ld h, $00 ; 963DA (25:63da) -> 26 00
	ld de, $0008 ; 963DC (25:63dc) -> 11 08 00
	call DivideHLByDESigned ; 963DF (25:63df) -> CD C6 36
	ld de, $c7c5 ; 963E2 (25:63e2) -> 11 C5 C7
	add hl, de ; 963E5 (25:63e5) -> 19
	ld c, [hl] ; 963E6 (25:63e6) -> 4E
	pop hl ; 963E7 (25:63e7) -> E1
	push hl ; 963E8 (25:63e8) -> E5
	ld a, [hl] ; 963E9 (25:63e9) -> 7E
	and $07 ; 963EA (25:63ea) -> E6 07
	ld b, a ; 963EC (25:63ec) -> 47
	ld a, $01 ; 963ED (25:63ed) -> 3E 01
	call LeftShiftA ; 963EF (25:63ef) -> CD 45 36
	and c ; 963F2 (25:63f2) -> A1
	jp z, label_963ff ; 963F3 (25:63f3) -> CA FF 63
	ld hl, $0374 ; 963F6 (25:63f6) -> 21 74 03
	call Func_9614e ; 963F9 (25:63f9) -> CD 4E 61
	jp label_9643b ; 963FC (25:63fc) -> C3 3B 64
label_963ff:
	ld hl, $036e ; 963FF (25:63ff) -> 21 6E 03
	call Func_9616f ; 96402 (25:6402) -> CD 6F 61
	or a ; 96405 (25:6405) -> B7
	jp nz, label_9643b ; 96406 (25:6406) -> C2 3B 64
	set_farcall_addrs_hli Func_9ace0
	pop hl ; 96414 (25:6414) -> E1
	push hl ; 96415 (25:6415) -> E5
	inc hl ; 96416 (25:6416) -> 23
	inc hl ; 96417 (25:6417) -> 23
	ld c, [hl] ; 96418 (25:6418) -> 4E
	pop hl ; 96419 (25:6419) -> E1
	push hl ; 9641A (25:641a) -> E5
	ld a, [hl] ; 9641B (25:641b) -> 7E
	pop hl ; 9641C (25:641c) -> E1
	push hl ; 9641D (25:641d) -> E5
	inc hl ; 9641E (25:641e) -> 23
	ld e, [hl] ; 9641F (25:641f) -> 5E
	call FarCall ; 96420 (25:6420) -> CD F8 03
	cp $02 ; 96423 (25:6423) -> FE 02
	jp nz, label_96431 ; 96425 (25:6425) -> C2 31 64
	ld hl, $0371 ; 96428 (25:6428) -> 21 71 03
	call Func_9613d ; 9642B (25:642b) -> CD 3D 61
	jp label_9643b ; 9642E (25:642e) -> C3 3B 64
label_96431:
	or a ; 96431 (25:6431) -> B7
	jp nz, label_9643b ; 96432 (25:6432) -> C2 3B 64
	ld hl, $047c ; 96435 (25:6435) -> 21 7C 04
	call Func_9613d ; 96438 (25:6438) -> CD 3D 61
label_9643b:
	pop bc ; 9643B (25:643b) -> C1
	pop bc ; 9643C (25:643c) -> C1
	ret  ; 9643D (25:643d) -> C9

Func_9643e:
	push af ; 9643E (25:643e) -> F5
	push bc ; 9643F (25:643f) -> C5
	push de ; 96440 (25:6440) -> D5
	ld hl, sp+$05 ; 96441 (25:6441) -> F8 05
	ld l, [hl] ; 96443 (25:6443) -> 6E
	ld h, $00 ; 96444 (25:6444) -> 26 00
	add hl, hl ; 96446 (25:6446) -> 29
	ld e, l ; 96447 (25:6447) -> 5D
	ld d, h ; 96448 (25:6448) -> 54
	add hl, hl ; 96449 (25:6449) -> 29
	ld c, l ; 9644A (25:644a) -> 4D
	ld b, h ; 9644B (25:644b) -> 44
	add hl, hl ; 9644C (25:644c) -> 29
	add hl, de ; 9644D (25:644d) -> 19
	add hl, bc ; 9644E (25:644e) -> 09
	push de ; 9644F (25:644f) -> D5
	push hl ; 96450 (25:6450) -> E5
	pop de ; 96451 (25:6451) -> D1
	pop hl ; 96452 (25:6452) -> E1
	call ReadHalfWordAt ; 96453 (25:6453) -> CD 75 38
	dw $c774 ; 96457 (25:6457) -> C7
	add hl, de ; 96458 (25:6458) -> 19
	ld de, $000c ; 96459 (25:6459) -> 11 0C 00
	add hl, de ; 9645C (25:645c) -> 19
	ld c, [hl] ; 9645D (25:645d) -> 4E
	inc hl ; 9645E (25:645e) -> 23
	ld b, [hl] ; 9645F (25:645f) -> 46
	pop de ; 96460 (25:6460) -> D1
	ld a, e ; 96461 (25:6461) -> 7B
	or a ; 96462 (25:6462) -> B7
	jp nz, label_96501 ; 96463 (25:6463) -> C2 01 65
	push bc ; 96466 (25:6466) -> C5
	ld a, [wPlayerFacing] ; 96467 (25:6467) -> FA 38 C8
	add a, $02 ; 9646A (25:646a) -> C6 02
	and $03 ; 9646C (25:646c) -> E6 03
	ld e, a ; 9646E (25:646e) -> 5F
	ld hl, sp+$05 ; 9646F (25:646f) -> F8 05
	ld a, [hl] ; 96471 (25:6471) -> 7E
	call Func_95d3a ; 96472 (25:6472) -> CD 3A 5D
	ld hl, sp+$05 ; 96475 (25:6475) -> F8 05
	ld l, [hl] ; 96477 (25:6477) -> 6E
	ld h, $00 ; 96478 (25:6478) -> 26 00
	add hl, hl ; 9647A (25:647a) -> 29
	add hl, hl ; 9647B (25:647b) -> 29
	push de ; 9647C (25:647c) -> D5
	push hl ; 9647D (25:647d) -> E5
	pop de ; 9647E (25:647e) -> D1
	pop hl ; 9647F (25:647f) -> E1
	call ReadHalfWordAt ; 96480 (25:6480) -> CD 75 38
	dw $c776 ; 96484 (25:6484) -> C7
	add hl, de ; 96485 (25:6485) -> 19
	inc hl ; 96486 (25:6486) -> 23
	inc hl ; 96487 (25:6487) -> 23
	ld e, [hl] ; 96488 (25:6488) -> 5E
	ld hl, sp+$02 ; 96489 (25:6489) -> F8 02
	ld [hl], e ; 9648B (25:648b) -> 73
label_9648c:
	ld hl, sp+$05 ; 9648C (25:648c) -> F8 05
	ld l, [hl] ; 9648E (25:648e) -> 6E
	ld h, $00 ; 9648F (25:648f) -> 26 00
	add hl, hl ; 96491 (25:6491) -> 29
	ld e, l ; 96492 (25:6492) -> 5D
	ld d, h ; 96493 (25:6493) -> 54
	add hl, hl ; 96494 (25:6494) -> 29
	ld c, l ; 96495 (25:6495) -> 4D
	ld b, h ; 96496 (25:6496) -> 44
	add hl, hl ; 96497 (25:6497) -> 29
	add hl, de ; 96498 (25:6498) -> 19
	add hl, bc ; 96499 (25:6499) -> 09
	push de ; 9649A (25:649a) -> D5
	push hl ; 9649B (25:649b) -> E5
	pop de ; 9649C (25:649c) -> D1
	pop hl ; 9649D (25:649d) -> E1
	call ReadHalfWordAt ; 9649E (25:649e) -> CD 75 38
	dw $c774
	add hl, de ; 964A3 (25:64a3) -> 19
	ld de, $000c ; 964A4 (25:64a4) -> 11 0C 00
	add hl, de ; 964A7 (25:64a7) -> 19
	ld e, [hl] ; 964A8 (25:64a8) -> 5E
	inc hl ; 964A9 (25:64a9) -> 23
	ld d, [hl] ; 964AA (25:64aa) -> 56
	ld hl, sp+$02 ; 964AB (25:64ab) -> F8 02
	ld l, [hl] ; 964AD (25:64ad) -> 6E
	ld h, $00 ; 964AE (25:64ae) -> 26 00
	add hl, hl ; 964B0 (25:64b0) -> 29
	add hl, de ; 964B1 (25:64b1) -> 19
	ld a, [hl] ; 964B2 (25:64b2) -> 7E
	inc hl ; 964B3 (25:64b3) -> 23
	or [hl] ; 964B4 (25:64b4) -> B6
	jp nz, label_964bf ; 964B5 (25:64b5) -> C2 BF 64
	ld hl, sp+$02 ; 964B8 (25:64b8) -> F8 02
	ld [hl], $fe ; 964BA (25:64ba) -> 36 FE
	jp label_964c2 ; 964BC (25:64bc) -> C3 C2 64
label_964bf:
	jp label_964cd ; 964BF (25:64bf) -> C3 CD 64
label_964c2:
	ld hl, sp+$02 ; 964C2 (25:64c2) -> F8 02
	ld a, [hl] ; 964C4 (25:64c4) -> 7E
	add a, $02 ; 964C5 (25:64c5) -> C6 02
	ld hl, sp+$02 ; 964C7 (25:64c7) -> F8 02
	ld [hl], a ; 964C9 (25:64c9) -> 77
	jp label_9648c ; 964CA (25:64ca) -> C3 8C 64
label_964cd:
	pop bc ; 964CD (25:64cd) -> C1
	ld hl, sp+$00 ; 964CE (25:64ce) -> F8 00
	ld l, [hl] ; 964D0 (25:64d0) -> 6E
	ld h, $00 ; 964D1 (25:64d1) -> 26 00
	add hl, hl ; 964D3 (25:64d3) -> 29
	inc hl ; 964D4 (25:64d4) -> 23
	inc hl ; 964D5 (25:64d5) -> 23
	add hl, bc ; 964D6 (25:64d6) -> 09
	ld e, [hl] ; 964D7 (25:64d7) -> 5E
	inc hl ; 964D8 (25:64d8) -> 23
	ld d, [hl] ; 964D9 (25:64d9) -> 56
	ld hl, sp+$00 ; 964DA (25:64da) -> F8 00
	ld l, [hl] ; 964DC (25:64dc) -> 6E
	ld h, $00 ; 964DD (25:64dd) -> 26 00
	add hl, hl ; 964DF (25:64df) -> 29
	add hl, bc ; 964E0 (25:64e0) -> 09
	ld a, [hl] ; 964E1 (25:64e1) -> 7E
	inc hl ; 964E2 (25:64e2) -> 23
	ld h, [hl] ; 964E3 (25:64e3) -> 66
	ld l, a ; 964E4 (25:64e4) -> 6F
	call Func_961be ; 964E5 (25:64e5) -> CD BE 61
	ld hl, sp+$00 ; 964E8 (25:64e8) -> F8 00
	ld a, [hl] ; 964EA (25:64ea) -> 7E
	add a, $02 ; 964EB (25:64eb) -> C6 02
	ld hl, sp+$03 ; 964ED (25:64ed) -> F8 03
	ld l, [hl] ; 964EF (25:64ef) -> 6E
	ld h, $00 ; 964F0 (25:64f0) -> 26 00
	add hl, hl ; 964F2 (25:64f2) -> 29
	add hl, hl ; 964F3 (25:64f3) -> 29
	push de ; 964F4 (25:64f4) -> D5
	push hl ; 964F5 (25:64f5) -> E5
	pop de ; 964F6 (25:64f6) -> D1
	pop hl ; 964F7 (25:64f7) -> E1
	call ReadHalfWordAt ; 964F8 (25:64f8) -> CD 75 38
	dw $c776
	add hl, de ; 964FD (25:64fd) -> 19
	inc hl ; 964FE (25:64fe) -> 23
	inc hl ; 964FF (25:64ff) -> 23
	ld [hl], a ; 96500 (25:6500) -> 77
label_96501:
	pop bc ; 96501 (25:6501) -> C1
	pop bc ; 96502 (25:6502) -> C1
	ret  ; 96503 (25:6503) -> C9

Func_96504:
	push af ; 96504 (25:6504) -> F5
	push bc ; 96505 (25:6505) -> C5
	push de ; 96506 (25:6506) -> D5
	ld hl, sp+$05 ; 96507 (25:6507) -> F8 05
	ld l, [hl] ; 96509 (25:6509) -> 6E
	ld h, $00 ; 9650A (25:650a) -> 26 00
	add hl, hl ; 9650C (25:650c) -> 29
	ld e, l ; 9650D (25:650d) -> 5D
	ld d, h ; 9650E (25:650e) -> 54
	add hl, hl ; 9650F (25:650f) -> 29
	ld c, l ; 96510 (25:6510) -> 4D
	ld b, h ; 96511 (25:6511) -> 44
	add hl, hl ; 96512 (25:6512) -> 29
	add hl, de ; 96513 (25:6513) -> 19
	add hl, bc ; 96514 (25:6514) -> 09
	push de ; 96515 (25:6515) -> D5
	push hl ; 96516 (25:6516) -> E5
	pop de ; 96517 (25:6517) -> D1
	pop hl ; 96518 (25:6518) -> E1
	call ReadHalfWordAt ; 96519 (25:6519) -> CD 75 38
	dw $c774 ; 9651D (25:651d) -> C7
	add hl, de ; 9651E (25:651e) -> 19
	ld de, $000c ; 9651F (25:651f) -> 11 0C 00
	add hl, de ; 96522 (25:6522) -> 19
	ld a, [hl] ; 96523 (25:6523) -> 7E
	inc hl ; 96524 (25:6524) -> 23
	ld h, [hl] ; 96525 (25:6525) -> 66
	ld l, a ; 96526 (25:6526) -> 6F
	call WriteHLToSPPlus4 ; 96527 (25:6527) -> CD 97 37
	pop de ; 9652A (25:652a) -> D1
	ld a, e ; 9652B (25:652b) -> 7B
	or a ; 9652C (25:652c) -> B7
	jp nz, label_9659e ; 9652D (25:652d) -> C2 9E 65
	ld a, [wPlayerFacing] ; 96530 (25:6530) -> FA 38 C8
	add a, $02 ; 96533 (25:6533) -> C6 02
	and $03 ; 96535 (25:6535) -> E6 03
	ld e, a ; 96537 (25:6537) -> 5F
	ld hl, sp+$03 ; 96538 (25:6538) -> F8 03
	ld a, [hl] ; 9653A (25:653a) -> 7E
	call Func_95d3a ; 9653B (25:653b) -> CD 3A 5D
	ld hl, sp+$03 ; 9653E (25:653e) -> F8 03
	ld l, [hl] ; 96540 (25:6540) -> 6E
	ld h, $00 ; 96541 (25:6541) -> 26 00
	add hl, hl ; 96543 (25:6543) -> 29
	add hl, hl ; 96544 (25:6544) -> 29
	push de ; 96545 (25:6545) -> D5
	push hl ; 96546 (25:6546) -> E5
	pop de ; 96547 (25:6547) -> D1
	pop hl ; 96548 (25:6548) -> E1
	call ReadHalfWordAt ; 96549 (25:6549) -> CD 75 38
	dw $c776 ; 9654D (25:654d) -> C7
	add hl, de ; 9654E (25:654e) -> 19
	inc hl ; 9654F (25:654f) -> 23
	inc hl ; 96550 (25:6550) -> 23
	ld c, [hl] ; 96551 (25:6551) -> 4E
label_96552:
	pop hl ; 96552 (25:6552) -> E1
	push hl ; 96553 (25:6553) -> E5
	push de ; 96554 (25:6554) -> D5
	push hl ; 96555 (25:6555) -> E5
	pop de ; 96556 (25:6556) -> D1
	pop hl ; 96557 (25:6557) -> E1
	ld l, c ; 96558 (25:6558) -> 69
	ld h, $00 ; 96559 (25:6559) -> 26 00
	add hl, hl ; 9655B (25:655b) -> 29
	add hl, de ; 9655C (25:655c) -> 19
	ld a, [hl] ; 9655D (25:655d) -> 7E
	inc hl ; 9655E (25:655e) -> 23
	and [hl] ; 9655F (25:655f) -> A6
	inc a ; 96560 (25:6560) -> 3C
	jp nz, label_96569 ; 96561 (25:6561) -> C2 69 65
	ld c, $ff ; 96564 (25:6564) -> 0E FF
	jp label_9656c ; 96566 (25:6566) -> C3 6C 65
label_96569:
	jp label_96570 ; 96569 (25:6569) -> C3 70 65
label_9656c:
	inc c ; 9656C (25:656c) -> 0C
	jp label_96552 ; 9656D (25:656d) -> C3 52 65
label_96570:
	push bc ; 96570 (25:6570) -> C5
	call GetHLAtSPPlus4 ; 96571 (25:6571) -> CD 29 38
	push de ; 96574 (25:6574) -> D5
	push hl ; 96575 (25:6575) -> E5
	pop de ; 96576 (25:6576) -> D1
	pop hl ; 96577 (25:6577) -> E1
	ld l, c ; 96578 (25:6578) -> 69
	ld h, $00 ; 96579 (25:6579) -> 26 00
	add hl, hl ; 9657B (25:657b) -> 29
	add hl, de ; 9657C (25:657c) -> 19
	ld e, [hl] ; 9657D (25:657d) -> 5E
	inc hl ; 9657E (25:657e) -> 23
	ld d, [hl] ; 9657F (25:657f) -> 56
	push de ; 96580 (25:6580) -> D5
	push hl ; 96581 (25:6581) -> E5
	pop de ; 96582 (25:6582) -> D1
	pop hl ; 96583 (25:6583) -> E1
	call Func_9613d ; 96584 (25:6584) -> CD 3D 61
	pop bc ; 96587 (25:6587) -> C1
	ld hl, sp+$03 ; 96588 (25:6588) -> F8 03
	ld l, [hl] ; 9658A (25:658a) -> 6E
	ld h, $00 ; 9658B (25:658b) -> 26 00
	add hl, hl ; 9658D (25:658d) -> 29
	add hl, hl ; 9658E (25:658e) -> 29
	push de ; 9658F (25:658f) -> D5
	push hl ; 96590 (25:6590) -> E5
	pop de ; 96591 (25:6591) -> D1
	pop hl ; 96592 (25:6592) -> E1
	call ReadHalfWordAt ; 96593 (25:6593) -> CD 75 38
	dw $c776 ; 96597 (25:6597) -> C7
	add hl, de ; 96598 (25:6598) -> 19
	inc hl ; 96599 (25:6599) -> 23
	inc hl ; 9659A (25:659a) -> 23
	ld e, c ; 9659B (25:659b) -> 59
	inc e ; 9659C (25:659c) -> 1C
	ld [hl], e ; 9659D (25:659d) -> 73
label_9659e:
	pop bc ; 9659E (25:659e) -> C1
	pop bc ; 9659F (25:659f) -> C1
	ret  ; 965A0 (25:65a0) -> C9

Func_965a1:
	push af ; 965A1 (25:65a1) -> F5
	push bc ; 965A2 (25:65a2) -> C5
	push de ; 965A3 (25:65a3) -> D5
	ld hl, sp+$05 ; 965A4 (25:65a4) -> F8 05
	ld l, [hl] ; 965A6 (25:65a6) -> 6E
	ld h, $00 ; 965A7 (25:65a7) -> 26 00
	add hl, hl ; 965A9 (25:65a9) -> 29
	ld e, l ; 965AA (25:65aa) -> 5D
	ld d, h ; 965AB (25:65ab) -> 54
	add hl, hl ; 965AC (25:65ac) -> 29
	ld c, l ; 965AD (25:65ad) -> 4D
	ld b, h ; 965AE (25:65ae) -> 44
	add hl, hl ; 965AF (25:65af) -> 29
	add hl, de ; 965B0 (25:65b0) -> 19
	add hl, bc ; 965B1 (25:65b1) -> 09
	push de ; 965B2 (25:65b2) -> D5
	push hl ; 965B3 (25:65b3) -> E5
	pop de ; 965B4 (25:65b4) -> D1
	pop hl ; 965B5 (25:65b5) -> E1
	call ReadHalfWordAt ; 965B6 (25:65b6) -> CD 75 38
	dw $c774 ; 965BA (25:65ba) -> C7
	add hl, de ; 965BB (25:65bb) -> 19
	ld de, $000c ; 965BC (25:65bc) -> 11 0C 00
	add hl, de ; 965BF (25:65bf) -> 19
	ld a, [hl] ; 965C0 (25:65c0) -> 7E
	inc hl ; 965C1 (25:65c1) -> 23
	ld h, [hl] ; 965C2 (25:65c2) -> 66
	ld l, a ; 965C3 (25:65c3) -> 6F
	call WriteHLToSPPlus4 ; 965C4 (25:65c4) -> CD 97 37
	pop de ; 965C7 (25:65c7) -> D1
	ld a, e ; 965C8 (25:65c8) -> 7B
	or a ; 965C9 (25:65c9) -> B7
	jp nz, label_9663b ; 965CA (25:65ca) -> C2 3B 66
	ld a, [wPlayerFacing] ; 965CD (25:65cd) -> FA 38 C8
	add a, $02 ; 965D0 (25:65d0) -> C6 02
	and $03 ; 965D2 (25:65d2) -> E6 03
	ld e, a ; 965D4 (25:65d4) -> 5F
	ld hl, sp+$03 ; 965D5 (25:65d5) -> F8 03
	ld a, [hl] ; 965D7 (25:65d7) -> 7E
	call Func_95d3a ; 965D8 (25:65d8) -> CD 3A 5D
	ld hl, sp+$03 ; 965DB (25:65db) -> F8 03
	ld l, [hl] ; 965DD (25:65dd) -> 6E
	ld h, $00 ; 965DE (25:65de) -> 26 00
	add hl, hl ; 965E0 (25:65e0) -> 29
	add hl, hl ; 965E1 (25:65e1) -> 29
	push de ; 965E2 (25:65e2) -> D5
	push hl ; 965E3 (25:65e3) -> E5
	pop de ; 965E4 (25:65e4) -> D1
	pop hl ; 965E5 (25:65e5) -> E1
	call ReadHalfWordAt ; 965E6 (25:65e6) -> CD 75 38
	dw $c776 ; 965EA (25:65ea) -> C7
	add hl, de ; 965EB (25:65eb) -> 19
	inc hl ; 965EC (25:65ec) -> 23
	inc hl ; 965ED (25:65ed) -> 23
	ld c, [hl] ; 965EE (25:65ee) -> 4E
label_965ef:
	pop hl ; 965EF (25:65ef) -> E1
	push hl ; 965F0 (25:65f0) -> E5
	push de ; 965F1 (25:65f1) -> D5
	push hl ; 965F2 (25:65f2) -> E5
	pop de ; 965F3 (25:65f3) -> D1
	pop hl ; 965F4 (25:65f4) -> E1
	ld l, c ; 965F5 (25:65f5) -> 69
	ld h, $00 ; 965F6 (25:65f6) -> 26 00
	add hl, hl ; 965F8 (25:65f8) -> 29
	add hl, de ; 965F9 (25:65f9) -> 19
	ld a, [hl] ; 965FA (25:65fa) -> 7E
	inc hl ; 965FB (25:65fb) -> 23
	and [hl] ; 965FC (25:65fc) -> A6
	inc a ; 965FD (25:65fd) -> 3C
	jp nz, label_96606 ; 965FE (25:65fe) -> C2 06 66
	ld c, $ff ; 96601 (25:6601) -> 0E FF
	jp label_96609 ; 96603 (25:6603) -> C3 09 66
label_96606:
	jp label_9660d ; 96606 (25:6606) -> C3 0D 66
label_96609:
	inc c ; 96609 (25:6609) -> 0C
	jp label_965ef ; 9660A (25:660a) -> C3 EF 65
label_9660d:
	push bc ; 9660D (25:660d) -> C5
	call GetHLAtSPPlus4 ; 9660E (25:660e) -> CD 29 38
	push de ; 96611 (25:6611) -> D5
	push hl ; 96612 (25:6612) -> E5
	pop de ; 96613 (25:6613) -> D1
	pop hl ; 96614 (25:6614) -> E1
	ld l, c ; 96615 (25:6615) -> 69
	ld h, $00 ; 96616 (25:6616) -> 26 00
	add hl, hl ; 96618 (25:6618) -> 29
	add hl, de ; 96619 (25:6619) -> 19
	ld e, [hl] ; 9661A (25:661a) -> 5E
	inc hl ; 9661B (25:661b) -> 23
	ld d, [hl] ; 9661C (25:661c) -> 56
	push de ; 9661D (25:661d) -> D5
	push hl ; 9661E (25:661e) -> E5
	pop de ; 9661F (25:661f) -> D1
	pop hl ; 96620 (25:6620) -> E1
	call Func_9614e ; 96621 (25:6621) -> CD 4E 61
	pop bc ; 96624 (25:6624) -> C1
	ld hl, sp+$03 ; 96625 (25:6625) -> F8 03
	ld l, [hl] ; 96627 (25:6627) -> 6E
	ld h, $00 ; 96628 (25:6628) -> 26 00
	add hl, hl ; 9662A (25:662a) -> 29
	add hl, hl ; 9662B (25:662b) -> 29
	push de ; 9662C (25:662c) -> D5
	push hl ; 9662D (25:662d) -> E5
	pop de ; 9662E (25:662e) -> D1
	pop hl ; 9662F (25:662f) -> E1
	call ReadHalfWordAt ; 96630 (25:6630) -> CD 75 38
	dw $c776 ; 96634 (25:6634) -> C7
	add hl, de ; 96635 (25:6635) -> 19
	inc hl ; 96636 (25:6636) -> 23
	inc hl ; 96637 (25:6637) -> 23
	ld e, c ; 96638 (25:6638) -> 59
	inc e ; 96639 (25:6639) -> 1C
	ld [hl], e ; 9663A (25:663a) -> 73
label_9663b:
	pop bc ; 9663B (25:663b) -> C1
	pop bc ; 9663C (25:663c) -> C1
	ret  ; 9663D (25:663d) -> C9

Func_9663e:
	push af ; 9663E (25:663e) -> F5
	push bc ; 9663F (25:663f) -> C5
	push de ; 96640 (25:6640) -> D5
	ld hl, sp+$05 ; 96641 (25:6641) -> F8 05
	ld l, [hl] ; 96643 (25:6643) -> 6E
	ld h, $00 ; 96644 (25:6644) -> 26 00
	add hl, hl ; 96646 (25:6646) -> 29
	ld e, l ; 96647 (25:6647) -> 5D
	ld d, h ; 96648 (25:6648) -> 54
	add hl, hl ; 96649 (25:6649) -> 29
	ld c, l ; 9664A (25:664a) -> 4D
	ld b, h ; 9664B (25:664b) -> 44
	add hl, hl ; 9664C (25:664c) -> 29
	add hl, de ; 9664D (25:664d) -> 19
	add hl, bc ; 9664E (25:664e) -> 09
	push de ; 9664F (25:664f) -> D5
	push hl ; 96650 (25:6650) -> E5
	pop de ; 96651 (25:6651) -> D1
	pop hl ; 96652 (25:6652) -> E1
	call ReadHalfWordAt ; 96653 (25:6653) -> CD 75 38
	dw $c774 ; 96657 (25:6657) -> C7
	add hl, de ; 96658 (25:6658) -> 19
	ld de, $000c ; 96659 (25:6659) -> 11 0C 00
	add hl, de ; 9665C (25:665c) -> 19
	ld a, [hl] ; 9665D (25:665d) -> 7E
	inc hl ; 9665E (25:665e) -> 23
	ld h, [hl] ; 9665F (25:665f) -> 66
	ld l, a ; 96660 (25:6660) -> 6F
	call WriteHLToSPPlus4 ; 96661 (25:6661) -> CD 97 37
	pop de ; 96664 (25:6664) -> D1
	ld a, e ; 96665 (25:6665) -> 7B
	or a ; 96666 (25:6666) -> B7
	jp nz, label_9671e ; 96667 (25:6667) -> C2 1E 67
	ld a, [wPlayerFacing] ; 9666A (25:666a) -> FA 38 C8
	add a, $02 ; 9666D (25:666d) -> C6 02
	and $03 ; 9666F (25:666f) -> E6 03
	ld e, a ; 96671 (25:6671) -> 5F
	ld hl, sp+$03 ; 96672 (25:6672) -> F8 03
	ld a, [hl] ; 96674 (25:6674) -> 7E
	call Func_95d3a ; 96675 (25:6675) -> CD 3A 5D
	ld hl, sp+$03 ; 96678 (25:6678) -> F8 03
	ld l, [hl] ; 9667A (25:667a) -> 6E
	ld h, $00 ; 9667B (25:667b) -> 26 00
	add hl, hl ; 9667D (25:667d) -> 29
	add hl, hl ; 9667E (25:667e) -> 29
	push de ; 9667F (25:667f) -> D5
	push hl ; 96680 (25:6680) -> E5
	pop de ; 96681 (25:6681) -> D1
	pop hl ; 96682 (25:6682) -> E1
	call ReadHalfWordAt ; 96683 (25:6683) -> CD 75 38
	dw $c776 ; 96687 (25:6687) -> C7
	add hl, de ; 96688 (25:6688) -> 19
	inc hl ; 96689 (25:6689) -> 23
	inc hl ; 9668A (25:668a) -> 23
	ld a, [hl] ; 9668B (25:668b) -> 7E
	cp $01 ; 9668C (25:668c) -> FE 01
	jp z, label_96702 ; 9668E (25:668e) -> CA 02 67
	or a ; 96691 (25:6691) -> B7
	jp nz, label_9671e ; 96692 (25:6692) -> C2 1E 67
	pop hl ; 96695 (25:6695) -> E1
	push hl ; 96696 (25:6696) -> E5
	inc hl ; 96697 (25:6697) -> 23
	inc hl ; 96698 (25:6698) -> 23
	ld e, [hl] ; 96699 (25:6699) -> 5E
	inc hl ; 9669A (25:669a) -> 23
	ld d, [hl] ; 9669B (25:669b) -> 56
	push de ; 9669C (25:669c) -> D5
	call GetHLAtSPPlus4 ; 9669D (25:669d) -> CD 29 38
	ld e, [hl] ; 966A0 (25:66a0) -> 5E
	inc hl ; 966A1 (25:66a1) -> 23
	ld d, [hl] ; 966A2 (25:66a2) -> 56
	push de ; 966A3 (25:66a3) -> D5
	push hl ; 966A4 (25:66a4) -> E5
	pop de ; 966A5 (25:66a5) -> D1
	pop hl ; 966A6 (25:66a6) -> E1
	pop de ; 966A7 (25:66a7) -> D1
	call Func_96257 ; 966A8 (25:66a8) -> CD 57 62
	or a ; 966AB (25:66ab) -> B7
	jp nz, label_966e3 ; 966AC (25:66ac) -> C2 E3 66
	pop hl ; 966AF (25:66af) -> E1
	push hl ; 966B0 (25:66b0) -> E5
	ld de, $0006 ; 966B1 (25:66b1) -> 11 06 00
	add hl, de ; 966B4 (25:66b4) -> 19
	ld e, [hl] ; 966B5 (25:66b5) -> 5E
	inc hl ; 966B6 (25:66b6) -> 23
	ld d, [hl] ; 966B7 (25:66b7) -> 56
	push de ; 966B8 (25:66b8) -> D5
	call GetHLAtSPPlus4 ; 966B9 (25:66b9) -> CD 29 38
	inc hl ; 966BC (25:66bc) -> 23
	inc hl ; 966BD (25:66bd) -> 23
	inc hl ; 966BE (25:66be) -> 23
	inc hl ; 966BF (25:66bf) -> 23
	ld e, [hl] ; 966C0 (25:66c0) -> 5E
	inc hl ; 966C1 (25:66c1) -> 23
	ld d, [hl] ; 966C2 (25:66c2) -> 56
	push de ; 966C3 (25:66c3) -> D5
	push hl ; 966C4 (25:66c4) -> E5
	pop de ; 966C5 (25:66c5) -> D1
	pop hl ; 966C6 (25:66c6) -> E1
	pop de ; 966C7 (25:66c7) -> D1
	call Func_961be ; 966C8 (25:66c8) -> CD BE 61
	ld hl, sp+$03 ; 966CB (25:66cb) -> F8 03
	ld l, [hl] ; 966CD (25:66cd) -> 6E
	ld h, $00 ; 966CE (25:66ce) -> 26 00
	add hl, hl ; 966D0 (25:66d0) -> 29
	add hl, hl ; 966D1 (25:66d1) -> 29
	push de ; 966D2 (25:66d2) -> D5
	push hl ; 966D3 (25:66d3) -> E5
	pop de ; 966D4 (25:66d4) -> D1
	pop hl ; 966D5 (25:66d5) -> E1
	call ReadHalfWordAt ; 966D6 (25:66d6) -> CD 75 38
	dw $c776 ; 966DA (25:66da) -> C7
	add hl, de ; 966DB (25:66db) -> 19
	inc hl ; 966DC (25:66dc) -> 23
	inc hl ; 966DD (25:66dd) -> 23
	ld [hl], $01 ; 966DE (25:66de) -> 36 01
	jp label_966ff ; 966E0 (25:66e0) -> C3 FF 66
label_966e3:
	pop hl ; 966E3 (25:66e3) -> E1
	push hl ; 966E4 (25:66e4) -> E5
	ld de, $000a ; 966E5 (25:66e5) -> 11 0A 00
	add hl, de ; 966E8 (25:66e8) -> 19
	ld e, [hl] ; 966E9 (25:66e9) -> 5E
	inc hl ; 966EA (25:66ea) -> 23
	ld d, [hl] ; 966EB (25:66eb) -> 56
	push de ; 966EC (25:66ec) -> D5
	call GetHLAtSPPlus4 ; 966ED (25:66ed) -> CD 29 38
	ld de, $0008 ; 966F0 (25:66f0) -> 11 08 00
	add hl, de ; 966F3 (25:66f3) -> 19
	ld e, [hl] ; 966F4 (25:66f4) -> 5E
	inc hl ; 966F5 (25:66f5) -> 23
	ld d, [hl] ; 966F6 (25:66f6) -> 56
	push de ; 966F7 (25:66f7) -> D5
	push hl ; 966F8 (25:66f8) -> E5
	pop de ; 966F9 (25:66f9) -> D1
	pop hl ; 966FA (25:66fa) -> E1
	pop de ; 966FB (25:66fb) -> D1
	call Func_961be ; 966FC (25:66fc) -> CD BE 61
label_966ff:
	jp label_9671e ; 966FF (25:66ff) -> C3 1E 67
label_96702:
	pop hl ; 96702 (25:6702) -> E1
	push hl ; 96703 (25:6703) -> E5
	ld de, $0006 ; 96704 (25:6704) -> 11 06 00
	add hl, de ; 96707 (25:6707) -> 19
	ld e, [hl] ; 96708 (25:6708) -> 5E
	inc hl ; 96709 (25:6709) -> 23
	ld d, [hl] ; 9670A (25:670a) -> 56
	push de ; 9670B (25:670b) -> D5
	call GetHLAtSPPlus4 ; 9670C (25:670c) -> CD 29 38
	inc hl ; 9670F (25:670f) -> 23
	inc hl ; 96710 (25:6710) -> 23
	inc hl ; 96711 (25:6711) -> 23
	inc hl ; 96712 (25:6712) -> 23
	ld e, [hl] ; 96713 (25:6713) -> 5E
	inc hl ; 96714 (25:6714) -> 23
	ld d, [hl] ; 96715 (25:6715) -> 56
	push de ; 96716 (25:6716) -> D5
	push hl ; 96717 (25:6717) -> E5
	pop de ; 96718 (25:6718) -> D1
	pop hl ; 96719 (25:6719) -> E1
	pop de ; 9671A (25:671a) -> D1
	call Func_961be ; 9671B (25:671b) -> CD BE 61
label_9671e:
	pop bc ; 9671E (25:671e) -> C1
	pop bc ; 9671F (25:671f) -> C1
	ret  ; 96720 (25:6720) -> C9

Func_96721:
	push af ; 96721 (25:6721) -> F5
	push bc ; 96722 (25:6722) -> C5
	push de ; 96723 (25:6723) -> D5
	ld hl, sp+$05 ; 96724 (25:6724) -> F8 05
	ld l, [hl] ; 96726 (25:6726) -> 6E
	ld h, $00 ; 96727 (25:6727) -> 26 00
	add hl, hl ; 96729 (25:6729) -> 29
	ld e, l ; 9672A (25:672a) -> 5D
	ld d, h ; 9672B (25:672b) -> 54
	add hl, hl ; 9672C (25:672c) -> 29
	ld c, l ; 9672D (25:672d) -> 4D
	ld b, h ; 9672E (25:672e) -> 44
	add hl, hl ; 9672F (25:672f) -> 29
	add hl, de ; 96730 (25:6730) -> 19
	add hl, bc ; 96731 (25:6731) -> 09
	push de ; 96732 (25:6732) -> D5
	push hl ; 96733 (25:6733) -> E5
	pop de ; 96734 (25:6734) -> D1
	pop hl ; 96735 (25:6735) -> E1
	call ReadHalfWordAt ; 96736 (25:6736) -> CD 75 38
	dw $c774 ; 9673A (25:673a) -> C7
	add hl, de ; 9673B (25:673b) -> 19
	ld de, $000c ; 9673C (25:673c) -> 11 0C 00
	add hl, de ; 9673F (25:673f) -> 19
	ld a, [hl] ; 96740 (25:6740) -> 7E
	inc hl ; 96741 (25:6741) -> 23
	ld h, [hl] ; 96742 (25:6742) -> 66
	ld l, a ; 96743 (25:6743) -> 6F
	call WriteHLToSPPlus4 ; 96744 (25:6744) -> CD 97 37
	pop de ; 96747 (25:6747) -> D1
	ld a, e ; 96748 (25:6748) -> 7B
	or a ; 96749 (25:6749) -> B7
	jp nz, label_967cf ; 9674A (25:674a) -> C2 CF 67
	ld a, [wPlayerFacing] ; 9674D (25:674d) -> FA 38 C8
	add a, $02 ; 96750 (25:6750) -> C6 02
	and $03 ; 96752 (25:6752) -> E6 03
	ld e, a ; 96754 (25:6754) -> 5F
	ld hl, sp+$03 ; 96755 (25:6755) -> F8 03
	ld a, [hl] ; 96757 (25:6757) -> 7E
	call Func_95d3a ; 96758 (25:6758) -> CD 3A 5D
	ld hl, sp+$03 ; 9675B (25:675b) -> F8 03
	ld l, [hl] ; 9675D (25:675d) -> 6E
	ld h, $00 ; 9675E (25:675e) -> 26 00
	add hl, hl ; 96760 (25:6760) -> 29
	add hl, hl ; 96761 (25:6761) -> 29
	push de ; 96762 (25:6762) -> D5
	push hl ; 96763 (25:6763) -> E5
	pop de ; 96764 (25:6764) -> D1
	pop hl ; 96765 (25:6765) -> E1
	call ReadHalfWordAt ; 96766 (25:6766) -> CD 75 38
	dw $c776 ; 9676A (25:676a) -> C7
	add hl, de ; 9676B (25:676b) -> 19
	inc hl ; 9676C (25:676c) -> 23
	inc hl ; 9676D (25:676d) -> 23
	ld a, [hl] ; 9676E (25:676e) -> 7E
	cp $01 ; 9676F (25:676f) -> FE 01
	jp z, label_967c1 ; 96771 (25:6771) -> CA C1 67
	or a ; 96774 (25:6774) -> B7
	jp nz, label_967cf ; 96775 (25:6775) -> C2 CF 67
	pop hl ; 96778 (25:6778) -> E1
	push hl ; 96779 (25:6779) -> E5
	ld e, [hl] ; 9677A (25:677a) -> 5E
	inc hl ; 9677B (25:677b) -> 23
	ld d, [hl] ; 9677C (25:677c) -> 56
	push de ; 9677D (25:677d) -> D5
	push hl ; 9677E (25:677e) -> E5
	pop de ; 9677F (25:677f) -> D1
	pop hl ; 96780 (25:6780) -> E1
	call Func_9615f ; 96781 (25:6781) -> CD 5F 61
	or a ; 96784 (25:6784) -> B7
	jp nz, label_967ae ; 96785 (25:6785) -> C2 AE 67
	pop hl ; 96788 (25:6788) -> E1
	push hl ; 96789 (25:6789) -> E5
	inc hl ; 9678A (25:678a) -> 23
	inc hl ; 9678B (25:678b) -> 23
	ld e, [hl] ; 9678C (25:678c) -> 5E
	inc hl ; 9678D (25:678d) -> 23
	ld d, [hl] ; 9678E (25:678e) -> 56
	push de ; 9678F (25:678f) -> D5
	push hl ; 96790 (25:6790) -> E5
	pop de ; 96791 (25:6791) -> D1
	pop hl ; 96792 (25:6792) -> E1
	call Func_9613d ; 96793 (25:6793) -> CD 3D 61
	ld hl, sp+$03 ; 96796 (25:6796) -> F8 03
	ld l, [hl] ; 96798 (25:6798) -> 6E
	ld h, $00 ; 96799 (25:6799) -> 26 00
	add hl, hl ; 9679B (25:679b) -> 29
	add hl, hl ; 9679C (25:679c) -> 29
	push de ; 9679D (25:679d) -> D5
	push hl ; 9679E (25:679e) -> E5
	pop de ; 9679F (25:679f) -> D1
	pop hl ; 967A0 (25:67a0) -> E1
	call ReadHalfWordAt ; 967A1 (25:67a1) -> CD 75 38
	dw $c776 ; 967A5 (25:67a5) -> C7
	add hl, de ; 967A6 (25:67a6) -> 19
	inc hl ; 967A7 (25:67a7) -> 23
	inc hl ; 967A8 (25:67a8) -> 23
	ld [hl], $01 ; 967A9 (25:67a9) -> 36 01
	jp label_967be ; 967AB (25:67ab) -> C3 BE 67
label_967ae:
	pop hl ; 967AE (25:67ae) -> E1
	push hl ; 967AF (25:67af) -> E5
	inc hl ; 967B0 (25:67b0) -> 23
	inc hl ; 967B1 (25:67b1) -> 23
	inc hl ; 967B2 (25:67b2) -> 23
	inc hl ; 967B3 (25:67b3) -> 23
	ld e, [hl] ; 967B4 (25:67b4) -> 5E
	inc hl ; 967B5 (25:67b5) -> 23
	ld d, [hl] ; 967B6 (25:67b6) -> 56
	push de ; 967B7 (25:67b7) -> D5
	push hl ; 967B8 (25:67b8) -> E5
	pop de ; 967B9 (25:67b9) -> D1
	pop hl ; 967BA (25:67ba) -> E1
	call Func_9613d ; 967BB (25:67bb) -> CD 3D 61
label_967be:
	jp label_967cf ; 967BE (25:67be) -> C3 CF 67
label_967c1:
	pop hl ; 967C1 (25:67c1) -> E1
	push hl ; 967C2 (25:67c2) -> E5
	inc hl ; 967C3 (25:67c3) -> 23
	inc hl ; 967C4 (25:67c4) -> 23
	ld e, [hl] ; 967C5 (25:67c5) -> 5E
	inc hl ; 967C6 (25:67c6) -> 23
	ld d, [hl] ; 967C7 (25:67c7) -> 56
	push de ; 967C8 (25:67c8) -> D5
	push hl ; 967C9 (25:67c9) -> E5
	pop de ; 967CA (25:67ca) -> D1
	pop hl ; 967CB (25:67cb) -> E1
	call Func_9613d ; 967CC (25:67cc) -> CD 3D 61
label_967cf:
	pop bc ; 967CF (25:67cf) -> C1
	pop bc ; 967D0 (25:67d0) -> C1
	ret  ; 967D1 (25:67d1) -> C9

Func_967d2:
	push af ; 967D2 (25:67d2) -> F5
	push bc ; 967D3 (25:67d3) -> C5
	push de ; 967D4 (25:67d4) -> D5
	ld hl, sp+$05 ; 967D5 (25:67d5) -> F8 05
	ld l, [hl] ; 967D7 (25:67d7) -> 6E
	ld h, $00 ; 967D8 (25:67d8) -> 26 00
	add hl, hl ; 967DA (25:67da) -> 29
	ld e, l ; 967DB (25:67db) -> 5D
	ld d, h ; 967DC (25:67dc) -> 54
	add hl, hl ; 967DD (25:67dd) -> 29
	ld c, l ; 967DE (25:67de) -> 4D
	ld b, h ; 967DF (25:67df) -> 44
	add hl, hl ; 967E0 (25:67e0) -> 29
	add hl, de ; 967E1 (25:67e1) -> 19
	add hl, bc ; 967E2 (25:67e2) -> 09
	push de ; 967E3 (25:67e3) -> D5
	push hl ; 967E4 (25:67e4) -> E5
	pop de ; 967E5 (25:67e5) -> D1
	pop hl ; 967E6 (25:67e6) -> E1
	call ReadHalfWordAt ; 967E7 (25:67e7) -> CD 75 38
	dw $c774 ; 967EB (25:67eb) -> C7
	add hl, de ; 967EC (25:67ec) -> 19
	ld de, $000c ; 967ED (25:67ed) -> 11 0C 00
	add hl, de ; 967F0 (25:67f0) -> 19
	ld a, [hl] ; 967F1 (25:67f1) -> 7E
	inc hl ; 967F2 (25:67f2) -> 23
	ld h, [hl] ; 967F3 (25:67f3) -> 66
	ld l, a ; 967F4 (25:67f4) -> 6F
	call WriteHLToSPPlus4 ; 967F5 (25:67f5) -> CD 97 37
	pop de ; 967F8 (25:67f8) -> D1
	ld a, e ; 967F9 (25:67f9) -> 7B
	or a ; 967FA (25:67fa) -> B7
	jp nz, label_96880 ; 967FB (25:67fb) -> C2 80 68
	ld a, [wPlayerFacing] ; 967FE (25:67fe) -> FA 38 C8
	add a, $02 ; 96801 (25:6801) -> C6 02
	and $03 ; 96803 (25:6803) -> E6 03
	ld e, a ; 96805 (25:6805) -> 5F
	ld hl, sp+$03 ; 96806 (25:6806) -> F8 03
	ld a, [hl] ; 96808 (25:6808) -> 7E
	call Func_95d3a ; 96809 (25:6809) -> CD 3A 5D
	ld hl, sp+$03 ; 9680C (25:680c) -> F8 03
	ld l, [hl] ; 9680E (25:680e) -> 6E
	ld h, $00 ; 9680F (25:680f) -> 26 00
	add hl, hl ; 96811 (25:6811) -> 29
	add hl, hl ; 96812 (25:6812) -> 29
	push de ; 96813 (25:6813) -> D5
	push hl ; 96814 (25:6814) -> E5
	pop de ; 96815 (25:6815) -> D1
	pop hl ; 96816 (25:6816) -> E1
	call ReadHalfWordAt ; 96817 (25:6817) -> CD 75 38
	dw $c776 ; 9681B (25:681b) -> C7
	add hl, de ; 9681C (25:681c) -> 19
	inc hl ; 9681D (25:681d) -> 23
	inc hl ; 9681E (25:681e) -> 23
	ld a, [hl] ; 9681F (25:681f) -> 7E
	cp $01 ; 96820 (25:6820) -> FE 01
	jp z, label_96872 ; 96822 (25:6822) -> CA 72 68
	or a ; 96825 (25:6825) -> B7
	jp nz, label_96880 ; 96826 (25:6826) -> C2 80 68
	pop hl ; 96829 (25:6829) -> E1
	push hl ; 9682A (25:682a) -> E5
	ld e, [hl] ; 9682B (25:682b) -> 5E
	inc hl ; 9682C (25:682c) -> 23
	ld d, [hl] ; 9682D (25:682d) -> 56
	push de ; 9682E (25:682e) -> D5
	push hl ; 9682F (25:682f) -> E5
	pop de ; 96830 (25:6830) -> D1
	pop hl ; 96831 (25:6831) -> E1
	call Func_9616f ; 96832 (25:6832) -> CD 6F 61
	or a ; 96835 (25:6835) -> B7
	jp nz, label_9685f ; 96836 (25:6836) -> C2 5F 68
	pop hl ; 96839 (25:6839) -> E1
	push hl ; 9683A (25:683a) -> E5
	inc hl ; 9683B (25:683b) -> 23
	inc hl ; 9683C (25:683c) -> 23
	ld e, [hl] ; 9683D (25:683d) -> 5E
	inc hl ; 9683E (25:683e) -> 23
	ld d, [hl] ; 9683F (25:683f) -> 56
	push de ; 96840 (25:6840) -> D5
	push hl ; 96841 (25:6841) -> E5
	pop de ; 96842 (25:6842) -> D1
	pop hl ; 96843 (25:6843) -> E1
	call Func_9614e ; 96844 (25:6844) -> CD 4E 61
	ld hl, sp+$03 ; 96847 (25:6847) -> F8 03
	ld l, [hl] ; 96849 (25:6849) -> 6E
	ld h, $00 ; 9684A (25:684a) -> 26 00
	add hl, hl ; 9684C (25:684c) -> 29
	add hl, hl ; 9684D (25:684d) -> 29
	push de ; 9684E (25:684e) -> D5
	push hl ; 9684F (25:684f) -> E5
	pop de ; 96850 (25:6850) -> D1
	pop hl ; 96851 (25:6851) -> E1
	call ReadHalfWordAt ; 96852 (25:6852) -> CD 75 38
	dw $c776 ; 96856 (25:6856) -> C7
	add hl, de ; 96857 (25:6857) -> 19
	inc hl ; 96858 (25:6858) -> 23
	inc hl ; 96859 (25:6859) -> 23
	ld [hl], $01 ; 9685A (25:685a) -> 36 01
	jp label_9686f ; 9685C (25:685c) -> C3 6F 68
label_9685f:
	pop hl ; 9685F (25:685f) -> E1
	push hl ; 96860 (25:6860) -> E5
	inc hl ; 96861 (25:6861) -> 23
	inc hl ; 96862 (25:6862) -> 23
	inc hl ; 96863 (25:6863) -> 23
	inc hl ; 96864 (25:6864) -> 23
	ld e, [hl] ; 96865 (25:6865) -> 5E
	inc hl ; 96866 (25:6866) -> 23
	ld d, [hl] ; 96867 (25:6867) -> 56
	push de ; 96868 (25:6868) -> D5
	push hl ; 96869 (25:6869) -> E5
	pop de ; 9686A (25:686a) -> D1
	pop hl ; 9686B (25:686b) -> E1
	call Func_9614e ; 9686C (25:686c) -> CD 4E 61
label_9686f:
	jp label_96880 ; 9686F (25:686f) -> C3 80 68
label_96872:
	pop hl ; 96872 (25:6872) -> E1
	push hl ; 96873 (25:6873) -> E5
	inc hl ; 96874 (25:6874) -> 23
	inc hl ; 96875 (25:6875) -> 23
	ld e, [hl] ; 96876 (25:6876) -> 5E
	inc hl ; 96877 (25:6877) -> 23
	ld d, [hl] ; 96878 (25:6878) -> 56
	push de ; 96879 (25:6879) -> D5
	push hl ; 9687A (25:687a) -> E5
	pop de ; 9687B (25:687b) -> D1
	pop hl ; 9687C (25:687c) -> E1
	call Func_9614e ; 9687D (25:687d) -> CD 4E 61
label_96880:
	pop bc ; 96880 (25:6880) -> C1
	pop bc ; 96881 (25:6881) -> C1
	ret  ; 96882 (25:6882) -> C9

Func_96883:
	push af ; 96883 (25:6883) -> F5
	ld hl, sp+$01 ; 96884 (25:6884) -> F8 01
	ld l, [hl] ; 96886 (25:6886) -> 6E
	ld h, $00 ; 96887 (25:6887) -> 26 00
	add hl, hl ; 96889 (25:6889) -> 29
	ld e, l ; 9688A (25:688a) -> 5D
	ld d, h ; 9688B (25:688b) -> 54
	add hl, hl ; 9688C (25:688c) -> 29
	ld c, l ; 9688D (25:688d) -> 4D
	ld b, h ; 9688E (25:688e) -> 44
	add hl, hl ; 9688F (25:688f) -> 29
	add hl, de ; 96890 (25:6890) -> 19
	add hl, bc ; 96891 (25:6891) -> 09
	push de ; 96892 (25:6892) -> D5
	push hl ; 96893 (25:6893) -> E5
	pop de ; 96894 (25:6894) -> D1
	pop hl ; 96895 (25:6895) -> E1
	call ReadHalfWordAt ; 96896 (25:6896) -> CD 75 38
	dw $c774 ; 9689A (25:689a) -> C7
	add hl, de ; 9689B (25:689b) -> 19
	inc hl ; 9689C (25:689c) -> 23
	inc hl ; 9689D (25:689d) -> 23
	ld a, [hl] ; 9689E (25:689e) -> 7E
	ld [wc846], a ; 9689F (25:689f) -> EA 46 C8
	ld hl, sp+$01 ; 968A2 (25:68a2) -> F8 01
	ld l, [hl] ; 968A4 (25:68a4) -> 6E
	ld h, $00 ; 968A5 (25:68a5) -> 26 00
	add hl, hl ; 968A7 (25:68a7) -> 29
	ld e, l ; 968A8 (25:68a8) -> 5D
	ld d, h ; 968A9 (25:68a9) -> 54
	add hl, hl ; 968AA (25:68aa) -> 29
	ld c, l ; 968AB (25:68ab) -> 4D
	ld b, h ; 968AC (25:68ac) -> 44
	add hl, hl ; 968AD (25:68ad) -> 29
	add hl, de ; 968AE (25:68ae) -> 19
	add hl, bc ; 968AF (25:68af) -> 09
	push de ; 968B0 (25:68b0) -> D5
	push hl ; 968B1 (25:68b1) -> E5
	pop de ; 968B2 (25:68b2) -> D1
	pop hl ; 968B3 (25:68b3) -> E1
	call ReadHalfWordAt ; 968B4 (25:68b4) -> CD 75 38
	dw $c774 ; 968B8 (25:68b8) -> C7
	add hl, de ; 968B9 (25:68b9) -> 19
	inc hl ; 968BA (25:68ba) -> 23
	inc hl ; 968BB (25:68bb) -> 23
	inc hl ; 968BC (25:68bc) -> 23
	ld a, [hl] ; 968BD (25:68bd) -> 7E
	ld [wc847], a ; 968BE (25:68be) -> EA 47 C8
	ld a, $ff ; 968C1 (25:68c1) -> 3E FF
	ld [wc848], a ; 968C3 (25:68c3) -> EA 48 C8
	ld a, $ff ; 968C6 (25:68c6) -> 3E FF
	ld [wc849], a ; 968C8 (25:68c8) -> EA 49 C8
	ld a, [wPlayerFacing] ; 968CB (25:68cb) -> FA 38 C8
	cp $03 ; 968CE (25:68ce) -> FE 03
	jp z, label_968ff ; 968D0 (25:68d0) -> CA FF 68
	cp $02 ; 968D3 (25:68d3) -> FE 02
	jp z, label_968f5 ; 968D5 (25:68d5) -> CA F5 68
	cp $01 ; 968D8 (25:68d8) -> FE 01
	jp z, label_968eb ; 968DA (25:68da) -> CA EB 68
	or a ; 968DD (25:68dd) -> B7
	jp nz, label_96906 ; 968DE (25:68de) -> C2 06 69
	ld a, [wc847] ; 968E1 (25:68e1) -> FA 47 C8
	dec a ; 968E4 (25:68e4) -> 3D
	ld [wc847], a ; 968E5 (25:68e5) -> EA 47 C8
	jp label_96906 ; 968E8 (25:68e8) -> C3 06 69
label_968eb:
	ld a, [wc846] ; 968EB (25:68eb) -> FA 46 C8
	inc a ; 968EE (25:68ee) -> 3C
	ld [wc846], a ; 968EF (25:68ef) -> EA 46 C8
	jp label_96906 ; 968F2 (25:68f2) -> C3 06 69
label_968f5:
	ld a, [wc847] ; 968F5 (25:68f5) -> FA 47 C8
	inc a ; 968F8 (25:68f8) -> 3C
	ld [wc847], a ; 968F9 (25:68f9) -> EA 47 C8
	jp label_96906 ; 968FC (25:68fc) -> C3 06 69
label_968ff:
	ld a, [wc846] ; 968FF (25:68ff) -> FA 46 C8
	dec a ; 96902 (25:6902) -> 3D
	ld [wc846], a ; 96903 (25:6903) -> EA 46 C8
label_96906:
	set_farcall_addrs_hli CheckBackgroundCollision
	ld c, $01 ; 96911 (25:6911) -> 0E 01
	ld a, [wc847] ; 96913 (25:6913) -> FA 47 C8
	ld e, a ; 96916 (25:6916) -> 5F
	ld a, [wc846] ; 96917 (25:6917) -> FA 46 C8
	call FarCall ; 9691A (25:691a) -> CD F8 03
	or a ; 9691D (25:691d) -> B7
	jp nz, label_96936 ; 9691E (25:691e) -> C2 36 69
	ld a, $33 ; 96921 (25:6921) -> 3E 33
	call OverworldPlaySFX ; 96923 (25:6923) -> CD 02 15
	ld bc, $c846 ; 96926 (25:6926) -> 01 46 C8
	ld e, $25 ; 96929 (25:6929) -> 1E 25
	ld hl, sp+$01 ; 9692B (25:692b) -> F8 01
	ld a, [hl] ; 9692D (25:692d) -> 7E
	call Func_95e9c ; 9692E (25:692e) -> CD 9C 5E
	ld a, $01 ; 96931 (25:6931) -> 3E 01
	jp label_96937 ; 96933 (25:6933) -> C3 37 69
label_96936:
	xor a ; 96936 (25:6936) -> AF
label_96937:
	pop bc ; 96937 (25:6937) -> C1
	ret  ; 96938 (25:6938) -> C9

Func_96938:
	push af ; 96939 (25:6939) -> F5
	set_farcall_addrs_hli UnlockArea
	pop af ; 96945 (25:6945) -> F1
	call FarCall ; 96946 (25:6946) -> CD F8 03
	ret  ; 96949 (25:6949) -> C9

Func_9694a:
	push af ; 9694A (25:694a) -> F5
	set_farcall_addrs_hli CheckUnlockedArea
	pop af ; 96956 (25:6956) -> F1
	jp FarCall ; 96957 (25:6957) -> C3 F8 03

Func_9695a:
	push af ; 9695A (25:695a) -> F5
	set_farcall_addrs_hli LockArea
	pop af ; 96966 (25:6966) -> F1
	call FarCall ; 96967 (25:6967) -> CD F8 03
	ret  ; 9696A (25:696a) -> C9

Func_9696b:
	push af ; 9696B (25:696b) -> F5
	set_farcall_addrs_hli LoadPlayerSprite
	pop af ; 96977 (25:6977) -> F1
	call FarCall ; 96978 (25:6978) -> CD F8 03
	ret  ; 9697B (25:697b) -> C9

Func_9697c:
	push af ; 9697C (25:697c) -> F5
	set_farcall_addrs_hli RandomRange
	pop af ; 96988 (25:6988) -> F1
	jp FarCall ; 96989 (25:6989) -> C3 F8 03

Func_9698c:
	push hl ; 9698C (25:698c) -> E5
	push de ; 9698D (25:698d) -> D5
	set_farcall_addrs_hli Func_9b262
	pop de ; 96999 (25:6999) -> D1
	pop hl ; 9699A (25:699a) -> E1
	ld c, e ; 9699B (25:699b) -> 4B
	push de ; 9699C (25:699c) -> D5
	push hl ; 9699D (25:699d) -> E5
	pop de ; 9699E (25:699e) -> D1
	pop hl ; 9699F (25:699f) -> E1
	ld a, $25 ; 969A0 (25:69a0) -> 3E 25
	call FarCall ; 969A2 (25:69a2) -> CD F8 03
	ret  ; 969A5 (25:69a5) -> C9

Func_969a6:
	push af ; 969A6 (25:69a6) -> F5
	ld a, [wc793] ; 969A7 (25:69a7) -> FA 93 C7
	or a ; 969AA (25:69aa) -> B7
	jp z, label_969b6 ; 969AB (25:69ab) -> CA B6 69
	ld a, [wc793] ; 969AE (25:69ae) -> FA 93 C7
	cp $03 ; 969B1 (25:69b1) -> FE 03
	jp nz, label_969c7 ; 969B3 (25:69b3) -> C2 C7 69
label_969b6:
	set_farcall_addrs_hli Func_b785
	ld hl, sp+$01 ; 969C1 (25:69c1) -> F8 01
	ld a, [hl] ; 969C3 (25:69c3) -> 7E
	call FarCall ; 969C4 (25:69c4) -> CD F8 03
label_969c7:
	pop bc ; 969C7 (25:69c7) -> C1
	ret  ; 969C8 (25:69c8) -> C9

Func_969c9:
	ld a, [wc793] ; 969C9 (25:69c9) -> FA 93 C7
	or a ; 969CC (25:69cc) -> B7
	jp z, label_969d8 ; 969CD (25:69cd) -> CA D8 69
	ld a, [wc793] ; 969D0 (25:69d0) -> FA 93 C7
	cp $03 ; 969D3 (25:69d3) -> FE 03
	jp nz, label_969f1 ; 969D5 (25:69d5) -> C2 F1 69
label_969d8:
	push hl ; 969D8 (25:69d8) -> E5
	push de ; 969D9 (25:69d9) -> D5
	set_farcall_addrs_hli LoadEncounterTable
	pop de ; 969E5 (25:69e5) -> D1
	pop hl ; 969E6 (25:69e6) -> E1
	ld c, e ; 969E7 (25:69e7) -> 4B
	push de ; 969E8 (25:69e8) -> D5
	push hl ; 969E9 (25:69e9) -> E5
	pop de ; 969EA (25:69ea) -> D1
	pop hl ; 969EB (25:69eb) -> E1
	ld a, $25 ; 969EC (25:69ec) -> 3E 25
	call FarCall ; 969EE (25:69ee) -> CD F8 03
label_969f1:
	ret  ; 969F1 (25:69f1) -> C9

Func_969f2:
	push af ; 969F2 (25:69f2) -> F5
	push de ; 969F3 (25:69f3) -> D5
	push bc ; 969F4 (25:69f4) -> C5
	set_farcall_addrs_hli Func_5a0e0
	pop bc ; 96A00 (25:6a00) -> C1
	pop de ; 96A01 (25:6a01) -> D1
	pop af ; 96A02 (25:6a02) -> F1
	call FarCall ; 96A03 (25:6a03) -> CD F8 03
	ret  ; 96A06 (25:6a06) -> C9

Func_96a07:
	push af ; 96A07 (25:6a07) -> F5
	push de ; 96A08 (25:6a08) -> D5
	set_farcall_addrs_hli Func_4ed5d
	pop de ; 96A14 (25:6a14) -> D1
	pop af ; 96A15 (25:6a15) -> F1
	jp FarCall ; 96A16 (25:6a16) -> C3 F8 03

Func_96a19:
	push af ; 96A19 (25:6a19) -> F5
	push de ; 96A1A (25:6a1a) -> D5
	set_farcall_addrs_hli Func_6af0d
	pop de ; 96A26 (25:6a26) -> D1
	pop af ; 96A27 (25:6a27) -> F1
	inc a ; 96A28 (25:6a28) -> 3C
	jp FarCall ; 96A29 (25:6a29) -> C3 F8 03

Func_96a2c:
	push af ; 96A2C (25:6a2c) -> F5
	push de ; 96A2D (25:6a2d) -> D5
	push bc ; 96A2E (25:6a2e) -> C5
	set_farcall_addrs_hli GiveRobot
	pop bc ; 96A3A (25:6a3a) -> C1
	pop de ; 96A3B (25:6a3b) -> D1
	pop af ; 96A3C (25:6a3c) -> F1
	jp FarCall ; 96A3D (25:6a3d) -> C3 F8 03

Func_96a40:
	push hl ; 96A40 (25:6a40) -> E5
	set_farcall_addrs_hli Func_e3714
	pop hl ; 96A4C (25:6a4c) -> E1
	push hl ; 96A4D (25:6a4d) -> E5
	ld de, $0005 ; 96A4E (25:6a4e) -> 11 05 00
	add hl, de ; 96A51 (25:6a51) -> 19
	ld c, [hl] ; 96A52 (25:6a52) -> 4E
	pop hl ; 96A53 (25:6a53) -> E1
	push hl ; 96A54 (25:6a54) -> E5
	inc hl ; 96A55 (25:6a55) -> 23
	inc hl ; 96A56 (25:6a56) -> 23
	inc hl ; 96A57 (25:6a57) -> 23
	inc hl ; 96A58 (25:6a58) -> 23
	ld h, [hl] ; 96A59 (25:6a59) -> 66
	ld b, h ; 96A5A (25:6a5a) -> 44
	pop hl ; 96A5B (25:6a5b) -> E1
	push hl ; 96A5C (25:6a5c) -> E5
	inc hl ; 96A5D (25:6a5d) -> 23
	inc hl ; 96A5E (25:6a5e) -> 23
	ld a, [hl] ; 96A5F (25:6a5f) -> 7E
	pop hl ; 96A60 (25:6a60) -> E1
	push hl ; 96A61 (25:6a61) -> E5
	inc hl ; 96A62 (25:6a62) -> 23
	inc hl ; 96A63 (25:6a63) -> 23
	inc hl ; 96A64 (25:6a64) -> 23
	ld l, [hl] ; 96A65 (25:6a65) -> 6E
	ld h, a ; 96A66 (25:6a66) -> 67
	push hl ; 96A67 (25:6a67) -> E5
	call GetHLAtSPPlus4 ; 96A68 (25:6a68) -> CD 29 38
	ld a, [hl] ; 96A6B (25:6a6b) -> 7E
	call GetHLAtSPPlus4 ; 96A6C (25:6a6c) -> CD 29 38
	inc hl ; 96A6F (25:6a6f) -> 23
	ld l, [hl] ; 96A70 (25:6a70) -> 6E
	ld h, a ; 96A71 (25:6a71) -> 67
	pop de ; 96A72 (25:6a72) -> D1
	call FarCall ; 96A73 (25:6a73) -> CD F8 03
	pop bc ; 96A76 (25:6a76) -> C1
	ret  ; 96A77 (25:6a77) -> C9

Func_96a78:
	ld a, [wc793] ; 96A78 (25:6a78) -> FA 93 C7
	or a ; 96A7B (25:6a7b) -> B7
	jp z, label_96a87 ; 96A7C (25:6a7c) -> CA 87 6A
	ld a, [wc793] ; 96A7F (25:6a7f) -> FA 93 C7
	cp $03 ; 96A82 (25:6a82) -> FE 03
	jp nz, label_96aa2 ; 96A84 (25:6a84) -> C2 A2 6A
label_96a87:
	push hl ; 96A87 (25:6a87) -> E5
	push de ; 96A88 (25:6a88) -> D5
	set_farcall_addrs_hli StartBattle
	pop de ; 96A94 (25:6a94) -> D1
	pop hl ; 96A95 (25:6a95) -> E1
	ld c, e ; 96A96 (25:6a96) -> 4B
	ld b, d ; 96A97 (25:6a97) -> 42
	push de ; 96A98 (25:6a98) -> D5
	push hl ; 96A99 (25:6a99) -> E5
	pop de ; 96A9A (25:6a9a) -> D1
	pop hl ; 96A9B (25:6a9b) -> E1
	ld a, $25 ; 96A9C (25:6a9c) -> 3E 25
	call FarCall ; 96A9E (25:6a9e) -> CD F8 03
	ld l, a ; 96AA1 (25:6aa1) -> 6F
label_96aa2:
	ld a, l ; 96AA2 (25:6aa2) -> 7D
	ret  ; 96AA3 (25:6aa3) -> C9

Func_96aa4:
	push de ; 96AA4 (25:6aa4) -> D5
	push af ; 96AA5 (25:6aa5) -> F5
	push bc ; 96AA6 (25:6aa6) -> C5
	set_farcall_addrs_hli Func_af7a
	pop bc ; 96AB2 (25:6ab2) -> C1
	pop af ; 96AB3 (25:6ab3) -> F1
	ld hl, sp+$04 ; 96AB4 (25:6ab4) -> F8 04
	ld l, [hl] ; 96AB6 (25:6ab6) -> 6E
	ld h, c ; 96AB7 (25:6ab7) -> 61
	ld e, l ; 96AB8 (25:6ab8) -> 5D
	ld d, h ; 96AB9 (25:6ab9) -> 54
	ld hl, sp+$00 ; 96ABA (25:6aba) -> F8 00
	ld l, [hl] ; 96ABC (25:6abc) -> 6E
	ld h, a ; 96ABD (25:6abd) -> 67
	call FarCall ; 96ABE (25:6abe) -> CD F8 03
	pop bc ; 96AC1 (25:6ac1) -> C1
	ret  ; 96AC2 (25:6ac2) -> C9

Func_96ac3:
	push af ; 96AC3 (25:6ac3) -> F5
	push de ; 96AC4 (25:6ac4) -> D5
	set_farcall_addrs_hli HandlePlayerStep
	pop de ; 96AD0 (25:6ad0) -> D1
	pop af ; 96AD1 (25:6ad1) -> F1
	call FarCall ; 96AD2 (25:6ad2) -> CD F8 03
	ret  ; 96AD5 (25:6ad5) -> C9

Func_96ad6:
	push hl ; 96AD6 (25:6ad6) -> E5
	push de ; 96AD7 (25:6ad7) -> D5
	set_farcall_addrs_hli Func_6b94
	pop de ; 96AE3 (25:6ae3) -> D1
	pop hl ; 96AE4 (25:6ae4) -> E1
	call FarCall ; 96AE5 (25:6ae5) -> CD F8 03
	ret  ; 96AE8 (25:6ae8) -> C9

Func_96ae9:
	set_farcall_addrs_hli Func_9f64
	ld a, [wMapY] ; 96AF4 (25:6af4) -> FA D9 C2
	add a, $04 ; 96AF7 (25:6af7) -> C6 04
	ld e, a ; 96AF9 (25:6af9) -> 5F
	ld a, [wMapX] ; 96AFA (25:6afa) -> FA D8 C2
	add a, $05 ; 96AFD (25:6afd) -> C6 05
	jp FarCall ; 96AFF (25:6aff) -> C3 F8 03

Func_96b02:
	push af ; 96B02 (25:6b02) -> F5
	set_farcall_addrs_hli Func_e1f2d
	pop af ; 96B0E (25:6b0e) -> F1
	jp FarCall ; 96B0F (25:6b0f) -> C3 F8 03

Func_96b12:
	push af ; 96B12 (25:6b12) -> F5
	set_farcall_addrs_hli Func_6aad4
	pop af ; 96B1E (25:6b1e) -> F1
	jp FarCall ; 96B1F (25:6b1f) -> C3 F8 03

Func_96b22:
	push af ; 96B22 (25:6b22) -> F5
	set_farcall_addrs_hli Func_6ab29
	pop af ; 96B2E (25:6b2e) -> F1
	jp FarCall ; 96B2F (25:6b2f) -> C3 F8 03

Func_96b32:
	push af ; 96B32 (25:6b32) -> F5
	push de ; 96B33 (25:6b33) -> D5
	push bc ; 96B34 (25:6b34) -> C5
	set_farcall_addrs_hli Func_e1513
	pop bc ; 96B40 (25:6b40) -> C1
	pop de ; 96B41 (25:6b41) -> D1
	pop af ; 96B42 (25:6b42) -> F1
	call FarCall ; 96B43 (25:6b43) -> CD F8 03
	ret  ; 96B46 (25:6b46) -> C9

Func_96b47:
	callba_hli StartShakingScreen
	ret  ; 96B55 (25:6b55) -> C9

Func_96b56:
	callba_hli StopShakingScreen
	ret  ; 96B64 (25:6b64) -> C9

Func_96b65:
	call FillVisibleAreaWithBlankTile ; 96B65 (25:6b65) -> CD A8 3A
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $07 ; 96B73 (25:6b73) -> 3E 07
	call FarCall ; 96B75 (25:6b75) -> CD F8 03
	push hl ; 96B78 (25:6b78) -> E5
	set_farcall_addrs_hli FadeInMap
	xor a ; 96B84 (25:6b84) -> AF
	call FarCall ; 96B85 (25:6b85) -> CD F8 03
	pop hl ; 96B88 (25:6b88) -> E1
	ld a, l ; 96B89 (25:6b89) -> 7D
	ret  ; 96B8A (25:6b8a) -> C9

Func_96b8b:
	push af ; 96B8B (25:6b8b) -> F5
	ld a, [wMapMusic] ; 96B8C (25:6b8c) -> FA BE C7
	ld hl, sp+$01 ; 96B8F (25:6b8f) -> F8 01
	cp [hl] ; 96B91 (25:6b91) -> BE
	jp z, label_96ba1 ; 96B92 (25:6b92) -> CA A1 6B
	ld hl, sp+$01 ; 96B95 (25:6b95) -> F8 01
	ld a, [hl] ; 96B97 (25:6b97) -> 7E
	call OverworldPlaySong ; 96B98 (25:6b98) -> CD FC 14
	ld hl, sp+$01 ; 96B9B (25:6b9b) -> F8 01
	ld a, [hl] ; 96B9D (25:6b9d) -> 7E
	ld [wMapMusic], a ; 96B9E (25:6b9e) -> EA BE C7
label_96ba1:
	pop bc ; 96BA1 (25:6ba1) -> C1
	ret  ; 96BA2 (25:6ba2) -> C9

Func_96ba3:
	call OverworldPlaySFX ; 96BA3 (25:6ba3) -> CD 02 15
	ret  ; 96BA6 (25:6ba6) -> C9

Func_96ba7:
	callba_hli Func_8f44
	ret  ; 96BB5 (25:6bb5) -> C9

Func_96bb6:
	push hl ; 96BB6 (25:6bb6) -> E5
	set_farcall_addrs_hli Func_bf39
	pop de ; 96BC2 (25:6bc2) -> D1
	ld a, $25 ; 96BC3 (25:6bc3) -> 3E 25
	call FarCall ; 96BC5 (25:6bc5) -> CD F8 03
	ret  ; 96BC8 (25:6bc8) -> C9

Func_96bc9:
	push de ; 96BC9 (25:6bc9) -> D5
	push bc ; 96BCA (25:6bca) -> C5
	push af ; 96BCB (25:6bcb) -> F5
	set_farcall_addrs_hli Func_e3619
	pop af ; 96BD7 (25:6bd7) -> F1
	ld hl, sp+$06 ; 96BD8 (25:6bd8) -> F8 06
	ld c, [hl] ; 96BDA (25:6bda) -> 4E
	ld hl, sp+$00 ; 96BDB (25:6bdb) -> F8 00
	ld e, [hl] ; 96BDD (25:6bdd) -> 5E
	ld hl, sp+$02 ; 96BDE (25:6bde) -> F8 02
	ld l, [hl] ; 96BE0 (25:6be0) -> 6E
	ld h, a ; 96BE1 (25:6be1) -> 67
	call FarCall ; 96BE2 (25:6be2) -> CD F8 03
	pop bc ; 96BE5 (25:6be5) -> C1
	pop bc ; 96BE6 (25:6be6) -> C1
	ret  ; 96BE7 (25:6be7) -> C9

Func_96be8:
	push af ; 96BE8 (25:6be8) -> F5
	set_farcall_addrs_hli Func_bf46
	pop af ; 96BF4 (25:6bf4) -> F1
	call FarCall ; 96BF5 (25:6bf5) -> CD F8 03
	ret  ; 96BF8 (25:6bf8) -> C9

Func_96bf9:
	callba_hli Func_b65f
	ret  ; 96C07 (25:6c07) -> C9

Func_96c08:
	callba_hli Func_b6f2
	ret  ; 96C16 (25:6c16) -> C9

Func_96c17:
	push hl ; 96C17 (25:6c17) -> E5
	set_farcall_addrs_hli LandmarkSign
	pop hl ; 96C23 (25:6c23) -> E1
	call FarCall ; 96C24 (25:6c24) -> CD F8 03
	ret  ; 96C27 (25:6c27) -> C9

Func_96c28:
	push hl ; 96C28 (25:6c28) -> E5
	set_farcall_addrs_hli Func_9a28c
	pop hl ; 96C34 (25:6c34) -> E1
	call FarCall ; 96C35 (25:6c35) -> CD F8 03
	ret  ; 96C38 (25:6c38) -> C9

Func_96c39:
	push hl ; 96C39 (25:6c39) -> E5
	set_farcall_addrs_hli Func_93370
	pop hl ; 96C45 (25:6c45) -> E1
	call FarCall ; 96C46 (25:6c46) -> CD F8 03
	ret  ; 96C49 (25:6c49) -> C9

Func_96c4a:
	push hl ; 96C4A (25:6c4a) -> E5
	add sp, $9a ; 96C4B (25:6c4b) -> E8 9A
	set_farcall_addrs_hli Func_1c11
	ld hl, sp+$00 ; 96C58 (25:6c58) -> F8 00
	push de ; 96C5A (25:6c5a) -> D5
	push hl ; 96C5B (25:6c5b) -> E5
	pop de ; 96C5C (25:6c5c) -> D1
	pop hl ; 96C5D (25:6c5d) -> E1
	ld hl, $0066 ; 96C5E (25:6c5e) -> 21 66 00
	call FarCall ; 96C61 (25:6c61) -> CD F8 03
	set_farcall_addrs_hli Func_1c27
	ld hl, sp+$00 ; 96C6F (25:6c6f) -> F8 00
	push hl ; 96C71 (25:6c71) -> E5
	call GetHLAtSPPlusParam8 ; 96C72 (25:6c72) -> CD 48 38
	ld l, d ; 96C75 (25:6c75) -> 6A
	pop de ; 96C76 (25:6c76) -> D1
	call FarCall ; 96C77 (25:6c77) -> CD F8 03
	push de ; 96C7A (25:6c7a) -> D5
	push hl ; 96C7B (25:6c7b) -> E5
	pop de ; 96C7C (25:6c7c) -> D1
	pop hl ; 96C7D (25:6c7d) -> E1
	add sp, $68 ; 96C7E (25:6c7e) -> E8 68
	push de ; 96C80 (25:6c80) -> D5
	push hl ; 96C81 (25:6c81) -> E5
	pop de ; 96C82 (25:6c82) -> D1
	pop hl ; 96C83 (25:6c83) -> E1
	ret  ; 96C84 (25:6c84) -> C9

Func_96c85:
	push af ; 96C85 (25:6c85) -> F5
	set_farcall_addrs_hli Func_333ba
	pop af ; 96C91 (25:6c91) -> F1
	call FarCall ; 96C92 (25:6c92) -> CD F8 03
	ret  ; 96C95 (25:6c95) -> C9

Func_96c96:
	push af ; 96C96 (25:6c96) -> F5
	ld l, $00 ; 96C97 (25:6c97) -> 2E 00
label_96c99:
	ld a, l ; 96C99 (25:6c99) -> 7D
	cp $08 ; 96C9A (25:6c9a) -> FE 08
	jp nc, label_96cbd ; 96C9C (25:6c9c) -> D2 BD 6C
	push hl ; 96C9F (25:6c9f) -> E5
	xor a ; 96CA0 (25:6ca0) -> AF
label_96ca1:
	ld hl, sp+$03 ; 96CA1 (25:6ca1) -> F8 03
	cp [hl] ; 96CA3 (25:6ca3) -> BE
	jp nc, label_96cb0 ; 96CA4 (25:6ca4) -> D2 B0 6C
	push af ; 96CA7 (25:6ca7) -> F5
	call NextOverworldFrame ; 96CA8 (25:6ca8) -> CD 65 04
	pop af ; 96CAB (25:6cab) -> F1
	inc a ; 96CAC (25:6cac) -> 3C
	jp label_96ca1 ; 96CAD (25:6cad) -> C3 A1 6C
label_96cb0:
	pop hl ; 96CB0 (25:6cb0) -> E1
	push hl ; 96CB1 (25:6cb1) -> E5
	ld a, $07 ; 96CB2 (25:6cb2) -> 3E 07
	sub l ; 96CB4 (25:6cb4) -> 95
	call SetVolume ; 96CB5 (25:6cb5) -> CD D0 1A
	pop hl ; 96CB8 (25:6cb8) -> E1
	inc l ; 96CB9 (25:6cb9) -> 2C
	jp label_96c99 ; 96CBA (25:6cba) -> C3 99 6C
label_96cbd:
	pop bc ; 96CBD (25:6cbd) -> C1
	ret  ; 96CBE (25:6cbe) -> C9

Func_96cbf:
	push af ; 96CBF (25:6cbf) -> F5
	xor a ; 96CC0 (25:6cc0) -> AF
label_96cc1:
	cp $08 ; 96CC1 (25:6cc1) -> FE 08
	jp nc, label_96ce1 ; 96CC3 (25:6cc3) -> D2 E1 6C
	push af ; 96CC6 (25:6cc6) -> F5
	xor a ; 96CC7 (25:6cc7) -> AF
label_96cc8:
	ld hl, sp+$03 ; 96CC8 (25:6cc8) -> F8 03
	cp [hl] ; 96CCA (25:6cca) -> BE
	jp nc, label_96cd7 ; 96CCB (25:6ccb) -> D2 D7 6C
	push af ; 96CCE (25:6cce) -> F5
	call NextOverworldFrame ; 96CCF (25:6ccf) -> CD 65 04
	pop af ; 96CD2 (25:6cd2) -> F1
	inc a ; 96CD3 (25:6cd3) -> 3C
	jp label_96cc8 ; 96CD4 (25:6cd4) -> C3 C8 6C
label_96cd7:
	pop af ; 96CD7 (25:6cd7) -> F1
	push af ; 96CD8 (25:6cd8) -> F5
	call SetVolume ; 96CD9 (25:6cd9) -> CD D0 1A
	pop af ; 96CDC (25:6cdc) -> F1
	inc a ; 96CDD (25:6cdd) -> 3C
	jp label_96cc1 ; 96CDE (25:6cde) -> C3 C1 6C
label_96ce1:
	pop bc ; 96CE1 (25:6ce1) -> C1
	ret  ; 96CE2 (25:6ce2) -> C9

Func_96ce3:
	push af ; 96CE3 (25:6ce3) -> F5
	set_farcall_addrs_hli Func_6ae47
	pop af ; 96CEF (25:6cef) -> F1
	call FarCall ; 96CF0 (25:6cf0) -> CD F8 03
	ret  ; 96CF3 (25:6cf3) -> C9

Func_96cf4:
	callba_hli DispatchMenu
	cp $ff ; 96D02 (25:6d02) -> FE FF
	jp nz, label_96d16 ; 96D04 (25:6d04) -> C2 16 6D
	set_farcall_addrs_hli FadeInMap
	xor a ; 96D12 (25:6d12) -> AF
	call FarCall ; 96D13 (25:6d13) -> CD F8 03
label_96d16:
	ret  ; 96D16 (25:6d16) -> C9

Func_96d17:
	callba_hli AttitudeMenu
	ret  ; 96D25 (25:6d25) -> C9

Func_96d26:
	push hl ; 96D26 (25:6d26) -> E5
	push de ; 96D27 (25:6d27) -> D5
	set_farcall_addrs_hli Func_c796a
	pop de ; 96D33 (25:6d33) -> D1
	pop hl ; 96D34 (25:6d34) -> E1
	call FarCall ; 96D35 (25:6d35) -> CD F8 03
	ret  ; 96D38 (25:6d38) -> C9

Func_96d39:
	callba_hli Func_53b6e
	ret  ; 96D47 (25:6d47) -> C9

Func_96d48:
	push af ; 96D48 (25:6d48) -> F5
	set_farcall_addrs_hli Func_fb55f
	pop af ; 96D54 (25:6d54) -> F1
	call FarCall ; 96D55 (25:6d55) -> CD F8 03
	ret  ; 96D58 (25:6d58) -> C9

Data_96d59:
	db $0b, $0f, $05, $01, $1e, $00, $0c, $0b, $0b, $0b, $2e, $09, $04, $01, $01, $0c
	db $01, $09, $2c, $09, $2b, $2e, $0b, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b
	db $2e, $0d, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e, $0f, $04, $01, $01
	db $0c, $01, $09, $2c, $09, $2b, $2e, $11, $04, $01, $01, $0c, $01, $09, $2c, $09
	db $2b, $2e, $3b, $03, $ff, $ff, $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, $25
	db $04, $65, $9b, $6d, $ff, $00, $10, $0e, $01, $01, $00, $04, $00, $25, $04, $65
	db $9b, $6d

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

