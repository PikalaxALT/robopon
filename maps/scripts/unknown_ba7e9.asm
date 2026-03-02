
Data_ba65d:
	wildbot $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00

Data_ba66b:
	dtext_tree_pointer TreeBitstreamText_3aa4c
	dw -1

Data_ba66f:
	dtext_tree_pointer TreeBitstreamText_3aaa0
	dw -1

Data_ba673:
	dtext_tree_pointer TreeBitstreamText_3aabf
	dw -1

Data_ba677:
	dtext_tree_pointer TreeBitstreamText_3aadf
	dw -1

Data_ba67b:
	dtext_tree_pointer TreeBitstreamText_3aafc
	dw -1

Data_ba67f:
	dtext_tree_pointer TreeBitstreamText_3ab2b
	dw -1

Data_ba683:
	dtext_tree_pointer TreeBitstreamText_3ab80
	dw -1

Data_ba687:
	dtext_tree_pointer TreeBitstreamText_3a858
	dw -1

Data_ba68b:
	dtext_tree_pointer TreeBitstreamText_3abf2
	dw -1

Data_ba68f:
	dtext_tree_pointer TreeBitstreamText_3ac82
	dw -1

Data_ba693:
	dtext_tree_pointer TreeBitstreamText_3ad19
	dw -1

Data_ba697:
	dtext_tree_pointer TreeBitstreamText_3accc
	dw -1

Data_ba69b:
	dtext_tree_pointer TreeBitstreamText_46e95
	dw -1

Data_ba69f:
	dtext_tree_pointer TreeBitstreamText_46ecc
	dw -1

Data_ba6a3:
	dtext_tree_pointer TreeBitstreamText_47037
	dw -1

Data_ba6a7:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, Func_baa60, NULL
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, Func_babdc, NULL
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, Func_baefe, NULL

Data_ba6d1:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_badb0, NULL

Data_ba6df:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_bae5a, NULL

Data_ba6ed:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_baeb6, NULL

Data_ba6fb:
	person_event $01, $0c, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba66b

Data_ba709:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba66f

Data_ba717:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba673

Data_ba725:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba677

Data_ba733:
	person_event $0b, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67b

Data_ba741:
	person_event $04, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67f

Data_ba74f:
	person_event $05, $0c, $01, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba683

Data_ba75d:
	person_event $16, $0c, $06, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba687

Data_ba76b:
	person_event $02, $0c, $05, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68b

Data_ba779:
	person_event $0a, $0c, $02, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68f

Data_ba787:
	person_event $09, $0c, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba693

Data_ba795:
	person_event $00, $0c, $01, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba697

Data_ba7a3:
	person_event $ff, $00, $00, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69b
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69f

Data_ba7bf:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, $6efe, NULL

Func_ba7e9:: ; ba7e9
	resetevent EVENT_0FB
	set_frame_script Func_bb0b0
	loadpeople $02, Data_ba7a3
	playmusic SONG_TOWN3
	ld a, [wc790]
	or a
	jp z, .asm_ba839
	ld a, [wc790]
	cp $07
	jp nc, .asm_ba839
	loadpeople $03, Data_ba7bf
	ld a, $01
	scall Func_80d01
	loadwilds $01, Data_ba65d
	call Func_bafd6
	playmusic SONG_TOWN3
	scall Func_8001c
	jp .asm_baa5f
.asm_ba839:
	loadpeople $03, Data_ba6a7
	ld a, [wc78a]
	cp $0f
	jp z, .asm_baa4a
	cp $0e
	jp z, .asm_baa2a
	cp $0d
	jp z, .asm_baa0a
	cp $0c
	jp z, .asm_ba9f0
	cp $0b
	jp z, .asm_ba9bd
	cp $0a
	jp z, .asm_ba99d
	cp $09
	jp z, .asm_ba97d
	cp $08
	jp z, .asm_ba95d
	cp $07
	jp z, .asm_ba943
	cp $06
	jp z, .asm_ba929
	cp $05
	jp z, .asm_ba8f6
	cp $04
	jp z, .asm_ba8c4
	cp $03
	jp z, .asm_ba8b2
	cp $01
	jp z, .asm_ba898
	or a
	jp nz, .asm_baa5c
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
.asm_ba898:
	loadpeople $01, Data_ba75d
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8b2:
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8c4:
	loadpeople $01, Data_ba6fb
	checkevent EVENT_052
	or a
	jp nz, .asm_ba8de
	loadpeople $01, Data_ba6d1
.asm_ba8de:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_4680f
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8f6:
	loadpeople $01, Data_ba709
	checkevent EVENT_052
	cp $01
	jp nz, .asm_ba911
	loadpeople $01, Data_ba6df
.asm_ba911:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46818
	call Func_bad5c
	jp .asm_baa5f
.asm_ba929:
	loadpeople $01, Data_ba76b
	ld a, $01
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba943:
	loadpeople $01, Data_ba779
	ld a, $02
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba95d:
	loadpeople $01, Data_ba717
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46821
	call Func_bad5c
	jp .asm_baa5f
.asm_ba97d:
	loadpeople $01, Data_ba725
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_4682a
	call Func_bad5c
	jp .asm_baa5f
.asm_ba99d:
	loadpeople $01, Data_ba733
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_4684f
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9bd:
	loadpeople $01, Data_ba741
	checkevent EVENT_0ED
	cp $01
	jp nz, .asm_ba9d8
	loadpeople $01, Data_ba6ed
.asm_ba9d8:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46859
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9f0:
	loadpeople $01, Data_ba787
	ld a, $0d
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa0a:
	loadpeople $01, Data_ba795
	ld a, $08
	ld [wc7e2], a
	xor a
	scall Func_80653
	call Func_bb0b0
	scall Func_80f02
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa2a:
	loadpeople $01, Data_ba74f
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	landmarksign TreeBitstreamText_46861
	call Func_bad5c
	jp .asm_baa5f
.asm_baa4a:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa5c:
	scall Func_8001c
.asm_baa5f:
	ret

Func_baa60:
	ld a, e
	or a
	jp nz, .asm_babdb
	checkevent EVENT_059
	cp $01
	jp nz, .asm_baa79
	writetext TreeBitstreamText_47037
	jp .asm_babdb
.asm_baa79:
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_baa83
	jp .asm_babdb
.asm_baa83:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	resetevent EVENT_0FA
	ld a, [wc78a]
	cp $0e
	jp z, .asm_babc9
	cp $0d
	jp z, .asm_babb4
	cp $0c
	jp z, .asm_bab9f
	cp $0b
	jp z, .asm_bab8a
	cp $0a
	jp z, .asm_bab75
	cp $09
	jp z, .asm_bab60
	cp $08
	jp z, .asm_bab4b
	cp $07
	jp z, .asm_bab36
	cp $06
	jp z, .asm_bab21
	cp $05
	jp z, .asm_bab0c
	cp $04
	jp z, .asm_baaf7
	cp $01
	jp nz, .asm_babdb
	ld a, $02
	ld [wc78a], a
	warp_player MAP_05_20, $09, $0c
	jp .asm_babdb
.asm_baaf7:
	ld a, $05
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab0c:
	ld a, $06
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab21:
	ld a, $07
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab36:
	ld a, $05
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab4b:
	ld a, $09
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab60:
	ld a, $0a
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab75:
	ld a, $0b
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab8a:
	ld a, $0c
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_bab9f:
	ld a, $0d
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_babb4:
	ld a, $0b
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_babdb
.asm_babc9:
	ld a, $0f
	ld [wc78a], a
	warp_player MAP_04_01, $0c, $04
.asm_babdb:
	ret

Func_babdc:
	ld a, e
	or a
	jp nz, .asm_bad5b
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_babeb
	jp .asm_bad5b
.asm_babeb:
	checkevent EVENT_059
	cp $01
	jp nz, .asm_babff
	writetext TreeBitstreamText_47037
	jp .asm_bad5b
.asm_babff:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	resetevent EVENT_0FA
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bad49
	cp $0d
	jp z, .asm_bad34
	cp $0c
	jp z, .asm_bad1f
	cp $0b
	jp z, .asm_bad0a
	cp $0a
	jp z, .asm_bacf5
	cp $09
	jp z, .asm_bace0
	cp $08
	jp z, .asm_baccb
	cp $07
	jp z, .asm_bacb6
	cp $06
	jp z, .asm_baca1
	cp $05
	jp z, .asm_bac8c
	cp $04
	jp z, .asm_bac77
	cp $01
	jp nz, .asm_bad5b
	xor a
	scall PlayerFace
	warp_player MAP_05_21, $09, $10
	jp .asm_bad5b
.asm_bac77:
	ld a, $03
	ld [wc78a], a
	warp_player MAP_03_12, $16, $0f
	jp .asm_bad5b
.asm_bac8c:
	ld a, $08
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_baca1:
	ld a, $05
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bacb6:
	ld a, $06
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_baccb:
	ld a, $05
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bace0:
	ld a, $08
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bacf5:
	ld a, $09
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bad0a:
	ld a, $0e
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bad1f:
	ld a, $0b
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bad34:
	ld a, $0c
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
	jp .asm_bad5b
.asm_bad49:
	ld a, $0b
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
.asm_bad5b:
	ret

Func_bad5c:
	checkevent EVENT_0FA
	or a
	jp nz, .asm_bad9a
	playmusic SONG_TOWN3
	ld a, $02
	scall PlayerFace
	loademote $01, $02, $09
	playsfx SFX_37
	scall WaitEmote
	ld a, $01
	scall Func_80653
	script_sleep 1
	scall HideEmote
	setevent EVENT_0FA
	jp .asm_bad9f
.asm_bad9a:
	ld a, $01
	scall Func_80653
.asm_bad9f:
	ret

Data_bada0:
	db $02, $03, $04, $03, $04, $02, $ff, $ff

Data_bada8:
	db $01, $03, $04, $03, $04, $02, $ff, $ff

Func_badb0:
	push af
	ld a, e
	or a
	jp nz, .asm_bae4c
	face_player -$01
	writenpctext TreeBitstreamText_3ad48
	push hl
	push hl
	ld hl, $0000
	push hl
	ld hl, $0000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, $0000
	push hl
	ld hl, $0064
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_bade8
	writenpctext TreeBitstreamText_3ad91
	jp .asm_bae4c
.asm_bade8:
	writenpctext_yesorno TreeBitstreamText_3ad7f
	or a
	jp nz, .asm_bae46
	writetext TreeBitstreamText_3adc0
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $ff9c
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	writenpctext TreeBitstreamText_3add4
	setevent EVENT_052
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae2d
	ld bc, Data_bada0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae38
.asm_bae2d:
	ld bc, Data_bada8
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae38:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	jp .asm_bae4c
.asm_bae46:
	writenpctext TreeBitstreamText_3adae
.asm_bae4c:
	pop bc
	ret

Data_bae4e:
	db $02, $03, $03, $02, $ff, $ff

Data_bae54:
	db $01, $03, $03, $02, $ff, $ff

Func_bae5a:
	push af
	ld a, e
	or a
	jp nz, .asm_baea8
	face_player -$01
	writenpctext TreeBitstreamText_3ae53
	resetevent EVENT_052
	setevent EVENT_0ED
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae92
	ld bc, Data_bae4e
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae9d
.asm_bae92:
	ld bc, Data_bae54
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae9d:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baea8:
	pop bc
	ret

Data_baeaa:
	db $02, $03, $03, $02, $ff, $ff

Data_baeb0:
	db $01, $03, $03, $02, $ff, $ff

Func_baeb6:
	push af
	ld a, e
	or a
	jp nz, .asm_baefc
	face_player -$01
	writenpctext TreeBitstreamText_3ae53
	resetevent EVENT_0ED
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_baee6
	ld bc, Data_baeaa
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_baef1
.asm_baee6:
	ld bc, Data_baeb0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_baef1:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baefc:
	pop bc
	ret

Func_baefe:
	ld a, e
	or a
	jp nz, .asm_baf51
	ld a, [wc790]
	or a
	jp z, .asm_baf1b
	ld a, [wc790]
	cp $07
	jp nc, .asm_baf1b
	writetext TreeBitstreamText_47041
	jp .asm_baf51
.asm_baf1b:
	checkevent EVENT_059
	or a
	jp nz, .asm_baf3b
	setevent EVENT_059
	playsfx SFX_32
	writetext TreeBitstreamText_47029
	jp .asm_baf4e
.asm_baf3b:
	resetevent EVENT_059
	playsfx SFX_28
	writetext TreeBitstreamText_4701b
.asm_baf4e:
	call Func_bafd6
.asm_baf51:
	ret

Data_baf52:
	warpdef $01, $08, $02, $01, MAP_03_00, $1c, $10, $1c, $11, SFX_34

Data_baf5d:
	warpdef $01, $08, $02, $01, MAP_05_00, $08, $0b, $08, $0c, SFX_34

Data_baf68:
	warpdef $01, $08, $02, $01, MAP_05_00, $19, $0b, $19, $0c, SFX_34

Data_baf73:
	warpdef $01, $08, $02, $01, MAP_00_00, $1b, $14, $1b, $15, SFX_34

Data_baf7e:
	warpdef $01, $08, $02, $01, MAP_25_01, $07, $08, $07, $09, SFX_34

Data_baf89:
	warpdef $01, $08, $02, $01, MAP_05_00, $0a, $0e, $0a, $0f, SFX_34

Data_baf94:
	warpdef $01, $08, $02, $01, MAP_05_00, $16, $0e, $16, $0f, SFX_34

Data_baf9f:
	warpdef $01, $08, $02, $01, MAP_05_00, $0d, $14, $0d, $15, SFX_34

Data_bafaa:
	warpdef $01, $08, $02, $01, MAP_05_00, $13, $14, $13, $15, SFX_34

Data_bafb5:
	warpdef $01, $08, $02, $01, MAP_01_00, $07, $11, $07, $12, SFX_34

Data_bafc0:
	warpdef $01, $08, $02, $01, MAP_20_00, $15, $11, $15, $12, SFX_34

Data_bafcb:
	warpdef $01, $08, $02, $01, MAP_05_00, $10, $15, $10, $16, SFX_34

Func_bafd6:
	checkevent EVENT_059
	or a
	jp nz, .asm_bafe6
	scall AllocateSpaceForWarps
	jp .asm_bb0a9
.asm_bafe6:
	scall AllocateSpaceForWarps
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bb0a1
	cp $0d
	jp z, .asm_bb096
	cp $0c
	jp z, .asm_bb08b
	cp $0b
	jp z, .asm_bb080
	cp $0a
	jp z, .asm_bb075
	cp $09
	jp z, .asm_bb06a
	cp $08
	jp z, .asm_bb05f
	cp $07
	jp z, .asm_bb054
	cp $06
	jp z, .asm_bb049
	cp $05
	jp z, .asm_bb03e
	cp $04
	jp z, .asm_bb033
	cp $01
	jp nz, .asm_bb0a9
	loadwarps $01, Data_baf52
	jp .asm_bb0a9
.asm_bb033:
	loadwarps $01, Data_baf5d
	jp .asm_bb0a9
.asm_bb03e:
	loadwarps $01, Data_baf68
	jp .asm_bb0a9
.asm_bb049:
	loadwarps $01, Data_baf73
	jp .asm_bb0a9
.asm_bb054:
	loadwarps $01, Data_bafb5
	jp .asm_bb0a9
.asm_bb05f:
	loadwarps $01, Data_baf89
	jp .asm_bb0a9
.asm_bb06a:
	loadwarps $01, Data_baf94
	jp .asm_bb0a9
.asm_bb075:
	loadwarps $01, Data_baf9f
	jp .asm_bb0a9
.asm_bb080:
	loadwarps $01, Data_bafaa
	jp .asm_bb0a9
.asm_bb08b:
	loadwarps $01, Data_baf7e
	jp .asm_bb0a9
.asm_bb096:
	loadwarps $01, Data_bafc0
	jp .asm_bb0a9
.asm_bb0a1:
	loadwarps $01, Data_bafcb
.asm_bb0a9:
	ret

Data_bb0aa:
	db $07, $07, $02, $02, $01, $07

Func_bb0b0:
	ld a, [wc790]
	or a
	jp z, .asm_bb0d0
	ld a, [wc790]
	cp $07
	jp nz, .asm_bb0d0
	ld a, [wc78a]
	cp $0d
	jp nz, .asm_bb0d0
	ld hl, Data_bb0aa
	scall Func_80d9b
	scall Func_80f02
.asm_bb0d0:
	ret
