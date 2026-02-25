INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2a", ROMX
	script_library 2a

Data_a90b4:
	warpdef $20, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $11, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, $34
	warpdef $0e, $13, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $12, $13, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $14, $1a, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $18, $1a, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $09, $10, $01, $01, MAP_32_02, $01, $0a, $01, $09, $34
	warpdef $1e, $19, $01, $01, MAP_32_02, $01, $0a, $01, $09, $34
	warpdef $06, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $0a, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $0e, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $17, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $1b, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $1f, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $07, $0f, $01, $01, MAP_24_10, $05, $1a, $05, $19, $34

Data_a9159:
	dw $20f
	dw -1

Data_a915d:
	dw $215
	dw -1

Data_a9161:
	dw $202
	dw -1

Data_a9165:
	dw $20b
	dw -1

Data_a9169:
	dw $201
	dw -1

Data_a916d:
	dw $208
	dw -1

Data_a9171:
	dw $210
	dw -1

Data_a9175:
	dw $2c0
	dw -1

Data_a9179:
	db $5c, $10, $13, $11, $46
	db $5d, $08, $1b, $11, $4f

Data_a9183:
	person_event $00, $04, $08, $1f, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_a9159
	person_event $02, $04, $1b, $18, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a915d
	person_event $27, $04, $11, $1a, $01, $01, $03, $04, $00, Func_a94fe, NULL
	person_event $04, $04, $16, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9161
	person_event $04, $04, $1f, $15, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_a9165
	person_event $26, $04, $06, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9169
	person_event $26, $04, $0c, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a916d
	person_event $27, $04, $06, $17, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9171
	person_event $ff, $00, $1f, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $ff, $00, $1f, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $0f, $04, $06, $1f, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $1f, $01, $01, $02, $04, $00, Func_a95d7, NULL

Func_a922b:: ; a922b
	call Func_a933a ; A922B (2a:522b) -> CD 3A 53
	ld hl, Func_a933a ; A922E (2a:522e) -> 21 3A 53
	scall Func_80f11 ; A9231 (2a:5231) -> CD 11 4F
	ld l, $01 ; A9234 (2a:5234) -> 2E 01
	push hl ; A9236 (2a:5236) -> E5
	ld c, $01 ; A9237 (2a:5237) -> 0E 01
	ld e, $11 ; A9239 (2a:5239) -> 1E 11
	ld a, $07 ; A923B (2a:523b) -> 3E 07
	scall Func_80f24 ; A923D (2a:523d) -> CD 24 4F
	pop bc ; A9240 (2a:5240) -> C1
	ld l, $01 ; A9241 (2a:5241) -> 2E 01
	push hl ; A9243 (2a:5243) -> E5
	ld c, $01 ; A9244 (2a:5244) -> 0E 01
	ld e, $11 ; A9246 (2a:5246) -> 1E 11
	ld a, $0a ; A9248 (2a:5248) -> 3E 0A
	scall Func_80f24 ; A924A (2a:524a) -> CD 24 4F
	pop bc ; A924D (2a:524d) -> C1
	ld l, $01 ; A924E (2a:524e) -> 2E 01
	push hl ; A9250 (2a:5250) -> E5
	ld c, $01 ; A9251 (2a:5251) -> 0E 01
	ld e, $14 ; A9253 (2a:5253) -> 1E 14
	ld a, $0c ; A9255 (2a:5255) -> 3E 0C
	scall Func_80f24 ; A9257 (2a:5257) -> CD 24 4F
	pop bc ; A925A (2a:525a) -> C1
	ld l, $01 ; A925B (2a:525b) -> 2E 01
	push hl ; A925D (2a:525d) -> E5
	ld c, $01 ; A925E (2a:525e) -> 0E 01
	ld e, $1c ; A9260 (2a:5260) -> 1E 1C
	ld a, $0f ; A9262 (2a:5262) -> 3E 0F
	scall Func_80f24 ; A9264 (2a:5264) -> CD 24 4F
	pop bc ; A9267 (2a:5267) -> C1
	ld l, $01 ; A9268 (2a:5268) -> 2E 01
	push hl ; A926A (2a:526a) -> E5
	ld c, $01 ; A926B (2a:526b) -> 0E 01
	ld e, $1b ; A926D (2a:526d) -> 1E 1B
	ld a, $12 ; A926F (2a:526f) -> 3E 12
	scall Func_80f24 ; A9271 (2a:5271) -> CD 24 4F
	pop bc ; A9274 (2a:5274) -> C1
	ld l, $01 ; A9275 (2a:5275) -> 2E 01
	push hl ; A9277 (2a:5277) -> E5
	ld c, $01 ; A9278 (2a:5278) -> 0E 01
	ld e, $14 ; A927A (2a:527a) -> 1E 14
	ld a, $13 ; A927C (2a:527c) -> 3E 13
	scall Func_80f24 ; A927E (2a:527e) -> CD 24 4F
	pop bc ; A9281 (2a:5281) -> C1
	ld l, $01 ; A9282 (2a:5282) -> 2E 01
	push hl ; A9284 (2a:5284) -> E5
	ld c, $01 ; A9285 (2a:5285) -> 0E 01
	ld e, $12 ; A9287 (2a:5287) -> 1E 12
	ld a, $15 ; A9289 (2a:5289) -> 3E 15
	scall Func_80f24 ; A928B (2a:528b) -> CD 24 4F
	pop bc ; A928E (2a:528e) -> C1
	ld l, $01 ; A928F (2a:528f) -> 2E 01
	push hl ; A9291 (2a:5291) -> E5
	ld c, $01 ; A9292 (2a:5292) -> 0E 01
	ld e, $11 ; A9294 (2a:5294) -> 1E 11
	ld a, $19 ; A9296 (2a:5296) -> 3E 19
	scall Func_80f24 ; A9298 (2a:5298) -> CD 24 4F
	pop bc ; A929B (2a:529b) -> C1
	ld l, $01 ; A929C (2a:529c) -> 2E 01
	push hl ; A929E (2a:529e) -> E5
	ld c, $01 ; A929F (2a:529f) -> 0E 01
	ld e, $1a ; A92A1 (2a:52a1) -> 1E 1A
	ld a, $1c ; A92A3 (2a:52a3) -> 3E 1C
	scall Func_80f24 ; A92A5 (2a:52a5) -> CD 24 4F
	pop bc ; A92A8 (2a:52a8) -> C1
	ld l, $01 ; A92A9 (2a:52a9) -> 2E 01
	push hl ; A92AB (2a:52ab) -> E5
	ld c, $01 ; A92AC (2a:52ac) -> 0E 01
	ld e, $1b ; A92AE (2a:52ae) -> 1E 1B
	ld a, $19 ; A92B0 (2a:52b0) -> 3E 19
	scall Func_80f24 ; A92B2 (2a:52b2) -> CD 24 4F
	pop bc ; A92B5 (2a:52b5) -> C1
	ld e, $0f ; A92B6 (2a:52b6) -> 1E 0F
	ld hl, Data_a90b4 ; A92B8 (2a:52b8) -> 21 B4 50
	scall LoadWarps ; A92BB (2a:52bb) -> CD 3A 40
	ld a, $01 ; A92BE (2a:52be) -> 3E 01
	scall LoadPlayerSprite ; A92C0 (2a:52c0) -> CD C6 4C
	ld a, $0a ; A92C3 (2a:52c3) -> 3E 0A
	ld [wc7e2], a ; A92C5 (2a:52c5) -> EA E2 C7
	ld a, $07 ; A92C8 (2a:52c8) -> 3E 07
	ld [wc789], a ; A92CA (2a:52ca) -> EA 89 C7
	ld hl, $0044 ; A92CD (2a:52cd) -> 21 44 00
	scall CheckEventFlag ; A92D0 (2a:52d0) -> CD 2E 46
	or a ; A92D3 (2a:52d3) -> B7
	jp nz, .asm_a92e4 ; A92D4 (2a:52d4) -> C2 E4 52
	xor a ; A92D7 (2a:52d7) -> AF
	scall PlayMusic ; A92D8 (2a:52d8) -> CD E6 4E
	scall Func_8001c ; A92DB (2a:52db) -> CD 1C 40
	call Func_a93b6 ; A92DE (2a:52de) -> CD B6 53
	jp .asm_a9303 ; A92E1 (2a:52e1) -> C3 03 53
.asm_a92e4:
	ld e, $02 ; A92E4 (2a:52e4) -> 1E 02
	ld hl, Data_a9179 ; A92E6 (2a:52e6) -> 21 79 51
	scall Func_80ce7 ; A92E9 (2a:52e9) -> CD E7 4C
	ld e, $0c ; A92EC (2a:52ec) -> 1E 0C
	ld hl, Data_a9183 ; A92EE (2a:52ee) -> 21 83 51
	scall LoadMapObjects ; A92F1 (2a:52f1) -> CD FB 40
	ld e, $00 ; A92F4 (2a:52f4) -> 1E 00
	ld a, $0a ; A92F6 (2a:52f6) -> 3E 0A
	scall SetPersonVisibilityState ; A92F8 (2a:52f8) -> CD 3D 41
	ld a, $03 ; A92FB (2a:52fb) -> 3E 03
	scall PlayMusic ; A92FD (2a:52fd) -> CD E6 4E
	scall Func_8001c ; A9300 (2a:5300) -> CD 1C 40
.asm_a9303:
	ret  ; A9303 (2a:5303) -> C9

Data_a9304:
	db $16, $0e, $03, $01, $16, $0f

Data_a930a:
	db $16, $0e, $01, $01, $1a, $0f

Data_a9310:
	db $0d, $0f, $06, $01, $10, $10

Data_a9316:
	db $11, $0f, $02, $01, $14, $11

Data_a931c:
	db $1e, $0f, $03, $01, $16, $0f

Data_a9322:
	db $1e, $0f, $01, $01, $1a, $0f

Data_a9328:
	db $1a, $14, $03, $01, $13, $10

Data_a932e:
	db $0d, $10, $03, $01, $10, $10

Data_a9334:
	db $1a, $14, $02, $01, $14, $11

Func_a933a:
	ld hl, $00bf ; A933A (2a:533a) -> 21 BF 00
	scall CheckEventFlag ; A933D (2a:533d) -> CD 2E 46
	cp $01 ; A9340 (2a:5340) -> FE 01
	jp nz, .asm_a9351 ; A9342 (2a:5342) -> C2 51 53
	ld hl, Data_a931c ; A9345 (2a:5345) -> 21 1C 53
	scall Func_80d9b ; A9348 (2a:5348) -> CD 9B 4D
	scall Func_80f02 ; A934B (2a:534b) -> CD 02 4F
	jp .asm_a93b1 ; A934E (2a:534e) -> C3 B1 53
.asm_a9351:
	ld hl, $00c1 ; A9351 (2a:5351) -> 21 C1 00
	scall CheckEventFlag ; A9354 (2a:5354) -> CD 2E 46
	cp $01 ; A9357 (2a:5357) -> FE 01
	jp nz, .asm_a9368 ; A9359 (2a:5359) -> C2 68 53
	ld hl, Data_a9322 ; A935C (2a:535c) -> 21 22 53
	scall Func_80d9b ; A935F (2a:535f) -> CD 9B 4D
	scall Func_80f02 ; A9362 (2a:5362) -> CD 02 4F
	jp .asm_a93b1 ; A9365 (2a:5365) -> C3 B1 53
.asm_a9368:
	ld hl, $0044 ; A9368 (2a:5368) -> 21 44 00
	scall CheckEventFlag ; A936B (2a:536b) -> CD 2E 46
	or a ; A936E (2a:536e) -> B7
	jp nz, .asm_a9390 ; A936F (2a:536f) -> C2 90 53
	ld hl, Data_a9304 ; A9372 (2a:5372) -> 21 04 53
	scall Func_80d9b ; A9375 (2a:5375) -> CD 9B 4D
	ld hl, Data_a930a ; A9378 (2a:5378) -> 21 0A 53
	scall Func_80d9b ; A937B (2a:537b) -> CD 9B 4D
	ld hl, Data_a9310 ; A937E (2a:537e) -> 21 10 53
	scall Func_80d9b ; A9381 (2a:5381) -> CD 9B 4D
	ld hl, Data_a9316 ; A9384 (2a:5384) -> 21 16 53
	scall Func_80d9b ; A9387 (2a:5387) -> CD 9B 4D
	scall Func_80f02 ; A938A (2a:538a) -> CD 02 4F
	jp .asm_a93b1 ; A938D (2a:538d) -> C3 B1 53
.asm_a9390:
	ld hl, Data_a931c ; A9390 (2a:5390) -> 21 1C 53
	scall Func_80d9b ; A9393 (2a:5393) -> CD 9B 4D
	ld hl, Data_a9322 ; A9396 (2a:5396) -> 21 22 53
	scall Func_80d9b ; A9399 (2a:5399) -> CD 9B 4D
	ld hl, Data_a9328 ; A939C (2a:539c) -> 21 28 53
	scall Func_80d9b ; A939F (2a:539f) -> CD 9B 4D
	ld hl, Data_a932e ; A93A2 (2a:53a2) -> 21 2E 53
	scall Func_80d9b ; A93A5 (2a:53a5) -> CD 9B 4D
	ld hl, Data_a9334 ; A93A8 (2a:53a8) -> 21 34 53
	scall Func_80d9b ; A93AB (2a:53ab) -> CD 9B 4D
	scall Func_80f02 ; A93AE (2a:53ae) -> CD 02 4F
.asm_a93b1:
	ret  ; A93B1 (2a:53b1) -> C9

Data_a93b2:
	db $14, $0f, $ff, $ff

Func_a93b6:
	call Func_a933a ; A93B6 (2a:53b6) -> CD 3A 53
	scall Func_80f02 ; A93B9 (2a:53b9) -> CD 02 4F
	ld a, $65 ; A93BC (2a:53bc) -> 3E 65
	scall PlaySFX ; A93BE (2a:53be) -> CD FE 4E
	scall StartShakingScreen ; A93C1 (2a:53c1) -> CD A2 4E
	ld hl, $001e ; A93C4 (2a:53c4) -> 21 1E 00
	scall ScriptSleep ; A93C7 (2a:53c7) -> CD 8F 46
	ld c, $01 ; A93CA (2a:53ca) -> 0E 01
	ld e, $01 ; A93CC (2a:53cc) -> 1E 01
	ld a, $05 ; A93CE (2a:53ce) -> 3E 05
	scall LoadEmote ; A93D0 (2a:53d0) -> CD 76 41
	ld a, $24 ; A93D3 (2a:53d3) -> 3E 24
	scall PlaySFX ; A93D5 (2a:53d5) -> CD FE 4E
	scall WaitEmote ; A93D8 (2a:53d8) -> CD D5 41
	ld hl, $001e ; A93DB (2a:53db) -> 21 1E 00
	scall ScriptSleep ; A93DE (2a:53de) -> CD 8F 46
	scall HideEmote ; A93E1 (2a:53e1) -> CD 8B 41
	scall StopShakingScreen ; A93E4 (2a:53e4) -> CD B1 4E
	ld hl, $001e ; A93E7 (2a:53e7) -> 21 1E 00
	scall ScriptSleep ; A93EA (2a:53ea) -> CD 8F 46
	xor a ; A93ED (2a:53ed) -> AF
.asm_a93ee:
	cp $05 ; A93EE (2a:53ee) -> FE 05
	jp nc, .asm_a9400 ; A93F0 (2a:53f0) -> D2 00 54
	push af ; A93F3 (2a:53f3) -> F5
	ld e, $01 ; A93F4 (2a:53f4) -> 1E 01
	ld a, $02 ; A93F6 (2a:53f6) -> 3E 02
	scall PlayerStep ; A93F8 (2a:53f8) -> CD 1E 4E
	pop af ; A93FB (2a:53fb) -> F1
	inc a ; A93FC (2a:53fc) -> 3C
	jp .asm_a93ee ; A93FD (2a:53fd) -> C3 EE 53
.asm_a9400:
	scall StartShakingScreen ; A9400 (2a:5400) -> CD A2 4E
	ld hl, $001e ; A9403 (2a:5403) -> 21 1E 00
	scall ScriptSleep ; A9406 (2a:5406) -> CD 8F 46
	ld a, $45 ; A9409 (2a:5409) -> 3E 45
	scall PlaySFX ; A940B (2a:540b) -> CD FE 4E
	ld c, $01 ; A940E (2a:540e) -> 0E 01
	ld e, $04 ; A9410 (2a:5410) -> 1E 04
	ld a, $12 ; A9412 (2a:5412) -> 3E 12
	scall LoadEmote ; A9414 (2a:5414) -> CD 76 41
	ld e, $16 ; A9417 (2a:5417) -> 1E 16
	ld a, $18 ; A9419 (2a:5419) -> 3E 18
	scall MoveEmote ; A941B (2a:541b) -> CD E4 41
	ld e, $01 ; A941E (2a:541e) -> 1E 01
	ld hl, $00bf ; A9420 (2a:5420) -> 21 BF 00
	scall EventFlagAction ; A9423 (2a:5423) -> CD 1B 46
	call Func_a933a ; A9426 (2a:5426) -> CD 3A 53
	scall Func_80f02 ; A9429 (2a:5429) -> CD 02 4F
	scall WaitEmote ; A942C (2a:542c) -> CD D5 41
	scall HideEmote ; A942F (2a:542f) -> CD 8B 41
	ld hl, $001e ; A9432 (2a:5432) -> 21 1E 00
	scall ScriptSleep ; A9435 (2a:5435) -> CD 8F 46
	ld a, $45 ; A9438 (2a:5438) -> 3E 45
	scall PlaySFX ; A943A (2a:543a) -> CD FE 4E
	ld c, $01 ; A943D (2a:543d) -> 0E 01
	ld e, $04 ; A943F (2a:543f) -> 1E 04
	ld a, $12 ; A9441 (2a:5441) -> 3E 12
	scall LoadEmote ; A9443 (2a:5443) -> CD 76 41
	ld e, $16 ; A9446 (2a:5446) -> 1E 16
	ld a, $1b ; A9448 (2a:5448) -> 3E 1B
	scall MoveEmote ; A944A (2a:544a) -> CD E4 41
	ld e, $00 ; A944D (2a:544d) -> 1E 00
	ld hl, $00bf ; A944F (2a:544f) -> 21 BF 00
	scall EventFlagAction ; A9452 (2a:5452) -> CD 1B 46
	ld e, $01 ; A9455 (2a:5455) -> 1E 01
	ld hl, $00c1 ; A9457 (2a:5457) -> 21 C1 00
	scall EventFlagAction ; A945A (2a:545a) -> CD 1B 46
	call Func_a933a ; A945D (2a:545d) -> CD 3A 53
	scall Func_80f02 ; A9460 (2a:5460) -> CD 02 4F
	scall WaitEmote ; A9463 (2a:5463) -> CD D5 41
	scall HideEmote ; A9466 (2a:5466) -> CD 8B 41
	scall StopShakingScreen ; A9469 (2a:5469) -> CD B1 4E
	ld hl, $001e ; A946C (2a:546c) -> 21 1E 00
	scall ScriptSleep ; A946F (2a:546f) -> CD 8F 46
	xor a ; A9472 (2a:5472) -> AF
.asm_a9473:
	cp $02 ; A9473 (2a:5473) -> FE 02
	jp nc, .asm_a9485 ; A9475 (2a:5475) -> D2 85 54
	push af ; A9478 (2a:5478) -> F5
	ld e, $01 ; A9479 (2a:5479) -> 1E 01
	ld a, $02 ; A947B (2a:547b) -> 3E 02
	scall PlayerStep ; A947D (2a:547d) -> CD 1E 4E
	pop af ; A9480 (2a:5480) -> F1
	inc a ; A9481 (2a:5481) -> 3C
	jp .asm_a9473 ; A9482 (2a:5482) -> C3 73 54
.asm_a9485:
	scall StartShakingScreen ; A9485 (2a:5485) -> CD A2 4E
	ld hl, $001e ; A9488 (2a:5488) -> 21 1E 00
	scall ScriptSleep ; A948B (2a:548b) -> CD 8F 46
	ld c, $01 ; A948E (2a:548e) -> 0E 01
	ld e, $08 ; A9490 (2a:5490) -> 1E 08
	ld a, $12 ; A9492 (2a:5492) -> 3E 12
	scall LoadEmote ; A9494 (2a:5494) -> CD 76 41
	ld e, $16 ; A9497 (2a:5497) -> 1E 16
	ld a, $17 ; A9499 (2a:5499) -> 3E 17
	scall MoveEmote ; A949B (2a:549b) -> CD E4 41
	ld a, $45 ; A949E (2a:549e) -> 3E 45
	scall PlaySFX ; A94A0 (2a:54a0) -> CD FE 4E
	ld e, $00 ; A94A3 (2a:54a3) -> 1E 00
	ld hl, $00c1 ; A94A5 (2a:54a5) -> 21 C1 00
	scall EventFlagAction ; A94A8 (2a:54a8) -> CD 1B 46
	ld e, $01 ; A94AB (2a:54ab) -> 1E 01
	ld hl, $0044 ; A94AD (2a:54ad) -> 21 44 00
	scall EventFlagAction ; A94B0 (2a:54b0) -> CD 1B 46
	call Func_a933a ; A94B3 (2a:54b3) -> CD 3A 53
	scall Func_80f02 ; A94B6 (2a:54b6) -> CD 02 4F
	scall WaitEmote ; A94B9 (2a:54b9) -> CD D5 41
	ld hl, $001e ; A94BC (2a:54bc) -> 21 1E 00
	scall ScriptSleep ; A94BF (2a:54bf) -> CD 8F 46
	scall HideEmote ; A94C2 (2a:54c2) -> CD 8B 41
	scall StopShakingScreen ; A94C5 (2a:54c5) -> CD B1 4E
	xor a ; A94C8 (2a:54c8) -> AF
.asm_a94c9:
	cp $07 ; A94C9 (2a:54c9) -> FE 07
	jp nc, .asm_a94da ; A94CB (2a:54cb) -> D2 DA 54
	push af ; A94CE (2a:54ce) -> F5
	ld e, $01 ; A94CF (2a:54cf) -> 1E 01
	xor a ; A94D1 (2a:54d1) -> AF
	scall PlayerStep ; A94D2 (2a:54d2) -> CD 1E 4E
	pop af ; A94D5 (2a:54d5) -> F1
	inc a ; A94D6 (2a:54d6) -> 3C
	jp .asm_a94c9 ; A94D7 (2a:54d7) -> C3 C9 54
.asm_a94da:
	ld hl, $001e ; A94DA (2a:54da) -> 21 1E 00
	scall ScriptSleep ; A94DD (2a:54dd) -> CD 8F 46
	ld c, $01 ; A94E0 (2a:54e0) -> 0E 01
	ld de, Data_a93b2 ; A94E2 (2a:54e2) -> 11 B2 53
	ld a, $2a ; A94E5 (2a:54e5) -> 3E 2A
	scall MovePlayer ; A94E7 (2a:54e7) -> CD 3E 46
	ld hl, $001e ; A94EA (2a:54ea) -> 21 1E 00
	scall ScriptSleep ; A94ED (2a:54ed) -> CD 8F 46
	ld l, $0f ; A94F0 (2a:54f0) -> 2E 0F
	push hl ; A94F2 (2a:54f2) -> E5
	ld c, $14 ; A94F3 (2a:54f3) -> 0E 14
	ld e, $00 ; A94F5 (2a:54f5) -> 1E 00
	ld a, $18 ; A94F7 (2a:54f7) -> 3E 18
	scall Func_80dff ; A94F9 (2a:54f9) -> CD FF 4D
	pop bc ; A94FC (2a:54fc) -> C1
	ret  ; A94FD (2a:54fd) -> C9

Func_a94fe:
	push af ; A94FE (2a:54fe) -> F5
	push bc ; A94FF (2a:54ff) -> C5
	ld hl, sp+$00 ; A9500 (2a:5500) -> F8 00
	ld [hl], $ff ; A9502 (2a:5502) -> 36 FF
	ld a, e ; A9504 (2a:5504) -> 7B
	or a ; A9505 (2a:5505) -> B7
	jp nz, .asm_a95d4 ; A9506 (2a:5506) -> C2 D4 55
	ld hl, sp+$03 ; A9509 (2a:5509) -> F8 03
	ld a, [hl] ; A950B (2a:550b) -> 7E
	scall FacePlayer ; A950C (2a:550c) -> CD 4B 44
	ld a, [wc796] ; A950F (2a:550f) -> FA 96 C7
	cp $0e ; A9512 (2a:5512) -> FE 0E
	jp nz, .asm_a9599 ; A9514 (2a:5514) -> C2 99 55
	ld a, $83 ; A9517 (2a:5517) -> 3E 83
	scall Func_80e6d ; A9519 (2a:5519) -> CD 6D 4E
	ld hl, sp+$01 ; A951C (2a:551c) -> F8 01
	ld [hl], a ; A951E (2a:551e) -> 77
	cp $ff ; A951F (2a:551f) -> FE FF
	jp z, .asm_a9596 ; A9521 (2a:5521) -> CA 96 55
	ld hl, $0415 ; A9524 (2a:5524) -> 21 15 04
	scall PrintTextWithNPCName ; A9527 (2a:5527) -> CD A9 44
	ld a, $83 ; A952A (2a:552a) -> 3E 83
	scall Func_80e7d ; A952C (2a:552c) -> CD 7D 4E
	cp $01 ; A952F (2a:552f) -> FE 01
	jp nz, .asm_a958d ; A9531 (2a:5531) -> C2 8D 55
	ld hl, $0294 ; A9534 (2a:5534) -> 21 94 02
	scall PrintTextWithNPCName ; A9537 (2a:5537) -> CD A9 44
	ld hl, $0400 ; A953A (2a:553a) -> 21 00 04
	scall PrintTextWithYesNoBox ; A953D (2a:553d) -> CD BA 44
	or a ; A9540 (2a:5540) -> B7
	jp nz, .asm_a957c ; A9541 (2a:5541) -> C2 7C 55
	ld a, $68 ; A9544 (2a:5544) -> 3E 68
	scall PlaySFX ; A9546 (2a:5546) -> CD FE 4E
	ld hl, $040a ; A9549 (2a:5549) -> 21 0A 04
	scall PrintTextWithNPCName ; A954C (2a:554c) -> CD A9 44
	ld hl, sp+$01 ; A954F (2a:554f) -> F8 01
	ld l, [hl] ; A9551 (2a:5551) -> 6E
	ld h, $00 ; A9552 (2a:5552) -> 26 00
	ld de, $0b00 ; A9554 (2a:5554) -> 11 00 0B
	add hl, de ; A9557 (2a:5557) -> 19
	scall Func_80488 ; A9558 (2a:5558) -> CD 88 44
	ld a, l ; A955B (2a:555b) -> 7D
	push af ; A955C (2a:555c) -> F5
	ld c, $00 ; A955D (2a:555d) -> 0E 00
	ld e, $01 ; A955F (2a:555f) -> 1E 01
	ld hl, sp+$03 ; A9561 (2a:5561) -> F8 03
	ld a, [hl] ; A9563 (2a:5563) -> 7E
	scall GiveRobot ; A9564 (2a:5564) -> CD 87 4D
	pop af ; A9567 (2a:5567) -> F1
	ld c, a ; A9568 (2a:5568) -> 4F
	ld e, $00 ; A9569 (2a:5569) -> 1E 00
IF DEF(SUN)
	ld a, $a9 ; A956B (2a:556b) -> 3E A9
ELIF DEF(STAR)
	ld a, $aa ; A956B (2a:556b) -> 3E A9
ENDC
	scall GiveRobot ; A956D (2a:556d) -> CD 87 4D
	ld a, $0f ; A9570 (2a:5570) -> 3E 0F
	ld [wc796], a ; A9572 (2a:5572) -> EA 96 C7
	ld hl, sp+$00 ; A9575 (2a:5575) -> F8 00
	ld [hl], $01 ; A9577 (2a:5577) -> 36 01
	jp .asm_a958a ; A9579 (2a:5579) -> C3 8A 55
.asm_a957c:
	ld a, $69 ; A957C (2a:557c) -> 3E 69
	scall PlaySFX ; A957E (2a:557e) -> CD FE 4E
	ld hl, $040b ; A9581 (2a:5581) -> 21 0B 04
	scall PrintTextWithNPCName ; A9584 (2a:5584) -> CD A9 44
	jp .asm_a95d4 ; A9587 (2a:5587) -> C3 D4 55
.asm_a958a:
	jp .asm_a9596 ; A958A (2a:558a) -> C3 96 55
.asm_a958d:
	ld hl, $046e ; A958D (2a:558d) -> 21 6E 04
	scall PrintTextStandard ; A9590 (2a:5590) -> CD 98 44
	jp .asm_a95d4 ; A9593 (2a:5593) -> C3 D4 55
.asm_a9596:
	jp .asm_a95af ; A9596 (2a:5596) -> C3 AF 55
.asm_a9599:
	ld a, $83 ; A9599 (2a:5599) -> 3E 83
	scall Func_80e6d ; A959B (2a:559b) -> CD 6D 4E
	ld hl, sp+$01 ; A959E (2a:559e) -> F8 01
	ld [hl], a ; A95A0 (2a:55a0) -> 77
	cp $ff ; A95A1 (2a:55a1) -> FE FF
	jp z, .asm_a95af ; A95A3 (2a:55a3) -> CA AF 55
	ld hl, $0140 ; A95A6 (2a:55a6) -> 21 40 01
	scall PrintTextStandard ; A95A9 (2a:55a9) -> CD 98 44
	jp .asm_a95d4 ; A95AC (2a:55ac) -> C3 D4 55
.asm_a95af:
	ld hl, sp+$00 ; A95AF (2a:55af) -> F8 00
	ld a, [hl] ; A95B1 (2a:55b1) -> 7E
	cp $ff ; A95B2 (2a:55b2) -> FE FF
	jp nz, .asm_a95d4 ; A95B4 (2a:55b4) -> C2 D4 55
	ld a, [wc796] ; A95B7 (2a:55b7) -> FA 96 C7
	cp $0f ; A95BA (2a:55ba) -> FE 0F
	jp nz, .asm_a95c8 ; A95BC (2a:55bc) -> C2 C8 55
	ld hl, $0430 ; A95BF (2a:55bf) -> 21 30 04
	scall PrintTextWithNPCName ; A95C2 (2a:55c2) -> CD A9 44
	jp .asm_a95d4 ; A95C5 (2a:55c5) -> C3 D4 55
.asm_a95c8:
	ld hl, $0415 ; A95C8 (2a:55c8) -> 21 15 04
	scall PrintTextWithNPCName ; A95CB (2a:55cb) -> CD A9 44
	ld hl, $042a ; A95CE (2a:55ce) -> 21 2A 04
	scall PrintTextWithNPCName ; A95D1 (2a:55d1) -> CD A9 44
.asm_a95d4:
	pop bc ; A95D4 (2a:55d4) -> C1
	pop bc ; A95D5 (2a:55d5) -> C1
	ret  ; A95D6 (2a:55d6) -> C9

Func_a95d7:
	ld a, e ; A95D7 (2a:55d7) -> 7B
	or a ; A95D8 (2a:55d8) -> B7
	jp nz, .asm_a96de ; A95D9 (2a:55d9) -> C2 DE 56
	ld hl, $00de ; A95DC (2a:55dc) -> 21 DE 00
	scall CheckEventFlag ; A95DF (2a:55df) -> CD 2E 46
	or a ; A95E2 (2a:55e2) -> B7
	jp nz, .asm_a96d8 ; A95E3 (2a:55e3) -> C2 D8 56
	ld a, $5e ; A95E6 (2a:55e6) -> 3E 5E
	scall PlaySFX ; A95E8 (2a:55e8) -> CD FE 4E
	ld c, $02 ; A95EB (2a:55eb) -> 0E 02
	ld e, $02 ; A95ED (2a:55ed) -> 1E 02
	ld a, $08 ; A95EF (2a:55ef) -> 3E 08
	scall LoadEmote ; A95F1 (2a:55f1) -> CD 76 41
	ld e, $1f ; A95F4 (2a:55f4) -> 1E 1F
	ld a, $06 ; A95F6 (2a:55f6) -> 3E 06
	scall MoveEmote ; A95F8 (2a:55f8) -> CD E4 41
	scall WaitEmote ; A95FB (2a:55fb) -> CD D5 41
	scall HideEmote ; A95FE (2a:55fe) -> CD 8B 41
	ld a, $28 ; A9601 (2a:5601) -> 3E 28
	scall PlaySFX ; A9603 (2a:5603) -> CD FE 4E
	ld e, $01 ; A9606 (2a:5606) -> 1E 01
	ld a, $0a ; A9608 (2a:5608) -> 3E 0A
	scall SetPersonVisibilityState ; A960A (2a:560a) -> CD 3D 41
	ld a, $60 ; A960D (2a:560d) -> 3E 60
	scall PlaySFX ; A960F (2a:560f) -> CD FE 4E
	ld e, $03 ; A9612 (2a:5612) -> 1E 03
	ld a, $0a ; A9614 (2a:5614) -> 3E 0A
	scall SpriteFace ; A9616 (2a:5616) -> CD 95 40
	ld e, $00 ; A9619 (2a:5619) -> 1E 00
	ld a, $0a ; A961B (2a:561b) -> 3E 0A
	scall SpriteFace ; A961D (2a:561d) -> CD 95 40
	ld e, $01 ; A9620 (2a:5620) -> 1E 01
	ld a, $0a ; A9622 (2a:5622) -> 3E 0A
	scall SpriteFace ; A9624 (2a:5624) -> CD 95 40
	ld e, $02 ; A9627 (2a:5627) -> 1E 02
	ld a, $0a ; A9629 (2a:5629) -> 3E 0A
	scall SpriteFace ; A962B (2a:562b) -> CD 95 40
	ld e, $03 ; A962E (2a:562e) -> 1E 03
	ld a, $0a ; A9630 (2a:5630) -> 3E 0A
	scall SpriteFace ; A9632 (2a:5632) -> CD 95 40
	ld e, $00 ; A9635 (2a:5635) -> 1E 00
	ld a, $0a ; A9637 (2a:5637) -> 3E 0A
	scall SpriteFace ; A9639 (2a:5639) -> CD 95 40
	ld e, $01 ; A963C (2a:563c) -> 1E 01
	ld a, $0a ; A963E (2a:563e) -> 3E 0A
	scall SpriteFace ; A9640 (2a:5640) -> CD 95 40
	ld e, $02 ; A9643 (2a:5643) -> 1E 02
	ld a, $0a ; A9645 (2a:5645) -> 3E 0A
	scall SpriteFace ; A9647 (2a:5647) -> CD 95 40
	ld a, $0f ; A964A (2a:564a) -> 3E 0F
	scall FadeOutAudio ; A964C (2a:564c) -> CD F1 4F
	xor a ; A964F (2a:564f) -> AF
	scall PlayMusic ; A9650 (2a:5650) -> CD E6 4E
	ld a, $01 ; A9653 (2a:5653) -> 3E 01
	scall FadeInAudio ; A9655 (2a:5655) -> CD 1A 50
	ld a, $14 ; A9658 (2a:5658) -> 3E 14
	scall PlayMusic ; A965A (2a:565a) -> CD E6 4E
	ld a, $0a ; A965D (2a:565d) -> 3E 0A
	scall FacePlayer ; A965F (2a:565f) -> CD 4B 44
	ld hl, $001e ; A9662 (2a:5662) -> 21 1E 00
	scall ScriptSleep ; A9665 (2a:5665) -> CD 8F 46
	ld c, $0d ; A9668 (2a:5668) -> 0E 0D
	ld e, $14 ; A966A (2a:566a) -> 1E 14
	ld a, $0a ; A966C (2a:566c) -> 3E 0A
	scall Func_80e8d ; A966E (2a:566e) -> CD 8D 4E
	ld e, $01 ; A9671 (2a:5671) -> 1E 01
	ld hl, $00de ; A9673 (2a:5673) -> 21 DE 00
	scall EventFlagAction ; A9676 (2a:5676) -> CD 1B 46
	ld a, $60 ; A9679 (2a:5679) -> 3E 60
	scall PlaySFX ; A967B (2a:567b) -> CD FE 4E
	ld e, $03 ; A967E (2a:567e) -> 1E 03
	ld a, $0a ; A9680 (2a:5680) -> 3E 0A
	scall SpriteFace ; A9682 (2a:5682) -> CD 95 40
	ld e, $00 ; A9685 (2a:5685) -> 1E 00
	ld a, $0a ; A9687 (2a:5687) -> 3E 0A
	scall SpriteFace ; A9689 (2a:5689) -> CD 95 40
	ld e, $01 ; A968C (2a:568c) -> 1E 01
	ld a, $0a ; A968E (2a:568e) -> 3E 0A
	scall SpriteFace ; A9690 (2a:5690) -> CD 95 40
	ld e, $02 ; A9693 (2a:5693) -> 1E 02
	ld a, $0a ; A9695 (2a:5695) -> 3E 0A
	scall SpriteFace ; A9697 (2a:5697) -> CD 95 40
	ld e, $03 ; A969A (2a:569a) -> 1E 03
	ld a, $0a ; A969C (2a:569c) -> 3E 0A
	scall SpriteFace ; A969E (2a:569e) -> CD 95 40
	ld e, $00 ; A96A1 (2a:56a1) -> 1E 00
	ld a, $0a ; A96A3 (2a:56a3) -> 3E 0A
	scall SpriteFace ; A96A5 (2a:56a5) -> CD 95 40
	ld e, $01 ; A96A8 (2a:56a8) -> 1E 01
	ld a, $0a ; A96AA (2a:56aa) -> 3E 0A
	scall SpriteFace ; A96AC (2a:56ac) -> CD 95 40
	ld e, $02 ; A96AF (2a:56af) -> 1E 02
	ld a, $0a ; A96B1 (2a:56b1) -> 3E 0A
	scall SpriteFace ; A96B3 (2a:56b3) -> CD 95 40
	ld a, $0f ; A96B6 (2a:56b6) -> 3E 0F
	scall FadeOutAudio ; A96B8 (2a:56b8) -> CD F1 4F
	xor a ; A96BB (2a:56bb) -> AF
	scall PlayMusic ; A96BC (2a:56bc) -> CD E6 4E
	ld a, $01 ; A96BF (2a:56bf) -> 3E 01
	scall FadeInAudio ; A96C1 (2a:56c1) -> CD 1A 50
	ld a, $03 ; A96C4 (2a:56c4) -> 3E 03
	scall PlayMusic ; A96C6 (2a:56c6) -> CD E6 4E
	ld a, $0a ; A96C9 (2a:56c9) -> 3E 0A
	scall FacePlayer ; A96CB (2a:56cb) -> CD 4B 44
	ld e, $00 ; A96CE (2a:56ce) -> 1E 00
	ld a, $0a ; A96D0 (2a:56d0) -> 3E 0A
	scall SetPersonVisibilityState ; A96D2 (2a:56d2) -> CD 3D 41
	jp .asm_a96de ; A96D5 (2a:56d5) -> C3 DE 56
.asm_a96d8:
	ld hl, $015c ; A96D8 (2a:56d8) -> 21 5C 01
	scall PrintTextStandard ; A96DB (2a:56db) -> CD 98 44
.asm_a96de:
	ret  ; A96DE (2a:56de) -> C9

Data_a96df:
	warpdef $04, $1a, $03, $01, MAP_24_00, $07, $0f, $07, $10, $2e

Data_a96ea:
IF DEF(SUN)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9730:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9764, NULL

Func_a973e:: ; a973e
	ld e, $01 ; A973E (2a:573e) -> 1E 01
	ld hl, Data_a96df ; A9740 (2a:5740) -> 21 DF 56
	scall LoadWarps ; A9743 (2a:5743) -> CD 3A 40
	ld a, $03 ; A9746 (2a:5746) -> 3E 03
	scall Func_80d01 ; A9748 (2a:5748) -> CD 01 4D
	ld e, $05 ; A974B (2a:574b) -> 1E 05
	ld hl, Data_a96ea ; A974D (2a:574d) -> 21 EA 56
	scall LoadEncounters ; A9750 (2a:5750) -> CD 24 4D
	ld e, $01 ; A9753 (2a:5753) -> 1E 01
	ld hl, Data_a9730 ; A9755 (2a:5755) -> 21 30 57
	scall LoadMapObjects ; A9758 (2a:5758) -> CD FB 40
	ld a, $08 ; A975B (2a:575b) -> 3E 08
	scall PlayMusic ; A975D (2a:575d) -> CD E6 4E
	scall Func_8001c ; A9760 (2a:5760) -> CD 1C 40
	ret  ; A9763 (2a:5763) -> C9

Func_a9764:
	ld a, e ; A9764 (2a:5764) -> 7B
	cp $02 ; A9765 (2a:5765) -> FE 02
	jp nz, .asm_a9793 ; A9767 (2a:5767) -> C2 93 57
	ld a, $31 ; A976A (2a:576a) -> 3E 31
	scall PlaySFX ; A976C (2a:576c) -> CD FE 4E
	ld hl, $001e ; A976F (2a:576f) -> 21 1E 00
	scall ScriptSleep ; A9772 (2a:5772) -> CD 8F 46
	scall StartShakingScreen ; A9775 (2a:5775) -> CD A2 4E
	ld a, $64 ; A9778 (2a:5778) -> 3E 64
	scall PlaySFX ; A977A (2a:577a) -> CD FE 4E
	ld hl, $005a ; A977D (2a:577d) -> 21 5A 00
	scall ScriptSleep ; A9780 (2a:5780) -> CD 8F 46
	scall StopShakingScreen ; A9783 (2a:5783) -> CD B1 4E
	ld l, $0c ; A9786 (2a:5786) -> 2E 0C
	push hl ; A9788 (2a:5788) -> E5
	ld c, $12 ; A9789 (2a:5789) -> 0E 12
	ld e, $0b ; A978B (2a:578b) -> 1E 0B
	ld a, $18 ; A978D (2a:578d) -> 3E 18
	scall Func_80dff ; A978F (2a:578f) -> CD FF 4D
	pop bc ; A9792 (2a:5792) -> C1
.asm_a9793:
	ret  ; A9793 (2a:5793) -> C9

Data_a9794:
	warpdef $02, $04, $01, $01, MAP_24_14, $02, $18, $03, $18, $2e

Data_a979f:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0b, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0b, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0b, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0b, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0b, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a97e5:
	person_event $ff, $00, $12, $0c, $01, $01, $00, $04, $01, Func_a9819, NULL

Func_a97f3:: ; a97f3
	ld e, $01 ; A97F3 (2a:57f3) -> 1E 01
	ld hl, Data_a9794 ; A97F5 (2a:57f5) -> 21 94 57
	scall LoadWarps ; A97F8 (2a:57f8) -> CD 3A 40
	ld a, $03 ; A97FB (2a:57fb) -> 3E 03
	scall Func_80d01 ; A97FD (2a:57fd) -> CD 01 4D
	ld e, $05 ; A9800 (2a:5800) -> 1E 05
	ld hl, Data_a979f ; A9802 (2a:5802) -> 21 9F 57
	scall LoadEncounters ; A9805 (2a:5805) -> CD 24 4D
	ld e, $01 ; A9808 (2a:5808) -> 1E 01
	ld hl, Data_a97e5 ; A980A (2a:580a) -> 21 E5 57
	scall LoadMapObjects ; A980D (2a:580d) -> CD FB 40
	ld a, $08 ; A9810 (2a:5810) -> 3E 08
	scall PlayMusic ; A9812 (2a:5812) -> CD E6 4E
	scall Func_8001c ; A9815 (2a:5815) -> CD 1C 40
	ret  ; A9818 (2a:5818) -> C9

Func_a9819:
	ld a, e ; A9819 (2a:5819) -> 7B
	cp $02 ; A981A (2a:581a) -> FE 02
	jp nz, .asm_a9848 ; A981C (2a:581c) -> C2 48 58
	ld a, $31 ; A981F (2a:581f) -> 3E 31
	scall PlaySFX ; A9821 (2a:5821) -> CD FE 4E
	ld hl, $001e ; A9824 (2a:5824) -> 21 1E 00
	scall ScriptSleep ; A9827 (2a:5827) -> CD 8F 46
	scall StartShakingScreen ; A982A (2a:582a) -> CD A2 4E
	ld a, $64 ; A982D (2a:582d) -> 3E 64
	scall PlaySFX ; A982F (2a:582f) -> CD FE 4E
	ld hl, $005a ; A9832 (2a:5832) -> 21 5A 00
	scall ScriptSleep ; A9835 (2a:5835) -> CD 8F 46
	scall StopShakingScreen ; A9838 (2a:5838) -> CD B1 4E
	ld l, $14 ; A983B (2a:583b) -> 2E 14
	push hl ; A983D (2a:583d) -> E5
	ld c, $05 ; A983E (2a:583e) -> 0E 05
	ld e, $0c ; A9840 (2a:5840) -> 1E 0C
	ld a, $18 ; A9842 (2a:5842) -> 3E 18
	scall Func_80dff ; A9844 (2a:5844) -> CD FF 4D
	pop bc ; A9847 (2a:5847) -> C1
.asm_a9848:
	ret  ; A9848 (2a:5848) -> C9

Data_a9849:
	db $36, $0f, $04, $01, $31

Data_a984e:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9894:
	person_event $ff, $00, $05, $14, $01, $01, $00, $04, $01, Func_a98c8, NULL

Func_a98a2:: ; a98a2
	ld e, $01 ; A98A2 (2a:58a2) -> 1E 01
	ld hl, Data_a9849 ; A98A4 (2a:58a4) -> 21 49 58
	scall Func_80ce7 ; A98A7 (2a:58a7) -> CD E7 4C
	ld a, $03 ; A98AA (2a:58aa) -> 3E 03
	scall Func_80d01 ; A98AC (2a:58ac) -> CD 01 4D
	ld e, $05 ; A98AF (2a:58af) -> 1E 05
	ld hl, Data_a984e ; A98B1 (2a:58b1) -> 21 4E 58
	scall LoadEncounters ; A98B4 (2a:58b4) -> CD 24 4D
	ld e, $01 ; A98B7 (2a:58b7) -> 1E 01
	ld hl, Data_a9894 ; A98B9 (2a:58b9) -> 21 94 58
	scall LoadMapObjects ; A98BC (2a:58bc) -> CD FB 40
	ld a, $08 ; A98BF (2a:58bf) -> 3E 08
	scall PlayMusic ; A98C1 (2a:58c1) -> CD E6 4E
	scall Func_8001c ; A98C4 (2a:58c4) -> CD 1C 40
	ret  ; A98C7 (2a:58c7) -> C9

Func_a98c8:
	ld a, e ; A98C8 (2a:58c8) -> 7B
	cp $02 ; A98C9 (2a:58c9) -> FE 02
	jp nz, .asm_a98f7 ; A98CB (2a:58cb) -> C2 F7 58
	ld a, $31 ; A98CE (2a:58ce) -> 3E 31
	scall PlaySFX ; A98D0 (2a:58d0) -> CD FE 4E
	ld hl, $001e ; A98D3 (2a:58d3) -> 21 1E 00
	scall ScriptSleep ; A98D6 (2a:58d6) -> CD 8F 46
	scall StartShakingScreen ; A98D9 (2a:58d9) -> CD A2 4E
	ld a, $64 ; A98DC (2a:58dc) -> 3E 64
	scall PlaySFX ; A98DE (2a:58de) -> CD FE 4E
	ld hl, $005a ; A98E1 (2a:58e1) -> 21 5A 00
	scall ScriptSleep ; A98E4 (2a:58e4) -> CD 8F 46
	scall StopShakingScreen ; A98E7 (2a:58e7) -> CD B1 4E
	ld l, $08 ; A98EA (2a:58ea) -> 2E 08
	push hl ; A98EC (2a:58ec) -> E5
	ld c, $04 ; A98ED (2a:58ed) -> 0E 04
	ld e, $0d ; A98EF (2a:58ef) -> 1E 0D
	ld a, $18 ; A98F1 (2a:58f1) -> 3E 18
	scall Func_80dff ; A98F3 (2a:58f3) -> CD FF 4D
	pop bc ; A98F6 (2a:58f6) -> C1
.asm_a98f7:
	ret  ; A98F7 (2a:58f7) -> C9

Data_a98f8:
	warpdef $14, $12, $01, $01, MAP_24_18, $0e, $15, $0d, $15, $2e

Data_a9903:
IF DEF(SUN)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9949:
	person_event $ff, $00, $04, $08, $01, $01, $00, $04, $01, Func_a997d, NULL

Func_a9957:: ; a9957
	ld e, $01 ; A9957 (2a:5957) -> 1E 01
	ld hl, Data_a98f8 ; A9959 (2a:5959) -> 21 F8 58
	scall LoadWarps ; A995C (2a:595c) -> CD 3A 40
	ld a, $03 ; A995F (2a:595f) -> 3E 03
	scall Func_80d01 ; A9961 (2a:5961) -> CD 01 4D
	ld e, $05 ; A9964 (2a:5964) -> 1E 05
	ld hl, Data_a9903 ; A9966 (2a:5966) -> 21 03 59
	scall LoadEncounters ; A9969 (2a:5969) -> CD 24 4D
	ld e, $01 ; A996C (2a:596c) -> 1E 01
	ld hl, Data_a9949 ; A996E (2a:596e) -> 21 49 59
	scall LoadMapObjects ; A9971 (2a:5971) -> CD FB 40
	ld a, $08 ; A9974 (2a:5974) -> 3E 08
	scall PlayMusic ; A9976 (2a:5976) -> CD E6 4E
	scall Func_8001c ; A9979 (2a:5979) -> CD 1C 40
	ret  ; A997C (2a:597c) -> C9

Func_a997d:
	ld a, e ; A997D (2a:597d) -> 7B
	cp $02 ; A997E (2a:597e) -> FE 02
	jp nz, .asm_a99ac ; A9980 (2a:5980) -> C2 AC 59
	ld a, $31 ; A9983 (2a:5983) -> 3E 31
	scall PlaySFX ; A9985 (2a:5985) -> CD FE 4E
	ld hl, $001e ; A9988 (2a:5988) -> 21 1E 00
	scall ScriptSleep ; A998B (2a:598b) -> CD 8F 46
	scall StartShakingScreen ; A998E (2a:598e) -> CD A2 4E
	ld a, $64 ; A9991 (2a:5991) -> 3E 64
	scall PlaySFX ; A9993 (2a:5993) -> CD FE 4E
	ld hl, $005a ; A9996 (2a:5996) -> 21 5A 00
	scall ScriptSleep ; A9999 (2a:5999) -> CD 8F 46
	scall StopShakingScreen ; A999C (2a:599c) -> CD B1 4E
	ld l, $08 ; A999F (2a:599f) -> 2E 08
	push hl ; A99A1 (2a:59a1) -> E5
	ld c, $05 ; A99A2 (2a:59a2) -> 0E 05
	ld e, $0a ; A99A4 (2a:59a4) -> 1E 0A
	ld a, $18 ; A99A6 (2a:59a6) -> 3E 18
	scall Func_80dff ; A99A8 (2a:59a8) -> CD FF 4D
	pop bc ; A99AB (2a:59ab) -> C1
.asm_a99ac:
	ret  ; A99AC (2a:59ac) -> C9

Data_a99ad:
	warpdef $02, $18, $01, $01, MAP_24_11, $02, $04, $02, $05, $2e

Data_a99b8:
IF DEF(SUN)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a99fe:
	person_event $ff, $00, $0c, $08, $01, $01, $00, $04, $01, Func_a9a32, NULL

Func_a9a0c:: ; a9a0c
	ld e, $01 ; A9A0C (2a:5a0c) -> 1E 01
	ld hl, Data_a99ad ; A9A0E (2a:5a0e) -> 21 AD 59
	scall LoadWarps ; A9A11 (2a:5a11) -> CD 3A 40
	ld a, $03 ; A9A14 (2a:5a14) -> 3E 03
	scall Func_80d01 ; A9A16 (2a:5a16) -> CD 01 4D
	ld e, $05 ; A9A19 (2a:5a19) -> 1E 05
	ld hl, Data_a99b8 ; A9A1B (2a:5a1b) -> 21 B8 59
	scall LoadEncounters ; A9A1E (2a:5a1e) -> CD 24 4D
	ld e, $01 ; A9A21 (2a:5a21) -> 1E 01
	ld hl, Data_a99fe ; A9A23 (2a:5a23) -> 21 FE 59
	scall LoadMapObjects ; A9A26 (2a:5a26) -> CD FB 40
	ld a, $08 ; A9A29 (2a:5a29) -> 3E 08
	scall PlayMusic ; A9A2B (2a:5a2b) -> CD E6 4E
	scall Func_8001c ; A9A2E (2a:5a2e) -> CD 1C 40
	ret  ; A9A31 (2a:5a31) -> C9

Func_a9a32:
	ld a, e ; A9A32 (2a:5a32) -> 7B
	cp $02 ; A9A33 (2a:5a33) -> FE 02
	jp nz, .asm_a9a61 ; A9A35 (2a:5a35) -> C2 61 5A
	ld a, $31 ; A9A38 (2a:5a38) -> 3E 31
	scall PlaySFX ; A9A3A (2a:5a3a) -> CD FE 4E
	ld hl, $001e ; A9A3D (2a:5a3d) -> 21 1E 00
	scall ScriptSleep ; A9A40 (2a:5a40) -> CD 8F 46
	scall StartShakingScreen ; A9A43 (2a:5a43) -> CD A2 4E
	ld a, $64 ; A9A46 (2a:5a46) -> 3E 64
	scall PlaySFX ; A9A48 (2a:5a48) -> CD FE 4E
	ld hl, $005a ; A9A4B (2a:5a4b) -> 21 5A 00
	scall ScriptSleep ; A9A4E (2a:5a4e) -> CD 8F 46
	scall StopShakingScreen ; A9A51 (2a:5a51) -> CD B1 4E
	ld l, $0f ; A9A54 (2a:5a54) -> 2E 0F
	push hl ; A9A56 (2a:5a56) -> E5
	ld c, $12 ; A9A57 (2a:5a57) -> 0E 12
	ld e, $0f ; A9A59 (2a:5a59) -> 1E 0F
	ld a, $18 ; A9A5B (2a:5a5b) -> 3E 18
	scall Func_80dff ; A9A5D (2a:5a5d) -> CD FF 4D
	pop bc ; A9A60 (2a:5a60) -> C1
.asm_a9a61:
	ret  ; A9A61 (2a:5a61) -> C9

Data_a9a62:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9a6d:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9ab3:
	person_event $ff, $00, $12, $0f, $01, $01, $00, $04, $01, Func_a9ae7, NULL

Func_a9ac1:: ; a9ac1
	ld e, $01 ; A9AC1 (2a:5ac1) -> 1E 01
	ld hl, Data_a9a62 ; A9AC3 (2a:5ac3) -> 21 62 5A
	scall LoadWarps ; A9AC6 (2a:5ac6) -> CD 3A 40
	ld a, $03 ; A9AC9 (2a:5ac9) -> 3E 03
	scall Func_80d01 ; A9ACB (2a:5acb) -> CD 01 4D
	ld e, $05 ; A9ACE (2a:5ace) -> 1E 05
	ld hl, Data_a9a6d ; A9AD0 (2a:5ad0) -> 21 6D 5A
	scall LoadEncounters ; A9AD3 (2a:5ad3) -> CD 24 4D
	ld e, $01 ; A9AD6 (2a:5ad6) -> 1E 01
	ld hl, Data_a9ab3 ; A9AD8 (2a:5ad8) -> 21 B3 5A
	scall LoadMapObjects ; A9ADB (2a:5adb) -> CD FB 40
	ld a, $08 ; A9ADE (2a:5ade) -> 3E 08
	scall PlayMusic ; A9AE0 (2a:5ae0) -> CD E6 4E
	scall Func_8001c ; A9AE3 (2a:5ae3) -> CD 1C 40
	ret  ; A9AE6 (2a:5ae6) -> C9

Func_a9ae7:
	ld a, e ; A9AE7 (2a:5ae7) -> 7B
	cp $02 ; A9AE8 (2a:5ae8) -> FE 02
	jp nz, label_a9b16 ; A9AEA (2a:5aea) -> C2 16 5B
	ld a, $31 ; A9AED (2a:5aed) -> 3E 31
	scall PlaySFX ; A9AEF (2a:5aef) -> CD FE 4E
	ld hl, $001e ; A9AF2 (2a:5af2) -> 21 1E 00
	scall ScriptSleep ; A9AF5 (2a:5af5) -> CD 8F 46
	scall StartShakingScreen ; A9AF8 (2a:5af8) -> CD A2 4E
	ld a, $64 ; A9AFB (2a:5afb) -> 3E 64
	scall PlaySFX ; A9AFD (2a:5afd) -> CD FE 4E
	ld hl, $005a ; A9B00 (2a:5b00) -> 21 5A 00
	scall ScriptSleep ; A9B03 (2a:5b03) -> CD 8F 46
	scall StopShakingScreen ; A9B06 (2a:5b06) -> CD B1 4E
	ld l, $15 ; A9B09 (2a:5b09) -> 2E 15
	push hl ; A9B0B (2a:5b0b) -> E5
	ld c, $05 ; A9B0C (2a:5b0c) -> 0E 05
	ld e, $10 ; A9B0E (2a:5b0e) -> 1E 10
	ld a, $18 ; A9B10 (2a:5b10) -> 3E 18
	scall Func_80dff ; A9B12 (2a:5b12) -> CD FF 4D
	pop bc ; A9B15 (2a:5b15) -> C1
label_a9b16:
	ret  ; A9B16 (2a:5b16) -> C9

Data_a9b17:
IF DEF(SUN)
	db $0f, $05, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $37, $06, $0e, $01, $31, $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18
	db $00, $05, $0a, $00, $04, $03, $0e, $0c, $05, $1f, $21, $30, $01, $06, $00, $10
	db $09, $00, $04, $03, $0e, $0c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	db $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00, $04, $03
	db $0e, $0c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00, $ff, $00, $05, $15
	db $01, $01, $00, $04, $01, $2a, $a9, $5b, $00, $00
ELIF DEF(STAR)
	db $0f, $05, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $37, $06, $0e, $01, $31, $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18
	db $00, $05, $0a, $00, $04, $03, $0e, $0c, $46, $1f, $21, $78, $14, $14, $00, $10
	db $09, $00, $04, $03, $0e, $0c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	db $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00, $04, $03
	db $0e, $0c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00, $ff, $00, $05, $15
	db $01, $01, $00, $04, $01, $2a, $a9, $5b, $00, $00
ENDC

Func_a9b7b:: ; a9b7b
IF DEF(SUN)
	db $1e, $01, $21, $17, $5b, $cd, $3a, $40, $1e, $01, $21, $22, $5b, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $27, $5b, $cd, $24, $4d, $1e, $01, $21
	db $6d, $5b, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $d8, $5b, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $05, $1e, $11, $3e, $18, $cd, $ff, $4d, $c1, $c9, $15, $12
	db $01, $01, $18, $16, $05, $08, $04, $08, $2e, $38, $16, $07, $01, $31, $00, $00
	db $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c
	db $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00, $00, $00, $1c, $1c, $23, $20
	db $22, $52, $1e, $1e, $00, $11, $08, $00, $00, $00, $1c, $1c, $24, $21, $23, $79
	db $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $06, $23, $25, $30, $03, $03
	db $01, $11, $03, $00, $ff, $00, $05, $08, $01, $01, $00, $04, $01, $2a, $6b, $5c
	db $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $17, $5b, $cd, $3a, $40, $1e, $01, $21, $22, $5b, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $27, $5b, $cd, $24, $4d, $1e, $01, $21
	db $6d, $5b, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $d8, $5b, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $05, $1e, $11, $3e, $18, $cd, $ff, $4d, $c1, $c9, $15, $12
	db $01, $01, $18, $16, $05, $08, $04, $08, $2e, $38, $16, $07, $01, $31, $00, $00
	db $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c
	db $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00, $00, $00, $1c, $1c, $25, $20
	db $22, $79, $18, $18, $00, $11, $08, $00, $00, $00, $1c, $1c, $24, $21, $23, $79
	db $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $47, $23, $25, $78, $07, $07
	db $07, $11, $03, $00, $ff, $00, $05, $08, $01, $01, $00, $04, $01, $2a, $6b, $5c
	db $00, $00
ENDC

Func_a9c3d:: ; a9c3d
IF DEF(SUN)
	db $1e, $01, $21, $d9, $5b, $cd, $3a, $40, $1e, $01, $21, $e4, $5b, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $e9, $5b, $cd, $24, $4d, $1e, $01, $21
	db $2f, $5c, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $9a, $5c, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $0c, $1e, $0e, $3e, $18, $cd, $ff, $4d, $c1, $c9, $0e, $15
	db $01, $01, $18, $0d, $14, $12, $14, $11, $2e, $00, $00, $1c, $1c, $4e, $20, $22
	db $3c, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c, $05, $20, $22, $30, $01
	db $06, $00, $10, $09, $00, $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00
	db $11, $08, $00, $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06
	db $00, $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00, $ff
	db $00, $05, $08, $01, $01, $00, $04, $01, $2a, $20, $5d, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $d9, $5b, $cd, $3a, $40, $1e, $01, $21, $e4, $5b, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $e9, $5b, $cd, $24, $4d, $1e, $01, $21
	db $2f, $5c, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $9a, $5c, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $0c, $1e, $0e, $3e, $18, $cd, $ff, $4d, $c1, $c9, $0e, $15
	db $01, $01, $18, $0d, $14, $12, $14, $11, $2e, $00, $00, $1c, $1c, $4e, $20, $22
	db $3c, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c, $46, $20, $22, $78, $14
	db $14, $00, $10, $09, $00, $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00
	db $11, $08, $00, $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06
	db $00, $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00, $ff
	db $00, $05, $08, $01, $01, $00, $04, $01, $2a, $20, $5d, $00, $00
ENDC

Func_a9cfa:: ; a9cfa
IF DEF(SUN)
	db $1e, $01, $21, $9b, $5c, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $a6, $5c, $cd, $24, $4d, $1e, $01, $21, $ec, $5c, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe, $02, $c2, $4f, $5d, $3e, $31, $cd, $fe
	db $4e, $21, $1e, $00, $cd, $8f, $46, $cd, $a2, $4e, $3e, $64, $cd, $fe, $4e, $21
	db $5a, $00, $cd, $8f, $46, $cd, $b1, $4e, $2e, $0f, $e5, $0e, $05, $1e, $15, $3e
	db $18, $cd, $ff, $4d, $c1, $c9, $02, $12, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00, $00
	db $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00, $00, $00, $1c
	db $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00, $00, $00, $1c, $1c, $24
	db $22, $24, $79, $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $06, $24, $26
	db $30, $03, $03, $01, $11, $03, $00, $3a, $02, $14, $01, $31, $ff, $00, $12, $08
	db $01, $01, $00, $04, $01, $2a, $e2, $5d, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $9b, $5c, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $a6, $5c, $cd, $24, $4d, $1e, $01, $21, $ec, $5c, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe, $02, $c2, $4f, $5d, $3e, $31, $cd, $fe
	db $4e, $21, $1e, $00, $cd, $8f, $46, $cd, $a2, $4e, $3e, $64, $cd, $fe, $4e, $21
	db $5a, $00, $cd, $8f, $46, $cd, $b1, $4e, $2e, $0f, $e5, $0e, $05, $1e, $15, $3e
	db $18, $cd, $ff, $4d, $c1, $c9, $02, $12, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00, $00
	db $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00, $00, $00, $1c
	db $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00, $00, $00, $1c, $1c, $24
	db $22, $24, $79, $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $47, $24, $26
	db $78, $07, $07, $07, $11, $03, $00, $3a, $02, $14, $01, $31, $ff, $00, $12, $08
	db $01, $01, $00, $04, $01, $2a, $e2, $5d, $00, $00
ENDC

Func_a9db4:: ; a9db4
IF DEF(SUN)
	db $1e, $01, $21, $50, $5d, $cd, $3a, $40, $1e, $01, $21, $a1, $5d, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $5b, $5d, $cd, $24, $4d, $1e, $01, $21
	db $a6, $5d, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $11, $5e, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $05, $1e, $12, $3e, $18, $cd, $ff, $4d, $c1, $c9, $02, $05
	db $01, $01, $18, $16, $05, $08, $04, $08, $2e, $00, $00, $1c, $1c, $4e, $20, $22
	db $79, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c, $05, $20, $22, $30, $01
	db $06, $00, $10, $09, $00, $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00
	db $11, $08, $00, $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06
	db $00, $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00, $ff
	db $00, $0c, $15, $01, $01, $00, $04, $01, $2a, $97, $5e, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $50, $5d, $cd, $3a, $40, $1e, $01, $21, $a1, $5d, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $5b, $5d, $cd, $24, $4d, $1e, $01, $21
	db $a6, $5d, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $11, $5e, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $08, $e5, $0e, $05, $1e, $12, $3e, $18, $cd, $ff, $4d, $c1, $c9, $02, $05
	db $01, $01, $18, $16, $05, $08, $04, $08, $2e, $00, $00, $1c, $1c, $4e, $20, $22
	db $79, $04, $18, $00, $05, $0a, $00, $00, $00, $1c, $1c, $46, $20, $22, $78, $14
	db $14, $00, $10, $09, $00, $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00
	db $10, $08, $00, $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06
	db $00, $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $10, $03, $00, $ff
	db $00, $0c, $15, $01, $01, $00, $04, $01, $2a, $97, $5e, $00, $00
ENDC

Func_a9e71:: ; a9e71
IF DEF(SUN)
	db $1e, $01, $21, $12, $5e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $1d, $5e, $cd, $24, $4d, $1e, $01, $21, $63, $5e, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe, $02, $c2, $c6, $5e, $3e, $31, $cd, $fe
	db $4e, $21, $1e, $00, $cd, $8f, $46, $cd, $a2, $4e, $3e, $64, $cd, $fe, $4e, $21
	db $5a, $00, $cd, $8f, $46, $cd, $b1, $4e, $2e, $08, $e5, $0e, $12, $1e, $13, $3e
	db $18, $cd, $ff, $4d, $c1, $c9, $15, $05, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00, $00
	db $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00, $00, $00, $1c
	db $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00, $00, $00, $1c, $1c, $24
	db $22, $24, $79, $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $06, $24, $26
	db $30, $03, $03, $01, $11, $03, $00, $3b, $15, $03, $01, $31, $ff, $00, $05, $0f
	db $01, $01, $00, $04, $01, $2a, $59, $5f, $00, $00
ELIF DEF(STAR)
	db $1e, $01, $21, $12, $5e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $1d, $5e, $cd, $24, $4d, $1e, $01, $21, $63, $5e, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe, $02, $c2, $c6, $5e, $3e, $31, $cd, $fe
	db $4e, $21, $1e, $00, $cd, $8f, $46, $cd, $a2, $4e, $3e, $64, $cd, $fe, $4e, $21
	db $5a, $00, $cd, $8f, $46, $cd, $b1, $4e, $2e, $08, $e5, $0e, $12, $1e, $13, $3e
	db $18, $cd, $ff, $4d, $c1, $c9, $15, $05, $01, $01, $18, $16, $05, $08, $04, $08
	db $2e, $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00, $00
	db $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00, $00, $00, $1c
	db $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00, $00, $00, $1c, $1c, $24
	db $22, $24, $79, $18, $18, $1e, $10, $06, $00, $00, $00, $1c, $1c, $47, $24, $26
	db $78, $07, $07, $07, $11, $03, $00, $3b, $15, $03, $01, $31, $ff, $00, $05, $0f
	db $01, $01, $00, $04, $01, $2a, $59, $5f, $00, $00
ENDC

Func_a9f2b:: ; a9f2b
IF DEF(SUN)
	db $1e, $01, $21, $c7, $5e, $cd, $3a, $40, $1e, $01, $21, $18, $5f, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $d2, $5e, $cd, $24, $4d, $1e, $01, $21
	db $1d, $5f, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $88, $5f, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $15, $e5, $0e, $0c, $1e, $14, $3e, $18, $cd, $ff, $4d, $c1, $c9, $05, $08
	db $01, $01, $18, $0f, $02, $05, $02, $06, $2e, $05, $08, $01, $01, $18, $10, $0f
	db $05, $0e, $05, $2e, $05, $08, $01, $01, $18, $11, $15, $12, $15, $11, $2e, $05
	db $08, $01, $01, $18, $13, $02, $12, $02, $11, $2e, $05, $08, $01, $01, $18, $14
	db $02, $05, $03, $05, $2e, $05, $08, $01, $01, $18, $15, $15, $05, $15, $06, $2e
	db $71, $02, $06, $01, $2d, $72, $03, $06, $01, $2b, $73, $04, $06, $01, $2d, $74
	db $02, $06, $01, $2c, $75, $03, $06, $01, $2d, $76, $04, $06, $01, $2e, $77, $02
	db $06, $01, $2d, $78, $03, $06, $01, $2d, $79, $04, $06, $01, $2b, $7a, $02, $06
	db $01, $2e, $7b, $03, $06, $01, $2c, $7c, $04, $06, $01, $2d, $7d, $02, $06, $01
	db $2b, $7e, $03, $06, $01, $2d, $7f, $04, $06, $01, $2e, $80, $02, $06, $01, $2d
	db $81, $03, $06, $01, $2d, $82, $04, $06, $01, $2c, $00, $03, $07, $07, $4e, $1e
	db $20, $3c, $04, $18, $00, $05, $0a, $00, $00, $03, $07, $07, $05, $1e, $20, $30
	db $01, $06, $00, $10, $09, $00, $00, $03, $07, $07, $23, $1f, $21, $52, $1e, $1e
	db $00, $11, $08, $00, $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10
	db $06, $00, $00, $03, $07, $07, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
	db $18, $0f, $02, $05, $18, $10, $0f, $05, $18, $11, $15, $12, $18, $13, $02, $12
	db $18, $14, $02, $05, $18, $15, $15, $05
ELIF DEF(STAR)
	db $1e, $01, $21, $c7, $5e, $cd, $3a, $40, $1e, $01, $21, $18, $5f, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $05, $21, $d2, $5e, $cd, $24, $4d, $1e, $01, $21
	db $1d, $5f, $cd, $fb, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $fe
	db $02, $c2, $88, $5f, $3e, $31, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $cd
	db $a2, $4e, $3e, $64, $cd, $fe, $4e, $21, $5a, $00, $cd, $8f, $46, $cd, $b1, $4e
	db $2e, $15, $e5, $0e, $0c, $1e, $14, $3e, $18, $cd, $ff, $4d, $c1, $c9, $05, $08
	db $01, $01, $18, $0f, $02, $05, $02, $06, $2e, $05, $08, $01, $01, $18, $10, $0f
	db $05, $0e, $05, $2e, $05, $08, $01, $01, $18, $11, $15, $12, $15, $11, $2e, $05
	db $08, $01, $01, $18, $13, $02, $12, $02, $11, $2e, $05, $08, $01, $01, $18, $14
	db $02, $05, $03, $05, $2e, $05, $08, $01, $01, $18, $15, $15, $05, $15, $06, $2e
	db $71, $02, $06, $01, $2d, $72, $03, $06, $01, $2b, $73, $04, $06, $01, $2d, $74
	db $02, $06, $01, $2c, $75, $03, $06, $01, $2d, $76, $04, $06, $01, $2e, $77, $02
	db $06, $01, $2d, $78, $03, $06, $01, $2d, $79, $04, $06, $01, $2b, $7a, $02, $06
	db $01, $2e, $7b, $03, $06, $01, $2c, $7c, $04, $06, $01, $2d, $7d, $02, $06, $01
	db $2b, $7e, $03, $06, $01, $2d, $7f, $04, $06, $01, $2e, $80, $02, $06, $01, $2d
	db $81, $03, $06, $01, $2d, $82, $04, $06, $01, $2c, $00, $03, $07, $07, $4e, $1e
	db $20, $3c, $04, $18, $00, $05, $0a, $00, $00, $03, $07, $07, $46, $1e, $20, $78
	db $14, $14, $00, $10, $09, $00, $00, $03, $07, $07, $25, $1f, $21, $79, $18, $18
	db $00, $11, $08, $00, $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10
	db $06, $00, $00, $03, $07, $07, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
	db $18, $0f, $02, $05, $18, $10, $0f, $05, $18, $11, $15, $12, $18, $13, $02, $12
	db $18, $14, $02, $05, $18, $15, $15, $05
ENDC

Func_aa083:: ; aa083
	db $0e, $00, $79, $fe, $06, $d2, $ed, $60, $69, $26, $00, $29, $29, $11, $6b, $60
	db $19, $fa, $df, $c7, $be, $c2, $e9, $60, $69, $26, $00, $29, $29, $11, $6b, $60
	db $19, $23, $fa, $e0, $c7, $be, $c2, $e9, $60, $69, $26, $00, $29, $29, $11, $6b
	db $60, $19, $23, $23, $fa, $db, $c7, $be, $c2, $e9, $60, $69, $26, $00, $29, $29
	db $11, $6b, $60, $19, $23, $23, $23, $fa, $dc, $c7, $be, $c2, $e9, $60, $69, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $89, $5f, $19, $1e, $01
	db $cd, $3a, $40, $c3, $ed, $60, $0c, $c3, $85, $60, $fa, $df, $c7, $fe, $18, $c2
	db $08, $61, $fa, $e0, $c7, $fe, $0f, $c2, $08, $61, $1e, $03, $21, $cb, $5f, $cd
	db $e7, $4c, $c3, $8c, $61, $fa, $df, $c7, $fe, $18, $c2, $23, $61, $fa, $e0, $c7
	db $fe, $10, $c2, $23, $61, $1e, $03, $21, $da, $5f, $cd, $e7, $4c, $c3, $8c, $61
	db $fa, $df, $c7, $fe, $18, $c2, $3e, $61, $fa, $e0, $c7, $fe, $11, $c2, $3e, $61
	db $1e, $03, $21, $e9, $5f, $cd, $e7, $4c, $c3, $8c, $61, $fa, $df, $c7, $fe, $18
	db $c2, $59, $61, $fa, $e0, $c7, $fe, $13, $c2, $59, $61, $1e, $03, $21, $f8, $5f
	db $cd, $e7, $4c, $c3, $8c, $61, $fa, $df, $c7, $fe, $18, $c2, $74, $61, $fa, $e0
	db $c7, $fe, $14, $c2, $74, $61, $1e, $03, $21, $07, $60, $cd, $e7, $4c, $c3, $8c
	db $61, $fa, $df, $c7, $fe, $18, $c2, $8c, $61, $fa, $e0, $c7, $fe, $15, $c2, $8c
	db $61, $1e, $03, $21, $16, $60, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05
	db $21, $25, $60, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $08
	db $05, $02, $01, $19, $14, $0f, $1c, $0f, $1b, $2e, $08, $15, $02, $01, $19, $01
	db $0c, $05, $0c, $06, $2e, $05, $12, $01, $01, $19, $04, $09, $04, $09, $05, $2e
	db $0c, $12, $01, $01, $19, $05, $01, $04, $01, $05, $2e, $b3, $02, $ff, $ff, $09
	db $0c, $07, $07, $01, $01, $02, $04, $00, $2a, $00, $00, $00, $00, $09, $0c, $0a
	db $07, $01, $01, $02, $04, $00, $2a, $00, $00, $00, $00, $ff, $00, $07, $09, $04
	db $01, $00, $04, $01, $2a, $77, $62, $00, $00, $ff, $00, $07, $14, $01, $01, $00
	db $04, $00, $2a, $5f, $48, $ce, $61, $ff, $00, $0a, $14, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $ce, $61

Func_aa218:: ; aa218
IF DEF(SUN)
	db $3e, $09, $ea, $89, $c7, $3e, $0d, $ea, $e2, $c7, $1e, $04, $21, $a2, $61, $cd
	db $3a, $40, $21, $b7, $00, $cd, $2e, $46, $b7, $c2, $3c, $62, $1e, $03, $21, $d2
	db $61, $cd, $fb, $40, $1e, $02, $21, $fc, $61, $cd, $fb, $40, $21, $22, $00, $cd
	db $2e, $46, $fe, $01, $c2, $61, $62, $21, $43, $00, $cd, $2e, $46, $b7, $c2, $61
	db $62, $3e, $04, $cd, $e6, $4e, $c3, $66, $62, $3e, $12, $cd, $e6, $4e, $3e, $01
	db $cd, $c6, $4c, $cd, $1c, $40, $c9, $08, $07, $ff, $ff, $09, $07, $ff, $ff, $d5
	db $21, $b7, $00, $cd, $2e, $46, $b7, $c2, $f2, $62, $f8, $00, $7e, $fe, $02, $c2
	db $f2, $62, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $0e, $01, $11, $6f, $62
	db $3e, $2a, $cd, $3e, $46, $1e, $01, $af, $cd, $95, $40, $3e, $03, $cd, $77, $46
	db $1e, $00, $21, $f7, $00, $cd, $1b, $46, $cd, $21, $63, $21, $f7, $00, $cd, $2e
	db $46, $b7, $ca, $c0, $62, $c3, $f2, $62, $01, $73, $62, $1e, $2a, $3e, $01, $cd
	db $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $1e, $00, $21, $f7, $00, $cd
	db $1b, $46, $cd, $92, $63, $21, $f7, $00, $cd, $2e, $46, $b7, $ca, $ea, $62, $c3
	db $f2, $62, $1e, $01, $21, $b7, $00, $cd, $1b, $46, $c1, $c9, $07, $0f, $ff, $ff
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $02, $06, $2a, $0f, $17
	db $00, $6f, $2d, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c, $21, $0b, $01, $cd, $98, $44, $11
	db $5f, $63, $21, $f8, $62, $cd, $d3, $4d, $b7, $c2, $3d, $63, $1e, $01, $21, $f7
	db $00, $cd, $1b, $46, $c9, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $21, $0f
	db $01, $cd, $98, $44, $01, $f4, $62, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $c9, $28, $cd, $b2, $bc, $29, $00, $09, $0f, $ff
	db $ff, $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $7d, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $21, $0d, $01, $cd, $98, $44
	db $11, $d2, $63, $21, $69, $63, $cd, $d3, $4d, $b7, $c2, $ae, $63, $1e, $01, $21
	db $f7, $00, $cd, $1b, $46, $c9, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $21
	db $0f, $01, $cd, $98, $44, $01, $65, $63, $1e, $2a, $3e, $01, $cd, $88, $46, $cd
	db $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $c9, $28, $cd, $b2, $bc, $29, $00
	db $0c, $1c, $02, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $0c, $04, $02, $01, $19
	db $00, $08, $14, $08, $13, $2e, $19, $04, $01, $01, $1c, $00, $06, $1a, $06, $19
	db $2e, $05, $0e, $01, $01, $20, $05, $06, $0b, $06, $0a, $34, $08, $0e, $01, $01
	db $20, $06, $06, $0c, $06, $0b, $34, $1d, $16, $01, $01, $20, $07, $05, $09, $05
	db $08, $34, $20, $16, $01, $01, $20, $08, $05, $09, $05, $08, $34, $05, $15, $01
	db $01, $20, $01, $01, $08, $01, $07, $34, $08, $15, $01, $01, $20, $01, $01, $08
	db $01, $07, $34, $11, $15, $01, $01, $20, $01, $01, $08, $01, $07, $34, $14, $15
	db $01, $01, $20, $01, $01, $08, $01, $07, $34, $17, $15, $01, $01, $20, $01, $01
	db $08, $01, $07, $34, $1e, $0a, $01, $01, $20, $01, $01, $08, $01, $07, $34, $21
	db $0a, $01, $01, $20, $01, $01, $08, $01, $07, $34, $07, $08, $01, $01, $20, $03
	db $01, $08, $01, $07, $34, $bb, $01, $ff, $ff, $be, $01, $ff, $ff, $bc, $01, $ff
	db $ff, $bd, $01, $ff, $ff, $af, $02, $ff, $ff, $b1, $02, $ff, $ff, $b0, $02, $ff
	db $ff, $23, $03, $24, $03, $25, $03, $ff, $ff, $26, $03, $ff, $ff, $ff, $00, $0b
	db $05, $01, $01, $00, $04, $00, $2a, $5f, $48, $91, $64, $ff, $00, $0e, $05, $01
	db $01, $00, $04, $00, $2a, $5f, $48, $91, $64, $ff, $00, $18, $05, $01, $01, $00
	db $04, $00, $2a, $5f, $48, $95, $64, $ff, $00, $1a, $05, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $95, $64, $ff, $00, $0b, $1b, $01, $01, $00, $04, $00, $2a, $5f
	db $48, $8d, $64, $ff, $00, $0e, $1b, $01, $01, $00, $04, $00, $2a, $5f, $48, $8d
	db $64, $ff, $00, $07, $19, $01, $01, $00, $04, $00, $2a, $7c, $4a, $99, $64, $ff
	db $00, $14, $19, $01, $01, $00, $04, $00, $2a, $7c, $4a, $99, $64, $ff, $00, $12
	db $07, $03, $03, $00, $04, $00, $2a, $ee, $66, $00, $00, $09, $04, $0b, $06, $01
	db $01, $02, $04, $00, $2a, $5f, $48, $81, $64, $ff, $00, $0c, $06, $01, $01, $00
	db $04, $01, $2a, $b6, $67, $00, $00, $ff, $00, $0d, $06, $01, $01, $00, $04, $01
	db $2a, $f5, $67, $00, $00, $09, $04, $0e, $06, $01, $01, $02, $04, $00, $2a, $5f
	db $48, $85, $64, $09, $04, $18, $06, $01, $01, $02, $04, $00, $2a, $5f, $48, $89
	db $64, $ff, $00, $19, $06, $01, $01, $00, $04, $01, $2a, $34, $68, $00, $00, $03
	db $04, $0d, $18, $01, $01, $02, $04, $00, $2a, $6f, $68, $00, $00, $00, $04, $0c
	db $11, $01, $01, $01, $04, $00, $2a, $5f, $48, $7d, $64, $10, $0c, $19, $00, $01
	db $01, $02, $04, $00, $2a, $00, $00, $00, $00, $0b, $0c, $19, $00, $01, $01, $02
	db $04, $00, $2a, $00, $00, $00, $00, $ff, $00, $07, $08, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $a1, $64, $ff, $00, $07, $08, $01, $01, $00, $04, $01, $2a, $87
	db $6b, $00, $00
ELIF DEF(STAR)
	db $3e, $09, $ea, $89, $c7, $3e, $0d, $ea, $e2, $c7, $1e, $04, $21, $a2, $61, $cd
	db $3a, $40, $21, $b7, $00, $cd, $2e, $46, $b7, $c2, $3c, $62, $1e, $03, $21, $d2
	db $61, $cd, $fb, $40, $1e, $02, $21, $fc, $61, $cd, $fb, $40, $21, $22, $00, $cd
	db $2e, $46, $fe, $01, $c2, $61, $62, $21, $43, $00, $cd, $2e, $46, $b7, $c2, $61
	db $62, $3e, $04, $cd, $e6, $4e, $c3, $66, $62, $3e, $12, $cd, $e6, $4e, $3e, $01
	db $cd, $c6, $4c, $cd, $1c, $40, $c9, $08, $07, $ff, $ff, $09, $07, $ff, $ff, $d5
	db $21, $b7, $00, $cd, $2e, $46, $b7, $c2, $f2, $62, $f8, $00, $7e, $fe, $02, $c2
	db $f2, $62, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $0e, $01, $11, $6f, $62
	db $3e, $2a, $cd, $3e, $46, $1e, $01, $af, $cd, $95, $40, $3e, $03, $cd, $77, $46
	db $1e, $00, $21, $f7, $00, $cd, $1b, $46, $cd, $21, $63, $21, $f7, $00, $cd, $2e
	db $46, $b7, $ca, $c0, $62, $c3, $f2, $62, $01, $73, $62, $1e, $2a, $3e, $01, $cd
	db $88, $46, $cd, $0c, $42, $3e, $01, $cd, $77, $46, $1e, $00, $21, $f7, $00, $cd
	db $1b, $46, $cd, $92, $63, $21, $f7, $00, $cd, $2e, $46, $b7, $ca, $ea, $62, $c3
	db $f2, $62, $1e, $01, $21, $b7, $00, $cd, $1b, $46, $c1, $c9, $07, $0f, $ff, $ff
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $57, $06, $2a, $0f, $17
	db $00, $6f, $5a, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c, $21, $0b, $01, $cd, $98, $44, $11
	db $5f, $63, $21, $f8, $62, $cd, $d3, $4d, $b7, $c2, $3d, $63, $1e, $01, $21, $f7
	db $00, $cd, $1b, $46, $c9, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $21, $0f
	db $01, $cd, $98, $44, $01, $f4, $62, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $c9, $28, $cd, $b2, $bc, $29, $00, $09, $0f, $ff
	db $ff, $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $14, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $21, $0d, $01, $cd, $98, $44
	db $11, $d2, $63, $21, $69, $63, $cd, $d3, $4d, $b7, $c2, $ae, $63, $1e, $01, $21
	db $f7, $00, $cd, $1b, $46, $c9, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $21
	db $0f, $01, $cd, $98, $44, $01, $65, $63, $1e, $2a, $3e, $01, $cd, $88, $46, $cd
	db $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $c9, $28, $cd, $b2, $bc, $29, $00
	db $0c, $1c, $02, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $0c, $04, $02, $01, $19
	db $00, $08, $14, $08, $13, $2e, $19, $04, $01, $01, $1c, $00, $06, $1a, $06, $19
	db $2e, $05, $0e, $01, $01, $20, $05, $06, $0b, $06, $0a, $34, $08, $0e, $01, $01
	db $20, $06, $06, $0c, $06, $0b, $34, $1d, $16, $01, $01, $20, $07, $05, $09, $05
	db $08, $34, $20, $16, $01, $01, $20, $08, $05, $09, $05, $08, $34, $05, $15, $01
	db $01, $20, $01, $01, $08, $01, $07, $34, $08, $15, $01, $01, $20, $01, $01, $08
	db $01, $07, $34, $11, $15, $01, $01, $20, $01, $01, $08, $01, $07, $34, $14, $15
	db $01, $01, $20, $01, $01, $08, $01, $07, $34, $17, $15, $01, $01, $20, $01, $01
	db $08, $01, $07, $34, $1e, $0a, $01, $01, $20, $01, $01, $08, $01, $07, $34, $21
	db $0a, $01, $01, $20, $01, $01, $08, $01, $07, $34, $07, $08, $01, $01, $20, $03
	db $01, $08, $01, $07, $34, $bb, $01, $ff, $ff, $be, $01, $ff, $ff, $bc, $01, $ff
	db $ff, $bd, $01, $ff, $ff, $af, $02, $ff, $ff, $b1, $02, $ff, $ff, $b0, $02, $ff
	db $ff, $23, $03, $24, $03, $25, $03, $ff, $ff, $26, $03, $ff, $ff, $ff, $00, $0b
	db $05, $01, $01, $00, $04, $00, $2a, $5f, $48, $91, $64, $ff, $00, $0e, $05, $01
	db $01, $00, $04, $00, $2a, $5f, $48, $91, $64, $ff, $00, $18, $05, $01, $01, $00
	db $04, $00, $2a, $5f, $48, $95, $64, $ff, $00, $1a, $05, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $95, $64, $ff, $00, $0b, $1b, $01, $01, $00, $04, $00, $2a, $5f
	db $48, $8d, $64, $ff, $00, $0e, $1b, $01, $01, $00, $04, $00, $2a, $5f, $48, $8d
	db $64, $ff, $00, $07, $19, $01, $01, $00, $04, $00, $2a, $7c, $4a, $99, $64, $ff
	db $00, $14, $19, $01, $01, $00, $04, $00, $2a, $7c, $4a, $99, $64, $ff, $00, $12
	db $07, $03, $03, $00, $04, $00, $2a, $ee, $66, $00, $00, $09, $04, $0b, $06, $01
	db $01, $02, $04, $00, $2a, $5f, $48, $81, $64, $ff, $00, $0c, $06, $01, $01, $00
	db $04, $01, $2a, $b6, $67, $00, $00, $ff, $00, $0d, $06, $01, $01, $00, $04, $01
	db $2a, $f5, $67, $00, $00, $09, $04, $0e, $06, $01, $01, $02, $04, $00, $2a, $5f
	db $48, $85, $64, $09, $04, $18, $06, $01, $01, $02, $04, $00, $2a, $5f, $48, $89
	db $64, $ff, $00, $19, $06, $01, $01, $00, $04, $01, $2a, $34, $68, $00, $00, $03
	db $04, $0d, $18, $01, $01, $02, $04, $00, $2a, $6f, $68, $00, $00, $00, $04, $0c
	db $11, $01, $01, $01, $04, $00, $2a, $5f, $48, $7d, $64, $10, $0c, $19, $00, $01
	db $01, $02, $04, $00, $2a, $00, $00, $00, $00, $0b, $0c, $19, $00, $01, $01, $02
	db $04, $00, $2a, $00, $00, $00, $00, $ff, $00, $07, $08, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $a1, $64, $ff, $00, $07, $08, $01, $01, $00, $04, $01, $2a, $87
	db $6b, $00, $00
ENDC

Func_aa5cb:: ; aa5cb
IF DEF(SUN)
	db $3e, $09, $ea, $89, $c7, $3e, $0d, $ea, $e2, $c7, $cd, $ad, $6a, $21, $ad, $6a
	db $cd, $11, $4f, $1e, $0e, $21, $d8, $63, $cd, $3a, $40, $1e, $09, $21, $a5, $64
	db $cd, $fb, $40, $1e, $02, $21, $77, $65, $cd, $fb, $40, $3e, $01, $cd, $c6, $4c
	db $3e, $12, $cd, $e6, $4e, $fa, $90, $c7, $b7, $ca, $22, $66, $fa, $90, $c7, $fe
	db $07, $d2, $22, $66, $1e, $01, $21, $72, $64, $cd, $3a, $40, $1e, $01, $21, $bd
	db $65, $cd, $fb, $40, $c3, $2a, $66, $1e, $01, $21, $af, $65, $cd, $fb, $40, $21
	db $34, $00, $cd, $2e, $46, $fe, $01, $c2, $66, $66, $21, $c3, $00, $cd, $2e, $46
	db $b7, $c2, $66, $66, $fa, $df, $c7, $fe, $1a, $c2, $66, $66, $21, $35, $00, $cd
	db $2e, $46, $b7, $c2, $66, $66, $1e, $01, $21, $a1, $65, $cd, $fb, $40, $af, $cd
	db $53, $46, $cd, $1c, $40, $cd, $3f, $6b, $c3, $dd, $66, $21, $22, $00, $cd, $2e
	db $46, $fe, $01, $c2, $9e, $66, $21, $43, $00, $cd, $2e, $46, $b7, $c2, $9e, $66
	db $21, $c2, $00, $cd, $2e, $46, $b7, $c2, $9e, $66, $fa, $df, $c7, $fe, $ff, $ca
	db $9b, $66, $1e, $01, $21, $93, $65, $cd, $fb, $40, $cd, $1c, $40, $cd, $d6, $6a
	db $c3, $dd, $66, $21, $22, $00, $cd, $2e, $46, $b7, $c2, $da, $66, $1e, $06, $21
	db $23, $65, $cd, $fb, $40, $21, $14, $00, $cd, $2e, $46, $fe, $01, $c2, $d4, $66
	db $21, $07, $00, $cd, $2e, $46, $fe, $01, $c2, $d4, $66, $1e, $00, $3e, $10, $cd
	db $3d, $41, $1e, $00, $3e, $11, $cd, $3d, $41, $cd, $1c, $40, $c3, $dd, $66, $cd
	db $1c, $40, $c9, $13, $0a, $ff, $ff, $11, $0a, $13, $0a, $ff, $ff, $15, $0a, $13
	db $0a, $ff, $ff, $7b, $b7, $c2, $b1, $67, $3e, $0f, $cd, $6d, $4e, $fe, $ff, $c2
	db $1b, $67, $3e, $41, $cd, $6d, $4e, $fe, $ff, $c2, $1b, $67, $3e, $50, $cd, $6d
	db $4e, $fe, $ff, $c2, $1b, $67, $3e, $64, $cd, $6d, $4e, $fe, $ff, $ca, $ab, $67
	db $fa, $90, $c7, $b7, $ca, $a2, $67, $fa, $90, $c7, $fe, $06, $d2, $a2, $67, $21
	db $2d, $03, $cd, $ba, $44, $b7, $c2, $9f, $67, $fa, $38, $c8, $fe, $01, $ca, $4d
	db $67, $b7, $c2, $5a, $67, $0e, $01, $11, $de, $66, $3e, $2a, $cd, $3e, $46, $c3
	db $64, $67, $0e, $01, $11, $e2, $66, $3e, $2a, $cd, $3e, $46, $c3, $64, $67, $0e
	db $01, $11, $e8, $66, $3e, $2a, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $e6, $4e
	db $3e, $0a, $cd, $e6, $4e, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $0b, $cd
	db $76, $41, $3e, $44, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $04, $cd
	db $c6, $4c, $3e, $02, $cd, $77, $46, $2e, $12, $e5, $0e, $0a, $1e, $01, $3e, $1e
	db $cd, $ff, $4d, $c1, $c3, $a8, $67, $21, $77, $03, $cd, $98, $44, $c3, $b1, $67
	db $21, $76, $03, $cd, $98, $44, $c9, $0c, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2
	db $ef, $67, $1e, $01, $f8, $01, $7e, $3d, $cd, $95, $40, $21, $1e, $00, $cd, $8f
	db $46, $3e, $03, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bc, $01, $cd, $98
	db $44, $0e, $01, $11, $b2, $67, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e
	db $3d, $cd, $95, $40, $c1, $c9, $0d, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2, $2e
	db $68, $1e, $03, $f8, $01, $7e, $3c, $cd, $95, $40, $21, $1e, $00, $cd, $8f, $46
	db $3e, $01, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bc, $01, $cd, $98, $44
	db $0e, $01, $11, $f1, $67, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e, $3c
	db $cd, $95, $40, $c1, $c9, $19, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2, $6d, $68
	db $1e, $01, $f8, $01, $7e, $3d, $cd, $95, $40, $21, $1e, $00, $cd, $8f, $46, $3e
	db $03, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bd, $01, $cd, $98, $44, $0e
	db $01, $11, $30, $68, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e, $3d, $cd
	db $95, $40, $c1, $c9, $f5, $c5, $f8, $00, $36, $ff, $7b, $b7, $c2, $a4, $6a, $f8
	db $03, $7e, $cd, $4b, $44, $fa, $96, $c7, $fe, $04, $c2, $0a, $69, $3e, $49, $cd
	db $6d, $4e, $f8, $01, $77, $fe, $ff, $ca, $07, $69, $21, $16, $04, $cd, $a9, $44
	db $3e, $49, $cd, $7d, $4e, $fe, $01, $c2, $fe, $68, $21, $95, $02, $cd, $a9, $44
	db $21, $00, $04, $cd, $ba, $44, $b7, $c2, $ed, $68, $3e, $68, $cd, $fe, $4e, $21
	db $0c, $04, $cd, $a9, $44, $f8, $01, $6e, $26, $00, $11, $00, $0b, $19, $cd, $88
	db $44, $7d, $f5, $0e, $00, $1e, $01, $f8, $03, $7e, $cd, $87, $4d, $f1, $4f, $1e
	db $00, $3e, $4a, $cd, $87, $4d, $3e, $05, $ea, $96, $c7, $f8, $00, $36, $01, $c3
	db $fb, $68, $3e, $69, $cd, $fe, $4e, $21, $0d, $04, $cd, $a9, $44, $c3, $a4, $6a
	db $c3, $07, $69, $21, $6e, $04, $cd, $98, $44, $c3, $a4, $6a, $c3, $4f, $6a, $fa
	db $96, $c7, $fe, $0c, $c2, $94, $69, $3e, $7c, $cd, $6d, $4e, $f8, $01, $77, $fe
	db $ff, $ca, $91, $69, $21, $16, $04, $cd, $a9, $44, $3e, $7c, $cd, $7d, $4e, $fe
	db $01, $c2, $88, $69, $21, $96, $02, $cd, $a9, $44, $21, $00, $04, $cd, $ba, $44
	db $b7, $c2, $77, $69, $3e, $68, $cd, $fe, $4e, $21, $32, $04, $cd, $a9, $44, $f8
	db $01, $6e, $26, $00, $11, $00, $0b, $19, $cd, $88, $44, $7d, $f5, $0e, $00, $1e
	db $01, $f8, $03, $7e, $cd, $87, $4d, $f1, $4f, $1e, $00, $3e, $7e, $cd, $87, $4d
	db $3e, $0d, $ea, $96, $c7, $f8, $00, $36, $01, $c3, $85, $69, $3e, $69, $cd, $fe
	db $4e, $21, $33, $04, $cd, $a9, $44, $c3, $a4, $6a, $c3, $91, $69, $21, $6e, $04
	db $cd, $98, $44, $c3, $a4, $6a, $c3, $4f, $6a, $3e, $49, $cd, $6d, $4e, $f8, $01
	db $77, $fe, $ff, $c2, $ae, $69, $3e, $7c, $cd, $6d, $4e, $f8, $01, $77, $fe, $ff
	db $ca, $4f, $6a, $fa, $96, $c7, $fe, $08, $ca, $37, $6a, $fe, $06, $ca, $37, $6a
	db $fe, $0a, $ca, $28, $6a, $fe, $05, $ca, $28, $6a, $fe, $07, $ca, $19, $6a, $b7
	db $ca, $19, $6a, $fe, $0d, $ca, $0a, $6a, $fe, $03, $ca, $0a, $6a, $fe, $0b, $ca
	db $fb, $69, $fe, $02, $ca, $fb, $69, $fe, $09, $ca, $ec, $69, $fe, $01, $c2, $46
	db $6a, $21, $40, $01, $cd, $98, $44, $21, $4d, $03, $cd, $98, $44, $c3, $4c, $6a
	db $21, $40, $01, $cd, $98, $44, $21, $05, $02, $cd, $98, $44, $c3, $4c, $6a, $21
	db $40, $01, $cd, $98, $44, $21, $0a, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $40
	db $01, $cd, $98, $44, $21, $4b, $03, $cd, $98, $44, $c3, $4c, $6a, $21, $40, $01
	db $cd, $98, $44, $21, $41, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $40, $01, $cd
	db $98, $44, $21, $44, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $16, $04, $cd, $a9
	db $44, $c3, $a4, $6a, $f8, $00, $7e, $fe, $ff, $c2, $a4, $6a, $fa, $96, $c7, $fe
	db $0d, $d2, $76, $6a, $fa, $96, $c7, $fe, $05, $da, $76, $6a, $21, $16, $04, $cd
	db $a9, $44, $21, $31, $04, $cd, $a9, $44, $c3, $a4, $6a, $fa, $96, $c7, $fe, $0f
	db $c2, $87, $6a, $21, $16, $04, $cd, $a9, $44, $c3, $a4, $6a, $fa, $96, $c7, $fe
	db $0d, $da, $98, $6a, $21, $34, $04, $cd, $a9, $44, $c3, $a4, $6a, $21, $16, $04
	db $cd, $a9, $44, $21, $ba, $01, $cd, $a9, $44, $c1, $c1, $c9, $05, $0e, $01, $01
	db $07, $08, $fa, $90, $c7, $b7, $ca, $c5, $6a, $fa, $90, $c7, $fe, $07, $d2, $c5
	db $6a, $21, $a7, $6a, $cd, $9b, $4d, $cd, $02, $4f, $c9, $19, $05, $ff, $ff, $19
	db $0d, $ff, $ff, $1a, $06, $ff, $ff, $19, $07, $ff, $ff, $01, $c6, $6a, $1e, $2a
	db $3e, $0c, $cd, $88, $46, $cd, $0c, $42, $0e, $01, $11, $ce, $6a, $3e, $2a, $cd
	db $3e, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $01, $ca, $6a, $1e, $2a, $3e
	db $0c, $cd, $88, $46, $cd, $0c, $42, $3e, $02, $cd, $77, $46, $1e, $00, $3e, $0c
	db $cd, $3d, $41, $21, $12, $01, $cd, $98, $44, $0e, $01, $11, $d2, $6a, $3e, $2a
	db $cd, $3e, $46, $cd, $0c, $42, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $2e, $07
	db $e5, $0e, $19, $1e, $01, $3e, $19, $cd, $ff, $4d, $c1, $c9, $19, $06, $ff, $ff
	db $19, $0d, $ff, $ff, $01, $37, $6b, $1e, $2a, $3e, $0c, $cd, $88, $46, $cd, $0c
	db $42, $21, $1e, $00, $cd, $8f, $46, $21, $bf, $01, $cd, $98, $44, $21, $1e, $00
	db $cd, $8f, $46, $01, $3b, $6b, $1e, $2a, $3e, $0c, $cd, $88, $46, $cd, $0c, $42
	db $21, $1e, $00, $cd, $8f, $46, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1a, $cd
	db $ff, $4d, $c1, $1e, $01, $21, $c3, $00, $cd, $1b, $46, $c9, $7b, $fe, $02, $c2
	db $92, $6b, $3e, $0c, $ea, $8a, $c7, $c9, $01, $04, $01, $01, $19, $04, $09, $18
	db $09, $17, $2e, $0e, $03, $01, $03, $1c, $01, $05, $14, $06, $14, $2e, $00, $03
	db $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00, $00, $03, $13, $03
	db $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00, $00, $03, $13, $03, $36, $26
	db $29, $7a, $0f, $0b, $00, $05, $06, $00, $00, $03, $13, $03, $88, $26, $29, $7a
	db $04, $04, $00, $05, $03, $00, $09, $0c, $08, $03, $01, $01, $02, $04, $00, $2a
	db $cc, $6c, $00, $00, $ff, $00, $08, $04, $01, $02, $00, $04, $01, $2a, $cc, $6c
	db $00, $00, $09, $0c, $0a, $03, $01, $01, $02, $04, $00, $2a, $a6, $6d, $00, $00
	db $ff, $00, $0a, $04, $01, $02, $00, $04, $01, $2a, $a6, $6d, $00, $00
ELIF DEF(STAR)
	db $3e, $09, $ea, $89, $c7, $3e, $0d, $ea, $e2, $c7, $cd, $ad, $6a, $21, $ad, $6a
	db $cd, $11, $4f, $1e, $0e, $21, $d8, $63, $cd, $3a, $40, $1e, $09, $21, $a5, $64
	db $cd, $fb, $40, $1e, $02, $21, $77, $65, $cd, $fb, $40, $3e, $01, $cd, $c6, $4c
	db $3e, $12, $cd, $e6, $4e, $fa, $90, $c7, $b7, $ca, $22, $66, $fa, $90, $c7, $fe
	db $07, $d2, $22, $66, $1e, $01, $21, $72, $64, $cd, $3a, $40, $1e, $01, $21, $bd
	db $65, $cd, $fb, $40, $c3, $2a, $66, $1e, $01, $21, $af, $65, $cd, $fb, $40, $21
	db $34, $00, $cd, $2e, $46, $fe, $01, $c2, $66, $66, $21, $c3, $00, $cd, $2e, $46
	db $b7, $c2, $66, $66, $fa, $df, $c7, $fe, $1a, $c2, $66, $66, $21, $35, $00, $cd
	db $2e, $46, $b7, $c2, $66, $66, $1e, $01, $21, $a1, $65, $cd, $fb, $40, $af, $cd
	db $53, $46, $cd, $1c, $40, $cd, $3f, $6b, $c3, $dd, $66, $21, $22, $00, $cd, $2e
	db $46, $fe, $01, $c2, $9e, $66, $21, $43, $00, $cd, $2e, $46, $b7, $c2, $9e, $66
	db $21, $c2, $00, $cd, $2e, $46, $b7, $c2, $9e, $66, $fa, $df, $c7, $fe, $ff, $ca
	db $9b, $66, $1e, $01, $21, $93, $65, $cd, $fb, $40, $cd, $1c, $40, $cd, $d6, $6a
	db $c3, $dd, $66, $21, $22, $00, $cd, $2e, $46, $b7, $c2, $da, $66, $1e, $06, $21
	db $23, $65, $cd, $fb, $40, $21, $14, $00, $cd, $2e, $46, $fe, $01, $c2, $d4, $66
	db $21, $07, $00, $cd, $2e, $46, $fe, $01, $c2, $d4, $66, $1e, $00, $3e, $10, $cd
	db $3d, $41, $1e, $00, $3e, $11, $cd, $3d, $41, $cd, $1c, $40, $c3, $dd, $66, $cd
	db $1c, $40, $c9, $13, $0a, $ff, $ff, $11, $0a, $13, $0a, $ff, $ff, $15, $0a, $13
	db $0a, $ff, $ff, $7b, $b7, $c2, $b1, $67, $3e, $0f, $cd, $6d, $4e, $fe, $ff, $c2
	db $1b, $67, $3e, $41, $cd, $6d, $4e, $fe, $ff, $c2, $1b, $67, $3e, $50, $cd, $6d
	db $4e, $fe, $ff, $c2, $1b, $67, $3e, $64, $cd, $6d, $4e, $fe, $ff, $ca, $ab, $67
	db $fa, $90, $c7, $b7, $ca, $a2, $67, $fa, $90, $c7, $fe, $06, $d2, $a2, $67, $21
	db $2d, $03, $cd, $ba, $44, $b7, $c2, $9f, $67, $fa, $38, $c8, $fe, $01, $ca, $4d
	db $67, $b7, $c2, $5a, $67, $0e, $01, $11, $de, $66, $3e, $2a, $cd, $3e, $46, $c3
	db $64, $67, $0e, $01, $11, $e2, $66, $3e, $2a, $cd, $3e, $46, $c3, $64, $67, $0e
	db $01, $11, $e8, $66, $3e, $2a, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $e6, $4e
	db $3e, $0a, $cd, $e6, $4e, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $0b, $cd
	db $76, $41, $3e, $44, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $04, $cd
	db $c6, $4c, $3e, $02, $cd, $77, $46, $2e, $12, $e5, $0e, $0a, $1e, $01, $3e, $1e
	db $cd, $ff, $4d, $c1, $c3, $a8, $67, $21, $77, $03, $cd, $98, $44, $c3, $b1, $67
	db $21, $76, $03, $cd, $98, $44, $c9, $0c, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2
	db $ef, $67, $1e, $01, $f8, $01, $7e, $3d, $cd, $95, $40, $21, $1e, $00, $cd, $8f
	db $46, $3e, $03, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bc, $01, $cd, $98
	db $44, $0e, $01, $11, $b2, $67, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e
	db $3d, $cd, $95, $40, $c1, $c9, $0d, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2, $2e
	db $68, $1e, $03, $f8, $01, $7e, $3c, $cd, $95, $40, $21, $1e, $00, $cd, $8f, $46
	db $3e, $01, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bc, $01, $cd, $98, $44
	db $0e, $01, $11, $f1, $67, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e, $3c
	db $cd, $95, $40, $c1, $c9, $19, $07, $ff, $ff, $f5, $7b, $fe, $02, $c2, $6d, $68
	db $1e, $01, $f8, $01, $7e, $3d, $cd, $95, $40, $21, $1e, $00, $cd, $8f, $46, $3e
	db $03, $cd, $77, $46, $3e, $69, $cd, $fe, $4e, $21, $bd, $01, $cd, $98, $44, $0e
	db $01, $11, $30, $68, $3e, $2a, $cd, $3e, $46, $1e, $02, $f8, $01, $7e, $3d, $cd
	db $95, $40, $c1, $c9, $f5, $c5, $f8, $00, $36, $ff, $7b, $b7, $c2, $a4, $6a, $f8
	db $03, $7e, $cd, $4b, $44, $fa, $96, $c7, $fe, $04, $c2, $0a, $69, $3e, $49, $cd
	db $6d, $4e, $f8, $01, $77, $fe, $ff, $ca, $07, $69, $21, $16, $04, $cd, $a9, $44
	db $3e, $49, $cd, $7d, $4e, $fe, $01, $c2, $fe, $68, $21, $95, $02, $cd, $a9, $44
	db $21, $00, $04, $cd, $ba, $44, $b7, $c2, $ed, $68, $3e, $68, $cd, $fe, $4e, $21
	db $0c, $04, $cd, $a9, $44, $f8, $01, $6e, $26, $00, $11, $00, $0b, $19, $cd, $88
	db $44, $7d, $f5, $0e, $00, $1e, $01, $f8, $03, $7e, $cd, $87, $4d, $f1, $4f, $1e
	db $00, $3e, $4a, $cd, $87, $4d, $3e, $05, $ea, $96, $c7, $f8, $00, $36, $01, $c3
	db $fb, $68, $3e, $69, $cd, $fe, $4e, $21, $0d, $04, $cd, $a9, $44, $c3, $a4, $6a
	db $c3, $07, $69, $21, $6e, $04, $cd, $98, $44, $c3, $a4, $6a, $c3, $4f, $6a, $fa
	db $96, $c7, $fe, $0c, $c2, $94, $69, $3e, $7c, $cd, $6d, $4e, $f8, $01, $77, $fe
	db $ff, $ca, $91, $69, $21, $16, $04, $cd, $a9, $44, $3e, $7c, $cd, $7d, $4e, $fe
	db $01, $c2, $88, $69, $21, $96, $02, $cd, $a9, $44, $21, $00, $04, $cd, $ba, $44
	db $b7, $c2, $77, $69, $3e, $68, $cd, $fe, $4e, $21, $32, $04, $cd, $a9, $44, $f8
	db $01, $6e, $26, $00, $11, $00, $0b, $19, $cd, $88, $44, $7d, $f5, $0e, $00, $1e
	db $01, $f8, $03, $7e, $cd, $87, $4d, $f1, $4f, $1e, $00, $3e, $7e, $cd, $87, $4d
	db $3e, $0d, $ea, $96, $c7, $f8, $00, $36, $01, $c3, $85, $69, $3e, $69, $cd, $fe
	db $4e, $21, $33, $04, $cd, $a9, $44, $c3, $a4, $6a, $c3, $91, $69, $21, $6e, $04
	db $cd, $98, $44, $c3, $a4, $6a, $c3, $4f, $6a, $3e, $49, $cd, $6d, $4e, $f8, $01
	db $77, $fe, $ff, $c2, $ae, $69, $3e, $7c, $cd, $6d, $4e, $f8, $01, $77, $fe, $ff
	db $ca, $4f, $6a, $fa, $96, $c7, $fe, $08, $ca, $37, $6a, $fe, $06, $ca, $37, $6a
	db $fe, $0a, $ca, $28, $6a, $fe, $05, $ca, $28, $6a, $fe, $07, $ca, $19, $6a, $b7
	db $ca, $19, $6a, $fe, $0d, $ca, $0a, $6a, $fe, $03, $ca, $0a, $6a, $fe, $0b, $ca
	db $fb, $69, $fe, $02, $ca, $fb, $69, $fe, $09, $ca, $ec, $69, $fe, $01, $c2, $46
	db $6a, $21, $40, $01, $cd, $98, $44, $21, $4d, $03, $cd, $98, $44, $c3, $4c, $6a
	db $21, $40, $01, $cd, $98, $44, $21, $05, $02, $cd, $98, $44, $c3, $4c, $6a, $21
	db $40, $01, $cd, $98, $44, $21, $0a, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $40
	db $01, $cd, $98, $44, $21, $4b, $03, $cd, $98, $44, $c3, $4c, $6a, $21, $40, $01
	db $cd, $98, $44, $21, $41, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $40, $01, $cd
	db $98, $44, $21, $44, $02, $cd, $98, $44, $c3, $4c, $6a, $21, $16, $04, $cd, $a9
	db $44, $c3, $a4, $6a, $f8, $00, $7e, $fe, $ff, $c2, $a4, $6a, $fa, $96, $c7, $fe
	db $0d, $d2, $76, $6a, $fa, $96, $c7, $fe, $05, $da, $76, $6a, $21, $16, $04, $cd
	db $a9, $44, $21, $31, $04, $cd, $a9, $44, $c3, $a4, $6a, $fa, $96, $c7, $fe, $0f
	db $c2, $87, $6a, $21, $16, $04, $cd, $a9, $44, $c3, $a4, $6a, $fa, $96, $c7, $fe
	db $0d, $da, $98, $6a, $21, $34, $04, $cd, $a9, $44, $c3, $a4, $6a, $21, $16, $04
	db $cd, $a9, $44, $21, $ba, $01, $cd, $a9, $44, $c1, $c1, $c9, $05, $0e, $01, $01
	db $07, $08, $fa, $90, $c7, $b7, $ca, $c5, $6a, $fa, $90, $c7, $fe, $07, $d2, $c5
	db $6a, $21, $a7, $6a, $cd, $9b, $4d, $cd, $02, $4f, $c9, $19, $05, $ff, $ff, $19
	db $0d, $ff, $ff, $1a, $06, $ff, $ff, $19, $07, $ff, $ff, $01, $c6, $6a, $1e, $2a
	db $3e, $0c, $cd, $88, $46, $cd, $0c, $42, $0e, $01, $11, $ce, $6a, $3e, $2a, $cd
	db $3e, $46, $cd, $0c, $42, $3e, $03, $cd, $77, $46, $01, $ca, $6a, $1e, $2a, $3e
	db $0c, $cd, $88, $46, $cd, $0c, $42, $3e, $02, $cd, $77, $46, $1e, $00, $3e, $0c
	db $cd, $3d, $41, $21, $12, $01, $cd, $98, $44, $0e, $01, $11, $d2, $6a, $3e, $2a
	db $cd, $3e, $46, $cd, $0c, $42, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $2e, $07
	db $e5, $0e, $19, $1e, $01, $3e, $19, $cd, $ff, $4d, $c1, $c9, $19, $06, $ff, $ff
	db $19, $0d, $ff, $ff, $01, $37, $6b, $1e, $2a, $3e, $0c, $cd, $88, $46, $cd, $0c
	db $42, $21, $1e, $00, $cd, $8f, $46, $21, $bf, $01, $cd, $98, $44, $21, $1e, $00
	db $cd, $8f, $46, $01, $3b, $6b, $1e, $2a, $3e, $0c, $cd, $88, $46, $cd, $0c, $42
	db $21, $1e, $00, $cd, $8f, $46, $2e, $06, $e5, $0e, $07, $1e, $00, $3e, $1a, $cd
	db $ff, $4d, $c1, $1e, $01, $21, $c3, $00, $cd, $1b, $46, $c9, $7b, $fe, $02, $c2
	db $92, $6b, $3e, $0c, $ea, $8a, $c7, $c9, $01, $04, $01, $01, $19, $04, $09, $18
	db $09, $17, $2e, $0e, $03, $01, $03, $1c, $01, $05, $14, $06, $14, $2e, $00, $03
	db $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00, $00, $03, $13, $03
	db $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00, $00, $03, $13, $03, $36, $26
	db $29, $7a, $0f, $0b, $00, $05, $06, $00, $00, $03, $13, $03, $85, $26, $29, $7b
	db $14, $0d, $1f, $11, $06, $00, $09, $0c, $08, $03, $01, $01, $02, $04, $00, $2a
	db $cc, $6c, $00, $00, $ff, $00, $08, $04, $01, $02, $00, $04, $01, $2a, $cc, $6c
	db $00, $00, $09, $0c, $0a, $03, $01, $01, $02, $04, $00, $2a, $a6, $6d, $00, $00
	db $ff, $00, $0a, $04, $01, $02, $00, $04, $01, $2a, $a6, $6d, $00, $00
ENDC

Func_aac19:: ; aac19
IF DEF(SUN)
	db $1e, $02, $21, $93, $6b, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $04, $21
	db $a9, $6b, $cd, $24, $4d, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $8a, $6c, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $8a, $6c, $1e, $04, $21, $e1, $6b, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $af, $00, $cd, $2e, $46, $b7, $ca, $6f, $6c, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b0, $00, $cd, $2e, $46, $b7, $ca, $87, $6c
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $8f
	db $6c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $87, $06, $28, $03, $03, $00, $14, $88, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $08, $04, $ff, $ff, $08, $04, $01, $04, $ff, $ff, $06, $04, $01
	db $04, $ff, $ff, $d5, $21, $af, $00, $cd, $2e, $46, $b7, $c2, $67, $6d, $f8, $00
	db $7e, $fe, $02, $ca, $e3, $6c, $b7, $c2, $67, $6d, $fa, $d9, $c2, $c6, $04, $fe
	db $03, $c2, $f4, $6c, $af, $cd, $4b, $44, $c3, $02, $6d, $0e, $01, $11, $bc, $6c
	db $3e, $2a, $cd, $3e, $46, $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd
	db $e6, $4e, $21, $14, $01, $cd, $98, $44, $11, $69, $6d, $21, $93, $6c, $cd, $d3
	db $4d, $b7, $c2, $21, $6d, $c3, $67, $6d, $21, $0f, $01, $cd, $98, $44, $fa, $d9
	db $c2, $c6, $04, $fe, $03, $c2, $3d, $6d, $01, $c0, $6c, $1e, $2a, $af, $cd, $88
	db $46, $c3, $46, $6d, $01, $c6, $6c, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6
	db $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $af, $00, $cd, $1b, $46, $c1, $c9
	db $28, $cd, $b2, $bc, $29, $00, $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $84, $06, $28, $04, $04, $00, $14, $85, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a
	db $04, $ff, $ff, $0a, $04, $0e, $04, $ff, $ff, $0e, $03, $ff, $ff, $d5, $21, $b0
	db $00, $cd, $2e, $46, $b7, $c2, $45, $6e, $f8, $00, $7e, $fe, $02, $ca, $bd, $6d
	db $b7, $c2, $45, $6e, $fa, $d9, $c2, $c6, $04, $fe, $03, $c2, $cf, $6d, $3e, $02
	db $cd, $4b, $44, $c3, $dd, $6d, $0e, $01, $11, $98, $6d, $3e, $2a, $cd, $3e, $46
	db $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0c, $01
	db $cd, $98, $44, $11, $47, $6e, $21, $6f, $6d, $cd, $d3, $4d, $b7, $c2, $fc, $6d
	db $c3, $45, $6e, $21, $0f, $01, $cd, $98, $44, $fa, $d9, $c2, $c6, $04, $fe, $03
	db $c2, $19, $6e, $01, $9c, $6d, $1e, $2a, $3e, $02, $cd, $88, $46, $c3, $23, $6e
	db $01, $a2, $6d, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e
	db $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e
	db $04, $cd, $e6, $4e, $1e, $01, $21, $b0, $00, $cd, $1b, $46, $c1, $c9, $28, $cd
	db $b2, $bc, $29, $00, $11, $04, $01, $01, $19, $05, $01, $18, $01, $17, $2e, $05
	db $03, $01, $03, $1c, $01, $1d, $14, $1c, $14, $2e, $00, $03, $13, $03, $3f, $23
	db $26, $26, $0c, $0f, $00, $05, $0a, $00, $00, $03, $13, $03, $56, $24, $27, $48
	db $0c, $0c, $0c, $10, $0a, $00, $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b
	db $00, $05, $06, $00, $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05
	db $03, $00, $09, $0c, $08, $03, $01, $01, $02, $04, $00, $2a, $84, $6f, $00, $00
	db $ff, $00, $08, $04, $01, $02, $00, $04, $01, $2a, $84, $6f, $00, $00, $09, $0c
	db $0a, $03, $01, $01, $02, $04, $00, $2a, $5c, $70, $00, $00, $ff, $00, $0a, $04
	db $01, $02, $00, $04, $01, $2a, $5c, $70, $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $93, $6b, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $04, $21
	db $a9, $6b, $cd, $24, $4d, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $8a, $6c, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $8a, $6c, $1e, $04, $21, $e1, $6b, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $af, $00, $cd, $2e, $46, $b7, $ca, $6f, $6c, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b0, $00, $cd, $2e, $46, $b7, $ca, $87, $6c
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $8f
	db $6c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $84, $06, $28, $03, $03, $00, $14, $85, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $08, $04, $ff, $ff, $08, $04, $01, $04, $ff, $ff, $06, $04, $01
	db $04, $ff, $ff, $d5, $21, $af, $00, $cd, $2e, $46, $b7, $c2, $67, $6d, $f8, $00
	db $7e, $fe, $02, $ca, $e3, $6c, $b7, $c2, $67, $6d, $fa, $d9, $c2, $c6, $04, $fe
	db $03, $c2, $f4, $6c, $af, $cd, $4b, $44, $c3, $02, $6d, $0e, $01, $11, $bc, $6c
	db $3e, $2a, $cd, $3e, $46, $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd
	db $e6, $4e, $21, $14, $01, $cd, $98, $44, $11, $69, $6d, $21, $93, $6c, $cd, $d3
	db $4d, $b7, $c2, $21, $6d, $c3, $67, $6d, $21, $0f, $01, $cd, $98, $44, $fa, $d9
	db $c2, $c6, $04, $fe, $03, $c2, $3d, $6d, $01, $c0, $6c, $1e, $2a, $af, $cd, $88
	db $46, $c3, $46, $6d, $01, $c6, $6c, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6
	db $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $af, $00, $cd, $1b, $46, $c1, $c9
	db $28, $cd, $b2, $bc, $29, $00, $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $87, $06, $28, $04, $04, $00, $14, $88, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a
	db $04, $ff, $ff, $0a, $04, $0e, $04, $ff, $ff, $0e, $03, $ff, $ff, $d5, $21, $b0
	db $00, $cd, $2e, $46, $b7, $c2, $45, $6e, $f8, $00, $7e, $fe, $02, $ca, $bd, $6d
	db $b7, $c2, $45, $6e, $fa, $d9, $c2, $c6, $04, $fe, $03, $c2, $cf, $6d, $3e, $02
	db $cd, $4b, $44, $c3, $dd, $6d, $0e, $01, $11, $98, $6d, $3e, $2a, $cd, $3e, $46
	db $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0c, $01
	db $cd, $98, $44, $11, $47, $6e, $21, $6f, $6d, $cd, $d3, $4d, $b7, $c2, $fc, $6d
	db $c3, $45, $6e, $21, $0f, $01, $cd, $98, $44, $fa, $d9, $c2, $c6, $04, $fe, $03
	db $c2, $19, $6e, $01, $9c, $6d, $1e, $2a, $3e, $02, $cd, $88, $46, $c3, $23, $6e
	db $01, $a2, $6d, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e
	db $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e
	db $04, $cd, $e6, $4e, $1e, $01, $21, $b0, $00, $cd, $1b, $46, $c1, $c9, $28, $cd
	db $b2, $bc, $29, $00, $11, $04, $01, $01, $19, $05, $01, $18, $01, $17, $2e, $05
	db $03, $01, $03, $1c, $01, $1d, $14, $1c, $14, $2e, $00, $03, $13, $03, $3f, $23
	db $26, $26, $0c, $0f, $00, $05, $0a, $00, $00, $03, $13, $03, $56, $24, $27, $48
	db $0c, $0c, $0c, $10, $0a, $00, $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b
	db $00, $05, $06, $00, $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11
	db $06, $00, $09, $0c, $08, $03, $01, $01, $02, $04, $00, $2a, $84, $6f, $00, $00
	db $ff, $00, $08, $04, $01, $02, $00, $04, $01, $2a, $84, $6f, $00, $00, $09, $0c
	db $0a, $03, $01, $01, $02, $04, $00, $2a, $5c, $70, $00, $00, $ff, $00, $0a, $04
	db $01, $02, $00, $04, $01, $2a, $5c, $70, $00, $00
ENDC

Func_aaed3:: ; aaed3
IF DEF(SUN)
	db $1e, $02, $21, $4d, $6e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $04, $21
	db $63, $6e, $cd, $24, $4d, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $44, $6f, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $44, $6f, $1e, $04, $21, $9b, $6e, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $b3, $00, $cd, $2e, $46, $b7, $ca, $29, $6f, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b4, $00, $cd, $2e, $46, $b7, $ca, $41, $6f
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $49
	db $6f, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $0a, $01, $57, $06, $28, $0f, $17, $00, $05, $03, $06, $28, $01
	db $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $08, $04, $ff, $ff, $08, $04, $05, $04, $ff, $ff, $05, $03, $ff
	db $ff, $d5, $21, $b3, $00, $cd, $2e, $46, $b7, $c2, $1b, $70, $f8, $00, $7e, $fe
	db $02, $ca, $9b, $6f, $b7, $c2, $1b, $70, $fa, $d9, $c2, $fe, $ff, $c2, $aa, $6f
	db $af, $cd, $4b, $44, $c3, $b8, $6f, $0e, $01, $11, $76, $6f, $3e, $2a, $cd, $3e
	db $46, $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0e
	db $01, $cd, $98, $44, $11, $1d, $70, $21, $4d, $6f, $cd, $d3, $4d, $b7, $c2, $d7
	db $6f, $c3, $1b, $70, $21, $0f, $01, $cd, $98, $44, $fa, $d9, $c2, $fe, $ff, $c2
	db $f1, $6f, $01, $7a, $6f, $1e, $2a, $af, $cd, $88, $46, $c3, $fa, $6f, $01, $80
	db $6f, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41
	db $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e
	db $1e, $01, $21, $b3, $00, $cd, $1b, $46, $c1, $c9, $28, $cd, $b2, $bc, $29, $00
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $24, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a, $04, $ff, $ff, $0a, $04, $11
	db $04, $ff, $ff, $0c, $04, $11, $04, $ff, $ff, $d5, $21, $b4, $00, $cd, $2e, $46
	db $b7, $c2, $f7, $70, $f8, $00, $7e, $fe, $02, $ca, $73, $70, $b7, $c2, $f7, $70
	db $fa, $d9, $c2, $fe, $ff, $c2, $83, $70, $3e, $02, $cd, $4b, $44, $c3, $91, $70
	db $0e, $01, $11, $4c, $70, $3e, $2a, $cd, $3e, $46, $af, $cd, $77, $46, $af, $cd
	db $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0b, $01, $cd, $98, $44, $11, $f9, $70
	db $21, $23, $70, $cd, $d3, $4d, $b7, $c2, $b0, $70, $c3, $f7, $70, $21, $0f, $01
	db $cd, $98, $44, $fa, $d9, $c2, $fe, $ff, $c2, $cb, $70, $01, $50, $70, $1e, $2a
	db $3e, $02, $cd, $88, $46, $c3, $d5, $70, $01, $56, $70, $1e, $2a, $3e, $02, $cd
	db $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03
	db $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b4
	db $00, $cd, $1b, $46, $c1, $c9, $28, $cd, $b2, $bc, $29, $00, $09, $18, $01, $01
	db $19, $02, $01, $04, $02, $04, $2e, $09, $04, $01, $01, $19, $00, $05, $12, $06
	db $12, $2e, $3c, $01, $08, $03, $1c, $3d, $01, $0c, $01, $0f, $3e, $00, $09, $03
	db $1e, $3f, $00, $0b, $03, $1f, $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f
	db $00, $05, $0a, $00, $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10
	db $0a, $00, $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	db $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00, $09, $0c
	db $08, $0e, $01, $01, $01, $04, $00, $2a, $4a, $72, $00, $00, $ff, $00, $09, $0e
	db $02, $01, $00, $04, $01, $2a, $4a, $72, $00, $00, $09, $0c, $08, $0c, $01, $01
	db $01, $04, $00, $2a, $27, $73, $00, $00, $ff, $00, $09, $0c, $02, $01, $00, $04
	db $01, $2a, $27, $73, $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $4d, $6e, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $04, $21
	db $63, $6e, $cd, $24, $4d, $1e, $01, $21, $c2, $00, $cd, $1b, $46, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $44, $6f, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $44, $6f, $1e, $04, $21, $9b, $6e, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $b3, $00, $cd, $2e, $46, $b7, $ca, $29, $6f, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b4, $00, $cd, $2e, $46, $b7, $ca, $41, $6f
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $49
	db $6f, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $0a, $01, $02, $06, $28, $0f, $17, $00, $05, $03, $06, $28, $01
	db $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $08, $04, $ff, $ff, $08, $04, $05, $04, $ff, $ff, $05, $03, $ff
	db $ff, $d5, $21, $b3, $00, $cd, $2e, $46, $b7, $c2, $1b, $70, $f8, $00, $7e, $fe
	db $02, $ca, $9b, $6f, $b7, $c2, $1b, $70, $fa, $d9, $c2, $fe, $ff, $c2, $aa, $6f
	db $af, $cd, $4b, $44, $c3, $b8, $6f, $0e, $01, $11, $76, $6f, $3e, $2a, $cd, $3e
	db $46, $af, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0e
	db $01, $cd, $98, $44, $11, $1d, $70, $21, $4d, $6f, $cd, $d3, $4d, $b7, $c2, $d7
	db $6f, $c3, $1b, $70, $21, $0f, $01, $cd, $98, $44, $fa, $d9, $c2, $fe, $ff, $c2
	db $f1, $6f, $01, $7a, $6f, $1e, $2a, $af, $cd, $88, $46, $c3, $fa, $6f, $01, $80
	db $6f, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $af, $cd, $3d, $41
	db $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e
	db $1e, $01, $21, $b3, $00, $cd, $1b, $46, $c1, $c9, $28, $cd, $b2, $bc, $29, $00
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $22, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0a, $04, $ff, $ff, $0a, $04, $11
	db $04, $ff, $ff, $0c, $04, $11, $04, $ff, $ff, $d5, $21, $b4, $00, $cd, $2e, $46
	db $b7, $c2, $f7, $70, $f8, $00, $7e, $fe, $02, $ca, $73, $70, $b7, $c2, $f7, $70
	db $fa, $d9, $c2, $fe, $ff, $c2, $83, $70, $3e, $02, $cd, $4b, $44, $c3, $91, $70
	db $0e, $01, $11, $4c, $70, $3e, $2a, $cd, $3e, $46, $af, $cd, $77, $46, $af, $cd
	db $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0b, $01, $cd, $98, $44, $11, $f9, $70
	db $21, $23, $70, $cd, $d3, $4d, $b7, $c2, $b0, $70, $c3, $f7, $70, $21, $0f, $01
	db $cd, $98, $44, $fa, $d9, $c2, $fe, $ff, $c2, $cb, $70, $01, $50, $70, $1e, $2a
	db $3e, $02, $cd, $88, $46, $c3, $d5, $70, $01, $56, $70, $1e, $2a, $3e, $02, $cd
	db $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03
	db $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b4
	db $00, $cd, $1b, $46, $c1, $c9, $28, $cd, $b2, $bc, $29, $00, $09, $18, $01, $01
	db $19, $02, $01, $04, $02, $04, $2e, $09, $04, $01, $01, $19, $00, $05, $12, $06
	db $12, $2e, $3c, $01, $08, $03, $1c, $3d, $01, $0c, $01, $0f, $3e, $00, $09, $03
	db $1e, $3f, $00, $0b, $03, $1f, $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f
	db $00, $05, $0a, $00, $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10
	db $0a, $00, $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	db $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00, $09, $0c
	db $08, $0e, $01, $01, $01, $04, $00, $2a, $4a, $72, $00, $00, $ff, $00, $09, $0e
	db $02, $01, $00, $04, $01, $2a, $4a, $72, $00, $00, $09, $0c, $08, $0c, $01, $01
	db $01, $04, $00, $2a, $27, $73, $00, $00, $ff, $00, $09, $0c, $02, $01, $00, $04
	db $01, $2a, $27, $73, $00, $00
ENDC

Func_ab199:: ; ab199
IF DEF(SUN)
	db $1e, $02, $21, $ff, $70, $cd, $3a, $40, $1e, $04, $21, $15, $71, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $04, $21, $29, $71, $cd, $24, $4d, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $0a, $72, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $0a, $72, $1e, $04, $21, $61, $71, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $b1, $00, $cd, $2e, $46, $b7, $ca, $ef, $71, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b2, $00, $cd, $2e, $46, $b7, $ca, $07, $72
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $0f
	db $72, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $09, $0e, $ff, $ff, $09, $0e, $09, $15, $ff, $ff, $08, $15, $ff
	db $ff, $d5, $21, $b1, $00, $cd, $2e, $46, $b7, $c2, $e8, $72, $f8, $00, $7e, $fe
	db $02, $ca, $61, $72, $b7, $c2, $e8, $72, $fa, $d8, $c2, $c6, $05, $fe, $08, $c2
	db $72, $72, $af, $cd, $4b, $44, $c3, $81, $72, $0e, $01, $11, $3c, $72, $3e, $2a
	db $cd, $3e, $46, $3e, $03, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6
	db $4e, $21, $0c, $01, $cd, $98, $44, $11, $ea, $72, $21, $13, $72, $cd, $d3, $4d
	db $b7, $c2, $a0, $72, $c3, $e8, $72, $21, $0f, $01, $cd, $98, $44, $fa, $38, $c8
	db $fe, $02, $ca, $b2, $72, $b7, $c2, $be, $72, $01, $40, $72, $1e, $2a, $af, $cd
	db $88, $46, $c3, $c7, $72, $01, $46, $72, $1e, $2a, $af, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd
	db $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b1, $00, $cd, $1b, $46, $c1
	db $c9, $28, $cd, $b2, $bc, $29, $00, $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
	db $09, $0c, $ff, $ff, $09, $0c, $09, $06, $ff, $ff, $08, $06, $ff, $ff, $d5, $21
	db $b2, $00, $cd, $2e, $46, $b7, $c2, $c9, $73, $f8, $00, $7e, $fe, $02, $ca, $3e
	db $73, $b7, $c2, $c9, $73, $fa, $d8, $c2, $c6, $05, $fe, $08, $c2, $50, $73, $3e
	db $02, $cd, $4b, $44, $c3, $5f, $73, $0e, $01, $11, $19, $73, $3e, $2a, $cd, $3e
	db $46, $3e, $03, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21
	db $0d, $01, $cd, $98, $44, $11, $cb, $73, $21, $f0, $72, $cd, $d3, $4d, $b7, $c2
	db $7e, $73, $c3, $c9, $73, $21, $0f, $01, $cd, $98, $44, $fa, $38, $c8, $fe, $02
	db $ca, $90, $73, $b7, $c2, $9d, $73, $01, $1d, $73, $1e, $2a, $3e, $02, $cd, $88
	db $46, $c3, $a7, $73, $01, $23, $73, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $af
	db $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b2, $00, $cd, $1b, $46
	db $c1, $c9, $28, $cd, $b2, $bc, $29, $00, $01, $04, $01, $01, $19, $00, $0c, $12
	db $0b, $12, $2e, $01, $18, $01, $01, $19, $03, $11, $04, $10, $04, $2e, $40, $09
	db $08, $01, $0f, $41, $09, $0c, $01, $36, $42, $0a, $09, $01, $4a, $43, $0a, $0b
	db $01, $42, $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	db $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00, $00, $03
	db $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00, $00, $03, $0b, $17
	db $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00, $09, $0c, $00, $0e, $01, $01
	db $01, $04, $00, $2a, $1a, $75, $00, $00, $ff, $00, $01, $0e, $02, $01, $00, $04
	db $01, $2a, $1a, $75, $00, $00, $09, $0c, $00, $0c, $01, $01, $01, $04, $00, $2a
	db $f4, $75, $00, $00, $ff, $00, $01, $0c, $02, $01, $00, $04, $01, $2a, $f4, $75
	db $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $ff, $70, $cd, $3a, $40, $1e, $04, $21, $15, $71, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $04, $21, $29, $71, $cd, $24, $4d, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $0a, $72, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $0a, $72, $1e, $04, $21, $61, $71, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $b1, $00, $cd, $2e, $46, $b7, $ca, $ef, $71, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b2, $00, $cd, $2e, $46, $b7, $ca, $07, $72
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $0f
	db $72, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $09, $0e, $ff, $ff, $09, $0e, $09, $15, $ff, $ff, $08, $15, $ff
	db $ff, $d5, $21, $b1, $00, $cd, $2e, $46, $b7, $c2, $e8, $72, $f8, $00, $7e, $fe
	db $02, $ca, $61, $72, $b7, $c2, $e8, $72, $fa, $d8, $c2, $c6, $05, $fe, $08, $c2
	db $72, $72, $af, $cd, $4b, $44, $c3, $81, $72, $0e, $01, $11, $3c, $72, $3e, $2a
	db $cd, $3e, $46, $3e, $03, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6
	db $4e, $21, $0c, $01, $cd, $98, $44, $11, $ea, $72, $21, $13, $72, $cd, $d3, $4d
	db $b7, $c2, $a0, $72, $c3, $e8, $72, $21, $0f, $01, $cd, $98, $44, $fa, $38, $c8
	db $fe, $02, $ca, $b2, $72, $b7, $c2, $be, $72, $01, $40, $72, $1e, $2a, $af, $cd
	db $88, $46, $c3, $c7, $72, $01, $46, $72, $1e, $2a, $af, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd
	db $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b1, $00, $cd, $1b, $46, $c1
	db $c9, $28, $cd, $b2, $bc, $29, $00, $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
	db $09, $0c, $ff, $ff, $09, $0c, $09, $06, $ff, $ff, $08, $06, $ff, $ff, $d5, $21
	db $b2, $00, $cd, $2e, $46, $b7, $c2, $c9, $73, $f8, $00, $7e, $fe, $02, $ca, $3e
	db $73, $b7, $c2, $c9, $73, $fa, $d8, $c2, $c6, $05, $fe, $08, $c2, $50, $73, $3e
	db $02, $cd, $4b, $44, $c3, $5f, $73, $0e, $01, $11, $19, $73, $3e, $2a, $cd, $3e
	db $46, $3e, $03, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21
	db $0d, $01, $cd, $98, $44, $11, $cb, $73, $21, $f0, $72, $cd, $d3, $4d, $b7, $c2
	db $7e, $73, $c3, $c9, $73, $21, $0f, $01, $cd, $98, $44, $fa, $38, $c8, $fe, $02
	db $ca, $90, $73, $b7, $c2, $9d, $73, $01, $1d, $73, $1e, $2a, $3e, $02, $cd, $88
	db $46, $c3, $a7, $73, $01, $23, $73, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $af
	db $cd, $e6, $4e, $3e, $04, $cd, $e6, $4e, $1e, $01, $21, $b2, $00, $cd, $1b, $46
	db $c1, $c9, $28, $cd, $b2, $bc, $29, $00, $01, $04, $01, $01, $19, $00, $0c, $12
	db $0b, $12, $2e, $01, $18, $01, $01, $19, $03, $11, $04, $10, $04, $2e, $40, $09
	db $08, $01, $0f, $41, $09, $0c, $01, $36, $42, $0a, $09, $01, $4a, $43, $0a, $0b
	db $01, $42, $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	db $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00, $00, $03
	db $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00, $00, $03, $0b, $17
	db $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00, $09, $0c, $00, $0e, $01, $01
	db $01, $04, $00, $2a, $1a, $75, $00, $00, $ff, $00, $01, $0e, $02, $01, $00, $04
	db $01, $2a, $1a, $75, $00, $00, $09, $0c, $00, $0c, $01, $01, $01, $04, $00, $2a
	db $f4, $75, $00, $00, $ff, $00, $01, $0c, $02, $01, $00, $04, $01, $2a, $f4, $75
	db $00, $00
ENDC

Func_ab46b:: ; ab46b
	db $1e, $02, $21, $d1, $73, $cd, $3a, $40, $1e, $04, $21, $e7, $73, $cd, $e7, $4c
	db $3e, $03, $cd, $01, $4d, $1e, $04, $21, $fb, $73, $cd, $24, $4d, $21, $22, $00
	db $cd, $2e, $46, $fe, $01, $c2, $dc, $74, $21, $43, $00, $cd, $2e, $46, $b7, $c2
	db $dc, $74, $1e, $04, $21, $33, $74, $cd, $fb, $40, $3e, $04, $cd, $e6, $4e, $21
	db $b5, $00, $cd, $2e, $46, $b7, $ca, $c1, $74, $1e, $00, $af, $cd, $3d, $41, $1e
	db $00, $3e, $01, $cd, $3d, $41, $21, $b6, $00, $cd, $2e, $46, $b7, $ca, $d9, $74
	db $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $e1
	db $74, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $c9, $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $09, $01, $09, $06, $29, $04, $0f, $00, $05, $0c, $06, $29, $01
	db $05, $00, $05, $3c, $06, $29, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c, $01, $0e, $ff, $ff, $01, $14, $ff, $ff, $00, $14, $ff, $ff, $d5
	db $21, $b5, $00, $cd, $2e, $46, $b7, $c2, $b7, $75, $f8, $00, $7e, $fe, $02, $ca
	db $31, $75, $b7, $c2, $b7, $75, $fa, $d8, $c2, $c6, $05, $b7, $c2, $41, $75, $af
	db $cd, $4b, $44, $c3, $50, $75, $0e, $01, $11, $0e, $75, $3e, $2a, $cd, $3e, $46
	db $3e, $03, $cd, $77, $46, $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0c
	db $01, $cd, $98, $44, $11, $b9, $75, $21, $e5, $74, $cd, $d3, $4d, $b7, $c2, $6f
	db $75, $c3, $b7, $75, $21, $0f, $01, $cd, $98, $44, $fa, $38, $c8, $fe, $02, $ca
	db $81, $75, $b7, $c2, $8d, $75, $01, $12, $75, $1e, $2a, $af, $cd, $88, $46, $c3
	db $96, $75, $01, $16, $75, $1e, $2a, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $00
	db $af, $cd, $3d, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e
	db $04, $cd, $e6, $4e, $1e, $01, $21, $b5, $00, $cd, $1b, $46, $c1, $c9, $28, $cd
	db $b2, $bc, $29, $00, $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0b, $01, $08
	db $06, $29, $03, $0f, $00, $05, $0b, $06, $29, $05, $17, $00, $05, $3c, $06, $29
	db $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $01, $0c, $ff
	db $ff, $01, $06, $ff, $ff, $00, $06, $ff, $ff, $d5, $21, $b6, $00, $cd, $2e, $46
	db $b7, $c2, $95, $76, $f8, $00, $7e, $fe, $02, $ca, $0b, $76, $b7, $c2, $95, $76
	db $fa, $d8, $c2, $c6, $05, $b7, $c2, $1c, $76, $3e, $02, $cd, $4b, $44, $c3, $2b
	db $76, $0e, $01, $11, $e8, $75, $3e, $2a, $cd, $3e, $46, $3e, $03, $cd, $77, $46
	db $af, $cd, $e6, $4e, $3e, $1a, $cd, $e6, $4e, $21, $0e, $01, $cd, $98, $44, $11
	db $97, $76, $21, $bf, $75, $cd, $d3, $4d, $b7, $c2, $4a, $76, $c3, $95, $76, $21
	db $0f, $01, $cd, $98, $44, $fa, $38, $c8, $fe, $02, $ca, $5c, $76, $b7, $c2, $69
	db $76, $01, $ec, $75, $1e, $2a, $3e, $02, $cd, $88, $46, $c3, $73, $76, $01, $f0
	db $75, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $3e, $02, $cd
	db $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41, $af, $cd, $e6, $4e, $3e, $04, $cd
	db $e6, $4e, $1e, $01, $21, $b6, $00, $cd, $1b, $46, $c1, $c9, $28, $cd, $b2, $bc
	db $29, $00, $0e, $1b, $04, $01, $19, $14, $0f, $05, $0f, $06, $2e, $22, $01, $ff
	db $ff, $b3, $02, $ff, $ff, $1a, $04, $ff, $ff, $23, $0c, $10, $05, $01, $01, $02
	db $04, $00, $2a, $00, $00, $00, $00, $0d, $0c, $0f, $05, $01, $01, $02, $04, $00
	db $2a, $fc, $48, $a8, $76, $1a, $0c, $09, $10, $01, $01, $00, $04, $00, $2a, $00
	db $00, $00, $00, $09, $0c, $0d, $0c, $01, $01, $02, $04, $00, $2a, $00, $00, $00
	db $00, $09, $0c, $11, $0c, $01, $01, $02, $04, $00, $2a, $00, $00, $00, $00, $0d
	db $04, $0f, $07, $01, $01, $02, $04, $00, $2a, $5b, $7f, $00, $00, $23, $04, $10
	db $07, $01, $01, $02, $04, $00, $2a, $fc, $48, $b0, $76, $1c, $04, $10, $07, $01
	db $01, $02, $04, $00, $2a, $00, $00, $00, $00, $0d, $04, $0f, $05, $01, $01, $02
	db $04, $00, $2a, $00, $00, $00, $00, $00, $04, $10, $05, $01, $01, $02, $04, $00
	db $2a, $00, $00, $00, $00, $09, $04, $0e, $0c, $01, $01, $01, $04, $00, $2a, $00
	db $00, $00, $00, $09, $04, $0e, $0d, $01, $01, $01, $04, $00, $2a, $00, $00, $00
	db $00, $09, $04, $0e, $0e, $01, $01, $01, $04, $00, $2a, $00, $00, $00, $00, $09
	db $04, $11, $0c, $01, $01, $03, $04, $00, $2a, $00, $00, $00, $00, $09, $04, $11
	db $0d, $01, $01, $03, $04, $00, $2a, $00, $00, $00, $00, $09, $04, $11, $0e, $01
	db $01, $03, $04, $00, $2a, $00, $00, $00, $00, $ff, $00, $0c, $1a, $01, $01, $00
	db $04, $00, $2a, $5f, $48, $ac, $76, $ff, $00, $13, $1a, $01, $01, $00, $04, $00
	db $2a, $5f, $48, $ac, $76, $0f, $04, $16, $14, $01, $01, $02, $04, $00, $2a, $00
	db $00, $00, $00, $ff, $00, $16, $14, $01, $01, $02, $04, $00, $2a, $67, $7e, $00
	db $00

Func_ab7cc:: ; ab7cc
	db $1e, $02, $21, $b0, $77, $cd, $fb, $40, $1e, $00, $af, $cd, $3d, $41, $fa, $df
	db $c7, $b7, $c2, $e9, $77, $fa, $e0, $c7, $fe, $02, $ca, $f9, $77, $fa, $df, $c7
	db $fe, $1e, $c2, $04, $78, $fa, $e0, $c7, $fe, $0e, $c2, $04, $78, $1e, $08, $21
	db $24, $77, $cd, $fb, $40, $c3, $60, $78, $1e, $01, $21, $9d, $76, $cd, $3a, $40
	db $21, $43, $00, $cd, $2e, $46, $b7, $c2, $29, $78, $1e, $05, $21, $b4, $76, $cd
	db $fb, $40, $1e, $02, $21, $94, $77, $cd, $fb, $40, $c3, $60, $78, $21, $23, $00
	db $cd, $2e, $46, $fe, $01, $c2, $58, $78, $21, $48, $00, $cd, $2e, $46, $b7, $c2
	db $58, $78, $1e, $03, $21, $fa, $76, $cd, $fb, $40, $1e, $02, $21, $94, $77, $cd
	db $fb, $40, $1e, $00, $3e, $03, $cd, $3d, $41, $c3, $60, $78, $1e, $02, $21, $94
	db $77, $cd, $fb, $40, $fa, $df, $c7, $b7, $c2, $6f, $78, $fa, $e0, $c7, $fe, $02
	db $ca, $7f, $78, $fa, $df, $c7, $fe, $1e, $c2, $8a, $78, $fa, $e0, $c7, $fe, $0e
	db $c2, $8a, $78, $3e, $03, $cd, $e6, $4e, $cd, $22, $7c, $c3, $c8, $78, $21, $43
	db $00, $cd, $2e, $46, $b7, $c2, $c0, $78, $af, $cd, $53, $46, $af, $cd, $e6, $4e
	db $3e, $13, $cd, $e6, $4e, $cd, $1c, $40, $cd, $e1, $78, $1e, $01, $21, $43, $00
	db $cd, $1b, $46, $3e, $0c, $cd, $94, $4c, $af, $cd, $e6, $4e, $3e, $12, $cd, $e6
	db $4e, $c3, $c8, $78, $3e, $12, $cd, $e6, $4e, $cd, $1c, $40, $c9, $0f, $0f, $ff
	db $ff, $0d, $0f, $ff, $ff, $11, $0f, $ff, $ff, $10, $0f, $ff, $ff, $0e, $0f, $ff
	db $ff, $10, $12, $ff, $ff, $af, $fe, $0a, $d2, $f3, $78, $f5, $1e, $01, $af, $cd
	db $1e, $4e, $f1, $3c, $c3, $e2, $78, $21, $3c, $00, $cd, $8f, $46, $0e, $15, $1e
	db $0f, $3e, $04, $cd, $80, $40, $01, $c9, $78, $1e, $2a, $3e, $04, $cd, $88, $46
	db $cd, $0c, $42, $21, $3c, $00, $cd, $8f, $46, $01, $cd, $78, $1e, $2a, $3e, $05
	db $cd, $88, $46, $3e, $2e, $cd, $fe, $4e, $1e, $01, $3e, $05, $cd, $95, $40, $21
	db $3c, $00, $cd, $8f, $46, $1e, $03, $3e, $04, $cd, $95, $40, $01, $d1, $78, $1e
	db $2a, $3e, $06, $cd, $88, $46, $3e, $2e, $cd, $fe, $4e, $cd, $0c, $42, $1e, $03
	db $3e, $06, $cd, $95, $40, $21, $1e, $00, $cd, $8f, $46, $1e, $01, $3e, $04, $cd
	db $95, $40, $21, $1e, $00, $cd, $8f, $46, $01, $d5, $78, $1e, $2a, $3e, $04, $cd
	db $88, $46, $cd, $0c, $42, $3e, $62, $cd, $fe, $4e, $1e, $00, $3e, $06, $cd, $95
	db $40, $1e, $01, $3e, $06, $cd, $95, $40, $1e, $02, $3e, $06, $cd, $95, $40, $1e
	db $03, $3e, $06, $cd, $95, $40, $1e, $00, $3e, $06, $cd, $95, $40, $1e, $01, $3e
	db $06, $cd, $95, $40, $1e, $02, $3e, $06, $cd, $95, $40, $1e, $03, $3e, $06, $cd
	db $95, $40, $1e, $00, $3e, $06, $cd, $3d, $41, $3e, $4e, $cd, $fe, $4e, $01, $d9
	db $78, $1e, $2a, $3e, $04, $cd, $88, $46, $cd, $0c, $42, $3e, $63, $cd, $fe, $4e
	db $1e, $00, $3e, $05, $cd, $95, $40, $1e, $01, $3e, $05, $cd, $95, $40, $1e, $02
	db $3e, $05, $cd, $95, $40, $1e, $03, $3e, $05, $cd, $95, $40, $1e, $00, $3e, $05
	db $cd, $95, $40, $1e, $01, $3e, $05, $cd, $95, $40, $1e, $02, $3e, $05, $cd, $95
	db $40, $1e, $03, $3e, $05, $cd, $95, $40, $1e, $00, $3e, $05, $cd, $3d, $41, $3e
	db $4e, $cd, $fe, $4e, $21, $78, $00, $cd, $8f, $46, $0e, $15, $1e, $11, $3e, $03
	db $cd, $80, $40, $01, $d1, $78, $1e, $2a, $3e, $03, $cd, $88, $46, $cd, $0c, $42
	db $1e, $03, $3e, $03, $cd, $95, $40, $21, $3c, $00, $cd, $8f, $46, $21, $15, $01
	db $cd, $a9, $44, $21, $1e, $00, $cd, $8f, $46, $1e, $01, $3e, $04, $cd, $95, $40
	db $21, $16, $01, $cd, $a9, $44, $21, $17, $01, $cd, $a9, $44, $21, $18, $01, $cd
	db $a9, $44, $21, $19, $01, $cd, $a9, $44, $21, $1a, $01, $cd, $a9, $44, $21, $1b
	db $01, $cd, $a9, $44, $21, $1c, $01, $cd, $a9, $44, $01, $c9, $78, $1e, $2a, $3e
	db $04, $cd, $88, $46, $cd, $0c, $42, $0e, $01, $1e, $01, $3e, $16, $cd, $76, $41
	db $1e, $0f, $3e, $10, $cd, $e4, $41, $3e, $61, $cd, $fe, $4e, $cd, $d5, $41, $cd
	db $8b, $41, $21, $1d, $01, $cd, $a9, $44, $1e, $02, $3e, $04, $cd, $95, $40, $21
	db $3c, $00, $cd, $8f, $46, $1e, $02, $3e, $03, $cd, $95, $40, $0e, $01, $1e, $01
	db $3e, $05, $cd, $76, $41, $1e, $0f, $3e, $11, $cd, $e4, $41, $3e, $28, $cd, $fe
	db $4e, $cd, $d5, $41, $cd, $8b, $41, $af, $fe, $02, $d2, $e6, $7a, $f5, $1e, $01
	db $3e, $02, $cd, $1e, $4e, $f1, $3c, $c3, $d4, $7a, $0e, $19, $1e, $10, $3e, $02
	db $cd, $80, $40, $01, $dd, $78, $1e, $2a, $3e, $02, $cd, $88, $46, $cd, $0c, $42
	db $21, $1e, $01, $cd, $a9, $44, $21, $20, $01, $cd, $a9, $44, $0e, $01, $1e, $02
	db $3e, $16, $cd, $76, $41, $1e, $0f, $3e, $10, $cd, $e4, $41, $3e, $60, $cd, $fe
	db $4e, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $03, $3e, $03, $cd, $95, $40, $cd
	db $d5, $41, $cd, $8b, $41, $1e, $01, $3e, $04, $cd, $95, $40, $21, $1f, $01, $cd
	db $a9, $44, $0e, $01, $1e, $04, $3e, $16, $cd, $76, $41, $1e, $0f, $3e, $10, $cd
	db $e4, $41, $1e, $00, $3e, $04, $cd, $3d, $41, $cd, $d5, $41, $cd, $8b, $41, $3e
	db $01, $cd, $53, $46, $af, $fe, $08, $d2, $73, $7b, $f5, $1e, $01, $3e, $02, $cd
	db $1e, $4e, $f1, $3c, $c3, $61, $7b, $c9

Func_abb74:: ; abb74
IF DEF(SUN)
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $af
	db $cd, $77, $46, $0e, $01, $1e, $3f, $3e, $1c, $cd, $76, $41, $1e, $08, $3e, $10
	db $cd, $e4, $41, $3e, $5e, $cd, $fe, $4e, $1e, $00, $3e, $04, $cd, $3d, $41, $cd
	db $d5, $41, $1e, $01, $3e, $03, $cd, $3d, $41, $cd, $8b, $41, $21, $3c, $00, $cd
	db $8f, $46, $0e, $01, $1e, $3f, $3e, $1d, $cd, $76, $41, $1e, $08, $3e, $10, $cd
	db $e4, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41
	db $cd, $d5, $41, $1e, $01, $3e, $02, $cd, $3d, $41, $1e, $01, $3e, $03, $cd, $3d
	db $41, $cd, $8b, $41, $21, $fe, $03, $cd, $a9, $44, $21, $fc, $03, $cd, $98, $44
	db $0e, $1e, $1e, $00, $3e, $80, $cd, $87, $4d, $fe, $ff, $c2, $02, $7c, $21, $ff
	db $03, $cd, $a9, $44, $21, $fd, $03, $cd, $98, $44, $1e, $00, $3e, $2c, $cd, $62
	db $4d, $1e, $01, $21, $48, $00, $cd, $1b, $46, $c9, $0f, $07, $ff, $ff, $af, $cd
	db $77, $46, $cd, $1c, $40, $21, $48, $00, $cd, $2e, $46, $b7, $c2, $3d, $7c, $1e
	db $1c, $3e, $03, $cd, $c8, $40, $c3, $44, $7c, $1e, $23, $3e, $03, $cd, $c8, $40
	db $1e, $02, $3e, $03, $cd, $95, $40, $0e, $01, $11, $1e, $7c, $3e, $2a, $cd, $3e
	db $46, $21, $3c, $00, $cd, $8f, $46, $21, $5a, $00, $cd, $2e, $46, $b7, $c2, $6b
	db $7c, $21, $4f, $01, $cd, $a9, $44, $21, $48, $00, $cd, $2e, $46, $b7, $c2, $7b
	db $7c, $21, $89, $04, $cd, $a9, $44, $21, $5a, $00, $cd, $2e, $46, $b7, $c2, $9c
	db $7c, $21, $aa, $03, $cd, $98, $44, $0e, $00, $1e, $01, $3e, $07, $cd, $4d, $4d
	db $1e, $01, $21, $5a, $00, $cd, $1b, $46, $21, $50, $01, $cd, $a9, $44, $21, $3c
	db $00, $cd, $8f, $46, $fa, $1c, $c0, $fe, $11, $ca, $c2, $7c, $fa, $1c, $c0, $b7
	db $c2, $bc, $7c, $3e, $01, $ea, $1c, $c0, $cd, $65, $04, $c3, $a8, $7c, $af, $ea
	db $9e, $c3, $3e, $02, $cd, $e6, $4e, $3e, $01, $ea, $90, $c7, $cd, $00, $40, $b7
	db $c2, $da, $7d, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76, $cd, $f8
	db $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23, $36, $64, $cd
	db $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6, $06, $ea
	db $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $13, $23, $36, $5f, $cd, $f8, $03
	db $fa, $11, $c2, $e6, $fb, $ea, $11, $c2, $fa, $03, $c2, $f6, $04, $ea, $03, $c2
	db $fa, $03, $c2, $21, $04, $c2, $be, $c2, $24, $7d, $21, $1a, $c2, $36, $02, $23
	db $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $cd, $02, $4f, $21, $93, $03, $cd
	db $a9, $44, $af, $cd, $3e, $50, $21, $94, $03, $cd, $a9, $44, $1e, $00, $21, $e1
	db $00, $cd, $1b, $46, $1e, $00, $21, $e2, $00, $cd, $1b, $46, $1e, $00, $21, $e3
	db $00, $cd, $1b, $46, $1e, $00, $21, $e4, $00, $cd, $1b, $46, $1e, $00, $21, $e5
	db $00, $cd, $1b, $46, $1e, $00, $21, $e6, $00, $cd, $1b, $46, $2e, $0d, $e5, $0e
	db $10, $1e, $00, $af, $cd, $ff, $4d, $c1, $21, $1a, $c2, $36, $15, $23, $36, $9b
	db $23, $36, $6d, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36
	db $76, $cd, $f8, $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23
	db $36, $64, $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2
	db $f6, $06, $ea, $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $59, $23, $36, $5f
	db $cd, $f8, $03, $c3, $66, $7e, $1e, $00, $21, $e1, $00, $cd, $1b, $46, $1e, $00
	db $21, $e2, $00, $cd, $1b, $46, $1e, $00, $21, $e3, $00, $cd, $1b, $46, $1e, $00
	db $21, $e4, $00, $cd, $1b, $46, $1e, $00, $21, $e5, $00, $cd, $1b, $46, $1e, $00
	db $21, $e6, $00, $cd, $1b, $46, $3e, $01, $ea, $9a, $c7, $2e, $0d, $e5, $0e, $10
	db $1e, $00, $af, $cd, $ff, $4d, $c1, $21, $1a, $c2, $36, $15, $23, $36, $9b, $23
	db $36, $6d, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76
	db $cd, $f8, $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23, $36
	db $64, $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6
	db $06, $ea, $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $a8, $23, $36, $5f, $cd
	db $f8, $03, $c9, $7b, $b7, $c2, $5a, $7f, $21, $df, $00, $cd, $2e, $46, $b7, $c2
	db $54, $7f, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76, $41
	db $1e, $14, $3e, $16, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28, $cd
	db $fe, $4e, $1e, $01, $af, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e, $03, $af
	db $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e
	db $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $95
	db $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $3e, $0f, $cd
	db $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $14, $cd, $e6, $4e
	db $af, $cd, $4b, $44, $21, $1e, $00, $cd, $8f, $46, $0e, $11, $1e, $10, $3e, $0f
	db $cd, $8d, $4e, $1e, $01, $21, $df, $00, $cd, $1b, $46, $3e, $60, $cd, $fe, $4e
	db $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd
	db $95, $40, $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00
	db $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40
	db $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $12
	db $cd, $e6, $4e, $af, $cd, $4b, $44, $1e, $00, $af, $cd, $3d, $41, $c3, $5a, $7f
	db $21, $5c, $01, $cd, $98, $44, $c9, $7b, $b7, $c2, $79, $7f, $21, $48, $00, $cd
	db $2e, $46, $b7, $c2, $73, $7f, $21, $39, $01, $cd, $a9, $44, $c3, $79, $7f, $21
	db $19, $04, $cd, $a9, $44, $c9, $0e, $1c, $04, $01, $19, $00, $08, $05, $08, $06
	db $2e, $0e, $05, $04, $01, $19, $0a, $10, $1a, $10, $19, $2e
ELIF DEF(STAR)
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $af
	db $cd, $77, $46, $0e, $01, $1e, $3f, $3e, $1c, $cd, $76, $41, $1e, $08, $3e, $10
	db $cd, $e4, $41, $3e, $5e, $cd, $fe, $4e, $1e, $00, $3e, $04, $cd, $3d, $41, $cd
	db $d5, $41, $1e, $01, $3e, $03, $cd, $3d, $41, $cd, $8b, $41, $21, $3c, $00, $cd
	db $8f, $46, $0e, $01, $1e, $3f, $3e, $1d, $cd, $76, $41, $1e, $08, $3e, $10, $cd
	db $e4, $41, $1e, $00, $3e, $02, $cd, $3d, $41, $1e, $00, $3e, $03, $cd, $3d, $41
	db $cd, $d5, $41, $1e, $01, $3e, $02, $cd, $3d, $41, $1e, $01, $3e, $03, $cd, $3d
	db $41, $cd, $8b, $41, $21, $fe, $03, $cd, $a9, $44, $21, $fc, $03, $cd, $98, $44
	db $0e, $1e, $1e, $00, $3e, $80, $cd, $87, $4d, $fe, $ff, $c2, $02, $7c, $21, $ff
	db $03, $cd, $a9, $44, $21, $fd, $03, $cd, $98, $44, $1e, $00, $3e, $2c, $cd, $62
	db $4d, $1e, $01, $21, $48, $00, $cd, $1b, $46, $c9, $0f, $07, $ff, $ff, $af, $cd
	db $77, $46, $cd, $1c, $40, $21, $48, $00, $cd, $2e, $46, $b7, $c2, $3d, $7c, $1e
	db $1c, $3e, $03, $cd, $c8, $40, $c3, $44, $7c, $1e, $23, $3e, $03, $cd, $c8, $40
	db $1e, $02, $3e, $03, $cd, $95, $40, $0e, $01, $11, $1e, $7c, $3e, $2a, $cd, $3e
	db $46, $21, $3c, $00, $cd, $8f, $46, $21, $5a, $00, $cd, $2e, $46, $b7, $c2, $6b
	db $7c, $21, $4f, $01, $cd, $a9, $44, $21, $48, $00, $cd, $2e, $46, $b7, $c2, $7b
	db $7c, $21, $89, $04, $cd, $a9, $44, $21, $5a, $00, $cd, $2e, $46, $b7, $c2, $9c
	db $7c, $21, $aa, $03, $cd, $98, $44, $0e, $00, $1e, $01, $3e, $07, $cd, $4d, $4d
	db $1e, $01, $21, $5a, $00, $cd, $1b, $46, $21, $50, $01, $cd, $a9, $44, $21, $3c
	db $00, $cd, $8f, $46, $fa, $1c, $c0, $fe, $11, $ca, $c2, $7c, $fa, $1c, $c0, $b7
	db $c2, $bc, $7c, $3e, $01, $ea, $1c, $c0, $cd, $65, $04, $c3, $a8, $7c, $af, $ea
	db $9e, $c3, $3e, $02, $cd, $e6, $4e, $3e, $01, $ea, $90, $c7, $cd, $00, $40, $b7
	db $c2, $da, $7d, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76, $cd, $f8
	db $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23, $36, $64, $cd
	db $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6, $06, $ea
	db $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $11, $23, $36, $5f, $cd, $f8, $03
	db $fa, $11, $c2, $e6, $fb, $ea, $11, $c2, $fa, $03, $c2, $f6, $04, $ea, $03, $c2
	db $fa, $03, $c2, $21, $04, $c2, $be, $c2, $24, $7d, $21, $1a, $c2, $36, $02, $23
	db $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $cd, $02, $4f, $21, $93, $03, $cd
	db $a9, $44, $af, $cd, $3e, $50, $21, $94, $03, $cd, $a9, $44, $1e, $00, $21, $e1
	db $00, $cd, $1b, $46, $1e, $00, $21, $e2, $00, $cd, $1b, $46, $1e, $00, $21, $e3
	db $00, $cd, $1b, $46, $1e, $00, $21, $e4, $00, $cd, $1b, $46, $1e, $00, $21, $e5
	db $00, $cd, $1b, $46, $1e, $00, $21, $e6, $00, $cd, $1b, $46, $2e, $0d, $e5, $0e
	db $10, $1e, $00, $af, $cd, $ff, $4d, $c1, $21, $1a, $c2, $36, $15, $23, $36, $9b
	db $23, $36, $6d, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36
	db $76, $cd, $f8, $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23
	db $36, $64, $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2
	db $f6, $06, $ea, $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $57, $23, $36, $5f
	db $cd, $f8, $03, $c3, $66, $7e, $1e, $00, $21, $e1, $00, $cd, $1b, $46, $1e, $00
	db $21, $e2, $00, $cd, $1b, $46, $1e, $00, $21, $e3, $00, $cd, $1b, $46, $1e, $00
	db $21, $e4, $00, $cd, $1b, $46, $1e, $00, $21, $e5, $00, $cd, $1b, $46, $1e, $00
	db $21, $e6, $00, $cd, $1b, $46, $3e, $01, $ea, $9a, $c7, $2e, $0d, $e5, $0e, $10
	db $1e, $00, $af, $cd, $ff, $4d, $c1, $21, $1a, $c2, $36, $15, $23, $36, $9b, $23
	db $36, $6d, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $f2, $23, $36, $76
	db $cd, $f8, $03, $cd, $a8, $3a, $21, $1a, $c2, $36, $36, $23, $36, $dc, $23, $36
	db $64, $cd, $f8, $03, $fa, $11, $c2, $f6, $03, $ea, $11, $c2, $fa, $03, $c2, $f6
	db $06, $ea, $03, $c2, $21, $1a, $c2, $36, $3f, $23, $36, $a6, $23, $36, $5f, $cd
	db $f8, $03, $c9, $7b, $b7, $c2, $5a, $7f, $21, $df, $00, $cd, $2e, $46, $b7, $c2
	db $54, $7f, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76, $41
	db $1e, $14, $3e, $16, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28, $cd
	db $fe, $4e, $1e, $01, $af, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e, $03, $af
	db $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e
	db $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $95
	db $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $3e, $0f, $cd
	db $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $14, $cd, $e6, $4e
	db $af, $cd, $4b, $44, $21, $1e, $00, $cd, $8f, $46, $0e, $11, $1e, $10, $3e, $0f
	db $cd, $8d, $4e, $1e, $01, $21, $df, $00, $cd, $1b, $46, $3e, $60, $cd, $fe, $4e
	db $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd
	db $95, $40, $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00
	db $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40
	db $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $12
	db $cd, $e6, $4e, $af, $cd, $4b, $44, $1e, $00, $af, $cd, $3d, $41, $c3, $5a, $7f
	db $21, $5c, $01, $cd, $98, $44, $c9, $7b, $b7, $c2, $79, $7f, $21, $48, $00, $cd
	db $2e, $46, $b7, $c2, $73, $7f, $21, $39, $01, $cd, $a9, $44, $c3, $79, $7f, $21
	db $19, $04, $cd, $a9, $44, $c9, $0e, $1c, $04, $01, $19, $00, $08, $05, $08, $06
	db $2e, $0e, $05, $04, $01, $19, $0a, $10, $1a, $10, $19, $2e
ENDC

Func_abf90:: ; abf90
	db $1e, $02, $21, $7a, $7f, $cd, $3a, $40, $cd, $1c, $40, $c9

