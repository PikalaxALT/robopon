
Data_a161c: ; a161c
	warpdef $04, $09, $02, $01, MAP_20_00, $0d, $11, $0d, $12, $34
Data_a161c_end:

Data_a1627:
	person_event $09, $04, $04, $03, $01, $02, $02, $04, $00, Func_a16f4, NULL
	person_event $09, $04, $00, $05, $01, $01, $01, $04, $00, Func_a17a6, NULL
	person_event $09, $04, $00, $06, $01, $01, $01, $04, $00, Func_a187b, NULL
	person_event $09, $04, $09, $05, $01, $01, $03, $04, $00, Func_a195e, NULL
	person_event $09, $04, $09, $06, $01, $01, $03, $04, $00, Func_a1a41, NULL
	person_event $09, $04, $09, $07, $01, $01, $03, $04, $00, Func_a1b24, NULL
Data_a1627_end:

Func_a167b:: ; a167b
	ld e, (Data_a161c_end - Data_a161c) / 11
	ld hl, Data_a161c
	scall LoadWarps
	ld e, (Data_a1627_end - Data_a1627) / 14
	ld hl, Data_a1627
	scall LoadMapObjects
	checkevent $0095
	cp $1
	jp nz, .asm_a16e5
	checkevent $009a
	cp $1
	jp nz, .asm_a16e5
	checkevent $009f
	cp $1
	jp nz, .asm_a16e5
	checkevent $00a4
	cp $1
	jp nz, .asm_a16e5
	checkevent $00a9
	cp $1
	jp nz, .asm_a16e5
	ld e, $0
	ld a, $1
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $2
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $3
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $4
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $5
	scall SetPersonVisibilityState
.asm_a16e5:
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	ld hl, $02bb
	scall LandmarkSign
	ret

Func_a16f4:
	ld a, e
	or a
	jp nz, .asm_a177c
	ld hl, $003b
	scall CheckEventFlag
	or a
	jp nz, .asm_a175e
	ld hl, $00af
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_a1755
	push hl
	push hl
	ld hl, $0000
	push hl
	ld hl, $0000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, $0000
	push hl
	ld hl, $03e8
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_a1733
	ld hl, $00b1
	scall PrintTextWithNPCName
	jp .asm_a1752
.asm_a1733:
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $fc18
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $00b2
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $003b
	scall EventFlagAction
.asm_a1752:
	jp .asm_a175b
.asm_a1755:
	ld hl, $00b0
	scall PrintTextWithNPCName
.asm_a175b:
	jp .asm_a177c
.asm_a175e:
	ld a, [wc790]
	or a
	jp z, .asm_a1776
	ld a, [wc790]
	cp $05
	jp nc, .asm_a1776
	ld hl, $010f
	scall PrintTextStandard
	jp .asm_a177c
.asm_a1776:
	ld hl, $00bf
	scall PrintTextWithNPCName
.asm_a177c:
	ret

Data_a177d:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $8d, $01, $8d, $04, $19, $0c, $0d, $14, $03, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_a17a6:
	ld a, e
	or a
	jp nz, .asm_a1848
	ld a, $01
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1842
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1839
	ld hl, $003d
	scall CheckEventFlag
	or a
	jp nz, .asm_a1830
	ld hl, $00c1
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1827
	ld hl, $00c6
	scall PrintTextStandard
	ld de, Data_a1849
	ld hl, Data_a177d
	scall ScriptedBattle
	or a
	jp nz, .asm_a17ef
	jp .asm_a1848
.asm_a17ef:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00bb
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003d
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1e
	scall Func_80d4d
	ld a, $01
	ld [wc78f], a
	jp .asm_a182d
.asm_a1827:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a182d:
	jp .asm_a1836
.asm_a1830:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1836:
	jp .asm_a183f
.asm_a1839:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a183f:
	jp .asm_a1848
.asm_a1842:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1848:
	ret

Data_a1849:
	dstr "(くﾞんしﾞん)"

Data_a1852:
	db $00, $00
	db $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $19, $01, $13, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c

Func_a187b:
	ld a, e
	or a
	jp nz, .asm_a192b
	ld a, $02
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1925
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a191c
	ld hl, $003e
	scall CheckEventFlag
	or a
	jp nz, .asm_a1913
	ld hl, $00c2
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a190a
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $015e
	scall PrintTextStandard
.asm_a18ba:
	ld de, Data_a192c
	ld hl, Data_a1852
	scall Func_803f5
	or a
	jp nz, .asm_a18d2
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a18ba
	jp .asm_a192b
.asm_a18d2:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b6
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003e
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1c
	scall Func_80d4d
	ld a, $02
	ld [wc78f], a
	jp .asm_a1910
.asm_a190a:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1910:
	jp .asm_a1919
.asm_a1913:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1919:
	jp .asm_a1922
.asm_a191c:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1922:
	jp .asm_a192b
.asm_a1925:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a192b:
	ret

Data_a192c:
	dstr "(くﾞんしﾞん)"

Data_a1935:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $1f, $01, $1f, $04, $19, $17
	db $17, $17, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a195e:
	ld a, e
	or a
	jp nz, .asm_a1a0e
	ld a, $03
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1a08
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a19ff
	ld hl, $003f
	scall CheckEventFlag
	or a
	jp nz, .asm_a19f6
	ld hl, $00c3
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a19ed
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $017a
	scall PrintTextStandard
.asm_a199d:
	ld de, Data_a1a0f
	ld hl, Data_a1935
	scall Func_802ef
	or a
	jp nz, .asm_a19b5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a199d
	jp .asm_a1a0e
.asm_a19b5:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b8
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003f
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1d
	scall Func_80d4d
	ld a, $03
	ld [wc78f], a
	jp .asm_a19f3
.asm_a19ed:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a19f3:
	jp .asm_a19fc
.asm_a19f6:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a19fc:
	jp .asm_a1a05
.asm_a19ff:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1a05:
	jp .asm_a1a0e
.asm_a1a08:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1a0e:
	ret

Data_a1a0f:
	dstr "(くﾞんしﾞん)"

Data_a1a18:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e
	db $04, $19, $01, $02, $03, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1a41:
	ld a, e
	or a
	jp nz, .asm_a1af1
	ld a, $04
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1aeb
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1ae2
	ld hl, $0040
	scall CheckEventFlag
	or a
	jp nz, .asm_a1ad9
	ld hl, $00c4
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1ad0
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $016b
	scall PrintTextStandard
.asm_a1a80:
	ld de, Data_a1af2
	ld hl, Data_a1a18
	scall Func_80347
	or a
	jp nz, .asm_a1a98
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1a80
	jp .asm_a1af1
.asm_a1a98:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00ba
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $0040
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $20
	scall Func_80d4d
	ld a, $04
	ld [wc78f], a
	jp .asm_a1ad6
.asm_a1ad0:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1ad6:
	jp .asm_a1adf
.asm_a1ad9:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1adf:
	jp .asm_a1ae8
.asm_a1ae2:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1ae8:
	jp .asm_a1af1
.asm_a1aeb:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1af1:
	ret

Data_a1af2:
	dstr "(くﾞんしﾞん)"

Data_a1afb:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $10, $01, $10, $04, $19, $1f, $1e, $18, $02, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1b24:
	ld a, e
	or a
	jp nz, .asm_a1bd4
	ld a, $05
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1bce
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1bc5
	ld hl, $0041
	scall CheckEventFlag
	or a
	jp nz, .asm_a1bbc
	ld hl, $00c5
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1bb3
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $015d
	scall PrintTextStandard
.asm_a1b63:
	ld de, Data_a1bd5
	ld hl, Data_a1afb
	scall Func_8039e
	or a
	jp nz, .asm_a1b7b
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1b63
	jp .asm_a1bd4
.asm_a1b7b:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b9
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $0041
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1f
	scall Func_80d4d
	ld a, $05
	ld [wc78f], a
	jp .asm_a1bb9
.asm_a1bb3:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1bb9:
	jp .asm_a1bc2
.asm_a1bbc:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1bc2:
	jp .asm_a1bcb
.asm_a1bc5:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1bcb:
	jp .asm_a1bd4
.asm_a1bce:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1bd4:
	ret

Data_a1bd5:
	dstr "(くﾞんしﾞん)"
