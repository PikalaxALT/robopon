
Data_a3257:
	warpdef $0b, $0c, $01, $01, MAP_19_30, $0b, $0c, $0a, $0c, $2e
	warpdef $0e, $0c, $01, $01, MAP_19_32, $0e, $0c, $0d, $0c, $2e

Data_a326d:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3297:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3339, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3399, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a33f9, NULL

Data_a32c1:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a32cf:: ; a32cf
	ld e, $02
	ld hl, Data_a3257
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a326d
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00cb
	scall CheckEventFlag
	or a
	jp z, .asm_a3307
	ld hl, $00cc
	scall CheckEventFlag
	or a
	jp z, .asm_a3307
	ld hl, $00cd
	scall CheckEventFlag
	or a
	jp nz, .asm_a3327
.asm_a3307:
	ld e, $00
	ld hl, $00cb
	scall EventFlagAction
	ld e, $00
	ld hl, $00cc
	scall EventFlagAction
	ld e, $00
	ld hl, $00cd
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3297
	scall LoadMapObjects
.asm_a3327:
	ld e, $01
	ld hl, Data_a32c1
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $03ee
	scall LandmarkSign
	ret
Func_a3339:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3358
	cp $01
	jp nz, .asm_a3397
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3355
	ld a, $01
	ld [wc7c4], a
.asm_a3355:
	jp .asm_a3397
.asm_a3358:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3397
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cb
	scall EventFlagAction
	ld hl, $00cc
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3397
	ld hl, $00cd
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3397
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a3397:
	pop bc
	ret
Func_a3399:
	push af
	ld a, e
	cp $03
	jp z, .asm_a33b8
	cp $01
	jp nz, .asm_a33f7
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a33b5
	ld a, $01
	ld [wc7c4], a
.asm_a33b5:
	jp .asm_a33f7
.asm_a33b8:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a33f7
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cc
	scall EventFlagAction
	ld hl, $00cb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a33f7
	ld hl, $00cd
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a33f7
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a33f7:
	pop bc
	ret
Func_a33f9:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3418
	cp $01
	jp nz, .asm_a3457
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3415
	ld a, $01
	ld [wc7c4], a
.asm_a3415:
	jp .asm_a3457
.asm_a3418:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3457
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cd
	scall EventFlagAction
	ld hl, $00cb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3457
	ld hl, $00cc
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3457
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a3457:
	pop bc
	ret
