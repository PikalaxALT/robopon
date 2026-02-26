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
	jp nz, .asm_a9b16 ; A9AEA (2a:5aea) -> C2 16 5B
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
.asm_a9b16:
	ret  ; A9B16 (2a:5b16) -> C9

Data_a9b17:
	warpdef $0f, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9b22:
	db $37, $06, $0e, $01, $31

Data_a9b27:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9b6d:
	person_event $ff, $00, $05, $15, $01, $01, $00, $04, $01, Func_a9ba9, NULL

Func_a9b7b:: ; a9b7b
	ld e, $01 ; A9B7B (2a:5b7b) -> 1E 01
	ld hl, Data_a9b17 ; A9B7D (2a:5b7d) -> 21 17 5B
	scall LoadWarps ; A9B80 (2a:5b80) -> CD 3A 40
	ld e, $01 ; A9B83 (2a:5b83) -> 1E 01
	ld hl, Data_a9b22 ; A9B85 (2a:5b85) -> 21 22 5B
	scall Func_80ce7 ; A9B88 (2a:5b88) -> CD E7 4C
	ld a, $03 ; A9B8B (2a:5b8b) -> 3E 03
	scall Func_80d01 ; A9B8D (2a:5b8d) -> CD 01 4D
	ld e, $05 ; A9B90 (2a:5b90) -> 1E 05
	ld hl, Data_a9b27 ; A9B92 (2a:5b92) -> 21 27 5B
	scall LoadEncounters ; A9B95 (2a:5b95) -> CD 24 4D
	ld e, $01 ; A9B98 (2a:5b98) -> 1E 01
	ld hl, Data_a9b6d ; A9B9A (2a:5b9a) -> 21 6D 5B
	scall LoadMapObjects ; A9B9D (2a:5b9d) -> CD FB 40
	ld a, $08 ; A9BA0 (2a:5ba0) -> 3E 08
	scall PlayMusic ; A9BA2 (2a:5ba2) -> CD E6 4E
	scall Func_8001c ; A9BA5 (2a:5ba5) -> CD 1C 40
	ret  ; A9BA8 (2a:5ba8) -> C9

Func_a9ba9:
	ld a, e ; A9BA9 (2a:5ba9) -> 7B
	cp $02 ; A9BAA (2a:5baa) -> FE 02
	jp nz, .asm_a9bd8 ; A9BAC (2a:5bac) -> C2 D8 5B
	ld a, $31 ; A9BAF (2a:5baf) -> 3E 31
	scall PlaySFX ; A9BB1 (2a:5bb1) -> CD FE 4E
	ld hl, $001e ; A9BB4 (2a:5bb4) -> 21 1E 00
	scall ScriptSleep ; A9BB7 (2a:5bb7) -> CD 8F 46
	scall StartShakingScreen ; A9BBA (2a:5bba) -> CD A2 4E
	ld a, $64 ; A9BBD (2a:5bbd) -> 3E 64
	scall PlaySFX ; A9BBF (2a:5bbf) -> CD FE 4E
	ld hl, $005a ; A9BC2 (2a:5bc2) -> 21 5A 00
	scall ScriptSleep ; A9BC5 (2a:5bc5) -> CD 8F 46
	scall StopShakingScreen ; A9BC8 (2a:5bc8) -> CD B1 4E
	ld l, $08 ; A9BCB (2a:5bcb) -> 2E 08
	push hl ; A9BCD (2a:5bcd) -> E5
	ld c, $05 ; A9BCE (2a:5bce) -> 0E 05
	ld e, $11 ; A9BD0 (2a:5bd0) -> 1E 11
	ld a, $18 ; A9BD2 (2a:5bd2) -> 3E 18
	scall Func_80dff ; A9BD4 (2a:5bd4) -> CD FF 4D
	pop bc ; A9BD7 (2a:5bd7) -> C1
.asm_a9bd8:
	ret  ; A9BD8 (2a:5bd8) -> C9

Data_a9bd9:
	warpdef $15, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9be4:
	db $38, $16, $07, $01, $31

Data_a9be9:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9c2f:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9c6b, NULL

Func_a9c3d:: ; a9c3d
	ld e, $01 ; A9C3D (2a:5c3d) -> 1E 01
	ld hl, Data_a9bd9 ; A9C3F (2a:5c3f) -> 21 D9 5B
	scall LoadWarps ; A9C42 (2a:5c42) -> CD 3A 40
	ld e, $01 ; A9C45 (2a:5c45) -> 1E 01
	ld hl, Data_a9be4 ; A9C47 (2a:5c47) -> 21 E4 5B
	scall Func_80ce7 ; A9C4A (2a:5c4a) -> CD E7 4C
	ld a, $03 ; A9C4D (2a:5c4d) -> 3E 03
	scall Func_80d01 ; A9C4F (2a:5c4f) -> CD 01 4D
	ld e, $05 ; A9C52 (2a:5c52) -> 1E 05
	ld hl, Data_a9be9 ; A9C54 (2a:5c54) -> 21 E9 5B
	scall LoadEncounters ; A9C57 (2a:5c57) -> CD 24 4D
	ld e, $01 ; A9C5A (2a:5c5a) -> 1E 01
	ld hl, Data_a9c2f ; A9C5C (2a:5c5c) -> 21 2F 5C
	scall LoadMapObjects ; A9C5F (2a:5c5f) -> CD FB 40
	ld a, $08 ; A9C62 (2a:5c62) -> 3E 08
	scall PlayMusic ; A9C64 (2a:5c64) -> CD E6 4E
	scall Func_8001c ; A9C67 (2a:5c67) -> CD 1C 40
	ret  ; A9C6A (2a:5c6a) -> C9

Func_a9c6b:
	ld a, e ; A9C6B (2a:5c6b) -> 7B
	cp $02 ; A9C6C (2a:5c6c) -> FE 02
	jp nz, .asm_a9c9a ; A9C6E (2a:5c6e) -> C2 9A 5C
	ld a, $31 ; A9C71 (2a:5c71) -> 3E 31
	scall PlaySFX ; A9C73 (2a:5c73) -> CD FE 4E
	ld hl, $001e ; A9C76 (2a:5c76) -> 21 1E 00
	scall ScriptSleep ; A9C79 (2a:5c79) -> CD 8F 46
	scall StartShakingScreen ; A9C7C (2a:5c7c) -> CD A2 4E
	ld a, $64 ; A9C7F (2a:5c7f) -> 3E 64
	scall PlaySFX ; A9C81 (2a:5c81) -> CD FE 4E
	ld hl, $005a ; A9C84 (2a:5c84) -> 21 5A 00
	scall ScriptSleep ; A9C87 (2a:5c87) -> CD 8F 46
	scall StopShakingScreen ; A9C8A (2a:5c8a) -> CD B1 4E
	ld l, $08 ; A9C8D (2a:5c8d) -> 2E 08
	push hl ; A9C8F (2a:5c8f) -> E5
	ld c, $0c ; A9C90 (2a:5c90) -> 0E 0C
	ld e, $0e ; A9C92 (2a:5c92) -> 1E 0E
	ld a, $18 ; A9C94 (2a:5c94) -> 3E 18
	scall Func_80dff ; A9C96 (2a:5c96) -> CD FF 4D
	pop bc ; A9C99 (2a:5c99) -> C1
.asm_a9c9a:
	ret  ; A9C9A (2a:5c9a) -> C9

Data_a9c9b:
	warpdef $0e, $15, $01, $01, MAP_24_13, $14, $12, $14, $11, $2e

Data_a9ca6:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9cec:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9d20, NULL

Func_a9cfa:: ; a9cfa
	ld e, $01 ; A9CFA (2a:5cfa) -> 1E 01
	ld hl, Data_a9c9b ; A9CFC (2a:5cfc) -> 21 9B 5C
	scall LoadWarps ; A9CFF (2a:5cff) -> CD 3A 40
	ld a, $03 ; A9D02 (2a:5d02) -> 3E 03
	scall Func_80d01 ; A9D04 (2a:5d04) -> CD 01 4D
	ld e, $05 ; A9D07 (2a:5d07) -> 1E 05
	ld hl, Data_a9ca6 ; A9D09 (2a:5d09) -> 21 A6 5C
	scall LoadEncounters ; A9D0C (2a:5d0c) -> CD 24 4D
	ld e, $01 ; A9D0F (2a:5d0f) -> 1E 01
	ld hl, Data_a9cec ; A9D11 (2a:5d11) -> 21 EC 5C
	scall LoadMapObjects ; A9D14 (2a:5d14) -> CD FB 40
	ld a, $08 ; A9D17 (2a:5d17) -> 3E 08
	scall PlayMusic ; A9D19 (2a:5d19) -> CD E6 4E
	scall Func_8001c ; A9D1C (2a:5d1c) -> CD 1C 40
	ret  ; A9D1F (2a:5d1f) -> C9

Func_a9d20:
	ld a, e ; A9D20 (2a:5d20) -> 7B
	cp $02 ; A9D21 (2a:5d21) -> FE 02
	jp nz, .asm_a9d4f ; A9D23 (2a:5d23) -> C2 4F 5D
	ld a, $31 ; A9D26 (2a:5d26) -> 3E 31
	scall PlaySFX ; A9D28 (2a:5d28) -> CD FE 4E
	ld hl, $001e ; A9D2B (2a:5d2b) -> 21 1E 00
	scall ScriptSleep ; A9D2E (2a:5d2e) -> CD 8F 46
	scall StartShakingScreen ; A9D31 (2a:5d31) -> CD A2 4E
	ld a, $64 ; A9D34 (2a:5d34) -> 3E 64
	scall PlaySFX ; A9D36 (2a:5d36) -> CD FE 4E
	ld hl, $005a ; A9D39 (2a:5d39) -> 21 5A 00
	scall ScriptSleep ; A9D3C (2a:5d3c) -> CD 8F 46
	scall StopShakingScreen ; A9D3F (2a:5d3f) -> CD B1 4E
	ld l, $0f ; A9D42 (2a:5d42) -> 2E 0F
	push hl ; A9D44 (2a:5d44) -> E5
	ld c, $05 ; A9D45 (2a:5d45) -> 0E 05
	ld e, $15 ; A9D47 (2a:5d47) -> 1E 15
	ld a, $18 ; A9D49 (2a:5d49) -> 3E 18
	scall Func_80dff ; A9D4B (2a:5d4b) -> CD FF 4D
	pop bc ; A9D4E (2a:5d4e) -> C1
.asm_a9d4f:
	ret  ; A9D4F (2a:5d4f) -> C9

Data_a9d50:
	warpdef $02, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9d5b:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9da1:
	db $3a, $02, $14, $01, $31

Data_a9da6:
	person_event $ff, $00, $12, $08, $01, $01, $00, $04, $01, Func_a9de2, NULL

Func_a9db4:: ; a9db4
	ld e, $01 ; A9DB4 (2a:5db4) -> 1E 01
	ld hl, Data_a9d50 ; A9DB6 (2a:5db6) -> 21 50 5D
	scall LoadWarps ; A9DB9 (2a:5db9) -> CD 3A 40
	ld e, $01 ; A9DBC (2a:5dbc) -> 1E 01
	ld hl, Data_a9da1 ; A9DBE (2a:5dbe) -> 21 A1 5D
	scall Func_80ce7 ; A9DC1 (2a:5dc1) -> CD E7 4C
	ld a, $03 ; A9DC4 (2a:5dc4) -> 3E 03
	scall Func_80d01 ; A9DC6 (2a:5dc6) -> CD 01 4D
	ld e, $05 ; A9DC9 (2a:5dc9) -> 1E 05
	ld hl, Data_a9d5b ; A9DCB (2a:5dcb) -> 21 5B 5D
	scall LoadEncounters ; A9DCE (2a:5dce) -> CD 24 4D
	ld e, $01 ; A9DD1 (2a:5dd1) -> 1E 01
	ld hl, Data_a9da6 ; A9DD3 (2a:5dd3) -> 21 A6 5D
	scall LoadMapObjects ; A9DD6 (2a:5dd6) -> CD FB 40
	ld a, $08 ; A9DD9 (2a:5dd9) -> 3E 08
	scall PlayMusic ; A9DDB (2a:5ddb) -> CD E6 4E
	scall Func_8001c ; A9DDE (2a:5dde) -> CD 1C 40
	ret  ; A9DE1 (2a:5de1) -> C9

Func_a9de2:
	ld a, e ; A9DE2 (2a:5de2) -> 7B
	cp $02 ; A9DE3 (2a:5de3) -> FE 02
	jp nz, .asm_a9e11 ; A9DE5 (2a:5de5) -> C2 11 5E
	ld a, $31 ; A9DE8 (2a:5de8) -> 3E 31
	scall PlaySFX ; A9DEA (2a:5dea) -> CD FE 4E
	ld hl, $001e ; A9DED (2a:5ded) -> 21 1E 00
	scall ScriptSleep ; A9DF0 (2a:5df0) -> CD 8F 46
	scall StartShakingScreen ; A9DF3 (2a:5df3) -> CD A2 4E
	ld a, $64 ; A9DF6 (2a:5df6) -> 3E 64
	scall PlaySFX ; A9DF8 (2a:5df8) -> CD FE 4E
	ld hl, $005a ; A9DFB (2a:5dfb) -> 21 5A 00
	scall ScriptSleep ; A9DFE (2a:5dfe) -> CD 8F 46
	scall StopShakingScreen ; A9E01 (2a:5e01) -> CD B1 4E
	ld l, $08 ; A9E04 (2a:5e04) -> 2E 08
	push hl ; A9E06 (2a:5e06) -> E5
	ld c, $05 ; A9E07 (2a:5e07) -> 0E 05
	ld e, $12 ; A9E09 (2a:5e09) -> 1E 12
	ld a, $18 ; A9E0B (2a:5e0b) -> 3E 18
	scall Func_80dff ; A9E0D (2a:5e0d) -> CD FF 4D
	pop bc ; A9E10 (2a:5e10) -> C1
.asm_a9e11:
	ret  ; A9E11 (2a:5e11) -> C9

Data_a9e12:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9e1d:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $10, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $10, $03, $00
ENDC

Data_a9e63:
	person_event $ff, $00, $0c, $15, $01, $01, $00, $04, $01, Func_a9e97, NULL

Func_a9e71:: ; a9e71
	ld e, $01 ; A9E71 (2a:5e71) -> 1E 01
	ld hl, Data_a9e12 ; A9E73 (2a:5e73) -> 21 12 5E
	scall LoadWarps ; A9E76 (2a:5e76) -> CD 3A 40
	ld a, $03 ; A9E79 (2a:5e79) -> 3E 03
	scall Func_80d01 ; A9E7B (2a:5e7b) -> CD 01 4D
	ld e, $05 ; A9E7E (2a:5e7e) -> 1E 05
	ld hl, Data_a9e1d ; A9E80 (2a:5e80) -> 21 1D 5E
	scall LoadEncounters ; A9E83 (2a:5e83) -> CD 24 4D
	ld e, $01 ; A9E86 (2a:5e86) -> 1E 01
	ld hl, Data_a9e63 ; A9E88 (2a:5e88) -> 21 63 5E
	scall LoadMapObjects ; A9E8B (2a:5e8b) -> CD FB 40
	ld a, $08 ; A9E8E (2a:5e8e) -> 3E 08
	scall PlayMusic ; A9E90 (2a:5e90) -> CD E6 4E
	scall Func_8001c ; A9E93 (2a:5e93) -> CD 1C 40
	ret  ; A9E96 (2a:5e96) -> C9

Func_a9e97:
	ld a, e ; A9E97 (2a:5e97) -> 7B
	cp $02 ; A9E98 (2a:5e98) -> FE 02
	jp nz, .asm_a9ec6 ; A9E9A (2a:5e9a) -> C2 C6 5E
	ld a, $31 ; A9E9D (2a:5e9d) -> 3E 31
	scall PlaySFX ; A9E9F (2a:5e9f) -> CD FE 4E
	ld hl, $001e ; A9EA2 (2a:5ea2) -> 21 1E 00
	scall ScriptSleep ; A9EA5 (2a:5ea5) -> CD 8F 46
	scall StartShakingScreen ; A9EA8 (2a:5ea8) -> CD A2 4E
	ld a, $64 ; A9EAB (2a:5eab) -> 3E 64
	scall PlaySFX ; A9EAD (2a:5ead) -> CD FE 4E
	ld hl, $005a ; A9EB0 (2a:5eb0) -> 21 5A 00
	scall ScriptSleep ; A9EB3 (2a:5eb3) -> CD 8F 46
	scall StopShakingScreen ; A9EB6 (2a:5eb6) -> CD B1 4E
	ld l, $08 ; A9EB9 (2a:5eb9) -> 2E 08
	push hl ; A9EBB (2a:5ebb) -> E5
	ld c, $12 ; A9EBC (2a:5ebc) -> 0E 12
	ld e, $13 ; A9EBE (2a:5ebe) -> 1E 13
	ld a, $18 ; A9EC0 (2a:5ec0) -> 3E 18
	scall Func_80dff ; A9EC2 (2a:5ec2) -> CD FF 4D
	pop bc ; A9EC5 (2a:5ec5) -> C1
.asm_a9ec6:
	ret  ; A9EC6 (2a:5ec6) -> C9

Data_a9ec7:
	warpdef $15, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9ed2:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9f18:
	db $3b, $15, $03, $01, $31

Data_a9f1d:
	person_event $ff, $00, $05, $0f, $01, $01, $00, $04, $01, Func_a9f59, NULL

Func_a9f2b:: ; a9f2b
	ld e, $01 ; A9F2B (2a:5f2b) -> 1E 01
	ld hl, Data_a9ec7 ; A9F2D (2a:5f2d) -> 21 C7 5E
	scall LoadWarps ; A9F30 (2a:5f30) -> CD 3A 40
	ld e, $01 ; A9F33 (2a:5f33) -> 1E 01
	ld hl, Data_a9f18 ; A9F35 (2a:5f35) -> 21 18 5F
	scall Func_80ce7 ; A9F38 (2a:5f38) -> CD E7 4C
	ld a, $03 ; A9F3B (2a:5f3b) -> 3E 03
	scall Func_80d01 ; A9F3D (2a:5f3d) -> CD 01 4D
	ld e, $05 ; A9F40 (2a:5f40) -> 1E 05
	ld hl, Data_a9ed2 ; A9F42 (2a:5f42) -> 21 D2 5E
	scall LoadEncounters ; A9F45 (2a:5f45) -> CD 24 4D
	ld e, $01 ; A9F48 (2a:5f48) -> 1E 01
	ld hl, Data_a9f1d ; A9F4A (2a:5f4a) -> 21 1D 5F
	scall LoadMapObjects ; A9F4D (2a:5f4d) -> CD FB 40
	ld a, $08 ; A9F50 (2a:5f50) -> 3E 08
	scall PlayMusic ; A9F52 (2a:5f52) -> CD E6 4E
	scall Func_8001c ; A9F55 (2a:5f55) -> CD 1C 40
	ret  ; A9F58 (2a:5f58) -> C9

Func_a9f59:
	ld a, e ; A9F59 (2a:5f59) -> 7B
	cp $02 ; A9F5A (2a:5f5a) -> FE 02
	jp nz, .asm_a9f88 ; A9F5C (2a:5f5c) -> C2 88 5F
	ld a, $31 ; A9F5F (2a:5f5f) -> 3E 31
	scall PlaySFX ; A9F61 (2a:5f61) -> CD FE 4E
	ld hl, $001e ; A9F64 (2a:5f64) -> 21 1E 00
	scall ScriptSleep ; A9F67 (2a:5f67) -> CD 8F 46
	scall StartShakingScreen ; A9F6A (2a:5f6a) -> CD A2 4E
	ld a, $64 ; A9F6D (2a:5f6d) -> 3E 64
	scall PlaySFX ; A9F6F (2a:5f6f) -> CD FE 4E
	ld hl, $005a ; A9F72 (2a:5f72) -> 21 5A 00
	scall ScriptSleep ; A9F75 (2a:5f75) -> CD 8F 46
	scall StopShakingScreen ; A9F78 (2a:5f78) -> CD B1 4E
	ld l, $15 ; A9F7B (2a:5f7b) -> 2E 15
	push hl ; A9F7D (2a:5f7d) -> E5
	ld c, $0c ; A9F7E (2a:5f7e) -> 0E 0C
	ld e, $14 ; A9F80 (2a:5f80) -> 1E 14
	ld a, $18 ; A9F82 (2a:5f82) -> 3E 18
	scall Func_80dff ; A9F84 (2a:5f84) -> CD FF 4D
	pop bc ; A9F87 (2a:5f87) -> C1
.asm_a9f88:
	ret  ; A9F88 (2a:5f88) -> C9

Data_a9f89:
	warpdef $05, $08, $01, $01, MAP_24_15, $02, $05, $02, $06, $2e
	warpdef $05, $08, $01, $01, MAP_24_16, $0f, $05, $0e, $05, $2e
	warpdef $05, $08, $01, $01, MAP_24_17, $15, $12, $15, $11, $2e
	warpdef $05, $08, $01, $01, MAP_24_19, $02, $12, $02, $11, $2e
	warpdef $05, $08, $01, $01, MAP_24_20, $02, $05, $03, $05, $2e
	warpdef $05, $08, $01, $01, MAP_24_21, $15, $05, $15, $06, $2e

Data_a9fcb:
	db $71, $02, $06, $01, $2d
	db $72, $03, $06, $01, $2b
	db $73, $04, $06, $01, $2d

Data_a9fda:
	db $74, $02, $06, $01, $2c
	db $75, $03, $06, $01, $2d
	db $76, $04, $06, $01, $2e

Data_a9fe9:
	db $77, $02, $06, $01, $2d
	db $78, $03, $06, $01, $2d
	db $79, $04, $06, $01, $2b

Data_a9ff8:
	db $7a, $02, $06, $01, $2e
	db $7b, $03, $06, $01, $2c
	db $7c, $04, $06, $01, $2d

Data_aa007:
	db $7d, $02, $06, $01, $2b
	db $7e, $03, $06, $01, $2d
	db $7f, $04, $06, $01, $2e

Data_aa016:
	db $80, $02, $06, $01, $2d
	db $81, $03, $06, $01, $2d
	db $82, $04, $06, $01, $2c

Data_aa025:
IF DEF(SUN)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_aa06b:
	map MAP_24_15
	db $02, $05

	map MAP_24_16
	db $0f, $05

	map MAP_24_17
	db $15, $12

	map MAP_24_19
	db $02, $12

	map MAP_24_20
	db $02, $05

	map MAP_24_21
	db $15, $05

Func_aa083:: ; aa083
	ld c, $00 ; AA083 (2a:6083) -> 0E 00
.asm_aa085:
	ld a, c ; AA085 (2a:6085) -> 79
	cp $06 ; AA086 (2a:6086) -> FE 06
	jp nc, .asm_aa0ed ; AA088 (2a:6088) -> D2 ED 60
	ld l, c ; AA08B (2a:608b) -> 69
	ld h, $00 ; AA08C (2a:608c) -> 26 00
	add hl, hl ; AA08E (2a:608e) -> 29
	add hl, hl ; AA08F (2a:608f) -> 29
	ld de, Data_aa06b ; AA090 (2a:6090) -> 11 6B 60
	add hl, de ; AA093 (2a:6093) -> 19
	ld a, [wBackupMapGroup] ; AA094 (2a:6094) -> FA DF C7
	cp [hl] ; AA097 (2a:6097) -> BE
	jp nz, .asm_aa0e9 ; AA098 (2a:6098) -> C2 E9 60
	ld l, c ; AA09B (2a:609b) -> 69
	ld h, $00 ; AA09C (2a:609c) -> 26 00
	add hl, hl ; AA09E (2a:609e) -> 29
	add hl, hl ; AA09F (2a:609f) -> 29
	ld de, Data_aa06b ; AA0A0 (2a:60a0) -> 11 6B 60
	add hl, de ; AA0A3 (2a:60a3) -> 19
	inc hl ; AA0A4 (2a:60a4) -> 23
	ld a, [wBackupMapNumber] ; AA0A5 (2a:60a5) -> FA E0 C7
	cp [hl] ; AA0A8 (2a:60a8) -> BE
	jp nz, .asm_aa0e9 ; AA0A9 (2a:60a9) -> C2 E9 60
	ld l, c ; AA0AC (2a:60ac) -> 69
	ld h, $00 ; AA0AD (2a:60ad) -> 26 00
	add hl, hl ; AA0AF (2a:60af) -> 29
	add hl, hl ; AA0B0 (2a:60b0) -> 29
	ld de, Data_aa06b ; AA0B1 (2a:60b1) -> 11 6B 60
	add hl, de ; AA0B4 (2a:60b4) -> 19
	inc hl ; AA0B5 (2a:60b5) -> 23
	inc hl ; AA0B6 (2a:60b6) -> 23
	ld a, [wBackupMapX] ; AA0B7 (2a:60b7) -> FA DB C7
	cp [hl] ; AA0BA (2a:60ba) -> BE
	jp nz, .asm_aa0e9 ; AA0BB (2a:60bb) -> C2 E9 60
	ld l, c ; AA0BE (2a:60be) -> 69
	ld h, $00 ; AA0BF (2a:60bf) -> 26 00
	add hl, hl ; AA0C1 (2a:60c1) -> 29
	add hl, hl ; AA0C2 (2a:60c2) -> 29
	ld de, Data_aa06b ; AA0C3 (2a:60c3) -> 11 6B 60
	add hl, de ; AA0C6 (2a:60c6) -> 19
	inc hl ; AA0C7 (2a:60c7) -> 23
	inc hl ; AA0C8 (2a:60c8) -> 23
	inc hl ; AA0C9 (2a:60c9) -> 23
	ld a, [wBackupMapY] ; AA0CA (2a:60ca) -> FA DC C7
	cp [hl] ; AA0CD (2a:60cd) -> BE
	jp nz, .asm_aa0e9 ; AA0CE (2a:60ce) -> C2 E9 60
	ld l, c ; AA0D1 (2a:60d1) -> 69
	ld h, $00 ; AA0D2 (2a:60d2) -> 26 00
	ld e, l ; AA0D4 (2a:60d4) -> 5D
	ld d, h ; AA0D5 (2a:60d5) -> 54
	add hl, hl ; AA0D6 (2a:60d6) -> 29
	ld c, l ; AA0D7 (2a:60d7) -> 4D
	ld b, h ; AA0D8 (2a:60d8) -> 44
	add hl, hl ; AA0D9 (2a:60d9) -> 29
	add hl, hl ; AA0DA (2a:60da) -> 29
	add hl, de ; AA0DB (2a:60db) -> 19
	add hl, bc ; AA0DC (2a:60dc) -> 09
	ld de, Data_a9f89 ; AA0DD (2a:60dd) -> 11 89 5F
	add hl, de ; AA0E0 (2a:60e0) -> 19
	ld e, $01 ; AA0E1 (2a:60e1) -> 1E 01
	scall LoadWarps ; AA0E3 (2a:60e3) -> CD 3A 40
	jp .asm_aa0ed ; AA0E6 (2a:60e6) -> C3 ED 60
.asm_aa0e9:
	inc c ; AA0E9 (2a:60e9) -> 0C
	jp .asm_aa085 ; AA0EA (2a:60ea) -> C3 85 60
.asm_aa0ed:
	ld a, [wBackupMapGroup] ; AA0ED (2a:60ed) -> FA DF C7
	cp $18 ; AA0F0 (2a:60f0) -> FE 18
	jp nz, .asm_aa108 ; AA0F2 (2a:60f2) -> C2 08 61
	ld a, [wBackupMapNumber] ; AA0F5 (2a:60f5) -> FA E0 C7
	cp $0f ; AA0F8 (2a:60f8) -> FE 0F
	jp nz, .asm_aa108 ; AA0FA (2a:60fa) -> C2 08 61
	ld e, $03 ; AA0FD (2a:60fd) -> 1E 03
	ld hl, Data_a9fcb ; AA0FF (2a:60ff) -> 21 CB 5F
	scall Func_80ce7 ; AA102 (2a:6102) -> CD E7 4C
	jp .asm_aa18c ; AA105 (2a:6105) -> C3 8C 61
.asm_aa108:
	ld a, [wBackupMapGroup] ; AA108 (2a:6108) -> FA DF C7
	cp $18 ; AA10B (2a:610b) -> FE 18
	jp nz, .asm_aa123 ; AA10D (2a:610d) -> C2 23 61
	ld a, [wBackupMapNumber] ; AA110 (2a:6110) -> FA E0 C7
	cp $10 ; AA113 (2a:6113) -> FE 10
	jp nz, .asm_aa123 ; AA115 (2a:6115) -> C2 23 61
	ld e, $03 ; AA118 (2a:6118) -> 1E 03
	ld hl, Data_a9fda ; AA11A (2a:611a) -> 21 DA 5F
	scall Func_80ce7 ; AA11D (2a:611d) -> CD E7 4C
	jp .asm_aa18c ; AA120 (2a:6120) -> C3 8C 61
.asm_aa123:
	ld a, [wBackupMapGroup] ; AA123 (2a:6123) -> FA DF C7
	cp $18 ; AA126 (2a:6126) -> FE 18
	jp nz, .asm_aa13e ; AA128 (2a:6128) -> C2 3E 61
	ld a, [wBackupMapNumber] ; AA12B (2a:612b) -> FA E0 C7
	cp $11 ; AA12E (2a:612e) -> FE 11
	jp nz, .asm_aa13e ; AA130 (2a:6130) -> C2 3E 61
	ld e, $03 ; AA133 (2a:6133) -> 1E 03
	ld hl, Data_a9fe9 ; AA135 (2a:6135) -> 21 E9 5F
	scall Func_80ce7 ; AA138 (2a:6138) -> CD E7 4C
	jp .asm_aa18c ; AA13B (2a:613b) -> C3 8C 61
.asm_aa13e:
	ld a, [wBackupMapGroup] ; AA13E (2a:613e) -> FA DF C7
	cp $18 ; AA141 (2a:6141) -> FE 18
	jp nz, .asm_aa159 ; AA143 (2a:6143) -> C2 59 61
	ld a, [wBackupMapNumber] ; AA146 (2a:6146) -> FA E0 C7
	cp $13 ; AA149 (2a:6149) -> FE 13
	jp nz, .asm_aa159 ; AA14B (2a:614b) -> C2 59 61
	ld e, $03 ; AA14E (2a:614e) -> 1E 03
	ld hl, Data_a9ff8 ; AA150 (2a:6150) -> 21 F8 5F
	scall Func_80ce7 ; AA153 (2a:6153) -> CD E7 4C
	jp .asm_aa18c ; AA156 (2a:6156) -> C3 8C 61
.asm_aa159:
	ld a, [wBackupMapGroup] ; AA159 (2a:6159) -> FA DF C7
	cp $18 ; AA15C (2a:615c) -> FE 18
	jp nz, .asm_aa174 ; AA15E (2a:615e) -> C2 74 61
	ld a, [wBackupMapNumber] ; AA161 (2a:6161) -> FA E0 C7
	cp $14 ; AA164 (2a:6164) -> FE 14
	jp nz, .asm_aa174 ; AA166 (2a:6166) -> C2 74 61
	ld e, $03 ; AA169 (2a:6169) -> 1E 03
	ld hl, Data_aa007 ; AA16B (2a:616b) -> 21 07 60
	scall Func_80ce7 ; AA16E (2a:616e) -> CD E7 4C
	jp .asm_aa18c ; AA171 (2a:6171) -> C3 8C 61
.asm_aa174:
	ld a, [wBackupMapGroup] ; AA174 (2a:6174) -> FA DF C7
	cp $18 ; AA177 (2a:6177) -> FE 18
	jp nz, .asm_aa18c ; AA179 (2a:6179) -> C2 8C 61
	ld a, [wBackupMapNumber] ; AA17C (2a:617c) -> FA E0 C7
	cp $15 ; AA17F (2a:617f) -> FE 15
	jp nz, .asm_aa18c ; AA181 (2a:6181) -> C2 8C 61
	ld e, $03 ; AA184 (2a:6184) -> 1E 03
	ld hl, Data_aa016 ; AA186 (2a:6186) -> 21 16 60
	scall Func_80ce7 ; AA189 (2a:6189) -> CD E7 4C
.asm_aa18c:
	ld a, $03 ; AA18C (2a:618c) -> 3E 03
	scall Func_80d01 ; AA18E (2a:618e) -> CD 01 4D
	ld e, $05 ; AA191 (2a:6191) -> 1E 05
	ld hl, Data_aa025 ; AA193 (2a:6193) -> 21 25 60
	scall LoadEncounters ; AA196 (2a:6196) -> CD 24 4D
	ld a, $08 ; AA199 (2a:6199) -> 3E 08
	scall PlayMusic ; AA19B (2a:619b) -> CD E6 4E
	scall Func_8001c ; AA19E (2a:619e) -> CD 1C 40
	ret  ; AA1A1 (2a:61a1) -> C9

Data_aa1a2:
	warpdef $08, $05, $02, $01, MAP_25_20, $0f, $1c, $0f, $1b, $2e
	warpdef $08, $15, $02, $01, MAP_25_01, $0c, $05, $0c, $06, $2e
	warpdef $05, $12, $01, $01, MAP_25_04, $09, $04, $09, $05, $2e
	warpdef $0c, $12, $01, $01, MAP_25_05, $01, $04, $01, $05, $2e

Data_aa1ce:
	dw $2b3
	dw -1

Data_aa1d2:
	person_event $09, $0c, $07, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $0a, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $07, $09, $04, $01, $00, $04, $01, Func_aa277, NULL

Data_aa1fc:
	person_event $ff, $00, $07, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce
	person_event $ff, $00, $0a, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce

Func_aa218:: ; aa218
	ld a, $09 ; AA218 (2a:6218) -> 3E 09
	ld [wc789], a ; AA21A (2a:621a) -> EA 89 C7
	ld a, $0d ; AA21D (2a:621d) -> 3E 0D
	ld [wc7e2], a ; AA21F (2a:621f) -> EA E2 C7
	ld e, $04 ; AA222 (2a:6222) -> 1E 04
	ld hl, Data_aa1a2 ; AA224 (2a:6224) -> 21 A2 61
	scall LoadWarps ; AA227 (2a:6227) -> CD 3A 40
	ld hl, $00b7 ; AA22A (2a:622a) -> 21 B7 00
	scall CheckEventFlag ; AA22D (2a:622d) -> CD 2E 46
	or a ; AA230 (2a:6230) -> B7
	jp nz, .asm_aa23c ; AA231 (2a:6231) -> C2 3C 62
	ld e, $03 ; AA234 (2a:6234) -> 1E 03
	ld hl, Data_aa1d2 ; AA236 (2a:6236) -> 21 D2 61
	scall LoadMapObjects ; AA239 (2a:6239) -> CD FB 40
.asm_aa23c:
	ld e, $02 ; AA23C (2a:623c) -> 1E 02
	ld hl, Data_aa1fc ; AA23E (2a:623e) -> 21 FC 61
	scall LoadMapObjects ; AA241 (2a:6241) -> CD FB 40
	ld hl, $0022 ; AA244 (2a:6244) -> 21 22 00
	scall CheckEventFlag ; AA247 (2a:6247) -> CD 2E 46
	cp $01 ; AA24A (2a:624a) -> FE 01
	jp nz, .asm_aa261 ; AA24C (2a:624c) -> C2 61 62
	ld hl, $0043 ; AA24F (2a:624f) -> 21 43 00
	scall CheckEventFlag ; AA252 (2a:6252) -> CD 2E 46
	or a ; AA255 (2a:6255) -> B7
	jp nz, .asm_aa261 ; AA256 (2a:6256) -> C2 61 62
	ld a, $04 ; AA259 (2a:6259) -> 3E 04
	scall PlayMusic ; AA25B (2a:625b) -> CD E6 4E
	jp .asm_aa266 ; AA25E (2a:625e) -> C3 66 62
.asm_aa261:
	ld a, $12 ; AA261 (2a:6261) -> 3E 12
	scall PlayMusic ; AA263 (2a:6263) -> CD E6 4E
.asm_aa266:
	ld a, $01 ; AA266 (2a:6266) -> 3E 01
	scall LoadPlayerSprite ; AA268 (2a:6268) -> CD C6 4C
	scall Func_8001c ; AA26B (2a:626b) -> CD 1C 40
	ret  ; AA26E (2a:626e) -> C9

Data_aa26f:
	db $08, $07, $ff, $ff

Data_aa273:
	db $09, $07, $ff, $ff

Func_aa277:
	push de ; AA277 (2a:6277) -> D5
	ld hl, $00b7 ; AA278 (2a:6278) -> 21 B7 00
	scall CheckEventFlag ; AA27B (2a:627b) -> CD 2E 46
	or a ; AA27E (2a:627e) -> B7
	jp nz, .asm_aa2f2 ; AA27F (2a:627f) -> C2 F2 62
	ld hl, sp+$00 ; AA282 (2a:6282) -> F8 00
	ld a, [hl] ; AA284 (2a:6284) -> 7E
	cp $02 ; AA285 (2a:6285) -> FE 02
	jp nz, .asm_aa2f2 ; AA287 (2a:6287) -> C2 F2 62
	xor a ; AA28A (2a:628a) -> AF
	scall PlayMusic ; AA28B (2a:628b) -> CD E6 4E
	ld a, $1a ; AA28E (2a:628e) -> 3E 1A
	scall PlayMusic ; AA290 (2a:6290) -> CD E6 4E
	ld c, $01 ; AA293 (2a:6293) -> 0E 01
	ld de, Data_aa26f ; AA295 (2a:6295) -> 11 6F 62
	ld a, $2a ; AA298 (2a:6298) -> 3E 2A
	scall MovePlayer ; AA29A (2a:629a) -> CD 3E 46
	ld e, $01 ; AA29D (2a:629d) -> 1E 01
	xor a ; AA29F (2a:629f) -> AF
	scall SpriteFace ; AA2A0 (2a:62a0) -> CD 95 40
	ld a, $03 ; AA2A3 (2a:62a3) -> 3E 03
	scall PlayerFace ; AA2A5 (2a:62a5) -> CD 77 46
	ld e, $00 ; AA2A8 (2a:62a8) -> 1E 00
	ld hl, $00f7 ; AA2AA (2a:62aa) -> 21 F7 00
	scall EventFlagAction ; AA2AD (2a:62ad) -> CD 1B 46
	call Func_aa321 ; AA2B0 (2a:62b0) -> CD 21 63
	ld hl, $00f7 ; AA2B3 (2a:62b3) -> 21 F7 00
	scall CheckEventFlag ; AA2B6 (2a:62b6) -> CD 2E 46
	or a ; AA2B9 (2a:62b9) -> B7
	jp z, .asm_aa2c0 ; AA2BA (2a:62ba) -> CA C0 62
	jp .asm_aa2f2 ; AA2BD (2a:62bd) -> C3 F2 62
.asm_aa2c0:
	ld bc, Data_aa273 ; AA2C0 (2a:62c0) -> 01 73 62
	ld e, $2a ; AA2C3 (2a:62c3) -> 1E 2A
	ld a, $01 ; AA2C5 (2a:62c5) -> 3E 01
	scall MovePersonAndWait ; AA2C7 (2a:62c7) -> CD 88 46
	scall WaitNPCStep ; AA2CA (2a:62ca) -> CD 0C 42
	ld a, $01 ; AA2CD (2a:62cd) -> 3E 01
	scall PlayerFace ; AA2CF (2a:62cf) -> CD 77 46
	ld e, $00 ; AA2D2 (2a:62d2) -> 1E 00
	ld hl, $00f7 ; AA2D4 (2a:62d4) -> 21 F7 00
	scall EventFlagAction ; AA2D7 (2a:62d7) -> CD 1B 46
	call Func_aa392 ; AA2DA (2a:62da) -> CD 92 63
	ld hl, $00f7 ; AA2DD (2a:62dd) -> 21 F7 00
	scall CheckEventFlag ; AA2E0 (2a:62e0) -> CD 2E 46
	or a ; AA2E3 (2a:62e3) -> B7
	jp z, .asm_aa2ea ; AA2E4 (2a:62e4) -> CA EA 62
	jp .asm_aa2f2 ; AA2E7 (2a:62e7) -> C3 F2 62
.asm_aa2ea:
	ld e, $01 ; AA2EA (2a:62ea) -> 1E 01
	ld hl, $00b7 ; AA2EC (2a:62ec) -> 21 B7 00
	scall EventFlagAction ; AA2EF (2a:62ef) -> CD 1B 46
.asm_aa2f2:
	pop bc ; AA2F2 (2a:62f2) -> C1
	ret  ; AA2F3 (2a:62f3) -> C9

Data_aa2f4:
	db $07, $0f, $ff, $ff

Data_aa2f8:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $02, $06, $2a, $0f, $17
	db $00, $6f, $2d, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $57, $06, $2a, $0f, $17
	db $00, $6f, $5a, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_aa321:
	ld hl, $010b ; AA321 (2a:6321) -> 21 0B 01
	scall PrintTextStandard ; AA324 (2a:6324) -> CD 98 44
	ld de, Data_aa35f ; AA327 (2a:6327) -> 11 5F 63
	ld hl, Data_aa2f8 ; AA32A (2a:632a) -> 21 F8 62
	scall ScriptedBattle ; AA32D (2a:632d) -> CD D3 4D
	or a ; AA330 (2a:6330) -> B7
	jp nz, Func_aa33d ; AA331 (2a:6331) -> C2 3D 63
	ld e, $01 ; AA334 (2a:6334) -> 1E 01
	ld hl, $00f7 ; AA336 (2a:6336) -> 21 F7 00
	scall EventFlagAction ; AA339 (2a:6339) -> CD 1B 46
	ret  ; AA33C (2a:633c) -> C9

Func_aa33d:
	xor a ; AA33D (2a:633d) -> AF
	scall PlayMusic ; AA33E (2a:633e) -> CD E6 4E
	ld a, $04 ; AA341 (2a:6341) -> 3E 04
	scall PlayMusic ; AA343 (2a:6343) -> CD E6 4E
	ld hl, $010f ; AA346 (2a:6346) -> 21 0F 01
	scall PrintTextStandard ; AA349 (2a:6349) -> CD 98 44
	ld bc, Data_aa2f4 ; AA34C (2a:634c) -> 01 F4 62
	ld e, $2a ; AA34F (2a:634f) -> 1E 2A
	xor a ; AA351 (2a:6351) -> AF
	scall MovePersonAndWait ; AA352 (2a:6352) -> CD 88 46
	scall WaitNPCStep ; AA355 (2a:6355) -> CD 0C 42
	ld e, $00 ; AA358 (2a:6358) -> 1E 00
	xor a ; AA35A (2a:635a) -> AF
	scall SetPersonVisibilityState ; AA35B (2a:635b) -> CD 3D 41
	ret  ; AA35E (2a:635e) -> C9

Data_aa35f:
	dstr "(へいし)"

Data_aa365:
	db $09, $0f, $ff, $ff

Data_aa369:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $7d, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $14, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_aa392:
	ld hl, $010d ; AA392 (2a:6392) -> 21 0D 01
	scall PrintTextStandard ; AA395 (2a:6395) -> CD 98 44
	ld de, Data_aa3d2 ; AA398 (2a:6398) -> 11 D2 63
	ld hl, Data_aa369 ; AA39B (2a:639b) -> 21 69 63
	scall ScriptedBattle ; AA39E (2a:639e) -> CD D3 4D
	or a ; AA3A1 (2a:63a1) -> B7
	jp nz, .asm_aa3ae ; AA3A2 (2a:63a2) -> C2 AE 63
	ld e, $01 ; AA3A5 (2a:63a5) -> 1E 01
	ld hl, $00f7 ; AA3A7 (2a:63a7) -> 21 F7 00
	scall EventFlagAction ; AA3AA (2a:63aa) -> CD 1B 46
	ret  ; AA3AD (2a:63ad) -> C9
.asm_aa3ae:
	xor a ; AA3AE (2a:63ae) -> AF
	scall PlayMusic ; AA3AF (2a:63af) -> CD E6 4E
	ld a, $04 ; AA3B2 (2a:63b2) -> 3E 04
	scall PlayMusic ; AA3B4 (2a:63b4) -> CD E6 4E
	ld hl, $010f ; AA3B7 (2a:63b7) -> 21 0F 01
	scall PrintTextStandard ; AA3BA (2a:63ba) -> CD 98 44
	ld bc, Data_aa365 ; AA3BD (2a:63bd) -> 01 65 63
	ld e, $2a ; AA3C0 (2a:63c0) -> 1E 2A
	ld a, $01 ; AA3C2 (2a:63c2) -> 3E 01
	scall MovePersonAndWait ; AA3C4 (2a:63c4) -> CD 88 46
	scall WaitNPCStep ; AA3C7 (2a:63c7) -> CD 0C 42
	ld e, $00 ; AA3CA (2a:63ca) -> 1E 00
	ld a, $01 ; AA3CC (2a:63cc) -> 3E 01
	scall SetPersonVisibilityState ; AA3CE (2a:63ce) -> CD 3D 41
	ret  ; AA3D1 (2a:63d1) -> C9

Data_aa3d2:
	dstr "(へいし)"

Data_aa3d8:
	warpdef $0c, $1c, $02, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $0c, $04, $02, $01, MAP_25_00, $08, $14, $08, $13, $2e
	warpdef $19, $04, $01, $01, MAP_28_00, $06, $1a, $06, $19, $2e
	warpdef $05, $0e, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $08, $0e, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $1d, $16, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $20, $16, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $05, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $08, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $11, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $14, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $17, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $1e, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $21, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, $34

Data_aa472:
	warpdef $07, $08, $01, $01, MAP_32_03, $01, $08, $01, $07, $34

Data_aa47d:
	dw $1bb
	dw -1

Data_aa481:
	dw $1be
	dw -1

Data_aa485:
	dw $1bc
	dw -1

Data_aa489:
	dw $1bd
	dw -1

Data_aa48d:
	dw $2af
	dw -1

Data_aa491:
	dw $2b1
	dw -1

Data_aa495:
	dw $2b0
	dw -1

Data_aa499:
	dw $323, $324, $325
	dw -1

Data_aa4a1:
	dw $326
	dw -1

Data_aa4a5:
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $0e, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $18, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $1a, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $0b, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $0e, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $07, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $14, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $12, $07, $03, $03, $00, $04, $00, Func_aa6ee, NULL

Data_aa523:
	person_event $09, $04, $0b, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa481
	person_event $ff, $00, $0c, $06, $01, $01, $00, $04, $01, Func_aa7b6, NULL
	person_event $ff, $00, $0d, $06, $01, $01, $00, $04, $01, Func_aa7f5, NULL
	person_event $09, $04, $0e, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa485
	person_event $09, $04, $18, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa489
	person_event $ff, $00, $19, $06, $01, $01, $00, $04, $01, Func_aa834, NULL

Data_aa577:
	person_event $03, $04, $0d, $18, $01, $01, $02, $04, $00, Func_aa86f, NULL
	person_event $00, $04, $0c, $11, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_aa47d

Data_aa593:
	person_event $10, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5a1:
	person_event $0b, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5af:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa4a1

Data_aa5bd:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $01, Func_aab87, NULL

Func_aa5cb:: ; aa5cb
	ld a, $09 ; AA5CB (2a:65cb) -> 3E 09
	ld [wc789], a ; AA5CD (2a:65cd) -> EA 89 C7
	ld a, $0d ; AA5D0 (2a:65d0) -> 3E 0D
	ld [wc7e2], a ; AA5D2 (2a:65d2) -> EA E2 C7
	call Func_aaaad ; AA5D5 (2a:65d5) -> CD AD 6A
	ld hl, Func_aaaad ; AA5D8 (2a:65d8) -> 21 AD 6A
	scall Func_80f11 ; AA5DB (2a:65db) -> CD 11 4F
	ld e, $0e ; AA5DE (2a:65de) -> 1E 0E
	ld hl, Data_aa3d8 ; AA5E0 (2a:65e0) -> 21 D8 63
	scall LoadWarps ; AA5E3 (2a:65e3) -> CD 3A 40
	ld e, $09 ; AA5E6 (2a:65e6) -> 1E 09
	ld hl, Data_aa4a5 ; AA5E8 (2a:65e8) -> 21 A5 64
	scall LoadMapObjects ; AA5EB (2a:65eb) -> CD FB 40
	ld e, $02 ; AA5EE (2a:65ee) -> 1E 02
	ld hl, Data_aa577 ; AA5F0 (2a:65f0) -> 21 77 65
	scall LoadMapObjects ; AA5F3 (2a:65f3) -> CD FB 40
	ld a, $01 ; AA5F6 (2a:65f6) -> 3E 01
	scall LoadPlayerSprite ; AA5F8 (2a:65f8) -> CD C6 4C
	ld a, $12 ; AA5FB (2a:65fb) -> 3E 12
	scall PlayMusic ; AA5FD (2a:65fd) -> CD E6 4E
	ld a, [wc790] ; AA600 (2a:6600) -> FA 90 C7
	or a ; AA603 (2a:6603) -> B7
	jp z, .asm_aa622 ; AA604 (2a:6604) -> CA 22 66
	ld a, [wc790] ; AA607 (2a:6607) -> FA 90 C7
	cp $07 ; AA60A (2a:660a) -> FE 07
	jp nc, .asm_aa622 ; AA60C (2a:660c) -> D2 22 66
	ld e, $01 ; AA60F (2a:660f) -> 1E 01
	ld hl, Data_aa472 ; AA611 (2a:6611) -> 21 72 64
	scall LoadWarps ; AA614 (2a:6614) -> CD 3A 40
	ld e, $01 ; AA617 (2a:6617) -> 1E 01
	ld hl, Data_aa5bd ; AA619 (2a:6619) -> 21 BD 65
	scall LoadMapObjects ; AA61C (2a:661c) -> CD FB 40
	jp .asm_aa62a ; AA61F (2a:661f) -> C3 2A 66
.asm_aa622:
	ld e, $01 ; AA622 (2a:6622) -> 1E 01
	ld hl, Data_aa5af ; AA624 (2a:6624) -> 21 AF 65
	scall LoadMapObjects ; AA627 (2a:6627) -> CD FB 40
.asm_aa62a:
	ld hl, $0034 ; AA62A (2a:662a) -> 21 34 00
	scall CheckEventFlag ; AA62D (2a:662d) -> CD 2E 46
	cp $01 ; AA630 (2a:6630) -> FE 01
	jp nz, .asm_aa666 ; AA632 (2a:6632) -> C2 66 66
	ld hl, $00c3 ; AA635 (2a:6635) -> 21 C3 00
	scall CheckEventFlag ; AA638 (2a:6638) -> CD 2E 46
	or a ; AA63B (2a:663b) -> B7
	jp nz, .asm_aa666 ; AA63C (2a:663c) -> C2 66 66
	ld a, [wBackupMapGroup] ; AA63F (2a:663f) -> FA DF C7
	cp $1a ; AA642 (2a:6642) -> FE 1A
	jp nz, .asm_aa666 ; AA644 (2a:6644) -> C2 66 66
	ld hl, $0035 ; AA647 (2a:6647) -> 21 35 00
	scall CheckEventFlag ; AA64A (2a:664a) -> CD 2E 46
	or a ; AA64D (2a:664d) -> B7
	jp nz, .asm_aa666 ; AA64E (2a:664e) -> C2 66 66
	ld e, $01 ; AA651 (2a:6651) -> 1E 01
	ld hl, Data_aa5a1 ; AA653 (2a:6653) -> 21 A1 65
	scall LoadMapObjects ; AA656 (2a:6656) -> CD FB 40
	xor a ; AA659 (2a:6659) -> AF
	scall Func_80653 ; AA65A (2a:665a) -> CD 53 46
	scall Func_8001c ; AA65D (2a:665d) -> CD 1C 40
	call Func_aab3f ; AA660 (2a:6660) -> CD 3F 6B
	jp .asm_aa6dd ; AA663 (2a:6663) -> C3 DD 66
.asm_aa666:
	ld hl, $0022 ; AA666 (2a:6666) -> 21 22 00
	scall CheckEventFlag ; AA669 (2a:6669) -> CD 2E 46
	cp $01 ; AA66C (2a:666c) -> FE 01
	jp nz, .asm_aa69e ; AA66E (2a:666e) -> C2 9E 66
	ld hl, $0043 ; AA671 (2a:6671) -> 21 43 00
	scall CheckEventFlag ; AA674 (2a:6674) -> CD 2E 46
	or a ; AA677 (2a:6677) -> B7
	jp nz, .asm_aa69e ; AA678 (2a:6678) -> C2 9E 66
	ld hl, $00c2 ; AA67B (2a:667b) -> 21 C2 00
	scall CheckEventFlag ; AA67E (2a:667e) -> CD 2E 46
	or a ; AA681 (2a:6681) -> B7
	jp nz, .asm_aa69e ; AA682 (2a:6682) -> C2 9E 66
	ld a, [wBackupMapGroup] ; AA685 (2a:6685) -> FA DF C7
	cp $ff ; AA688 (2a:6688) -> FE FF
	jp z, .asm_aa69b ; AA68A (2a:668a) -> CA 9B 66
	ld e, $01 ; AA68D (2a:668d) -> 1E 01
	ld hl, Data_aa593 ; AA68F (2a:668f) -> 21 93 65
	scall LoadMapObjects ; AA692 (2a:6692) -> CD FB 40
	scall Func_8001c ; AA695 (2a:6695) -> CD 1C 40
	call Func_aaad6 ; AA698 (2a:6698) -> CD D6 6A
.asm_aa69b:
	jp .asm_aa6dd ; AA69B (2a:669b) -> C3 DD 66
.asm_aa69e:
	ld hl, $0022 ; AA69E (2a:669e) -> 21 22 00
	scall CheckEventFlag ; AA6A1 (2a:66a1) -> CD 2E 46
	or a ; AA6A4 (2a:66a4) -> B7
	jp nz, .asm_aa6da ; AA6A5 (2a:66a5) -> C2 DA 66
	ld e, $06 ; AA6A8 (2a:66a8) -> 1E 06
	ld hl, Data_aa523 ; AA6AA (2a:66aa) -> 21 23 65
	scall LoadMapObjects ; AA6AD (2a:66ad) -> CD FB 40
	ld hl, $0014 ; AA6B0 (2a:66b0) -> 21 14 00
	scall CheckEventFlag ; AA6B3 (2a:66b3) -> CD 2E 46
	cp $01 ; AA6B6 (2a:66b6) -> FE 01
	jp nz, .asm_aa6d4 ; AA6B8 (2a:66b8) -> C2 D4 66
	ld hl, $0007 ; AA6BB (2a:66bb) -> 21 07 00
	scall CheckEventFlag ; AA6BE (2a:66be) -> CD 2E 46
	cp $01 ; AA6C1 (2a:66c1) -> FE 01
	jp nz, .asm_aa6d4 ; AA6C3 (2a:66c3) -> C2 D4 66
	ld e, $00 ; AA6C6 (2a:66c6) -> 1E 00
	ld a, $10 ; AA6C8 (2a:66c8) -> 3E 10
	scall SetPersonVisibilityState ; AA6CA (2a:66ca) -> CD 3D 41
	ld e, $00 ; AA6CD (2a:66cd) -> 1E 00
	ld a, $11 ; AA6CF (2a:66cf) -> 3E 11
	scall SetPersonVisibilityState ; AA6D1 (2a:66d1) -> CD 3D 41
.asm_aa6d4:
	scall Func_8001c ; AA6D4 (2a:66d4) -> CD 1C 40
	jp .asm_aa6dd ; AA6D7 (2a:66d7) -> C3 DD 66
.asm_aa6da:
	scall Func_8001c ; AA6DA (2a:66da) -> CD 1C 40
.asm_aa6dd:
	ret  ; AA6DD (2a:66dd) -> C9

Data_aa6de:
	db $13, $0a, $ff, $ff

Data_aa6e2:
	db $11, $0a, $13, $0a, $ff, $ff

Data_aa6e8:
	db $15, $0a, $13, $0a, $ff, $ff

Func_aa6ee:
	ld a, e ; AA6EE (2a:66ee) -> 7B
	or a ; AA6EF (2a:66ef) -> B7
	jp nz, .asm_aa7b1 ; AA6F0 (2a:66f0) -> C2 B1 67
	ld a, $0f ; AA6F3 (2a:66f3) -> 3E 0F
	scall Func_80e6d ; AA6F5 (2a:66f5) -> CD 6D 4E
	cp $ff ; AA6F8 (2a:66f8) -> FE FF
	jp nz, .asm_aa71b ; AA6FA (2a:66fa) -> C2 1B 67
	ld a, $41 ; AA6FD (2a:66fd) -> 3E 41
	scall Func_80e6d ; AA6FF (2a:66ff) -> CD 6D 4E
	cp $ff ; AA702 (2a:6702) -> FE FF
	jp nz, .asm_aa71b ; AA704 (2a:6704) -> C2 1B 67
	ld a, $50 ; AA707 (2a:6707) -> 3E 50
	scall Func_80e6d ; AA709 (2a:6709) -> CD 6D 4E
	cp $ff ; AA70C (2a:670c) -> FE FF
	jp nz, .asm_aa71b ; AA70E (2a:670e) -> C2 1B 67
	ld a, $64 ; AA711 (2a:6711) -> 3E 64
	scall Func_80e6d ; AA713 (2a:6713) -> CD 6D 4E
	cp $ff ; AA716 (2a:6716) -> FE FF
	jp z, .asm_aa7ab ; AA718 (2a:6718) -> CA AB 67
.asm_aa71b:
	ld a, [wc790] ; AA71B (2a:671b) -> FA 90 C7
	or a ; AA71E (2a:671e) -> B7
	jp z, .asm_aa7a2 ; AA71F (2a:671f) -> CA A2 67
	ld a, [wc790] ; AA722 (2a:6722) -> FA 90 C7
	cp $06 ; AA725 (2a:6725) -> FE 06
	jp nc, .asm_aa7a2 ; AA727 (2a:6727) -> D2 A2 67
	ld hl, $032d ; AA72A (2a:672a) -> 21 2D 03
	scall PrintTextWithYesNoBox ; AA72D (2a:672d) -> CD BA 44
	or a ; AA730 (2a:6730) -> B7
	jp nz, .asm_aa79f ; AA731 (2a:6731) -> C2 9F 67
	ld a, [wPlayerFacing] ; AA734 (2a:6734) -> FA 38 C8
	cp $01 ; AA737 (2a:6737) -> FE 01
	jp z, .asm_aa74d ; AA739 (2a:6739) -> CA 4D 67
	or a ; AA73C (2a:673c) -> B7
	jp nz, .asm_aa75a ; AA73D (2a:673d) -> C2 5A 67
	ld c, $01 ; AA740 (2a:6740) -> 0E 01
	ld de, Data_aa6de ; AA742 (2a:6742) -> 11 DE 66
	ld a, $2a ; AA745 (2a:6745) -> 3E 2A
	scall MovePlayer ; AA747 (2a:6747) -> CD 3E 46
	jp .asm_aa764 ; AA74A (2a:674a) -> C3 64 67
.asm_aa74d:
	ld c, $01 ; AA74D (2a:674d) -> 0E 01
	ld de, Data_aa6e2 ; AA74F (2a:674f) -> 11 E2 66
	ld a, $2a ; AA752 (2a:6752) -> 3E 2A
	scall MovePlayer ; AA754 (2a:6754) -> CD 3E 46
	jp .asm_aa764 ; AA757 (2a:6757) -> C3 64 67
.asm_aa75a:
	ld c, $01 ; AA75A (2a:675a) -> 0E 01
	ld de, Data_aa6e8 ; AA75C (2a:675c) -> 11 E8 66
	ld a, $2a ; AA75F (2a:675f) -> 3E 2A
	scall MovePlayer ; AA761 (2a:6761) -> CD 3E 46
.asm_aa764:
	scall WaitNPCStep ; AA764 (2a:6764) -> CD 0C 42
	xor a ; AA767 (2a:6767) -> AF
	scall PlayMusic ; AA768 (2a:6768) -> CD E6 4E
	ld a, $0a ; AA76B (2a:676b) -> 3E 0A
	scall PlayMusic ; AA76D (2a:676d) -> CD E6 4E
	xor a ; AA770 (2a:6770) -> AF
	scall Func_80653 ; AA771 (2a:6771) -> CD 53 46
	ld c, $01 ; AA774 (2a:6774) -> 0E 01
	ld e, $01 ; AA776 (2a:6776) -> 1E 01
	ld a, $0b ; AA778 (2a:6778) -> 3E 0B
	scall LoadEmote ; AA77A (2a:677a) -> CD 76 41
	ld a, $44 ; AA77D (2a:677d) -> 3E 44
	scall PlaySFX ; AA77F (2a:677f) -> CD FE 4E
	scall WaitEmote ; AA782 (2a:6782) -> CD D5 41
	scall HideEmote ; AA785 (2a:6785) -> CD 8B 41
	ld a, $04 ; AA788 (2a:6788) -> 3E 04
	scall LoadPlayerSprite ; AA78A (2a:678a) -> CD C6 4C
	ld a, $02 ; AA78D (2a:678d) -> 3E 02
	scall PlayerFace ; AA78F (2a:678f) -> CD 77 46
	ld l, $12 ; AA792 (2a:6792) -> 2E 12
	push hl ; AA794 (2a:6794) -> E5
	ld c, $0a ; AA795 (2a:6795) -> 0E 0A
	ld e, $01 ; AA797 (2a:6797) -> 1E 01
	ld a, $1e ; AA799 (2a:6799) -> 3E 1E
	scall Func_80dff ; AA79B (2a:679b) -> CD FF 4D
	pop bc ; AA79E (2a:679e) -> C1
.asm_aa79f:
	jp .asm_aa7a8 ; AA79F (2a:679f) -> C3 A8 67
.asm_aa7a2:
	ld hl, $0377 ; AA7A2 (2a:67a2) -> 21 77 03
	scall PrintTextStandard ; AA7A5 (2a:67a5) -> CD 98 44
.asm_aa7a8:
	jp .asm_aa7b1 ; AA7A8 (2a:67a8) -> C3 B1 67
.asm_aa7ab:
	ld hl, $0376 ; AA7AB (2a:67ab) -> 21 76 03
	scall PrintTextStandard ; AA7AE (2a:67ae) -> CD 98 44
.asm_aa7b1:
	ret  ; AA7B1 (2a:67b1) -> C9

Data_aa7b2:
	db $0c, $07, $ff, $ff

Func_aa7b6:
	push af ; AA7B6 (2a:67b6) -> F5
	ld a, e ; AA7B7 (2a:67b7) -> 7B
	cp $02 ; AA7B8 (2a:67b8) -> FE 02
	jp nz, .asm_aa7ef ; AA7BA (2a:67ba) -> C2 EF 67
	ld e, $01 ; AA7BD (2a:67bd) -> 1E 01
	ld hl, sp+$01 ; AA7BF (2a:67bf) -> F8 01
	ld a, [hl] ; AA7C1 (2a:67c1) -> 7E
	dec a ; AA7C2 (2a:67c2) -> 3D
	scall SpriteFace ; AA7C3 (2a:67c3) -> CD 95 40
	ld hl, $001e ; AA7C6 (2a:67c6) -> 21 1E 00
	scall ScriptSleep ; AA7C9 (2a:67c9) -> CD 8F 46
	ld a, $03 ; AA7CC (2a:67cc) -> 3E 03
	scall PlayerFace ; AA7CE (2a:67ce) -> CD 77 46
	ld a, $69 ; AA7D1 (2a:67d1) -> 3E 69
	scall PlaySFX ; AA7D3 (2a:67d3) -> CD FE 4E
	ld hl, $01bc ; AA7D6 (2a:67d6) -> 21 BC 01
	scall PrintTextStandard ; AA7D9 (2a:67d9) -> CD 98 44
	ld c, $01 ; AA7DC (2a:67dc) -> 0E 01
	ld de, Data_aa7b2 ; AA7DE (2a:67de) -> 11 B2 67
	ld a, $2a ; AA7E1 (2a:67e1) -> 3E 2A
	scall MovePlayer ; AA7E3 (2a:67e3) -> CD 3E 46
	ld e, $02 ; AA7E6 (2a:67e6) -> 1E 02
	ld hl, sp+$01 ; AA7E8 (2a:67e8) -> F8 01
	ld a, [hl] ; AA7EA (2a:67ea) -> 7E
	dec a ; AA7EB (2a:67eb) -> 3D
	scall SpriteFace ; AA7EC (2a:67ec) -> CD 95 40
.asm_aa7ef:
	pop bc ; AA7EF (2a:67ef) -> C1
	ret  ; AA7F0 (2a:67f0) -> C9

Data_aa7f1:
	db $0d, $07, $ff, $ff

Func_aa7f5:
	push af ; AA7F5 (2a:67f5) -> F5
	ld a, e ; AA7F6 (2a:67f6) -> 7B
	cp $02 ; AA7F7 (2a:67f7) -> FE 02
	jp nz, .asm_aa82e ; AA7F9 (2a:67f9) -> C2 2E 68
	ld e, $03 ; AA7FC (2a:67fc) -> 1E 03
	ld hl, sp+$01 ; AA7FE (2a:67fe) -> F8 01
	ld a, [hl] ; AA800 (2a:6800) -> 7E
	inc a ; AA801 (2a:6801) -> 3C
	scall SpriteFace ; AA802 (2a:6802) -> CD 95 40
	ld hl, $001e ; AA805 (2a:6805) -> 21 1E 00
	scall ScriptSleep ; AA808 (2a:6808) -> CD 8F 46
	ld a, $01 ; AA80B (2a:680b) -> 3E 01
	scall PlayerFace ; AA80D (2a:680d) -> CD 77 46
	ld a, $69 ; AA810 (2a:6810) -> 3E 69
	scall PlaySFX ; AA812 (2a:6812) -> CD FE 4E
	ld hl, $01bc ; AA815 (2a:6815) -> 21 BC 01
	scall PrintTextStandard ; AA818 (2a:6818) -> CD 98 44
	ld c, $01 ; AA81B (2a:681b) -> 0E 01
	ld de, Data_aa7f1 ; AA81D (2a:681d) -> 11 F1 67
	ld a, $2a ; AA820 (2a:6820) -> 3E 2A
	scall MovePlayer ; AA822 (2a:6822) -> CD 3E 46
	ld e, $02 ; AA825 (2a:6825) -> 1E 02
	ld hl, sp+$01 ; AA827 (2a:6827) -> F8 01
	ld a, [hl] ; AA829 (2a:6829) -> 7E
	inc a ; AA82A (2a:682a) -> 3C
	scall SpriteFace ; AA82B (2a:682b) -> CD 95 40
.asm_aa82e:
	pop bc ; AA82E (2a:682e) -> C1
	ret  ; AA82F (2a:682f) -> C9

Data_aa830:
	db $19, $07, $ff, $ff

Func_aa834:
	push af ; AA834 (2a:6834) -> F5
	ld a, e ; AA835 (2a:6835) -> 7B
	cp $02 ; AA836 (2a:6836) -> FE 02
	jp nz, .asm_aa86d ; AA838 (2a:6838) -> C2 6D 68
	ld e, $01 ; AA83B (2a:683b) -> 1E 01
	ld hl, sp+$01 ; AA83D (2a:683d) -> F8 01
	ld a, [hl] ; AA83F (2a:683f) -> 7E
	dec a ; AA840 (2a:6840) -> 3D
	scall SpriteFace ; AA841 (2a:6841) -> CD 95 40
	ld hl, $001e ; AA844 (2a:6844) -> 21 1E 00
	scall ScriptSleep ; AA847 (2a:6847) -> CD 8F 46
	ld a, $03 ; AA84A (2a:684a) -> 3E 03
	scall PlayerFace ; AA84C (2a:684c) -> CD 77 46
	ld a, $69 ; AA84F (2a:684f) -> 3E 69
	scall PlaySFX ; AA851 (2a:6851) -> CD FE 4E
	ld hl, $01bd ; AA854 (2a:6854) -> 21 BD 01
	scall PrintTextStandard ; AA857 (2a:6857) -> CD 98 44
	ld c, $01 ; AA85A (2a:685a) -> 0E 01
	ld de, Data_aa830 ; AA85C (2a:685c) -> 11 30 68
	ld a, $2a ; AA85F (2a:685f) -> 3E 2A
	scall MovePlayer ; AA861 (2a:6861) -> CD 3E 46
	ld e, $02 ; AA864 (2a:6864) -> 1E 02
	ld hl, sp+$01 ; AA866 (2a:6866) -> F8 01
	ld a, [hl] ; AA868 (2a:6868) -> 7E
	dec a ; AA869 (2a:6869) -> 3D
	scall SpriteFace ; AA86A (2a:686a) -> CD 95 40
.asm_aa86d:
	pop bc ; AA86D (2a:686d) -> C1
	ret  ; AA86E (2a:686e) -> C9

Func_aa86f:
	push af ; AA86F (2a:686f) -> F5
	push bc ; AA870 (2a:6870) -> C5
	ld hl, sp+$00 ; AA871 (2a:6871) -> F8 00
	ld [hl], $ff ; AA873 (2a:6873) -> 36 FF
	ld a, e ; AA875 (2a:6875) -> 7B
	or a ; AA876 (2a:6876) -> B7
	jp nz, .asm_aaaa4 ; AA877 (2a:6877) -> C2 A4 6A
	ld hl, sp+$03 ; AA87A (2a:687a) -> F8 03
	ld a, [hl] ; AA87C (2a:687c) -> 7E
	scall FacePlayer ; AA87D (2a:687d) -> CD 4B 44
	ld a, [wc796] ; AA880 (2a:6880) -> FA 96 C7
	cp $04 ; AA883 (2a:6883) -> FE 04
	jp nz, .asm_aa90a ; AA885 (2a:6885) -> C2 0A 69
	ld a, $49 ; AA888 (2a:6888) -> 3E 49
	scall Func_80e6d ; AA88A (2a:688a) -> CD 6D 4E
	ld hl, sp+$01 ; AA88D (2a:688d) -> F8 01
	ld [hl], a ; AA88F (2a:688f) -> 77
	cp $ff ; AA890 (2a:6890) -> FE FF
	jp z, .asm_aa907 ; AA892 (2a:6892) -> CA 07 69
	ld hl, $0416 ; AA895 (2a:6895) -> 21 16 04
	scall PrintTextWithNPCName ; AA898 (2a:6898) -> CD A9 44
	ld a, $49 ; AA89B (2a:689b) -> 3E 49
	scall Func_80e7d ; AA89D (2a:689d) -> CD 7D 4E
	cp $01 ; AA8A0 (2a:68a0) -> FE 01
	jp nz, .asm_aa8fe ; AA8A2 (2a:68a2) -> C2 FE 68
	ld hl, $0295 ; AA8A5 (2a:68a5) -> 21 95 02
	scall PrintTextWithNPCName ; AA8A8 (2a:68a8) -> CD A9 44
	ld hl, $0400 ; AA8AB (2a:68ab) -> 21 00 04
	scall PrintTextWithYesNoBox ; AA8AE (2a:68ae) -> CD BA 44
	or a ; AA8B1 (2a:68b1) -> B7
	jp nz, .asm_aa8ed ; AA8B2 (2a:68b2) -> C2 ED 68
	ld a, $68 ; AA8B5 (2a:68b5) -> 3E 68
	scall PlaySFX ; AA8B7 (2a:68b7) -> CD FE 4E
	ld hl, $040c ; AA8BA (2a:68ba) -> 21 0C 04
	scall PrintTextWithNPCName ; AA8BD (2a:68bd) -> CD A9 44
	ld hl, sp+$01 ; AA8C0 (2a:68c0) -> F8 01
	ld l, [hl] ; AA8C2 (2a:68c2) -> 6E
	ld h, $00 ; AA8C3 (2a:68c3) -> 26 00
	ld de, $0b00 ; AA8C5 (2a:68c5) -> 11 00 0B
	add hl, de ; AA8C8 (2a:68c8) -> 19
	scall Func_80488 ; AA8C9 (2a:68c9) -> CD 88 44
	ld a, l ; AA8CC (2a:68cc) -> 7D
	push af ; AA8CD (2a:68cd) -> F5
	ld c, $00 ; AA8CE (2a:68ce) -> 0E 00
	ld e, $01 ; AA8D0 (2a:68d0) -> 1E 01
	ld hl, sp+$03 ; AA8D2 (2a:68d2) -> F8 03
	ld a, [hl] ; AA8D4 (2a:68d4) -> 7E
	scall GiveRobot ; AA8D5 (2a:68d5) -> CD 87 4D
	pop af ; AA8D8 (2a:68d8) -> F1
	ld c, a ; AA8D9 (2a:68d9) -> 4F
	ld e, $00 ; AA8DA (2a:68da) -> 1E 00
	ld a, $4a ; AA8DC (2a:68dc) -> 3E 4A
	scall GiveRobot ; AA8DE (2a:68de) -> CD 87 4D
	ld a, $05 ; AA8E1 (2a:68e1) -> 3E 05
	ld [wc796], a ; AA8E3 (2a:68e3) -> EA 96 C7
	ld hl, sp+$00 ; AA8E6 (2a:68e6) -> F8 00
	ld [hl], $01 ; AA8E8 (2a:68e8) -> 36 01
	jp .asm_aa8fb ; AA8EA (2a:68ea) -> C3 FB 68
.asm_aa8ed:
	ld a, $69 ; AA8ED (2a:68ed) -> 3E 69
	scall PlaySFX ; AA8EF (2a:68ef) -> CD FE 4E
	ld hl, $040d ; AA8F2 (2a:68f2) -> 21 0D 04
	scall PrintTextWithNPCName ; AA8F5 (2a:68f5) -> CD A9 44
	jp .asm_aaaa4 ; AA8F8 (2a:68f8) -> C3 A4 6A
.asm_aa8fb:
	jp .asm_aa907 ; AA8FB (2a:68fb) -> C3 07 69
.asm_aa8fe:
	ld hl, $046e ; AA8FE (2a:68fe) -> 21 6E 04
	scall PrintTextStandard ; AA901 (2a:6901) -> CD 98 44
	jp .asm_aaaa4 ; AA904 (2a:6904) -> C3 A4 6A
.asm_aa907:
	jp .asm_aaa4f ; AA907 (2a:6907) -> C3 4F 6A
.asm_aa90a:
	ld a, [wc796] ; AA90A (2a:690a) -> FA 96 C7
	cp $0c ; AA90D (2a:690d) -> FE 0C
	jp nz, .asm_aa994 ; AA90F (2a:690f) -> C2 94 69
	ld a, $7c ; AA912 (2a:6912) -> 3E 7C
	scall Func_80e6d ; AA914 (2a:6914) -> CD 6D 4E
	ld hl, sp+$01 ; AA917 (2a:6917) -> F8 01
	ld [hl], a ; AA919 (2a:6919) -> 77
	cp $ff ; AA91A (2a:691a) -> FE FF
	jp z, .asm_aa991 ; AA91C (2a:691c) -> CA 91 69
	ld hl, $0416 ; AA91F (2a:691f) -> 21 16 04
	scall PrintTextWithNPCName ; AA922 (2a:6922) -> CD A9 44
	ld a, $7c ; AA925 (2a:6925) -> 3E 7C
	scall Func_80e7d ; AA927 (2a:6927) -> CD 7D 4E
	cp $01 ; AA92A (2a:692a) -> FE 01
	jp nz, .asm_aa988 ; AA92C (2a:692c) -> C2 88 69
	ld hl, $0296 ; AA92F (2a:692f) -> 21 96 02
	scall PrintTextWithNPCName ; AA932 (2a:6932) -> CD A9 44
	ld hl, $0400 ; AA935 (2a:6935) -> 21 00 04
	scall PrintTextWithYesNoBox ; AA938 (2a:6938) -> CD BA 44
	or a ; AA93B (2a:693b) -> B7
	jp nz, .asm_aa977 ; AA93C (2a:693c) -> C2 77 69
	ld a, $68 ; AA93F (2a:693f) -> 3E 68
	scall PlaySFX ; AA941 (2a:6941) -> CD FE 4E
	ld hl, $0432 ; AA944 (2a:6944) -> 21 32 04
	scall PrintTextWithNPCName ; AA947 (2a:6947) -> CD A9 44
	ld hl, sp+$01 ; AA94A (2a:694a) -> F8 01
	ld l, [hl] ; AA94C (2a:694c) -> 6E
	ld h, $00 ; AA94D (2a:694d) -> 26 00
	ld de, $0b00 ; AA94F (2a:694f) -> 11 00 0B
	add hl, de ; AA952 (2a:6952) -> 19
	scall Func_80488 ; AA953 (2a:6953) -> CD 88 44
	ld a, l ; AA956 (2a:6956) -> 7D
	push af ; AA957 (2a:6957) -> F5
	ld c, $00 ; AA958 (2a:6958) -> 0E 00
	ld e, $01 ; AA95A (2a:695a) -> 1E 01
	ld hl, sp+$03 ; AA95C (2a:695c) -> F8 03
	ld a, [hl] ; AA95E (2a:695e) -> 7E
	scall GiveRobot ; AA95F (2a:695f) -> CD 87 4D
	pop af ; AA962 (2a:6962) -> F1
	ld c, a ; AA963 (2a:6963) -> 4F
	ld e, $00 ; AA964 (2a:6964) -> 1E 00
	ld a, $7e ; AA966 (2a:6966) -> 3E 7E
	scall GiveRobot ; AA968 (2a:6968) -> CD 87 4D
	ld a, $0d ; AA96B (2a:696b) -> 3E 0D
	ld [wc796], a ; AA96D (2a:696d) -> EA 96 C7
	ld hl, sp+$00 ; AA970 (2a:6970) -> F8 00
	ld [hl], $01 ; AA972 (2a:6972) -> 36 01
	jp .asm_aa985 ; AA974 (2a:6974) -> C3 85 69
.asm_aa977:
	ld a, $69 ; AA977 (2a:6977) -> 3E 69
	scall PlaySFX ; AA979 (2a:6979) -> CD FE 4E
	ld hl, $0433 ; AA97C (2a:697c) -> 21 33 04
	scall PrintTextWithNPCName ; AA97F (2a:697f) -> CD A9 44
	jp .asm_aaaa4 ; AA982 (2a:6982) -> C3 A4 6A
.asm_aa985:
	jp .asm_aa991 ; AA985 (2a:6985) -> C3 91 69
.asm_aa988:
	ld hl, $046e ; AA988 (2a:6988) -> 21 6E 04
	scall PrintTextStandard ; AA98B (2a:698b) -> CD 98 44
	jp .asm_aaaa4 ; AA98E (2a:698e) -> C3 A4 6A
.asm_aa991:
	jp .asm_aaa4f ; AA991 (2a:6991) -> C3 4F 6A
.asm_aa994:
	ld a, $49 ; AA994 (2a:6994) -> 3E 49
	scall Func_80e6d ; AA996 (2a:6996) -> CD 6D 4E
	ld hl, sp+$01 ; AA999 (2a:6999) -> F8 01
	ld [hl], a ; AA99B (2a:699b) -> 77
	cp $ff ; AA99C (2a:699c) -> FE FF
	jp nz, .asm_aa9ae ; AA99E (2a:699e) -> C2 AE 69
	ld a, $7c ; AA9A1 (2a:69a1) -> 3E 7C
	scall Func_80e6d ; AA9A3 (2a:69a3) -> CD 6D 4E
	ld hl, sp+$01 ; AA9A6 (2a:69a6) -> F8 01
	ld [hl], a ; AA9A8 (2a:69a8) -> 77
	cp $ff ; AA9A9 (2a:69a9) -> FE FF
	jp z, .asm_aaa4f ; AA9AB (2a:69ab) -> CA 4F 6A
.asm_aa9ae:
	ld a, [wc796] ; AA9AE (2a:69ae) -> FA 96 C7
	cp $08 ; AA9B1 (2a:69b1) -> FE 08
	jp z, .asm_aaa37 ; AA9B3 (2a:69b3) -> CA 37 6A
	cp $06 ; AA9B6 (2a:69b6) -> FE 06
	jp z, .asm_aaa37 ; AA9B8 (2a:69b8) -> CA 37 6A
	cp $0a ; AA9BB (2a:69bb) -> FE 0A
	jp z, .asm_aaa28 ; AA9BD (2a:69bd) -> CA 28 6A
	cp $05 ; AA9C0 (2a:69c0) -> FE 05
	jp z, .asm_aaa28 ; AA9C2 (2a:69c2) -> CA 28 6A
	cp $07 ; AA9C5 (2a:69c5) -> FE 07
	jp z, .asm_aaa19 ; AA9C7 (2a:69c7) -> CA 19 6A
	or a ; AA9CA (2a:69ca) -> B7
	jp z, .asm_aaa19 ; AA9CB (2a:69cb) -> CA 19 6A
	cp $0d ; AA9CE (2a:69ce) -> FE 0D
	jp z, .asm_aaa0a ; AA9D0 (2a:69d0) -> CA 0A 6A
	cp $03 ; AA9D3 (2a:69d3) -> FE 03
	jp z, .asm_aaa0a ; AA9D5 (2a:69d5) -> CA 0A 6A
	cp $0b ; AA9D8 (2a:69d8) -> FE 0B
	jp z, .asm_aa9fb ; AA9DA (2a:69da) -> CA FB 69
	cp $02 ; AA9DD (2a:69dd) -> FE 02
	jp z, .asm_aa9fb ; AA9DF (2a:69df) -> CA FB 69
	cp $09 ; AA9E2 (2a:69e2) -> FE 09
	jp z, .asm_aa9ec ; AA9E4 (2a:69e4) -> CA EC 69
	cp $01 ; AA9E7 (2a:69e7) -> FE 01
	jp nz, .asm_aaa46 ; AA9E9 (2a:69e9) -> C2 46 6A
.asm_aa9ec:
	ld hl, $0140 ; AA9EC (2a:69ec) -> 21 40 01
	scall PrintTextStandard ; AA9EF (2a:69ef) -> CD 98 44
	ld hl, $034d ; AA9F2 (2a:69f2) -> 21 4D 03
	scall PrintTextStandard ; AA9F5 (2a:69f5) -> CD 98 44
	jp .asm_aaa4c ; AA9F8 (2a:69f8) -> C3 4C 6A
.asm_aa9fb:
	ld hl, $0140 ; AA9FB (2a:69fb) -> 21 40 01
	scall PrintTextStandard ; AA9FE (2a:69fe) -> CD 98 44
	ld hl, $0205 ; AAA01 (2a:6a01) -> 21 05 02
	scall PrintTextStandard ; AAA04 (2a:6a04) -> CD 98 44
	jp .asm_aaa4c ; AAA07 (2a:6a07) -> C3 4C 6A
.asm_aaa0a:
	ld hl, $0140 ; AAA0A (2a:6a0a) -> 21 40 01
	scall PrintTextStandard ; AAA0D (2a:6a0d) -> CD 98 44
	ld hl, $020a ; AAA10 (2a:6a10) -> 21 0A 02
	scall PrintTextStandard ; AAA13 (2a:6a13) -> CD 98 44
	jp .asm_aaa4c ; AAA16 (2a:6a16) -> C3 4C 6A
.asm_aaa19:
	ld hl, $0140 ; AAA19 (2a:6a19) -> 21 40 01
	scall PrintTextStandard ; AAA1C (2a:6a1c) -> CD 98 44
	ld hl, $034b ; AAA1F (2a:6a1f) -> 21 4B 03
	scall PrintTextStandard ; AAA22 (2a:6a22) -> CD 98 44
	jp .asm_aaa4c ; AAA25 (2a:6a25) -> C3 4C 6A
.asm_aaa28:
	ld hl, $0140 ; AAA28 (2a:6a28) -> 21 40 01
	scall PrintTextStandard ; AAA2B (2a:6a2b) -> CD 98 44
	ld hl, $0241 ; AAA2E (2a:6a2e) -> 21 41 02
	scall PrintTextStandard ; AAA31 (2a:6a31) -> CD 98 44
	jp .asm_aaa4c ; AAA34 (2a:6a34) -> C3 4C 6A
.asm_aaa37:
	ld hl, $0140 ; AAA37 (2a:6a37) -> 21 40 01
	scall PrintTextStandard ; AAA3A (2a:6a3a) -> CD 98 44
	ld hl, $0244 ; AAA3D (2a:6a3d) -> 21 44 02
	scall PrintTextStandard ; AAA40 (2a:6a40) -> CD 98 44
	jp .asm_aaa4c ; AAA43 (2a:6a43) -> C3 4C 6A
.asm_aaa46:
	ld hl, $0416 ; AAA46 (2a:6a46) -> 21 16 04
	scall PrintTextWithNPCName ; AAA49 (2a:6a49) -> CD A9 44
.asm_aaa4c:
	jp .asm_aaaa4 ; AAA4C (2a:6a4c) -> C3 A4 6A
.asm_aaa4f:
	ld hl, sp+$00 ; AAA4F (2a:6a4f) -> F8 00
	ld a, [hl] ; AAA51 (2a:6a51) -> 7E
	cp $ff ; AAA52 (2a:6a52) -> FE FF
	jp nz, .asm_aaaa4 ; AAA54 (2a:6a54) -> C2 A4 6A
	ld a, [wc796] ; AAA57 (2a:6a57) -> FA 96 C7
	cp $0d ; AAA5A (2a:6a5a) -> FE 0D
	jp nc, .asm_aaa76 ; AAA5C (2a:6a5c) -> D2 76 6A
	ld a, [wc796] ; AAA5F (2a:6a5f) -> FA 96 C7
	cp $05 ; AAA62 (2a:6a62) -> FE 05
	jp c, .asm_aaa76 ; AAA64 (2a:6a64) -> DA 76 6A
	ld hl, $0416 ; AAA67 (2a:6a67) -> 21 16 04
	scall PrintTextWithNPCName ; AAA6A (2a:6a6a) -> CD A9 44
	ld hl, $0431 ; AAA6D (2a:6a6d) -> 21 31 04
	scall PrintTextWithNPCName ; AAA70 (2a:6a70) -> CD A9 44
	jp .asm_aaaa4 ; AAA73 (2a:6a73) -> C3 A4 6A
.asm_aaa76:
	ld a, [wc796] ; AAA76 (2a:6a76) -> FA 96 C7
	cp $0f ; AAA79 (2a:6a79) -> FE 0F
	jp nz, .asm_aaa87 ; AAA7B (2a:6a7b) -> C2 87 6A
	ld hl, $0416 ; AAA7E (2a:6a7e) -> 21 16 04
	scall PrintTextWithNPCName ; AAA81 (2a:6a81) -> CD A9 44
	jp .asm_aaaa4 ; AAA84 (2a:6a84) -> C3 A4 6A
.asm_aaa87:
	ld a, [wc796] ; AAA87 (2a:6a87) -> FA 96 C7
	cp $0d ; AAA8A (2a:6a8a) -> FE 0D
	jp c, .asm_aaa98 ; AAA8C (2a:6a8c) -> DA 98 6A
	ld hl, $0434 ; AAA8F (2a:6a8f) -> 21 34 04
	scall PrintTextWithNPCName ; AAA92 (2a:6a92) -> CD A9 44
	jp .asm_aaaa4 ; AAA95 (2a:6a95) -> C3 A4 6A
.asm_aaa98:
	ld hl, $0416 ; AAA98 (2a:6a98) -> 21 16 04
	scall PrintTextWithNPCName ; AAA9B (2a:6a9b) -> CD A9 44
	ld hl, $01ba ; AAA9E (2a:6a9e) -> 21 BA 01
	scall PrintTextWithNPCName ; AAAA1 (2a:6aa1) -> CD A9 44
.asm_aaaa4:
	pop bc ; AAAA4 (2a:6aa4) -> C1
	pop bc ; AAAA5 (2a:6aa5) -> C1
	ret  ; AAAA6 (2a:6aa6) -> C9

Data_aaaa7:
	db $05, $0e, $01, $01
	db $07, $08

Func_aaaad:
	ld a, [wc790] ; AAAAD (2a:6aad) -> FA 90 C7
	or a ; AAAB0 (2a:6ab0) -> B7
	jp z, .asm_aaac5 ; AAAB1 (2a:6ab1) -> CA C5 6A
	ld a, [wc790] ; AAAB4 (2a:6ab4) -> FA 90 C7
	cp $07 ; AAAB7 (2a:6ab7) -> FE 07
	jp nc, .asm_aaac5 ; AAAB9 (2a:6ab9) -> D2 C5 6A
	ld hl, Data_aaaa7 ; AAABC (2a:6abc) -> 21 A7 6A
	scall Func_80d9b ; AAABF (2a:6abf) -> CD 9B 4D
	scall Func_80f02 ; AAAC2 (2a:6ac2) -> CD 02 4F
.asm_aaac5:
	ret  ; AAAC5 (2a:6ac5) -> C9

Data_aaac6:
	db $19, $05, $ff, $ff

Data_aaaca:
	db $19, $0d, $ff, $ff

Data_aaace:
	db $1a, $06, $ff, $ff

Data_aaad2:
	db $19, $07, $ff, $ff

Func_aaad6:
	ld bc, Data_aaac6 ; AAAD6 (2a:6ad6) -> 01 C6 6A
	ld e, $2a ; AAAD9 (2a:6ad9) -> 1E 2A
	ld a, $0c ; AAADB (2a:6adb) -> 3E 0C
	scall MovePersonAndWait ; AAADD (2a:6add) -> CD 88 46
	scall WaitNPCStep ; AAAE0 (2a:6ae0) -> CD 0C 42
	ld c, $01 ; AAAE3 (2a:6ae3) -> 0E 01
	ld de, Data_aaace ; AAAE5 (2a:6ae5) -> 11 CE 6A
	ld a, $2a ; AAAE8 (2a:6ae8) -> 3E 2A
	scall MovePlayer ; AAAEA (2a:6aea) -> CD 3E 46
	scall WaitNPCStep ; AAAED (2a:6aed) -> CD 0C 42
	ld a, $03 ; AAAF0 (2a:6af0) -> 3E 03
	scall PlayerFace ; AAAF2 (2a:6af2) -> CD 77 46
	ld bc, Data_aaaca ; AAAF5 (2a:6af5) -> 01 CA 6A
	ld e, $2a ; AAAF8 (2a:6af8) -> 1E 2A
	ld a, $0c ; AAAFA (2a:6afa) -> 3E 0C
	scall MovePersonAndWait ; AAAFC (2a:6afc) -> CD 88 46
	scall WaitNPCStep ; AAAFF (2a:6aff) -> CD 0C 42
	ld a, $02 ; AAB02 (2a:6b02) -> 3E 02
	scall PlayerFace ; AAB04 (2a:6b04) -> CD 77 46
	ld e, $00 ; AAB07 (2a:6b07) -> 1E 00
	ld a, $0c ; AAB09 (2a:6b09) -> 3E 0C
	scall SetPersonVisibilityState ; AAB0B (2a:6b0b) -> CD 3D 41
	ld hl, $0112 ; AAB0E (2a:6b0e) -> 21 12 01
	scall PrintTextStandard ; AAB11 (2a:6b11) -> CD 98 44
	ld c, $01 ; AAB14 (2a:6b14) -> 0E 01
	ld de, Data_aaad2 ; AAB16 (2a:6b16) -> 11 D2 6A
	ld a, $2a ; AAB19 (2a:6b19) -> 3E 2A
	scall MovePlayer ; AAB1B (2a:6b1b) -> CD 3E 46
	scall WaitNPCStep ; AAB1E (2a:6b1e) -> CD 0C 42
	ld e, $01 ; AAB21 (2a:6b21) -> 1E 01
	ld hl, $00c2 ; AAB23 (2a:6b23) -> 21 C2 00
	scall EventFlagAction ; AAB26 (2a:6b26) -> CD 1B 46
	ld l, $07 ; AAB29 (2a:6b29) -> 2E 07
	push hl ; AAB2B (2a:6b2b) -> E5
	ld c, $19 ; AAB2C (2a:6b2c) -> 0E 19
	ld e, $01 ; AAB2E (2a:6b2e) -> 1E 01
	ld a, $19 ; AAB30 (2a:6b30) -> 3E 19
	scall Func_80dff ; AAB32 (2a:6b32) -> CD FF 4D
	pop bc ; AAB35 (2a:6b35) -> C1
	ret  ; AAB36 (2a:6b36) -> C9

Data_aab37:
	db $19, $06, $ff, $ff

Data_aab3b:
	db $19, $0d, $ff, $ff

Func_aab3f:
	ld bc, Data_aab37 ; AAB3F (2a:6b3f) -> 01 37 6B
	ld e, $2a ; AAB42 (2a:6b42) -> 1E 2A
	ld a, $0c ; AAB44 (2a:6b44) -> 3E 0C
	scall MovePersonAndWait ; AAB46 (2a:6b46) -> CD 88 46
	scall WaitNPCStep ; AAB49 (2a:6b49) -> CD 0C 42
	ld hl, $001e ; AAB4C (2a:6b4c) -> 21 1E 00
	scall ScriptSleep ; AAB4F (2a:6b4f) -> CD 8F 46
	ld hl, $01bf ; AAB52 (2a:6b52) -> 21 BF 01
	scall PrintTextStandard ; AAB55 (2a:6b55) -> CD 98 44
	ld hl, $001e ; AAB58 (2a:6b58) -> 21 1E 00
	scall ScriptSleep ; AAB5B (2a:6b5b) -> CD 8F 46
	ld bc, Data_aab3b ; AAB5E (2a:6b5e) -> 01 3B 6B
	ld e, $2a ; AAB61 (2a:6b61) -> 1E 2A
	ld a, $0c ; AAB63 (2a:6b63) -> 3E 0C
	scall MovePersonAndWait ; AAB65 (2a:6b65) -> CD 88 46
	scall WaitNPCStep ; AAB68 (2a:6b68) -> CD 0C 42
	ld hl, $001e ; AAB6B (2a:6b6b) -> 21 1E 00
	scall ScriptSleep ; AAB6E (2a:6b6e) -> CD 8F 46
	ld l, $06 ; AAB71 (2a:6b71) -> 2E 06
	push hl ; AAB73 (2a:6b73) -> E5
	ld c, $07 ; AAB74 (2a:6b74) -> 0E 07
	ld e, $00 ; AAB76 (2a:6b76) -> 1E 00
	ld a, $1a ; AAB78 (2a:6b78) -> 3E 1A
	scall Func_80dff ; AAB7A (2a:6b7a) -> CD FF 4D
	pop bc ; AAB7D (2a:6b7d) -> C1
	ld e, $01 ; AAB7E (2a:6b7e) -> 1E 01
	ld hl, $00c3 ; AAB80 (2a:6b80) -> 21 C3 00
	scall EventFlagAction ; AAB83 (2a:6b83) -> CD 1B 46
	ret  ; AAB86 (2a:6b86) -> C9

Func_aab87:
	ld a, e ; AAB87 (2a:6b87) -> 7B
	cp $02 ; AAB88 (2a:6b88) -> FE 02
	jp nz, .asm_aab92 ; AAB8A (2a:6b8a) -> C2 92 6B
	ld a, $0c ; AAB8D (2a:6b8d) -> 3E 0C
	ld [wc78a], a ; AAB8F (2a:6b8f) -> EA 8A C7
.asm_aab92:
	ret  ; AAB92 (2a:6b92) -> C9

Data_aab93:
	warpdef $01, $04, $01, $01, MAP_25_04, $09, $18, $09, $17, $2e
	warpdef $0e, $03, $01, $03, MAP_28_01, $05, $14, $06, $14, $2e

Data_aaba9:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aabe1:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaccc, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaccc, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_aada6, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_aada6, NULL

Func_aac19:: ; aac19
	ld e, $02 ; AAC19 (2a:6c19) -> 1E 02
	ld hl, Data_aab93 ; AAC1B (2a:6c1b) -> 21 93 6B
	scall LoadWarps ; AAC1E (2a:6c1e) -> CD 3A 40
	ld a, $03 ; AAC21 (2a:6c21) -> 3E 03
	scall Func_80d01 ; AAC23 (2a:6c23) -> CD 01 4D
	ld e, $04 ; AAC26 (2a:6c26) -> 1E 04
	ld hl, Data_aaba9 ; AAC28 (2a:6c28) -> 21 A9 6B
	scall LoadEncounters ; AAC2B (2a:6c2b) -> CD 24 4D
	ld e, $01 ; AAC2E (2a:6c2e) -> 1E 01
	ld hl, $00c2 ; AAC30 (2a:6c30) -> 21 C2 00
	scall EventFlagAction ; AAC33 (2a:6c33) -> CD 1B 46
	ld hl, $0022 ; AAC36 (2a:6c36) -> 21 22 00
	scall CheckEventFlag ; AAC39 (2a:6c39) -> CD 2E 46
	cp $01 ; AAC3C (2a:6c3c) -> FE 01
	jp nz, .asm_aac8a ; AAC3E (2a:6c3e) -> C2 8A 6C
	ld hl, $0043 ; AAC41 (2a:6c41) -> 21 43 00
	scall CheckEventFlag ; AAC44 (2a:6c44) -> CD 2E 46
	or a ; AAC47 (2a:6c47) -> B7
	jp nz, .asm_aac8a ; AAC48 (2a:6c48) -> C2 8A 6C
	ld e, $04 ; AAC4B (2a:6c4b) -> 1E 04
	ld hl, Data_aabe1 ; AAC4D (2a:6c4d) -> 21 E1 6B
	scall LoadMapObjects ; AAC50 (2a:6c50) -> CD FB 40
	ld a, $04 ; AAC53 (2a:6c53) -> 3E 04
	scall PlayMusic ; AAC55 (2a:6c55) -> CD E6 4E
	ld hl, $00af ; AAC58 (2a:6c58) -> 21 AF 00
	scall CheckEventFlag ; AAC5B (2a:6c5b) -> CD 2E 46
	or a ; AAC5E (2a:6c5e) -> B7
	jp z, .asm_aac6f ; AAC5F (2a:6c5f) -> CA 6F 6C
	ld e, $00 ; AAC62 (2a:6c62) -> 1E 00
	xor a ; AAC64 (2a:6c64) -> AF
	scall SetPersonVisibilityState ; AAC65 (2a:6c65) -> CD 3D 41
	ld e, $00 ; AAC68 (2a:6c68) -> 1E 00
	ld a, $01 ; AAC6A (2a:6c6a) -> 3E 01
	scall SetPersonVisibilityState ; AAC6C (2a:6c6c) -> CD 3D 41
.asm_aac6f:
	ld hl, $00b0 ; AAC6F (2a:6c6f) -> 21 B0 00
	scall CheckEventFlag ; AAC72 (2a:6c72) -> CD 2E 46
	or a ; AAC75 (2a:6c75) -> B7
	jp z, .asm_aac87 ; AAC76 (2a:6c76) -> CA 87 6C
	ld e, $00 ; AAC79 (2a:6c79) -> 1E 00
	ld a, $02 ; AAC7B (2a:6c7b) -> 3E 02
	scall SetPersonVisibilityState ; AAC7D (2a:6c7d) -> CD 3D 41
	ld e, $00 ; AAC80 (2a:6c80) -> 1E 00
	ld a, $03 ; AAC82 (2a:6c82) -> 3E 03
	scall SetPersonVisibilityState ; AAC84 (2a:6c84) -> CD 3D 41
.asm_aac87:
	jp .asm_aac8f ; AAC87 (2a:6c87) -> C3 8F 6C
.asm_aac8a:
	ld a, $08 ; AAC8A (2a:6c8a) -> 3E 08
	scall PlayMusic ; AAC8C (2a:6c8c) -> CD E6 4E
.asm_aac8f:
	scall Func_8001c ; AAC8F (2a:6c8f) -> CD 1C 40
	ret  ; AAC92 (2a:6c92) -> C9

Data_aac93:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $87, $06, $28, $03, $03, $00, $14, $88, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $84, $06, $28, $03, $03, $00, $14, $85, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_aacbc:
	db $08, $04, $ff, $ff

Data_aacc0:
	db $08, $04, $01, $04, $ff, $ff

Data_aacc6:
	db $06, $04, $01, $04, $ff, $ff

Func_aaccc:
	push de ; AACCC (2a:6ccc) -> D5
	ld hl, $00af ; AACCD (2a:6ccd) -> 21 AF 00
	scall CheckEventFlag ; AACD0 (2a:6cd0) -> CD 2E 46
	or a ; AACD3 (2a:6cd3) -> B7
	jp nz, .asm_aad67 ; AACD4 (2a:6cd4) -> C2 67 6D
	ld hl, sp+$00 ; AACD7 (2a:6cd7) -> F8 00
	ld a, [hl] ; AACD9 (2a:6cd9) -> 7E
	cp $02 ; AACDA (2a:6cda) -> FE 02
	jp z, .asm_aace3 ; AACDC (2a:6cdc) -> CA E3 6C
	or a ; AACDF (2a:6cdf) -> B7
	jp nz, .asm_aad67 ; AACE0 (2a:6ce0) -> C2 67 6D
.asm_aace3:
	ld a, [wMapY] ; AACE3 (2a:6ce3) -> FA D9 C2
	add a, $04 ; AACE6 (2a:6ce6) -> C6 04
	cp $03 ; AACE8 (2a:6ce8) -> FE 03
	jp nz, .asm_aacf4 ; AACEA (2a:6cea) -> C2 F4 6C
	xor a ; AACED (2a:6ced) -> AF
	scall FacePlayer ; AACEE (2a:6cee) -> CD 4B 44
	jp .asm_aad02 ; AACF1 (2a:6cf1) -> C3 02 6D
.asm_aacf4:
	ld c, $01 ; AACF4 (2a:6cf4) -> 0E 01
	ld de, Data_aacbc ; AACF6 (2a:6cf6) -> 11 BC 6C
	ld a, $2a ; AACF9 (2a:6cf9) -> 3E 2A
	scall MovePlayer ; AACFB (2a:6cfb) -> CD 3E 46
	xor a ; AACFE (2a:6cfe) -> AF
	scall PlayerFace ; AACFF (2a:6cff) -> CD 77 46
.asm_aad02:
	xor a ; AAD02 (2a:6d02) -> AF
	scall PlayMusic ; AAD03 (2a:6d03) -> CD E6 4E
	ld a, $1a ; AAD06 (2a:6d06) -> 3E 1A
	scall PlayMusic ; AAD08 (2a:6d08) -> CD E6 4E
	ld hl, $0114 ; AAD0B (2a:6d0b) -> 21 14 01
	scall PrintTextStandard ; AAD0E (2a:6d0e) -> CD 98 44
	ld de, Data_aad69 ; AAD11 (2a:6d11) -> 11 69 6D
	ld hl, Data_aac93 ; AAD14 (2a:6d14) -> 21 93 6C
	scall ScriptedBattle ; AAD17 (2a:6d17) -> CD D3 4D
	or a ; AAD1A (2a:6d1a) -> B7
	jp nz, .asm_aad21 ; AAD1B (2a:6d1b) -> C2 21 6D
	jp .asm_aad67 ; AAD1E (2a:6d1e) -> C3 67 6D
.asm_aad21:
	ld hl, $010f ; AAD21 (2a:6d21) -> 21 0F 01
	scall PrintTextStandard ; AAD24 (2a:6d24) -> CD 98 44
	ld a, [wMapY] ; AAD27 (2a:6d27) -> FA D9 C2
	add a, $04 ; AAD2A (2a:6d2a) -> C6 04
	cp $03 ; AAD2C (2a:6d2c) -> FE 03
	jp nz, .asm_aad3d ; AAD2E (2a:6d2e) -> C2 3D 6D
	ld bc, Data_aacc0 ; AAD31 (2a:6d31) -> 01 C0 6C
	ld e, $2a ; AAD34 (2a:6d34) -> 1E 2A
	xor a ; AAD36 (2a:6d36) -> AF
	scall MovePersonAndWait ; AAD37 (2a:6d37) -> CD 88 46
	jp .asm_aad46 ; AAD3A (2a:6d3a) -> C3 46 6D
.asm_aad3d:
	ld bc, Data_aacc6 ; AAD3D (2a:6d3d) -> 01 C6 6C
	ld e, $2a ; AAD40 (2a:6d40) -> 1E 2A
	xor a ; AAD42 (2a:6d42) -> AF
	scall MovePersonAndWait ; AAD43 (2a:6d43) -> CD 88 46
.asm_aad46:
	scall WaitNPCStep ; AAD46 (2a:6d46) -> CD 0C 42
	ld e, $00 ; AAD49 (2a:6d49) -> 1E 00
	xor a ; AAD4B (2a:6d4b) -> AF
	scall SetPersonVisibilityState ; AAD4C (2a:6d4c) -> CD 3D 41
	ld e, $00 ; AAD4F (2a:6d4f) -> 1E 00
	ld a, $01 ; AAD51 (2a:6d51) -> 3E 01
	scall SetPersonVisibilityState ; AAD53 (2a:6d53) -> CD 3D 41
	xor a ; AAD56 (2a:6d56) -> AF
	scall PlayMusic ; AAD57 (2a:6d57) -> CD E6 4E
	ld a, $04 ; AAD5A (2a:6d5a) -> 3E 04
	scall PlayMusic ; AAD5C (2a:6d5c) -> CD E6 4E
	ld e, $01 ; AAD5F (2a:6d5f) -> 1E 01
	ld hl, $00af ; AAD61 (2a:6d61) -> 21 AF 00
	scall EventFlagAction ; AAD64 (2a:6d64) -> CD 1B 46
.asm_aad67:
	pop bc ; AAD67 (2a:6d67) -> C1
	ret  ; AAD68 (2a:6d68) -> C9

Data_aad69:
	dstr "(へいし)"

Data_aad6f:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $84, $06, $28, $04, $04, $00, $14, $85, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $87, $06, $28, $04, $04, $00, $14, $88, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aad98:
	db $0a, $04, $ff, $ff

Data_aad9c:
	db $0a, $04, $0e, $04, $ff, $ff

Data_aada2:
	db $0e, $03, $ff, $ff

Func_aada6:
	push de ; AADA6 (2a:6da6) -> D5
	ld hl, $00b0 ; AADA7 (2a:6da7) -> 21 B0 00
	scall CheckEventFlag ; AADAA (2a:6daa) -> CD 2E 46
	or a ; AADAD (2a:6dad) -> B7
	jp nz, .asm_aae45 ; AADAE (2a:6dae) -> C2 45 6E
	ld hl, sp+$00 ; AADB1 (2a:6db1) -> F8 00
	ld a, [hl] ; AADB3 (2a:6db3) -> 7E
	cp $02 ; AADB4 (2a:6db4) -> FE 02
	jp z, .asm_aadbd ; AADB6 (2a:6db6) -> CA BD 6D
	or a ; AADB9 (2a:6db9) -> B7
	jp nz, .asm_aae45 ; AADBA (2a:6dba) -> C2 45 6E
.asm_aadbd:
	ld a, [wMapY] ; AADBD (2a:6dbd) -> FA D9 C2
	add a, $04 ; AADC0 (2a:6dc0) -> C6 04
	cp $03 ; AADC2 (2a:6dc2) -> FE 03
	jp nz, .asm_aadcf ; AADC4 (2a:6dc4) -> C2 CF 6D
	ld a, $02 ; AADC7 (2a:6dc7) -> 3E 02
	scall FacePlayer ; AADC9 (2a:6dc9) -> CD 4B 44
	jp .asm_aaddd ; AADCC (2a:6dcc) -> C3 DD 6D
.asm_aadcf:
	ld c, $01 ; AADCF (2a:6dcf) -> 0E 01
	ld de, Data_aad98 ; AADD1 (2a:6dd1) -> 11 98 6D
	ld a, $2a ; AADD4 (2a:6dd4) -> 3E 2A
	scall MovePlayer ; AADD6 (2a:6dd6) -> CD 3E 46
	xor a ; AADD9 (2a:6dd9) -> AF
	scall PlayerFace ; AADDA (2a:6dda) -> CD 77 46
.asm_aaddd:
	xor a ; AADDD (2a:6ddd) -> AF
	scall PlayMusic ; AADDE (2a:6dde) -> CD E6 4E
	ld a, $1a ; AADE1 (2a:6de1) -> 3E 1A
	scall PlayMusic ; AADE3 (2a:6de3) -> CD E6 4E
	ld hl, $010c ; AADE6 (2a:6de6) -> 21 0C 01
	scall PrintTextStandard ; AADE9 (2a:6de9) -> CD 98 44
	ld de, Data_aae47 ; AADEC (2a:6dec) -> 11 47 6E
	ld hl, Data_aad6f ; AADEF (2a:6def) -> 21 6F 6D
	scall ScriptedBattle ; AADF2 (2a:6df2) -> CD D3 4D
	or a ; AADF5 (2a:6df5) -> B7
	jp nz, .asm_aadfc ; AADF6 (2a:6df6) -> C2 FC 6D
	jp .asm_aae45 ; AADF9 (2a:6df9) -> C3 45 6E
.asm_aadfc:
	ld hl, $010f ; AADFC (2a:6dfc) -> 21 0F 01
	scall PrintTextStandard ; AADFF (2a:6dff) -> CD 98 44
	ld a, [wMapY] ; AAE02 (2a:6e02) -> FA D9 C2
	add a, $04 ; AAE05 (2a:6e05) -> C6 04
	cp $03 ; AAE07 (2a:6e07) -> FE 03
	jp nz, .asm_aae19 ; AAE09 (2a:6e09) -> C2 19 6E
	ld bc, Data_aad9c ; AAE0C (2a:6e0c) -> 01 9C 6D
	ld e, $2a ; AAE0F (2a:6e0f) -> 1E 2A
	ld a, $02 ; AAE11 (2a:6e11) -> 3E 02
	scall MovePersonAndWait ; AAE13 (2a:6e13) -> CD 88 46
	jp .asm_aae23 ; AAE16 (2a:6e16) -> C3 23 6E
.asm_aae19:
	ld bc, Data_aada2 ; AAE19 (2a:6e19) -> 01 A2 6D
	ld e, $2a ; AAE1C (2a:6e1c) -> 1E 2A
	ld a, $02 ; AAE1E (2a:6e1e) -> 3E 02
	scall MovePersonAndWait ; AAE20 (2a:6e20) -> CD 88 46
.asm_aae23:
	scall WaitNPCStep ; AAE23 (2a:6e23) -> CD 0C 42
	ld e, $00 ; AAE26 (2a:6e26) -> 1E 00
	ld a, $02 ; AAE28 (2a:6e28) -> 3E 02
	scall SetPersonVisibilityState ; AAE2A (2a:6e2a) -> CD 3D 41
	ld e, $00 ; AAE2D (2a:6e2d) -> 1E 00
	ld a, $03 ; AAE2F (2a:6e2f) -> 3E 03
	scall SetPersonVisibilityState ; AAE31 (2a:6e31) -> CD 3D 41
	xor a ; AAE34 (2a:6e34) -> AF
	scall PlayMusic ; AAE35 (2a:6e35) -> CD E6 4E
	ld a, $04 ; AAE38 (2a:6e38) -> 3E 04
	scall PlayMusic ; AAE3A (2a:6e3a) -> CD E6 4E
	ld e, $01 ; AAE3D (2a:6e3d) -> 1E 01
	ld hl, $00b0 ; AAE3F (2a:6e3f) -> 21 B0 00
	scall EventFlagAction ; AAE42 (2a:6e42) -> CD 1B 46
.asm_aae45:
	pop bc ; AAE45 (2a:6e45) -> C1
	ret  ; AAE46 (2a:6e46) -> C9

Data_aae47:
	dstr "(へいし)"

Data_aae4d:
	warpdef $11, $04, $01, $01, MAP_25_05, $01, $18, $01, $17, $2e
	warpdef $05, $03, $01, $03, MAP_28_01, $1d, $14, $1c, $14, $2e

Data_aae63:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aae9b:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaf84, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaf84, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_ab05c, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_ab05c, NULL

Func_aaed3:: ; aaed3
	ld e, $02 ; AAED3 (2a:6ed3) -> 1E 02
	ld hl, Data_aae4d ; AAED5 (2a:6ed5) -> 21 4D 6E
	scall LoadWarps ; AAED8 (2a:6ed8) -> CD 3A 40
	ld a, $03 ; AAEDB (2a:6edb) -> 3E 03
	scall Func_80d01 ; AAEDD (2a:6edd) -> CD 01 4D
	ld e, $04 ; AAEE0 (2a:6ee0) -> 1E 04
	ld hl, Data_aae63 ; AAEE2 (2a:6ee2) -> 21 63 6E
	scall LoadEncounters ; AAEE5 (2a:6ee5) -> CD 24 4D
	ld e, $01 ; AAEE8 (2a:6ee8) -> 1E 01
	ld hl, $00c2 ; AAEEA (2a:6eea) -> 21 C2 00
	scall EventFlagAction ; AAEED (2a:6eed) -> CD 1B 46
	ld hl, $0022 ; AAEF0 (2a:6ef0) -> 21 22 00
	scall CheckEventFlag ; AAEF3 (2a:6ef3) -> CD 2E 46
	cp $01 ; AAEF6 (2a:6ef6) -> FE 01
	jp nz, .asm_aaf44 ; AAEF8 (2a:6ef8) -> C2 44 6F
	ld hl, $0043 ; AAEFB (2a:6efb) -> 21 43 00
	scall CheckEventFlag ; AAEFE (2a:6efe) -> CD 2E 46
	or a ; AAF01 (2a:6f01) -> B7
	jp nz, .asm_aaf44 ; AAF02 (2a:6f02) -> C2 44 6F
	ld e, $04 ; AAF05 (2a:6f05) -> 1E 04
	ld hl, Data_aae9b ; AAF07 (2a:6f07) -> 21 9B 6E
	scall LoadMapObjects ; AAF0A (2a:6f0a) -> CD FB 40
	ld a, $04 ; AAF0D (2a:6f0d) -> 3E 04
	scall PlayMusic ; AAF0F (2a:6f0f) -> CD E6 4E
	ld hl, $00b3 ; AAF12 (2a:6f12) -> 21 B3 00
	scall CheckEventFlag ; AAF15 (2a:6f15) -> CD 2E 46
	or a ; AAF18 (2a:6f18) -> B7
	jp z, .asm_aaf29 ; AAF19 (2a:6f19) -> CA 29 6F
	ld e, $00 ; AAF1C (2a:6f1c) -> 1E 00
	xor a ; AAF1E (2a:6f1e) -> AF
	scall SetPersonVisibilityState ; AAF1F (2a:6f1f) -> CD 3D 41
	ld e, $00 ; AAF22 (2a:6f22) -> 1E 00
	ld a, $01 ; AAF24 (2a:6f24) -> 3E 01
	scall SetPersonVisibilityState ; AAF26 (2a:6f26) -> CD 3D 41
.asm_aaf29:
	ld hl, $00b4 ; AAF29 (2a:6f29) -> 21 B4 00
	scall CheckEventFlag ; AAF2C (2a:6f2c) -> CD 2E 46
	or a ; AAF2F (2a:6f2f) -> B7
	jp z, .asm_aaf41 ; AAF30 (2a:6f30) -> CA 41 6F
	ld e, $00 ; AAF33 (2a:6f33) -> 1E 00
	ld a, $02 ; AAF35 (2a:6f35) -> 3E 02
	scall SetPersonVisibilityState ; AAF37 (2a:6f37) -> CD 3D 41
	ld e, $00 ; AAF3A (2a:6f3a) -> 1E 00
	ld a, $03 ; AAF3C (2a:6f3c) -> 3E 03
	scall SetPersonVisibilityState ; AAF3E (2a:6f3e) -> CD 3D 41
.asm_aaf41:
	jp .asm_aaf49 ; AAF41 (2a:6f41) -> C3 49 6F
.asm_aaf44:
	ld a, $08 ; AAF44 (2a:6f44) -> 3E 08
	scall PlayMusic ; AAF46 (2a:6f46) -> CD E6 4E
.asm_aaf49:
	scall Func_8001c ; AAF49 (2a:6f49) -> CD 1C 40
	ret  ; AAF4C (2a:6f4c) -> C9

Data_aaf4d:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $57, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $02, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aaf76:
	db $08, $04, $ff, $ff

Data_aaf7a:
	db $08, $04, $05, $04, $ff, $ff

Data_aaf80:
	db $05, $03, $ff, $ff

Func_aaf84:
	push de ; AAF84 (2a:6f84) -> D5
	ld hl, $00b3 ; AAF85 (2a:6f85) -> 21 B3 00
	scall CheckEventFlag ; AAF88 (2a:6f88) -> CD 2E 46
	or a ; AAF8B (2a:6f8b) -> B7
	jp nz, .asm_ab01b ; AAF8C (2a:6f8c) -> C2 1B 70
	ld hl, sp+$00 ; AAF8F (2a:6f8f) -> F8 00
	ld a, [hl] ; AAF91 (2a:6f91) -> 7E
	cp $02 ; AAF92 (2a:6f92) -> FE 02
	jp z, .asm_aaf9b ; AAF94 (2a:6f94) -> CA 9B 6F
	or a ; AAF97 (2a:6f97) -> B7
	jp nz, .asm_ab01b ; AAF98 (2a:6f98) -> C2 1B 70
.asm_aaf9b:
	ld a, [wMapY] ; AAF9B (2a:6f9b) -> FA D9 C2
	cp $ff ; AAF9E (2a:6f9e) -> FE FF
	jp nz, .asm_aafaa ; AAFA0 (2a:6fa0) -> C2 AA 6F
	xor a ; AAFA3 (2a:6fa3) -> AF
	scall FacePlayer ; AAFA4 (2a:6fa4) -> CD 4B 44
	jp .asm_aafb8 ; AAFA7 (2a:6fa7) -> C3 B8 6F
.asm_aafaa:
	ld c, $01 ; AAFAA (2a:6faa) -> 0E 01
	ld de, Data_aaf76 ; AAFAC (2a:6fac) -> 11 76 6F
	ld a, $2a ; AAFAF (2a:6faf) -> 3E 2A
	scall MovePlayer ; AAFB1 (2a:6fb1) -> CD 3E 46
	xor a ; AAFB4 (2a:6fb4) -> AF
	scall PlayerFace ; AAFB5 (2a:6fb5) -> CD 77 46
.asm_aafb8:
	xor a ; AAFB8 (2a:6fb8) -> AF
	scall PlayMusic ; AAFB9 (2a:6fb9) -> CD E6 4E
	ld a, $1a ; AAFBC (2a:6fbc) -> 3E 1A
	scall PlayMusic ; AAFBE (2a:6fbe) -> CD E6 4E
	ld hl, $010e ; AAFC1 (2a:6fc1) -> 21 0E 01
	scall PrintTextStandard ; AAFC4 (2a:6fc4) -> CD 98 44
	ld de, Data_ab01d ; AAFC7 (2a:6fc7) -> 11 1D 70
	ld hl, Data_aaf4d ; AAFCA (2a:6fca) -> 21 4D 6F
	scall ScriptedBattle ; AAFCD (2a:6fcd) -> CD D3 4D
	or a ; AAFD0 (2a:6fd0) -> B7
	jp nz, .asm_aafd7 ; AAFD1 (2a:6fd1) -> C2 D7 6F
	jp .asm_ab01b ; AAFD4 (2a:6fd4) -> C3 1B 70
.asm_aafd7:
	ld hl, $010f ; AAFD7 (2a:6fd7) -> 21 0F 01
	scall PrintTextStandard ; AAFDA (2a:6fda) -> CD 98 44
	ld a, [wMapY] ; AAFDD (2a:6fdd) -> FA D9 C2
	cp $ff ; AAFE0 (2a:6fe0) -> FE FF
	jp nz, .asm_aaff1 ; AAFE2 (2a:6fe2) -> C2 F1 6F
	ld bc, Data_aaf7a ; AAFE5 (2a:6fe5) -> 01 7A 6F
	ld e, $2a ; AAFE8 (2a:6fe8) -> 1E 2A
	xor a ; AAFEA (2a:6fea) -> AF
	scall MovePersonAndWait ; AAFEB (2a:6feb) -> CD 88 46
	jp .asm_aaffa ; AAFEE (2a:6fee) -> C3 FA 6F
.asm_aaff1:
	ld bc, Data_aaf80 ; AAFF1 (2a:6ff1) -> 01 80 6F
	ld e, $2a ; AAFF4 (2a:6ff4) -> 1E 2A
	xor a ; AAFF6 (2a:6ff6) -> AF
	scall MovePersonAndWait ; AAFF7 (2a:6ff7) -> CD 88 46
.asm_aaffa:
	scall WaitNPCStep ; AAFFA (2a:6ffa) -> CD 0C 42
	ld e, $00 ; AAFFD (2a:6ffd) -> 1E 00
	xor a ; AAFFF (2a:6fff) -> AF
	scall SetPersonVisibilityState ; AB000 (2a:7000) -> CD 3D 41
	ld e, $00 ; AB003 (2a:7003) -> 1E 00
	ld a, $01 ; AB005 (2a:7005) -> 3E 01
	scall SetPersonVisibilityState ; AB007 (2a:7007) -> CD 3D 41
	xor a ; AB00A (2a:700a) -> AF
	scall PlayMusic ; AB00B (2a:700b) -> CD E6 4E
	ld a, $04 ; AB00E (2a:700e) -> 3E 04
	scall PlayMusic ; AB010 (2a:7010) -> CD E6 4E
	ld e, $01 ; AB013 (2a:7013) -> 1E 01
	ld hl, $00b3 ; AB015 (2a:7015) -> 21 B3 00
	scall EventFlagAction ; AB018 (2a:7018) -> CD 1B 46
.asm_ab01b:
	pop bc ; AB01B (2a:701b) -> C1
	ret  ; AB01C (2a:701c) -> C9

Data_ab01d:
	dstr "(へいし)"

Data_ab023:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $24, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $22, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab04c:
	db $0a, $04, $ff, $ff

Data_ab050:
	db $0a, $04, $11, $04, $ff, $ff

Data_ab056:
	db $0c, $04, $11, $04, $ff, $ff

Func_ab05c:
	push de ; AB05C (2a:705c) -> D5
	ld hl, $00b4 ; AB05D (2a:705d) -> 21 B4 00
	scall CheckEventFlag ; AB060 (2a:7060) -> CD 2E 46
	or a ; AB063 (2a:7063) -> B7
	jp nz, .asm_ab0f7 ; AB064 (2a:7064) -> C2 F7 70
	ld hl, sp+$00 ; AB067 (2a:7067) -> F8 00
	ld a, [hl] ; AB069 (2a:7069) -> 7E
	cp $02 ; AB06A (2a:706a) -> FE 02
	jp z, .asm_ab073 ; AB06C (2a:706c) -> CA 73 70
	or a ; AB06F (2a:706f) -> B7
	jp nz, .asm_ab0f7 ; AB070 (2a:7070) -> C2 F7 70
.asm_ab073:
	ld a, [wMapY] ; AB073 (2a:7073) -> FA D9 C2
	cp $ff ; AB076 (2a:7076) -> FE FF
	jp nz, .asm_ab083 ; AB078 (2a:7078) -> C2 83 70
	ld a, $02 ; AB07B (2a:707b) -> 3E 02
	scall FacePlayer ; AB07D (2a:707d) -> CD 4B 44
	jp .asm_ab091 ; AB080 (2a:7080) -> C3 91 70
.asm_ab083:
	ld c, $01 ; AB083 (2a:7083) -> 0E 01
	ld de, Data_ab04c ; AB085 (2a:7085) -> 11 4C 70
	ld a, $2a ; AB088 (2a:7088) -> 3E 2A
	scall MovePlayer ; AB08A (2a:708a) -> CD 3E 46
	xor a ; AB08D (2a:708d) -> AF
	scall PlayerFace ; AB08E (2a:708e) -> CD 77 46
.asm_ab091:
	xor a ; AB091 (2a:7091) -> AF
	scall PlayMusic ; AB092 (2a:7092) -> CD E6 4E
	ld a, $1a ; AB095 (2a:7095) -> 3E 1A
	scall PlayMusic ; AB097 (2a:7097) -> CD E6 4E
	ld hl, $010b ; AB09A (2a:709a) -> 21 0B 01
	scall PrintTextStandard ; AB09D (2a:709d) -> CD 98 44
	ld de, Data_ab0f9 ; AB0A0 (2a:70a0) -> 11 F9 70
	ld hl, Data_ab023 ; AB0A3 (2a:70a3) -> 21 23 70
	scall ScriptedBattle ; AB0A6 (2a:70a6) -> CD D3 4D
	or a ; AB0A9 (2a:70a9) -> B7
	jp nz, .asm_ab0b0 ; AB0AA (2a:70aa) -> C2 B0 70
	jp .asm_ab0f7 ; AB0AD (2a:70ad) -> C3 F7 70
.asm_ab0b0:
	ld hl, $010f ; AB0B0 (2a:70b0) -> 21 0F 01
	scall PrintTextStandard ; AB0B3 (2a:70b3) -> CD 98 44
	ld a, [wMapY] ; AB0B6 (2a:70b6) -> FA D9 C2
	cp $ff ; AB0B9 (2a:70b9) -> FE FF
	jp nz, .asm_ab0cb ; AB0BB (2a:70bb) -> C2 CB 70
	ld bc, Data_ab050 ; AB0BE (2a:70be) -> 01 50 70
	ld e, $2a ; AB0C1 (2a:70c1) -> 1E 2A
	ld a, $02 ; AB0C3 (2a:70c3) -> 3E 02
	scall MovePersonAndWait ; AB0C5 (2a:70c5) -> CD 88 46
	jp .asm_ab0d5 ; AB0C8 (2a:70c8) -> C3 D5 70
.asm_ab0cb:
	ld bc, Data_ab056 ; AB0CB (2a:70cb) -> 01 56 70
	ld e, $2a ; AB0CE (2a:70ce) -> 1E 2A
	ld a, $02 ; AB0D0 (2a:70d0) -> 3E 02
	scall MovePersonAndWait ; AB0D2 (2a:70d2) -> CD 88 46
.asm_ab0d5:
	scall WaitNPCStep ; AB0D5 (2a:70d5) -> CD 0C 42
	ld e, $00 ; AB0D8 (2a:70d8) -> 1E 00
	ld a, $02 ; AB0DA (2a:70da) -> 3E 02
	scall SetPersonVisibilityState ; AB0DC (2a:70dc) -> CD 3D 41
	ld e, $00 ; AB0DF (2a:70df) -> 1E 00
	ld a, $03 ; AB0E1 (2a:70e1) -> 3E 03
	scall SetPersonVisibilityState ; AB0E3 (2a:70e3) -> CD 3D 41
	xor a ; AB0E6 (2a:70e6) -> AF
	scall PlayMusic ; AB0E7 (2a:70e7) -> CD E6 4E
	ld a, $04 ; AB0EA (2a:70ea) -> 3E 04
	scall PlayMusic ; AB0EC (2a:70ec) -> CD E6 4E
	ld e, $01 ; AB0EF (2a:70ef) -> 1E 01
	ld hl, $00b4 ; AB0F1 (2a:70f1) -> 21 B4 00
	scall EventFlagAction ; AB0F4 (2a:70f4) -> CD 1B 46
.asm_ab0f7:
	pop bc ; AB0F7 (2a:70f7) -> C1
	ret  ; AB0F8 (2a:70f8) -> C9

Data_ab0f9:
	dstr "(へいし)"

Data_ab0ff:
	warpdef $09, $18, $01, $01, MAP_25_02, $01, $04, $02, $04, $2e
	warpdef $09, $04, $01, $01, MAP_25_00, $05, $12, $06, $12, $2e

Data_ab115:
	db $3c, $01, $08, $03, $1c
	db $3d, $01, $0c, $01, $0f
	db $3e, $00, $09, $03, $1e
	db $3f, $00, $0b, $03, $1f

Data_ab129:
IF DEF(SUN)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_ab161:
	person_event $09, $0c, $08, $0e, $01, $01, $01, $04, $00, Func_ab24a, NULL
	person_event $ff, $00, $09, $0e, $02, $01, $00, $04, $01, Func_ab24a, NULL
	person_event $09, $0c, $08, $0c, $01, $01, $01, $04, $00, Func_ab327, NULL
	person_event $ff, $00, $09, $0c, $02, $01, $00, $04, $01, Func_ab327, NULL

Func_ab199:: ; ab199
	ld e, $02 ; AB199 (2a:7199) -> 1E 02
	ld hl, Data_ab0ff ; AB19B (2a:719b) -> 21 FF 70
	scall LoadWarps ; AB19E (2a:719e) -> CD 3A 40
	ld e, $04 ; AB1A1 (2a:71a1) -> 1E 04
	ld hl, Data_ab115 ; AB1A3 (2a:71a3) -> 21 15 71
	scall Func_80ce7 ; AB1A6 (2a:71a6) -> CD E7 4C
	ld a, $03 ; AB1A9 (2a:71a9) -> 3E 03
	scall Func_80d01 ; AB1AB (2a:71ab) -> CD 01 4D
	ld e, $04 ; AB1AE (2a:71ae) -> 1E 04
	ld hl, Data_ab129 ; AB1B0 (2a:71b0) -> 21 29 71
	scall LoadEncounters ; AB1B3 (2a:71b3) -> CD 24 4D
	ld hl, $0022 ; AB1B6 (2a:71b6) -> 21 22 00
	scall CheckEventFlag ; AB1B9 (2a:71b9) -> CD 2E 46
	cp $01 ; AB1BC (2a:71bc) -> FE 01
	jp nz, .asm_ab20a ; AB1BE (2a:71be) -> C2 0A 72
	ld hl, $0043 ; AB1C1 (2a:71c1) -> 21 43 00
	scall CheckEventFlag ; AB1C4 (2a:71c4) -> CD 2E 46
	or a ; AB1C7 (2a:71c7) -> B7
	jp nz, .asm_ab20a ; AB1C8 (2a:71c8) -> C2 0A 72
	ld e, $04 ; AB1CB (2a:71cb) -> 1E 04
	ld hl, Data_ab161 ; AB1CD (2a:71cd) -> 21 61 71
	scall LoadMapObjects ; AB1D0 (2a:71d0) -> CD FB 40
	ld a, $04 ; AB1D3 (2a:71d3) -> 3E 04
	scall PlayMusic ; AB1D5 (2a:71d5) -> CD E6 4E
	ld hl, $00b1 ; AB1D8 (2a:71d8) -> 21 B1 00
	scall CheckEventFlag ; AB1DB (2a:71db) -> CD 2E 46
	or a ; AB1DE (2a:71de) -> B7
	jp z, .asm_ab1ef ; AB1DF (2a:71df) -> CA EF 71
	ld e, $00 ; AB1E2 (2a:71e2) -> 1E 00
	xor a ; AB1E4 (2a:71e4) -> AF
	scall SetPersonVisibilityState ; AB1E5 (2a:71e5) -> CD 3D 41
	ld e, $00 ; AB1E8 (2a:71e8) -> 1E 00
	ld a, $01 ; AB1EA (2a:71ea) -> 3E 01
	scall SetPersonVisibilityState ; AB1EC (2a:71ec) -> CD 3D 41
.asm_ab1ef:
	ld hl, $00b2 ; AB1EF (2a:71ef) -> 21 B2 00
	scall CheckEventFlag ; AB1F2 (2a:71f2) -> CD 2E 46
	or a ; AB1F5 (2a:71f5) -> B7
	jp z, .asm_ab207 ; AB1F6 (2a:71f6) -> CA 07 72
	ld e, $00 ; AB1F9 (2a:71f9) -> 1E 00
	ld a, $02 ; AB1FB (2a:71fb) -> 3E 02
	scall SetPersonVisibilityState ; AB1FD (2a:71fd) -> CD 3D 41
	ld e, $00 ; AB200 (2a:7200) -> 1E 00
	ld a, $03 ; AB202 (2a:7202) -> 3E 03
	scall SetPersonVisibilityState ; AB204 (2a:7204) -> CD 3D 41
.asm_ab207:
	jp .asm_ab20f ; AB207 (2a:7207) -> C3 0F 72
.asm_ab20a:
	ld a, $08 ; AB20A (2a:720a) -> 3E 08
	scall PlayMusic ; AB20C (2a:720c) -> CD E6 4E
.asm_ab20f:
	scall Func_8001c ; AB20F (2a:720f) -> CD 1C 40
	ret  ; AB212 (2a:7212) -> C9

Data_ab213:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_ab23c:
	db $09, $0e, $ff, $ff

Data_ab240:
	db $09, $0e, $09, $15, $ff, $ff

Data_ab246:
	db $08, $15, $ff, $ff

Func_ab24a:
	push de ; AB24A (2a:724a) -> D5
	ld hl, $00b1 ; AB24B (2a:724b) -> 21 B1 00
	scall CheckEventFlag ; AB24E (2a:724e) -> CD 2E 46
	or a ; AB251 (2a:7251) -> B7
	jp nz, .asm_ab2e8 ; AB252 (2a:7252) -> C2 E8 72
	ld hl, sp+$00 ; AB255 (2a:7255) -> F8 00
	ld a, [hl] ; AB257 (2a:7257) -> 7E
	cp $02 ; AB258 (2a:7258) -> FE 02
	jp z, .asm_ab261 ; AB25A (2a:725a) -> CA 61 72
	or a ; AB25D (2a:725d) -> B7
	jp nz, .asm_ab2e8 ; AB25E (2a:725e) -> C2 E8 72
.asm_ab261:
	ld a, [wMapX] ; AB261 (2a:7261) -> FA D8 C2
	add a, $05 ; AB264 (2a:7264) -> C6 05
	cp $08 ; AB266 (2a:7266) -> FE 08
	jp nz, .asm_ab272 ; AB268 (2a:7268) -> C2 72 72
	xor a ; AB26B (2a:726b) -> AF
	scall FacePlayer ; AB26C (2a:726c) -> CD 4B 44
	jp .asm_ab281 ; AB26F (2a:726f) -> C3 81 72
.asm_ab272:
	ld c, $01 ; AB272 (2a:7272) -> 0E 01
	ld de, Data_ab23c ; AB274 (2a:7274) -> 11 3C 72
	ld a, $2a ; AB277 (2a:7277) -> 3E 2A
	scall MovePlayer ; AB279 (2a:7279) -> CD 3E 46
	ld a, $03 ; AB27C (2a:727c) -> 3E 03
	scall PlayerFace ; AB27E (2a:727e) -> CD 77 46
.asm_ab281:
	xor a ; AB281 (2a:7281) -> AF
	scall PlayMusic ; AB282 (2a:7282) -> CD E6 4E
	ld a, $1a ; AB285 (2a:7285) -> 3E 1A
	scall PlayMusic ; AB287 (2a:7287) -> CD E6 4E
	ld hl, $010c ; AB28A (2a:728a) -> 21 0C 01
	scall PrintTextStandard ; AB28D (2a:728d) -> CD 98 44
	ld de, Data_ab2ea ; AB290 (2a:7290) -> 11 EA 72
	ld hl, Data_ab213 ; AB293 (2a:7293) -> 21 13 72
	scall ScriptedBattle ; AB296 (2a:7296) -> CD D3 4D
	or a ; AB299 (2a:7299) -> B7
	jp nz, .asm_ab2a0 ; AB29A (2a:729a) -> C2 A0 72
	jp .asm_ab2e8 ; AB29D (2a:729d) -> C3 E8 72
.asm_ab2a0:
	ld hl, $010f ; AB2A0 (2a:72a0) -> 21 0F 01
	scall PrintTextStandard ; AB2A3 (2a:72a3) -> CD 98 44
	ld a, [wPlayerFacing] ; AB2A6 (2a:72a6) -> FA 38 C8
	cp $02 ; AB2A9 (2a:72a9) -> FE 02
	jp z, .asm_ab2b2 ; AB2AB (2a:72ab) -> CA B2 72
	or a ; AB2AE (2a:72ae) -> B7
	jp nz, .asm_ab2be ; AB2AF (2a:72af) -> C2 BE 72
.asm_ab2b2:
	ld bc, Data_ab240 ; AB2B2 (2a:72b2) -> 01 40 72
	ld e, $2a ; AB2B5 (2a:72b5) -> 1E 2A
	xor a ; AB2B7 (2a:72b7) -> AF
	scall MovePersonAndWait ; AB2B8 (2a:72b8) -> CD 88 46
	jp .asm_ab2c7 ; AB2BB (2a:72bb) -> C3 C7 72
.asm_ab2be:
	ld bc, Data_ab246 ; AB2BE (2a:72be) -> 01 46 72
	ld e, $2a ; AB2C1 (2a:72c1) -> 1E 2A
	xor a ; AB2C3 (2a:72c3) -> AF
	scall MovePersonAndWait ; AB2C4 (2a:72c4) -> CD 88 46
.asm_ab2c7:
	scall WaitNPCStep ; AB2C7 (2a:72c7) -> CD 0C 42
	ld e, $00 ; AB2CA (2a:72ca) -> 1E 00
	xor a ; AB2CC (2a:72cc) -> AF
	scall SetPersonVisibilityState ; AB2CD (2a:72cd) -> CD 3D 41
	ld e, $00 ; AB2D0 (2a:72d0) -> 1E 00
	ld a, $01 ; AB2D2 (2a:72d2) -> 3E 01
	scall SetPersonVisibilityState ; AB2D4 (2a:72d4) -> CD 3D 41
	xor a ; AB2D7 (2a:72d7) -> AF
	scall PlayMusic ; AB2D8 (2a:72d8) -> CD E6 4E
	ld a, $04 ; AB2DB (2a:72db) -> 3E 04
	scall PlayMusic ; AB2DD (2a:72dd) -> CD E6 4E
	ld e, $01 ; AB2E0 (2a:72e0) -> 1E 01
	ld hl, $00b1 ; AB2E2 (2a:72e2) -> 21 B1 00
	scall EventFlagAction ; AB2E5 (2a:72e5) -> CD 1B 46
.asm_ab2e8:
	pop bc ; AB2E8 (2a:72e8) -> C1
	ret  ; AB2E9 (2a:72e9) -> C9

Data_ab2ea:
	dstr "(へいし)"

Data_ab2f0:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab319:
	db $09, $0c, $ff, $ff

Data_ab31d:
	db $09, $0c, $09, $06, $ff, $ff

Data_ab323:
	db $08, $06, $ff, $ff

Func_ab327:
	push de ; AB327 (2a:7327) -> D5
	ld hl, $00b2 ; AB328 (2a:7328) -> 21 B2 00
	scall CheckEventFlag ; AB32B (2a:732b) -> CD 2E 46
	or a ; AB32E (2a:732e) -> B7
	jp nz, .asm_ab3c9 ; AB32F (2a:732f) -> C2 C9 73
	ld hl, sp+$00 ; AB332 (2a:7332) -> F8 00
	ld a, [hl] ; AB334 (2a:7334) -> 7E
	cp $02 ; AB335 (2a:7335) -> FE 02
	jp z, .asm_ab33e ; AB337 (2a:7337) -> CA 3E 73
	or a ; AB33A (2a:733a) -> B7
	jp nz, .asm_ab3c9 ; AB33B (2a:733b) -> C2 C9 73
.asm_ab33e:
	ld a, [wMapX] ; AB33E (2a:733e) -> FA D8 C2
	add a, $05 ; AB341 (2a:7341) -> C6 05
	cp $08 ; AB343 (2a:7343) -> FE 08
	jp nz, .asm_ab350 ; AB345 (2a:7345) -> C2 50 73
	ld a, $02 ; AB348 (2a:7348) -> 3E 02
	scall FacePlayer ; AB34A (2a:734a) -> CD 4B 44
	jp .asm_ab35f ; AB34D (2a:734d) -> C3 5F 73
.asm_ab350:
	ld c, $01 ; AB350 (2a:7350) -> 0E 01
	ld de, Data_ab319 ; AB352 (2a:7352) -> 11 19 73
	ld a, $2a ; AB355 (2a:7355) -> 3E 2A
	scall MovePlayer ; AB357 (2a:7357) -> CD 3E 46
	ld a, $03 ; AB35A (2a:735a) -> 3E 03
	scall PlayerFace ; AB35C (2a:735c) -> CD 77 46
.asm_ab35f:
	xor a ; AB35F (2a:735f) -> AF
	scall PlayMusic ; AB360 (2a:7360) -> CD E6 4E
	ld a, $1a ; AB363 (2a:7363) -> 3E 1A
	scall PlayMusic ; AB365 (2a:7365) -> CD E6 4E
	ld hl, $010d ; AB368 (2a:7368) -> 21 0D 01
	scall PrintTextStandard ; AB36B (2a:736b) -> CD 98 44
	ld de, Data_ab3cb ; AB36E (2a:736e) -> 11 CB 73
	ld hl, Data_ab2f0 ; AB371 (2a:7371) -> 21 F0 72
	scall ScriptedBattle ; AB374 (2a:7374) -> CD D3 4D
	or a ; AB377 (2a:7377) -> B7
	jp nz, .asm_ab37e ; AB378 (2a:7378) -> C2 7E 73
	jp .asm_ab3c9 ; AB37B (2a:737b) -> C3 C9 73
.asm_ab37e:
	ld hl, $010f ; AB37E (2a:737e) -> 21 0F 01
	scall PrintTextStandard ; AB381 (2a:7381) -> CD 98 44
	ld a, [wPlayerFacing] ; AB384 (2a:7384) -> FA 38 C8
	cp $02 ; AB387 (2a:7387) -> FE 02
	jp z, .asm_ab390 ; AB389 (2a:7389) -> CA 90 73
	or a ; AB38C (2a:738c) -> B7
	jp nz, .asm_ab39d ; AB38D (2a:738d) -> C2 9D 73
.asm_ab390:
	ld bc, Data_ab31d ; AB390 (2a:7390) -> 01 1D 73
	ld e, $2a ; AB393 (2a:7393) -> 1E 2A
	ld a, $02 ; AB395 (2a:7395) -> 3E 02
	scall MovePersonAndWait ; AB397 (2a:7397) -> CD 88 46
	jp .asm_ab3a7 ; AB39A (2a:739a) -> C3 A7 73
.asm_ab39d:
	ld bc, Data_ab323 ; AB39D (2a:739d) -> 01 23 73
	ld e, $2a ; AB3A0 (2a:73a0) -> 1E 2A
	ld a, $02 ; AB3A2 (2a:73a2) -> 3E 02
	scall MovePersonAndWait ; AB3A4 (2a:73a4) -> CD 88 46
.asm_ab3a7:
	scall WaitNPCStep ; AB3A7 (2a:73a7) -> CD 0C 42
	ld e, $00 ; AB3AA (2a:73aa) -> 1E 00
	ld a, $02 ; AB3AC (2a:73ac) -> 3E 02
	scall SetPersonVisibilityState ; AB3AE (2a:73ae) -> CD 3D 41
	ld e, $00 ; AB3B1 (2a:73b1) -> 1E 00
	ld a, $03 ; AB3B3 (2a:73b3) -> 3E 03
	scall SetPersonVisibilityState ; AB3B5 (2a:73b5) -> CD 3D 41
	xor a ; AB3B8 (2a:73b8) -> AF
	scall PlayMusic ; AB3B9 (2a:73b9) -> CD E6 4E
	ld a, $04 ; AB3BC (2a:73bc) -> 3E 04
	scall PlayMusic ; AB3BE (2a:73be) -> CD E6 4E
	ld e, $01 ; AB3C1 (2a:73c1) -> 1E 01
	ld hl, $00b2 ; AB3C3 (2a:73c3) -> 21 B2 00
	scall EventFlagAction ; AB3C6 (2a:73c6) -> CD 1B 46
.asm_ab3c9:
	pop bc ; AB3C9 (2a:73c9) -> C1
	ret  ; AB3CA (2a:73ca) -> C9

Data_ab3cb:
	dstr "(へいし)"

Data_ab3d1:
	warpdef $01, $04, $01, $01, MAP_25_00, $0c, $12, $0b, $12, $2e
	warpdef $01, $18, $01, $01, MAP_25_03, $11, $04, $10, $04, $2e

Data_ab3e7:
	db $40, $09, $08, $01, $0f
	db $41, $09, $0c, $01, $36
	db $42, $0a, $09, $01, $4a
	db $43, $0a, $0b, $01, $42

Data_ab3fb:
IF DEF(SUN)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_ab433:
	person_event $09, $0c, $00, $0e, $01, $01, $01, $04, $00, Func_ab51a, NULL
	person_event $ff, $00, $01, $0e, $02, $01, $00, $04, $01, Func_ab51a, NULL
	person_event $09, $0c, $00, $0c, $01, $01, $01, $04, $00, Func_ab5f4, NULL
	person_event $ff, $00, $01, $0c, $02, $01, $00, $04, $01, Func_ab5f4, NULL

Func_ab46b:: ; ab46b
	ld e, $02 ; AB46B (2a:746b) -> 1E 02
	ld hl, Data_ab3d1 ; AB46D (2a:746d) -> 21 D1 73
	scall LoadWarps ; AB470 (2a:7470) -> CD 3A 40
	ld e, $04 ; AB473 (2a:7473) -> 1E 04
	ld hl, Data_ab3e7 ; AB475 (2a:7475) -> 21 E7 73
	scall Func_80ce7 ; AB478 (2a:7478) -> CD E7 4C
	ld a, $03 ; AB47B (2a:747b) -> 3E 03
	scall Func_80d01 ; AB47D (2a:747d) -> CD 01 4D
	ld e, $04 ; AB480 (2a:7480) -> 1E 04
	ld hl, Data_ab3fb ; AB482 (2a:7482) -> 21 FB 73
	scall LoadEncounters ; AB485 (2a:7485) -> CD 24 4D
	ld hl, $0022 ; AB488 (2a:7488) -> 21 22 00
	scall CheckEventFlag ; AB48B (2a:748b) -> CD 2E 46
	cp $01 ; AB48E (2a:748e) -> FE 01
	jp nz, .asm_ab4dc ; AB490 (2a:7490) -> C2 DC 74
	ld hl, $0043 ; AB493 (2a:7493) -> 21 43 00
	scall CheckEventFlag ; AB496 (2a:7496) -> CD 2E 46
	or a ; AB499 (2a:7499) -> B7
	jp nz, .asm_ab4dc ; AB49A (2a:749a) -> C2 DC 74
	ld e, $04 ; AB49D (2a:749d) -> 1E 04
	ld hl, Data_ab433 ; AB49F (2a:749f) -> 21 33 74
	scall LoadMapObjects ; AB4A2 (2a:74a2) -> CD FB 40
	ld a, $04 ; AB4A5 (2a:74a5) -> 3E 04
	scall PlayMusic ; AB4A7 (2a:74a7) -> CD E6 4E
	ld hl, $00b5 ; AB4AA (2a:74aa) -> 21 B5 00
	scall CheckEventFlag ; AB4AD (2a:74ad) -> CD 2E 46
	or a ; AB4B0 (2a:74b0) -> B7
	jp z, .asm_ab4c1 ; AB4B1 (2a:74b1) -> CA C1 74
	ld e, $00 ; AB4B4 (2a:74b4) -> 1E 00
	xor a ; AB4B6 (2a:74b6) -> AF
	scall SetPersonVisibilityState ; AB4B7 (2a:74b7) -> CD 3D 41
	ld e, $00 ; AB4BA (2a:74ba) -> 1E 00
	ld a, $01 ; AB4BC (2a:74bc) -> 3E 01
	scall SetPersonVisibilityState ; AB4BE (2a:74be) -> CD 3D 41
.asm_ab4c1:
	ld hl, $00b6 ; AB4C1 (2a:74c1) -> 21 B6 00
	scall CheckEventFlag ; AB4C4 (2a:74c4) -> CD 2E 46
	or a ; AB4C7 (2a:74c7) -> B7
	jp z, .asm_ab4d9 ; AB4C8 (2a:74c8) -> CA D9 74
	ld e, $00 ; AB4CB (2a:74cb) -> 1E 00
	ld a, $02 ; AB4CD (2a:74cd) -> 3E 02
	scall SetPersonVisibilityState ; AB4CF (2a:74cf) -> CD 3D 41
	ld e, $00 ; AB4D2 (2a:74d2) -> 1E 00
	ld a, $03 ; AB4D4 (2a:74d4) -> 3E 03
	scall SetPersonVisibilityState ; AB4D6 (2a:74d6) -> CD 3D 41
.asm_ab4d9:
	jp .asm_ab4e1 ; AB4D9 (2a:74d9) -> C3 E1 74
.asm_ab4dc:
	ld a, $08 ; AB4DC (2a:74dc) -> 3E 08
	scall PlayMusic ; AB4DE (2a:74de) -> CD E6 4E
.asm_ab4e1:
	scall Func_8001c ; AB4E1 (2a:74e1) -> CD 1C 40
	ret  ; AB4E4 (2a:74e4) -> C9

Data_ab4e5:
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $09, $01, $09, $06, $29, $04, $0f, $00, $05, $0c, $06, $29, $01
	db $05, $00, $05, $3c, $06, $29, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c

Data_ab50e:
	db $01, $0e, $ff, $ff

Data_ab512:
	db $01, $14, $ff, $ff

Data_ab516:
	db $00, $14, $ff, $ff

Func_ab51a:
	push de ; AB51A (2a:751a) -> D5
	ld hl, $00b5 ; AB51B (2a:751b) -> 21 B5 00
	scall CheckEventFlag ; AB51E (2a:751e) -> CD 2E 46
	or a ; AB521 (2a:7521) -> B7
	jp nz, .asm_ab5b7 ; AB522 (2a:7522) -> C2 B7 75
	ld hl, sp+$00 ; AB525 (2a:7525) -> F8 00
	ld a, [hl] ; AB527 (2a:7527) -> 7E
	cp $02 ; AB528 (2a:7528) -> FE 02
	jp z, .asm_ab531 ; AB52A (2a:752a) -> CA 31 75
	or a ; AB52D (2a:752d) -> B7
	jp nz, .asm_ab5b7 ; AB52E (2a:752e) -> C2 B7 75
.asm_ab531:
	ld a, [wMapX] ; AB531 (2a:7531) -> FA D8 C2
	add a, $05 ; AB534 (2a:7534) -> C6 05
	or a ; AB536 (2a:7536) -> B7
	jp nz, .asm_ab541 ; AB537 (2a:7537) -> C2 41 75
	xor a ; AB53A (2a:753a) -> AF
	scall FacePlayer ; AB53B (2a:753b) -> CD 4B 44
	jp .asm_ab550 ; AB53E (2a:753e) -> C3 50 75
.asm_ab541:
	ld c, $01 ; AB541 (2a:7541) -> 0E 01
	ld de, Data_ab50e ; AB543 (2a:7543) -> 11 0E 75
	ld a, $2a ; AB546 (2a:7546) -> 3E 2A
	scall MovePlayer ; AB548 (2a:7548) -> CD 3E 46
	ld a, $03 ; AB54B (2a:754b) -> 3E 03
	scall PlayerFace ; AB54D (2a:754d) -> CD 77 46
.asm_ab550:
	xor a ; AB550 (2a:7550) -> AF
	scall PlayMusic ; AB551 (2a:7551) -> CD E6 4E
	ld a, $1a ; AB554 (2a:7554) -> 3E 1A
	scall PlayMusic ; AB556 (2a:7556) -> CD E6 4E
	ld hl, $010c ; AB559 (2a:7559) -> 21 0C 01
	scall PrintTextStandard ; AB55C (2a:755c) -> CD 98 44
	ld de, Data_ab5b9 ; AB55F (2a:755f) -> 11 B9 75
	ld hl, Data_ab4e5 ; AB562 (2a:7562) -> 21 E5 74
	scall ScriptedBattle ; AB565 (2a:7565) -> CD D3 4D
	or a ; AB568 (2a:7568) -> B7
	jp nz, .asm_ab56f ; AB569 (2a:7569) -> C2 6F 75
	jp .asm_ab5b7 ; AB56C (2a:756c) -> C3 B7 75
.asm_ab56f:
	ld hl, $010f ; AB56F (2a:756f) -> 21 0F 01
	scall PrintTextStandard ; AB572 (2a:7572) -> CD 98 44
	ld a, [wPlayerFacing] ; AB575 (2a:7575) -> FA 38 C8
	cp $02 ; AB578 (2a:7578) -> FE 02
	jp z, .asm_ab581 ; AB57A (2a:757a) -> CA 81 75
	or a ; AB57D (2a:757d) -> B7
	jp nz, .asm_ab58d ; AB57E (2a:757e) -> C2 8D 75
.asm_ab581:
	ld bc, Data_ab512 ; AB581 (2a:7581) -> 01 12 75
	ld e, $2a ; AB584 (2a:7584) -> 1E 2A
	xor a ; AB586 (2a:7586) -> AF
	scall MovePersonAndWait ; AB587 (2a:7587) -> CD 88 46
	jp .asm_ab596 ; AB58A (2a:758a) -> C3 96 75
.asm_ab58d:
	ld bc, Data_ab516 ; AB58D (2a:758d) -> 01 16 75
	ld e, $2a ; AB590 (2a:7590) -> 1E 2A
	xor a ; AB592 (2a:7592) -> AF
	scall MovePersonAndWait ; AB593 (2a:7593) -> CD 88 46
.asm_ab596:
	scall WaitNPCStep ; AB596 (2a:7596) -> CD 0C 42
	ld e, $00 ; AB599 (2a:7599) -> 1E 00
	xor a ; AB59B (2a:759b) -> AF
	scall SetPersonVisibilityState ; AB59C (2a:759c) -> CD 3D 41
	ld e, $00 ; AB59F (2a:759f) -> 1E 00
	ld a, $01 ; AB5A1 (2a:75a1) -> 3E 01
	scall SetPersonVisibilityState ; AB5A3 (2a:75a3) -> CD 3D 41
	xor a ; AB5A6 (2a:75a6) -> AF
	scall PlayMusic ; AB5A7 (2a:75a7) -> CD E6 4E
	ld a, $04 ; AB5AA (2a:75aa) -> 3E 04
	scall PlayMusic ; AB5AC (2a:75ac) -> CD E6 4E
	ld e, $01 ; AB5AF (2a:75af) -> 1E 01
	ld hl, $00b5 ; AB5B1 (2a:75b1) -> 21 B5 00
	scall EventFlagAction ; AB5B4 (2a:75b4) -> CD 1B 46
.asm_ab5b7:
	pop bc ; AB5B7 (2a:75b7) -> C1
	ret  ; AB5B8 (2a:75b8) -> C9

Data_ab5b9:
	dstr "(へいし)"

Data_ab5bf:
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0b, $01, $08
	db $06, $29, $03, $0f, $00, $05, $0b, $06, $29, $05, $17, $00, $05, $3c, $06, $29
	db $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_ab5e8:
	db $01, $0c, $ff, $ff

Data_ab5ec:
	db $01, $06, $ff, $ff

Data_ab5f0:
	db $00, $06, $ff, $ff

Func_ab5f4:
	push de ; AB5F4 (2a:75f4) -> D5
	ld hl, $00b6 ; AB5F5 (2a:75f5) -> 21 B6 00
	scall CheckEventFlag ; AB5F8 (2a:75f8) -> CD 2E 46
	or a ; AB5FB (2a:75fb) -> B7
	jp nz, .asm_ab695 ; AB5FC (2a:75fc) -> C2 95 76
	ld hl, sp+$00 ; AB5FF (2a:75ff) -> F8 00
	ld a, [hl] ; AB601 (2a:7601) -> 7E
	cp $02 ; AB602 (2a:7602) -> FE 02
	jp z, .asm_ab60b ; AB604 (2a:7604) -> CA 0B 76
	or a ; AB607 (2a:7607) -> B7
	jp nz, .asm_ab695 ; AB608 (2a:7608) -> C2 95 76
.asm_ab60b:
	ld a, [wMapX] ; AB60B (2a:760b) -> FA D8 C2
	add a, $05 ; AB60E (2a:760e) -> C6 05
	or a ; AB610 (2a:7610) -> B7
	jp nz, .asm_ab61c ; AB611 (2a:7611) -> C2 1C 76
	ld a, $02 ; AB614 (2a:7614) -> 3E 02
	scall FacePlayer ; AB616 (2a:7616) -> CD 4B 44
	jp .asm_ab62b ; AB619 (2a:7619) -> C3 2B 76
.asm_ab61c:
	ld c, $01 ; AB61C (2a:761c) -> 0E 01
	ld de, Data_ab5e8 ; AB61E (2a:761e) -> 11 E8 75
	ld a, $2a ; AB621 (2a:7621) -> 3E 2A
	scall MovePlayer ; AB623 (2a:7623) -> CD 3E 46
	ld a, $03 ; AB626 (2a:7626) -> 3E 03
	scall PlayerFace ; AB628 (2a:7628) -> CD 77 46
.asm_ab62b:
	xor a ; AB62B (2a:762b) -> AF
	scall PlayMusic ; AB62C (2a:762c) -> CD E6 4E
	ld a, $1a ; AB62F (2a:762f) -> 3E 1A
	scall PlayMusic ; AB631 (2a:7631) -> CD E6 4E
	ld hl, $010e ; AB634 (2a:7634) -> 21 0E 01
	scall PrintTextStandard ; AB637 (2a:7637) -> CD 98 44
	ld de, Data_ab697 ; AB63A (2a:763a) -> 11 97 76
	ld hl, Data_ab5bf ; AB63D (2a:763d) -> 21 BF 75
	scall ScriptedBattle ; AB640 (2a:7640) -> CD D3 4D
	or a ; AB643 (2a:7643) -> B7
	jp nz, .asm_ab64a ; AB644 (2a:7644) -> C2 4A 76
	jp .asm_ab695 ; AB647 (2a:7647) -> C3 95 76
.asm_ab64a:
	ld hl, $010f ; AB64A (2a:764a) -> 21 0F 01
	scall PrintTextStandard ; AB64D (2a:764d) -> CD 98 44
	ld a, [wPlayerFacing] ; AB650 (2a:7650) -> FA 38 C8
	cp $02 ; AB653 (2a:7653) -> FE 02
	jp z, .asm_ab65c ; AB655 (2a:7655) -> CA 5C 76
	or a ; AB658 (2a:7658) -> B7
	jp nz, .asm_ab669 ; AB659 (2a:7659) -> C2 69 76
.asm_ab65c:
	ld bc, Data_ab5ec ; AB65C (2a:765c) -> 01 EC 75
	ld e, $2a ; AB65F (2a:765f) -> 1E 2A
	ld a, $02 ; AB661 (2a:7661) -> 3E 02
	scall MovePersonAndWait ; AB663 (2a:7663) -> CD 88 46
	jp .asm_ab673 ; AB666 (2a:7666) -> C3 73 76
.asm_ab669:
	ld bc, Data_ab5f0 ; AB669 (2a:7669) -> 01 F0 75
	ld e, $2a ; AB66C (2a:766c) -> 1E 2A
	ld a, $02 ; AB66E (2a:766e) -> 3E 02
	scall MovePersonAndWait ; AB670 (2a:7670) -> CD 88 46
.asm_ab673:
	scall WaitNPCStep ; AB673 (2a:7673) -> CD 0C 42
	ld e, $00 ; AB676 (2a:7676) -> 1E 00
	ld a, $02 ; AB678 (2a:7678) -> 3E 02
	scall SetPersonVisibilityState ; AB67A (2a:767a) -> CD 3D 41
	ld e, $00 ; AB67D (2a:767d) -> 1E 00
	ld a, $03 ; AB67F (2a:767f) -> 3E 03
	scall SetPersonVisibilityState ; AB681 (2a:7681) -> CD 3D 41
	xor a ; AB684 (2a:7684) -> AF
	scall PlayMusic ; AB685 (2a:7685) -> CD E6 4E
	ld a, $04 ; AB688 (2a:7688) -> 3E 04
	scall PlayMusic ; AB68A (2a:768a) -> CD E6 4E
	ld e, $01 ; AB68D (2a:768d) -> 1E 01
	ld hl, $00b6 ; AB68F (2a:768f) -> 21 B6 00
	scall EventFlagAction ; AB692 (2a:7692) -> CD 1B 46
.asm_ab695:
	pop bc ; AB695 (2a:7695) -> C1
	ret  ; AB696 (2a:7696) -> C9

Data_ab697:
	dstr "(へいし)"

Data_ab69d:
	warpdef $0e, $1b, $04, $01, MAP_25_20, $0f, $05, $0f, $06, $2e

Data_ab6a8:
	db $22, $01, $ff, $ff

Data_ab6ac:
	db $b3, $02, $ff, $ff

Data_ab6b0:
	db $1a, $04, $ff, $ff

Data_ab6b4:
	person_event $23, $0c, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0d, $0c, $0f, $05, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6a8
	person_event $1a, $0c, $09, $10, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $0c, $0d, $0c, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $11, $0c, $01, $01, $02, $04, $00, NULL, NULL

Data_ab6fa:
	person_event $0d, $04, $0f, $07, $01, $01, $02, $04, $00, Func_abf5b, NULL
	person_event $23, $04, $10, $07, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6b0
	person_event $1c, $04, $10, $07, $01, $01, $02, $04, $00, NULL, NULL

Data_ab724:
	person_event $0d, $04, $0f, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $00, $04, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0c, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0c, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0e, $01, $01, $03, $04, $00, NULL, NULL

Data_ab794:
	person_event $ff, $00, $0c, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac
	person_event $ff, $00, $13, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac

Data_ab7b0:
	person_event $0f, $04, $16, $14, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $16, $14, $01, $01, $02, $04, $00, Func_abe67, NULL

Func_ab7cc:: ; ab7cc
	ld e, $02 ; AB7CC (2a:77cc) -> 1E 02
	ld hl, Data_ab7b0 ; AB7CE (2a:77ce) -> 21 B0 77
	scall LoadMapObjects ; AB7D1 (2a:77d1) -> CD FB 40
	ld e, $00 ; AB7D4 (2a:77d4) -> 1E 00
	xor a ; AB7D6 (2a:77d6) -> AF
	scall SetPersonVisibilityState ; AB7D7 (2a:77d7) -> CD 3D 41
	ld a, [wBackupMapGroup] ; AB7DA (2a:77da) -> FA DF C7
	or a ; AB7DD (2a:77dd) -> B7
	jp nz, .asm_ab7e9 ; AB7DE (2a:77de) -> C2 E9 77
	ld a, [wBackupMapNumber] ; AB7E1 (2a:77e1) -> FA E0 C7
	cp $02 ; AB7E4 (2a:77e4) -> FE 02
	jp z, .asm_ab7f9 ; AB7E6 (2a:77e6) -> CA F9 77
.asm_ab7e9:
	ld a, [wBackupMapGroup] ; AB7E9 (2a:77e9) -> FA DF C7
	cp $1e ; AB7EC (2a:77ec) -> FE 1E
	jp nz, .asm_ab804 ; AB7EE (2a:77ee) -> C2 04 78
	ld a, [wBackupMapNumber] ; AB7F1 (2a:77f1) -> FA E0 C7
	cp $0e ; AB7F4 (2a:77f4) -> FE 0E
	jp nz, .asm_ab804 ; AB7F6 (2a:77f6) -> C2 04 78
.asm_ab7f9:
	ld e, $08 ; AB7F9 (2a:77f9) -> 1E 08
	ld hl, Data_ab724 ; AB7FB (2a:77fb) -> 21 24 77
	scall LoadMapObjects ; AB7FE (2a:77fe) -> CD FB 40
	jp .asm_ab860 ; AB801 (2a:7801) -> C3 60 78
.asm_ab804:
	ld e, $01 ; AB804 (2a:7804) -> 1E 01
	ld hl, Data_ab69d ; AB806 (2a:7806) -> 21 9D 76
	scall LoadWarps ; AB809 (2a:7809) -> CD 3A 40
	ld hl, $0043 ; AB80C (2a:780c) -> 21 43 00
	scall CheckEventFlag ; AB80F (2a:780f) -> CD 2E 46
	or a ; AB812 (2a:7812) -> B7
	jp nz, .asm_ab829 ; AB813 (2a:7813) -> C2 29 78
	ld e, $05 ; AB816 (2a:7816) -> 1E 05
	ld hl, Data_ab6b4 ; AB818 (2a:7818) -> 21 B4 76
	scall LoadMapObjects ; AB81B (2a:781b) -> CD FB 40
	ld e, $02 ; AB81E (2a:781e) -> 1E 02
	ld hl, Data_ab794 ; AB820 (2a:7820) -> 21 94 77
	scall LoadMapObjects ; AB823 (2a:7823) -> CD FB 40
	jp .asm_ab860 ; AB826 (2a:7826) -> C3 60 78
.asm_ab829:
	ld hl, $0023 ; AB829 (2a:7829) -> 21 23 00
	scall CheckEventFlag ; AB82C (2a:782c) -> CD 2E 46
	cp $01 ; AB82F (2a:782f) -> FE 01
	jp nz, .asm_ab858 ; AB831 (2a:7831) -> C2 58 78
	ld hl, $0048 ; AB834 (2a:7834) -> 21 48 00
	scall CheckEventFlag ; AB837 (2a:7837) -> CD 2E 46
	or a ; AB83A (2a:783a) -> B7
	jp nz, .asm_ab858 ; AB83B (2a:783b) -> C2 58 78
	ld e, $03 ; AB83E (2a:783e) -> 1E 03
	ld hl, Data_ab6fa ; AB840 (2a:7840) -> 21 FA 76
	scall LoadMapObjects ; AB843 (2a:7843) -> CD FB 40
	ld e, $02 ; AB846 (2a:7846) -> 1E 02
	ld hl, Data_ab794 ; AB848 (2a:7848) -> 21 94 77
	scall LoadMapObjects ; AB84B (2a:784b) -> CD FB 40
	ld e, $00 ; AB84E (2a:784e) -> 1E 00
	ld a, $03 ; AB850 (2a:7850) -> 3E 03
	scall SetPersonVisibilityState ; AB852 (2a:7852) -> CD 3D 41
	jp .asm_ab860 ; AB855 (2a:7855) -> C3 60 78
.asm_ab858:
	ld e, $02 ; AB858 (2a:7858) -> 1E 02
	ld hl, Data_ab794 ; AB85A (2a:785a) -> 21 94 77
	scall LoadMapObjects ; AB85D (2a:785d) -> CD FB 40
.asm_ab860:
	ld a, [wBackupMapGroup] ; AB860 (2a:7860) -> FA DF C7
	or a ; AB863 (2a:7863) -> B7
	jp nz, .asm_ab86f ; AB864 (2a:7864) -> C2 6F 78
	ld a, [wBackupMapNumber] ; AB867 (2a:7867) -> FA E0 C7
	cp $02 ; AB86A (2a:786a) -> FE 02
	jp z, .asm_ab87f ; AB86C (2a:786c) -> CA 7F 78
.asm_ab86f:
	ld a, [wBackupMapGroup] ; AB86F (2a:786f) -> FA DF C7
	cp $1e ; AB872 (2a:7872) -> FE 1E
	jp nz, .asm_ab88a ; AB874 (2a:7874) -> C2 8A 78
	ld a, [wBackupMapNumber] ; AB877 (2a:7877) -> FA E0 C7
	cp $0e ; AB87A (2a:787a) -> FE 0E
	jp nz, .asm_ab88a ; AB87C (2a:787c) -> C2 8A 78
.asm_ab87f:
	ld a, $03 ; AB87F (2a:787f) -> 3E 03
	scall PlayMusic ; AB881 (2a:7881) -> CD E6 4E
	call Func_abc22 ; AB884 (2a:7884) -> CD 22 7C
	jp .asm_ab8c8 ; AB887 (2a:7887) -> C3 C8 78
.asm_ab88a:
	ld hl, $0043 ; AB88A (2a:788a) -> 21 43 00
	scall CheckEventFlag ; AB88D (2a:788d) -> CD 2E 46
	or a ; AB890 (2a:7890) -> B7
	jp nz, .asm_ab8c0 ; AB891 (2a:7891) -> C2 C0 78
	xor a ; AB894 (2a:7894) -> AF
	scall Func_80653 ; AB895 (2a:7895) -> CD 53 46
	xor a ; AB898 (2a:7898) -> AF
	scall PlayMusic ; AB899 (2a:7899) -> CD E6 4E
	ld a, $13 ; AB89C (2a:789c) -> 3E 13
	scall PlayMusic ; AB89E (2a:789e) -> CD E6 4E
	scall Func_8001c ; AB8A1 (2a:78a1) -> CD 1C 40
	call Func_ab8e1 ; AB8A4 (2a:78a4) -> CD E1 78
	ld e, $01 ; AB8A7 (2a:78a7) -> 1E 01
	ld hl, $0043 ; AB8A9 (2a:78a9) -> 21 43 00
	scall EventFlagAction ; AB8AC (2a:78ac) -> CD 1B 46
	ld a, $0c ; AB8AF (2a:78af) -> 3E 0C
	scall Func_80c94 ; AB8B1 (2a:78b1) -> CD 94 4C
	xor a ; AB8B4 (2a:78b4) -> AF
	scall PlayMusic ; AB8B5 (2a:78b5) -> CD E6 4E
	ld a, $12 ; AB8B8 (2a:78b8) -> 3E 12
	scall PlayMusic ; AB8BA (2a:78ba) -> CD E6 4E
	jp .asm_ab8c8 ; AB8BD (2a:78bd) -> C3 C8 78
.asm_ab8c0:
	ld a, $12 ; AB8C0 (2a:78c0) -> 3E 12
	scall PlayMusic ; AB8C2 (2a:78c2) -> CD E6 4E
	scall Func_8001c ; AB8C5 (2a:78c5) -> CD 1C 40
.asm_ab8c8:
	ret  ; AB8C8 (2a:78c8) -> C9

Data_ab8c9:
	db $0f, $0f, $ff, $ff

Data_ab8cd:
	db $0d, $0f, $ff, $ff

Data_ab8d1:
	db $11, $0f, $ff, $ff

Data_ab8d5:
	db $10, $0f, $ff, $ff

Data_ab8d9:
	db $0e, $0f, $ff, $ff

Data_ab8dd:
	db $10, $12, $ff, $ff

Func_ab8e1:
	xor a ; AB8E1 (2a:78e1) -> AF
.asm_ab8e2:
	cp $0a ; AB8E2 (2a:78e2) -> FE 0A
	jp nc, .asm_ab8f3 ; AB8E4 (2a:78e4) -> D2 F3 78
	push af ; AB8E7 (2a:78e7) -> F5
	ld e, $01 ; AB8E8 (2a:78e8) -> 1E 01
	xor a ; AB8EA (2a:78ea) -> AF
	scall PlayerStep ; AB8EB (2a:78eb) -> CD 1E 4E
	pop af ; AB8EE (2a:78ee) -> F1
	inc a ; AB8EF (2a:78ef) -> 3C
	jp .asm_ab8e2 ; AB8F0 (2a:78f0) -> C3 E2 78
.asm_ab8f3:
	ld hl, $003c ; AB8F3 (2a:78f3) -> 21 3C 00
	scall ScriptSleep ; AB8F6 (2a:78f6) -> CD 8F 46
	ld c, $15 ; AB8F9 (2a:78f9) -> 0E 15
	ld e, $0f ; AB8FB (2a:78fb) -> 1E 0F
	ld a, $04 ; AB8FD (2a:78fd) -> 3E 04
	scall Func_80080 ; AB8FF (2a:78ff) -> CD 80 40
	ld bc, Data_ab8c9 ; AB902 (2a:7902) -> 01 C9 78
Func_ab904:
	ld e, $2a ; AB905 (2a:7905) -> 1E 2A
	ld a, $04 ; AB907 (2a:7907) -> 3E 04
	scall MovePersonAndWait ; AB909 (2a:7909) -> CD 88 46
	scall WaitNPCStep ; AB90C (2a:790c) -> CD 0C 42
	ld hl, $003c ; AB90F (2a:790f) -> 21 3C 00
	scall ScriptSleep ; AB912 (2a:7912) -> CD 8F 46
	ld bc, Data_ab8cd ; AB915 (2a:7915) -> 01 CD 78
	ld e, $2a ; AB918 (2a:7918) -> 1E 2A
	ld a, $05 ; AB91A (2a:791a) -> 3E 05
	scall MovePersonAndWait ; AB91C (2a:791c) -> CD 88 46
	ld a, $2e ; AB91F (2a:791f) -> 3E 2E
	scall PlaySFX ; AB921 (2a:7921) -> CD FE 4E
	ld e, $01 ; AB924 (2a:7924) -> 1E 01
	ld a, $05 ; AB926 (2a:7926) -> 3E 05
	scall SpriteFace ; AB928 (2a:7928) -> CD 95 40
	ld hl, $003c ; AB92B (2a:792b) -> 21 3C 00
	scall ScriptSleep ; AB92E (2a:792e) -> CD 8F 46
	ld e, $03 ; AB931 (2a:7931) -> 1E 03
	ld a, $04 ; AB933 (2a:7933) -> 3E 04
	scall SpriteFace ; AB935 (2a:7935) -> CD 95 40
	ld bc, Data_ab8d1 ; AB938 (2a:7938) -> 01 D1 78
	ld e, $2a ; AB93B (2a:793b) -> 1E 2A
	ld a, $06 ; AB93D (2a:793d) -> 3E 06
	scall MovePersonAndWait ; AB93F (2a:793f) -> CD 88 46
	ld a, $2e ; AB942 (2a:7942) -> 3E 2E
	scall PlaySFX ; AB944 (2a:7944) -> CD FE 4E
	scall WaitNPCStep ; AB947 (2a:7947) -> CD 0C 42
	ld e, $03 ; AB94A (2a:794a) -> 1E 03
	ld a, $06 ; AB94C (2a:794c) -> 3E 06
	scall SpriteFace ; AB94E (2a:794e) -> CD 95 40
	ld hl, $001e ; AB951 (2a:7951) -> 21 1E 00
	scall ScriptSleep ; AB954 (2a:7954) -> CD 8F 46
	ld e, $01 ; AB957 (2a:7957) -> 1E 01
	ld a, $04 ; AB959 (2a:7959) -> 3E 04
	scall SpriteFace ; AB95B (2a:795b) -> CD 95 40
	ld hl, $001e ; AB95E (2a:795e) -> 21 1E 00
	scall ScriptSleep ; AB961 (2a:7961) -> CD 8F 46
	ld bc, Data_ab8d5 ; AB964 (2a:7964) -> 01 D5 78
	ld e, $2a ; AB967 (2a:7967) -> 1E 2A
	ld a, $04 ; AB969 (2a:7969) -> 3E 04
	scall MovePersonAndWait ; AB96B (2a:796b) -> CD 88 46
	scall WaitNPCStep ; AB96E (2a:796e) -> CD 0C 42
	ld a, $62 ; AB971 (2a:7971) -> 3E 62
	scall PlaySFX ; AB973 (2a:7973) -> CD FE 4E
	ld e, $00 ; AB976 (2a:7976) -> 1E 00
	ld a, $06 ; AB978 (2a:7978) -> 3E 06
	scall SpriteFace ; AB97A (2a:797a) -> CD 95 40
	ld e, $01 ; AB97D (2a:797d) -> 1E 01
	ld a, $06 ; AB97F (2a:797f) -> 3E 06
	scall SpriteFace ; AB981 (2a:7981) -> CD 95 40
	ld e, $02 ; AB984 (2a:7984) -> 1E 02
	ld a, $06 ; AB986 (2a:7986) -> 3E 06
	scall SpriteFace ; AB988 (2a:7988) -> CD 95 40
	ld e, $03 ; AB98B (2a:798b) -> 1E 03
	ld a, $06 ; AB98D (2a:798d) -> 3E 06
	scall SpriteFace ; AB98F (2a:798f) -> CD 95 40
	ld e, $00 ; AB992 (2a:7992) -> 1E 00
	ld a, $06 ; AB994 (2a:7994) -> 3E 06
	scall SpriteFace ; AB996 (2a:7996) -> CD 95 40
	ld e, $01 ; AB999 (2a:7999) -> 1E 01
	ld a, $06 ; AB99B (2a:799b) -> 3E 06
	scall SpriteFace ; AB99D (2a:799d) -> CD 95 40
	ld e, $02 ; AB9A0 (2a:79a0) -> 1E 02
	ld a, $06 ; AB9A2 (2a:79a2) -> 3E 06
	scall SpriteFace ; AB9A4 (2a:79a4) -> CD 95 40
	ld e, $03 ; AB9A7 (2a:79a7) -> 1E 03
	ld a, $06 ; AB9A9 (2a:79a9) -> 3E 06
	scall SpriteFace ; AB9AB (2a:79ab) -> CD 95 40
	ld e, $00 ; AB9AE (2a:79ae) -> 1E 00
	ld a, $06 ; AB9B0 (2a:79b0) -> 3E 06
	scall SetPersonVisibilityState ; AB9B2 (2a:79b2) -> CD 3D 41
	ld a, $4e ; AB9B5 (2a:79b5) -> 3E 4E
	scall PlaySFX ; AB9B7 (2a:79b7) -> CD FE 4E
	ld bc, Data_ab8d9 ; AB9BA (2a:79ba) -> 01 D9 78
	ld e, $2a ; AB9BD (2a:79bd) -> 1E 2A
	ld a, $04 ; AB9BF (2a:79bf) -> 3E 04
	scall MovePersonAndWait ; AB9C1 (2a:79c1) -> CD 88 46
	scall WaitNPCStep ; AB9C4 (2a:79c4) -> CD 0C 42
	ld a, $63 ; AB9C7 (2a:79c7) -> 3E 63
	scall PlaySFX ; AB9C9 (2a:79c9) -> CD FE 4E
	ld e, $00 ; AB9CC (2a:79cc) -> 1E 00
	ld a, $05 ; AB9CE (2a:79ce) -> 3E 05
	scall SpriteFace ; AB9D0 (2a:79d0) -> CD 95 40
	ld e, $01 ; AB9D3 (2a:79d3) -> 1E 01
	ld a, $05 ; AB9D5 (2a:79d5) -> 3E 05
	scall SpriteFace ; AB9D7 (2a:79d7) -> CD 95 40
	ld e, $02 ; AB9DA (2a:79da) -> 1E 02
	ld a, $05 ; AB9DC (2a:79dc) -> 3E 05
	scall SpriteFace ; AB9DE (2a:79de) -> CD 95 40
	ld e, $03 ; AB9E1 (2a:79e1) -> 1E 03
	ld a, $05 ; AB9E3 (2a:79e3) -> 3E 05
	scall SpriteFace ; AB9E5 (2a:79e5) -> CD 95 40
	ld e, $00 ; AB9E8 (2a:79e8) -> 1E 00
	ld a, $05 ; AB9EA (2a:79ea) -> 3E 05
	scall SpriteFace ; AB9EC (2a:79ec) -> CD 95 40
	ld e, $01 ; AB9EF (2a:79ef) -> 1E 01
	ld a, $05 ; AB9F1 (2a:79f1) -> 3E 05
	scall SpriteFace ; AB9F3 (2a:79f3) -> CD 95 40
	ld e, $02 ; AB9F6 (2a:79f6) -> 1E 02
	ld a, $05 ; AB9F8 (2a:79f8) -> 3E 05
	scall SpriteFace ; AB9FA (2a:79fa) -> CD 95 40
	ld e, $03 ; AB9FD (2a:79fd) -> 1E 03
	ld a, $05 ; AB9FF (2a:79ff) -> 3E 05
	scall SpriteFace ; ABA01 (2a:7a01) -> CD 95 40
	ld e, $00 ; ABA04 (2a:7a04) -> 1E 00
	ld a, $05 ; ABA06 (2a:7a06) -> 3E 05
	scall SetPersonVisibilityState ; ABA08 (2a:7a08) -> CD 3D 41
	ld a, $4e ; ABA0B (2a:7a0b) -> 3E 4E
	scall PlaySFX ; ABA0D (2a:7a0d) -> CD FE 4E
	ld hl, $0078 ; ABA10 (2a:7a10) -> 21 78 00
	scall ScriptSleep ; ABA13 (2a:7a13) -> CD 8F 46
	ld c, $15 ; ABA16 (2a:7a16) -> 0E 15
	ld e, $11 ; ABA18 (2a:7a18) -> 1E 11
	ld a, $03 ; ABA1A (2a:7a1a) -> 3E 03
	scall Func_80080 ; ABA1C (2a:7a1c) -> CD 80 40
	ld bc, Data_ab8d1 ; ABA1F (2a:7a1f) -> 01 D1 78
	ld e, $2a ; ABA22 (2a:7a22) -> 1E 2A
	ld a, $03 ; ABA24 (2a:7a24) -> 3E 03
	scall MovePersonAndWait ; ABA26 (2a:7a26) -> CD 88 46
	scall WaitNPCStep ; ABA29 (2a:7a29) -> CD 0C 42
	ld e, $03 ; ABA2C (2a:7a2c) -> 1E 03
	ld a, $03 ; ABA2E (2a:7a2e) -> 3E 03
	scall SpriteFace ; ABA30 (2a:7a30) -> CD 95 40
	ld hl, $003c ; ABA33 (2a:7a33) -> 21 3C 00
	scall ScriptSleep ; ABA36 (2a:7a36) -> CD 8F 46
	ld hl, $0115 ; ABA39 (2a:7a39) -> 21 15 01
	scall PrintTextWithNPCName ; ABA3C (2a:7a3c) -> CD A9 44
	ld hl, $001e ; ABA3F (2a:7a3f) -> 21 1E 00
	scall ScriptSleep ; ABA42 (2a:7a42) -> CD 8F 46
	ld e, $01 ; ABA45 (2a:7a45) -> 1E 01
	ld a, $04 ; ABA47 (2a:7a47) -> 3E 04
	scall SpriteFace ; ABA49 (2a:7a49) -> CD 95 40
	ld hl, $0116 ; ABA4C (2a:7a4c) -> 21 16 01
	scall PrintTextWithNPCName ; ABA4F (2a:7a4f) -> CD A9 44
	ld hl, $0117 ; ABA52 (2a:7a52) -> 21 17 01
	scall PrintTextWithNPCName ; ABA55 (2a:7a55) -> CD A9 44
	ld hl, $0118 ; ABA58 (2a:7a58) -> 21 18 01
	scall PrintTextWithNPCName ; ABA5B (2a:7a5b) -> CD A9 44
	ld hl, $0119 ; ABA5E (2a:7a5e) -> 21 19 01
	scall PrintTextWithNPCName ; ABA61 (2a:7a61) -> CD A9 44
	ld hl, $011a ; ABA64 (2a:7a64) -> 21 1A 01
	scall PrintTextWithNPCName ; ABA67 (2a:7a67) -> CD A9 44
	ld hl, $011b ; ABA6A (2a:7a6a) -> 21 1B 01
	scall PrintTextWithNPCName ; ABA6D (2a:7a6d) -> CD A9 44
	ld hl, $011c ; ABA70 (2a:7a70) -> 21 1C 01
	scall PrintTextWithNPCName ; ABA73 (2a:7a73) -> CD A9 44
	ld bc, Data_ab8c9 ; ABA76 (2a:7a76) -> 01 C9 78
Func_aba78:
	ld e, $2a ; ABA79 (2a:7a79) -> 1E 2A
	ld a, $04 ; ABA7B (2a:7a7b) -> 3E 04
	scall MovePersonAndWait ; ABA7D (2a:7a7d) -> CD 88 46
	scall WaitNPCStep ; ABA80 (2a:7a80) -> CD 0C 42
	ld c, $01 ; ABA83 (2a:7a83) -> 0E 01
	ld e, $01 ; ABA85 (2a:7a85) -> 1E 01
	ld a, $16 ; ABA87 (2a:7a87) -> 3E 16
	scall LoadEmote ; ABA89 (2a:7a89) -> CD 76 41
	ld e, $0f ; ABA8C (2a:7a8c) -> 1E 0F
	ld a, $10 ; ABA8E (2a:7a8e) -> 3E 10
	scall MoveEmote ; ABA90 (2a:7a90) -> CD E4 41
	ld a, $61 ; ABA93 (2a:7a93) -> 3E 61
	scall PlaySFX ; ABA95 (2a:7a95) -> CD FE 4E
	scall WaitEmote ; ABA98 (2a:7a98) -> CD D5 41
	scall HideEmote ; ABA9B (2a:7a9b) -> CD 8B 41
	ld hl, $011d ; ABA9E (2a:7a9e) -> 21 1D 01
	scall PrintTextWithNPCName ; ABAA1 (2a:7aa1) -> CD A9 44
	ld e, $02 ; ABAA4 (2a:7aa4) -> 1E 02
	ld a, $04 ; ABAA6 (2a:7aa6) -> 3E 04
	scall SpriteFace ; ABAA8 (2a:7aa8) -> CD 95 40
	ld hl, $003c ; ABAAB (2a:7aab) -> 21 3C 00
	scall ScriptSleep ; ABAAE (2a:7aae) -> CD 8F 46
	ld e, $02 ; ABAB1 (2a:7ab1) -> 1E 02
	ld a, $03 ; ABAB3 (2a:7ab3) -> 3E 03
	scall SpriteFace ; ABAB5 (2a:7ab5) -> CD 95 40
	ld c, $01 ; ABAB8 (2a:7ab8) -> 0E 01
	ld e, $01 ; ABABA (2a:7aba) -> 1E 01
	ld a, $05 ; ABABC (2a:7abc) -> 3E 05
	scall LoadEmote ; ABABE (2a:7abe) -> CD 76 41
	ld e, $0f ; ABAC1 (2a:7ac1) -> 1E 0F
	ld a, $11 ; ABAC3 (2a:7ac3) -> 3E 11
	scall MoveEmote ; ABAC5 (2a:7ac5) -> CD E4 41
	ld a, $28 ; ABAC8 (2a:7ac8) -> 3E 28
	scall PlaySFX ; ABACA (2a:7aca) -> CD FE 4E
	scall WaitEmote ; ABACD (2a:7acd) -> CD D5 41
	scall HideEmote ; ABAD0 (2a:7ad0) -> CD 8B 41
	xor a ; ABAD3 (2a:7ad3) -> AF
.asm_abad4:
	cp $02 ; ABAD4 (2a:7ad4) -> FE 02
	jp nc, .asm_abae6 ; ABAD6 (2a:7ad6) -> D2 E6 7A
	push af ; ABAD9 (2a:7ad9) -> F5
	ld e, $01 ; ABADA (2a:7ada) -> 1E 01
	ld a, $02 ; ABADC (2a:7adc) -> 3E 02
	scall PlayerStep ; ABADE (2a:7ade) -> CD 1E 4E
	pop af ; ABAE1 (2a:7ae1) -> F1
	inc a ; ABAE2 (2a:7ae2) -> 3C
	jp .asm_abad4 ; ABAE3 (2a:7ae3) -> C3 D4 7A
.asm_abae6:
	ld c, $19 ; ABAE6 (2a:7ae6) -> 0E 19
	ld e, $10 ; ABAE8 (2a:7ae8) -> 1E 10
	ld a, $02 ; ABAEA (2a:7aea) -> 3E 02
	scall Func_80080 ; ABAEC (2a:7aec) -> CD 80 40
	ld bc, Data_ab8dd ; ABAEF (2a:7aef) -> 01 DD 78
	ld e, $2a ; ABAF2 (2a:7af2) -> 1E 2A
	ld a, $02 ; ABAF4 (2a:7af4) -> 3E 02
	scall MovePersonAndWait ; ABAF6 (2a:7af6) -> CD 88 46
	scall WaitNPCStep ; ABAF9 (2a:7af9) -> CD 0C 42
	ld hl, $011e ; ABAFC (2a:7afc) -> 21 1E 01
	scall PrintTextWithNPCName ; ABAFF (2a:7aff) -> CD A9 44
	ld hl, $0120 ; ABB02 (2a:7b02) -> 21 20 01
	scall PrintTextWithNPCName ; ABB05 (2a:7b05) -> CD A9 44
	ld c, $01 ; ABB08 (2a:7b08) -> 0E 01
	ld e, $02 ; ABB0A (2a:7b0a) -> 1E 02
	ld a, $16 ; ABB0C (2a:7b0c) -> 3E 16
	scall LoadEmote ; ABB0E (2a:7b0e) -> CD 76 41
	ld e, $0f ; ABB11 (2a:7b11) -> 1E 0F
	ld a, $10 ; ABB13 (2a:7b13) -> 3E 10
	scall MoveEmote ; ABB15 (2a:7b15) -> CD E4 41
	ld a, $60 ; ABB18 (2a:7b18) -> 3E 60
	scall PlaySFX ; ABB1A (2a:7b1a) -> CD FE 4E
	ld e, $00 ; ABB1D (2a:7b1d) -> 1E 00
	ld a, $02 ; ABB1F (2a:7b1f) -> 3E 02
	scall SetPersonVisibilityState ; ABB21 (2a:7b21) -> CD 3D 41
	ld e, $03 ; ABB24 (2a:7b24) -> 1E 03
	ld a, $03 ; ABB26 (2a:7b26) -> 3E 03
	scall SpriteFace ; ABB28 (2a:7b28) -> CD 95 40
	scall WaitEmote ; ABB2B (2a:7b2b) -> CD D5 41
	scall HideEmote ; ABB2E (2a:7b2e) -> CD 8B 41
	ld e, $01 ; ABB31 (2a:7b31) -> 1E 01
	ld a, $04 ; ABB33 (2a:7b33) -> 3E 04
	scall SpriteFace ; ABB35 (2a:7b35) -> CD 95 40
	ld hl, $011f ; ABB38 (2a:7b38) -> 21 1F 01
	scall PrintTextWithNPCName ; ABB3B (2a:7b3b) -> CD A9 44
	ld c, $01 ; ABB3E (2a:7b3e) -> 0E 01
	ld e, $04 ; ABB40 (2a:7b40) -> 1E 04
	ld a, $16 ; ABB42 (2a:7b42) -> 3E 16
	scall LoadEmote ; ABB44 (2a:7b44) -> CD 76 41
	ld e, $0f ; ABB47 (2a:7b47) -> 1E 0F
	ld a, $10 ; ABB49 (2a:7b49) -> 3E 10
	scall MoveEmote ; ABB4B (2a:7b4b) -> CD E4 41
	ld e, $00 ; ABB4E (2a:7b4e) -> 1E 00
	ld a, $04 ; ABB50 (2a:7b50) -> 3E 04
	scall SetPersonVisibilityState ; ABB52 (2a:7b52) -> CD 3D 41
	scall WaitEmote ; ABB55 (2a:7b55) -> CD D5 41
	scall HideEmote ; ABB58 (2a:7b58) -> CD 8B 41
	ld a, $01 ; ABB5B (2a:7b5b) -> 3E 01
	scall Func_80653 ; ABB5D (2a:7b5d) -> CD 53 46
	xor a ; ABB60 (2a:7b60) -> AF
.asm_abb61:
	cp $08 ; ABB61 (2a:7b61) -> FE 08
	jp nc, .asm_abb73 ; ABB63 (2a:7b63) -> D2 73 7B
	push af ; ABB66 (2a:7b66) -> F5
	ld e, $01 ; ABB67 (2a:7b67) -> 1E 01
	ld a, $02 ; ABB69 (2a:7b69) -> 3E 02
	scall PlayerStep ; ABB6B (2a:7b6b) -> CD 1E 4E
	pop af ; ABB6E (2a:7b6e) -> F1
	inc a ; ABB6F (2a:7b6f) -> 3C
	jp .asm_abb61 ; ABB70 (2a:7b70) -> C3 61 7B
.asm_abb73:
	ret  ; ABB73 (2a:7b73) -> C9

Func_abb74:: ; abb74
	set_farcall_addrs_hli FadeInMap ; ABB7D (2a:7b7d) -> 36 4B
	xor a ; ABB7F (2a:7b7f) -> AF
	call FarCall ; ABB80 (2a:7b80) -> CD F8 03
	xor a ; ABB83 (2a:7b83) -> AF
	scall PlayerFace ; ABB84 (2a:7b84) -> CD 77 46
	ld c, $01 ; ABB87 (2a:7b87) -> 0E 01
	ld e, $3f ; ABB89 (2a:7b89) -> 1E 3F
	ld a, $1c ; ABB8B (2a:7b8b) -> 3E 1C
	scall LoadEmote ; ABB8D (2a:7b8d) -> CD 76 41
	ld e, $08 ; ABB90 (2a:7b90) -> 1E 08
	ld a, $10 ; ABB92 (2a:7b92) -> 3E 10
	scall MoveEmote ; ABB94 (2a:7b94) -> CD E4 41
	ld a, $5e ; ABB97 (2a:7b97) -> 3E 5E
	scall PlaySFX ; ABB99 (2a:7b99) -> CD FE 4E
	ld e, $00 ; ABB9C (2a:7b9c) -> 1E 00
	ld a, $04 ; ABB9E (2a:7b9e) -> 3E 04
	scall SetPersonVisibilityState ; ABBA0 (2a:7ba0) -> CD 3D 41
	scall WaitEmote ; ABBA3 (2a:7ba3) -> CD D5 41
	ld e, $01 ; ABBA6 (2a:7ba6) -> 1E 01
	ld a, $03 ; ABBA8 (2a:7ba8) -> 3E 03
	scall SetPersonVisibilityState ; ABBAA (2a:7baa) -> CD 3D 41
	scall HideEmote ; ABBAD (2a:7bad) -> CD 8B 41
	ld hl, $003c ; ABBB0 (2a:7bb0) -> 21 3C 00
	scall ScriptSleep ; ABBB3 (2a:7bb3) -> CD 8F 46
	ld c, $01 ; ABBB6 (2a:7bb6) -> 0E 01
	ld e, $3f ; ABBB8 (2a:7bb8) -> 1E 3F
	ld a, $1d ; ABBBA (2a:7bba) -> 3E 1D
	scall LoadEmote ; ABBBC (2a:7bbc) -> CD 76 41
	ld e, $08 ; ABBBF (2a:7bbf) -> 1E 08
	ld a, $10 ; ABBC1 (2a:7bc1) -> 3E 10
	scall MoveEmote ; ABBC3 (2a:7bc3) -> CD E4 41
	ld e, $00 ; ABBC6 (2a:7bc6) -> 1E 00
	ld a, $02 ; ABBC8 (2a:7bc8) -> 3E 02
	scall SetPersonVisibilityState ; ABBCA (2a:7bca) -> CD 3D 41
	ld e, $00 ; ABBCD (2a:7bcd) -> 1E 00
	ld a, $03 ; ABBCF (2a:7bcf) -> 3E 03
	scall SetPersonVisibilityState ; ABBD1 (2a:7bd1) -> CD 3D 41
	scall WaitEmote ; ABBD4 (2a:7bd4) -> CD D5 41
	ld e, $01 ; ABBD7 (2a:7bd7) -> 1E 01
	ld a, $02 ; ABBD9 (2a:7bd9) -> 3E 02
	scall SetPersonVisibilityState ; ABBDB (2a:7bdb) -> CD 3D 41
	ld e, $01 ; ABBDE (2a:7bde) -> 1E 01
	ld a, $03 ; ABBE0 (2a:7be0) -> 3E 03
	scall SetPersonVisibilityState ; ABBE2 (2a:7be2) -> CD 3D 41
	scall HideEmote ; ABBE5 (2a:7be5) -> CD 8B 41
	ld hl, $03fe ; ABBE8 (2a:7be8) -> 21 FE 03
	scall PrintTextWithNPCName ; ABBEB (2a:7beb) -> CD A9 44
	ld hl, $03fc ; ABBEE (2a:7bee) -> 21 FC 03
	scall PrintTextStandard ; ABBF1 (2a:7bf1) -> CD 98 44
	ld c, $1e ; ABBF4 (2a:7bf4) -> 0E 1E
	ld e, $00 ; ABBF6 (2a:7bf6) -> 1E 00
	ld a, $80 ; ABBF8 (2a:7bf8) -> 3E 80
	scall GiveRobot ; ABBFA (2a:7bfa) -> CD 87 4D
	cp $ff ; ABBFD (2a:7bfd) -> FE FF
	jp nz, .asm_abc02 ; ABBFF (2a:7bff) -> C2 02 7C
.asm_abc02:
	ld hl, $03ff ; ABC02 (2a:7c02) -> 21 FF 03
	scall PrintTextWithNPCName ; ABC05 (2a:7c05) -> CD A9 44
	ld hl, $03fd ; ABC08 (2a:7c08) -> 21 FD 03
	scall PrintTextStandard ; ABC0B (2a:7c0b) -> CD 98 44
	ld e, $00 ; ABC0E (2a:7c0e) -> 1E 00
	ld a, $2c ; ABC10 (2a:7c10) -> 3E 2C
	scall Func_80d62 ; ABC12 (2a:7c12) -> CD 62 4D
	ld e, $01 ; ABC15 (2a:7c15) -> 1E 01
	ld hl, $0048 ; ABC17 (2a:7c17) -> 21 48 00
	scall EventFlagAction ; ABC1A (2a:7c1a) -> CD 1B 46
	ret  ; ABC1D (2a:7c1d) -> C9

Data_abc1e:
	db $0f, $07, $ff, $ff

Func_abc22:
	xor a ; ABC22 (2a:7c22) -> AF
	scall PlayerFace ; ABC23 (2a:7c23) -> CD 77 46
	scall Func_8001c ; ABC26 (2a:7c26) -> CD 1C 40
	ld hl, $0048 ; ABC29 (2a:7c29) -> 21 48 00
	scall CheckEventFlag ; ABC2C (2a:7c2c) -> CD 2E 46
	or a ; ABC2F (2a:7c2f) -> B7
	jp nz, .asm_abc3d ; ABC30 (2a:7c30) -> C2 3D 7C
	ld e, $1c ; ABC33 (2a:7c33) -> 1E 1C
	ld a, $03 ; ABC35 (2a:7c35) -> 3E 03
	scall ChangeSprite ; ABC37 (2a:7c37) -> CD C8 40
	jp .asm_abc44 ; ABC3A (2a:7c3a) -> C3 44 7C
.asm_abc3d:
	ld e, $23 ; ABC3D (2a:7c3d) -> 1E 23
	ld a, $03 ; ABC3F (2a:7c3f) -> 3E 03
	scall ChangeSprite ; ABC41 (2a:7c41) -> CD C8 40
.asm_abc44:
	ld e, $02 ; ABC44 (2a:7c44) -> 1E 02
	ld a, $03 ; ABC46 (2a:7c46) -> 3E 03
	scall SpriteFace ; ABC48 (2a:7c48) -> CD 95 40
	ld c, $01 ; ABC4B (2a:7c4b) -> 0E 01
	ld de, Data_abc1e ; ABC4D (2a:7c4d) -> 11 1E 7C
	ld a, $2a ; ABC50 (2a:7c50) -> 3E 2A
	scall MovePlayer ; ABC52 (2a:7c52) -> CD 3E 46
	ld hl, $003c ; ABC55 (2a:7c55) -> 21 3C 00
	scall ScriptSleep ; ABC58 (2a:7c58) -> CD 8F 46
	ld hl, $005a ; ABC5B (2a:7c5b) -> 21 5A 00
	scall CheckEventFlag ; ABC5E (2a:7c5e) -> CD 2E 46
	or a ; ABC61 (2a:7c61) -> B7
	jp nz, .asm_abc6b ; ABC62 (2a:7c62) -> C2 6B 7C
	ld hl, $014f ; ABC65 (2a:7c65) -> 21 4F 01
	scall PrintTextWithNPCName ; ABC68 (2a:7c68) -> CD A9 44
.asm_abc6b:
	ld hl, $0048 ; ABC6B (2a:7c6b) -> 21 48 00
	scall CheckEventFlag ; ABC6E (2a:7c6e) -> CD 2E 46
	or a ; ABC71 (2a:7c71) -> B7
	jp nz, .asm_abc7b ; ABC72 (2a:7c72) -> C2 7B 7C
	ld hl, $0489 ; ABC75 (2a:7c75) -> 21 89 04
	scall PrintTextWithNPCName ; ABC78 (2a:7c78) -> CD A9 44
.asm_abc7b:
	ld hl, $005a ; ABC7B (2a:7c7b) -> 21 5A 00
	scall CheckEventFlag ; ABC7E (2a:7c7e) -> CD 2E 46
	or a ; ABC81 (2a:7c81) -> B7
	jp nz, .asm_abc9c ; ABC82 (2a:7c82) -> C2 9C 7C
	ld hl, $03aa ; ABC85 (2a:7c85) -> 21 AA 03
	scall PrintTextStandard ; ABC88 (2a:7c88) -> CD 98 44
	ld c, $00 ; ABC8B (2a:7c8b) -> 0E 00
	ld e, $01 ; ABC8D (2a:7c8d) -> 1E 01
	ld a, $07 ; ABC8F (2a:7c8f) -> 3E 07
	scall Func_80d4d ; ABC91 (2a:7c91) -> CD 4D 4D
	ld e, $01 ; ABC94 (2a:7c94) -> 1E 01
	ld hl, $005a ; ABC96 (2a:7c96) -> 21 5A 00
	scall EventFlagAction ; ABC99 (2a:7c99) -> CD 1B 46
.asm_abc9c:
	ld hl, $0150 ; ABC9C (2a:7c9c) -> 21 50 01
	scall PrintTextWithNPCName ; ABC9F (2a:7c9f) -> CD A9 44
	ld hl, $003c ; ABCA2 (2a:7ca2) -> 21 3C 00
	scall ScriptSleep ; ABCA5 (2a:7ca5) -> CD 8F 46
.asm_abca8:
	ld a, [wRTCTicker] ; ABCA8 (2a:7ca8) -> FA 1C C0
	cp $11 ; ABCAB (2a:7cab) -> FE 11
	jp z, .asm_abcc2 ; ABCAD (2a:7cad) -> CA C2 7C
	ld a, [wRTCTicker] ; ABCB0 (2a:7cb0) -> FA 1C C0
	or a ; ABCB3 (2a:7cb3) -> B7
	jp nz, .asm_abcbc ; ABCB4 (2a:7cb4) -> C2 BC 7C
	ld a, $01 ; ABCB7 (2a:7cb7) -> 3E 01
	ld [wRTCTicker], a ; ABCB9 (2a:7cb9) -> EA 1C C0
.asm_abcbc:
	call NextOverworldFrame ; ABCBC (2a:7cbc) -> CD 65 04
	jp .asm_abca8 ; ABCBF (2a:7cbf) -> C3 A8 7C
.asm_abcc2:
	xor a ; ABCC2 (2a:7cc2) -> AF
	ld [wc39e], a ; ABCC3 (2a:7cc3) -> EA 9E C3
	ld a, $02 ; ABCC6 (2a:7cc6) -> 3E 02
	scall PlayMusic ; ABCC8 (2a:7cc8) -> CD E6 4E
	ld a, $01 ; ABCCB (2a:7ccb) -> 3E 01
	ld [wc790], a ; ABCCD (2a:7ccd) -> EA 90 C7
	scall ScriptLibrary ; ABCD0 (2a:7cd0) -> CD 00 40
	or a ; ABCD3 (2a:7cd3) -> B7
	jp nz, .asm_abdda ; ABCD4 (2a:7cd4) -> C2 DA 7D
	set_farcall_addrs_hli Func_b6f2 ; ABCE0 (2a:7ce0) -> 36 76
	call FarCall ; ABCE2 (2a:7ce2) -> CD F8 03
	call FillVisibleAreaWithBlankTile ; ABCE5 (2a:7ce5) -> CD A8 3A
	set_farcall_addrs_hli Func_da4dc ; ABCF1 (2a:7cf1) -> 36 64
	call FarCall ; ABCF3 (2a:7cf3) -> CD F8 03
	ld a, [wLCDC] ; ABCF6 (2a:7cf6) -> FA 11 C2
	or $03 ; ABCF9 (2a:7cf9) -> F6 03
	ld [wLCDC], a ; ABCFB (2a:7cfb) -> EA 11 C2
	ld a, [wNextVBlankFlags] ; ABCFE (2a:7cfe) -> FA 03 C2
	or $06 ; ABD01 (2a:7d01) -> F6 06
	ld [wNextVBlankFlags], a ; ABD03 (2a:7d03) -> EA 03 C2
	set_farcall_addrs_hli Credits ; ABD0F (2a:7d0f) -> 36 5F
	call FarCall ; ABD11 (2a:7d11) -> CD F8 03
	ld a, [wLCDC] ; ABD14 (2a:7d14) -> FA 11 C2
	and $fb ; ABD17 (2a:7d17) -> E6 FB
	ld [wLCDC], a ; ABD19 (2a:7d19) -> EA 11 C2
	ld a, [wNextVBlankFlags] ; ABD1C (2a:7d1c) -> FA 03 C2
	or $04 ; ABD1F (2a:7d1f) -> F6 04
	ld [wNextVBlankFlags], a ; ABD21 (2a:7d21) -> EA 03 C2
.asm_abd24:
	ld a, [wNextVBlankFlags] ; ABD24 (2a:7d24) -> FA 03 C2
	ld hl, $c204 ; ABD27 (2a:7d27) -> 21 04 C2
	cp [hl] ; ABD2A (2a:7d2a) -> BE
	jp nz, .asm_abd24 ; ABD2B (2a:7d2b) -> C2 24 7D
	set_farcall_addrs_hli FadeInMap ; ABD37 (2a:7d37) -> 36 4B
	xor a ; ABD39 (2a:7d39) -> AF
	call FarCall ; ABD3A (2a:7d3a) -> CD F8 03
	scall Func_80f02 ; ABD3D (2a:7d3d) -> CD 02 4F
	ld hl, $0393 ; ABD40 (2a:7d40) -> 21 93 03
	scall PrintTextWithNPCName ; ABD43 (2a:7d43) -> CD A9 44
	xor a ; ABD46 (2a:7d46) -> AF
	scall Func_8103e ; ABD47 (2a:7d47) -> CD 3E 50
	ld hl, $0394 ; ABD4A (2a:7d4a) -> 21 94 03
	scall PrintTextWithNPCName ; ABD4D (2a:7d4d) -> CD A9 44
	ld e, $00 ; ABD50 (2a:7d50) -> 1E 00
	ld hl, $00e1 ; ABD52 (2a:7d52) -> 21 E1 00
	scall EventFlagAction ; ABD55 (2a:7d55) -> CD 1B 46
	ld e, $00 ; ABD58 (2a:7d58) -> 1E 00
	ld hl, $00e2 ; ABD5A (2a:7d5a) -> 21 E2 00
	scall EventFlagAction ; ABD5D (2a:7d5d) -> CD 1B 46
	ld e, $00 ; ABD60 (2a:7d60) -> 1E 00
	ld hl, $00e3 ; ABD62 (2a:7d62) -> 21 E3 00
	scall EventFlagAction ; ABD65 (2a:7d65) -> CD 1B 46
	ld e, $00 ; ABD68 (2a:7d68) -> 1E 00
	ld hl, $00e4 ; ABD6A (2a:7d6a) -> 21 E4 00
	scall EventFlagAction ; ABD6D (2a:7d6d) -> CD 1B 46
	ld e, $00 ; ABD70 (2a:7d70) -> 1E 00
	ld hl, $00e5 ; ABD72 (2a:7d72) -> 21 E5 00
	scall EventFlagAction ; ABD75 (2a:7d75) -> CD 1B 46
	ld e, $00 ; ABD78 (2a:7d78) -> 1E 00
	ld hl, $00e6 ; ABD7A (2a:7d7a) -> 21 E6 00
	scall EventFlagAction ; ABD7D (2a:7d7d) -> CD 1B 46
	ld l, $0d ; ABD80 (2a:7d80) -> 2E 0D
	push hl ; ABD82 (2a:7d82) -> E5
	ld c, $10 ; ABD83 (2a:7d83) -> 0E 10
	ld e, $00 ; ABD85 (2a:7d85) -> 1E 00
	xor a ; ABD87 (2a:7d87) -> AF
	scall Func_80dff ; ABD88 (2a:7d88) -> CD FF 4D
	pop bc ; ABD8B (2a:7d8b) -> C1
	set_farcall_addrs_hli SaveGame ; ABD95 (2a:7d95) -> 36 6D
	call FarCall ; ABD97 (2a:7d97) -> CD F8 03
	set_farcall_addrs_hli Func_b6f2 ; ABDA3 (2a:7da3) -> 36 76
	call FarCall ; ABDA5 (2a:7da5) -> CD F8 03
	call FillVisibleAreaWithBlankTile ; ABDA8 (2a:7da8) -> CD A8 3A
	set_farcall_addrs_hli Func_da4dc ; ABDB4 (2a:7db4) -> 36 64
	call FarCall ; ABDB6 (2a:7db6) -> CD F8 03
	ld a, [wLCDC] ; ABDB9 (2a:7db9) -> FA 11 C2
	or $03 ; ABDBC (2a:7dbc) -> F6 03
	ld [wLCDC], a ; ABDBE (2a:7dbe) -> EA 11 C2
	ld a, [wNextVBlankFlags] ; ABDC1 (2a:7dc1) -> FA 03 C2
	or $06 ; ABDC4 (2a:7dc4) -> F6 06
	ld [wNextVBlankFlags], a ; ABDC6 (2a:7dc6) -> EA 03 C2
	set_farcall_addrs_hli Credits2 ; ABDD2 (2a:7dd2) -> 36 5F
	call FarCall ; ABDD4 (2a:7dd4) -> CD F8 03
	jp .asm_abe66 ; ABDD7 (2a:7dd7) -> C3 66 7E
.asm_abdda:
	ld e, $00 ; ABDDA (2a:7dda) -> 1E 00
	ld hl, $00e1 ; ABDDC (2a:7ddc) -> 21 E1 00
	scall EventFlagAction ; ABDDF (2a:7ddf) -> CD 1B 46
	ld e, $00 ; ABDE2 (2a:7de2) -> 1E 00
	ld hl, $00e2 ; ABDE4 (2a:7de4) -> 21 E2 00
	scall EventFlagAction ; ABDE7 (2a:7de7) -> CD 1B 46
	ld e, $00 ; ABDEA (2a:7dea) -> 1E 00
	ld hl, $00e3 ; ABDEC (2a:7dec) -> 21 E3 00
	scall EventFlagAction ; ABDEF (2a:7def) -> CD 1B 46
	ld e, $00 ; ABDF2 (2a:7df2) -> 1E 00
	ld hl, $00e4 ; ABDF4 (2a:7df4) -> 21 E4 00
	scall EventFlagAction ; ABDF7 (2a:7df7) -> CD 1B 46
	ld e, $00 ; ABDFA (2a:7dfa) -> 1E 00
	ld hl, $00e5 ; ABDFC (2a:7dfc) -> 21 E5 00
	scall EventFlagAction ; ABDFF (2a:7dff) -> CD 1B 46
	ld e, $00 ; ABE02 (2a:7e02) -> 1E 00
	ld hl, $00e6 ; ABE04 (2a:7e04) -> 21 E6 00
	scall EventFlagAction ; ABE07 (2a:7e07) -> CD 1B 46
	ld a, $01 ; ABE0A (2a:7e0a) -> 3E 01
	ld [wc79a], a ; ABE0C (2a:7e0c) -> EA 9A C7
	ld l, $0d ; ABE0F (2a:7e0f) -> 2E 0D
	push hl ; ABE11 (2a:7e11) -> E5
	ld c, $10 ; ABE12 (2a:7e12) -> 0E 10
	ld e, $00 ; ABE14 (2a:7e14) -> 1E 00
	xor a ; ABE16 (2a:7e16) -> AF
	scall Func_80dff ; ABE17 (2a:7e17) -> CD FF 4D
	pop bc ; ABE1A (2a:7e1a) -> C1
	set_farcall_addrs_hli SaveGame ; ABE24 (2a:7e24) -> 36 6D
	call FarCall ; ABE26 (2a:7e26) -> CD F8 03
	set_farcall_addrs_hli Func_b6f2 ; ABE32 (2a:7e32) -> 36 76
	call FarCall ; ABE34 (2a:7e34) -> CD F8 03
	call FillVisibleAreaWithBlankTile ; ABE37 (2a:7e37) -> CD A8 3A
	set_farcall_addrs_hli Func_da4dc ; ABE43 (2a:7e43) -> 36 64
	call FarCall ; ABE45 (2a:7e45) -> CD F8 03
	ld a, [wLCDC] ; ABE48 (2a:7e48) -> FA 11 C2
	or $03 ; ABE4B (2a:7e4b) -> F6 03
	ld [wLCDC], a ; ABE4D (2a:7e4d) -> EA 11 C2
	ld a, [wNextVBlankFlags] ; ABE50 (2a:7e50) -> FA 03 C2
	or $06 ; ABE53 (2a:7e53) -> F6 06
	ld [wNextVBlankFlags], a ; ABE55 (2a:7e55) -> EA 03 C2
	set_farcall_addrs_hli Func_fafa8 ; ABE61 (2a:7e61) -> 36 5F
	call FarCall ; ABE63 (2a:7e63) -> CD F8 03
.asm_abe66:
	ret  ; ABE66 (2a:7e66) -> C9

Func_abe67:
	ld a, e ; ABE67 (2a:7e67) -> 7B
	or a ; ABE68 (2a:7e68) -> B7
	jp nz, .asm_abf5a ; ABE69 (2a:7e69) -> C2 5A 7F
	ld hl, $00df ; ABE6C (2a:7e6c) -> 21 DF 00
	scall CheckEventFlag ; ABE6F (2a:7e6f) -> CD 2E 46
	or a ; ABE72 (2a:7e72) -> B7
	jp nz, .asm_abf54 ; ABE73 (2a:7e73) -> C2 54 7F
	ld a, $5e ; ABE76 (2a:7e76) -> 3E 5E
	scall PlaySFX ; ABE78 (2a:7e78) -> CD FE 4E
	ld c, $02 ; ABE7B (2a:7e7b) -> 0E 02
	ld e, $02 ; ABE7D (2a:7e7d) -> 1E 02
	ld a, $08 ; ABE7F (2a:7e7f) -> 3E 08
	scall LoadEmote ; ABE81 (2a:7e81) -> CD 76 41
	ld e, $14 ; ABE84 (2a:7e84) -> 1E 14
	ld a, $16 ; ABE86 (2a:7e86) -> 3E 16
	scall MoveEmote ; ABE88 (2a:7e88) -> CD E4 41
	scall WaitEmote ; ABE8B (2a:7e8b) -> CD D5 41
	scall HideEmote ; ABE8E (2a:7e8e) -> CD 8B 41
	ld a, $28 ; ABE91 (2a:7e91) -> 3E 28
	scall PlaySFX ; ABE93 (2a:7e93) -> CD FE 4E
	ld e, $01 ; ABE96 (2a:7e96) -> 1E 01
	xor a ; ABE98 (2a:7e98) -> AF
	scall SetPersonVisibilityState ; ABE99 (2a:7e99) -> CD 3D 41
	ld a, $60 ; ABE9C (2a:7e9c) -> 3E 60
	scall PlaySFX ; ABE9E (2a:7e9e) -> CD FE 4E
	ld e, $03 ; ABEA1 (2a:7ea1) -> 1E 03
	xor a ; ABEA3 (2a:7ea3) -> AF
	scall SpriteFace ; ABEA4 (2a:7ea4) -> CD 95 40
	ld e, $00 ; ABEA7 (2a:7ea7) -> 1E 00
	xor a ; ABEA9 (2a:7ea9) -> AF
	scall SpriteFace ; ABEAA (2a:7eaa) -> CD 95 40
	ld e, $01 ; ABEAD (2a:7ead) -> 1E 01
	xor a ; ABEAF (2a:7eaf) -> AF
	scall SpriteFace ; ABEB0 (2a:7eb0) -> CD 95 40
	ld e, $02 ; ABEB3 (2a:7eb3) -> 1E 02
	xor a ; ABEB5 (2a:7eb5) -> AF
	scall SpriteFace ; ABEB6 (2a:7eb6) -> CD 95 40
	ld e, $03 ; ABEB9 (2a:7eb9) -> 1E 03
	xor a ; ABEBB (2a:7ebb) -> AF
	scall SpriteFace ; ABEBC (2a:7ebc) -> CD 95 40
	ld e, $00 ; ABEBF (2a:7ebf) -> 1E 00
	xor a ; ABEC1 (2a:7ec1) -> AF
	scall SpriteFace ; ABEC2 (2a:7ec2) -> CD 95 40
	ld e, $01 ; ABEC5 (2a:7ec5) -> 1E 01
	xor a ; ABEC7 (2a:7ec7) -> AF
	scall SpriteFace ; ABEC8 (2a:7ec8) -> CD 95 40
	ld e, $02 ; ABECB (2a:7ecb) -> 1E 02
	xor a ; ABECD (2a:7ecd) -> AF
	scall SpriteFace ; ABECE (2a:7ece) -> CD 95 40
	ld a, $0f ; ABED1 (2a:7ed1) -> 3E 0F
	scall FadeOutAudio ; ABED3 (2a:7ed3) -> CD F1 4F
	xor a ; ABED6 (2a:7ed6) -> AF
	scall PlayMusic ; ABED7 (2a:7ed7) -> CD E6 4E
	ld a, $01 ; ABEDA (2a:7eda) -> 3E 01
	scall FadeInAudio ; ABEDC (2a:7edc) -> CD 1A 50
	ld a, $14 ; ABEDF (2a:7edf) -> 3E 14
	scall PlayMusic ; ABEE1 (2a:7ee1) -> CD E6 4E
	xor a ; ABEE4 (2a:7ee4) -> AF
	scall FacePlayer ; ABEE5 (2a:7ee5) -> CD 4B 44
	ld hl, $001e ; ABEE8 (2a:7ee8) -> 21 1E 00
	scall ScriptSleep ; ABEEB (2a:7eeb) -> CD 8F 46
	ld c, $11 ; ABEEE (2a:7eee) -> 0E 11
	ld e, $10 ; ABEF0 (2a:7ef0) -> 1E 10
	ld a, $0f ; ABEF2 (2a:7ef2) -> 3E 0F
	scall Func_80e8d ; ABEF4 (2a:7ef4) -> CD 8D 4E
	ld e, $01 ; ABEF7 (2a:7ef7) -> 1E 01
	ld hl, $00df ; ABEF9 (2a:7ef9) -> 21 DF 00
	scall EventFlagAction ; ABEFC (2a:7efc) -> CD 1B 46
	ld a, $60 ; ABEFF (2a:7eff) -> 3E 60
	scall PlaySFX ; ABF01 (2a:7f01) -> CD FE 4E
	ld e, $03 ; ABF04 (2a:7f04) -> 1E 03
	xor a ; ABF06 (2a:7f06) -> AF
	scall SpriteFace ; ABF07 (2a:7f07) -> CD 95 40
	ld e, $00 ; ABF0A (2a:7f0a) -> 1E 00
	xor a ; ABF0C (2a:7f0c) -> AF
	scall SpriteFace ; ABF0D (2a:7f0d) -> CD 95 40
	ld e, $01 ; ABF10 (2a:7f10) -> 1E 01
	xor a ; ABF12 (2a:7f12) -> AF
	scall SpriteFace ; ABF13 (2a:7f13) -> CD 95 40
	ld e, $02 ; ABF16 (2a:7f16) -> 1E 02
	xor a ; ABF18 (2a:7f18) -> AF
	scall SpriteFace ; ABF19 (2a:7f19) -> CD 95 40
	ld e, $03 ; ABF1C (2a:7f1c) -> 1E 03
	xor a ; ABF1E (2a:7f1e) -> AF
	scall SpriteFace ; ABF1F (2a:7f1f) -> CD 95 40
	ld e, $00 ; ABF22 (2a:7f22) -> 1E 00
	xor a ; ABF24 (2a:7f24) -> AF
	scall SpriteFace ; ABF25 (2a:7f25) -> CD 95 40
	ld e, $01 ; ABF28 (2a:7f28) -> 1E 01
	xor a ; ABF2A (2a:7f2a) -> AF
	scall SpriteFace ; ABF2B (2a:7f2b) -> CD 95 40
	ld e, $02 ; ABF2E (2a:7f2e) -> 1E 02
	xor a ; ABF30 (2a:7f30) -> AF
	scall SpriteFace ; ABF31 (2a:7f31) -> CD 95 40
	ld a, $0f ; ABF34 (2a:7f34) -> 3E 0F
	scall FadeOutAudio ; ABF36 (2a:7f36) -> CD F1 4F
	xor a ; ABF39 (2a:7f39) -> AF
	scall PlayMusic ; ABF3A (2a:7f3a) -> CD E6 4E
	ld a, $01 ; ABF3D (2a:7f3d) -> 3E 01
	scall FadeInAudio ; ABF3F (2a:7f3f) -> CD 1A 50
	ld a, $12 ; ABF42 (2a:7f42) -> 3E 12
	scall PlayMusic ; ABF44 (2a:7f44) -> CD E6 4E
	xor a ; ABF47 (2a:7f47) -> AF
	scall FacePlayer ; ABF48 (2a:7f48) -> CD 4B 44
	ld e, $00 ; ABF4B (2a:7f4b) -> 1E 00
	xor a ; ABF4D (2a:7f4d) -> AF
	scall SetPersonVisibilityState ; ABF4E (2a:7f4e) -> CD 3D 41
	jp .asm_abf5a ; ABF51 (2a:7f51) -> C3 5A 7F
.asm_abf54:
	ld hl, $015c ; ABF54 (2a:7f54) -> 21 5C 01
	scall PrintTextStandard ; ABF57 (2a:7f57) -> CD 98 44
.asm_abf5a:
	ret  ; ABF5A (2a:7f5a) -> C9

Func_abf5b:
	ld a, e ; ABF5B (2a:7f5b) -> 7B
	or a ; ABF5C (2a:7f5c) -> B7
	jp nz, .asm_abf79 ; ABF5D (2a:7f5d) -> C2 79 7F
	ld hl, $0048 ; ABF60 (2a:7f60) -> 21 48 00
	scall CheckEventFlag ; ABF63 (2a:7f63) -> CD 2E 46
	or a ; ABF66 (2a:7f66) -> B7
	jp nz, .asm_abf73 ; ABF67 (2a:7f67) -> C2 73 7F
	ld hl, $0139 ; ABF6A (2a:7f6a) -> 21 39 01
	scall PrintTextWithNPCName ; ABF6D (2a:7f6d) -> CD A9 44
	jp .asm_abf79 ; ABF70 (2a:7f70) -> C3 79 7F
.asm_abf73:
	ld hl, $0419 ; ABF73 (2a:7f73) -> 21 19 04
	scall PrintTextWithNPCName ; ABF76 (2a:7f76) -> CD A9 44
.asm_abf79:
	ret  ; ABF79 (2a:7f79) -> C9

Data_abf7a:
	db $0e, $1c, $04, $01, $19, $00, $08, $05, $08, $06
	db $2e, $0e, $05, $04, $01, $19, $0a, $10, $1a, $10, $19, $2e

Func_abf90:: ; abf90
	db $1e, $02, $21, $7a, $7f, $cd, $3a, $40, $cd, $1c, $40, $c9

