
Data_9e9a9:
	warpdef $03, $0e, $03, $01, MAP_18_15, $07, $02, $07, $03, $2e

Data_9e9b4:
IF DEF(SUN)
	wildbot $00, $03, $09, $0c, $90, $1e, $20, $3c, $25, $12, $00, $05, $0a, $00
	wildbot $00, $03, $09, $0c, $72, $20, $22, $79, $09, $09, $00, $10, $09, $00
	wildbot $00, $03, $09, $0c, $79, $21, $23, $79, $01, $04, $00, $10, $08, $00
	wildbot $00, $03, $09, $0c, $33, $21, $23, $34, $07, $07, $14, $11, $07, $00
ELIF DEF(STAR)
	wildbot $00, $03, $28, $11, $79, $1e, $20, $79, $01, $04, $00, $10, $0a, $00
	wildbot $00, $03, $28, $11, $90, $20, $22, $3c, $25, $12, $00, $05, $09, $00
	wildbot $00, $03, $28, $11, $72, $21, $23, $79, $09, $09, $00, $10, $08, $00
	wildbot $00, $03, $28, $11, $3b, $21, $23, $45, $07, $09, $00, $11, $07, $00
ENDC

Data_9e9ec:
	person_event $0f, $04, $04, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $04, $04, $01, $01, $00, $04, $00, Func_9eb3c, NULL

Data_9ea08:
	person_event $ff, $00, $00, $08, $04, $01, $00, $04, $00, Func_9ed0f, NULL
	person_event $ff, $00, $05, $08, $04, $01, $00, $04, $00, Func_9eda0, NULL

Func_9ea24:: ; 9ea24
	ld e, $00
	ld hl, $0045
	scall EventFlagAction
	ld e, $01
	ld hl, Data_9e9a9
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_9e9b4
	scall LoadEncounters
	ld a, $01
	scall LoadPlayerSprite
	ld a, [wc794]
	cp $02
	jp nz, .asm_9ea69
	ld hl, $0053
	scall CheckEventFlag
	or a
	jp nz, .asm_9ea69
	ld e, $02
	ld hl, Data_9e9ec
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_9eaf2
.asm_9ea69:
	ld a, [wc794]
	cp $03
	jp nz, .asm_9ea8c
	ld hl, $0054
	scall CheckEventFlag
	or a
	jp nz, .asm_9ea8c
	ld e, $02
	ld hl, Data_9e9ec
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_9eaf2
.asm_9ea8c:
	ld a, [wc794]
	cp $05
	jp nz, .asm_9eaaf
	ld hl, $0055
	scall CheckEventFlag
	or a
	jp nz, .asm_9eaaf
	ld e, $02
	ld hl, Data_9e9ec
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_9eaf2
.asm_9eaaf:
	ld a, [wc794]
	cp $06
	jp nz, .asm_9ead2
	ld hl, $0056
	scall CheckEventFlag
	or a
	jp nz, .asm_9ead2
	ld e, $02
	ld hl, Data_9e9ec
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_9eaf2
.asm_9ead2:
	ld a, [wc794]
	cp $09
	jp nz, .asm_9eaf2
	ld hl, $0057
	scall CheckEventFlag
	or a
	jp nz, .asm_9eaf2
	ld e, $02
	ld hl, Data_9e9ec
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
.asm_9eaf2:
	ld a, [wBackupMapGroup]
	cp $12
	jp nz, .asm_9eb0a
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_9eb0a
	ld e, $02
	ld hl, Data_9ea08
	scall LoadMapObjects
.asm_9eb0a:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Data_9eb13:
	db $00, $00, $00, $01, $00, $c5, $bb, $00, $00, $30, $01, $30, $07, $32, $07, $11
	db $1f, $09, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_9eb3c:
	push bc
	ld a, e
	or a
	jp nz, .asm_9ecf8
	ld hl, $0045
	scall CheckEventFlag
	or a
	jp nz, .asm_9eba0
	ld c, $03
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $04
	ld a, $04
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $01
	ld hl, $0045
	scall EventFlagAction
.asm_9eba0:
	xor a
	scall FacePlayer
	ld hl, sp+$00
	ld [hl], $00
	ld hl, $0053
	scall CheckEventFlag
	or a
	jp nz, .asm_9ebb9
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9ebb9:
	ld hl, $0054
	scall CheckEventFlag
	or a
	jp nz, .asm_9ebca
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9ebca:
	ld hl, $0055
	scall CheckEventFlag
	or a
	jp nz, .asm_9ebdb
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9ebdb:
	ld hl, $0056
	scall CheckEventFlag
	or a
	jp nz, .asm_9ebec
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9ebec:
	ld hl, $0057
	scall CheckEventFlag
	or a
	jp nz, .asm_9ebfd
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
.asm_9ebfd:
	ld hl, sp+$00
	ld a, [hl]
	cp $05
	jp z, .asm_9ec3d
	cp $04
	jp z, .asm_9ec34
	cp $03
	jp z, .asm_9ec2b
	cp $02
	jp z, .asm_9ec22
	cp $01
	jp nz, .asm_9ec43
	ld hl, $028b
	scall PrintTextWithNPCName
	jp .asm_9ec43
.asm_9ec22:
	ld hl, $028a
	scall PrintTextWithNPCName
	jp .asm_9ec43
.asm_9ec2b:
	ld hl, $0289
	scall PrintTextWithNPCName
	jp .asm_9ec43
.asm_9ec34:
	ld hl, $0288
	scall PrintTextWithNPCName
	jp .asm_9ec43
.asm_9ec3d:
	ld hl, $0287
	scall PrintTextWithNPCName
.asm_9ec43:
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_9ecf8
	ld de, Data_9ecfa
	ld hl, Data_9eb13
	scall ScriptedBattle
	or a
	jp nz, .asm_9ec5d
	jp .asm_9ecf8
.asm_9ec5d:
	ld a, [wc794]
	cp $02
	jp nz, .asm_9ec7a
	ld hl, $0053
	scall CheckEventFlag
	or a
	jp nz, .asm_9ec7a
	ld e, $01
	ld hl, $0053
	scall EventFlagAction
	jp .asm_9eceb
.asm_9ec7a:
	ld a, [wc794]
	cp $03
	jp nz, .asm_9ec97
	ld hl, $0054
	scall CheckEventFlag
	or a
	jp nz, .asm_9ec97
	ld e, $01
	ld hl, $0054
	scall EventFlagAction
	jp .asm_9eceb
.asm_9ec97:
	ld a, [wc794]
	cp $05
	jp nz, .asm_9ecb4
	ld hl, $0055
	scall CheckEventFlag
	or a
	jp nz, .asm_9ecb4
	ld e, $01
	ld hl, $0055
	scall EventFlagAction
	jp .asm_9eceb
.asm_9ecb4:
	ld a, [wc794]
	cp $06
	jp nz, .asm_9ecd1
	ld hl, $0056
	scall CheckEventFlag
	or a
	jp nz, .asm_9ecd1
	ld e, $01
	ld hl, $0056
	scall EventFlagAction
	jp .asm_9eceb
.asm_9ecd1:
	ld a, [wc794]
	cp $09
	jp nz, .asm_9eceb
	ld hl, $0057
	scall CheckEventFlag
	or a
	jp nz, .asm_9eceb
	ld e, $01
	ld hl, $0057
	scall EventFlagAction
.asm_9eceb:
	ld l, $1b
	push hl
	ld c, $1e
	ld e, $00
	ld a, $12
	scall Func_80dff
	pop bc
.asm_9ecf8:
	pop bc
	ret

Data_9ecfa:
	dstr "オヤシﾞ(ようせい)"

Data_9ed05:
	db $04, $09, $01, $09, $ff, $ff

Data_9ed0b:
	db $01, $09, $ff, $ff

Func_9ed0f:
	ld a, e
	or a
	jp nz, .asm_9ed95
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9ed3c
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9ed3c
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9ed3c
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_9ed8f
.asm_9ed3c:
	ld a, [wc790]
	or a
	jp z, .asm_9ed86
	ld a, [wc790]
	cp $06
	jp nc, .asm_9ed86
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_9ed83
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_9ed69
	ld c, $01
	ld de, Data_9ed0b
	ld a, $27
	scall MovePlayer
	jp .asm_9ed73
.asm_9ed69:
	ld c, $01
	ld de, Data_9ed05
	ld a, $27
	scall MovePlayer
.asm_9ed73:
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	call Func_9ee27
.asm_9ed83:
	jp .asm_9ed8c
.asm_9ed86:
	ld hl, $0377
	scall PrintTextStandard
.asm_9ed8c:
	jp .asm_9ed95
.asm_9ed8f:
	ld hl, $0376
	scall PrintTextStandard
.asm_9ed95:
	ret

Data_9ed96:
	db $04, $09, $07, $09, $ff, $ff

Data_9ed9c:
	db $07, $09, $ff, $ff

Func_9eda0:
	ld a, e
	or a
	jp nz, .asm_9ee26
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9edcd
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9edcd
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_9edcd
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_9ee20
.asm_9edcd:
	ld a, [wc790]
	or a
	jp z, .asm_9ee17
	ld a, [wc790]
	cp $06
	jp nc, .asm_9ee17
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_9ee14
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_9edfa
	ld c, $01
	ld de, Data_9ed9c
	ld a, $27
	scall MovePlayer
	jp .asm_9ee04
.asm_9edfa:
	ld c, $01
	ld de, Data_9ed96
	ld a, $27
	scall MovePlayer
.asm_9ee04:
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	call Func_9ee27
.asm_9ee14:
	jp .asm_9ee1d
.asm_9ee17:
	ld hl, $0377
	scall PrintTextStandard
.asm_9ee1d:
	jp .asm_9ee26
.asm_9ee20:
	ld hl, $0376
	scall PrintTextStandard
.asm_9ee26:
	ret

Func_9ee27:
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
	ld a, $44
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $03
	scall PlayerFace
	ld l, $08
	push hl
	ld c, $04
	ld e, $0e
	ld a, $12
	scall Func_80dff
	pop bc
	ret
