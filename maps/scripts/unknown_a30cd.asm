
Data_a3060:
	warpdef $0b, $0c, $01, $01, MAP_19_31, $0b, $0c, $0a, $0c, $2e

Data_a306b:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $14, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $14, $17, $46, $1f, $17, $11, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3095:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3137, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3197, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a31f7, NULL

Data_a30bf:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a30cd:: ; a30cd
	ld e, $01
	ld hl, Data_a3060
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a306b
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00c8
	scall CheckEventFlag
	or a
	jp z, .asm_a3105
	ld hl, $00c9
	scall CheckEventFlag
	or a
	jp z, .asm_a3105
	ld hl, $00ca
	scall CheckEventFlag
	or a
	jp nz, .asm_a3125
.asm_a3105:
	ld e, $00
	ld hl, $00c8
	scall EventFlagAction
	ld e, $00
	ld hl, $00c9
	scall EventFlagAction
	ld e, $00
	ld hl, $00ca
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3095
	scall LoadMapObjects
.asm_a3125:
	ld e, $01
	ld hl, Data_a30bf
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $041c
	scall LandmarkSign
	ret

Func_a3137:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3156
	cp $01
	jp nz, .asm_a3195
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3153
	ld a, $01
	ld [wc7c4], a
.asm_a3153:
	jp .asm_a3195
.asm_a3156:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3195
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00c8
	scall EventFlagAction
	ld hl, $00c9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3195
	ld hl, $00ca
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3195
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a3195:
	pop bc
	ret

Func_a3197:
	push af
	ld a, e
	cp $03
	jp z, .asm_a31b6
	cp $01
	jp nz, .asm_a31f5
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a31b3
	ld a, $01
	ld [wc7c4], a
.asm_a31b3:
	jp .asm_a31f5
.asm_a31b6:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a31f5
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00c9
	scall EventFlagAction
	ld hl, $00c8
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a31f5
	ld hl, $00ca
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a31f5
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a31f5:
	pop bc
	ret

Func_a31f7:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3216
	cp $01
	jp nz, .asm_a3255
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3213
	ld a, $01
	ld [wc7c4], a
.asm_a3213:
	jp .asm_a3255
.asm_a3216:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3255
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ca
	scall EventFlagAction
	ld hl, $00c8
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3255
	ld hl, $00c9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3255
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a3255:
	pop bc
	ret
