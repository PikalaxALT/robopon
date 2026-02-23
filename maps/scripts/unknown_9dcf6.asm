
Data_9dc24:
	warpdef $02, $0b, $02, $01, MAP_18_00, $1b, $0e, $1b, $0f, $2e

Data_9dc2f:
	db $88, $0f, $02, $12, $2a
	db $89, $11, $02, $12, $15
	db $8a, $00, $06, $12, $20

Data_9dc3e:
	dtext_tree_pointer TreeBitstreamText_42f84
	dw -1

Data_9dc42:
	dtext_tree_pointer TreeBitstreamText_4380b
	dtext_tree_pointer TreeBitstreamText_43945
	dw -1

Data_9dc48:
	dtext_tree_pointer TreeBitstreamText_4393b
	dw -1

Data_9dc4c:
	dtext_tree_pointer TreeBitstreamText_43b4c
	dw -1

Data_9dc50:
	dtext_tree_pointer TreeBitstreamText_43d46
	dw -1

Data_9dc54:
	dtext_tree_pointer TreeBitstreamText_43cbb
	dw -1

Data_9dc58:
	dtext_tree_pointer TreeBitstreamText_472d8
	dw -1

Data_9dc5c:
	person_event $0a, $04, $06, $04, $01, $01, $00, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $00, $04, $00, Func_9df90, NULL

Data_9dc78:
	person_event $0a, $04, $06, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc3e
	person_event $06, $04, $07, $04, $01, $01, $02, $04, $00, Func_9df90, NULL

Data_9dc94:
	person_event $0a, $04, $06, $04, $01, $01, $03, $04, $00, Func_808fc_27, Data_9dc42
	person_event $06, $04, $08, $04, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc50
	person_event $08, $04, $05, $04, $01, $01, $01, $04, $00, Func_808fc_27, Data_9dc48

Data_9dcbe:
	person_event $ff, $00, $03, $04, $01, $02, $02, $04, $00, Func_808fc_27, Data_9dc4c

Data_9dccc:
	person_event $ff, $00, $0f, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $11, $01, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58
	person_event $ff, $00, $00, $05, $01, $01, $02, $04, $00, Func_808fc_27, Data_9dc58

Func_9dcf6:: ; 9dcf6
	call Func_9ddbb
	ld hl, Func_9ddbb
	scall Func_80f11
	ld e, $00
	ld hl, $0010
	scall EventFlagAction
	ld e, $01
	ld hl, Data_9dc24
	scall LoadWarps
	ld a, $0d
	scall PlayMusic
	ld hl, $00ba
	scall CheckEventFlag
	or a
	jp nz, .asm_9dd37
	ld e, $02
	ld hl, Data_9dc5c
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_9dccc
	scall LoadMapObjects
	scall Func_8001c
	call Func_9ddf2
	jp .asm_9dda8
.asm_9dd37:
	ld hl, $00be
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dd62
	ld hl, $00ee
	scall CheckEventFlag
	or a
	jp nz, .asm_9dd62
	ld e, $03
	ld hl, Data_9dc94
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_9dccc
	scall LoadMapObjects
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd62:
	ld hl, $00ee
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dd83
	ld e, $01
	ld hl, Data_9dcbe
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_9dc2f
	scall Func_80ce7
	scall Func_8001c
	jp .asm_9dda8
.asm_9dd83:
	ld e, $02
	ld hl, Data_9dc78
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_9dccc
	scall LoadMapObjects
	ld hl, $00bb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dda5
	ld de, Data_9dc54
	xor a
	scall SetPersonTextPointer
.asm_9dda5:
	scall Func_8001c
.asm_9dda8:
	ret

Data_9dda9:
	db $16, $06, $01, $02, $06, $01

Data_9ddaf:
	db $16, $08, $01, $02, $07, $01

Data_9ddb5:
	db $16, $0a, $01, $02, $03, $04

Func_9ddbb:
	ld hl, $00ba
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9ddd5
	ld hl, Data_9dda9
	scall Func_80d9b
	ld hl, Data_9ddaf
	scall Func_80d9b
	scall Func_80f02
.asm_9ddd5:
	ld hl, $00ee
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dde9
	ld hl, Data_9ddb5
	scall Func_80d9b
	scall Func_80f02
.asm_9dde9:
	ret

Data_9ddea:
	db $05, $07, $ff, $ff

Data_9ddee:
	db $07, $07, $ff, $ff

Func_9ddf2:
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $026a
	scall PrintTextWithNPCName
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld c, $00
	ld de, Data_9ddea
	ld a, $27
	scall MovePlayer
	scall WaitNPCStep
	ld c, $00
	ld de, Data_9ddee
	ld a, $27
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_9de33:
	cp $03
	jp nc, .asm_9de44
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_9de33
.asm_9de44:
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld a, $62
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $02
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld a, $62
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $02
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	xor a
	scall PlayMusic
	ld a, $1c
	scall PlayMusic
	ld hl, $00b4
	scall ScriptSleep
	ld e, $01
	ld hl, $00ba
	scall EventFlagAction
	call Func_9ddbb
	ld c, $01
	ld e, $03
	ld a, $27
	scall LoadEmote
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld e, $80
	xor a
	scall SetPersonVisibilityState
	ld e, $80
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $51
	scall PlaySFX
	scall WaitEmote
	ld e, $81
	xor a
	scall SetPersonVisibilityState
	ld e, $81
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $003c
	scall ScriptSleep
	ld a, $69
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayMusic
	ld a, $0d
	scall PlayMusic
	ld hl, $026b
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld c, $01
	ld e, $07
	ld a, $28
	scall LoadEmote
	ld e, $01
	ld a, $06
	scall MoveEmote
	ld e, $80
	xor a
	scall SetPersonVisibilityState
	ld e, $80
	ld a, $01
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $81
	xor a
	scall SetPersonVisibilityState
	ld e, $81
	ld a, $01
	scall SetPersonVisibilityState
	call NextOverworldFrame
	scall Func_801b8
	ld hl, $003c
	scall ScriptSleep
	xor a
.asm_9df58:
	cp $03
	jp nc, .asm_9df6a
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_9df58
.asm_9df6a:
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $026c
	scall PrintTextWithNPCName
	ret

Func_9df90:
	ld a, e
	or a
	jp nz, .asm_9dfe3
	ld a, $01
	scall FacePlayer
	ld hl, $00b9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dfc2
	ld hl, $00bb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_9dfb9
	ld hl, $037f
	scall PrintTextWithNPCName
	jp .asm_9dfbf
.asm_9dfb9:
	ld hl, $0271
	scall PrintTextWithNPCName
.asm_9dfbf:
	jp .asm_9dfe3
.asm_9dfc2:
	ld hl, $026e
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_9dfdd
	ld hl, $026f
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $00b9
	scall EventFlagAction
	jp .asm_9dfe3
.asm_9dfdd:
	ld hl, $0270
	scall PrintTextWithNPCName
.asm_9dfe3:
	ret
