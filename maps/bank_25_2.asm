INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 25, 2", ROMX
	script_library 25_2

Data_96d59:
	db $0b, $0f, $05, $01, $1e, $00, $0c, $0b, $0b, $0b, $2e
    db $09, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0b, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0d, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0f, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $11, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e

Data_96d9b:
	db $3b, $03, $ff, $ff

Data_96d9f:
	person_event $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b
	person_event $ff, $00, $10, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b

Func_96dbb:: ; 96dbb
	ld e, $06 ; 96DBB (25:6dbb) -> 1E 06
	ld hl, Data_96d59 ; 96DBD (25:6dbd) -> 21 59 6D
	scall LoadWarps ; 96DC0 (25:6dc0) -> CD DF 5C
	ld e, $02 ; 96DC3 (25:6dc3) -> 1E 02
	ld hl, Data_96d9f ; 96DC5 (25:6dc5) -> 21 9F 6D
	scall LoadMapObjects ; 96DC8 (25:6dc8) -> CD A0 5D
	ld a, $0a ; 96DCB (25:6dcb) -> 3E 0A
	scall PlayMusic ; 96DCD (25:6dcd) -> CD 8B 6B
	ld a, $04 ; 96DD0 (25:6dd0) -> 3E 04
	scall LoadPlayerSprite ; 96DD2 (25:6dd2) -> CD 6B 69
	scall Func_8001c ; 96DD5 (25:6dd5) -> CD C1 5C
	ret  ; 96DD8 (25:6dd8) -> C9

Data_96dd9:
	db $08, $2c, $03, $01, $0c, $00, $0d, $04, $0d, $05, $2e
    db $09, $03, $01, $01, $0c, $02, $1c, $0a, $1b, $0a, $2e

Data_96def:
    db $9f, $04, $ff, $ff

Data_96df3:
    db $a2, $04, $ff, $ff

Data_96df7:
    db $a3, $04, $ff, $ff

Data_96dfb:
	db $a4, $04, $ff, $ff

Data_96dff:
    db $a5, $04, $ff, $ff

Data_96e03:
    db $a6, $04, $ff, $ff

Data_96e07:
    db $a7, $04, $ff, $ff

Data_96e0b:
	person_event $08, $04, $07, $12, $01, $01, $02, $04, $00, Func_96f2b, NULL
    person_event $08, $04, $03, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df3
    person_event $08, $04, $04, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df7
    person_event $08, $04, $05, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dfb
    person_event $08, $04, $06, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dff
    person_event $08, $04, $0d, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e03
    person_event $08, $04, $0e, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e07
    person_event $04, $0c, $09, $23, $01, $01, $02, $04, $00, NULL, NULL
    person_event $ff, $00, $08, $24, $03, $01, $02, $04, $01, Func_970d8, NULL
    person_event $04, $04, $07, $22, $01, $01, $01, $04, $00, Func_808fc_25_2, Data_96def

Func_96e97:: ; 96e97
	ld l, $00 ; 96E97 (25:6e97) -> 2E 00
	push hl ; 96E99 (25:6e99) -> E5
	ld c, $06 ; 96E9A (25:6e9a) -> 0E 06
	ld e, $0d ; 96E9C (25:6e9c) -> 1E 0D
	ld a, $02 ; 96E9E (25:6e9e) -> 3E 02
	scall Func_80f24 ; 96EA0 (25:6ea0) -> CD C9 6B
	pop bc ; 96EA3 (25:6ea3) -> C1
	ld l, $00 ; 96EA4 (25:6ea4) -> 2E 00
	push hl ; 96EA6 (25:6ea6) -> E5
	ld c, $06 ; 96EA7 (25:6ea7) -> 0E 06
	ld e, $0d ; 96EA9 (25:6ea9) -> 1E 0D
	ld a, $0b ; 96EAB (25:6eab) -> 3E 0B
	scall Func_80f24 ; 96EAD (25:6ead) -> CD C9 6B
	pop bc ; 96EB0 (25:6eb0) -> C1
	ld l, $01 ; 96EB1 (25:6eb1) -> 2E 01
	push hl ; 96EB3 (25:6eb3) -> E5
	ld c, $03 ; 96EB4 (25:6eb4) -> 0E 03
	ld e, $0b ; 96EB6 (25:6eb6) -> 1E 0B
	ld a, $07 ; 96EB8 (25:6eb8) -> 3E 07
	scall Func_80f24 ; 96EBA (25:6eba) -> CD C9 6B
	pop bc ; 96EBD (25:6ebd) -> C1
	ld l, $01 ; 96EBE (25:6ebe) -> 2E 01
	push hl ; 96EC0 (25:6ec0) -> E5
	ld c, $03 ; 96EC1 (25:6ec1) -> 0E 03
	ld e, $0b ; 96EC3 (25:6ec3) -> 1E 0B
	ld a, $0a ; 96EC5 (25:6ec5) -> 3E 0A
	scall Func_80f24 ; 96EC7 (25:6ec7) -> CD C9 6B
	pop bc ; 96ECA (25:6eca) -> C1
	ld l, $01 ; 96ECB (25:6ecb) -> 2E 01
	push hl ; 96ECD (25:6ecd) -> E5
	ld c, $03 ; 96ECE (25:6ece) -> 0E 03
	ld e, $0e ; 96ED0 (25:6ed0) -> 1E 0E
	ld a, $01 ; 96ED2 (25:6ed2) -> 3E 01
	scall Func_80f24 ; 96ED4 (25:6ed4) -> CD C9 6B
	pop bc ; 96ED7 (25:6ed7) -> C1
	ld l, $01 ; 96ED8 (25:6ed8) -> 2E 01
	push hl ; 96EDA (25:6eda) -> E5
	ld c, $03 ; 96EDB (25:6edb) -> 0E 03
	ld e, $0e ; 96EDD (25:6edd) -> 1E 0E
	ld a, $10 ; 96EDF (25:6edf) -> 3E 10
	scall Func_80f24 ; 96EE1 (25:6ee1) -> CD C9 6B
	pop bc ; 96EE4 (25:6ee4) -> C1
	ld e, $02 ; 96EE5 (25:6ee5) -> 1E 02
	ld hl, Data_96dd9 ; 96EE7 (25:6ee7) -> 21 D9 6D
	scall LoadWarps ; 96EEA (25:6eea) -> CD DF 5C
	ld e, $0a ; 96EED (25:6eed) -> 1E 0A
	ld hl, Data_96e0b ; 96EEF (25:6eef) -> 21 0B 6E
	scall LoadMapObjects ; 96EF2 (25:6ef2) -> CD A0 5D
	ld hl, $010e ; 96EF5 (25:6ef5) -> 21 0E 01
	scall CheckEventFlag ; 96EF8 (25:6ef8) -> CD D3 62
	cp $01 ; 96EFB (25:6efb) -> FE 01
	jp nz, .asm_96f11 ; 96EFD (25:6efd) -> C2 11 6F
	ld e, $00 ; 96F00 (25:6f00) -> 1E 00
	ld a, $07 ; 96F02 (25:6f02) -> 3E 07
	scall SetPersonVisibilityState ; 96F04 (25:6f04) -> CD E2 5D
	ld e, $00 ; 96F07 (25:6f07) -> 1E 00
	ld a, $08 ; 96F09 (25:6f09) -> 3E 08
	scall SetPersonVisibilityState ; 96F0B (25:6f0b) -> CD E2 5D
	jp .asm_96f18 ; 96F0E (25:6f0e) -> C3 18 6F
.asm_96f11:
	ld e, $00 ; 96F11 (25:6f11) -> 1E 00
	ld a, $09 ; 96F13 (25:6f13) -> 3E 09
	scall SetPersonVisibilityState ; 96F15 (25:6f15) -> CD E2 5D
.asm_96f18:
	ld a, $07 ; 96F18 (25:6f18) -> 3E 07
	scall PlayMusic ; 96F1A (25:6f1a) -> CD 8B 6B
	scall Func_8001c ; 96F1D (25:6f1d) -> CD C1 5C
	ret  ; 96F20 (25:6f20) -> C9

Data_96f21:
	db $09, $12, $ff, $ff

Data_96f25:
    db $06, $13, $09, $12, $ff, $ff

Func_96f2b:
	ld a, e ; 96F2B (25:6f2b) -> 7B
	or a ; 96F2C (25:6f2c) -> B7
	jp nz, .asm_970c9 ; 96F2D (25:6f2d) -> C2 C9 70
	xor a ; 96F30 (25:6f30) -> AF
	scall FacePlayer ; 96F31 (25:6f31) -> CD F0 60
	ld hl, $00f4 ; 96F34 (25:6f34) -> 21 F4 00
	scall PrintTextWithYesNoBox ; 96F37 (25:6f37) -> CD 5F 61
	or a ; 96F3A (25:6f3a) -> B7
	jp nz, .asm_970c3 ; 96F3B (25:6f3b) -> C2 C3 70
	ld hl, $001e ; 96F3E (25:6f3e) -> 21 1E 00
	scall ScriptSleep ; 96F41 (25:6f41) -> CD 34 63
	ld a, [wPlayerFacing] ; 96F44 (25:6f44) -> FA 38 C8
	cp $01 ; 96F47 (25:6f47) -> FE 01
	jp nz, .asm_96f60 ; 96F49 (25:6f49) -> C2 60 6F
	ld c, $01 ; 96F4C (25:6f4c) -> 0E 01
	ld de, Data_96f25 ; 96F4E (25:6f4e) -> 11 25 6F
	ld a, $25 ; 96F51 (25:6f51) -> 3E 25
	scall MovePlayer ; 96F53 (25:6f53) -> CD E3 62
	scall WaitNPCStep ; 96F56 (25:6f56) -> CD B1 5E
	xor a ; 96F59 (25:6f59) -> AF
	scall PlayerFace ; 96F5A (25:6f5a) -> CD 1C 63
	jp .asm_96f71 ; 96F5D (25:6f5d) -> C3 71 6F
.asm_96f60:
	ld c, $01 ; 96F60 (25:6f60) -> 0E 01
	ld de, Data_96f21 ; 96F62 (25:6f62) -> 11 21 6F
	ld a, $25 ; 96F65 (25:6f65) -> 3E 25
	scall MovePlayer ; 96F67 (25:6f67) -> CD E3 62
	scall WaitNPCStep ; 96F6A (25:6f6a) -> CD B1 5E
	xor a ; 96F6D (25:6f6d) -> AF
	scall PlayerFace ; 96F6E (25:6f6e) -> CD 1C 63
.asm_96f71:
	ld hl, $03a1 ; 96F71 (25:6f71) -> 21 A1 03
	scall PrintTextStandard ; 96F74 (25:6f74) -> CD 3D 61
	ld hl, $001e ; 96F77 (25:6f77) -> 21 1E 00
	scall ScriptSleep ; 96F7A (25:6f7a) -> CD 34 63
	ld a, $0a ; 96F7D (25:6f7d) -> 3E 0A
	scall FadeOutAudio ; 96F7F (25:6f7f) -> CD 96 6C
	xor a ; 96F82 (25:6f82) -> AF
	scall PlayMusic ; 96F83 (25:6f83) -> CD 8B 6B
	ld a, $01 ; 96F86 (25:6f86) -> 3E 01
	scall FadeInAudio ; 96F88 (25:6f88) -> CD BF 6C
	ld a, $0d ; 96F8B (25:6f8b) -> 3E 0D
	scall PlayMusic ; 96F8D (25:6f8d) -> CD 8B 6B
	xor a ; 96F90 (25:6f90) -> AF
.asm_96f91:
	cp $05 ; 96F91 (25:6f91) -> FE 05
	jp nc, .asm_96fa2 ; 96F93 (25:6f93) -> D2 A2 6F
	push af ; 96F96 (25:6f96) -> F5
	ld e, $01 ; 96F97 (25:6f97) -> 1E 01
	xor a ; 96F99 (25:6f99) -> AF
	scall PlayerStep ; 96F9A (25:6f9a) -> CD C3 6A
	pop af ; 96F9D (25:6f9d) -> F1
	inc a ; 96F9E (25:6f9e) -> 3C
	jp .asm_96f91 ; 96F9F (25:6f9f) -> C3 91 6F
.asm_96fa2:
	ld hl, $001e ; 96FA2 (25:6fa2) -> 21 1E 00
	scall ScriptSleep ; 96FA5 (25:6fa5) -> CD 34 63
	ld e, $00 ; 96FA8 (25:6fa8) -> 1E 00
	ld a, $01 ; 96FAA (25:6faa) -> 3E 01
	scall SetPersonVisibilityState ; 96FAC (25:6fac) -> CD E2 5D
	ld e, $00 ; 96FAF (25:6faf) -> 1E 00
	ld a, $02 ; 96FB1 (25:6fb1) -> 3E 02
	scall SetPersonVisibilityState ; 96FB3 (25:6fb3) -> CD E2 5D
	ld e, $00 ; 96FB6 (25:6fb6) -> 1E 00
	ld a, $03 ; 96FB8 (25:6fb8) -> 3E 03
	scall SetPersonVisibilityState ; 96FBA (25:6fba) -> CD E2 5D
	ld e, $00 ; 96FBD (25:6fbd) -> 1E 00
	ld a, $04 ; 96FBF (25:6fbf) -> 3E 04
	scall SetPersonVisibilityState ; 96FC1 (25:6fc1) -> CD E2 5D
	ld e, $00 ; 96FC4 (25:6fc4) -> 1E 00
	ld a, $05 ; 96FC6 (25:6fc6) -> 3E 05
	scall SetPersonVisibilityState ; 96FC8 (25:6fc8) -> CD E2 5D
	ld e, $00 ; 96FCB (25:6fcb) -> 1E 00
	ld a, $06 ; 96FCD (25:6fcd) -> 3E 06
	scall SetPersonVisibilityState ; 96FCF (25:6fcf) -> CD E2 5D
	ld e, $00 ; 96FD2 (25:6fd2) -> 1E 00
	ld a, $07 ; 96FD4 (25:6fd4) -> 3E 07
	scall SetPersonVisibilityState ; 96FD6 (25:6fd6) -> CD E2 5D
	ld e, $00 ; 96FD9 (25:6fd9) -> 1E 00
	ld a, $08 ; 96FDB (25:6fdb) -> 3E 08
	scall SetPersonVisibilityState ; 96FDD (25:6fdd) -> CD E2 5D
	ld e, $00 ; 96FE0 (25:6fe0) -> 1E 00
	ld a, $09 ; 96FE2 (25:6fe2) -> 3E 09
	scall SetPersonVisibilityState ; 96FE4 (25:6fe4) -> CD E2 5D
	ld c, $01 ; 96FE7 (25:6fe7) -> 0E 01
	ld e, $0f ; 96FE9 (25:6fe9) -> 1E 0F
	ld a, $24 ; 96FEB (25:6feb) -> 3E 24
	scall LoadEmote ; 96FED (25:6fed) -> CD 1B 5E
	ld e, $06 ; 96FF0 (25:6ff0) -> 1E 06
	ld a, $09 ; 96FF2 (25:6ff2) -> 3E 09
	scall MoveEmote ; 96FF4 (25:6ff4) -> CD 89 5E
	scall WaitEmote ; 96FF7 (25:6ff7) -> CD 7A 5E
	ld c, $01 ; 96FFA (25:6ffa) -> 0E 01
	ld e, $4f ; 96FFC (25:6ffc) -> 1E 4F
	ld a, $25 ; 96FFE (25:6ffe) -> 3E 25
	scall LoadEmote ; 97000 (25:7000) -> CD 1B 5E
	ld e, $06 ; 97003 (25:7003) -> 1E 06
	ld a, $09 ; 97005 (25:7005) -> 3E 09
	scall MoveEmote ; 97007 (25:7007) -> CD 89 5E
	ld hl, $0168 ; 9700A (25:700a) -> 21 68 01
	scall ScriptSleep ; 9700D (25:700d) -> CD 34 63
	ld a, $68 ; 97010 (25:7010) -> 3E 68
	scall PlaySFX ; 97012 (25:7012) -> CD A3 6B
	ld hl, $001e ; 97015 (25:7015) -> 21 1E 00
	scall ScriptSleep ; 97018 (25:7018) -> CD 34 63
	ld a, $68 ; 9701B (25:701b) -> 3E 68
	scall PlaySFX ; 9701D (25:701d) -> CD A3 6B
	ld hl, $001e ; 97020 (25:7020) -> 21 1E 00
	scall ScriptSleep ; 97023 (25:7023) -> CD 34 63
	ld a, $68 ; 97026 (25:7026) -> 3E 68
	scall PlaySFX ; 97028 (25:7028) -> CD A3 6B
	ld hl, $001e ; 9702B (25:702b) -> 21 1E 00
	scall ScriptSleep ; 9702E (25:702e) -> CD 34 63
	ld a, $68 ; 97031 (25:7031) -> 3E 68
	scall PlaySFX ; 97033 (25:7033) -> CD A3 6B
	scall WaitEmote ; 97036 (25:7036) -> CD 7A 5E
	scall HideEmote ; 97039 (25:7039) -> CD 30 5E
	ld a, $0a ; 9703C (25:703c) -> 3E 0A
	scall FadeOutAudio ; 9703E (25:703e) -> CD 96 6C
	xor a ; 97041 (25:7041) -> AF
	scall PlayMusic ; 97042 (25:7042) -> CD 8B 6B
	ld hl, $001e ; 97045 (25:7045) -> 21 1E 00
	scall ScriptSleep ; 97048 (25:7048) -> CD 34 63
	ld e, $01 ; 9704B (25:704b) -> 1E 01
	ld a, $03 ; 9704D (25:704d) -> 3E 03
	scall SetPersonVisibilityState ; 9704F (25:704f) -> CD E2 5D
	ld e, $01 ; 97052 (25:7052) -> 1E 01
	ld a, $04 ; 97054 (25:7054) -> 3E 04
	scall SetPersonVisibilityState ; 97056 (25:7056) -> CD E2 5D
	xor a ; 97059 (25:7059) -> AF
.asm_9705a:
	cp $05 ; 9705A (25:705a) -> FE 05
	jp nc, .asm_9706c ; 9705C (25:705c) -> D2 6C 70
	push af ; 9705F (25:705f) -> F5
	ld e, $01 ; 97060 (25:7060) -> 1E 01
	ld a, $02 ; 97062 (25:7062) -> 3E 02
	scall PlayerStep ; 97064 (25:7064) -> CD C3 6A
	pop af ; 97067 (25:7067) -> F1
	inc a ; 97068 (25:7068) -> 3C
	jp .asm_9705a ; 97069 (25:7069) -> C3 5A 70
.asm_9706c:
	ld hl, $001e ; 9706C (25:706c) -> 21 1E 00
	scall ScriptSleep ; 9706F (25:706f) -> CD 34 63
	scall RepairRobots ; 97072 (25:7072) -> CD 85 5F
	ld a, $01 ; 97075 (25:7075) -> 3E 01
	scall FadeInAudio ; 97077 (25:7077) -> CD BF 6C
	xor a ; 9707A (25:707a) -> AF
	scall PlayMusic ; 9707B (25:707b) -> CD 8B 6B
	ld a, $16 ; 9707E (25:707e) -> 3E 16
	scall PlayMusic ; 97080 (25:7080) -> CD 8B 6B
	ld c, $01 ; 97083 (25:7083) -> 0E 01
	ld e, $02 ; 97085 (25:7085) -> 1E 02
	ld a, $08 ; 97087 (25:7087) -> 3E 08
	scall LoadEmote ; 97089 (25:7089) -> CD 1B 5E
	scall WaitEmote ; 9708C (25:708c) -> CD 7A 5E
	scall HideEmote ; 9708F (25:708f) -> CD 30 5E
	ld hl, $0322 ; 97092 (25:7092) -> 21 22 03
	scall PrintTextStandard ; 97095 (25:7095) -> CD 3D 61
	ld e, $01 ; 97098 (25:7098) -> 1E 01
	ld a, $01 ; 9709A (25:709a) -> 3E 01
	scall SetPersonVisibilityState ; 9709C (25:709c) -> CD E2 5D
	ld e, $01 ; 9709F (25:709f) -> 1E 01
	ld a, $02 ; 970A1 (25:70a1) -> 3E 02
	scall SetPersonVisibilityState ; 970A3 (25:70a3) -> CD E2 5D
	ld e, $01 ; 970A6 (25:70a6) -> 1E 01
	ld a, $05 ; 970A8 (25:70a8) -> 3E 05
	scall SetPersonVisibilityState ; 970AA (25:70aa) -> CD E2 5D
	ld e, $01 ; 970AD (25:70ad) -> 1E 01
	ld a, $06 ; 970AF (25:70af) -> 3E 06
	scall SetPersonVisibilityState ; 970B1 (25:70b1) -> CD E2 5D
	ld e, $01 ; 970B4 (25:70b4) -> 1E 01
	ld a, $09 ; 970B6 (25:70b6) -> 3E 09
	scall SetPersonVisibilityState ; 970B8 (25:70b8) -> CD E2 5D
	ld a, $07 ; 970BB (25:70bb) -> 3E 07
	scall PlayMusic ; 970BD (25:70bd) -> CD 8B 6B
	jp .asm_970c9 ; 970C0 (25:70c0) -> C3 C9 70
.asm_970c3:
	ld hl, $0203 ; 970C3 (25:70c3) -> 21 03 02
	scall PrintTextStandard ; 970C6 (25:70c6) -> CD 3D 61
.asm_970c9:
	ret  ; 970C9 (25:70c9) -> C9

Data_970ca:
    db $09, $22, $07, $22, $ff, $ff

Data_970d0:
    db $09, $24, $ff, $ff,

Data_970d4:
    db 09, $26, $ff, $ff

Func_970d8:
	ld a, e ; 970D8 (25:70d8) -> 7B
	cp $02 ; 970D9 (25:70d9) -> FE 02
	jp nz, .asm_9714f ; 970DB (25:70db) -> C2 4F 71
	ld c, $01 ; 970DE (25:70de) -> 0E 01
	ld de, Data_970d0 ; 970E0 (25:70e0) -> 11 D0 70
	ld a, $25 ; 970E3 (25:70e3) -> 3E 25
	scall MovePlayer ; 970E5 (25:70e5) -> CD E3 62
	scall WaitNPCStep ; 970E8 (25:70e8) -> CD B1 5E
	xor a ; 970EB (25:70eb) -> AF
	scall PlayerFace ; 970EC (25:70ec) -> CD 1C 63
	ld a, $18 ; 970EF (25:70ef) -> 3E 18
	scall Func_80e5d ; 970F1 (25:70f1) -> CD 02 6B
	or a ; 970F4 (25:70f4) -> B7
	jp z, .asm_97136 ; 970F5 (25:70f5) -> CA 36 71
	ld hl, $04a0 ; 970F8 (25:70f8) -> 21 A0 04
	scall PrintTextWithNPCName ; 970FB (25:70fb) -> CD 4E 61
	ld hl, $001e ; 970FE (25:70fe) -> 21 1E 00
	scall ScriptSleep ; 97101 (25:7101) -> CD 34 63
	ld bc, Data_970ca ; 97104 (25:7104) -> 01 CA 70
	ld e, $25 ; 97107 (25:7107) -> 1E 25
	ld a, $07 ; 97109 (25:7109) -> 3E 07
	scall MovePersonAndWait ; 9710B (25:710b) -> CD 2D 63
	scall WaitNPCStep ; 9710E (25:710e) -> CD B1 5E
	ld hl, $001e ; 97111 (25:7111) -> 21 1E 00
	scall ScriptSleep ; 97114 (25:7114) -> CD 34 63
	ld e, $01 ; 97117 (25:7117) -> 1E 01
	ld a, $07 ; 97119 (25:7119) -> 3E 07
	scall SpriteFace ; 9711B (25:711b) -> CD 3A 5D
	ld e, $01 ; 9711E (25:711e) -> 1E 01
	ld hl, $010e ; 97120 (25:7120) -> 21 0E 01
	scall EventFlagAction ; 97123 (25:7123) -> CD C0 62
	ld l, $24 ; 97126 (25:7126) -> 2E 24
	push hl ; 97128 (25:7128) -> E5
	ld c, $09 ; 97129 (25:7129) -> 0E 09
	ld e, $01 ; 9712B (25:712b) -> 1E 01
	ld a, $0c ; 9712D (25:712d) -> 3E 0C
	scall Func_80dff ; 9712F (25:712f) -> CD A4 6A
	pop bc ; 97132 (25:7132) -> C1
	jp .asm_9714f ; 97133 (25:7133) -> C3 4F 71
.asm_97136:
	ld hl, $04a1 ; 97136 (25:7136) -> 21 A1 04
	scall PrintTextWithNPCName ; 97139 (25:7139) -> CD 4E 61
	ld hl, $001e ; 9713C (25:713c) -> 21 1E 00
	scall ScriptSleep ; 9713F (25:713f) -> CD 34 63
	ld c, $01 ; 97142 (25:7142) -> 0E 01
	ld de, Data_970d4 ; 97144 (25:7144) -> 11 D4 70
	ld a, $25 ; 97147 (25:7147) -> 3E 25
	scall MovePlayer ; 97149 (25:7149) -> CD E3 62
	scall WaitNPCStep ; 9714C (25:714c) -> CD B1 5E
.asm_9714f:
	ret  ; 9714F (25:714f) -> C9

Data_97150:
    db $01, $0a, $01, $01, $0c, $03, $03
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

