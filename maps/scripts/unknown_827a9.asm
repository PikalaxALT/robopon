Data_8271c:
	db $06, $0e, $02, $01, $00, $00, $10, $0c, $10, $0d, $2e, $03, $01, $01, $01, $00, $1f, $01, $08, $01, $07, $34, $09, $01, $01, $01, $20, $05, $06, $0b, $06, $0a, $34, $0c, $01, $01, $01, $00, $1e, $08, $01, $08, $02, $2e, $0d, $01, $01, $01, $00, $0b, $09, $01, $09, $02, $2e, $0e, $01, $01, $01, $20, $09, $01, $06, $01, $05, $34

Data_8275e: ; 8275e
	db $5f, $0b, $03, $13, $0a

Data_82763: ; 82763
	db $ff, $00, $09, $03, $01, $01, $00, $04, $01, $20, $df, $68, $00, $00, $24, $0c, $06, $0c, $01, $01, $00, $04, $00, $20, $00, $00, $00, $00, $2d, $0c, $07, $02, $01, $02, $02, $04, $00, $20, $8c, $69, $00, $00, $08, $04, $01, $06, $01, $01, $02, $04, $00, $20, $fd, $69, $00, $00

Data_8279b: ; 8279b
	db $1a, $04, $02, $02, $01, $01, $01, $04, $00, $20, $9b, $69, $00, $00

Func_827a9::
	call Func_82866
	ld hl, Func_82866
	scall Func_80f11
	ld a, $1
	ld [wc7de], a
	loadwarps $6, Data_8271c
	ld e, $1
	ld hl, Data_8275e
	scall Func_80ce7
	ld a, [wc793]
	or a
	jp z, Func_827de
	ld a, [wc793]
	cp $2
	jp z, Func_827de
	ld a, [wc793]
	cp $3
	jp nz, Func_8283f
Func_827de: ; 827de (20:67de)
	loadpeople $4, Data_82763
	playmusic SONG_SHOP
	ld a, [wBackupMapGroup]
	cp $20
	jp nz, Func_82811
	ld a, [wBackupMapNumber]
	cp $5
	jp nz, Func_82811
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	scall FadeInMap
	landmarksign TreeBitstreamText_46ce3
	call Func_829dd
	jp Func_8283c

Func_82811: ; 82811 (20:6811)
	checkevent $d
	or a
	jp nz, Func_8282c
	scall FadeInMap
	call Func_82894
	setevent $d
	jp Func_8283c

Func_8282c: ; 8282c (20:682c)
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	scall FadeInMap
	landmarksign TreeBitstreamText_46ce3
Func_8283c: ; 8283c (20:683c)
	jp Func_82859

Func_8283f: ; 8283f (20:683f)
	loadpeople $4, Data_82763
	loadpeople $1, Data_8279b
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	scall FadeInMap
Func_82859: ; 82859 (20:6859)
	ret

Data_8285a:
	db $08, $01, $01, $01, $0d, $01

Data_82860: ; 82860
	db $08, $01, $01, $01, $0e, $01

Func_82866: ; 82866 (20:6866)
	ld a, [wc78c]
	cp $2
	jp nc, Func_82874
	ld hl, Data_8285a
	scall Func_80d9b
Func_82874: ; 82874 (20:6874)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82882
	ld hl, Data_82860
	scall Func_80d9b
Func_82882: ; 82882 (20:6882)
	scall Func_80f02
	ret

Data_82886:
	db $06, $04, $ff, $ff

Data_8288a: ; 8288a
	db $06, $05, $07, $04, $ff, $ff

Data_82890: ; 82890
	db $03, $01, $ff, $ff

Func_82894: ; 82894 (20:6894)
	ld bc, Data_82886
	ld e, BANK(Data_82886)
	ld a, $1
	call MovePerson_20
	move_player $1, Data_8288a
	call WaitNPCStep_20
	writenpctext TreeBitstreamText_39235
	writenpctext TreeBitstreamText_39257
	ld bc, Data_82890
	ld e, BANK(Data_82890)
	ld a, $1
	call MovePerson_20
	move_player $3, Data_82890
	call WaitNPCStep_20
	ret

Data_828cf:
	db $09, $02, $ff, $ff

Data_828d3: ; 828d3
	db $07, $02, $ff, $ff

Data_828d7: ; 828d7
	db $09, $04, $ff, $ff

Data_828db: ; 828db
	db $09, $01, $ff, $ff

Func_828df:
	ld a, e
	cp $2
	jp nz, Func_8298b
	ld bc, Data_828cf
	ld e, BANK(Data_828cf)
	ld a, $2
	scall Func_80688
	call WaitNPCStep_20
	sprite_face $2, $2
	checkevent $32
	cp $1
	jp nz, Func_82967
	writenpctext_yesorno TreeBitstreamText_45e91
	or a
	jp nz, Func_82940
	writenpctext TreeBitstreamText_45eaa
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	scall Func_80688
	call WaitNPCStep_20
	sprite_face $2, $2
	move_player $1, Data_828db
	call WaitNPCStep_20
	resetevent $f8
	jp Func_82964

Func_82940: ; 82940 (20:6940)
	writenpctext TreeBitstreamText_45ebc
	move_player $1, Data_828d7
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	scall Func_80688
	call WaitNPCStep_20
	sprite_face $2, $2
Func_82964: ; 82964 (20:6964)
	jp Func_8298b

Func_82967: ; 82967 (20:6967)
	ld hl, FillMemory
	call PrintTextWithNPCName_20
	move_player $1, Data_828d7
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	scall Func_80688
	call WaitNPCStep_20
	sprite_face $2, $2
Func_8298b: ; 8298b (20:698b)
	ret

Func_8298c:
	ld a, e
	or a
	jp nz, Func_8299a
	writenpctext TreeBitstreamText_45e48
	scall Func_8045c
Func_8299a: ; 8299a (20:699a)
	ret

Func_8299b:
	ld a, e
	or a
	jp nz, Func_829d0
	face_player $5
	ld a, [wc78c]
	inc a
	ld [wc78c], a
	ld a, [wc78c]
	cp $15
	jp nz, Func_829b9
	ld a, $1
	ld [wc78c], a
Func_829b9: ; 829b9 (20:69b9)
	set_farcall_addrs_hli Func_bd6fa
	ld a, [wc78c]
	ld e, a
	ld d, $0
	ld hl, Data_829d1
	call FarCall
Func_829d0: ; 829d0 (20:69d0)
	ret

Data_829d1:
	db $66, $6c, $61, $67, $20, $25, $64, $00

Data_829d9: ; 829d9
	db $09, $04, $ff, $ff

Func_829dd: ; 829dd (20:69dd)
	checkevent $f8
	or a
	jp nz, .asm_829fc
	move_player $1, Data_829d9
	call WaitNPCStep_20
	setevent $f8
.asm_829fc
	ret

Func_829fd:
	push af
	ld a, e
	or a
	jp nz, Func_82ab6
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	checkevent $114
	or a
	jp nz, Func_82ab0
	ld a, $10
	scall Func_80e5d
	or a
	jp z, Func_82a9b
	writetext_yesorno TreeBitstreamText_45f28
	or a
	jp nz, Func_82a92
	playsfx $2b
	ld c, $1
	ld e, $1
	ld a, $10
	scall Func_80d4d
	ld a, [wc79c]
	or a
	jp nz, Func_82a43
	ld a, $2
	ld [wc79c], a
	jp Func_82a59

Func_82a43: ; 82a43 (20:6a43)
	ld a, [wc79c]
	or a
	jp nz, Func_82a52
	ld a, $2
	ld [wc79c], a
	jp Func_82a59

Func_82a52: ; 82a52 (20:6a52)
	ld a, [wc79c]
	inc a
	ld [wc79c], a
Func_82a59: ; 82a59 (20:6a59)
	writetext TreeBitstreamText_45f3d
	ld a, [wc79c]
	cp $9
	jp c, Func_82a8f
	writetext TreeBitstreamText_45f56
	playsfx $2a
	writetext TreeBitstreamText_45f88
	ld c, $0
	ld e, $1
	ld a, $18
	scall Func_80d4d
	setevent $114
	writetext TreeBitstreamText_45f98
Func_82a8f: ; 82a8f (20:6a8f)
	jp Func_82a98

Func_82a92: ; 82a92 (20:6a92)
	writetext TreeBitstreamText_45f1d
Func_82a98: ; 82a98 (20:6a98)
	jp Func_82aad

Func_82a9b: ; 82a9b (20:6a9b)
	writetext TreeBitstreamText_45ee8
	ld a, [wc79c]
	or a
	jp nz, Func_82aad
	ld a, $1
	ld [wc79c], a
Func_82aad: ; 82aad (20:6aad)
	jp Func_82ab6

Func_82ab0: ; 82ab0 (20:6ab0)
	writetext TreeBitstreamText_45fd7
Func_82ab6: ; 82ab6 (20:6ab6)
	pop bc
	ret

