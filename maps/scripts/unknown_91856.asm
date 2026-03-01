
Data_9176f:
	warpdef $04, $00, $01, $01, MAP_08_00, $0a, $09, $0a, $08, SFX_2E

Data_9177a:
	db $29, $04, $17, $01, $13

Data_9177f:
IF DEF(SUN)
	wildbot $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $01, $09, $18, $11, $10, $12, $02, $1f, $1e, $18, $0d, $08, $00
	wildbot $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ELIF DEF(STAR)
	wildbot $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $01, $09, $18, $8b, $10, $12, $77, $05, $05, $00, $0d, $08, $00
	wildbot $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ENDC

Data_917a9:
IF DEF(SUN)
	wildbot $00, $01, $09, $18, $0c, $10, $12, $77, $05, $17, $00, $03, $0a, $00
	wildbot $00, $01, $09, $18, $07, $11, $13, $45, $06, $06, $11, $03, $06, $00
	wildbot $00, $01, $09, $18, $1d, $12, $14, $51, $1f, $17, $08, $0c, $05, $00
	wildbot $00, $01, $09, $18, $0d, $13, $15, $77, $01, $05, $00, $03, $04, $00
ELIF DEF(STAR)
	wildbot $00, $01, $09, $18, $09, $10, $12, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $01, $09, $18, $58, $11, $13, $03, $1f, $17, $11, $03, $06, $00
	wildbot $00, $01, $09, $18, $39, $12, $14, $1a, $0e, $0b, $00, $03, $05, $00
	wildbot $00, $01, $09, $18, $0a, $13, $15, $77, $04, $0f, $00, $03, $04, $00
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
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_918a0
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_918a0
	ld e, $01
	ld hl, Data_91827
	scall LoadWarps
	ld e, $01
	ld hl, Data_91835
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_917a9
	scall LoadEncounters
	ld e, $02
	ld hl, Data_9183a
	scall LoadMapObjects
	ld a, $05
	ld [wc7e2], a
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $01b5
	scall LandmarkSign
	jp .asm_918f4
.asm_918a0:
	ld e, $01
	ld hl, Data_9176f
	scall LoadWarps
	ld e, $01
	ld hl, Data_9177a
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_9177f
	scall LoadEncounters
	ld a, $08
	ld [wBackupMapGroup], a
	xor a
	ld [wBackupMapNumber], a
	ld a, $06
	ld [wc7e2], a
	ld e, $05
	ld hl, Data_917e1
	scall LoadMapObjects
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall Func_8001c
	ld hl, $01b5
	scall LandmarkSign
.asm_918f4:
	ret

Func_918f5:
	ld a, e
	or a
	jp nz, .asm_91980
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_9197a
.asm_91922:
	ld a, [wc790]
	or a
	jp z, .asm_91971
	ld a, [wc790]
	cp $06
	jp nc, .asm_91971
	hltext_tree_pointer TreeBitstreamText_46f30
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_9196e
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $02
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $2e
	ld e, $01
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_9196e:
	jp .asm_91977
.asm_91971:
	hltext_tree_pointer TreeBitstreamText_470f0
	scall PrintTextStandard
.asm_91977:
	jp .asm_91980
.asm_9197a:
	hltext_tree_pointer TreeBitstreamText_470d8
	scall PrintTextStandard
.asm_91980:
	ret

Data_91981:
	db $01, $16, $02, $16, $ff, $ff

Data_91987:
	db $01, $16, $ff, $ff

Func_9198b:
	ld a, e
	or a
	jp nz, .asm_91adf
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_919a9
	ld c, $01
	ld de, Data_91981
	ld a, $24
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
.asm_919a9:
	ld a, $01
	scall FacePlayer
	ld hl, $0039
	scall CheckEventFlag
	cp $01
	jp nz, .asm_91ad9
	ld hl, $0020
	scall CheckEventFlag
	or a
	jp nz, .asm_91ad9
	ld hl, $003a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_91ad0
	ld hl, $0047
	scall CheckEventFlag
	or a
	jp nz, .asm_91ac7
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, .asm_91abe
	push af
	hltext_tree_pointer TreeBitstreamText_3bc83
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $19
	scall PlayMusic
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $29
	scall LoadEmote
	ld e, $15
	ld a, $02
	scall MoveEmote
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld e, $01
	ld a, $04
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_91987
	ld a, $24
	scall MovePlayer
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayerFace
	call WaitVideoTransfer
	pop af
	push af
	ld l, a
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	pop af
	push hl
	ld e, $01
	ld c, $00
	scall GiveRobot
	pop hl
	ld c, l
	ld e, $00
	ld a, $20
	scall GiveRobot
	ld e, $01
	ld hl, $0047
	scall EventFlagAction
	ld hl, $001e
	scall ScriptSleep
	ld a, $2a
	scall PlaySFX
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	hltext_tree_pointer TreeBitstreamText_3bd77
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_3bd02
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $08
	scall PlayMusic
	jp .asm_91ac4
.asm_91abe:
	hltext_tree_pointer TreeBitstreamText_3bd37
	scall PrintTextWithNPCName
.asm_91ac4:
	jp .asm_91acd
.asm_91ac7:
	hltext_tree_pointer TreeBitstreamText_3bd02
	scall PrintTextWithNPCName
.asm_91acd:
	jp .asm_91ad6
.asm_91ad0:
	hltext_tree_pointer TreeBitstreamText_3bbab
	scall PrintTextWithNPCName
.asm_91ad6:
	jp .asm_91adf
.asm_91ad9:
	hltext_tree_pointer TreeBitstreamText_3bbab
	scall PrintTextWithNPCName
.asm_91adf:
	ret

Func_91ae0:
	ld a, e
	or a
	jp nz, .asm_91b0b
	scall RepairRobots
	xor a
	scall PlayMusic
	ld a, $16
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	hltext_tree_pointer TreeBitstreamText_46e0b
	scall PrintTextStandard
	ld a, $08
	scall PlayMusic
.asm_91b0b:
	ret

Func_91b0c:
	push af
	ld a, e
	or a
	jp nz, .asm_91b6b
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $010f
	scall CheckEventFlag
	or a
	jp nz, .asm_91b65
	ld a, [wc79c]
	cp $01
	jp c, .asm_91b65
	ld hl, $0114
	scall CheckEventFlag
	or a
	jp nz, .asm_91b65
	hltext_tree_pointer TreeBitstreamText_3bc38
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	hltext_tree_pointer TreeBitstreamText_45fec
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_45ffd
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	ld e, $01
	ld hl, $010f
	scall EventFlagAction
	jp .asm_91b6b
.asm_91b65:
	hltext_tree_pointer TreeBitstreamText_3bc38
	scall PrintTextStandard
.asm_91b6b:
	pop bc
	ret
