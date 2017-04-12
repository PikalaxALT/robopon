map_trigger_ptr: MACRO
\1_Pointer::
	dba \1
	ENDM

EnterMap:: ; daa72 (36:6a72)
	push af
	push de
	set_farcall_addrs_hli GetMapTriggerIndex
	pop de
	pop af
	call FarCall
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call FarCall
	ret

Func_daaac:
	ret

Pointers_daaad::
	map_trigger_ptr Func_81281
	map_trigger_ptr Func_81ac1
	map_trigger_ptr Func_81d6a
	map_trigger_ptr Func_8240c
	map_trigger_ptr Func_825cc
	map_trigger_ptr Func_827a9
	map_trigger_ptr Func_82b03
	map_trigger_ptr Func_82c44
	map_trigger_ptr Func_82d7f
	map_trigger_ptr Func_82e70
	map_trigger_ptr Func_82f08
	map_trigger_ptr Func_82fa8
	map_trigger_ptr Func_83169
	map_trigger_ptr Func_83213
	map_trigger_ptr Func_83340
	map_trigger_ptr Func_833ba
	map_trigger_ptr Func_83431
	map_trigger_ptr Func_834bd
	map_trigger_ptr Func_83537
	map_trigger_ptr Func_835ae
	map_trigger_ptr Func_83632
	map_trigger_ptr Func_836b1
	map_trigger_ptr Func_83730
	map_trigger_ptr Func_837aa
	map_trigger_ptr Func_83816
	map_trigger_ptr Func_838a2
	map_trigger_ptr Func_957b0
	map_trigger_ptr Func_95817
	map_trigger_ptr Func_958c2
	map_trigger_ptr Func_8d256
	map_trigger_ptr Func_85178
	map_trigger_ptr Func_85a1d
	map_trigger_ptr Func_85cde
	map_trigger_ptr Func_85f6c
	map_trigger_ptr Func_863fb
	map_trigger_ptr Func_8688a
	map_trigger_ptr Func_86ffa
	map_trigger_ptr Func_871fe
	map_trigger_ptr Func_8744d
	map_trigger_ptr Func_877cb
	map_trigger_ptr Func_87d88
	map_trigger_ptr Func_87ea2
	map_trigger_ptr Func_8b65a
	map_trigger_ptr Func_89161
	map_trigger_ptr Func_8966d
	map_trigger_ptr Func_89a75
	map_trigger_ptr Func_89c58
	map_trigger_ptr Func_89eaf
	map_trigger_ptr Func_8a1f3
	map_trigger_ptr Func_8a69b
	map_trigger_ptr Func_8aa33
	map_trigger_ptr Func_8af07
	map_trigger_ptr Func_8afc4
	map_trigger_ptr Func_8b49c
	map_trigger_ptr Func_8e5dc
	map_trigger_ptr Func_8deaa
	map_trigger_ptr Func_91189
	map_trigger_ptr Func_91856
	map_trigger_ptr Func_920c3
	map_trigger_ptr Func_92965
	map_trigger_ptr Func_92aab
	map_trigger_ptr Func_92c92
	map_trigger_ptr Func_92e02
	map_trigger_ptr Func_951a3
	map_trigger_ptr Func_96dbb
	map_trigger_ptr Func_96e97
	map_trigger_ptr Func_971d6
	map_trigger_ptr Func_97486
	map_trigger_ptr Func_9a168
	map_trigger_ptr Func_9a169
	map_trigger_ptr Func_9a16a
	map_trigger_ptr Func_9a16b
	map_trigger_ptr Func_9a16c
	map_trigger_ptr Func_9a16d
	map_trigger_ptr Func_9a16e
	map_trigger_ptr Func_9a16f
	map_trigger_ptr Func_9a170
	map_trigger_ptr Func_9a171
	map_trigger_ptr Func_9a172
	map_trigger_ptr Func_9a173
	map_trigger_ptr Func_9d1cb
	map_trigger_ptr Func_9dcf6
	map_trigger_ptr Func_9e052
	map_trigger_ptr Func_9e0f9
	map_trigger_ptr Func_9e194
	map_trigger_ptr Func_9e23a
	map_trigger_ptr Func_9e2cf
	map_trigger_ptr Func_9e4d8
	map_trigger_ptr Func_9e95e
	map_trigger_ptr Func_9ea24
	map_trigger_ptr Func_9eec4
	map_trigger_ptr Func_9ef0f
	map_trigger_ptr Func_9ef10
	map_trigger_ptr Func_9ef8d
	map_trigger_ptr Func_9f137
	map_trigger_ptr Func_9f1c9
	map_trigger_ptr Func_9f338
	map_trigger_ptr Func_9f43f
	map_trigger_ptr Func_9f5a0
	map_trigger_ptr Func_9f5e1
	map_trigger_ptr Func_a30cd
	map_trigger_ptr Func_a32cf
	map_trigger_ptr Func_a34d1
	map_trigger_ptr Func_a36ec
	map_trigger_ptr Func_a3788
	map_trigger_ptr Func_a3789
	map_trigger_ptr Func_a378a
	map_trigger_ptr Func_a388c
	map_trigger_ptr Func_a3b2f
	map_trigger_ptr Func_a3bc8
	map_trigger_ptr Func_a3dc4
	map_trigger_ptr Func_a11de
	map_trigger_ptr Func_a167b
	map_trigger_ptr Func_c916d
	map_trigger_ptr Func_c93a1
	map_trigger_ptr Func_c980d
	map_trigger_ptr Func_c9d95
	map_trigger_ptr Func_ca379
	map_trigger_ptr Func_ca8dd
	map_trigger_ptr Func_cb099
	map_trigger_ptr Func_cb2ef
	map_trigger_ptr Func_cb4c5
	map_trigger_ptr Func_cb6d3
	map_trigger_ptr Func_cb8d6
	map_trigger_ptr Func_cba6d
	map_trigger_ptr Func_a5126
	map_trigger_ptr Func_a544c
	map_trigger_ptr Func_a6882
	map_trigger_ptr Func_a922b
	map_trigger_ptr Func_a973e
	map_trigger_ptr Func_a97f3
	map_trigger_ptr Func_a98a2
	map_trigger_ptr Func_a9957
	map_trigger_ptr Func_a9a0c
	map_trigger_ptr Func_a9ac1
	map_trigger_ptr Func_a9b7b
	map_trigger_ptr Func_a9c3d
	map_trigger_ptr Func_a9cfa
	map_trigger_ptr Func_a9db4
	map_trigger_ptr Func_a9e71
	map_trigger_ptr Func_a9f2b
	map_trigger_ptr Func_aa083
	map_trigger_ptr Func_aa218
	map_trigger_ptr Func_aa5cb
	map_trigger_ptr Func_aac19
	map_trigger_ptr Func_aaed3
	map_trigger_ptr Func_ab199
	map_trigger_ptr Func_ab46b
	map_trigger_ptr Func_ab7cc
	map_trigger_ptr Func_abf90
	map_trigger_ptr Func_ad122
	map_trigger_ptr Func_ae48b
	map_trigger_ptr Func_ae6ea
	map_trigger_ptr Func_ae8e7
	map_trigger_ptr Func_ae97d
	map_trigger_ptr Func_aea1b
	map_trigger_ptr Func_aeae1
	map_trigger_ptr Func_aeb98
	map_trigger_ptr Func_aed4a
	map_trigger_ptr Func_aedf8
	map_trigger_ptr Func_af01b
	map_trigger_ptr Func_af29a
	map_trigger_ptr Func_af3e9
	map_trigger_ptr Func_b10ea
	map_trigger_ptr Func_b138f
	map_trigger_ptr Func_d11ef
	map_trigger_ptr Func_d153f
	map_trigger_ptr Func_d1aff
	map_trigger_ptr Func_d1ec5
	map_trigger_ptr Func_d21fc
	map_trigger_ptr Func_d259b
	map_trigger_ptr Func_d293a
	map_trigger_ptr Func_a1e57
	map_trigger_ptr Func_a2271
	map_trigger_ptr Func_a268b
	map_trigger_ptr Func_a2aa5
	map_trigger_ptr Func_a2ebf
	map_trigger_ptr Func_cd533
	map_trigger_ptr Func_cdabd
	map_trigger_ptr Func_cdfc4
	map_trigger_ptr Func_ceacc
	map_trigger_ptr Func_cf14d
	map_trigger_ptr Func_b5152
	map_trigger_ptr Func_b5215
	map_trigger_ptr Func_b52d3
	map_trigger_ptr Func_b5391
	map_trigger_ptr Func_b5452
	map_trigger_ptr Func_b568e
	map_trigger_ptr Func_b576c
	map_trigger_ptr Func_b584a
	map_trigger_ptr Func_b5939
	map_trigger_ptr Func_b5ae8
	map_trigger_ptr Func_b5bbb
	map_trigger_ptr Func_b5c99
	map_trigger_ptr Func_b5d6c
	map_trigger_ptr Func_b5e4a
	map_trigger_ptr Func_b5fbe
	map_trigger_ptr Func_b790a
	map_trigger_ptr Func_b79f8
	map_trigger_ptr Func_b7a64
	map_trigger_ptr Func_b93f1
	map_trigger_ptr Func_b9bbe
	map_trigger_ptr Func_ba46c
	map_trigger_ptr Func_ba7e9
	map_trigger_ptr Func_bb17a
	map_trigger_ptr Func_bb44e
	map_trigger_ptr Func_d2c2a
	map_trigger_ptr Func_d2e9d
	map_trigger_ptr Func_d3312
	map_trigger_ptr Func_d367a
	map_trigger_ptr Func_d392b
	map_trigger_ptr Func_d3ceb
