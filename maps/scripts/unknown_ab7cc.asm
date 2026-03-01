
Data_ab69d:
	warpdef $0e, $1b, $04, $01, MAP_25_20, $0f, $05, $0f, $06, SFX_2E

Data_ab6a8:
	db $22, $01, $ff, $ff

Data_ab6ac:
	db $b3, $02, $ff, $ff

Data_ab6b0:
	db $1a, $04, $ff, $ff

Data_ab6b4:
	person_event $23, $0c, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0d, $0c, $0f, $05, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6a8
	person_event $1a, $0c, $09, $10, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $0c, $0d, $0c, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $11, $0c, $01, $01, $02, $04, $00, NULL, NULL

Data_ab6fa:
	person_event $0d, $04, $0f, $07, $01, $01, $02, $04, $00, Func_abf5b, NULL
	person_event $23, $04, $10, $07, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6b0
	person_event $1c, $04, $10, $07, $01, $01, $02, $04, $00, NULL, NULL

Data_ab724:
	person_event $0d, $04, $0f, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $00, $04, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0c, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0c, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0e, $01, $01, $03, $04, $00, NULL, NULL

Data_ab794:
	person_event $ff, $00, $0c, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac
	person_event $ff, $00, $13, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac

Data_ab7b0:
	person_event $0f, $04, $16, $14, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $16, $14, $01, $01, $02, $04, $00, Func_abe67, NULL

Func_ab7cc:: ; ab7cc
	ld e, $02
	ld hl, Data_ab7b0
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab7e9
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab7f9
.asm_ab7e9:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab804
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab804
.asm_ab7f9:
	ld e, $08
	ld hl, Data_ab724
	scall LoadMapObjects
	jp .asm_ab860
.asm_ab804:
	ld e, $01
	ld hl, Data_ab69d
	scall LoadWarps
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab829
	ld e, $05
	ld hl, Data_ab6b4
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
	jp .asm_ab860
.asm_ab829:
	ld hl, $0023
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab858
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_ab858
	ld e, $03
	ld hl, Data_ab6fa
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	jp .asm_ab860
.asm_ab858:
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
.asm_ab860:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab86f
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab87f
.asm_ab86f:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab88a
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab88a
.asm_ab87f:
	ld a, $03
	scall PlayMusic
	call Func_abc22
	jp .asm_ab8c8
.asm_ab88a:
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab8c0
	xor a
	scall Func_80653
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	call Func_ab8e1
	ld e, $01
	ld hl, $0043
	scall EventFlagAction
	ld a, $0c
	scall Func_80c94
	xor a
	scall PlayMusic
	ld a, $12
	scall PlayMusic
	jp .asm_ab8c8
.asm_ab8c0:
	ld a, $12
	scall PlayMusic
	scall Func_8001c
.asm_ab8c8:
	ret

Data_ab8c9:
	db $0f, $0f, $ff, $ff

Data_ab8cd:
	db $0d, $0f, $ff, $ff

Data_ab8d1:
	db $11, $0f, $ff, $ff

Data_ab8d5:
	db $10, $0f, $ff, $ff

Data_ab8d9:
	db $0e, $0f, $ff, $ff

Data_ab8dd:
	db $10, $12, $ff, $ff

Func_ab8e1:
	xor a
.asm_ab8e2:
	cp $0a
	jp nc, .asm_ab8f3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_ab8e2
.asm_ab8f3:
	ld hl, $003c
	scall ScriptSleep
	ld c, $15
	ld e, $0f
	ld a, $04
	scall Func_80080
	ld bc, Data_ab8c9
Func_ab904:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $003c
	scall ScriptSleep
	ld bc, Data_ab8cd
	ld e, $2a
	ld a, $05
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld bc, Data_ab8d1
	ld e, $2a
	ld a, $06
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_ab8d5
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $62
	scall PlaySFX
	ld e, $00
	ld a, $06
	scall SpriteFace
	ld e, $01
	ld a, $06
	scall SpriteFace
	ld e, $02
	ld a, $06
	scall SpriteFace
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld e, $00
	ld a, $06
	scall SpriteFace
	ld e, $01
	ld a, $06
	scall SpriteFace
	ld e, $02
	ld a, $06
	scall SpriteFace
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld a, $4e
	scall PlaySFX
	ld bc, Data_ab8d9
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $63
	scall PlaySFX
	ld e, $00
	ld a, $05
	scall SpriteFace
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld e, $02
	ld a, $05
	scall SpriteFace
	ld e, $03
	ld a, $05
	scall SpriteFace
	ld e, $00
	ld a, $05
	scall SpriteFace
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld e, $02
	ld a, $05
	scall SpriteFace
	ld e, $03
	ld a, $05
	scall SpriteFace
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld a, $4e
	scall PlaySFX
	ld hl, $0078
	scall ScriptSleep
	ld c, $15
	ld e, $11
	ld a, $03
	scall Func_80080
	ld bc, Data_ab8d1
	ld e, $2a
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	ld a, $03
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld hl, $0115
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $0116
	scall PrintTextWithNPCName
	ld hl, $0117
	scall PrintTextWithNPCName
	ld hl, $0118
	scall PrintTextWithNPCName
	ld hl, $0119
	scall PrintTextWithNPCName
	ld hl, $011a
	scall PrintTextWithNPCName
	ld hl, $011b
	scall PrintTextWithNPCName
	ld hl, $011c
	scall PrintTextWithNPCName
	ld bc, Data_ab8c9
Func_aba78:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $01
	ld e, $01
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld a, $61
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $011d
	scall PrintTextWithNPCName
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $02
	ld a, $03
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $0f
	ld a, $11
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	xor a
.asm_abad4:
	cp $02
	jp nc, .asm_abae6
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abad4
.asm_abae6:
	ld c, $19
	ld e, $10
	ld a, $02
	scall Func_80080
	ld bc, Data_ab8dd
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $011e
	scall PrintTextWithNPCName
	ld hl, $0120
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $02
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld a, $60
	scall PlaySFX
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $03
	ld a, $03
	scall SpriteFace
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $011f
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $04
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall Func_80653
	xor a
.asm_abb61:
	cp $08
	jp nc, .asm_abb73
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abb61
.asm_abb73:
	ret

Func_abb74:: ; abb74
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	xor a
	scall PlayerFace
	ld c, $01
	ld e, $3f
	ld a, $1c
	scall LoadEmote
	ld e, $08
	ld a, $10
	scall MoveEmote
	ld a, $5e
	scall PlaySFX
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld c, $01
	ld e, $3f
	ld a, $1d
	scall LoadEmote
	ld e, $08
	ld a, $10
	scall MoveEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $03fe
	scall PrintTextWithNPCName
	ld hl, $03fc
	scall PrintTextStandard
	ld c, $1e
	ld e, $00
	ld a, $80
	scall GiveRobot
	cp $ff
	jp nz, .asm_abc02
.asm_abc02:
	ld hl, $03ff
	scall PrintTextWithNPCName
	ld hl, $03fd
	scall PrintTextStandard
	ld e, $00
	ld a, $2c
	scall Func_80d62
	ld e, $01
	ld hl, $0048
	scall EventFlagAction
	ret

Data_abc1e:
	db $0f, $07, $ff, $ff

Func_abc22:
	xor a
	scall PlayerFace
	scall Func_8001c
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abc3d
	ld e, $1c
	ld a, $03
	scall ChangeSprite
	jp .asm_abc44
.asm_abc3d:
	ld e, $23
	ld a, $03
	scall ChangeSprite
.asm_abc44:
	ld e, $02
	ld a, $03
	scall SpriteFace
	ld c, $01
	ld de, Data_abc1e
	ld a, $2a
	scall MovePlayer
	ld hl, $003c
	scall ScriptSleep
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_abc6b
	ld hl, $014f
	scall PrintTextWithNPCName
.asm_abc6b:
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abc7b
	ld hl, $0489
	scall PrintTextWithNPCName
.asm_abc7b:
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_abc9c
	ld hl, $03aa
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $07
	scall Func_80d4d
	ld e, $01
	ld hl, $005a
	scall EventFlagAction
.asm_abc9c:
	ld hl, $0150
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
.asm_abca8:
	ld a, [wRTCTicker]
	cp $11
	jp z, .asm_abcc2
	ld a, [wRTCTicker]
	or a
	jp nz, .asm_abcbc
	ld a, $01
	ld [wRTCTicker], a
.asm_abcbc:
	call NextOverworldFrame
	jp .asm_abca8
.asm_abcc2:
	xor a
	ld [wc39e], a
	ld a, $02
	scall PlayMusic
	ld a, $01
	ld [wc790], a
	scall ScriptLibrary
	or a
	jp nz, .asm_abdda
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $04
	ld [wNextVBlankFlags], a
.asm_abd24:
	ld a, [wNextVBlankFlags]
	ld hl, $c204
	cp [hl]
	jp nz, .asm_abd24
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	scall Func_80f02
	ld hl, $0393
	scall PrintTextWithNPCName
	xor a
	scall Func_8103e
	ld hl, $0394
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $00e1
	scall EventFlagAction
	ld e, $00
	ld hl, $00e2
	scall EventFlagAction
	ld e, $00
	ld hl, $00e3
	scall EventFlagAction
	ld e, $00
	ld hl, $00e4
	scall EventFlagAction
	ld e, $00
	ld hl, $00e5
	scall EventFlagAction
	ld e, $00
	ld hl, $00e6
	scall EventFlagAction
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits2
	jp .asm_abe66
.asm_abdda:
	ld e, $00
	ld hl, $00e1
	scall EventFlagAction
	ld e, $00
	ld hl, $00e2
	scall EventFlagAction
	ld e, $00
	ld hl, $00e3
	scall EventFlagAction
	ld e, $00
	ld hl, $00e4
	scall EventFlagAction
	ld e, $00
	ld hl, $00e5
	scall EventFlagAction
	ld e, $00
	ld hl, $00e6
	scall EventFlagAction
	ld a, $01
	ld [wc79a], a
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Func_fafa8
.asm_abe66:
	ret

Func_abe67:
	ld a, e
	or a
	jp nz, .asm_abf5a
	ld hl, $00df
	scall CheckEventFlag
	or a
	jp nz, .asm_abf54
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $14
	ld a, $16
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
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
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	xor a
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $11
	ld e, $10
	ld a, $0f
	scall Func_80e8d
	ld e, $01
	ld hl, $00df
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
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
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $12
	scall PlayMusic
	xor a
	scall FacePlayer
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_abf5a
.asm_abf54:
	ld hl, $015c
	scall PrintTextStandard
.asm_abf5a:
	ret

Func_abf5b:
	ld a, e
	or a
	jp nz, .asm_abf79
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abf73
	ld hl, $0139
	scall PrintTextWithNPCName
	jp .asm_abf79
.asm_abf73:
	ld hl, $0419
	scall PrintTextWithNPCName
.asm_abf79:
	ret
