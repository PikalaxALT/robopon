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
	db $01, $00, $1d, $0c, $01, $00, $1d
	db $12, $03, $00, $09, $09, $03, $00, $07, $0d, $03, $00, $05, $11, $03, $00, $11
	db $09, $03, $00, $17, $13, $14, $00, $14, $09, $14, $00, $14, $0c, $17, $00, $19
	db $06, $17, $00, $1d, $06, $17, $00, $21, $06, $17, $00, $08, $10, $17, $00, $0c
	db $10, $17, $00, $10, $10, $18, $00, $17, $11, $18, $00, $1b, $11, $18, $00, $1f
	db $11, $18, $00, $06, $1b, $18, $00, $0a, $1b, $18, $00, $0e, $1b, $0b, $00, $0f
	db $0d, $0b, $00, $13, $11, $0b, $00, $1b, $10, $0b, $00, $1c, $0b

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
	db $01, $08, $02, $01, $01, $00, $11, $0c, $11
	db $0d, $34, $01, $08, $02, $01, $01, $00, $19, $0c, $19, $0d, $34, $01, $08, $02
	db $01, $01, $00, $11, $12, $11, $13, $34, $01, $08, $02, $01, $01, $00, $19, $12
	db $19, $13, $34, $01, $08, $02, $01, $06, $00, $08, $06, $08, $07, $34, $01, $08
	db $02, $01, $06, $00, $15, $06, $15, $07, $34, $01, $08, $02, $01, $11, $00, $06
	db $04, $06, $05, $34, $01, $08, $02, $01, $11, $00, $0f, $04, $0f, $05, $34, $01
	db $08, $02, $01, $14, $00, $06, $06, $06, $07, $34, $01, $08, $02, $01, $14, $00
	db $15, $06, $15, $07, $34, $01, $08, $02, $01, $19, $01, $1e, $0a, $1e, $0b, $34
	db $01, $08, $02, $01, $19, $01, $21, $0a, $21, $0b, $34, $01, $08, $02, $01, $19
	db $01, $05, $15, $05, $16, $34, $01, $08, $02, $01, $19, $01, $08, $15, $08, $16
	db $34, $01, $08, $02, $01, $19, $01, $11, $15, $11, $16, $34, $01, $08, $02, $01
	db $19, $01, $14, $15, $14, $16, $34, $01, $08, $02, $01, $19, $01, $17, $15, $17
	db $16, $34, $01, $08, $02, $01, $1d, $00, $08, $13, $08, $14, $34, $01, $08, $02
	db $01, $1d, $00, $0a, $19, $0a, $1a, $34, $01, $08, $02, $01, $1d, $00, $12, $19
	db $12, $1a, $34, $88, $01, $ff, $ff, $86, $01, $ff, $ff, $7e, $01, $ff, $ff, $84
	db $01, $ff, $ff, $d9, $01, $ff, $ff, $2a, $00, $ff, $ff, $2a, $00, $ff, $ff, $ed
	db $01, $ff, $ff, $e9, $01, $ff, $ff, $ef, $01, $ff, $ff, $e7, $01, $ff, $ff, $ea
	db $01, $ff, $ff, $b8, $01, $ff, $ff, $ae, $01, $ff, $ff, $ad, $01, $ff, $ff, $7b
	db $01, $ff, $ff, $af, $01, $ff, $ff, $b0, $01, $ff, $ff, $ab, $01, $ff, $ff, $75
	db $03, $ff, $ff, $ac, $01, $ff, $ff, $9b, $02, $ff, $ff, $83, $03, $ff, $ff, $86
	db $03, $ff, $ff, $28, $03, $ff, $ff, $2a, $03, $ff, $ff, $2b, $03, $ff, $ff, $97
	db $03, $ff, $ff, $81, $01, $ff, $ff, $87, $01, $ff, $ff, $83, $01, $ff, $ff, $b0
	db $03, $ff, $ff, $af, $03, $ff, $ff, $b1, $03, $ff, $ff, $02, $04, $06, $07, $01
	db $01, $00, $04, $00, $2e, $5f, $48, $34, $59, $03, $04, $08, $07, $01, $01, $02
	db $04, $00, $2e, $5f, $48, $38, $59, $00, $04, $03, $03, $01, $01, $01, $04, $00
	db $2e, $5f, $48, $3c, $59, $06, $04, $07, $07, $01, $01, $03, $04, $00, $2e, $5f
	db $48, $40, $59, $01, $04, $08, $07, $01, $01, $01, $04, $00, $2e, $5f, $48, $44
	db $59, $ff, $00, $0a, $07, $01, $02, $01, $04, $01, $2e, $71, $5f, $00, $00, $03
	db $04, $01, $03, $01, $01, $02, $04, $00, $2e, $ad, $5f, $00, $00, $ff, $00, $0a
	db $07, $01, $02, $01, $04, $01, $2e, $8f, $5f, $00, $00, $04, $04, $06, $05, $01
	db $01, $00, $04, $00, $2e, $5f, $48, $48, $59, $10, $04, $06, $04, $01, $01, $03
	db $04, $00, $2e, $5f, $48, $4c, $59, $06, $04, $02, $03, $01, $01, $03, $04, $00
	db $2e, $5f, $48, $50, $59, $02, $04, $09, $06, $01, $01, $02, $04, $00, $2e, $5f
	db $48, $54, $59, $00, $04, $06, $07, $01, $01, $02, $04, $00, $2e, $5f, $48, $58
	db $59, $07, $04, $03, $03, $01, $01, $01, $04, $00, $2e, $5f, $48, $5c, $59, $03
	db $04, $09, $08, $01, $01, $03, $04, $00, $2e, $5f, $48, $60, $59, $01, $04, $01
	db $04, $01, $01, $02, $04, $00, $2e, $5f, $48, $64, $59, $00, $04, $0a, $08, $01
	db $01, $01, $04, $00, $2e, $5f, $48, $68, $59, $03, $04, $03, $02, $01, $01, $02
	db $04, $00, $2e, $5f, $48, $6c, $59, $03, $04, $08, $07, $01, $01, $01, $04, $00
	db $2e, $5f, $48, $70, $59, $02, $04, $07, $07, $01, $01, $03, $04, $00, $2e, $5f
	db $48, $74, $59, $07, $04, $03, $03, $01, $01, $02, $04, $00, $2e, $5f, $48, $78
	db $59, $00, $04, $08, $07, $01, $01, $00, $04, $00, $2e, $5f, $48, $7c, $59, $13
	db $04, $02, $04, $01, $02, $02, $04, $00, $2e, $5f, $48, $80, $59, $01, $04, $04
	db $03, $01, $01, $01, $04, $00, $2e, $5f, $48, $84, $59, $0e, $04, $07, $03, $01
	db $01, $00, $04, $00, $2e, $5f, $48, $88, $59, $02, $04, $01, $03, $01, $01, $03
	db $04, $00, $2e, $5f, $48, $8c, $59, $05, $04, $03, $02, $01, $01, $00, $04, $00
	db $2e, $5f, $48, $90, $59, $04, $04, $08, $07, $01, $01, $01, $04, $00, $2e, $5f
	db $48, $a0, $59, $ff, $00, $06, $04, $01, $01, $00, $04, $00, $2e, $5f, $48, $94
	db $59, $ff, $00, $07, $04, $01, $01, $00, $04, $00, $2e, $5f, $48, $98, $59, $ff
	db $00, $09, $04, $01, $01, $00, $04, $00, $2e, $5f, $48, $9c, $59, $01, $00, $11
	db $0c, $01, $00, $19, $0c, $01, $00, $11, $12, $01, $00, $19, $12, $06, $00, $08
	db $06, $06, $00, $15, $06, $11, $00, $06, $04, $11, $00, $0f, $04, $14, $00, $06
	db $06, $14, $00, $15, $06, $19, $01, $1e, $0a, $19, $01, $21, $0a, $19, $01, $05
	db $15, $19, $01, $08, $15, $19, $01, $11, $15, $19, $01, $14, $15, $19, $01, $17
	db $15, $1d, $00, $08, $13, $1d, $00, $0a, $19, $1d, $00, $12, $19

Func_b9bbe:: ; b9bbe
	db $0e, $00, $79, $fe, $14, $d2, $28, $5c, $69, $26, $00, $29, $29, $11, $6e, $5b
	db $19, $fa, $df, $c7, $be, $c2, $24, $5c, $69, $26, $00, $29, $29, $11, $6e, $5b
	db $19, $23, $fa, $e0, $c7, $be, $c2, $24, $5c, $69, $26, $00, $29, $29, $11, $6e
	db $5b, $19, $23, $23, $fa, $db, $c7, $be, $c2, $24, $5c, $69, $26, $00, $29, $29
	db $11, $6e, $5b, $19, $23, $23, $23, $fa, $dc, $c7, $be, $c2, $24, $5c, $69, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $58, $58, $19, $1e, $01
	db $cd, $3a, $40, $c3, $28, $5c, $0c, $c3, $c0, $5b, $cd, $52, $5f, $21, $52, $5f
	db $cd, $11, $4f, $fa, $df, $c7, $fe, $01, $c2, $ee, $5c, $fa, $e0, $c7, $b7, $c2
	db $ee, $5c, $fa, $db, $c7, $fe, $11, $c2, $71, $5c, $fa, $dc, $c7, $fe, $0c, $c2
	db $71, $5c, $1e, $01, $21, $bc, $59, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $6e
	db $5c, $fa, $90, $c7, $fe, $04, $c2, $6e, $5c, $11, $a4, $59, $af, $cd, $50, $41
	db $c3, $eb, $5c, $fa, $db, $c7, $fe, $19, $c2, $a2, $5c, $fa, $dc, $c7, $fe, $0c
	db $c2, $a2, $5c, $1e, $01, $21, $ca, $59, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca
	db $9f, $5c, $fa, $90, $c7, $fe, $04, $c2, $9f, $5c, $11, $a8, $59, $af, $cd, $50
	db $41, $c3, $eb, $5c, $fa, $db, $c7, $fe, $11, $c2, $bd, $5c, $fa, $dc, $c7, $fe
	db $12, $c2, $bd, $5c, $1e, $01, $21, $d8, $59, $cd, $fb, $40, $c3, $eb, $5c, $fa
	db $db, $c7, $fe, $19, $c2, $eb, $5c, $fa, $dc, $c7, $fe, $12, $c2, $eb, $5c, $1e
	db $01, $21, $e6, $59, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $eb, $5c, $fa, $90
	db $c7, $fe, $04, $c2, $eb, $5c, $11, $ac, $59, $af, $cd, $50, $41, $c3, $35, $5f
	db $fa, $df, $c7, $fe, $06, $c2, $3f, $5d, $fa, $e0, $c7, $b7, $c2, $3f, $5d, $fa
	db $db, $c7, $fe, $08, $c2, $1e, $5d, $fa, $dc, $c7, $fe, $06, $c2, $1e, $5d, $1e
	db $02, $21, $f4, $59, $cd, $fb, $40, $cd, $52, $5f, $cd, $02, $4f, $c3, $3c, $5d
	db $fa, $db, $c7, $fe, $15, $c2, $3c, $5d, $fa, $dc, $c7, $fe, $06, $c2, $3c, $5d
	db $1e, $02, $21, $10, $5a, $cd, $fb, $40, $cd, $52, $5f, $cd, $02, $4f, $c3, $35
	db $5f, $fa, $df, $c7, $fe, $11, $c2, $84, $5d, $fa, $e0, $c7, $b7, $c2, $84, $5d
	db $fa, $db, $c7, $fe, $06, $c2, $69, $5d, $fa, $dc, $c7, $fe, $04, $c2, $69, $5d
	db $1e, $01, $21, $2c, $5a, $cd, $fb, $40, $c3, $81, $5d, $fa, $db, $c7, $fe, $0f
	db $c2, $81, $5d, $fa, $dc, $c7, $fe, $04, $c2, $81, $5d, $1e, $01, $21, $3a, $5a
	db $cd, $fb, $40, $c3, $35, $5f, $fa, $df, $c7, $fe, $14, $c2, $0b, $5e, $fa, $e0
	db $c7, $b7, $c2, $0b, $5e, $fa, $db, $c7, $fe, $06, $c2, $cb, $5d, $fa, $dc, $c7
	db $fe, $06, $c2, $cb, $5d, $1e, $02, $21, $48, $5a, $cd, $fb, $40, $fa, $90, $c7
	db $b7, $ca, $c8, $5d, $fa, $90, $c7, $fe, $05, $d2, $c8, $5d, $11, $b0, $59, $af
	db $cd, $50, $41, $1e, $00, $3e, $01, $cd, $3d, $41, $c3, $08, $5e, $fa, $db, $c7
	db $fe, $15, $c2, $08, $5e, $fa, $dc, $c7, $fe, $06, $c2, $08, $5e, $1e, $03, $21
	db $64, $5a, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $08, $5e, $fa, $90, $c7, $fe
	db $05, $d2, $08, $5e, $11, $b8, $59, $3e, $01, $cd, $50, $41, $11, $b4, $59, $3e
	db $02, $cd, $50, $41, $1e, $00, $af, $cd, $3d, $41, $c3, $35, $5f, $fa, $df, $c7
	db $fe, $19, $c2, $d8, $5e, $fa, $e0, $c7, $fe, $01, $c2, $d8, $5e, $fa, $db, $c7
	db $fe, $1e, $c2, $36, $5e, $fa, $dc, $c7, $fe, $0a, $c2, $36, $5e, $1e, $02, $21
	db $8e, $5a, $cd, $fb, $40, $c3, $d5, $5e, $fa, $db, $c7, $fe, $21, $c2, $51, $5e
	db $fa, $dc, $c7, $fe, $0a, $c2, $51, $5e, $1e, $01, $21, $aa, $5a, $cd, $fb, $40
	db $c3, $d5, $5e, $fa, $db, $c7, $fe, $05, $c2, $6c, $5e, $fa, $dc, $c7, $fe, $15
	db $c2, $6c, $5e, $1e, $01, $21, $b8, $5a, $cd, $fb, $40, $c3, $d5, $5e, $fa, $db
	db $c7, $fe, $08, $c2, $87, $5e, $fa, $dc, $c7, $fe, $15, $c2, $87, $5e, $1e, $02
	db $21, $c6, $5a, $cd, $fb, $40, $c3, $d5, $5e, $fa, $db, $c7, $fe, $11, $c2, $a2
	db $5e, $fa, $dc, $c7, $fe, $15, $c2, $a2, $5e, $1e, $01, $21, $e2, $5a, $cd, $fb
	db $40, $c3, $d5, $5e, $fa, $db, $c7, $fe, $14, $c2, $bd, $5e, $fa, $dc, $c7, $fe
	db $15, $c2, $bd, $5e, $1e, $01, $21, $fe, $5a, $cd, $fb, $40, $c3, $d5, $5e, $fa
	db $db, $c7, $fe, $17, $c2, $d5, $5e, $fa, $dc, $c7, $fe, $15, $c2, $d5, $5e, $1e
	db $01, $21, $f0, $5a, $cd, $fb, $40, $c3, $35, $5f, $fa, $df, $c7, $fe, $1d, $c2
	db $35, $5f, $fa, $e0, $c7, $b7, $c2, $35, $5f, $fa, $db, $c7, $fe, $08, $c2, $02
	db $5f, $fa, $dc, $c7, $fe, $13, $c2, $02, $5f, $1e, $01, $21, $0c, $5b, $cd, $fb
	db $40, $c3, $35, $5f, $fa, $db, $c7, $fe, $0a, $c2, $1d, $5f, $fa, $dc, $c7, $fe
	db $19, $c2, $1d, $5f, $1e, $01, $21, $1a, $5b, $cd, $fb, $40, $c3, $35, $5f, $fa
	db $db, $c7, $fe, $12, $c2, $35, $5f, $fa, $dc, $c7, $fe, $19, $c2, $35, $5f, $1e
	db $02, $21, $28, $5b, $cd, $fb, $40, $1e, $03, $21, $44, $5b, $cd, $fb, $40, $cd
	db $1c, $40, $3e, $11, $cd, $e6, $4e, $c9, $01, $08, $01, $01, $0a, $07, $01, $08
	db $01, $01, $0a, $08, $fa, $df, $c7, $fe, $06, $c2, $70, $5f, $fa, $e0, $c7, $b7
	db $c2, $70, $5f, $21, $46, $5f, $cd, $9b, $4d, $21, $4c, $5f, $cd, $9b, $4d, $cd
	db $02, $4f, $c9, $7b, $fe, $02, $c2, $8e, $5f, $3e, $2e, $cd, $fe, $4e, $2e, $05
	db $e5, $0e, $0a, $1e, $00, $3e, $06, $cd, $ff, $4d, $c1, $3e, $01, $ea, $38, $c8
	db $c9, $7b, $fe, $02, $c2, $ac, $5f, $2e, $05, $e5, $0e, $17, $1e, $00, $3e, $06
	db $cd, $ff, $4d, $c1, $3e, $2e, $cd, $fe, $4e, $3e, $01, $ea, $38, $c8, $c9, $f5
	db $7b, $b7, $c2, $23, $60, $f8, $01, $7e, $cd, $4b, $44, $fa, $90, $c7, $b7, $ca
	db $d1, $5f, $fa, $90, $c7, $fe, $06, $d2, $d1, $5f, $21, $54, $04, $cd, $98, $44
	db $c3, $23, $60, $21, $e9, $00, $cd, $2e, $46, $fe, $01, $c2, $f7, $5f, $21, $eb
	db $00, $cd, $2e, $46, $b7, $c2, $f7, $5f, $21, $52, $04, $cd, $98, $44, $1e, $01
	db $21, $eb, $00, $cd, $1b, $46, $c3, $23, $60, $21, $ea, $00, $cd, $2e, $46, $fe
	db $01, $c2, $1d, $60, $21, $eb, $00, $cd, $2e, $46, $b7, $c2, $1d, $60, $21, $53
	db $04, $cd, $98, $44, $1e, $01, $21, $eb, $00, $cd, $1b, $46, $c3, $23, $60, $21
	db $55, $04, $cd, $98, $44, $c1, $c9, $01, $0a, $02, $01, $00, $00, $09, $07, $09
	db $08, $34, $01, $0a, $02, $01, $01, $00, $11, $06, $11, $07, $34, $01, $0a, $02
	db $01, $01, $00, $19, $06, $19, $07, $34, $01, $0a, $02, $01, $06, $00, $0e, $12
	db $0e, $13, $34, $01, $0a, $02, $01, $06, $00, $1c, $0e, $1c, $0f, $34, $01, $0a
	db $02, $01, $17, $00, $0b, $05, $0b, $06, $34, $01, $0a, $02, $01, $17, $00, $20
	db $0e, $20, $0f, $34, $01, $0a, $02, $01, $18, $00, $09, $10, $09, $11, $34, $01
	db $0a, $02, $01, $18, $00, $1e, $19, $1e, $1a, $34, $66, $07, $02, $11, $2b, $67
	db $09, $02, $11, $2d, $68, $07, $02, $11, $2b, $69, $09, $02, $11, $2e, $12, $04
	db $ff, $ff, $99, $01, $ff, $ff, $91, $01, $ff, $ff, $dc, $01, $ff, $ff, $d6, $01
	db $ff, $ff, $fa, $01, $ff, $ff, $f8, $01, $ff, $ff, $13, $02, $ff, $ff, $0c, $02
	db $ff, $ff, $9b, $01, $ff, $ff, $93, $01, $ff, $ff, $db, $01, $ff, $ff, $da, $01
	db $ff, $ff, $d7, $01, $ff, $ff, $fe, $01, $ff, $ff, $f9, $01, $ff, $ff, $14, $02
	db $ff, $ff, $0d, $02, $ff, $ff, $2b, $03, $ff, $ff, $28, $03, $ff, $ff, $29, $03
	db $ff, $ff, $9a, $01, $ff, $ff, $92, $01, $ff, $ff, $94, $01, $ff, $ff, $1d, $04
	db $ff, $ff, $06, $04, $01, $08, $01, $01, $02, $04, $00, $2e, $5f, $48, $9c, $60
	db $02, $04, $0d, $03, $01, $01, $00, $04, $00, $2e, $5f, $48, $fc, $60, $ff, $00
	db $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00, $04, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $06, $01, $01, $01
	db $00, $04, $00, $2e, $5f, $48, $ec, $60, $ff, $00, $07, $01, $01, $01, $00, $04
	db $00, $2e, $5f, $48, $e8, $60, $ff, $00, $09, $01, $01, $01, $00, $04, $00, $2e
	db $5f, $48, $e4, $60, $03, $04, $0d, $03, $01, $01, $00, $04, $00, $2e, $5f, $48
	db $a0, $60, $06, $04, $01, $08, $01, $01, $02, $04, $00, $2e, $5f, $48, $c0, $60
	db $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60, $ff, $00
	db $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $06, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00, $07, $01, $01, $01
	db $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $09, $01, $01, $01, $00, $04
	db $00, $2e, $5f, $48, $ec, $60, $03, $04, $05, $08, $01, $01, $03, $04, $00, $2e
	db $5f, $48, $a4, $60, $0a, $04, $0a, $04, $01, $01, $01, $04, $00, $2e, $5f, $48
	db $c4, $60, $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60
	db $ff, $00, $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60, $ff, $00
	db $06, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60, $ff, $00, $07, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $09, $01, $01, $01
	db $00, $04, $00, $2e, $5f, $48, $e4, $60, $00, $04, $0b, $04, $01, $01, $01, $04
	db $00, $2e, $5f, $48, $a8, $60, $07, $04, $05, $08, $01, $01, $02, $04, $00, $2e
	db $5f, $48, $c8, $60, $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48
	db $e8, $60, $ff, $00, $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60
	db $ff, $00, $06, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00
	db $07, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60, $ff, $00, $09, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60, $02, $04, $01, $08, $01, $01
	db $00, $04, $00, $2e, $5f, $48, $ac, $60, $05, $04, $09, $05, $01, $01, $03, $04
	db $00, $2e, $5f, $48, $cc, $60, $06, $04, $0d, $09, $01, $01, $02, $04, $00, $2e
	db $5f, $48, $d0, $60, $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48
	db $e8, $60, $ff, $00, $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60
	db $ff, $00, $06, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00
	db $07, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $09, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $0e, $04, $01, $08, $01, $01
	db $01, $04, $00, $2e, $5f, $48, $b0, $60, $02, $04, $0c, $04, $01, $01, $02, $04
	db $00, $2e, $5f, $48, $d4, $60, $ff, $00, $03, $01, $01, $01, $02, $04, $00, $2e
	db $5f, $48, $ec, $60, $ff, $00, $04, $01, $01, $01, $02, $04, $00, $2e, $5f, $48
	db $e4, $60, $ff, $00, $06, $01, $01, $01, $02, $04, $00, $2e, $5f, $48, $e4, $60
	db $05, $04, $02, $02, $01, $01, $00, $04, $00, $2e, $5f, $48, $b4, $60, $03, $04
	db $09, $05, $01, $01, $01, $04, $00, $2e, $5f, $48, $d8, $60, $ff, $00, $03, $01
	db $01, $01, $02, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $04, $01, $01, $01
	db $02, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00, $06, $01, $01, $01, $02, $04
	db $00, $2e, $5f, $48, $ec, $60, $0e, $04, $01, $08, $01, $01, $02, $04, $00, $2e
	db $5f, $48, $b8, $60, $02, $04, $04, $08, $01, $01, $03, $04, $00, $2e, $5f, $48
	db $dc, $60, $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $ec, $60
	db $ff, $00, $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00
	db $06, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60, $ff, $00, $07, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00, $09, $01, $01, $01
	db $00, $04, $00, $2e, $5f, $48, $ec, $60, $05, $04, $02, $02, $01, $01, $00, $04
	db $00, $2e, $5f, $48, $bc, $60, $03, $04, $01, $03, $01, $01, $00, $04, $00, $2e
	db $5f, $48, $e0, $60, $ff, $00, $03, $01, $01, $01, $00, $04, $00, $2e, $5f, $48
	db $ec, $60, $ff, $00, $04, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e8, $60
	db $ff, $00, $06, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00
	db $07, $01, $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $ff, $00, $09, $01
	db $01, $01, $00, $04, $00, $2e, $5f, $48, $e4, $60, $00, $00, $09, $07, $01, $00
	db $11, $06, $01, $00, $19, $06, $06, $00, $0e, $12, $06, $00, $1c, $0e, $17, $00
	db $0b, $05, $17, $00, $20, $0e, $18, $00, $09, $10, $18, $00, $1e, $19

Func_ba46c:: ; ba46c
	db $0e, $00, $79, $fe, $09, $d2, $d6, $64, $69, $26, $00, $29, $29, $11, $48, $64
	db $19, $fa, $df, $c7, $be, $c2, $d2, $64, $69, $26, $00, $29, $29, $11, $48, $64
	db $19, $23, $fa, $e0, $c7, $be, $c2, $d2, $64, $69, $26, $00, $29, $29, $11, $48
	db $64, $19, $23, $23, $fa, $db, $c7, $be, $c2, $d2, $64, $69, $26, $00, $29, $29
	db $11, $48, $64, $19, $23, $23, $23, $fa, $dc, $c7, $be, $c2, $d2, $64, $69, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $25, $60, $19, $1e, $01
	db $cd, $3a, $40, $c3, $d6, $64, $0c, $c3, $6e, $64, $fa, $df, $c7, $b7, $c2, $ff
	db $64, $fa, $e0, $c7, $b7, $c2, $ff, $64, $fa, $db, $c7, $fe, $09, $c2, $fc, $64
	db $fa, $dc, $c7, $fe, $07, $c2, $fc, $64, $1e, $07, $21, $00, $61, $cd, $fb, $40
	db $c3, $54, $66, $fa, $df, $c7, $fe, $01, $c2, $78, $65, $fa, $e0, $c7, $b7, $c2
	db $78, $65, $fa, $db, $c7, $fe, $11, $c2, $3f, $65, $fa, $dc, $c7, $fe, $06, $c2
	db $3f, $65, $1e, $07, $21, $62, $61, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca, $3c
	db $65, $fa, $90, $c7, $fe, $04, $c2, $3c, $65, $11, $f0, $60, $af, $cd, $50, $41
	db $c3, $75, $65, $fa, $db, $c7, $fe, $19, $c2, $75, $65, $fa, $dc, $c7, $fe, $06
	db $c2, $75, $65, $1e, $07, $21, $c4, $61, $cd, $fb, $40, $fa, $90, $c7, $b7, $ca
	db $75, $65, $fa, $90, $c7, $fe, $04, $c2, $75, $65, $11, $f4, $60, $af, $cd, $50
	db $41, $11, $f8, $60, $3e, $01, $cd, $50, $41, $c3, $54, $66, $fa, $df, $c7, $fe
	db $06, $c2, $bd, $65, $fa, $e0, $c7, $b7, $c2, $bd, $65, $fa, $db, $c7, $fe, $0e
	db $c2, $a2, $65, $fa, $dc, $c7, $fe, $12, $c2, $a2, $65, $1e, $07, $21, $26, $62
	db $cd, $fb, $40, $c3, $ba, $65, $fa, $db, $c7, $fe, $1c, $c2, $ba, $65, $fa, $dc
	db $c7, $fe, $0e, $c2, $ba, $65, $1e, $08, $21, $88, $62, $cd, $fb, $40, $c3, $54
	db $66, $fa, $df, $c7, $fe, $17, $c2, $12, $66, $fa, $e0, $c7, $b7, $c2, $12, $66
	db $fa, $db, $c7, $fe, $0b, $c2, $ef, $65, $fa, $dc, $c7, $fe, $05, $c2, $ef, $65
	db $1e, $05, $21, $f8, $62, $cd, $fb, $40, $1e, $02, $21, $88, $60, $cd, $e7, $4c
	db $c3, $0f, $66, $fa, $db, $c7, $fe, $20, $c2, $0f, $66, $fa, $dc, $c7, $fe, $0e
	db $c2, $0f, $66, $1e, $05, $21, $3e, $63, $cd, $fb, $40, $1e, $02, $21, $92, $60
	db $cd, $e7, $4c, $c3, $54, $66, $fa, $df, $c7, $fe, $18, $c2, $54, $66, $fa, $e0
	db $c7, $b7, $c2, $54, $66, $fa, $db, $c7, $fe, $09, $c2, $3c, $66, $fa, $dc, $c7
	db $fe, $10, $c2, $3c, $66, $1e, $07, $21, $84, $63, $cd, $fb, $40, $c3, $54, $66
	db $fa, $db, $c7, $fe, $1e, $c2, $54, $66, $fa, $dc, $c7, $fe, $19, $c2, $54, $66
	db $1e, $07, $21, $e6, $63, $cd, $fb, $40, $cd, $1c, $40, $3e, $11, $cd, $e6, $4e
	db $c9, $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00, $65
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
	db $c3, $5f, $6a, $cd, $1c, $40, $c9, $7b, $b7, $c2, $db, $6b, $21, $59, $00, $cd
	db $2e, $46, $fe, $01, $c2, $79, $6a, $21, $83, $02, $cd, $98, $44, $c3, $db, $6b
	db $fa, $38, $c8, $b7, $ca, $83, $6a, $c3, $db, $6b, $af, $cd, $53, $46, $0e, $01
	db $1e, $01, $3e, $09, $cd, $76, $41, $3e, $5a, $cd, $fe, $4e, $cd, $d5, $41, $cd
	db $8b, $41, $1e, $00, $21, $fa, $00, $cd, $1b, $46, $fa, $8a, $c7, $fe, $0e, $ca
	db $c9, $6b, $fe, $0d, $ca, $b4, $6b, $fe, $0c, $ca, $9f, $6b, $fe, $0b, $ca, $8a
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
	db $4d, $c1, $c9, $7b, $b7, $c2, $5b, $6d, $fa, $38, $c8, $b7, $ca, $eb, $6b, $c3
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
	db $4d, $c1, $c9, $21, $fa, $00, $cd, $2e, $46, $b7, $c2, $9a, $6d, $3e, $11, $cd
	db $e6, $4e, $3e, $02, $cd, $77, $46, $0e, $01, $1e, $02, $3e, $09, $cd, $76, $41
	db $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $3e, $01, $cd, $53, $46, $21, $01, $00
	db $cd, $8f, $46, $cd, $8b, $41, $1e, $01, $21, $fa, $00, $cd, $1b, $46, $c3, $9f
	db $6d, $3e, $01, $cd, $53, $46, $c9, $02, $03, $04, $03, $04, $02, $ff, $ff, $01
	db $03, $04, $03, $04, $02, $ff, $ff, $f5, $7b, $b7, $c2, $4c, $6e, $f8, $01, $7e
	db $cd, $4b, $44, $21, $6e, $00, $cd, $a9, $44, $e5, $e5, $21, $00, $00, $e5, $21
	db $00, $00, $e5, $cd, $7c, $27, $c1, $c1, $21, $00, $00, $e5, $21, $64, $00, $e5
	db $cd, $79, $35, $d2, $e8, $6d, $21, $70, $00, $cd, $a9, $44, $c3, $4c, $6e, $21
	db $6f, $00, $cd, $ca, $44, $b7, $c2, $46, $6e, $21, $1b, $04, $cd, $98, $44, $e5
	db $e5, $21, $ff, $ff, $e5, $21, $9c, $ff, $e5, $cd, $7c, $27, $c1, $c1, $c1, $c1
	db $21, $72, $00, $cd, $a9, $44, $1e, $01, $21, $52, $00, $cd, $1b, $46, $fa, $38
	db $c8, $fe, $02, $c2, $2d, $6e, $01, $a0, $6d, $1e, $2e, $f8, $01, $7e, $cd, $88
	db $46, $c3, $38, $6e, $01, $a8, $6d, $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $cd
	db $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c3, $4c, $6e, $21, $71, $00
	db $cd, $a9, $44, $c1, $c9, $02, $03, $03, $02, $ff, $ff, $01, $03, $03, $02, $ff
	db $ff, $f5, $7b, $b7, $c2, $a8, $6e, $f8, $01, $7e, $cd, $4b, $44, $21, $73, $00
	db $cd, $a9, $44, $1e, $00, $21, $52, $00, $cd, $1b, $46, $1e, $01, $21, $ed, $00
	db $cd, $1b, $46, $fa, $38, $c8, $fe, $02, $c2, $92, $6e, $01, $4e, $6e, $1e, $2e
	db $f8, $01, $7e, $cd, $88, $46, $c3, $9d, $6e, $01, $54, $6e, $1e, $2e, $f8, $01
	db $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e, $cd, $3d, $41, $c1
	db $c9, $02, $03, $03, $02, $ff, $ff, $01, $03, $03, $02, $ff, $ff, $f5, $7b, $b7
	db $c2, $fc, $6e, $f8, $01, $7e, $cd, $4b, $44, $21, $73, $00, $cd, $a9, $44, $1e
	db $00, $21, $ed, $00, $cd, $1b, $46, $fa, $38, $c8, $fe, $02, $c2, $e6, $6e, $01
	db $aa, $6e, $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $c3, $f1, $6e, $01, $b0, $6e
	db $1e, $2e, $f8, $01, $7e, $cd, $88, $46, $cd, $0c, $42, $1e, $00, $f8, $01, $7e
	db $cd, $3d, $41, $c1, $c9, $7b, $b7, $c2, $51, $6f, $fa, $90, $c7, $b7, $ca, $1b
	db $6f, $fa, $90, $c7, $fe, $07, $d2, $1b, $6f, $21, $dd, $03, $cd, $98, $44, $c3
	db $51, $6f, $21, $59, $00, $cd, $2e, $46, $b7, $c2, $3b, $6f, $1e, $01, $21, $59
	db $00, $cd, $1b, $46, $3e, $32, $cd, $fe, $4e, $21, $5b, $03, $cd, $98, $44, $c3
	db $4e, $6f, $1e, $00, $21, $59, $00, $cd, $1b, $46, $3e, $28, $cd, $fe, $4e, $21
	db $5c, $03, $cd, $98, $44, $cd, $d6, $6f, $c9, $01, $08, $02, $01, $03, $00, $1c
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

