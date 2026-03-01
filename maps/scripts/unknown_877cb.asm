
Data_87669:
	warpdef $16, $07, $01, $01, MAP_03_11, $01, $11, $02, $11, SFX_2E
    warpdef $01, $06, $01, $01, MAP_03_13, $06, $04, $06, $05, SFX_2E
    warpdef $15, $12, $01, $01, MAP_03_15, $07, $04, $06, $04, SFX_2E
    warpdef $16, $0e, $01, $01, MAP_32_03, $04, $02, $04, $03, SFX_2E

Data_87695: ; 87695
	warpdef $16, $07, $01, $01, MAP_03_11, $01, $11, $02, $11, SFX_2E
    warpdef $01, $06, $01, $01, MAP_03_14, $06, $04, $06, $05, SFX_2E
    warpdef $15, $12, $01, $01, MAP_03_15, $07, $04, $06, $04, SFX_2E
    warpdef $16, $0e, $01, $01, MAP_32_03, $04, $02, $04, $03, SFX_2E

Data_876c1: ; 876c1
IF DEF(SUN)
	wildbot $00, $04, $18, $0a, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $04, $18, $0a, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $04, $18, $0a, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $04, $18, $0a, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $00, $04, $18, $0a, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $14, $0e, $05, $06, $05, $09, $0b, $2e, $01, $06, $00, $08, $0a
	wildbot $14, $0e, $05, $06, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $14, $0e, $05, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ELIF DEF(STAR)
	wildbot $00, $04, $18, $0a, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $04, $18, $0a, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $04, $18, $0a, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $04, $18, $0a, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $00, $04, $18, $0a, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $14, $0e, $05, $06, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $14, $0e, $05, $06, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $14, $0e, $05, $06, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ENDC

Data_87731: ; 87731
	person_event $1b, $04, $08, $08, $01, $01, $02, $04, $00, Func_8788b, NULL
    person_event $1b, $04, $09, $09, $01, $01, $02, $04, $00, Func_878f1, NULL
    person_event $1b, $04, $0a, $0a, $01, $01, $02, $04, $00, Func_87957, NULL
    person_event $1b, $04, $0b, $0b, $01, $01, $02, $04, $00, Func_879bd, NULL

Data_87769: ; 87769
	person_event $1b, $04, $09, $09, $01, $01, $02, $04, $00, Func_87a23, NULL
    person_event $1b, $04, $0a, $0a, $01, $01, $02, $04, $00, Func_87a73, NULL

Data_87785: ; 87785
	person_event $ff, $00, $09, $0d, $01, $01, $00, $04, $01, NULL, NULL
    person_event $ff, $00, $16, $0e, $01, $01, $00, $04, $00, Func_87b14, NULL
    person_event $ff, $00, $17, $0e, $01, $01, $00, $04, $00, Func_87ac3, NULL
    person_event $03, $04, $15, $0a, $01, $01, $00, $04, $00, Func_87c5c, NULL
    person_event $04, $04, $01, $09, $01, $01, $01, $04, $00, Func_87ce5, NULL

Func_877cb::
	checkevent $51
	or a
	jp nz, .asm_877f5
	checkevent $4c
	or a
	jp nz, .asm_877f5
	call Func_87648
	loadwarps $4, Data_87669
	loadpeople $4, Data_87731
	jp .asm_87828

.asm_877f5: ; 877f5 (21:77f5)
	checkevent $51
	cp $1
	jp nz, .asm_87820
	checkevent $4c
	or a
	jp nz, .asm_87820
	call Func_87648
	loadwarps $4, Data_87669
	loadpeople $2, Data_87769
	jp .asm_87828

.asm_87820: ; 87820 (21:7820)
	loadwarps $4, Data_87695
.asm_87828: ; 87828 (21:7828)
	ld a, $3
	scall Func_80d01
	loadwilds $8, Data_876c1
	loadpeople $5, Data_87785
	playmusic SONG_CAVE
	ld a, $4
	ld [wc7e2], a
	ld a, [wc78a]
	cp $3
	jp nz, .asm_8786b
	checkevent $fb
	or a
	jp nz, .asm_8785f
	call Func_87b87
	jp .asm_87868

.asm_8785f: ; 8785f (21:785f)
	scall Func_8001c
	landmarksign TreeBitstreamText_46886
.asm_87868: ; 87868 (21:7868)
	jp .asm_8788a

.asm_8786b: ; 8786b (21:786b)
	checkevent $0
	or a
	jp nz, .asm_8787d
	ld a, $1
	ld [wc7da], a
	jp .asm_87881

.asm_8787d: ; 8787d (21:787d)
	xor a
	ld [wc7da], a
.asm_87881: ; 87881 (21:7881)
	scall Func_8001c
	landmarksign TreeBitstreamText_46886
.asm_8788a: ; 8788a (21:788a)
	ret

Func_8788b:
	push af
	ld a, e
	cp $3
	jp z, .asm_878aa
	cp $1
	jp nz, .asm_878ef
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_878a7
	ld a, $1
	ld [wc7c4], a
.asm_878a7: ; 878a7 (21:78a7)
	jp .asm_878ef

.asm_878aa: ; 878aa (21:78aa)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_878ef
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $18
	checkevent $19
	cp $1
	jp nz, .asm_878ef
	checkevent $1a
	cp $1
	jp nz, .asm_878ef
	checkevent $4b
	cp $1
	jp nz, .asm_878ef
	call Func_87c03
.asm_878ef: ; 878ef (21:78ef)
	pop bc
	ret

Func_878f1:
	push af
	ld a, e
	cp $3
	jp z, .asm_87910
	cp $1
	jp nz, .asm_87955
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_8790d
	ld a, $1
	ld [wc7c4], a
.asm_8790d: ; 8790d (21:790d)
	jp .asm_87955

.asm_87910: ; 87910 (21:7910)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_87955
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $19
	checkevent $18
	cp $1
	jp nz, .asm_87955
	checkevent $1a
	cp $1
	jp nz, .asm_87955
	checkevent $4b
	cp $1
	jp nz, .asm_87955
	call Func_87c03
.asm_87955: ; 87955 (21:7955)
	pop bc
	ret

Func_87957:
	push af
	ld a, e
	cp $3
	jp z, .asm_87976
	cp $1
	jp nz, .asm_879bb
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_87973
	ld a, $1
	ld [wc7c4], a
.asm_87973: ; 87973 (21:7973)
	jp .asm_879bb

.asm_87976: ; 87976 (21:7976)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_879bb
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $1a
	checkevent $18
	cp $1
	jp nz, .asm_879bb
	checkevent $19
	cp $1
	jp nz, .asm_879bb
	checkevent $4b
	cp $1
	jp nz, .asm_879bb
	call Func_87c03
.asm_879bb: ; 879bb (21:79bb)
	pop bc
	ret

Func_879bd:
	push af
	ld a, e
	cp $3
	jp z, .asm_879dc
	cp $1
	jp nz, .asm_87a21
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_879d9
	ld a, $1
	ld [wc7c4], a
.asm_879d9: ; 879d9 (21:79d9)
	jp .asm_87a21

.asm_879dc: ; 879dc (21:79dc)
	ld e, $4
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_87a21
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $4b
	checkevent $18
	cp $1
	jp nz, .asm_87a21
	checkevent $19
	cp $1
	jp nz, .asm_87a21
	checkevent $1a
	cp $1
	jp nz, .asm_87a21
	call Func_87c03
.asm_87a21: ; 87a21 (21:7a21)
	pop bc
	ret

Func_87a23:
	push af
	ld a, e
	cp $3
	jp z, .asm_87a42
	cp $1
	jp nz, .asm_87a71
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_87a3f
	ld a, $1
	ld [wc7c4], a
.asm_87a3f: ; 87a3f (21:7a3f)
	jp .asm_87a71

.asm_87a42: ; 87a42 (21:7a42)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_87a71
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $18
	checkevent $19
	cp $1
	jp nz, .asm_87a71
	call Func_87c03
.asm_87a71: ; 87a71 (21:7a71)
	pop bc
	ret

Func_87a73:
	push af
	ld a, e
	cp $3
	jp z, .asm_87a92
	cp $1
	jp nz, .asm_87ac1
	ld hl, sp+$1
	ld a, [hl]
	scall Func_80bde
	cp $1
	jp nz, .asm_87a8f
	ld a, $1
	ld [wc7c4], a
.asm_87a8f: ; 87a8f (21:7a8f)
	jp .asm_87ac1

.asm_87a92: ; 87a92 (21:7a92)
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_87ac1
	playsfx $2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $19
	checkevent $18
	cp $1
	jp nz, .asm_87ac1
	call Func_87c03
.asm_87ac1: ; 87ac1 (21:7ac1)
	pop bc
	ret

Func_87ac3:
	ld a, e
	or a
	jp nz, .asm_87b13
	ld a, [wc790]
	or a
	jp z, .asm_87ae0
	ld a, [wc790]
	cp $7
	jp nc, .asm_87ae0
	writetext TreeBitstreamText_47041
	jp .asm_87b13

.asm_87ae0: ; 87ae0 (21:7ae0)
	checkevent $59
	or a
	jp nz, .asm_87b00
	setevent $59
	playsfx $32
	writetext TreeBitstreamText_47029
	jp .asm_87b13

.asm_87b00: ; 87b00 (21:7b00)
	resetevent $59
	playsfx $28
	writetext TreeBitstreamText_4701b
.asm_87b13: ; 87b13 (21:7b13)
	ret

Func_87b14:
	ld a, e
	or a
	jp nz, .asm_87b86
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_87b23
	jp .asm_87b86

.asm_87b23: ; 87b23 (21:7b23)
	checkevent $59
	cp $1
	jp nz, .asm_87b37
	writetext TreeBitstreamText_47037
	jp .asm_87b86

.asm_87b37: ; 87b37 (21:7b37)
	ld a, [wc790]
	or a
	jp z, .asm_87b4f
	ld a, [wc790]
	cp $7
	jp nc, .asm_87b4f
	writetext TreeBitstreamText_47037
	jp .asm_87b86

.asm_87b4f: ; 87b4f (21:7b4f)
	ld a, $4
	ld [wc78a], a
	xor a
	scall Func_80653
	loademote $1, $1, $9
	playsfx $5a
	scall WaitEmote
	scall HideEmote
	ld a, $2
	scall PlayerFace
	resetevent $fa
	ld l, $3
	push hl
	ld c, $3
	ld e, $3
	ld a, $20
	scall Func_80dff
	pop bc
.asm_87b86: ; 87b86 (21:7b86)
	ret

Func_87b87: ; 87b87 (21:7b87)
	checkevent $0
	or a
	jp nz, .asm_87b99
	ld a, $1
	ld [wc7da], a
	jp .asm_87b9d

.asm_87b99: ; 87b99 (21:7b99)
	xor a
	ld [wc7da], a
.asm_87b9d: ; 87b9d (21:7b9d)
	xor a
	scall Func_80653
	ld a, $2
	scall PlayerFace
	scall Func_8001c
	landmarksign TreeBitstreamText_46886
	loademote $1, $2, $9
	playsfx $37
	scall WaitEmote
	ld a, $1
	scall Func_80653
	script_sleep 1
	scall HideEmote
	setevent $fb
	ret

Data_87bd7:
	warpdef $16, $07, $01, $01, MAP_03_11, $01, $11, $02, $11, SFX_2E
	warpdef $01, $06, $01, $01, MAP_03_14, $06, $04, $06, $05, SFX_2E
	warpdef $15, $12, $01, $01, MAP_03_15, $07, $04, $06, $04, SFX_2E
	warpdef $16, $0e, $01, $01, MAP_32_03, $04, $02, $04, $03, SFX_2E

Func_87c03: ; 87c03 (21:7c03)
	setevent $4c
	scall AllocateSpaceForWarps
	loadwarps $4, Data_87bd7
	scall StartShakingScreen
	playsfx $64
	script_sleep 60
	playsfx $64
	script_sleep 60
	scall StopShakingScreen
	ret

Data_87c33:
	db $00, $00, $00, $01, $00, $c5, $b3, $00, $00, $48, $01, $48, $02, $0d, $02, $02
	db $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87c5c:
	push af
	ld a, e
	or a
	jp nz, .asm_87cb2
	face_player -$1
	checkevent $70
	or a
	jp nz, .asm_87cac
	writetext TreeBitstreamText_42b4c
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_87ca3
	startbattle Data_87cb4, Data_87c33
	or a
	jp nz, .asm_87c92
	jp .asm_87cb2

.asm_87c92: ; 87c92 (21:7c92)
	setevent $70
	writetext TreeBitstreamText_42b64
	jp .asm_87ca9

.asm_87ca3: ; 87ca3 (21:7ca3)
	writetext TreeBitstreamText_42b98
.asm_87ca9: ; 87ca9 (21:7ca9)
	jp .asm_87cb2

.asm_87cac: ; 87cac (21:7cac)
	writetext TreeBitstreamText_42b4c
.asm_87cb2: ; 87cb2 (21:7cb2)
	pop bc
	ret

Data_87cb4:
	dstr "(おんなのこ)"

Data_87cbc:
	db $00, $00, $00, $01, $00, $c5, $b4, $00, $00, $49, $01, $49, $02, $0e, $07, $11
	db $14, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87ce5:
	push af
	ld a, e
	or a
	jp nz, .asm_87d3b
	face_player -$1
	checkevent $71
	or a
	jp nz, .asm_87d35
	writetext TreeBitstreamText_42bd2
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_87d2c
	startbattle Data_87d3d, Data_87cbc
	or a
	jp nz, .asm_87d1b
	jp .asm_87d3b

.asm_87d1b: ; 87d1b (21:7d1b)
	setevent $71
	writetext TreeBitstreamText_42bdd
	jp .asm_87d32

.asm_87d2c: ; 87d2c (21:7d2c)
	writetext TreeBitstreamText_42bd2
.asm_87d32: ; 87d32 (21:7d32)
	jp .asm_87d3b

.asm_87d35: ; 87d35 (21:7d35)
	writetext TreeBitstreamText_42bd2
.asm_87d3b: ; 87d3b (21:7d3b)
	pop bc
	ret

Data_87d3d:
	dstr "(しﾞいさん)"
