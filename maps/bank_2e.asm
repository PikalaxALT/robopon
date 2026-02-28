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
	db $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00

Data_ba66b:
	db $65, $00, $ff, $ff

Data_ba66f:
	db $66, $00, $ff, $ff

Data_ba673:
	db $67, $00, $ff, $ff

Data_ba677:
	db $68, $00, $ff, $ff

Data_ba67b:
	db $6a, $00, $ff, $ff

Data_ba67f:
	db $6c, $00, $ff, $ff

Data_ba683:
	db $6d, $00, $ff, $ff

Data_ba687:
	db $63, $03, $ff, $ff

Data_ba68b:
	db $b4, $01, $ff, $ff

Data_ba68f:
	db $46, $03, $ff, $ff

Data_ba693:
	db $7a, $03, $ff, $ff

Data_ba697:
	db $78, $03, $ff, $ff

Data_ba69b:
	db $29, $03, $ff, $ff

Data_ba69f:
	db $8e, $03, $ff, $ff

Data_ba6a3:
	db $83, $02, $ff, $ff

Data_ba6a7:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, Func_baa60, NULL
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, Func_babdc, NULL
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, Func_baefe, NULL

Data_ba6d1:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_badb0, NULL

Data_ba6df:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_bae5a, NULL

Data_ba6ed:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_baeb6, NULL

Data_ba6fb:
	person_event $01, $0c, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba66b

Data_ba709:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba66f

Data_ba717:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba673

Data_ba725:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba677

Data_ba733:
	person_event $0b, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67b

Data_ba741:
	person_event $04, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67f

Data_ba74f:
	person_event $05, $0c, $01, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba683

Data_ba75d:
	person_event $16, $0c, $06, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba687

Data_ba76b:
	person_event $02, $0c, $05, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68b

Data_ba779:
	person_event $0a, $0c, $02, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68f

Data_ba787:
	person_event $09, $0c, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba693

Data_ba795:
	person_event $00, $0c, $01, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba697

Data_ba7a3:
	person_event $ff, $00, $00, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69b
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69f

Data_ba7bf:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, $6efe, NULL

Func_ba7e9:: ; ba7e9
	ld e, $00 ; BA7E9 (2e:67e9) -> 1E 00
	ld hl, $00fb ; BA7EB (2e:67eb) -> 21 FB 00
	scall EventFlagAction ; BA7EE (2e:67ee) -> CD 1B 46
	call Func_bb0b0 ; BA7F1 (2e:67f1) -> CD B0 70
	ld hl, Func_bb0b0 ; BA7F4 (2e:67f4) -> 21 B0 70
	scall Func_80f11 ; BA7F7 (2e:67f7) -> CD 11 4F
	ld e, $02 ; BA7FA (2e:67fa) -> 1E 02
	ld hl, Data_ba7a3 ; BA7FC (2e:67fc) -> 21 A3 67
	scall LoadMapObjects ; BA7FF (2e:67ff) -> CD FB 40
	ld a, $11 ; BA802 (2e:6802) -> 3E 11
	scall PlayMusic ; BA804 (2e:6804) -> CD E6 4E
	ld a, [wc790] ; BA807 (2e:6807) -> FA 90 C7
	or a ; BA80A (2e:680a) -> B7
	jp z, .asm_ba839 ; BA80B (2e:680b) -> CA 39 68
	ld a, [wc790] ; BA80E (2e:680e) -> FA 90 C7
	cp $07 ; BA811 (2e:6811) -> FE 07
	jp nc, .asm_ba839 ; BA813 (2e:6813) -> D2 39 68
	ld e, $03 ; BA816 (2e:6816) -> 1E 03
	ld hl, Data_ba7bf ; BA818 (2e:6818) -> 21 BF 67
	scall LoadMapObjects ; BA81B (2e:681b) -> CD FB 40
	ld a, $01 ; BA81E (2e:681e) -> 3E 01
	scall Func_80d01 ; BA820 (2e:6820) -> CD 01 4D
	ld e, $01 ; BA823 (2e:6823) -> 1E 01
	ld hl, Data_ba65d ; BA825 (2e:6825) -> 21 5D 66
	scall LoadEncounters ; BA828 (2e:6828) -> CD 24 4D
	call Func_bafd6 ; BA82B (2e:682b) -> CD D6 6F
	ld a, $11 ; BA82E (2e:682e) -> 3E 11
	scall PlayMusic ; BA830 (2e:6830) -> CD E6 4E
	scall Func_8001c ; BA833 (2e:6833) -> CD 1C 40
	jp .asm_baa5f ; BA836 (2e:6836) -> C3 5F 6A
.asm_ba839:
	ld e, $03 ; BA839 (2e:6839) -> 1E 03
	ld hl, Data_ba6a7 ; BA83B (2e:683b) -> 21 A7 66
	scall LoadMapObjects ; BA83E (2e:683e) -> CD FB 40
	ld a, [wc78a] ; BA841 (2e:6841) -> FA 8A C7
	cp $0f ; BA844 (2e:6844) -> FE 0F
	jp z, .asm_baa4a ; BA846 (2e:6846) -> CA 4A 6A
	cp $0e ; BA849 (2e:6849) -> FE 0E
	jp z, .asm_baa2a ; BA84B (2e:684b) -> CA 2A 6A
	cp $0d ; BA84E (2e:684e) -> FE 0D
	jp z, .asm_baa0a ; BA850 (2e:6850) -> CA 0A 6A
	cp $0c ; BA853 (2e:6853) -> FE 0C
	jp z, .asm_ba9f0 ; BA855 (2e:6855) -> CA F0 69
	cp $0b ; BA858 (2e:6858) -> FE 0B
	jp z, .asm_ba9bd ; BA85A (2e:685a) -> CA BD 69
	cp $0a ; BA85D (2e:685d) -> FE 0A
	jp z, .asm_ba99d ; BA85F (2e:685f) -> CA 9D 69
	cp $09 ; BA862 (2e:6862) -> FE 09
	jp z, .asm_ba97d ; BA864 (2e:6864) -> CA 7D 69
	cp $08 ; BA867 (2e:6867) -> FE 08
	jp z, .asm_ba95d ; BA869 (2e:6869) -> CA 5D 69
	cp $07 ; BA86C (2e:686c) -> FE 07
	jp z, .asm_ba943 ; BA86E (2e:686e) -> CA 43 69
	cp $06 ; BA871 (2e:6871) -> FE 06
	jp z, .asm_ba929 ; BA873 (2e:6873) -> CA 29 69
	cp $05 ; BA876 (2e:6876) -> FE 05
	jp z, .asm_ba8f6 ; BA878 (2e:6878) -> CA F6 68
	cp $04 ; BA87B (2e:687b) -> FE 04
	jp z, .asm_ba8c4 ; BA87D (2e:687d) -> CA C4 68
	cp $03 ; BA880 (2e:6880) -> FE 03
	jp z, .asm_ba8b2 ; BA882 (2e:6882) -> CA B2 68
	cp $01 ; BA885 (2e:6885) -> FE 01
	jp z, .asm_ba898 ; BA887 (2e:6887) -> CA 98 68
	or a ; BA88A (2e:688a) -> B7
	jp nz, .asm_baa5c ; BA88B (2e:688b) -> C2 5C 6A
	xor a ; BA88E (2e:688e) -> AF
	scall Func_80653 ; BA88F (2e:688f) -> CD 53 46
	scall Func_8001c ; BA892 (2e:6892) -> CD 1C 40
	call Func_bad5c ; BA895 (2e:6895) -> CD 5C 6D
.asm_ba898:
	ld e, $01 ; BA898 (2e:6898) -> 1E 01
	ld hl, Data_ba75d ; BA89A (2e:689a) -> 21 5D 67
	scall LoadMapObjects ; BA89D (2e:689d) -> CD FB 40
	ld a, $04 ; BA8A0 (2e:68a0) -> 3E 04
	ld [wc7e2], a ; BA8A2 (2e:68a2) -> EA E2 C7
	xor a ; BA8A5 (2e:68a5) -> AF
	scall Func_80653 ; BA8A6 (2e:68a6) -> CD 53 46
	scall Func_8001c ; BA8A9 (2e:68a9) -> CD 1C 40
	call Func_bad5c ; BA8AC (2e:68ac) -> CD 5C 6D
	jp .asm_baa5f ; BA8AF (2e:68af) -> C3 5F 6A
.asm_ba8b2:
	ld a, $04 ; BA8B2 (2e:68b2) -> 3E 04
	ld [wc7e2], a ; BA8B4 (2e:68b4) -> EA E2 C7
	xor a ; BA8B7 (2e:68b7) -> AF
	scall Func_80653 ; BA8B8 (2e:68b8) -> CD 53 46
	scall Func_8001c ; BA8BB (2e:68bb) -> CD 1C 40
	call Func_bad5c ; BA8BE (2e:68be) -> CD 5C 6D
	jp .asm_baa5f ; BA8C1 (2e:68c1) -> C3 5F 6A
.asm_ba8c4:
	ld e, $01 ; BA8C4 (2e:68c4) -> 1E 01
	ld hl, Data_ba6fb ; BA8C6 (2e:68c6) -> 21 FB 66
	scall LoadMapObjects ; BA8C9 (2e:68c9) -> CD FB 40
	ld hl, $0052 ; BA8CC (2e:68cc) -> 21 52 00
	scall CheckEventFlag ; BA8CF (2e:68cf) -> CD 2E 46
	or a ; BA8D2 (2e:68d2) -> B7
	jp nz, .asm_ba8de ; BA8D3 (2e:68d3) -> C2 DE 68
	ld e, $01 ; BA8D6 (2e:68d6) -> 1E 01
	ld hl, Data_ba6d1 ; BA8D8 (2e:68d8) -> 21 D1 66
	scall LoadMapObjects ; BA8DB (2e:68db) -> CD FB 40
.asm_ba8de:
	ld a, $03 ; BA8DE (2e:68de) -> 3E 03
	ld [wc7e2], a ; BA8E0 (2e:68e0) -> EA E2 C7
	xor a ; BA8E3 (2e:68e3) -> AF
	scall Func_80653 ; BA8E4 (2e:68e4) -> CD 53 46
	scall Func_8001c ; BA8E7 (2e:68e7) -> CD 1C 40
	ld hl, $02cb ; BA8EA (2e:68ea) -> 21 CB 02
	scall LandmarkSign ; BA8ED (2e:68ed) -> CD 72 4F
	call Func_bad5c ; BA8F0 (2e:68f0) -> CD 5C 6D
	jp .asm_baa5f ; BA8F3 (2e:68f3) -> C3 5F 6A
.asm_ba8f6:
	ld e, $01 ; BA8F6 (2e:68f6) -> 1E 01
	ld hl, Data_ba709 ; BA8F8 (2e:68f8) -> 21 09 67
	scall LoadMapObjects ; BA8FB (2e:68fb) -> CD FB 40
	ld hl, $0052 ; BA8FE (2e:68fe) -> 21 52 00
	scall CheckEventFlag ; BA901 (2e:6901) -> CD 2E 46
	cp $01 ; BA904 (2e:6904) -> FE 01
	jp nz, .asm_ba911 ; BA906 (2e:6906) -> C2 11 69
	ld e, $01 ; BA909 (2e:6909) -> 1E 01
	ld hl, Data_ba6df ; BA90B (2e:690b) -> 21 DF 66
	scall LoadMapObjects ; BA90E (2e:690e) -> CD FB 40
.asm_ba911:
	ld a, $03 ; BA911 (2e:6911) -> 3E 03
	ld [wc7e2], a ; BA913 (2e:6913) -> EA E2 C7
	xor a ; BA916 (2e:6916) -> AF
	scall Func_80653 ; BA917 (2e:6917) -> CD 53 46
	scall Func_8001c ; BA91A (2e:691a) -> CD 1C 40
	ld hl, $02cc ; BA91D (2e:691d) -> 21 CC 02
	scall LandmarkSign ; BA920 (2e:6920) -> CD 72 4F
	call Func_bad5c ; BA923 (2e:6923) -> CD 5C 6D
	jp .asm_baa5f ; BA926 (2e:6926) -> C3 5F 6A
.asm_ba929:
	ld e, $01 ; BA929 (2e:6929) -> 1E 01
	ld hl, Data_ba76b ; BA92B (2e:692b) -> 21 6B 67
	scall LoadMapObjects ; BA92E (2e:692e) -> CD FB 40
	ld a, $01 ; BA931 (2e:6931) -> 3E 01
	ld [wc7e2], a ; BA933 (2e:6933) -> EA E2 C7
	xor a ; BA936 (2e:6936) -> AF
	scall Func_80653 ; BA937 (2e:6937) -> CD 53 46
	scall Func_8001c ; BA93A (2e:693a) -> CD 1C 40
	call Func_bad5c ; BA93D (2e:693d) -> CD 5C 6D
	jp .asm_baa5f ; BA940 (2e:6940) -> C3 5F 6A
.asm_ba943:
	ld e, $01 ; BA943 (2e:6943) -> 1E 01
	ld hl, Data_ba779 ; BA945 (2e:6945) -> 21 79 67
	scall LoadMapObjects ; BA948 (2e:6948) -> CD FB 40
	ld a, $02 ; BA94B (2e:694b) -> 3E 02
	ld [wc7e2], a ; BA94D (2e:694d) -> EA E2 C7
	xor a ; BA950 (2e:6950) -> AF
	scall Func_80653 ; BA951 (2e:6951) -> CD 53 46
	scall Func_8001c ; BA954 (2e:6954) -> CD 1C 40
	call Func_bad5c ; BA957 (2e:6957) -> CD 5C 6D
	jp .asm_baa5f ; BA95A (2e:695a) -> C3 5F 6A
.asm_ba95d:
	ld e, $01 ; BA95D (2e:695d) -> 1E 01
	ld hl, Data_ba717 ; BA95F (2e:695f) -> 21 17 67
	scall LoadMapObjects ; BA962 (2e:6962) -> CD FB 40
	ld a, $03 ; BA965 (2e:6965) -> 3E 03
	ld [wc7e2], a ; BA967 (2e:6967) -> EA E2 C7
	xor a ; BA96A (2e:696a) -> AF
	scall Func_80653 ; BA96B (2e:696b) -> CD 53 46
	scall Func_8001c ; BA96E (2e:696e) -> CD 1C 40
	ld hl, $02cd ; BA971 (2e:6971) -> 21 CD 02
	scall LandmarkSign ; BA974 (2e:6974) -> CD 72 4F
	call Func_bad5c ; BA977 (2e:6977) -> CD 5C 6D
	jp .asm_baa5f ; BA97A (2e:697a) -> C3 5F 6A
.asm_ba97d:
	ld e, $01 ; BA97D (2e:697d) -> 1E 01
	ld hl, Data_ba725 ; BA97F (2e:697f) -> 21 25 67
	scall LoadMapObjects ; BA982 (2e:6982) -> CD FB 40
	ld a, $03 ; BA985 (2e:6985) -> 3E 03
	ld [wc7e2], a ; BA987 (2e:6987) -> EA E2 C7
	xor a ; BA98A (2e:698a) -> AF
	scall Func_80653 ; BA98B (2e:698b) -> CD 53 46
	scall Func_8001c ; BA98E (2e:698e) -> CD 1C 40
	ld hl, $02ce ; BA991 (2e:6991) -> 21 CE 02
	scall LandmarkSign ; BA994 (2e:6994) -> CD 72 4F
	call Func_bad5c ; BA997 (2e:6997) -> CD 5C 6D
	jp .asm_baa5f ; BA99A (2e:699a) -> C3 5F 6A
.asm_ba99d:
	ld e, $01 ; BA99D (2e:699d) -> 1E 01
	ld hl, Data_ba733 ; BA99F (2e:699f) -> 21 33 67
	scall LoadMapObjects ; BA9A2 (2e:69a2) -> CD FB 40
	ld a, $03 ; BA9A5 (2e:69a5) -> 3E 03
	ld [wc7e2], a ; BA9A7 (2e:69a7) -> EA E2 C7
	xor a ; BA9AA (2e:69aa) -> AF
	scall Func_80653 ; BA9AB (2e:69ab) -> CD 53 46
	scall Func_8001c ; BA9AE (2e:69ae) -> CD 1C 40
	ld hl, $02d2 ; BA9B1 (2e:69b1) -> 21 D2 02
	scall LandmarkSign ; BA9B4 (2e:69b4) -> CD 72 4F
	call Func_bad5c ; BA9B7 (2e:69b7) -> CD 5C 6D
	jp .asm_baa5f ; BA9BA (2e:69ba) -> C3 5F 6A
.asm_ba9bd:
	ld e, $01 ; BA9BD (2e:69bd) -> 1E 01
	ld hl, Data_ba741 ; BA9BF (2e:69bf) -> 21 41 67
	scall LoadMapObjects ; BA9C2 (2e:69c2) -> CD FB 40
	ld hl, $00ed ; BA9C5 (2e:69c5) -> 21 ED 00
	scall CheckEventFlag ; BA9C8 (2e:69c8) -> CD 2E 46
	cp $01 ; BA9CB (2e:69cb) -> FE 01
	jp nz, .asm_ba9d8 ; BA9CD (2e:69cd) -> C2 D8 69
	ld e, $01 ; BA9D0 (2e:69d0) -> 1E 01
	ld hl, Data_ba6ed ; BA9D2 (2e:69d2) -> 21 ED 66
	scall LoadMapObjects ; BA9D5 (2e:69d5) -> CD FB 40
.asm_ba9d8:
	ld a, $03 ; BA9D8 (2e:69d8) -> 3E 03
	ld [wc7e2], a ; BA9DA (2e:69da) -> EA E2 C7
	xor a ; BA9DD (2e:69dd) -> AF
	scall Func_80653 ; BA9DE (2e:69de) -> CD 53 46
	scall Func_8001c ; BA9E1 (2e:69e1) -> CD 1C 40
	ld hl, $02d3 ; BA9E4 (2e:69e4) -> 21 D3 02
	scall LandmarkSign ; BA9E7 (2e:69e7) -> CD 72 4F
	call Func_bad5c ; BA9EA (2e:69ea) -> CD 5C 6D
	jp .asm_baa5f ; BA9ED (2e:69ed) -> C3 5F 6A
.asm_ba9f0:
	ld e, $01 ; BA9F0 (2e:69f0) -> 1E 01
	ld hl, Data_ba787 ; BA9F2 (2e:69f2) -> 21 87 67
	scall LoadMapObjects ; BA9F5 (2e:69f5) -> CD FB 40
	ld a, $0d ; BA9F8 (2e:69f8) -> 3E 0D
	ld [wc7e2], a ; BA9FA (2e:69fa) -> EA E2 C7
	xor a ; BA9FD (2e:69fd) -> AF
	scall Func_80653 ; BA9FE (2e:69fe) -> CD 53 46
	scall Func_8001c ; BAA01 (2e:6a01) -> CD 1C 40
	call Func_bad5c ; BAA04 (2e:6a04) -> CD 5C 6D
	jp .asm_baa5f ; BAA07 (2e:6a07) -> C3 5F 6A
.asm_baa0a:
	ld e, $01 ; BAA0A (2e:6a0a) -> 1E 01
	ld hl, Data_ba795 ; BAA0C (2e:6a0c) -> 21 95 67
	scall LoadMapObjects ; BAA0F (2e:6a0f) -> CD FB 40
	ld a, $08 ; BAA12 (2e:6a12) -> 3E 08
	ld [wc7e2], a ; BAA14 (2e:6a14) -> EA E2 C7
	xor a ; BAA17 (2e:6a17) -> AF
	scall Func_80653 ; BAA18 (2e:6a18) -> CD 53 46
	call Func_bb0b0 ; BAA1B (2e:6a1b) -> CD B0 70
	scall Func_80f02 ; BAA1E (2e:6a1e) -> CD 02 4F
	scall Func_8001c ; BAA21 (2e:6a21) -> CD 1C 40
	call Func_bad5c ; BAA24 (2e:6a24) -> CD 5C 6D
	jp .asm_baa5f ; BAA27 (2e:6a27) -> C3 5F 6A
.asm_baa2a:
	ld e, $01 ; BAA2A (2e:6a2a) -> 1E 01
	ld hl, Data_ba74f ; BAA2C (2e:6a2c) -> 21 4F 67
	scall LoadMapObjects ; BAA2F (2e:6a2f) -> CD FB 40
	ld a, $03 ; BAA32 (2e:6a32) -> 3E 03
	ld [wc7e2], a ; BAA34 (2e:6a34) -> EA E2 C7
	xor a ; BAA37 (2e:6a37) -> AF
	scall Func_80653 ; BAA38 (2e:6a38) -> CD 53 46
	scall Func_8001c ; BAA3B (2e:6a3b) -> CD 1C 40
	ld hl, $02d4 ; BAA3E (2e:6a3e) -> 21 D4 02
	scall LandmarkSign ; BAA41 (2e:6a41) -> CD 72 4F
	call Func_bad5c ; BAA44 (2e:6a44) -> CD 5C 6D
	jp .asm_baa5f ; BAA47 (2e:6a47) -> C3 5F 6A
.asm_baa4a:
	ld a, $03 ; BAA4A (2e:6a4a) -> 3E 03
	ld [wc7e2], a ; BAA4C (2e:6a4c) -> EA E2 C7
	xor a ; BAA4F (2e:6a4f) -> AF
	scall Func_80653 ; BAA50 (2e:6a50) -> CD 53 46
	scall Func_8001c ; BAA53 (2e:6a53) -> CD 1C 40
	call Func_bad5c ; BAA56 (2e:6a56) -> CD 5C 6D
	jp .asm_baa5f ; BAA59 (2e:6a59) -> C3 5F 6A
.asm_baa5c:
	scall Func_8001c ; BAA5C (2e:6a5c) -> CD 1C 40
.asm_baa5f:
	ret  ; BAA5F (2e:6a5f) -> C9

Func_baa60:
	ld a, e ; BAA60 (2e:6a60) -> 7B
	or a ; BAA61 (2e:6a61) -> B7
	jp nz, .asm_babdb ; BAA62 (2e:6a62) -> C2 DB 6B
	ld hl, $0059 ; BAA65 (2e:6a65) -> 21 59 00
	scall CheckEventFlag ; BAA68 (2e:6a68) -> CD 2E 46
	cp $01 ; BAA6B (2e:6a6b) -> FE 01
	jp nz, .asm_baa79 ; BAA6D (2e:6a6d) -> C2 79 6A
	ld hl, $0283 ; BAA70 (2e:6a70) -> 21 83 02
	scall PrintTextStandard ; BAA73 (2e:6a73) -> CD 98 44
	jp .asm_babdb ; BAA76 (2e:6a76) -> C3 DB 6B
.asm_baa79:
	ld a, [wPlayerFacing] ; BAA79 (2e:6a79) -> FA 38 C8
	or a ; BAA7C (2e:6a7c) -> B7
	jp z, .asm_baa83 ; BAA7D (2e:6a7d) -> CA 83 6A
	jp .asm_babdb ; BAA80 (2e:6a80) -> C3 DB 6B
.asm_baa83:
	xor a ; BAA83 (2e:6a83) -> AF
	scall Func_80653 ; BAA84 (2e:6a84) -> CD 53 46
	ld c, $01 ; BAA87 (2e:6a87) -> 0E 01
	ld e, $01 ; BAA89 (2e:6a89) -> 1E 01
	ld a, $09 ; BAA8B (2e:6a8b) -> 3E 09
	scall LoadEmote ; BAA8D (2e:6a8d) -> CD 76 41
	ld a, $5a ; BAA90 (2e:6a90) -> 3E 5A
	scall PlaySFX ; BAA92 (2e:6a92) -> CD FE 4E
	scall WaitEmote ; BAA95 (2e:6a95) -> CD D5 41
	scall HideEmote ; BAA98 (2e:6a98) -> CD 8B 41
	ld e, $00 ; BAA9B (2e:6a9b) -> 1E 00
	ld hl, $00fa ; BAA9D (2e:6a9d) -> 21 FA 00
	scall EventFlagAction ; BAAA0 (2e:6aa0) -> CD 1B 46
	ld a, [wc78a] ; BAAA3 (2e:6aa3) -> FA 8A C7
	cp $0e ; BAAA6 (2e:6aa6) -> FE 0E
	jp z, .asm_babc9 ; BAAA8 (2e:6aa8) -> CA C9 6B
	cp $0d ; BAAAB (2e:6aab) -> FE 0D
	jp z, .asm_babb4 ; BAAAD (2e:6aad) -> CA B4 6B
	cp $0c ; BAAB0 (2e:6ab0) -> FE 0C
	jp z, .asm_bab9f ; BAAB2 (2e:6ab2) -> CA 9F 6B
	cp $0b ; BAAB5 (2e:6ab5) -> FE 0B
	jp z, .asm_bab8a ; BAAB7 (2e:6ab7) -> CA 8A 6B
	cp $0a ; BAABA (2e:6aba) -> FE 0A
	jp z, .asm_bab75 ; BAABC (2e:6abc) -> CA 75 6B
	cp $09 ; BAABF (2e:6abf) -> FE 09
	jp z, .asm_bab60 ; BAAC1 (2e:6ac1) -> CA 60 6B
	cp $08 ; BAAC4 (2e:6ac4) -> FE 08
	jp z, .asm_bab4b ; BAAC6 (2e:6ac6) -> CA 4B 6B
	cp $07 ; BAAC9 (2e:6ac9) -> FE 07
	jp z, .asm_bab36 ; BAACB (2e:6acb) -> CA 36 6B
	cp $06 ; BAACE (2e:6ace) -> FE 06
	jp z, .asm_bab21 ; BAAD0 (2e:6ad0) -> CA 21 6B
	cp $05 ; BAAD3 (2e:6ad3) -> FE 05
	jp z, .asm_bab0c ; BAAD5 (2e:6ad5) -> CA 0C 6B
	cp $04 ; BAAD8 (2e:6ad8) -> FE 04
	jp z, .asm_baaf7 ; BAADA (2e:6ada) -> CA F7 6A
	cp $01 ; BAADD (2e:6add) -> FE 01
	jp nz, .asm_babdb ; BAADF (2e:6adf) -> C2 DB 6B
	ld a, $02 ; BAAE2 (2e:6ae2) -> 3E 02
	ld [wc78a], a ; BAAE4 (2e:6ae4) -> EA 8A C7
	ld l, $0c ; BAAE7 (2e:6ae7) -> 2E 0C
	push hl ; BAAE9 (2e:6ae9) -> E5
	ld c, $09 ; BAAEA (2e:6aea) -> 0E 09
	ld e, $14 ; BAAEC (2e:6aec) -> 1E 14
	ld a, $05 ; BAAEE (2e:6aee) -> 3E 05
	scall Func_80dff ; BAAF0 (2e:6af0) -> CD FF 4D
	pop bc ; BAAF3 (2e:6af3) -> C1
	jp .asm_babdb ; BAAF4 (2e:6af4) -> C3 DB 6B
.asm_baaf7:
	ld a, $05 ; BAAF7 (2e:6af7) -> 3E 05
	ld [wc78a], a ; BAAF9 (2e:6af9) -> EA 8A C7
	ld l, $03 ; BAAFC (2e:6afc) -> 2E 03
	push hl ; BAAFE (2e:6afe) -> E5
	ld c, $03 ; BAAFF (2e:6aff) -> 0E 03
	ld e, $03 ; BAB01 (2e:6b01) -> 1E 03
	ld a, $20 ; BAB03 (2e:6b03) -> 3E 20
	scall Func_80dff ; BAB05 (2e:6b05) -> CD FF 4D
	pop bc ; BAB08 (2e:6b08) -> C1
	jp .asm_babdb ; BAB09 (2e:6b09) -> C3 DB 6B
.asm_bab0c:
	ld a, $06 ; BAB0C (2e:6b0c) -> 3E 06
	ld [wc78a], a ; BAB0E (2e:6b0e) -> EA 8A C7
	ld l, $03 ; BAB11 (2e:6b11) -> 2E 03
	push hl ; BAB13 (2e:6b13) -> E5
	ld c, $03 ; BAB14 (2e:6b14) -> 0E 03
	ld e, $03 ; BAB16 (2e:6b16) -> 1E 03
	ld a, $20 ; BAB18 (2e:6b18) -> 3E 20
	scall Func_80dff ; BAB1A (2e:6b1a) -> CD FF 4D
	pop bc ; BAB1D (2e:6b1d) -> C1
	jp .asm_babdb ; BAB1E (2e:6b1e) -> C3 DB 6B
.asm_bab21:
	ld a, $07 ; BAB21 (2e:6b21) -> 3E 07
	ld [wc78a], a ; BAB23 (2e:6b23) -> EA 8A C7
	ld l, $03 ; BAB26 (2e:6b26) -> 2E 03
	push hl ; BAB28 (2e:6b28) -> E5
	ld c, $03 ; BAB29 (2e:6b29) -> 0E 03
	ld e, $03 ; BAB2B (2e:6b2b) -> 1E 03
	ld a, $20 ; BAB2D (2e:6b2d) -> 3E 20
	scall Func_80dff ; BAB2F (2e:6b2f) -> CD FF 4D
	pop bc ; BAB32 (2e:6b32) -> C1
	jp .asm_babdb ; BAB33 (2e:6b33) -> C3 DB 6B
.asm_bab36:
	ld a, $05 ; BAB36 (2e:6b36) -> 3E 05
	ld [wc78a], a ; BAB38 (2e:6b38) -> EA 8A C7
	ld l, $03 ; BAB3B (2e:6b3b) -> 2E 03
	push hl ; BAB3D (2e:6b3d) -> E5
	ld c, $03 ; BAB3E (2e:6b3e) -> 0E 03
	ld e, $03 ; BAB40 (2e:6b40) -> 1E 03
	ld a, $20 ; BAB42 (2e:6b42) -> 3E 20
	scall Func_80dff ; BAB44 (2e:6b44) -> CD FF 4D
	pop bc ; BAB47 (2e:6b47) -> C1
	jp .asm_babdb ; BAB48 (2e:6b48) -> C3 DB 6B
.asm_bab4b:
	ld a, $09 ; BAB4B (2e:6b4b) -> 3E 09
	ld [wc78a], a ; BAB4D (2e:6b4d) -> EA 8A C7
	ld l, $03 ; BAB50 (2e:6b50) -> 2E 03
	push hl ; BAB52 (2e:6b52) -> E5
	ld c, $03 ; BAB53 (2e:6b53) -> 0E 03
	ld e, $03 ; BAB55 (2e:6b55) -> 1E 03
	ld a, $20 ; BAB57 (2e:6b57) -> 3E 20
	scall Func_80dff ; BAB59 (2e:6b59) -> CD FF 4D
	pop bc ; BAB5C (2e:6b5c) -> C1
	jp .asm_babdb ; BAB5D (2e:6b5d) -> C3 DB 6B
.asm_bab60:
	ld a, $0a ; BAB60 (2e:6b60) -> 3E 0A
	ld [wc78a], a ; BAB62 (2e:6b62) -> EA 8A C7
	ld l, $03 ; BAB65 (2e:6b65) -> 2E 03
	push hl ; BAB67 (2e:6b67) -> E5
	ld c, $03 ; BAB68 (2e:6b68) -> 0E 03
	ld e, $03 ; BAB6A (2e:6b6a) -> 1E 03
	ld a, $20 ; BAB6C (2e:6b6c) -> 3E 20
	scall Func_80dff ; BAB6E (2e:6b6e) -> CD FF 4D
	pop bc ; BAB71 (2e:6b71) -> C1
	jp .asm_babdb ; BAB72 (2e:6b72) -> C3 DB 6B
.asm_bab75:
	ld a, $0b ; BAB75 (2e:6b75) -> 3E 0B
	ld [wc78a], a ; BAB77 (2e:6b77) -> EA 8A C7
	ld l, $03 ; BAB7A (2e:6b7a) -> 2E 03
	push hl ; BAB7C (2e:6b7c) -> E5
	ld c, $03 ; BAB7D (2e:6b7d) -> 0E 03
	ld e, $03 ; BAB7F (2e:6b7f) -> 1E 03
	ld a, $20 ; BAB81 (2e:6b81) -> 3E 20
	scall Func_80dff ; BAB83 (2e:6b83) -> CD FF 4D
	pop bc ; BAB86 (2e:6b86) -> C1
	jp .asm_babdb ; BAB87 (2e:6b87) -> C3 DB 6B
.asm_bab8a:
	ld a, $0c ; BAB8A (2e:6b8a) -> 3E 0C
	ld [wc78a], a ; BAB8C (2e:6b8c) -> EA 8A C7
	ld l, $03 ; BAB8F (2e:6b8f) -> 2E 03
	push hl ; BAB91 (2e:6b91) -> E5
	ld c, $03 ; BAB92 (2e:6b92) -> 0E 03
	ld e, $03 ; BAB94 (2e:6b94) -> 1E 03
	ld a, $20 ; BAB96 (2e:6b96) -> 3E 20
	scall Func_80dff ; BAB98 (2e:6b98) -> CD FF 4D
	pop bc ; BAB9B (2e:6b9b) -> C1
	jp .asm_babdb ; BAB9C (2e:6b9c) -> C3 DB 6B
.asm_bab9f:
	ld a, $0d ; BAB9F (2e:6b9f) -> 3E 0D
	ld [wc78a], a ; BABA1 (2e:6ba1) -> EA 8A C7
	ld l, $03 ; BABA4 (2e:6ba4) -> 2E 03
	push hl ; BABA6 (2e:6ba6) -> E5
	ld c, $03 ; BABA7 (2e:6ba7) -> 0E 03
	ld e, $03 ; BABA9 (2e:6ba9) -> 1E 03
	ld a, $20 ; BABAB (2e:6bab) -> 3E 20
	scall Func_80dff ; BABAD (2e:6bad) -> CD FF 4D
	pop bc ; BABB0 (2e:6bb0) -> C1
	jp .asm_babdb ; BABB1 (2e:6bb1) -> C3 DB 6B
.asm_babb4:
	ld a, $0b ; BABB4 (2e:6bb4) -> 3E 0B
	ld [wc78a], a ; BABB6 (2e:6bb6) -> EA 8A C7
	ld l, $03 ; BABB9 (2e:6bb9) -> 2E 03
	push hl ; BABBB (2e:6bbb) -> E5
	ld c, $03 ; BABBC (2e:6bbc) -> 0E 03
	ld e, $03 ; BABBE (2e:6bbe) -> 1E 03
	ld a, $20 ; BABC0 (2e:6bc0) -> 3E 20
	scall Func_80dff ; BABC2 (2e:6bc2) -> CD FF 4D
	pop bc ; BABC5 (2e:6bc5) -> C1
	jp .asm_babdb ; BABC6 (2e:6bc6) -> C3 DB 6B
.asm_babc9:
	ld a, $0f ; BABC9 (2e:6bc9) -> 3E 0F
	ld [wc78a], a ; BABCB (2e:6bcb) -> EA 8A C7
	ld l, $04 ; BABCE (2e:6bce) -> 2E 04
	push hl ; BABD0 (2e:6bd0) -> E5
	ld c, $0c ; BABD1 (2e:6bd1) -> 0E 0C
	ld e, $01 ; BABD3 (2e:6bd3) -> 1E 01
	ld a, $04 ; BABD5 (2e:6bd5) -> 3E 04
	scall Func_80dff ; BABD7 (2e:6bd7) -> CD FF 4D
	pop bc ; BABDA (2e:6bda) -> C1
.asm_babdb:
	ret  ; BABDB (2e:6bdb) -> C9

Func_babdc:
	ld a, e ; BABDC (2e:6bdc) -> 7B
	or a ; BABDD (2e:6bdd) -> B7
	jp nz, .asm_bad5b ; BABDE (2e:6bde) -> C2 5B 6D
	ld a, [wPlayerFacing] ; BABE1 (2e:6be1) -> FA 38 C8
	or a ; BABE4 (2e:6be4) -> B7
	jp z, .asm_babeb ; BABE5 (2e:6be5) -> CA EB 6B
	jp .asm_bad5b ; BABE8 (2e:6be8) -> C3 5B 6D
.asm_babeb:
	ld hl, $0059 ; BABEB (2e:6beb) -> 21 59 00
	scall CheckEventFlag ; BABEE (2e:6bee) -> CD 2E 46
	cp $01 ; BABF1 (2e:6bf1) -> FE 01
	jp nz, .asm_babff ; BABF3 (2e:6bf3) -> C2 FF 6B
	ld hl, $0283 ; BABF6 (2e:6bf6) -> 21 83 02
	scall PrintTextStandard ; BABF9 (2e:6bf9) -> CD 98 44
	jp .asm_bad5b ; BABFC (2e:6bfc) -> C3 5B 6D
.asm_babff:
	xor a ; BABFF (2e:6bff) -> AF
	scall Func_80653 ; BAC00 (2e:6c00) -> CD 53 46
	ld c, $01 ; BAC03 (2e:6c03) -> 0E 01
	ld e, $01 ; BAC05 (2e:6c05) -> 1E 01
	ld a, $09 ; BAC07 (2e:6c07) -> 3E 09
	scall LoadEmote ; BAC09 (2e:6c09) -> CD 76 41
	ld a, $5a ; BAC0C (2e:6c0c) -> 3E 5A
	scall PlaySFX ; BAC0E (2e:6c0e) -> CD FE 4E
	scall WaitEmote ; BAC11 (2e:6c11) -> CD D5 41
	scall HideEmote ; BAC14 (2e:6c14) -> CD 8B 41
	ld a, $02 ; BAC17 (2e:6c17) -> 3E 02
	scall PlayerFace ; BAC19 (2e:6c19) -> CD 77 46
	ld e, $00 ; BAC1C (2e:6c1c) -> 1E 00
	ld hl, $00fa ; BAC1E (2e:6c1e) -> 21 FA 00
	scall EventFlagAction ; BAC21 (2e:6c21) -> CD 1B 46
	ld a, [wc78a] ; BAC24 (2e:6c24) -> FA 8A C7
	cp $0e ; BAC27 (2e:6c27) -> FE 0E
	jp z, .asm_bad49 ; BAC29 (2e:6c29) -> CA 49 6D
	cp $0d ; BAC2C (2e:6c2c) -> FE 0D
	jp z, .asm_bad34 ; BAC2E (2e:6c2e) -> CA 34 6D
	cp $0c ; BAC31 (2e:6c31) -> FE 0C
	jp z, .asm_bad1f ; BAC33 (2e:6c33) -> CA 1F 6D
	cp $0b ; BAC36 (2e:6c36) -> FE 0B
	jp z, .asm_bad0a ; BAC38 (2e:6c38) -> CA 0A 6D
	cp $0a ; BAC3B (2e:6c3b) -> FE 0A
	jp z, .asm_bacf5 ; BAC3D (2e:6c3d) -> CA F5 6C
	cp $09 ; BAC40 (2e:6c40) -> FE 09
	jp z, .asm_bace0 ; BAC42 (2e:6c42) -> CA E0 6C
	cp $08 ; BAC45 (2e:6c45) -> FE 08
	jp z, .asm_baccb ; BAC47 (2e:6c47) -> CA CB 6C
	cp $07 ; BAC4A (2e:6c4a) -> FE 07
	jp z, .asm_bacb6 ; BAC4C (2e:6c4c) -> CA B6 6C
	cp $06 ; BAC4F (2e:6c4f) -> FE 06
	jp z, .asm_baca1 ; BAC51 (2e:6c51) -> CA A1 6C
	cp $05 ; BAC54 (2e:6c54) -> FE 05
	jp z, .asm_bac8c ; BAC56 (2e:6c56) -> CA 8C 6C
	cp $04 ; BAC59 (2e:6c59) -> FE 04
	jp z, .asm_bac77 ; BAC5B (2e:6c5b) -> CA 77 6C
	cp $01 ; BAC5E (2e:6c5e) -> FE 01
	jp nz, .asm_bad5b ; BAC60 (2e:6c60) -> C2 5B 6D
	xor a ; BAC63 (2e:6c63) -> AF
	scall PlayerFace ; BAC64 (2e:6c64) -> CD 77 46
	ld l, $10 ; BAC67 (2e:6c67) -> 2E 10
	push hl ; BAC69 (2e:6c69) -> E5
	ld c, $09 ; BAC6A (2e:6c6a) -> 0E 09
	ld e, $15 ; BAC6C (2e:6c6c) -> 1E 15
	ld a, $05 ; BAC6E (2e:6c6e) -> 3E 05
	scall Func_80dff ; BAC70 (2e:6c70) -> CD FF 4D
	pop bc ; BAC73 (2e:6c73) -> C1
	jp .asm_bad5b ; BAC74 (2e:6c74) -> C3 5B 6D
.asm_bac77:
	ld a, $03 ; BAC77 (2e:6c77) -> 3E 03
	ld [wc78a], a ; BAC79 (2e:6c79) -> EA 8A C7
	ld l, $0f ; BAC7C (2e:6c7c) -> 2E 0F
	push hl ; BAC7E (2e:6c7e) -> E5
	ld c, $16 ; BAC7F (2e:6c7f) -> 0E 16
	ld e, $0c ; BAC81 (2e:6c81) -> 1E 0C
	ld a, $03 ; BAC83 (2e:6c83) -> 3E 03
	scall Func_80dff ; BAC85 (2e:6c85) -> CD FF 4D
	pop bc ; BAC88 (2e:6c88) -> C1
	jp .asm_bad5b ; BAC89 (2e:6c89) -> C3 5B 6D
.asm_bac8c:
	ld a, $08 ; BAC8C (2e:6c8c) -> 3E 08
	ld [wc78a], a ; BAC8E (2e:6c8e) -> EA 8A C7
	ld l, $03 ; BAC91 (2e:6c91) -> 2E 03
	push hl ; BAC93 (2e:6c93) -> E5
	ld c, $03 ; BAC94 (2e:6c94) -> 0E 03
	ld e, $03 ; BAC96 (2e:6c96) -> 1E 03
	ld a, $20 ; BAC98 (2e:6c98) -> 3E 20
	scall Func_80dff ; BAC9A (2e:6c9a) -> CD FF 4D
	pop bc ; BAC9D (2e:6c9d) -> C1
	jp .asm_bad5b ; BAC9E (2e:6c9e) -> C3 5B 6D
.asm_baca1:
	ld a, $05 ; BACA1 (2e:6ca1) -> 3E 05
	ld [wc78a], a ; BACA3 (2e:6ca3) -> EA 8A C7
	ld l, $03 ; BACA6 (2e:6ca6) -> 2E 03
	push hl ; BACA8 (2e:6ca8) -> E5
	ld c, $03 ; BACA9 (2e:6ca9) -> 0E 03
	ld e, $03 ; BACAB (2e:6cab) -> 1E 03
	ld a, $20 ; BACAD (2e:6cad) -> 3E 20
	scall Func_80dff ; BACAF (2e:6caf) -> CD FF 4D
	pop bc ; BACB2 (2e:6cb2) -> C1
	jp .asm_bad5b ; BACB3 (2e:6cb3) -> C3 5B 6D
.asm_bacb6:
	ld a, $06 ; BACB6 (2e:6cb6) -> 3E 06
	ld [wc78a], a ; BACB8 (2e:6cb8) -> EA 8A C7
	ld l, $03 ; BACBB (2e:6cbb) -> 2E 03
	push hl ; BACBD (2e:6cbd) -> E5
	ld c, $03 ; BACBE (2e:6cbe) -> 0E 03
	ld e, $03 ; BACC0 (2e:6cc0) -> 1E 03
	ld a, $20 ; BACC2 (2e:6cc2) -> 3E 20
	scall Func_80dff ; BACC4 (2e:6cc4) -> CD FF 4D
	pop bc ; BACC7 (2e:6cc7) -> C1
	jp .asm_bad5b ; BACC8 (2e:6cc8) -> C3 5B 6D
.asm_baccb:
	ld a, $05 ; BACCB (2e:6ccb) -> 3E 05
	ld [wc78a], a ; BACCD (2e:6ccd) -> EA 8A C7
	ld l, $03 ; BACD0 (2e:6cd0) -> 2E 03
	push hl ; BACD2 (2e:6cd2) -> E5
	ld c, $03 ; BACD3 (2e:6cd3) -> 0E 03
	ld e, $03 ; BACD5 (2e:6cd5) -> 1E 03
	ld a, $20 ; BACD7 (2e:6cd7) -> 3E 20
	scall Func_80dff ; BACD9 (2e:6cd9) -> CD FF 4D
	pop bc ; BACDC (2e:6cdc) -> C1
	jp .asm_bad5b ; BACDD (2e:6cdd) -> C3 5B 6D
.asm_bace0:
	ld a, $08 ; BACE0 (2e:6ce0) -> 3E 08
	ld [wc78a], a ; BACE2 (2e:6ce2) -> EA 8A C7
	ld l, $03 ; BACE5 (2e:6ce5) -> 2E 03
	push hl ; BACE7 (2e:6ce7) -> E5
	ld c, $03 ; BACE8 (2e:6ce8) -> 0E 03
	ld e, $03 ; BACEA (2e:6cea) -> 1E 03
	ld a, $20 ; BACEC (2e:6cec) -> 3E 20
	scall Func_80dff ; BACEE (2e:6cee) -> CD FF 4D
	pop bc ; BACF1 (2e:6cf1) -> C1
	jp .asm_bad5b ; BACF2 (2e:6cf2) -> C3 5B 6D
.asm_bacf5:
	ld a, $09 ; BACF5 (2e:6cf5) -> 3E 09
	ld [wc78a], a ; BACF7 (2e:6cf7) -> EA 8A C7
	ld l, $03 ; BACFA (2e:6cfa) -> 2E 03
	push hl ; BACFC (2e:6cfc) -> E5
	ld c, $03 ; BACFD (2e:6cfd) -> 0E 03
	ld e, $03 ; BACFF (2e:6cff) -> 1E 03
	ld a, $20 ; BAD01 (2e:6d01) -> 3E 20
	scall Func_80dff ; BAD03 (2e:6d03) -> CD FF 4D
	pop bc ; BAD06 (2e:6d06) -> C1
	jp .asm_bad5b ; BAD07 (2e:6d07) -> C3 5B 6D
.asm_bad0a:
	ld a, $0e ; BAD0A (2e:6d0a) -> 3E 0E
	ld [wc78a], a ; BAD0C (2e:6d0c) -> EA 8A C7
	ld l, $03 ; BAD0F (2e:6d0f) -> 2E 03
	push hl ; BAD11 (2e:6d11) -> E5
	ld c, $03 ; BAD12 (2e:6d12) -> 0E 03
	ld e, $03 ; BAD14 (2e:6d14) -> 1E 03
	ld a, $20 ; BAD16 (2e:6d16) -> 3E 20
	scall Func_80dff ; BAD18 (2e:6d18) -> CD FF 4D
	pop bc ; BAD1B (2e:6d1b) -> C1
	jp .asm_bad5b ; BAD1C (2e:6d1c) -> C3 5B 6D
.asm_bad1f:
	ld a, $0b ; BAD1F (2e:6d1f) -> 3E 0B
	ld [wc78a], a ; BAD21 (2e:6d21) -> EA 8A C7
	ld l, $03 ; BAD24 (2e:6d24) -> 2E 03
	push hl ; BAD26 (2e:6d26) -> E5
	ld c, $03 ; BAD27 (2e:6d27) -> 0E 03
	ld e, $03 ; BAD29 (2e:6d29) -> 1E 03
	ld a, $20 ; BAD2B (2e:6d2b) -> 3E 20
	scall Func_80dff ; BAD2D (2e:6d2d) -> CD FF 4D
	pop bc ; BAD30 (2e:6d30) -> C1
	jp .asm_bad5b ; BAD31 (2e:6d31) -> C3 5B 6D
.asm_bad34:
	ld a, $0c ; BAD34 (2e:6d34) -> 3E 0C
	ld [wc78a], a ; BAD36 (2e:6d36) -> EA 8A C7
	ld l, $03 ; BAD39 (2e:6d39) -> 2E 03
	push hl ; BAD3B (2e:6d3b) -> E5
	ld c, $03 ; BAD3C (2e:6d3c) -> 0E 03
	ld e, $03 ; BAD3E (2e:6d3e) -> 1E 03
	ld a, $20 ; BAD40 (2e:6d40) -> 3E 20
	scall Func_80dff ; BAD42 (2e:6d42) -> CD FF 4D
	pop bc ; BAD45 (2e:6d45) -> C1
	jp .asm_bad5b ; BAD46 (2e:6d46) -> C3 5B 6D
.asm_bad49:
	ld a, $0b ; BAD49 (2e:6d49) -> 3E 0B
	ld [wc78a], a ; BAD4B (2e:6d4b) -> EA 8A C7
	ld l, $03 ; BAD4E (2e:6d4e) -> 2E 03
	push hl ; BAD50 (2e:6d50) -> E5
	ld c, $03 ; BAD51 (2e:6d51) -> 0E 03
	ld e, $03 ; BAD53 (2e:6d53) -> 1E 03
	ld a, $20 ; BAD55 (2e:6d55) -> 3E 20
	scall Func_80dff ; BAD57 (2e:6d57) -> CD FF 4D
	pop bc ; BAD5A (2e:6d5a) -> C1
.asm_bad5b:
	ret  ; BAD5B (2e:6d5b) -> C9

Func_bad5c:
	ld hl, $00fa ; BAD5C (2e:6d5c) -> 21 FA 00
	scall CheckEventFlag ; BAD5F (2e:6d5f) -> CD 2E 46
	or a ; BAD62 (2e:6d62) -> B7
	jp nz, .asm_bad9a ; BAD63 (2e:6d63) -> C2 9A 6D
	ld a, $11 ; BAD66 (2e:6d66) -> 3E 11
	scall PlayMusic ; BAD68 (2e:6d68) -> CD E6 4E
	ld a, $02 ; BAD6B (2e:6d6b) -> 3E 02
	scall PlayerFace ; BAD6D (2e:6d6d) -> CD 77 46
	ld c, $01 ; BAD70 (2e:6d70) -> 0E 01
	ld e, $02 ; BAD72 (2e:6d72) -> 1E 02
	ld a, $09 ; BAD74 (2e:6d74) -> 3E 09
	scall LoadEmote ; BAD76 (2e:6d76) -> CD 76 41
	ld a, $37 ; BAD79 (2e:6d79) -> 3E 37
	scall PlaySFX ; BAD7B (2e:6d7b) -> CD FE 4E
	scall WaitEmote ; BAD7E (2e:6d7e) -> CD D5 41
	ld a, $01 ; BAD81 (2e:6d81) -> 3E 01
	scall Func_80653 ; BAD83 (2e:6d83) -> CD 53 46
	ld hl, $0001 ; BAD86 (2e:6d86) -> 21 01 00
	scall ScriptSleep ; BAD89 (2e:6d89) -> CD 8F 46
	scall HideEmote ; BAD8C (2e:6d8c) -> CD 8B 41
	ld e, $01 ; BAD8F (2e:6d8f) -> 1E 01
	ld hl, $00fa ; BAD91 (2e:6d91) -> 21 FA 00
	scall EventFlagAction ; BAD94 (2e:6d94) -> CD 1B 46
	jp .asm_bad9f ; BAD97 (2e:6d97) -> C3 9F 6D
.asm_bad9a:
	ld a, $01 ; BAD9A (2e:6d9a) -> 3E 01
	scall Func_80653 ; BAD9C (2e:6d9c) -> CD 53 46
.asm_bad9f:
	ret  ; BAD9F (2e:6d9f) -> C9

Data_bada0:
	db $02, $03, $04, $03, $04, $02, $ff, $ff

Data_bada8:
	db $01, $03, $04, $03, $04, $02, $ff, $ff

Func_badb0:
	push af ; BADB0 (2e:6db0) -> F5
	ld a, e ; BADB1 (2e:6db1) -> 7B
	or a ; BADB2 (2e:6db2) -> B7
	jp nz, .asm_bae4c ; BADB3 (2e:6db3) -> C2 4C 6E
	ld hl, sp+$01 ; BADB6 (2e:6db6) -> F8 01
	ld a, [hl] ; BADB8 (2e:6db8) -> 7E
	scall FacePlayer ; BADB9 (2e:6db9) -> CD 4B 44
	ld hl, $006e ; BADBC (2e:6dbc) -> 21 6E 00
	scall PrintTextWithNPCName ; BADBF (2e:6dbf) -> CD A9 44
	push hl ; BADC2 (2e:6dc2) -> E5
	push hl ; BADC3 (2e:6dc3) -> E5
	ld hl, $0000 ; BADC4 (2e:6dc4) -> 21 00 00
	push hl ; BADC7 (2e:6dc7) -> E5
	ld hl, $0000 ; BADC8 (2e:6dc8) -> 21 00 00
	push hl ; BADCB (2e:6dcb) -> E5
	call AdjustMoney ; BADCC (2e:6dcc) -> CD 7C 27
	pop bc ; BADCF (2e:6dcf) -> C1
	pop bc ; BADD0 (2e:6dd0) -> C1
	ld hl, $0000 ; BADD1 (2e:6dd1) -> 21 00 00
	push hl ; BADD4 (2e:6dd4) -> E5
	ld hl, $0064 ; BADD5 (2e:6dd5) -> 21 64 00
	push hl ; BADD8 (2e:6dd8) -> E5
	call CompareStackLongs_Signed ; BADD9 (2e:6dd9) -> CD 79 35
	jp nc, .asm_bade8 ; BADDC (2e:6ddc) -> D2 E8 6D
	ld hl, $0070 ; BADDF (2e:6ddf) -> 21 70 00
	scall PrintTextWithNPCName ; BADE2 (2e:6de2) -> CD A9 44
	jp .asm_bae4c ; BADE5 (2e:6de5) -> C3 4C 6E
.asm_bade8:
	ld hl, $006f ; BADE8 (2e:6de8) -> 21 6F 00
	scall PrintTextWithNPCNameAndYesNoBox ; BADEB (2e:6deb) -> CD CA 44
	or a ; BADEE (2e:6dee) -> B7
	jp nz, .asm_bae46 ; BADEF (2e:6def) -> C2 46 6E
	ld hl, $041b ; BADF2 (2e:6df2) -> 21 1B 04
	scall PrintTextStandard ; BADF5 (2e:6df5) -> CD 98 44
	push hl ; BADF8 (2e:6df8) -> E5
	push hl ; BADF9 (2e:6df9) -> E5
	ld hl, $ffff ; BADFA (2e:6dfa) -> 21 FF FF
	push hl ; BADFD (2e:6dfd) -> E5
	ld hl, $ff9c ; BADFE (2e:6dfe) -> 21 9C FF
	push hl ; BAE01 (2e:6e01) -> E5
	call AdjustMoney ; BAE02 (2e:6e02) -> CD 7C 27
	pop bc ; BAE05 (2e:6e05) -> C1
	pop bc ; BAE06 (2e:6e06) -> C1
	pop bc ; BAE07 (2e:6e07) -> C1
	pop bc ; BAE08 (2e:6e08) -> C1
	ld hl, $0072 ; BAE09 (2e:6e09) -> 21 72 00
	scall PrintTextWithNPCName ; BAE0C (2e:6e0c) -> CD A9 44
	ld e, $01 ; BAE0F (2e:6e0f) -> 1E 01
	ld hl, $0052 ; BAE11 (2e:6e11) -> 21 52 00
	scall EventFlagAction ; BAE14 (2e:6e14) -> CD 1B 46
	ld a, [wPlayerFacing] ; BAE17 (2e:6e17) -> FA 38 C8
	cp $02 ; BAE1A (2e:6e1a) -> FE 02
	jp nz, .asm_bae2d ; BAE1C (2e:6e1c) -> C2 2D 6E
	ld bc, Data_bada0 ; BAE1F (2e:6e1f) -> 01 A0 6D
	ld e, $2e ; BAE22 (2e:6e22) -> 1E 2E
	ld hl, sp+$01 ; BAE24 (2e:6e24) -> F8 01
	ld a, [hl] ; BAE26 (2e:6e26) -> 7E
	scall MovePersonAndWait ; BAE27 (2e:6e27) -> CD 88 46
	jp .asm_bae38 ; BAE2A (2e:6e2a) -> C3 38 6E
.asm_bae2d:
	ld bc, Data_bada8 ; BAE2D (2e:6e2d) -> 01 A8 6D
	ld e, $2e ; BAE30 (2e:6e30) -> 1E 2E
	ld hl, sp+$01 ; BAE32 (2e:6e32) -> F8 01
	ld a, [hl] ; BAE34 (2e:6e34) -> 7E
	scall MovePersonAndWait ; BAE35 (2e:6e35) -> CD 88 46
.asm_bae38:
	scall WaitNPCStep ; BAE38 (2e:6e38) -> CD 0C 42
	ld e, $00 ; BAE3B (2e:6e3b) -> 1E 00
	ld hl, sp+$01 ; BAE3D (2e:6e3d) -> F8 01
	ld a, [hl] ; BAE3F (2e:6e3f) -> 7E
	scall SetPersonVisibilityState ; BAE40 (2e:6e40) -> CD 3D 41
	jp .asm_bae4c ; BAE43 (2e:6e43) -> C3 4C 6E
.asm_bae46:
	ld hl, $0071 ; BAE46 (2e:6e46) -> 21 71 00
	scall PrintTextWithNPCName ; BAE49 (2e:6e49) -> CD A9 44
.asm_bae4c:
	pop bc ; BAE4C (2e:6e4c) -> C1
	ret  ; BAE4D (2e:6e4d) -> C9

Data_bae4e:
	db $02, $03, $03, $02, $ff, $ff

Data_bae54:
	db $01, $03, $03, $02, $ff, $ff

Func_bae5a:
	push af ; BAE5A (2e:6e5a) -> F5
	ld a, e ; BAE5B (2e:6e5b) -> 7B
	or a ; BAE5C (2e:6e5c) -> B7
	jp nz, .asm_baea8 ; BAE5D (2e:6e5d) -> C2 A8 6E
	ld hl, sp+$01 ; BAE60 (2e:6e60) -> F8 01
	ld a, [hl] ; BAE62 (2e:6e62) -> 7E
	scall FacePlayer ; BAE63 (2e:6e63) -> CD 4B 44
	ld hl, $0073 ; BAE66 (2e:6e66) -> 21 73 00
	scall PrintTextWithNPCName ; BAE69 (2e:6e69) -> CD A9 44
	ld e, $00 ; BAE6C (2e:6e6c) -> 1E 00
	ld hl, $0052 ; BAE6E (2e:6e6e) -> 21 52 00
	scall EventFlagAction ; BAE71 (2e:6e71) -> CD 1B 46
	ld e, $01 ; BAE74 (2e:6e74) -> 1E 01
	ld hl, $00ed ; BAE76 (2e:6e76) -> 21 ED 00
	scall EventFlagAction ; BAE79 (2e:6e79) -> CD 1B 46
	ld a, [wPlayerFacing] ; BAE7C (2e:6e7c) -> FA 38 C8
	cp $02 ; BAE7F (2e:6e7f) -> FE 02
	jp nz, .asm_bae92 ; BAE81 (2e:6e81) -> C2 92 6E
	ld bc, Data_bae4e ; BAE84 (2e:6e84) -> 01 4E 6E
	ld e, $2e ; BAE87 (2e:6e87) -> 1E 2E
	ld hl, sp+$01 ; BAE89 (2e:6e89) -> F8 01
	ld a, [hl] ; BAE8B (2e:6e8b) -> 7E
	scall MovePersonAndWait ; BAE8C (2e:6e8c) -> CD 88 46
	jp .asm_bae9d ; BAE8F (2e:6e8f) -> C3 9D 6E
.asm_bae92:
	ld bc, Data_bae54 ; BAE92 (2e:6e92) -> 01 54 6E
	ld e, $2e ; BAE95 (2e:6e95) -> 1E 2E
	ld hl, sp+$01 ; BAE97 (2e:6e97) -> F8 01
	ld a, [hl] ; BAE99 (2e:6e99) -> 7E
	scall MovePersonAndWait ; BAE9A (2e:6e9a) -> CD 88 46
.asm_bae9d:
	scall WaitNPCStep ; BAE9D (2e:6e9d) -> CD 0C 42
	ld e, $00 ; BAEA0 (2e:6ea0) -> 1E 00
	ld hl, sp+$01 ; BAEA2 (2e:6ea2) -> F8 01
	ld a, [hl] ; BAEA4 (2e:6ea4) -> 7E
	scall SetPersonVisibilityState ; BAEA5 (2e:6ea5) -> CD 3D 41
.asm_baea8:
	pop bc ; BAEA8 (2e:6ea8) -> C1
	ret  ; BAEA9 (2e:6ea9) -> C9

Data_baeaa:
	db $02, $03, $03, $02, $ff, $ff

Data_baeb0:
	db $01, $03, $03, $02, $ff, $ff

Func_baeb6:
	push af ; BAEB6 (2e:6eb6) -> F5
	ld a, e ; BAEB7 (2e:6eb7) -> 7B
	or a ; BAEB8 (2e:6eb8) -> B7
	jp nz, .asm_baefc ; BAEB9 (2e:6eb9) -> C2 FC 6E
	ld hl, sp+$01 ; BAEBC (2e:6ebc) -> F8 01
	ld a, [hl] ; BAEBE (2e:6ebe) -> 7E
	scall FacePlayer ; BAEBF (2e:6ebf) -> CD 4B 44
	ld hl, $0073 ; BAEC2 (2e:6ec2) -> 21 73 00
	scall PrintTextWithNPCName ; BAEC5 (2e:6ec5) -> CD A9 44
	ld e, $00 ; BAEC8 (2e:6ec8) -> 1E 00
	ld hl, $00ed ; BAECA (2e:6eca) -> 21 ED 00
	scall EventFlagAction ; BAECD (2e:6ecd) -> CD 1B 46
	ld a, [wPlayerFacing] ; BAED0 (2e:6ed0) -> FA 38 C8
	cp $02 ; BAED3 (2e:6ed3) -> FE 02
	jp nz, .asm_baee6 ; BAED5 (2e:6ed5) -> C2 E6 6E
	ld bc, Data_baeaa ; BAED8 (2e:6ed8) -> 01 AA 6E
	ld e, $2e ; BAEDB (2e:6edb) -> 1E 2E
	ld hl, sp+$01 ; BAEDD (2e:6edd) -> F8 01
	ld a, [hl] ; BAEDF (2e:6edf) -> 7E
	scall MovePersonAndWait ; BAEE0 (2e:6ee0) -> CD 88 46
	jp .asm_baef1 ; BAEE3 (2e:6ee3) -> C3 F1 6E
.asm_baee6:
	ld bc, Data_baeb0 ; BAEE6 (2e:6ee6) -> 01 B0 6E
	ld e, $2e ; BAEE9 (2e:6ee9) -> 1E 2E
	ld hl, sp+$01 ; BAEEB (2e:6eeb) -> F8 01
	ld a, [hl] ; BAEED (2e:6eed) -> 7E
	scall MovePersonAndWait ; BAEEE (2e:6eee) -> CD 88 46
.asm_baef1:
	scall WaitNPCStep ; BAEF1 (2e:6ef1) -> CD 0C 42
	ld e, $00 ; BAEF4 (2e:6ef4) -> 1E 00
	ld hl, sp+$01 ; BAEF6 (2e:6ef6) -> F8 01
	ld a, [hl] ; BAEF8 (2e:6ef8) -> 7E
	scall SetPersonVisibilityState ; BAEF9 (2e:6ef9) -> CD 3D 41
.asm_baefc:
	pop bc ; BAEFC (2e:6efc) -> C1
	ret  ; BAEFD (2e:6efd) -> C9

Func_baefe:
	ld a, e ; BAEFE (2e:6efe) -> 7B
	or a ; BAEFF (2e:6eff) -> B7
	jp nz, .asm_baf51 ; BAF00 (2e:6f00) -> C2 51 6F
	ld a, [wc790] ; BAF03 (2e:6f03) -> FA 90 C7
	or a ; BAF06 (2e:6f06) -> B7
	jp z, .asm_baf1b ; BAF07 (2e:6f07) -> CA 1B 6F
	ld a, [wc790] ; BAF0A (2e:6f0a) -> FA 90 C7
	cp $07 ; BAF0D (2e:6f0d) -> FE 07
	jp nc, .asm_baf1b ; BAF0F (2e:6f0f) -> D2 1B 6F
	ld hl, $03dd ; BAF12 (2e:6f12) -> 21 DD 03
	scall PrintTextStandard ; BAF15 (2e:6f15) -> CD 98 44
	jp .asm_baf51 ; BAF18 (2e:6f18) -> C3 51 6F
.asm_baf1b:
	ld hl, $0059 ; BAF1B (2e:6f1b) -> 21 59 00
	scall CheckEventFlag ; BAF1E (2e:6f1e) -> CD 2E 46
	or a ; BAF21 (2e:6f21) -> B7
	jp nz, .asm_baf3b ; BAF22 (2e:6f22) -> C2 3B 6F
	ld e, $01 ; BAF25 (2e:6f25) -> 1E 01
	ld hl, $0059 ; BAF27 (2e:6f27) -> 21 59 00
	scall EventFlagAction ; BAF2A (2e:6f2a) -> CD 1B 46
	ld a, $32 ; BAF2D (2e:6f2d) -> 3E 32
	scall PlaySFX ; BAF2F (2e:6f2f) -> CD FE 4E
	ld hl, $035b ; BAF32 (2e:6f32) -> 21 5B 03
	scall PrintTextStandard ; BAF35 (2e:6f35) -> CD 98 44
	jp .asm_baf4e ; BAF38 (2e:6f38) -> C3 4E 6F
.asm_baf3b:
	ld e, $00 ; BAF3B (2e:6f3b) -> 1E 00
	ld hl, $0059 ; BAF3D (2e:6f3d) -> 21 59 00
	scall EventFlagAction ; BAF40 (2e:6f40) -> CD 1B 46
	ld a, $28 ; BAF43 (2e:6f43) -> 3E 28
	scall PlaySFX ; BAF45 (2e:6f45) -> CD FE 4E
	ld hl, $035c ; BAF48 (2e:6f48) -> 21 5C 03
	scall PrintTextStandard ; BAF4B (2e:6f4b) -> CD 98 44
.asm_baf4e:
	call Func_bafd6 ; BAF4E (2e:6f4e) -> CD D6 6F
.asm_baf51:
	ret  ; BAF51 (2e:6f51) -> C9

Data_baf52:
	warpdef $01, $08, $02, $01, MAP_03_00, $1c, $10, $1c, $11, $34

Data_baf5d:
	warpdef $01, $08, $02, $01, MAP_05_00, $08, $0b, $08, $0c, $34

Data_baf68:
	warpdef $01, $08, $02, $01, MAP_05_00, $19, $0b, $19, $0c, $34

Data_baf73:
	warpdef $01, $08, $02, $01, MAP_00_00, $1b, $14, $1b, $15, $34

Data_baf7e:
	warpdef $01, $08, $02, $01, MAP_25_01, $07, $08, $07, $09, $34

Data_baf89:
	warpdef $01, $08, $02, $01, MAP_05_00, $0a, $0e, $0a, $0f, $34

Data_baf94:
	warpdef $01, $08, $02, $01, MAP_05_00, $16, $0e, $16, $0f, $34

Data_baf9f:
	warpdef $01, $08, $02, $01, MAP_05_00, $0d, $14, $0d, $15, $34

Data_bafaa:
	warpdef $01, $08, $02, $01, MAP_05_00, $13, $14, $13, $15, $34

Data_bafb5:
	warpdef $01, $08, $02, $01, MAP_01_00, $07, $11, $07, $12, $34

Data_bafc0:
	warpdef $01, $08, $02, $01, MAP_20_00, $15, $11, $15, $12, $34

Data_bafcb:
	warpdef $01, $08, $02, $01, MAP_05_00, $10, $15, $10, $16, $34

Func_bafd6:
	ld hl, $0059 ; BAFD6 (2e:6fd6) -> 21 59 00
	scall CheckEventFlag ; BAFD9 (2e:6fd9) -> CD 2E 46
	or a ; BAFDC (2e:6fdc) -> B7
	jp nz, .asm_bafe6 ; BAFDD (2e:6fdd) -> C2 E6 6F
	scall AllocateSpaceForWarps ; BAFE0 (2e:6fe0) -> CD 2B 40
	jp .asm_bb0a9 ; BAFE3 (2e:6fe3) -> C3 A9 70
.asm_bafe6:
	scall AllocateSpaceForWarps ; BAFE6 (2e:6fe6) -> CD 2B 40
	ld a, [wc78a] ; BAFE9 (2e:6fe9) -> FA 8A C7
	cp $0e ; BAFEC (2e:6fec) -> FE 0E
	jp z, .asm_bb0a1 ; BAFEE (2e:6fee) -> CA A1 70
	cp $0d ; BAFF1 (2e:6ff1) -> FE 0D
	jp z, .asm_bb096 ; BAFF3 (2e:6ff3) -> CA 96 70
	cp $0c ; BAFF6 (2e:6ff6) -> FE 0C
	jp z, .asm_bb08b ; BAFF8 (2e:6ff8) -> CA 8B 70
	cp $0b ; BAFFB (2e:6ffb) -> FE 0B
	jp z, .asm_bb080 ; BAFFD (2e:6ffd) -> CA 80 70
	cp $0a ; BB000 (2e:7000) -> FE 0A
	jp z, .asm_bb075 ; BB002 (2e:7002) -> CA 75 70
	cp $09 ; BB005 (2e:7005) -> FE 09
	jp z, .asm_bb06a ; BB007 (2e:7007) -> CA 6A 70
	cp $08 ; BB00A (2e:700a) -> FE 08
	jp z, .asm_bb05f ; BB00C (2e:700c) -> CA 5F 70
	cp $07 ; BB00F (2e:700f) -> FE 07
	jp z, .asm_bb054 ; BB011 (2e:7011) -> CA 54 70
	cp $06 ; BB014 (2e:7014) -> FE 06
	jp z, .asm_bb049 ; BB016 (2e:7016) -> CA 49 70
	cp $05 ; BB019 (2e:7019) -> FE 05
	jp z, .asm_bb03e ; BB01B (2e:701b) -> CA 3E 70
	cp $04 ; BB01E (2e:701e) -> FE 04
	jp z, .asm_bb033 ; BB020 (2e:7020) -> CA 33 70
	cp $01 ; BB023 (2e:7023) -> FE 01
	jp nz, .asm_bb0a9 ; BB025 (2e:7025) -> C2 A9 70
	ld e, $01 ; BB028 (2e:7028) -> 1E 01
	ld hl, Data_baf52 ; BB02A (2e:702a) -> 21 52 6F
	scall LoadWarps ; BB02D (2e:702d) -> CD 3A 40
	jp .asm_bb0a9 ; BB030 (2e:7030) -> C3 A9 70
.asm_bb033:
	ld e, $01 ; BB033 (2e:7033) -> 1E 01
	ld hl, Data_baf5d ; BB035 (2e:7035) -> 21 5D 6F
	scall LoadWarps ; BB038 (2e:7038) -> CD 3A 40
	jp .asm_bb0a9 ; BB03B (2e:703b) -> C3 A9 70
.asm_bb03e:
	ld e, $01 ; BB03E (2e:703e) -> 1E 01
	ld hl, Data_baf68 ; BB040 (2e:7040) -> 21 68 6F
	scall LoadWarps ; BB043 (2e:7043) -> CD 3A 40
	jp .asm_bb0a9 ; BB046 (2e:7046) -> C3 A9 70
.asm_bb049:
	ld e, $01 ; BB049 (2e:7049) -> 1E 01
	ld hl, Data_baf73 ; BB04B (2e:704b) -> 21 73 6F
	scall LoadWarps ; BB04E (2e:704e) -> CD 3A 40
	jp .asm_bb0a9 ; BB051 (2e:7051) -> C3 A9 70
.asm_bb054:
	ld e, $01 ; BB054 (2e:7054) -> 1E 01
	ld hl, Data_bafb5 ; BB056 (2e:7056) -> 21 B5 6F
	scall LoadWarps ; BB059 (2e:7059) -> CD 3A 40
	jp .asm_bb0a9 ; BB05C (2e:705c) -> C3 A9 70
.asm_bb05f:
	ld e, $01 ; BB05F (2e:705f) -> 1E 01
	ld hl, Data_baf89 ; BB061 (2e:7061) -> 21 89 6F
	scall LoadWarps ; BB064 (2e:7064) -> CD 3A 40
	jp .asm_bb0a9 ; BB067 (2e:7067) -> C3 A9 70
.asm_bb06a:
	ld e, $01 ; BB06A (2e:706a) -> 1E 01
	ld hl, Data_baf94 ; BB06C (2e:706c) -> 21 94 6F
	scall LoadWarps ; BB06F (2e:706f) -> CD 3A 40
	jp .asm_bb0a9 ; BB072 (2e:7072) -> C3 A9 70
.asm_bb075:
	ld e, $01 ; BB075 (2e:7075) -> 1E 01
	ld hl, Data_baf9f ; BB077 (2e:7077) -> 21 9F 6F
	scall LoadWarps ; BB07A (2e:707a) -> CD 3A 40
	jp .asm_bb0a9 ; BB07D (2e:707d) -> C3 A9 70
.asm_bb080:
	ld e, $01 ; BB080 (2e:7080) -> 1E 01
	ld hl, Data_bafaa ; BB082 (2e:7082) -> 21 AA 6F
	scall LoadWarps ; BB085 (2e:7085) -> CD 3A 40
	jp .asm_bb0a9 ; BB088 (2e:7088) -> C3 A9 70
.asm_bb08b:
	ld e, $01 ; BB08B (2e:708b) -> 1E 01
	ld hl, Data_baf7e ; BB08D (2e:708d) -> 21 7E 6F
	scall LoadWarps ; BB090 (2e:7090) -> CD 3A 40
	jp .asm_bb0a9 ; BB093 (2e:7093) -> C3 A9 70
.asm_bb096:
	ld e, $01 ; BB096 (2e:7096) -> 1E 01
	ld hl, Data_bafc0 ; BB098 (2e:7098) -> 21 C0 6F
	scall LoadWarps ; BB09B (2e:709b) -> CD 3A 40
	jp .asm_bb0a9 ; BB09E (2e:709e) -> C3 A9 70
.asm_bb0a1:
	ld e, $01 ; BB0A1 (2e:70a1) -> 1E 01
	ld hl, Data_bafcb ; BB0A3 (2e:70a3) -> 21 CB 6F
	scall LoadWarps ; BB0A6 (2e:70a6) -> CD 3A 40
.asm_bb0a9:
	ret  ; BB0A9 (2e:70a9) -> C9

Data_bb0aa:
	db $07, $07, $02, $02, $01, $07

Func_bb0b0:
	ld a, [wc790] ; BB0B0 (2e:70b0) -> FA 90 C7
	or a ; BB0B3 (2e:70b3) -> B7
	jp z, .asm_bb0d0 ; BB0B4 (2e:70b4) -> CA D0 70
	ld a, [wc790] ; BB0B7 (2e:70b7) -> FA 90 C7
	cp $07 ; BB0BA (2e:70ba) -> FE 07
	jp nz, .asm_bb0d0 ; BB0BC (2e:70bc) -> C2 D0 70
	ld a, [wc78a] ; BB0BF (2e:70bf) -> FA 8A C7
	cp $0d ; BB0C2 (2e:70c2) -> FE 0D
	jp nz, .asm_bb0d0 ; BB0C4 (2e:70c4) -> C2 D0 70
	ld hl, Data_bb0aa ; BB0C7 (2e:70c7) -> 21 AA 70
	scall Func_80d9b ; BB0CA (2e:70ca) -> CD 9B 4D
	scall Func_80f02 ; BB0CD (2e:70cd) -> CD 02 4F
.asm_bb0d0:
	ret  ; BB0D0 (2e:70d0) -> C9

Data_bb0d1:
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $08, $07, $08, $34
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $0f, $07, $0f, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $0c, $04, $0c, $05, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $19, $04, $19, $05, $34

Data_bb0fd:
	db $8e, $03, $ff, $ff

Data_bb101:
	db $8f, $03, $ff, $ff

Data_bb105:
	db $28, $03, $ff, $ff

Data_bb109:
	db $2a, $03, $ff, $ff

Data_bb10d:
	db $02, $08, $04, $01, $4b

Data_bb112:
	db $31, $08, $04

Data_bb115:
	db $31, $08, $04, $00, $00

Data_bb11a:
	db $17, $08, $04, $02, $47

Data_bb11f:
	db $20, $08, $04, $02, $79

Data_bb124:
	person_event $00, $04, $08, $05, $01, $01, $02, $04, $00, Func_806dd_2e, Data_bb112

Data_bb132:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb0fd
	person_event $ff, $00, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb101
	person_event $ff, $00, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb105
	person_event $ff, $00, $04, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb109

Data_bb16a:
	map MAP_00_00
	db $08, $08

	map MAP_00_00
	db $08, $0f

	map MAP_06_00
	db $0c, $04

	map MAP_06_00
	db $19, $04

Func_bb17a:: ; bb17a
	ld c, $00 ; BB17A (2e:717a) -> 0E 00
.asm_bb17c:
	ld a, c ; BB17C (2e:717c) -> 79
	cp $04 ; BB17D (2e:717d) -> FE 04
	jp nc, .asm_bb1e4 ; BB17F (2e:717f) -> D2 E4 71
	ld l, c ; BB182 (2e:7182) -> 69
	ld h, $00 ; BB183 (2e:7183) -> 26 00
	add hl, hl ; BB185 (2e:7185) -> 29
	add hl, hl ; BB186 (2e:7186) -> 29
	ld de, Data_bb16a ; BB187 (2e:7187) -> 11 6A 71
	add hl, de ; BB18A (2e:718a) -> 19
	ld a, [wBackupMapGroup] ; BB18B (2e:718b) -> FA DF C7
	cp [hl] ; BB18E (2e:718e) -> BE
	jp nz, .asm_bb1e0 ; BB18F (2e:718f) -> C2 E0 71
	ld l, c ; BB192 (2e:7192) -> 69
	ld h, $00 ; BB193 (2e:7193) -> 26 00
	add hl, hl ; BB195 (2e:7195) -> 29
	add hl, hl ; BB196 (2e:7196) -> 29
	ld de, Data_bb16a ; BB197 (2e:7197) -> 11 6A 71
	add hl, de ; BB19A (2e:719a) -> 19
	inc hl ; BB19B (2e:719b) -> 23
	ld a, [wBackupMapNumber] ; BB19C (2e:719c) -> FA E0 C7
	cp [hl] ; BB19F (2e:719f) -> BE
	jp nz, .asm_bb1e0 ; BB1A0 (2e:71a0) -> C2 E0 71
	ld l, c ; BB1A3 (2e:71a3) -> 69
	ld h, $00 ; BB1A4 (2e:71a4) -> 26 00
	add hl, hl ; BB1A6 (2e:71a6) -> 29
	add hl, hl ; BB1A7 (2e:71a7) -> 29
	ld de, Data_bb16a ; BB1A8 (2e:71a8) -> 11 6A 71
	add hl, de ; BB1AB (2e:71ab) -> 19
	inc hl ; BB1AC (2e:71ac) -> 23
	inc hl ; BB1AD (2e:71ad) -> 23
	ld a, [wBackupMapX] ; BB1AE (2e:71ae) -> FA DB C7
	cp [hl] ; BB1B1 (2e:71b1) -> BE
	jp nz, .asm_bb1e0 ; BB1B2 (2e:71b2) -> C2 E0 71
	ld l, c ; BB1B5 (2e:71b5) -> 69
	ld h, $00 ; BB1B6 (2e:71b6) -> 26 00
	add hl, hl ; BB1B8 (2e:71b8) -> 29
	add hl, hl ; BB1B9 (2e:71b9) -> 29
	ld de, Data_bb16a ; BB1BA (2e:71ba) -> 11 6A 71
	add hl, de ; BB1BD (2e:71bd) -> 19
	inc hl ; BB1BE (2e:71be) -> 23
	inc hl ; BB1BF (2e:71bf) -> 23
	inc hl ; BB1C0 (2e:71c0) -> 23
	ld a, [wBackupMapY] ; BB1C1 (2e:71c1) -> FA DC C7
	cp [hl] ; BB1C4 (2e:71c4) -> BE
	jp nz, .asm_bb1e0 ; BB1C5 (2e:71c5) -> C2 E0 71
	ld l, c ; BB1C8 (2e:71c8) -> 69
	ld h, $00 ; BB1C9 (2e:71c9) -> 26 00
	ld e, l ; BB1CB (2e:71cb) -> 5D
	ld d, h ; BB1CC (2e:71cc) -> 54
	add hl, hl ; BB1CD (2e:71cd) -> 29
	ld c, l ; BB1CE (2e:71ce) -> 4D
	ld b, h ; BB1CF (2e:71cf) -> 44
	add hl, hl ; BB1D0 (2e:71d0) -> 29
	add hl, hl ; BB1D1 (2e:71d1) -> 29
	add hl, de ; BB1D2 (2e:71d2) -> 19
	add hl, bc ; BB1D3 (2e:71d3) -> 09
	ld de, Data_bb0d1 ; BB1D4 (2e:71d4) -> 11 D1 70
	add hl, de ; BB1D7 (2e:71d7) -> 19
	ld e, $01 ; BB1D8 (2e:71d8) -> 1E 01
	scall LoadWarps ; BB1DA (2e:71da) -> CD 3A 40
	jp .asm_bb1e4 ; BB1DD (2e:71dd) -> C3 E4 71
.asm_bb1e0:
	inc c ; BB1E0 (2e:71e0) -> 0C
	jp .asm_bb17c ; BB1E1 (2e:71e1) -> C3 7C 71
.asm_bb1e4:
	ld a, [wBackupMapGroup] ; BB1E4 (2e:71e4) -> FA DF C7
	or a ; BB1E7 (2e:71e7) -> B7
	jp nz, .asm_bb239 ; BB1E8 (2e:71e8) -> C2 39 72
	ld a, [wBackupMapNumber] ; BB1EB (2e:71eb) -> FA E0 C7
	or a ; BB1EE (2e:71ee) -> B7
	jp nz, .asm_bb239 ; BB1EF (2e:71ef) -> C2 39 72
	call Func_bb29e ; BB1F2 (2e:71f2) -> CD 9E 72
	ld hl, Func_bb29e ; BB1F5 (2e:71f5) -> 21 9E 72
	scall Func_80f11 ; BB1F8 (2e:71f8) -> CD 11 4F
	ld a, [wBackupMapX] ; BB1FB (2e:71fb) -> FA DB C7
	cp $08 ; BB1FE (2e:71fe) -> FE 08
	jp nz, .asm_bb216 ; BB200 (2e:7200) -> C2 16 72
	ld a, [wBackupMapY] ; BB203 (2e:7203) -> FA DC C7
	cp $08 ; BB206 (2e:7206) -> FE 08
	jp nz, .asm_bb216 ; BB208 (2e:7208) -> C2 16 72
	ld e, $01 ; BB20B (2e:720b) -> 1E 01
	ld hl, Data_bb10d ; BB20D (2e:720d) -> 21 0D 71
	scall Func_80ce7 ; BB210 (2e:7210) -> CD E7 4C
	jp .asm_bb236 ; BB213 (2e:7213) -> C3 36 72
.asm_bb216:
	ld a, [wBackupMapX] ; BB216 (2e:7216) -> FA DB C7
	cp $08 ; BB219 (2e:7219) -> FE 08
	jp nz, .asm_bb236 ; BB21B (2e:721b) -> C2 36 72
	ld a, [wBackupMapY] ; BB21E (2e:721e) -> FA DC C7
	cp $0f ; BB221 (2e:7221) -> FE 0F
	jp nz, .asm_bb236 ; BB223 (2e:7223) -> C2 36 72
	ld e, $01 ; BB226 (2e:7226) -> 1E 01
	ld hl, Data_bb115 ; BB228 (2e:7228) -> 21 15 71
	scall Func_80ce7 ; BB22B (2e:722b) -> CD E7 4C
	ld e, $01 ; BB22E (2e:722e) -> 1E 01
	ld hl, Data_bb124 ; BB230 (2e:7230) -> 21 24 71
	scall LoadMapObjects ; BB233 (2e:7233) -> CD FB 40
.asm_bb236:
	jp .asm_bb27b ; BB236 (2e:7236) -> C3 7B 72
.asm_bb239:
	ld a, [wBackupMapGroup] ; BB239 (2e:7239) -> FA DF C7
	cp $06 ; BB23C (2e:723c) -> FE 06
	jp nz, .asm_bb27b ; BB23E (2e:723e) -> C2 7B 72
	ld a, [wBackupMapNumber] ; BB241 (2e:7241) -> FA E0 C7
	or a ; BB244 (2e:7244) -> B7
	jp nz, .asm_bb27b ; BB245 (2e:7245) -> C2 7B 72
	ld a, [wBackupMapX] ; BB248 (2e:7248) -> FA DB C7
	cp $0c ; BB24B (2e:724b) -> FE 0C
	jp nz, .asm_bb263 ; BB24D (2e:724d) -> C2 63 72
	ld a, [wBackupMapY] ; BB250 (2e:7250) -> FA DC C7
	cp $04 ; BB253 (2e:7253) -> FE 04
	jp nz, .asm_bb263 ; BB255 (2e:7255) -> C2 63 72
	ld e, $01 ; BB258 (2e:7258) -> 1E 01
	ld hl, Data_bb11a ; BB25A (2e:725a) -> 21 1A 71
	scall Func_80ce7 ; BB25D (2e:725d) -> CD E7 4C
	jp .asm_bb27b ; BB260 (2e:7260) -> C3 7B 72
.asm_bb263:
	ld a, [wBackupMapX] ; BB263 (2e:7263) -> FA DB C7
	cp $19 ; BB266 (2e:7266) -> FE 19
	jp nz, .asm_bb27b ; BB268 (2e:7268) -> C2 7B 72
	ld a, [wBackupMapY] ; BB26B (2e:726b) -> FA DC C7
	cp $04 ; BB26E (2e:726e) -> FE 04
	jp nz, .asm_bb27b ; BB270 (2e:7270) -> C2 7B 72
	ld e, $01 ; BB273 (2e:7273) -> 1E 01
	ld hl, Data_bb11f ; BB275 (2e:7275) -> 21 1F 71
	scall Func_80ce7 ; BB278 (2e:7278) -> CD E7 4C
.asm_bb27b:
	ld e, $04 ; BB27B (2e:727b) -> 1E 04
	ld hl, Data_bb132 ; BB27D (2e:727d) -> 21 32 71
	scall LoadMapObjects ; BB280 (2e:7280) -> CD FB 40
	ld a, $11 ; BB283 (2e:7283) -> 3E 11
	scall PlayMusic ; BB285 (2e:7285) -> CD E6 4E
	scall Func_8001c ; BB288 (2e:7288) -> CD 1C 40
	ret  ; BB28B (2e:728b) -> C9

Data_bb28c:
	db $02, $08, $01, $01, $00, $07

Data_bb292:
	db $02, $08, $01, $01, $00, $08

Data_bb298:
	db $03, $08, $02, $01, $01, $08

Func_bb29e:
	ld a, [wBackupMapX] ; BB29E (2e:729e) -> FA DB C7
	cp $08 ; BB2A1 (2e:72a1) -> FE 08
	jp nz, .asm_bb2c6 ; BB2A3 (2e:72a3) -> C2 C6 72
	ld a, [wBackupMapY] ; BB2A6 (2e:72a6) -> FA DC C7
	cp $08 ; BB2A9 (2e:72a9) -> FE 08
	jp nz, .asm_bb2c6 ; BB2AB (2e:72ab) -> C2 C6 72
	ld hl, Data_bb28c ; BB2AE (2e:72ae) -> 21 8C 72
	scall Func_80d9b ; BB2B1 (2e:72b1) -> CD 9B 4D
	ld hl, Data_bb292 ; BB2B4 (2e:72b4) -> 21 92 72
	scall Func_80d9b ; BB2B7 (2e:72b7) -> CD 9B 4D
	ld hl, Data_bb298 ; BB2BA (2e:72ba) -> 21 98 72
	scall Func_80d9b ; BB2BD (2e:72bd) -> CD 9B 4D
	scall Func_80f02 ; BB2C0 (2e:72c0) -> CD 02 4F
	jp .asm_bb2eb ; BB2C3 (2e:72c3) -> C3 EB 72
.asm_bb2c6:
	ld a, [wBackupMapX] ; BB2C6 (2e:72c6) -> FA DB C7
	cp $08 ; BB2C9 (2e:72c9) -> FE 08
	jp nz, .asm_bb2eb ; BB2CB (2e:72cb) -> C2 EB 72
	ld a, [wBackupMapY] ; BB2CE (2e:72ce) -> FA DC C7
	cp $0f ; BB2D1 (2e:72d1) -> FE 0F
	jp nz, .asm_bb2eb ; BB2D3 (2e:72d3) -> C2 EB 72
	ld hl, Data_bb28c ; BB2D6 (2e:72d6) -> 21 8C 72
	scall Func_80d9b ; BB2D9 (2e:72d9) -> CD 9B 4D
	ld hl, Data_bb292 ; BB2DC (2e:72dc) -> 21 92 72
	scall Func_80d9b ; BB2DF (2e:72df) -> CD 9B 4D
	ld hl, Data_bb298 ; BB2E2 (2e:72e2) -> 21 98 72
	scall Func_80d9b ; BB2E5 (2e:72e5) -> CD 9B 4D
	scall Func_80f02 ; BB2E8 (2e:72e8) -> CD 02 4F
.asm_bb2eb:
	ret  ; BB2EB (2e:72eb) -> C9

Data_bb2ec:
	db $06, $0b, $02, $01, $01, $00, $0c, $12, $0c, $13, $34, $06, $0b, $02
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

