INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2e", ROMX
	script_library 2e

Data_b90b4:
	warpdef $01, $05, $02, $01, MAP_01_00, $1d, $0c, $1d, $0d, $34
	warpdef $01, $05, $02, $01, MAP_01_00, $1d, $12, $1d, $13, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $09, $09, $09, $0a, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $07, $0d, $07, $0e, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $05, $11, $05, $12, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $11, $09, $11, $0a, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $17, $13, $17, $14, $34
	warpdef $01, $05, $02, $01, MAP_20_00, $14, $09, $14, $0a, $34
	warpdef $01, $05, $02, $01, MAP_20_00, $14, $0c, $14, $0d, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $19, $06, $19, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $1d, $06, $1d, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $21, $06, $21, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $08, $10, $08, $11, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $0c, $10, $0c, $11, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $10, $10, $10, $11, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $17, $11, $17, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $1b, $11, $1b, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $1f, $11, $1f, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $06, $1b, $06, $1c, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $0a, $1b, $0a, $1c, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $0e, $1b, $0e, $1c, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $0f, $0d, $0f, $0e, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $13, $11, $13, $12, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $1b, $10, $1b, $11, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $1c, $0b, $1c, $0c, $34

Data_b91c7:
	dw $195
	dw -1

Data_b91cb:
	dw $19c
	dw -1

Data_b91cf:
	dw $1cb
	dw -1

Data_b91d3:
	dw $1cd
	dw -1

Data_b91d7:
	dw $39a
	dw -1

Data_b91db:
	dw $1ce
	dw -1

Data_b91df:
	dw $1cc
	dw -1

Data_b91e3:
	dw $1eb
	dw -1

Data_b91e7:
	dw $1ee
	dw -1

Data_b91eb:
	dw $1fd
	dw -1

Data_b91ef:
	dw $200
	dw -1

Data_b91f3:
	dw $1fc
	dw -1

Data_b91f7:
	dw $1fb
	dw -1

Data_b91fb:
	dw $107
	dw -1

Data_b91ff:
	dw $209
	dw -1

Data_b9203:
	dw $204
	dw -1

Data_b9207:
	dw $207
	dw -1

Data_b920b:
	dw $212
	dw -1

Data_b920f:
	dw $206
	dw -1

Data_b9213:
	dw $3a7
	dw -1

Data_b9217:
	dw $328
	dw -1

Data_b921b:
	dw $3a4
	dw -1

Data_b921f:
	dw $3f8
	dw -1

Data_b9223:
	dw $3a5
	dw -1

Data_b9227:
	dw $196
	dw -1

Data_b922b:
	dw $19d
	dw -1

Data_b922f:
	person_event $06, $04, $01, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b91c7

Data_b923d:
	person_event $04, $04, $05, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91cb

Data_b924b:
	person_event $05, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91cf

Data_b9259:
	person_event $00, $04, $04, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91d3

Data_b9267:
	person_event $1e, $04, $06, $04, $01, $01, $03, $04, $00, Func_808fc_2e, Data_b91d7

Data_b9275:
	person_event $06, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91db

Data_b9283:
	person_event $04, $04, $06, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91df

Data_b9291:
	person_event $10, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91e3

Data_b929f:
	person_event $02, $04, $01, $03, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91e7

Data_b92ad:
	person_event $0c, $04, $02, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91eb

Data_b92bb:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91ef

Data_b92c9:
	person_event $00, $04, $06, $05, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91f3

Data_b92d7:
	person_event $01, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91f7

Data_b92e5:
	person_event $07, $0c, $03, $02, $01, $01, $02, $04, $00, Func_808fc_2e, Data_b91fb
	person_event $02, $0c, $06, $03, $01, $01, $01, $04, $00, NULL, NULL

Data_b9301:
	person_event $0c, $04, $02, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91ff

Data_b930f:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9203

Data_b931d:
	person_event $26, $04, $07, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9207

Data_b932b:
	person_event $01, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b920b

Data_b9339:
	person_event $03, $04, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b920f

Data_b9347:
	person_event $07, $04, $02, $04, $01, $01, $01, $04, $00, Func_808fc_2e, Data_b9213

Data_b9355:
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9217

Data_b9363:
	person_event $03, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b921b

Data_b9371:
	person_event $12, $04, $06, $04, $01, $01, $02, $04, $00, Func_808fc_2e, Data_b921f

Data_b937f:
	person_event $0a, $04, $00, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9223

Data_b938d:
	map MAP_01_00
	db $1d, $0c
	map MAP_01_00
	db $1d, $12
	map MAP_03_00
	db $09, $09
	map MAP_03_00
	db $07, $0d
	map MAP_03_00
	db $05, $11
	map MAP_03_00
	db $11, $09
	map MAP_03_00
	db $17, $13
	map MAP_20_00
	db $14, $09
	map MAP_20_00
	db $14, $0c
	map MAP_23_00
	db $19, $06
	map MAP_23_00
	db $1d, $06
	map MAP_23_00
	db $21, $06
	map MAP_23_00
	db $08, $10
	map MAP_23_00
	db $0c, $10
	map MAP_23_00
	db $10, $10
	map MAP_24_00
	db $17, $11
	map MAP_24_00
	db $1b, $11
	map MAP_24_00
	db $1f, $11
	map MAP_24_00
	db $06, $1b
	map MAP_24_00
	db $0a, $1b
	map MAP_24_00
	db $0e, $1b
	map MAP_11_00
	db $0f, $0d
	map MAP_11_00
	db $13, $11
	map MAP_11_00
	db $1b, $10
	map MAP_11_00
	db $1c, $0b

Func_b93f1:: ; b93f1
	ld c, $00 ; B93F1 (2e:53f1) -> 0E 00
.asm_b93f3:
	ld a, c ; B93F3 (2e:53f3) -> 79
	cp $19 ; B93F4 (2e:53f4) -> FE 19
	jp nc, .asm_b945b ; B93F6 (2e:53f6) -> D2 5B 54
	ld l, c ; B93F9 (2e:53f9) -> 69
	ld h, $00 ; B93FA (2e:53fa) -> 26 00
	add hl, hl ; B93FC (2e:53fc) -> 29
	add hl, hl ; B93FD (2e:53fd) -> 29
	ld de, Data_b938d ; B93FE (2e:53fe) -> 11 8D 53
	add hl, de ; B9401 (2e:5401) -> 19
	ld a, [wBackupMapGroup] ; B9402 (2e:5402) -> FA DF C7
	cp [hl] ; B9405 (2e:5405) -> BE
	jp nz, .asm_b9457 ; B9406 (2e:5406) -> C2 57 54
	ld l, c ; B9409 (2e:5409) -> 69
	ld h, $00 ; B940A (2e:540a) -> 26 00
	add hl, hl ; B940C (2e:540c) -> 29
	add hl, hl ; B940D (2e:540d) -> 29
	ld de, Data_b938d ; B940E (2e:540e) -> 11 8D 53
	add hl, de ; B9411 (2e:5411) -> 19
	inc hl ; B9412 (2e:5412) -> 23
	ld a, [wBackupMapNumber] ; B9413 (2e:5413) -> FA E0 C7
	cp [hl] ; B9416 (2e:5416) -> BE
	jp nz, .asm_b9457 ; B9417 (2e:5417) -> C2 57 54
	ld l, c ; B941A (2e:541a) -> 69
	ld h, $00 ; B941B (2e:541b) -> 26 00
	add hl, hl ; B941D (2e:541d) -> 29
	add hl, hl ; B941E (2e:541e) -> 29
	ld de, Data_b938d ; B941F (2e:541f) -> 11 8D 53
	add hl, de ; B9422 (2e:5422) -> 19
	inc hl ; B9423 (2e:5423) -> 23
	inc hl ; B9424 (2e:5424) -> 23
	ld a, [wBackupMapX] ; B9425 (2e:5425) -> FA DB C7
	cp [hl] ; B9428 (2e:5428) -> BE
	jp nz, .asm_b9457 ; B9429 (2e:5429) -> C2 57 54
	ld l, c ; B942C (2e:542c) -> 69
	ld h, $00 ; B942D (2e:542d) -> 26 00
	add hl, hl ; B942F (2e:542f) -> 29
	add hl, hl ; B9430 (2e:5430) -> 29
	ld de, Data_b938d ; B9431 (2e:5431) -> 11 8D 53
	add hl, de ; B9434 (2e:5434) -> 19
	inc hl ; B9435 (2e:5435) -> 23
	inc hl ; B9436 (2e:5436) -> 23
	inc hl ; B9437 (2e:5437) -> 23
	ld a, [wBackupMapY] ; B9438 (2e:5438) -> FA DC C7
	cp [hl] ; B943B (2e:543b) -> BE
	jp nz, .asm_b9457 ; B943C (2e:543c) -> C2 57 54
	ld l, c ; B943F (2e:543f) -> 69
	ld h, $00 ; B9440 (2e:5440) -> 26 00
	ld e, l ; B9442 (2e:5442) -> 5D
	ld d, h ; B9443 (2e:5443) -> 54
	add hl, hl ; B9444 (2e:5444) -> 29
	ld c, l ; B9445 (2e:5445) -> 4D
	ld b, h ; B9446 (2e:5446) -> 44
	add hl, hl ; B9447 (2e:5447) -> 29
	add hl, hl ; B9448 (2e:5448) -> 29
	add hl, de ; B9449 (2e:5449) -> 19
	add hl, bc ; B944A (2e:544a) -> 09
	ld de, Data_b90b4 ; B944B (2e:544b) -> 11 B4 50
	add hl, de ; B944E (2e:544e) -> 19
	ld e, $01 ; B944F (2e:544f) -> 1E 01
	scall LoadWarps ; B9451 (2e:5451) -> CD 3A 40
	jp .asm_b945b ; B9454 (2e:5454) -> C3 5B 54
.asm_b9457:
	inc c ; B9457 (2e:5457) -> 0C
	jp .asm_b93f3 ; B9458 (2e:5458) -> C3 F3 53
.asm_b945b:
	ld a, [wBackupMapGroup] ; B945B (2e:545b) -> FA DF C7
	cp $01 ; B945E (2e:545e) -> FE 01
	jp nz, .asm_b94cc ; B9460 (2e:5460) -> C2 CC 54
	ld a, [wBackupMapNumber] ; B9463 (2e:5463) -> FA E0 C7
	or a ; B9466 (2e:5466) -> B7
	jp nz, .asm_b94cc ; B9467 (2e:5467) -> C2 CC 54
	ld a, [wBackupMapX] ; B946A (2e:546a) -> FA DB C7
	cp $1d ; B946D (2e:546d) -> FE 1D
	jp nz, .asm_b949b ; B946F (2e:546f) -> C2 9B 54
	ld a, [wBackupMapY] ; B9472 (2e:5472) -> FA DC C7
	cp $0c ; B9475 (2e:5475) -> FE 0C
	jp nz, .asm_b949b ; B9477 (2e:5477) -> C2 9B 54
	ld e, $01 ; B947A (2e:547a) -> 1E 01
	ld hl, Data_b922f ; B947C (2e:547c) -> 21 2F 52
	scall LoadMapObjects ; B947F (2e:547f) -> CD FB 40
	ld a, [wc790] ; B9482 (2e:5482) -> FA 90 C7
	or a ; B9485 (2e:5485) -> B7
	jp z, .asm_b9498 ; B9486 (2e:5486) -> CA 98 54
	ld a, [wc790] ; B9489 (2e:5489) -> FA 90 C7
	cp $04 ; B948C (2e:548c) -> FE 04
	jp nz, .asm_b9498 ; B948E (2e:548e) -> C2 98 54
	ld de, Data_b9227 ; B9491 (2e:5491) -> 11 27 52
	xor a ; B9494 (2e:5494) -> AF
	scall SetPersonTextPointer ; B9495 (2e:5495) -> CD 50 41
.asm_b9498:
	jp .asm_b94c9 ; B9498 (2e:5498) -> C3 C9 54
.asm_b949b:
	ld a, [wBackupMapX] ; B949B (2e:549b) -> FA DB C7
	cp $1d ; B949E (2e:549e) -> FE 1D
	jp nz, .asm_b94c9 ; B94A0 (2e:54a0) -> C2 C9 54
	ld a, [wBackupMapY] ; B94A3 (2e:54a3) -> FA DC C7
	cp $12 ; B94A6 (2e:54a6) -> FE 12
	jp nz, .asm_b94c9 ; B94A8 (2e:54a8) -> C2 C9 54
	ld e, $01 ; B94AB (2e:54ab) -> 1E 01
	ld hl, Data_b923d ; B94AD (2e:54ad) -> 21 3D 52
	scall LoadMapObjects ; B94B0 (2e:54b0) -> CD FB 40
	ld a, [wc790] ; B94B3 (2e:54b3) -> FA 90 C7
	or a ; B94B6 (2e:54b6) -> B7
	jp z, .asm_b94c9 ; B94B7 (2e:54b7) -> CA C9 54
	ld a, [wc790] ; B94BA (2e:54ba) -> FA 90 C7
	cp $04 ; B94BD (2e:54bd) -> FE 04
	jp nz, .asm_b94c9 ; B94BF (2e:54bf) -> C2 C9 54
	ld de, Data_b922b ; B94C2 (2e:54c2) -> 11 2B 52
	xor a ; B94C5 (2e:54c5) -> AF
	scall SetPersonTextPointer ; B94C6 (2e:54c6) -> CD 50 41
.asm_b94c9:
	jp .asm_b975a ; B94C9 (2e:54c9) -> C3 5A 57
.asm_b94cc:
	ld a, [wBackupMapGroup] ; B94CC (2e:54cc) -> FA DF C7
	cp $03 ; B94CF (2e:54cf) -> FE 03
	jp nz, .asm_b9571 ; B94D1 (2e:54d1) -> C2 71 55
	ld a, [wBackupMapNumber] ; B94D4 (2e:54d4) -> FA E0 C7
	or a ; B94D7 (2e:54d7) -> B7
	jp nz, .asm_b9571 ; B94D8 (2e:54d8) -> C2 71 55
	ld a, [wBackupMapX] ; B94DB (2e:54db) -> FA DB C7
	cp $09 ; B94DE (2e:54de) -> FE 09
	jp nz, .asm_b94f6 ; B94E0 (2e:54e0) -> C2 F6 54
	ld a, [wBackupMapY] ; B94E3 (2e:54e3) -> FA DC C7
	cp $09 ; B94E6 (2e:54e6) -> FE 09
	jp nz, .asm_b94f6 ; B94E8 (2e:54e8) -> C2 F6 54
	ld e, $01 ; B94EB (2e:54eb) -> 1E 01
	ld hl, Data_b924b ; B94ED (2e:54ed) -> 21 4B 52
	scall LoadMapObjects ; B94F0 (2e:54f0) -> CD FB 40
	jp .asm_b956e ; B94F3 (2e:54f3) -> C3 6E 55
.asm_b94f6:
	ld a, [wBackupMapX] ; B94F6 (2e:54f6) -> FA DB C7
	cp $07 ; B94F9 (2e:54f9) -> FE 07
	jp nz, .asm_b9511 ; B94FB (2e:54fb) -> C2 11 55
	ld a, [wBackupMapY] ; B94FE (2e:54fe) -> FA DC C7
	cp $0d ; B9501 (2e:5501) -> FE 0D
	jp nz, .asm_b9511 ; B9503 (2e:5503) -> C2 11 55
	ld e, $01 ; B9506 (2e:5506) -> 1E 01
	ld hl, Data_b9259 ; B9508 (2e:5508) -> 21 59 52
	scall LoadMapObjects ; B950B (2e:550b) -> CD FB 40
	jp .asm_b956e ; B950E (2e:550e) -> C3 6E 55
.asm_b9511:
	ld a, [wBackupMapX] ; B9511 (2e:5511) -> FA DB C7
	cp $05 ; B9514 (2e:5514) -> FE 05
	jp nz, .asm_b953b ; B9516 (2e:5516) -> C2 3B 55
	ld a, [wBackupMapY] ; B9519 (2e:5519) -> FA DC C7
	cp $11 ; B951C (2e:551c) -> FE 11
	jp nz, .asm_b953b ; B951E (2e:551e) -> C2 3B 55
	ld a, [wc790] ; B9521 (2e:5521) -> FA 90 C7
	or a ; B9524 (2e:5524) -> B7
	jp z, .asm_b9538 ; B9525 (2e:5525) -> CA 38 55
	ld a, [wc790] ; B9528 (2e:5528) -> FA 90 C7
	cp $07 ; B952B (2e:552b) -> FE 07
	jp nc, .asm_b9538 ; B952D (2e:552d) -> D2 38 55
	ld e, $01 ; B9530 (2e:5530) -> 1E 01
	ld hl, Data_b9267 ; B9532 (2e:5532) -> 21 67 52
	scall LoadMapObjects ; B9535 (2e:5535) -> CD FB 40
.asm_b9538:
	jp .asm_b956e ; B9538 (2e:5538) -> C3 6E 55
.asm_b953b:
	ld a, [wBackupMapX] ; B953B (2e:553b) -> FA DB C7
	cp $11 ; B953E (2e:553e) -> FE 11
	jp nz, .asm_b9556 ; B9540 (2e:5540) -> C2 56 55
	ld a, [wBackupMapY] ; B9543 (2e:5543) -> FA DC C7
	cp $09 ; B9546 (2e:5546) -> FE 09
	jp nz, .asm_b9556 ; B9548 (2e:5548) -> C2 56 55
	ld e, $01 ; B954B (2e:554b) -> 1E 01
	ld hl, Data_b9275 ; B954D (2e:554d) -> 21 75 52
	scall LoadMapObjects ; B9550 (2e:5550) -> CD FB 40
	jp .asm_b956e ; B9553 (2e:5553) -> C3 6E 55
.asm_b9556:
	ld a, [wBackupMapX] ; B9556 (2e:5556) -> FA DB C7
	cp $17 ; B9559 (2e:5559) -> FE 17
	jp nz, .asm_b956e ; B955B (2e:555b) -> C2 6E 55
	ld a, [wBackupMapY] ; B955E (2e:555e) -> FA DC C7
	cp $13 ; B9561 (2e:5561) -> FE 13
	jp nz, .asm_b956e ; B9563 (2e:5563) -> C2 6E 55
	ld e, $01 ; B9566 (2e:5566) -> 1E 01
	ld hl, Data_b9283 ; B9568 (2e:5568) -> 21 83 52
	scall LoadMapObjects ; B956B (2e:556b) -> CD FB 40
.asm_b956e:
	jp .asm_b975a ; B956E (2e:556e) -> C3 5A 57
.asm_b9571:
	ld a, [wBackupMapGroup] ; B9571 (2e:5571) -> FA DF C7
	cp $14 ; B9574 (2e:5574) -> FE 14
	jp nz, .asm_b95b6 ; B9576 (2e:5576) -> C2 B6 55
	ld a, [wBackupMapNumber] ; B9579 (2e:5579) -> FA E0 C7
	or a ; B957C (2e:557c) -> B7
	jp nz, .asm_b95b6 ; B957D (2e:557d) -> C2 B6 55
	ld a, [wBackupMapX] ; B9580 (2e:5580) -> FA DB C7
	cp $14 ; B9583 (2e:5583) -> FE 14
	jp nz, .asm_b959b ; B9585 (2e:5585) -> C2 9B 55
	ld a, [wBackupMapY] ; B9588 (2e:5588) -> FA DC C7
	cp $09 ; B958B (2e:558b) -> FE 09
	jp nz, .asm_b959b ; B958D (2e:558d) -> C2 9B 55
	ld e, $01 ; B9590 (2e:5590) -> 1E 01
	ld hl, Data_b9291 ; B9592 (2e:5592) -> 21 91 52
	scall LoadMapObjects ; B9595 (2e:5595) -> CD FB 40
	jp .asm_b95b3 ; B9598 (2e:5598) -> C3 B3 55
.asm_b959b:
	ld a, [wBackupMapX] ; B959B (2e:559b) -> FA DB C7
	cp $14 ; B959E (2e:559e) -> FE 14
	jp nz, .asm_b95b3 ; B95A0 (2e:55a0) -> C2 B3 55
	ld a, [wBackupMapY] ; B95A3 (2e:55a3) -> FA DC C7
	cp $0c ; B95A6 (2e:55a6) -> FE 0C
	jp nz, .asm_b95b3 ; B95A8 (2e:55a8) -> C2 B3 55
	ld e, $01 ; B95AB (2e:55ab) -> 1E 01
	ld hl, Data_b929f ; B95AD (2e:55ad) -> 21 9F 52
	scall LoadMapObjects ; B95B0 (2e:55b0) -> CD FB 40
.asm_b95b3:
	jp .asm_b975a ; B95B3 (2e:55b3) -> C3 5A 57
.asm_b95b6:
	ld a, [wBackupMapGroup] ; B95B6 (2e:55b6) -> FA DF C7
	cp $17 ; B95B9 (2e:55b9) -> FE 17
	jp nz, .asm_b964c ; B95BB (2e:55bb) -> C2 4C 56
	ld a, [wBackupMapNumber] ; B95BE (2e:55be) -> FA E0 C7
	or a ; B95C1 (2e:55c1) -> B7
	jp nz, .asm_b964c ; B95C2 (2e:55c2) -> C2 4C 56
	ld a, [wBackupMapX] ; B95C5 (2e:55c5) -> FA DB C7
	cp $19 ; B95C8 (2e:55c8) -> FE 19
	jp nz, .asm_b95e0 ; B95CA (2e:55ca) -> C2 E0 55
	ld a, [wBackupMapY] ; B95CD (2e:55cd) -> FA DC C7
	cp $06 ; B95D0 (2e:55d0) -> FE 06
	jp nz, .asm_b95e0 ; B95D2 (2e:55d2) -> C2 E0 55
	ld e, $01 ; B95D5 (2e:55d5) -> 1E 01
	ld hl, Data_b92ad ; B95D7 (2e:55d7) -> 21 AD 52
	scall LoadMapObjects ; B95DA (2e:55da) -> CD FB 40
	jp .asm_b9649 ; B95DD (2e:55dd) -> C3 49 56
.asm_b95e0:
	ld a, [wBackupMapX] ; B95E0 (2e:55e0) -> FA DB C7
	cp $1d ; B95E3 (2e:55e3) -> FE 1D
	jp nz, .asm_b95fb ; B95E5 (2e:55e5) -> C2 FB 55
	ld a, [wBackupMapY] ; B95E8 (2e:55e8) -> FA DC C7
	cp $06 ; B95EB (2e:55eb) -> FE 06
	jp nz, .asm_b95fb ; B95ED (2e:55ed) -> C2 FB 55
	ld e, $01 ; B95F0 (2e:55f0) -> 1E 01
	ld hl, Data_b92bb ; B95F2 (2e:55f2) -> 21 BB 52
	scall LoadMapObjects ; B95F5 (2e:55f5) -> CD FB 40
	jp .asm_b9649 ; B95F8 (2e:55f8) -> C3 49 56
.asm_b95fb:
	ld a, [wBackupMapX] ; B95FB (2e:55fb) -> FA DB C7
	cp $21 ; B95FE (2e:55fe) -> FE 21
	jp nz, .asm_b9616 ; B9600 (2e:5600) -> C2 16 56
	ld a, [wBackupMapY] ; B9603 (2e:5603) -> FA DC C7
	cp $06 ; B9606 (2e:5606) -> FE 06
	jp nz, .asm_b9616 ; B9608 (2e:5608) -> C2 16 56
	ld e, $01 ; B960B (2e:560b) -> 1E 01
	ld hl, Data_b92c9 ; B960D (2e:560d) -> 21 C9 52
	scall LoadMapObjects ; B9610 (2e:5610) -> CD FB 40
	jp .asm_b9649 ; B9613 (2e:5613) -> C3 49 56
.asm_b9616:
	ld a, [wBackupMapX] ; B9616 (2e:5616) -> FA DB C7
	cp $08 ; B9619 (2e:5619) -> FE 08
	jp nz, .asm_b9631 ; B961B (2e:561b) -> C2 31 56
	ld a, [wBackupMapY] ; B961E (2e:561e) -> FA DC C7
	cp $10 ; B9621 (2e:5621) -> FE 10
	jp nz, .asm_b9631 ; B9623 (2e:5623) -> C2 31 56
	ld e, $01 ; B9626 (2e:5626) -> 1E 01
	ld hl, Data_b92d7 ; B9628 (2e:5628) -> 21 D7 52
	scall LoadMapObjects ; B962B (2e:562b) -> CD FB 40
	jp .asm_b9649 ; B962E (2e:562e) -> C3 49 56
.asm_b9631:
	ld a, [wBackupMapX] ; B9631 (2e:5631) -> FA DB C7
	cp $10 ; B9634 (2e:5634) -> FE 10
	jp nz, .asm_b9649 ; B9636 (2e:5636) -> C2 49 56
	ld a, [wBackupMapY] ; B9639 (2e:5639) -> FA DC C7
	cp $10 ; B963C (2e:563c) -> FE 10
	jp nz, .asm_b9649 ; B963E (2e:563e) -> C2 49 56
	ld e, $02 ; B9641 (2e:5641) -> 1E 02
	ld hl, Data_b92e5 ; B9643 (2e:5643) -> 21 E5 52
	scall LoadMapObjects ; B9646 (2e:5646) -> CD FB 40
.asm_b9649:
	jp .asm_b975a ; B9649 (2e:5649) -> C3 5A 57
.asm_b964c:
	ld a, [wBackupMapGroup] ; B964C (2e:564c) -> FA DF C7
	cp $18 ; B964F (2e:564f) -> FE 18
	jp nz, .asm_b96fd ; B9651 (2e:5651) -> C2 FD 56
	ld a, [wBackupMapNumber] ; B9654 (2e:5654) -> FA E0 C7
	or a ; B9657 (2e:5657) -> B7
	jp nz, .asm_b96fd ; B9658 (2e:5658) -> C2 FD 56
	ld a, [wBackupMapX] ; B965B (2e:565b) -> FA DB C7
	cp $17 ; B965E (2e:565e) -> FE 17
	jp nz, .asm_b9676 ; B9660 (2e:5660) -> C2 76 56
	ld a, [wBackupMapY] ; B9663 (2e:5663) -> FA DC C7
	cp $11 ; B9666 (2e:5666) -> FE 11
	jp nz, .asm_b9676 ; B9668 (2e:5668) -> C2 76 56
	ld e, $01 ; B966B (2e:566b) -> 1E 01
	ld hl, Data_b9301 ; B966D (2e:566d) -> 21 01 53
	scall LoadMapObjects ; B9670 (2e:5670) -> CD FB 40
	jp .asm_b96fa ; B9673 (2e:5673) -> C3 FA 56
.asm_b9676:
	ld a, [wBackupMapX] ; B9676 (2e:5676) -> FA DB C7
	cp $1b ; B9679 (2e:5679) -> FE 1B
	jp nz, .asm_b9691 ; B967B (2e:567b) -> C2 91 56
	ld a, [wBackupMapY] ; B967E (2e:567e) -> FA DC C7
	cp $11 ; B9681 (2e:5681) -> FE 11
	jp nz, .asm_b9691 ; B9683 (2e:5683) -> C2 91 56
	ld e, $01 ; B9686 (2e:5686) -> 1E 01
	ld hl, Data_b930f ; B9688 (2e:5688) -> 21 0F 53
	scall LoadMapObjects ; B968B (2e:568b) -> CD FB 40
	jp .asm_b96fa ; B968E (2e:568e) -> C3 FA 56
.asm_b9691:
	ld a, [wBackupMapX] ; B9691 (2e:5691) -> FA DB C7
	cp $1f ; B9694 (2e:5694) -> FE 1F
	jp nz, .asm_b96ac ; B9696 (2e:5696) -> C2 AC 56
	ld a, [wBackupMapY] ; B9699 (2e:5699) -> FA DC C7
	cp $11 ; B969C (2e:569c) -> FE 11
	jp nz, .asm_b96ac ; B969E (2e:569e) -> C2 AC 56
	ld e, $01 ; B96A1 (2e:56a1) -> 1E 01
	ld hl, Data_b931d ; B96A3 (2e:56a3) -> 21 1D 53
	scall LoadMapObjects ; B96A6 (2e:56a6) -> CD FB 40
	jp .asm_b96fa ; B96A9 (2e:56a9) -> C3 FA 56
.asm_b96ac:
	ld a, [wBackupMapX] ; B96AC (2e:56ac) -> FA DB C7
	cp $06 ; B96AF (2e:56af) -> FE 06
	jp nz, .asm_b96c7 ; B96B1 (2e:56b1) -> C2 C7 56
	ld a, [wBackupMapY] ; B96B4 (2e:56b4) -> FA DC C7
	cp $1b ; B96B7 (2e:56b7) -> FE 1B
	jp nz, .asm_b96c7 ; B96B9 (2e:56b9) -> C2 C7 56
	ld e, $01 ; B96BC (2e:56bc) -> 1E 01
	ld hl, Data_b932b ; B96BE (2e:56be) -> 21 2B 53
	scall LoadMapObjects ; B96C1 (2e:56c1) -> CD FB 40
	jp .asm_b96fa ; B96C4 (2e:56c4) -> C3 FA 56
.asm_b96c7:
	ld a, [wBackupMapX] ; B96C7 (2e:56c7) -> FA DB C7
	cp $0a ; B96CA (2e:56ca) -> FE 0A
	jp nz, .asm_b96e2 ; B96CC (2e:56cc) -> C2 E2 56
	ld a, [wBackupMapY] ; B96CF (2e:56cf) -> FA DC C7
	cp $1b ; B96D2 (2e:56d2) -> FE 1B
	jp nz, .asm_b96e2 ; B96D4 (2e:56d4) -> C2 E2 56
	ld e, $01 ; B96D7 (2e:56d7) -> 1E 01
	ld hl, Data_b9339 ; B96D9 (2e:56d9) -> 21 39 53
	scall LoadMapObjects ; B96DC (2e:56dc) -> CD FB 40
	jp .asm_b96fa ; B96DF (2e:56df) -> C3 FA 56
.asm_b96e2:
	ld a, [wBackupMapX] ; B96E2 (2e:56e2) -> FA DB C7
	cp $0e ; B96E5 (2e:56e5) -> FE 0E
	jp nz, .asm_b96fa ; B96E7 (2e:56e7) -> C2 FA 56
	ld a, [wBackupMapY] ; B96EA (2e:56ea) -> FA DC C7
	cp $1b ; B96ED (2e:56ed) -> FE 1B
	jp nz, .asm_b96fa ; B96EF (2e:56ef) -> C2 FA 56
	ld e, $01 ; B96F2 (2e:56f2) -> 1E 01
	ld hl, Data_b9347 ; B96F4 (2e:56f4) -> 21 47 53
	scall LoadMapObjects ; B96F7 (2e:56f7) -> CD FB 40
.asm_b96fa:
	jp .asm_b975a ; B96FA (2e:56fa) -> C3 5A 57
.asm_b96fd:
	ld a, [wBackupMapGroup] ; B96FD (2e:56fd) -> FA DF C7
	cp $0b ; B9700 (2e:5700) -> FE 0B
	jp nz, .asm_b975a ; B9702 (2e:5702) -> C2 5A 57
	ld a, [wBackupMapNumber] ; B9705 (2e:5705) -> FA E0 C7
	or a ; B9708 (2e:5708) -> B7
	jp nz, .asm_b975a ; B9709 (2e:5709) -> C2 5A 57
	ld a, [wBackupMapX] ; B970C (2e:570c) -> FA DB C7
	cp $0f ; B970F (2e:570f) -> FE 0F
	jp nz, .asm_b9727 ; B9711 (2e:5711) -> C2 27 57
	ld a, [wBackupMapY] ; B9714 (2e:5714) -> FA DC C7
	cp $0d ; B9717 (2e:5717) -> FE 0D
	jp nz, .asm_b9727 ; B9719 (2e:5719) -> C2 27 57
	ld e, $01 ; B971C (2e:571c) -> 1E 01
	ld hl, Data_b9363 ; B971E (2e:571e) -> 21 63 53
	scall LoadMapObjects ; B9721 (2e:5721) -> CD FB 40
	jp .asm_b975a ; B9724 (2e:5724) -> C3 5A 57
.asm_b9727:
	ld a, [wBackupMapX] ; B9727 (2e:5727) -> FA DB C7
	cp $13 ; B972A (2e:572a) -> FE 13
	jp nz, .asm_b9742 ; B972C (2e:572c) -> C2 42 57
	ld a, [wBackupMapY] ; B972F (2e:572f) -> FA DC C7
	cp $11 ; B9732 (2e:5732) -> FE 11
	jp nz, .asm_b9742 ; B9734 (2e:5734) -> C2 42 57
	ld e, $01 ; B9737 (2e:5737) -> 1E 01
	ld hl, Data_b9371 ; B9739 (2e:5739) -> 21 71 53
	scall LoadMapObjects ; B973C (2e:573c) -> CD FB 40
	jp .asm_b975a ; B973F (2e:573f) -> C3 5A 57
.asm_b9742:
	ld a, [wBackupMapX] ; B9742 (2e:5742) -> FA DB C7
	cp $1b ; B9745 (2e:5745) -> FE 1B
	jp nz, .asm_b975a ; B9747 (2e:5747) -> C2 5A 57
	ld a, [wBackupMapY] ; B974A (2e:574a) -> FA DC C7
	cp $10 ; B974D (2e:574d) -> FE 10
	jp nz, .asm_b975a ; B974F (2e:574f) -> C2 5A 57
	ld e, $01 ; B9752 (2e:5752) -> 1E 01
	ld hl, Data_b937f ; B9754 (2e:5754) -> 21 7F 53
	scall LoadMapObjects ; B9757 (2e:5757) -> CD FB 40
.asm_b975a:
	ld e, $01 ; B975A (2e:575a) -> 1E 01
	ld hl, Data_b9355 ; B975C (2e:575c) -> 21 55 53
	scall LoadMapObjects ; B975F (2e:575f) -> CD FB 40
	ld a, [wBackupMapX] ; B9762 (2e:5762) -> FA DB C7
	cp $10 ; B9765 (2e:5765) -> FE 10
	jp nz, .asm_b979a ; B9767 (2e:5767) -> C2 9A 57
	ld a, [wBackupMapY] ; B976A (2e:576a) -> FA DC C7
	cp $10 ; B976D (2e:576d) -> FE 10
	jp nz, .asm_b979a ; B976F (2e:576f) -> C2 9A 57
	ld hl, $002d ; B9772 (2e:5772) -> 21 2D 00
	scall CheckEventFlag ; B9775 (2e:5775) -> CD 2E 46
	or a ; B9778 (2e:5778) -> B7
	jp nz, .asm_b978d ; B9779 (2e:5779) -> C2 8D 57
	scall Func_8001c ; B977C (2e:577c) -> CD 1C 40
	call Func_b97c4 ; B977F (2e:577f) -> CD C4 57
	ld e, $01 ; B9782 (2e:5782) -> 1E 01
	ld hl, $002d ; B9784 (2e:5784) -> 21 2D 00
	scall EventFlagAction ; B9787 (2e:5787) -> CD 1B 46
	jp .asm_b9797 ; B978A (2e:578a) -> C3 97 57
.asm_b978d:
	scall Func_8001c ; B978D (2e:578d) -> CD 1C 40
	ld e, $00 ; B9790 (2e:5790) -> 1E 00
	ld a, $01 ; B9792 (2e:5792) -> 3E 01
	scall SetPersonVisibilityState ; B9794 (2e:5794) -> CD 3D 41
.asm_b9797:
	jp .asm_b979d ; B9797 (2e:5797) -> C3 9D 57
.asm_b979a:
	scall Func_8001c ; B979A (2e:579a) -> CD 1C 40
.asm_b979d:
	ld a, [wBackupMapGroup] ; B979D (2e:579d) -> FA DF C7
	cp $17 ; B97A0 (2e:57a0) -> FE 17
	jp nz, .asm_b97b4 ; B97A2 (2e:57a2) -> C2 B4 57
	ld a, [wBackupMapNumber] ; B97A5 (2e:57a5) -> FA E0 C7
	or a ; B97A8 (2e:57a8) -> B7
	jp nz, .asm_b97b4 ; B97A9 (2e:57a9) -> C2 B4 57
	ld a, $0a ; B97AC (2e:57ac) -> 3E 0A
	scall PlayMusic ; B97AE (2e:57ae) -> CD E6 4E
	jp .asm_b97b9 ; B97B1 (2e:57b1) -> C3 B9 57
.asm_b97b4:
	ld a, $11 ; B97B4 (2e:57b4) -> 3E 11
	scall PlayMusic ; B97B6 (2e:57b6) -> CD E6 4E
.asm_b97b9:
	ret  ; B97B9 (2e:57b9) -> C9

Data_b97ba:
	db $05, $05, $02, $05, $ff, $ff

Data_b97c0:
	db $02, $04, $ff, $ff

Func_b97c4:
	ld a, $01 ; B97C4 (2e:57c4) -> 3E 01
	scall PlayerFace ; B97C6 (2e:57c6) -> CD 77 46
	ld hl, $0103 ; B97C9 (2e:57c9) -> 21 03 01
	scall PrintTextWithNPCName ; B97CC (2e:57cc) -> CD A9 44
	ld e, $01 ; B97CF (2e:57cf) -> 1E 01
	xor a ; B97D1 (2e:57d1) -> AF
	scall SpriteFace ; B97D2 (2e:57d2) -> CD 95 40
	ld e, $01 ; B97D5 (2e:57d5) -> 1E 01
	ld a, $01 ; B97D7 (2e:57d7) -> 3E 01
	scall PlayerStep ; B97D9 (2e:57d9) -> CD 1E 4E
	ld e, $01 ; B97DC (2e:57dc) -> 1E 01
	ld a, $01 ; B97DE (2e:57de) -> 3E 01
	scall PlayerStep ; B97E0 (2e:57e0) -> CD 1E 4E
	ld e, $01 ; B97E3 (2e:57e3) -> 1E 01
	ld a, $01 ; B97E5 (2e:57e5) -> 3E 01
	scall PlayerStep ; B97E7 (2e:57e7) -> CD 1E 4E
	ld hl, $0104 ; B97EA (2e:57ea) -> 21 04 01
	scall PrintTextWithNPCName ; B97ED (2e:57ed) -> CD A9 44
	ld bc, Data_b97ba ; B97F0 (2e:57f0) -> 01 BA 57
	ld e, $2e ; B97F3 (2e:57f3) -> 1E 2E
	ld a, $01 ; B97F5 (2e:57f5) -> 3E 01
	scall MovePerson ; B97F7 (2e:57f7) -> CD F7 41
	scall WaitNPCStep ; B97FA (2e:57fa) -> CD 0C 42
	ld e, $02 ; B97FD (2e:57fd) -> 1E 02
	ld a, $01 ; B97FF (2e:57ff) -> 3E 01
	scall SpriteFace ; B9801 (2e:5801) -> CD 95 40
	ld hl, $001e ; B9804 (2e:5804) -> 21 1E 00
	scall ScriptSleep ; B9807 (2e:5807) -> CD 8F 46
	ld a, $34 ; B980A (2e:580a) -> 3E 34
	scall PlaySFX ; B980C (2e:580c) -> CD FE 4E
	ld e, $00 ; B980F (2e:580f) -> 1E 00
	ld a, $01 ; B9811 (2e:5811) -> 3E 01
	scall SetPersonVisibilityState ; B9813 (2e:5813) -> CD 3D 41
	ld e, $01 ; B9816 (2e:5816) -> 1E 01
	ld a, $03 ; B9818 (2e:5818) -> 3E 03
	scall PlayerStep ; B981A (2e:581a) -> CD 1E 4E
	ld e, $01 ; B981D (2e:581d) -> 1E 01
	ld a, $03 ; B981F (2e:581f) -> 3E 03
	scall PlayerStep ; B9821 (2e:5821) -> CD 1E 4E
	ld bc, Data_b97c0 ; B9824 (2e:5824) -> 01 C0 57
	ld e, $2e ; B9827 (2e:5827) -> 1E 2E
	xor a ; B9829 (2e:5829) -> AF
	scall MovePersonAndWait ; B982A (2e:582a) -> CD 88 46
	scall WaitNPCStep ; B982D (2e:582d) -> CD 0C 42
	ld e, $03 ; B9830 (2e:5830) -> 1E 03
	xor a ; B9832 (2e:5832) -> AF
	scall SpriteFace ; B9833 (2e:5833) -> CD 95 40
	ld hl, $0105 ; B9836 (2e:5836) -> 21 05 01
	scall PrintTextWithNPCName ; B9839 (2e:5839) -> CD A9 44
	ld a, $2a ; B983C (2e:583c) -> 3E 2A
	scall PlaySFX ; B983E (2e:583e) -> CD FE 4E
	ld hl, $0106 ; B9841 (2e:5841) -> 21 06 01
	scall PrintTextStandard ; B9844 (2e:5844) -> CD 98 44
	ld c, $00 ; B9847 (2e:5847) -> 0E 00
	ld e, $01 ; B9849 (2e:5849) -> 1E 01
	ld a, $2a ; B984B (2e:584b) -> 3E 2A
	scall Func_80d4d ; B984D (2e:584d) -> CD 4D 4D
	ld e, $01 ; B9850 (2e:5850) -> 1E 01
	ld a, $03 ; B9852 (2e:5852) -> 3E 03
	scall PlayerStep ; B9854 (2e:5854) -> CD 1E 4E
	ret  ; B9857 (2e:5857) -> C9

Data_b9858:
	warpdef $01, $08, $02, $01, MAP_01_00, $11, $0c, $11, $0d, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $19, $0c, $19, $0d, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $11, $12, $11, $13, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $19, $12, $19, $13, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $08, $06, $08, $07, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $15, $06, $15, $07, $34
	warpdef $01, $08, $02, $01, MAP_17_00, $06, $04, $06, $05, $34
	warpdef $01, $08, $02, $01, MAP_17_00, $0f, $04, $0f, $05, $34
	warpdef $01, $08, $02, $01, MAP_20_00, $06, $06, $06, $07, $34
	warpdef $01, $08, $02, $01, MAP_20_00, $15, $06, $15, $07, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $1e, $0a, $1e, $0b, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $21, $0a, $21, $0b, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $05, $15, $05, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $08, $15, $08, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $11, $15, $11, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $14, $15, $14, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $17, $15, $17, $16, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $08, $13, $08, $14, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $0a, $19, $0a, $1a, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $12, $19, $12, $1a, $34

Data_b9934:
	dw $188
	dw -1

Data_b9938:
	dw $186
	dw -1

Data_b993c:
	dw $17e
	dw -1

Data_b9940:
	dw $184
	dw -1

Data_b9944:
	dw $1d9
	dw -1

Data_b9948:
	dw $02a
	dw -1

Data_b994c:
	dw $02a
	dw -1

Data_b9950:
	dw $1ed
	dw -1

Data_b9954:
	dw $1e9
	dw -1

Data_b9958:
	dw $1ef
	dw -1

Data_b995c:
	dw $1e7
	dw -1

Data_b9960:
	dw $1ea
	dw -1

Data_b9964:
	dw $1b8
	dw -1

Data_b9968:
	dw $1ae
	dw -1

Data_b996c:
	dw $1ad
	dw -1

Data_b9970:
	dw $17b
	dw -1

Data_b9974:
	dw $1af
	dw -1

Data_b9978:
	dw $1b0
	dw -1

Data_b997c:
	dw $1ab
	dw -1

Data_b9980:
	dw $375
	dw -1

Data_b9984:
	dw $1ac
	dw -1

Data_b9988:
	dw $29b
	dw -1

Data_b998c:
	dw $383
	dw -1

Data_b9990:
	dw $386
	dw -1

Data_b9994:
	dw $328
	dw -1

Data_b9998:
	dw $32a
	dw -1

Data_b999c:
	dw $32b
	dw -1

Data_b99a0:
	dw $397
	dw -1

Data_b99a4:
	dw $181
	dw -1

Data_b99a8:
	dw $187
	dw -1

Data_b99ac:
	dw $183
	dw -1

Data_b99b0:
	dw $3b0
	dw -1

Data_b99b4:
	dw $3af
	dw -1

Data_b99b8:
	dw $3b1
	dw -1

Data_b99bc:
	person_event $02, $04, $06, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9934

Data_b99ca:
	person_event $03, $04, $08, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9938

Data_b99d8:
	person_event $00, $04, $03, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b993c

Data_b99e6:
	person_event $06, $04, $07, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9940

Data_b99f4:
	person_event $01, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9944
	person_event $ff, $00, $0a, $07, $01, $02, $01, $04, $01, Func_b9f71, NULL

Data_b9a10:
	person_event $03, $04, $01, $03, $01, $01, $02, $04, $00, Func_b9fad, NULL
	person_event $ff, $00, $0a, $07, $01, $02, $01, $04, $01, Func_b9f8f, NULL

Data_b9a2c:
	person_event $04, $04, $06, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9948

Data_b9a3a:
	person_event $10, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b994c

Data_b9a48:
	person_event $06, $04, $02, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9950
	person_event $02, $04, $09, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9954

Data_b9a64:
	person_event $00, $04, $06, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9958
	person_event $07, $04, $03, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b995c
	person_event $03, $04, $09, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9960

Data_b9a8e:
	person_event $01, $04, $01, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9964
	person_event $00, $04, $0a, $08, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9968

Data_b9aaa:
	person_event $03, $04, $03, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b996c

Data_b9ab8:
	person_event $03, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9970

Data_b9ac6:
	person_event $02, $04, $07, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9974
	person_event $07, $04, $03, $03, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9978

Data_b9ae2:
	person_event $00, $04, $08, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b997c

Data_b9af0:
	person_event $13, $04, $02, $04, $01, $02, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9980

Data_b9afe:
	person_event $01, $04, $04, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9984

Data_b9b0c:
	person_event $0e, $04, $07, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9988

Data_b9b1a:
	person_event $02, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b998c

Data_b9b28:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9990
	person_event $04, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b99a0

Data_b9b44:
	person_event $ff, $00, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9994
	person_event $ff, $00, $07, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9998
	person_event $ff, $00, $09, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b999c

Data_b9b6e:
	map MAP_01_00
	db $11, $0c
	map MAP_01_00
	db $19, $0c
	map MAP_01_00
	db $11, $12
	map MAP_01_00
	db $19, $12
	map MAP_06_00
	db $08, $06
	map MAP_06_00
	db $15, $06
	map MAP_17_00
	db $06, $04
	map MAP_17_00
	db $0f, $04
	map MAP_20_00
	db $06, $06
	map MAP_20_00
	db $15, $06
	map MAP_25_01
	db $1e, $0a
	map MAP_25_01
	db $21, $0a
	map MAP_25_01
	db $05, $15
	map MAP_25_01
	db $08, $15
	map MAP_25_01
	db $11, $15
	map MAP_25_01
	db $14, $15
	map MAP_25_01
	db $17, $15
	map MAP_29_00
	db $08, $13
	map MAP_29_00
	db $0a, $19
	map MAP_29_00
	db $12, $19

Func_b9bbe:: ; b9bbe
	ld c, $00 ; B9BBE (2e:5bbe) -> 0E 00
.asm_b9bc0:
	ld a, c ; B9BC0 (2e:5bc0) -> 79
	cp $14 ; B9BC1 (2e:5bc1) -> FE 14
	jp nc, .asm_b9c28 ; B9BC3 (2e:5bc3) -> D2 28 5C
	ld l, c ; B9BC6 (2e:5bc6) -> 69
	ld h, $00 ; B9BC7 (2e:5bc7) -> 26 00
	add hl, hl ; B9BC9 (2e:5bc9) -> 29
	add hl, hl ; B9BCA (2e:5bca) -> 29
	ld de, Data_b9b6e ; B9BCB (2e:5bcb) -> 11 6E 5B
	add hl, de ; B9BCE (2e:5bce) -> 19
	ld a, [wBackupMapGroup] ; B9BCF (2e:5bcf) -> FA DF C7
	cp [hl] ; B9BD2 (2e:5bd2) -> BE
	jp nz, .asm_b9c24 ; B9BD3 (2e:5bd3) -> C2 24 5C
	ld l, c ; B9BD6 (2e:5bd6) -> 69
	ld h, $00 ; B9BD7 (2e:5bd7) -> 26 00
	add hl, hl ; B9BD9 (2e:5bd9) -> 29
	add hl, hl ; B9BDA (2e:5bda) -> 29
	ld de, Data_b9b6e ; B9BDB (2e:5bdb) -> 11 6E 5B
	add hl, de ; B9BDE (2e:5bde) -> 19
	inc hl ; B9BDF (2e:5bdf) -> 23
	ld a, [wBackupMapNumber] ; B9BE0 (2e:5be0) -> FA E0 C7
	cp [hl] ; B9BE3 (2e:5be3) -> BE
	jp nz, .asm_b9c24 ; B9BE4 (2e:5be4) -> C2 24 5C
	ld l, c ; B9BE7 (2e:5be7) -> 69
	ld h, $00 ; B9BE8 (2e:5be8) -> 26 00
	add hl, hl ; B9BEA (2e:5bea) -> 29
	add hl, hl ; B9BEB (2e:5beb) -> 29
	ld de, Data_b9b6e ; B9BEC (2e:5bec) -> 11 6E 5B
	add hl, de ; B9BEF (2e:5bef) -> 19
	inc hl ; B9BF0 (2e:5bf0) -> 23
	inc hl ; B9BF1 (2e:5bf1) -> 23
	ld a, [wBackupMapX] ; B9BF2 (2e:5bf2) -> FA DB C7
	cp [hl] ; B9BF5 (2e:5bf5) -> BE
	jp nz, .asm_b9c24 ; B9BF6 (2e:5bf6) -> C2 24 5C
	ld l, c ; B9BF9 (2e:5bf9) -> 69
	ld h, $00 ; B9BFA (2e:5bfa) -> 26 00
	add hl, hl ; B9BFC (2e:5bfc) -> 29
	add hl, hl ; B9BFD (2e:5bfd) -> 29
	ld de, Data_b9b6e ; B9BFE (2e:5bfe) -> 11 6E 5B
	add hl, de ; B9C01 (2e:5c01) -> 19
	inc hl ; B9C02 (2e:5c02) -> 23
	inc hl ; B9C03 (2e:5c03) -> 23
	inc hl ; B9C04 (2e:5c04) -> 23
	ld a, [wBackupMapY] ; B9C05 (2e:5c05) -> FA DC C7
	cp [hl] ; B9C08 (2e:5c08) -> BE
	jp nz, .asm_b9c24 ; B9C09 (2e:5c09) -> C2 24 5C
	ld l, c ; B9C0C (2e:5c0c) -> 69
	ld h, $00 ; B9C0D (2e:5c0d) -> 26 00
	ld e, l ; B9C0F (2e:5c0f) -> 5D
	ld d, h ; B9C10 (2e:5c10) -> 54
	add hl, hl ; B9C11 (2e:5c11) -> 29
	ld c, l ; B9C12 (2e:5c12) -> 4D
	ld b, h ; B9C13 (2e:5c13) -> 44
	add hl, hl ; B9C14 (2e:5c14) -> 29
	add hl, hl ; B9C15 (2e:5c15) -> 29
	add hl, de ; B9C16 (2e:5c16) -> 19
	add hl, bc ; B9C17 (2e:5c17) -> 09
	ld de, Data_b9858 ; B9C18 (2e:5c18) -> 11 58 58
	add hl, de ; B9C1B (2e:5c1b) -> 19
	ld e, $01 ; B9C1C (2e:5c1c) -> 1E 01
	scall LoadWarps ; B9C1E (2e:5c1e) -> CD 3A 40
	jp .asm_b9c28 ; B9C21 (2e:5c21) -> C3 28 5C
.asm_b9c24:
	inc c ; B9C24 (2e:5c24) -> 0C
	jp .asm_b9bc0 ; B9C25 (2e:5c25) -> C3 C0 5B
.asm_b9c28:
	call Func_b9f52 ; B9C28 (2e:5c28) -> CD 52 5F
	ld hl, Func_b9f52 ; B9C2B (2e:5c2b) -> 21 52 5F
	scall Func_80f11 ; B9C2E (2e:5c2e) -> CD 11 4F
	ld a, [wBackupMapGroup] ; B9C31 (2e:5c31) -> FA DF C7
	cp $01 ; B9C34 (2e:5c34) -> FE 01
	jp nz, .asm_b9cee ; B9C36 (2e:5c36) -> C2 EE 5C
	ld a, [wBackupMapNumber] ; B9C39 (2e:5c39) -> FA E0 C7
	or a ; B9C3C (2e:5c3c) -> B7
	jp nz, .asm_b9cee ; B9C3D (2e:5c3d) -> C2 EE 5C
	ld a, [wBackupMapX] ; B9C40 (2e:5c40) -> FA DB C7
	cp $11 ; B9C43 (2e:5c43) -> FE 11
	jp nz, .asm_b9c71 ; B9C45 (2e:5c45) -> C2 71 5C
	ld a, [wBackupMapY] ; B9C48 (2e:5c48) -> FA DC C7
	cp $0c ; B9C4B (2e:5c4b) -> FE 0C
	jp nz, .asm_b9c71 ; B9C4D (2e:5c4d) -> C2 71 5C
	ld e, $01 ; B9C50 (2e:5c50) -> 1E 01
	ld hl, Data_b99bc ; B9C52 (2e:5c52) -> 21 BC 59
	scall LoadMapObjects ; B9C55 (2e:5c55) -> CD FB 40
	ld a, [wc790] ; B9C58 (2e:5c58) -> FA 90 C7
	or a ; B9C5B (2e:5c5b) -> B7
	jp z, .asm_b9c6e ; B9C5C (2e:5c5c) -> CA 6E 5C
	ld a, [wc790] ; B9C5F (2e:5c5f) -> FA 90 C7
	cp $04 ; B9C62 (2e:5c62) -> FE 04
	jp nz, .asm_b9c6e ; B9C64 (2e:5c64) -> C2 6E 5C
	ld de, Data_b99a4 ; B9C67 (2e:5c67) -> 11 A4 59
	xor a ; B9C6A (2e:5c6a) -> AF
	scall SetPersonTextPointer ; B9C6B (2e:5c6b) -> CD 50 41
.asm_b9c6e:
	jp .asm_b9ceb ; B9C6E (2e:5c6e) -> C3 EB 5C
.asm_b9c71:
	ld a, [wBackupMapX] ; B9C71 (2e:5c71) -> FA DB C7
	cp $19 ; B9C74 (2e:5c74) -> FE 19
	jp nz, .asm_b9ca2 ; B9C76 (2e:5c76) -> C2 A2 5C
	ld a, [wBackupMapY] ; B9C79 (2e:5c79) -> FA DC C7
	cp $0c ; B9C7C (2e:5c7c) -> FE 0C
	jp nz, .asm_b9ca2 ; B9C7E (2e:5c7e) -> C2 A2 5C
	ld e, $01 ; B9C81 (2e:5c81) -> 1E 01
	ld hl, Data_b99ca ; B9C83 (2e:5c83) -> 21 CA 59
	scall LoadMapObjects ; B9C86 (2e:5c86) -> CD FB 40
	ld a, [wc790] ; B9C89 (2e:5c89) -> FA 90 C7
	or a ; B9C8C (2e:5c8c) -> B7
	jp z, .asm_b9c9f ; B9C8D (2e:5c8d) -> CA 9F 5C
	ld a, [wc790] ; B9C90 (2e:5c90) -> FA 90 C7
	cp $04 ; B9C93 (2e:5c93) -> FE 04
	jp nz, .asm_b9c9f ; B9C95 (2e:5c95) -> C2 9F 5C
	ld de, Data_b99a8 ; B9C98 (2e:5c98) -> 11 A8 59
	xor a ; B9C9B (2e:5c9b) -> AF
	scall SetPersonTextPointer ; B9C9C (2e:5c9c) -> CD 50 41
.asm_b9c9f:
	jp .asm_b9ceb ; B9C9F (2e:5c9f) -> C3 EB 5C
.asm_b9ca2:
	ld a, [wBackupMapX] ; B9CA2 (2e:5ca2) -> FA DB C7
	cp $11 ; B9CA5 (2e:5ca5) -> FE 11
	jp nz, .asm_b9cbd ; B9CA7 (2e:5ca7) -> C2 BD 5C
	ld a, [wBackupMapY] ; B9CAA (2e:5caa) -> FA DC C7
	cp $12 ; B9CAD (2e:5cad) -> FE 12
	jp nz, .asm_b9cbd ; B9CAF (2e:5caf) -> C2 BD 5C
	ld e, $01 ; B9CB2 (2e:5cb2) -> 1E 01
	ld hl, Data_b99d8 ; B9CB4 (2e:5cb4) -> 21 D8 59
	scall LoadMapObjects ; B9CB7 (2e:5cb7) -> CD FB 40
	jp .asm_b9ceb ; B9CBA (2e:5cba) -> C3 EB 5C
.asm_b9cbd:
	ld a, [wBackupMapX] ; B9CBD (2e:5cbd) -> FA DB C7
	cp $19 ; B9CC0 (2e:5cc0) -> FE 19
	jp nz, .asm_b9ceb ; B9CC2 (2e:5cc2) -> C2 EB 5C
	ld a, [wBackupMapY] ; B9CC5 (2e:5cc5) -> FA DC C7
	cp $12 ; B9CC8 (2e:5cc8) -> FE 12
	jp nz, .asm_b9ceb ; B9CCA (2e:5cca) -> C2 EB 5C
	ld e, $01 ; B9CCD (2e:5ccd) -> 1E 01
	ld hl, Data_b99e6 ; B9CCF (2e:5ccf) -> 21 E6 59
	scall LoadMapObjects ; B9CD2 (2e:5cd2) -> CD FB 40
	ld a, [wc790] ; B9CD5 (2e:5cd5) -> FA 90 C7
	or a ; B9CD8 (2e:5cd8) -> B7
	jp z, .asm_b9ceb ; B9CD9 (2e:5cd9) -> CA EB 5C
	ld a, [wc790] ; B9CDC (2e:5cdc) -> FA 90 C7
	cp $04 ; B9CDF (2e:5cdf) -> FE 04
	jp nz, .asm_b9ceb ; B9CE1 (2e:5ce1) -> C2 EB 5C
	ld de, Data_b99ac ; B9CE4 (2e:5ce4) -> 11 AC 59
	xor a ; B9CE7 (2e:5ce7) -> AF
	scall SetPersonTextPointer ; B9CE8 (2e:5ce8) -> CD 50 41
.asm_b9ceb:
	jp .asm_b9f35 ; B9CEB (2e:5ceb) -> C3 35 5F
.asm_b9cee:
	ld a, [wBackupMapGroup] ; B9CEE (2e:5cee) -> FA DF C7
	cp $06 ; B9CF1 (2e:5cf1) -> FE 06
	jp nz, .asm_b9d3f ; B9CF3 (2e:5cf3) -> C2 3F 5D
	ld a, [wBackupMapNumber] ; B9CF6 (2e:5cf6) -> FA E0 C7
	or a ; B9CF9 (2e:5cf9) -> B7
	jp nz, .asm_b9d3f ; B9CFA (2e:5cfa) -> C2 3F 5D
	ld a, [wBackupMapX] ; B9CFD (2e:5cfd) -> FA DB C7
	cp $08 ; B9D00 (2e:5d00) -> FE 08
	jp nz, .asm_b9d1e ; B9D02 (2e:5d02) -> C2 1E 5D
	ld a, [wBackupMapY] ; B9D05 (2e:5d05) -> FA DC C7
	cp $06 ; B9D08 (2e:5d08) -> FE 06
	jp nz, .asm_b9d1e ; B9D0A (2e:5d0a) -> C2 1E 5D
	ld e, $02 ; B9D0D (2e:5d0d) -> 1E 02
	ld hl, Data_b99f4 ; B9D0F (2e:5d0f) -> 21 F4 59
	scall LoadMapObjects ; B9D12 (2e:5d12) -> CD FB 40
	call Func_b9f52 ; B9D15 (2e:5d15) -> CD 52 5F
	scall Func_80f02 ; B9D18 (2e:5d18) -> CD 02 4F
	jp .asm_b9d3c ; B9D1B (2e:5d1b) -> C3 3C 5D
.asm_b9d1e:
	ld a, [wBackupMapX] ; B9D1E (2e:5d1e) -> FA DB C7
	cp $15 ; B9D21 (2e:5d21) -> FE 15
	jp nz, .asm_b9d3c ; B9D23 (2e:5d23) -> C2 3C 5D
	ld a, [wBackupMapY] ; B9D26 (2e:5d26) -> FA DC C7
	cp $06 ; B9D29 (2e:5d29) -> FE 06
	jp nz, .asm_b9d3c ; B9D2B (2e:5d2b) -> C2 3C 5D
	ld e, $02 ; B9D2E (2e:5d2e) -> 1E 02
	ld hl, Data_b9a10 ; B9D30 (2e:5d30) -> 21 10 5A
	scall LoadMapObjects ; B9D33 (2e:5d33) -> CD FB 40
	call Func_b9f52 ; B9D36 (2e:5d36) -> CD 52 5F
	scall Func_80f02 ; B9D39 (2e:5d39) -> CD 02 4F
.asm_b9d3c:
	jp .asm_b9f35 ; B9D3C (2e:5d3c) -> C3 35 5F
.asm_b9d3f:
	ld a, [wBackupMapGroup] ; B9D3F (2e:5d3f) -> FA DF C7
	cp $11 ; B9D42 (2e:5d42) -> FE 11
	jp nz, .asm_b9d84 ; B9D44 (2e:5d44) -> C2 84 5D
	ld a, [wBackupMapNumber] ; B9D47 (2e:5d47) -> FA E0 C7
	or a ; B9D4A (2e:5d4a) -> B7
	jp nz, .asm_b9d84 ; B9D4B (2e:5d4b) -> C2 84 5D
	ld a, [wBackupMapX] ; B9D4E (2e:5d4e) -> FA DB C7
	cp $06 ; B9D51 (2e:5d51) -> FE 06
	jp nz, .asm_b9d69 ; B9D53 (2e:5d53) -> C2 69 5D
	ld a, [wBackupMapY] ; B9D56 (2e:5d56) -> FA DC C7
	cp $04 ; B9D59 (2e:5d59) -> FE 04
	jp nz, .asm_b9d69 ; B9D5B (2e:5d5b) -> C2 69 5D
	ld e, $01 ; B9D5E (2e:5d5e) -> 1E 01
	ld hl, Data_b9a2c ; B9D60 (2e:5d60) -> 21 2C 5A
	scall LoadMapObjects ; B9D63 (2e:5d63) -> CD FB 40
	jp .asm_b9d81 ; B9D66 (2e:5d66) -> C3 81 5D
.asm_b9d69:
	ld a, [wBackupMapX] ; B9D69 (2e:5d69) -> FA DB C7
	cp $0f ; B9D6C (2e:5d6c) -> FE 0F
	jp nz, .asm_b9d81 ; B9D6E (2e:5d6e) -> C2 81 5D
	ld a, [wBackupMapY] ; B9D71 (2e:5d71) -> FA DC C7
	cp $04 ; B9D74 (2e:5d74) -> FE 04
	jp nz, .asm_b9d81 ; B9D76 (2e:5d76) -> C2 81 5D
	ld e, $01 ; B9D79 (2e:5d79) -> 1E 01
	ld hl, Data_b9a3a ; B9D7B (2e:5d7b) -> 21 3A 5A
	scall LoadMapObjects ; B9D7E (2e:5d7e) -> CD FB 40
.asm_b9d81:
	jp .asm_b9f35 ; B9D81 (2e:5d81) -> C3 35 5F
.asm_b9d84:
	ld a, [wBackupMapGroup] ; B9D84 (2e:5d84) -> FA DF C7
	cp $14 ; B9D87 (2e:5d87) -> FE 14
	jp nz, .asm_b9e0b ; B9D89 (2e:5d89) -> C2 0B 5E
	ld a, [wBackupMapNumber] ; B9D8C (2e:5d8c) -> FA E0 C7
	or a ; B9D8F (2e:5d8f) -> B7
	jp nz, .asm_b9e0b ; B9D90 (2e:5d90) -> C2 0B 5E
	ld a, [wBackupMapX] ; B9D93 (2e:5d93) -> FA DB C7
	cp $06 ; B9D96 (2e:5d96) -> FE 06
	jp nz, .asm_b9dcb ; B9D98 (2e:5d98) -> C2 CB 5D
	ld a, [wBackupMapY] ; B9D9B (2e:5d9b) -> FA DC C7
	cp $06 ; B9D9E (2e:5d9e) -> FE 06
	jp nz, .asm_b9dcb ; B9DA0 (2e:5da0) -> C2 CB 5D
	ld e, $02 ; B9DA3 (2e:5da3) -> 1E 02
	ld hl, Data_b9a48 ; B9DA5 (2e:5da5) -> 21 48 5A
	scall LoadMapObjects ; B9DA8 (2e:5da8) -> CD FB 40
	ld a, [wc790] ; B9DAB (2e:5dab) -> FA 90 C7
	or a ; B9DAE (2e:5dae) -> B7
	jp z, .asm_b9dc8 ; B9DAF (2e:5daf) -> CA C8 5D
	ld a, [wc790] ; B9DB2 (2e:5db2) -> FA 90 C7
	cp $05 ; B9DB5 (2e:5db5) -> FE 05
	jp nc, .asm_b9dc8 ; B9DB7 (2e:5db7) -> D2 C8 5D
	ld de, Data_b99b0 ; B9DBA (2e:5dba) -> 11 B0 59
	xor a ; B9DBD (2e:5dbd) -> AF
	scall SetPersonTextPointer ; B9DBE (2e:5dbe) -> CD 50 41
	ld e, $00 ; B9DC1 (2e:5dc1) -> 1E 00
	ld a, $01 ; B9DC3 (2e:5dc3) -> 3E 01
	scall SetPersonVisibilityState ; B9DC5 (2e:5dc5) -> CD 3D 41
.asm_b9dc8:
	jp .asm_b9e08 ; B9DC8 (2e:5dc8) -> C3 08 5E
.asm_b9dcb:
	ld a, [wBackupMapX] ; B9DCB (2e:5dcb) -> FA DB C7
	cp $15 ; B9DCE (2e:5dce) -> FE 15
	jp nz, .asm_b9e08 ; B9DD0 (2e:5dd0) -> C2 08 5E
	ld a, [wBackupMapY] ; B9DD3 (2e:5dd3) -> FA DC C7
	cp $06 ; B9DD6 (2e:5dd6) -> FE 06
	jp nz, .asm_b9e08 ; B9DD8 (2e:5dd8) -> C2 08 5E
	ld e, $03 ; B9DDB (2e:5ddb) -> 1E 03
	ld hl, Data_b9a64 ; B9DDD (2e:5ddd) -> 21 64 5A
	scall LoadMapObjects ; B9DE0 (2e:5de0) -> CD FB 40
	ld a, [wc790] ; B9DE3 (2e:5de3) -> FA 90 C7
	or a ; B9DE6 (2e:5de6) -> B7
	jp z, .asm_b9e08 ; B9DE7 (2e:5de7) -> CA 08 5E
	ld a, [wc790] ; B9DEA (2e:5dea) -> FA 90 C7
	cp $05 ; B9DED (2e:5ded) -> FE 05
	jp nc, .asm_b9e08 ; B9DEF (2e:5def) -> D2 08 5E
	ld de, Data_b99b8 ; B9DF2 (2e:5df2) -> 11 B8 59
	ld a, $01 ; B9DF5 (2e:5df5) -> 3E 01
	scall SetPersonTextPointer ; B9DF7 (2e:5df7) -> CD 50 41
	ld de, Data_b99b4 ; B9DFA (2e:5dfa) -> 11 B4 59
	ld a, $02 ; B9DFD (2e:5dfd) -> 3E 02
	scall SetPersonTextPointer ; B9DFF (2e:5dff) -> CD 50 41
	ld e, $00 ; B9E02 (2e:5e02) -> 1E 00
	xor a ; B9E04 (2e:5e04) -> AF
	scall SetPersonVisibilityState ; B9E05 (2e:5e05) -> CD 3D 41
.asm_b9e08:
	jp .asm_b9f35 ; B9E08 (2e:5e08) -> C3 35 5F
.asm_b9e0b:
	ld a, [wBackupMapGroup] ; B9E0B (2e:5e0b) -> FA DF C7
	cp $19 ; B9E0E (2e:5e0e) -> FE 19
	jp nz, .asm_b9ed8 ; B9E10 (2e:5e10) -> C2 D8 5E
	ld a, [wBackupMapNumber] ; B9E13 (2e:5e13) -> FA E0 C7
	cp $01 ; B9E16 (2e:5e16) -> FE 01
	jp nz, .asm_b9ed8 ; B9E18 (2e:5e18) -> C2 D8 5E
	ld a, [wBackupMapX] ; B9E1B (2e:5e1b) -> FA DB C7
	cp $1e ; B9E1E (2e:5e1e) -> FE 1E
	jp nz, .asm_b9e36 ; B9E20 (2e:5e20) -> C2 36 5E
	ld a, [wBackupMapY] ; B9E23 (2e:5e23) -> FA DC C7
	cp $0a ; B9E26 (2e:5e26) -> FE 0A
	jp nz, .asm_b9e36 ; B9E28 (2e:5e28) -> C2 36 5E
	ld e, $02 ; B9E2B (2e:5e2b) -> 1E 02
	ld hl, Data_b9a8e ; B9E2D (2e:5e2d) -> 21 8E 5A
	scall LoadMapObjects ; B9E30 (2e:5e30) -> CD FB 40
	jp .asm_b9ed5 ; B9E33 (2e:5e33) -> C3 D5 5E
.asm_b9e36:
	ld a, [wBackupMapX] ; B9E36 (2e:5e36) -> FA DB C7
	cp $21 ; B9E39 (2e:5e39) -> FE 21
	jp nz, .asm_b9e51 ; B9E3B (2e:5e3b) -> C2 51 5E
	ld a, [wBackupMapY] ; B9E3E (2e:5e3e) -> FA DC C7
	cp $0a ; B9E41 (2e:5e41) -> FE 0A
	jp nz, .asm_b9e51 ; B9E43 (2e:5e43) -> C2 51 5E
	ld e, $01 ; B9E46 (2e:5e46) -> 1E 01
	ld hl, Data_b9aaa ; B9E48 (2e:5e48) -> 21 AA 5A
	scall LoadMapObjects ; B9E4B (2e:5e4b) -> CD FB 40
	jp .asm_b9ed5 ; B9E4E (2e:5e4e) -> C3 D5 5E
.asm_b9e51:
	ld a, [wBackupMapX] ; B9E51 (2e:5e51) -> FA DB C7
	cp $05 ; B9E54 (2e:5e54) -> FE 05
	jp nz, .asm_b9e6c ; B9E56 (2e:5e56) -> C2 6C 5E
	ld a, [wBackupMapY] ; B9E59 (2e:5e59) -> FA DC C7
	cp $15 ; B9E5C (2e:5e5c) -> FE 15
	jp nz, .asm_b9e6c ; B9E5E (2e:5e5e) -> C2 6C 5E
	ld e, $01 ; B9E61 (2e:5e61) -> 1E 01
	ld hl, Data_b9ab8 ; B9E63 (2e:5e63) -> 21 B8 5A
	scall LoadMapObjects ; B9E66 (2e:5e66) -> CD FB 40
	jp .asm_b9ed5 ; B9E69 (2e:5e69) -> C3 D5 5E
.asm_b9e6c:
	ld a, [wBackupMapX] ; B9E6C (2e:5e6c) -> FA DB C7
	cp $08 ; B9E6F (2e:5e6f) -> FE 08
	jp nz, .asm_b9e87 ; B9E71 (2e:5e71) -> C2 87 5E
	ld a, [wBackupMapY] ; B9E74 (2e:5e74) -> FA DC C7
	cp $15 ; B9E77 (2e:5e77) -> FE 15
	jp nz, .asm_b9e87 ; B9E79 (2e:5e79) -> C2 87 5E
	ld e, $02 ; B9E7C (2e:5e7c) -> 1E 02
	ld hl, Data_b9ac6 ; B9E7E (2e:5e7e) -> 21 C6 5A
	scall LoadMapObjects ; B9E81 (2e:5e81) -> CD FB 40
	jp .asm_b9ed5 ; B9E84 (2e:5e84) -> C3 D5 5E
.asm_b9e87:
	ld a, [wBackupMapX] ; B9E87 (2e:5e87) -> FA DB C7
	cp $11 ; B9E8A (2e:5e8a) -> FE 11
	jp nz, .asm_b9ea2 ; B9E8C (2e:5e8c) -> C2 A2 5E
	ld a, [wBackupMapY] ; B9E8F (2e:5e8f) -> FA DC C7
	cp $15 ; B9E92 (2e:5e92) -> FE 15
	jp nz, .asm_b9ea2 ; B9E94 (2e:5e94) -> C2 A2 5E
	ld e, $01 ; B9E97 (2e:5e97) -> 1E 01
	ld hl, Data_b9ae2 ; B9E99 (2e:5e99) -> 21 E2 5A
	scall LoadMapObjects ; B9E9C (2e:5e9c) -> CD FB 40
	jp .asm_b9ed5 ; B9E9F (2e:5e9f) -> C3 D5 5E
.asm_b9ea2:
	ld a, [wBackupMapX] ; B9EA2 (2e:5ea2) -> FA DB C7
	cp $14 ; B9EA5 (2e:5ea5) -> FE 14
	jp nz, .asm_b9ebd ; B9EA7 (2e:5ea7) -> C2 BD 5E
	ld a, [wBackupMapY] ; B9EAA (2e:5eaa) -> FA DC C7
	cp $15 ; B9EAD (2e:5ead) -> FE 15
	jp nz, .asm_b9ebd ; B9EAF (2e:5eaf) -> C2 BD 5E
	ld e, $01 ; B9EB2 (2e:5eb2) -> 1E 01
	ld hl, Data_b9afe ; B9EB4 (2e:5eb4) -> 21 FE 5A
	scall LoadMapObjects ; B9EB7 (2e:5eb7) -> CD FB 40
	jp .asm_b9ed5 ; B9EBA (2e:5eba) -> C3 D5 5E
.asm_b9ebd:
	ld a, [wBackupMapX] ; B9EBD (2e:5ebd) -> FA DB C7
	cp $17 ; B9EC0 (2e:5ec0) -> FE 17
	jp nz, .asm_b9ed5 ; B9EC2 (2e:5ec2) -> C2 D5 5E
	ld a, [wBackupMapY] ; B9EC5 (2e:5ec5) -> FA DC C7
	cp $15 ; B9EC8 (2e:5ec8) -> FE 15
	jp nz, .asm_b9ed5 ; B9ECA (2e:5eca) -> C2 D5 5E
	ld e, $01 ; B9ECD (2e:5ecd) -> 1E 01
	ld hl, Data_b9af0 ; B9ECF (2e:5ecf) -> 21 F0 5A
	scall LoadMapObjects ; B9ED2 (2e:5ed2) -> CD FB 40
.asm_b9ed5:
	jp .asm_b9f35 ; B9ED5 (2e:5ed5) -> C3 35 5F
.asm_b9ed8:
	ld a, [wBackupMapGroup] ; B9ED8 (2e:5ed8) -> FA DF C7
	cp $1d ; B9EDB (2e:5edb) -> FE 1D
	jp nz, .asm_b9f35 ; B9EDD (2e:5edd) -> C2 35 5F
	ld a, [wBackupMapNumber] ; B9EE0 (2e:5ee0) -> FA E0 C7
	or a ; B9EE3 (2e:5ee3) -> B7
	jp nz, .asm_b9f35 ; B9EE4 (2e:5ee4) -> C2 35 5F
	ld a, [wBackupMapX] ; B9EE7 (2e:5ee7) -> FA DB C7
	cp $08 ; B9EEA (2e:5eea) -> FE 08
	jp nz, .asm_b9f02 ; B9EEC (2e:5eec) -> C2 02 5F
	ld a, [wBackupMapY] ; B9EEF (2e:5eef) -> FA DC C7
	cp $13 ; B9EF2 (2e:5ef2) -> FE 13
	jp nz, .asm_b9f02 ; B9EF4 (2e:5ef4) -> C2 02 5F
	ld e, $01 ; B9EF7 (2e:5ef7) -> 1E 01
	ld hl, Data_b9b0c ; B9EF9 (2e:5ef9) -> 21 0C 5B
	scall LoadMapObjects ; B9EFC (2e:5efc) -> CD FB 40
	jp .asm_b9f35 ; B9EFF (2e:5eff) -> C3 35 5F
.asm_b9f02:
	ld a, [wBackupMapX] ; B9F02 (2e:5f02) -> FA DB C7
	cp $0a ; B9F05 (2e:5f05) -> FE 0A
	jp nz, .asm_b9f1d ; B9F07 (2e:5f07) -> C2 1D 5F
	ld a, [wBackupMapY] ; B9F0A (2e:5f0a) -> FA DC C7
	cp $19 ; B9F0D (2e:5f0d) -> FE 19
	jp nz, .asm_b9f1d ; B9F0F (2e:5f0f) -> C2 1D 5F
	ld e, $01 ; B9F12 (2e:5f12) -> 1E 01
	ld hl, Data_b9b1a ; B9F14 (2e:5f14) -> 21 1A 5B
	scall LoadMapObjects ; B9F17 (2e:5f17) -> CD FB 40
	jp .asm_b9f35 ; B9F1A (2e:5f1a) -> C3 35 5F
.asm_b9f1d:
	ld a, [wBackupMapX] ; B9F1D (2e:5f1d) -> FA DB C7
	cp $12 ; B9F20 (2e:5f20) -> FE 12
	jp nz, .asm_b9f35 ; B9F22 (2e:5f22) -> C2 35 5F
	ld a, [wBackupMapY] ; B9F25 (2e:5f25) -> FA DC C7
	cp $19 ; B9F28 (2e:5f28) -> FE 19
	jp nz, .asm_b9f35 ; B9F2A (2e:5f2a) -> C2 35 5F
	ld e, $02 ; B9F2D (2e:5f2d) -> 1E 02
	ld hl, Data_b9b28 ; B9F2F (2e:5f2f) -> 21 28 5B
	scall LoadMapObjects ; B9F32 (2e:5f32) -> CD FB 40
.asm_b9f35:
	ld e, $03 ; B9F35 (2e:5f35) -> 1E 03
	ld hl, Data_b9b44 ; B9F37 (2e:5f37) -> 21 44 5B
	scall LoadMapObjects ; B9F3A (2e:5f3a) -> CD FB 40
	scall Func_8001c ; B9F3D (2e:5f3d) -> CD 1C 40
	ld a, $11 ; B9F40 (2e:5f40) -> 3E 11
	scall PlayMusic ; B9F42 (2e:5f42) -> CD E6 4E
	ret  ; B9F45 (2e:5f45) -> C9

Data_b9f46:
	db $01, $08, $01, $01, $0a, $07

Data_b9f4c:
	db $01, $08, $01, $01, $0a, $08

Func_b9f52:
	ld a, [wBackupMapGroup] ; B9F52 (2e:5f52) -> FA DF C7
	cp $06 ; B9F55 (2e:5f55) -> FE 06
	jp nz, .asm_b9f70 ; B9F57 (2e:5f57) -> C2 70 5F
	ld a, [wBackupMapNumber] ; B9F5A (2e:5f5a) -> FA E0 C7
	or a ; B9F5D (2e:5f5d) -> B7
	jp nz, .asm_b9f70 ; B9F5E (2e:5f5e) -> C2 70 5F
	ld hl, Data_b9f46 ; B9F61 (2e:5f61) -> 21 46 5F
	scall Func_80d9b ; B9F64 (2e:5f64) -> CD 9B 4D
	ld hl, Data_b9f4c ; B9F67 (2e:5f67) -> 21 4C 5F
	scall Func_80d9b ; B9F6A (2e:5f6a) -> CD 9B 4D
	scall Func_80f02 ; B9F6D (2e:5f6d) -> CD 02 4F
.asm_b9f70:
	ret  ; B9F70 (2e:5f70) -> C9

Func_b9f71:
	ld a, e ; B9F71 (2e:5f71) -> 7B
	cp $02 ; B9F72 (2e:5f72) -> FE 02
	jp nz, .asm_b9f8e ; B9F74 (2e:5f74) -> C2 8E 5F
	ld a, $2e ; B9F77 (2e:5f77) -> 3E 2E
	scall PlaySFX ; B9F79 (2e:5f79) -> CD FE 4E
	ld l, $05 ; B9F7C (2e:5f7c) -> 2E 05
	push hl ; B9F7E (2e:5f7e) -> E5
	ld c, $0a ; B9F7F (2e:5f7f) -> 0E 0A
	ld e, $00 ; B9F81 (2e:5f81) -> 1E 00
	ld a, $06 ; B9F83 (2e:5f83) -> 3E 06
	scall Func_80dff ; B9F85 (2e:5f85) -> CD FF 4D
	pop bc ; B9F88 (2e:5f88) -> C1
	ld a, $01 ; B9F89 (2e:5f89) -> 3E 01
	ld [wPlayerFacing], a ; B9F8B (2e:5f8b) -> EA 38 C8
.asm_b9f8e:
	ret  ; B9F8E (2e:5f8e) -> C9

Func_b9f8f:
	ld a, e ; B9F8F (2e:5f8f) -> 7B
	cp $02 ; B9F90 (2e:5f90) -> FE 02
	jp nz, .asm_b9fac ; B9F92 (2e:5f92) -> C2 AC 5F
	ld l, $05 ; B9F95 (2e:5f95) -> 2E 05
	push hl ; B9F97 (2e:5f97) -> E5
	ld c, $17 ; B9F98 (2e:5f98) -> 0E 17
	ld e, $00 ; B9F9A (2e:5f9a) -> 1E 00
	ld a, $06 ; B9F9C (2e:5f9c) -> 3E 06
	scall Func_80dff ; B9F9E (2e:5f9e) -> CD FF 4D
	pop bc ; B9FA1 (2e:5fa1) -> C1
	ld a, $2e ; B9FA2 (2e:5fa2) -> 3E 2E
	scall PlaySFX ; B9FA4 (2e:5fa4) -> CD FE 4E
	ld a, $01 ; B9FA7 (2e:5fa7) -> 3E 01
	ld [wPlayerFacing], a ; B9FA9 (2e:5fa9) -> EA 38 C8
.asm_b9fac:
	ret  ; B9FAC (2e:5fac) -> C9

Func_b9fad:
	push af ; B9FAD (2e:5fad) -> F5
	ld a, e ; B9FAE (2e:5fae) -> 7B
	or a ; B9FAF (2e:5faf) -> B7
	jp nz, .asm_ba023 ; B9FB0 (2e:5fb0) -> C2 23 60
	ld hl, sp+$01 ; B9FB3 (2e:5fb3) -> F8 01
	ld a, [hl] ; B9FB5 (2e:5fb5) -> 7E
	scall FacePlayer ; B9FB6 (2e:5fb6) -> CD 4B 44
	ld a, [wc790] ; B9FB9 (2e:5fb9) -> FA 90 C7
	or a ; B9FBC (2e:5fbc) -> B7
	jp z, .asm_b9fd1 ; B9FBD (2e:5fbd) -> CA D1 5F
	ld a, [wc790] ; B9FC0 (2e:5fc0) -> FA 90 C7
	cp $06 ; B9FC3 (2e:5fc3) -> FE 06
	jp nc, .asm_b9fd1 ; B9FC5 (2e:5fc5) -> D2 D1 5F
	ld hl, $0454 ; B9FC8 (2e:5fc8) -> 21 54 04
	scall PrintTextStandard ; B9FCB (2e:5fcb) -> CD 98 44
	jp .asm_ba023 ; B9FCE (2e:5fce) -> C3 23 60
.asm_b9fd1:
	ld hl, $00e9 ; B9FD1 (2e:5fd1) -> 21 E9 00
	scall CheckEventFlag ; B9FD4 (2e:5fd4) -> CD 2E 46
	cp $01 ; B9FD7 (2e:5fd7) -> FE 01
	jp nz, .asm_b9ff7 ; B9FD9 (2e:5fd9) -> C2 F7 5F
	ld hl, $00eb ; B9FDC (2e:5fdc) -> 21 EB 00
	scall CheckEventFlag ; B9FDF (2e:5fdf) -> CD 2E 46
	or a ; B9FE2 (2e:5fe2) -> B7
	jp nz, .asm_b9ff7 ; B9FE3 (2e:5fe3) -> C2 F7 5F
	ld hl, $0452 ; B9FE6 (2e:5fe6) -> 21 52 04
	scall PrintTextStandard ; B9FE9 (2e:5fe9) -> CD 98 44
	ld e, $01 ; B9FEC (2e:5fec) -> 1E 01
	ld hl, $00eb ; B9FEE (2e:5fee) -> 21 EB 00
	scall EventFlagAction ; B9FF1 (2e:5ff1) -> CD 1B 46
	jp .asm_ba023 ; B9FF4 (2e:5ff4) -> C3 23 60
.asm_b9ff7:
	ld hl, $00ea ; B9FF7 (2e:5ff7) -> 21 EA 00
	scall CheckEventFlag ; B9FFA (2e:5ffa) -> CD 2E 46
	cp $01 ; B9FFD (2e:5ffd) -> FE 01
	jp nz, .asm_ba01d ; B9FFF (2e:5fff) -> C2 1D 60
	ld hl, $00eb ; BA002 (2e:6002) -> 21 EB 00
	scall CheckEventFlag ; BA005 (2e:6005) -> CD 2E 46
	or a ; BA008 (2e:6008) -> B7
	jp nz, .asm_ba01d ; BA009 (2e:6009) -> C2 1D 60
	ld hl, $0453 ; BA00C (2e:600c) -> 21 53 04
	scall PrintTextStandard ; BA00F (2e:600f) -> CD 98 44
	ld e, $01 ; BA012 (2e:6012) -> 1E 01
	ld hl, $00eb ; BA014 (2e:6014) -> 21 EB 00
	scall EventFlagAction ; BA017 (2e:6017) -> CD 1B 46
	jp .asm_ba023 ; BA01A (2e:601a) -> C3 23 60
.asm_ba01d:
	ld hl, $0455 ; BA01D (2e:601d) -> 21 55 04
	scall PrintTextStandard ; BA020 (2e:6020) -> CD 98 44
.asm_ba023:
	pop bc ; BA023 (2e:6023) -> C1
	ret  ; BA024 (2e:6024) -> C9

Data_ba025:
	warpdef $01, $0a, $02, $01, MAP_00_00, $09, $07, $09, $08, $34
	warpdef $01, $0a, $02, $01, MAP_01_00, $11, $06, $11, $07, $34
	warpdef $01, $0a, $02, $01, MAP_01_00, $19, $06, $19, $07, $34
	warpdef $01, $0a, $02, $01, MAP_06_00, $0e, $12, $0e, $13, $34
	warpdef $01, $0a, $02, $01, MAP_06_00, $1c, $0e, $1c, $0f, $34
	warpdef $01, $0a, $02, $01, MAP_23_00, $0b, $05, $0b, $06, $34
	warpdef $01, $0a, $02, $01, MAP_23_00, $20, $0e, $20, $0f, $34
	warpdef $01, $0a, $02, $01, MAP_24_00, $09, $10, $09, $11, $34
	warpdef $01, $0a, $02, $01, MAP_24_00, $1e, $19, $1e, $1a, $34

Data_ba088:
	db $66, $07, $02, $11, $2b
	db $67, $09, $02, $11, $2d

Data_ba092:
	db $68, $07, $02, $11, $2b
	db $69, $09, $02, $11, $2e

Data_ba09c:
	dw $412
	dw -1

Data_ba0a0:
	dw $199
	dw -1

Data_ba0a4:
	dw $191
	dw -1

Data_ba0a8:
	dw $1dc
	dw -1

Data_ba0ac:
	dw $1d6
	dw -1

Data_ba0b0:
	dw $1fa
	dw -1

Data_ba0b4:
	dw $1f8
	dw -1

Data_ba0b8:
	dw $213
	dw -1

Data_ba0bc:
	dw $20c
	dw -1

Data_ba0c0:
	dw $19b
	dw -1

Data_ba0c4:
	dw $193
	dw -1

Data_ba0c8:
	dw $1db
	dw -1

Data_ba0cc:
	dw $1da
	dw -1

Data_ba0d0:
	dw $1d7
	dw -1

Data_ba0d4:
	dw $1fe
	dw -1

Data_ba0d8:
	dw $1f9
	dw -1

Data_ba0dc:
	dw $214
	dw -1

Data_ba0e0:
	dw $20d
	dw -1

Data_ba0e4:
	dw $32b
	dw -1

Data_ba0e8:
	dw $328
	dw -1

Data_ba0ec:
	dw $329
	dw -1

Data_ba0f0:
	dw $19a
	dw -1

Data_ba0f4:
	dw $192
	dw -1

Data_ba0f8:
	dw $194
	dw -1

Data_ba0fc:
	dw $41d
	dw -1

Data_ba100:
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba09c
	person_event $02, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0fc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba162:
	person_event $03, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0a0
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba1c4:
	person_event $03, $04, $05, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0a4
	person_event $0a, $04, $0a, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0c4
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba226:
	person_event $00, $04, $0b, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0a8
	person_event $07, $04, $05, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c8
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba288:
	person_event $02, $04, $01, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ac
	person_event $05, $04, $09, $05, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0cc
	person_event $06, $04, $0d, $09, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba2f8:
	person_event $0e, $04, $01, $08, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0b0
	person_event $02, $04, $0c, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d4
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba33e:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0b4
	person_event $03, $04, $09, $05, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0d8
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba384:
	person_event $0e, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0b8
	person_event $02, $04, $04, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0dc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba3e6:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0bc
	person_event $03, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba448:
	map MAP_00_00
	db $09, $07

	map MAP_01_00
	db $11, $06

	map MAP_01_00
	db $19, $06

	map MAP_06_00
	db $0e, $12

	map MAP_06_00
	db $1c, $0e

	map MAP_23_00
	db $0b, $05

	map MAP_23_00
	db $20, $0e

	map MAP_24_00
	db $09, $10

	map MAP_24_00
	db $1e, $19

Func_ba46c:: ; ba46c
	ld c, $00 ; BA46C (2e:646c) -> 0E 00
.asm_ba46e:
	ld a, c ; BA46E (2e:646e) -> 79
	cp $09 ; BA46F (2e:646f) -> FE 09
	jp nc, .asm_ba4d6 ; BA471 (2e:6471) -> D2 D6 64
	ld l, c ; BA474 (2e:6474) -> 69
	ld h, $00 ; BA475 (2e:6475) -> 26 00
	add hl, hl ; BA477 (2e:6477) -> 29
	add hl, hl ; BA478 (2e:6478) -> 29
	ld de, Data_ba448 ; BA479 (2e:6479) -> 11 48 64
	add hl, de ; BA47C (2e:647c) -> 19
	ld a, [wBackupMapGroup] ; BA47D (2e:647d) -> FA DF C7
	cp [hl] ; BA480 (2e:6480) -> BE
	jp nz, .asm_ba4d2 ; BA481 (2e:6481) -> C2 D2 64
	ld l, c ; BA484 (2e:6484) -> 69
	ld h, $00 ; BA485 (2e:6485) -> 26 00
	add hl, hl ; BA487 (2e:6487) -> 29
	add hl, hl ; BA488 (2e:6488) -> 29
	ld de, Data_ba448 ; BA489 (2e:6489) -> 11 48 64
	add hl, de ; BA48C (2e:648c) -> 19
	inc hl ; BA48D (2e:648d) -> 23
	ld a, [wBackupMapNumber] ; BA48E (2e:648e) -> FA E0 C7
	cp [hl] ; BA491 (2e:6491) -> BE
	jp nz, .asm_ba4d2 ; BA492 (2e:6492) -> C2 D2 64
	ld l, c ; BA495 (2e:6495) -> 69
	ld h, $00 ; BA496 (2e:6496) -> 26 00
	add hl, hl ; BA498 (2e:6498) -> 29
	add hl, hl ; BA499 (2e:6499) -> 29
	ld de, Data_ba448 ; BA49A (2e:649a) -> 11 48 64
	add hl, de ; BA49D (2e:649d) -> 19
	inc hl ; BA49E (2e:649e) -> 23
	inc hl ; BA49F (2e:649f) -> 23
	ld a, [wBackupMapX] ; BA4A0 (2e:64a0) -> FA DB C7
	cp [hl] ; BA4A3 (2e:64a3) -> BE
	jp nz, .asm_ba4d2 ; BA4A4 (2e:64a4) -> C2 D2 64
	ld l, c ; BA4A7 (2e:64a7) -> 69
	ld h, $00 ; BA4A8 (2e:64a8) -> 26 00
	add hl, hl ; BA4AA (2e:64aa) -> 29
	add hl, hl ; BA4AB (2e:64ab) -> 29
	ld de, Data_ba448 ; BA4AC (2e:64ac) -> 11 48 64
	add hl, de ; BA4AF (2e:64af) -> 19
	inc hl ; BA4B0 (2e:64b0) -> 23
	inc hl ; BA4B1 (2e:64b1) -> 23
	inc hl ; BA4B2 (2e:64b2) -> 23
	ld a, [wBackupMapY] ; BA4B3 (2e:64b3) -> FA DC C7
	cp [hl] ; BA4B6 (2e:64b6) -> BE
	jp nz, .asm_ba4d2 ; BA4B7 (2e:64b7) -> C2 D2 64
	ld l, c ; BA4BA (2e:64ba) -> 69
	ld h, $00 ; BA4BB (2e:64bb) -> 26 00
	ld e, l ; BA4BD (2e:64bd) -> 5D
	ld d, h ; BA4BE (2e:64be) -> 54
	add hl, hl ; BA4BF (2e:64bf) -> 29
	ld c, l ; BA4C0 (2e:64c0) -> 4D
	ld b, h ; BA4C1 (2e:64c1) -> 44
	add hl, hl ; BA4C2 (2e:64c2) -> 29
	add hl, hl ; BA4C3 (2e:64c3) -> 29
	add hl, de ; BA4C4 (2e:64c4) -> 19
	add hl, bc ; BA4C5 (2e:64c5) -> 09
	ld de, Data_ba025 ; BA4C6 (2e:64c6) -> 11 25 60
	add hl, de ; BA4C9 (2e:64c9) -> 19
	ld e, $01 ; BA4CA (2e:64ca) -> 1E 01
	scall LoadWarps ; BA4CC (2e:64cc) -> CD 3A 40
	jp .asm_ba4d6 ; BA4CF (2e:64cf) -> C3 D6 64
.asm_ba4d2:
	inc c ; BA4D2 (2e:64d2) -> 0C
	jp .asm_ba46e ; BA4D3 (2e:64d3) -> C3 6E 64
.asm_ba4d6:
	ld a, [wBackupMapGroup] ; BA4D6 (2e:64d6) -> FA DF C7
	or a ; BA4D9 (2e:64d9) -> B7
	jp nz, .asm_ba4ff ; BA4DA (2e:64da) -> C2 FF 64
	ld a, [wBackupMapNumber] ; BA4DD (2e:64dd) -> FA E0 C7
	or a ; BA4E0 (2e:64e0) -> B7
	jp nz, .asm_ba4ff ; BA4E1 (2e:64e1) -> C2 FF 64
	ld a, [wBackupMapX] ; BA4E4 (2e:64e4) -> FA DB C7
	cp $09 ; BA4E7 (2e:64e7) -> FE 09
	jp nz, .asm_ba4fc ; BA4E9 (2e:64e9) -> C2 FC 64
	ld a, [wBackupMapY] ; BA4EC (2e:64ec) -> FA DC C7
	cp $07 ; BA4EF (2e:64ef) -> FE 07
	jp nz, .asm_ba4fc ; BA4F1 (2e:64f1) -> C2 FC 64
	ld e, $07 ; BA4F4 (2e:64f4) -> 1E 07
	ld hl, Data_ba100 ; BA4F6 (2e:64f6) -> 21 00 61
	scall LoadMapObjects ; BA4F9 (2e:64f9) -> CD FB 40
.asm_ba4fc:
	jp .asm_ba654 ; BA4FC (2e:64fc) -> C3 54 66
.asm_ba4ff:
	ld a, [wBackupMapGroup] ; BA4FF (2e:64ff) -> FA DF C7
	cp $01 ; BA502 (2e:6502) -> FE 01
	jp nz, .asm_ba578 ; BA504 (2e:6504) -> C2 78 65
	ld a, [wBackupMapNumber] ; BA507 (2e:6507) -> FA E0 C7
	or a ; BA50A (2e:650a) -> B7
	jp nz, .asm_ba578 ; BA50B (2e:650b) -> C2 78 65
	ld a, [wBackupMapX] ; BA50E (2e:650e) -> FA DB C7
	cp $11 ; BA511 (2e:6511) -> FE 11
	jp nz, .asm_ba53f ; BA513 (2e:6513) -> C2 3F 65
	ld a, [wBackupMapY] ; BA516 (2e:6516) -> FA DC C7
	cp $06 ; BA519 (2e:6519) -> FE 06
	jp nz, .asm_ba53f ; BA51B (2e:651b) -> C2 3F 65
	ld e, $07 ; BA51E (2e:651e) -> 1E 07
	ld hl, Data_ba162 ; BA520 (2e:6520) -> 21 62 61
	scall LoadMapObjects ; BA523 (2e:6523) -> CD FB 40
	ld a, [wc790] ; BA526 (2e:6526) -> FA 90 C7
	or a ; BA529 (2e:6529) -> B7
	jp z, .asm_ba53c ; BA52A (2e:652a) -> CA 3C 65
	ld a, [wc790] ; BA52D (2e:652d) -> FA 90 C7
	cp $04 ; BA530 (2e:6530) -> FE 04
	jp nz, .asm_ba53c ; BA532 (2e:6532) -> C2 3C 65
	ld de, Data_ba0f0 ; BA535 (2e:6535) -> 11 F0 60
	xor a ; BA538 (2e:6538) -> AF
	scall SetPersonTextPointer ; BA539 (2e:6539) -> CD 50 41
.asm_ba53c:
	jp .asm_ba575 ; BA53C (2e:653c) -> C3 75 65
.asm_ba53f:
	ld a, [wBackupMapX] ; BA53F (2e:653f) -> FA DB C7
	cp $19 ; BA542 (2e:6542) -> FE 19
	jp nz, .asm_ba575 ; BA544 (2e:6544) -> C2 75 65
	ld a, [wBackupMapY] ; BA547 (2e:6547) -> FA DC C7
	cp $06 ; BA54A (2e:654a) -> FE 06
	jp nz, .asm_ba575 ; BA54C (2e:654c) -> C2 75 65
	ld e, $07 ; BA54F (2e:654f) -> 1E 07
	ld hl, Data_ba1c4 ; BA551 (2e:6551) -> 21 C4 61
	scall LoadMapObjects ; BA554 (2e:6554) -> CD FB 40
	ld a, [wc790] ; BA557 (2e:6557) -> FA 90 C7
	or a ; BA55A (2e:655a) -> B7
	jp z, .asm_ba575 ; BA55B (2e:655b) -> CA 75 65
	ld a, [wc790] ; BA55E (2e:655e) -> FA 90 C7
	cp $04 ; BA561 (2e:6561) -> FE 04
	jp nz, .asm_ba575 ; BA563 (2e:6563) -> C2 75 65
	ld de, Data_ba0f4 ; BA566 (2e:6566) -> 11 F4 60
	xor a ; BA569 (2e:6569) -> AF
	scall SetPersonTextPointer ; BA56A (2e:656a) -> CD 50 41
	ld de, Data_ba0f8 ; BA56D (2e:656d) -> 11 F8 60
	ld a, $01 ; BA570 (2e:6570) -> 3E 01
	scall SetPersonTextPointer ; BA572 (2e:6572) -> CD 50 41
.asm_ba575:
	jp .asm_ba654 ; BA575 (2e:6575) -> C3 54 66
.asm_ba578:
	ld a, [wBackupMapGroup] ; BA578 (2e:6578) -> FA DF C7
	cp $06 ; BA57B (2e:657b) -> FE 06
	jp nz, .asm_ba5bd ; BA57D (2e:657d) -> C2 BD 65
	ld a, [wBackupMapNumber] ; BA580 (2e:6580) -> FA E0 C7
	or a ; BA583 (2e:6583) -> B7
	jp nz, .asm_ba5bd ; BA584 (2e:6584) -> C2 BD 65
	ld a, [wBackupMapX] ; BA587 (2e:6587) -> FA DB C7
	cp $0e ; BA58A (2e:658a) -> FE 0E
	jp nz, .asm_ba5a2 ; BA58C (2e:658c) -> C2 A2 65
	ld a, [wBackupMapY] ; BA58F (2e:658f) -> FA DC C7
	cp $12 ; BA592 (2e:6592) -> FE 12
	jp nz, .asm_ba5a2 ; BA594 (2e:6594) -> C2 A2 65
	ld e, $07 ; BA597 (2e:6597) -> 1E 07
	ld hl, Data_ba226 ; BA599 (2e:6599) -> 21 26 62
	scall LoadMapObjects ; BA59C (2e:659c) -> CD FB 40
	jp .asm_ba5ba ; BA59F (2e:659f) -> C3 BA 65
.asm_ba5a2:
	ld a, [wBackupMapX] ; BA5A2 (2e:65a2) -> FA DB C7
	cp $1c ; BA5A5 (2e:65a5) -> FE 1C
	jp nz, .asm_ba5ba ; BA5A7 (2e:65a7) -> C2 BA 65
	ld a, [wBackupMapY] ; BA5AA (2e:65aa) -> FA DC C7
	cp $0e ; BA5AD (2e:65ad) -> FE 0E
	jp nz, .asm_ba5ba ; BA5AF (2e:65af) -> C2 BA 65
	ld e, $08 ; BA5B2 (2e:65b2) -> 1E 08
	ld hl, Data_ba288 ; BA5B4 (2e:65b4) -> 21 88 62
	scall LoadMapObjects ; BA5B7 (2e:65b7) -> CD FB 40
.asm_ba5ba:
	jp .asm_ba654 ; BA5BA (2e:65ba) -> C3 54 66
.asm_ba5bd:
	ld a, [wBackupMapGroup] ; BA5BD (2e:65bd) -> FA DF C7
	cp $17 ; BA5C0 (2e:65c0) -> FE 17
	jp nz, .asm_ba612 ; BA5C2 (2e:65c2) -> C2 12 66
	ld a, [wBackupMapNumber] ; BA5C5 (2e:65c5) -> FA E0 C7
	or a ; BA5C8 (2e:65c8) -> B7
	jp nz, .asm_ba612 ; BA5C9 (2e:65c9) -> C2 12 66
	ld a, [wBackupMapX] ; BA5CC (2e:65cc) -> FA DB C7
	cp $0b ; BA5CF (2e:65cf) -> FE 0B
	jp nz, .asm_ba5ef ; BA5D1 (2e:65d1) -> C2 EF 65
	ld a, [wBackupMapY] ; BA5D4 (2e:65d4) -> FA DC C7
	cp $05 ; BA5D7 (2e:65d7) -> FE 05
	jp nz, .asm_ba5ef ; BA5D9 (2e:65d9) -> C2 EF 65
	ld e, $05 ; BA5DC (2e:65dc) -> 1E 05
	ld hl, Data_ba2f8 ; BA5DE (2e:65de) -> 21 F8 62
	scall LoadMapObjects ; BA5E1 (2e:65e1) -> CD FB 40
	ld e, $02 ; BA5E4 (2e:65e4) -> 1E 02
	ld hl, Data_ba088 ; BA5E6 (2e:65e6) -> 21 88 60
	scall Func_80ce7 ; BA5E9 (2e:65e9) -> CD E7 4C
	jp .asm_ba60f ; BA5EC (2e:65ec) -> C3 0F 66
.asm_ba5ef:
	ld a, [wBackupMapX] ; BA5EF (2e:65ef) -> FA DB C7
	cp $20 ; BA5F2 (2e:65f2) -> FE 20
	jp nz, .asm_ba60f ; BA5F4 (2e:65f4) -> C2 0F 66
	ld a, [wBackupMapY] ; BA5F7 (2e:65f7) -> FA DC C7
	cp $0e ; BA5FA (2e:65fa) -> FE 0E
	jp nz, .asm_ba60f ; BA5FC (2e:65fc) -> C2 0F 66
	ld e, $05 ; BA5FF (2e:65ff) -> 1E 05
	ld hl, Data_ba33e ; BA601 (2e:6601) -> 21 3E 63
	scall LoadMapObjects ; BA604 (2e:6604) -> CD FB 40
	ld e, $02 ; BA607 (2e:6607) -> 1E 02
	ld hl, Data_ba092 ; BA609 (2e:6609) -> 21 92 60
	scall Func_80ce7 ; BA60C (2e:660c) -> CD E7 4C
.asm_ba60f:
	jp .asm_ba654 ; BA60F (2e:660f) -> C3 54 66
.asm_ba612:
	ld a, [wBackupMapGroup] ; BA612 (2e:6612) -> FA DF C7
	cp $18 ; BA615 (2e:6615) -> FE 18
	jp nz, .asm_ba654 ; BA617 (2e:6617) -> C2 54 66
	ld a, [wBackupMapNumber] ; BA61A (2e:661a) -> FA E0 C7
	or a ; BA61D (2e:661d) -> B7
	jp nz, .asm_ba654 ; BA61E (2e:661e) -> C2 54 66
	ld a, [wBackupMapX] ; BA621 (2e:6621) -> FA DB C7
	cp $09 ; BA624 (2e:6624) -> FE 09
	jp nz, .asm_ba63c ; BA626 (2e:6626) -> C2 3C 66
	ld a, [wBackupMapY] ; BA629 (2e:6629) -> FA DC C7
	cp $10 ; BA62C (2e:662c) -> FE 10
	jp nz, .asm_ba63c ; BA62E (2e:662e) -> C2 3C 66
	ld e, $07 ; BA631 (2e:6631) -> 1E 07
	ld hl, Data_ba384 ; BA633 (2e:6633) -> 21 84 63
	scall LoadMapObjects ; BA636 (2e:6636) -> CD FB 40
	jp .asm_ba654 ; BA639 (2e:6639) -> C3 54 66
.asm_ba63c:
	ld a, [wBackupMapX] ; BA63C (2e:663c) -> FA DB C7
	cp $1e ; BA63F (2e:663f) -> FE 1E
	jp nz, .asm_ba654 ; BA641 (2e:6641) -> C2 54 66
	ld a, [wBackupMapY] ; BA644 (2e:6644) -> FA DC C7
	cp $19 ; BA647 (2e:6647) -> FE 19
	jp nz, .asm_ba654 ; BA649 (2e:6649) -> C2 54 66
	ld e, $07 ; BA64C (2e:664c) -> 1E 07
	ld hl, Data_ba3e6 ; BA64E (2e:664e) -> 21 E6 63
	scall LoadMapObjects ; BA651 (2e:6651) -> CD FB 40
.asm_ba654:
	scall Func_8001c ; BA654 (2e:6654) -> CD 1C 40
	ld a, $11 ; BA657 (2e:6657) -> 3E 11
	scall PlayMusic ; BA659 (2e:6659) -> CD E6 4E
	ret  ; BA65C (2e:665c) -> C9

Data_ba65d:
	db $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00, $65
	db $00, $ff, $ff, $66, $00, $ff, $ff, $67, $00, $ff, $ff, $68, $00, $ff, $ff, $6a
	db $00, $ff, $ff, $6c, $00, $ff, $ff, $6d, $00, $ff, $ff, $63, $03, $ff, $ff, $b4
	db $01, $ff, $ff, $46, $03, $ff, $ff, $7a, $03, $ff, $ff, $78, $03, $ff, $ff, $29
	db $03, $ff, $ff, $8e, $03, $ff, $ff, $83, $02, $ff, $ff, $ff, $00, $04, $02, $01
	db $01, $00, $04, $00, $2e, $60, $6a, $00, $00, $ff, $00, $03, $02, $01, $01, $00
	db $04, $00, $2e, $dc, $6b, $00, $00, $ff, $00, $05, $02, $01, $01, $00, $04, $00
	db $2e, $fe, $6e, $00, $00, $00, $0c, $01, $04, $01, $01, $00, $04, $00, $2e, $b0
	db $6d, $00, $00, $00, $0c, $01, $04, $01, $01, $00, $04, $00, $2e, $5a, $6e, $00
	db $00, $00, $0c, $01, $04, $01, $01, $00, $04, $00, $2e, $b6, $6e, $00, $00, $01
	db $0c, $06, $04, $01, $01, $00, $04, $00, $2e, $5f, $48, $6b, $66, $01, $0c, $06
	db $04, $01, $01, $01, $04, $00, $2e, $5f, $48, $6f, $66, $01, $0c, $06, $04, $01
	db $01, $01, $04, $00, $2e, $5f, $48, $73, $66, $01, $0c, $06, $04, $01, $01, $01
	db $04, $00, $2e, $5f, $48, $77, $66, $0b, $0c, $06, $04, $01, $01, $01, $04, $00
	db $2e, $5f, $48, $7b, $66, $04, $0c, $06, $04, $01, $01, $01, $04, $00, $2e, $5f
	db $48, $7f, $66, $05, $0c, $01, $04, $01, $01, $01, $04, $00, $2e, $5f, $48, $83
	db $66, $16, $0c, $06, $02, $01, $01, $02, $04, $00, $2e, $5f, $48, $87, $66, $02
	db $0c, $05, $05, $01, $01, $00, $04, $00, $2e, $5f, $48, $8b, $66, $0a, $0c, $02
	db $05, $01, $01, $00, $04, $00, $2e, $5f, $48, $8f, $66, $09, $0c, $02, $04, $01
	db $01, $00, $04, $00, $2e, $5f, $48, $93, $66, $00, $0c, $01, $04, $01, $01, $02
	db $04, $00, $2e, $5f, $48, $97, $66, $ff, $00, $00, $01, $01, $01, $00, $04, $00
	db $2e, $5f, $48, $9b, $66, $ff, $00, $01, $01, $01, $01, $00, $04, $00, $2e, $5f
	db $48, $9f, $66, $ff, $00, $04, $02, $01, $01, $00, $04, $00, $2e, $5f, $48, $a3
	db $66, $ff, $00, $03, $02, $01, $01, $00, $04, $00, $2e, $5f, $48, $a3, $66, $ff
	db $00, $05, $02, $01, $01, $00, $04, $00, $2e, $fe, $6e, $00, $00

Func_ba7e9:: ; ba7e9
	db $1e, $00, $21, $fb, $00, $cd, $1b, $46, $cd, $b0, $70, $21, $b0, $70, $cd, $11
	db $4f, $1e, $02, $21, $a3, $67, $cd, $fb, $40, $3e, $11, $cd, $e6, $4e, $fa, $90
	db $c7, $b7, $ca, $39, $68, $fa, $90, $c7, $fe, $07, $d2, $39, $68, $1e, $03, $21
	db $bf, $67, $cd, $fb, $40, $3e, $01, $cd, $01, $4d, $1e, $01, $21, $5d, $66, $cd
	db $24, $4d, $cd, $d6, $6f, $3e, $11, $cd, $e6, $4e, $cd, $1c, $40, $c3, $5f, $6a
	db $1e, $03, $21, $a7, $66, $cd, $fb, $40, $fa, $8a, $c7, $fe, $0f, $ca, $4a, $6a
	db $fe, $0e, $ca, $2a, $6a, $fe, $0d, $ca, $0a, $6a, $fe, $0c, $ca, $f0, $69, $fe
	db $0b, $ca, $bd, $69, $fe, $0a, $ca, $9d, $69, $fe, $09, $ca, $7d, $69, $fe, $08
	db $ca, $5d, $69, $fe, $07, $ca, $43, $69, $fe, $06, $ca, $29, $69, $fe, $05, $ca
	db $f6, $68, $fe, $04, $ca, $c4, $68, $fe, $03, $ca, $b2, $68, $fe, $01, $ca, $98
	db $68, $b7, $c2, $5c, $6a, $af, $cd, $53, $46, $cd, $1c, $40, $cd, $5c, $6d, $1e
	db $01, $21, $5d, $67, $cd, $fb, $40, $3e, $04, $ea, $e2, $c7, $af, $cd, $53, $46
	db $cd, $1c, $40, $cd, $5c, $6d, $c3, $5f, $6a, $3e, $04, $ea, $e2, $c7, $af, $cd
	db $53, $46, $cd, $1c, $40, $cd, $5c, $6d, $c3, $5f, $6a, $1e, $01, $21, $fb, $66
	db $cd, $fb, $40, $21, $52, $00, $cd, $2e, $46, $b7, $c2, $de, $68, $1e, $01, $21
	db $d1, $66, $cd, $fb, $40, $3e, $03, $ea, $e2, $c7, $af, $cd, $53, $46, $cd, $1c
	db $40, $21, $cb, $02, $cd, $72, $4f, $cd, $5c, $6d, $c3, $5f, $6a, $1e, $01, $21
	db $09, $67, $cd, $fb, $40, $21, $52, $00, $cd, $2e, $46, $fe, $01, $c2, $11, $69
	db $1e, $01, $21, $df, $66, $cd, $fb, $40, $3e, $03, $ea, $e2, $c7, $af, $cd, $53
	db $46, $cd, $1c, $40, $21, $cc, $02, $cd, $72, $4f, $cd, $5c, $6d, $c3, $5f, $6a
	db $1e, $01, $21, $6b, $67, $cd, $fb, $40, $3e, $01, $ea, $e2, $c7, $af, $cd, $53
	db $46, $cd, $1c, $40, $cd, $5c, $6d, $c3, $5f, $6a, $1e, $01, $21, $79, $67, $cd
	db $fb, $40, $3e, $02, $ea, $e2, $c7, $af, $cd, $53, $46, $cd, $1c, $40, $cd, $5c
	db $6d, $c3, $5f, $6a, $1e, $01, $21, $17, $67, $cd, $fb, $40, $3e, $03, $ea, $e2
	db $c7, $af, $cd, $53, $46, $cd, $1c, $40, $21, $cd, $02, $cd, $72, $4f, $cd, $5c
	db $6d, $c3, $5f, $6a, $1e, $01, $21, $25, $67, $cd, $fb, $40, $3e, $03, $ea, $e2
	db $c7, $af, $cd, $53, $46, $cd, $1c, $40, $21, $ce, $02, $cd, $72, $4f, $cd, $5c
	db $6d, $c3, $5f, $6a, $1e, $01, $21, $33, $67, $cd, $fb, $40, $3e, $03, $ea, $e2
	db $c7, $af, $cd, $53, $46, $cd, $1c, $40, $21, $d2, $02, $cd, $72, $4f, $cd, $5c
	db $6d, $c3, $5f, $6a, $1e, $01, $21, $41, $67, $cd, $fb, $40, $21, $ed, $00, $cd
	db $2e, $46, $fe, $01, $c2, $d8, $69, $1e, $01, $21, $ed, $66, $cd, $fb, $40, $3e
	db $03, $ea, $e2, $c7, $af, $cd, $53, $46, $cd, $1c, $40, $21, $d3, $02, $cd, $72
	db $4f, $cd, $5c, $6d, $c3, $5f, $6a, $1e, $01, $21, $87, $67, $cd, $fb, $40, $3e
	db $0d, $ea, $e2, $c7, $af, $cd, $53, $46, $cd, $1c, $40, $cd, $5c, $6d, $c3, $5f
	db $6a, $1e, $01, $21, $95, $67, $cd, $fb, $40, $3e, $08, $ea, $e2, $c7, $af, $cd
	db $53, $46, $cd, $b0, $70, $cd, $02, $4f, $cd, $1c, $40, $cd, $5c, $6d, $c3, $5f
	db $6a, $1e, $01, $21, $4f, $67, $cd, $fb, $40, $3e, $03, $ea, $e2, $c7, $af, $cd
	db $53, $46, $cd, $1c, $40, $21, $d4, $02, $cd, $72, $4f, $cd, $5c, $6d, $c3, $5f
	db $6a, $3e, $03, $ea, $e2, $c7, $af, $cd, $53, $46, $cd, $1c, $40, $cd, $5c, $6d
	db $c3, $5f, $6a, $cd, $1c, $40, $c9

Func_baa60:
	db $7b, $b7, $c2, $db, $6b, $21, $59, $00, $cd
	db $2e, $46, $fe, $01, $c2, $79, $6a, $21, $83, $02, $cd, $98, $44, $c3, $db, $6b
	db $fa, $38, $c8, $b7, $ca, $83, $6a, $c3, $db, $6b, $af, $cd, $53, $46, $0e, $01
	db $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd
	db $8b, $41, $1e, $00, $21, $fa, $00, $cd, $1b, $46, $fa, $8a, $c7, $fe, $0e, $ca
	db $c9

Func_baaaa:
	db $6b, $fe, $0d, $ca, $b4, $6b, $fe, $0c, $ca, $9f, $6b, $fe, $0b, $ca, $8a
	db $6b, $fe, $0a, $ca, $75, $6b, $fe, $09, $ca, $60, $6b, $fe, $08, $ca, $4b, $6b
	db $fe, $07, $ca, $36, $6b, $fe, $06, $ca, $21, $6b, $fe, $05, $ca, $0c, $6b, $fe
	db $04, $ca, $f7, $6a, $fe, $01, $c2, $db, $6b, $3e, $02, $ea, $8a, $c7, $2e, $0c
	db $e5, $0e, $09, $1e, $14, $3e, $05, $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $05
	db $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1
	db $c3, $db, $6b, $3e, $06, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e
	db $20, $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $07, $ea, $8a, $c7, $2e, $03, $e5
	db $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $05, $ea
	db $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3
	db $db, $6b, $3e, $09, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20
	db $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $0a, $ea, $8a, $c7, $2e, $03, $e5, $0e
	db $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $0b, $ea, $8a
	db $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $db
	db $6b, $3e, $0c, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd
	db $ff, $4d, $c1, $c3, $db, $6b, $3e, $0d, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03
	db $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $db, $6b, $3e, $0b, $ea, $8a, $c7
	db $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $db, $6b
	db $3e, $0f, $ea, $8a, $c7, $2e, $04, $e5, $0e, $0c, $1e, $01, $3e, $04, $cd, $ff
	db $4d, $c1, $c9

Func_babdc:
	db $7b, $b7, $c2, $5b, $6d, $fa, $38, $c8, $b7, $ca, $eb, $6b, $c3
	db $5b, $6d, $21, $59, $00, $cd, $2e, $46, $fe, $01, $c2, $ff, $6b, $21, $83, $02
	db $cd, $98, $44, $c3, $5b, $6d, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $09
	db $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02
	db $cd, $77, $46, $1e, $00, $21, $fa, $00, $cd, $1b, $46, $fa, $8a, $c7, $fe, $0e
	db $ca, $49, $6d, $fe, $0d, $ca, $34, $6d, $fe, $0c, $ca, $1f, $6d, $fe, $0b, $ca
	db $0a, $6d, $fe, $0a, $ca, $f5, $6c, $fe, $09, $ca, $e0, $6c, $fe, $08, $ca, $cb
	db $6c, $fe, $07, $ca, $b6, $6c, $fe, $06, $ca, $a1, $6c, $fe, $05, $ca, $8c, $6c
	db $fe, $04, $ca, $77, $6c, $fe, $01, $c2, $5b, $6d, $af, $cd, $77, $46, $2e, $10
	db $e5, $0e, $09, $1e, $15, $3e, $05, $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $03
	db $ea, $8a, $c7, $2e, $0f, $e5, $0e, $16, $1e, $0c, $3e, $03, $cd, $ff, $4d, $c1
	db $c3, $5b, $6d, $3e, $08, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e
	db $20, $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $05, $ea, $8a, $c7, $2e, $03, $e5
	db $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $06, $ea
	db $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3
	db $5b, $6d, $3e, $05, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20
	db $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $08, $ea, $8a, $c7, $2e, $03, $e5, $0e
	db $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $09, $ea, $8a
	db $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $5b
	db $6d, $3e, $0e, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd
	db $ff, $4d, $c1, $c3, $5b, $6d, $3e, $0b, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03
	db $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $5b, $6d, $3e, $0c, $ea, $8a, $c7
	db $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff, $4d, $c1, $c3, $5b, $6d
	db $3e, $0b, $ea, $8a, $c7, $2e, $03, $e5, $0e, $03, $1e, $03, $3e, $20, $cd, $ff
	db $4d, $c1, $c9

Func_bad5c:
	db $21, $fa, $00, $cd, $2e, $46, $b7, $c2, $9a, $6d, $3e, $11, $cd
	db $e6, $4e, $3e, $02, $cd, $77, $46, $0e, $01, $1e, $02, $3e, $09, $cd, $76, $41
	db $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $3e, $01, $cd, $53, $46, $21, $01, $00
	db $cd, $8f, $46, $cd, $8b, $41, $1e, $01, $21, $fa, $00, $cd, $1b, $46, $c3, $9f
	db $6d, $3e, $01, $cd, $53, $46, $c9

Data_bada0:
	db $02, $03, $04, $03, $04, $02, $ff, $ff

Data_bada6:
	db $01, $03, $04, $03, $04, $02, $ff, $ff

Func_badac:
	db $f5, $7b, $b7, $c2, $4c, $6e, $f8, $01, $7e
	db $cd, $4b, $44, $21, $6e, $00, $cd, $a9, $44, $e5, $e5, $21, $00, $00, $e5, $21
	db $00, $00, $e5, $cd, $7c, $27, $c1, $c1, $21, $00, $00, $e5, $21, $64, $00, $e5
	db $cd, $79, $35, $d2, $e8, $6d, $21, $70, $00, $cd, $a9, $44, $c3, $4c, $6e, $21
	db $6f, $00, $cd, $ca, $44, $b7, $c2, $46, $6e, $21, $1b, $04, $cd, $98, $44, $e5
	db $e5, $21, $ff, $ff, $e5, $21, $9c, $ff, $e5, $cd, $7c, $27, $c1, $c1, $c1, $c1
	db $21, $72, $00, $cd, $a9, $44, $1e, $01, $21, $52, $00, $cd, $1b, $46, $fa, $38
	db $c8, $fe, $02, $c2, $2d, $6e, $01, $a0, $6d, $1e, $2e, $f8, $01, $7e, $cd, $88
	db $46, $c3, $38, $6e, $01, $a8, $6d, $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $cd
	db $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c3, $4c, $6e, $21, $71, $00
	db $cd, $a9, $44, $c1, $c9

Data_bae4e:
	db $02, $03, $03, $02, $ff, $ff

Data_bae54:
	db $01, $03, $03, $02, $ff, $ff

Func_bae5a:
	db $f5, $7b, $b7, $c2, $a8, $6e, $f8, $01, $7e, $cd, $4b, $44, $21, $73, $00
	db $cd, $a9, $44, $1e, $00, $21, $52, $00, $cd, $1b, $46, $1e, $01, $21, $ed, $00
	db $cd, $1b, $46, $fa, $38, $c8, $fe, $02, $c2, $92, $6e, $01, $4e, $6e, $1e, $2e
	db $f8, $01, $7e, $cd, $88, $46, $c3, $9d, $6e, $01, $54, $6e, $1e, $2e, $f8, $01
	db $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c1
	db $c9

Data_baeaa:
	db $02, $03, $03, $02, $ff, $ff

Data_baeb0:
	db $01, $03, $03, $02, $ff, $ff

Func_baeb6:
	db $f5, $7b, $b7
	db $c2, $fc, $6e, $f8, $01, $7e, $cd, $4b, $44, $21, $73, $00, $cd, $a9, $44, $1e
	db $00, $21, $ed, $00, $cd, $1b, $46, $fa, $38, $c8, $fe, $02, $c2, $e6, $6e, $01
	db $aa, $6e, $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $c3, $f1, $6e, $01, $b0, $6e
	db $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e
	db $cd, $3d, $41, $c1, $c9

Func_baefe:
	db $7b, $b7, $c2, $51, $6f, $fa, $90, $c7, $b7, $ca, $1b
	db $6f, $fa, $90, $c7, $fe, $07, $d2, $1b, $6f, $21, $dd, $03, $cd, $98, $44, $c3
	db $51, $6f, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $3b, $6f, $1e, $01, $21, $59
	db $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3
	db $4e, $6f, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21
	db $5c, $03, $cd, $98, $44, $cd, $d6, $6f, $c9

Data_baf52:
	db $01, $08, $02, $01, $03, $00, $1c
	db $10, $1c, $11, $34, $01, $08, $02, $01, $05, $00, $08, $0b, $08, $0c, $34, $01
	db $08, $02, $01, $05, $00, $19, $0b, $19, $0c, $34, $01, $08, $02, $01, $00, $00
	db $1b, $14, $1b, $15, $34, $01, $08, $02, $01, $19, $01, $07, $08, $07, $09, $34
	db $01, $08, $02, $01, $05, $00, $0a, $0e, $0a, $0f, $34, $01, $08, $02, $01, $05
	db $00, $16, $0e, $16, $0f, $34, $01, $08, $02, $01, $05, $00, $0d, $14, $0d, $15
	db $34, $01, $08, $02, $01, $05, $00, $13, $14, $13, $15, $34, $01, $08, $02, $01
	db $01, $00, $07, $11, $07, $12, $34, $01, $08, $02, $01, $14, $00, $15, $11, $15
	db $12, $34, $01, $08, $02, $01, $05, $00, $10, $15, $10, $16, $34, $21, $59, $00
	db $cd, $2e, $46, $b7, $c2, $e6, $6f, $cd, $2b, $40, $c3, $a9, $70, $cd, $2b, $40
	db $fa, $8a, $c7, $fe, $0e, $ca, $a1, $70, $fe, $0d, $ca, $96, $70, $fe, $0c, $ca
	db $8b, $70, $fe, $0b, $ca, $80, $70, $fe, $0a, $ca, $75, $70, $fe, $09, $ca, $6a
	db $70, $fe, $08, $ca, $5f, $70, $fe, $07, $ca, $54, $70, $fe, $06, $ca, $49, $70
	db $fe, $05, $ca, $3e, $70, $fe, $04, $ca, $33, $70, $fe, $01, $c2, $a9, $70, $1e
	db $01, $21, $52, $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $5d, $6f, $cd
	db $3a, $40, $c3, $a9, $70, $1e, $01, $21, $68, $6f, $cd, $3a, $40, $c3, $a9, $70
	db $1e, $01, $21, $73, $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $b5, $6f
	db $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $89, $6f, $cd, $3a, $40, $c3, $a9
	db $70, $1e, $01, $21, $94, $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $9f
	db $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $aa, $6f, $cd, $3a, $40, $c3
	db $a9, $70, $1e, $01, $21, $7e, $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21
	db $c0, $6f, $cd, $3a, $40, $c3, $a9, $70, $1e, $01, $21, $cb, $6f, $cd, $3a, $40
	db $c9, $07, $07, $02, $02, $01, $07, $fa, $90, $c7, $b7, $ca, $d0, $70, $fa, $90
	db $c7, $fe, $07, $c2, $d0, $70, $fa, $8a, $c7, $fe, $0d, $c2, $d0, $70, $21, $aa
	db $70, $cd, $9b, $4d, $cd, $02, $4f, $c9, $00, $07, $01, $02, $00, $00, $08, $08
	db $07, $08, $34, $00, $07, $01, $02, $00, $00, $08, $0f, $07, $0f, $34, $01, $08
	db $02, $01, $06, $00, $0c, $04, $0c, $05, $34, $01, $08, $02, $01, $06, $00, $19
	db $04, $19, $05, $34, $8e, $03, $ff, $ff, $8f, $03, $ff, $ff, $28, $03, $ff, $ff
	db $2a, $03, $ff, $ff, $02, $08, $04, $01, $4b, $31, $08, $04, $31, $08, $04, $00
	db $00, $17, $08, $04, $02, $47, $20, $08, $04, $02, $79, $00, $04, $08, $05, $01
	db $01, $02, $04, $00, $2e, $dd, $46, $12, $71, $ff, $00, $05, $04, $01, $01, $00
	db $04, $00, $2e, $5f, $48, $fd, $70, $ff, $00, $06, $04, $01, $01, $00, $04, $00
	db $2e, $5f, $48, $01, $71, $ff, $00, $02, $04, $01, $01, $00, $04, $00, $2e, $5f
	db $48, $05, $71, $ff, $00, $04, $04, $01, $01, $00, $04, $00, $2e, $5f, $48, $09
	db $71, $00, $00, $08, $08, $00, $00, $08, $0f, $06, $00, $0c, $04, $06, $00, $19
	db $04

Func_bb17a:: ; bb17a
	db $0e, $00, $79, $fe, $04, $d2, $e4, $71, $69, $26, $00, $29, $29, $11, $6a, $71
	db $19, $fa, $df, $c7, $be, $c2, $e0, $71, $69, $26, $00, $29, $29, $11, $6a, $71
	db $19, $23, $fa, $e0, $c7, $be, $c2, $e0, $71, $69, $26, $00, $29, $29, $11, $6a
	db $71, $19, $23, $23, $fa, $db, $c7, $be, $c2, $e0, $71, $69, $26, $00, $29, $29
	db $11, $6a, $71, $19, $23, $23, $23, $fa, $dc, $c7, $be, $c2, $e0, $71, $69, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $d1, $70, $19, $1e, $01
	db $cd, $3a, $40, $c3, $e4, $71, $0c, $c3, $7c, $71, $fa, $df, $c7, $b7, $c2, $39
	db $72, $fa, $e0, $c7, $b7, $c2, $39, $72, $cd, $9e, $72, $21, $9e, $72, $cd, $11
	db $4f, $fa, $db, $c7, $fe, $08, $c2, $16, $72, $fa, $dc, $c7, $fe, $08, $c2, $16
	db $72, $1e, $01, $21, $0d, $71, $cd, $e7, $4c, $c3, $36, $72, $fa, $db, $c7, $fe
	db $08, $c2, $36, $72, $fa, $dc, $c7, $fe, $0f, $c2, $36, $72, $1e, $01, $21, $15
	db $71, $cd, $e7, $4c, $1e, $01, $21, $24, $71, $cd, $fb, $40, $c3, $7b, $72, $fa
	db $df, $c7, $fe, $06, $c2, $7b, $72, $fa, $e0, $c7, $b7, $c2, $7b, $72, $fa, $db
	db $c7, $fe, $0c, $c2, $63, $72, $fa, $dc, $c7, $fe, $04, $c2, $63, $72, $1e, $01
	db $21, $1a, $71, $cd, $e7, $4c, $c3, $7b, $72, $fa, $db, $c7, $fe, $19, $c2, $7b
	db $72, $fa, $dc, $c7, $fe, $04, $c2, $7b, $72, $1e, $01, $21, $1f, $71, $cd, $e7
	db $4c, $1e, $04, $21, $32, $71, $cd, $fb, $40, $3e, $11, $cd, $e6, $4e, $cd, $1c
	db $40, $c9, $02, $08, $01, $01, $00, $07, $02, $08, $01, $01, $00, $08, $03, $08
	db $02, $01, $01, $08, $fa, $db, $c7, $fe, $08, $c2, $c6, $72, $fa, $dc, $c7, $fe
	db $08, $c2, $c6, $72, $21, $8c, $72, $cd, $9b, $4d, $21, $92, $72, $cd, $9b, $4d
	db $21, $98, $72, $cd, $9b, $4d, $cd, $02, $4f, $c3, $eb, $72, $fa, $db, $c7, $fe
	db $08, $c2, $eb, $72, $fa, $dc, $c7, $fe, $0f, $c2, $eb, $72, $21, $8c, $72, $cd
	db $9b, $4d, $21, $92, $72, $cd, $9b, $4d, $21, $98, $72, $cd, $9b, $4d, $cd, $02
	db $4f, $c9, $06, $0b, $02, $01, $01, $00, $0c, $12, $0c, $13, $34, $06, $0b, $02
	db $01, $03, $00, $1a, $0a, $1a, $0b, $34, $06, $0b, $02, $01, $05, $00, $1e, $12
	db $1e, $13, $34, $06, $0b, $02, $01, $06, $00, $1c, $05, $1c, $06, $34, $06, $0b
	db $02, $01, $11, $00, $1d, $04, $1d, $05, $34, $06, $0b, $02, $01, $15, $00, $0a
	db $14, $0a, $15, $34, $06, $0b, $02, $01, $17, $00, $16, $0f, $16, $10, $34, $06
	db $0b, $02, $01, $18, $00, $14, $1a, $14, $1b, $34, $06, $0b, $02, $01, $19, $01
	db $05, $0e, $05, $0f, $34, $06, $0b, $02, $01, $1d, $00, $13, $08, $13, $09, $34
	db $06, $0b, $02, $01, $00, $0a, $09, $01, $09, $02, $34, $06, $0b, $02, $01, $01
	db $00, $23, $14, $23, $15, $34, $8e, $03, $ff, $ff, $8f, $03, $ff, $ff, $28, $03
	db $ff, $ff, $2a, $03, $ff, $ff, $4c, $03, $ff, $ff, $0e, $04, $04, $08, $01, $01
	db $02, $04, $00, $2e, $e8, $74, $00, $00, $ff, $00, $00, $02, $01, $01, $00, $04
	db $00, $2e, $5f, $48, $70, $73, $ff, $00, $01, $01, $01, $01, $00, $04, $00, $2e
	db $5f, $48, $74, $73, $ff, $00, $0c, $07, $01, $01, $00, $04, $00, $2e, $5f, $48
	db $78, $73, $ff, $00, $0d, $07, $01, $01, $00, $04, $00, $2e, $5f, $48, $7c, $73
	db $2b, $04, $08, $06, $01, $01, $03, $04, $00, $2e, $c2, $75, $00, $00, $12, $04
	db $08, $07, $01, $01, $03, $04, $00, $2e, $c2, $75, $00, $00, $11, $04, $09, $08
	db $01, $01, $02, $04, $00, $2e, $c2, $75, $00, $00, $15, $04, $0a, $08, $01, $01
	db $02, $04, $00, $2e, $c2, $75, $00, $00, $14, $04, $0b, $08, $01, $01, $02, $04
	db $00, $2e, $c2, $75, $00, $00, $00, $04, $08, $09, $01, $01, $02, $04, $00, $2e
	db $5f, $48, $80, $73, $01, $00, $0c, $12, $03, $00, $1a, $0a, $05, $00, $1e, $12
	db $06, $00, $1c, $05, $11, $00, $1d, $04, $15, $00, $0a, $14, $17, $00, $16, $0f
	db $18, $00, $14, $1a, $19, $01, $05, $0e, $1d, $00, $13, $08, $00, $0a, $09, $01
	db $01, $00, $23, $14

Func_bb44e:: ; bb44e
	db $0e, $00, $79, $fe, $0c, $d2, $b8, $74, $69, $26, $00, $29, $29, $11, $1e, $74
	db $19, $fa, $df, $c7, $be, $c2, $b4, $74, $69, $26, $00, $29, $29, $11, $1e, $74
	db $19, $23, $fa, $e0, $c7, $be, $c2, $b4, $74, $69, $26, $00, $29, $29, $11, $1e
	db $74, $19, $23, $23, $fa, $db, $c7, $be, $c2, $b4, $74, $69, $26, $00, $29, $29
	db $11, $1e, $74, $19, $23, $23, $23, $fa, $dc, $c7, $be, $c2, $b4, $74, $69, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $ec, $72, $19, $1e, $01
	db $cd, $3a, $40, $c3, $b8, $74, $0c, $c3, $50, $74, $fa, $df, $c7, $b7, $c2, $d7
	db $74, $fa, $e0, $c7, $fe, $0a, $c2, $d7, $74, $1e, $06, $21, $ca, $73, $cd, $fb
	db $40, $3e, $14, $cd, $e6, $4e, $c3, $e4, $74, $1e, $05, $21, $84, $73, $cd, $fb
	db $40, $3e, $0c, $cd, $e6, $4e, $cd, $1c, $40, $c9, $7b, $b7, $c2, $f4, $74, $af
	db $cd, $4b, $44, $cd, $c3, $42, $c9, $00, $00, $00, $02, $00, $c5, $27, $00, $00
	db $52, $01, $29, $01, $05, $05, $05, $05, $0c, $28, $01, $05, $01, $01, $01, $0c
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02
	db $00, $00, $00, $01, $00, $c5, $25, $00, $00, $52, $01, $26, $01, $0a, $03, $00
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $01, $00, $c5, $1f
	db $00, $00, $52, $01, $20, $01, $0a, $03, $00, $00, $59, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $02, $00, $00, $00, $01, $00, $c5, $44, $00, $00, $52, $01, $45, $01, $05
	db $03, $00, $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $01, $00
	db $c5, $01, $00, $00, $52, $01, $02, $01, $0a, $03, $00, $00, $59, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $02, $f5, $7b, $b7, $c2, $fa, $76, $f8, $01, $7e, $cd, $4b, $44
	db $f8, $01, $7e, $fe, $04, $ca, $c3, $76, $fe, $03, $ca, $89, $76, $fe, $02, $ca
	db $4f, $76, $fe, $01, $ca, $15, $76, $b7, $c2, $fa, $76, $21, $e0, $03, $cd, $ca
	db $44, $b7, $c2, $0c, $76, $11, $fc, $76, $21, $f5, $74, $cd, $d3, $4d, $b7, $c2
	db $03, $76, $c3, $fa, $76, $21, $e4, $03, $cd, $a9, $44, $c3, $fa, $76, $21, $e3
	db $03, $cd, $a9, $44, $c3, $fa, $76, $21, $52, $03, $cd, $ca, $44, $b7, $c2, $46
	db $76, $21, $5e, $01, $cd, $98, $44, $11, $00, $77, $21, $1e, $75, $cd, $f4, $43
	db $b7, $c2, $3d, $76, $fa, $c4, $c7, $fe, $01, $c2, $25, $76, $c3, $fa, $76, $21
	db $e2, $03, $cd, $a9, $44, $c3, $fa, $76, $21, $e1, $03, $cd, $a9, $44, $c3, $fa
	db $76, $21, $4f, $03, $cd, $ca, $44, $b7, $c2, $80, $76, $21, $7a, $01, $cd, $98
	db $44, $11, $06, $77, $21, $47, $75, $cd, $ef, $42, $b7, $c2, $77, $76, $fa, $c4
	db $c7, $fe, $01, $c2, $5f, $76, $c3, $fa, $76, $21, $5f, $04, $cd, $a9, $44, $c3
	db $fa, $76, $21, $5e, $04, $cd, $a9, $44, $c3, $fa, $76, $21, $51, $03, $cd, $ca
	db $44, $b7, $c2, $ba, $76, $21, $6b, $01, $cd, $98, $44, $11, $0b, $77, $21, $70
	db $75, $cd, $46, $43, $b7, $c2, $b1, $76, $fa, $c4, $c7, $fe, $01, $c2, $99, $76
	db $c3, $fa, $76, $21, $63, $04, $cd, $a9, $44, $c3, $fa, $76, $21, $62, $04, $cd
	db $a9, $44, $c3, $fa, $76, $21, $50, $03, $cd, $ca, $44, $b7, $c2, $f4, $76, $21
	db $5d, $01, $cd, $98, $44, $11, $12, $77, $21, $99, $75, $cd, $9d, $43, $b7, $c2
	db $eb, $76, $fa, $c4, $c7, $fe, $01, $c2, $d3, $76, $c3, $fa, $76, $21, $61, $04
	db $cd, $a9, $44, $c3, $fa, $76, $21, $60, $04, $cd, $a9, $44, $c1, $c9, $d1, $bb
	db $bc, $00, $c4, $d8, $cd, $df, $d9, $00, $d6, $dd, $b8, $b0, $00, $ca, $de, $b8
	db $de, $b4, $d9, $00, $db, $ce, $de, $28, $cf, $d9, $29, $00

