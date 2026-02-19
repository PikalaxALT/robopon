INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 24", ROMX

	script_library 24

Data_910b4:
	db $13, $0d, $01, $01, $07, $00, $12, $11, $12, $12, $2e

Data_910bf:
	dtext_tree_pointer TreeBitstreamText_3b7a6
	dw -1

Data_910c3:
	dtext_tree_pointer TreeBitstreamText_409c8
	dw -1

Data_910c7:
	dtext_tree_pointer TreeBitstreamText_40a7a
	dw -1

Data_910cb:
	dtext_tree_pointer TreeBitstreamText_409fd
	dw -1

Data_910cf:
	dtext_tree_pointer TreeBitstreamText_40ac2
	dw -1

Data_910d3:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, NULL, NULL
	person_event $10, $0c, $09, $08, $01, $01, $00, $04, $00, NULL, NULL
	person_event $10, $0c, $0b, $08, $01, $01, $00, $04, $00, NULL, NULL

Data_910fd:
	person_event $04, $04, $0a, $06, $01, $01, $02, $04, $00, Func_808fc_24, Data_910bf
	person_event $0e, $0c, $04, $0d, $01, $01, $01, $04, $00, Func_912e5, NULL
	person_event $18, $04, $00, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $10, $04, $03, $04, $01, $01, $02, $04, $00, Func_9141c, NULL
	person_event $10, $04, $11, $04, $01, $01, $02, $04, $00, Func_91431, NULL
	person_event $10, $04, $12, $04, $01, $01, $02, $04, $00, Func_91446, NULL
	person_event $ff, $00, $0a, $09, $01, $01, $00, $04, $00, Func_9145b, NULL
	person_event $01, $04, $0a, $0d, $01, $01, $00, $04, $00, Func_91478, NULL
	person_event $03, $04, $13, $09, $01, $01, $03, $04, $00, PrintTextFacePlayer_24, Data_910c3
	person_event $01, $04, $02, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_24, Data_910c7

Func_91189:: ; 91189
	ld a, $04 ; 91189 (24:5189) -> 3E 04
	ld [wc789], a ; 9118B (24:518b) -> EA 89 C7
	ld e, $01 ; 9118E (24:518e) -> 1E 01
	ld hl, Data_910b4 ; 91190 (24:5190) -> 21 B4 50
	scall LoadWarps ; 91193 (24:5193) -> CD 3A 40
	ld a, $0f ; 91196 (24:5196) -> 3E 0F
	scall PlayMusic ; 91198 (24:5198) -> CD E6 4E
	ld a, $01 ; 9119B (24:519b) -> 3E 01
	scall LoadPlayerSprite ; 9119D (24:519d) -> CD C6 4C
	ld a, $06 ; 911A0 (24:51a0) -> 3E 06
	ld [wc7e2], a ; 911A2 (24:51a2) -> EA E2 C7
	ld hl, $0036 ; 911A5 (24:51a5) -> 21 36 00
	scall CheckEventFlag ; 911A8 (24:51a8) -> CD 2E 46
	or a ; 911AB (24:51ab) -> B7
	jp nz, label_911c0 ; 911AC (24:51ac) -> C2 C0 51
	ld e, $03 ; 911AF (24:51af) -> 1E 03
	ld hl, Data_910d3 ; 911B1 (24:51b1) -> 21 D3 50
	scall LoadMapObjects ; 911B4 (24:51b4) -> CD FB 40
	scall Func_8001c ; 911B7 (24:51b7) -> CD 1C 40
	call Func_91219 ; 911BA (24:51ba) -> CD 19 52
	jp label_9120c ; 911BD (24:51bd) -> C3 0C 52
label_911c0:
	ld e, $0a ; 911C0 (24:51c0) -> 1E 0A
	ld hl, Data_910fd ; 911C2 (24:51c2) -> 21 FD 50
	scall LoadMapObjects ; 911C5 (24:51c5) -> CD FB 40
	ld e, $00 ; 911C8 (24:51c8) -> 1E 00
	ld a, $02 ; 911CA (24:51ca) -> 3E 02
	scall SetPersonVisibilityState ; 911CC (24:51cc) -> CD 3D 41
	ld hl, $0039 ; 911CF (24:51cf) -> 21 39 00
	scall CheckEventFlag ; 911D2 (24:51d2) -> CD 2E 46
	cp $01 ; 911D5 (24:51d5) -> FE 01
	jp nz, label_911ea ; 911D7 (24:51d7) -> C2 EA 51
	ld c, $0c ; 911DA (24:51da) -> 0E 0C
	ld e, $02 ; 911DC (24:51dc) -> 1E 02
	ld a, $01 ; 911DE (24:51de) -> 3E 01
	scall Func_80080 ; 911E0 (24:51e0) -> CD 80 40
	ld e, $02 ; 911E3 (24:51e3) -> 1E 02
	ld a, $01 ; 911E5 (24:51e5) -> 3E 01
	scall SpriteFace ; 911E7 (24:51e7) -> CD 95 40
label_911ea:
	ld a, [wc790] ; 911EA (24:51ea) -> FA 90 C7
	or a ; 911ED (24:51ed) -> B7
	jp z, label_91209 ; 911EE (24:51ee) -> CA 09 52
	ld a, [wc790] ; 911F1 (24:51f1) -> FA 90 C7
	cp $06 ; 911F4 (24:51f4) -> FE 06
	jp nc, label_91209 ; 911F6 (24:51f6) -> D2 09 52
	ld de, Data_910cb ; 911F9 (24:51f9) -> 11 CB 50
	ld a, $08 ; 911FC (24:51fc) -> 3E 08
	scall SetPersonTextPointer ; 911FE (24:51fe) -> CD 50 41
	ld de, Data_910cf ; 91201 (24:5201) -> 11 CF 50
	ld a, $09 ; 91204 (24:5204) -> 3E 09
	scall SetPersonTextPointer ; 91206 (24:5206) -> CD 50 41
label_91209:
	scall Func_8001c ; 91209 (24:5209) -> CD 1C 40
label_9120c:
	ret  ; 9120C (24:520c) -> C9

Data_9120d:
	db $0e, $07, $ff, $ff

Data_91211:
	db $03, $04, $ff, $ff

Data_91215:
	db $11, $04, $ff, $ff

Func_91219:
	ld c, $01 ; 91219 (24:5219) -> 0E 01
	ld de, Data_9120d ; 9121B (24:521b) -> 11 0D 52
	ld a, $24 ; 9121E (24:521e) -> 3E 24
	scall MovePlayer ; 91220 (24:5220) -> CD 3E 46
	scall WaitNPCStep ; 91223 (24:5223) -> CD 0C 42
	ld a, $03 ; 91226 (24:5226) -> 3E 03
	scall PlayerFace ; 91228 (24:5228) -> CD 77 46
	ld hl, $001e ; 9122B (24:522b) -> 21 1E 00
	scall ScriptSleep ; 9122E (24:522e) -> CD 8F 46
	ld e, $01 ; 91231 (24:5231) -> 1E 01
	ld a, $03 ; 91233 (24:5233) -> 3E 03
	scall PlayerStep ; 91235 (24:5235) -> CD 1E 4E
	ld e, $01 ; 91238 (24:5238) -> 1E 01
	ld a, $03 ; 9123A (24:523a) -> 3E 03
	scall PlayerStep ; 9123C (24:523c) -> CD 1E 4E
	ld e, $01 ; 9123F (24:523f) -> 1E 01
	ld a, $03 ; 91241 (24:5241) -> 3E 03
	scall PlayerStep ; 91243 (24:5243) -> CD 1E 4E
	ld e, $01 ; 91246 (24:5246) -> 1E 01
	ld a, $03 ; 91248 (24:5248) -> 3E 03
	scall PlayerStep ; 9124A (24:524a) -> CD 1E 4E
	ld hl, $008b ; 9124D (24:524d) -> 21 8B 00
	scall PrintTextWithNPCName ; 91250 (24:5250) -> CD A9 44
	ld hl, $008c ; 91253 (24:5253) -> 21 8C 00
	scall PrintTextWithNPCName ; 91256 (24:5256) -> CD A9 44
	ld hl, $008d ; 91259 (24:5259) -> 21 8D 00
	scall PrintTextWithNPCName ; 9125C (24:525c) -> CD A9 44
	ld hl, $008c ; 9125F (24:525f) -> 21 8C 00
	scall PrintTextWithNPCName ; 91262 (24:5262) -> CD A9 44
	ld e, $01 ; 91265 (24:5265) -> 1E 01
	xor a ; 91267 (24:5267) -> AF
	scall SpriteFace ; 91268 (24:5268) -> CD 95 40
	ld hl, $008e ; 9126B (24:526b) -> 21 8E 00
	scall PrintTextWithNPCName ; 9126E (24:526e) -> CD A9 44
	ld e, $02 ; 91271 (24:5271) -> 1E 02
	xor a ; 91273 (24:5273) -> AF
	scall SpriteFace ; 91274 (24:5274) -> CD 95 40
	ld hl, $008c ; 91277 (24:5277) -> 21 8C 00
	scall PrintTextWithNPCName ; 9127A (24:527a) -> CD A9 44
	ld hl, $008f ; 9127D (24:527d) -> 21 8F 00
	scall PrintTextWithNPCName ; 91280 (24:5280) -> CD A9 44
	ld hl, $0090 ; 91283 (24:5283) -> 21 90 00
	scall PrintTextWithNPCName ; 91286 (24:5286) -> CD A9 44
	ld bc, Data_91211 ; 91289 (24:5289) -> 01 11 52
	ld e, $24 ; 9128C (24:528c) -> 1E 24
	ld a, $01 ; 9128E (24:528e) -> 3E 01
	scall MovePerson ; 91290 (24:5290) -> CD F7 41
	ld bc, Data_91215 ; 91293 (24:5293) -> 01 15 52
	ld e, $24 ; 91296 (24:5296) -> 1E 24
	ld a, $02 ; 91298 (24:5298) -> 3E 02
	scall MovePersonAndWait ; 9129A (24:529a) -> CD 88 46
	scall WaitNPCStep ; 9129D (24:529d) -> CD 0C 42
	ld e, $02 ; 912A0 (24:52a0) -> 1E 02
	ld a, $01 ; 912A2 (24:52a2) -> 3E 01
	scall SpriteFace ; 912A4 (24:52a4) -> CD 95 40
	ld e, $02 ; 912A7 (24:52a7) -> 1E 02
	ld a, $02 ; 912A9 (24:52a9) -> 3E 02
	scall SpriteFace ; 912AB (24:52ab) -> CD 95 40
	ld e, $01 ; 912AE (24:52ae) -> 1E 01
	ld a, $01 ; 912B0 (24:52b0) -> 3E 01
	scall PlayerStep ; 912B2 (24:52b2) -> CD 1E 4E
	ld e, $01 ; 912B5 (24:52b5) -> 1E 01
	ld a, $01 ; 912B7 (24:52b7) -> 3E 01
	scall PlayerStep ; 912B9 (24:52b9) -> CD 1E 4E
	ld e, $01 ; 912BC (24:52bc) -> 1E 01
	ld a, $01 ; 912BE (24:52be) -> 3E 01
	scall PlayerStep ; 912C0 (24:52c0) -> CD 1E 4E
	ld e, $01 ; 912C3 (24:52c3) -> 1E 01
	ld a, $01 ; 912C5 (24:52c5) -> 3E 01
	scall PlayerStep ; 912C7 (24:52c7) -> CD 1E 4E
	ld e, $01 ; 912CA (24:52ca) -> 1E 01
	ld hl, $0036 ; 912CC (24:52cc) -> 21 36 00
	scall EventFlagAction ; 912CF (24:52cf) -> CD 1B 46
	ld a, $07 ; 912D2 (24:52d2) -> 3E 07
	scall Func_80c94 ; 912D4 (24:52d4) -> CD 94 4C
	ld l, $07 ; 912D7 (24:52d7) -> 2E 07
	push hl ; 912D9 (24:52d9) -> E5
	ld c, $0e ; 912DA (24:52da) -> 0E 0E
	ld e, $00 ; 912DC (24:52dc) -> 1E 00
	ld a, $08 ; 912DE (24:52de) -> 3E 08
	scall Func_80dff ; 912E0 (24:52e0) -> CD FF 4D
	pop bc ; 912E3 (24:52e3) -> C1
	ret  ; 912E4 (24:52e4) -> C9

Func_912e5:
	push af ; 912E5 (24:52e5) -> F5
	ld a, e ; 912E6 (24:52e6) -> 7B
	or a ; 912E7 (24:52e7) -> B7
	jp nz, label_91332 ; 912E8 (24:52e8) -> C2 32 53
	ld hl, sp+$01 ; 912EB (24:52eb) -> F8 01
	ld a, [hl] ; 912ED (24:52ed) -> 7E
	scall FacePlayer ; 912EE (24:52ee) -> CD 4B 44
	ld hl, $0039 ; 912F1 (24:52f1) -> 21 39 00
	scall CheckEventFlag ; 912F4 (24:52f4) -> CD 2E 46
	or a ; 912F7 (24:52f7) -> B7
	jp nz, label_9132c ; 912F8 (24:52f8) -> C2 2C 53
	ld hl, $005c ; 912FB (24:52fb) -> 21 5C 00
	scall CheckEventFlag ; 912FE (24:52fe) -> CD 2E 46
	or a ; 91301 (24:5301) -> B7
	jp nz, label_91326 ; 91302 (24:5302) -> C2 26 53
	ld hl, $0092 ; 91305 (24:5305) -> 21 92 00
	scall PrintTextWithNPCNameAndYesNoBox ; 91308 (24:5308) -> CD CA 44
	or a ; 9130B (24:530b) -> B7
	jp nz, label_9131d ; 9130C (24:530c) -> C2 1D 53
	ld e, $01 ; 9130F (24:530f) -> 1E 01
	ld hl, $005c ; 91311 (24:5311) -> 21 5C 00
	scall EventFlagAction ; 91314 (24:5314) -> CD 1B 46
	call Func_91342 ; 91317 (24:5317) -> CD 42 53
	jp label_91323 ; 9131A (24:531a) -> C3 23 53
label_9131d:
	ld hl, $0094 ; 9131D (24:531d) -> 21 94 00
	scall PrintTextWithNPCName ; 91320 (24:5320) -> CD A9 44
label_91323:
	jp label_91329 ; 91323 (24:5323) -> C3 29 53
label_91326:
	call Func_91342 ; 91326 (24:5326) -> CD 42 53
label_91329:
	jp label_91332 ; 91329 (24:5329) -> C3 32 53
label_9132c:
	ld hl, $003c ; 9132C (24:532c) -> 21 3C 00
	scall PrintTextWithNPCName ; 9132F (24:532f) -> CD A9 44
label_91332:
	pop bc ; 91332 (24:5332) -> C1
	ret  ; 91333 (24:5333) -> C9

Data_91334:
	db $01, $0d, $ff, $ff

Data_91338:
	db $02, $0c, $ff, $ff

Data_9133c:
	db $04, $0d, $01, $0d, $ff, $ff

Func_91342:
	ld a, $13 ; 91342 (24:5342) -> 3E 13
	scall Func_80e5d ; 91344 (24:5344) -> CD 5D 4E
	or a ; 91347 (24:5347) -> B7
	jp z, label_91415 ; 91348 (24:5348) -> CA 15 54
	ld a, $1e ; 9134B (24:534b) -> 3E 1E
	scall Func_80e6d ; 9134D (24:534d) -> CD 6D 4E
	cp $ff ; 91350 (24:5350) -> FE FF
	jp z, label_9140c ; 91352 (24:5352) -> CA 0C 54
	push af ; 91355 (24:5355) -> F5
	ld hl, $0095 ; 91356 (24:5356) -> 21 95 00
	scall PrintTextWithNPCName ; 91359 (24:5359) -> CD A9 44
	ld bc, Data_91334 ; 9135C (24:535c) -> 01 34 53
	ld e, $24 ; 9135F (24:535f) -> 1E 24
	ld a, $01 ; 91361 (24:5361) -> 3E 01
	scall MovePersonAndWait ; 91363 (24:5363) -> CD 88 46
	scall WaitNPCStep ; 91366 (24:5366) -> CD 0C 42
	xor a ; 91369 (24:5369) -> AF
	scall PlayMusic ; 9136A (24:536a) -> CD E6 4E
	ld a, $19 ; 9136D (24:536d) -> 3E 19
	scall PlayMusic ; 9136F (24:536f) -> CD E6 4E
	ld c, $01 ; 91372 (24:5372) -> 0E 01
	ld e, $01 ; 91374 (24:5374) -> 1E 01
	ld a, $04 ; 91376 (24:5376) -> 3E 04
	scall LoadEmote ; 91378 (24:5378) -> CD 76 41
	ld e, $00 ; 9137B (24:537b) -> 1E 00
	ld a, $01 ; 9137D (24:537d) -> 3E 01
	scall SetPersonVisibilityState ; 9137F (24:537f) -> CD 3D 41
	scall WaitEmote ; 91382 (24:5382) -> CD D5 41
	ld e, $01 ; 91385 (24:5385) -> 1E 01
	ld a, $01 ; 91387 (24:5387) -> 3E 01
	scall SetPersonVisibilityState ; 91389 (24:5389) -> CD 3D 41
	scall HideEmote ; 9138C (24:538c) -> CD 8B 41
	ld e, $01 ; 9138F (24:538f) -> 1E 01
	ld a, $02 ; 91391 (24:5391) -> 3E 02
	scall SetPersonVisibilityState ; 91393 (24:5393) -> CD 3D 41
	ld a, $68 ; 91396 (24:5396) -> 3E 68
	scall PlaySFX ; 91398 (24:5398) -> CD FE 4E
	xor a ; 9139B (24:539b) -> AF
	scall PlayMusic ; 9139C (24:539c) -> CD E6 4E
	ld a, $0f ; 9139F (24:539f) -> 3E 0F
	scall PlayMusic ; 913A1 (24:53a1) -> CD E6 4E
	ld bc, Data_91338 ; 913A4 (24:53a4) -> 01 38 53
	ld e, $24 ; 913A7 (24:53a7) -> 1E 24
	ld a, $01 ; 913A9 (24:53a9) -> 3E 01
	scall MovePersonAndWait ; 913AB (24:53ab) -> CD 88 46
	scall WaitNPCStep ; 913AE (24:53ae) -> CD 0C 42
	ld e, $02 ; 913B1 (24:53b1) -> 1E 02
	ld a, $01 ; 913B3 (24:53b3) -> 3E 01
	scall SpriteFace ; 913B5 (24:53b5) -> CD 95 40
	ld hl, $0096 ; 913B8 (24:53b8) -> 21 96 00
	scall PrintTextWithNPCName ; 913BB (24:53bb) -> CD A9 44
	ld c, $01 ; 913BE (24:53be) -> 0E 01
	ld de, Data_9133c ; 913C0 (24:53c0) -> 11 3C 53
	ld a, $24 ; 913C3 (24:53c3) -> 3E 24
	scall MovePlayer ; 913C5 (24:53c5) -> CD 3E 46
	ld a, $2a ; 913C8 (24:53c8) -> 3E 2A
	scall PlaySFX ; 913CA (24:53ca) -> CD FE 4E
	ld hl, $0359 ; 913CD (24:53cd) -> 21 59 03
	scall PrintTextStandard ; 913D0 (24:53d0) -> CD 98 44
	pop af ; 913D3 (24:53d3) -> F1

Func_913d4:
	push af ; 913D4 (24:53d4) -> F5
	ld l, a ; 913D5 (24:53d5) -> 6F
	ld h, $00 ; 913D6 (24:53d6) -> 26 00
	ld de, $0b00 ; 913D8 (24:53d8) -> 11 00 0B
	add hl, de ; 913DB (24:53db) -> 19
	scall Func_80488 ; 913DC (24:53dc) -> CD 88 44
	pop af ; 913DF (24:53df) -> F1
	push hl ; 913E0 (24:53e0) -> E5
	ld e, $01 ; 913E1 (24:53e1) -> 1E 01
	ld c, $00 ; 913E3 (24:53e3) -> 0E 00
	scall GiveRobot ; 913E5 (24:53e5) -> CD 87 4D
	pop hl ; 913E8 (24:53e8) -> E1
	ld c, l ; 913E9 (24:53e9) -> 4D
	ld e, $00 ; 913EA (24:53ea) -> 1E 00
	ld a, $1f ; 913EC (24:53ec) -> 3E 1F
	scall GiveRobot ; 913EE (24:53ee) -> CD 87 4D
	ld c, $01 ; 913F1 (24:53f1) -> 0E 01
	ld e, $01 ; 913F3 (24:53f3) -> 1E 01
	ld a, $13 ; 913F5 (24:53f5) -> 3E 13
	scall Func_80d4d ; 913F7 (24:53f7) -> CD 4D 4D
	ld e, $00 ; 913FA (24:53fa) -> 1E 00
	ld a, $02 ; 913FC (24:53fc) -> 3E 02
	scall SetPersonVisibilityState ; 913FE (24:53fe) -> CD 3D 41
	ld e, $01 ; 91401 (24:5401) -> 1E 01
	ld hl, $0039 ; 91403 (24:5403) -> 21 39 00
	scall EventFlagAction ; 91406 (24:5406) -> CD 1B 46
	jp label_91412 ; 91409 (24:5409) -> C3 12 54
label_9140c:
	ld hl, $038b ; 9140C (24:540c) -> 21 8B 03
	scall PrintTextWithNPCName ; 9140F (24:540f) -> CD A9 44
label_91412:
	jp label_9141b ; 91412 (24:5412) -> C3 1B 54
label_91415:
	ld hl, $038a ; 91415 (24:5415) -> 21 8A 03
	scall PrintTextWithNPCName ; 91418 (24:5418) -> CD A9 44
label_9141b:
	ret  ; 9141B (24:541b) -> C9

Func_9141c:
	push af ; 9141C (24:541c) -> F5
	ld a, e ; 9141D (24:541d) -> 7B
	or a ; 9141E (24:541e) -> B7
	jp nz, label_9142f ; 9141F (24:541f) -> C2 2F 54
	ld hl, sp+$01 ; 91422 (24:5422) -> F8 01
	ld a, [hl] ; 91424 (24:5424) -> 7E
	scall FacePlayer ; 91425 (24:5425) -> CD 4B 44
	ld e, $00 ; 91428 (24:5428) -> 1E 00
	ld a, $04 ; 9142A (24:542a) -> 3E 04
	scall Func_806a0 ; 9142C (24:542c) -> CD A0 46
label_9142f:
	pop bc ; 9142F (24:542f) -> C1
	ret  ; 91430 (24:5430) -> C9

Func_91431:
	push af ; 91431 (24:5431) -> F5
	ld a, e ; 91432 (24:5432) -> 7B
	or a ; 91433 (24:5433) -> B7
	jp nz, label_91444 ; 91434 (24:5434) -> C2 44 54
	ld hl, sp+$01 ; 91437 (24:5437) -> F8 01
	ld a, [hl] ; 91439 (24:5439) -> 7E
	scall FacePlayer ; 9143A (24:543a) -> CD 4B 44
	ld e, $02 ; 9143D (24:543d) -> 1E 02
	ld a, $04 ; 9143F (24:543f) -> 3E 04
	scall Func_806a0 ; 91441 (24:5441) -> CD A0 46
label_91444:
	pop bc ; 91444 (24:5444) -> C1
	ret  ; 91445 (24:5445) -> C9

Func_91446:
	push af ; 91446 (24:5446) -> F5
	ld a, e ; 91447 (24:5447) -> 7B
	or a ; 91448 (24:5448) -> B7
	jp nz, label_91459 ; 91449 (24:5449) -> C2 59 54
	ld hl, sp+$01 ; 9144C (24:544c) -> F8 01
	ld a, [hl] ; 9144E (24:544e) -> 7E
	scall FacePlayer ; 9144F (24:544f) -> CD 4B 44
	ld e, $01 ; 91452 (24:5452) -> 1E 01
	ld a, $04 ; 91454 (24:5454) -> 3E 04
	scall Func_806a0 ; 91456 (24:5456) -> CD A0 46
label_91459:
	pop bc ; 91459 (24:5459) -> C1
	ret  ; 9145A (24:545a) -> C9

Func_9145b:
	ld a, e ; 9145B (24:545b) -> 7B
	or a ; 9145C (24:545c) -> B7
	jp nz, label_91477 ; 9145D (24:545d) -> C2 77 54
	ld l, $01 ; 91460 (24:5460) -> 2E 01
	push hl ; 91462 (24:5462) -> E5
	ld c, $04 ; 91463 (24:5463) -> 0E 04
	ld e, $01 ; 91465 (24:5465) -> 1E 01
	ld a, $08 ; 91467 (24:5467) -> 3E 08
	scall Func_80dff ; 91469 (24:5469) -> CD FF 4D
	pop bc ; 9146C (24:546c) -> C1
	ld a, $2e ; 9146D (24:546d) -> 3E 2E
	scall PlaySFX ; 9146F (24:546f) -> CD FE 4E
	ld a, $02 ; 91472 (24:5472) -> 3E 02
	ld [wPlayerFacing], a ; 91474 (24:5474) -> EA 38 C8
label_91477:
	ret  ; 91477 (24:5477) -> C9

Func_91478:
	push af ; 91478 (24:5478) -> F5
	push bc ; 91479 (24:5479) -> C5
	ld hl, sp+$00 ; 9147A (24:547a) -> F8 00
	ld [hl], $ff ; 9147C (24:547c) -> 36 FF
	ld a, e ; 9147E (24:547e) -> 7B
	or a ; 9147F (24:547f) -> B7
	jp nz, label_9176c ; 91480 (24:5480) -> C2 6C 57
	ld a, [wc796] ; 91483 (24:5483) -> FA 96 C7
	cp $02 ; 91486 (24:5486) -> FE 02
	jp nz, label_9152c ; 91488 (24:5488) -> C2 2C 55
	ld a, $13 ; 9148B (24:548b) -> 3E 13
	scall Func_80e6d ; 9148D (24:548d) -> CD 6D 4E
	ld hl, sp+$01 ; 91490 (24:5490) -> F8 01
	ld [hl], a ; 91492 (24:5492) -> 77
	cp $ff ; 91493 (24:5493) -> FE FF
	jp z, label_91529 ; 91495 (24:5495) -> CA 29 55
	ld hl, $0422 ; 91498 (24:5498) -> 21 22 04
	scall PrintTextWithNPCName ; 9149B (24:549b) -> CD A9 44
	ld hl, $003c ; 9149E (24:549e) -> 21 3C 00
	scall ScriptSleep ; 914A1 (24:54a1) -> CD 8F 46
	ld a, $07 ; 914A4 (24:54a4) -> 3E 07
	scall FacePlayer ; 914A6 (24:54a6) -> CD 4B 44
	ld hl, $0413 ; 914A9 (24:54a9) -> 21 13 04
	scall PrintTextWithNPCName ; 914AC (24:54ac) -> CD A9 44
	ld a, $13 ; 914AF (24:54af) -> 3E 13
	scall Func_80e7d ; 914B1 (24:54b1) -> CD 7D 4E
	cp $01 ; 914B4 (24:54b4) -> FE 01
	jp nz, label_91520 ; 914B6 (24:54b6) -> C2 20 55
	ld hl, $0290 ; 914B9 (24:54b9) -> 21 90 02
	scall PrintTextWithNPCName ; 914BC (24:54bc) -> CD A9 44
	ld hl, $0400 ; 914BF (24:54bf) -> 21 00 04
	scall PrintTextWithYesNoBox ; 914C2 (24:54c2) -> CD BA 44
	or a ; 914C5 (24:54c5) -> B7
	jp nz, label_91508 ; 914C6 (24:54c6) -> C2 08 55
	ld a, $68 ; 914C9 (24:54c9) -> 3E 68
	scall PlaySFX ; 914CB (24:54cb) -> CD FE 4E
	ld hl, $0406 ; 914CE (24:54ce) -> 21 06 04
	scall PrintTextWithNPCName ; 914D1 (24:54d1) -> CD A9 44
	ld e, $00 ; 914D4 (24:54d4) -> 1E 00
	ld a, $07 ; 914D6 (24:54d6) -> 3E 07
	scall SpriteFace ; 914D8 (24:54d8) -> CD 95 40
	ld hl, sp+$01 ; 914DB (24:54db) -> F8 01
	ld l, [hl] ; 914DD (24:54dd) -> 6E
	ld h, $00 ; 914DE (24:54de) -> 26 00
	ld de, $0b00 ; 914E0 (24:54e0) -> 11 00 0B
	add hl, de ; 914E3 (24:54e3) -> 19
	scall Func_80488 ; 914E4 (24:54e4) -> CD 88 44
	ld a, l ; 914E7 (24:54e7) -> 7D
	push af ; 914E8 (24:54e8) -> F5
	ld c, $00 ; 914E9 (24:54e9) -> 0E 00
	ld e, $01 ; 914EB (24:54eb) -> 1E 01
	ld hl, sp+$03 ; 914ED (24:54ed) -> F8 03
	ld a, [hl] ; 914EF (24:54ef) -> 7E
	scall GiveRobot ; 914F0 (24:54f0) -> CD 87 4D
	pop af ; 914F3 (24:54f3) -> F1
	ld c, a ; 914F4 (24:54f4) -> 4F
	ld e, $00 ; 914F5 (24:54f5) -> 1E 00
	ld a, $32 ; 914F7 (24:54f7) -> 3E 32
	scall GiveRobot ; 914F9 (24:54f9) -> CD 87 4D
	ld a, $03 ; 914FC (24:54fc) -> 3E 03
	ld [wc796], a ; 914FE (24:54fe) -> EA 96 C7
	ld hl, sp+$00 ; 91501 (24:5501) -> F8 00
	ld [hl], $01 ; 91503 (24:5503) -> 36 01
	jp label_9151d ; 91505 (24:5505) -> C3 1D 55
label_91508:
	ld a, $69 ; 91508 (24:5508) -> 3E 69
	scall PlaySFX ; 9150A (24:550a) -> CD FE 4E
	ld hl, $0407 ; 9150D (24:550d) -> 21 07 04
	scall PrintTextWithNPCName ; 91510 (24:5510) -> CD A9 44
	ld e, $00 ; 91513 (24:5513) -> 1E 00
	ld a, $07 ; 91515 (24:5515) -> 3E 07
	scall SpriteFace ; 91517 (24:5517) -> CD 95 40
	jp label_9176c ; 9151A (24:551a) -> C3 6C 57
label_9151d:
	jp label_91529 ; 9151D (24:551d) -> C3 29 55
label_91520:
	ld hl, $046e ; 91520 (24:5520) -> 21 6E 04
	scall PrintTextStandard ; 91523 (24:5523) -> CD 98 44
	jp label_9176c ; 91526 (24:5526) -> C3 6C 57
label_91529:
	jp label_916a9 ; 91529 (24:5529) -> C3 A9 56
label_9152c:
	ld a, [wc796] ; 9152C (24:552c) -> FA 96 C7
	cp $0b ; 9152F (24:552f) -> FE 0B
	jp nz, label_915dc ; 91531 (24:5531) -> C2 DC 55
	ld a, $72 ; 91534 (24:5534) -> 3E 72
	scall Func_80e6d ; 91536 (24:5536) -> CD 6D 4E
	ld hl, sp+$01 ; 91539 (24:5539) -> F8 01
	ld [hl], a ; 9153B (24:553b) -> 77
	cp $ff ; 9153C (24:553c) -> FE FF
	jp z, label_915d9 ; 9153E (24:553e) -> CA D9 55
	ld hl, $0422 ; 91541 (24:5541) -> 21 22 04
	scall PrintTextWithNPCName ; 91544 (24:5544) -> CD A9 44
	ld hl, $003c ; 91547 (24:5547) -> 21 3C 00
	scall ScriptSleep ; 9154A (24:554a) -> CD 8F 46
	ld a, $07 ; 9154D (24:554d) -> 3E 07
	scall FacePlayer ; 9154F (24:554f) -> CD 4B 44
	ld hl, $0413 ; 91552 (24:5552) -> 21 13 04
	scall PrintTextWithNPCName ; 91555 (24:5555) -> CD A9 44
	ld a, $72 ; 91558 (24:5558) -> 3E 72
	scall Func_80e7d ; 9155A (24:555a) -> CD 7D 4E
	cp $01 ; 9155D (24:555d) -> FE 01
	jp nz, label_915d0 ; 9155F (24:555f) -> C2 D0 55
	ld hl, $0291 ; 91562 (24:5562) -> 21 91 02
	scall PrintTextWithNPCName ; 91565 (24:5565) -> CD A9 44
	ld hl, $0400 ; 91568 (24:5568) -> 21 00 04
	scall PrintTextWithYesNoBox ; 9156B (24:556b) -> CD BA 44
	or a ; 9156E (24:556e) -> B7
	jp nz, label_915b1 ; 9156F (24:556f) -> C2 B1 55
	ld a, $68 ; 91572 (24:5572) -> 3E 68
	scall PlaySFX ; 91574 (24:5574) -> CD FE 4E
	ld hl, $0429 ; 91577 (24:5577) -> 21 29 04
	scall PrintTextWithNPCName ; 9157A (24:557a) -> CD A9 44
	ld e, $00 ; 9157D (24:557d) -> 1E 00
	ld a, $07 ; 9157F (24:557f) -> 3E 07
	scall SpriteFace ; 91581 (24:5581) -> CD 95 40
	ld hl, sp+$01 ; 91584 (24:5584) -> F8 01
	ld l, [hl] ; 91586 (24:5586) -> 6E
	ld h, $00 ; 91587 (24:5587) -> 26 00
	ld de, $0b00 ; 91589 (24:5589) -> 11 00 0B
	add hl, de ; 9158C (24:558c) -> 19
	scall Func_80488 ; 9158D (24:558d) -> CD 88 44
	ld a, l ; 91590 (24:5590) -> 7D
	push af ; 91591 (24:5591) -> F5
	ld c, $00 ; 91592 (24:5592) -> 0E 00
	ld e, $01 ; 91594 (24:5594) -> 1E 01
	ld hl, sp+$03 ; 91596 (24:5596) -> F8 03
	ld a, [hl] ; 91598 (24:5598) -> 7E
	scall GiveRobot ; 91599 (24:5599) -> CD 87 4D
	pop af ; 9159C (24:559c) -> F1
	ld c, a ; 9159D (24:559d) -> 4F
	ld e, $00 ; 9159E (24:559e) -> 1E 00
	ld a, $7c ; 915A0 (24:55a0) -> 3E 7C
	scall GiveRobot ; 915A2 (24:55a2) -> CD 87 4D
	ld a, $0c ; 915A5 (24:55a5) -> 3E 0C
	ld [wc796], a ; 915A7 (24:55a7) -> EA 96 C7
	ld hl, sp+$00 ; 915AA (24:55aa) -> F8 00
	ld [hl], $01 ; 915AC (24:55ac) -> 36 01
	jp label_915cd ; 915AE (24:55ae) -> C3 CD 55
label_915b1:
	ld a, $69 ; 915B1 (24:55b1) -> 3E 69
	scall PlaySFX ; 915B3 (24:55b3) -> CD FE 4E
	ld hl, $0407 ; 915B6 (24:55b6) -> 21 07 04
	scall PrintTextWithNPCName ; 915B9 (24:55b9) -> CD A9 44
	ld hl, $001e ; 915BC (24:55bc) -> 21 1E 00
	scall ScriptSleep ; 915BF (24:55bf) -> CD 8F 46
	ld e, $00 ; 915C2 (24:55c2) -> 1E 00
	ld hl, sp+$03 ; 915C4 (24:55c4) -> F8 03
	ld a, [hl] ; 915C6 (24:55c6) -> 7E
	scall SpriteFace ; 915C7 (24:55c7) -> CD 95 40
	jp label_9176c ; 915CA (24:55ca) -> C3 6C 57
label_915cd:
	jp label_915d9 ; 915CD (24:55cd) -> C3 D9 55
label_915d0:
	ld hl, $046e ; 915D0 (24:55d0) -> 21 6E 04
	scall PrintTextStandard ; 915D3 (24:55d3) -> CD 98 44
	jp label_9176c ; 915D6 (24:55d6) -> C3 6C 57
label_915d9:
	jp label_916a9 ; 915D9 (24:55d9) -> C3 A9 56
label_915dc:
	ld a, $13 ; 915DC (24:55dc) -> 3E 13
	scall Func_80e6d ; 915DE (24:55de) -> CD 6D 4E
	ld hl, sp+$01 ; 915E1 (24:55e1) -> F8 01
	ld [hl], a ; 915E3 (24:55e3) -> 77
	cp $ff ; 915E4 (24:55e4) -> FE FF
	jp nz, label_915f6 ; 915E6 (24:55e6) -> C2 F6 55
	ld a, $72 ; 915E9 (24:55e9) -> 3E 72
	scall Func_80e6d ; 915EB (24:55eb) -> CD 6D 4E
	ld hl, sp+$01 ; 915EE (24:55ee) -> F8 01
	ld [hl], a ; 915F0 (24:55f0) -> 77
	cp $ff ; 915F1 (24:55f1) -> FE FF
	jp z, label_916a9 ; 915F3 (24:55f3) -> CA A9 56
label_915f6:
	ld a, $07 ; 915F6 (24:55f6) -> 3E 07
	scall FacePlayer ; 915F8 (24:55f8) -> CD 4B 44
	ld a, [wc796] ; 915FB (24:55fb) -> FA 96 C7
	cp $08 ; 915FE (24:55fe) -> FE 08
	jp z, label_91684 ; 91600 (24:5600) -> CA 84 56
	cp $06 ; 91603 (24:5603) -> FE 06
	jp z, label_91684 ; 91605 (24:5605) -> CA 84 56
	cp $0a ; 91608 (24:5608) -> FE 0A
	jp z, label_91675 ; 9160A (24:560a) -> CA 75 56
	cp $05 ; 9160D (24:560d) -> FE 05
	jp z, label_91675 ; 9160F (24:560f) -> CA 75 56
	cp $0c ; 91612 (24:5612) -> FE 0C
	jp z, label_91666 ; 91614 (24:5614) -> CA 66 56
	cp $04 ; 91617 (24:5617) -> FE 04
	jp z, label_91666 ; 91619 (24:5619) -> CA 66 56
	cp $0d ; 9161C (24:561c) -> FE 0D
	jp z, label_91657 ; 9161E (24:561e) -> CA 57 56
	cp $03 ; 91621 (24:5621) -> FE 03
	jp z, label_91657 ; 91623 (24:5623) -> CA 57 56
	cp $07 ; 91626 (24:5626) -> FE 07
	jp z, label_91648 ; 91628 (24:5628) -> CA 48 56
	or a ; 9162B (24:562b) -> B7
	jp z, label_91648 ; 9162C (24:562c) -> CA 48 56
	cp $09 ; 9162F (24:562f) -> FE 09
	jp z, label_91639 ; 91631 (24:5631) -> CA 39 56
	cp $01 ; 91634 (24:5634) -> FE 01
	jp nz, label_91693 ; 91636 (24:5636) -> C2 93 56
label_91639:
	ld hl, $0140 ; 91639 (24:5639) -> 21 40 01
	scall PrintTextStandard ; 9163C (24:563c) -> CD 98 44
	ld hl, $034d ; 9163F (24:563f) -> 21 4D 03
	scall PrintTextStandard ; 91642 (24:5642) -> CD 98 44
	jp label_91699 ; 91645 (24:5645) -> C3 99 56
label_91648:
	ld hl, $0140 ; 91648 (24:5648) -> 21 40 01
	scall PrintTextStandard ; 9164B (24:564b) -> CD 98 44
	ld hl, $034b ; 9164E (24:564e) -> 21 4B 03
	scall PrintTextStandard ; 91651 (24:5651) -> CD 98 44
	jp label_91699 ; 91654 (24:5654) -> C3 99 56
label_91657:
	ld hl, $0140 ; 91657 (24:5657) -> 21 40 01
	scall PrintTextStandard ; 9165A (24:565a) -> CD 98 44
	ld hl, $020a ; 9165D (24:565d) -> 21 0A 02
	scall PrintTextStandard ; 91660 (24:5660) -> CD 98 44
	jp label_91699 ; 91663 (24:5663) -> C3 99 56
label_91666:
	ld hl, $0140 ; 91666 (24:5666) -> 21 40 01
	scall PrintTextStandard ; 91669 (24:5669) -> CD 98 44
	ld hl, $0218 ; 9166C (24:566c) -> 21 18 02
	scall PrintTextStandard ; 9166F (24:566f) -> CD 98 44
	jp label_91699 ; 91672 (24:5672) -> C3 99 56
label_91675:
	ld hl, $0140 ; 91675 (24:5675) -> 21 40 01
	scall PrintTextStandard ; 91678 (24:5678) -> CD 98 44
	ld hl, $0241 ; 9167B (24:567b) -> 21 41 02
	scall PrintTextStandard ; 9167E (24:567e) -> CD 98 44
	jp label_91699 ; 91681 (24:5681) -> C3 99 56
label_91684:
	ld hl, $0140 ; 91684 (24:5684) -> 21 40 01
	scall PrintTextStandard ; 91687 (24:5687) -> CD 98 44
	ld hl, $0244 ; 9168A (24:568a) -> 21 44 02
	scall PrintTextStandard ; 9168D (24:568d) -> CD 98 44
	jp label_91699 ; 91690 (24:5690) -> C3 99 56
label_91693:
	ld hl, $0413 ; 91693 (24:5693) -> 21 13 04
	scall PrintTextWithNPCName ; 91696 (24:5696) -> CD A9 44
label_91699:
	ld hl, $003c ; 91699 (24:5699) -> 21 3C 00
	scall ScriptSleep ; 9169C (24:569c) -> CD 8F 46
	ld e, $00 ; 9169F (24:569f) -> 1E 00
	ld a, $07 ; 916A1 (24:56a1) -> 3E 07
	scall SpriteFace ; 916A3 (24:56a3) -> CD 95 40
	jp label_9176c ; 916A6 (24:56a6) -> C3 6C 57
label_916a9:
	ld hl, sp+$00 ; 916A9 (24:56a9) -> F8 00
	ld a, [hl] ; 916AB (24:56ab) -> 7E
	cp $ff ; 916AC (24:56ac) -> FE FF
	jp nz, label_9176c ; 916AE (24:56ae) -> C2 6C 57
	ld a, [wc796] ; 916B1 (24:56b1) -> FA 96 C7
	cp $0c ; 916B4 (24:56b4) -> FE 0C
	jp nc, label_916ee ; 916B6 (24:56b6) -> D2 EE 56
	ld a, [wc796] ; 916B9 (24:56b9) -> FA 96 C7
	cp $03 ; 916BC (24:56bc) -> FE 03
	jp c, label_916ee ; 916BE (24:56be) -> DA EE 56
	ld hl, $0422 ; 916C1 (24:56c1) -> 21 22 04
	scall PrintTextWithNPCName ; 916C4 (24:56c4) -> CD A9 44
	ld hl, $003c ; 916C7 (24:56c7) -> 21 3C 00
	scall ScriptSleep ; 916CA (24:56ca) -> CD 8F 46
	ld a, $07 ; 916CD (24:56cd) -> 3E 07
	scall FacePlayer ; 916CF (24:56cf) -> CD 4B 44
	ld hl, $0413 ; 916D2 (24:56d2) -> 21 13 04
	scall PrintTextWithNPCName ; 916D5 (24:56d5) -> CD A9 44
	ld hl, $0428 ; 916D8 (24:56d8) -> 21 28 04
	scall PrintTextWithNPCName ; 916DB (24:56db) -> CD A9 44
	ld hl, $001e ; 916DE (24:56de) -> 21 1E 00
	scall ScriptSleep ; 916E1 (24:56e1) -> CD 8F 46
	ld e, $00 ; 916E4 (24:56e4) -> 1E 00
	ld a, $07 ; 916E6 (24:56e6) -> 3E 07
	scall SpriteFace ; 916E8 (24:56e8) -> CD 95 40
	jp label_9176c ; 916EB (24:56eb) -> C3 6C 57
label_916ee:
	ld a, [wc796] ; 916EE (24:56ee) -> FA 96 C7
	cp $0f ; 916F1 (24:56f1) -> FE 0F
	jp nz, label_9171e ; 916F3 (24:56f3) -> C2 1E 57
	ld hl, $0422 ; 916F6 (24:56f6) -> 21 22 04
	scall PrintTextWithNPCName ; 916F9 (24:56f9) -> CD A9 44
	ld hl, $003c ; 916FC (24:56fc) -> 21 3C 00
	scall ScriptSleep ; 916FF (24:56ff) -> CD 8F 46
	ld a, $07 ; 91702 (24:5702) -> 3E 07
	scall FacePlayer ; 91704 (24:5704) -> CD 4B 44
	ld hl, $0413 ; 91707 (24:5707) -> 21 13 04
	scall PrintTextWithNPCName ; 9170A (24:570a) -> CD A9 44
	ld hl, $001e ; 9170D (24:570d) -> 21 1E 00
	scall ScriptSleep ; 91710 (24:5710) -> CD 8F 46
	ld e, $00 ; 91713 (24:5713) -> 1E 00
	ld hl, sp+$03 ; 91715 (24:5715) -> F8 03
	ld a, [hl] ; 91717 (24:5717) -> 7E
	scall SpriteFace ; 91718 (24:5718) -> CD 95 40
	jp label_9176c ; 9171B (24:571b) -> C3 6C 57
label_9171e:
	ld a, [wc796] ; 9171E (24:571e) -> FA 96 C7
	cp $0c ; 91721 (24:5721) -> FE 0C
	jp c, label_91742 ; 91723 (24:5723) -> DA 42 57
	ld a, $07 ; 91726 (24:5726) -> 3E 07
	scall FacePlayer ; 91728 (24:5728) -> CD 4B 44
	ld hl, $042b ; 9172B (24:572b) -> 21 2B 04
	scall PrintTextWithNPCName ; 9172E (24:572e) -> CD A9 44
	ld hl, $001e ; 91731 (24:5731) -> 21 1E 00
	scall ScriptSleep ; 91734 (24:5734) -> CD 8F 46
	ld e, $00 ; 91737 (24:5737) -> 1E 00
	ld hl, sp+$03 ; 91739 (24:5739) -> F8 03
	ld a, [hl] ; 9173B (24:573b) -> 7E
	scall SpriteFace ; 9173C (24:573c) -> CD 95 40
	jp label_9176c ; 9173F (24:573f) -> C3 6C 57
label_91742:
	ld hl, $0422 ; 91742 (24:5742) -> 21 22 04
	scall PrintTextWithNPCName ; 91745 (24:5745) -> CD A9 44
	ld hl, $003c ; 91748 (24:5748) -> 21 3C 00
	scall ScriptSleep ; 9174B (24:574b) -> CD 8F 46
	ld a, $07 ; 9174E (24:574e) -> 3E 07
	scall FacePlayer ; 91750 (24:5750) -> CD 4B 44
	ld hl, $0413 ; 91753 (24:5753) -> 21 13 04
	scall PrintTextWithNPCName ; 91756 (24:5756) -> CD A9 44
	ld hl, $01e3 ; 91759 (24:5759) -> 21 E3 01
	scall PrintTextWithNPCName ; 9175C (24:575c) -> CD A9 44
	ld hl, $001e ; 9175F (24:575f) -> 21 1E 00
	scall ScriptSleep ; 91762 (24:5762) -> CD 8F 46
	ld e, $00 ; 91765 (24:5765) -> 1E 00
	ld a, $07 ; 91767 (24:5767) -> 3E 07
	scall SpriteFace ; 91769 (24:5769) -> CD 95 40
label_9176c:
	pop bc ; 9176C (24:576c) -> C1
	pop bc ; 9176D (24:576d) -> C1
	ret  ; 9176E (24:576e) -> C9

Data_9176f:
	db $04, $00, $01, $01, $08, $00, $0a, $09, $0a, $08, $2e

Data_9177a:
	db $29, $04, $17, $01, $13

Data_9177f:
IF DEF(SUN)
	db $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	db $00, $01, $09, $18, $11, $10, $12, $02, $1f, $1e, $18, $0d, $08, $00
	db $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ELIF DEF(STAR)
	db $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	db $00, $01, $09, $18, $8b, $10, $12, $77, $05, $05, $00, $0d, $08, $00
	db $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ENDC

Data_917a9:
IF DEF(SUN)
	db $00, $01, $09, $18, $0c, $10, $12, $77, $05, $17, $00, $03, $0a, $00
	db $00, $01, $09, $18, $07, $11, $13, $45, $06, $06, $11, $03, $06, $00
	db $00, $01, $09, $18, $1d, $12, $14, $51, $1f, $17, $08, $0c, $05, $00
	db $00, $01, $09, $18, $0d, $13, $15, $77, $01, $05, $00, $03, $04, $00
ELIF DEF(STAR)
	db $00, $01, $09, $18, $09, $10, $12, $77, $03, $0f, $00, $03, $0a, $00
	db $00, $01, $09, $18, $58, $11, $13, $03, $1f, $17, $11, $03, $06, $00
	db $00, $01, $09, $18, $39, $12, $14, $1a, $0e, $0b, $00, $03, $05, $00
	db $00, $01, $09, $18, $0a, $13, $15, $77, $04, $0f, $00, $03, $04, $00
ENDC

Data_917e1:
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_918f5, NULL
	person_event $00, $04, $02, $15, $01, $01, $03, $04, $00, Func_9198b, NULL
	person_event $08, $04, $00, $16, $01, $01, $01, $04, $00, Func_91b0c, NULL
	person_event $18, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL
	person_event $11, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL

Data_91827:
	db $04, $00, $01, $01, $06, $00, $10, $09, $10, $0a, $2e

Data_91832:
	db $24, $04, $17

Data_91835:
	db $24, $04, $17, $00, $00

Data_9183a:
	person_event $00, $04, $04, $16, $01, $01, $01, $04, $00, Func_806dd_24, Data_91832
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_91ae0, NULL

Func_91856:: ; 91856
	ld a, [wBackupMapGroup] ; 91856 (24:5856) -> FA DF C7
	cp $06 ; 91859 (24:5859) -> FE 06
	jp nz, label_918a0 ; 9185B (24:585b) -> C2 A0 58
	ld a, [wBackupMapNumber] ; 9185E (24:585e) -> FA E0 C7
	or a ; 91861 (24:5861) -> B7
	jp nz, label_918a0 ; 91862 (24:5862) -> C2 A0 58
	ld e, $01 ; 91865 (24:5865) -> 1E 01
	ld hl, Data_91827 ; 91867 (24:5867) -> 21 27 58
	scall LoadWarps ; 9186A (24:586a) -> CD 3A 40
	ld e, $01 ; 9186D (24:586d) -> 1E 01
	ld hl, Data_91835 ; 9186F (24:586f) -> 21 35 58
	scall Func_80ce7 ; 91872 (24:5872) -> CD E7 4C
	ld a, $03 ; 91875 (24:5875) -> 3E 03
	scall Func_80d01 ; 91877 (24:5877) -> CD 01 4D
	ld e, $04 ; 9187A (24:587a) -> 1E 04
	ld hl, Data_917a9 ; 9187C (24:587c) -> 21 A9 57
	scall LoadEncounters ; 9187F (24:587f) -> CD 24 4D
	ld e, $02 ; 91882 (24:5882) -> 1E 02
	ld hl, Data_9183a ; 91884 (24:5884) -> 21 3A 58
	scall LoadMapObjects ; 91887 (24:5887) -> CD FB 40
	ld a, $05 ; 9188A (24:588a) -> 3E 05
	ld [wc7e2], a ; 9188C (24:588c) -> EA E2 C7
	ld a, $08 ; 9188F (24:588f) -> 3E 08
	scall PlayMusic ; 91891 (24:5891) -> CD E6 4E
	scall Func_8001c ; 91894 (24:5894) -> CD 1C 40
	ld hl, $01b5 ; 91897 (24:5897) -> 21 B5 01
	scall LandmarkSign ; 9189A (24:589a) -> CD 72 4F
	jp label_918f4 ; 9189D (24:589d) -> C3 F4 58
label_918a0:
	ld e, $01 ; 918A0 (24:58a0) -> 1E 01
	ld hl, Data_9176f ; 918A2 (24:58a2) -> 21 6F 57
	scall LoadWarps ; 918A5 (24:58a5) -> CD 3A 40
	ld e, $01 ; 918A8 (24:58a8) -> 1E 01
	ld hl, Data_9177a ; 918AA (24:58aa) -> 21 7A 57
	scall Func_80ce7 ; 918AD (24:58ad) -> CD E7 4C
	ld a, $03 ; 918B0 (24:58b0) -> 3E 03
	scall Func_80d01 ; 918B2 (24:58b2) -> CD 01 4D
	ld e, $03 ; 918B5 (24:58b5) -> 1E 03
	ld hl, Data_9177f ; 918B7 (24:58b7) -> 21 7F 57
	scall LoadEncounters ; 918BA (24:58ba) -> CD 24 4D
	ld a, $08 ; 918BD (24:58bd) -> 3E 08
	ld [wBackupMapGroup], a ; 918BF (24:58bf) -> EA DF C7
	xor a ; 918C2 (24:58c2) -> AF
	ld [wBackupMapNumber], a ; 918C3 (24:58c3) -> EA E0 C7
	ld a, $06 ; 918C6 (24:58c6) -> 3E 06
	ld [wc7e2], a ; 918C8 (24:58c8) -> EA E2 C7
	ld e, $05 ; 918CB (24:58cb) -> 1E 05
	ld hl, Data_917e1 ; 918CD (24:58cd) -> 21 E1 57
	scall LoadMapObjects ; 918D0 (24:58d0) -> CD FB 40
	ld a, $01 ; 918D3 (24:58d3) -> 3E 01
	scall LoadPlayerSprite ; 918D5 (24:58d5) -> CD C6 4C
	ld a, $08 ; 918D8 (24:58d8) -> 3E 08
	scall PlayMusic ; 918DA (24:58da) -> CD E6 4E
	ld e, $00 ; 918DD (24:58dd) -> 1E 00
	ld a, $03 ; 918DF (24:58df) -> 3E 03
	scall SetPersonVisibilityState ; 918E1 (24:58e1) -> CD 3D 41
	ld e, $00 ; 918E4 (24:58e4) -> 1E 00
	ld a, $04 ; 918E6 (24:58e6) -> 3E 04
	scall SetPersonVisibilityState ; 918E8 (24:58e8) -> CD 3D 41
	scall Func_8001c ; 918EB (24:58eb) -> CD 1C 40
	ld hl, $01b5 ; 918EE (24:58ee) -> 21 B5 01
	scall LandmarkSign ; 918F1 (24:58f1) -> CD 72 4F
label_918f4:
	ret  ; 918F4 (24:58f4) -> C9

Func_918f5:
	ld a, e ; 918F5 (24:58f5) -> 7B
	or a ; 918F6 (24:58f6) -> B7
	jp nz, label_91980 ; 918F7 (24:58f7) -> C2 80 59
	ld a, $0f ; 918FA (24:58fa) -> 3E 0F
	scall Func_80e6d ; 918FC (24:58fc) -> CD 6D 4E
	cp $ff ; 918FF (24:58ff) -> FE FF
	jp nz, label_91922 ; 91901 (24:5901) -> C2 22 59
	ld a, $41 ; 91904 (24:5904) -> 3E 41
	scall Func_80e6d ; 91906 (24:5906) -> CD 6D 4E
	cp $ff ; 91909 (24:5909) -> FE FF
	jp nz, label_91922 ; 9190B (24:590b) -> C2 22 59
	ld a, $50 ; 9190E (24:590e) -> 3E 50
	scall Func_80e6d ; 91910 (24:5910) -> CD 6D 4E
	cp $ff ; 91913 (24:5913) -> FE FF
	jp nz, label_91922 ; 91915 (24:5915) -> C2 22 59
	ld a, $64 ; 91918 (24:5918) -> 3E 64
	scall Func_80e6d ; 9191A (24:591a) -> CD 6D 4E
	cp $ff ; 9191D (24:591d) -> FE FF
	jp z, label_9197a ; 9191F (24:591f) -> CA 7A 59
label_91922:
	ld a, [wc790] ; 91922 (24:5922) -> FA 90 C7
	or a ; 91925 (24:5925) -> B7
	jp z, label_91971 ; 91926 (24:5926) -> CA 71 59
	ld a, [wc790] ; 91929 (24:5929) -> FA 90 C7
	cp $06 ; 9192C (24:592c) -> FE 06
	jp nc, label_91971 ; 9192E (24:592e) -> D2 71 59
	ld hl, $032d ; 91931 (24:5931) -> 21 2D 03
	scall PrintTextWithYesNoBox ; 91934 (24:5934) -> CD BA 44
	or a ; 91937 (24:5937) -> B7
	jp nz, label_9196e ; 91938 (24:5938) -> C2 6E 59
	xor a ; 9193B (24:593b) -> AF
	scall PlayMusic ; 9193C (24:593c) -> CD E6 4E
	ld a, $0a ; 9193F (24:593f) -> 3E 0A
	scall PlayMusic ; 91941 (24:5941) -> CD E6 4E
	xor a ; 91944 (24:5944) -> AF
	scall Func_80653 ; 91945 (24:5945) -> CD 53 46
	ld c, $01 ; 91948 (24:5948) -> 0E 01
	ld e, $01 ; 9194A (24:594a) -> 1E 01
	ld a, $0b ; 9194C (24:594c) -> 3E 0B
	scall LoadEmote ; 9194E (24:594e) -> CD 76 41
	scall WaitEmote ; 91951 (24:5951) -> CD D5 41
	scall HideEmote ; 91954 (24:5954) -> CD 8B 41
	ld a, $04 ; 91957 (24:5957) -> 3E 04
	scall LoadPlayerSprite ; 91959 (24:5959) -> CD C6 4C
	ld a, $02 ; 9195C (24:595c) -> 3E 02
	scall PlayerFace ; 9195E (24:595e) -> CD 77 46
	ld l, $04 ; 91961 (24:5961) -> 2E 04
	push hl ; 91963 (24:5963) -> E5
	ld c, $2e ; 91964 (24:5964) -> 0E 2E
	ld e, $01 ; 91966 (24:5966) -> 1E 01
	ld a, $1e ; 91968 (24:5968) -> 3E 1E
	scall Func_80dff ; 9196A (24:596a) -> CD FF 4D
	pop bc ; 9196D (24:596d) -> C1
label_9196e:
	jp label_91977 ; 9196E (24:596e) -> C3 77 59
label_91971:
	ld hl, $0377 ; 91971 (24:5971) -> 21 77 03
	scall PrintTextStandard ; 91974 (24:5974) -> CD 98 44
label_91977:
	jp label_91980 ; 91977 (24:5977) -> C3 80 59
label_9197a:
	ld hl, $0376 ; 9197A (24:597a) -> 21 76 03
	scall PrintTextStandard ; 9197D (24:597d) -> CD 98 44
label_91980:
	ret  ; 91980 (24:5980) -> C9

Data_91981:
	db $01, $16, $02, $16, $ff, $ff

Data_91987:
	db $01, $16, $ff, $ff

Func_9198b:
	ld a, e ; 9198B (24:598b) -> 7B
	or a ; 9198C (24:598c) -> B7
	jp nz, label_91adf ; 9198D (24:598d) -> C2 DF 5A
	ld a, [wPlayerFacing] ; 91990 (24:5990) -> FA 38 C8
	cp $01 ; 91993 (24:5993) -> FE 01
	jp nz, label_919a9 ; 91995 (24:5995) -> C2 A9 59
	ld c, $01 ; 91998 (24:5998) -> 0E 01
	ld de, Data_91981 ; 9199A (24:599a) -> 11 81 59
	ld a, $24 ; 9199D (24:599d) -> 3E 24
	scall MovePlayer ; 9199F (24:599f) -> CD 3E 46
	scall WaitNPCStep ; 919A2 (24:59a2) -> CD 0C 42
	xor a ; 919A5 (24:59a5) -> AF
	scall PlayerFace ; 919A6 (24:59a6) -> CD 77 46
label_919a9:
	ld a, $01 ; 919A9 (24:59a9) -> 3E 01
	scall FacePlayer ; 919AB (24:59ab) -> CD 4B 44
	ld hl, $0039 ; 919AE (24:59ae) -> 21 39 00
	scall CheckEventFlag ; 919B1 (24:59b1) -> CD 2E 46
	cp $01 ; 919B4 (24:59b4) -> FE 01
	jp nz, label_91ad9 ; 919B6 (24:59b6) -> C2 D9 5A
	ld hl, $0020 ; 919B9 (24:59b9) -> 21 20 00
	scall CheckEventFlag ; 919BC (24:59bc) -> CD 2E 46
	or a ; 919BF (24:59bf) -> B7
	jp nz, label_91ad9 ; 919C0 (24:59c0) -> C2 D9 5A
	ld hl, $003a ; 919C3 (24:59c3) -> 21 3A 00
	scall CheckEventFlag ; 919C6 (24:59c6) -> CD 2E 46
	cp $01 ; 919C9 (24:59c9) -> FE 01
	jp nz, label_91ad0 ; 919CB (24:59cb) -> C2 D0 5A
	ld hl, $0047 ; 919CE (24:59ce) -> 21 47 00
	scall CheckEventFlag ; 919D1 (24:59d1) -> CD 2E 46
	or a ; 919D4 (24:59d4) -> B7
	jp nz, label_91ac7 ; 919D5 (24:59d5) -> C2 C7 5A
	ld a, $1f ; 919D8 (24:59d8) -> 3E 1F
	scall Func_80e6d ; 919DA (24:59da) -> CD 6D 4E
	cp $ff ; 919DD (24:59dd) -> FE FF
	jp z, label_91abe ; 919DF (24:59df) -> CA BE 5A
	push af ; 919E2 (24:59e2) -> F5
	ld hl, $009f ; 919E3 (24:59e3) -> 21 9F 00
	scall PrintTextWithNPCName ; 919E6 (24:59e6) -> CD A9 44
	ld hl, $001e ; 919E9 (24:59e9) -> 21 1E 00
	scall ScriptSleep ; 919EC (24:59ec) -> CD 8F 46
	xor a ; 919EF (24:59ef) -> AF
	scall PlayMusic ; 919F0 (24:59f0) -> CD E6 4E
	ld a, $19 ; 919F3 (24:59f3) -> 3E 19
	scall PlayMusic ; 919F5 (24:59f5) -> CD E6 4E
	ld e, $01 ; 919F8 (24:59f8) -> 1E 01
	ld a, $03 ; 919FA (24:59fa) -> 3E 03
	scall SetPersonVisibilityState ; 919FC (24:59fc) -> CD 3D 41
	ld hl, $001e ; 919FF (24:59ff) -> 21 1E 00
	scall ScriptSleep ; 91A02 (24:5a02) -> CD 8F 46
	ld c, $01 ; 91A05 (24:5a05) -> 0E 01
	ld e, $01 ; 91A07 (24:5a07) -> 1E 01
	ld a, $29 ; 91A09 (24:5a09) -> 3E 29
	scall LoadEmote ; 91A0B (24:5a0b) -> CD 76 41
	ld e, $15 ; 91A0E (24:5a0e) -> 1E 15
	ld a, $02 ; 91A10 (24:5a10) -> 3E 02
	scall MoveEmote ; 91A12 (24:5a12) -> CD E4 41
	ld e, $00 ; 91A15 (24:5a15) -> 1E 00
	ld a, $01 ; 91A17 (24:5a17) -> 3E 01
	scall SetPersonVisibilityState ; 91A19 (24:5a19) -> CD 3D 41
	scall WaitEmote ; 91A1C (24:5a1c) -> CD D5 41
	ld e, $00 ; 91A1F (24:5a1f) -> 1E 00
	ld a, $03 ; 91A21 (24:5a21) -> 3E 03
	scall SetPersonVisibilityState ; 91A23 (24:5a23) -> CD 3D 41
	ld hl, $001e ; 91A26 (24:5a26) -> 21 1E 00
	scall ScriptSleep ; 91A29 (24:5a29) -> CD 8F 46
	ld a, $68 ; 91A2C (24:5a2c) -> 3E 68
	scall PlaySFX ; 91A2E (24:5a2e) -> CD FE 4E
	ld e, $01 ; 91A31 (24:5a31) -> 1E 01
	ld a, $04 ; 91A33 (24:5a33) -> 3E 04
	scall SetPersonVisibilityState ; 91A35 (24:5a35) -> CD 3D 41
	ld hl, $001e ; 91A38 (24:5a38) -> 21 1E 00
	scall ScriptSleep ; 91A3B (24:5a3b) -> CD 8F 46
	ld e, $01 ; 91A3E (24:5a3e) -> 1E 01
	ld a, $01 ; 91A40 (24:5a40) -> 3E 01
	scall SetPersonVisibilityState ; 91A42 (24:5a42) -> CD 3D 41
	ld hl, $0001 ; 91A45 (24:5a45) -> 21 01 00
	scall ScriptSleep ; 91A48 (24:5a48) -> CD 8F 46
	scall HideEmote ; 91A4B (24:5a4b) -> CD 8B 41
	ld hl, $001e ; 91A4E (24:5a4e) -> 21 1E 00
	scall ScriptSleep ; 91A51 (24:5a51) -> CD 8F 46
	ld c, $01 ; 91A54 (24:5a54) -> 0E 01
	ld de, Data_91987 ; 91A56 (24:5a56) -> 11 87 59
	ld a, $24 ; 91A59 (24:5a59) -> 3E 24
	scall MovePlayer ; 91A5B (24:5a5b) -> CD 3E 46
	scall WaitNPCStep ; 91A5E (24:5a5e) -> CD 0C 42
	ld hl, $001e ; 91A61 (24:5a61) -> 21 1E 00
	scall ScriptSleep ; 91A64 (24:5a64) -> CD 8F 46
	xor a ; 91A67 (24:5a67) -> AF
	scall PlayerFace ; 91A68 (24:5a68) -> CD 77 46
	call WaitVideoTransfer ; 91A6B (24:5a6b) -> CD D4 14
	pop af ; 91A6E (24:5a6e) -> F1
	push af ; 91A6F (24:5a6f) -> F5
	ld l, a ; 91A70 (24:5a70) -> 6F
	ld h, $00 ; 91A71 (24:5a71) -> 26 00
	ld de, $0b00 ; 91A73 (24:5a73) -> 11 00 0B
	add hl, de ; 91A76 (24:5a76) -> 19
	scall Func_80488 ; 91A77 (24:5a77) -> CD 88 44
	pop af ; 91A7A (24:5a7a) -> F1
	push hl ; 91A7B (24:5a7b) -> E5
	ld e, $01 ; 91A7C (24:5a7c) -> 1E 01
	ld c, $00 ; 91A7E (24:5a7e) -> 0E 00
	scall GiveRobot ; 91A80 (24:5a80) -> CD 87 4D
	pop hl ; 91A83 (24:5a83) -> E1
	ld c, l ; 91A84 (24:5a84) -> 4D
	ld e, $00 ; 91A85 (24:5a85) -> 1E 00
	ld a, $20 ; 91A87 (24:5a87) -> 3E 20
	scall GiveRobot ; 91A89 (24:5a89) -> CD 87 4D
	ld e, $01 ; 91A8C (24:5a8c) -> 1E 01
	ld hl, $0047 ; 91A8E (24:5a8e) -> 21 47 00
	scall EventFlagAction ; 91A91 (24:5a91) -> CD 1B 46
	ld hl, $001e ; 91A94 (24:5a94) -> 21 1E 00
	scall ScriptSleep ; 91A97 (24:5a97) -> CD 8F 46
	ld a, $2a ; 91A9A (24:5a9a) -> 3E 2A
	scall PlaySFX ; 91A9C (24:5a9c) -> CD FE 4E
	ld e, $00 ; 91A9F (24:5a9f) -> 1E 00
	ld a, $04 ; 91AA1 (24:5aa1) -> 3E 04
	scall SetPersonVisibilityState ; 91AA3 (24:5aa3) -> CD 3D 41
	ld hl, $038d ; 91AA6 (24:5aa6) -> 21 8D 03
	scall PrintTextStandard ; 91AA9 (24:5aa9) -> CD 98 44
	ld hl, $00a0 ; 91AAC (24:5aac) -> 21 A0 00
	scall PrintTextWithNPCName ; 91AAF (24:5aaf) -> CD A9 44
	xor a ; 91AB2 (24:5ab2) -> AF
	scall PlayMusic ; 91AB3 (24:5ab3) -> CD E6 4E
	ld a, $08 ; 91AB6 (24:5ab6) -> 3E 08
	scall PlayMusic ; 91AB8 (24:5ab8) -> CD E6 4E
	jp label_91ac4 ; 91ABB (24:5abb) -> C3 C4 5A
label_91abe:
	ld hl, $038c ; 91ABE (24:5abe) -> 21 8C 03
	scall PrintTextWithNPCName ; 91AC1 (24:5ac1) -> CD A9 44
label_91ac4:
	jp label_91acd ; 91AC4 (24:5ac4) -> C3 CD 5A
label_91ac7:
	ld hl, $00a0 ; 91AC7 (24:5ac7) -> 21 A0 00
	scall PrintTextWithNPCName ; 91ACA (24:5aca) -> CD A9 44
label_91acd:
	jp label_91ad6 ; 91ACD (24:5acd) -> C3 D6 5A
label_91ad0:
	ld hl, $009d ; 91AD0 (24:5ad0) -> 21 9D 00
	scall PrintTextWithNPCName ; 91AD3 (24:5ad3) -> CD A9 44
label_91ad6:
	jp label_91adf ; 91AD6 (24:5ad6) -> C3 DF 5A
label_91ad9:
	ld hl, $009d ; 91AD9 (24:5ad9) -> 21 9D 00
	scall PrintTextWithNPCName ; 91ADC (24:5adc) -> CD A9 44
label_91adf:
	ret  ; 91ADF (24:5adf) -> C9

Func_91ae0:
	ld a, e ; 91AE0 (24:5ae0) -> 7B
	or a ; 91AE1 (24:5ae1) -> B7
	jp nz, label_91b0b ; 91AE2 (24:5ae2) -> C2 0B 5B
	scall RepairRobots ; 91AE5 (24:5ae5) -> CD E0 42
	xor a ; 91AE8 (24:5ae8) -> AF
	scall PlayMusic ; 91AE9 (24:5ae9) -> CD E6 4E
	ld a, $16 ; 91AEC (24:5aec) -> 3E 16
	scall PlayMusic ; 91AEE (24:5aee) -> CD E6 4E
	ld c, $01 ; 91AF1 (24:5af1) -> 0E 01
	ld e, $02 ; 91AF3 (24:5af3) -> 1E 02
	ld a, $08 ; 91AF5 (24:5af5) -> 3E 08
	scall LoadEmote ; 91AF7 (24:5af7) -> CD 76 41
	scall WaitEmote ; 91AFA (24:5afa) -> CD D5 41
	scall HideEmote ; 91AFD (24:5afd) -> CD 8B 41
	ld hl, $0322 ; 91B00 (24:5b00) -> 21 22 03
	scall PrintTextStandard ; 91B03 (24:5b03) -> CD 98 44
	ld a, $08 ; 91B06 (24:5b06) -> 3E 08
	scall PlayMusic ; 91B08 (24:5b08) -> CD E6 4E
label_91b0b:
	ret  ; 91B0B (24:5b0b) -> C9

Func_91b0c:
	push af ; 91B0C (24:5b0c) -> F5
	ld a, e ; 91B0D (24:5b0d) -> 7B
	or a ; 91B0E (24:5b0e) -> B7
	jp nz, label_91b6b ; 91B0F (24:5b0f) -> C2 6B 5B
	ld hl, sp+$01 ; 91B12 (24:5b12) -> F8 01
	ld a, [hl] ; 91B14 (24:5b14) -> 7E
	scall FacePlayer ; 91B15 (24:5b15) -> CD 4B 44
	ld hl, $010f ; 91B18 (24:5b18) -> 21 0F 01
	scall CheckEventFlag ; 91B1B (24:5b1b) -> CD 2E 46
	or a ; 91B1E (24:5b1e) -> B7
	jp nz, label_91b65 ; 91B1F (24:5b1f) -> C2 65 5B
	ld a, [wc79c] ; 91B22 (24:5b22) -> FA 9C C7
	cp $01 ; 91B25 (24:5b25) -> FE 01
	jp c, label_91b65 ; 91B27 (24:5b27) -> DA 65 5B
	ld hl, $0114 ; 91B2A (24:5b2a) -> 21 14 01
	scall CheckEventFlag ; 91B2D (24:5b2d) -> CD 2E 46
	or a ; 91B30 (24:5b30) -> B7
	jp nz, label_91b65 ; 91B31 (24:5b31) -> C2 65 5B
	ld hl, $009e ; 91B34 (24:5b34) -> 21 9E 00
	scall PrintTextStandard ; 91B37 (24:5b37) -> CD 98 44
	ld hl, $001e ; 91B3A (24:5b3a) -> 21 1E 00
	scall ScriptSleep ; 91B3D (24:5b3d) -> CD 8F 46
	ld hl, $049d ; 91B40 (24:5b40) -> 21 9D 04
	scall PrintTextStandard ; 91B43 (24:5b43) -> CD 98 44
	ld a, $2a ; 91B46 (24:5b46) -> 3E 2A
	scall PlaySFX ; 91B48 (24:5b48) -> CD FE 4E
	ld hl, $049e ; 91B4B (24:5b4b) -> 21 9E 04
	scall PrintTextStandard ; 91B4E (24:5b4e) -> CD 98 44
	ld c, $00 ; 91B51 (24:5b51) -> 0E 00
	ld e, $01 ; 91B53 (24:5b53) -> 1E 01
	ld a, $10 ; 91B55 (24:5b55) -> 3E 10
	scall Func_80d4d ; 91B57 (24:5b57) -> CD 4D 4D
	ld e, $01 ; 91B5A (24:5b5a) -> 1E 01
	ld hl, $010f ; 91B5C (24:5b5c) -> 21 0F 01
	scall EventFlagAction ; 91B5F (24:5b5f) -> CD 1B 46
	jp label_91b6b ; 91B62 (24:5b62) -> C3 6B 5B
label_91b65:
	ld hl, $009e ; 91B65 (24:5b65) -> 21 9E 00
	scall PrintTextStandard ; 91B68 (24:5b68) -> CD 98 44
label_91b6b:
	pop bc ; 91B6B (24:5b6b) -> C1
	ret  ; 91B6C (24:5b6c) -> C9

Data_91b6d:
	db $08, $04, $01, $01, $09, $04, $02, $06, $02, $05, $34
	db $0b, $12, $01, $01, $13, $0b, $06, $06, $06, $05, $2e
	db $0b, $21, $01, $01, $13, $21, $04, $17, $04, $16, $2e
	db $05, $2c, $01, $01, $09, $01, $07, $0e, $06, $0e, $2e
	db $05, $28, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff, $2e

Data_91ba4:
	db $48, $05, $0d, $11, $40, $49, $0e, $22, $11, $43, $4a, $0e, $28, $11, $42

Data_91bb3:
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91caf:
	db $05, $22, $0b, $0d, $1f, $0f, $12, $7c, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91db9:
	db $05, $22, $0b, $0d, $20, $0f, $12, $70, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91ec3:
	db $05, $22, $0b, $0d, $21, $0f, $12, $7d, $17, $00, $00, $03, $0a, $00
	db $05, $22, $0b, $0d, $67, $0f, $12, $77, $05, $13, $00, $0c, $08, $00
	db $05, $22, $0b, $0d, $8b, $0f, $12, $77, $05, $05, $00, $0d, $08, $00
	db $05, $13, $0c, $08, $67, $14, $17, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $13, $0c, $08, $55, $15, $18, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $13, $0c, $08, $7b, $14, $17, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $13, $0c, $08, $7f, $16, $19, $70, $28, $00, $00, $0f, $04, $00
	db $04, $04, $0d, $09, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $04, $04, $0d, $09, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $04, $04, $0d, $09, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $04, $04, $0d, $09, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $0e, $09, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $0e, $09, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $0e, $09, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00
	db $05, $18, $03, $0a, $67, $15, $18, $77, $05, $13, $00, $0e, $0a, $00
	db $05, $18, $03, $0a, $55, $16, $19, $45, $0f, $08, $00, $0f, $08, $00
	db $05, $18, $03, $0a, $7b, $15, $18, $77, $17, $05, $1e, $0e, $07, $00
	db $05, $18, $03, $0a, $7f, $17, $1a, $70, $28, $00, $00, $0f, $04, $00

Data_91fcd:
	db $ba, $02, $ff, $ff

Data_91fd1:
	db $b9, $02, $ff, $ff

Data_91fd5:
	person_event $28, $04, $0f, $13, $01, $01, $02, $04, $00, Func_92211, NULL

Data_91fe3:
	person_event $ff, $00, $0a, $23, $03, $01, $00, $04, $01, Func_92257, NULL
	person_event $ff, $00, $05, $21, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $05, $18, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $0e, $12, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $ff, $00, $0e, $09, $03, $01, $00, $04, $01, Func_9233b, NULL
	person_event $0b, $04, $0e, $0a, $01, $01, $02, $04, $00, Func_92422, NULL
	person_event $29, $04, $10, $0b, $01, $01, $02, $04, $00, Func_924a9, NULL
	person_event $0b, $04, $05, $19, $01, $01, $01, $04, $00, Func_92531, NULL
	person_event $0b, $04, $07, $1a, $01, $01, $02, $04, $00, Func_925b8, NULL
	person_event $28, $0c, $08, $05, $01, $01, $02, $04, $00, Func_9264b, NULL
	person_event $ff, $00, $0a, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fcd
	person_event $ff, $00, $06, $27, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fd1
	person_event $ff, $00, $06, $29, $01, $01, $00, $04, $00, PrintTextFacePlayer_24, Data_91fd1
	person_event $0f, $04, $0f, $2b, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0f, $2b, $01, $01, $02, $04, $00, Func_926ba, NULL
	person_event $0b, $04, $06, $25, $01, $01, $01, $04, $00, Func_927eb, NULL

Func_920c3:: ; 920c3
	ld a, $07 ; 920C3 (24:60c3) -> 3E 07
	ld [wc7e2], a ; 920C5 (24:60c5) -> EA E2 C7
	ld e, $05 ; 920C8 (24:60c8) -> 1E 05
	ld hl, Data_91b6d ; 920CA (24:60ca) -> 21 6D 5B
	scall LoadWarps ; 920CD (24:60cd) -> CD 3A 40
	ld e, $03 ; 920D0 (24:60d0) -> 1E 03
	ld hl, Data_91ba4 ; 920D2 (24:60d2) -> 21 A4 5B
	scall Func_80ce7 ; 920D5 (24:60d5) -> CD E7 4C
	ld e, $11 ; 920D8 (24:60d8) -> 1E 11
	ld hl, Data_91fd5 ; 920DA (24:60da) -> 21 D5 5F
	scall LoadMapObjects ; 920DD (24:60dd) -> CD FB 40
	ld a, $0d ; 920E0 (24:60e0) -> 3E 0D
	scall PlayMusic ; 920E2 (24:60e2) -> CD E6 4E
	ld a, $03 ; 920E5 (24:60e5) -> 3E 03
	scall Func_80d01 ; 920E7 (24:60e7) -> CD 01 4D
	ld a, $1e ; 920EA (24:60ea) -> 3E 1E
	scall Func_80e6d ; 920EC (24:60ec) -> CD 6D 4E
	cp $ff ; 920EF (24:60ef) -> FE FF
	jp nz, label_92147 ; 920F1 (24:60f1) -> C2 47 61
	ld a, $1f ; 920F4 (24:60f4) -> 3E 1F
	scall Func_80e6d ; 920F6 (24:60f6) -> CD 6D 4E
	cp $ff ; 920F9 (24:60f9) -> FE FF
	jp nz, label_92147 ; 920FB (24:60fb) -> C2 47 61
	ld a, $20 ; 920FE (24:60fe) -> 3E 20
	scall Func_80e6d ; 92100 (24:6100) -> CD 6D 4E
	cp $ff ; 92103 (24:6103) -> FE FF
	jp nz, label_92147 ; 92105 (24:6105) -> C2 47 61
	ld a, $21 ; 92108 (24:6108) -> 3E 21
	scall Func_80e6d ; 9210A (24:610a) -> CD 6D 4E
	cp $ff ; 9210D (24:610d) -> FE FF
	jp nz, label_92147 ; 9210F (24:610f) -> C2 47 61
	ld hl, $0039 ; 92112 (24:6112) -> 21 39 00
	scall CheckEventFlag ; 92115 (24:6115) -> CD 2E 46
	or a ; 92118 (24:6118) -> B7
	jp nz, label_92127 ; 92119 (24:6119) -> C2 27 61
	ld e, $13 ; 9211C (24:611c) -> 1E 13
	ld hl, Data_91caf ; 9211E (24:611e) -> 21 AF 5C
	scall LoadEncounters ; 92121 (24:6121) -> CD 24 4D
	jp label_92144 ; 92124 (24:6124) -> C3 44 61
label_92127:
	ld hl, $0047 ; 92127 (24:6127) -> 21 47 00
	scall CheckEventFlag ; 9212A (24:612a) -> CD 2E 46
	or a ; 9212D (24:612d) -> B7
	jp nz, label_9213c ; 9212E (24:612e) -> C2 3C 61
	ld e, $13 ; 92131 (24:6131) -> 1E 13
	ld hl, Data_91db9 ; 92133 (24:6133) -> 21 B9 5D
	scall LoadEncounters ; 92136 (24:6136) -> CD 24 4D
	jp label_92144 ; 92139 (24:6139) -> C3 44 61
label_9213c:
	ld e, $13 ; 9213C (24:613c) -> 1E 13
	ld hl, Data_91ec3 ; 9213E (24:613e) -> 21 C3 5E
	scall LoadEncounters ; 92141 (24:6141) -> CD 24 4D
label_92144:
	jp label_9214f ; 92144 (24:6144) -> C3 4F 61
label_92147:
	ld e, $12 ; 92147 (24:6147) -> 1E 12
	ld hl, Data_91bb3 ; 92149 (24:6149) -> 21 B3 5B
	scall LoadEncounters ; 9214C (24:614c) -> CD 24 4D
label_9214f:
	ld hl, $0047 ; 9214F (24:614f) -> 21 47 00
	scall CheckEventFlag ; 92152 (24:6152) -> CD 2E 46
	cp $01 ; 92155 (24:6155) -> FE 01
	jp nz, label_92180 ; 92157 (24:6157) -> C2 80 61
	ld a, $20 ; 9215A (24:615a) -> 3E 20
	scall Func_80e6d ; 9215C (24:615c) -> CD 6D 4E
	cp $ff ; 9215F (24:615f) -> FE FF
	jp nz, label_92178 ; 92161 (24:6161) -> C2 78 61
	ld a, $21 ; 92164 (24:6164) -> 3E 21
	scall Func_80e6d ; 92166 (24:6166) -> CD 6D 4E
	cp $ff ; 92169 (24:6169) -> FE FF
	jp nz, label_92178 ; 9216B (24:616b) -> C2 78 61
	ld a, $7e ; 9216E (24:616e) -> 3E 7E
	scall Func_80e6d ; 92170 (24:6170) -> CD 6D 4E
	cp $ff ; 92173 (24:6173) -> FE FF
	jp z, label_92180 ; 92175 (24:6175) -> CA 80 61
label_92178:
	ld a, $03 ; 92178 (24:6178) -> 3E 03
	scall LoadPlayerSprite ; 9217A (24:617a) -> CD C6 4C
	jp label_9219a ; 9217D (24:617d) -> C3 9A 61
label_92180:
	ld hl, $0039 ; 92180 (24:6180) -> 21 39 00
	scall CheckEventFlag ; 92183 (24:6183) -> CD 2E 46
	cp $01 ; 92186 (24:6186) -> FE 01
	jp nz, label_9219a ; 92188 (24:6188) -> C2 9A 61
	ld a, $1f ; 9218B (24:618b) -> 3E 1F
	scall Func_80e6d ; 9218D (24:618d) -> CD 6D 4E
	cp $ff ; 92190 (24:6190) -> FE FF
	jp z, label_9219a ; 92192 (24:6192) -> CA 9A 61
	ld a, $02 ; 92195 (24:6195) -> 3E 02
	scall LoadPlayerSprite ; 92197 (24:6197) -> CD C6 4C
label_9219a:
	ld hl, $008d ; 9219A (24:619a) -> 21 8D 00
	scall CheckEventFlag ; 9219D (24:619d) -> CD 2E 46
	cp $01 ; 921A0 (24:61a0) -> FE 01
	jp nz, label_921ac ; 921A2 (24:61a2) -> C2 AC 61
	ld e, $00 ; 921A5 (24:61a5) -> 1E 00
	ld a, $0a ; 921A7 (24:61a7) -> 3E 0A
	scall SetPersonVisibilityState ; 921A9 (24:61a9) -> CD 3D 41
label_921ac:
	ld a, [wc790] ; 921AC (24:61ac) -> FA 90 C7
	or a ; 921AF (24:61af) -> B7
	jp z, label_921dd ; 921B0 (24:61b0) -> CA DD 61
	ld a, [wc790] ; 921B3 (24:61b3) -> FA 90 C7
	cp $06 ; 921B6 (24:61b6) -> FE 06
	jp nc, label_921dd ; 921B8 (24:61b8) -> D2 DD 61
	ld e, $00 ; 921BB (24:61bb) -> 1E 00
	xor a ; 921BD (24:61bd) -> AF
	scall SetPersonVisibilityState ; 921BE (24:61be) -> CD 3D 41
	ld e, $00 ; 921C1 (24:61c1) -> 1E 00
	ld a, $06 ; 921C3 (24:61c3) -> 3E 06
	scall SetPersonVisibilityState ; 921C5 (24:61c5) -> CD 3D 41
	ld e, $00 ; 921C8 (24:61c8) -> 1E 00
	ld a, $07 ; 921CA (24:61ca) -> 3E 07
	scall SetPersonVisibilityState ; 921CC (24:61cc) -> CD 3D 41
	ld e, $00 ; 921CF (24:61cf) -> 1E 00
	ld a, $08 ; 921D1 (24:61d1) -> 3E 08
	scall SetPersonVisibilityState ; 921D3 (24:61d3) -> CD 3D 41
	ld e, $00 ; 921D6 (24:61d6) -> 1E 00
	ld a, $09 ; 921D8 (24:61d8) -> 3E 09
	scall SetPersonVisibilityState ; 921DA (24:61da) -> CD 3D 41
label_921dd:
	ld e, $00 ; 921DD (24:61dd) -> 1E 00
	ld a, $0e ; 921DF (24:61df) -> 3E 0E
	scall SetPersonVisibilityState ; 921E1 (24:61e1) -> CD 3D 41
	scall Func_8001c ; 921E4 (24:61e4) -> CD 1C 40
	ret  ; 921E7 (24:61e7) -> C9

Data_921e8:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $8a, $01
	db $8a, $04, $15, $05, $05, $00, $04, $1f, $04, $15, $17, $17, $00, $70, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92211:
	ld a, e ; 92211 (24:6211) -> 7B
	or a ; 92212 (24:6212) -> B7
	jp nz, label_92251 ; 92213 (24:6213) -> C2 51 62
	xor a ; 92216 (24:6216) -> AF
	scall FacePlayer ; 92217 (24:6217) -> CD 4B 44
	ld hl, $0088 ; 9221A (24:621a) -> 21 88 00
	scall CheckEventFlag ; 9221D (24:621d) -> CD 2E 46
	or a ; 92220 (24:6220) -> B7
	jp nz, label_9224b ; 92221 (24:6221) -> C2 4B 62
	ld hl, $0099 ; 92224 (24:6224) -> 21 99 00
	scall PrintTextWithNPCName ; 92227 (24:6227) -> CD A9 44
	ld de, Data_92252 ; 9222A (24:622a) -> 11 52 62
	ld hl, Data_921e8 ; 9222D (24:622d) -> 21 E8 61
	scall ScriptedBattle ; 92230 (24:6230) -> CD D3 4D
	or a ; 92233 (24:6233) -> B7
	jp nz, label_9223a ; 92234 (24:6234) -> C2 3A 62
	jp label_92251 ; 92237 (24:6237) -> C3 51 62
label_9223a:
	ld hl, $009a ; 9223A (24:623a) -> 21 9A 00
	scall PrintTextWithNPCName ; 9223D (24:623d) -> CD A9 44
	ld e, $01 ; 92240 (24:6240) -> 1E 01
	ld hl, $0088 ; 92242 (24:6242) -> 21 88 00
	scall EventFlagAction ; 92245 (24:6245) -> CD 1B 46
	jp label_92251 ; 92248 (24:6248) -> C3 51 62
label_9224b:
	ld hl, $009b ; 9224B (24:624b) -> 21 9B 00
	scall PrintTextWithNPCName ; 9224E (24:624e) -> CD A9 44
label_92251:
	ret  ; 92251 (24:6251) -> C9

Data_92252:
	dstr "ウォリア"

Func_92257:
	ld a, e ; 92257 (24:6257) -> 7B
	cp $02 ; 92258 (24:6258) -> FE 02
	jp nz, label_9233a ; 9225A (24:625a) -> C2 3A 63
	ld a, $1f ; 9225D (24:625d) -> 3E 1F
	scall Func_80e6d ; 9225F (24:625f) -> CD 6D 4E
	cp $ff ; 92262 (24:6262) -> FE FF
	jp nz, label_922b2 ; 92264 (24:6264) -> C2 B2 62
	ld a, $20 ; 92267 (24:6267) -> 3E 20
	scall Func_80e6d ; 92269 (24:6269) -> CD 6D 4E
	cp $ff ; 9226C (24:626c) -> FE FF
	jp nz, label_922b2 ; 9226E (24:626e) -> C2 B2 62
	ld a, $21 ; 92271 (24:6271) -> 3E 21
	scall Func_80e6d ; 92273 (24:6273) -> CD 6D 4E
	cp $ff ; 92276 (24:6276) -> FE FF
	jp nz, label_922b2 ; 92278 (24:6278) -> C2 B2 62
	ld a, $7e ; 9227B (24:627b) -> 3E 7E
	scall Func_80e6d ; 9227D (24:627d) -> CD 6D 4E
	cp $ff ; 92280 (24:6280) -> FE FF
	jp nz, label_922b2 ; 92282 (24:6282) -> C2 B2 62
	ld c, $01 ; 92285 (24:6285) -> 0E 01
	ld e, $01 ; 92287 (24:6287) -> 1E 01
	ld a, $1b ; 92289 (24:6289) -> 3E 1B
	scall LoadEmote ; 9228B (24:628b) -> CD 76 41
	xor a ; 9228E (24:628e) -> AF
	scall Func_80653 ; 9228F (24:628f) -> CD 53 46
	ld a, $37 ; 92292 (24:6292) -> 3E 37
	scall PlaySFX ; 92294 (24:6294) -> CD FE 4E
	scall WaitEmote ; 92297 (24:6297) -> CD D5 41
	scall HideEmote ; 9229A (24:629a) -> CD 8B 41
	ld a, $02 ; 9229D (24:629d) -> 3E 02
	scall PlayerFace ; 9229F (24:629f) -> CD 77 46
	ld l, $06 ; 922A2 (24:62a2) -> 2E 06
	push hl ; 922A4 (24:62a4) -> E5
	ld c, $0d ; 922A5 (24:62a5) -> 0E 0D
	ld e, $01 ; 922A7 (24:62a7) -> 1E 01
	ld a, $09 ; 922A9 (24:62a9) -> 3E 09
	scall Func_80dff ; 922AB (24:62ab) -> CD FF 4D
	pop bc ; 922AE (24:62ae) -> C1
	jp label_9233a ; 922AF (24:62af) -> C3 3A 63
label_922b2:
	ld hl, $0047 ; 922B2 (24:62b2) -> 21 47 00
	scall CheckEventFlag ; 922B5 (24:62b5) -> CD 2E 46
	cp $01 ; 922B8 (24:62b8) -> FE 01
	jp nz, label_922eb ; 922BA (24:62ba) -> C2 EB 62
	ld a, $20 ; 922BD (24:62bd) -> 3E 20
	scall Func_80e6d ; 922BF (24:62bf) -> CD 6D 4E
	cp $ff ; 922C2 (24:62c2) -> FE FF
	jp nz, label_922db ; 922C4 (24:62c4) -> C2 DB 62
	ld a, $21 ; 922C7 (24:62c7) -> 3E 21
	scall Func_80e6d ; 922C9 (24:62c9) -> CD 6D 4E
	cp $ff ; 922CC (24:62cc) -> FE FF
	jp nz, label_922db ; 922CE (24:62ce) -> C2 DB 62
	ld a, $7e ; 922D1 (24:62d1) -> 3E 7E
	scall Func_80e6d ; 922D3 (24:62d3) -> CD 6D 4E
	cp $ff ; 922D6 (24:62d6) -> FE FF
	jp z, label_922eb ; 922D8 (24:62d8) -> CA EB 62
label_922db:
	ld a, [wPlayerState] ; 922DB (24:62db) -> FA E1 C7
	cp $03 ; 922DE (24:62de) -> FE 03
	jp z, label_922e8 ; 922E0 (24:62e0) -> CA E8 62
	ld a, $03 ; 922E3 (24:62e3) -> 3E 03
	scall LoadPlayerSprite ; 922E5 (24:62e5) -> CD C6 4C
label_922e8:
	jp label_9233a ; 922E8 (24:62e8) -> C3 3A 63
label_922eb:
	ld a, $1f ; 922EB (24:62eb) -> 3E 1F
	scall Func_80e6d ; 922ED (24:62ed) -> CD 6D 4E
	cp $ff ; 922F0 (24:62f0) -> FE FF
	jp z, label_92310 ; 922F2 (24:62f2) -> CA 10 63
	ld hl, $0039 ; 922F5 (24:62f5) -> 21 39 00
	scall CheckEventFlag ; 922F8 (24:62f8) -> CD 2E 46
	cp $01 ; 922FB (24:62fb) -> FE 01
	jp nz, label_92310 ; 922FD (24:62fd) -> C2 10 63
	ld a, [wPlayerState] ; 92300 (24:6300) -> FA E1 C7
	cp $02 ; 92303 (24:6303) -> FE 02
	jp z, label_9230d ; 92305 (24:6305) -> CA 0D 63
	ld a, $02 ; 92308 (24:6308) -> 3E 02
	scall LoadPlayerSprite ; 9230A (24:630a) -> CD C6 4C
label_9230d:
	jp label_9233a ; 9230D (24:630d) -> C3 3A 63
label_92310:
	ld c, $01 ; 92310 (24:6310) -> 0E 01
	ld e, $01 ; 92312 (24:6312) -> 1E 01
	ld a, $1b ; 92314 (24:6314) -> 3E 1B
	scall LoadEmote ; 92316 (24:6316) -> CD 76 41
	xor a ; 92319 (24:6319) -> AF
	scall Func_80653 ; 9231A (24:631a) -> CD 53 46
	ld a, $37 ; 9231D (24:631d) -> 3E 37
	scall PlaySFX ; 9231F (24:631f) -> CD FE 4E
	scall WaitEmote ; 92322 (24:6322) -> CD D5 41
	scall HideEmote ; 92325 (24:6325) -> CD 8B 41
	ld a, $02 ; 92328 (24:6328) -> 3E 02
	scall PlayerFace ; 9232A (24:632a) -> CD 77 46
	ld l, $06 ; 9232D (24:632d) -> 2E 06
	push hl ; 9232F (24:632f) -> E5
	ld c, $0d ; 92330 (24:6330) -> 0E 0D
	ld e, $01 ; 92332 (24:6332) -> 1E 01
	ld a, $09 ; 92334 (24:6334) -> 3E 09
	scall Func_80dff ; 92336 (24:6336) -> CD FF 4D
	pop bc ; 92339 (24:6339) -> C1
label_9233a:
	ret  ; 9233A (24:633a) -> C9

Func_9233b:
	push bc ; 9233B (24:633b) -> C5
	push bc ; 9233C (24:633c) -> C5
	ld hl, sp+$03 ; 9233D (24:633d) -> F8 03
	ld a, $ff ; 9233F (24:633f) -> 3E FF
	ld [hl], a ; 92341 (24:6341) -> 77
	ld hl, sp+$02 ; 92342 (24:6342) -> F8 02
	ld [hl], a ; 92344 (24:6344) -> 77
	ld a, e ; 92345 (24:6345) -> 7B
	cp $02 ; 92346 (24:6346) -> FE 02
	jp nz, label_923f6 ; 92348 (24:6348) -> C2 F6 63
	ld a, $20 ; 9234B (24:634b) -> 3E 20
	scall Func_80e6d ; 9234D (24:634d) -> CD 6D 4E
	cp $ff ; 92350 (24:6350) -> FE FF
	jp nz, label_923a1 ; 92352 (24:6352) -> C2 A1 63
	ld a, $21 ; 92355 (24:6355) -> 3E 21
	scall Func_80e6d ; 92357 (24:6357) -> CD 6D 4E
	cp $ff ; 9235A (24:635a) -> FE FF
	jp nz, label_923a1 ; 9235C (24:635c) -> C2 A1 63
	ld a, $7e ; 9235F (24:635f) -> 3E 7E
	scall Func_80e6d ; 92361 (24:6361) -> CD 6D 4E
	cp $ff ; 92364 (24:6364) -> FE FF
	jp nz, label_923a1 ; 92366 (24:6366) -> C2 A1 63
	ld hl, $035a ; 92369 (24:6369) -> 21 5A 03
	scall PrintTextStandard ; 9236C (24:636c) -> CD 98 44
	ld hl, sp+$00 ; 9236F (24:636f) -> F8 00
	ld a, [wMapX] ; 92371 (24:6371) -> FA D8 C2
	add a, $05 ; 92374 (24:6374) -> C6 05
	ld [hl], a ; 92376 (24:6376) -> 77
	ld a, [wPlayerFacing] ; 92377 (24:6377) -> FA 38 C8
	or a ; 9237A (24:637a) -> B7
	jp nz, label_92389 ; 9237B (24:637b) -> C2 89 63
	ld hl, sp+$01 ; 9237E (24:637e) -> F8 01
	ld a, [wMapY] ; 92380 (24:6380) -> FA D9 C2
	add a, $05 ; 92383 (24:6383) -> C6 05
	ld [hl], a ; 92385 (24:6385) -> 77
	jp label_92391 ; 92386 (24:6386) -> C3 91 63
label_92389:
	ld hl, sp+$01 ; 92389 (24:6389) -> F8 01
	ld a, [wMapY] ; 9238B (24:638b) -> FA D9 C2
	add a, $03 ; 9238E (24:638e) -> C6 03
	ld [hl], a ; 92390 (24:6390) -> 77
label_92391:
	ld c, $01 ; 92391 (24:6391) -> 0E 01
	ld hl, sp+$00 ; 92393 (24:6393) -> F8 00
	push de ; 92395 (24:6395) -> D5
	push hl ; 92396 (24:6396) -> E5
	pop de ; 92397 (24:6397) -> D1
	pop hl ; 92398 (24:6398) -> E1
	ld a, $24 ; 92399 (24:6399) -> 3E 24
	scall MovePlayer ; 9239B (24:639b) -> CD 3E 46
	jp label_923f6 ; 9239E (24:639e) -> C3 F6 63
label_923a1:
	ld hl, $0047 ; 923A1 (24:63a1) -> 21 47 00
	scall CheckEventFlag ; 923A4 (24:63a4) -> CD 2E 46
	or a ; 923A7 (24:63a7) -> B7
	jp nz, label_923e9 ; 923A8 (24:63a8) -> C2 E9 63
	ld hl, $035a ; 923AB (24:63ab) -> 21 5A 03
	scall PrintTextStandard ; 923AE (24:63ae) -> CD 98 44
	ld hl, sp+$00 ; 923B1 (24:63b1) -> F8 00
	ld a, [wMapX] ; 923B3 (24:63b3) -> FA D8 C2
	add a, $05 ; 923B6 (24:63b6) -> C6 05
	ld [hl], a ; 923B8 (24:63b8) -> 77
	ld a, [wPlayerFacing] ; 923B9 (24:63b9) -> FA 38 C8
	or a ; 923BC (24:63bc) -> B7
	jp nz, label_923cb ; 923BD (24:63bd) -> C2 CB 63
	ld hl, sp+$01 ; 923C0 (24:63c0) -> F8 01
	ld a, [wMapY] ; 923C2 (24:63c2) -> FA D9 C2
	add a, $05 ; 923C5 (24:63c5) -> C6 05
	ld [hl], a ; 923C7 (24:63c7) -> 77
	jp label_923d3 ; 923C8 (24:63c8) -> C3 D3 63
label_923cb:
	ld hl, sp+$01 ; 923CB (24:63cb) -> F8 01
	ld a, [wMapY] ; 923CD (24:63cd) -> FA D9 C2
	add a, $03 ; 923D0 (24:63d0) -> C6 03
	ld [hl], a ; 923D2 (24:63d2) -> 77
label_923d3:
	ld c, $01 ; 923D3 (24:63d3) -> 0E 01
	ld hl, sp+$00 ; 923D5 (24:63d5) -> F8 00
	push de ; 923D7 (24:63d7) -> D5
	push hl ; 923D8 (24:63d8) -> E5
	pop de ; 923D9 (24:63d9) -> D1
	pop hl ; 923DA (24:63da) -> E1
	ld a, $24 ; 923DB (24:63db) -> 3E 24
	scall MovePlayer ; 923DD (24:63dd) -> CD 3E 46
	ld hl, $048c ; 923E0 (24:63e0) -> 21 8C 04
	scall PrintTextWithNPCName ; 923E3 (24:63e3) -> CD A9 44
	jp label_923f6 ; 923E6 (24:63e6) -> C3 F6 63
label_923e9:
	ld a, [wPlayerState] ; 923E9 (24:63e9) -> FA E1 C7
	cp $03 ; 923EC (24:63ec) -> FE 03
	jp z, label_923f6 ; 923EE (24:63ee) -> CA F6 63
	ld a, $03 ; 923F1 (24:63f1) -> 3E 03
	scall LoadPlayerSprite ; 923F3 (24:63f3) -> CD C6 4C
label_923f6:
	pop bc ; 923F6 (24:63f6) -> C1
	pop bc ; 923F7 (24:63f7) -> C1
	ret  ; 923F8 (24:63f8) -> C9

Data_923f9:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f
	db $01, $1f, $04, $16, $17, $17, $00, $70, $18, $04, $16, $09, $09, $0b, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92422:
	push af ; 92422 (24:6422) -> F5
	ld a, e ; 92423 (24:6423) -> 7B
	or a ; 92424 (24:6424) -> B7
	jp nz, label_92478 ; 92425 (24:6425) -> C2 78 64
	ld hl, sp+$01 ; 92428 (24:6428) -> F8 01
	ld a, [hl] ; 9242A (24:642a) -> 7E
	scall FacePlayer ; 9242B (24:642b) -> CD 4B 44
	ld hl, $0089 ; 9242E (24:642e) -> 21 89 00
	scall CheckEventFlag ; 92431 (24:6431) -> CD 2E 46
	or a ; 92434 (24:6434) -> B7
	jp nz, label_92472 ; 92435 (24:6435) -> C2 72 64
	ld hl, $023a ; 92438 (24:6438) -> 21 3A 02
	scall PrintTextStandard ; 9243B (24:643b) -> CD 98 44
	ld hl, $032c ; 9243E (24:643e) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 92441 (24:6441) -> CD BA 44
	or a ; 92444 (24:6444) -> B7
	jp nz, label_92469 ; 92445 (24:6445) -> C2 69 64
	ld de, Data_9247a ; 92448 (24:6448) -> 11 7A 64
	ld hl, Data_923f9 ; 9244B (24:644b) -> 21 F9 63
	scall ScriptedBattle ; 9244E (24:644e) -> CD D3 4D
	or a ; 92451 (24:6451) -> B7
	jp nz, label_92458 ; 92452 (24:6452) -> C2 58 64
	jp label_92478 ; 92455 (24:6455) -> C3 78 64
label_92458:
	ld e, $01 ; 92458 (24:6458) -> 1E 01
	ld hl, $0089 ; 9245A (24:645a) -> 21 89 00
	scall EventFlagAction ; 9245D (24:645d) -> CD 1B 46
	ld hl, $023b ; 92460 (24:6460) -> 21 3B 02
	scall PrintTextStandard ; 92463 (24:6463) -> CD 98 44
	jp label_9246f ; 92466 (24:6466) -> C3 6F 64
label_92469:
	ld hl, $024c ; 92469 (24:6469) -> 21 4C 02
	scall PrintTextStandard ; 9246C (24:646c) -> CD 98 44
label_9246f:
	jp label_92478 ; 9246F (24:646f) -> C3 78 64
label_92472:
	ld hl, $023b ; 92472 (24:6472) -> 21 3B 02
	scall PrintTextStandard ; 92475 (24:6475) -> CD 98 44
label_92478:
	pop bc ; 92478 (24:6478) -> C1
	ret  ; 92479 (24:6479) -> C9

Data_9247a:
	dstr "ソﾞッキー"

Data_92480:
	db $00, $00, $00, $02, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $7a, $04, $15, $17, $05, $1e, $5b, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_924a9:
	push af ; 924A9 (24:64a9) -> F5
	ld a, e ; 924AA (24:64aa) -> 7B
	or a ; 924AB (24:64ab) -> B7
	jp nz, label_924ff ; 924AC (24:64ac) -> C2 FF 64
	ld hl, sp+$01 ; 924AF (24:64af) -> F8 01
	ld a, [hl] ; 924B1 (24:64b1) -> 7E
	scall FacePlayer ; 924B2 (24:64b2) -> CD 4B 44
	ld hl, $008a ; 924B5 (24:64b5) -> 21 8A 00
	scall CheckEventFlag ; 924B8 (24:64b8) -> CD 2E 46
	or a ; 924BB (24:64bb) -> B7
	jp nz, label_924f9 ; 924BC (24:64bc) -> C2 F9 64
	ld hl, $023c ; 924BF (24:64bf) -> 21 3C 02
	scall PrintTextStandard ; 924C2 (24:64c2) -> CD 98 44
	ld hl, $032c ; 924C5 (24:64c5) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 924C8 (24:64c8) -> CD BA 44
	or a ; 924CB (24:64cb) -> B7
	jp nz, label_924f0 ; 924CC (24:64cc) -> C2 F0 64
	ld de, Data_92501 ; 924CF (24:64cf) -> 11 01 65
	ld hl, Data_92480 ; 924D2 (24:64d2) -> 21 80 64
	scall ScriptedBattle ; 924D5 (24:64d5) -> CD D3 4D
	or a ; 924D8 (24:64d8) -> B7
	jp nz, label_924df ; 924D9 (24:64d9) -> C2 DF 64
	jp label_924ff ; 924DC (24:64dc) -> C3 FF 64
label_924df:
	ld e, $01 ; 924DF (24:64df) -> 1E 01
	ld hl, $008a ; 924E1 (24:64e1) -> 21 8A 00
	scall EventFlagAction ; 924E4 (24:64e4) -> CD 1B 46
	ld hl, $023d ; 924E7 (24:64e7) -> 21 3D 02
	scall PrintTextStandard ; 924EA (24:64ea) -> CD 98 44
	jp label_924f6 ; 924ED (24:64ed) -> C3 F6 64
label_924f0:
	ld hl, $024d ; 924F0 (24:64f0) -> 21 4D 02
	scall PrintTextStandard ; 924F3 (24:64f3) -> CD 98 44
label_924f6:
	jp label_924ff ; 924F6 (24:64f6) -> C3 FF 64
label_924f9:
	ld hl, $023d ; 924F9 (24:64f9) -> 21 3D 02
	scall PrintTextStandard ; 924FC (24:64fc) -> CD 98 44
label_924ff:
	pop bc ; 924FF (24:64ff) -> C1
	ret  ; 92500 (24:6500) -> C9

Data_92501:
	dstr "レテﾞィース"

Data_92508:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $8d, $03, $15, $0c, $0d, $14, $77, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92531:
	push af ; 92531 (24:6531) -> F5
	ld a, e ; 92532 (24:6532) -> 7B
	or a ; 92533 (24:6533) -> B7
	jp nz, label_92587 ; 92534 (24:6534) -> C2 87 65
	ld hl, sp+$01 ; 92537 (24:6537) -> F8 01
	ld a, [hl] ; 92539 (24:6539) -> 7E
	scall FacePlayer ; 9253A (24:653a) -> CD 4B 44
	ld hl, $008b ; 9253D (24:653d) -> 21 8B 00
	scall CheckEventFlag ; 92540 (24:6540) -> CD 2E 46
	or a ; 92543 (24:6543) -> B7
	jp nz, label_92581 ; 92544 (24:6544) -> C2 81 65
	ld hl, $023e ; 92547 (24:6547) -> 21 3E 02
	scall PrintTextStandard ; 9254A (24:654a) -> CD 98 44
	ld hl, $032c ; 9254D (24:654d) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 92550 (24:6550) -> CD BA 44
	or a ; 92553 (24:6553) -> B7
	jp nz, label_92578 ; 92554 (24:6554) -> C2 78 65
	ld de, Data_92589 ; 92557 (24:6557) -> 11 89 65
	ld hl, Data_92508 ; 9255A (24:655a) -> 21 08 65
	scall ScriptedBattle ; 9255D (24:655d) -> CD D3 4D
	or a ; 92560 (24:6560) -> B7
	jp nz, label_92567 ; 92561 (24:6561) -> C2 67 65
	jp label_92587 ; 92564 (24:6564) -> C3 87 65
label_92567:
	ld e, $01 ; 92567 (24:6567) -> 1E 01
	ld hl, $008b ; 92569 (24:6569) -> 21 8B 00
	scall EventFlagAction ; 9256C (24:656c) -> CD 1B 46
	ld hl, $023f ; 9256F (24:656f) -> 21 3F 02
	scall PrintTextStandard ; 92572 (24:6572) -> CD 98 44
	jp label_9257e ; 92575 (24:6575) -> C3 7E 65
label_92578:
	ld hl, $024b ; 92578 (24:6578) -> 21 4B 02
	scall PrintTextStandard ; 9257B (24:657b) -> CD 98 44
label_9257e:
	jp label_92587 ; 9257E (24:657e) -> C3 87 65
label_92581:
	ld hl, $0240 ; 92581 (24:6581) -> 21 40 02
	scall PrintTextStandard ; 92584 (24:6584) -> CD 98 44
label_92587:
	pop bc ; 92587 (24:6587) -> C1
	ret  ; 92588 (24:6588) -> C9

Data_92589:
	dstr "ソﾞッキー"

Data_9258f:
	db $00, $00, $00, $02, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $15, $17, $17
	db $00, $70, $4a, $04, $15, $0e, $08, $00, $23, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_925b8:
	push af ; 925B8 (24:65b8) -> F5
	ld a, e ; 925B9 (24:65b9) -> 7B
	or a ; 925BA (24:65ba) -> B7
	jp nz, label_9260e ; 925BB (24:65bb) -> C2 0E 66
	ld hl, sp+$01 ; 925BE (24:65be) -> F8 01
	ld a, [hl] ; 925C0 (24:65c0) -> 7E
	scall FacePlayer ; 925C1 (24:65c1) -> CD 4B 44
	ld hl, $008c ; 925C4 (24:65c4) -> 21 8C 00
	scall CheckEventFlag ; 925C7 (24:65c7) -> CD 2E 46
	or a ; 925CA (24:65ca) -> B7
	jp nz, label_92608 ; 925CB (24:65cb) -> C2 08 66
	ld hl, $0242 ; 925CE (24:65ce) -> 21 42 02
	scall PrintTextStandard ; 925D1 (24:65d1) -> CD 98 44
	ld hl, $032c ; 925D4 (24:65d4) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 925D7 (24:65d7) -> CD BA 44
	or a ; 925DA (24:65da) -> B7
	jp nz, label_925ff ; 925DB (24:65db) -> C2 FF 65
	ld de, Data_92610 ; 925DE (24:65de) -> 11 10 66
	ld hl, Data_9258f ; 925E1 (24:65e1) -> 21 8F 65
	scall ScriptedBattle ; 925E4 (24:65e4) -> CD D3 4D
	or a ; 925E7 (24:65e7) -> B7
	jp nz, label_925ee ; 925E8 (24:65e8) -> C2 EE 65
	jp label_9260e ; 925EB (24:65eb) -> C3 0E 66
label_925ee:
	ld e, $01 ; 925EE (24:65ee) -> 1E 01
	ld hl, $008c ; 925F0 (24:65f0) -> 21 8C 00
	scall EventFlagAction ; 925F3 (24:65f3) -> CD 1B 46
	ld hl, $0243 ; 925F6 (24:65f6) -> 21 43 02
	scall PrintTextStandard ; 925F9 (24:65f9) -> CD 98 44
	jp label_92605 ; 925FC (24:65fc) -> C3 05 66
label_925ff:
	ld hl, $024c ; 925FF (24:65ff) -> 21 4C 02
	scall PrintTextStandard ; 92602 (24:6602) -> CD 98 44
label_92605:
	jp label_9260e ; 92605 (24:6605) -> C3 0E 66
label_92608:
	ld hl, $0249 ; 92608 (24:6608) -> 21 49 02
	scall PrintTextStandard ; 9260B (24:660b) -> CD 98 44
label_9260e:
	pop bc ; 9260E (24:660e) -> C1
	ret  ; 9260F (24:660f) -> C9

Data_92610:
	dstr "ソﾞッキー"

Data_92616:
	db $08, $06, $0e, $06, $ff, $ff

Data_9261c:
	db $09, $06, $0e, $06, $ff, $ff

Data_92622:
	db $00, $00, $00, $03, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $17, $17, $17
	db $17, $70, $20, $04, $17, $17, $17, $17, $6f, $21, $02, $17, $0c, $0f, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_9264b:
	ld a, e ; 9264B (24:664b) -> 7B
	or a ; 9264C (24:664c) -> B7
	jp nz, label_926b4 ; 9264D (24:664d) -> C2 B4 66
	ld hl, $008d ; 92650 (24:6650) -> 21 8D 00
	scall CheckEventFlag ; 92653 (24:6653) -> CD 2E 46
	or a ; 92656 (24:6656) -> B7
	jp nz, label_926b4 ; 92657 (24:6657) -> C2 B4 66
	ld a, $0a ; 9265A (24:665a) -> 3E 0A
	scall FacePlayer ; 9265C (24:665c) -> CD 4B 44
	ld hl, $00a1 ; 9265F (24:665f) -> 21 A1 00
	scall PrintTextWithNPCName ; 92662 (24:6662) -> CD A9 44
	ld de, Data_926b5 ; 92665 (24:6665) -> 11 B5 66
	ld hl, Data_92622 ; 92668 (24:6668) -> 21 22 66
	scall ScriptedBattle ; 9266B (24:666b) -> CD D3 4D
	or a ; 9266E (24:666e) -> B7
	jp nz, label_92675 ; 9266F (24:666f) -> C2 75 66
	jp label_926b4 ; 92672 (24:6672) -> C3 B4 66
label_92675:
	ld hl, $00a2 ; 92675 (24:6675) -> 21 A2 00
	scall PrintTextWithNPCName ; 92678 (24:6678) -> CD A9 44
	ld a, [wPlayerFacing] ; 9267B (24:667b) -> FA 38 C8
	cp $01 ; 9267E (24:667e) -> FE 01
	jp z, label_9268b ; 92680 (24:6680) -> CA 8B 66
	ld a, [wPlayerFacing] ; 92683 (24:6683) -> FA 38 C8
	cp $03 ; 92686 (24:6686) -> FE 03
	jp nz, label_92698 ; 92688 (24:6688) -> C2 98 66
label_9268b:
	ld bc, Data_92616 ; 9268B (24:668b) -> 01 16 66
	ld e, $24 ; 9268E (24:668e) -> 1E 24
	ld a, $0a ; 92690 (24:6690) -> 3E 0A
	scall MovePersonAndWait ; 92692 (24:6692) -> CD 88 46
	jp label_926a2 ; 92695 (24:6695) -> C3 A2 66
label_92698:
	ld bc, Data_9261c ; 92698 (24:6698) -> 01 1C 66
	ld e, $24 ; 9269B (24:669b) -> 1E 24
	ld a, $0a ; 9269D (24:669d) -> 3E 0A
	scall MovePersonAndWait ; 9269F (24:669f) -> CD 88 46
label_926a2:
	scall WaitNPCStep ; 926A2 (24:66a2) -> CD 0C 42
	ld e, $00 ; 926A5 (24:66a5) -> 1E 00
	ld a, $0a ; 926A7 (24:66a7) -> 3E 0A
	scall SetPersonVisibilityState ; 926A9 (24:66a9) -> CD 3D 41
	ld e, $01 ; 926AC (24:66ac) -> 1E 01
	ld hl, $008d ; 926AE (24:66ae) -> 21 8D 00
	scall EventFlagAction ; 926B1 (24:66b1) -> CD 1B 46
label_926b4:
	ret  ; 926B4 (24:66b4) -> C9

Data_926b5:
	dstr "ヒﾞーノ"

Func_926ba:
	ld a, e ; 926BA (24:66ba) -> 7B
	or a ; 926BB (24:66bb) -> B7
	jp nz, label_927c1 ; 926BC (24:66bc) -> C2 C1 67
	ld hl, $00da ; 926BF (24:66bf) -> 21 DA 00
	scall CheckEventFlag ; 926C2 (24:66c2) -> CD 2E 46
	or a ; 926C5 (24:66c5) -> B7
	jp nz, label_927bb ; 926C6 (24:66c6) -> C2 BB 67
	ld a, $5e ; 926C9 (24:66c9) -> 3E 5E
	scall PlaySFX ; 926CB (24:66cb) -> CD FE 4E
	ld c, $02 ; 926CE (24:66ce) -> 0E 02
	ld e, $02 ; 926D0 (24:66d0) -> 1E 02
	ld a, $08 ; 926D2 (24:66d2) -> 3E 08
	scall LoadEmote ; 926D4 (24:66d4) -> CD 76 41
	ld e, $2b ; 926D7 (24:66d7) -> 1E 2B
	ld a, $0f ; 926D9 (24:66d9) -> 3E 0F
	scall MoveEmote ; 926DB (24:66db) -> CD E4 41
	scall WaitEmote ; 926DE (24:66de) -> CD D5 41
	scall HideEmote ; 926E1 (24:66e1) -> CD 8B 41
	ld a, $28 ; 926E4 (24:66e4) -> 3E 28
	scall PlaySFX ; 926E6 (24:66e6) -> CD FE 4E
	ld e, $01 ; 926E9 (24:66e9) -> 1E 01
	ld a, $0e ; 926EB (24:66eb) -> 3E 0E
	scall SetPersonVisibilityState ; 926ED (24:66ed) -> CD 3D 41
	ld a, $60 ; 926F0 (24:66f0) -> 3E 60
	scall PlaySFX ; 926F2 (24:66f2) -> CD FE 4E
	ld e, $03 ; 926F5 (24:66f5) -> 1E 03
	ld a, $0e ; 926F7 (24:66f7) -> 3E 0E
	scall SpriteFace ; 926F9 (24:66f9) -> CD 95 40
	ld e, $00 ; 926FC (24:66fc) -> 1E 00
	ld a, $0e ; 926FE (24:66fe) -> 3E 0E
	scall SpriteFace ; 92700 (24:6700) -> CD 95 40
	ld e, $01 ; 92703 (24:6703) -> 1E 01
	ld a, $0e ; 92705 (24:6705) -> 3E 0E
	scall SpriteFace ; 92707 (24:6707) -> CD 95 40
	ld e, $02 ; 9270A (24:670a) -> 1E 02
	ld a, $0e ; 9270C (24:670c) -> 3E 0E
	scall SpriteFace ; 9270E (24:670e) -> CD 95 40
	ld e, $03 ; 92711 (24:6711) -> 1E 03
	ld a, $0e ; 92713 (24:6713) -> 3E 0E
	scall SpriteFace ; 92715 (24:6715) -> CD 95 40
	ld e, $00 ; 92718 (24:6718) -> 1E 00
	ld a, $0e ; 9271A (24:671a) -> 3E 0E
	scall SpriteFace ; 9271C (24:671c) -> CD 95 40
	ld e, $01 ; 9271F (24:671f) -> 1E 01
	ld a, $0e ; 92721 (24:6721) -> 3E 0E
	scall SpriteFace ; 92723 (24:6723) -> CD 95 40
	ld e, $02 ; 92726 (24:6726) -> 1E 02
	ld a, $0e ; 92728 (24:6728) -> 3E 0E
	scall SpriteFace ; 9272A (24:672a) -> CD 95 40
	ld a, $0f ; 9272D (24:672d) -> 3E 0F
	scall FadeOutAudio ; 9272F (24:672f) -> CD F1 4F
	xor a ; 92732 (24:6732) -> AF
	scall PlayMusic ; 92733 (24:6733) -> CD E6 4E
	ld a, $01 ; 92736 (24:6736) -> 3E 01
	scall FadeInAudio ; 92738 (24:6738) -> CD 1A 50
	ld a, $14 ; 9273B (24:673b) -> 3E 14
	scall PlayMusic ; 9273D (24:673d) -> CD E6 4E
	ld hl, $001e ; 92740 (24:6740) -> 21 1E 00
	scall ScriptSleep ; 92743 (24:6743) -> CD 8F 46
	ld a, $0e ; 92746 (24:6746) -> 3E 0E
	scall FacePlayer ; 92748 (24:6748) -> CD 4B 44
	ld c, $01 ; 9274B (24:674b) -> 0E 01
	ld e, $13 ; 9274D (24:674d) -> 1E 13
	ld a, $12 ; 9274F (24:674f) -> 3E 12
	scall Func_80e8d ; 92751 (24:6751) -> CD 8D 4E
	ld e, $01 ; 92754 (24:6754) -> 1E 01
	ld hl, $00da ; 92756 (24:6756) -> 21 DA 00
	scall EventFlagAction ; 92759 (24:6759) -> CD 1B 46
	ld a, $60 ; 9275C (24:675c) -> 3E 60
	scall PlaySFX ; 9275E (24:675e) -> CD FE 4E
	ld e, $03 ; 92761 (24:6761) -> 1E 03
	ld a, $0e ; 92763 (24:6763) -> 3E 0E
	scall SpriteFace ; 92765 (24:6765) -> CD 95 40
	ld e, $00 ; 92768 (24:6768) -> 1E 00
	ld a, $0e ; 9276A (24:676a) -> 3E 0E
	scall SpriteFace ; 9276C (24:676c) -> CD 95 40
	ld e, $01 ; 9276F (24:676f) -> 1E 01
	ld a, $0e ; 92771 (24:6771) -> 3E 0E
	scall SpriteFace ; 92773 (24:6773) -> CD 95 40
	ld e, $02 ; 92776 (24:6776) -> 1E 02
	ld a, $0e ; 92778 (24:6778) -> 3E 0E
	scall SpriteFace ; 9277A (24:677a) -> CD 95 40
	ld e, $03 ; 9277D (24:677d) -> 1E 03
	ld a, $0e ; 9277F (24:677f) -> 3E 0E
	scall SpriteFace ; 92781 (24:6781) -> CD 95 40
	ld e, $00 ; 92784 (24:6784) -> 1E 00
	ld a, $0e ; 92786 (24:6786) -> 3E 0E
	scall SpriteFace ; 92788 (24:6788) -> CD 95 40
	ld e, $01 ; 9278B (24:678b) -> 1E 01
	ld a, $0e ; 9278D (24:678d) -> 3E 0E
	scall SpriteFace ; 9278F (24:678f) -> CD 95 40
	ld e, $02 ; 92792 (24:6792) -> 1E 02
	ld a, $0e ; 92794 (24:6794) -> 3E 0E
	scall SpriteFace ; 92796 (24:6796) -> CD 95 40
	ld a, $0f ; 92799 (24:6799) -> 3E 0F
	scall FadeOutAudio ; 9279B (24:679b) -> CD F1 4F
	xor a ; 9279E (24:679e) -> AF
	scall PlayMusic ; 9279F (24:679f) -> CD E6 4E
	ld a, $01 ; 927A2 (24:67a2) -> 3E 01
	scall FadeInAudio ; 927A4 (24:67a4) -> CD 1A 50
	ld a, $0d ; 927A7 (24:67a7) -> 3E 0D
	scall PlayMusic ; 927A9 (24:67a9) -> CD E6 4E
	ld a, $0e ; 927AC (24:67ac) -> 3E 0E
	scall FacePlayer ; 927AE (24:67ae) -> CD 4B 44
	ld e, $00 ; 927B1 (24:67b1) -> 1E 00
	ld a, $0e ; 927B3 (24:67b3) -> 3E 0E
	scall SetPersonVisibilityState ; 927B5 (24:67b5) -> CD 3D 41
	jp label_927c1 ; 927B8 (24:67b8) -> C3 C1 67
label_927bb:
	ld hl, $015c ; 927BB (24:67bb) -> 21 5C 01
	scall PrintTextStandard ; 927BE (24:67be) -> CD 98 44
label_927c1:
	ret  ; 927C1 (24:67c1) -> C9

Data_927c2:
	db $00
	db $00, $00, $03, $00, $c5, $b0, $00, $00, $1f, $01, $1f, $04, $17, $17, $17, $17
	db $70, $20, $04, $17, $17, $17, $17, $6f, $21, $02, $17, $0c, $0f, $17, $6f, $00
	db $00, $00, $00, $00, $00, $00, $00, $02

Func_927eb:
	ld a, e ; 927EB (24:67eb) -> 7B
	or a ; 927EC (24:67ec) -> B7
	jp nz, label_92844 ; 927ED (24:67ed) -> C2 44 68
	ld a, $10 ; 927F0 (24:67f0) -> 3E 10
	scall FacePlayer ; 927F2 (24:67f2) -> CD 4B 44
	ld hl, $0039 ; 927F5 (24:67f5) -> 21 39 00
	scall CheckEventFlag ; 927F8 (24:67f8) -> CD 2E 46
	or a ; 927FB (24:67fb) -> B7
	jp nz, label_92808 ; 927FC (24:67fc) -> C2 08 68
	ld hl, $048d ; 927FF (24:67ff) -> 21 8D 04
	scall PrintTextStandard ; 92802 (24:6802) -> CD 98 44
	jp label_92844 ; 92805 (24:6805) -> C3 44 68
label_92808:
	ld hl, $0047 ; 92808 (24:6808) -> 21 47 00
	scall CheckEventFlag ; 9280B (24:680b) -> CD 2E 46
	or a ; 9280E (24:680e) -> B7
	jp nz, label_9281b ; 9280F (24:680f) -> C2 1B 68
	ld hl, $048e ; 92812 (24:6812) -> 21 8E 04
	scall PrintTextStandard ; 92815 (24:6815) -> CD 98 44
	jp label_92844 ; 92818 (24:6818) -> C3 44 68
label_9281b:
	ld hl, $0248 ; 9281B (24:681b) -> 21 48 02
	scall PrintTextWithYesNoBox ; 9281E (24:681e) -> CD BA 44
	or a ; 92821 (24:6821) -> B7
	jp nz, label_9283e ; 92822 (24:6822) -> C2 3E 68
	ld de, Data_92845 ; 92825 (24:6825) -> 11 45 68
	ld hl, Data_927c2 ; 92828 (24:6828) -> 21 C2 67
	scall ScriptedBattle ; 9282B (24:682b) -> CD D3 4D
	or a ; 9282E (24:682e) -> B7
	jp nz, label_92835 ; 9282F (24:682f) -> C2 35 68
	jp label_92844 ; 92832 (24:6832) -> C3 44 68
label_92835:
	ld hl, $0247 ; 92835 (24:6835) -> 21 47 02
	scall PrintTextStandard ; 92838 (24:6838) -> CD 98 44
	jp label_92844 ; 9283B (24:683b) -> C3 44 68
label_9283e:
	ld hl, $0228 ; 9283E (24:683e) -> 21 28 02
	scall PrintTextStandard ; 92841 (24:6841) -> CD 98 44
label_92844:
	ret  ; 92844 (24:6844) -> C9

Data_92845:
	dstr "ソﾞッキー"

Data_9284b:
	db $07, $0e, $01, $01, $09, $00, $05, $2c, $05, $2d, $2e

Data_92856:
	db $2a, $0d, $03, $03, $18

Data_9285b:
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_92893:
	db $00, $0d, $0f, $0d, $1f, $0f, $12, $2e, $17, $00, $00, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_928d9:
	db $00, $0d, $0f, $0d, $20, $0f, $12, $2e, $17, $17, $00, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Data_9291f:
	db $00, $0d, $0f, $0d, $21, $0f, $12, $2e, $17, $17, $17, $03, $0c, $00
	db $00, $0d, $0f, $0d, $73, $0f, $12, $0d, $06, $09, $0b, $0c, $08, $00
	db $00, $0d, $0f, $0d, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00
	db $09, $03, $09, $0a, $73, $0f, $12, $0d, $06, $09, $0b, $0d, $08, $00
	db $09, $03, $09, $0a, $3e, $0f, $12, $23, $1f, $17, $00, $03, $08, $00

Func_92965:: ; 92965
	ld e, $01 ; 92965 (24:6965) -> 1E 01
	ld hl, Data_9284b ; 92967 (24:6967) -> 21 4B 68
	scall LoadWarps ; 9296A (24:696a) -> CD 3A 40
	ld e, $01 ; 9296D (24:696d) -> 1E 01
	ld hl, Data_92856 ; 9296F (24:696f) -> 21 56 68
	scall Func_80ce7 ; 92972 (24:6972) -> CD E7 4C
	ld a, $03 ; 92975 (24:6975) -> 3E 03
	scall Func_80d01 ; 92977 (24:6977) -> CD 01 4D
	ld a, $1f ; 9297A (24:697a) -> 3E 1F
	scall Func_80e6d ; 9297C (24:697c) -> CD 6D 4E
	cp $ff ; 9297F (24:697f) -> FE FF
	jp nz, label_92999 ; 92981 (24:6981) -> C2 99 69
	ld hl, $0039 ; 92984 (24:6984) -> 21 39 00
	scall CheckEventFlag ; 92987 (24:6987) -> CD 2E 46
	or a ; 9298A (24:698a) -> B7
	jp nz, label_92999 ; 9298B (24:698b) -> C2 99 69
	ld e, $05 ; 9298E (24:698e) -> 1E 05
	ld hl, Data_92893 ; 92990 (24:6990) -> 21 93 68
	scall LoadEncounters ; 92993 (24:6993) -> CD 24 4D
	jp label_929e0 ; 92996 (24:6996) -> C3 E0 69
label_92999:
	ld a, $20 ; 92999 (24:6999) -> 3E 20
	scall Func_80e6d ; 9299B (24:699b) -> CD 6D 4E
	cp $ff ; 9299E (24:699e) -> FE FF
	jp nz, label_929b8 ; 929A0 (24:69a0) -> C2 B8 69
	ld hl, $0047 ; 929A3 (24:69a3) -> 21 47 00
	scall CheckEventFlag ; 929A6 (24:69a6) -> CD 2E 46
	or a ; 929A9 (24:69a9) -> B7
	jp nz, label_929b8 ; 929AA (24:69aa) -> C2 B8 69
	ld e, $05 ; 929AD (24:69ad) -> 1E 05
	ld hl, Data_928d9 ; 929AF (24:69af) -> 21 D9 68
	scall LoadEncounters ; 929B2 (24:69b2) -> CD 24 4D
	jp label_929e0 ; 929B5 (24:69b5) -> C3 E0 69
label_929b8:
	ld a, $21 ; 929B8 (24:69b8) -> 3E 21
	scall Func_80e6d ; 929BA (24:69ba) -> CD 6D 4E
	cp $ff ; 929BD (24:69bd) -> FE FF
	jp nz, label_929d8 ; 929BF (24:69bf) -> C2 D8 69
	ld hl, $0047 ; 929C2 (24:69c2) -> 21 47 00
	scall CheckEventFlag ; 929C5 (24:69c5) -> CD 2E 46
	cp $01 ; 929C8 (24:69c8) -> FE 01
	jp nz, label_929d8 ; 929CA (24:69ca) -> C2 D8 69
	ld e, $05 ; 929CD (24:69cd) -> 1E 05
	ld hl, Data_9291f ; 929CF (24:69cf) -> 21 1F 69
	scall LoadEncounters ; 929D2 (24:69d2) -> CD 24 4D
	jp label_929e0 ; 929D5 (24:69d5) -> C3 E0 69
label_929d8:
	ld e, $04 ; 929D8 (24:69d8) -> 1E 04
	ld hl, Data_9285b ; 929DA (24:69da) -> 21 5B 68
	scall LoadEncounters ; 929DD (24:69dd) -> CD 24 4D
label_929e0:
	ld e, $04 ; 929E0 (24:69e0) -> 1E 04
	ld hl, Data_9285b ; 929E2 (24:69e2) -> 21 5B 68
	scall LoadEncounters ; 929E5 (24:69e5) -> CD 24 4D
	ld a, $01 ; 929E8 (24:69e8) -> 3E 01
	scall LoadPlayerSprite ; 929EA (24:69ea) -> CD C6 4C
	ld a, $08 ; 929ED (24:69ed) -> 3E 08
	scall PlayMusic ; 929EF (24:69ef) -> CD E6 4E
	scall Func_8001c ; 929F2 (24:69f2) -> CD 1C 40
	ld hl, $02e3 ; 929F5 (24:69f5) -> 21 E3 02
	scall LandmarkSign ; 929F8 (24:69f8) -> CD 72 4F
	ret  ; 929FB (24:69fb) -> C9

Data_929fc: ; 929fc
	db $12, $18, $01, $01, $09, $03, $0a, $19, $0a, $18, $2e
	db $10, $04, $01, $01, $09, $03, $08, $04, $07, $04, $2e
	db $24, $07, $01, $01, $09, $03, $1d, $06, $1c, $06, $2e
	db $01, $15, $01, $01, $02, $00, $05, $0e, $06, $0e, $2e

Data_92a28: ; 92a28
	db $2e, $1b, $03, $01, $36

Data_92a2d: ; 92a2d
IF DEF(SUN)
	db $00, $03, $14, $17, $2b, $03, $05, $0c, $06, $11, $00, $01, $0a, $00, $00, $03
	db $14, $17, $09, $02, $04, $22, $0f, $04, $00, $01, $08, $00, $00, $03, $14, $17
	db $8b, $04, $06, $2d, $26, $12, $00, $08, $06, $00, $0f, $03, $18, $17, $2b, $03
	db $05, $7f, $06, $06, $00, $01, $0a, $00, $0f, $03, $18, $17, $09, $02, $04, $5a
	db $0f, $03, $00, $01, $08, $00, $0f, $03, $18, $17, $8b, $04, $06, $39, $05, $05
	db $00, $08, $06, $00, $19, $03, $04, $17, $29, $06, $08, $0d, $01, $00, $00, $01
	db $03, $00
ELIF DEF(STAR)
	db $00, $03, $14, $17, $2b, $03, $05, $7f, $06, $11, $00, $01, $0a, $00, $00, $03
	db $14, $17, $0c, $02, $04, $22, $05, $01, $00, $01, $08, $00, $00, $03, $14, $17
	db $11, $04, $06, $01, $1f, $1e, $00, $08, $06, $00, $0f, $03, $18, $17, $2b, $03
	db $05, $7f, $06, $06, $00, $01, $0a, $00, $0f, $03, $18, $17, $0c, $02, $04, $5a
	db $05, $19, $00, $01, $08, $00, $0f, $03, $18, $17, $11, $04, $06, $00, $1f, $00
	db $00, $08, $06, $00, $19, $03, $04, $17, $2a, $06, $08, $0d, $05, $05, $00, $01
	db $03, $00
ENDC

Data_92a8f: ; 92a8f
	person_event $10, $04, $04, $04, $01, $01, $01, $04, $00, Func_92b08, NULL
	person_event $0b, $04, $21, $18, $01, $01, $03, $04, $00, Func_92b90, NULL

Func_92aab:: ; 92aab (24:6aab)
	ld e, $4
	ld hl, Data_929fc
	scall LoadWarps
	ld e, $1
	ld hl, Data_92a28
	scall Func_80ce7
	ld a, $3
	scall Func_80d01
	ld e, $7
	ld hl, Data_92a2d
	scall LoadEncounters
	ld e, $2
	ld hl, Data_92a8f
	scall LoadMapObjects
	ld a, $8
	scall PlayMusic
	scall Func_8001c
	landmarksign TreeBitstreamText_46cec
	ret

Data_92adf:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $20, $01, $47, $01, $06, $14, $0d
	db $1e, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b08:
	push af
	ld a, e
	or a
	jp nz, Func_92b5e
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8e
	scall CheckEventFlag
	or a
	jp nz, Func_92b58
	writetext TreeBitstreamText_42ae8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92b4f
	ld de, Data_92b60
	ld hl, Data_92adf
	scall ScriptedBattle
	or a
	jp nz, Func_92b3e
	jp Func_92b5e

Func_92b3e: ; 92b3e (24:6b3e)
	ld e, $1
	ld hl, $8e
	scall EventFlagAction
	writetext TreeBitstreamText_42af6
	jp Func_92b55

Func_92b4f: ; 92b4f (24:6b4f)
	writetext TreeBitstreamText_42ad0
Func_92b55: ; 92b55 (24:6b55)
	jp Func_92b5e

Func_92b58: ; 92b58 (24:6b58)
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
Func_92b5e: ; 92b5e (24:6b5e)
	pop bc
	ret

Data_92b60:
	dstr "レテﾞィース"

Data_92b67:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1f, $01, $62, $02, $06, $02, $03
	db $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92b90:
	push af
	ld a, e
	or a
	jp nz, Func_92be6
	ld hl, sp+$1
	ld a, [hl]
	scall FacePlayer
	ld hl, $8f
	scall CheckEventFlag
	or a
	jp nz, Func_92be0
	writetext TreeBitstreamText_42b02
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, Func_92bd7
	ld de, Data_92be8
	ld hl, Data_92b67
	scall ScriptedBattle
	or a
	jp nz, Func_92bc6
	jp Func_92be6

Func_92bc6: ; 92bc6 (24:6bc6)
	ld e, $1
	ld hl, $8f
	scall EventFlagAction
	ld hl, CheckSFXFinishedPredef
	scall PrintTextStandard
	jp Func_92bdd

Func_92bd7: ; 92bd7 (24:6bd7)
	writetext TreeBitstreamText_42b24
Func_92bdd: ; 92bdd (24:6bdd)
	jp Func_92be6

Func_92be0: ; 92be0 (24:6be0)
	ld hl, CheckSongFinishedPredef
	scall PrintTextStandard
Func_92be6: ; 92be6 (24:6be6)
	pop bc
	ret

Data_92be8:
	dstr "ソﾞッキー"

Data_92bee:
	db $08, $04, $01, $01, $09, $02, $10, $04, $10, $05, $2e
	db $0a, $19, $01, $01, $09, $02, $12, $18, $11, $18, $2e
	db $1d, $06, $01, $01, $09, $02, $24, $07, $24, $08, $2e

Data_92c0f:
	db $2f, $21, $1b, $03, $0d

Data_92c14:
IF DEF(SUN)
	db $00, $03, $13, $1b, $2b, $04, $06, $0c, $06, $11, $00, $01, $0a, $00
	db $00, $03, $13, $1b, $09, $03, $05, $22, $0f, $04, $00, $01, $08, $00
	db $00, $03, $13, $1b, $8b, $05, $07, $2d, $26, $12, $00, $08, $06, $00
	db $13, $03, $10, $19, $2b, $04, $06, $7f, $06, $06, $00, $01, $0a, $00
	db $13, $03, $10, $19, $09, $03, $05, $5a, $0f, $03, $00, $01, $08, $00
	db $13, $03, $10, $19, $8b, $05, $07, $39, $05, $05, $00, $08, $06, $00
	db $15, $0f, $0e, $10, $29, $07, $09, $0d, $01, $00, $00, $01, $02, $00
ELIF DEF(STAR)
	db $00, $03, $13, $1b, $2b, $04, $06, $7f, $06, $11, $00, $01, $0a, $00
	db $00, $03, $13, $1b, $0c, $03, $05, $22, $05, $01, $00, $03, $08, $00
	db $00, $03, $13, $1b, $11, $05, $07, $01, $1f, $1e, $00, $0d, $06, $00
	db $13, $03, $10, $19, $2b, $04, $06, $7f, $06, $06, $00, $01, $0a, $00
	db $13, $03, $10, $19, $0c, $03, $05, $5a, $05, $19, $00, $03, $08, $00
	db $13, $03, $10, $19, $11, $05, $07, $00, $1f, $00, $00, $0d, $06, $00
	db $15, $0f, $0e, $10, $2a, $07, $09, $0d, $05, $00, $00, $01, $02, $00
ENDC

Data_92c76:
	person_event $0b, $04, $11, $04, $01, $01, $03, $04, $00, Func_92cfe, NULL
	person_event $0f, $04, $01, $1c, $01, $01, $00, $04, $00, Func_92d5c, NULL

Func_92c92:: ; 92c92
	ld e, $03 ; 92C92 (24:6c92) -> 1E 03
	ld hl, Data_92bee ; 92C94 (24:6c94) -> 21 EE 6B
	scall LoadWarps ; 92C97 (24:6c97) -> CD 3A 40
	ld e, $01 ; 92C9A (24:6c9a) -> 1E 01
	ld hl, Data_92c0f ; 92C9C (24:6c9c) -> 21 0F 6C
	scall Func_80ce7 ; 92C9F (24:6c9f) -> CD E7 4C
	ld a, $03 ; 92CA2 (24:6ca2) -> 3E 03
	scall Func_80d01 ; 92CA4 (24:6ca4) -> CD 01 4D
	ld e, $07 ; 92CA7 (24:6ca7) -> 1E 07
	ld hl, Data_92c14 ; 92CA9 (24:6ca9) -> 21 14 6C
	scall LoadEncounters ; 92CAC (24:6cac) -> CD 24 4D
	ld e, $02 ; 92CAF (24:6caf) -> 1E 02
	ld hl, Data_92c76 ; 92CB1 (24:6cb1) -> 21 76 6C
	scall LoadMapObjects ; 92CB4 (24:6cb4) -> CD FB 40
	ld a, [wc797] ; 92CB7 (24:6cb7) -> FA 97 C7
	cp $07 ; 92CBA (24:6cba) -> FE 07
	jp z, label_92cc6 ; 92CBC (24:6cbc) -> CA C6 6C
	ld e, $00 ; 92CBF (24:6cbf) -> 1E 00
	ld a, $01 ; 92CC1 (24:6cc1) -> 3E 01
	scall SetPersonVisibilityState ; 92CC3 (24:6cc3) -> CD 3D 41
label_92cc6:
	ld a, $08 ; 92CC6 (24:6cc6) -> 3E 08
	scall PlayMusic ; 92CC8 (24:6cc8) -> CD E6 4E
	scall Func_8001c ; 92CCB (24:6ccb) -> CD 1C 40
	ld hl, $03f2 ; 92CCE (24:6cce) -> 21 F2 03
	scall LandmarkSign ; 92CD1 (24:6cd1) -> CD 72 4F
	ret  ; 92CD4 (24:6cd4) -> C9

Data_92cd5:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1e, $01, $1e, $02
	db $07, $17, $17, $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92cfe:
	push af ; 92CFE (24:6cfe) -> F5
	ld a, e ; 92CFF (24:6cff) -> 7B
	or a ; 92D00 (24:6d00) -> B7
	jp nz, label_92d54 ; 92D01 (24:6d01) -> C2 54 6D
	ld hl, sp+$01 ; 92D04 (24:6d04) -> F8 01
	ld a, [hl] ; 92D06 (24:6d06) -> 7E
	scall FacePlayer ; 92D07 (24:6d07) -> CD 4B 44
	ld hl, $0090 ; 92D0A (24:6d0a) -> 21 90 00
	scall CheckEventFlag ; 92D0D (24:6d0d) -> CD 2E 46
	or a ; 92D10 (24:6d10) -> B7
	jp nz, label_92d4e ; 92D11 (24:6d11) -> C2 4E 6D
	ld hl, $024a ; 92D14 (24:6d14) -> 21 4A 02
	scall PrintTextStandard ; 92D17 (24:6d17) -> CD 98 44
	ld hl, $032c ; 92D1A (24:6d1a) -> 21 2C 03
	scall PrintTextWithYesNoBox ; 92D1D (24:6d1d) -> CD BA 44
	or a ; 92D20 (24:6d20) -> B7
	jp nz, label_92d45 ; 92D21 (24:6d21) -> C2 45 6D
	ld de, Data_92d56 ; 92D24 (24:6d24) -> 11 56 6D
	ld hl, Data_92cd5 ; 92D27 (24:6d27) -> 21 D5 6C
	scall ScriptedBattle ; 92D2A (24:6d2a) -> CD D3 4D
	or a ; 92D2D (24:6d2d) -> B7
	jp nz, label_92d34 ; 92D2E (24:6d2e) -> C2 34 6D
	jp label_92d54 ; 92D31 (24:6d31) -> C3 54 6D
label_92d34:
	ld e, $01 ; 92D34 (24:6d34) -> 1E 01
	ld hl, $0090 ; 92D36 (24:6d36) -> 21 90 00
	scall EventFlagAction ; 92D39 (24:6d39) -> CD 1B 46
	ld hl, $024a ; 92D3C (24:6d3c) -> 21 4A 02
	scall PrintTextStandard ; 92D3F (24:6d3f) -> CD 98 44
	jp label_92d4b ; 92D42 (24:6d42) -> C3 4B 6D
label_92d45:
	ld hl, $024a ; 92D45 (24:6d45) -> 21 4A 02
	scall PrintTextStandard ; 92D48 (24:6d48) -> CD 98 44
label_92d4b:
	jp label_92d54 ; 92D4B (24:6d4b) -> C3 54 6D
label_92d4e:
	ld hl, $024a ; 92D4E (24:6d4e) -> 21 4A 02
	scall PrintTextStandard ; 92D51 (24:6d51) -> CD 98 44
label_92d54:
	pop bc ; 92D54 (24:6d54) -> C1
	ret  ; 92D55 (24:6d55) -> C9

Data_92d56:
	dstr "ソﾞッキー"

Func_92d5c:
	push af ; 92D5C (24:6d5c) -> F5
	ld a, e ; 92D5D (24:6d5d) -> 7B
	or a ; 92D5E (24:6d5e) -> B7
	jp nz, label_92db9 ; 92D5F (24:6d5f) -> C2 B9 6D
	ld hl, sp+$01 ; 92D62 (24:6d62) -> F8 01
	ld a, [hl] ; 92D64 (24:6d64) -> 7E
	scall FacePlayer ; 92D65 (24:6d65) -> CD 4B 44
	ld hl, $0014 ; 92D68 (24:6d68) -> 21 14 00
	scall CheckEventFlag ; 92D6B (24:6d6b) -> CD 2E 46
	or a ; 92D6E (24:6d6e) -> B7
	jp nz, label_92db3 ; 92D6F (24:6d6f) -> C2 B3 6D
	ld a, $17 ; 92D72 (24:6d72) -> 3E 17
	scall Func_80e5d ; 92D74 (24:6d74) -> CD 5D 4E
	cp $01 ; 92D77 (24:6d77) -> FE 01
	jp nz, label_92daa ; 92D79 (24:6d79) -> C2 AA 6D
	ld hl, $033e ; 92D7C (24:6d7c) -> 21 3E 03
	scall PrintTextWithNPCName ; 92D7F (24:6d7f) -> CD A9 44
	ld a, $2a ; 92D82 (24:6d82) -> 3E 2A
	scall PlaySFX ; 92D84 (24:6d84) -> CD FE 4E
	ld hl, $0340 ; 92D87 (24:6d87) -> 21 40 03
	scall PrintTextStandard ; 92D8A (24:6d8a) -> CD 98 44
	ld e, $01 ; 92D8D (24:6d8d) -> 1E 01
	ld hl, $0014 ; 92D8F (24:6d8f) -> 21 14 00
	scall EventFlagAction ; 92D92 (24:6d92) -> CD 1B 46
	ld c, $01 ; 92D95 (24:6d95) -> 0E 01
	ld e, $01 ; 92D97 (24:6d97) -> 1E 01
	ld a, $17 ; 92D99 (24:6d99) -> 3E 17
	scall Func_80d4d ; 92D9B (24:6d9b) -> CD 4D 4D
	ld c, $00 ; 92D9E (24:6d9e) -> 0E 00
	ld e, $01 ; 92DA0 (24:6da0) -> 1E 01
	ld a, $16 ; 92DA2 (24:6da2) -> 3E 16
	scall Func_80d4d ; 92DA4 (24:6da4) -> CD 4D 4D
	jp label_92db0 ; 92DA7 (24:6da7) -> C3 B0 6D
label_92daa:
	ld hl, $047a ; 92DAA (24:6daa) -> 21 7A 04
	scall PrintTextWithNPCName ; 92DAD (24:6dad) -> CD A9 44
label_92db0:
	jp label_92db9 ; 92DB0 (24:6db0) -> C3 B9 6D
label_92db3:
	ld hl, $0341 ; 92DB3 (24:6db3) -> 21 41 03
	scall PrintTextWithNPCName ; 92DB6 (24:6db6) -> CD A9 44
label_92db9:
	pop bc ; 92DB9 (24:6db9) -> C1
	ret  ; 92DBA (24:6dba) -> C9

Data_92dba:
	db $01, $06, $02, $01, $09, $00, $08
	db $04, $08, $05, $34, $9b, $03, $ff, $ff, $1f, $0c, $02, $04, $01, $01, $02, $04
	db $00, $24, $00, $00, $00, $00, $18, $04, $01, $04, $01, $01, $02, $04, $00, $24
	db $00, $00, $00, $00, $1f, $0c, $02, $04, $01, $01, $02, $04, $00, $24, $fc, $48
	db $c6, $6d, $18, $04, $01, $04, $01, $01, $02, $04, $00, $24, $00, $00, $00, $00

Func_92e02:: ; 92e02
	db $1e, $01, $21, $bb, $6d, $cd, $3a, $40, $3e, $01, $cd, $c6, $4c, $21, $15, $00
	db $cd, $2e, $46, $b7, $c2, $32, $6e, $1e, $02, $21, $ca, $6d, $cd, $fb, $40, $cd
	db $1c, $40, $cd, $6d, $6e, $1e, $01, $21, $15, $00, $cd, $1b, $46, $c3, $5c, $6e
	db $fa, $90, $c7, $b7, $ca, $54, $6e, $fa, $90, $c7, $fe, $06, $d2, $54, $6e, $1e
	db $02, $21, $e6, $6d, $cd, $fb, $40, $3e, $11, $cd, $e6, $4e, $cd, $1c, $40, $c3
	db $5c, $6e, $3e, $11, $cd, $e6, $4e, $cd, $1c, $40, $c9, $02, $02, $05, $02, $03
	db $02, $04, $02, $ff, $ff, $02, $02, $02, $04, $ff, $ff, $1e, $01, $af, $cd, $1e
	db $4e, $af, $cd, $e6, $4e, $3e, $01, $cd, $e6, $4e, $21, $a3, $00, $cd, $a9, $44
	db $af, $cd, $e6, $4e, $1e, $03, $af, $cd, $95, $40, $0e, $01, $1e, $01, $3e, $10
	db $cd, $76, $41, $3e, $34, $cd, $fe, $4e, $1e, $00, $af, $cd, $3d, $41, $3e, $3d
	db $cd, $fe, $4e, $cd, $d5, $41, $21, $a4, $00, $cd, $a9, $44, $0e, $01, $1e, $02
	db $3e, $10, $cd, $76, $41, $3e, $34, $cd, $fe, $4e, $cd, $d5, $41, $1e, $01, $af
	db $cd, $3d, $41, $cd, $8b, $41, $1e, $01, $af, $cd, $95, $40, $01, $5d, $6e, $1e
	db $24, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $af, $cd, $95, $40, $0e, $01
	db $1e, $01, $3e, $05, $cd, $76, $41, $1e, $02, $3e, $04, $cd, $e4, $41, $3e, $28
	db $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $01, $67, $6e, $1e, $24, $af, $cd
	db $88, $46, $cd, $0c, $42, $1e, $03, $af, $cd, $95, $40, $0e, $01, $1e, $01, $3e
	db $10, $cd, $76, $41, $3e, $34, $cd, $fe, $4e, $1e, $00, $af, $cd, $3d, $41, $cd
	db $d5, $41, $21, $a5, $00, $cd, $98, $44, $af, $cd, $e6, $4e, $3e, $1b, $cd, $e6
	db $4e, $0e, $02, $1e, $04, $3e, $10, $cd, $76, $41, $cd, $d5, $41, $3e, $69, $cd
	db $fe, $4e, $21, $a6, $00, $cd, $a9, $44, $af, $cd, $e6, $4e, $0e, $01, $1e, $02
	db $3e, $10, $cd, $76, $41, $cd, $d5, $41, $3e, $34, $cd, $fe, $4e, $1e, $01, $af
	db $cd, $3d, $41, $cd, $8b, $41, $1e, $01, $af, $cd, $95, $40, $01, $5d, $6e, $1e
	db $24, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $af, $cd, $95, $40, $0e, $01
	db $1e, $01, $3e, $05, $cd, $76, $41, $1e, $02, $3e, $04, $cd, $e4, $41, $3e, $28
	db $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $01, $67, $6e, $1e, $24, $af, $cd
	db $88, $46, $cd, $0c, $42, $1e, $03, $af, $cd, $95, $40, $0e, $01, $1e, $01, $3e
	db $10, $cd, $76, $41, $3e, $34, $cd, $fe, $4e, $1e, $00, $af, $cd, $3d, $41, $cd
	db $d5, $41, $21, $a7, $00, $cd, $a9, $44, $af, $cd, $e6, $4e, $3e, $1b, $cd, $e6
	db $4e, $0e, $02, $1e, $08, $3e, $10, $cd, $76, $41, $cd, $d5, $41, $3e, $69, $cd
	db $fe, $4e, $21, $a8, $00, $cd, $a9, $44, $af, $cd, $e6, $4e, $0e, $01, $1e, $02
	db $3e, $10, $cd, $76, $41, $cd, $d5, $41, $3e, $34, $cd, $fe, $4e, $1e, $01, $af
	db $cd, $3d, $41, $cd, $8b, $41, $1e, $01, $af, $cd, $95, $40, $01, $5d, $6e, $1e
	db $24, $af, $cd, $88, $46, $cd, $0c, $42, $1e, $02, $af, $cd, $95, $40, $0e, $01
	db $1e, $01, $3e, $05, $cd, $76, $41, $1e, $02, $3e, $04, $cd, $e4, $41, $3e, $28
	db $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $01, $67, $6e, $1e, $24, $af, $cd
	db $88, $46, $cd, $0c, $42, $3e, $34, $cd, $fe, $4e, $1e, $03, $af, $cd, $95, $40
	db $0e, $01, $1e, $50, $3e, $10, $cd, $76, $41, $3e, $34, $cd, $fe, $4e, $1e, $00
	db $af, $cd, $3d, $41, $cd, $d5, $41, $3e, $68, $cd, $fe, $4e, $21, $a9, $00, $cd
	db $a9, $44, $1e, $00, $3e, $01, $cd, $3d, $41, $0e, $01, $1e, $20, $3e, $10, $cd
	db $76, $41, $3e, $4d, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $1e, $01, $3e
	db $02, $cd, $1e, $4e, $c9

