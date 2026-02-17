INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 23", ROMX
	script_library 23

Data_8d0b4:
	db $05, $14, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $15
	db $05, $01, $01, $02, $00, $17, $10, $17, $0f, $2e, $0c, $06, $01, $01, $20, $07
	db $05, $09, $05, $08, $34, $11, $06, $01, $01, $20, $02, $01, $0a, $01, $09, $34
	db $19, $06, $01, $01, $20, $02, $01, $0a, $01, $09, $34, $1e, $06, $01, $01, $20
	db $06, $06, $0c, $06, $0b, $34, $0c, $0c, $01, $01, $20, $08, $05, $09, $05, $08
	db $34, $11, $0c, $01, $01, $20, $01, $01, $08, $01, $07, $34, $19, $0c, $01, $01
	db $20, $01, $01, $08, $01, $07, $34, $1d, $0c, $01, $01, $20, $00, $01, $05, $01
	db $04, $34, $0c, $12, $01, $01, $20, $05, $06, $0b, $06, $0a, $34, $11, $12, $01
	db $01, $20, $01, $01, $08, $01, $07, $34, $19, $12, $01, $01, $20, $01, $01, $08
	db $01, $07, $34, $1d, $12, $01, $01, $20, $00, $01, $05, $01, $04, $34, $23, $14
	db $01, $01, $20, $05, $06, $0b, $06, $0a, $34

Data_8d159:
	db $07, $11, $01, $01, $20, $03, $01, $08, $01, $07, $34

Data_8d164:
	db $ac, $02, $ff, $ff

Data_8d168:
	db $ad, $02, $ff, $ff

Data_8d16c:
	db $82, $01, $ff, $ff

Data_8d170:
	db $90, $01, $ff, $ff

Data_8d174:
	db $53, $03, $ff, $ff

Data_8d178:
	db $8f, $01, $ff, $ff

Data_8d17c:
	db $26, $03, $ff, $ff

Data_8d180:
	db $7f, $01, $ff, $ff

Data_8d184:
	db $21, $0c, $23, $02, $01, $01, $02, $04, $00, $23, $55, $59
	db $00, $00, $22, $0c, $23, $01, $01, $01, $02, $04, $00, $23, $55, $59, $00, $00

Data_8d1a0:
	map_object $ff, $00, $23, $14, $02, $01, $00, $04, $00, Func_8d396, NULL
	map_object $ff, $00, $06, $13, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	map_object $ff, $00, $06, $15, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d164
	map_object $ff, $00, $14, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	map_object $ff, $00, $16, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d168
	map_object $ff, $00, $06, $04, $03, $03, $00, $04, $00, Func_8d2f4, NULL
	map_object $10, $0c, $0d, $08, $01, $01, $03, $04, $00, Func_8db33, NULL
	map_object $06, $04, $0b, $14, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d16c
	map_object $0e, $04, $1c, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_23, Data_8d170
	map_object $04, $04, $1c, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_23, Data_8d174
	map_object $0a, $04, $21, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_23, Data_8d178

Data_8d23a:
	map_object $ff, $00, $07, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8d17c

Data_8d248:
	map_object $ff, $00, $07, $11, $01, $01, $00, $04, $01, Func_8dd80, NULL

Func_8d256:: ; 8d256
	call Func_8da28 ; 8D256 (23:5256) -> CD 28 5A
	ld hl, Func_8da28 ; 8D259 (23:5259) -> 21 28 5A
	scall Func_80f11 ; 8D25C (23:525c) -> CD 11 4F
	xor a ; 8D25F (23:525f) -> AF
	ld [wc789], a ; 8D260 (23:5260) -> EA 89 C7
	ld a, $02 ; 8D263 (23:5263) -> 3E 02
	ld [wc7e2], a ; 8D265 (23:5265) -> EA E2 C7
	ld e, $0f ; 8D268 (23:5268) -> 1E 0F
	ld hl, Data_8d0b4 ; 8D26A (23:526a) -> 21 B4 50
	scall LoadWarps ; 8D26D (23:526d) -> CD 3A 40
	ld e, $02 ; 8D270 (23:5270) -> 1E 02
	ld hl, Data_8d184 ; 8D272 (23:5272) -> 21 84 51
	scall LoadMapObjects ; 8D275 (23:5275) -> CD FB 40
	ld e, $00 ; 8D278 (23:5278) -> 1E 00
	xor a ; 8D27A (23:527a) -> AF
	scall SetPersonVisibilityState ; 8D27B (23:527b) -> CD 3D 41
	ld e, $00 ; 8D27E (23:527e) -> 1E 00
	ld a, $01 ; 8D280 (23:5280) -> 3E 01
	scall SetPersonVisibilityState ; 8D282 (23:5282) -> CD 3D 41
	ld e, $0b ; 8D285 (23:5285) -> 1E 0B
	ld hl, Data_8d1a0 ; 8D287 (23:5287) -> 21 A0 51
	scall LoadMapObjects ; 8D28A (23:528a) -> CD FB 40
	ld a, $07 ; 8D28D (23:528d) -> 3E 07
	scall PlayMusic ; 8D28F (23:528f) -> CD E6 4E
	ld a, $01 ; 8D292 (23:5292) -> 3E 01
	scall LoadPlayerSprite ; 8D294 (23:5294) -> CD C6 4C
	ld hl, $0046 ; 8D297 (23:5297) -> 21 46 00
	scall CheckEventFlag ; 8D29A (23:529a) -> CD 2E 46
	cp $01 ; 8D29D (23:529d) -> FE 01
	jp nz, label_8d2a9 ; 8D29F (23:529f) -> C2 A9 52
	ld e, $00 ; 8D2A2 (23:52a2) -> 1E 00
	ld a, $02 ; 8D2A4 (23:52a4) -> 3E 02
	scall SetPersonVisibilityState ; 8D2A6 (23:52a6) -> CD 3D 41
label_8d2a9:
	ld a, [wc790] ; 8D2A9 (23:52a9) -> FA 90 C7
	or a ; 8D2AC (23:52ac) -> B7
	jp z, label_8d2c0 ; 8D2AD (23:52ad) -> CA C0 52
	ld a, [wc790] ; 8D2B0 (23:52b0) -> FA 90 C7
	cp $04 ; 8D2B3 (23:52b3) -> FE 04
	jp nz, label_8d2c0 ; 8D2B5 (23:52b5) -> C2 C0 52
	ld de, Data_8d180 ; 8D2B8 (23:52b8) -> 11 80 51
	ld a, $09 ; 8D2BB (23:52bb) -> 3E 09
	scall Func_80150 ; 8D2BD (23:52bd) -> CD 50 41
label_8d2c0:
	ld a, [wc790] ; 8D2C0 (23:52c0) -> FA 90 C7
	or a ; 8D2C3 (23:52c3) -> B7
	jp z, label_8d2e2 ; 8D2C4 (23:52c4) -> CA E2 52
	ld a, [wc790] ; 8D2C7 (23:52c7) -> FA 90 C7
	cp $07 ; 8D2CA (23:52ca) -> FE 07
	jp nc, label_8d2e2 ; 8D2CC (23:52cc) -> D2 E2 52
	ld e, $01 ; 8D2CF (23:52cf) -> 1E 01
	ld hl, Data_8d159 ; 8D2D1 (23:52d1) -> 21 59 51
	scall LoadWarps ; 8D2D4 (23:52d4) -> CD 3A 40
	ld e, $01 ; 8D2D7 (23:52d7) -> 1E 01
	ld hl, Data_8d248 ; 8D2D9 (23:52d9) -> 21 48 52
	scall LoadMapObjects ; 8D2DC (23:52dc) -> CD FB 40
	jp label_8d2ea ; 8D2DF (23:52df) -> C3 EA 52
label_8d2e2:
	ld e, $01 ; 8D2E2 (23:52e2) -> 1E 01
	ld hl, Data_8d23a ; 8D2E4 (23:52e4) -> 21 3A 52
	scall LoadMapObjects ; 8D2E7 (23:52e7) -> CD FB 40
label_8d2ea:
	scall Func_8001c ; 8D2EA (23:52ea) -> CD 1C 40
	ret  ; 8D2ED (23:52ed) -> C9

Data_8d2ee:
	db $09, $07, $07, $07, $ff, $ff

Func_8d2f4:
	ld a, e ; 8D2F4 (23:52f4) -> 7B
	or a ; 8D2F5 (23:52f5) -> B7
	jp nz, label_8d395 ; 8D2F6 (23:52f6) -> C2 95 53
	ld a, $0f ; 8D2F9 (23:52f9) -> 3E 0F
	scall Func_80e6d ; 8D2FB (23:52fb) -> CD 6D 4E
	cp $ff ; 8D2FE (23:52fe) -> FE FF
	jp nz, label_8d321 ; 8D300 (23:5300) -> C2 21 53
	ld a, $41 ; 8D303 (23:5303) -> 3E 41
	scall Func_80e6d ; 8D305 (23:5305) -> CD 6D 4E
	cp $ff ; 8D308 (23:5308) -> FE FF
	jp nz, label_8d321 ; 8D30A (23:530a) -> C2 21 53
	ld a, $50 ; 8D30D (23:530d) -> 3E 50
	scall Func_80e6d ; 8D30F (23:530f) -> CD 6D 4E
	cp $ff ; 8D312 (23:5312) -> FE FF
	jp nz, label_8d321 ; 8D314 (23:5314) -> C2 21 53
	ld a, $64 ; 8D317 (23:5317) -> 3E 64
	scall Func_80e6d ; 8D319 (23:5319) -> CD 6D 4E
	cp $ff ; 8D31C (23:531c) -> FE FF
	jp z, label_8d38f ; 8D31E (23:531e) -> CA 8F 53
label_8d321:
	ld a, [wc790] ; 8D321 (23:5321) -> FA 90 C7
	or a ; 8D324 (23:5324) -> B7
	jp z, label_8d386 ; 8D325 (23:5325) -> CA 86 53
	ld a, [wc790] ; 8D328 (23:5328) -> FA 90 C7
	cp $06 ; 8D32B (23:532b) -> FE 06
	jp nc, label_8d386 ; 8D32D (23:532d) -> D2 86 53
	ld hl, $032d ; 8D330 (23:5330) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 8D333 (23:5333) -> CD BA 44
	or a ; 8D336 (23:5336) -> B7
	jp nz, label_8d383 ; 8D337 (23:5337) -> C2 83 53
	ld a, [wPlayerFacing] ; 8D33A (23:533a) -> FA 38 C8
	or a ; 8D33D (23:533d) -> B7
	jp z, label_8d34b ; 8D33E (23:533e) -> CA 4B 53
	ld c, $01 ; 8D341 (23:5341) -> 0E 01
	ld de, Data_8d2ee ; 8D343 (23:5343) -> 11 EE 52
	ld a, $23 ; 8D346 (23:5346) -> 3E 23
	scall MovePlayer ; 8D348 (23:5348) -> CD 3E 46
label_8d34b:
	xor a ; 8D34B (23:534b) -> AF
	scall PlayMusic ; 8D34C (23:534c) -> CD E6 4E
	ld a, $0a ; 8D34F (23:534f) -> 3E 0A
	scall PlayMusic ; 8D351 (23:5351) -> CD E6 4E
	xor a ; 8D354 (23:5354) -> AF
	scall Func_80653 ; 8D355 (23:5355) -> CD 53 46
	ld c, $01 ; 8D358 (23:5358) -> 0E 01
	ld e, $01 ; 8D35A (23:535a) -> 1E 01
	ld a, $0b ; 8D35C (23:535c) -> 3E 0B
	scall LoadEmote ; 8D35E (23:535e) -> CD 76 41
	ld a, $44 ; 8D361 (23:5361) -> 3E 44
	scall PlaySFX ; 8D363 (23:5363) -> CD FE 4E
	scall WaitEmote ; 8D366 (23:5366) -> CD D5 41
	scall HideEmote ; 8D369 (23:5369) -> CD 8B 41
	ld a, $04 ; 8D36C (23:536c) -> 3E 04
	scall LoadPlayerSprite ; 8D36E (23:536e) -> CD C6 4C
	ld a, $03 ; 8D371 (23:5371) -> 3E 03
	scall PlayerFace ; 8D373 (23:5373) -> CD 77 46
	ld l, $09 ; 8D376 (23:5376) -> 2E 09
	push hl ; 8D378 (23:5378) -> E5
	ld c, $2d ; 8D379 (23:5379) -> 0E 2D
	ld e, $02 ; 8D37B (23:537b) -> 1E 02
	ld a, $1e ; 8D37D (23:537d) -> 3E 1E
	scall Func_80dff ; 8D37F (23:537f) -> CD FF 4D
	pop bc ; 8D382 (23:5382) -> C1
label_8d383:
	jp label_8d38c ; 8D383 (23:5383) -> C3 8C 53
label_8d386:
	ld hl, $0377 ; 8D386 (23:5386) -> 21 77 03
	scall PrintTextStandard ; 8D389 (23:5389) -> CD 98 44
label_8d38c:
	jp label_8d395 ; 8D38C (23:538c) -> C3 95 53
label_8d38f:
	ld hl, $0376 ; 8D38F (23:538f) -> 21 76 03
	scall PrintTextStandard ; 8D392 (23:5392) -> CD 98 44
label_8d395:
	ret  ; 8D395 (23:5395) -> C9

Func_8d396:
	push de ; 8D396 (23:5396) -> D5
	xor a ; 8D397 (23:5397) -> AF
	ld hl, $0046 ; 8D398 (23:5398) -> 21 46 00
	scall CheckEventFlag ; 8D39B (23:539b) -> CD 2E 46
	or a ; 8D39E (23:539e) -> B7
	jp nz, label_8d42b ; 8D39F (23:539f) -> C2 2B 54
	ld hl, sp+$00 ; 8D3A2 (23:53a2) -> F8 00
	ld a, [hl] ; 8D3A4 (23:53a4) -> 7E
	or a ; 8D3A5 (23:53a5) -> B7
	jp nz, label_8d42b ; 8D3A6 (23:53a6) -> C2 2B 54
	ld a, [wc78d] ; 8D3A9 (23:53a9) -> FA 8D C7
	cp $07 ; 8D3AC (23:53ac) -> FE 07
	jp z, label_8d3b4 ; 8D3AE (23:53ae) -> CA B4 53
	jp label_8d42b ; 8D3B1 (23:53b1) -> C3 2B 54
label_8d3b4:
	ld e, $01 ; 8D3B4 (23:53b4) -> 1E 01
	xor a ; 8D3B6 (23:53b6) -> AF
	scall SetPersonVisibilityState ; 8D3B7 (23:53b7) -> CD 3D 41
	ld hl, $00e4 ; 8D3BA (23:53ba) -> 21 E4 00
	scall PrintTextWithNPCName ; 8D3BD (23:53bd) -> CD A9 44
	ld l, $11 ; 8D3C0 (23:53c0) -> 2E 11
	xor a ; 8D3C2 (23:53c2) -> AF
label_8d3c3:
	cp l ; 8D3C3 (23:53c3) -> BD
	jp nc, label_8d3e0 ; 8D3C4 (23:53c4) -> D2 E0 53
	push hl ; 8D3C7 (23:53c7) -> E5
	push af ; 8D3C8 (23:53c8) -> F5
	ld e, $01 ; 8D3C9 (23:53c9) -> 1E 01
	xor a ; 8D3CB (23:53cb) -> AF
	scall PlayerStep ; 8D3CC (23:53cc) -> CD 1E 4E
	pop af ; 8D3CF (23:53cf) -> F1
	push af ; 8D3D0 (23:53d0) -> F5
	cp $07 ; 8D3D1 (23:53d1) -> FE 07
	jp nz, label_8d3da ; 8D3D3 (23:53d3) -> C2 DA 53
	xor a ; 8D3D6 (23:53d6) -> AF
	scall Func_80653 ; 8D3D7 (23:53d7) -> CD 53 46
label_8d3da:
	pop af ; 8D3DA (23:53da) -> F1
	inc a ; 8D3DB (23:53db) -> 3C
	pop hl ; 8D3DC (23:53dc) -> E1
	jp label_8d3c3 ; 8D3DD (23:53dd) -> C3 C3 53
label_8d3e0:
	push hl ; 8D3E0 (23:53e0) -> E5
	call Func_8d435 ; 8D3E1 (23:53e1) -> CD 35 54
	xor a ; 8D3E4 (23:53e4) -> AF
	pop hl ; 8D3E5 (23:53e5) -> E1
label_8d3e6:
	cp l ; 8D3E6 (23:53e6) -> BD
	jp nc, label_8d412 ; 8D3E7 (23:53e7) -> D2 12 54
	push hl ; 8D3EA (23:53ea) -> E5
	push af ; 8D3EB (23:53eb) -> F5
	ld e, $01 ; 8D3EC (23:53ec) -> 1E 01
	ld a, $02 ; 8D3EE (23:53ee) -> 3E 02
	scall PlayerStep ; 8D3F0 (23:53f0) -> CD 1E 4E
	pop af ; 8D3F3 (23:53f3) -> F1
	push af ; 8D3F4 (23:53f4) -> F5
	cp $07 ; 8D3F5 (23:53f5) -> FE 07
	jp nz, label_8d40c ; 8D3F7 (23:53f7) -> C2 0C 54
	ld e, $00 ; 8D3FA (23:53fa) -> 1E 00
	xor a ; 8D3FC (23:53fc) -> AF
	scall SetPersonVisibilityState ; 8D3FD (23:53fd) -> CD 3D 41
	ld e, $00 ; 8D400 (23:5400) -> 1E 00
	ld a, $01 ; 8D402 (23:5402) -> 3E 01
	scall SetPersonVisibilityState ; 8D404 (23:5404) -> CD 3D 41
	ld a, $01 ; 8D407 (23:5407) -> 3E 01
	scall Func_80653 ; 8D409 (23:5409) -> CD 53 46
label_8d40c:
	pop af ; 8D40C (23:540c) -> F1
	inc a ; 8D40D (23:540d) -> 3C
	pop hl ; 8D40E (23:540e) -> E1
	jp label_8d3e6 ; 8D40F (23:540f) -> C3 E6 53
label_8d412:
	ld e, $00 ; 8D412 (23:5412) -> 1E 00
	ld a, $02 ; 8D414 (23:5414) -> 3E 02
	scall SetPersonVisibilityState ; 8D416 (23:5416) -> CD 3D 41
	ld a, $0a ; 8D419 (23:5419) -> 3E 0A
	scall Func_80c94 ; 8D41B (23:541b) -> CD 94 4C
	ld a, $0b ; 8D41E (23:541e) -> 3E 0B
	scall Func_80c94 ; 8D420 (23:5420) -> CD 94 4C
	ld e, $01 ; 8D423 (23:5423) -> 1E 01
	ld hl, $0046 ; 8D425 (23:5425) -> 21 46 00
	scall EventFlagAction ; 8D428 (23:5428) -> CD 1B 46
label_8d42b:
	pop bc ; 8D42B (23:542b) -> C1
	ret  ; 8D42C (23:542c) -> C9

Data_8d42d:
	db $24, $02, $ff, $ff

Data_8d431:
	db $23, $02, $ff, $ff

Func_8d435:
	ld hl, $003c ; 8D435 (23:5435) -> 21 3C 00
	scall ScriptSleep ; 8D438 (23:5438) -> CD 8F 46
	ld hl, $00e5 ; 8D43B (23:543b) -> 21 E5 00
	scall PrintTextWithNPCName ; 8D43E (23:543e) -> CD A9 44
	ld hl, $003c ; 8D441 (23:5441) -> 21 3C 00
	scall ScriptSleep ; 8D444 (23:5444) -> CD 8F 46
	ld e, $01 ; 8D447 (23:5447) -> 1E 01
	ld a, $01 ; 8D449 (23:5449) -> 3E 01
	scall SetPersonVisibilityState ; 8D44B (23:544b) -> CD 3D 41
	ld hl, $001e ; 8D44E (23:544e) -> 21 1E 00
	scall ScriptSleep ; 8D451 (23:5451) -> CD 8F 46
	ld e, $00 ; 8D454 (23:5454) -> 1E 00
	xor a ; 8D456 (23:5456) -> AF
	scall SpriteFace ; 8D457 (23:5457) -> CD 95 40
	ld hl, $001e ; 8D45A (23:545a) -> 21 1E 00
	scall ScriptSleep ; 8D45D (23:545d) -> CD 8F 46
	ld bc, Data_8d42d ; 8D460 (23:5460) -> 01 2D 54
	ld e, $23 ; 8D463 (23:5463) -> 1E 23
	xor a ; 8D465 (23:5465) -> AF
	scall MovePersonAndWait ; 8D466 (23:5466) -> CD 88 46
	scall WaitNPCStep ; 8D469 (23:5469) -> CD 0C 42
	ld e, $03 ; 8D46C (23:546c) -> 1E 03
	xor a ; 8D46E (23:546e) -> AF
	scall SpriteFace ; 8D46F (23:546f) -> CD 95 40
	ld hl, $001e ; 8D472 (23:5472) -> 21 1E 00
	scall ScriptSleep ; 8D475 (23:5475) -> CD 8F 46
	ld bc, Data_8d431 ; 8D478 (23:5478) -> 01 31 54
	ld e, $23 ; 8D47B (23:547b) -> 1E 23
	ld a, $01 ; 8D47D (23:547d) -> 3E 01
	scall MovePersonAndWait ; 8D47F (23:547f) -> CD 88 46
	scall WaitNPCStep ; 8D482 (23:5482) -> CD 0C 42
	ld e, $01 ; 8D485 (23:5485) -> 1E 01
	ld a, $01 ; 8D487 (23:5487) -> 3E 01
	scall SpriteFace ; 8D489 (23:5489) -> CD 95 40
	ld hl, $00e6 ; 8D48C (23:548c) -> 21 E6 00
	scall PrintTextWithNPCName ; 8D48F (23:548f) -> CD A9 44
	ld e, $00 ; 8D492 (23:5492) -> 1E 00
	ld a, $01 ; 8D494 (23:5494) -> 3E 01
	scall SpriteFace ; 8D496 (23:5496) -> CD 95 40
	ld e, $02 ; 8D499 (23:5499) -> 1E 02
	xor a ; 8D49B (23:549b) -> AF
	scall SpriteFace ; 8D49C (23:549c) -> CD 95 40
	ld hl, $001e ; 8D49F (23:549f) -> 21 1E 00
	scall ScriptSleep ; 8D4A2 (23:54a2) -> CD 8F 46
	ld e, $03 ; 8D4A5 (23:54a5) -> 1E 03
	xor a ; 8D4A7 (23:54a7) -> AF
	scall SpriteFace ; 8D4A8 (23:54a8) -> CD 95 40
	ld hl, $001e ; 8D4AB (23:54ab) -> 21 1E 00
	scall ScriptSleep ; 8D4AE (23:54ae) -> CD 8F 46
	ld e, $02 ; 8D4B1 (23:54b1) -> 1E 02
	xor a ; 8D4B3 (23:54b3) -> AF
	scall SpriteFace ; 8D4B4 (23:54b4) -> CD 95 40
	ld hl, $00e7 ; 8D4B7 (23:54b7) -> 21 E7 00
	scall PrintTextWithNPCName ; 8D4BA (23:54ba) -> CD A9 44
	ld e, $02 ; 8D4BD (23:54bd) -> 1E 02
	ld a, $01 ; 8D4BF (23:54bf) -> 3E 01
	scall SpriteFace ; 8D4C1 (23:54c1) -> CD 95 40
	ld hl, $00e8 ; 8D4C4 (23:54c4) -> 21 E8 00
	scall PrintTextWithNPCName ; 8D4C7 (23:54c7) -> CD A9 44
	ld hl, $00e9 ; 8D4CA (23:54ca) -> 21 E9 00
	scall PrintTextWithNPCName ; 8D4CD (23:54cd) -> CD A9 44
	ld e, $00 ; 8D4D0 (23:54d0) -> 1E 00
	ld a, $02 ; 8D4D2 (23:54d2) -> 3E 02
	scall SetPersonVisibilityState ; 8D4D4 (23:54d4) -> CD 3D 41
	ret  ; 8D4D7 (23:54d7) -> C9

Func_8d4d8:: ; 8d4d8
	push af ; 8D4D8 (23:54d8) -> F5
	ld hl, $c21a ; 8D4D9 (23:54d9) -> 21 1A C2
	ld [hl], $02 ; 8D4DC (23:54dc) -> 36 02
	inc hl ; 8D4DE (23:54de) -> 23
	ld [hl], $a8 ; 8D4DF (23:54df) -> 36 A8
	inc hl ; 8D4E1 (23:54e1) -> 23
	ld [hl], $4b ; 8D4E2 (23:54e2) -> 36 4B
	xor a ; 8D4E4 (23:54e4) -> AF
	call FarCall ; 8D4E5 (23:54e5) -> CD F8 03
	xor a ; 8D4E8 (23:54e8) -> AF
	scall PlayMusic ; 8D4E9 (23:54e9) -> CD E6 4E
	ld e, $00 ; 8D4EC (23:54ec) -> 1E 00
	ld a, $0c ; 8D4EE (23:54ee) -> 3E 0C
	scall SetPersonVisibilityState ; 8D4F0 (23:54f0) -> CD 3D 41
	ld a, $3a ; 8D4F3 (23:54f3) -> 3E 3A
	scall PlaySFX ; 8D4F5 (23:54f5) -> CD FE 4E
	scall StartShakingScreen ; 8D4F8 (23:54f8) -> CD A2 4E
	ld c, $01 ; 8D4FB (23:54fb) -> 0E 01
	ld e, $01 ; 8D4FD (23:54fd) -> 1E 01
	ld a, $0a ; 8D4FF (23:54ff) -> 3E 0A
	scall LoadEmote ; 8D501 (23:5501) -> CD 76 41
	ld e, $12 ; 8D504 (23:5504) -> 1E 12
	ld a, $23 ; 8D506 (23:5506) -> 3E 23
	scall MoveEmote ; 8D508 (23:5508) -> CD E4 41
	scall WaitEmote ; 8D50B (23:550b) -> CD D5 41
	scall HideEmote ; 8D50E (23:550e) -> CD 8B 41
	ld a, $3a ; 8D511 (23:5511) -> 3E 3A
	scall PlaySFX ; 8D513 (23:5513) -> CD FE 4E
	ld c, $01 ; 8D516 (23:5516) -> 0E 01
	ld e, $01 ; 8D518 (23:5518) -> 1E 01
	ld a, $0a ; 8D51A (23:551a) -> 3E 0A
	scall LoadEmote ; 8D51C (23:551c) -> CD 76 41
	ld e, $11 ; 8D51F (23:551f) -> 1E 11
	ld a, $22 ; 8D521 (23:5521) -> 3E 22
	scall MoveEmote ; 8D523 (23:5523) -> CD E4 41
	scall WaitEmote ; 8D526 (23:5526) -> CD D5 41
	scall HideEmote ; 8D529 (23:5529) -> CD 8B 41
	ld a, $3a ; 8D52C (23:552c) -> 3E 3A
	scall PlaySFX ; 8D52E (23:552e) -> CD FE 4E
	ld c, $01 ; 8D531 (23:5531) -> 0E 01
	ld e, $01 ; 8D533 (23:5533) -> 1E 01
	ld a, $0a ; 8D535 (23:5535) -> 3E 0A
	scall LoadEmote ; 8D537 (23:5537) -> CD 76 41
	ld e, $11 ; 8D53A (23:553a) -> 1E 11
	ld a, $24 ; 8D53C (23:553c) -> 3E 24
	scall MoveEmote ; 8D53E (23:553e) -> CD E4 41
	scall WaitEmote ; 8D541 (23:5541) -> CD D5 41
	scall HideEmote ; 8D544 (23:5544) -> CD 8B 41
	ld a, $3a ; 8D547 (23:5547) -> 3E 3A
	scall PlaySFX ; 8D549 (23:5549) -> CD FE 4E
	ld c, $01 ; 8D54C (23:554c) -> 0E 01
	ld e, $01 ; 8D54E (23:554e) -> 1E 01
	ld a, $0a ; 8D550 (23:5550) -> 3E 0A
	scall LoadEmote ; 8D552 (23:5552) -> CD 76 41
	ld e, $13 ; 8D555 (23:5555) -> 1E 13
	ld a, $22 ; 8D557 (23:5557) -> 3E 22
	scall MoveEmote ; 8D559 (23:5559) -> CD E4 41
	scall WaitEmote ; 8D55C (23:555c) -> CD D5 41
	scall HideEmote ; 8D55F (23:555f) -> CD 8B 41
	ld a, $3a ; 8D562 (23:5562) -> 3E 3A
	scall PlaySFX ; 8D564 (23:5564) -> CD FE 4E
	ld c, $01 ; 8D567 (23:5567) -> 0E 01
	ld e, $01 ; 8D569 (23:5569) -> 1E 01
	ld a, $0a ; 8D56B (23:556b) -> 3E 0A
	scall LoadEmote ; 8D56D (23:556d) -> CD 76 41
	ld e, $13 ; 8D570 (23:5570) -> 1E 13
	ld a, $24 ; 8D572 (23:5572) -> 3E 24
	scall MoveEmote ; 8D574 (23:5574) -> CD E4 41
	scall WaitEmote ; 8D577 (23:5577) -> CD D5 41
	scall HideEmote ; 8D57A (23:557a) -> CD 8B 41
	ld a, $65 ; 8D57D (23:557d) -> 3E 65
	scall PlaySFX ; 8D57F (23:557f) -> CD FE 4E
	scall StopShakingScreen ; 8D582 (23:5582) -> CD B1 4E
	pop af ; 8D585 (23:5585) -> F1
	cp $2d ; 8D586 (23:5586) -> FE 2D
	jp z, label_8d5f5 ; 8D588 (23:5588) -> CA F5 55
	call Func_8da28 ; 8D58B (23:558b) -> CD 28 5A
	scall Func_80f02 ; 8D58E (23:558e) -> CD 02 4F
	ld a, $07 ; 8D591 (23:5591) -> 3E 07
	scall PlayMusic ; 8D593 (23:5593) -> CD E6 4E
	ld a, [wc78d] ; 8D596 (23:5596) -> FA 8D C7
	cp $01 ; 8D599 (23:5599) -> FE 01
	jp z, label_8d5dd ; 8D59B (23:559b) -> CA DD 55
	cp $02 ; 8D59E (23:559e) -> FE 02
	jp z, label_8d5d7 ; 8D5A0 (23:55a0) -> CA D7 55
	cp $03 ; 8D5A3 (23:55a3) -> FE 03
	jp z, label_8d5d1 ; 8D5A5 (23:55a5) -> CA D1 55
	cp $04 ; 8D5A8 (23:55a8) -> FE 04
	jp z, label_8d5cb ; 8D5AA (23:55aa) -> CA CB 55
	cp $05 ; 8D5AD (23:55ad) -> FE 05
	jp z, label_8d5bd ; 8D5AF (23:55af) -> CA BD 55
	cp $06 ; 8D5B2 (23:55b2) -> FE 06
	jp nz, label_8d5f2 ; 8D5B4 (23:55b4) -> C2 F2 55
	call Func_8d8e9 ; 8D5B7 (23:55b7) -> CD E9 58
	jp label_8d5f2 ; 8D5BA (23:55ba) -> C3 F2 55
label_8d5bd:
	call Func_8d877 ; 8D5BD (23:55bd) -> CD 77 58
	ld e, $01 ; 8D5C0 (23:55c0) -> 1E 01
	ld hl, $002f ; 8D5C2 (23:55c2) -> 21 2F 00
	scall EventFlagAction ; 8D5C5 (23:55c5) -> CD 1B 46
	jp label_8d5f2 ; 8D5C8 (23:55c8) -> C3 F2 55
label_8d5cb:
	call Func_8d813 ; 8D5CB (23:55cb) -> CD 13 58
	jp label_8d5f2 ; 8D5CE (23:55ce) -> C3 F2 55
label_8d5d1:
	call Func_8d7b8 ; 8D5D1 (23:55d1) -> CD B8 57
	jp label_8d5f2 ; 8D5D4 (23:55d4) -> C3 F2 55
label_8d5d7:
	call Func_8d76b ; 8D5D7 (23:55d7) -> CD 6B 57
	jp label_8d5f2 ; 8D5DA (23:55da) -> C3 F2 55
label_8d5dd:
	ld hl, $0049 ; 8D5DD (23:55dd) -> 21 49 00
	scall CheckEventFlag ; 8D5E0 (23:55e0) -> CD 2E 46
	or a ; 8D5E3 (23:55e3) -> B7
	jp nz, label_8d5f2 ; 8D5E4 (23:55e4) -> C2 F2 55
	call Func_8d61a ; 8D5E7 (23:55e7) -> CD 1A 56
	ld e, $01 ; 8D5EA (23:55ea) -> 1E 01
	ld hl, $0049 ; 8D5EC (23:55ec) -> 21 49 00
	scall EventFlagAction ; 8D5EF (23:55ef) -> CD 1B 46
label_8d5f2:
	jp label_8d5fa ; 8D5F2 (23:55f2) -> C3 FA 55
label_8d5f5:
	ld a, $07 ; 8D5F5 (23:55f5) -> 3E 07
	scall PlayMusic ; 8D5F7 (23:55f7) -> CD E6 4E
label_8d5fa:
	call FillVisibleAreaWithBlankTile ; 8D5FA (23:55fa) -> CD A8 3A
	ret  ; 8D5FD (23:55fd) -> C9

Data_8d5fe:
	db $24, $16, $ff, $ff

Data_8d602:
	db $23, $15, $24, $15, $ff, $ff

Data_8d608:
	db $25, $15, $ff, $ff

Data_8d60c:
	db $23, $15, $24, $15, $ff, $ff

Data_8d612:
	db $1c, $15, $ff, $ff

Data_8d616:
	db $1d, $15, $ff, $ff

Func_8d61a:
	xor a ; 8D61A (23:561a) -> AF
	scall PlayMusic ; 8D61B (23:561b) -> CD E6 4E
	ld c, $01 ; 8D61E (23:561e) -> 0E 01
	ld de, Data_8d5fe ; 8D620 (23:5620) -> 11 FE 55
	ld a, $23 ; 8D623 (23:5623) -> 3E 23
	scall MovePlayer ; 8D625 (23:5625) -> CD 3E 46
	scall WaitNPCStep ; 8D628 (23:5628) -> CD 0C 42
	xor a ; 8D62B (23:562b) -> AF
	scall PlayerFace ; 8D62C (23:562c) -> CD 77 46
	ld hl, $003c ; 8D62F (23:562f) -> 21 3C 00
	scall ScriptSleep ; 8D632 (23:5632) -> CD 8F 46
	ld a, $01 ; 8D635 (23:5635) -> 3E 01
	scall PlayMusic ; 8D637 (23:5637) -> CD E6 4E
	ld c, $14 ; 8D63A (23:563a) -> 0E 14
	ld e, $23 ; 8D63C (23:563c) -> 1E 23
	ld a, $01 ; 8D63E (23:563e) -> 3E 01
	scall Func_80080 ; 8D640 (23:5640) -> CD 80 40
	ld e, $01 ; 8D643 (23:5643) -> 1E 01
	ld a, $01 ; 8D645 (23:5645) -> 3E 01
	scall SetPersonVisibilityState ; 8D647 (23:5647) -> CD 3D 41
	ld bc, Data_8d602 ; 8D64A (23:564a) -> 01 02 56
	ld e, $23 ; 8D64D (23:564d) -> 1E 23
	ld a, $01 ; 8D64F (23:564f) -> 3E 01
	scall MovePersonAndWait ; 8D651 (23:5651) -> CD 88 46
	scall WaitNPCStep ; 8D654 (23:5654) -> CD 0C 42
	ld e, $02 ; 8D657 (23:5657) -> 1E 02
	ld a, $01 ; 8D659 (23:5659) -> 3E 01
	scall SpriteFace ; 8D65B (23:565b) -> CD 95 40
	ld hl, $00f0 ; 8D65E (23:565e) -> 21 F0 00
	scall PrintTextWithNPCName ; 8D661 (23:5661) -> CD A9 44
	ld e, $03 ; 8D664 (23:5664) -> 1E 03
	ld a, $01 ; 8D666 (23:5666) -> 3E 01
	scall SpriteFace ; 8D668 (23:5668) -> CD 95 40
	ld hl, $001e ; 8D66B (23:566b) -> 21 1E 00
	scall ScriptSleep ; 8D66E (23:566e) -> CD 8F 46
	ld bc, Data_8d608 ; 8D671 (23:5671) -> 01 08 56
	ld e, $23 ; 8D674 (23:5674) -> 1E 23
	ld a, $01 ; 8D676 (23:5676) -> 3E 01
	scall MovePersonAndWait ; 8D678 (23:5678) -> CD 88 46
	scall WaitNPCStep ; 8D67B (23:567b) -> CD 0C 42
	ld e, $03 ; 8D67E (23:567e) -> 1E 03
	ld a, $01 ; 8D680 (23:5680) -> 3E 01
	scall SpriteFace ; 8D682 (23:5682) -> CD 95 40
	ld c, $14 ; 8D685 (23:5685) -> 0E 14
	ld e, $23 ; 8D687 (23:5687) -> 1E 23
	xor a ; 8D689 (23:5689) -> AF
	scall Func_80080 ; 8D68A (23:568a) -> CD 80 40
	ld e, $01 ; 8D68D (23:568d) -> 1E 01
	xor a ; 8D68F (23:568f) -> AF
	scall SetPersonVisibilityState ; 8D690 (23:5690) -> CD 3D 41
	ld bc, Data_8d60c ; 8D693 (23:5693) -> 01 0C 56
	ld e, $23 ; 8D696 (23:5696) -> 1E 23
	xor a ; 8D698 (23:5698) -> AF
	scall MovePersonAndWait ; 8D699 (23:5699) -> CD 88 46
	scall WaitNPCStep ; 8D69C (23:569c) -> CD 0C 42
	ld e, $00 ; 8D69F (23:569f) -> 1E 00
	xor a ; 8D6A1 (23:56a1) -> AF
	scall SpriteFace ; 8D6A2 (23:56a2) -> CD 95 40
	ld hl, $003c ; 8D6A5 (23:56a5) -> 21 3C 00
	scall ScriptSleep ; 8D6A8 (23:56a8) -> CD 8F 46
	ld e, $02 ; 8D6AB (23:56ab) -> 1E 02
	xor a ; 8D6AD (23:56ad) -> AF
	scall SpriteFace ; 8D6AE (23:56ae) -> CD 95 40
	ld hl, $00f1 ; 8D6B1 (23:56b1) -> 21 F1 00
	scall PrintTextWithNPCName ; 8D6B4 (23:56b4) -> CD A9 44
	ld e, $03 ; 8D6B7 (23:56b7) -> 1E 03
	ld a, $01 ; 8D6B9 (23:56b9) -> 3E 01
	scall SpriteFace ; 8D6BB (23:56bb) -> CD 95 40
	ld hl, $00f2 ; 8D6BE (23:56be) -> 21 F2 00
	scall PrintTextWithNPCName ; 8D6C1 (23:56c1) -> CD A9 44
	ld e, $02 ; 8D6C4 (23:56c4) -> 1E 02
	ld a, $01 ; 8D6C6 (23:56c6) -> 3E 01
	scall SpriteFace ; 8D6C8 (23:56c8) -> CD 95 40
	ld e, $01 ; 8D6CB (23:56cb) -> 1E 01
	xor a ; 8D6CD (23:56cd) -> AF
	scall SpriteFace ; 8D6CE (23:56ce) -> CD 95 40
	ld hl, $001e ; 8D6D1 (23:56d1) -> 21 1E 00
	scall ScriptSleep ; 8D6D4 (23:56d4) -> CD 8F 46
	ld e, $02 ; 8D6D7 (23:56d7) -> 1E 02
	xor a ; 8D6D9 (23:56d9) -> AF
	scall SpriteFace ; 8D6DA (23:56da) -> CD 95 40
	xor a ; 8D6DD (23:56dd) -> AF
	scall PlayMusic ; 8D6DE (23:56de) -> CD E6 4E
label_8d6e1:
	ld hl, $0358 ; 8D6E1 (23:56e1) -> 21 58 03
	scall PrintTextWithNPCNameAndYesNoBox ; 8D6E4 (23:56e4) -> CD CA 44
	or a ; 8D6E7 (23:56e7) -> B7
	jp nz, label_8d75c ; 8D6E8 (23:56e8) -> C2 5C 57
	ld a, $03 ; 8D6EB (23:56eb) -> 3E 03
	scall PlayMusic ; 8D6ED (23:56ed) -> CD E6 4E
	ld hl, $00f3 ; 8D6F0 (23:56f0) -> 21 F3 00
	scall PrintTextWithNPCName ; 8D6F3 (23:56f3) -> CD A9 44
	ld e, $03 ; 8D6F6 (23:56f6) -> 1E 03
	ld a, $01 ; 8D6F8 (23:56f8) -> 3E 01
	scall SpriteFace ; 8D6FA (23:56fa) -> CD 95 40
	ld hl, $001e ; 8D6FD (23:56fd) -> 21 1E 00
	scall ScriptSleep ; 8D700 (23:5700) -> CD 8F 46
	ld e, $02 ; 8D703 (23:5703) -> 1E 02
	ld a, $01 ; 8D705 (23:5705) -> 3E 01
	scall SpriteFace ; 8D707 (23:5707) -> CD 95 40
	ld hl, $001e ; 8D70A (23:570a) -> 21 1E 00
	scall ScriptSleep ; 8D70D (23:570d) -> CD 8F 46
	ld e, $03 ; 8D710 (23:5710) -> 1E 03
	ld a, $01 ; 8D712 (23:5712) -> 3E 01
	scall SpriteFace ; 8D714 (23:5714) -> CD 95 40
	ld hl, $001e ; 8D717 (23:5717) -> 21 1E 00
	scall ScriptSleep ; 8D71A (23:571a) -> CD 8F 46
	ld e, $02 ; 8D71D (23:571d) -> 1E 02
	ld a, $01 ; 8D71F (23:571f) -> 3E 01
	scall SpriteFace ; 8D721 (23:5721) -> CD 95 40
	ld hl, $001e ; 8D724 (23:5724) -> 21 1E 00
	scall ScriptSleep ; 8D727 (23:5727) -> CD 8F 46
	ld hl, $00f5 ; 8D72A (23:572a) -> 21 F5 00
	scall PrintTextWithNPCName ; 8D72D (23:572d) -> CD A9 44
	ld hl, $00f6 ; 8D730 (23:5730) -> 21 F6 00
	scall PrintTextWithNPCName ; 8D733 (23:5733) -> CD A9 44
	ld bc, Data_8d612 ; 8D736 (23:5736) -> 01 12 56
	ld e, $23 ; 8D739 (23:5739) -> 1E 23
	xor a ; 8D73B (23:573b) -> AF
	scall MovePerson ; 8D73C (23:573c) -> CD F7 41
	ld bc, Data_8d616 ; 8D73F (23:573f) -> 01 16 56
	ld e, $23 ; 8D742 (23:5742) -> 1E 23
	ld a, $01 ; 8D744 (23:5744) -> 3E 01
	scall MovePersonAndWait ; 8D746 (23:5746) -> CD 88 46
	scall WaitNPCStep ; 8D749 (23:5749) -> CD 0C 42
	ld e, $00 ; 8D74C (23:574c) -> 1E 00
	xor a ; 8D74E (23:574e) -> AF
	scall SetPersonVisibilityState ; 8D74F (23:574f) -> CD 3D 41
	ld e, $00 ; 8D752 (23:5752) -> 1E 00
	ld a, $01 ; 8D754 (23:5754) -> 3E 01
	scall SetPersonVisibilityState ; 8D756 (23:5756) -> CD 3D 41
	jp label_8d76a ; 8D759 (23:5759) -> C3 6A 57
label_8d75c:
	ld a, $69 ; 8D75C (23:575c) -> 3E 69
	scall PlaySFX ; 8D75E (23:575e) -> CD FE 4E
	ld hl, $00f7 ; 8D761 (23:5761) -> 21 F7 00
	scall PrintTextWithNPCName ; 8D764 (23:5764) -> CD A9 44
	jp label_8d6e1 ; 8D767 (23:5767) -> C3 E1 56
label_8d76a:
	ret  ; 8D76A (23:576a) -> C9
Func_8d76b:
	ld l, $03 ; 8D76B (23:576b) -> 2E 03
	push hl ; 8D76D (23:576d) -> E5
	ld e, $01 ; 8D76E (23:576e) -> 1E 01
	xor a ; 8D770 (23:5770) -> AF
	scall SetPersonVisibilityState ; 8D771 (23:5771) -> CD 3D 41
	ld c, $10 ; 8D774 (23:5774) -> 0E 10
	ld e, $23 ; 8D776 (23:5776) -> 1E 23
	xor a ; 8D778 (23:5778) -> AF
	scall Func_80080 ; 8D779 (23:5779) -> CD 80 40
	xor a ; 8D77C (23:577c) -> AF
	pop hl ; 8D77D (23:577d) -> E1
label_8d77e:
	cp l ; 8D77E (23:577e) -> BD
	jp nc, label_8d790 ; 8D77F (23:577f) -> D2 90 57
	push hl ; 8D782 (23:5782) -> E5
	push af ; 8D783 (23:5783) -> F5
	ld e, $01 ; 8D784 (23:5784) -> 1E 01
	xor a ; 8D786 (23:5786) -> AF
	scall PlayerStep ; 8D787 (23:5787) -> CD 1E 4E
	pop af ; 8D78A (23:578a) -> F1
	inc a ; 8D78B (23:578b) -> 3C
	pop hl ; 8D78C (23:578c) -> E1
	jp label_8d77e ; 8D78D (23:578d) -> C3 7E 57
label_8d790:
	push hl ; 8D790 (23:5790) -> E5
	ld a, $69 ; 8D791 (23:5791) -> 3E 69
	scall PlaySFX ; 8D793 (23:5793) -> CD FE 4E
	ld hl, $00ee ; 8D796 (23:5796) -> 21 EE 00
	scall PrintTextWithNPCName ; 8D799 (23:5799) -> CD A9 44
	xor a ; 8D79C (23:579c) -> AF
	pop hl ; 8D79D (23:579d) -> E1
label_8d79e:
	cp l ; 8D79E (23:579e) -> BD
	jp nc, label_8d7b1 ; 8D79F (23:579f) -> D2 B1 57
	push hl ; 8D7A2 (23:57a2) -> E5
	push af ; 8D7A3 (23:57a3) -> F5
	ld e, $01 ; 8D7A4 (23:57a4) -> 1E 01
	ld a, $02 ; 8D7A6 (23:57a6) -> 3E 02
	scall PlayerStep ; 8D7A8 (23:57a8) -> CD 1E 4E
	pop af ; 8D7AB (23:57ab) -> F1
	inc a ; 8D7AC (23:57ac) -> 3C
	pop hl ; 8D7AD (23:57ad) -> E1
	jp label_8d79e ; 8D7AE (23:57ae) -> C3 9E 57
label_8d7b1:
	ld e, $00 ; 8D7B1 (23:57b1) -> 1E 00
	xor a ; 8D7B3 (23:57b3) -> AF
	scall SetPersonVisibilityState ; 8D7B4 (23:57b4) -> CD 3D 41
	ret  ; 8D7B7 (23:57b7) -> C9
Func_8d7b8:
	ld l, $06 ; 8D7B8 (23:57b8) -> 2E 06
	push hl ; 8D7BA (23:57ba) -> E5
	ld e, $01 ; 8D7BB (23:57bb) -> 1E 01
	ld a, $01 ; 8D7BD (23:57bd) -> 3E 01
	scall SetPersonVisibilityState ; 8D7BF (23:57bf) -> CD 3D 41
	ld c, $0d ; 8D7C2 (23:57c2) -> 0E 0D
	ld e, $23 ; 8D7C4 (23:57c4) -> 1E 23
	ld a, $01 ; 8D7C6 (23:57c6) -> 3E 01
	scall Func_80080 ; 8D7C8 (23:57c8) -> CD 80 40
	xor a ; 8D7CB (23:57cb) -> AF
	pop hl ; 8D7CC (23:57cc) -> E1
label_8d7cd:
	cp l ; 8D7CD (23:57cd) -> BD
	jp nc, label_8d7df ; 8D7CE (23:57ce) -> D2 DF 57
	push hl ; 8D7D1 (23:57d1) -> E5
	push af ; 8D7D2 (23:57d2) -> F5
	ld e, $01 ; 8D7D3 (23:57d3) -> 1E 01
	xor a ; 8D7D5 (23:57d5) -> AF
	scall PlayerStep ; 8D7D6 (23:57d6) -> CD 1E 4E
	pop af ; 8D7D9 (23:57d9) -> F1
	inc a ; 8D7DA (23:57da) -> 3C
	pop hl ; 8D7DB (23:57db) -> E1
	jp label_8d7cd ; 8D7DC (23:57dc) -> C3 CD 57
label_8d7df:
	push hl ; 8D7DF (23:57df) -> E5
	ld a, $68 ; 8D7E0 (23:57e0) -> 3E 68
	scall PlaySFX ; 8D7E2 (23:57e2) -> CD FE 4E
	ld hl, $001e ; 8D7E5 (23:57e5) -> 21 1E 00
	scall ScriptSleep ; 8D7E8 (23:57e8) -> CD 8F 46
	ld a, $68 ; 8D7EB (23:57eb) -> 3E 68
	scall PlaySFX ; 8D7ED (23:57ed) -> CD FE 4E
	ld hl, $00ef ; 8D7F0 (23:57f0) -> 21 EF 00
	scall PrintTextWithNPCName ; 8D7F3 (23:57f3) -> CD A9 44
	xor a ; 8D7F6 (23:57f6) -> AF
	pop hl ; 8D7F7 (23:57f7) -> E1
label_8d7f8:
	cp l ; 8D7F8 (23:57f8) -> BD
	jp nc, label_8d80b ; 8D7F9 (23:57f9) -> D2 0B 58
	push hl ; 8D7FC (23:57fc) -> E5
	push af ; 8D7FD (23:57fd) -> F5
	ld e, $01 ; 8D7FE (23:57fe) -> 1E 01
	ld a, $02 ; 8D800 (23:5800) -> 3E 02
	scall PlayerStep ; 8D802 (23:5802) -> CD 1E 4E
	pop af ; 8D805 (23:5805) -> F1
	inc a ; 8D806 (23:5806) -> 3C
	pop hl ; 8D807 (23:5807) -> E1
	jp label_8d7f8 ; 8D808 (23:5808) -> C3 F8 57
label_8d80b:
	ld e, $00 ; 8D80B (23:580b) -> 1E 00
	ld a, $01 ; 8D80D (23:580d) -> 3E 01
	scall SetPersonVisibilityState ; 8D80F (23:580f) -> CD 3D 41
	ret  ; 8D812 (23:5812) -> C9
Func_8d813:
	ld l, $09 ; 8D813 (23:5813) -> 2E 09
	push hl ; 8D815 (23:5815) -> E5
	ld e, $01 ; 8D816 (23:5816) -> 1E 01
	xor a ; 8D818 (23:5818) -> AF
	scall SetPersonVisibilityState ; 8D819 (23:5819) -> CD 3D 41
	ld c, $0a ; 8D81C (23:581c) -> 0E 0A
	ld e, $23 ; 8D81E (23:581e) -> 1E 23
	xor a ; 8D820 (23:5820) -> AF
	scall Func_80080 ; 8D821 (23:5821) -> CD 80 40
	xor a ; 8D824 (23:5824) -> AF
	pop hl ; 8D825 (23:5825) -> E1
label_8d826:
	cp l ; 8D826 (23:5826) -> BD
	jp nc, label_8d843 ; 8D827 (23:5827) -> D2 43 58
	push hl ; 8D82A (23:582a) -> E5
	push af ; 8D82B (23:582b) -> F5
	ld e, $01 ; 8D82C (23:582c) -> 1E 01
	xor a ; 8D82E (23:582e) -> AF
	scall PlayerStep ; 8D82F (23:582f) -> CD 1E 4E
	pop af ; 8D832 (23:5832) -> F1
	push af ; 8D833 (23:5833) -> F5
	cp $07 ; 8D834 (23:5834) -> FE 07
	jp nz, label_8d83d ; 8D836 (23:5836) -> C2 3D 58
	xor a ; 8D839 (23:5839) -> AF
	scall Func_80653 ; 8D83A (23:583a) -> CD 53 46
label_8d83d:
	pop af ; 8D83D (23:583d) -> F1
	inc a ; 8D83E (23:583e) -> 3C
	pop hl ; 8D83F (23:583f) -> E1
	jp label_8d826 ; 8D840 (23:5840) -> C3 26 58
label_8d843:
	push hl ; 8D843 (23:5843) -> E5
	ld a, $69 ; 8D844 (23:5844) -> 3E 69
	scall PlaySFX ; 8D846 (23:5846) -> CD FE 4E
	ld hl, $00ec ; 8D849 (23:5849) -> 21 EC 00
	scall PrintTextWithNPCName ; 8D84C (23:584c) -> CD A9 44
	xor a ; 8D84F (23:584f) -> AF
	pop hl ; 8D850 (23:5850) -> E1
label_8d851:
	cp l ; 8D851 (23:5851) -> BD
	jp nc, label_8d870 ; 8D852 (23:5852) -> D2 70 58
	push hl ; 8D855 (23:5855) -> E5
	push af ; 8D856 (23:5856) -> F5
	ld e, $01 ; 8D857 (23:5857) -> 1E 01
	ld a, $02 ; 8D859 (23:5859) -> 3E 02
	scall PlayerStep ; 8D85B (23:585b) -> CD 1E 4E
	pop af ; 8D85E (23:585e) -> F1
	push af ; 8D85F (23:585f) -> F5
	cp $03 ; 8D860 (23:5860) -> FE 03
	jp nz, label_8d86a ; 8D862 (23:5862) -> C2 6A 58
	ld a, $01 ; 8D865 (23:5865) -> 3E 01
	scall Func_80653 ; 8D867 (23:5867) -> CD 53 46
label_8d86a:
	pop af ; 8D86A (23:586a) -> F1
	inc a ; 8D86B (23:586b) -> 3C
	pop hl ; 8D86C (23:586c) -> E1
	jp label_8d851 ; 8D86D (23:586d) -> C3 51 58
label_8d870:
	ld e, $00 ; 8D870 (23:5870) -> 1E 00
	xor a ; 8D872 (23:5872) -> AF
	scall SetPersonVisibilityState ; 8D873 (23:5873) -> CD 3D 41
	ret  ; 8D876 (23:5876) -> C9
Func_8d877:
	ld l, $0c ; 8D877 (23:5877) -> 2E 0C
	push hl ; 8D879 (23:5879) -> E5
	ld e, $01 ; 8D87A (23:587a) -> 1E 01
	ld a, $01 ; 8D87C (23:587c) -> 3E 01
	scall SetPersonVisibilityState ; 8D87E (23:587e) -> CD 3D 41
	ld c, $07 ; 8D881 (23:5881) -> 0E 07
	ld e, $23 ; 8D883 (23:5883) -> 1E 23
	ld a, $01 ; 8D885 (23:5885) -> 3E 01
	scall Func_80080 ; 8D887 (23:5887) -> CD 80 40
	xor a ; 8D88A (23:588a) -> AF
	pop hl ; 8D88B (23:588b) -> E1
label_8d88c:
	cp l ; 8D88C (23:588c) -> BD
	jp nc, label_8d8a9 ; 8D88D (23:588d) -> D2 A9 58
	push hl ; 8D890 (23:5890) -> E5
	push af ; 8D891 (23:5891) -> F5
	ld e, $01 ; 8D892 (23:5892) -> 1E 01
	xor a ; 8D894 (23:5894) -> AF
	scall PlayerStep ; 8D895 (23:5895) -> CD 1E 4E
	pop af ; 8D898 (23:5898) -> F1
	push af ; 8D899 (23:5899) -> F5
	cp $07 ; 8D89A (23:589a) -> FE 07
	jp nz, label_8d8a3 ; 8D89C (23:589c) -> C2 A3 58
	xor a ; 8D89F (23:589f) -> AF
	scall Func_80653 ; 8D8A0 (23:58a0) -> CD 53 46
label_8d8a3:
	pop af ; 8D8A3 (23:58a3) -> F1
	inc a ; 8D8A4 (23:58a4) -> 3C
	pop hl ; 8D8A5 (23:58a5) -> E1
	jp label_8d88c ; 8D8A6 (23:58a6) -> C3 8C 58
label_8d8a9:
	push hl ; 8D8A9 (23:58a9) -> E5
	ld a, $68 ; 8D8AA (23:58aa) -> 3E 68
	scall PlaySFX ; 8D8AC (23:58ac) -> CD FE 4E
	ld hl, $001e ; 8D8AF (23:58af) -> 21 1E 00
	scall ScriptSleep ; 8D8B2 (23:58b2) -> CD 8F 46
	ld a, $68 ; 8D8B5 (23:58b5) -> 3E 68
	scall PlaySFX ; 8D8B7 (23:58b7) -> CD FE 4E
	ld hl, $00eb ; 8D8BA (23:58ba) -> 21 EB 00
	scall PrintTextWithNPCName ; 8D8BD (23:58bd) -> CD A9 44
	xor a ; 8D8C0 (23:58c0) -> AF
	pop hl ; 8D8C1 (23:58c1) -> E1
label_8d8c2:
	cp l ; 8D8C2 (23:58c2) -> BD
	jp nc, label_8d8e1 ; 8D8C3 (23:58c3) -> D2 E1 58
	push hl ; 8D8C6 (23:58c6) -> E5
	push af ; 8D8C7 (23:58c7) -> F5
	ld e, $01 ; 8D8C8 (23:58c8) -> 1E 01
	ld a, $02 ; 8D8CA (23:58ca) -> 3E 02
	scall PlayerStep ; 8D8CC (23:58cc) -> CD 1E 4E
	pop af ; 8D8CF (23:58cf) -> F1
	push af ; 8D8D0 (23:58d0) -> F5
	cp $07 ; 8D8D1 (23:58d1) -> FE 07
	jp nz, label_8d8db ; 8D8D3 (23:58d3) -> C2 DB 58
	ld a, $01 ; 8D8D6 (23:58d6) -> 3E 01
	scall Func_80653 ; 8D8D8 (23:58d8) -> CD 53 46
label_8d8db:
	pop af ; 8D8DB (23:58db) -> F1
	inc a ; 8D8DC (23:58dc) -> 3C
	pop hl ; 8D8DD (23:58dd) -> E1
	jp label_8d8c2 ; 8D8DE (23:58de) -> C3 C2 58
label_8d8e1:
	ld e, $00 ; 8D8E1 (23:58e1) -> 1E 00
	ld a, $01 ; 8D8E3 (23:58e3) -> 3E 01
	scall SetPersonVisibilityState ; 8D8E5 (23:58e5) -> CD 3D 41
	ret  ; 8D8E8 (23:58e8) -> C9
Func_8d8e9:
	ld l, $0f ; 8D8E9 (23:58e9) -> 2E 0F
	push hl ; 8D8EB (23:58eb) -> E5
	ld e, $01 ; 8D8EC (23:58ec) -> 1E 01
	xor a ; 8D8EE (23:58ee) -> AF
	scall SetPersonVisibilityState ; 8D8EF (23:58ef) -> CD 3D 41
	ld c, $04 ; 8D8F2 (23:58f2) -> 0E 04
	ld e, $23 ; 8D8F4 (23:58f4) -> 1E 23
	xor a ; 8D8F6 (23:58f6) -> AF
	scall Func_80080 ; 8D8F7 (23:58f7) -> CD 80 40
	xor a ; 8D8FA (23:58fa) -> AF
	pop hl ; 8D8FB (23:58fb) -> E1
label_8d8fc:
	cp l ; 8D8FC (23:58fc) -> BD
	jp nc, label_8d919 ; 8D8FD (23:58fd) -> D2 19 59
	push hl ; 8D900 (23:5900) -> E5
	push af ; 8D901 (23:5901) -> F5
	ld e, $01 ; 8D902 (23:5902) -> 1E 01
	xor a ; 8D904 (23:5904) -> AF
	scall PlayerStep ; 8D905 (23:5905) -> CD 1E 4E
	pop af ; 8D908 (23:5908) -> F1
	push af ; 8D909 (23:5909) -> F5
	cp $07 ; 8D90A (23:590a) -> FE 07
	jp nz, label_8d913 ; 8D90C (23:590c) -> C2 13 59
	xor a ; 8D90F (23:590f) -> AF
	scall Func_80653 ; 8D910 (23:5910) -> CD 53 46
label_8d913:
	pop af ; 8D913 (23:5913) -> F1
	inc a ; 8D914 (23:5914) -> 3C
	pop hl ; 8D915 (23:5915) -> E1
	jp label_8d8fc ; 8D916 (23:5916) -> C3 FC 58
label_8d919:
	push hl ; 8D919 (23:5919) -> E5
	ld a, $69 ; 8D91A (23:591a) -> 3E 69
	scall PlaySFX ; 8D91C (23:591c) -> CD FE 4E
	ld hl, $00ea ; 8D91F (23:591f) -> 21 EA 00
	scall PrintTextWithNPCName ; 8D922 (23:5922) -> CD A9 44
	xor a ; 8D925 (23:5925) -> AF
	pop hl ; 8D926 (23:5926) -> E1
label_8d927:
	cp l ; 8D927 (23:5927) -> BD
	jp nc, label_8d946 ; 8D928 (23:5928) -> D2 46 59
	push hl ; 8D92B (23:592b) -> E5
	push af ; 8D92C (23:592c) -> F5
	ld e, $01 ; 8D92D (23:592d) -> 1E 01
	ld a, $02 ; 8D92F (23:592f) -> 3E 02
	scall PlayerStep ; 8D931 (23:5931) -> CD 1E 4E
	pop af ; 8D934 (23:5934) -> F1
	push af ; 8D935 (23:5935) -> F5
	cp $07 ; 8D936 (23:5936) -> FE 07
	jp nz, label_8d940 ; 8D938 (23:5938) -> C2 40 59
	ld a, $01 ; 8D93B (23:593b) -> 3E 01
	scall Func_80653 ; 8D93D (23:593d) -> CD 53 46
label_8d940:
	pop af ; 8D940 (23:5940) -> F1
	inc a ; 8D941 (23:5941) -> 3C
	pop hl ; 8D942 (23:5942) -> E1
	jp label_8d927 ; 8D943 (23:5943) -> C3 27 59
label_8d946:
	ld e, $00 ; 8D946 (23:5946) -> 1E 00
	xor a ; 8D948 (23:5948) -> AF
	scall SetPersonVisibilityState ; 8D949 (23:5949) -> CD 3D 41
	ret  ; 8D94C (23:594c) -> C9

Data_8d94d:
	db $1e, $15, $ff, $ff

Data_8d951:
	db $1f, $15, $ff, $ff

Func_8d955:
	ld a, e ; 8D955 (23:5955) -> 7B
	or a ; 8D956 (23:5956) -> B7
	jp nz, label_8d9bb ; 8D957 (23:5957) -> C2 BB 59
	ld hl, $0358 ; 8D95A (23:595a) -> 21 58 03
	scall PrintTextWithYesNoBox ; 8D95D (23:595d) -> CD BA 44
	or a ; 8D960 (23:5960) -> B7
	jp nz, label_8d9b5 ; 8D961 (23:5961) -> C2 B5 59
	ld hl, $00f3 ; 8D964 (23:5964) -> 21 F3 00
	scall PrintTextWithNPCName ; 8D967 (23:5967) -> CD A9 44
	ld e, $01 ; 8D96A (23:596a) -> 1E 01
	ld a, $01 ; 8D96C (23:596c) -> 3E 01
	scall SpriteFace ; 8D96E (23:596e) -> CD 95 40
	ld hl, $002d ; 8D971 (23:5971) -> 21 2D 00
	scall ScriptSleep ; 8D974 (23:5974) -> CD 8F 46
	ld e, $01 ; 8D977 (23:5977) -> 1E 01
	xor a ; 8D979 (23:5979) -> AF
	scall SpriteFace ; 8D97A (23:597a) -> CD 95 40
	ld hl, $00f5 ; 8D97D (23:597d) -> 21 F5 00
	scall PrintTextWithNPCName ; 8D980 (23:5980) -> CD A9 44
	ld e, $02 ; 8D983 (23:5983) -> 1E 02
	xor a ; 8D985 (23:5985) -> AF
	scall SpriteFace ; 8D986 (23:5986) -> CD 95 40
	ld hl, $001e ; 8D989 (23:5989) -> 21 1E 00
	scall ScriptSleep ; 8D98C (23:598c) -> CD 8F 46
	ld e, $02 ; 8D98F (23:598f) -> 1E 02
	ld a, $01 ; 8D991 (23:5991) -> 3E 01
	scall SpriteFace ; 8D993 (23:5993) -> CD 95 40
	ld hl, $00f6 ; 8D996 (23:5996) -> 21 F6 00
	scall PrintTextWithNPCName ; 8D999 (23:5999) -> CD A9 44
	ld bc, Data_8d94d ; 8D99C (23:599c) -> 01 4D 59
	ld e, $23 ; 8D99F (23:599f) -> 1E 23
	xor a ; 8D9A1 (23:59a1) -> AF
	scall MovePerson ; 8D9A2 (23:59a2) -> CD F7 41
	ld bc, Data_8d951 ; 8D9A5 (23:59a5) -> 01 51 59
	ld e, $23 ; 8D9A8 (23:59a8) -> 1E 23
	ld a, $01 ; 8D9AA (23:59aa) -> 3E 01
	scall MovePersonAndWait ; 8D9AC (23:59ac) -> CD 88 46
	scall WaitNPCStep ; 8D9AF (23:59af) -> CD 0C 42
	jp label_8d9bb ; 8D9B2 (23:59b2) -> C3 BB 59
label_8d9b5:
	ld hl, $00f7 ; 8D9B5 (23:59b5) -> 21 F7 00
	scall PrintTextWithNPCName ; 8D9B8 (23:59b8) -> CD A9 44
label_8d9bb:
	ret  ; 8D9BB (23:59bb) -> C9

Data_8d9bc:
	db $2a, $03, $04, $03, $22, $12

Data_8d9c2:
	db $2a, $00, $04, $08, $22, $0d

Data_8d9c8:
	db $2a, $00, $04, $08, $22, $0a

Data_8d9ce:
	db $2a, $00, $04, $08, $22, $07

Data_8d9d4:
	db $2a, $00, $04, $08, $22, $04

Data_8d9da:
	db $2a, $00, $04, $08, $22, $01

Data_8d9e0:
	db $2a, $02, $04, $06, $22, $00

Data_8d9e6:
	db $2a, $08, $04, $08, $22, $0a

Data_8d9ec:
	db $2a, $04, $04, $04, $22, $0f

Data_8d9f2:
	db $2a, $04, $04, $04, $22, $0c

Data_8d9f8:
	db $2a, $04, $04, $04, $22, $09

Data_8d9fe:
	db $2a, $04, $04, $04, $22, $06

Data_8da04:
	db $2a, $04, $04, $04, $22, $03

Data_8da0a:
	db $2a, $04, $04, $04, $22, $00

Data_8da10:
	db $0c, $12, $01, $01, $07, $11

Data_8da16:
	db $2a, $0a, $04, $02, $22, $05

Data_8da1c:
	db $2a, $0a, $04, $02, $22, $08

Data_8da22:
	db $2a, $0a, $04, $01, $22, $00

Func_8da28:
	ld a, [wc78d] ; 8DA28 (23:5a28) -> FA 8D C7
	cp $01 ; 8DA2B (23:5a2b) -> FE 01
	jp z, label_8db0e ; 8DA2D (23:5a2d) -> CA 0E 5B
	cp $02 ; 8DA30 (23:5a30) -> FE 02
	jp z, label_8daf9 ; 8DA32 (23:5a32) -> CA F9 5A
	cp $03 ; 8DA35 (23:5a35) -> FE 03
	jp z, label_8dade ; 8DA37 (23:5a37) -> CA DE 5A
	cp $04 ; 8DA3A (23:5a3a) -> FE 04
	jp z, label_8dac3 ; 8DA3C (23:5a3c) -> CA C3 5A
	cp $05 ; 8DA3F (23:5a3f) -> FE 05
	jp z, label_8da9c ; 8DA41 (23:5a41) -> CA 9C 5A
	cp $06 ; 8DA44 (23:5a44) -> FE 06
	jp z, label_8da75 ; 8DA46 (23:5a46) -> CA 75 5A
	cp $07 ; 8DA49 (23:5a49) -> FE 07
	jp nz, label_8db1a ; 8DA4B (23:5a4b) -> C2 1A 5B
	ld hl, Data_8d9ec ; 8DA4E (23:5a4e) -> 21 EC 59
	scall Func_80d9b ; 8DA51 (23:5a51) -> CD 9B 4D
	ld hl, Data_8d9f2 ; 8DA54 (23:5a54) -> 21 F2 59
	scall Func_80d9b ; 8DA57 (23:5a57) -> CD 9B 4D
	ld hl, Data_8d9f8 ; 8DA5A (23:5a5a) -> 21 F8 59
	scall Func_80d9b ; 8DA5D (23:5a5d) -> CD 9B 4D
	ld hl, Data_8d9fe ; 8DA60 (23:5a60) -> 21 FE 59
	scall Func_80d9b ; 8DA63 (23:5a63) -> CD 9B 4D
	ld hl, Data_8da04 ; 8DA66 (23:5a66) -> 21 04 5A
	scall Func_80d9b ; 8DA69 (23:5a69) -> CD 9B 4D
	ld hl, Data_8da0a ; 8DA6C (23:5a6c) -> 21 0A 5A
	scall Func_80d9b ; 8DA6F (23:5a6f) -> CD 9B 4D
	jp label_8db1a ; 8DA72 (23:5a72) -> C3 1A 5B
label_8da75:
	ld hl, Data_8d9c2 ; 8DA75 (23:5a75) -> 21 C2 59
	scall Func_80d9b ; 8DA78 (23:5a78) -> CD 9B 4D
	ld hl, Data_8d9c8 ; 8DA7B (23:5a7b) -> 21 C8 59
	scall Func_80d9b ; 8DA7E (23:5a7e) -> CD 9B 4D
	ld hl, Data_8d9ce ; 8DA81 (23:5a81) -> 21 CE 59
	scall Func_80d9b ; 8DA84 (23:5a84) -> CD 9B 4D
	ld hl, Data_8d9d4 ; 8DA87 (23:5a87) -> 21 D4 59
	scall Func_80d9b ; 8DA8A (23:5a8a) -> CD 9B 4D
	ld hl, Data_8d9da ; 8DA8D (23:5a8d) -> 21 DA 59
	scall Func_80d9b ; 8DA90 (23:5a90) -> CD 9B 4D
	ld hl, Data_8d9e0 ; 8DA93 (23:5a93) -> 21 E0 59
	scall Func_80d9b ; 8DA96 (23:5a96) -> CD 9B 4D
	jp label_8db1a ; 8DA99 (23:5a99) -> C3 1A 5B
label_8da9c:
	ld hl, Data_8da22 ; 8DA9C (23:5a9c) -> 21 22 5A
	scall Func_80d9b ; 8DA9F (23:5a9f) -> CD 9B 4D
	ld hl, Data_8d9c2 ; 8DAA2 (23:5aa2) -> 21 C2 59
	scall Func_80d9b ; 8DAA5 (23:5aa5) -> CD 9B 4D
	ld hl, Data_8d9c8 ; 8DAA8 (23:5aa8) -> 21 C8 59
	scall Func_80d9b ; 8DAAB (23:5aab) -> CD 9B 4D
	ld hl, Data_8d9ce ; 8DAAE (23:5aae) -> 21 CE 59
	scall Func_80d9b ; 8DAB1 (23:5ab1) -> CD 9B 4D
	ld hl, Data_8d9d4 ; 8DAB4 (23:5ab4) -> 21 D4 59
	scall Func_80d9b ; 8DAB7 (23:5ab7) -> CD 9B 4D
	ld hl, Data_8d9da ; 8DABA (23:5aba) -> 21 DA 59
	scall Func_80d9b ; 8DABD (23:5abd) -> CD 9B 4D
	jp label_8db1a ; 8DAC0 (23:5ac0) -> C3 1A 5B
label_8dac3:
	ld hl, Data_8d9c2 ; 8DAC3 (23:5ac3) -> 21 C2 59
	scall Func_80d9b ; 8DAC6 (23:5ac6) -> CD 9B 4D
	ld hl, Data_8d9c8 ; 8DAC9 (23:5ac9) -> 21 C8 59
	scall Func_80d9b ; 8DACC (23:5acc) -> CD 9B 4D
	ld hl, Data_8d9ce ; 8DACF (23:5acf) -> 21 CE 59
	scall Func_80d9b ; 8DAD2 (23:5ad2) -> CD 9B 4D
	ld hl, Data_8d9d4 ; 8DAD5 (23:5ad5) -> 21 D4 59
	scall Func_80d9b ; 8DAD8 (23:5ad8) -> CD 9B 4D
	jp label_8db1a ; 8DADB (23:5adb) -> C3 1A 5B
label_8dade:
	ld hl, Data_8da16 ; 8DADE (23:5ade) -> 21 16 5A
	scall Func_80d9b ; 8DAE1 (23:5ae1) -> CD 9B 4D
	ld hl, Data_8d9c2 ; 8DAE4 (23:5ae4) -> 21 C2 59
	scall Func_80d9b ; 8DAE7 (23:5ae7) -> CD 9B 4D
	ld hl, Data_8d9c8 ; 8DAEA (23:5aea) -> 21 C8 59
	scall Func_80d9b ; 8DAED (23:5aed) -> CD 9B 4D
	ld hl, Data_8d9ce ; 8DAF0 (23:5af0) -> 21 CE 59
	scall Func_80d9b ; 8DAF3 (23:5af3) -> CD 9B 4D
	jp label_8db1a ; 8DAF6 (23:5af6) -> C3 1A 5B
label_8daf9:
	ld hl, Data_8da1c ; 8DAF9 (23:5af9) -> 21 1C 5A
	scall Func_80d9b ; 8DAFC (23:5afc) -> CD 9B 4D
	ld hl, Data_8d9c2 ; 8DAFF (23:5aff) -> 21 C2 59
	scall Func_80d9b ; 8DB02 (23:5b02) -> CD 9B 4D
	ld hl, Data_8d9c8 ; 8DB05 (23:5b05) -> 21 C8 59
	scall Func_80d9b ; 8DB08 (23:5b08) -> CD 9B 4D
	jp label_8db1a ; 8DB0B (23:5b0b) -> C3 1A 5B
label_8db0e:
	ld hl, Data_8d9e6 ; 8DB0E (23:5b0e) -> 21 E6 59
	scall Func_80d9b ; 8DB11 (23:5b11) -> CD 9B 4D
	ld hl, Data_8d9bc ; 8DB14 (23:5b14) -> 21 BC 59
	scall Func_80d9b ; 8DB17 (23:5b17) -> CD 9B 4D
label_8db1a:
	ld a, [wc790] ; 8DB1A (23:5b1a) -> FA 90 C7
	or a ; 8DB1D (23:5b1d) -> B7
	jp z, label_8db2f ; 8DB1E (23:5b1e) -> CA 2F 5B
	ld a, [wc790] ; 8DB21 (23:5b21) -> FA 90 C7
	cp $07 ; 8DB24 (23:5b24) -> FE 07
	jp nc, label_8db2f ; 8DB26 (23:5b26) -> D2 2F 5B
	ld hl, Data_8da10 ; 8DB29 (23:5b29) -> 21 10 5A
	scall Func_80d9b ; 8DB2C (23:5b2c) -> CD 9B 4D
label_8db2f:
	scall Func_80f02 ; 8DB2F (23:5b2f) -> CD 02 4F
	ret  ; 8DB32 (23:5b32) -> C9

Func_8db33:
	push af ; 8DB33 (23:5b33) -> F5
	push bc ; 8DB34 (23:5b34) -> C5
	ld hl, sp+$00 ; 8DB35 (23:5b35) -> F8 00
	ld [hl], $ff ; 8DB37 (23:5b37) -> 36 FF
	ld a, e ; 8DB39 (23:5b39) -> 7B
	or a ; 8DB3A (23:5b3a) -> B7
	jp nz, label_8dd7d ; 8DB3B (23:5b3b) -> C2 7D 5D
	ld hl, sp+$03 ; 8DB3E (23:5b3e) -> F8 03
	ld a, [hl] ; 8DB40 (23:5b40) -> 7E
	scall FacePlayer ; 8DB41 (23:5b41) -> CD 4B 44
	ld a, [wc796] ; 8DB44 (23:5b44) -> FA 96 C7
	or a ; 8DB47 (23:5b47) -> B7
	jp nz, label_8dbd3 ; 8DB48 (23:5b48) -> C2 D3 5B
	ld a, $17 ; 8DB4B (23:5b4b) -> 3E 17
	scall Func_80e6d ; 8DB4D (23:5b4d) -> CD 6D 4E
	ld hl, sp+$01 ; 8DB50 (23:5b50) -> F8 01
	ld [hl], a ; 8DB52 (23:5b52) -> 77
	cp $ff ; 8DB53 (23:5b53) -> FE FF
	jp z, label_8dbd0 ; 8DB55 (23:5b55) -> CA D0 5B
	ld hl, $03eb ; 8DB58 (23:5b58) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DB5B (23:5b5b) -> CD A9 44
	ld a, $17 ; 8DB5E (23:5b5e) -> 3E 17
	scall Func_80e7d ; 8DB60 (23:5b60) -> CD 7D 4E
	cp $01 ; 8DB63 (23:5b63) -> FE 01
	jp nz, label_8dbc7 ; 8DB65 (23:5b65) -> C2 C7 5B
	ld hl, $028c ; 8DB68 (23:5b68) -> 21 8C 02
	scall PrintTextWithNPCName ; 8DB6B (23:5b6b) -> CD A9 44
	ld hl, $0400 ; 8DB6E (23:5b6e) -> 21 00 04
	scall PrintTextWithYesNoBox ; 8DB71 (23:5b71) -> CD BA 44
	or a ; 8DB74 (23:5b74) -> B7
	jp nz, label_8dbb3 ; 8DB75 (23:5b75) -> C2 B3 5B
	ld a, $68 ; 8DB78 (23:5b78) -> 3E 68
	scall PlaySFX ; 8DB7A (23:5b7a) -> CD FE 4E
	ld hl, $0401 ; 8DB7D (23:5b7d) -> 21 01 04
	scall PrintTextWithNPCName ; 8DB80 (23:5b80) -> CD A9 44
	ld hl, sp+$01 ; 8DB83 (23:5b83) -> F8 01
	ld l, [hl] ; 8DB85 (23:5b85) -> 6E
	ld h, $00 ; 8DB86 (23:5b86) -> 26 00
	ld de, $0b00 ; 8DB88 (23:5b88) -> 11 00 0B
	add hl, de ; 8DB8B (23:5b8b) -> 19
	scall Func_80488 ; 8DB8C (23:5b8c) -> CD 88 44
	ld a, l ; 8DB8F (23:5b8f) -> 7D
	push af ; 8DB90 (23:5b90) -> F5
	ld c, $00 ; 8DB91 (23:5b91) -> 0E 00
	ld e, $01 ; 8DB93 (23:5b93) -> 1E 01
	ld hl, sp+$03 ; 8DB95 (23:5b95) -> F8 03
	ld a, [hl] ; 8DB97 (23:5b97) -> 7E
	scall GiveRobot ; 8DB98 (23:5b98) -> CD 87 4D
	pop af ; 8DB9B (23:5b9b) -> F1
	ld c, a ; 8DB9C (23:5b9c) -> 4F
	ld e, $00 ; 8DB9D (23:5b9d) -> 1E 00
	ld a, $26 ; 8DB9F (23:5b9f) -> 3E 26
	scall GiveRobot ; 8DBA1 (23:5ba1) -> CD 87 4D
	ld a, $01 ; 8DBA4 (23:5ba4) -> 3E 01
	ld [wc796], a ; 8DBA6 (23:5ba6) -> EA 96 C7
	ld hl, sp+$00 ; 8DBA9 (23:5ba9) -> F8 00
	ld [hl], $01 ; 8DBAB (23:5bab) -> 36 01
	call Func_8dd96 ; 8DBAD (23:5bad) -> CD 96 5D
	jp label_8dbc4 ; 8DBB0 (23:5bb0) -> C3 C4 5B
label_8dbb3:
	ld a, $69 ; 8DBB3 (23:5bb3) -> 3E 69
	scall PlaySFX ; 8DBB5 (23:5bb5) -> CD FE 4E
	ld hl, $0402 ; 8DBB8 (23:5bb8) -> 21 02 04
	scall PrintTextWithNPCName ; 8DBBB (23:5bbb) -> CD A9 44
	call Func_8dd96 ; 8DBBE (23:5bbe) -> CD 96 5D
	jp label_8dd7d ; 8DBC1 (23:5bc1) -> C3 7D 5D
label_8dbc4:
	jp label_8dbd0 ; 8DBC4 (23:5bc4) -> C3 D0 5B
label_8dbc7:
	ld hl, $046e ; 8DBC7 (23:5bc7) -> 21 6E 04
	scall PrintTextStandard ; 8DBCA (23:5bca) -> CD 98 44
	jp label_8dd7d ; 8DBCD (23:5bcd) -> C3 7D 5D
label_8dbd0:
	jp label_8dd1f ; 8DBD0 (23:5bd0) -> C3 1F 5D
label_8dbd3:
	ld a, [wc796] ; 8DBD3 (23:5bd3) -> FA 96 C7
	cp $07 ; 8DBD6 (23:5bd6) -> FE 07
	jp nz, label_8dc63 ; 8DBD8 (23:5bd8) -> C2 63 5C
	ld a, $50 ; 8DBDB (23:5bdb) -> 3E 50
	scall Func_80e6d ; 8DBDD (23:5bdd) -> CD 6D 4E
	ld hl, sp+$01 ; 8DBE0 (23:5be0) -> F8 01
	ld [hl], a ; 8DBE2 (23:5be2) -> 77
	cp $ff ; 8DBE3 (23:5be3) -> FE FF
	jp z, label_8dc60 ; 8DBE5 (23:5be5) -> CA 60 5C
	ld hl, $03eb ; 8DBE8 (23:5be8) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DBEB (23:5beb) -> CD A9 44
	ld a, $50 ; 8DBEE (23:5bee) -> 3E 50
	scall Func_80e7d ; 8DBF0 (23:5bf0) -> CD 7D 4E
	cp $01 ; 8DBF3 (23:5bf3) -> FE 01
	jp nz, label_8dc57 ; 8DBF5 (23:5bf5) -> C2 57 5C
	ld hl, $028d ; 8DBF8 (23:5bf8) -> 21 8D 02
	scall PrintTextWithNPCName ; 8DBFB (23:5bfb) -> CD A9 44
	ld hl, $0400 ; 8DBFE (23:5bfe) -> 21 00 04
	scall PrintTextWithYesNoBox ; 8DC01 (23:5c01) -> CD BA 44
	or a ; 8DC04 (23:5c04) -> B7
	jp nz, label_8dc43 ; 8DC05 (23:5c05) -> C2 43 5C
	ld a, $68 ; 8DC08 (23:5c08) -> 3E 68
	scall PlaySFX ; 8DC0A (23:5c0a) -> CD FE 4E
	ld hl, $0421 ; 8DC0D (23:5c0d) -> 21 21 04
	scall PrintTextWithNPCName ; 8DC10 (23:5c10) -> CD A9 44
	ld hl, sp+$01 ; 8DC13 (23:5c13) -> F8 01
	ld l, [hl] ; 8DC15 (23:5c15) -> 6E
	ld h, $00 ; 8DC16 (23:5c16) -> 26 00
	ld de, $0b00 ; 8DC18 (23:5c18) -> 11 00 0B
	add hl, de ; 8DC1B (23:5c1b) -> 19
	scall Func_80488 ; 8DC1C (23:5c1c) -> CD 88 44
	ld a, l ; 8DC1F (23:5c1f) -> 7D
	push af ; 8DC20 (23:5c20) -> F5
	ld c, $00 ; 8DC21 (23:5c21) -> 0E 00
	ld e, $01 ; 8DC23 (23:5c23) -> 1E 01
	ld hl, sp+$03 ; 8DC25 (23:5c25) -> F8 03
	ld a, [hl] ; 8DC27 (23:5c27) -> 7E
	scall GiveRobot ; 8DC28 (23:5c28) -> CD 87 4D
	pop af ; 8DC2B (23:5c2b) -> F1
	ld c, a ; 8DC2C (23:5c2c) -> 4F
	ld e, $00 ; 8DC2D (23:5c2d) -> 1E 00
	ld a, $51 ; 8DC2F (23:5c2f) -> 3E 51
	scall GiveRobot ; 8DC31 (23:5c31) -> CD 87 4D
	ld a, $08 ; 8DC34 (23:5c34) -> 3E 08
	ld [wc796], a ; 8DC36 (23:5c36) -> EA 96 C7
	ld hl, sp+$00 ; 8DC39 (23:5c39) -> F8 00
	ld [hl], $01 ; 8DC3B (23:5c3b) -> 36 01
	call Func_8dd96 ; 8DC3D (23:5c3d) -> CD 96 5D
	jp label_8dc54 ; 8DC40 (23:5c40) -> C3 54 5C
label_8dc43:
	ld a, $69 ; 8DC43 (23:5c43) -> 3E 69
	scall PlaySFX ; 8DC45 (23:5c45) -> CD FE 4E
	ld hl, $0402 ; 8DC48 (23:5c48) -> 21 02 04
	scall PrintTextWithNPCName ; 8DC4B (23:5c4b) -> CD A9 44
	call Func_8dd96 ; 8DC4E (23:5c4e) -> CD 96 5D
	jp label_8dd7d ; 8DC51 (23:5c51) -> C3 7D 5D
label_8dc54:
	jp label_8dc60 ; 8DC54 (23:5c54) -> C3 60 5C
label_8dc57:
	ld hl, $046e ; 8DC57 (23:5c57) -> 21 6E 04
	scall PrintTextStandard ; 8DC5A (23:5c5a) -> CD 98 44
	jp label_8dd7d ; 8DC5D (23:5c5d) -> C3 7D 5D
label_8dc60:
	jp label_8dd1f ; 8DC60 (23:5c60) -> C3 1F 5D
label_8dc63:
	ld a, $17 ; 8DC63 (23:5c63) -> 3E 17
	scall Func_80e6d ; 8DC65 (23:5c65) -> CD 6D 4E
	ld hl, sp+$01 ; 8DC68 (23:5c68) -> F8 01
	ld [hl], a ; 8DC6A (23:5c6a) -> 77
	cp $ff ; 8DC6B (23:5c6b) -> FE FF
	jp nz, label_8dc7d ; 8DC6D (23:5c6d) -> C2 7D 5C
	ld a, $50 ; 8DC70 (23:5c70) -> 3E 50
	scall Func_80e6d ; 8DC72 (23:5c72) -> CD 6D 4E
	ld hl, sp+$01 ; 8DC75 (23:5c75) -> F8 01
	ld [hl], a ; 8DC77 (23:5c77) -> 77
	cp $ff ; 8DC78 (23:5c78) -> FE FF
	jp z, label_8dd1f ; 8DC7A (23:5c7a) -> CA 1F 5D
label_8dc7d:
	ld a, [wc796] ; 8DC7D (23:5c7d) -> FA 96 C7
	cp $08 ; 8DC80 (23:5c80) -> FE 08
	jp z, label_8dd07 ; 8DC82 (23:5c82) -> CA 07 5D
	cp $06 ; 8DC85 (23:5c85) -> FE 06
	jp z, label_8dd07 ; 8DC87 (23:5c87) -> CA 07 5D
	cp $0a ; 8DC8A (23:5c8a) -> FE 0A
	jp z, label_8dcf8 ; 8DC8C (23:5c8c) -> CA F8 5C
	cp $05 ; 8DC8F (23:5c8f) -> FE 05
	jp z, label_8dcf8 ; 8DC91 (23:5c91) -> CA F8 5C
	cp $0c ; 8DC94 (23:5c94) -> FE 0C
	jp z, label_8dce9 ; 8DC96 (23:5c96) -> CA E9 5C
	cp $04 ; 8DC99 (23:5c99) -> FE 04
	jp z, label_8dce9 ; 8DC9B (23:5c9b) -> CA E9 5C
	cp $0d ; 8DC9E (23:5c9e) -> FE 0D
	jp z, label_8dcda ; 8DCA0 (23:5ca0) -> CA DA 5C
	cp $03 ; 8DCA3 (23:5ca3) -> FE 03
	jp z, label_8dcda ; 8DCA5 (23:5ca5) -> CA DA 5C
	cp $0b ; 8DCA8 (23:5ca8) -> FE 0B
	jp z, label_8dccb ; 8DCAA (23:5caa) -> CA CB 5C
	cp $02 ; 8DCAD (23:5cad) -> FE 02
	jp z, label_8dccb ; 8DCAF (23:5caf) -> CA CB 5C
	cp $09 ; 8DCB2 (23:5cb2) -> FE 09
	jp z, label_8dcbc ; 8DCB4 (23:5cb4) -> CA BC 5C
	cp $01 ; 8DCB7 (23:5cb7) -> FE 01
	jp nz, label_8dd16 ; 8DCB9 (23:5cb9) -> C2 16 5D
label_8dcbc:
	ld hl, $0140 ; 8DCBC (23:5cbc) -> 21 40 01
	scall PrintTextStandard ; 8DCBF (23:5cbf) -> CD 98 44
	ld hl, $034d ; 8DCC2 (23:5cc2) -> 21 4D 03
	scall PrintTextStandard ; 8DCC5 (23:5cc5) -> CD 98 44
	jp label_8dd1c ; 8DCC8 (23:5cc8) -> C3 1C 5D
label_8dccb:
	ld hl, $0140 ; 8DCCB (23:5ccb) -> 21 40 01
	scall PrintTextStandard ; 8DCCE (23:5cce) -> CD 98 44
	ld hl, $0205 ; 8DCD1 (23:5cd1) -> 21 05 02
	scall PrintTextStandard ; 8DCD4 (23:5cd4) -> CD 98 44
	jp label_8dd1c ; 8DCD7 (23:5cd7) -> C3 1C 5D
label_8dcda:
	ld hl, $0140 ; 8DCDA (23:5cda) -> 21 40 01
	scall PrintTextStandard ; 8DCDD (23:5cdd) -> CD 98 44
	ld hl, $020a ; 8DCE0 (23:5ce0) -> 21 0A 02
	scall PrintTextStandard ; 8DCE3 (23:5ce3) -> CD 98 44
	jp label_8dd1c ; 8DCE6 (23:5ce6) -> C3 1C 5D
label_8dce9:
	ld hl, $0140 ; 8DCE9 (23:5ce9) -> 21 40 01
	scall PrintTextStandard ; 8DCEC (23:5cec) -> CD 98 44
	ld hl, $0218 ; 8DCEF (23:5cef) -> 21 18 02
	scall PrintTextStandard ; 8DCF2 (23:5cf2) -> CD 98 44
	jp label_8dd1c ; 8DCF5 (23:5cf5) -> C3 1C 5D
label_8dcf8:
	ld hl, $0140 ; 8DCF8 (23:5cf8) -> 21 40 01
	scall PrintTextStandard ; 8DCFB (23:5cfb) -> CD 98 44
	ld hl, $0241 ; 8DCFE (23:5cfe) -> 21 41 02
	scall PrintTextStandard ; 8DD01 (23:5d01) -> CD 98 44
	jp label_8dd1c ; 8DD04 (23:5d04) -> C3 1C 5D
label_8dd07:
	ld hl, $0140 ; 8DD07 (23:5d07) -> 21 40 01
	scall PrintTextStandard ; 8DD0A (23:5d0a) -> CD 98 44
	ld hl, $0244 ; 8DD0D (23:5d0d) -> 21 44 02
	scall PrintTextStandard ; 8DD10 (23:5d10) -> CD 98 44
	jp label_8dd1c ; 8DD13 (23:5d13) -> C3 1C 5D
label_8dd16:
	ld hl, $03eb ; 8DD16 (23:5d16) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DD19 (23:5d19) -> CD A9 44
label_8dd1c:
	jp label_8dd7d ; 8DD1C (23:5d1c) -> C3 7D 5D
label_8dd1f:
	ld hl, sp+$00 ; 8DD1F (23:5d1f) -> F8 00
	ld a, [hl] ; 8DD21 (23:5d21) -> 7E
	cp $ff ; 8DD22 (23:5d22) -> FE FF
	jp nz, label_8dd7d ; 8DD24 (23:5d24) -> C2 7D 5D
	ld a, [wc796] ; 8DD27 (23:5d27) -> FA 96 C7
	cp $08 ; 8DD2A (23:5d2a) -> FE 08
	jp nc, label_8dd49 ; 8DD2C (23:5d2c) -> D2 49 5D
	ld a, [wc796] ; 8DD2F (23:5d2f) -> FA 96 C7
	cp $01 ; 8DD32 (23:5d32) -> FE 01
	jp c, label_8dd49 ; 8DD34 (23:5d34) -> DA 49 5D
	ld hl, $03eb ; 8DD37 (23:5d37) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DD3A (23:5d3a) -> CD A9 44
	ld hl, $0420 ; 8DD3D (23:5d3d) -> 21 20 04
	scall PrintTextWithNPCName ; 8DD40 (23:5d40) -> CD A9 44
	call Func_8dd96 ; 8DD43 (23:5d43) -> CD 96 5D
	jp label_8dd7d ; 8DD46 (23:5d46) -> C3 7D 5D
label_8dd49:
	ld a, [wc796] ; 8DD49 (23:5d49) -> FA 96 C7
	cp $0f ; 8DD4C (23:5d4c) -> FE 0F
	jp nz, label_8dd5a ; 8DD4E (23:5d4e) -> C2 5A 5D
	ld hl, $03eb ; 8DD51 (23:5d51) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DD54 (23:5d54) -> CD A9 44
	jp label_8dd7d ; 8DD57 (23:5d57) -> C3 7D 5D
label_8dd5a:
	ld a, [wc796] ; 8DD5A (23:5d5a) -> FA 96 C7
	cp $08 ; 8DD5D (23:5d5d) -> FE 08
	jp c, label_8dd6e ; 8DD5F (23:5d5f) -> DA 6E 5D
	ld hl, $0423 ; 8DD62 (23:5d62) -> 21 23 04
	scall PrintTextWithNPCName ; 8DD65 (23:5d65) -> CD A9 44
	call Func_8dd96 ; 8DD68 (23:5d68) -> CD 96 5D
	jp label_8dd7d ; 8DD6B (23:5d6b) -> C3 7D 5D
label_8dd6e:
	ld hl, $03eb ; 8DD6E (23:5d6e) -> 21 EB 03
	scall PrintTextWithNPCName ; 8DD71 (23:5d71) -> CD A9 44
	ld hl, $018c ; 8DD74 (23:5d74) -> 21 8C 01
	scall PrintTextWithNPCName ; 8DD77 (23:5d77) -> CD A9 44
	call Func_8dd96 ; 8DD7A (23:5d7a) -> CD 96 5D
label_8dd7d:
	pop bc ; 8DD7D (23:5d7d) -> C1
	pop bc ; 8DD7E (23:5d7e) -> C1
	ret  ; 8DD7F (23:5d7f) -> C9

Func_8dd80:
	ld a, e ; 8DD80 (23:5d80) -> 7B
	cp $02 ; 8DD81 (23:5d81) -> FE 02
	jp nz, label_8dd8b ; 8DD83 (23:5d83) -> C2 8B 5D
	ld a, $07 ; 8DD86 (23:5d86) -> 3E 07
	ld [wc78a], a ; 8DD88 (23:5d88) -> EA 8A C7
label_8dd8b:
	ret  ; 8DD8B (23:5d8b) -> C9

Data_8dd8c:
	db $14, $08, $ff, $ff

Data_8dd90:
	db $0d, $07, $14, $08, $ff, $ff

Func_8dd96:
	ld a, [wPlayerFacing] ; 8DD96 (23:5d96) -> FA 38 C8
	cp $03 ; 8DD99 (23:5d99) -> FE 03
	jp nz, label_8ddc0 ; 8DD9B (23:5d9b) -> C2 C0 5D
	ld hl, $001e ; 8DD9E (23:5d9e) -> 21 1E 00
	scall ScriptSleep ; 8DDA1 (23:5da1) -> CD 8F 46
	ld a, $2e ; 8DDA4 (23:5da4) -> 3E 2E
	scall PlaySFX ; 8DDA6 (23:5da6) -> CD FE 4E
	ld bc, Data_8dd90 ; 8DDA9 (23:5da9) -> 01 90 5D
	ld e, $23 ; 8DDAC (23:5dac) -> 1E 23
	ld a, $08 ; 8DDAE (23:5dae) -> 3E 08
	scall MovePersonAndWait ; 8DDB0 (23:5db0) -> CD 88 46
	scall WaitNPCStep ; 8DDB3 (23:5db3) -> CD 0C 42
	ld e, $00 ; 8DDB6 (23:5db6) -> 1E 00
	ld a, $08 ; 8DDB8 (23:5db8) -> 3E 08
	scall SetPersonVisibilityState ; 8DDBA (23:5dba) -> CD 3D 41
	jp label_8dddf ; 8DDBD (23:5dbd) -> C3 DF 5D
label_8ddc0:
	ld hl, $001e ; 8DDC0 (23:5dc0) -> 21 1E 00
	scall ScriptSleep ; 8DDC3 (23:5dc3) -> CD 8F 46
	ld a, $2e ; 8DDC6 (23:5dc6) -> 3E 2E
	scall PlaySFX ; 8DDC8 (23:5dc8) -> CD FE 4E
	ld bc, Data_8dd8c ; 8DDCB (23:5dcb) -> 01 8C 5D
	ld e, $23 ; 8DDCE (23:5dce) -> 1E 23
	ld a, $08 ; 8DDD0 (23:5dd0) -> 3E 08
	scall MovePersonAndWait ; 8DDD2 (23:5dd2) -> CD 88 46
	scall WaitNPCStep ; 8DDD5 (23:5dd5) -> CD 0C 42
	ld e, $00 ; 8DDD8 (23:5dd8) -> 1E 00
	ld a, $08 ; 8DDDA (23:5dda) -> 3E 08
	scall SetPersonVisibilityState ; 8DDDC (23:5ddc) -> CD 3D 41
label_8dddf:
	ret  ; 8DDDF (23:5ddf) -> C9

Data_8dde0:
	db $0c, $04, $01, $01, $ff, $ff, $ff, $ff
	db $ff, $ff, $2e, $12, $11, $01, $01, $08, $00, $13, $0d, $12, $0d, $2e, $b8, $02
	db $ff, $ff, $23, $03, $24, $03, $25, $03, $ff, $ff, $02, $0c, $0e, $07, $01, $01
	db $03, $04, $00, $23, $e6, $5f, $00, $00, $0c, $0c, $0a, $09, $01, $01, $01, $04
	db $00, $23, $80, $60, $00, $00, $00, $0c, $09, $0c, $01, $01, $01, $04, $00, $23
	db $1a, $61, $00, $00, $0c, $0c, $0d, $0d, $01, $01, $03, $04, $00, $23, $b2, $61
	db $00, $00, $0b, $0c, $07, $11, $01, $01, $01, $04, $00, $23, $4c, $62, $00, $00
	db $04, $0c, $12, $11, $01, $01, $02, $04, $00, $23, $00, $00, $00, $00, $ff, $00
	db $0e, $10, $03, $03, $00, $04, $01, $23, $be, $62, $00, $00, $0f, $04, $06, $05
	db $01, $01, $02, $04, $00, $23, $00, $00, $00, $00, $ff, $00, $06, $05, $01, $01
	db $02, $04, $00, $23, $6e, $63, $00, $00, $ff, $00, $0b, $05, $01, $01, $00, $04
	db $00, $23, $5f, $48, $f6, $5d, $ff, $00, $0d, $05, $01, $01, $00, $04, $00, $23
	db $5f, $48, $f6, $5d, $ff, $00, $0c, $0b, $01, $01, $00, $04, $00, $23, $7c, $4a
	db $fa, $5d

Func_8deaa:: ; 8deaa
	db $3e, $06, $ea, $e2, $c7, $cd, $6e, $5f, $21, $6e, $5f, $cd, $11, $4f, $1e, $02
	db $21, $e0, $5d, $cd, $3a, $40, $1e, $05, $21, $64, $5e, $cd, $fb, $40, $1e, $00
	db $af, $cd, $3d, $41, $21, $37, $00, $cd, $2e, $46, $b7, $c2, $41, $5f, $1e, $07
	db $21, $02, $5e, $cd, $fb, $40, $1e, $00, $3e, $0a, $cd, $3d, $41, $21, $28, $00
	db $cd, $2e, $46, $fe, $01, $c2, $f9, $5e, $1e, $00, $3e, $05, $cd, $3d, $41, $21
	db $29, $00, $cd, $2e, $46, $fe, $01, $c2, $0b, $5f, $1e, $00, $3e, $06, $cd, $3d
	db $41, $21, $2a, $00, $cd, $2e, $46, $fe, $01, $c2, $1d, $5f, $1e, $00, $3e, $07
	db $cd, $3d, $41, $21, $2b, $00, $cd, $2e, $46, $fe, $01, $c2, $2f, $5f, $1e, $00
	db $3e, $08, $cd, $3d, $41, $21, $2c, $00, $cd, $2e, $46, $fe, $01, $c2, $41, $5f
	db $1e, $00, $3e, $09, $cd, $3d, $41, $21, $37, $00, $cd, $2e, $46, $fe, $01, $c2
	db $54, $5f, $3e, $03, $cd, $e6, $4e, $c3, $59, $5f, $3e, $04, $cd, $e6, $4e, $3e
	db $01, $cd, $c6, $4c, $cd, $1c, $40, $c9, $10, $0d, $01, $01, $12, $12, $11, $12
	db $01, $01, $12, $12, $21, $28, $00, $cd, $2e, $46, $b7, $ca, $a0, $5f, $21, $29
	db $00, $cd, $2e, $46, $b7, $ca, $a0, $5f, $21, $2a, $00, $cd, $2e, $46, $b7, $ca
	db $a0, $5f, $21, $2b, $00, $cd, $2e, $46, $b7, $ca, $a0, $5f, $21, $2c, $00, $cd
	db $2e, $46, $b7, $c2, $a9, $5f, $21, $62, $5f, $cd, $9b, $4d, $c3, $af, $5f, $21
	db $68, $5f, $cd, $9b, $4d, $cd, $02, $4f, $c9, $0c, $04, $ff, $ff, $0e, $06, $0c
	db $04, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b2, $00, $00, $1f, $01, $1f, $03
	db $11, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2
	db $46, $60, $21, $28, $00, $cd, $2e, $46, $b7, $c2, $46, $60, $f8, $01, $7e, $cd
	db $4b, $44, $21, $35, $02, $cd, $98, $44, $11, $48, $60, $21, $bd, $5f, $cd, $d3
	db $4d, $b7, $c2, $12, $60, $c3, $46, $60, $fa, $38, $c8, $fe, $01, $c2, $28, $60
	db $01, $b7, $5f, $1e, $23, $f8, $01, $7e, $cd, $88, $46, $c3, $33, $60, $01, $b3
	db $5f, $1e, $23, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01
	db $7e, $cd, $3d, $41, $1e, $01, $21, $28, $00, $cd, $1b, $46, $c1, $c9, $bf, $de
	db $b8, $31, $00, $0a, $08, $0c, $04, $ff, $ff, $0c, $04, $ff, $ff, $00, $00, $00
	db $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17, $00, $6f, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $e0, $60, $21, $29, $00, $cd
	db $2e, $46, $b7, $c2, $e0, $60, $f8, $01, $7e, $cd, $4b, $44, $21, $36, $02, $cd
	db $98, $44, $11, $e2, $60, $21, $57, $60, $cd, $d3, $4d, $b7, $c2, $ac, $60, $c3
	db $e0, $60, $fa, $38, $c8, $fe, $03, $c2, $c2, $60, $01, $4d, $60, $1e, $23, $f8
	db $01, $7e, $cd, $88, $46, $c3, $cd, $60, $01, $53, $60, $1e, $23, $f8, $01, $7e
	db $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $1e, $01
	db $21, $29, $00, $cd, $1b, $46, $c1, $c9, $bf, $de, $b8, $32, $00, $09, $0b, $0b
	db $06, $ff, $ff, $0b, $06, $ff, $ff, $00, $00, $00, $01, $00, $c5, $ae, $00, $00
	db $1f, $01, $1f, $03, $12, $17, $17, $00, $6f, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c
	db $f5, $7b, $b7, $c2, $7a, $61, $21, $2a, $00, $cd, $2e, $46, $b7, $c2, $7a, $61
	db $f8, $01, $7e, $cd, $4b, $44, $21, $38, $02, $cd, $98, $44, $11, $7c, $61, $21
	db $f1, $60, $cd, $d3, $4d, $b7, $c2, $46, $61, $c3, $7a, $61, $fa, $38, $c8, $fe
	db $03, $c2, $5c, $61, $01, $e7, $60, $1e, $23, $f8, $01, $7e, $cd, $88, $46, $c3
	db $67, $61, $01, $ed, $60, $1e, $23, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42
	db $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $1e, $01, $21, $2a, $00, $cd, $1b, $46
	db $c1, $c9, $bf, $de, $b8, $33, $00, $0e, $07, $ff, $ff, $0d, $07, $ff, $ff, $00
	db $00, $00, $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17, $00
	db $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $0c, $f5, $7b, $b7, $c2, $12, $62, $21, $2b
	db $00, $cd, $2e, $46, $b7, $c2, $12, $62, $f8, $01, $7e, $cd, $4b, $44, $21, $37
	db $02, $cd, $98, $44, $11, $14, $62, $21, $89, $61, $cd, $d3, $4d, $b7, $c2, $de
	db $61, $c3, $12, $62, $fa, $38, $c8, $fe, $02, $c2, $f4, $61, $01, $81, $61, $1e
	db $23, $f8, $01, $7e, $cd, $88, $46, $c3, $ff, $61, $01, $85, $61, $1e, $23, $f8
	db $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41
	db $1e, $01, $21, $2b, $00, $cd, $1b, $46, $c1, $c9, $bf, $de, $b8, $34, $00, $09
	db $0c, $ff, $ff, $07, $12, $09, $0c, $ff, $ff, $00, $00, $00, $01, $00, $c5, $b0
	db $00, $00, $20, $01, $20, $03, $13, $17, $17, $00, $6f, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c, $f5, $7b, $b7, $c2, $ab, $62, $21, $2c, $00, $cd, $2e, $46, $b7, $c2
	db $ab, $62, $f8, $01, $7e, $cd, $4b, $44, $21, $39, $02, $cd, $98, $44, $11, $ad
	db $62, $21, $23, $62, $cd, $d3, $4d, $b7, $c2, $78, $62, $c3, $ab, $62, $fa, $38
	db $c8, $b7, $c2, $8d, $62, $01, $19, $62, $1e, $23, $f8, $01, $7e, $cd, $88, $46
	db $c3, $98, $62, $01, $1d, $62, $1e, $23, $f8, $01, $7e, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $1e, $01, $21, $2c, $00, $cd, $1b
	db $46, $c1, $c9, $bf, $de, $b8, $35, $00, $12, $12, $10, $12, $ff, $ff, $12, $12
	db $12, $11, $ff, $ff, $7b, $fe, $02, $c2, $6d, $63, $21, $28, $00, $cd, $2e, $46
	db $fe, $01, $c2, $6d, $63, $21, $29, $00, $cd, $2e, $46, $fe, $01, $c2, $6d, $63
	db $21, $2a, $00, $cd, $2e, $46, $fe, $01, $c2, $6d, $63, $21, $2b, $00, $cd, $2e
	db $46, $fe, $01, $c2, $6d, $63, $21, $2c, $00, $cd, $2e, $46, $fe, $01, $c2, $6d
	db $63, $21, $37, $00, $cd, $2e, $46, $b7, $c2, $6d, $63, $af, $cd, $e6, $4e, $1e
	db $01, $3e, $0a, $cd, $3d, $41, $21, $3c, $00, $cd, $8f, $46, $3e, $30, $cd, $fe
	db $4e, $cd, $6e, $5f, $21, $6e, $5f, $cd, $11, $4f, $21, $3c, $00, $cd, $8f, $46
	db $01, $b2, $62, $1e, $23, $3e, $0a, $cd, $88, $46, $cd, $0c, $42, $fa, $38, $c8
	db $fe, $02, $c2, $46, $63, $1e, $00, $3e, $0a, $cd, $95, $40, $21, $8a, $00, $cd
	db $a9, $44, $01, $b8, $62, $1e, $23, $3e, $0a, $cd, $88, $46, $cd, $0c, $42, $3e
	db $2e, $cd, $fe, $4e, $1e, $00, $3e, $0a, $cd, $3d, $41, $1e, $01, $21, $37, $00
	db $cd, $1b, $46, $c9, $7b, $b7, $c2, $79, $64, $21, $d9, $00, $cd, $2e, $46, $b7
	db $c2, $73, $64, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76
	db $41, $1e, $05, $3e, $06, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28
	db $cd, $fe, $4e, $1e, $01, $af, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e, $03
	db $af, $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40
	db $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd
	db $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $3e, $0f
	db $cd, $f1, $4f, $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $3e, $14, $cd, $e6
	db $4e, $af, $cd, $4b, $44, $21, $1e, $00, $cd, $8f, $46, $0e, $05, $1e, $04, $3e
	db $03, $cd, $8d, $4e, $1e, $01, $21, $d9, $00, $cd, $1b, $46, $3e, $60, $cd, $fe
	db $4e, $1e, $03, $af, $cd, $95, $40, $1e, $00, $af, $cd, $95, $40, $1e, $01, $af
	db $cd, $95, $40, $1e, $02, $af, $cd, $95, $40, $1e, $03, $af, $cd, $95, $40, $1e
	db $00, $af, $cd, $95, $40, $1e, $01, $af, $cd, $95, $40, $1e, $02, $af, $cd, $95
	db $40, $3e, $0f, $cd, $f1, $4f, $af, $cd, $e6, $4e, $21, $37, $00, $cd, $2e, $46
	db $fe, $01, $c2, $5c, $64, $3e, $01, $cd, $1a, $50, $3e, $03, $cd, $e6, $4e, $c3
	db $66, $64, $3e, $01, $cd, $1a, $50, $3e, $04, $cd, $e6, $4e, $af, $cd, $4b, $44
	db $1e, $00, $af, $cd, $3d, $41, $c3, $79, $64, $21, $5c, $01, $cd, $98, $44, $c9
	db $05, $08, $01, $02, $ff, $ff, $ff, $ff, $ff, $ff, $2e, $23, $07, $01, $02, $ff
	db $ff, $ff, $ff, $ff, $ff, $2e, $08, $06, $01, $01, $20, $01, $01, $08, $01, $07
	db $34, $0c, $04, $01, $01, $20, $04, $01, $08, $01, $07, $34, $10, $05, $01, $01
	db $20, $07, $05, $09, $05, $08, $34, $15, $06, $01, $01, $20, $01, $01, $08, $01
	db $07, $34, $19, $04, $01, $01, $20, $04, $01, $08, $01, $07, $34, $1c, $05, $01
	db $01, $20, $05, $06, $0b, $06, $0a, $34, $0e, $12, $01, $01, $20, $02, $01, $0a
	db $01, $09, $34, $15, $10, $01, $01, $20, $08, $05, $09, $05, $08, $34, $1c, $0e
	db $01, $01, $20, $02, $01, $0a, $01, $09, $34, $10, $09, $01, $01, $08, $01, $04
	db $00, $04, $01, $2e, $97, $00, $ff, $ff, $dd, $01, $de, $01, $ff, $ff, $df, $01
	db $ff, $ff, $e0, $01, $ff, $ff, $e1, $01, $ff, $ff, $b7, $02, $ff, $ff, $04, $04
	db $0a, $04, $01, $01, $02, $04, $00, $23, $fc, $48, $fe, $64, $04, $04, $0a, $04
	db $01, $01, $02, $04, $00, $23, $b4, $68, $00, $00, $00, $04, $1f, $06, $01, $01
	db $02, $04, $00, $23, $5f, $48, $02, $65, $01, $04, $0d, $0a, $01, $01, $01, $04
	db $00, $23, $5f, $48, $08, $65, $07, $04, $0b, $10, $01, $01, $03, $04, $00, $23
	db $5f, $48, $0c, $65, $0c, $04, $16, $0b, $01, $01, $00, $04, $00, $23, $5f, $48
	db $10, $65, $ff, $00, $22, $06, $01, $01, $00, $04, $00, $23, $5f, $48, $14, $65
	db $ff, $00, $22, $09, $01, $01, $00, $04, $00, $23, $5f, $48, $14, $65, $ff, $00
	db $06, $07, $01, $01, $00, $04, $00, $23, $5f, $48, $14, $65, $ff, $00, $06, $09
	db $01, $01, $00, $04, $00, $23, $5f, $48, $14, $65, $ff, $00, $10, $09, $01, $01
	db $00, $04, $00, $23, $26, $68, $00, $00, $ff, $00, $09, $05, $01, $01, $00, $04
	db $00, $23, $64, $68, $00, $00, $ff, $00, $16, $05, $01, $01, $00, $04, $00, $23
	db $8c, $68, $00, $00, $03, $0c, $1c, $05, $01, $01, $02, $04, $00, $23, $00, $00
	db $00, $00

Func_8e5dc:: ; 8e5dc
	db $3e, $03, $ea, $89, $c7, $3e, $05, $ea, $e2, $c7, $1e, $0c, $21, $7a, $64, $cd
	db $3a, $40, $21, $08, $00, $cd, $2e, $46, $b7, $c2, $12, $66, $1e, $01, $21, $ce
	db $65, $cd, $fb, $40, $3e, $01, $cd, $c6, $4c, $af, $cd, $e6, $4e, $cd, $1c, $40
	db $cd, $6b, $66, $c3, $5a, $66, $21, $88, $00, $cd, $2e, $46, $fe, $01, $c2, $3d
	db $66, $3e, $03, $cd, $e6, $4e, $1e, $01, $21, $26, $65, $cd, $fb, $40, $1e, $0b
	db $21, $34, $65, $cd, $fb, $40, $3e, $01, $cd, $c6, $4c, $cd, $1c, $40, $c3, $5a
	db $66, $3e, $03, $cd, $e6, $4e, $1e, $01, $21, $18, $65, $cd, $fb, $40, $1e, $0b
	db $21, $34, $65, $cd, $fb, $40, $3e, $01, $cd, $c6, $4c, $cd, $1c, $40, $c9, $1c
	db $08, $20, $08, $ff, $ff, $1c, $08, $1c, $05, $ff, $ff, $1b, $08, $ff, $ff, $01
	db $5b, $66, $1e, $23, $af, $cd, $88, $46, $cd, $0c, $42, $21, $83, $00, $cd, $98
	db $44, $3e, $2a, $cd, $fe, $4e, $21, $69, $03, $cd, $98, $44, $21, $6c, $03, $cd
	db $98, $44, $01, $61, $66, $1e, $23, $af, $cd, $f7, $41, $cd, $0c, $42, $1e, $00
	db $af, $cd, $3d, $41, $3e, $1b, $cd, $e6, $4e, $0e, $01, $11, $67, $66, $3e, $23
	db $cd, $3e, $46, $0e, $01, $1e, $0f, $3e, $0d, $cd, $76, $41, $1e, $08, $3e, $1b
	db $cd, $e4, $41, $af, $cd, $53, $46, $21, $96, $00, $cd, $8f, $46, $3e, $34, $cd
	db $fe, $4e, $cd, $d5, $41, $3e, $01, $cd, $53, $46, $af, $cd, $e6, $4e, $3e, $0f
	db $cd, $e6, $4e, $21, $84, $00, $cd, $ca, $44, $b7, $c2, $27, $67, $1e, $01, $21
	db $e9, $00, $cd, $1b, $46, $3e, $2b, $cd, $fe, $4e, $21, $51, $04, $cd, $98, $44
	db $3e, $68, $cd, $fe, $4e, $21, $85, $00, $cd, $a9, $44, $af, $cd, $e6, $4e, $3e
	db $1b, $cd, $e6, $4e, $0e, $01, $1e, $07, $3e, $0f, $cd, $76, $41, $cd, $d5, $41
	db $3e, $01, $cd, $77, $46, $cd, $8b, $41, $c3, $b2, $67, $3e, $69, $cd, $fe, $4e
	db $21, $86, $00, $cd, $a9, $44, $af, $cd, $e6, $4e, $3e, $1b, $cd, $e6, $4e, $0e
	db $01, $1e, $0f, $3e, $0e, $cd, $76, $41, $21, $5a, $00, $cd, $8f, $46, $3e, $2b
	db $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $3e, $34, $cd, $fe, $4e, $21, $1e
	db $00, $cd, $8f, $46, $3e, $35, $cd, $fe, $4e, $21, $1e, $00, $cd, $8f, $46, $3e
	db $69, $cd, $fe, $4e, $af, $cd, $53, $46, $cd, $d5, $41, $21, $87, $00, $cd, $a9
	db $44, $1e, $01, $21, $ea, $00, $cd, $1b, $46, $3e, $2b, $cd, $fe, $4e, $21, $50
	db $04, $cd, $98, $44, $af, $cd, $e6, $4e, $3e, $1b, $cd, $e6, $4e, $0e, $01, $1e
	db $0f, $3e, $0f, $cd, $76, $41, $cd, $d5, $41, $3e, $01, $cd, $53, $46, $3e, $01
	db $cd, $77, $46, $cd, $8b, $41, $af, $cd, $e6, $4e, $3e, $0f, $cd, $e6, $4e, $0e
	db $01, $1e, $10, $3e, $0f, $cd, $76, $41, $cd, $d5, $41, $21, $88, $00, $cd, $a9
	db $44, $0e, $01, $1e, $20, $3e, $0f, $cd, $76, $41, $cd, $d5, $41, $cd, $8b, $41
	db $0e, $01, $1e, $10, $3e, $0f, $cd, $76, $41, $cd, $d5, $41, $21, $89, $00, $cd
	db $a9, $44, $0e, $01, $1e, $20, $3e, $0f, $cd, $76, $41, $cd, $d5, $41, $cd, $8b
	db $41, $3e, $06, $cd, $94, $4c, $1e, $01, $21, $08, $00, $cd, $1b, $46, $2e, $08
	db $e5, $0e, $1b, $1e, $00, $3e, $06, $cd, $ff, $4d, $c1, $3e, $0f, $cd, $f1, $4f
	db $af, $cd, $e6, $4e, $3e, $01, $cd, $1a, $50, $c9, $7b, $b7, $c2, $63, $68, $21
	db $23, $03, $cd, $ba, $44, $b7, $c2, $5d, $68, $af, $cd, $53, $46, $3e, $2e, $cd
	db $fe, $4e, $2e, $01, $e5, $0e, $04, $1e, $01, $3e, $08, $cd, $ff, $4d, $c1, $3e
	db $02, $ea, $38, $c8, $3e, $10, $ea, $db, $c7, $3e, $09, $ea, $dc, $c7, $c3, $63
	db $68, $21, $6b, $00, $cd, $98, $44, $c9, $7b, $fe, $01, $c2, $8b, $68, $3e, $2e
	db $cd, $fe, $4e, $2e, $07, $e5, $0e, $09, $1e, $01, $3e, $20, $cd, $ff, $4d, $c1
	db $3e, $03, $ea, $38, $c8, $3e, $08, $ea, $db, $c7, $3e, $06, $ea, $dc, $c7, $c9
	db $7b, $fe, $01, $c2, $b3, $68, $3e, $2e, $cd, $fe, $4e, $2e, $07, $e5, $0e, $09
	db $1e, $01, $3e, $20, $cd, $ff, $4d, $c1, $3e, $03, $ea, $38, $c8, $3e, $15, $ea
	db $db, $c7, $3e, $06, $ea, $dc, $c7, $c9, $7b, $b7, $c2, $cc, $68, $3e, $01, $cd
	db $4b, $44, $21, $98, $00, $cd, $a9, $44, $1e, $01, $21, $3a, $00, $cd, $1b, $46
	db $c9

