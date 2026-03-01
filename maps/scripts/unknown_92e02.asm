
Data_92dbb:
	warpdef $01, $06, $02, $01, MAP_09_00, $08, $04, $08, $05, SFX_34

Data_92dc6:
	dtext_tree_pointer TreeBitstreamText_3c162
	dw -1

Data_92dca:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Data_92de6:
	person_event $1f, $0c, $02, $04, $01, $01, $02, $04, $00, Func_808fc_24, Data_92dc6
	person_event $18, $04, $01, $04, $01, $01, $02, $04, $00, NULL, NULL

Func_92e02:: ; 92e02
	ld e, $01
	ld hl, Data_92dbb
	scall LoadWarps
	ld a, $01
	scall LoadPlayerSprite
	ld hl, $0015
	scall CheckEventFlag
	or a
	jp nz, .asm_92e32
	ld e, $02
	ld hl, Data_92dca
	scall LoadMapObjects
	scall Func_8001c
	call Func_92e6d
	ld e, $01
	ld hl, $0015
	scall EventFlagAction
	jp .asm_92e5c
.asm_92e32:
	ld a, [wc790]
	or a
	jp z, .asm_92e54
	ld a, [wc790]
	cp $06
	jp nc, .asm_92e54
	ld e, $02
	ld hl, Data_92de6
	scall LoadMapObjects
	ld a, $11
	scall PlayMusic
	scall Func_8001c
	jp .asm_92e5c
.asm_92e54:
	ld a, $11
	scall PlayMusic
	scall Func_8001c
.asm_92e5c:
	ret

Data_92e5d:
	db $02, $02, $05, $02, $03, $02, $04, $02, $ff, $ff

Data_92e67:
	db $02, $02, $02, $04, $ff, $ff

Func_92e6d:
	ld e, $01
	xor a
	scall PlayerStep
	xor a
	scall PlayMusic
	ld a, $01
	scall PlayMusic
	hltext_tree_pointer TreeBitstreamText_3be8e
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $3d
	scall PlaySFX
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf25
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	scall WaitEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf4b
	scall PrintTextStandard
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $02
	ld e, $04
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bf50
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $34
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	hltext_tree_pointer TreeBitstreamText_3bf85
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld c, $02
	ld e, $08
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $69
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bf8e
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $10
	scall LoadEmote
	scall WaitEmote
	ld a, $34
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $01
	xor a
	scall SpriteFace
	ld bc, Data_92e5d
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $02
	ld a, $04
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld bc, Data_92e67
	ld e, $24
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $34
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $50
	ld a, $10
	scall LoadEmote
	ld a, $34
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	ld a, $68
	scall PlaySFX
	hltext_tree_pointer TreeBitstreamText_3bfc1
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld c, $01
	ld e, $20
	ld a, $10
	scall LoadEmote
	ld a, $4d
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $02
	scall PlayerStep
	ret
