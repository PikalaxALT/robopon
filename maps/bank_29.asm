INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 29", ROMX
	script_library 29

Data_a50b4:
	warpdef $14, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $06, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, $34

Data_a50ca:
	dw $2be
	dw -1

Data_a50ce:
	dw $2bf
	dw -1

Data_a50d2:
	person_event $02, $0c, $08, $06, $01, $01, $02, $04, $00, $0000, $0000
	person_event $ff, $00, $12, $05, $01, $01, $00, $04, $01, Func_a5264, $0000
	person_event $ff, $00, $09, $0d, $01, $01, $00, $04, $01, Func_a5264, $0000

Data_a50fc:
	person_event $ff, $00, $13, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ca
	person_event $ff, $00, $13, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ce

Data_a5118:
	person_event $ff, $00, $09, $0f, $01, $01, $00, $04, $01, Func_a5398, $0000

Func_a5126:: ; a5126
	ld a, $0a ; A5126 (29:5126) -> 3E 0A
	ld [wc7e2], a ; A5128 (29:5128) -> EA E2 C7
	ld e, $02 ; A512B (29:512b) -> 1E 02
	ld hl, Data_a50b4 ; A512D (29:512d) -> 21 B4 50
	scall LoadWarps ; A5130 (29:5130) -> CD 3A 40
	ld a, $03 ; A5133 (29:5133) -> 3E 03
	scall PlayMusic ; A5135 (29:5135) -> CD E6 4E
	ld hl, $002e ; A5138 (29:5138) -> 21 2E 00
	scall CheckEventFlag ; A513B (29:513b) -> CD 2E 46
	cp $01 ; A513E (29:513e) -> FE 01
	jp nz, .asm_a5163 ; A5140 (29:5140) -> C2 63 51
	ld hl, $002f ; A5143 (29:5143) -> 21 2F 00
	scall CheckEventFlag ; A5146 (29:5146) -> CD 2E 46
	cp $01 ; A5149 (29:5149) -> FE 01
	jp nz, .asm_a5163 ; A514B (29:514b) -> C2 63 51
	ld hl, $0044 ; A514E (29:514e) -> 21 44 00
	scall CheckEventFlag ; A5151 (29:5151) -> CD 2E 46
	or a ; A5154 (29:5154) -> B7
	jp nz, .asm_a5163 ; A5155 (29:5155) -> C2 63 51
	ld e, $03 ; A5158 (29:5158) -> 1E 03
	ld hl, Data_a50d2 ; A515A (29:515a) -> 21 D2 50
	scall LoadMapObjects ; A515D (29:515d) -> CD FB 40
	jp .asm_a516b ; A5160 (29:5160) -> C3 6B 51
.asm_a5163:
	ld e, $01 ; A5163 (29:5163) -> 1E 01
	ld hl, Data_a5118 ; A5165 (29:5165) -> 21 18 51
	scall LoadMapObjects ; A5168 (29:5168) -> CD FB 40
.asm_a516b:
	ld a, $01 ; A516B (29:516b) -> 3E 01
	scall LoadPlayerSprite ; A516D (29:516d) -> CD C6 4C
	ld e, $02 ; A5170 (29:5170) -> 1E 02
	ld hl, Data_a50fc ; A5172 (29:5172) -> 21 FC 50
	scall LoadMapObjects ; A5175 (29:5175) -> CD FB 40
	scall Func_8001c ; A5178 (29:5178) -> CD 1C 40
	ret  ; A517B (29:517b) -> C9

Func_a517c:: ; a517c
	push af ; A517C (29:517c) -> F5
	set_farcall_addrs_hli FadeInMap
	xor a ; A5188 (29:5188) -> AF
	call FarCall ; A5189 (29:5189) -> CD F8 03
	xor a ; A518C (29:518c) -> AF
	scall PlayMusic ; A518D (29:518d) -> CD E6 4E
	ld a, $0a ; A5190 (29:5190) -> 3E 0A
	scall PlayMusic ; A5192 (29:5192) -> CD E6 4E
	xor a ; A5195 (29:5195) -> AF
	scall Func_80653 ; A5196 (29:5196) -> CD 53 46
	ld c, $01 ; A5199 (29:5199) -> 0E 01
	ld e, $01 ; A519B (29:519b) -> 1E 01
	ld a, $11 ; A519D (29:519d) -> 3E 11
	scall LoadEmote ; A519F (29:519f) -> CD 76 41
	scall WaitEmote ; A51A2 (29:51a2) -> CD D5 41
	ld hl, $003c ; A51A5 (29:51a5) -> 21 3C 00
	scall ScriptSleep ; A51A8 (29:51a8) -> CD 8F 46
	pop af ; A51AB (29:51ab) -> F1
	push af ; A51AC (29:51ac) -> F5
	cp $02 ; A51AD (29:51ad) -> FE 02
	jp z, .asm_a51f7 ; A51AF (29:51af) -> CA F7 51
	cp $01 ; A51B2 (29:51b2) -> FE 01
	jp z, .asm_a51d6 ; A51B4 (29:51b4) -> CA D6 51
	or a ; A51B7 (29:51b7) -> B7
	jp nz, .asm_a5223 ; A51B8 (29:51b8) -> C2 23 52
	ld hl, $001e ; A51BB (29:51bb) -> 21 1E 00
	scall ScriptSleep ; A51BE (29:51be) -> CD 8F 46
	ld hl, $0332 ; A51C1 (29:51c1) -> 21 32 03
	scall PrintTextWithNPCName ; A51C4 (29:51c4) -> CD A9 44
	ld hl, $003c ; A51C7 (29:51c7) -> 21 3C 00
	scall ScriptSleep ; A51CA (29:51ca) -> CD 8F 46
	ld hl, $0336 ; A51CD (29:51cd) -> 21 36 03
	scall PrintTextWithNPCName ; A51D0 (29:51d0) -> CD A9 44
	jp .asm_a5223 ; A51D3 (29:51d3) -> C3 23 52
.asm_a51d6:
	ld c, $01 ; A51D6 (29:51d6) -> 0E 01
	ld e, $02 ; A51D8 (29:51d8) -> 1E 02
	ld a, $11 ; A51DA (29:51da) -> 3E 11
	scall LoadEmote ; A51DC (29:51dc) -> CD 76 41
	scall WaitEmote ; A51DF (29:51df) -> CD D5 41
	ld hl, $0333 ; A51E2 (29:51e2) -> 21 33 03
	scall PrintTextWithNPCName ; A51E5 (29:51e5) -> CD A9 44
	ld hl, $003c ; A51E8 (29:51e8) -> 21 3C 00
	scall ScriptSleep ; A51EB (29:51eb) -> CD 8F 46
	ld hl, $0336 ; A51EE (29:51ee) -> 21 36 03
	scall PrintTextWithNPCName ; A51F1 (29:51f1) -> CD A9 44
	jp .asm_a5223 ; A51F4 (29:51f4) -> C3 23 52
.asm_a51f7:
	ld c, $01 ; A51F7 (29:51f7) -> 0E 01
	ld e, $02 ; A51F9 (29:51f9) -> 1E 02
	ld a, $11 ; A51FB (29:51fb) -> 3E 11
	scall LoadEmote ; A51FD (29:51fd) -> CD 76 41
	scall WaitEmote ; A5200 (29:5200) -> CD D5 41
	ld hl, $003c ; A5203 (29:5203) -> 21 3C 00
	scall ScriptSleep ; A5206 (29:5206) -> CD 8F 46
	ld a, $28 ; A5209 (29:5209) -> 3E 28
	scall PlaySFX ; A520B (29:520b) -> CD FE 4E
	ld c, $01 ; A520E (29:520e) -> 0E 01
	ld e, $04 ; A5210 (29:5210) -> 1E 04
	ld a, $11 ; A5212 (29:5212) -> 3E 11
	scall LoadEmote ; A5214 (29:5214) -> CD 76 41
	xor a ; A5217 (29:5217) -> AF
	scall PlayMusic ; A5218 (29:5218) -> CD E6 4E
	ld a, $15 ; A521B (29:521b) -> 3E 15
	scall PlayMusic ; A521D (29:521d) -> CD E6 4E
	scall WaitEmote ; A5220 (29:5220) -> CD D5 41
.asm_a5223:
	scall HideEmote ; A5223 (29:5223) -> CD 8B 41
	pop af ; A5226 (29:5226) -> F1
	cp $02 ; A5227 (29:5227) -> FE 02
	jp nz, .asm_a5247 ; A5229 (29:5229) -> C2 47 52
	ld a, $45 ; A522C (29:522c) -> 3E 45
	scall PlaySFX ; A522E (29:522e) -> CD FE 4E
	ld hl, $032e ; A5231 (29:5231) -> 21 2E 03
	scall PrintTextWithNPCName ; A5234 (29:5234) -> CD A9 44
	ld l, $18 ; A5237 (29:5237) -> 2E 18
	push hl ; A5239 (29:5239) -> E5
	ld c, $13 ; A523A (29:523a) -> 0E 13
	ld e, $00 ; A523C (29:523c) -> 1E 00
	ld a, $17 ; A523E (29:523e) -> 3E 17
	scall Func_80dff ; A5240 (29:5240) -> CD FF 4D
	pop bc ; A5243 (29:5243) -> C1
	jp .asm_a524c ; A5244 (29:5244) -> C3 4C 52
.asm_a5247:
	ld a, $01 ; A5247 (29:5247) -> 3E 01
	scall Func_80653 ; A5249 (29:5249) -> CD 53 46
.asm_a524c:
	ret  ; A524C (29:524c) -> C9

Data_a524d:
	db $0c, $06, $ff, $ff

Data_a5251:
	db $09, $06, $0c, $06, $ff

Data_a5256:
	db $09, $06, $ff, $ff

Data_a525a:
	db $09, $05, $12, $05, $ff, $ff

Data_a5260:
	db $0b, $06, $ff, $ff

Func_a5264:
	push af ; A5264 (29:5264) -> F5
	ld a, e ; A5265 (29:5265) -> 7B
	cp $02 ; A5266 (29:5266) -> FE 02
	jp nz, .asm_a5383 ; A5268 (29:5268) -> C2 83 53
	ld a, $0a ; A526B (29:526b) -> 3E 0A
	scall FadeOutAudio ; A526D (29:526d) -> CD F1 4F
	xor a ; A5270 (29:5270) -> AF
	scall PlayMusic ; A5271 (29:5271) -> CD E6 4E
	ld hl, sp+$01 ; A5274 (29:5274) -> F8 01
	ld a, [hl] ; A5276 (29:5276) -> 7E
	cp $01 ; A5277 (29:5277) -> FE 01
	jp nz, .asm_a5289 ; A5279 (29:5279) -> C2 89 52
	ld c, $01 ; A527C (29:527c) -> 0E 01
	ld de, Data_a524d ; A527E (29:527e) -> 11 4D 52
	ld a, $29 ; A5281 (29:5281) -> 3E 29
	scall MovePlayer ; A5283 (29:5283) -> CD 3E 46
	jp .asm_a5293 ; A5286 (29:5286) -> C3 93 52
.asm_a5289:
	ld c, $01 ; A5289 (29:5289) -> 0E 01
	ld de, Data_a5251 ; A528B (29:528b) -> 11 51 52
	ld a, $29 ; A528E (29:528e) -> 3E 29
	scall MovePlayer ; A5290 (29:5290) -> CD 3E 46
.asm_a5293:
	ld bc, Data_a5256 ; A5293 (29:5293) -> 01 56 52
	ld e, $29 ; A5296 (29:5296) -> 1E 29
	xor a ; A5298 (29:5298) -> AF
	scall MovePersonAndWait ; A5299 (29:5299) -> CD 88 46
	scall WaitNPCStep ; A529C (29:529c) -> CD 0C 42
	ld hl, $003c ; A529F (29:529f) -> 21 3C 00
	scall ScriptSleep ; A52A2 (29:52a2) -> CD 8F 46
	ld e, $01 ; A52A5 (29:52a5) -> 1E 01
	xor a ; A52A7 (29:52a7) -> AF
	scall SpriteFace ; A52A8 (29:52a8) -> CD 95 40
	ld a, $03 ; A52AB (29:52ab) -> 3E 03
	scall PlayerFace ; A52AD (29:52ad) -> CD 77 46
	ld hl, $001e ; A52B0 (29:52b0) -> 21 1E 00
	scall ScriptSleep ; A52B3 (29:52b3) -> CD 8F 46
	ld hl, $0109 ; A52B6 (29:52b6) -> 21 09 01
	scall PrintTextWithNPCName ; A52B9 (29:52b9) -> CD A9 44
	ld a, $01 ; A52BC (29:52bc) -> 3E 01
	scall FadeInAudio ; A52BE (29:52be) -> CD 1A 50
	ld a, $1b ; A52C1 (29:52c1) -> 3E 1B
	scall PlayMusic ; A52C3 (29:52c3) -> CD E6 4E
	ld hl, $001e ; A52C6 (29:52c6) -> 21 1E 00
	scall ScriptSleep ; A52C9 (29:52c9) -> CD 8F 46
	ld e, $01 ; A52CC (29:52cc) -> 1E 01
	ld a, $02 ; A52CE (29:52ce) -> 3E 02
	scall PlayerStep ; A52D0 (29:52d0) -> CD 1E 4E
	ld e, $01 ; A52D3 (29:52d3) -> 1E 01
	ld a, $02 ; A52D5 (29:52d5) -> 3E 02
	scall PlayerStep ; A52D7 (29:52d7) -> CD 1E 4E
	ld a, $5b ; A52DA (29:52da) -> 3E 5B
	scall PlaySFX ; A52DC (29:52dc) -> CD FE 4E
	ld c, $01 ; A52DF (29:52df) -> 0E 01
	ld e, $0f ; A52E1 (29:52e1) -> 1E 0F
	ld a, $15 ; A52E3 (29:52e3) -> 3E 15
	scall LoadEmote ; A52E5 (29:52e5) -> CD 76 41
	ld e, $00 ; A52E8 (29:52e8) -> 1E 00
	xor a ; A52EA (29:52ea) -> AF
	scall SetPersonVisibilityState ; A52EB (29:52eb) -> CD 3D 41
	xor a ; A52EE (29:52ee) -> AF
	scall Func_80653 ; A52EF (29:52ef) -> CD 53 46
	ld hl, $003c ; A52F2 (29:52f2) -> 21 3C 00
	scall ScriptSleep ; A52F5 (29:52f5) -> CD 8F 46
	ld a, $46 ; A52F8 (29:52f8) -> 3E 46
	scall PlaySFX ; A52FA (29:52fa) -> CD FE 4E
	ld hl, $001e ; A52FD (29:52fd) -> 21 1E 00
	scall ScriptSleep ; A5300 (29:5300) -> CD 8F 46
	ld a, $46 ; A5303 (29:5303) -> 3E 46
	scall PlaySFX ; A5305 (29:5305) -> CD FE 4E
	ld hl, $001e ; A5308 (29:5308) -> 21 1E 00
	scall ScriptSleep ; A530B (29:530b) -> CD 8F 46
	ld a, $46 ; A530E (29:530e) -> 3E 46
	scall PlaySFX ; A5310 (29:5310) -> CD FE 4E
	ld hl, $001e ; A5313 (29:5313) -> 21 1E 00
	scall ScriptSleep ; A5316 (29:5316) -> CD 8F 46
	scall WaitEmote ; A5319 (29:5319) -> CD D5 41
	ld e, $01 ; A531C (29:531c) -> 1E 01
	xor a ; A531E (29:531e) -> AF
	scall SetPersonVisibilityState ; A531F (29:531f) -> CD 3D 41
	ld a, $01 ; A5322 (29:5322) -> 3E 01
	scall Func_80653 ; A5324 (29:5324) -> CD 53 46
	scall HideEmote ; A5327 (29:5327) -> CD 8B 41
	ld e, $01 ; A532A (29:532a) -> 1E 01
	xor a ; A532C (29:532c) -> AF
	scall PlayerStep ; A532D (29:532d) -> CD 1E 4E
	ld e, $01 ; A5330 (29:5330) -> 1E 01
	xor a ; A5332 (29:5332) -> AF
	scall PlayerStep ; A5333 (29:5333) -> CD 1E 4E
	ld hl, $010a ; A5336 (29:5336) -> 21 0A 01
	scall PrintTextWithNPCName ; A5339 (29:5339) -> CD A9 44
	scall StartShakingScreen ; A533C (29:533c) -> CD A2 4E
	ld a, $65 ; A533F (29:533f) -> 3E 65
	scall PlaySFX ; A5341 (29:5341) -> CD FE 4E
	xor a ; A5344 (29:5344) -> AF
	scall PlayMusic ; A5345 (29:5345) -> CD E6 4E
	ld a, $1b ; A5348 (29:5348) -> 3E 1B
	scall PlayMusic ; A534A (29:534a) -> CD E6 4E
	ld bc, Data_a525a ; A534D (29:534d) -> 01 5A 52
	ld e, $29 ; A5350 (29:5350) -> 1E 29
	xor a ; A5352 (29:5352) -> AF
	scall MovePersonAndWait ; A5353 (29:5353) -> CD 88 46
	ld a, $2e ; A5356 (29:5356) -> 3E 2E
	scall PlaySFX ; A5358 (29:5358) -> CD FE 4E
	scall WaitNPCStep ; A535B (29:535b) -> CD 0C 42
	ld e, $00 ; A535E (29:535e) -> 1E 00
	xor a ; A5360 (29:5360) -> AF
	scall SetPersonVisibilityState ; A5361 (29:5361) -> CD 3D 41
	ld a, $65 ; A5364 (29:5364) -> 3E 65
	scall PlaySFX ; A5366 (29:5366) -> CD FE 4E
	ld c, $01 ; A5369 (29:5369) -> 0E 01
	ld de, Data_a5260 ; A536B (29:536b) -> 11 60 52
	ld a, $29 ; A536E (29:536e) -> 3E 29
	scall MovePlayer ; A5370 (29:5370) -> CD 3E 46
	scall WaitNPCStep ; A5373 (29:5373) -> CD 0C 42
	ld l, $06 ; A5376 (29:5376) -> 2E 06
	push hl ; A5378 (29:5378) -> E5
	ld c, $16 ; A5379 (29:5379) -> 0E 16
	ld e, $00 ; A537B (29:537b) -> 1E 00
	ld a, $18 ; A537D (29:537d) -> 3E 18
	scall Func_80dff ; A537F (29:537f) -> CD FF 4D
	pop bc ; A5382 (29:5382) -> C1
.asm_a5383:
	pop bc ; A5383 (29:5383) -> C1
	ret  ; A5384 (29:5384) -> C9

Func_a5385:
	ld a, $45 ; A5385 (29:5385) -> 3E 45
	scall PlaySFX ; A5387 (29:5387) -> CD FE 4E
	ld l, $18 ; A538A (29:538a) -> 2E 18
	push hl ; A538C (29:538c) -> E5
	ld c, $13 ; A538D (29:538d) -> 0E 13
	ld e, $00 ; A538F (29:538f) -> 1E 00
	ld a, $17 ; A5391 (29:5391) -> 3E 17
	scall Func_80dff ; A5393 (29:5393) -> CD FF 4D
	pop bc ; A5396 (29:5396) -> C1
	ret  ; A5397 (29:5397) -> C9

Func_a5398:
	ld a, e ; A5398 (29:5398) -> 7B
	cp $02 ; A5399 (29:5399) -> FE 02
	jp nz, .asm_a53dd ; A539B (29:539b) -> C2 DD 53
	ld hl, $002d ; A539E (29:539e) -> 21 2D 00
	scall CheckEventFlag ; A53A1 (29:53a1) -> CD 2E 46
	cp $01 ; A53A4 (29:53a4) -> FE 01
	jp nz, .asm_a53dd ; A53A6 (29:53a6) -> C2 DD 53
	ld a, $2a ; A53A9 (29:53a9) -> 3E 2A
	scall Func_80e5d ; A53AB (29:53ab) -> CD 5D 4E
	or a ; A53AE (29:53ae) -> B7
	jp z, .asm_a53d7 ; A53AF (29:53af) -> CA D7 53
	ld hl, $0334 ; A53B2 (29:53b2) -> 21 34 03
	scall PrintTextWithYesNoBox ; A53B5 (29:53b5) -> CD BA 44
	or a ; A53B8 (29:53b8) -> B7
	jp nz, .asm_a53d4 ; A53B9 (29:53b9) -> C2 D4 53
	ld a, $45 ; A53BC (29:53bc) -> 3E 45
	scall PlaySFX ; A53BE (29:53be) -> CD FE 4E
	ld hl, $001e ; A53C1 (29:53c1) -> 21 1E 00
	scall ScriptSleep ; A53C4 (29:53c4) -> CD 8F 46
	ld l, $18 ; A53C7 (29:53c7) -> 2E 18
	push hl ; A53C9 (29:53c9) -> E5
	ld c, $13 ; A53CA (29:53ca) -> 0E 13
	ld e, $00 ; A53CC (29:53cc) -> 1E 00
	ld a, $17 ; A53CE (29:53ce) -> 3E 17
	scall Func_80dff ; A53D0 (29:53d0) -> CD FF 4D
	pop bc ; A53D3 (29:53d3) -> C1
.asm_a53d4:
	jp .asm_a53dd ; A53D4 (29:53d4) -> C3 DD 53
.asm_a53d7:
	ld hl, $0335 ; A53D7 (29:53d7) -> 21 35 03
	scall PrintTextStandard ; A53DA (29:53da) -> CD 98 44
.asm_a53dd:
	ret  ; A53DD (29:53dd) -> C9

Data_a53de:
	warpdef $02, $0c, $02, $01, MAP_22_00, $06, $04, $06, $05, $2e

Data_a53e9:
	warpdef $02, $0c, $02, $01, MAP_24_00, $11, $04, $11, $05, $2e

Data_a53f4:
	dw $18e
	dw -1

Data_a53f8:
	person_event $06, $04, $06, $03, $01, $02, $02, $04, $00, Func_a549d, NULL
	person_event $13, $0c, $06, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $05, $07, $03, $03, $00, $04, $00, Func_a5500, NULL
	person_event $ff, $00, $00, $04, $03, $03, $00, $04, $00, Func_a553a, NULL
	person_event $0e, $04, $06, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_29, Data_a53f4
	person_event $ff, $00, $0a, $04, $03, $03, $00, $04, $00, Func_a55c0, NULL

Func_a544c:: ; a544c
	ld a, $10 ; A544C (29:544c) -> 3E 10
	ld [wc789], a ; A544E (29:544e) -> EA 89 C7
	ld e, $06 ; A5451 (29:5451) -> 1E 06
	ld hl, Data_a53f8 ; A5453 (29:5453) -> 21 F8 53
	scall LoadMapObjects ; A5456 (29:5456) -> CD FB 40
	ld hl, $0044 ; A5459 (29:5459) -> 21 44 00
	scall CheckEventFlag ; A545C (29:545c) -> CD 2E 46
	or a ; A545F (29:545f) -> B7
	jp nz, .asm_a546e ; A5460 (29:5460) -> C2 6E 54
	ld e, $01 ; A5463 (29:5463) -> 1E 01
	ld hl, Data_a53de ; A5465 (29:5465) -> 21 DE 53
	scall LoadWarps ; A5468 (29:5468) -> CD 3A 40
	jp .asm_a547d ; A546B (29:546b) -> C3 7D 54
.asm_a546e:
	ld e, $01 ; A546E (29:546e) -> 1E 01
	ld hl, Data_a53e9 ; A5470 (29:5470) -> 21 E9 53
	scall LoadWarps ; A5473 (29:5473) -> CD 3A 40
	ld e, $00 ; A5476 (29:5476) -> 1E 00
	ld a, $04 ; A5478 (29:5478) -> 3E 04
	scall SetPersonVisibilityState ; A547A (29:547a) -> CD 3D 41
.asm_a547d:
	ld e, $00 ; A547D (29:547d) -> 1E 00
	ld a, $01 ; A547F (29:547f) -> 3E 01
	scall SetPersonVisibilityState ; A5481 (29:5481) -> CD 3D 41
	ld a, $0c ; A5484 (29:5484) -> 3E 0C
	scall PlayMusic ; A5486 (29:5486) -> CD E6 4E
	ld a, $01 ; A5489 (29:5489) -> 3E 01
	scall LoadPlayerSprite ; A548B (29:548b) -> CD C6 4C
	ld a, $0a ; A548E (29:548e) -> 3E 0A
	ld [wc7e2], a ; A5490 (29:5490) -> EA E2 C7
	scall Func_8001c ; A5493 (29:5493) -> CD 1C 40
	ld hl, $0307 ; A5496 (29:5496) -> 21 07 03
	scall LandmarkSign ; A5499 (29:5499) -> CD 72 4F
	ret  ; A549C (29:549c) -> C9

Func_a549d:
	ld a, e ; A549D (29:549d) -> 7B
	or a ; A549E (29:549e) -> B7
	jp nz, .asm_a54f1 ; A549F (29:549f) -> C2 F1 54
	ld hl, $0017 ; A54A2 (29:54a2) -> 21 17 00
	scall CheckEventFlag ; A54A5 (29:54a5) -> CD 2E 46
	or a ; A54A8 (29:54a8) -> B7
	jp nz, .asm_a54ea ; A54A9 (29:54a9) -> C2 EA 54
	ld hl, $00fe ; A54AC (29:54ac) -> 21 FE 00
	scall PrintTextWithNPCName ; A54AF (29:54af) -> CD A9 44
	ld a, $2a ; A54B2 (29:54b2) -> 3E 2A
	scall PlaySFX ; A54B4 (29:54b4) -> CD FE 4E
	ld hl, $00ff ; A54B7 (29:54b7) -> 21 FF 00
	scall PrintTextStandard ; A54BA (29:54ba) -> CD 98 44
	ld c, $00 ; A54BD (29:54bd) -> 0E 00
	ld e, $01 ; A54BF (29:54bf) -> 1E 01
	ld a, $22 ; A54C1 (29:54c1) -> 3E 22
	scall Func_80d4d ; A54C3 (29:54c3) -> CD 4D 4D
	cp $ff ; A54C6 (29:54c6) -> FE FF
	jp nz, .asm_a54df ; A54C8 (29:54c8) -> C2 DF 54
	ld hl, $0290 ; A54CB (29:54cb) -> 21 90 02
	scall PrintTextStandard ; A54CE (29:54ce) -> CD 98 44
	ld c, $02 ; A54D1 (29:54d1) -> 0E 02
	ld e, $01 ; A54D3 (29:54d3) -> 1E 01
	ld a, $22 ; A54D5 (29:54d5) -> 3E 22
	scall Func_80d4d ; A54D7 (29:54d7) -> CD 4D 4D
	cp $ff ; A54DA (29:54da) -> FE FF
	jp nz, .asm_a54df ; A54DC (29:54dc) -> C2 DF 54
.asm_a54df:
	ld e, $01 ; A54DF (29:54df) -> 1E 01
	ld hl, $0017 ; A54E1 (29:54e1) -> 21 17 00
	scall EventFlagAction ; A54E4 (29:54e4) -> CD 1B 46
	jp .asm_a54f1 ; A54E7 (29:54e7) -> C3 F1 54
.asm_a54ea:
	ld e, $00 ; A54EA (29:54ea) -> 1E 00
	ld a, $10 ; A54EC (29:54ec) -> 3E 10
	scall Func_806a0 ; A54EE (29:54ee) -> CD A0 46
.asm_a54f1:
	ret  ; A54F1 (29:54f1) -> C9

Data_a54f2:
	db $06, $09, $06, $08, $06, $09, $05, $07, $07, $09
	db $06, $08, $ff, $ff

Func_a5500:
	ld a, e ; A5500 (29:5500) -> 7B
	or a ; A5501 (29:5501) -> B7
	jp nz, .asm_a5533 ; A5502 (29:5502) -> C2 33 55
	ld e, $01 ; A5505 (29:5505) -> 1E 01
	ld a, $01 ; A5507 (29:5507) -> 3E 01
	scall SetPersonVisibilityState ; A5509 (29:5509) -> CD 3D 41
	ld hl, $003c ; A550C (29:550c) -> 21 3C 00
	scall ScriptSleep ; A550F (29:550f) -> CD 8F 46
	ld bc, Data_a54f2 ; A5512 (29:5512) -> 01 F2 54
	ld e, $29 ; A5515 (29:5515) -> 1E 29
	ld a, $01 ; A5517 (29:5517) -> 3E 01
	scall MovePersonAndWait ; A5519 (29:5519) -> CD 88 46
	scall WaitNPCStep ; A551C (29:551c) -> CD 0C 42
	ld e, $02 ; A551F (29:551f) -> 1E 02
	ld a, $01 ; A5521 (29:5521) -> 3E 01
	scall SpriteFace ; A5523 (29:5523) -> CD 95 40
	ld hl, $003c ; A5526 (29:5526) -> 21 3C 00
	scall ScriptSleep ; A5529 (29:5529) -> CD 8F 46
	ld e, $00 ; A552C (29:552c) -> 1E 00
	ld a, $01 ; A552E (29:552e) -> 3E 01
	scall SetPersonVisibilityState ; A5530 (29:5530) -> CD 3D 41
.asm_a5533:
	ret  ; A5533 (29:5533) -> C9

Data_a5534:
	db $03, $07, $01, $07, $ff, $ff

Func_a553a:
	ld a, e ; A553A (29:553a) -> 7B
	or a ; A553B (29:553b) -> B7
	jp nz, .asm_a55b9 ; A553C (29:553c) -> C2 B9 55
	ld a, $0f ; A553F (29:553f) -> 3E 0F
	scall Func_80e6d ; A5541 (29:5541) -> CD 6D 4E
	cp $ff ; A5544 (29:5544) -> FE FF
	jp nz, .asm_a5567 ; A5546 (29:5546) -> C2 67 55
	ld a, $41 ; A5549 (29:5549) -> 3E 41
	scall Func_80e6d ; A554B (29:554b) -> CD 6D 4E
	cp $ff ; A554E (29:554e) -> FE FF
	jp nz, .asm_a5567 ; A5550 (29:5550) -> C2 67 55
	ld a, $50 ; A5553 (29:5553) -> 3E 50
	scall Func_80e6d ; A5555 (29:5555) -> CD 6D 4E
	cp $ff ; A5558 (29:5558) -> FE FF
	jp nz, .asm_a5567 ; A555A (29:555a) -> C2 67 55
	ld a, $64 ; A555D (29:555d) -> 3E 64
	scall Func_80e6d ; A555F (29:555f) -> CD 6D 4E
	cp $ff ; A5562 (29:5562) -> FE FF
	jp z, .asm_a55b3 ; A5564 (29:5564) -> CA B3 55
.asm_a5567:
	ld a, [wc790] ; A5567 (29:5567) -> FA 90 C7
	or a ; A556A (29:556a) -> B7
	jp z, .asm_a55aa ; A556B (29:556b) -> CA AA 55
	ld a, [wc790] ; A556E (29:556e) -> FA 90 C7
	cp $06 ; A5571 (29:5571) -> FE 06
	jp nc, .asm_a55aa ; A5573 (29:5573) -> D2 AA 55
	ld hl, $032d ; A5576 (29:5576) -> 21 2D 03
	scall PrintTextWithYesNoBox ; A5579 (29:5579) -> CD BA 44
	or a ; A557C (29:557c) -> B7
	jp nz, .asm_a55a7 ; A557D (29:557d) -> C2 A7 55
	ld a, [wPlayerFacing] ; A5580 (29:5580) -> FA 38 C8
	or a ; A5583 (29:5583) -> B7
	jp nz, .asm_a558a ; A5584 (29:5584) -> C2 8A 55
	jp .asm_a5597 ; A5587 (29:5587) -> C3 97 55
.asm_a558a:
	ld c, $01 ; A558A (29:558a) -> 0E 01
	ld de, Data_a5534 ; A558C (29:558c) -> 11 34 55
	ld a, $29 ; A558F (29:558f) -> 3E 29
	scall MovePlayer ; A5591 (29:5591) -> CD 3E 46
	scall WaitNPCStep ; A5594 (29:5594) -> CD 0C 42
.asm_a5597:
	call Func_a5640 ; A5597 (29:5597) -> CD 40 56
	ld l, $10 ; A559A (29:559a) -> 2E 10
	push hl ; A559C (29:559c) -> E5
	ld c, $01 ; A559D (29:559d) -> 0E 01
	ld e, $02 ; A559F (29:559f) -> 1E 02
	ld a, $1e ; A55A1 (29:55a1) -> 3E 1E
	scall Func_80dff ; A55A3 (29:55a3) -> CD FF 4D
	pop bc ; A55A6 (29:55a6) -> C1
.asm_a55a7:
	jp .asm_a55b0 ; A55A7 (29:55a7) -> C3 B0 55
.asm_a55aa:
	ld hl, $0377 ; A55AA (29:55aa) -> 21 77 03
	scall PrintTextStandard ; A55AD (29:55ad) -> CD 98 44
.asm_a55b0:
	jp .asm_a55b9 ; A55B0 (29:55b0) -> C3 B9 55
.asm_a55b3:
	ld hl, $0376 ; A55B3 (29:55b3) -> 21 76 03
	scall PrintTextStandard ; A55B6 (29:55b6) -> CD 98 44
.asm_a55b9:
	ret  ; A55B9 (29:55b9) -> C9

Data_a55ba:
	db $09, $07
	db $0b, $07, $ff, $ff

Func_a55c0:
	ld a, e ; A55C0 (29:55c0) -> 7B
	or a ; A55C1 (29:55c1) -> B7
	jp nz, .asm_a563f ; A55C2 (29:55c2) -> C2 3F 56
	ld a, $0f ; A55C5 (29:55c5) -> 3E 0F
	scall Func_80e6d ; A55C7 (29:55c7) -> CD 6D 4E
	cp $ff ; A55CA (29:55ca) -> FE FF
	jp nz, .asm_a55ed ; A55CC (29:55cc) -> C2 ED 55
	ld a, $41 ; A55CF (29:55cf) -> 3E 41
	scall Func_80e6d ; A55D1 (29:55d1) -> CD 6D 4E
	cp $ff ; A55D4 (29:55d4) -> FE FF
	jp nz, .asm_a55ed ; A55D6 (29:55d6) -> C2 ED 55
	ld a, $50 ; A55D9 (29:55d9) -> 3E 50
	scall Func_80e6d ; A55DB (29:55db) -> CD 6D 4E
	cp $ff ; A55DE (29:55de) -> FE FF
	jp nz, .asm_a55ed ; A55E0 (29:55e0) -> C2 ED 55
	ld a, $64 ; A55E3 (29:55e3) -> 3E 64
	scall Func_80e6d ; A55E5 (29:55e5) -> CD 6D 4E
	cp $ff ; A55E8 (29:55e8) -> FE FF
	jp z, .asm_a5639 ; A55EA (29:55ea) -> CA 39 56
.asm_a55ed:
	ld a, [wc790] ; A55ED (29:55ed) -> FA 90 C7
	or a ; A55F0 (29:55f0) -> B7
	jp z, .asm_a5630 ; A55F1 (29:55f1) -> CA 30 56
	ld a, [wc790] ; A55F4 (29:55f4) -> FA 90 C7
	cp $06 ; A55F7 (29:55f7) -> FE 06
	jp nc, .asm_a5630 ; A55F9 (29:55f9) -> D2 30 56
	ld hl, $032d ; A55FC (29:55fc) -> 21 2D 03
	scall PrintTextWithYesNoBox ; A55FF (29:55ff) -> CD BA 44
	or a ; A5602 (29:5602) -> B7
	jp nz, .asm_a562d ; A5603 (29:5603) -> C2 2D 56
	ld a, [wPlayerFacing] ; A5606 (29:5606) -> FA 38 C8
	or a ; A5609 (29:5609) -> B7
	jp nz, .asm_a5610 ; A560A (29:560a) -> C2 10 56
	jp .asm_a561d ; A560D (29:560d) -> C3 1D 56
.asm_a5610:
	ld c, $01 ; A5610 (29:5610) -> 0E 01
	ld de, $55ba ; A5612 (29:5612) -> 11 BA 55
	ld a, $29 ; A5615 (29:5615) -> 3E 29
	scall MovePlayer ; A5617 (29:5617) -> CD 3E 46
	scall WaitNPCStep ; A561A (29:561a) -> CD 0C 42
.asm_a561d:
	call Func_a5640 ; A561D (29:561d) -> CD 40 56
	ld l, $12 ; A5620 (29:5620) -> 2E 12
	push hl ; A5622 (29:5622) -> E5
	ld c, $2d ; A5623 (29:5623) -> 0E 2D
	ld e, $00 ; A5625 (29:5625) -> 1E 00
	ld a, $1e ; A5627 (29:5627) -> 3E 1E
	scall Func_80dff ; A5629 (29:5629) -> CD FF 4D
	pop bc ; A562C (29:562c) -> C1
.asm_a562d:
	jp .asm_a5636 ; A562D (29:562d) -> C3 36 56
.asm_a5630:
	ld hl, $0377 ; A5630 (29:5630) -> 21 77 03
	scall PrintTextStandard ; A5633 (29:5633) -> CD 98 44
.asm_a5636:
	jp .asm_a563f ; A5636 (29:5636) -> C3 3F 56
.asm_a5639:
	ld hl, $0376 ; A5639 (29:5639) -> 21 76 03
	scall PrintTextStandard ; A563C (29:563c) -> CD 98 44
.asm_a563f:
	ret  ; A563F (29:563f) -> C9

Func_a5640:
	xor a ; A5640 (29:5640) -> AF
	scall PlayMusic ; A5641 (29:5641) -> CD E6 4E
	ld a, $0a ; A5644 (29:5644) -> 3E 0A
	scall PlayMusic ; A5646 (29:5646) -> CD E6 4E
	xor a ; A5649 (29:5649) -> AF
	scall Func_80653 ; A564A (29:564a) -> CD 53 46
	ld c, $01 ; A564D (29:564d) -> 0E 01
	ld e, $01 ; A564F (29:564f) -> 1E 01
	ld a, $0b ; A5651 (29:5651) -> 3E 0B
	scall LoadEmote ; A5653 (29:5653) -> CD 76 41
	ld a, $44 ; A5656 (29:5656) -> 3E 44
	scall PlaySFX ; A5658 (29:5658) -> CD FE 4E
	scall WaitEmote ; A565B (29:565b) -> CD D5 41
	scall HideEmote ; A565E (29:565e) -> CD 8B 41
	ld a, $04 ; A5661 (29:5661) -> 3E 04
	scall LoadPlayerSprite ; A5663 (29:5663) -> CD C6 4C
	ld a, $01 ; A5666 (29:5666) -> 3E 01
	scall PlayerFace ; A5668 (29:5668) -> CD 77 46
	ret  ; A566B (29:566b) -> C9
