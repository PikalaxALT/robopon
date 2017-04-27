triggroup: MACRO
trigbase = trigcum
	ENDM

dmaptrigger: MACRO
	db (\1_Pointer - MapTriggerPointers) / 3 - trigbase
trigcum = trigcum + 1
	ENDM

trigcum = 0

MapGroup1ScriptHeaders: triggroup ; c79b1
	dmaptrigger Func_81281
	dmaptrigger Func_81ac1
	dmaptrigger Func_81d6a
	dmaptrigger Func_8240c
	dmaptrigger Func_825cc
	dmaptrigger Func_82f08
	dmaptrigger Func_82fa8
	dmaptrigger Func_83169
	dmaptrigger Func_83213
	dmaptrigger Func_83340
	dmaptrigger Func_833ba
	dmaptrigger Func_83431
	dmaptrigger Func_834bd
	dmaptrigger Func_83537
	dmaptrigger Func_835ae
	dmaptrigger Func_83632
	dmaptrigger Func_836b1
	dmaptrigger Func_83730
	dmaptrigger Func_837aa
	dmaptrigger Func_83816
	dmaptrigger Func_838a2
	dmaptrigger Func_957b0
	dmaptrigger Func_95817
	dmaptrigger Func_958c2
	dmaptrigger Func_8d256
	dmaptrigger Func_85178
	dmaptrigger Func_85a1d
	dmaptrigger Func_85cde
	dmaptrigger Func_85f6c
	db $ff

MapGroup2ScriptHeaders: triggroup ; c79cf
	dmaptrigger Func_8d256
	db $ff

MapGroup3ScriptHeaders: triggroup ; c79d1
	dmaptrigger Func_85178
	dmaptrigger Func_85a1d
	dmaptrigger Func_85cde
	dmaptrigger Func_85f6c
	dmaptrigger Func_863fb
	dmaptrigger Func_8744d
	db $ff

MapGroup4ScriptHeaders: triggroup ; c79d8
	dmaptrigger Func_86ffa
	dmaptrigger Func_89c58
	dmaptrigger Func_89eaf
	dmaptrigger Func_8a1f3
	dmaptrigger Func_8a69b
	dmaptrigger Func_8aa33
	dmaptrigger Func_8af07
	db $ff

MapGroup5ScriptHeaders: triggroup ; c79e0
	dmaptrigger Func_8966d
	db $ff

MapGroup6ScriptHeaders: triggroup ; c79e2
	dmaptrigger Func_8966d
	dmaptrigger Func_96dbb
	dmaptrigger Func_96e97
	dmaptrigger Func_9a16e
	dmaptrigger Func_9a16f
	dmaptrigger Func_9a170
	dmaptrigger Func_9a171
	dmaptrigger Func_9a172
	dmaptrigger Func_9a173
	dmaptrigger Func_9d1cb
	db $ff

MapGroup7ScriptHeaders: triggroup ; c79ed
	dmaptrigger Func_8e5dc
	db $ff

MapGroup8ScriptHeaders: triggroup ; c79ef
	dmaptrigger Func_8deaa
	db $ff

MapGroup9ScriptHeaders: triggroup ; c79f1
	dmaptrigger Func_91189
	dmaptrigger Func_91856
	db $ff

MapGroup10ScriptHeaders: triggroup ; c79f4
	dmaptrigger Func_920c3
	dmaptrigger Func_92965
	dmaptrigger Func_92aab
	dmaptrigger Func_92c92
	dmaptrigger Func_92e02
	db $ff

MapGroup11ScriptHeaders: triggroup ; c79fa
	db $ff

MapGroup12ScriptHeaders: triggroup ; c79fb
	dmaptrigger Func_951a3
	db $ff

MapGroup13ScriptHeaders: triggroup ; c79fd
	dmaptrigger Func_96dbb
	dmaptrigger Func_96e97
	dmaptrigger Func_971d6
	dmaptrigger Func_97486
	db $ff

MapGroup14ScriptHeaders: triggroup ; c7a02
	db $ff

MapGroup15ScriptHeaders: triggroup ; c7a03
	db $ff

MapGroup18ScriptHeaders: triggroup ; c7a04
	dmaptrigger Func_9a168
	dmaptrigger Func_9a169
	dmaptrigger Func_9a172
	dmaptrigger Func_9a173
	dmaptrigger Func_9d1cb
	dmaptrigger Func_9dcf6
	dmaptrigger Func_9e052
	dmaptrigger Func_9e0f9
	dmaptrigger Func_9e194
	dmaptrigger Func_9e23a
	dmaptrigger Func_9e2cf
	dmaptrigger Func_9e4d8
	db $ff

MapGroup19ScriptHeaders: triggroup ; c7a11
	dmaptrigger Func_9d1cb
	dmaptrigger Func_9dcf6
	dmaptrigger Func_9eec4
	dmaptrigger Func_9ef0f
	dmaptrigger Func_9ef10
	dmaptrigger Func_9ef8d
	dmaptrigger Func_9f137
	dmaptrigger Func_9f1c9
	dmaptrigger Func_9f338
	dmaptrigger Func_9f43f
	dmaptrigger Func_9f5a0
	db $ff

MapGroup20ScriptHeaders: triggroup ; c7a1d
	dmaptrigger Func_9ef0f
	dmaptrigger Func_9ef10
	dmaptrigger Func_9ef8d
	dmaptrigger Func_9f137
	dmaptrigger Func_a32cf
	dmaptrigger Func_a34d1
	dmaptrigger Func_a11de
	dmaptrigger Func_a167b
	dmaptrigger Func_c916d
	dmaptrigger Func_cb4c5
	dmaptrigger Func_cb6d3
	dmaptrigger Func_cb8d6
	dmaptrigger Func_cba6d
	dmaptrigger Func_a5126
	dmaptrigger Func_a544c
	dmaptrigger Func_a6882
	dmaptrigger Func_a922b
	dmaptrigger Func_a973e
	dmaptrigger Func_a97f3
	dmaptrigger Func_a98a2
	db $ff

MapGroup21ScriptHeaders: triggroup ; c7a32
	dmaptrigger Func_a11de
	dmaptrigger Func_a167b
	db $ff

MapGroup22ScriptHeaders: triggroup ; c7a35
	dmaptrigger Func_c916d
	dmaptrigger Func_cb8d6
	dmaptrigger Func_cba6d
	dmaptrigger Func_a5126
	dmaptrigger Func_a544c
	dmaptrigger Func_a6882
	dmaptrigger Func_a9a0c
	dmaptrigger Func_a9ac1
	dmaptrigger Func_a9b7b
	dmaptrigger Func_a9c3d
	dmaptrigger Func_a9cfa
	dmaptrigger Func_a9db4
	db $ff

MapGroup23ScriptHeaders: triggroup ; c7a42
	dmaptrigger Func_a5126
	dmaptrigger Func_a544c
	db $ff

MapGroup24ScriptHeaders: triggroup ; c7a45
	dmaptrigger Func_a6882
	db $ff

MapGroup25ScriptHeaders: triggroup ; c7a47
	dmaptrigger Func_a922b
	dmaptrigger Func_a9db4
	dmaptrigger Func_a9e71
	dmaptrigger Func_a9f2b
	dmaptrigger Func_aa083
	dmaptrigger Func_aa218
	dmaptrigger Func_aa5cb
	dmaptrigger Func_aac19
	dmaptrigger Func_aaed3
	dmaptrigger Func_ab199
	dmaptrigger Func_ab46b
	dmaptrigger Func_ab7cc
	dmaptrigger Func_abf90
	dmaptrigger Func_ad122
	db $ff

MapGroup26ScriptHeaders: triggroup ; c7a56
	dmaptrigger Func_aa218
	dmaptrigger Func_aa5cb
	dmaptrigger Func_aac19
	dmaptrigger Func_aaed3
	dmaptrigger Func_ab199
	dmaptrigger Func_ab46b
	dmaptrigger Func_ae6ea
	dmaptrigger Func_af3e9
	db $ff

MapGroup27ScriptHeaders: triggroup ; c7a5f
	dmaptrigger Func_ad122
	db $ff

MapGroup28ScriptHeaders: triggroup ; c7a61
	dmaptrigger Func_ae48b
	dmaptrigger Func_ae6ea
	dmaptrigger Func_ae8e7
	dmaptrigger Func_ae97d
	dmaptrigger Func_aea1b
	dmaptrigger Func_aeae1
	dmaptrigger Func_aeb98
	dmaptrigger Func_aed4a
	dmaptrigger Func_aedf8
	dmaptrigger Func_af01b
	dmaptrigger Func_af29a
	dmaptrigger Func_af3e9
	db $ff

MapGroup29ScriptHeaders: triggroup ; c7a6e
	dmaptrigger Func_b10ea
	dmaptrigger Func_b138f
	db $ff

MapGroup30ScriptHeaders: triggroup ; c7a71
	dmaptrigger Func_d11ef
	dmaptrigger Func_d153f
	dmaptrigger Func_a2aa5
	dmaptrigger Func_a2ebf
	dmaptrigger Func_cd533
	dmaptrigger Func_cdabd
	dmaptrigger Func_cdfc4
	dmaptrigger Func_b5391
	dmaptrigger Func_b5452
	dmaptrigger Func_b568e
	dmaptrigger Func_b576c
	dmaptrigger Func_b584a
	dmaptrigger Func_b5e4a
	dmaptrigger Func_b5fbe
	dmaptrigger Func_b790a
	dmaptrigger Func_b79f8
	dmaptrigger Func_b7a64
	db $ff

MapGroup31ScriptHeaders: triggroup ; c7a83
	dmaptrigger Func_b5152
	dmaptrigger Func_b5215
	dmaptrigger Func_b52d3
	dmaptrigger Func_b5391
	dmaptrigger Func_b5452
	dmaptrigger Func_b568e
	dmaptrigger Func_b576c
	dmaptrigger Func_b584a
	dmaptrigger Func_b5939
	dmaptrigger Func_b5ae8
	dmaptrigger Func_b5bbb
	dmaptrigger Func_b5c99
	dmaptrigger Func_b5d6c
	dmaptrigger Func_b5e4a
	dmaptrigger Func_b5fbe
	db $ff

MapGroup32ScriptHeaders: triggroup ; c7a93
	dmaptrigger Func_b790a
	dmaptrigger Func_b79f8
	dmaptrigger Func_b7a64
	db $ff

MapGroup33ScriptHeaders: triggroup ; c7a97
	dmaptrigger Func_b93f1
	dmaptrigger Func_b9bbe
	dmaptrigger Func_ba46c
	dmaptrigger Func_ba7e9
	dmaptrigger Func_bb17a
	dmaptrigger Func_bb44e
	dmaptrigger Func_d2c2a
	dmaptrigger Func_d2e9d
	dmaptrigger Func_d3312
	dmaptrigger Func_d367a
	dmaptrigger Func_d392b
	dmaptrigger Func_d3ceb
	db $ff

MapGroupPointers:
	dw MapGroup1ScriptHeaders
	dw MapGroup2ScriptHeaders
	dw MapGroup3ScriptHeaders
	dw MapGroup4ScriptHeaders
	dw MapGroup5ScriptHeaders
	dw MapGroup6ScriptHeaders
	dw MapGroup7ScriptHeaders
	dw MapGroup8ScriptHeaders
	dw MapGroup9ScriptHeaders
	dw MapGroup10ScriptHeaders
	dw MapGroup11ScriptHeaders
	dw MapGroup12ScriptHeaders
	dw MapGroup13ScriptHeaders
	dw MapGroup14ScriptHeaders
	dw MapGroup15ScriptHeaders
	dw $0
	dw $0
	dw MapGroup18ScriptHeaders
	dw MapGroup19ScriptHeaders
	dw MapGroup20ScriptHeaders
	dw MapGroup21ScriptHeaders
	dw MapGroup22ScriptHeaders
	dw MapGroup23ScriptHeaders
	dw MapGroup24ScriptHeaders
	dw MapGroup25ScriptHeaders
	dw MapGroup26ScriptHeaders
	dw MapGroup27ScriptHeaders
	dw MapGroup28ScriptHeaders
	dw MapGroup29ScriptHeaders
	dw MapGroup30ScriptHeaders
	dw MapGroup31ScriptHeaders
	dw MapGroup32ScriptHeaders
	dw MapGroup33ScriptHeaders

GroupAndNumberToLinearIndex:: ; c7ae6 (31:7ae6)
; args: a, e
; sum([len(xx) for xx in MapGroupPointers[:a]]) + MapGroupPointers[a].index(e) \
;     if e in MapGroupPointers[a] else 0xffff
	push af
	push de
	push bc
	push bc
	ld hl, $0
	call WriteHLToSPPlus3
	ld c, $0
.loop
	ld a, c
	ld hl, sp+$7 ; a
	cp [hl]
	jp nc, .okay
	ld l, c
	ld h, $0
	add hl, hl
	ld de, MapGroupPointers
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, .next
	ld hl, sp+$0
	ld [hl], $0
.loop2
	ld l, c
	ld h, $0
	add hl, hl
	ld de, MapGroupPointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, .next
	call GetHLAtSPPlus3
	inc hl
	call WriteHLToSPPlus3
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp .loop2

.next
	inc c
	jp .loop

.okay
	ld c, $0
.loop3
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, MapGroupPointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, .nope
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, MapGroupPointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp nz, .next2
	call GetHLAtSPPlus3
	ld e, c
	ld d, $0
	add hl, de
	call WriteHLToSPPlus3
	call GetHLAtSPPlus3
	jp .done

.next2
	inc c
	jp .loop3

.nope
	ld hl, -1
.done
	pop bc
	pop bc
	pop bc
	pop bc
	ret
