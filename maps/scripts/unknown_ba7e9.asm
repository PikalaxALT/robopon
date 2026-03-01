
Data_ba65d:
	wildbot $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00

Data_ba66b:
	dw $065
	dw -1

Data_ba66f:
	dw $066
	dw -1

Data_ba673:
	dw $067
	dw -1

Data_ba677:
	dw $068
	dw -1

Data_ba67b:
	dw $06a
	dw -1

Data_ba67f:
	dw $06c
	dw -1

Data_ba683:
	dw $06d
	dw -1

Data_ba687:
	dw $363
	dw -1

Data_ba68b:
	dw $1b4
	dw -1

Data_ba68f:
	dw $346
	dw -1

Data_ba693:
	dw $37a
	dw -1

Data_ba697:
	dw $378
	dw -1

Data_ba69b:
	dw $329
	dw -1

Data_ba69f:
	dw $38e
	dw -1

Data_ba6a3:
	dw $283
	dw -1

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
	ld e, $00
	ld hl, $00fb
	scall EventFlagAction
	call Func_bb0b0
	ld hl, Func_bb0b0
	scall Func_80f11
	ld e, $02
	ld hl, Data_ba7a3
	scall LoadMapObjects
	ld a, $11
	scall PlayMusic
	ld a, [wc790]
	or a
	jp z, .asm_ba839
	ld a, [wc790]
	cp $07
	jp nc, .asm_ba839
	ld e, $03
	ld hl, Data_ba7bf
	scall LoadMapObjects
	ld a, $01
	scall Func_80d01
	ld e, $01
	ld hl, Data_ba65d
	scall LoadEncounters
	call Func_bafd6
	ld a, $11
	scall PlayMusic
	scall Func_8001c
	jp .asm_baa5f
.asm_ba839:
	ld e, $03
	ld hl, Data_ba6a7
	scall LoadMapObjects
	ld a, [wc78a]
	cp $0f
	jp z, .asm_baa4a
	cp $0e
	jp z, .asm_baa2a
	cp $0d
	jp z, .asm_baa0a
	cp $0c
	jp z, .asm_ba9f0
	cp $0b
	jp z, .asm_ba9bd
	cp $0a
	jp z, .asm_ba99d
	cp $09
	jp z, .asm_ba97d
	cp $08
	jp z, .asm_ba95d
	cp $07
	jp z, .asm_ba943
	cp $06
	jp z, .asm_ba929
	cp $05
	jp z, .asm_ba8f6
	cp $04
	jp z, .asm_ba8c4
	cp $03
	jp z, .asm_ba8b2
	cp $01
	jp z, .asm_ba898
	or a
	jp nz, .asm_baa5c
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
.asm_ba898:
	ld e, $01
	ld hl, Data_ba75d
	scall LoadMapObjects
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8b2:
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8c4:
	ld e, $01
	ld hl, Data_ba6fb
	scall LoadMapObjects
	ld hl, $0052
	scall CheckEventFlag
	or a
	jp nz, .asm_ba8de
	ld e, $01
	ld hl, Data_ba6d1
	scall LoadMapObjects
.asm_ba8de:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cb
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8f6:
	ld e, $01
	ld hl, Data_ba709
	scall LoadMapObjects
	ld hl, $0052
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ba911
	ld e, $01
	ld hl, Data_ba6df
	scall LoadMapObjects
.asm_ba911:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cc
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba929:
	ld e, $01
	ld hl, Data_ba76b
	scall LoadMapObjects
	ld a, $01
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba943:
	ld e, $01
	ld hl, Data_ba779
	scall LoadMapObjects
	ld a, $02
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba95d:
	ld e, $01
	ld hl, Data_ba717
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cd
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba97d:
	ld e, $01
	ld hl, Data_ba725
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02ce
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba99d:
	ld e, $01
	ld hl, Data_ba733
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d2
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9bd:
	ld e, $01
	ld hl, Data_ba741
	scall LoadMapObjects
	ld hl, $00ed
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ba9d8
	ld e, $01
	ld hl, Data_ba6ed
	scall LoadMapObjects
.asm_ba9d8:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d3
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9f0:
	ld e, $01
	ld hl, Data_ba787
	scall LoadMapObjects
	ld a, $0d
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa0a:
	ld e, $01
	ld hl, Data_ba795
	scall LoadMapObjects
	ld a, $08
	ld [wc7e2], a
	xor a
	scall Func_80653
	call Func_bb0b0
	scall Func_80f02
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa2a:
	ld e, $01
	ld hl, Data_ba74f
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d4
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_baa4a:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa5c:
	scall Func_8001c
.asm_baa5f:
	ret

Func_baa60:
	ld a, e
	or a
	jp nz, .asm_babdb
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_baa79
	ld hl, $0283
	scall PrintTextStandard
	jp .asm_babdb
.asm_baa79:
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_baa83
	jp .asm_babdb
.asm_baa83:
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld e, $00
	ld hl, $00fa
	scall EventFlagAction
	ld a, [wc78a]
	cp $0e
	jp z, .asm_babc9
	cp $0d
	jp z, .asm_babb4
	cp $0c
	jp z, .asm_bab9f
	cp $0b
	jp z, .asm_bab8a
	cp $0a
	jp z, .asm_bab75
	cp $09
	jp z, .asm_bab60
	cp $08
	jp z, .asm_bab4b
	cp $07
	jp z, .asm_bab36
	cp $06
	jp z, .asm_bab21
	cp $05
	jp z, .asm_bab0c
	cp $04
	jp z, .asm_baaf7
	cp $01
	jp nz, .asm_babdb
	ld a, $02
	ld [wc78a], a
	ld l, $0c
	push hl
	ld c, $09
	ld e, $14
	ld a, $05
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_baaf7:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab0c:
	ld a, $06
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab21:
	ld a, $07
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab36:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab4b:
	ld a, $09
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab60:
	ld a, $0a
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab75:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab8a:
	ld a, $0c
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab9f:
	ld a, $0d
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_babb4:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_babc9:
	ld a, $0f
	ld [wc78a], a
	ld l, $04
	push hl
	ld c, $0c
	ld e, $01
	ld a, $04
	scall Func_80dff
	pop bc
.asm_babdb:
	ret

Func_babdc:
	ld a, e
	or a
	jp nz, .asm_bad5b
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_babeb
	jp .asm_bad5b
.asm_babeb:
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_babff
	ld hl, $0283
	scall PrintTextStandard
	jp .asm_bad5b
.asm_babff:
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld e, $00
	ld hl, $00fa
	scall EventFlagAction
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bad49
	cp $0d
	jp z, .asm_bad34
	cp $0c
	jp z, .asm_bad1f
	cp $0b
	jp z, .asm_bad0a
	cp $0a
	jp z, .asm_bacf5
	cp $09
	jp z, .asm_bace0
	cp $08
	jp z, .asm_baccb
	cp $07
	jp z, .asm_bacb6
	cp $06
	jp z, .asm_baca1
	cp $05
	jp z, .asm_bac8c
	cp $04
	jp z, .asm_bac77
	cp $01
	jp nz, .asm_bad5b
	xor a
	scall PlayerFace
	ld l, $10
	push hl
	ld c, $09
	ld e, $15
	ld a, $05
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bac77:
	ld a, $03
	ld [wc78a], a
	ld l, $0f
	push hl
	ld c, $16
	ld e, $0c
	ld a, $03
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bac8c:
	ld a, $08
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_baca1:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bacb6:
	ld a, $06
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_baccb:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bace0:
	ld a, $08
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bacf5:
	ld a, $09
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad0a:
	ld a, $0e
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad1f:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad34:
	ld a, $0c
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad49:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
.asm_bad5b:
	ret

Func_bad5c:
	ld hl, $00fa
	scall CheckEventFlag
	or a
	jp nz, .asm_bad9a
	ld a, $11
	scall PlayMusic
	ld a, $02
	scall PlayerFace
	ld c, $01
	ld e, $02
	ld a, $09
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld e, $01
	ld hl, $00fa
	scall EventFlagAction
	jp .asm_bad9f
.asm_bad9a:
	ld a, $01
	scall Func_80653
.asm_bad9f:
	ret

Data_bada0:
	db $02, $03, $04, $03, $04, $02, $ff, $ff

Data_bada8:
	db $01, $03, $04, $03, $04, $02, $ff, $ff

Func_badb0:
	push af
	ld a, e
	or a
	jp nz, .asm_bae4c
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $006e
	scall PrintTextWithNPCName
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
	ld hl, $0064
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_bade8
	ld hl, $0070
	scall PrintTextWithNPCName
	jp .asm_bae4c
.asm_bade8:
	ld hl, $006f
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bae46
	ld hl, $041b
	scall PrintTextStandard
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $ff9c
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $0072
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $0052
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae2d
	ld bc, Data_bada0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae38
.asm_bae2d:
	ld bc, Data_bada8
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae38:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	jp .asm_bae4c
.asm_bae46:
	ld hl, $0071
	scall PrintTextWithNPCName
.asm_bae4c:
	pop bc
	ret

Data_bae4e:
	db $02, $03, $03, $02, $ff, $ff

Data_bae54:
	db $01, $03, $03, $02, $ff, $ff

Func_bae5a:
	push af
	ld a, e
	or a
	jp nz, .asm_baea8
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0073
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $0052
	scall EventFlagAction
	ld e, $01
	ld hl, $00ed
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae92
	ld bc, Data_bae4e
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae9d
.asm_bae92:
	ld bc, Data_bae54
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae9d:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baea8:
	pop bc
	ret

Data_baeaa:
	db $02, $03, $03, $02, $ff, $ff

Data_baeb0:
	db $01, $03, $03, $02, $ff, $ff

Func_baeb6:
	push af
	ld a, e
	or a
	jp nz, .asm_baefc
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0073
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $00ed
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_baee6
	ld bc, Data_baeaa
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_baef1
.asm_baee6:
	ld bc, Data_baeb0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_baef1:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baefc:
	pop bc
	ret

Func_baefe:
	ld a, e
	or a
	jp nz, .asm_baf51
	ld a, [wc790]
	or a
	jp z, .asm_baf1b
	ld a, [wc790]
	cp $07
	jp nc, .asm_baf1b
	ld hl, $03dd
	scall PrintTextStandard
	jp .asm_baf51
.asm_baf1b:
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_baf3b
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	ld a, $32
	scall PlaySFX
	ld hl, $035b
	scall PrintTextStandard
	jp .asm_baf4e
.asm_baf3b:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	ld a, $28
	scall PlaySFX
	ld hl, $035c
	scall PrintTextStandard
.asm_baf4e:
	call Func_bafd6
.asm_baf51:
	ret

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
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_bafe6
	scall AllocateSpaceForWarps
	jp .asm_bb0a9
.asm_bafe6:
	scall AllocateSpaceForWarps
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bb0a1
	cp $0d
	jp z, .asm_bb096
	cp $0c
	jp z, .asm_bb08b
	cp $0b
	jp z, .asm_bb080
	cp $0a
	jp z, .asm_bb075
	cp $09
	jp z, .asm_bb06a
	cp $08
	jp z, .asm_bb05f
	cp $07
	jp z, .asm_bb054
	cp $06
	jp z, .asm_bb049
	cp $05
	jp z, .asm_bb03e
	cp $04
	jp z, .asm_bb033
	cp $01
	jp nz, .asm_bb0a9
	ld e, $01
	ld hl, Data_baf52
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb033:
	ld e, $01
	ld hl, Data_baf5d
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb03e:
	ld e, $01
	ld hl, Data_baf68
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb049:
	ld e, $01
	ld hl, Data_baf73
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb054:
	ld e, $01
	ld hl, Data_bafb5
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb05f:
	ld e, $01
	ld hl, Data_baf89
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb06a:
	ld e, $01
	ld hl, Data_baf94
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb075:
	ld e, $01
	ld hl, Data_baf9f
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb080:
	ld e, $01
	ld hl, Data_bafaa
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb08b:
	ld e, $01
	ld hl, Data_baf7e
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb096:
	ld e, $01
	ld hl, Data_bafc0
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb0a1:
	ld e, $01
	ld hl, Data_bafcb
	scall LoadWarps
.asm_bb0a9:
	ret

Data_bb0aa:
	db $07, $07, $02, $02, $01, $07

Func_bb0b0:
	ld a, [wc790]
	or a
	jp z, .asm_bb0d0
	ld a, [wc790]
	cp $07
	jp nz, .asm_bb0d0
	ld a, [wc78a]
	cp $0d
	jp nz, .asm_bb0d0
	ld hl, Data_bb0aa
	scall Func_80d9b
	scall Func_80f02
.asm_bb0d0:
	ret
