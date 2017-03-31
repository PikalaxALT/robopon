
SECTION "Music Headers 1C", ROMX [$529c], BANK [$1c]
SongBanks_1c: ; 7129c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_71318)
	db BANK(SongHeader_71321)
	db BANK(SongHeader_7132a)
	db BANK(SongHeader_71333)
	db BANK(SongHeader_7133c)
	db BANK(SongHeader_71345)
	db BANK(SongHeader_7534e)
	db BANK(SongHeader_75357)
	db BANK(SongHeader_75360)
	db BANK(SongHeader_75369)
	db BANK(SongHeader_75372)
	db BANK(SongHeader_7537b)
	db BANK(SongHeader_71384)
	db BANK(SongHeader_7138d)
	db BANK(SongHeader_71396)
	db BANK(SongHeader_7139f)
	db BANK(SongHeader_713a8)
	db BANK(SongHeader_713b1)
	db BANK(SongHeader_713ba)
	db BANK(SongHeader_713c3)
	db BANK(SongHeader_713cc)
	db BANK(SongHeader_753d5)
	db BANK(SongHeader_753de)
	db BANK(SongHeader_713e7)

SongPointers_1c: ; 712b9
	dw SongHeader_712f3
	dw SongHeader_712f4
	dw SongHeader_712fd
	dw SongHeader_71306
	dw SongHeader_7130f
	dw SongHeader_71318
	dw SongHeader_71321
	dw SongHeader_7132a
	dw SongHeader_71333
	dw SongHeader_7133c
	dw SongHeader_71345
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_71384
	dw SongHeader_7138d
	dw SongHeader_71396
	dw SongHeader_7139f
	dw SongHeader_713a8
	dw SongHeader_713b1
	dw SongHeader_713ba
	dw SongHeader_713c3
	dw SongHeader_713cc
	dw $0000
	dw $0000
	dw SongHeader_713e7

SongHeader_712f3: ; 712f3
	db %0000

SongHeader_712f4: ; 712f4
	db %1111
	dw Song712f4_Ch0
	dw Song712f4_Ch1
	dw Song712f4_Ch2
	dw Song712f4_Ch3

SongHeader_712fd: ; 712fd
	db %1111
	dw Song712fd_Ch0
	dw Song712fd_Ch1
	dw Song712fd_Ch2
	dw Song712fd_Ch3

SongHeader_71306: ; 71306
	db %1111
	dw Song71306_Ch0
	dw Song71306_Ch1
	dw Song71306_Ch2
	dw Song71306_Ch3

SongHeader_7130f: ; 7130f
	db %1111
	dw Song7130f_Ch0
	dw Song7130f_Ch1
	dw Song7130f_Ch2
	dw Song7130f_Ch3

SongHeader_71318: ; 71318
	db %1111
	dw Song71318_Ch0
	dw Song71318_Ch1
	dw Song71318_Ch2
	dw Song71318_Ch3

SongHeader_71321: ; 71321
	db %1111
	dw Song71321_Ch0
	dw Song71321_Ch1
	dw Song71321_Ch2
	dw Song71321_Ch3

SongHeader_7132a: ; 7132a
	db %1111
	dw Song7132a_Ch0
	dw Song7132a_Ch1
	dw Song7132a_Ch2
	dw Song7132a_Ch3

SongHeader_71333: ; 71333
	db %1111
	dw Song71333_Ch0
	dw Song71333_Ch1
	dw Song71333_Ch2
	dw Song71333_Ch3

SongHeader_7133c: ; 7133c
	db %1111
	dw Song7133c_Ch0
	dw Song7133c_Ch1
	dw Song7133c_Ch2
	dw Song7133c_Ch3

SongHeader_71345: ; 71345
	db %1111
	dw Song71345_Ch0
	dw Song71345_Ch1
	dw Song71345_Ch2
	dw Song71345_Ch3

	ds $36

SongHeader_71384: ; 71384
	db %1111
	dw Song71384_Ch0
	dw Song71384_Ch1
	dw Song71384_Ch2
	dw Song71384_Ch3

SongHeader_7138d: ; 7138d
	db %1111
	dw Song7138d_Ch0
	dw Song7138d_Ch1
	dw Song7138d_Ch2
	dw Song7138d_Ch3

SongHeader_71396: ; 71396
	db %1111
	dw Song71396_Ch0
	dw Song71396_Ch1
	dw Song71396_Ch2
	dw Song71396_Ch3

SongHeader_7139f: ; 7139f
	db %1111
	dw Song7139f_Ch0
	dw Song7139f_Ch1
	dw Song7139f_Ch2
	dw Song7139f_Ch3

SongHeader_713a8: ; 713a8
	db %1111
	dw Song713a8_Ch0
	dw Song713a8_Ch1
	dw Song713a8_Ch2
	dw Song713a8_Ch3

SongHeader_713b1: ; 713b1
	db %1111
	dw Song713b1_Ch0
	dw Song713b1_Ch1
	dw Song713b1_Ch2
	dw Song713b1_Ch3

SongHeader_713ba: ; 713ba
	db %1111
	dw Song713ba_Ch0
	dw Song713ba_Ch1
	dw Song713ba_Ch2
	dw Song713ba_Ch3

SongHeader_713c3: ; 713c3
	db %1111
	dw Song713c3_Ch0
	dw Song713c3_Ch1
	dw Song713c3_Ch2
	dw Song713c3_Ch3

SongHeader_713cc: ; 713cc
	db %1111
	dw Song713cc_Ch0
	dw Song713cc_Ch1
	dw Song713cc_Ch2
	dw Song713cc_Ch3

	ds $12

SongHeader_713e7: ; 713e7
	db %1111
	dw Song713e7_Ch0
	dw Song713e7_Ch1
	dw Song713e7_Ch2
	dw Song713e7_Ch3

Song712f4_Ch0: ; 713f0
	dr $713f0, $714df

Song712f4_Ch1: ; 714df
	dr $714df, $715dc

Song712f4_Ch2: ; 715dc
	dr $715dc, $71694

Song712f4_Ch3: ; 71694
	dr $71694, $716ee

Song712fd_Ch0: ; 716ee
	dr $716ee, $7180e

Song712fd_Ch1: ; 7180e
	dr $7180e, $719d0

Song712fd_Ch2: ; 719d0
	dr $719d0, $71a8f

Song712fd_Ch3: ; 71a8f
	dr $71a8f, $71ad7

Song71306_Ch0: ; 71ad7
	dr $71ad7, $71c38

Song71306_Ch1: ; 71c38
	dr $71c38, $71d2f

Song71306_Ch2: ; 71d2f
	dr $71d2f, $71e0f

Song71306_Ch3: ; 71e0f
	dr $71e0f, $71e78

Song7130f_Ch0: ; 71e78
	dr $71e78, $71f23

Song7130f_Ch1: ; 71f23
	dr $71f23, $72015

Song7130f_Ch2: ; 72015
	dr $72015, $720e0

Song7130f_Ch3: ; 720e0
	dr $720e0, $7212b

Song71318_Ch0: ; 7212b
	dr $7212b, $72178

Song71318_Ch1: ; 72178
	dr $72178, $72218

Song71318_Ch2: ; 72218
	dr $72218, $722c8

Song71318_Ch3: ; 722c8
	dr $722c8, $7230d

Song71321_Ch0: ; 7230d
	dr $7230d, $723b1

Song71321_Ch1: ; 723b1
	dr $723b1, $7247b

Song71321_Ch2: ; 7247b
	dr $7247b, $72526

Song71321_Ch3: ; 72526
	dr $72526, $7257a

Song7132a_Ch0: ; 7257a
	dr $7257a, $725e8

Song7132a_Ch1: ; 725e8
	dr $725e8, $726c5

Song7132a_Ch2: ; 726c5
	dr $726c5, $727a0

Song7132a_Ch3: ; 727a0
	dr $727a0, $727c9

Song71333_Ch0: ; 727c9
	dr $727c9, $72833

Song71333_Ch1: ; 72833
	dr $72833, $728c7

Song71333_Ch2: ; 728c7
	dr $728c7, $729e6

Song71333_Ch3: ; 729e6
	dr $729e6, $72a24

Song7133c_Ch0: ; 72a24
	dr $72a24, $72aff

Song7133c_Ch1: ; 72aff
	dr $72aff, $72be8

Song7133c_Ch2: ; 72be8
	dr $72be8, $72c8c

Song7133c_Ch3: ; 72c8c
	dr $72c8c, $72ce8

Song71345_Ch0: ; 72ce8
	dr $72ce8, $72d2c

Song71345_Ch1: ; 72d2c
	dr $72d2c, $72e1a

Song71345_Ch2: ; 72e1a
	dr $72e1a, $72f42

Song71345_Ch3: ; 72f42
	dr $72f42, $72f5c

Song71384_Ch0: ; 72f5c
	dr $72f5c, $72fc7

Song71384_Ch1: ; 72fc7
	dr $72fc7, $730f9

Song71384_Ch2: ; 730f9
	dr $730f9, $731c3

Song71384_Ch3: ; 731c3
	dr $731c3, $73223

Song7138d_Ch0: ; 73223
	dr $73223, $732bd

Song7138d_Ch1: ; 732bd
	dr $732bd, $7342b

Song7138d_Ch2: ; 7342b
	dr $7342b, $73506

Song7138d_Ch3: ; 73506
	dr $73506, $73541

Song71396_Ch0: ; 73541
	dr $73541, $735d2

Song71396_Ch1: ; 735d2
	dr $735d2, $7373d

Song71396_Ch2: ; 7373d
	dr $7373d, $73826

Song71396_Ch3: ; 73826
	dr $73826, $7389b

Song7139f_Ch0: ; 7389b
	dr $7389b, $7395c

Song7139f_Ch1: ; 7395c
	dr $7395c, $73aac

Song7139f_Ch2: ; 73aac
	dr $73aac, $73b42

Song7139f_Ch3: ; 73b42
	dr $73b42, $73bb2

Song713a8_Ch0: ; 73bb2
	dr $73bb2, $73bd7

Song713a8_Ch1: ; 73bd7
	dr $73bd7, $73c06

Song713a8_Ch2: ; 73c06
	dr $73c06, $73c31

Song713a8_Ch3: ; 73c31
	dr $73c31, $73c4c

Song713b1_Ch0: ; 73c4c
	dr $73c4c, $73c68

Song713b1_Ch1: ; 73c68
	dr $73c68, $73cb3

Song713b1_Ch2: ; 73cb3
	dr $73cb3, $73ce1

Song713b1_Ch3: ; 73ce1
	dr $73ce1, $73ce6

Song713ba_Ch0: ; 73ce6
	dr $73ce6, $73d09

Song713ba_Ch1: ; 73d09
	dr $73d09, $73d2e

Song713ba_Ch2: ; 73d2e
	dr $73d2e, $73d53

Song713ba_Ch3: ; 73d53
	dr $73d53, $73d6c

Song713c3_Ch0: ; 73d6c
	dr $73d6c, $73d92

Song713c3_Ch1: ; 73d92
	dr $73d92, $73db6

Song713c3_Ch2: ; 73db6
	dr $73db6, $73dd6

Song713c3_Ch3: ; 73dd6
	dr $73dd6, $73de9

Song713cc_Ch0: ; 73de9
	dr $73de9, $73e0f

Song713cc_Ch1: ; 73e0f
	dr $73e0f, $73e36

Song713cc_Ch2: ; 73e36
	dr $73e36, $73e5b

Song713cc_Ch3: ; 73e5b
	dr $73e5b, $73e76

Song713e7_Ch0: ; 73e76
	dr $73e76, $73e9c

Song713e7_Ch1: ; 73e9c
	dr $73e9c, $73ecd

Song713e7_Ch2: ; 73ecd
	dr $73ecd, $73ef0

Song713e7_Ch3: ; 73ef0
	dr $73ef0, $73f18


SECTION "Music Headers 1D", ROMX [$529c], BANK [$1d]
SongBanks_1d: ; 7529c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_71318)
	db BANK(SongHeader_71321)
	db BANK(SongHeader_7132a)
	db BANK(SongHeader_71333)
	db BANK(SongHeader_7133c)
	db BANK(SongHeader_71345)
	db BANK(SongHeader_7534e)
	db BANK(SongHeader_75357)
	db BANK(SongHeader_75360)
	db BANK(SongHeader_75369)
	db BANK(SongHeader_75372)
	db BANK(SongHeader_7537b)
	db BANK(SongHeader_71384)
	db BANK(SongHeader_7138d)
	db BANK(SongHeader_71396)
	db BANK(SongHeader_7139f)
	db BANK(SongHeader_713a8)
	db BANK(SongHeader_713b1)
	db BANK(SongHeader_713ba)
	db BANK(SongHeader_713c3)
	db BANK(SongHeader_713cc)
	db BANK(SongHeader_753d5)
	db BANK(SongHeader_753de)
	db BANK(SongHeader_713e7)

SongPointers_1d: ; 752b9
	dw SongHeader_752f3
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_7534e
	dw SongHeader_75357
	dw SongHeader_75360
	dw SongHeader_75369
	dw SongHeader_75372
	dw SongHeader_7537b
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw SongHeader_753d5
	dw SongHeader_753de
	dw $0000

SongHeader_752f3: ; 752f3
	db %0000

	ds $5a

SongHeader_7534e: ; 7534e
	db %1111
	dw Song7534e_Ch0
	dw Song7534e_Ch1
	dw Song7534e_Ch2
	dw Song7534e_Ch3

SongHeader_75357: ; 75357
	db %1111
	dw Song75357_Ch0
	dw Song75357_Ch1
	dw Song75357_Ch2
	dw Song75357_Ch3

SongHeader_75360: ; 75360
	db %1111
	dw Song75360_Ch0
	dw Song75360_Ch1
	dw Song75360_Ch2
	dw Song75360_Ch3

SongHeader_75369: ; 75369
	db %1111
	dw Song75369_Ch0
	dw Song75369_Ch1
	dw Song75369_Ch2
	dw Song75369_Ch3

SongHeader_75372: ; 75372
	db %1111
	dw Song75372_Ch0
	dw Song75372_Ch1
	dw Song75372_Ch2
	dw Song75372_Ch3

SongHeader_7537b: ; 7537b
	db %1111
	dw Song7537b_Ch0
	dw Song7537b_Ch1
	dw Song7537b_Ch2
	dw Song7537b_Ch3

	ds $51

SongHeader_753d5: ; 753d5
	db %1111
	dw Song753d5_Ch0
	dw Song753d5_Ch1
	dw Song753d5_Ch2
	dw Song753d5_Ch3

SongHeader_753de: ; 753de
	db %1111
	dw Song753de_Ch0
	dw Song753de_Ch1
	dw Song753de_Ch2
	dw Song753de_Ch3

	ds $9

Song7534e_Ch0: ; 753f0
	dr $753f0, $75489

Song7534e_Ch1: ; 75489
	dr $75489, $75522

Song7534e_Ch2: ; 75522
	dr $75522, $75599

Song7534e_Ch3: ; 75599
	dr $75599, $755fa

Song75357_Ch0: ; 755fa
	dr $755fa, $7569c

Song75357_Ch1: ; 7569c
	dr $7569c, $75758

Song75357_Ch2: ; 75758
	dr $75758, $75870

Song75357_Ch3: ; 75870
	dr $75870, $758c0

Song75360_Ch0: ; 758c0
	dr $758c0, $75a26

Song75360_Ch1: ; 75a26
	dr $75a26, $75af2

Song75360_Ch2: ; 75af2
	dr $75af2, $75bef

Song75360_Ch3: ; 75bef
	dr $75bef, $75d0e

Song75369_Ch0: ; 75d0e
	dr $75d0e, $75d95

Song75369_Ch1: ; 75d95
	dr $75d95, $75fb2

Song75369_Ch2: ; 75fb2
	dr $75fb2, $760b2

Song75369_Ch3: ; 760b2
	dr $760b2, $76112

Song75372_Ch0: ; 76112
	dr $76112, $761fd

Song75372_Ch1: ; 761fd
	dr $761fd, $762ea

Song75372_Ch2: ; 762ea
	dr $762ea, $76371

Song75372_Ch3: ; 76371
	dr $76371, $763ac

Song7537b_Ch0: ; 763ac
	dr $763ac, $76407

Song7537b_Ch1: ; 76407
	dr $76407, $7647f

Song7537b_Ch2: ; 7647f
	dr $7647f, $764c9

Song7537b_Ch3: ; 764c9
	dr $764c9, $764f2

Song753d5_Ch0: ; 764f2
	dr $764f2, $76522

Song753d5_Ch1: ; 76522
	dr $76522, $7654f

Song753d5_Ch2: ; 7654f
	dr $7654f, $76573

Song753d5_Ch3: ; 76573
	dr $76573, $76589

Song753de_Ch0: ; 76589
	dr $76589, $765c0

Song753de_Ch1: ; 765c0
	dr $765c0, $765f4

Song753de_Ch2: ; 765f4
	dr $765f4, $76634

Song753de_Ch3: ; 76634
	dr $76634, $76800

