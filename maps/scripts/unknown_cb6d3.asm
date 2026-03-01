
Data_cb60e:
	warpdef $01, $0a, $01, $01, MAP_21_22, $01, $0a, $01, $09, $2e
	warpdef $0d, $0b, $01, $01, MAP_21_22, $0d, $0b, $0c, $0b, $2e
	warpdef $12, $0d, $01, $01, MAP_21_22, $12, $0d, $11, $0d, $2e
	warpdef $07, $13, $01, $01, MAP_21_24, $07, $13, $07, $12, $2e
	warpdef $0c, $02, $01, $01, MAP_21_24, $0c, $02, $0c, $03, $2e
	warpdef $11, $09, $01, $01, MAP_21_24, $11, $09, $11, $0a, $2e

Data_cb650:
	db $33, $0c, $05, $03, $18

Data_cb655:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $23, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb69b:
	person_event $09, $0c, $0e, $03, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0d, $03, $01, $03, $00, $04, $01, Func_cb721, NULL
	person_event $ff, $00, $0e, $06, $04, $01, $00, $04, $01, Func_cb721, NULL

Data_cb6c5:
	person_event $ff, $00, $09, $0a, $02, $02, $00, $04, $00, Func_cb809, NULL

Func_cb6d3:: ; cb6d3
	ld e, $06
	ld hl, Data_cb60e
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb650
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb655
	scall LoadEncounters
	ld hl, $00ad
	scall CheckEventFlag
	or a
	jp nz, .asm_cb702
	ld e, $03
	ld hl, Data_cb69b
	scall LoadMapObjects
.asm_cb702:
	ld e, $01
	ld hl, Data_cb6c5
	scall LoadMapObjects
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0302
	scall LandmarkSign
	ret

Data_cb719:
	db $0d, $03, $ff, $ff

Data_cb71d:
	db $0e, $04, $ff, $ff

Func_cb721:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb774
	ld hl, $00ad
	scall CheckEventFlag
	or a
	jp nz, .asm_cb774
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb756
	ld c, $01
	ld de, Data_cb719
	ld a, $32
	scall MovePlayer
	ld e, $03
	xor a
	scall SpriteFace
	jp .asm_cb760
.asm_cb756:
	ld c, $01
	ld de, Data_cb71d
	ld a, $32
	scall MovePlayer
.asm_cb760:
	call Func_cb7a9
	ld e, $01
	ld hl, $00ad
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb774:
	pop bc
	ret

Data_cb776:
	db $0e, $06, $11, $09, $ff, $ff

Data_cb77c:
	db $0c, $02, $ff, $ff

Data_cb780:
	db $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $20, $26, $12, $00, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_cb7a9:
	ld hl, $00db
	scall PrintTextStandard
	ld de, Data_cb801
	ld hl, Data_cb780
	scall ScriptedBattle
	or a
	jp nz, Func_cb7bd
	ret

Func_cb7bd:
	ld hl, $00dc
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_cb7d7
	ld bc, Data_cb776
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cb7e0
.asm_cb7d7:
	ld bc, Data_cb77c
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cb7e0:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
	ret

Data_cb801:
	dstr "(くﾞんそう)"

Func_cb809:
	ld a, e
	or a
	jp nz, .asm_cb834
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
	ld hl, $0322
	scall PrintTextStandard
	ld a, $07
	scall PlayMusic
.asm_cb834:
	ret
