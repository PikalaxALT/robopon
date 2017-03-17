INCLUDE "includes.asm"

SECTION "Bank 3a", ROMX, BANK [$3a]
Data_e8000::
compressed_gfx_header: MACRO
	db BANK(\1)
	db (\2 - $40) >> 4
	dw \1
	ENDM

	compressed_gfx_header CompressedGFX_00, $280
	compressed_gfx_header CompressedGFX_01, $280
	compressed_gfx_header CompressedGFX_02, $350
	compressed_gfx_header CompressedGFX_03, $130
	compressed_gfx_header CompressedGFX_04, $310
	compressed_gfx_header CompressedGFX_05, $280
	compressed_gfx_header CompressedGFX_06, $220
	compressed_gfx_header CompressedGFX_07, $110
	compressed_gfx_header CompressedGFX_08, $130
	compressed_gfx_header CompressedGFX_09, $320
	compressed_gfx_header CompressedGFX_0a, $120
	compressed_gfx_header CompressedGFX_0b, $130
	compressed_gfx_header CompressedGFX_0c, $330
	compressed_gfx_header CompressedGFX_0d, $130
	compressed_gfx_header CompressedGFX_0e, $210
	compressed_gfx_header CompressedGFX_0f, $120
	compressed_gfx_header CompressedGFX_10, $250
	compressed_gfx_header CompressedGFX_11, $2a0
	compressed_gfx_header CompressedGFX_12, $290
	compressed_gfx_header CompressedGFX_13, $110
	compressed_gfx_header CompressedGFX_14, $2a0
	compressed_gfx_header CompressedGFX_15, $240
	compressed_gfx_header CompressedGFX_16, $260
	compressed_gfx_header CompressedGFX_17, $210
	compressed_gfx_header CompressedGFX_18, $1e0
	compressed_gfx_header CompressedGFX_19, $1a0
	compressed_gfx_header CompressedGFX_1a, $160
	compressed_gfx_header CompressedGFX_1b, $280
	compressed_gfx_header CompressedGFX_1c, $120
	compressed_gfx_header CompressedGFX_1d, $d0
	compressed_gfx_header CompressedGFX_1e, $290
	compressed_gfx_header CompressedGFX_1f, $2a0
	compressed_gfx_header CompressedGFX_20, $320
	compressed_gfx_header CompressedGFX_21, $120
	compressed_gfx_header CompressedGFX_22, $350
	compressed_gfx_header CompressedGFX_23, $140
	compressed_gfx_header CompressedGFX_24, $200
	compressed_gfx_header CompressedGFX_25, $290
	compressed_gfx_header CompressedGFX_26, $340
	compressed_gfx_header CompressedGFX_27, $2f0
	compressed_gfx_header CompressedGFX_28, $2c0
	compressed_gfx_header CompressedGFX_29, $130
	compressed_gfx_header CompressedGFX_2a, $230
	compressed_gfx_header CompressedGFX_2b, $350
	compressed_gfx_header CompressedGFX_2c, $290
	compressed_gfx_header CompressedGFX_2d, $270
	compressed_gfx_header CompressedGFX_2e, $2e0
	compressed_gfx_header CompressedGFX_2f, $120
	compressed_gfx_header CompressedGFX_30, $210
	compressed_gfx_header CompressedGFX_31, $350
	compressed_gfx_header CompressedGFX_32, $120
	compressed_gfx_header CompressedGFX_33, $140
	compressed_gfx_header CompressedGFX_34, $210
	compressed_gfx_header CompressedGFX_35, $300
	compressed_gfx_header CompressedGFX_36, $220
	compressed_gfx_header CompressedGFX_37, $1d0
	compressed_gfx_header CompressedGFX_38, $290
	compressed_gfx_header CompressedGFX_39, $1c0
	compressed_gfx_header CompressedGFX_3a, $350
	compressed_gfx_header CompressedGFX_3b, $280
	compressed_gfx_header CompressedGFX_3c, $260
	compressed_gfx_header CompressedGFX_3d, $220
	compressed_gfx_header CompressedGFX_3e, $110
	compressed_gfx_header CompressedGFX_3f, $290
	compressed_gfx_header CompressedGFX_40, $210
	compressed_gfx_header CompressedGFX_41, $c0
	compressed_gfx_header CompressedGFX_42, $e0
	compressed_gfx_header CompressedGFX_43, $250
	compressed_gfx_header CompressedGFX_44, $140
	compressed_gfx_header CompressedGFX_45, $270
	compressed_gfx_header CompressedGFX_46, $f0
	compressed_gfx_header CompressedGFX_47, $110
	compressed_gfx_header CompressedGFX_48, $200
	compressed_gfx_header CompressedGFX_49, $250
	compressed_gfx_header CompressedGFX_4a, $230
	compressed_gfx_header CompressedGFX_4b, $240
	compressed_gfx_header CompressedGFX_4c, $280
	compressed_gfx_header CompressedGFX_4d, $2c0
	compressed_gfx_header CompressedGFX_4e, $130
	compressed_gfx_header CompressedGFX_4f, $1e0
	compressed_gfx_header CompressedGFX_50, $100
	compressed_gfx_header CompressedGFX_51, $260
	compressed_gfx_header CompressedGFX_52, $1f0
	compressed_gfx_header CompressedGFX_53, $150
	compressed_gfx_header CompressedGFX_54, $200
	compressed_gfx_header CompressedGFX_55, $2e0
	compressed_gfx_header CompressedGFX_56, $130
	compressed_gfx_header CompressedGFX_57, $200
	compressed_gfx_header CompressedGFX_58, $310
	compressed_gfx_header CompressedGFX_59, $120
	compressed_gfx_header CompressedGFX_5a, $200
	compressed_gfx_header CompressedGFX_5b, $180
	compressed_gfx_header CompressedGFX_5c, $220
	compressed_gfx_header CompressedGFX_5d, $160
	compressed_gfx_header CompressedGFX_5e, $1d0
	compressed_gfx_header CompressedGFX_5f, $340
	compressed_gfx_header CompressedGFX_60, $160
	compressed_gfx_header CompressedGFX_61, $e0
	compressed_gfx_header CompressedGFX_62, $1c0
	compressed_gfx_header CompressedGFX_63, $250
	compressed_gfx_header CompressedGFX_64, $140
	compressed_gfx_header CompressedGFX_65, $240
	compressed_gfx_header CompressedGFX_66, $250
	compressed_gfx_header CompressedGFX_67, $120
	compressed_gfx_header CompressedGFX_68, $140
	compressed_gfx_header CompressedGFX_69, $260
	compressed_gfx_header CompressedGFX_6a, $140
	compressed_gfx_header CompressedGFX_6b, $160
	compressed_gfx_header CompressedGFX_6c, $1f0
	compressed_gfx_header CompressedGFX_6d, $320
	compressed_gfx_header CompressedGFX_6e, $290
	compressed_gfx_header CompressedGFX_6f, $1e0
	compressed_gfx_header CompressedGFX_70, $130
	compressed_gfx_header CompressedGFX_71, $280
	compressed_gfx_header CompressedGFX_72, $130
	compressed_gfx_header CompressedGFX_73, $110
	compressed_gfx_header CompressedGFX_74, $250
	compressed_gfx_header CompressedGFX_75, $130
	compressed_gfx_header CompressedGFX_76, $180
	compressed_gfx_header CompressedGFX_77, $130
	compressed_gfx_header CompressedGFX_78, $2b0
	compressed_gfx_header CompressedGFX_79, $130
	compressed_gfx_header CompressedGFX_7a, $240
	compressed_gfx_header CompressedGFX_7b, $210
	compressed_gfx_header CompressedGFX_7c, $270
	compressed_gfx_header CompressedGFX_7d, $200
	compressed_gfx_header CompressedGFX_7e, $1f0
	compressed_gfx_header CompressedGFX_7f, $100
	compressed_gfx_header CompressedGFX_80, $180
	compressed_gfx_header CompressedGFX_81, $2d0
	compressed_gfx_header CompressedGFX_82, $120
	compressed_gfx_header CompressedGFX_83, $140
	compressed_gfx_header CompressedGFX_84, $1f0
	compressed_gfx_header CompressedGFX_85, $300
	compressed_gfx_header CompressedGFX_86, $120
	compressed_gfx_header CompressedGFX_87, $250
	compressed_gfx_header CompressedGFX_88, $320
	compressed_gfx_header CompressedGFX_89, $140
	compressed_gfx_header CompressedGFX_8a, $1e0
	compressed_gfx_header CompressedGFX_8b, $220
	compressed_gfx_header CompressedGFX_8c, $210
	compressed_gfx_header CompressedGFX_8d, $1f0
	compressed_gfx_header CompressedGFX_8e, $1f0
	compressed_gfx_header CompressedGFX_8f, $170
	compressed_gfx_header CompressedGFX_90, $120
	compressed_gfx_header CompressedGFX_91, $130
	compressed_gfx_header CompressedGFX_92, $1e0
	compressed_gfx_header CompressedGFX_93, $1f0
	compressed_gfx_header CompressedGFX_94, $250
	compressed_gfx_header CompressedGFX_95, $200
	compressed_gfx_header CompressedGFX_96, $220
	compressed_gfx_header CompressedGFX_97, $1e0
	compressed_gfx_header CompressedGFX_98, $200
	compressed_gfx_header CompressedGFX_99, $310
	compressed_gfx_header CompressedGFX_9a, $2e0
	compressed_gfx_header CompressedGFX_9b, $270
	compressed_gfx_header CompressedGFX_9c, $190
	compressed_gfx_header CompressedGFX_9d, $300
	compressed_gfx_header CompressedGFX_9e, $180
	compressed_gfx_header CompressedGFX_9f, $330
	compressed_gfx_header CompressedGFX_a0, $1f0
	compressed_gfx_header CompressedGFX_a1, $210
	compressed_gfx_header CompressedGFX_a2, $210
	compressed_gfx_header CompressedGFX_a3, $240
	compressed_gfx_header CompressedGFX_a4, $1e0
	compressed_gfx_header CompressedGFX_a5, $280
	compressed_gfx_header CompressedGFX_a6, $270
	compressed_gfx_header CompressedGFX_a7, $220
	compressed_gfx_header CompressedGFX_a8, $280
	compressed_gfx_header CompressedGFX_a9, $310
	dbbw $00, $00, $0000
	dbbw $00, $00, $0000
	dbbw $00, $00, $0000
	dbbw $00, $00, $0000
	compressed_gfx_header CompressedGFX_ae, $230
	compressed_gfx_header CompressedGFX_af, $240
	compressed_gfx_header CompressedGFX_b0, $260
	compressed_gfx_header CompressedGFX_b1, $220
	compressed_gfx_header CompressedGFX_b2, $1f0
	compressed_gfx_header CompressedGFX_b3, $220
	compressed_gfx_header CompressedGFX_b4, $260
	compressed_gfx_header CompressedGFX_b5, $2a0
	compressed_gfx_header CompressedGFX_b6, $2b0
	compressed_gfx_header CompressedGFX_b7, $340
	compressed_gfx_header CompressedGFX_b8, $230
	compressed_gfx_header CompressedGFX_b9, $160
	compressed_gfx_header CompressedGFX_ba, $270
	compressed_gfx_header CompressedGFX_bb, $1d0
	compressed_gfx_header CompressedGFX_bc, $300
	compressed_gfx_header CompressedGFX_bd, $230
	compressed_gfx_header CompressedGFX_be, $260
	compressed_gfx_header CompressedGFX_bf, $2f0
	compressed_gfx_header CompressedGFX_c0, $1f0
	compressed_gfx_header CompressedGFX_c1, $280
	compressed_gfx_header CompressedGFX_c2, $1d0
	compressed_gfx_header CompressedGFX_c3, $2a0
	compressed_gfx_header CompressedGFX_c4, $230
	compressed_gfx_header CompressedGFX_c5, $230
	compressed_gfx_header CompressedGFX_c6, $200
	compressed_gfx_header CompressedGFX_c7, $200
	compressed_gfx_header CompressedGFX_c8, $280
	compressed_gfx_header CompressedGFX_c9, $220
	compressed_gfx_header CompressedGFX_ca, $270


SECTION "Compressed GFX 3a", ROMX [$432c], BANK [$3a]
CompressedGFX_00: ; e832c (3a:432c)
	dr $e832c, $e8513
CompressedGFX_00End

CompressedGFX_01: ; e8513 (3a:4513)
	dr $e8513, $e86e3
CompressedGFX_01End

CompressedGFX_02: ; e86e3 (3a:46e3)
	dr $e86e3, $e89bb
CompressedGFX_02End

CompressedGFX_03: ; e89bb (3a:49bb)
	dr $e89bb, $e8a98
CompressedGFX_03End

CompressedGFX_04: ; e8a98 (3a:4a98)
	dr $e8a98, $e8d1e
CompressedGFX_04End

CompressedGFX_05: ; e8d1e (3a:4d1e)
	dr $e8d1e, $e8f30
CompressedGFX_05End

CompressedGFX_06: ; e8f30 (3a:4f30)
	dr $e8f30, $e90dc
CompressedGFX_06End

CompressedGFX_07: ; e90dc (3a:50dc)
	dr $e90dc, $e918a
CompressedGFX_07End

CompressedGFX_08: ; e918a (3a:518a)
	dr $e918a, $e925c
CompressedGFX_08End

CompressedGFX_09: ; e925c (3a:525c)
	dr $e925c, $e94bf
CompressedGFX_09End

CompressedGFX_0a: ; e94bf (3a:54bf)
	dr $e94bf, $e9581
CompressedGFX_0aEnd

CompressedGFX_0b: ; e9581 (3a:5581)
	dr $e9581, $e964e
CompressedGFX_0bEnd

CompressedGFX_0c: ; e964e (3a:564e)
	dr $e964e, $e98cf
CompressedGFX_0cEnd

CompressedGFX_0d: ; e98cf (3a:58cf)
	dr $e98cf, $e99a6
CompressedGFX_0dEnd

CompressedGFX_0e: ; e99a6 (3a:59a6)
	dr $e99a6, $e9b28
CompressedGFX_0eEnd

CompressedGFX_0f: ; e9b28 (3a:5b28)
	dr $e9b28, $e9bf9
CompressedGFX_0fEnd

CompressedGFX_10: ; e9bf9 (3a:5bf9)
	dr $e9bf9, $e9d8d
CompressedGFX_10End

CompressedGFX_11: ; e9d8d (3a:5d8d)
	dr $e9d8d, $e9fbc
CompressedGFX_11End

CompressedGFX_12: ; e9fbc (3a:5fbc)
	dr $e9fbc, $ea18e
CompressedGFX_12End

CompressedGFX_13: ; ea18e (3a:618e)
	dr $ea18e, $ea244
CompressedGFX_13End

CompressedGFX_14: ; ea244 (3a:6244)
	dr $ea244, $ea451
CompressedGFX_14End

CompressedGFX_15: ; ea451 (3a:6451)
	dr $ea451, $ea5f5
CompressedGFX_15End

CompressedGFX_16: ; ea5f5 (3a:65f5)
	dr $ea5f5, $ea7d1
CompressedGFX_16End

CompressedGFX_17: ; ea7d1 (3a:67d1)
	dr $ea7d1, $ea937
CompressedGFX_17End

CompressedGFX_18: ; ea937 (3a:6937)
	dr $ea937, $eaaa3
CompressedGFX_18End

CompressedGFX_19: ; eaaa3 (3a:6aa3)
	dr $eaaa3, $eabdf
CompressedGFX_19End

CompressedGFX_1a: ; eabdf (3a:6bdf)
	dr $eabdf, $eacc6
CompressedGFX_1aEnd

CompressedGFX_1b: ; eacc6 (3a:6cc6)
	dr $eacc6, $eae74
CompressedGFX_1bEnd

CompressedGFX_1c: ; eae74 (3a:6e74)
	dr $eae74, $eaf3a
CompressedGFX_1cEnd

CompressedGFX_1d: ; eaf3a (3a:6f3a)
	dr $eaf3a, $eafd1
CompressedGFX_1dEnd

CompressedGFX_1e: ; eafd1 (3a:6fd1)
	dr $eafd1, $eb1b8
CompressedGFX_1eEnd

CompressedGFX_1f: ; eb1b8 (3a:71b8)
	dr $eb1b8, $eb3bf
CompressedGFX_1fEnd

CompressedGFX_20: ; eb3bf (3a:73bf)
	dr $eb3bf, $eb63d
CompressedGFX_20End

CompressedGFX_21: ; eb63d (3a:763d)
	dr $eb63d, $eb70d
CompressedGFX_21End

CompressedGFX_22: ; eb70d (3a:770d)
	dr $eb70d, $eb98b
CompressedGFX_22End

CompressedGFX_23: ; eb98b (3a:798b)
	dr $eb98b, $eba55
CompressedGFX_23End

CompressedGFX_24: ; eba55 (3a:7a55)
	dr $eba55, $ebb93
CompressedGFX_24End

CompressedGFX_25: ; ebb93 (3a:7b93)
	dr $ebb93, $ebd38
CompressedGFX_25End

CompressedGFX_26: ; ebd38 (3a:7d38)
	dr $ebd38, $ebfe4
CompressedGFX_26End

SECTION "Compressed GFX 3b", ROMX [$4000], BANK [$3b]
CompressedGFX_27: ; ec000 (3b:4000)
	dr $ec000, $ec24a
CompressedGFX_27End

CompressedGFX_28: ; ec24a (3b:424a)
	dr $ec24a, $ec44f
CompressedGFX_28End

CompressedGFX_29: ; ec44f (3b:444f)
	dr $ec44f, $ec511
CompressedGFX_29End

CompressedGFX_2a: ; ec511 (3b:4511)
	dr $ec511, $ec6a1
CompressedGFX_2aEnd

CompressedGFX_2b: ; ec6a1 (3b:46a1)
	dr $ec6a1, $ec93d
CompressedGFX_2bEnd

CompressedGFX_2c: ; ec93d (3b:493d)
	dr $ec93d, $ecb22
CompressedGFX_2cEnd

CompressedGFX_2d: ; ecb22 (3b:4b22)
	dr $ecb22, $ecd08
CompressedGFX_2dEnd

CompressedGFX_2e: ; ecd08 (3b:4d08)
	dr $ecd08, $ecf4a
CompressedGFX_2eEnd

CompressedGFX_2f: ; ecf4a (3b:4f4a)
	dr $ecf4a, $ecffe
CompressedGFX_2fEnd

CompressedGFX_30: ; ecffe (3b:4ffe)
	dr $ecffe, $ed183
CompressedGFX_30End

CompressedGFX_31: ; ed183 (3b:5183)
	dr $ed183, $ed44e
CompressedGFX_31End

CompressedGFX_32: ; ed44e (3b:544e)
	dr $ed44e, $ed504
CompressedGFX_32End

CompressedGFX_33: ; ed504 (3b:5504)
	dr $ed504, $ed5dd
CompressedGFX_33End

CompressedGFX_34: ; ed5dd (3b:55dd)
	dr $ed5dd, $ed769
CompressedGFX_34End

CompressedGFX_35: ; ed769 (3b:5769)
	dr $ed769, $ed9a5
CompressedGFX_35End

CompressedGFX_36: ; ed9a5 (3b:59a5)
	dr $ed9a5, $edb0c
CompressedGFX_36End

CompressedGFX_37: ; edb0c (3b:5b0c)
	dr $edb0c, $edc66
CompressedGFX_37End

CompressedGFX_38: ; edc66 (3b:5c66)
	dr $edc66, $ede61
CompressedGFX_38End

CompressedGFX_39: ; ede61 (3b:5e61)
	dr $ede61, $edf95
CompressedGFX_39End

CompressedGFX_3a: ; edf95 (3b:5f95)
	dr $edf95, $ee211
CompressedGFX_3aEnd

CompressedGFX_3b: ; ee211 (3b:6211)
	dr $ee211, $ee3fe
CompressedGFX_3bEnd

CompressedGFX_3c: ; ee3fe (3b:63fe)
	dr $ee3fe, $ee5e1
CompressedGFX_3cEnd

CompressedGFX_3d: ; ee5e1 (3b:65e1)
	dr $ee5e1, $ee764
CompressedGFX_3dEnd

CompressedGFX_3e: ; ee764 (3b:6764)
	dr $ee764, $ee821
CompressedGFX_3eEnd

CompressedGFX_3f: ; ee821 (3b:6821)
	dr $ee821, $ee9e2
CompressedGFX_3fEnd

CompressedGFX_40: ; ee9e2 (3b:69e2)
	dr $ee9e2, $eeb53
CompressedGFX_40End

CompressedGFX_41: ; eeb53 (3b:6b53)
	dr $eeb53, $eebd1
CompressedGFX_41End

CompressedGFX_42: ; eebd1 (3b:6bd1)
	dr $eebd1, $eec67
CompressedGFX_42End

CompressedGFX_43: ; eec67 (3b:6c67)
	dr $eec67, $eee02
CompressedGFX_43End

CompressedGFX_44: ; eee02 (3b:6e02)
	dr $eee02, $eeed9
CompressedGFX_44End

CompressedGFX_45: ; eeed9 (3b:6ed9)
	dr $eeed9, $ef072
CompressedGFX_45End

CompressedGFX_46: ; ef072 (3b:7072)
	dr $ef072, $ef113
CompressedGFX_46End

CompressedGFX_47: ; ef113 (3b:7113)
	dr $ef113, $ef1b4
CompressedGFX_47End

CompressedGFX_48: ; ef1b4 (3b:71b4)
	dr $ef1b4, $ef32b
CompressedGFX_48End

CompressedGFX_49: ; ef32b (3b:732b)
	dr $ef32b, $ef4dd
CompressedGFX_49End

CompressedGFX_4a: ; ef4dd (3b:74dd)
	dr $ef4dd, $ef69c
CompressedGFX_4aEnd

CompressedGFX_4b: ; ef69c (3b:769c)
	dr $ef69c, $ef863
CompressedGFX_4bEnd

CompressedGFX_4c: ; ef863 (3b:7863)
	dr $ef863, $ef9f3
CompressedGFX_4cEnd

CompressedGFX_4d: ; ef9f3 (3b:79f3)
	dr $ef9f3, $efbe2
CompressedGFX_4dEnd

CompressedGFX_4e: ; efbe2 (3b:7be2)
	dr $efbe2, $efca2
CompressedGFX_4eEnd

CompressedGFX_4f: ; efca2 (3b:7ca2)
	dr $efca2, $efe10
CompressedGFX_4fEnd

CompressedGFX_50: ; efe10 (3b:7e10)
	dr $efe10, $efec2
CompressedGFX_50End

SECTION "Compressed GFX 3c", ROMX [$4000], BANK [$3c]
CompressedGFX_51: ; f0000 (3c:4000)
	dr $f0000, $f01a5
CompressedGFX_51End

CompressedGFX_52: ; f01a5 (3c:41a5)
	dr $f01a5, $f032b
CompressedGFX_52End

CompressedGFX_53: ; f032b (3c:432b)
	dr $f032b, $f040c
CompressedGFX_53End

CompressedGFX_54: ; f040c (3c:440c)
	dr $f040c, $f0582
CompressedGFX_54End

CompressedGFX_55: ; f0582 (3c:4582)
	dr $f0582, $f07ba
CompressedGFX_55End

CompressedGFX_56: ; f07ba (3c:47ba)
	dr $f07ba, $f087b
CompressedGFX_56End

CompressedGFX_57: ; f087b (3c:487b)
	dr $f087b, $f0a0a
CompressedGFX_57End

CompressedGFX_58: ; f0a0a (3c:4a0a)
	dr $f0a0a, $f0c56
CompressedGFX_58End

CompressedGFX_59: ; f0c56 (3c:4c56)
	dr $f0c56, $f0d19
CompressedGFX_59End

CompressedGFX_5a: ; f0d19 (3c:4d19)
	dr $f0d19, $f0e91
CompressedGFX_5aEnd

CompressedGFX_5b: ; f0e91 (3c:4e91)
	dr $f0e91, $f0fa5
CompressedGFX_5bEnd

CompressedGFX_5c: ; f0fa5 (3c:4fa5)
	dr $f0fa5, $f1116
CompressedGFX_5cEnd

CompressedGFX_5d: ; f1116 (3c:5116)
	dr $f1116, $f11fa
CompressedGFX_5dEnd

CompressedGFX_5e: ; f11fa (3c:51fa)
	dr $f11fa, $f1359
CompressedGFX_5eEnd

CompressedGFX_5f: ; f1359 (3c:5359)
	dr $f1359, $f15b1
CompressedGFX_5fEnd

CompressedGFX_60: ; f15b1 (3c:55b1)
	dr $f15b1, $f1691
CompressedGFX_60End

CompressedGFX_61: ; f1691 (3c:5691)
	dr $f1691, $f172b
CompressedGFX_61End

CompressedGFX_62: ; f172b (3c:572b)
	dr $f172b, $f187e
CompressedGFX_62End

CompressedGFX_63: ; f187e (3c:587e)
	dr $f187e, $f1a4e
CompressedGFX_63End

CompressedGFX_64: ; f1a4e (3c:5a4e)
	dr $f1a4e, $f1b15
CompressedGFX_64End

CompressedGFX_65: ; f1b15 (3c:5b15)
	dr $f1b15, $f1cd8
CompressedGFX_65End

CompressedGFX_66: ; f1cd8 (3c:5cd8)
	dr $f1cd8, $f1eb5
CompressedGFX_66End

CompressedGFX_67: ; f1eb5 (3c:5eb5)
	dr $f1eb5, $f1f48
CompressedGFX_67End

CompressedGFX_68: ; f1f48 (3c:5f48)
	dr $f1f48, $f2029
CompressedGFX_68End

CompressedGFX_69: ; f2029 (3c:6029)
	dr $f2029, $f21ed
CompressedGFX_69End

CompressedGFX_6a: ; f21ed (3c:61ed)
	dr $f21ed, $f22c0
CompressedGFX_6aEnd

CompressedGFX_6b: ; f22c0 (3c:62c0)
	dr $f22c0, $f23a9
CompressedGFX_6bEnd

CompressedGFX_6c: ; f23a9 (3c:63a9)
	dr $f23a9, $f251a
CompressedGFX_6cEnd

CompressedGFX_6d: ; f251a (3c:651a)
	dr $f251a, $f273e
CompressedGFX_6dEnd

CompressedGFX_6e: ; f273e (3c:673e)
	dr $f273e, $f293e
CompressedGFX_6eEnd

CompressedGFX_6f: ; f293e (3c:693e)
	dr $f293e, $f2aa5
CompressedGFX_6fEnd

CompressedGFX_70: ; f2aa5 (3c:6aa5)
	dr $f2aa5, $f2b6a
CompressedGFX_70End

CompressedGFX_71: ; f2b6a (3c:6b6a)
	dr $f2b6a, $f2d49
CompressedGFX_71End

CompressedGFX_72: ; f2d49 (3c:6d49)
	dr $f2d49, $f2e1b
CompressedGFX_72End

CompressedGFX_73: ; f2e1b (3c:6e1b)
	dr $f2e1b, $f2ec7
CompressedGFX_73End

CompressedGFX_74: ; f2ec7 (3c:6ec7)
	dr $f2ec7, $f3090
CompressedGFX_74End

CompressedGFX_75: ; f3090 (3c:7090)
	dr $f3090, $f3175
CompressedGFX_75End

CompressedGFX_76: ; f3175 (3c:7175)
	dr $f3175, $f324b
CompressedGFX_76End

CompressedGFX_77: ; f324b (3c:724b)
	dr $f324b, $f332a
CompressedGFX_77End

CompressedGFX_78: ; f332a (3c:732a)
	dr $f332a, $f3508
CompressedGFX_78End

CompressedGFX_79: ; f3508 (3c:7508)
	dr $f3508, $f35dc
CompressedGFX_79End

CompressedGFX_7a: ; f35dc (3c:75dc)
	dr $f35dc, $f376e
CompressedGFX_7aEnd

CompressedGFX_7b: ; f376e (3c:776e)
	dr $f376e, $f38e1
CompressedGFX_7bEnd

CompressedGFX_7c: ; f38e1 (3c:78e1)
	dr $f38e1, $f3aa3
CompressedGFX_7cEnd

CompressedGFX_7d: ; f3aa3 (3c:7aa3)
	dr $f3aa3, $f3c41
CompressedGFX_7dEnd

CompressedGFX_7e: ; f3c41 (3c:7c41)
	dr $f3c41, $f3d90
CompressedGFX_7eEnd

CompressedGFX_7f: ; f3d90 (3c:7d90)
	dr $f3d90, $f3e32
CompressedGFX_7fEnd

CompressedGFX_80: ; f3e32 (3c:7e32)
	dr $f3e32, $f3f54
CompressedGFX_80End

SECTION "Compressed GFX 3d", ROMX [$4000], BANK [$3d]
CompressedGFX_81: ; f4000 (3d:4000)
	dr $f4000, $f4239
CompressedGFX_81End

CompressedGFX_82: ; f4239 (3d:4239)
	dr $f4239, $f4306
CompressedGFX_82End

CompressedGFX_83: ; f4306 (3d:4306)
	dr $f4306, $f43e1
CompressedGFX_83End

CompressedGFX_84: ; f43e1 (3d:43e1)
	dr $f43e1, $f456d
CompressedGFX_84End

CompressedGFX_85: ; f456d (3d:456d)
	dr $f456d, $f47b6
CompressedGFX_85End

CompressedGFX_86: ; f47b6 (3d:47b6)
	dr $f47b6, $f4883
CompressedGFX_86End

CompressedGFX_87: ; f4883 (3d:4883)
	dr $f4883, $f4a3a
CompressedGFX_87End

CompressedGFX_88: ; f4a3a (3d:4a3a)
	dr $f4a3a, $f4cb4
CompressedGFX_88End

CompressedGFX_89: ; f4cb4 (3d:4cb4)
	dr $f4cb4, $f4d78
CompressedGFX_89End

CompressedGFX_8a: ; f4d78 (3d:4d78)
	dr $f4d78, $f4ed5
CompressedGFX_8aEnd

CompressedGFX_8b: ; f4ed5 (3d:4ed5)
	dr $f4ed5, $f5037
CompressedGFX_8bEnd

CompressedGFX_8c: ; f5037 (3d:5037)
	dr $f5037, $f51bf
CompressedGFX_8cEnd

CompressedGFX_8d: ; f51bf (3d:51bf)
	dr $f51bf, $f5304
CompressedGFX_8dEnd

CompressedGFX_8e: ; f5304 (3d:5304)
	dr $f5304, $f5466
CompressedGFX_8eEnd

CompressedGFX_8f: ; f5466 (3d:5466)
	dr $f5466, $f5557
CompressedGFX_8fEnd

CompressedGFX_90: ; f5557 (3d:5557)
	dr $f5557, $f561b
CompressedGFX_90End

CompressedGFX_91: ; f561b (3d:561b)
	dr $f561b, $f56f7
CompressedGFX_91End

CompressedGFX_92: ; f56f7 (3d:56f7)
	dr $f56f7, $f5852
CompressedGFX_92End

CompressedGFX_93: ; f5852 (3d:5852)
	dr $f5852, $f59c1
CompressedGFX_93End

CompressedGFX_94: ; f59c1 (3d:59c1)
	dr $f59c1, $f5b7c
CompressedGFX_94End

CompressedGFX_95: ; f5b7c (3d:5b7c)
	dr $f5b7c, $f5cfe
CompressedGFX_95End

CompressedGFX_96: ; f5cfe (3d:5cfe)
	dr $f5cfe, $f5e82
CompressedGFX_96End

CompressedGFX_97: ; f5e82 (3d:5e82)
	dr $f5e82, $f5fed
CompressedGFX_97End

CompressedGFX_98: ; f5fed (3d:5fed)
	dr $f5fed, $f615d
CompressedGFX_98End

CompressedGFX_99: ; f615d (3d:615d)
	dr $f615d, $f63a8
CompressedGFX_99End

CompressedGFX_9a: ; f63a8 (3d:63a8)
	dr $f63a8, $f65e7
CompressedGFX_9aEnd

CompressedGFX_9b: ; f65e7 (3d:65e7)
	dr $f65e7, $f679c
CompressedGFX_9bEnd

CompressedGFX_9c: ; f679c (3d:679c)
	dr $f679c, $f68b6
CompressedGFX_9cEnd

CompressedGFX_9d: ; f68b6 (3d:68b6)
	dr $f68b6, $f6b0e
CompressedGFX_9dEnd

CompressedGFX_9e: ; f6b0e (3d:6b0e)
	dr $f6b0e, $f6c26
CompressedGFX_9eEnd

CompressedGFX_9f: ; f6c26 (3d:6c26)
	dr $f6c26, $f6ec1
CompressedGFX_9fEnd

CompressedGFX_a0: ; f6ec1 (3d:6ec1)
	dr $f6ec1, $f7040
CompressedGFX_a0End

CompressedGFX_a1: ; f7040 (3d:7040)
	dr $f7040, $f71d5
CompressedGFX_a1End

CompressedGFX_a2: ; f71d5 (3d:71d5)
	dr $f71d5, $f7353
CompressedGFX_a2End

CompressedGFX_a3: ; f7353 (3d:7353)
	dr $f7353, $f7529
CompressedGFX_a3End

CompressedGFX_a4: ; f7529 (3d:7529)
	dr $f7529, $f7668
CompressedGFX_a4End

CompressedGFX_a5: ; f7668 (3d:7668)
	dr $f7668, $f7829
CompressedGFX_a5End

CompressedGFX_a6: ; f7829 (3d:7829)
	dr $f7829, $f79de
CompressedGFX_a6End

CompressedGFX_a7: ; f79de (3d:79de)
	dr $f79de, $f7b50
CompressedGFX_a7End

CompressedGFX_a8: ; f7b50 (3d:7b50)
	dr $f7b50, $f7d20
CompressedGFX_a8End

CompressedGFX_a9: ; f7d20 (3d:7d20)
	dr $f7d20, $f7f6c
CompressedGFX_a9End

SECTION "Compressed GFX 3e", ROMX [$4000], BANK [$3e]
CompressedGFX_ae: ; f8000 (3e:4000)
	dr $f8000, $f81c4
CompressedGFX_aeEnd

CompressedGFX_af: ; f81c4 (3e:41c4)
	dr $f81c4, $f8332
CompressedGFX_afEnd

CompressedGFX_b0: ; f8332 (3e:4332)
	dr $f8332, $f84f3
CompressedGFX_b0End

CompressedGFX_b1: ; f84f3 (3e:44f3)
	dr $f84f3, $f8685
CompressedGFX_b1End

CompressedGFX_b2: ; f8685 (3e:4685)
	dr $f8685, $f87e1
CompressedGFX_b2End

CompressedGFX_b3: ; f87e1 (3e:47e1)
	dr $f87e1, $f8956
CompressedGFX_b3End

CompressedGFX_b4: ; f8956 (3e:4956)
	dr $f8956, $f8afd
CompressedGFX_b4End

CompressedGFX_b5: ; f8afd (3e:4afd)
	dr $f8afd, $f8ceb
CompressedGFX_b5End

CompressedGFX_b6: ; f8ceb (3e:4ceb)
	dr $f8ceb, $f8ec5
CompressedGFX_b6End

CompressedGFX_b7: ; f8ec5 (3e:4ec5)
	dr $f8ec5, $f90f4
CompressedGFX_b7End

CompressedGFX_b8: ; f90f4 (3e:50f4)
	dr $f90f4, $f9259
CompressedGFX_b8End

CompressedGFX_b9: ; f9259 (3e:5259)
	dr $f9259, $f9327
CompressedGFX_b9End

CompressedGFX_ba: ; f9327 (3e:5327)
	dr $f9327, $f94de
CompressedGFX_baEnd

CompressedGFX_bb: ; f94de (3e:54de)
	dr $f94de, $f9614
CompressedGFX_bbEnd

CompressedGFX_bc: ; f9614 (3e:5614)
	dr $f9614, $f986a
CompressedGFX_bcEnd

CompressedGFX_bd: ; f986a (3e:586a)
	dr $f986a, $f9a3b
CompressedGFX_bdEnd

CompressedGFX_be: ; f9a3b (3e:5a3b)
	dr $f9a3b, $f9c0c
CompressedGFX_beEnd

CompressedGFX_bf: ; f9c0c (3e:5c0c)
	dr $f9c0c, $f9e3f
CompressedGFX_bfEnd

CompressedGFX_c0: ; f9e3f (3e:5e3f)
	dr $f9e3f, $f9f9b
CompressedGFX_c0End

CompressedGFX_c1: ; f9f9b (3e:5f9b)
	dr $f9f9b, $fa182
CompressedGFX_c1End

CompressedGFX_c2: ; fa182 (3e:6182)
	dr $fa182, $fa2ae
CompressedGFX_c2End

CompressedGFX_c3: ; fa2ae (3e:62ae)
	dr $fa2ae, $fa4a6
CompressedGFX_c3End

CompressedGFX_c4: ; fa4a6 (3e:64a6)
	dr $fa4a6, $fa64d
CompressedGFX_c4End

CompressedGFX_c5: ; fa64d (3e:664d)
	dr $fa64d, $fa7f4
CompressedGFX_c5End

CompressedGFX_c6: ; fa7f4 (3e:67f4)
	dr $fa7f4, $fa953
CompressedGFX_c6End

CompressedGFX_c7: ; fa953 (3e:6953)
	dr $fa953, $faaaa
CompressedGFX_c7End

CompressedGFX_c8: ; faaaa (3e:6aaa)
	dr $faaaa, $fac61
CompressedGFX_c8End

CompressedGFX_c9: ; fac61 (3e:6c61)
	dr $fac61, $fadef
CompressedGFX_c9End

CompressedGFX_ca: ; fadef (3e:6def)
	dr $fadef, $fafb2
CompressedGFX_caEnd
