
Data_a3b53:
	warpdef $03, $21, $01, $01, MAP_19_38, $01, $0d, $02, $0d, SFX_2E

Data_a3b5e:
	db $28, $03, $05

Data_a3b61:
	db $28, $03, $05, $00, $00

Data_a3b66:
	person_event $00, $04, $02, $05, $01, $01, $03, $04, $00, Func_806dd_28, Data_a3b5e
	person_event $00, $04, $03, $1a, $01, $01, $00, $04, $00, Func_a3cd5, NULL

Data_a3b82:
IF DEF(SUN)
	wildbot $00, $03, $06, $21, $5f, $15, $19, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $06, $21, $34, $16, $1a, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $06, $21, $35, $16, $1a, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $06, $21, $29, $17, $1b, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $06, $21, $57, $15, $19, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $06, $21, $26, $16, $1a, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $06, $21, $5f, $16, $1a, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $06, $21, $2a, $17, $1b, $10, $05, $05, $05, $04, $02, $00
ENDC

Func_a3bc8:: ; a3bc8
	call Func_a3c8b
	ld hl, Func_a3c8b
	scall Func_80f11
	ld e, $01
	ld hl, Data_a3b53
	scall LoadWarps
	ld e, $01
	ld hl, Data_a3b61
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a3b82
	scall LoadEncounters
	ld e, $02
	ld hl, Data_a3b66
	scall LoadMapObjects
	ld hl, $00ec
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3c08
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_a3c08:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $045d
	scall LandmarkSign
	ret

Func_a3c17:: ; a3c17
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld a, [wc799]
	cp $02
	jp z, .asm_a3c63
	cp $01
	jp z, .asm_a3c54
	or a
	jp nz, .asm_a3c6f
	ld e, $19
	ld a, $03
	scall MoveEmote
	ld a, $01
	ld [wc799], a
	jp .asm_a3c6f
.asm_a3c54:
	ld e, $14
	ld a, $03
	scall MoveEmote
	ld a, $02
	ld [wc799], a
	jp .asm_a3c6f
.asm_a3c63:
	ld e, $0f
	ld a, $03
	scall MoveEmote
	ld a, $03
	ld [wc799], a
.asm_a3c6f:
	scall WaitEmote
	scall HideEmote
	call Func_a3c8b
	ret

Data_a3c79:
	db $02, $1b, $01, $02, $03, $18

Data_a3c7f:
	db $02, $1b, $01, $02, $03, $13

Data_a3c85:
	db $02, $1b, $01, $02, $03, $0e

Func_a3c8b:
	ld a, [wc799]
	cp $03
	jp z, .asm_a3cb5
	cp $02
	jp z, .asm_a3ca6
	cp $01
	jp nz, .asm_a3cc7
	ld hl, Data_a3c79
	scall Func_80d9b
	jp .asm_a3cc7
.asm_a3ca6:
	ld hl, Data_a3c79
	scall Func_80d9b
	ld hl, Data_a3c7f
	scall Func_80d9b
	jp .asm_a3cc7
.asm_a3cb5:
	ld hl, Data_a3c79
	scall Func_80d9b
	ld hl, Data_a3c7f
	scall Func_80d9b
	ld hl, Data_a3c85
	scall Func_80d9b
.asm_a3cc7:
	scall Func_80f02
	ret

Data_a3ccb:
	db $02, $1a, $ff, $ff

Data_a3ccf:
	db $02, $1b, $03, $1b, $ff, $ff

Func_a3cd5:
	ld a, e
	or a
	jp nz, .asm_a3d72
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_a3cf6
	ld c, $01
	ld de, Data_a3ccf
	ld a, $28
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	jp .asm_a3cf6
.asm_a3cf6:
	ld a, $01
	scall FacePlayer
	ld a, [wc790]
	cp $05
	jp nc, .asm_a3d51
	ld a, $2e
	scall Func_80e5d
	cp $01
	jp nz, .asm_a3d51
	ld hl, $00ec
	scall CheckEventFlag
	or a
	jp nz, .asm_a3d48
	ld hl, $045c
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_a3ccb
	ld e, $28
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld hl, $00ec
	scall EventFlagAction
	jp .asm_a3d4e
.asm_a3d48:
	ld hl, $010f
	scall PrintTextStandard
.asm_a3d4e:
	jp .asm_a3d72
.asm_a3d51:
	ld hl, $00ec
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3d65
	ld hl, $010f
	scall PrintTextStandard
	jp .asm_a3d72
.asm_a3d65:
	ld hl, $045b
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $01
	scall SpriteFace
.asm_a3d72:
	ret
