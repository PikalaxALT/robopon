INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 25, 2", ROMX
	script_library 25_2

Data_96d59:
	db $0b, $0f, $05, $01, $1e, $00, $0c, $0b, $0b, $0b, $2e
    db $09, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0b, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0d, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $0f, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e
    db $11, $04, $01, $01, $0c, $01, $09, $2c, $09, $2b, $2e

Data_96d9b:
	db $3b, $03, $ff, $ff

Data_96d9f:
	person_event $ff, $00, $0a, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b
	person_event $ff, $00, $10, $0e, $01, $01, $00, $04, $00, PrintTextFacePlayer_25_2, Data_96d9b

Func_96dbb:: ; 96dbb
	ld e, $06
	ld hl, Data_96d59
	scall LoadWarps
	ld e, $02
	ld hl, Data_96d9f
	scall LoadMapObjects
	playmusic SONG_0A
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_96dd9:
	db $08, $2c, $03, $01, $0c, $00, $0d, $04, $0d, $05, $2e
    db $09, $03, $01, $01, $0c, $02, $1c, $0a, $1b, $0a, $2e

Data_96def:
    db $9f, $04, $ff, $ff

Data_96df3:
    db $a2, $04, $ff, $ff

Data_96df7:
    db $a3, $04, $ff, $ff

Data_96dfb:
	db $a4, $04, $ff, $ff

Data_96dff:
    db $a5, $04, $ff, $ff

Data_96e03:
    db $a6, $04, $ff, $ff

Data_96e07:
    db $a7, $04, $ff, $ff

Data_96e0b:
	person_event $08, $04, $07, $12, $01, $01, $02, $04, $00, Func_96f2b, NULL
    person_event $08, $04, $03, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df3
    person_event $08, $04, $04, $1e, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96df7
    person_event $08, $04, $05, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dfb
    person_event $08, $04, $06, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96dff
    person_event $08, $04, $0d, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e03
    person_event $08, $04, $0e, $19, $01, $01, $02, $04, $00, PrintTextFacePlayer_25_2, Data_96e07
    person_event $04, $0c, $09, $23, $01, $01, $02, $04, $00, NULL, NULL
    person_event $ff, $00, $08, $24, $03, $01, $02, $04, $01, Func_970d8, NULL
    person_event $04, $04, $07, $22, $01, $01, $01, $04, $00, Func_808fc_25_2, Data_96def

Func_96e97:: ; 96e97
	ld l, $00
	push hl
	ld c, $06
	ld e, $0d
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $06
	ld e, $0d
	ld a, $0b
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0b
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0b
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0e
	ld a, $01
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0e
	ld a, $10
	scall Func_80f24
	pop bc
	ld e, $02
	ld hl, Data_96dd9
	scall LoadWarps
	ld e, $0a
	ld hl, Data_96e0b
	scall LoadMapObjects
	ld hl, $010e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_96f11
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
	jp .asm_96f18
.asm_96f11:
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
.asm_96f18:
	playmusic SONG_TOWN2
	scall Func_8001c
	ret

Data_96f21:
	db $09, $12, $ff, $ff

Data_96f25:
    db $06, $13, $09, $12, $ff, $ff

Func_96f2b:
	ld a, e
	or a
	jp nz, .asm_970c9
	xor a
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_47aea
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_970c3
	ld hl, $001e
	scall ScriptSleep
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_96f60
	ld c, $01
	ld de, Data_96f25
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	jp .asm_96f71
.asm_96f60:
	ld c, $01
	ld de, Data_96f21
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
.asm_96f71:
	hltext_tree_pointer TreeBitstreamText_47b05
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_MAZE_MINIGAME
	xor a
.asm_96f91:
	cp $05
	jp nc, .asm_96fa2
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_96f91
.asm_96fa2:
	ld hl, $001e
	scall ScriptSleep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	ld c, $01
	ld e, $0f
	ld a, $24
	scall LoadEmote
	ld e, $06
	ld a, $09
	scall MoveEmote
	scall WaitEmote
	ld c, $01
	ld e, $4f
	ld a, $25
	scall LoadEmote
	ld e, $06
	ld a, $09
	scall MoveEmote
	ld hl, $0168
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $68
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $04
	scall SetPersonVisibilityState
	xor a
.asm_9705a:
	cp $05
	jp nc, .asm_9706c
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_9705a
.asm_9706c:
	ld hl, $001e
	scall ScriptSleep
	scall RepairRobots
	ld a, $01
	scall FadeInAudio
	playmusic SONG_NONE
	playmusic SONG_HEAL
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	hltext_tree_pointer TreeBitstreamText_46e0b
	scall PrintTextStandard
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $09
	scall SetPersonVisibilityState
	playmusic SONG_TOWN2
	jp .asm_970c9
.asm_970c3:
	hltext_tree_pointer TreeBitstreamText_47b1d
	scall PrintTextStandard
.asm_970c9:
	ret

Data_970ca:
    db $09, $22, $07, $22, $ff, $ff

Data_970d0:
    db $09, $24, $ff, $ff,

Data_970d4:
    db 09, $26, $ff, $ff

Func_970d8:
	ld a, e
	cp $02
	jp nz, .asm_9714f
	ld c, $01
	ld de, Data_970d0
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	ld a, $18
	scall Func_80e5d
	or a
	jp z, .asm_97136
	hltext_tree_pointer TreeBitstreamText_47bd1
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_970ca
	ld e, $25
	ld a, $07
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $07
	scall SpriteFace
	ld e, $01
	ld hl, $010e
	scall EventFlagAction
	ld l, $24
	push hl
	ld c, $09
	ld e, $01
	ld a, $0c
	scall Func_80dff
	pop bc
	jp .asm_9714f
.asm_97136:
	hltext_tree_pointer TreeBitstreamText_47c51
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_970d4
	ld a, $25
	scall MovePlayer
	scall WaitNPCStep
.asm_9714f:
	ret

Data_97150:
    db $01, $0a, $01, $01, $0c, $03, $03, $0e, $03, $0d, $2e
    db $1c, $0a, $01, $01, $0c, $01, $09, $03, $09, $04, $2e

Data_97166:
	person_event $0f, $04, $07, $0e, $01, $01, $02, $04, $00, NULL, NULL
    person_event $ff, $00, $07, $0e, $01, $01, $02, $04, $00, Func_971f5, NULL
    person_event $03, $04, $09, $04, $01, $01, $02, $04, $00, Func_97311, NULL
    person_event $03, $04, $10, $04, $01, $01, $02, $04, $00, Func_97379, NULL
    person_event $03, $04, $17, $04, $01, $01, $02, $04, $00, Func_973e1, NULL
    person_event $ff, $00, $09, $09, $01, $01, $02, $04, $01, Func_97420, NULL
    person_event $ff, $00, $10, $09, $01, $01, $02, $04, $01, Func_97437, NULL
    person_event $ff, $00, $17, $09, $01, $01, $02, $04, $01, Func_9744e, NULL

Func_971d6:: ; 971d6
	ld e, $02
	ld hl, Data_97150
	scall LoadWarps
	ld e, $08
	ld hl, Data_97166
	scall LoadMapObjects
	playmusic SONG_TOWN2
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall Func_8001c
	ret

Func_971f5:
	ld a, e
	or a
	jp nz, label_972e7
	ld hl, $00db
	scall CheckEventFlag
	or a
	jp nz, label_972e1
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $0e
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
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
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	xor a
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $02
	ld e, $01
	xor a
	scall Func_80e8d
	ld e, $01
	ld hl, $00db
	scall EventFlagAction
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
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TOWN2
	xor a
	scall FacePlayer
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp label_972e7
label_972e1:
	hltext_tree_pointer TreeBitstreamText_3f79e
	scall PrintTextStandard
label_972e7:
	ret

Data_972e8:
	db $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $3f, $03, $14
	db $02, $09, $00, $78, $40, $03, $14, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_97311:
	push af
	ld a, e
	or a
	jp nz, label_97346
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_472f0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_97340
	ld de, Data_97348
	ld hl, Data_972e8
	scall ScriptedBattle
	or a
	jp nz, label_97337
	jp label_97346
label_97337:
	hltext_tree_pointer TreeBitstreamText_47319
	scall PrintTextStandard
	jp label_97346
label_97340:
	hltext_tree_pointer TreeBitstreamText_47306
	scall PrintTextStandard
label_97346:
	pop bc
	ret

Data_97348:
    dstr "(おんなのこ)"

Data_97350:
    db $00, $00, $00, $02, $00, $c5
	db $b3, $00, $00, $01, $01, $62, $04, $1e, $02, $03, $00, $78, $63, $04, $1e, $0d
	db $09, $0a, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $02

Func_97379:
	push af
	ld a, e
	or a
	jp nz, label_973ae
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_472f0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_973a8
	ld de, Data_973b0
	ld hl, Data_97350
	scall ScriptedBattle
	or a
	jp nz, label_9739f
	jp label_973ae
label_9739f:
	hltext_tree_pointer TreeBitstreamText_47319
	scall PrintTextStandard
	jp label_973ae
label_973a8:
	hltext_tree_pointer TreeBitstreamText_47306
	scall PrintTextStandard
label_973ae:
	pop bc
	ret

Data_973b0:
    dstr "(おんなのこ)"

Data_973b8:
    db $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $41, $05, $28
	db $02, $02, $05, $67, $50, $05, $28, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_973e1:
	push af
	ld a, e
	or a
	jp nz, label_97416
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	hltext_tree_pointer TreeBitstreamText_472f0
	scall PrintTextWithYesNoBox
	or a
	jp nz, label_97410
	ld de, Data_97418
	ld hl, Data_973b8
	scall ScriptedBattle
	or a
	jp nz, label_97407
	jp label_97416
label_97407:
	hltext_tree_pointer TreeBitstreamText_47319
	scall PrintTextStandard
	jp label_97416
label_97410:
	hltext_tree_pointer TreeBitstreamText_47306
	scall PrintTextStandard
label_97416:
	pop bc
	ret

Data_97418:
    dstr "(おんなのこ)"

Func_97420:
	ld a, e
	cp $02
	jp nz, label_97436
	ld a, [wPlayerFacing]
	or a
	jp nz, label_97436
	ld hl, $0308
	scall LandmarkSign
	jp label_97436
label_97436:
	ret

Func_97437:
	ld a, e
	cp $02
	jp nz, label_9744d
	ld a, [wPlayerFacing]
	or a
	jp nz, label_9744d
	ld hl, $0309
	scall LandmarkSign
	jp label_9744d
label_9744d:
	ret

Func_9744e:
	ld a, e
	cp $02
	jp nz, label_97464
	ld a, [wPlayerFacing]
	or a
	jp nz, label_97464
	ld hl, $030a
	scall LandmarkSign
	jp label_97464
label_97464:
	ret

Data_97465:
    db $03, $0e, $01, $01, $0c, $02, $01, $0a, $02, $0a, $2e

Data_97470:
    db $22, $03, $03

Data_97473:
    db $22, $03, $03, $00, $00

Data_97478:
    person_event $00, $04, $02, $03, $01, $01, $03, $04, $00, Func_806dd_25_2, Data_97470

Func_97486:: ; 97486
	ld e, $01
	ld hl, Data_97465
	scall LoadWarps
	ld e, $01
	ld hl, Data_97473
	scall Func_80ce7
	ld e, $01
	ld hl, Data_97478
	scall LoadMapObjects
	playmusic SONG_TOWN2
	scall Func_8001c
	ret
