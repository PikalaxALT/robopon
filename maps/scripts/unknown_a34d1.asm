
Data_a3459:
	warpdef $0b, $0c, $01, $01, MAP_19_33, $0b, $11, $0a, $11, $2e
	warpdef $0e, $0c, $01, $01, MAP_19_31, $0e, $0c, $0d, $0c, $2e

Data_a346f:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3499:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a353b, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a359b, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a35fb, NULL

Data_a34c3:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a34d1:: ; a34d1
	ld e, $02
	ld hl, Data_a3459
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a346f
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00ce
	scall CheckEventFlag
	or a
	jp z, .asm_a3509
	ld hl, $00cf
	scall CheckEventFlag
	or a
	jp z, .asm_a3509
	ld hl, $00d0
	scall CheckEventFlag
	or a
	jp nz, .asm_a3529
.asm_a3509:
	ld e, $00
	ld hl, $00ce
	scall EventFlagAction
	ld e, $00
	ld hl, $00cf
	scall EventFlagAction
	ld e, $00
	ld hl, $00d0
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3499
	scall LoadMapObjects
.asm_a3529:
	ld e, $01
	ld hl, Data_a34c3
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $034a
	scall LandmarkSign
	ret

Func_a353b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a355a
	cp $01
	jp nz, .asm_a3599
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3557
	ld a, $01
	ld [wc7c4], a
.asm_a3557:
	jp .asm_a3599
.asm_a355a:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3599
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ce
	scall EventFlagAction
	ld hl, $00cf
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3599
	ld hl, $00d0
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3599
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a3599:
	pop bc
	ret

Func_a359b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a35ba
	cp $01
	jp nz, .asm_a35f9
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a35b7
	ld a, $01
	ld [wc7c4], a
.asm_a35b7:
	jp .asm_a35f9
.asm_a35ba:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a35f9
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cf
	scall EventFlagAction
	ld hl, $00ce
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a35f9
	ld hl, $00d0
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a35f9
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a35f9:
	pop bc
	ret

Func_a35fb:
	push af
	ld a, e
	cp $03
	jp z, .asm_a361a
	cp $01
	jp nz, .asm_a3659
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3617
	ld a, $01
	ld [wc7c4], a
.asm_a3617:
	jp .asm_a3659
.asm_a361a:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3659
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00d0
	scall EventFlagAction
	ld hl, $00ce
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3659
	ld hl, $00cf
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3659
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a3659:
	pop bc
	ret
