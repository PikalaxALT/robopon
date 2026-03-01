
Data_aeeb3:
	warpdef $12, $04, $01, $01, MAP_27_08, $12, $14, $11, $14, SFX_2E
	warpdef $0a, $04, $01, $01, MAP_27_10, $09, $04, $0a, $04, SFX_2E
	warpdef $05, $04, $01, $01, MAP_27_10, $04, $04, $04, $05, SFX_2E

Data_aeed4:
	db $4b, $13, $05, $02, $56

Data_aeed9:
IF DEF(SUN)
	wildbot $00, $03, $14, $14, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $14, $14, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $14, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $14, $14, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aef1f:
	person_event $1b, $04, $05, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $04, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $06, $0e, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Data_aef9d:
	person_event $1b, $04, $04, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $07, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $03, $0f, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Func_af01b:: ; af01b
	loadwarps $03, Data_aeeb3
	ld e, $01
	ld hl, Data_aeed4
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_aeed9
	checkevent $004e
	or a
	jp nz, .asm_af057
	checkevent $004d
	or a
	jp nz, .asm_af057
	loadpeople $09, Data_aef1f
	jp .asm_af074
.asm_af057:
	checkevent $004e
	or a
	jp nz, .asm_af074
	checkevent $004d
	cp $01
	jp nz, .asm_af074
	loadpeople $09, Data_aef9d
.asm_af074:
	playmusic $08
	scall Func_8001c
	landmarksign TreeBitstreamText_46bdf
	ret

Func_af083:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0a2
	cp $01
	jp nz, .asm_af0a5
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af09f
	ld a, $01
	ld [wc7c4], a
.asm_af09f:
	jp .asm_af0a5
.asm_af0a2:
	call Func_af113
.asm_af0a5:
	pop bc
	ret

Func_af0a7:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0c6
	cp $01
	jp nz, .asm_af0c9
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af0c3
	ld a, $01
	ld [wc7c4], a
.asm_af0c3:
	jp .asm_af0c9
.asm_af0c6:
	call Func_af113
.asm_af0c9:
	pop bc
	ret

Func_af0cb:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0ea
	cp $01
	jp nz, .asm_af0ed
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af0e7
	ld a, $01
	ld [wc7c4], a
.asm_af0e7:
	jp .asm_af0ed
.asm_af0ea:
	call Func_af113
.asm_af0ed:
	pop bc
	ret

Func_af0ef:
	push af
	ld a, e
	cp $03
	jp z, .asm_af10e
	cp $01
	jp nz, .asm_af111
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af10b
	ld a, $01
	ld [wc7c4], a
.asm_af10b:
	jp .asm_af111
.asm_af10e:
	call Func_af113
.asm_af111:
	pop bc
	ret

Func_af113:
	push bc
	ld hl, sp+$01
	ld [hl], $04
.asm_af118:
	ld hl, sp+$01
	ld a, [hl]
	cp $08
	jp nc, .asm_af15c
	ld hl, sp+$00
	ld [hl], $00
.asm_af124:
	ld hl, sp+$00
	ld a, [hl]
	cp $04
	jp nc, .asm_af152
	ld hl, sp+$01
	ld e, [hl]
	ld hl, sp+$00
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp nz, .asm_af13d
	jp .asm_af152
.asm_af13d:
	ld hl, sp+$00
	ld a, [hl]
	cp $03
	jp nz, .asm_af148
	jp .asm_af15f
.asm_af148:
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
	jp .asm_af124
.asm_af152:
	ld hl, sp+$01
	ld a, [hl]
	inc a
	ld hl, sp+$01
	ld [hl], a
	jp .asm_af118
.asm_af15c:
	call Func_af161
.asm_af15f:
	pop bc
	ret

Func_af161:
	setevent $004e
	playsfx $2b
	hideperson 0
	script_sleep 30
	playsfx $2b
	hideperson $01
	script_sleep 30
	playsfx $2b
	hideperson $02
	script_sleep 30
	playsfx $2b
	hideperson $03
	script_sleep 30
	ret

Func_af1b1:
	push af
	ld a, e
	or a
	jp nz, .asm_af223
	face_player -$01
	checkevent $004d
	or a
	jp nz, .asm_af21d
	checkevent $004e
	or a
	jp nz, .asm_af21d
	writenpctext TreeBitstreamText_3e85a
	ld a, $24
	scall Func_80e5d
	cp $01
	jp nz, .asm_af214
	writenpctext TreeBitstreamText_3e87a
	writenpctext_yesorno TreeBitstreamText_3e896
	or a
	jp nz, .asm_af20b
	ld c, $01
	ld e, $01
	ld a, $24
	scall Func_80d4d
	setevent $004d
	writenpctext TreeBitstreamText_3e8a6
	jp .asm_af211
.asm_af20b:
	writenpctext TreeBitstreamText_3e8d4
.asm_af211:
	jp .asm_af21a
.asm_af214:
	writenpctext TreeBitstreamText_3e87a
.asm_af21a:
	jp .asm_af223
.asm_af21d:
	writenpctext TreeBitstreamText_3e8e5
.asm_af223:
	pop bc
	ret
