
Data_8dde0:
	warpdef $0c, $04, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $12, $11, $01, $01, MAP_08_00, $13, $0d, $12, $0d, SFX_2E

Data_8ddf6:
	dtext_tree_pointer TreeBitstreamText_465ec
	dw -1

Data_8ddfa:
	dtext_tree_pointer TreeBitstreamText_46e1d
	dtext_tree_pointer TreeBitstreamText_46e3b
	dtext_tree_pointer TreeBitstreamText_46e4b
	dw -1

Data_8de02:
	person_event $02, $0c, $0e, $07, $01, $01, $03, $04, $00, Func_8dfe6, NULL
	person_event $0c, $0c, $0a, $09, $01, $01, $01, $04, $00, Func_8e080, NULL
	person_event $00, $0c, $09, $0c, $01, $01, $01, $04, $00, Func_8e11a, NULL
	person_event $0c, $0c, $0d, $0d, $01, $01, $03, $04, $00, Func_8e1b2, NULL
	person_event $0b, $0c, $07, $11, $01, $01, $01, $04, $00, Func_8e24c, NULL
	person_event $04, $0c, $12, $11, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0e, $10, $03, $03, $00, $04, $01, Func_8e2be, NULL

Data_8de64:
	person_event $0f, $04, $06, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $05, $01, $01, $02, $04, $00, Func_8e36e, NULL
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8ddf6
	person_event $ff, $00, $0d, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_23, Data_8ddf6
	person_event $ff, $00, $0c, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_23, Data_8ddfa

Func_8deaa:: ; 8deaa
	ld a, $06
	ld [wc7e2], a
	call Func_8df6e
	ld hl, Func_8df6e
	scall Func_80f11
	loadwarps $02, Data_8dde0
	loadpeople $05, Data_8de64
	hideperson 0
	checkevent $0037
	or a
	jp nz, .asm_8df41
	loadpeople $07, Data_8de02
	hideperson $0a
	checkevent $0028
	cp $01
	jp nz, .asm_8def9
	hideperson $05
.asm_8def9:
	checkevent $0029
	cp $01
	jp nz, .asm_8df0b
	hideperson $06
.asm_8df0b:
	checkevent $002a
	cp $01
	jp nz, .asm_8df1d
	hideperson $07
.asm_8df1d:
	checkevent $002b
	cp $01
	jp nz, .asm_8df2f
	hideperson $08
.asm_8df2f:
	checkevent $002c
	cp $01
	jp nz, .asm_8df41
	hideperson $09
.asm_8df41:
	checkevent $0037
	cp $01
	jp nz, .asm_8df54
	ld a, $03
	scall PlayMusic
	jp .asm_8df59
.asm_8df54:
	ld a, $04
	scall PlayMusic
.asm_8df59:
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_8df62:
	db $10, $0d, $01, $01, $12, $12

Data_8df68:
	db $11, $12, $01, $01, $12, $12

Func_8df6e:
	checkevent $0028
	or a
	jp z, .asm_8dfa0
	checkevent $0029
	or a
	jp z, .asm_8dfa0
	checkevent $002a
	or a
	jp z, .asm_8dfa0
	checkevent $002b
	or a
	jp z, .asm_8dfa0
	checkevent $002c
	or a
	jp nz, .asm_8dfa9
.asm_8dfa0:
	ld hl, Data_8df62
	scall Func_80d9b
	jp .asm_8dfaf
.asm_8dfa9:
	ld hl, Data_8df68
	scall Func_80d9b
.asm_8dfaf:
	scall Func_80f02
	ret

Data_8dfb3:
	db $0c, $04, $ff, $ff

Data_8dfb7:
	db $0e, $06, $0c, $04, $ff, $ff

Data_8dfbd:
	db $00, $00, $00, $01, $00, $c5, $b2, $00, $00, $1f, $01, $1f, $03, $11, $17, $17
	db $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8dfe6:
	push af
	ld a, e
	or a
	jp nz, .asm_8e046
	checkevent $0028
	or a
	jp nz, .asm_8e046
	face_player -$01
	writetext TreeBitstreamText_429e1
	startbattle Data_8e048, Data_8dfbd
	or a
	jp nz, .asm_8e012
	jp .asm_8e046
.asm_8e012:
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_8e028
	move_person -$01, Data_8dfb7, 1
	jp .asm_8e033
.asm_8e028:
	move_person -$01, Data_8dfb3, 1
.asm_8e033:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $0028
.asm_8e046:
	pop bc
	ret

Data_8e048:
	dstr "ソﾞク1"

Data_8e04d:
	db $0a, $08, $0c, $04, $ff, $ff

Data_8e053:
	db $0c, $04, $ff, $ff

Data_8e057:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17
	db $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e080:
	push af
	ld a, e
	or a
	jp nz, .asm_8e0e0
	checkevent $0029
	or a
	jp nz, .asm_8e0e0
	face_player -$01
	writetext TreeBitstreamText_429f2
	startbattle Data_8e0e2, Data_8e057
	or a
	jp nz, .asm_8e0ac
	jp .asm_8e0e0
.asm_8e0ac:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, .asm_8e0c2
	move_person -$01, Data_8e04d, 1
	jp .asm_8e0cd
.asm_8e0c2:
	move_person -$01, Data_8e053, 1
.asm_8e0cd:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $0029
.asm_8e0e0:
	pop bc
	ret

Data_8e0e2:
	dstr "ソﾞク2"

Data_8e0e7:
	db $09, $0b, $0b, $06, $ff, $ff

Data_8e0ed:
	db $0b, $06, $ff, $ff

Data_8e0f1:
	db $00, $00, $00, $01, $00, $c5, $ae, $00, $00, $1f, $01, $1f, $03, $12, $17, $17
	db $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e11a:
	push af
	ld a, e
	or a
	jp nz, .asm_8e17a
	checkevent $002a
	or a
	jp nz, .asm_8e17a
	face_player -$01
	writetext TreeBitstreamText_42a0d
	startbattle Data_8e17c, Data_8e0f1
	or a
	jp nz, .asm_8e146
	jp .asm_8e17a
.asm_8e146:
	ld a, [wPlayerFacing]
	cp $03
	jp nz, .asm_8e15c
	move_person -$01, Data_8e0e7, 1
	jp .asm_8e167
.asm_8e15c:
	move_person -$01, Data_8e0ed, 1
.asm_8e167:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002a
.asm_8e17a:
	pop bc
	ret

Data_8e17c:
	dstr "ソﾞク3"

Data_8e181:
	db $0e, $07, $ff, $ff

Data_8e185:
	db $0d, $07, $ff, $ff

Data_8e189:
	db $00, $00, $00, $01, $00, $c5, $c6, $00, $00, $1f, $01, $1f, $03, $12, $17, $17
	db $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e1b2:
	push af
	ld a, e
	or a
	jp nz, .asm_8e212
	checkevent $002b
	or a
	jp nz, .asm_8e212
	face_player -$01
	writetext TreeBitstreamText_42a00
	startbattle Data_8e214, Data_8e189
	or a
	jp nz, .asm_8e1de
	jp .asm_8e212
.asm_8e1de:
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_8e1f4
	move_person -$01, Data_8e181, 1
	jp .asm_8e1ff
.asm_8e1f4:
	move_person -$01, Data_8e185, 1
.asm_8e1ff:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002b
.asm_8e212:
	pop bc
	ret

Data_8e214:
	dstr "ソﾞク4"

Data_8e219:
	db $09, $0c, $ff, $ff

Data_8e21d:
	db $07, $12, $09, $0c, $ff, $ff

Data_8e223:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $20, $01, $20, $03, $13, $17, $17
	db $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8e24c:
	push af
	ld a, e
	or a
	jp nz, .asm_8e2ab
	checkevent $002c
	or a
	jp nz, .asm_8e2ab
	face_player -$01
	writetext TreeBitstreamText_42a24
	startbattle Data_8e2ad, Data_8e223
	or a
	jp nz, .asm_8e278
	jp .asm_8e2ab
.asm_8e278:
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_8e28d
	move_person -$01, Data_8e219, 1
	jp .asm_8e298
.asm_8e28d:
	move_person -$01, Data_8e21d, 1
.asm_8e298:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $002c
.asm_8e2ab:
	pop bc
	ret

Data_8e2ad:
	dstr "ソﾞク5"

Data_8e2b2:
	db $12, $12, $10, $12, $ff, $ff

Data_8e2b8:
	db $12, $12, $12, $11, $ff, $ff

Func_8e2be:
	ld a, e
	cp $02
	jp nz, .asm_8e36d
	checkevent $0028
	cp $01
	jp nz, .asm_8e36d
	checkevent $0029
	cp $01
	jp nz, .asm_8e36d
	checkevent $002a
	cp $01
	jp nz, .asm_8e36d
	checkevent $002b
	cp $01
	jp nz, .asm_8e36d
	checkevent $002c
	cp $01
	jp nz, .asm_8e36d
	checkevent $0037
	or a
	jp nz, .asm_8e36d
	xor a
	scall PlayMusic
	showperson $0a
	ld hl, $003c
	scall ScriptSleep
	ld a, $30
	scall PlaySFX
	call Func_8df6e
	ld hl, Func_8df6e
	scall Func_80f11
	ld hl, $003c
	scall ScriptSleep
	move_person $0a, Data_8e2b2, 1
	scall WaitNPCStep
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_8e346
	ld e, $00
	ld a, $0a
	scall SpriteFace
.asm_8e346:
	writenpctext TreeBitstreamText_3b605
	move_person $0a, Data_8e2b8, 1
	scall WaitNPCStep
	ld a, $2e
	scall PlaySFX
	hideperson $0a
	setevent $0037
.asm_8e36d:
	ret

Func_8e36e:
	ld a, e
	or a
	jp nz, .asm_8e479
	checkevent $00d9
	or a
	jp nz, .asm_8e473
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $05
	ld a, $06
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	showperson 0
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
	face_player 0
	ld hl, $001e
	scall ScriptSleep
	ld c, $05
	ld e, $04
	ld a, $03
	scall Func_80e8d
	setevent $00d9
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
	checkevent $0037
	cp $01
	jp nz, .asm_8e45c
	ld a, $01
	scall FadeInAudio
	ld a, $03
	scall PlayMusic
	jp .asm_8e466
.asm_8e45c:
	ld a, $01
	scall FadeInAudio
	ld a, $04
	scall PlayMusic
.asm_8e466:
	face_player 0
	hideperson 0
	jp .asm_8e479
.asm_8e473:
	writetext TreeBitstreamText_3f79e
.asm_8e479:
	ret
