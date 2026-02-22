
Data_92bee:
	warpdef $08, $04, $01, $01, MAP_09_02, $10, $04, $10, $05, $2e
	warpdef $0a, $19, $01, $01, MAP_09_02, $12, $18, $11, $18, $2e
	warpdef $1d, $06, $01, $01, MAP_09_02, $24, $07, $24, $08, $2e

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
	ld e, $03
	ld hl, Data_92bee
	scall LoadWarps
	ld e, $01
	ld hl, Data_92c0f
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $07
	ld hl, Data_92c14
	scall LoadEncounters
	ld e, $02
	ld hl, Data_92c76
	scall LoadMapObjects
	ld a, [wc797]
	cp $07
	jp z, .asm_92cc6
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_92cc6:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $03f2
	scall LandmarkSign
	ret

Data_92cd5:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $1e, $01, $1e, $02
	db $07, $17, $17, $00, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_92cfe:
	push af
	ld a, e
	or a
	jp nz, .asm_92d54
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0090
	scall CheckEventFlag
	or a
	jp nz, .asm_92d4e
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
	hltext_tree_pointer TreeBitstreamText_46f28
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_92d45
	ld de, Data_92d56
	ld hl, Data_92cd5
	scall ScriptedBattle
	or a
	jp nz, .asm_92d34
	jp .asm_92d54
.asm_92d34:
	ld e, $01
	ld hl, $0090
	scall EventFlagAction
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
	jp .asm_92d4b
.asm_92d45:
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
.asm_92d4b:
	jp .asm_92d54
.asm_92d4e:
	hltext_tree_pointer TreeBitstreamText_42b16
	scall PrintTextStandard
.asm_92d54:
	pop bc
	ret

Data_92d56:
	dstr "ソﾞッキー"

Func_92d5c:
	push af
	ld a, e
	or a
	jp nz, .asm_92db9
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0014
	scall CheckEventFlag
	or a
	jp nz, .asm_92db3
	ld a, $17
	scall Func_80e5d
	cp $01
	jp nz, .asm_92daa
	hltext_tree_pointer TreeBitstreamText_39e1f
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_39e65
	scall PrintTextStandard
	ld e, $01
	ld hl, $0014
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $17
	scall Func_80d4d
	ld c, $00
	ld e, $01
	ld a, $16
	scall Func_80d4d
	jp .asm_92db0
.asm_92daa:
	hltext_tree_pointer TreeBitstreamText_39e71
	scall PrintTextWithNPCName
.asm_92db0:
	jp .asm_92db9
.asm_92db3:
	hltext_tree_pointer TreeBitstreamText_39e8c
	scall PrintTextWithNPCName
.asm_92db9:
	pop bc
	ret
