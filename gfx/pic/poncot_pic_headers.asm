MACRO pic_header
	db BANK(\1)
	db (\2 - $40) >> 4
	dw \1
	ENDM

SECTION "Poncot Pic Headers", ROMX
PoncotPicHeaders::
	pic_header PoncotPic_00, $280
	pic_header PoncotPic_01, $280
	pic_header PoncotPic_02, $350
	pic_header PoncotPic_03, $130
	pic_header PoncotPic_04, $310
	pic_header PoncotPic_05, $280
	pic_header PoncotPic_06, $220
	pic_header PoncotPic_07, $110
	pic_header PoncotPic_08, $130
	pic_header PoncotPic_09, $320
	pic_header PoncotPic_0a, $120
	pic_header PoncotPic_0b, $130
	pic_header PoncotPic_0c, $330
	pic_header PoncotPic_0d, $130
	pic_header PoncotPic_0e, $210
	pic_header PoncotPic_0f, $120
	pic_header PoncotPic_10, $250
	pic_header PoncotPic_11, $2a0
	pic_header PoncotPic_12, $290
	pic_header PoncotPic_13, $110
	pic_header PoncotPic_14, $2a0
	pic_header PoncotPic_15, $240
	pic_header PoncotPic_16, $260
	pic_header PoncotPic_17, $210
	pic_header PoncotPic_18, $1e0
	pic_header PoncotPic_19, $1a0
	pic_header PoncotPic_1a, $160
	pic_header PoncotPic_1b, $280
	pic_header PoncotPic_1c, $120
	pic_header PoncotPic_1d, $d0
	pic_header PoncotPic_1e, $290
	pic_header PoncotPic_1f, $2a0
	pic_header PoncotPic_20, $320
	pic_header PoncotPic_21, $120
	pic_header PoncotPic_22, $350
	pic_header PoncotPic_23, $140
	pic_header PoncotPic_24, $200
	pic_header PoncotPic_25, $290
	pic_header PoncotPic_26, $340
	pic_header PoncotPic_27, $2f0
	pic_header PoncotPic_28, $2c0
	pic_header PoncotPic_29, $130
	pic_header PoncotPic_2a, $230
	pic_header PoncotPic_2b, $350
	pic_header PoncotPic_2c, $290
	pic_header PoncotPic_2d, $270
	pic_header PoncotPic_2e, $2e0
	pic_header PoncotPic_2f, $120
	pic_header PoncotPic_30, $210
	pic_header PoncotPic_31, $350
	pic_header PoncotPic_32, $120
	pic_header PoncotPic_33, $140
	pic_header PoncotPic_34, $210
	pic_header PoncotPic_35, $300
	pic_header PoncotPic_36, $220
	pic_header PoncotPic_37, $1d0
	pic_header PoncotPic_38, $290
	pic_header PoncotPic_39, $1c0
	pic_header PoncotPic_3a, $350
	pic_header PoncotPic_3b, $280
	pic_header PoncotPic_3c, $260
	pic_header PoncotPic_3d, $220
	pic_header PoncotPic_3e, $110
	pic_header PoncotPic_3f, $290
	pic_header PoncotPic_40, $210
	pic_header PoncotPic_41, $c0
	pic_header PoncotPic_42, $e0
	pic_header PoncotPic_43, $250
	pic_header PoncotPic_44, $140
	pic_header PoncotPic_45, $270
	pic_header PoncotPic_46, $f0
	pic_header PoncotPic_47, $110
	pic_header PoncotPic_48, $200
	pic_header PoncotPic_49, $250
	pic_header PoncotPic_4a, $230
	pic_header PoncotPic_4b, $240
	pic_header PoncotPic_4c, $280
	pic_header PoncotPic_4d, $2c0
	pic_header PoncotPic_4e, $130
	pic_header PoncotPic_4f, $1e0
	pic_header PoncotPic_50, $100
	pic_header PoncotPic_51, $260
	pic_header PoncotPic_52, $1f0
	pic_header PoncotPic_53, $150
	pic_header PoncotPic_54, $200
	pic_header PoncotPic_55, $2e0
	pic_header PoncotPic_56, $130
	pic_header PoncotPic_57, $200
	pic_header PoncotPic_58, $310
	pic_header PoncotPic_59, $120
	pic_header PoncotPic_5a, $200
	pic_header PoncotPic_5b, $180
	pic_header PoncotPic_5c, $220
	pic_header PoncotPic_5d, $160
	pic_header PoncotPic_5e, $1d0
	pic_header PoncotPic_5f, $340
	pic_header PoncotPic_60, $160
	pic_header PoncotPic_61, $e0
	pic_header PoncotPic_62, $1c0
	pic_header PoncotPic_63, $250
	pic_header PoncotPic_64, $140
	pic_header PoncotPic_65, $240
	pic_header PoncotPic_66, $250
	pic_header PoncotPic_67, $120
	pic_header PoncotPic_68, $140
	pic_header PoncotPic_69, $260
	pic_header PoncotPic_6a, $140
	pic_header PoncotPic_6b, $160
	pic_header PoncotPic_6c, $1f0
	pic_header PoncotPic_6d, $320
	pic_header PoncotPic_6e, $290
	pic_header PoncotPic_6f, $1e0
	pic_header PoncotPic_70, $130
	pic_header PoncotPic_71, $280
	pic_header PoncotPic_72, $130
	pic_header PoncotPic_73, $110
	pic_header PoncotPic_74, $250
	pic_header PoncotPic_75, $130
	pic_header PoncotPic_76, $180
	pic_header PoncotPic_77, $130
	pic_header PoncotPic_78, $2b0
	pic_header PoncotPic_79, $130
	pic_header PoncotPic_7a, $240
	pic_header PoncotPic_7b, $210
	pic_header PoncotPic_7c, $270
	pic_header PoncotPic_7d, $200
	pic_header PoncotPic_7e, $1f0
	pic_header PoncotPic_7f, $100
	pic_header PoncotPic_80, $180
	pic_header PoncotPic_81, $2d0
	pic_header PoncotPic_82, $120
	pic_header PoncotPic_83, $140
	pic_header PoncotPic_84, $1f0
	pic_header PoncotPic_85, $300
	pic_header PoncotPic_86, $120
	pic_header PoncotPic_87, $250
	pic_header PoncotPic_88, $320
	pic_header PoncotPic_89, $140
	pic_header PoncotPic_8a, $1e0
	pic_header PoncotPic_8b, $220
	pic_header PoncotPic_8c, $210
	pic_header PoncotPic_8d, $1f0
	pic_header PoncotPic_8e, $1f0
	pic_header PoncotPic_8f, $170
	pic_header PoncotPic_90, $120
	pic_header PoncotPic_91, $130
	pic_header PoncotPic_92, $1e0
	pic_header PoncotPic_93, $1f0
	pic_header PoncotPic_94, $250
	pic_header PoncotPic_95, $200
	pic_header PoncotPic_96, $220
	pic_header PoncotPic_97, $1e0
	pic_header PoncotPic_98, $200
	pic_header PoncotPic_99, $310
	pic_header PoncotPic_9a, $2e0
	pic_header PoncotPic_9b, $270
	pic_header PoncotPic_9c, $190
	pic_header PoncotPic_9d, $300
	pic_header PoncotPic_9e, $180
	pic_header PoncotPic_9f, $330
	pic_header PoncotPic_a0, $1f0
	pic_header PoncotPic_a1, $210
	pic_header PoncotPic_a2, $210
	pic_header PoncotPic_a3, $240
	pic_header PoncotPic_a4, $1e0
	pic_header PoncotPic_a5, $280
	pic_header PoncotPic_a6, $270
	pic_header PoncotPic_a7, $220
	pic_header PoncotPic_a8, $280
	pic_header PoncotPic_a9, $310

SECTION "Trainer Pic Headers", ROMX
	pic_header TrainerPic_ae, $230
	pic_header TrainerPic_af, $240
	pic_header TrainerPic_b0, $260
	pic_header TrainerPic_b1, $220
	pic_header TrainerPic_b2, $1f0
	pic_header TrainerPic_b3, $220
	pic_header TrainerPic_b4, $260
	pic_header TrainerPic_b5, $2a0
	pic_header TrainerPic_b6, $2b0
	pic_header TrainerPic_b7, $340
	pic_header TrainerPic_b8, $230
	pic_header TrainerPic_b9, $160
	pic_header TrainerPic_ba, $270
	pic_header TrainerPic_bb, $1d0
	pic_header TrainerPic_bc, $300
	pic_header TrainerPic_bd, $230
	pic_header TrainerPic_be, $260
	pic_header TrainerPic_bf, $2f0
	pic_header TrainerPic_c0, $1f0
	pic_header TrainerPic_c1, $280
	pic_header TrainerPic_c2, $1d0
	pic_header TrainerPic_c3, $2a0
	pic_header TrainerPic_c4, $230
	pic_header TrainerPic_c5, $230
	pic_header TrainerPic_c6, $200
	pic_header TrainerPic_c7, $200
	pic_header TrainerPic_c8, $280
	pic_header TrainerPic_c9, $220
	pic_header TrainerPic_ca, $270

SECTION "Poncot Pics 1", ROMX
PoncotPic_00: ; e832c (3a:432c)
INCBIN "gfx/pic/poncot/poncot_00.tm2bpp.rz"

PoncotPic_01: ; e8513 (3a:4513)
INCBIN "gfx/pic/poncot/poncot_01.tm2bpp.rz"

PoncotPic_02: ; e86e3 (3a:46e3)
INCBIN "gfx/pic/poncot/poncot_02.tm2bpp.rz"

PoncotPic_03: ; e89bb (3a:49bb)
INCBIN "gfx/pic/poncot/poncot_03.tm2bpp.rz"

PoncotPic_04: ; e8a98 (3a:4a98)
INCBIN "gfx/pic/poncot/poncot_04.tm2bpp.rz"

PoncotPic_05: ; e8d1e (3a:4d1e)
INCBIN "gfx/pic/poncot/poncot_05.tm2bpp.rz"

PoncotPic_06: ; e8f30 (3a:4f30)
INCBIN "gfx/pic/poncot/poncot_06.tm2bpp.rz"

PoncotPic_07: ; e90dc (3a:50dc)
INCBIN "gfx/pic/poncot/poncot_07.tm2bpp.rz"

PoncotPic_08: ; e918a (3a:518a)
INCBIN "gfx/pic/poncot/poncot_08.tm2bpp.rz"

PoncotPic_09: ; e925c (3a:525c)
INCBIN "gfx/pic/poncot/poncot_09.tm2bpp.rz"

PoncotPic_0a: ; e94bf (3a:54bf)
INCBIN "gfx/pic/poncot/poncot_0a.tm2bpp.rz"

PoncotPic_0b: ; e9581 (3a:5581)
INCBIN "gfx/pic/poncot/poncot_0b.tm2bpp.rz"

PoncotPic_0c: ; e964e (3a:564e)
INCBIN "gfx/pic/poncot/poncot_0c.tm2bpp.rz"

PoncotPic_0d: ; e98cf (3a:58cf)
INCBIN "gfx/pic/poncot/poncot_0d.tm2bpp.rz"

PoncotPic_0e: ; e99a6 (3a:59a6)
INCBIN "gfx/pic/poncot/poncot_0e.tm2bpp.rz"

PoncotPic_0f: ; e9b28 (3a:5b28)
INCBIN "gfx/pic/poncot/poncot_0f.tm2bpp.rz"

PoncotPic_10: ; e9bf9 (3a:5bf9)
INCBIN "gfx/pic/poncot/poncot_10.tm2bpp.rz"

PoncotPic_11: ; e9d8d (3a:5d8d)
INCBIN "gfx/pic/poncot/poncot_11.tm2bpp.rz"

PoncotPic_12: ; e9fbc (3a:5fbc)
INCBIN "gfx/pic/poncot/poncot_12.tm2bpp.rz"

PoncotPic_13: ; ea18e (3a:618e)
INCBIN "gfx/pic/poncot/poncot_13.tm2bpp.rz"

PoncotPic_14: ; ea244 (3a:6244)
INCBIN "gfx/pic/poncot/poncot_14.tm2bpp.rz"

PoncotPic_15: ; ea451 (3a:6451)
INCBIN "gfx/pic/poncot/poncot_15.tm2bpp.rz"

PoncotPic_16: ; ea5f5 (3a:65f5)
INCBIN "gfx/pic/poncot/poncot_16.tm2bpp.rz"

PoncotPic_17: ; ea7d1 (3a:67d1)
INCBIN "gfx/pic/poncot/poncot_17.tm2bpp.rz"

PoncotPic_18: ; ea937 (3a:6937)
INCBIN "gfx/pic/poncot/poncot_18.tm2bpp.rz"

PoncotPic_19: ; eaaa3 (3a:6aa3)
INCBIN "gfx/pic/poncot/poncot_19.tm2bpp.rz"

PoncotPic_1a: ; eabdf (3a:6bdf)
INCBIN "gfx/pic/poncot/poncot_1a.tm2bpp.rz"

PoncotPic_1b: ; eacc6 (3a:6cc6)
INCBIN "gfx/pic/poncot/poncot_1b.tm2bpp.rz"

PoncotPic_1c: ; eae74 (3a:6e74)
INCBIN "gfx/pic/poncot/poncot_1c.tm2bpp.rz"

PoncotPic_1d: ; eaf3a (3a:6f3a)
INCBIN "gfx/pic/poncot/poncot_1d.tm2bpp.rz"

PoncotPic_1e: ; eafd1 (3a:6fd1)
INCBIN "gfx/pic/poncot/poncot_1e.tm2bpp.rz"

PoncotPic_1f: ; eb1b8 (3a:71b8)
INCBIN "gfx/pic/poncot/poncot_1f.tm2bpp.rz"

PoncotPic_20: ; eb3bf (3a:73bf)
INCBIN "gfx/pic/poncot/poncot_20.tm2bpp.rz"

PoncotPic_21: ; eb63d (3a:763d)
INCBIN "gfx/pic/poncot/poncot_21.tm2bpp.rz"

PoncotPic_22: ; eb70d (3a:770d)
INCBIN "gfx/pic/poncot/poncot_22.tm2bpp.rz"

PoncotPic_23: ; eb98b (3a:798b)
INCBIN "gfx/pic/poncot/poncot_23.tm2bpp.rz"

PoncotPic_24: ; eba55 (3a:7a55)
INCBIN "gfx/pic/poncot/poncot_24.tm2bpp.rz"

PoncotPic_25: ; ebb93 (3a:7b93)
INCBIN "gfx/pic/poncot/poncot_25.tm2bpp.rz"

PoncotPic_26: ; ebd38 (3a:7d38)
INCBIN "gfx/pic/poncot/poncot_26.tm2bpp.rz"

SECTION "Poncot Pics 2", ROMX
PoncotPic_27: ; ec000 (3b:4000)
INCBIN "gfx/pic/poncot/poncot_27.tm2bpp.rz"

PoncotPic_28: ; ec24a (3b:424a)
INCBIN "gfx/pic/poncot/poncot_28.tm2bpp.rz"

PoncotPic_29: ; ec44f (3b:444f)
INCBIN "gfx/pic/poncot/poncot_29.tm2bpp.rz"

PoncotPic_2a: ; ec511 (3b:4511)
INCBIN "gfx/pic/poncot/poncot_2a.tm2bpp.rz"

PoncotPic_2b: ; ec6a1 (3b:46a1)
INCBIN "gfx/pic/poncot/poncot_2b.tm2bpp.rz"

PoncotPic_2c: ; ec93d (3b:493d)
INCBIN "gfx/pic/poncot/poncot_2c.tm2bpp.rz"

PoncotPic_2d: ; ecb22 (3b:4b22)
INCBIN "gfx/pic/poncot/poncot_2d.tm2bpp.rz"

PoncotPic_2e: ; ecd08 (3b:4d08)
INCBIN "gfx/pic/poncot/poncot_2e.tm2bpp.rz"

PoncotPic_2f: ; ecf4a (3b:4f4a)
INCBIN "gfx/pic/poncot/poncot_2f.tm2bpp.rz"

PoncotPic_30: ; ecffe (3b:4ffe)
INCBIN "gfx/pic/poncot/poncot_30.tm2bpp.rz"

PoncotPic_31: ; ed183 (3b:5183)
INCBIN "gfx/pic/poncot/poncot_31.tm2bpp.rz"

PoncotPic_32: ; ed44e (3b:544e)
INCBIN "gfx/pic/poncot/poncot_32.tm2bpp.rz"

PoncotPic_33: ; ed504 (3b:5504)
INCBIN "gfx/pic/poncot/poncot_33.tm2bpp.rz"

PoncotPic_34: ; ed5dd (3b:55dd)
INCBIN "gfx/pic/poncot/poncot_34.tm2bpp.rz"

PoncotPic_35: ; ed769 (3b:5769)
INCBIN "gfx/pic/poncot/poncot_35.tm2bpp.rz"

PoncotPic_36: ; ed9a5 (3b:59a5)
INCBIN "gfx/pic/poncot/poncot_36.tm2bpp.rz"

PoncotPic_37: ; edb0c (3b:5b0c)
INCBIN "gfx/pic/poncot/poncot_37.tm2bpp.rz"

PoncotPic_38: ; edc66 (3b:5c66)
INCBIN "gfx/pic/poncot/poncot_38.tm2bpp.rz"

PoncotPic_39: ; ede61 (3b:5e61)
INCBIN "gfx/pic/poncot/poncot_39.tm2bpp.rz"

PoncotPic_3a: ; edf95 (3b:5f95)
INCBIN "gfx/pic/poncot/poncot_3a.tm2bpp.rz"

PoncotPic_3b: ; ee211 (3b:6211)
INCBIN "gfx/pic/poncot/poncot_3b.tm2bpp.rz"

PoncotPic_3c: ; ee3fe (3b:63fe)
INCBIN "gfx/pic/poncot/poncot_3c.tm2bpp.rz"

PoncotPic_3d: ; ee5e1 (3b:65e1)
INCBIN "gfx/pic/poncot/poncot_3d.tm2bpp.rz"

PoncotPic_3e: ; ee764 (3b:6764)
INCBIN "gfx/pic/poncot/poncot_3e.tm2bpp.rz"

PoncotPic_3f: ; ee821 (3b:6821)
INCBIN "gfx/pic/poncot/poncot_3f.tm2bpp.rz"

PoncotPic_40: ; ee9e2 (3b:69e2)
INCBIN "gfx/pic/poncot/poncot_40.tm2bpp.rz"

PoncotPic_41: ; eeb53 (3b:6b53)
INCBIN "gfx/pic/poncot/poncot_41.tm2bpp.rz"

PoncotPic_42: ; eebd1 (3b:6bd1)
INCBIN "gfx/pic/poncot/poncot_42.tm2bpp.rz"

PoncotPic_43: ; eec67 (3b:6c67)
INCBIN "gfx/pic/poncot/poncot_43.tm2bpp.rz"

PoncotPic_44: ; eee02 (3b:6e02)
INCBIN "gfx/pic/poncot/poncot_44.tm2bpp.rz"

PoncotPic_45: ; eeed9 (3b:6ed9)
INCBIN "gfx/pic/poncot/poncot_45.tm2bpp.rz"

PoncotPic_46: ; ef072 (3b:7072)
INCBIN "gfx/pic/poncot/poncot_46.tm2bpp.rz"

PoncotPic_47: ; ef113 (3b:7113)
INCBIN "gfx/pic/poncot/poncot_47.tm2bpp.rz"

PoncotPic_48: ; ef1b4 (3b:71b4)
INCBIN "gfx/pic/poncot/poncot_48.tm2bpp.rz"

PoncotPic_49: ; ef32b (3b:732b)
INCBIN "gfx/pic/poncot/poncot_49.tm2bpp.rz"

PoncotPic_4a: ; ef4dd (3b:74dd)
INCBIN "gfx/pic/poncot/poncot_4a.tm2bpp.rz"

PoncotPic_4b: ; ef69c (3b:769c)
INCBIN "gfx/pic/poncot/poncot_4b.tm2bpp.rz"

PoncotPic_4c: ; ef863 (3b:7863)
INCBIN "gfx/pic/poncot/poncot_4c.tm2bpp.rz"

PoncotPic_4d: ; ef9f3 (3b:79f3)
INCBIN "gfx/pic/poncot/poncot_4d.tm2bpp.rz"

PoncotPic_4e: ; efbe2 (3b:7be2)
INCBIN "gfx/pic/poncot/poncot_4e.tm2bpp.rz"

PoncotPic_4f: ; efca2 (3b:7ca2)
INCBIN "gfx/pic/poncot/poncot_4f.tm2bpp.rz"

PoncotPic_50: ; efe10 (3b:7e10)
INCBIN "gfx/pic/poncot/poncot_50.tm2bpp.rz"

SECTION "Poncot Pics 3", ROMX
PoncotPic_51: ; f0000 (3c:4000)
INCBIN "gfx/pic/poncot/poncot_51.tm2bpp.rz"

PoncotPic_52: ; f01a5 (3c:41a5)
INCBIN "gfx/pic/poncot/poncot_52.tm2bpp.rz"

PoncotPic_53: ; f032b (3c:432b)
INCBIN "gfx/pic/poncot/poncot_53.tm2bpp.rz"

PoncotPic_54: ; f040c (3c:440c)
INCBIN "gfx/pic/poncot/poncot_54.tm2bpp.rz"

PoncotPic_55: ; f0582 (3c:4582)
INCBIN "gfx/pic/poncot/poncot_55.tm2bpp.rz"

PoncotPic_56: ; f07ba (3c:47ba)
INCBIN "gfx/pic/poncot/poncot_56.tm2bpp.rz"

PoncotPic_57: ; f087b (3c:487b)
INCBIN "gfx/pic/poncot/poncot_57.tm2bpp.rz"

PoncotPic_58: ; f0a0a (3c:4a0a)
INCBIN "gfx/pic/poncot/poncot_58.tm2bpp.rz"

PoncotPic_59: ; f0c56 (3c:4c56)
INCBIN "gfx/pic/poncot/poncot_59.tm2bpp.rz"

PoncotPic_5a: ; f0d19 (3c:4d19)
INCBIN "gfx/pic/poncot/poncot_5a.tm2bpp.rz"

PoncotPic_5b: ; f0e91 (3c:4e91)
INCBIN "gfx/pic/poncot/poncot_5b.tm2bpp.rz"

PoncotPic_5c: ; f0fa5 (3c:4fa5)
INCBIN "gfx/pic/poncot/poncot_5c.tm2bpp.rz"

PoncotPic_5d: ; f1116 (3c:5116)
INCBIN "gfx/pic/poncot/poncot_5d.tm2bpp.rz"

PoncotPic_5e: ; f11fa (3c:51fa)
INCBIN "gfx/pic/poncot/poncot_5e.tm2bpp.rz"

PoncotPic_5f: ; f1359 (3c:5359)
INCBIN "gfx/pic/poncot/poncot_5f.tm2bpp.rz"

PoncotPic_60: ; f15b1 (3c:55b1)
INCBIN "gfx/pic/poncot/poncot_60.tm2bpp.rz"

PoncotPic_61: ; f1691 (3c:5691)
INCBIN "gfx/pic/poncot/poncot_61.tm2bpp.rz"

PoncotPic_62: ; f172b (3c:572b)
INCBIN "gfx/pic/poncot/poncot_62.tm2bpp.rz"

PoncotPic_63: ; f187e (3c:587e)
INCBIN "gfx/pic/poncot/poncot_63.tm2bpp.rz"

PoncotPic_64: ; f1a4e (3c:5a4e)
INCBIN "gfx/pic/poncot/poncot_64.tm2bpp.rz"

PoncotPic_65: ; f1b15 (3c:5b15)
INCBIN "gfx/pic/poncot/poncot_65.tm2bpp.rz"

PoncotPic_66: ; f1cd8 (3c:5cd8)
INCBIN "gfx/pic/poncot/poncot_66.tm2bpp.rz"

PoncotPic_67: ; f1eb5 (3c:5eb5)
INCBIN "gfx/pic/poncot/poncot_67.tm2bpp.rz"

PoncotPic_68: ; f1f48 (3c:5f48)
INCBIN "gfx/pic/poncot/poncot_68.tm2bpp.rz"

PoncotPic_69: ; f2029 (3c:6029)
INCBIN "gfx/pic/poncot/poncot_69.tm2bpp.rz"

PoncotPic_6a: ; f21ed (3c:61ed)
INCBIN "gfx/pic/poncot/poncot_6a.tm2bpp.rz"

PoncotPic_6b: ; f22c0 (3c:62c0)
INCBIN "gfx/pic/poncot/poncot_6b.tm2bpp.rz"

PoncotPic_6c: ; f23a9 (3c:63a9)
INCBIN "gfx/pic/poncot/poncot_6c.tm2bpp.rz"

PoncotPic_6d: ; f251a (3c:651a)
INCBIN "gfx/pic/poncot/poncot_6d.tm2bpp.rz"

PoncotPic_6e: ; f273e (3c:673e)
INCBIN "gfx/pic/poncot/poncot_6e.tm2bpp.rz"

PoncotPic_6f: ; f293e (3c:693e)
INCBIN "gfx/pic/poncot/poncot_6f.tm2bpp.rz"

PoncotPic_70: ; f2aa5 (3c:6aa5)
INCBIN "gfx/pic/poncot/poncot_70.tm2bpp.rz"

PoncotPic_71: ; f2b6a (3c:6b6a)
INCBIN "gfx/pic/poncot/poncot_71.tm2bpp.rz"

PoncotPic_72: ; f2d49 (3c:6d49)
INCBIN "gfx/pic/poncot/poncot_72.tm2bpp.rz"

PoncotPic_73: ; f2e1b (3c:6e1b)
INCBIN "gfx/pic/poncot/poncot_73.tm2bpp.rz"

PoncotPic_74: ; f2ec7 (3c:6ec7)
INCBIN "gfx/pic/poncot/poncot_74.tm2bpp.rz"

PoncotPic_75: ; f3090 (3c:7090)
INCBIN "gfx/pic/poncot/poncot_75.tm2bpp.rz"

PoncotPic_76: ; f3175 (3c:7175)
INCBIN "gfx/pic/poncot/poncot_76.tm2bpp.rz"

PoncotPic_77: ; f324b (3c:724b)
INCBIN "gfx/pic/poncot/poncot_77.tm2bpp.rz"

PoncotPic_78: ; f332a (3c:732a)
INCBIN "gfx/pic/poncot/poncot_78.tm2bpp.rz"

PoncotPic_79: ; f3508 (3c:7508)
INCBIN "gfx/pic/poncot/poncot_79.tm2bpp.rz"

PoncotPic_7a: ; f35dc (3c:75dc)
INCBIN "gfx/pic/poncot/poncot_7a.tm2bpp.rz"

PoncotPic_7b: ; f376e (3c:776e)
INCBIN "gfx/pic/poncot/poncot_7b.tm2bpp.rz"

PoncotPic_7c: ; f38e1 (3c:78e1)
INCBIN "gfx/pic/poncot/poncot_7c.tm2bpp.rz"

PoncotPic_7d: ; f3aa3 (3c:7aa3)
INCBIN "gfx/pic/poncot/poncot_7d.tm2bpp.rz"

PoncotPic_7e: ; f3c41 (3c:7c41)
INCBIN "gfx/pic/poncot/poncot_7e.tm2bpp.rz"

PoncotPic_7f: ; f3d90 (3c:7d90)
INCBIN "gfx/pic/poncot/poncot_7f.tm2bpp.rz"

PoncotPic_80: ; f3e32 (3c:7e32)
INCBIN "gfx/pic/poncot/poncot_80.tm2bpp.rz"

SECTION "Poncot Pics 4", ROMX
PoncotPic_81: ; f4000 (3d:4000)
INCBIN "gfx/pic/poncot/poncot_81.tm2bpp.rz"

PoncotPic_82: ; f4239 (3d:4239)
INCBIN "gfx/pic/poncot/poncot_82.tm2bpp.rz"

PoncotPic_83: ; f4306 (3d:4306)
INCBIN "gfx/pic/poncot/poncot_83.tm2bpp.rz"

PoncotPic_84: ; f43e1 (3d:43e1)
INCBIN "gfx/pic/poncot/poncot_84.tm2bpp.rz"

PoncotPic_85: ; f456d (3d:456d)
INCBIN "gfx/pic/poncot/poncot_85.tm2bpp.rz"

PoncotPic_86: ; f47b6 (3d:47b6)
INCBIN "gfx/pic/poncot/poncot_86.tm2bpp.rz"

PoncotPic_87: ; f4883 (3d:4883)
INCBIN "gfx/pic/poncot/poncot_87.tm2bpp.rz"

PoncotPic_88: ; f4a3a (3d:4a3a)
INCBIN "gfx/pic/poncot/poncot_88.tm2bpp.rz"

PoncotPic_89: ; f4cb4 (3d:4cb4)
INCBIN "gfx/pic/poncot/poncot_89.tm2bpp.rz"

PoncotPic_8a: ; f4d78 (3d:4d78)
INCBIN "gfx/pic/poncot/poncot_8a.tm2bpp.rz"

PoncotPic_8b: ; f4ed5 (3d:4ed5)
INCBIN "gfx/pic/poncot/poncot_8b.tm2bpp.rz"

PoncotPic_8c: ; f5037 (3d:5037)
INCBIN "gfx/pic/poncot/poncot_8c.tm2bpp.rz"

PoncotPic_8d: ; f51bf (3d:51bf)
INCBIN "gfx/pic/poncot/poncot_8d.tm2bpp.rz"

PoncotPic_8e: ; f5304 (3d:5304)
INCBIN "gfx/pic/poncot/poncot_8e.tm2bpp.rz"

PoncotPic_8f: ; f5466 (3d:5466)
INCBIN "gfx/pic/poncot/poncot_8f.tm2bpp.rz"

PoncotPic_90: ; f5557 (3d:5557)
INCBIN "gfx/pic/poncot/poncot_90.tm2bpp.rz"

PoncotPic_91: ; f561b (3d:561b)
INCBIN "gfx/pic/poncot/poncot_91.tm2bpp.rz"

PoncotPic_92: ; f56f7 (3d:56f7)
INCBIN "gfx/pic/poncot/poncot_92.tm2bpp.rz"

PoncotPic_93: ; f5852 (3d:5852)
INCBIN "gfx/pic/poncot/poncot_93.tm2bpp.rz"

PoncotPic_94: ; f59c1 (3d:59c1)
INCBIN "gfx/pic/poncot/poncot_94.tm2bpp.rz"

PoncotPic_95: ; f5b7c (3d:5b7c)
INCBIN "gfx/pic/poncot/poncot_95.tm2bpp.rz"

PoncotPic_96: ; f5cfe (3d:5cfe)
INCBIN "gfx/pic/poncot/poncot_96.tm2bpp.rz"

PoncotPic_97: ; f5e82 (3d:5e82)
INCBIN "gfx/pic/poncot/poncot_97.tm2bpp.rz"

PoncotPic_98: ; f5fed (3d:5fed)
INCBIN "gfx/pic/poncot/poncot_98.tm2bpp.rz"

PoncotPic_99: ; f615d (3d:615d)
INCBIN "gfx/pic/poncot/poncot_99.tm2bpp.rz"

PoncotPic_9a: ; f63a8 (3d:63a8)
INCBIN "gfx/pic/poncot/poncot_9a.tm2bpp.rz"

PoncotPic_9b: ; f65e7 (3d:65e7)
INCBIN "gfx/pic/poncot/poncot_9b.tm2bpp.rz"

PoncotPic_9c: ; f679c (3d:679c)
INCBIN "gfx/pic/poncot/poncot_9c.tm2bpp.rz"

PoncotPic_9d: ; f68b6 (3d:68b6)
INCBIN "gfx/pic/poncot/poncot_9d.tm2bpp.rz"

PoncotPic_9e: ; f6b0e (3d:6b0e)
INCBIN "gfx/pic/poncot/poncot_9e.tm2bpp.rz"

PoncotPic_9f: ; f6c26 (3d:6c26)
INCBIN "gfx/pic/poncot/poncot_9f.tm2bpp.rz"

PoncotPic_a0: ; f6ec1 (3d:6ec1)
INCBIN "gfx/pic/poncot/poncot_a0.tm2bpp.rz"

PoncotPic_a1: ; f7040 (3d:7040)
INCBIN "gfx/pic/poncot/poncot_a1.tm2bpp.rz"

PoncotPic_a2: ; f71d5 (3d:71d5)
INCBIN "gfx/pic/poncot/poncot_a2.tm2bpp.rz"

PoncotPic_a3: ; f7353 (3d:7353)
INCBIN "gfx/pic/poncot/poncot_a3.tm2bpp.rz"

PoncotPic_a4: ; f7529 (3d:7529)
INCBIN "gfx/pic/poncot/poncot_a4.tm2bpp.rz"

PoncotPic_a5: ; f7668 (3d:7668)
INCBIN "gfx/pic/poncot/poncot_a5.tm2bpp.rz"

PoncotPic_a6: ; f7829 (3d:7829)
INCBIN "gfx/pic/poncot/poncot_a6.tm2bpp.rz"

PoncotPic_a7: ; f79de (3d:79de)
INCBIN "gfx/pic/poncot/poncot_a7.tm2bpp.rz"

PoncotPic_a8: ; f7b50 (3d:7b50)
INCBIN "gfx/pic/poncot/poncot_a8.tm2bpp.rz"

PoncotPic_a9: ; f7d20 (3d:7d20)
INCBIN "gfx/pic/poncot/poncot_a9.tm2bpp.rz"

SECTION "Trainer Pics", ROMX
TrainerPic_ae: ; f8000 (3e:4000)
INCBIN "gfx/pic/trainer/trainer_ae.tm2bpp.rz"

TrainerPic_af: ; f81c4 (3e:41c4)
INCBIN "gfx/pic/trainer/trainer_af.tm2bpp.rz"

TrainerPic_b0: ; f8332 (3e:4332)
INCBIN "gfx/pic/trainer/trainer_b0.tm2bpp.rz"

TrainerPic_b1: ; f84f3 (3e:44f3)
INCBIN "gfx/pic/trainer/trainer_b1.tm2bpp.rz"

TrainerPic_b2: ; f8685 (3e:4685)
INCBIN "gfx/pic/trainer/trainer_b2.tm2bpp.rz"

TrainerPic_b3: ; f87e1 (3e:47e1)
INCBIN "gfx/pic/trainer/trainer_b3.tm2bpp.rz"

TrainerPic_b4: ; f8956 (3e:4956)
INCBIN "gfx/pic/trainer/trainer_b4.tm2bpp.rz"

TrainerPic_b5: ; f8afd (3e:4afd)
INCBIN "gfx/pic/trainer/trainer_b5.tm2bpp.rz"

TrainerPic_b6: ; f8ceb (3e:4ceb)
INCBIN "gfx/pic/trainer/trainer_b6.tm2bpp.rz"

TrainerPic_b7: ; f8ec5 (3e:4ec5)
INCBIN "gfx/pic/trainer/trainer_b7.tm2bpp.rz"

TrainerPic_b8: ; f90f4 (3e:50f4)
INCBIN "gfx/pic/trainer/trainer_b8.tm2bpp.rz"

TrainerPic_b9: ; f9259 (3e:5259)
INCBIN "gfx/pic/trainer/trainer_b9.tm2bpp.rz"

TrainerPic_ba: ; f9327 (3e:5327)
INCBIN "gfx/pic/trainer/trainer_ba.tm2bpp.rz"

TrainerPic_bb: ; f94de (3e:54de)
INCBIN "gfx/pic/trainer/trainer_bb.tm2bpp.rz"

TrainerPic_bc: ; f9614 (3e:5614)
INCBIN "gfx/pic/trainer/trainer_bc.tm2bpp.rz"

TrainerPic_bd: ; f986a (3e:586a)
INCBIN "gfx/pic/trainer/trainer_bd.tm2bpp.rz"

TrainerPic_be: ; f9a3b (3e:5a3b)
INCBIN "gfx/pic/trainer/trainer_be.tm2bpp.rz"

TrainerPic_bf: ; f9c0c (3e:5c0c)
INCBIN "gfx/pic/trainer/trainer_bf.tm2bpp.rz"

TrainerPic_c0: ; f9e3f (3e:5e3f)
INCBIN "gfx/pic/trainer/trainer_c0.tm2bpp.rz"

TrainerPic_c1: ; f9f9b (3e:5f9b)
INCBIN "gfx/pic/trainer/trainer_c1.tm2bpp.rz"

TrainerPic_c2: ; fa182 (3e:6182)
INCBIN "gfx/pic/trainer/trainer_c2.tm2bpp.rz"

TrainerPic_c3: ; fa2ae (3e:62ae)
INCBIN "gfx/pic/trainer/trainer_c3.tm2bpp.rz"

TrainerPic_c4: ; fa4a6 (3e:64a6)
INCBIN "gfx/pic/trainer/trainer_c4.tm2bpp.rz"

TrainerPic_c5: ; fa64d (3e:664d)
INCBIN "gfx/pic/trainer/trainer_c5.tm2bpp.rz"

TrainerPic_c6: ; fa7f4 (3e:67f4)
INCBIN "gfx/pic/trainer/trainer_c6.tm2bpp.rz"

TrainerPic_c7: ; fa953 (3e:6953)
INCBIN "gfx/pic/trainer/trainer_c7.tm2bpp.rz"

TrainerPic_c8: ; faaaa (3e:6aaa)
INCBIN "gfx/pic/trainer/trainer_c8.tm2bpp.rz"

TrainerPic_c9: ; fac61 (3e:6c61)
INCBIN "gfx/pic/trainer/trainer_c9.tm2bpp.rz"

TrainerPic_ca: ; fadef (3e:6def)
INCBIN "gfx/pic/trainer/trainer_ca.tm2bpp.rz"
