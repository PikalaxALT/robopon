
SECTION "Music Headers 1C", ROMX [$529c], BANK [$1c]
SongBanks_1c: ; 7129c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_TrainerVictory)
	db BANK(SongHeader_TrainerBattle)
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
	dw SongHeader_TrainerVictory
	dw SongHeader_TrainerBattle
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
	dw Song_712f4_Ch0
	dw Song_712f4_Ch1
	dw Song_712f4_Ch2
	dw Song_712f4_Ch3

SongHeader_712fd: ; 712fd
	db %1111
	dw Song_712fd_Ch0
	dw Song_712fd_Ch1
	dw Song_712fd_Ch2
	dw Song_712fd_Ch3

SongHeader_71306: ; 71306
	db %1111
	dw Song_71306_Ch0
	dw Song_71306_Ch1
	dw Song_71306_Ch2
	dw Song_71306_Ch3

SongHeader_7130f: ; 7130f
	db %1111
	dw Song_7130f_Ch0
	dw Song_7130f_Ch1
	dw Song_7130f_Ch2
	dw Song_7130f_Ch3

SongHeader_TrainerVictory: ; 71318
	db %1111
	dw Song_TrainerVictory_Ch0
	dw Song_TrainerVictory_Ch1
	dw Song_TrainerVictory_Ch2
	dw Song_TrainerVictory_Ch3

SongHeader_TrainerBattle: ; 71321
	db %1111
	dw Song_TrainerBattle_Ch0
	dw Song_TrainerBattle_Ch1
	dw Song_TrainerBattle_Ch2
	dw Song_TrainerBattle_Ch3

SongHeader_7132a: ; 7132a
	db %1111
	dw Song_7132a_Ch0
	dw Song_7132a_Ch1
	dw Song_7132a_Ch2
	dw Song_7132a_Ch3

SongHeader_71333: ; 71333
	db %1111
	dw Song_71333_Ch0
	dw Song_71333_Ch1
	dw Song_71333_Ch2
	dw Song_71333_Ch3

SongHeader_7133c: ; 7133c
	db %1111
	dw Song_7133c_Ch0
	dw Song_7133c_Ch1
	dw Song_7133c_Ch2
	dw Song_7133c_Ch3

SongHeader_71345: ; 71345
	db %1111
	dw Song_71345_Ch0
	dw Song_71345_Ch1
	dw Song_71345_Ch2
	dw Song_71345_Ch3

	ds $36

SongHeader_71384: ; 71384
	db %1111
	dw Song_71384_Ch0
	dw Song_71384_Ch1
	dw Song_71384_Ch2
	dw Song_71384_Ch3

SongHeader_7138d: ; 7138d
	db %1111
	dw Song_7138d_Ch0
	dw Song_7138d_Ch1
	dw Song_7138d_Ch2
	dw Song_7138d_Ch3

SongHeader_71396: ; 71396
	db %1111
	dw Song_71396_Ch0
	dw Song_71396_Ch1
	dw Song_71396_Ch2
	dw Song_71396_Ch3

SongHeader_7139f: ; 7139f
	db %1111
	dw Song_7139f_Ch0
	dw Song_7139f_Ch1
	dw Song_7139f_Ch2
	dw Song_7139f_Ch3

SongHeader_713a8: ; 713a8
	db %1111
	dw Song_713a8_Ch0
	dw Song_713a8_Ch1
	dw Song_713a8_Ch2
	dw Song_713a8_Ch3

SongHeader_713b1: ; 713b1
	db %1111
	dw Song_713b1_Ch0
	dw Song_713b1_Ch1
	dw Song_713b1_Ch2
	dw Song_713b1_Ch3

SongHeader_713ba: ; 713ba
	db %1111
	dw Song_713ba_Ch0
	dw Song_713ba_Ch1
	dw Song_713ba_Ch2
	dw Song_713ba_Ch3

SongHeader_713c3: ; 713c3
	db %1111
	dw Song_713c3_Ch0
	dw Song_713c3_Ch1
	dw Song_713c3_Ch2
	dw Song_713c3_Ch3

SongHeader_713cc: ; 713cc
	db %1111
	dw Song_713cc_Ch0
	dw Song_713cc_Ch1
	dw Song_713cc_Ch2
	dw Song_713cc_Ch3

	ds $12

SongHeader_713e7: ; 713e7
	db %1111
	dw Song_713e7_Ch0
	dw Song_713e7_Ch1
	dw Song_713e7_Ch2
	dw Song_713e7_Ch3

Song_712f4_Ch0: ; 713f0
	tempo $5
	set_nrx1 $c0
	set_background_nrx2 $88
	dutycycle $11
	set_c153c157 $1
	set_c15f $1
	octave 4
	setloop $2
Music_713ff:
	tempo $a
	set_background_nrx2 $88
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	set_background_nrx2 $88
	note B_, 1
	set_background_nrx2 $28
	note B_, 1
	set_background_nrx2 $88
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	note A_, 1
	note G_, 1
	octave_down
	octave_down
	tempo $5
	note A_, 1
	set_background_nrx2 $38
	note A_, 1
	octave_up
	octave_up
	set_background_nrx2 $88
	note E_, 2
	octave_down
	octave_down
	note G_, 1
	set_background_nrx2 $38
	note G_, 1
	octave_up
	octave_up
	set_background_nrx2 $88
	note A_, 6
	octave_down
	note E_, 1
	set_background_nrx2 $38
	note E_, 1
	set_background_nrx2 $88
	note F#, 1
	note F#, 1
	octave_up
	note A_, 3
	set_background_nrx2 $38
	note A_, 1
	set_background_nrx2 $88
	note A_, 3
	set_background_nrx2 $38
	note A_, 1
	set_background_nrx2 $88
	note G_, 3
	set_background_nrx2 $38
	note G_, 1
	set_background_nrx2 $88
	note G_, 2
	note E_, 2
	octave_down
	note F_, 1
	note D_, 1
	octave_up
	note D_, 2
	note C_, 2
	note E_, 6
	octave_down
	note D_, 1
	set_background_nrx2 $38
	note D_, 1
	set_background_nrx2 $88
	note E_, 1
	note E_, 1
	octave_up
	doloop
	set_background_nrx2 $38
	octave_down
	note E_, 1
	set_background_nrx2 $88
	note D_, 1
	note E_, 1
	set_background_nrx2 $38
	note E_, 1
	octave_up
	set_background_nrx2 $88
	note C_, 2
	note D_, 2
	note E_, 4
	octave_down
	octave_down
	note A_, 1
	note A_, 1
	octave_up
	octave_up
	note E_, 6
	octave_down
	note C_, 1
	note C_, 1
	octave_up
	tempo $14
	note F_, 1
	note A_, 1
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	tempo $5
	note B_, 8
	mute_channel
	note B_, 7
	set_background_nrx2 $38
	note B_, 1
	octave_down
	tempo $a
	set_background_nrx2 $88
	note D_, 2
	set_background_nrx2 $38
	note D_, 1
	set_background_nrx2 $88
	note G_, 1
	note D_, 1
	octave_down
	note G#, 1
	octave_up
	note G_, 1
	octave_up
	note C_, 1
	note D_, 1
	note E_, 2
	octave_down
	octave_down
	tempo $5
	note A_, 1
	note A_, 1
	octave_up
	octave_up
	note E_, 6
	octave_down
	note C_, 1
	note C_, 1
	octave_up
	tempo $14
	note F_, 1
	note A_, 1
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	tempo $a
	set_background_nrx2 $8f
	note B_, 5
	set_background_nrx2 $88
	note __, 1
	note G_, 1
	note G#, 1
	note A_, 9
	octave_down
	note E_, 2
	setloop $2
Music_714c2:
	set_background_nrx2 $28
	note E_, 1
	set_background_nrx2 $88
	note D_, 1
	doloop
	note F#, 1
	note D_, 1
	note G_, 2
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	octave_down
	note A_, 1
	octave_up
	note B_, 2
	octave_down
	note A_, 1
	octave_up
	octave_up
	note E_, 2
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	doinfloop

Song_712f4_Ch1: ; 714df
	tempo $5
	set_nrx1 $c0
	set_background_nrx2 $a7
	dutycycle $11
	set_c153c157 $2
	set_c15f $1
	octave 4
	tempo $a
	set_background_nrx2 $a7
	note C_, 1
	set_background_nrx2 $47
	note C_, 1
	set_background_nrx2 $a7
	note D_, 1
	set_background_nrx2 $47
	note D_, 1
	tempo $5
	set_background_nrx2 $a7
	callchannel Music_7156c
	tempo $a
	octave_up
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	tempo $5
	callchannel Music_7156c
	note __, 1
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note A_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	octave_down
	callchannel Music_715a4
	tempo $a
	note A#, 1
	note A_, 1
	note G#, 2
	note __, 1
	note G#, 1
	note E_, 1
	octave_up
	note G_, 1
	octave_down
	note G#, 1
	note E_, 1
	note G#, 1
	octave_down
	tempo $5
	callchannel Music_715a4
	tempo $a
	octave_up
	note D_, 1
	note D#, 1
	note E_, 2
	note C_, 1
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	note C_, 2
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	tempo $5
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	octave_down
	note G_, 2
	octave_up
	note D_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	octave_down
	note G_, 2
	octave_up
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave_down
	note G_, 2
	octave_up
	octave_up
	doinfloop

Music_7156c:
	octave 4
	note E_, 2
	note D_, 2
	note C_, 2
	octave_down
	note B_, 2
	note C_, 1
	note __, 1
	note A_, 2
	octave_down
	note B_, 1
	note __, 1
	octave_up
	octave_up
	note D_, 2
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note F#, 1
	octave_up
	note C_, 1
	note __, 1
	note D_, 1
	note D_, 1
	octave_up
	note D_, 3
	note __, 1
	note D_, 3
	note __, 1
	octave_down
	note B_, 3
	note __, 1
	note B_, 2
	note G_, 2
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	note F_, 2
	note E_, 2
	note G_, 2
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	note E_, 1
	note G_, 1
	note __, 1
	octave_up
	note C_, 1
	note C_, 1
	retchannel

Music_715a4:
	note G_, 1
	octave_up
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	note G_, 1
	note G_, 1
	octave_down
	note E_, 1
	octave_down
	note A_, 1
	note G_, 1
	octave_up
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	octave_down
	note A_, 1
	note D_, 1
	note C_, 1
	octave_up
	note F_, 1
	note D_, 1
	octave_down
	note A_, 1
	note D_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note F_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	octave_down
	note F_, 1
	octave_up
	note G_, 4
	note D_, 1
	note G_, 1
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note D_, 1
	note G_, 1
	note B_, 2
	retchannel

Song_712f4_Ch2: ; 715dc
	tempo $5
	noise $3
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 2
	note __, 8
	startinfloop
Music_715e9:
	tempo $5
	set_background_nrx2 $20
	callchannel Music_71647
	note B_, 2
	note G_, 2
	octave_up
	callchannel Music_71647
	octave_up
	note F#, 2
	note G#, 2
	callchannel Music_71678
	octave_up
	setloop $2
Music_715ff:
	note G_, 2
	note D_, 2
	doloop
	note G_, 2
	note F#, 2
	note F_, 2
	note E_, 4
	octave_down
	setloop $2
Music_71609:
	note B_, 2
	octave_up
	note B_, 2
	note E_, 2
	octave_down
	doloop
	note B_, 2
	octave_up
	callchannel Music_71678
	noise $8
	octave_down
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note __, 5
	octave_up
	noise $3
	tempo $a
	note A_, 3
	setloop $2
Music_7162b:
	setloop $2
Music_7162d:
	note __, 1
	note G_, 1
	doloop
	note B_, 1
	note G_, 1
	note A_, 2
	doloop
	note E_, 1
	note B_, 2
	note E_, 1
	octave_up
	note C_, 2
	octave_down
	note E_, 1
	octave_up
	note D_, 2
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	note G_, 1
	note A_, 1
	octave_up
	doinfloop

Music_71647:
	octave_down
	note A_, 2
	octave_up
	octave_up
	note A_, 1
	note E_, 1
	octave_down
	octave_down
	note A_, 2
	note G_, 2
	octave_up
	note A_, 2
	note G_, 2
	octave_down
	note A_, 2
	octave_up
	note D_, 3
	note __, 1
	note D_, 1
	note __, 1
	note D_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	octave_down
	note G_, 2
	octave_up
	note A_, 1
	note G_, 1
	octave_down
	note G_, 1
	note __, 1
	note G_, 2
	note B_, 2
	octave_up
	note D_, 3
	note __, 1
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 3
	note __, 1
	note E_, 2
	octave_down
	retchannel

Music_71678:
	tempo $a
	octave_down
	note A_, 1
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	note A_, 1
	note G_, 1
	note D_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	octave_up
	octave_down
	tempo $5
	retchannel

Song_712f4_Ch3: ; 71694
	tempo $5
	octave 1
	note __, 8
	startinfloop
Music_71699:
	setloop $7
Music_7169b:
	note C_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note D#, 1
	note C_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	doloop
	note C_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	note D_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note C_, 1
	note __, 3
	note F_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	setloop $2
Music_716cc:
	note C_, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	setloop $4
Music_716df:
	note D_, 1
	note E_, 1
	note D#, 1
	note F_, 1
	note C_, 1
	note __, 1
	doloop
	setloop $2
Music_716e8:
	note D_, 1
	note F_, 1
	note C_, 1
	note __, 1
	doloop
	doinfloop

Song_712fd_Ch0: ; 716ee
	tempo $6
	set_nrx1 $80
	set_background_nrx2 $98
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	key $3
	callchannel Music_717d0
	octave_down
	note B_, 3
	octave_up
	note C_, 3
	note D_, 8
	octave_down
	note G_, 2
	octave_up
	callchannel Music_717d0
	octave_down
	note B_, 3
	octave_up
	note C_, 3
	note D_, 6
	note C_, 2
	note D_, 2
	note E_, 1
	octave_down
	note D_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note D_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note E_, 2
	octave_down
	note C_, 1
	octave_up
	note F_, 2
	octave_down
	note E_, 1
	octave_up
	note E_, 2
	note D_, 4
	octave_down
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note E_, 4
	note F_, 1
	octave_down
	note C_, 1
	octave_up
	note F_, 1
	octave_down
	note E_, 1
	octave_up
	note F_, 1
	octave_down
	note C_, 1
	octave_up
	note F_, 1
	octave_down
	note E_, 1
	octave_up
	note F_, 2
	octave_down
	note E_, 1
	octave_up
	note G_, 2
	octave_down
	note C_, 1
	octave_up
	note F_, 2
	note E_, 4
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note D_, 4
	note E_, 1
	octave_down
	note D_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note D_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note E_, 2
	octave_down
	note C_, 1
	octave_up
	note F_, 2
	octave_down
	note E_, 1
	octave_up
	note E_, 2
	note D_, 4
	octave_down
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	note B_, 3
	octave_up
	note C_, 3
	note D_, 2
	note C_, 4
	set_background_nrx2 $48
	note C_, 2
	set_background_nrx2 $98
	note F_, 4
	set_background_nrx2 $48
	note F_, 2
	set_background_nrx2 $98
	note A_, 4
	octave_up
	note C_, 4
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 8
	octave_down
	octave_down
	note C_, 2
	octave_down
	note A_, 1
	octave_up
	note D_, 2
	octave_down
	note A_, 1
	octave_up
	note E_, 2
	note F_, 2
	octave_down
	note B_, 1
	octave_up
	note G_, 2
	octave_down
	note B_, 1
	octave_up
	note A_, 1
	note D_, 1
	octave_up
	doinfloop

Music_717d0:
	octave 4
	set_background_nrx2 $98
	setloop $2
Music_717d5:
	note C_, 2
	note C_, 1
	note D_, 3
	note G_, 2
	note E_, 4
	set_background_nrx2 $48
	note E_, 2
	octave_down
	set_background_nrx2 $98
	note G_, 2
	octave_up
	doloop
	note C_, 2
	note C_, 1
	note D_, 3
	note G_, 2
	note E_, 4
	note D_, 2
	note D_, 4
	note D#, 1
	note D_, 1
	note C_, 8
	set_background_nrx2 $48
	note C_, 4
	octave_down
	set_background_nrx2 $98
	note G_, 4
	octave_up
	note D_, 2
	note C_, 2
	note C_, 3
	note D_, 3
	note E_, 2
	note E_, 6
	octave_down
	note A_, 2
	octave_up
	note C_, 6
	octave_down
	note A_, 1
	note B_, 1
	octave_up
	note C_, 4
	octave_down
	note A_, 2
	octave_up
	note C_, 4
	octave_down
	note A_, 2
	octave_up
	note D_, 2
	note C_, 2
	retchannel

Song_712fd_Ch1: ; 7180e
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $87
	dutycycle $11
	set_c153c157 $2
	set_c15f $0
	octave 4
	key $3
	set_background_nrx2 $87
	callchannel Music_718ac
	note G_, 2
	octave_down
	note F_, 1
	octave_up
	note A_, 2
	octave_down
	note E_, 1
	octave_up
	note B_, 1
	octave_down
	note D_, 1
	octave_up
	callchannel Music_718ac
	note G#, 2
	octave_down
	note G#, 1
	octave_up
	note A_, 2
	octave_down
	note E_, 1
	octave_up
	note B_, 1
	octave_down
	note D_, 1
	octave_down
	set_background_nrx2 $77
	callchannel Music_719a3
	note A_, 1
	octave_up
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D_, 1
	octave_up
	note C_, 1
	octave_down
	note D_, 1
	note C_, 1
	octave_down
	note A_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	callchannel Music_719a3
	octave_up
	note A_, 2
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 2
	octave_down
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 2
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note A_, 2
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	note B_, 1
	note G_, 1
	note B_, 2
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note A_, 2
	note F_, 1
	note B_, 2
	note F_, 1
	octave_up
	note C_, 2
	note D_, 2
	octave_down
	note G_, 1
	octave_up
	note E_, 2
	octave_down
	note G_, 1
	octave_up
	note F_, 1
	octave_down
	note B_, 1
	octave_up
	octave_up
	doinfloop

Music_718ac:
	octave 4
	note G_, 1
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	note G_, 1
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	note G_, 1
	octave_down
	note A#, 1
	note C_, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note A#, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note A#, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note A#, 1
	note C_, 1
	octave_up
	note G_, 1
	octave_down
	note A#, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note A#, 1
	octave_up
	note G_, 1
	octave_down
	note A_, 1
	note C_, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note A_, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note A_, 1
	note C_, 1
	octave_up
	note G_, 1
	octave_down
	note A_, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	note G#, 1
	octave_down
	note G#, 1
	note C_, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note G#, 1
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note C_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note C_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	note F_, 1
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	note G_, 1
	octave_down
	note G_, 1
	octave_up
	octave_up
	note C_, 2
	octave_down
	octave_down
	note F#, 1
	note D_, 1
	octave_up
	note C_, 1
	octave_down
	note D_, 1
	octave_up
	note F#, 2
	note A_, 2
	octave_down
	note F#, 1
	note D_, 1
	octave_up
	note C_, 1
	octave_down
	note D_, 1
	octave_up
	note F#, 1
	note G_, 1
	note A_, 2
	octave_down
	note C_, 1
	note F_, 1
	octave_up
	note F_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	octave_down
	note C_, 1
	note F_, 1
	octave_up
	note F_, 1
	octave_down
	note A_, 1
	octave_up
	note B_, 1
	octave_down
	note C_, 1
	octave_up
	note A_, 1
	octave_down
	note F_, 1
	octave_up
	note D_, 2
	octave_down
	note B_, 1
	octave_up
	note E_, 2
	octave_down
	note A_, 1
	octave_up
	note F_, 1
	octave_down
	note G_, 1
	octave_up
	retchannel

Music_719a3:
	note E_, 1
	note B_, 1
	octave_up
	note C_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave_down
	note A_, 1
	octave_up
	octave_up
	note E_, 1
	note G_, 1
	note E_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	note B_, 1
	note A_, 1
	note G_, 1
	note C_, 1
	octave_down
	note B_, 1
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	octave_down
	note B_, 1
	retchannel

Song_712fd_Ch2: ; 719d0
	tempo $6
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $7
	octave 2
	key $3
	noise $1
	set_background_nrx2 $20
	callchannel Music_71a37
	note D_, 3
	note G_, 3
	note B_, 2
	octave_up
	callchannel Music_71a37
	note E_, 3
	note B_, 3
	note G#, 2
	noise $8
	callchannel Music_71a82
	note E_, 3
	note B_, 3
	octave_up
	note G_, 2
	note G_, 2
	note E_, 2
	octave_down
	note B_, 2
	note G_, 2
	note D_, 3
	note A_, 3
	octave_up
	note F_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	octave_down
	note B_, 2
	note F_, 3
	octave_up
	note C_, 3
	note A_, 2
	octave_down
	note G_, 3
	octave_up
	note D_, 3
	note B_, 2
	octave_down
	callchannel Music_71a82
	note E_, 3
	note B_, 3
	octave_up
	note G_, 2
	note G_, 2
	note E_, 2
	octave_down
	note B_, 2
	octave_up
	note G_, 2
	note F_, 2
	note C_, 2
	octave_down
	note F_, 2
	octave_up
	note F_, 2
	note C_, 2
	octave_down
	note F_, 2
	octave_up
	note A_, 2
	note F_, 2
	octave_down
	note F_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 7
	note __, 1
	note F_, 3
	note G_, 3
	note A_, 2
	note B_, 3
	octave_up
	note C_, 3
	note D_, 2
	doinfloop

Music_71a37:
	octave 2
	note C_, 3
	octave_down
	note G_, 3
	octave_up
	note D_, 3
	octave_down
	note G_, 3
	octave_up
	note E_, 1
	note D_, 1
	note C_, 2
	octave_down
	note A#, 3
	note G_, 3
	octave_up
	note C_, 3
	octave_down
	note G_, 3
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	note A#, 2
	note A_, 3
	note F_, 3
	octave_up
	note C_, 3
	octave_down
	note F_, 3
	octave_up
	note E_, 1
	note D_, 1
	note C_, 2
	octave_down
	note G#, 3
	octave_up
	note C_, 3
	octave_down
	note F_, 3
	octave_up
	note D_, 3
	note D#, 1
	note D_, 1
	note C_, 1
	octave_down
	note G#, 1
	note G_, 4
	note E_, 2
	octave_up
	note C_, 3
	octave_down
	note E_, 3
	note G_, 2
	note E_, 2
	note F#, 3
	note A_, 3
	note D_, 2
	note D_, 3
	note F#, 3
	octave_up
	note D_, 2
	octave_down
	note F_, 3
	octave_up
	note C_, 3
	note G_, 2
	note F_, 3
	note C_, 3
	octave_down
	note F_, 2
	note G_, 3
	note A_, 3
	note B_, 2
	retchannel

Music_71a82:
	octave 1
	note A_, 3
	octave_up
	note E_, 3
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note B_, 2
	note A_, 2
	note E_, 2
	octave_down
	retchannel

Song_712fd_Ch3: ; 71a8f
	tempo $6
	octave 1
	setloop $f
Music_71a94:
	note C#, 1
	note C#, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note C#, 1
	note C#, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note E_, 1
	note D_, 1
	doloop
	setloop $2
Music_71aa7:
	note F_, 1
	note F#, 1
	note C#, 1
	note F_, 1
	note F#, 1
	note C#, 1
	note F_, 1
	note F#, 1
	doloop
	setloop $8
Music_71ab2:
	note C#, 1
	note C#, 1
	octave_up
	octave_up
	note C_, 1
	note C#, 1
	octave_down
	octave_down
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	octave_up
	octave_up
	note C_, 1
	note C#, 1
	octave_down
	octave_down
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 1
	doloop
	setloop $2
Music_71acd:
	note F_, 1
	note F#, 1
	note C#, 1
	note F_, 1
	note F#, 1
	note C#, 1
	note F_, 1
	note F#, 1
	doloop
	doinfloop

Song_71306_Ch0: ; 71ad7
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $88
	dutycycle $11
	set_c153c157 $6
	set_c15f $1
	octave 4
	set_background_nrx2 $88
	callchannel Music_71bd5
	set_background_nrx2 $28
	note A_, 2
	set_background_nrx2 $88
	callchannel Music_71bd5
	set_background_nrx2 $88
	note B_, 9
	set_background_nrx2 $28
	note B_, 1
	set_background_nrx2 $88
	callchannel Music_71be3
	note A_, 2
	note G#, 2
	note F#, 2
	note C#, 2
	set_background_nrx2 $28
	note C#, 1
	octave_down
	set_background_nrx2 $88
	note E_, 1
	set_background_nrx2 $28
	note E_, 2
	set_background_nrx2 $88
	note E_, 1
	note E_, 1
	set_background_nrx2 $28
	note E_, 1
	set_background_nrx2 $88
	note E_, 1
	set_background_nrx2 $28
	note E_, 2
	set_background_nrx2 $88
	note D_, 1
	set_background_nrx2 $28
	note D_, 1
	set_background_nrx2 $88
	note D_, 1
	note D_, 1
	set_background_nrx2 $28
	note D_, 1
	set_background_nrx2 $88
	note D_, 1
	set_background_nrx2 $28
	note D_, 1
	set_background_nrx2 $88
	note D_, 1
	set_background_nrx2 $28
	note D_, 2
	set_background_nrx2 $88
	note D_, 1
	note C#, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	octave_up
	callchannel Music_71be3
	setloop $2
Music_71b3e:
	callchannel Music_71c30
	note G#, 2
	note A_, 1
	note G#, 1
	note F#, 2
	octave_down
	octave_down
	note A_, 1
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	set_background_nrx2 $88
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	set_background_nrx2 $88
	note A_, 1
	set_background_nrx2 $28
	note A_, 2
	set_background_nrx2 $88
	note A_, 1
	note B_, 1
	octave_up
	octave_up
	setloop $2
Music_71b60:
	note F_, 2
	note F#, 2
	doloop
	octave_up
	note C#, 4
	octave_down
	note G#, 2
	set_background_nrx2 $28
	note G#, 2
	set_background_nrx2 $88
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	octave_up
	note C#, 6
	set_background_nrx2 $28
	note C#, 2
	octave_down
	set_background_nrx2 $88
	note G#, 2
	doloop
	callchannel Music_71c30
	note A_, 6
	octave_down
	octave_down
	note B_, 1
	note B_, 1
	setloop $2
Music_71b84:
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note B_, 1
	doloop
	octave_up
	octave_up
	note A_, 2
	note B_, 4
	callchannel Music_71c12
	note B_, 4
	octave_down
	note D_, 1
	note D_, 1
	setloop $2
Music_71b98:
	octave_up
	note B_, 1
	octave_down
	note D_, 1
	doloop
	octave_up
	note B_, 2
	octave_up
	note C#, 4
	note D_, 1
	octave_down
	octave_down
	note F#, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note D_, 2
	note E_, 4
	note D_, 2
	note C#, 4
	octave_down
	octave_down
	note C#, 1
	note C#, 1
	setloop $2
Music_71bc3:
	octave_up
	note A_, 1
	octave_down
	note C#, 1
	doloop
	octave_up
	note A_, 2
	note B_, 4
	callchannel Music_71c12
	note B_, 4
	note __, 2
	note G#, 2
	note G#, 3
	note A_, 3
	note B_, 2
	doinfloop

Music_71bd5:
	set_background_nrx2 $88
	note B_, 2
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	set_background_nrx2 $88
	note A_, 5
	set_background_nrx2 $28
	note A_, 1
	retchannel

Music_71be3:
	setloop $3
Music_71be5:
	set_background_nrx2 $88
	note E_, 1
	set_background_nrx2 $28
	note E_, 1
	doloop
	set_background_nrx2 $88
	note E_, 1
	octave_down
	note C#, 1
	set_background_nrx2 $28
	note C#, 1
	set_background_nrx2 $88
	note C#, 1
	set_background_nrx2 $28
	note C#, 2
	set_background_nrx2 $88
	note C#, 1
	note C#, 1
	set_background_nrx2 $28
	note C#, 1
	set_background_nrx2 $88
	note C#, 1
	octave_up
	note F#, 1
	set_background_nrx2 $28
	note C#, 1
	set_background_nrx2 $88
	note F#, 4
	note F_, 4
	note F#, 2
	note G#, 2
	note A_, 2
	mute_channel
	retchannel

Music_71c12:
	octave_up
	note C#, 1
	octave_down
	octave_down
	note E_, 1
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	note F#, 1
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note C#, 2
	note D_, 4
	note C#, 2
	octave_down
	retchannel

Music_71c30:
	note A_, 2
	note G#, 2
	note F#, 2
	octave_up
	note C#, 4
	octave_down
	note G#, 4
	retchannel

Song_71306_Ch1: ; 71c38
	tempo $7
	set_nrx1 $80
	set_background_nrx2 $97
	dutycycle $11
	set_c153c157 $11
	set_c15f $6
	octave 3
	note F#, 2
	note A_, 2
	octave_up
	note D_, 2
	octave_down
	note E_, 4
	octave_up
	note C#, 2
	octave_down
	note D_, 2
	note B_, 2
	note C#, 1
	note A_, 1
	note C#, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	callchannel Music_71cc4
	callchannel Music_71d11
	callchannel Music_71d01
	octave_down
	callchannel Music_71cc4
	set_c153c157 $1
	octave_up
	note F#, 1
	octave_down
	note C#, 1
	octave_up
	note F_, 1
	octave_down
	note C#, 1
	octave_up
	note C#, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C#, 1
	note F#, 1
	note A_, 1
	octave_up
	note C#, 1
	note E_, 1
	note G#, 1
	note A_, 1
	octave_up
	note C#, 1
	octave_down
	set_c153c157 $11
	setloop $2
Music_71c8a:
	callchannel Music_71ce2
	octave_down
	setloop $3
Music_71c90:
	callchannel Music_71cf2
	doloop
	octave_up
	octave_up
	doloop
	octave_down
	callchannel Music_71d01
	callchannel Music_71d1e
	callchannel Music_71d01
	octave_down
	note F#, 2
	note A_, 1
	note F#, 1
	note A_, 2
	octave_up
	note E_, 1
	note C#, 1
	note D_, 2
	note C#, 2
	octave_down
	note B_, 2
	note A_, 2
	callchannel Music_71d11
	octave_up
	callchannel Music_71d1e
	octave_up
	note B_, 1
	note G#, 1
	note E_, 1
	octave_down
	note B_, 1
	note G#, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 2
	note E_, 3
	note F#, 3
	note G#, 2
	doinfloop

Music_71cc4:
	note __, 4
	note C#, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 2
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 4
	octave_down
	note G#, 1
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	note __, 1
	octave_up
	note F_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note F_, 1
	retchannel

Music_71ce2:
	note F#, 1
	note E_, 1
	note D#, 2
	octave_down
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 2
	note D#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	retchannel

Music_71cf2:
	note F#, 2
	octave_up
	note C#, 1
	octave_down
	note A_, 1
	octave_up
	note F#, 2
	octave_down
	note F_, 4
	octave_up
	note C#, 2
	note G#, 2
	octave_down
	note F_, 2
	retchannel

Music_71d01:
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 2
	note G#, 1
	note D_, 1
	note B_, 1
	octave_up
	note D_, 1
	retchannel

Music_71d11:
	note __, 4
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 2
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	retchannel

Music_71d1e:
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave_down
	note A_, 1
	note __, 1
	note E_, 1
	note __, 2
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	retchannel

Song_71306_Ch2: ; 71d2f
	tempo $7
	noise $2
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $7
	octave 2
	set_background_nrx2 $20
	note D_, 2
	octave_up
	note D_, 1
	octave_down
	note F#, 1
	octave_up
	note D_, 2
	octave_down
	note C#, 2
	octave_up
	note E_, 1
	octave_down
	note A_, 1
	octave_up
	note E_, 2
	octave_down
	octave_down
	note B_, 2
	octave_up
	octave_up
	note D_, 1
	octave_down
	note G#, 1
	octave_down
	note A_, 2
	octave_up
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	note D_, 1
	note C#, 1
	octave_down
	note B_, 1
	callchannel Music_71dc2
	callchannel Music_71dd2
	callchannel Music_71de4
	octave_up
	note C#, 2
	note F#, 2
	note F_, 2
	callchannel Music_71df1
	callchannel Music_71dc2
	callchannel Music_71dd2
	callchannel Music_71de4
	octave_up
	note E_, 2
	note D#, 2
	note C#, 2
	octave_down
	setloop $2
Music_71d82:
	note B_, 1
	octave_up
	note B_, 1
	octave_down
	note B_, 2
	note D#, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F_, 2
	note F#, 2
	octave_up
	note B_, 2
	octave_down
	setloop $3
Music_71d93:
	callchannel Music_71e00
	doloop
	doloop
	octave_up
	callchannel Music_71df1
	callchannel Music_71dc2
	octave_up
	callchannel Music_71df1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note D_, 2
	note F#, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note G#, 2
	note A_, 2
	note D_, 2
	callchannel Music_71de4
	octave_up
	note C#, 2
	note E_, 2
	octave_down
	note E_, 2
	callchannel Music_71dc2
	octave_up
	callchannel Music_71df1
	octave_up
	doinfloop

Music_71dc2:
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note A_, 2
	octave_up
	note C#, 2
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D#, 2
	note E_, 2
	octave_down
	note A_, 2
	retchannel

Music_71dd2:
	note G#, 1
	octave_up
	note G#, 1
	octave_down
	note G#, 2
	octave_up
	note D_, 2
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	octave_down
	note G#, 2
	octave_up
	note C#, 2
	octave_down
	note F_, 2
	retchannel

Music_71de4:
	note F#, 1
	octave_up
	note F#, 1
	octave_down
	note F#, 2
	octave_up
	note C#, 2
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	octave_down
	retchannel

Music_71df1:
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 2
	octave_down
	note G#, 2
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note A#, 2
	note B_, 2
	note E_, 2
	retchannel

Music_71e00:
	note D_, 2
	octave_up
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note D_, 2
	octave_down
	note C#, 4
	note G#, 2
	octave_up
	note F_, 2
	octave_down
	note C#, 2
	retchannel

Song_71306_Ch3: ; 71e0f
	tempo $7
	octave 1
	setloop $2
Music_71e14:
	callchannel Music_71e4f
	doloop
	note C_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	callchannel Music_71e4f
	note D_, 1
	note A_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note F_, 1
	note F_, 1
	setloop $8
Music_71e2b:
	callchannel Music_71e56
	doloop
	callchannel Music_71e66
	callchannel Music_71e56
	callchannel Music_71e66
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	note F_, 1
	setloop $6
Music_71e4a:
	callchannel Music_71e56
	doloop
	doinfloop

Music_71e4f:
	note C_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note __, 1
	retchannel

Music_71e56:
	note C_, 1
	note G_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note A_, 2
	retchannel

Music_71e66:
	setloop $3
Music_71e68:
	note D_, 1
	note C_, 1
	note F#, 1
	note C#, 1
	setloop $2
Music_71e6e:
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	note D_, 1
	note G_, 1
	note A_, 2
	doloop
	retchannel

Song_7130f_Ch0: ; 71e78
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $a8
	dutycycle $11
	set_c153c157 $7
	set_c15f $1
	octave 3
	key $2
	callchannel Music_71f0c
	octave_up
	octave_up
	startinfloop
Music_71e8d:
	key $2
	note C_, 2
	octave_down
	octave_down
	octave_down
	note G_, 1
	set_background_nrx2 $18
	note G_, 1
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $18
	note G_, 2
	set_background_nrx2 $a8
	note A#, 1
	set_background_nrx2 $18
	note A#, 1
	set_background_nrx2 $a8
	note A#, 1
	set_background_nrx2 $18
	note A#, 2
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $18
	note G_, 2
	set_background_nrx2 $a8
	note G_, 1
	octave_down
	tempo $3
	setloop $2
Music_71eb7:
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	note D#, 1
	note F_, 1
	doloop
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	tempo $18
	octave_down
	octave_down
	octave_down
	note C_, 3
	note D_, 1
	note D#, 2
	note F_, 1
	note G_, 1
	note G#, 4
	note F#, 2
	note G#, 1
	note A#, 1
	octave_up
	note C_, 4
	octave_down
	note G_, 2
	octave_up
	note C_, 1
	note E_, 1
	note D#, 4
	tempo $6
	octave_down
	note A#, 8
	note G#, 3
	note A#, 3
	note G#, 2
	key $ff
	callchannel Music_71f0c
	key $2
	callchannel Music_71f0c
	key $5
	octave_up
	note F_, 7
	note __, 1
	note F_, 3
	note E_, 3
	note F_, 2
	note G_, 8
	note C_, 3
	octave_down
	note B_, 3
	octave_up
	note C_, 2
	note A_, 8
	octave_up
	note C_, 8
	note E_, 8
	octave_down
	note B_, 8
	octave_up
	doinfloop

Music_71f0c:
	setloop $2
Music_71f0e:
	set_background_nrx2 $a8
	note A#, 3
	octave_up
	note A#, 2
	set_background_nrx2 $38
	note A#, 3
	octave_down
	set_background_nrx2 $a8
	note A#, 2
	octave_up
	note A#, 2
	octave_down
	note B_, 2
	octave_up
	note B_, 2
	octave_down
	doloop
	retchannel

Song_7130f_Ch1: ; 71f23
	tempo $3
	set_nrx1 $c0
	set_background_nrx2 $76
	dutycycle $11
	set_c153c157 $8
	set_c15f $1
	octave 2
	key $2
	setloop $2
Music_71f34:
	key $ff
	callchannel Music_71ff8
	key $2
	callchannel Music_7200e
	doloop
	startinfloop
Music_71f40:
	tempo $6
	key $2
	setloop $4
Music_71f46:
	callchannel Music_71fe0
	doloop
	key $6
	setloop $3
Music_71f4e:
	keyrel $ff
	callchannel Music_71fe0
	callchannel Music_71fe0
	doloop
	tempo $3
	setloop $2
Music_71f5b:
	key $2
	callchannel Music_71ff8
	callchannel Music_7200e
	doloop
	setloop $2
Music_71f66:
	key $ff
	callchannel Music_71ff8
	key $2
	callchannel Music_7200e
	doloop
	key $5
	octave_up
	octave_up
	note A_, 2
	note E_, 2
	octave_down
	note C_, 2
	octave_down
	note A_, 2
	setloop $2
Music_71f7d:
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	doloop
	note C_, 1
	note F_, 1
	note A_, 4
	octave_down
	note A_, 2
	octave_up
	note G_, 4
	octave_down
	note F_, 2
	octave_up
	note A_, 4
	setloop $2
Music_71f8f:
	note C_, 2
	octave_down
	note G_, 2
	doloop
	setloop $2
Music_71f95:
	note C_, 1
	note E_, 1
	note G_, 1
	octave_up
	doloop
	note C_, 1
	note E_, 1
	note G_, 4
	note C_, 2
	octave_up
	note C_, 4
	octave_down
	octave_down
	note G_, 2
	octave_up
	note E_, 4
	octave_down
	note F_, 4
	note C_, 2
	octave_up
	note F_, 4
	note C_, 2
	octave_down
	note A_, 1
	note F_, 1
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 4
	octave_up
	note C_, 2
	note A_, 4
	octave_down
	note A_, 2
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note F_, 1
	note C_, 4
	octave_down
	note D_, 2
	octave_up
	octave_up
	note C_, 4
	octave_down
	octave_down
	octave_down
	note B_, 2
	octave_up
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_up
	note G_, 4
	octave_down
	octave_down
	note B_, 2
	octave_up
	octave_up
	octave_up
	note G_, 4
	octave_down
	octave_down
	note D_, 2
	octave_up
	note D_, 2
	octave_down
	note G_, 2
	octave_down
	doinfloop

Music_71fe0:
	set_background_nrx2 $76
	note G_, 2
	note A#, 1
	note D#, 1
	note A#, 1
	note G_, 1
	note F_, 1
	octave_up
	note C_, 1
	set_background_nrx2 $36
	note C_, 1
	set_background_nrx2 $76
	note C_, 1
	octave_down
	note G_, 1
	note D#, 1
	note A#, 1
	note F_, 1
	note G_, 1
	note A#, 1
	retchannel

Music_71ff8:
	set_background_nrx2 $76
	setloop $2
Music_71ffc:
	note E_, 1
	note G#, 1
	octave_up
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note G#, 1
	octave_up
	note G#, 4
	set_background_nrx2 $36
	note G#, 2
	octave_down
	doloop
	set_background_nrx2 $76
	retchannel

Music_7200e:
	octave_up
	note D_, 2
	note G#, 2
	note D#, 2
	note A_, 2
	octave_down
	retchannel

Song_7130f_Ch2: ; 72015
	tempo $6
	noise $c
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $2
	set_background_nrx2 $20
	callchannel Music_720ac
	startinfloop
Music_72028:
	set_c13f $7
	key $2
	setloop $4
Music_7202e:
	callchannel Music_7208c
	doloop
	setloop $2
Music_72034:
	key $5
	callchannel Music_7208c
	doloop
	setloop $2
Music_7203c:
	key $4
	callchannel Music_7208c
	doloop
	setloop $2
Music_72044:
	key $3
	callchannel Music_7208c
	doloop
	key $5
	callchannel Music_720ac
	key $2
	set_c13f $8
	callchannel Music_720ac
	key $5
	note D_, 2
	octave_up
	note F_, 1
	octave_down
	note A_, 3
	octave_up
	note F_, 4
	octave_up
	note C_, 1
	octave_down
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	octave_down
	note D_, 2
	note E_, 2
	octave_up
	octave_up
	note C_, 1
	octave_down
	note C_, 3
	note G_, 4
	octave_up
	note E_, 1
	octave_down
	note C_, 2
	octave_up
	note C_, 1
	octave_down
	octave_down
	note E_, 2
	note F_, 2
	octave_up
	octave_up
	note C_, 1
	octave_down
	note C_, 3
	note A_, 4
	octave_up
	note E_, 1
	octave_down
	note C_, 2
	octave_up
	note C_, 1
	octave_down
	octave_down
	note F_, 2
	callchannel Music_720c4
	doinfloop

Music_7208c:
	note C_, 2
	octave_up
	note D#, 1
	octave_down
	note G_, 1
	octave_up
	note D#, 1
	octave_down
	octave_down
	note A#, 2
	octave_up
	octave_up
	note F_, 1
	octave_down
	note C_, 1
	octave_up
	note F_, 1
	octave_down
	note G_, 1
	octave_down
	note A#, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	octave_down
	note A#, 2
	octave_up
	octave_up
	note D#, 1
	octave_down
	retchannel

Music_720ac:
	setloop $2
Music_720ae:
	set_background_nrx2 $20
	note C#, 2
	set_background_nrx2 $40
	note __, 1
	set_background_nrx2 $20
	note B_, 2
	set_background_nrx2 $40
	note __, 3
	set_background_nrx2 $20
	note C#, 2
	note B_, 2
	note D_, 2
	octave_up
	note C_, 2
	octave_down
	doloop
	retchannel

Music_720c4:
	note G_, 2
	octave_up
	note B_, 1
	octave_down
	note D_, 2
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G_, 2
	note G_, 2
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 2
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note B_, 1
	octave_down
	retchannel

Song_7130f_Ch3: ; 720e0
	tempo $3
	octave 1
	callchannel Music_7210b
	startinfloop
Music_720e7:
	setloop $a
Music_720e9:
	callchannel Music_720fa
	doloop
	setloop $2
Music_720ef:
	callchannel Music_7210b
	doloop
	setloop $4
Music_720f5:
	callchannel Music_720fa
	doloop
	doinfloop

Music_720fa:
	note C_, 2
	note G_, 2
	note C_, 2
	note C#, 2
	note D_, 2
	note G#, 2
	note G_, 2
	note C#, 2
	note G#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note G_, 2
	note A_, 2
	retchannel

Music_7210b:
	setloop $2
Music_7210d:
	setloop $6
Music_7210f:
	note C#, 1
	doloop
	note F_, 2
	tempo $3
	note __, 4
	note G#, 1
	note G#, 1
	note G_, 1
	note F#, 1
	tempo $3
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note F_, 2
	setloop $2
Music_72122:
	note F#, 1
	doloop
	setloop $2
Music_72126:
	note C#, 2
	note F_, 2
	doloop
	doloop
	retchannel

Song_TrainerVictory_Ch0: ; 7212b
	tempo $6
	set_nrx1 $80
	set_background_nrx2 $a8
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	note A_, 3
	octave_up
	note C#, 3
	tempo $c
	note E_, 1
	note G_, 2
	tempo $6
	note F#, 1
	note __, 1
	note F#, 4
	note D_, 2
	note E_, 2
	note F#, 1
	note __, 1
	note F#, 4
	note E_, 1
	note __, 1
	note A_, 6
	note C#, 4
	note E_, 4
	note D_, 2
	note F#, 6
	octave_down
	note B_, 4
	octave_up
	note C#, 4
	note D_, 2
	note C#, 4
	octave_down
	note B_, 2
	note A_, 2
	note B_, 6
	note __, 2
	note B_, 1
	note __, 1
	note B_, 3
	octave_up
	note C#, 3
	note D_, 2
	octave_down
	note A_, 2
	octave_up
	note E_, 2
	note F#, 2
	note D_, 5
	note __, 1
	octave_down
	note B_, 2
	octave_up
	note C#, 2
	note D_, 3
	note __, 1
	note D_, 1
	note __, 1
	note D_, 4
	note E_, 4
	note D_, 4
	note C#, 1
	note __, 1
	note C#, 2
	note __, 2
	doinfloop

Song_TrainerVictory_Ch1: ; 72178
	tempo $6
	set_nrx1 $c0
	set_background_nrx2 $75
	dutycycle $11
	set_c153c157 $1
	set_c15f $0
	octave 3
	note E_, 2
	note C#, 1
	note A_, 2
	note E_, 1
	octave_up
	note C#, 1
	octave_down
	note G_, 1
	octave_up
	note A_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note D_, 1
	octave_down
	note A_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave_up
	note C#, 1
	note D_, 1
	note E_, 1
	note A_, 1
	callchannel Music_72203
	note A_, 1
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	note F#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	octave_down
	note B_, 1
	note A_, 1
	note F#, 1
	note C#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave_up
	note C#, 1
	note A_, 1
	callchannel Music_72203
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	note D_, 1
	note G_, 2
	note G_, 2
	note D_, 1
	note A_, 2
	note F#, 1
	note B_, 1
	note G_, 1
	note F#, 1
	note C#, 1
	note A_, 1
	note E_, 1
	octave_up
	note C#, 1
	octave_down
	note F#, 1
	octave_up
	note A_, 3
	note D_, 1
	note G_, 1
	note C#, 1
	note F#, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	note A_, 1
	octave_up
	note D_, 1
	octave_down
	note A#, 1
	note F_, 1
	note A#, 1
	octave_up
	note C_, 1
	note F_, 1
	note D_, 1
	octave_down
	note A#, 1
	octave_up
	note C_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave_up
	note C_, 1
	octave_down
	note A#, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave_down
	note A_, 1
	octave_up
	note C#, 1
	octave_down
	note A_, 1
	doinfloop

Music_72203:
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave_down
	note A_, 1
	octave_up
	note C#, 1
	octave_down
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	octave_up
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	retchannel

Song_TrainerVictory_Ch2: ; 72218
	tempo $6
	noise $3
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $8
	octave 1
	set_background_nrx2 $20
	note A_, 2
	octave_up
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	octave_down
	note B_, 2
	octave_up
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note C#, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note D_, 2
	octave_up
	octave_up
	note F#, 1
	octave_down
	octave_down
	note A_, 3
	octave_up
	note D_, 2
	octave_down
	note D_, 1
	octave_up
	note F#, 1
	note D_, 2
	octave_down
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note F#, 2
	note C#, 2
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note E_, 3
	octave_up
	note C#, 2
	octave_down
	note A_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note C#, 2
	octave_down
	note E_, 1
	octave_up
	note A_, 1
	octave_down
	note C#, 2
	octave_down
	note B_, 2
	octave_up
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note F#, 3
	note B_, 2
	note F#, 2
	octave_up
	note F#, 1
	octave_down
	note B_, 3
	octave_down
	note B_, 2
	octave_up
	note F#, 2
	note C#, 2
	octave_up
	note C#, 2
	octave_down
	note F#, 3
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note F#, 2
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note D_, 2
	note G_, 2
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note D_, 3
	note B_, 2
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note D_, 2
	note G_, 1
	octave_up
	note G_, 1
	octave_down
	note E_, 2
	note F#, 1
	octave_up
	note A_, 1
	octave_down
	octave_down
	note A_, 2
	note A#, 2
	note B_, 3
	octave_up
	octave_up
	note A_, 1
	octave_down
	note C#, 2
	note D_, 2
	note F#, 2
	octave_down
	note A#, 2
	octave_up
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note F_, 3
	octave_up
	note D_, 2
	octave_down
	note F_, 2
	octave_up
	octave_up
	note F_, 1
	octave_down
	note D_, 3
	octave_down
	octave_down
	note A#, 2
	note A_, 2
	octave_up
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	note E_, 3
	octave_down
	note A_, 2
	doinfloop

Song_TrainerVictory_Ch3: ; 722c8
	tempo $6
	octave 1
	callchannel Music_72304
	setloop $3
Music_722d0:
	callchannel Music_722f2
	callchannel Music_722ea
	doloop
	callchannel Music_722f2
	callchannel Music_722fb
	setloop $3
Music_722df:
	callchannel Music_722f2
	callchannel Music_722ea
	doloop
	callchannel Music_722f2
	doinfloop

Music_722ea:
	note G_, 1
	note D#, 1
	note A_, 2
	note D_, 1
	note __, 1
	note C_, 1
	note G#, 1
	retchannel

Music_722f2:
	note C_, 1
	note __, 1
	note G_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	retchannel

Music_722fb:
	note G_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	retchannel

Music_72304:
	note F_, 1
	note C_, 1
	note F#, 1
	note F_, 1
	note C_, 1
	note F#, 1
	note D#, 1
	note D_, 1
	retchannel

Song_TrainerBattle_Ch0: ; 7230d
	tempo $3
	set_nrx1 $40
	set_background_nrx2 $a6
	dutycycle $11
	set_c153c157 $a
	set_c15f $1
	octave 2
	setloop $2
Music_7231c:
	key $0
	callchannel Music_72335
	doloop
	key $1
	callchannel Music_72335
	key $0
	callchannel Music_72335
	callchannel Music_7236f
	key $1
	callchannel Music_7236f
	doinfloop

Music_72335:
	set_background_nrx2 $a6
	note G_, 8
	note F_, 4
	note A#, 4
	set_background_nrx2 $46
	note A#, 4
	set_background_nrx2 $a6
	note E_, 1
	note F_, 1
	note A#, 1
	octave_up
	note D_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	octave_up
	note F_, 8
	note G_, 4
	note F_, 1
	note G_, 1
	note F_, 2
	note D_, 4
	note C_, 8
	octave_down
	note B_, 2
	octave_up
	note C_, 2
	octave_down
	note G_, 8
	note F_, 1
	note C_, 1
	octave_down
	note A_, 1
	note F_, 1
	note D_, 1
	octave_down
	note A#, 1
	note F_, 1
	note D_, 1
	octave_up
	note C_, 4
	set_background_nrx2 $46
	note C_, 4
	octave_down
	set_background_nrx2 $a6
	note A_, 4
	note A#, 4
	octave_up
	note A_, 4
	octave_down
	retchannel

Music_7236f:
	set_background_nrx2 $a6
	note F_, 1
	note F#, 1
	octave_up
	note C_, 1
	note D_, 1
	note F_, 4
	set_background_nrx2 $46
	note F_, 4
	set_background_nrx2 $a6
	note F#, 4
	note F_, 4
	set_background_nrx2 $56
	note F_, 8
	octave_down
	set_background_nrx2 $a6
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	note F#, 1
	octave_up
	note C_, 1
	note D_, 1
	octave_up
	note F_, 4
	set_background_nrx2 $46
	note F_, 4
	set_background_nrx2 $a6
	note G#, 8
	octave_down
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 4
	note E_, 4
	octave_down
	retchannel

Song_TrainerBattle_Ch1: ; 723b1
	tempo $3
	set_nrx1 $c0
	set_background_nrx2 $a7
	dutycycle $11
	set_c153c157 $a
	set_c15f $1
	octave 2
	setloop $2
Music_723c0:
	key $0
	callchannel Music_723d9
	doloop
	key $1
	callchannel Music_723d9
	key $0
	callchannel Music_723d9
	callchannel Music_7242d
	key $1
	callchannel Music_7242d
	doinfloop

Music_723d9:
	set_c15f $1
	set_background_nrx2 $a7
	note D_, 8
	note G_, 4
	octave_up
	note D_, 4
	octave_up
	set_c15f $0
	note G_, 1
	note A_, 1
	note A#, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	set_c15f $1
	note G_, 4
	set_background_nrx2 $47
	note G_, 4
	octave_up
	set_background_nrx2 $a7
	note A#, 8
	octave_up
	note C_, 4
	octave_down
	note A#, 1
	octave_up
	note C_, 1
	octave_down
	note A#, 2
	note G_, 4
	note F_, 8
	note E_, 2
	note F_, 2
	note C_, 4
	set_c15f $0
	octave_up
	note G_, 1
	note A_, 1
	note A#, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	octave_down
	set_c15f $1
	note G_, 4
	set_background_nrx2 $47
	note G_, 4
	octave_up
	set_background_nrx2 $a7
	note C_, 4
	set_c15f $0
	octave_up
	octave_up
	note G_, 1
	note A_, 1
	note A#, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	octave_down
	set_c15f $1
	note A#, 4
	octave_up
	note D_, 4
	note F_, 4
	retchannel

Music_7242d:
	set_background_nrx2 $a7
	note D_, 1
	note G_, 1
	note A_, 1
	octave_up
	note D_, 1
	note F#, 4
	set_background_nrx2 $47
	note F#, 4
	set_background_nrx2 $a7
	note G_, 4
	note F#, 4
	set_background_nrx2 $47
	note F#, 4
	note __, 4
	octave_down
	set_background_nrx2 $a7
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note D_, 1
	note G_, 1
	note A_, 1
	octave_up
	note D_, 1
	octave_up
	note F#, 4
	set_background_nrx2 $47
	note F#, 4
	set_background_nrx2 $a7
	note A_, 8
	octave_down
	note C_, 4
	octave_down
	note B_, 4
	octave_up
	note C_, 4
	octave_down
	note G_, 4
	note B_, 4
	retchannel
	setloop $3
Music_72468:
	octave_down
	note D_, 1
	note F#, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_up
	doloop
	octave_down
	note E_, 2
	note G_, 2
	octave_down
	note A_, 16
	note __, 8
	note C_, 8
	note __, 4
	note C#, 8
	note __, 4
	retchannel

Song_TrainerBattle_Ch2: ; 7247b
	tempo $3
	noise $1
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $7
	octave 2
	setloop $2
Music_72488:
	key $0
	callchannel Music_724a3
	doloop
	key $1
	callchannel Music_724a3
	key $0
	callchannel Music_724a3
	key $0
	callchannel Music_724f1
	key $1
	callchannel Music_724f1
	doinfloop

Music_724a3:
	set_background_nrx2 $20
	note A#, 2
	note F_, 2
	octave_down
	note G_, 4
	octave_up
	note D_, 4
	note G_, 4
	octave_up
	set_background_nrx2 $40
	note A_, 1
	note A#, 1
	octave_up
	note F_, 1
	note A_, 1
	octave_down
	octave_down
	set_background_nrx2 $20
	note D_, 4
	note __, 4
	note F_, 4
	octave_up
	set_background_nrx2 $40
	note A_, 1
	note A#, 1
	octave_up
	note F_, 1
	note A_, 1
	octave_down
	octave_down
	set_background_nrx2 $20
	note C_, 4
	note G_, 8
	note A#, 2
	note F_, 2
	octave_down
	note G_, 4
	octave_up
	note D_, 4
	note G_, 4
	octave_up
	set_background_nrx2 $40
	note A_, 1
	note A#, 1
	octave_up
	note F_, 1
	note A_, 1
	octave_down
	octave_down
	set_background_nrx2 $20
	note D_, 4
	note __, 4
	note F_, 4
	octave_up
	set_background_nrx2 $40
	note A_, 1
	note A#, 1
	octave_up
	note F_, 1
	note A_, 1
	octave_down
	octave_down
	set_background_nrx2 $20
	note D_, 4
	octave_down
	note A#, 4
	octave_up
	note C_, 4
	retchannel

Music_724f1:
	note D_, 4
	octave_up
	note C_, 4
	octave_down
	note D_, 4
	octave_up
	note D_, 4
	note C_, 4
	octave_down
	note A_, 4
	note G_, 4
	note A_, 4
	note C_, 4
	note F_, 4
	note D_, 4
	octave_up
	octave_up
	note C_, 4
	octave_down
	octave_down
	note D_, 4
	octave_up
	octave_up
	note D#, 8
	octave_down
	octave_down
	note A_, 4
	note G_, 4
	note A_, 4
	note C_, 4
	note F_, 4
	retchannel
	setloop $3
Music_72513:
	octave_down
	note F#, 1
	octave_up
	note C_, 1
	note D_, 1
	note F_, 1
	octave_up
	doloop
	octave_down
	note C_, 2
	note F_, 2
	note D_, 16
	note __, 8
	octave_down
	note F_, 8
	note __, 4
	note F#, 8
	note __, 4
	retchannel

Song_TrainerBattle_Ch3: ; 72526
	tempo $3
	octave 1
	setloop $8
Music_7252b:
	tempo $6
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note E_, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note D_, 1
	tempo $3
	note F#, 1
	note G_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	doloop
	tempo $6
	setloop $2
Music_7254f:
	note D_, 1
	note F_, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note C_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 1
	tempo $3
	setloop $2
Music_72567:
	note C_, 2
	note D_, 2
	note A_, 4
	doloop
	tempo $6
	note __, 2
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 1
	doloop
	doinfloop

Song_7132a_Ch0: ; 7257a
	tempo $4
	set_nrx1 $c0
	set_background_nrx2 $b4
	dutycycle $11
	set_c153c157 $c
	set_c15f $1
	octave 4
	set_background_nrx2 $b4
	tempo $4
	setloop $4
Music_7258d:
	note __, 4
	octave_down
	callchannel Music_725d8
	octave_up
	note D_, 1
	note __, 3
	doloop
	octave_up
	note A#, 3
	note __, 1
	note F#, 3
	note __, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave_down
	note B_, 1
	note A#, 4
	note __, 4
	setloop $4
Music_725a4:
	set_background_nrx2 $b4
	callchannel Music_725d8
	set_background_nrx2 $94
	octave_up
	note F_, 8
	octave_down
	doloop
	setloop $3
Music_725b1:
	set_background_nrx2 $b4
	note D#, 8
	octave_down
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 2
	note G#, 2
	note F_, 2
	octave_up
	note C_, 1
	note __, 5
	set_background_nrx2 $94
	octave_up
	note F_, 8
	octave_down
	doloop
	tempo $8
	set_background_nrx2 $b4
	octave_up
	note C_, 4
	note C_, 2
	octave_down
	note B_, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note C_, 1
	note __, 2
	note G#, 1
	note __, 1
	doinfloop

Music_725d8:
	note F#, 1
	note __, 3
	octave_down
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 2
	note G#, 2
	note F_, 2
	octave_up
	note C_, 1
	note __, 5
	retchannel

Song_7132a_Ch1: ; 725e8
	tempo $4
	set_nrx1 $c0
	set_background_nrx2 $97
	dutycycle $11
	octave 1
	setloop $4
Music_725f3:
	note A#, 2
	note __, 2
	octave_up
	note A#, 1
	octave_up
	note D_, 1
	note F_, 1
	note G#, 1
	octave_down
	note C#, 4
	note D_, 4
	octave_down
	note A#, 4
	note G#, 4
	note __, 4
	octave_up
	octave_up
	note C_, 1
	note D#, 1
	note G#, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	octave_down
	doloop
	octave_up
	octave_up
	note D_, 2
	note __, 2
	octave_down
	note A#, 2
	note __, 2
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	note D#, 4
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	note F_, 4
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	octave_down
	note A#, 2
	note __, 2
	note A#, 2
	note F_, 2
	octave_down
	note A#, 8
	octave_up
	note G#, 4
	note D#, 1
	note G#, 1
	octave_up
	note C_, 1
	note D#, 1
	note G#, 4
	note D#, 1
	note C_, 1
	octave_down
	note G#, 1
	note D#, 1
	note F_, 4
	note G_, 2
	note A_, 2
	note A#, 4
	octave_down
	note A#, 4
	octave_up
	note D#, 4
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	note F_, 4
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	octave_down
	note A#, 2
	note __, 2
	note A#, 2
	note F_, 2
	octave_down
	note A#, 8
	octave_up
	note G#, 4
	note D#, 1
	note G#, 1
	octave_up
	note C_, 1
	note D#, 1
	note G#, 4
	note D#, 1
	note C_, 1
	octave_down
	note G#, 1
	note D#, 1
	note F_, 4
	note G_, 2
	note A_, 2
	note A#, 4
	octave_down
	note A#, 4
	octave_up
	note D#, 2
	note __, 2
	octave_up
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	octave_down
	note F#, 4
	note G_, 4
	note A#, 4
	octave_down
	note A#, 4
	note __, 4
	octave_up
	octave_up
	note F_, 1
	note A#, 1
	octave_up
	note D_, 1
	note F_, 1
	octave_down
	octave_down
	note C_, 2
	note __, 2
	octave_up
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note F_, 4
	note C_, 4
	octave_down
	note A#, 4
	octave_up
	note A#, 4
	note __, 4
	octave_up
	note F_, 1
	note G#, 1
	octave_up
	note D_, 1
	note F_, 1
	octave_down
	octave_down
	note D#, 2
	note __, 2
	octave_up
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	octave_down
	note F#, 4
	note G_, 4
	note A#, 4
	octave_down
	note A#, 4
	note __, 4
	octave_up
	octave_up
	note F_, 1
	note G#, 1
	octave_up
	note C#, 1
	note F_, 1
	octave_down
	octave_down
	note __, 4
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	octave_up
	note E_, 2
	note F_, 2
	note __, 4
	octave_down
	octave_down
	note B_, 4
	doinfloop

Song_7132a_Ch2: ; 726c5
	tempo $4
	noise $8
	set_foreground_nrx2 $30
	dutycycle $11
	set_c13f $5
	octave 2
	set_background_nrx2 $20
	set_foreground_nrx2 $60
	tempo $4
	setloop $2
Music_726d8:
	note __, 4
	note F_, 1
	note G#, 1
	octave_up
	note C_, 1
	note F_, 1
	octave_down
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note E_, 3
	note __, 1
	note F#, 1
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	octave_down
	doloop
	octave_up
	setloop $2
Music_726f3:
	note __, 4
	octave_down
	note F_, 1
	note G#, 1
	octave_up
	note C_, 1
	note F_, 1
	octave_down
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	note G_, 3
	note __, 1
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	note G_, 1
	doloop
	octave_up
	note F#, 3
	note __, 1
	note D_, 3
	note __, 1
	octave_down
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 4
	set_foreground_nrx2 $20
	tempo $8
	note G_, 3
	octave_down
	note A#, 1
	octave_up
	note A_, 3
	note C_, 1
	note A#, 1
	octave_down
	note F_, 1
	octave_up
	note A#, 1
	octave_up
	note C_, 1
	note D_, 3
	octave_down
	note D_, 1
	octave_up
	note D#, 1
	octave_down
	note C_, 1
	octave_up
	note D#, 1
	note D_, 1
	note C_, 2
	note D#, 2
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	note A#, 2
	note __, 2
	note G_, 3
	octave_down
	note A#, 1
	octave_up
	note A_, 3
	note C_, 1
	note A#, 1
	octave_down
	note F_, 1
	octave_up
	note A#, 1
	octave_up
	note C_, 1
	note D_, 3
	octave_down
	note D_, 1
	octave_up
	note D#, 1
	octave_down
	octave_down
	note D#, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	note G#, 1
	note C_, 1
	octave_up
	note D#, 1
	octave_down
	note D#, 1
	octave_up
	note D_, 2
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note D#, 1
	note F_, 2
	note __, 2
	tempo $4
	note G_, 4
	octave_down
	octave_down
	note G#, 1
	note A#, 1
	octave_up
	note C#, 1
	note G_, 1
	octave_up
	note D#, 4
	note G_, 4
	note F_, 6
	note D_, 2
	octave_down
	note A#, 8
	octave_up
	note C_, 4
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	note G_, 1
	octave_up
	note D#, 4
	note G_, 4
	note F_, 4
	note D_, 4
	note D#, 4
	note F_, 4
	note G_, 4
	note __, 4
	note D#, 4
	note G_, 4
	note F_, 6
	note D_, 2
	note D#, 4
	note G_, 4
	note A_, 8
	octave_down
	note A_, 2
	note __, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note __, 4
	note D#, 4
	doinfloop

Song_7132a_Ch3: ; 727a0
	tempo $4
	octave 1
	setloop $4
Music_727a5:
	callchannel Music_727ba
	doloop
	note C_, 4
	note C#, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	setloop $8
Music_727b5:
	callchannel Music_727ba
	doloop
	doinfloop

Music_727ba:
	note C_, 4
	note C#, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note F_, 4
	note C_, 4
	note F#, 4
	note F_, 4
	retchannel

Song_71333_Ch0: ; 727c9
	tempo $5
	set_nrx1 $c0
	set_background_nrx2 $d6
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	setloop $4
Music_727d8:
	note __, 16
	note __, 8
	doloop
	setloop $2
Music_727dd:
	set_background_nrx2 $d6
	note __, 3
	note C#, 6
	note A_, 14
	note __, 4
	octave_up
	callchannel Music_72816
	set_background_nrx2 $d6
	note D_, 1
	set_background_nrx2 $26
	note D_, 2
	callchannel Music_72816
	set_background_nrx2 $26
	note D_, 3
	octave_down
	set_background_nrx2 $d6
	note C#, 6
	octave_down
	note B_, 14
	note __, 2
	octave_up
	callchannel Music_72824
	set_background_nrx2 $d6
	note B_, 1
	callchannel Music_72824
	doloop
	set_background_nrx2 $d4
	octave_up
	note E_, 6
	note F#, 6
	note G_, 6
	octave_up
	note D_, 2
	note __, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave_down
	note B_, 16
	mute_channel
	note B_, 8
	doinfloop

Music_72816:
	set_background_nrx2 $d6
	note D_, 1
	set_background_nrx2 $26
	note D_, 2
	set_background_nrx2 $d6
	note C#, 2
	note D_, 1
	set_background_nrx2 $26
	note D_, 3
	retchannel

Music_72824:
	set_background_nrx2 $d6
	note __, 2
	note B_, 1
	set_background_nrx2 $26
	note B_, 2
	set_background_nrx2 $d6
	note A#, 2
	note B_, 1
	set_background_nrx2 $26
	note B_, 3
	retchannel

Song_71333_Ch1: ; 72833
	tempo $5
	set_nrx1 $c0
	set_background_nrx2 $96
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	setloop $4
Music_72842:
	note __, 8
	note __, 16
	doloop
	set_nrx1 $c0
	setloop $2
Music_72849:
	set_background_nrx2 $96
	callchannel Music_728a3
	callchannel Music_728ab
	set_background_nrx2 $96
	note A_, 1
	set_background_nrx2 $26
	note A_, 2
	callchannel Music_728ab
	callchannel Music_728a3
	callchannel Music_728b9
	set_background_nrx2 $96
	note F_, 1
	set_background_nrx2 $26
	note F_, 2
	callchannel Music_728b9
	doloop
	set_background_nrx2 $96
	octave_down
	note B_, 2
	octave_up
	note C_, 1
	note D_, 2
	octave_down
	note B_, 1
	octave_up
	note D_, 2
	octave_down
	note G_, 1
	note B_, 2
	octave_up
	note D_, 1
	note E_, 2
	octave_down
	note G_, 1
	octave_up
	note C_, 2
	note E_, 1
	note A_, 2
	note E_, 2
	note F#, 2
	note C_, 2
	note G_, 2
	octave_down
	note G_, 2
	octave_up
	note C_, 2
	note G_, 2
	octave_up
	note D_, 2
	set_nrx1 $80
	set_background_nrx2 $33
	octave_up
	octave_up
	note __, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note D_, 1
	doinfloop

Music_728a3:
	set_background_nrx2 $96
	note __, 6
	note D_, 12
	mute_channel
	note D_, 6
	note __, 3
	retchannel

Music_728ab:
	set_background_nrx2 $96
	note A_, 1
	set_background_nrx2 $26
	note A_, 2
	set_background_nrx2 $96
	note G#, 2
	note A_, 1
	set_background_nrx2 $26
	note A_, 3
	retchannel

Music_728b9:
	set_background_nrx2 $96
	note F_, 1
	set_background_nrx2 $26
	note F_, 2
	set_background_nrx2 $96
	note E_, 2
	note F_, 1
	set_background_nrx2 $26
	note F_, 3
	retchannel

Song_71333_Ch2: ; 728c7
	tempo $5
	noise $8
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $6
	octave 1
	set_background_nrx2 $20
	setloop $6
Music_728d6:
	callchannel Music_7292c
	doloop
	setloop $2
Music_728dc:
	callchannel Music_7298e
	doloop
	setloop $2
Music_728e2:
	callchannel Music_7292c
	doloop
	setloop $2
Music_728e8:
	callchannel Music_7298e
	doloop
	set_c13f $7
	noise $a
	note A_, 1
	octave_up
	note A_, 1
	note E_, 1
	octave_down
	note A_, 2
	note __, 1
	note B_, 1
	octave_up
	note B_, 1
	note F#, 1
	octave_down
	note B_, 2
	note __, 1
	octave_up
	note C_, 1
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	note C_, 2
	note __, 1
	note D_, 1
	note A_, 1
	octave_up
	note D_, 1
	note A_, 1
	octave_up
	note D_, 1
	note A_, 1
	set_c13f $6
	octave_down
	octave_down
	note F_, 12
	octave_up
	octave_up
	octave_up
	set_c13f $4
	noise $5
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note D_, 1
	octave_down
	note G_, 1
	doinfloop

Music_7292c:
	noise $9
	set_c13f $7
	octave_down
	note B_, 2
	octave_up
	octave_up
	note B_, 1
	octave_down
	note F#, 1
	note __, 1
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	noise $9
	set_c13f $7
	note B_, 1
	note __, 1
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	noise $9
	set_c13f $7
	note A_, 3
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	noise $9
	set_c13f $7
	note A_, 1
	octave_down
	note F#, 1
	note __, 1
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	noise $9
	set_c13f $7
	note E_, 1
	note __, 1
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	noise $9
	set_c13f $7
	note F#, 1
	note __, 1
	noise $7
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	retchannel

Music_7298e:
	noise $9
	set_c13f $7
	note G_, 2
	octave_up
	octave_up
	note G_, 1
	octave_down
	note D_, 1
	note __, 1
	noise $5
	set_c13f $4
	octave_up
	note A_, 1
	octave_down
	noise $9
	set_c13f $7
	note A_, 1
	note __, 1
	noise $5
	set_c13f $4
	octave_up
	note A_, 1
	octave_down
	noise $9
	set_c13f $7
	note G_, 3
	noise $5
	set_c13f $4
	octave_up
	note A_, 1
	note A_, 1
	noise $9
	set_c13f $7
	note F_, 1
	octave_down
	note D_, 1
	note __, 1
	noise $5
	set_c13f $4
	octave_up
	note A_, 1
	octave_down
	octave_down
	noise $9
	set_c13f $7
	note A_, 1
	note __, 1
	noise $5
	set_c13f $4
	octave_up
	octave_up
	note A_, 1
	octave_down
	noise $9
	set_c13f $7
	note D_, 1
	note __, 1
	noise $5
	set_c13f $4
	octave_up
	note A_, 1
	octave_down
	octave_down
	retchannel

Song_71333_Ch3: ; 729e6
	tempo $5
	octave 2
	setloop $c
Music_729eb:
	note C_, 1
	note __, 1
	note G_, 1
	note C#, 1
	note __, 1
	note G_, 1
	note D_, 1
	note __, 1
	note G_, 1
	note C_, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note A_, 2
	note G_, 1
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note __, 1
	note D#, 1
	doloop
	setloop $3
Music_72a05:
	note C_, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note D#, 1
	doloop
	note C_, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note C_, 1
	note __, 1
	note F#, 1
	note C_, 1
	note __, 1
	note F#, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note __, 8
	note D_, 1
	note __, 1
	note C_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	doinfloop

Song_7133c_Ch0: ; 72a24
	tempo $7
	set_nrx1 $0
	set_background_nrx2 $b8
	dutycycle $11
	set_c153c157 $f
	set_c15f $1
	octave 2
	callchannel Music_72aca
	set_background_nrx2 $a8
	octave_up
	octave_up
	octave_up
	note F_, 1
	set_background_nrx2 $38
	note F_, 1
	octave_down
	octave_down
	set_background_nrx2 $b8
	note C#, 4
	octave_down
	note B_, 4
	octave_up
	octave_up
	set_background_nrx2 $a8
	note A#, 1
	set_background_nrx2 $38
	note A#, 1
	octave_down
	octave_down
	set_background_nrx2 $b8
	note F#, 6
	set_background_nrx2 $b8
	note F#, 2
	octave_up
	octave_up
	octave_up
	set_background_nrx2 $a8
	note F#, 1
	set_background_nrx2 $38
	note F#, 1
	octave_down
	octave_down
	octave_down
	callchannel Music_72aca
	tempo $e
	set_background_nrx2 $38
	octave_up
	note D_, 1
	set_background_nrx2 $b8
	note C#, 2
	octave_down
	note B_, 2
	set_background_nrx2 $38
	note B_, 2
	octave_up
	set_background_nrx2 $b8
	note F#, 2
	note G_, 2
	note A_, 1
	set_background_nrx2 $34
	note A_, 5
	set_background_nrx2 $b8
	note F#, 2
	note F_, 1
	set_background_nrx2 $34
	note F_, 5
	set_background_nrx2 $b8
	note A#, 2
	note A_, 1
	set_background_nrx2 $34
	note A_, 5
	set_background_nrx2 $b8
	note F#, 2
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	octave_up
	note B_, 1
	tempo $7
	note A#, 1
	set_background_nrx2 $58
	note A#, 1
	set_background_nrx2 $48
	note A#, 1
	set_background_nrx2 $38
	note A#, 1
	set_background_nrx2 $28
	note A#, 1
	set_background_nrx2 $18
	note A#, 1
	octave_down
	set_background_nrx2 $b8
	tempo $e
	note A_, 1
	set_background_nrx2 $34
	note A_, 5
	set_background_nrx2 $b8
	note F#, 2
	note F_, 1
	set_background_nrx2 $34
	note F_, 5
	set_background_nrx2 $b8
	note A#, 2
	note E_, 4
	note A#, 4
	octave_up
	note E_, 6
	set_background_nrx2 $28
	note E_, 1
	octave_up
	tempo $7
	set_background_nrx2 $a8
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	octave_down
	octave_down
	octave_down
	doinfloop

Music_72aca:
	set_background_nrx2 $b8
	note B_, 4
	octave_up
	octave_up
	set_background_nrx2 $a8
	note B_, 1
	set_background_nrx2 $38
	note B_, 1
	octave_down
	set_background_nrx2 $b8
	note F#, 6
	set_background_nrx2 $38
	note F#, 2
	octave_up
	octave_up
	set_background_nrx2 $a8
	note D_, 1
	set_background_nrx2 $38
	note D_, 1
	octave_down
	octave_down
	set_background_nrx2 $b8
	note F_, 4
	note C#, 2
	note E_, 6
	set_background_nrx2 $38
	note E_, 2
	octave_up
	octave_up
	set_background_nrx2 $a8
	note C#, 1
	set_background_nrx2 $38
	note C#, 1
	octave_down
	octave_down
	set_background_nrx2 $b8
	note E_, 4
	note F#, 2
	note D_, 4
	octave_down
	retchannel

Song_7133c_Ch1: ; 72aff
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $98
	dutycycle $11
	set_c153c157 $1
	set_c15f $1
	octave 3
	setloop $2
Music_72b0e:
	set_background_nrx2 $98
	note D_, 2
	octave_down
	note A_, 1
	set_background_nrx2 $28
	note A_, 1
	octave_up
	set_background_nrx2 $98
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	note A_, 4
	note D_, 1
	set_background_nrx2 $28
	note D_, 1
	octave_down
	set_background_nrx2 $98
	note B_, 1
	note B_, 1
	note F#, 1
	set_background_nrx2 $28
	note F#, 1
	octave_up
	set_background_nrx2 $98
	note G#, 2
	octave_down
	note B_, 1
	set_background_nrx2 $28
	note B_, 1
	octave_up
	set_background_nrx2 $98
	note E_, 2
	note G_, 4
	octave_down
	note E_, 1
	set_background_nrx2 $28
	note E_, 1
	set_background_nrx2 $98
	note F_, 1
	set_background_nrx2 $28
	note F_, 1
	set_background_nrx2 $98
	note G_, 1
	octave_up
	note C_, 1
	note G_, 2
	octave_down
	note A#, 1
	set_background_nrx2 $28
	note A#, 1
	octave_up
	set_background_nrx2 $98
	note A_, 2
	note F#, 4
	octave_down
	note A#, 1
	set_background_nrx2 $28
	note A#, 1
	octave_up
	set_background_nrx2 $98
	note E_, 2
	octave_down
	note E_, 1
	set_background_nrx2 $28
	note E_, 1
	octave_up
	set_background_nrx2 $98
	note D_, 2
	octave_down
	note C#, 1
	set_background_nrx2 $28
	note C#, 1
	set_background_nrx2 $98
	note C_, 1
	set_background_nrx2 $28
	note C_, 1
	set_background_nrx2 $98
	note B_, 4
	note G_, 1
	octave_up
	note C#, 1
	note G#, 1
	note G_, 1
	octave_up
	note C_, 1
	note G_, 1
	octave_down
	doloop
	octave_up
	callchannel Music_72bbc
	callchannel Music_72bd2
	callchannel Music_72bbc
	set_background_nrx2 $28
	note D_, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $98
	note G_, 2
	note F#, 2
	note F_, 2
	note E_, 1
	octave_up
	octave_up
	octave_up
	octave_up
	note C#, 2
	note C_, 1
	set_background_nrx2 $58
	note C_, 1
	set_background_nrx2 $48
	note C_, 1
	set_background_nrx2 $38
	note C_, 1
	set_background_nrx2 $28
	note C_, 1
	set_background_nrx2 $18
	note C_, 1
	octave_down
	set_background_nrx2 $98
	callchannel Music_72bbc
	callchannel Music_72bd2
	octave_down
	octave_down
	note E_, 8
	note D#, 8
	octave_down
	note A_, 12
	note A#, 4
	octave_up
	octave_up
	doinfloop

Music_72bbc:
	octave 4
	set_background_nrx2 $98
	note F#, 2
	set_background_nrx2 $28
	note F#, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $98
	note C#, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 1
	octave_up
	octave_up
	octave_up
	note D_, 4
	retchannel

Music_72bd2:
	octave 4
	set_background_nrx2 $98
	note C#, 2
	set_background_nrx2 $28
	note C#, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $98
	note G#, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note F#, 1
	octave_up
	octave_up
	octave_up
	note F_, 4
	retchannel

Song_7133c_Ch2: ; 72be8
	tempo $7
	noise $b
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $7
	octave 1
	set_background_nrx2 $20
	setloop $2
Music_72bf7:
	note B_, 4
	octave_up
	octave_up
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	note C#, 2
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	note C#, 1
	note __, 1
	octave_down
	note C#, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave_up
	note E_, 1
	note __, 1
	octave_down
	octave_down
	note G_, 2
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 2
	octave_up
	octave_up
	octave_up
	note E_, 1
	note D_, 1
	octave_down
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	octave_down
	note A_, 1
	note E_, 1
	octave_down
	doloop
	octave_up
	callchannel Music_72c62
	callchannel Music_72c75
	callchannel Music_72c62
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	octave_up
	octave_up
	note F#, 2
	note F_, 1
	note __, 5
	octave_down
	octave_down
	callchannel Music_72c62
	callchannel Music_72c75
	note A#, 8
	note E_, 8
	octave_down
	note G_, 12
	note __, 4
	doinfloop

Music_72c62:
	note D_, 1
	note __, 1
	note C#, 1
	octave_up
	note F#, 1
	octave_down
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note D_, 1
	octave_up
	note A_, 1
	octave_down
	retchannel

Music_72c75:
	note C#, 1
	octave_up
	note G#, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note G#, 1
	octave_down
	note C#, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 1
	octave_up
	note F_, 1
	octave_down
	note B_, 1
	octave_up
	note F_, 1
	octave_down
	retchannel

Song_7133c_Ch3: ; 72c8c
	tempo $7
	octave 2
	setloop $4
Music_72c91:
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 3
	doloop
	setloop $3
Music_72cb0:
	callchannel Music_72cd7
	doloop
	setloop $4
Music_72cb6:
	note C_, 1
	note __, 1
	doloop
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note D#, 1
	note __, 2
	setloop $2
Music_72cc2:
	callchannel Music_72cd7
	doloop
	setloop $5
Music_72cc8:
	note F#, 1
	doloop
	note __, 3
	setloop $5
Music_72ccd:
	note E_, 1
	doloop
	note __, 3
	setloop $c
Music_72cd2:
	note C_, 1
	doloop
	note C_, 1
	note __, 3
	doinfloop

Music_72cd7:
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	retchannel

Song_71345_Ch0: ; 72ce8
	tempo $12
	set_nrx1 $c0
	set_background_nrx2 $5b
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	key $0
	note __, 12
	note __, 12
	startinfloop
Music_72cfa:
	note G_, 3
	note A_, 1
	note A#, 2
	octave_up
	note C_, 4
	octave_down
	note A_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note G_, 4
	note __, 2
	note F_, 3
	note E_, 1
	note D_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note E_, 3
	note F_, 1
	note E_, 1
	tempo $3
	note D#, 2
	note D_, 2
	note C#, 2
	tempo $12
	note C_, 6
	note __, 12
	note D_, 3
	note E_, 1
	note F_, 2
	note E_, 2
	note C_, 3
	octave_down
	note A_, 1
	note A#, 3
	octave_up
	note C_, 1
	note D_, 2
	note D_, 2
	octave_down
	note A#, 2
	note F_, 2
	note G_, 6
	octave_up
	note __, 12
	note __, 6
	doinfloop

Song_71345_Ch1: ; 72d2c
	tempo $9
	set_nrx1 $80
	set_background_nrx2 $93
	dutycycle $11
	set_c153c157 $1
	set_c15f $0
	octave 3
	key $0
	startinfloop
Music_72d3c:
	setloop $4
Music_72d3e:
	callchannel Music_72def
	doloop
	set_background_nrx2 $93
	octave_down
	note F_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note A#, 2
	octave_up
	note C_, 2
	note D_, 2
	note A_, 1
	note D_, 2
	set_background_nrx2 $73
	note A_, 1
	octave_down
	set_background_nrx2 $93
	note A#, 2
	octave_up
	set_background_nrx2 $53
	note A_, 1
	set_background_nrx2 $93
	note F_, 1
	note A_, 2
	note A#, 2
	octave_up
	note F_, 1
	octave_down
	note A#, 1
	note __, 1
	octave_up
	note F_, 1
	octave_down
	callchannel Music_72def
	callchannel Music_72def
	set_background_nrx2 $93
	note F_, 2
	note A#, 2
	octave_up
	note C_, 1
	octave_down
	set_background_nrx2 $43
	note F_, 1
	octave_up
	set_background_nrx2 $93
	note D_, 1
	octave_down
	set_background_nrx2 $43
	note A#, 1
	octave_up
	set_background_nrx2 $93
	note F_, 1
	set_background_nrx2 $43
	note C_, 1
	note __, 1
	note D_, 1
	octave_down
	set_background_nrx2 $93
	note C_, 1
	octave_up
	set_background_nrx2 $43
	note F_, 1
	octave_down
	set_background_nrx2 $93
	note F_, 2
	note G_, 1
	set_background_nrx2 $43
	note C_, 1
	set_background_nrx2 $93
	note A_, 1
	set_background_nrx2 $43
	note F_, 1
	octave_up
	set_background_nrx2 $93
	note C_, 1
	octave_down
	set_background_nrx2 $43
	note G_, 1
	note __, 1
	note A_, 1
	set_background_nrx2 $93
	octave_up
	note D_, 1
	set_background_nrx2 $43
	note C_, 1
	octave_down
	set_background_nrx2 $93
	note F_, 2
	note G_, 1
	octave_up
	set_background_nrx2 $43
	note D_, 1
	octave_down
	set_background_nrx2 $93
	note A#, 1
	set_background_nrx2 $43
	note F_, 1
	octave_up
	set_background_nrx2 $93
	note F_, 1
	octave_down
	set_background_nrx2 $43
	note G_, 1
	note __, 1
	note A#, 1
	set_background_nrx2 $93
	octave_up
	note D#, 1
	set_background_nrx2 $43
	note F_, 1
	set_background_nrx2 $93
	note C_, 2
	note G_, 1
	set_background_nrx2 $43
	note D#, 1
	set_background_nrx2 $93
	note G#, 1
	set_background_nrx2 $43
	note C_, 1
	octave_up
	set_background_nrx2 $93
	note G_, 1
	octave_down
	set_background_nrx2 $43
	note G_, 1
	note __, 1
	octave_up
	set_background_nrx2 $93
	note G_, 1
	octave_down
	octave_down
	doinfloop

Music_72def:
	set_background_nrx2 $93
	note C_, 2
	note E_, 2
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	note A#, 2
	note __, 1
	set_background_nrx2 $73
	note A#, 1
	set_background_nrx2 $93
	note D_, 2
	set_background_nrx2 $53
	note A#, 1
	set_background_nrx2 $93
	note F_, 1
	octave_up
	note E_, 2
	note __, 1
	set_background_nrx2 $73
	note E_, 1
	octave_down
	octave_down
	set_background_nrx2 $93
	note A#, 2
	octave_up
	octave_up
	set_background_nrx2 $53
	note E_, 1
	octave_down
	set_background_nrx2 $93
	note D_, 1
	retchannel

Song_71345_Ch2: ; 72e1a
	tempo $9
	noise $5
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $7
	octave 1
	key $0
	set_background_nrx2 $20
	note __, 12
	note __, 12
	callchannel Music_72f08
	callchannel Music_72f1f
	callchannel Music_72f38
	callchannel Music_72f2a
	startinfloop
Music_72e38:
	setloop $2
Music_72e3a:
	callchannel Music_72f08
	callchannel Music_72f1f
	callchannel Music_72f3d
	callchannel Music_72f2a
	doloop
	noise $5
	note A#, 2
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note F_, 1
	octave_up
	note C_, 2
	note D_, 2
	note F_, 1
	note __, 2
	note F_, 1
	octave_down
	note G_, 2
	octave_up
	note F_, 1
	note D_, 1
	note F_, 2
	note G_, 2
	octave_up
	note D_, 1
	note __, 2
	note D_, 1
	octave_down
	octave_down
	setloop $2
Music_72e65:
	callchannel Music_72f08
	callchannel Music_72f1f
	callchannel Music_72f38
	callchannel Music_72f2a
	doloop
	noise $5
	note A#, 2
	octave_up
	note F_, 1
	octave_down
	noise $7
	note A#, 1
	noise $5
	octave_up
	note A#, 1
	noise $7
	note F_, 1
	octave_up
	noise $5
	note C_, 1
	octave_down
	noise $7
	note A#, 1
	noise $5
	octave_up
	note D_, 1
	noise $7
	note C_, 1
	note __, 1
	note D_, 1
	octave_down
	octave_down
	noise $5
	note F_, 2
	octave_up
	note C_, 1
	octave_down
	noise $7
	note F_, 1
	noise $5
	octave_up
	note F_, 1
	noise $7
	note C_, 1
	noise $5
	note G_, 1
	noise $7
	note F_, 1
	noise $5
	note A_, 1
	noise $7
	note G_, 1
	note __, 1
	note A_, 1
	noise $5
	octave_down
	note D#, 2
	note A#, 1
	noise $7
	note D#, 1
	noise $5
	octave_up
	note F_, 1
	octave_down
	noise $7
	note A#, 1
	octave_up
	noise $5
	note G_, 1
	noise $7
	note F_, 1
	noise $5
	note A#, 1
	noise $7
	note G_, 1
	note __, 1
	note A#, 1
	octave_down
	noise $5
	note G#, 2
	octave_up
	note D#, 1
	octave_down
	noise $7
	note G#, 1
	octave_up
	noise $5
	note G#, 1
	noise $7
	note D#, 1
	noise $5
	note A#, 1
	noise $7
	note G#, 1
	noise $5
	octave_up
	note C_, 1
	octave_down
	noise $7
	note A#, 1
	note __, 1
	octave_up
	noise $5
	note C_, 1
	octave_down
	octave_down
	setloop $2
Music_72efa:
	callchannel Music_72f08
	callchannel Music_72f1f
	callchannel Music_72f38
	callchannel Music_72f2a
	doloop
	doinfloop

Music_72f08:
	noise $5
	note G_, 2
	octave_up
	noise $5
	note G_, 1
	octave_down
	noise $5
	note C_, 1
	note A#, 2
	note C_, 2
	octave_up
	octave_up
	noise $7
	note D_, 1
	note __, 2
	note D_, 1
	octave_down
	octave_down
	retchannel

Music_72f1f:
	noise $5
	octave_up
	note A#, 2
	octave_up
	noise $7
	note D_, 1
	note __, 1
	octave_down
	retchannel

Music_72f2a:
	noise $7
	note G_, 1
	note __, 1
	octave_down
	noise $5
	note G_, 1
	octave_up
	noise $7
	note G_, 1
	octave_down
	retchannel

Music_72f38:
	noise $5
	note G_, 2
	note D_, 2
	retchannel

Music_72f3d:
	noise $5
	note F_, 2
	note D_, 2
	retchannel

Song_71345_Ch3: ; 72f42
	tempo $3
	octave 1
	tempo $24
	note __, 3
	startinfloop
Music_72f49:
	tempo $3
	setloop $11
Music_72f4d:
	note C#, 3
	note __, 3
	note F#, 2
	note F#, 2
	note F#, 2
	note F_, 3
	note __, 6
	note E_, 3
	note G#, 2
	note G#, 2
	note G#, 2
	note E_, 3
	note __, 3
	doloop
	doinfloop

Song_71384_Ch0: ; 72f5c
	tempo $7
	set_nrx1 $80
	set_background_nrx2 $a7
	dutycycle $11
	set_c153c157 $6
	set_c15f $1
	octave 4
	set_background_nrx2 $a7
	callchannel Music_72f98
	octave_down
	note G_, 4
	octave_up
	callchannel Music_72f98
	note G_, 4
	octave_up
	callchannel Music_72fac
	octave_up
	note C_, 4
	note C_, 4
	octave_down
	note B_, 2
	note A_, 4
	note G#, 4
	note A_, 2
	note B_, 2
	note A_, 10
	octave_up
	callchannel Music_72fac
	note G_, 2
	note F_, 2
	note F_, 2
	note E_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note E_, 8
	note F_, 8
	note F#, 8
	note G_, 2
	note __, 2
	octave_down
	note G_, 4
	octave_up
	doinfloop

Music_72f98:
	note C_, 8
	octave_down
	note B_, 2
	octave_up
	note C_, 2
	note D_, 2
	note E_, 8
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 8
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note F_, 4
	note G_, 2
	note E_, 8
	retchannel

Music_72fac:
	set_background_nrx2 $a7
	note C_, 4
	note C_, 4
	octave_down
	note B_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 1
	set_background_nrx2 $37
	note G_, 1
	set_background_nrx2 $a7
	note G_, 4
	note C_, 4
	note C_, 1
	note D_, 1
	note E_, 2
	note C_, 1
	set_background_nrx2 $37
	note C_, 1
	set_background_nrx2 $a7
	retchannel

Song_71384_Ch1: ; 72fc7
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $a5
	dutycycle $11
	set_c153c157 $1
	set_c15f $0
	octave 2
	key $3
	setloop $2
Music_72fd8:
	note F#, 2
	callchannel Music_73093
	note F_, 2
	note F#, 2
	note G#, 2
	note A_, 4
	callchannel Music_73093
	note B_, 2
	note A_, 2
	note B_, 2
	octave_up
	note C#, 4
	octave_up
	octave_up
	note C#, 1
	octave_down
	note E_, 1
	note A_, 1
	set_background_nrx2 $45
	note A_, 1
	set_background_nrx2 $a5
	note E_, 1
	note C#, 1
	octave_down
	note D_, 2
	note C#, 2
	octave_down
	note B_, 2
	note B_, 2
	octave_up
	octave_up
	note G_, 1
	note G_, 1
	octave_down
	note C#, 2
	octave_down
	note A#, 2
	octave_up
	octave_up
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave_down
	note B_, 1
	note A#, 2
	octave_down
	note C#, 2
	doloop
	callchannel Music_730a6
	octave_up
	note __, 2
	octave_down
	set_background_nrx2 $a5
	note D_, 1
	set_background_nrx2 $45
	note D_, 1
	octave_up
	octave_up
	set_background_nrx2 $a5
	note E_, 1
	octave_down
	octave_down
	note D_, 1
	set_background_nrx2 $45
	note D_, 2
	set_background_nrx2 $a5
	note E_, 1
	set_background_nrx2 $45
	note E_, 2
	set_background_nrx2 $a5
	note E_, 1
	octave_up
	note G#, 1
	set_background_nrx2 $45
	note G#, 1
	set_background_nrx2 $a5
	note G#, 1
	note D_, 1
	octave_down
	note B_, 1
	note G#, 1
	octave_up
	note A_, 1
	octave_down
	note G#, 1
	octave_up
	note B_, 1
	note D_, 1
	note A_, 1
	octave_down
	note A_, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	callchannel Music_730a6
	octave_up
	octave_up
	note C#, 1
	octave_down
	octave_down
	note E_, 1
	octave_up
	note B_, 1
	octave_down
	note E_, 1
	note E_, 1
	note E_, 1
	octave_up
	note A_, 1
	octave_down
	note E_, 1
	note E_, 1
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note C#, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	setloop $2
Music_73073:
	octave_up
	note A_, 1
	note E_, 1
	octave_down
	note F#, 1
	note F#, 1
	doloop
	setloop $2
Music_7307c:
	octave_up
	note B_, 1
	note E_, 1
	octave_down
	note F#, 1
	note F#, 1
	doloop
	octave_up
	note B_, 1
	note F#, 1
	octave_down
	note G#, 1
	note G#, 1
	octave_up
	note B_, 1
	note F#, 1
	octave_down
	note G#, 1
	note G#, 1
	note G#, 2
	note __, 2
	note B_, 4
	doinfloop

Music_73093:
	set_background_nrx2 $b2
	octave_up
	octave_up
	note E_, 1
	note E_, 1
	note E_, 1
	set_background_nrx2 $42
	note E_, 1
	set_background_nrx2 $b2
	note E_, 1
	note E_, 1
	octave_down
	octave_down
	set_background_nrx2 $a5
	retchannel

Music_730a6:
	set_background_nrx2 $a5
	note __, 2
	note D_, 1
	set_background_nrx2 $35
	note D_, 1
	set_background_nrx2 $a5
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note D_, 1
	set_background_nrx2 $35
	note D_, 2
	set_background_nrx2 $a5
	note E_, 1
	set_background_nrx2 $35
	note E_, 2
	set_background_nrx2 $a5
	note E_, 1
	octave_up
	note G#, 1
	set_background_nrx2 $35
	note G#, 1
	octave_down
	set_background_nrx2 $a5
	note E_, 1
	set_background_nrx2 $35
	note E_, 1
	note __, 2
	set_background_nrx2 $a5
	note A_, 1
	set_background_nrx2 $35
	note A_, 1
	set_background_nrx2 $a5
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note A_, 1
	set_background_nrx2 $35
	note A_, 2
	octave_up
	set_background_nrx2 $a5
	note E_, 1
	set_background_nrx2 $35
	note E_, 2
	set_background_nrx2 $a5
	note E_, 1
	octave_up
	note E_, 1
	set_background_nrx2 $35
	note E_, 1
	octave_down
	set_background_nrx2 $a5
	note E_, 1
	set_background_nrx2 $35
	note E_, 1
	octave_down
	set_background_nrx2 $a5
	retchannel

Song_71384_Ch2: ; 730f9
	tempo $7
	noise $1
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $7
	octave 1
	key $3
	set_background_nrx2 $20
	setloop $2
Music_7310a:
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note C#, 1
	note F_, 1
	note G#, 1
	octave_up
	note C#, 1
	note F_, 1
	note __, 1
	octave_down
	note F#, 4
	note A_, 2
	octave_up
	note C#, 2
	octave_down
	note F#, 2
	note E_, 1
	note G#, 1
	note B_, 1
	octave_up
	note E_, 1
	note G#, 1
	note __, 1
	octave_down
	note A_, 4
	octave_up
	note C#, 2
	note E_, 2
	octave_down
	note A_, 2
	octave_up
	octave_up
	note D_, 1
	octave_down
	note A_, 1
	note D_, 1
	octave_down
	note A_, 1
	note D_, 1
	note __, 1
	note G_, 4
	note B_, 2
	octave_up
	note D_, 2
	note G_, 2
	note F#, 2
	note C#, 2
	octave_down
	note A#, 2
	note F#, 2
	doloop
	callchannel Music_731b5
	octave_up
	note G#, 1
	note __, 1
	octave_down
	note A_, 2
	octave_up
	octave_up
	note C#, 1
	note __, 2
	note C#, 1
	octave_down
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	note __, 2
	note A_, 1
	octave_down
	note F#, 2
	note E_, 2
	callchannel Music_731b5
	note C#, 2
	octave_up
	note F_, 1
	note G#, 1
	octave_down
	note D#, 2
	note F_, 2
	note F#, 2
	octave_up
	note A_, 1
	note F#, 1
	octave_down
	note F#, 2
	octave_up
	note G#, 1
	note B_, 1
	octave_down
	note E_, 2
	callchannel Music_731b5
	octave_up
	note G#, 1
	note __, 1
	octave_down
	note A_, 2
	octave_up
	octave_up
	note C#, 1
	note __, 2
	note C#, 1
	octave_down
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	note __, 2
	note A_, 1
	octave_down
	note F#, 2
	note E_, 2
	setloop $2
Music_73184:
	note G_, 1
	note G_, 1
	octave_up
	note D_, 1
	note A_, 1
	octave_up
	octave_up
	note E_, 1
	note A_, 1
	octave_down
	octave_down
	octave_down
	doloop
	note G_, 1
	octave_up
	note D_, 1
	note A_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	setloop $4
Music_7319b:
	note C#, 1
	octave_down
	note A_, 1
	octave_down
	note D_, 1
	note D_, 1
	octave_up
	octave_up
	doloop
	note D#, 1
	octave_down
	note B_, 1
	octave_down
	note E_, 1
	note E_, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	note B_, 1
	octave_down
	note E_, 1
	note E_, 1
	note E_, 2
	note __, 6
	doinfloop

Music_731b5:
	note D_, 2
	octave_up
	note F#, 1
	note __, 2
	note F#, 1
	octave_down
	note D_, 2
	octave_up
	note G#, 1
	note __, 2
	note G#, 1
	octave_down
	note E_, 2
	retchannel

Song_71384_Ch3: ; 731c3
	tempo $7
	octave 1
	setloop $8
Music_731c8:
	callchannel Music_731f7
	callchannel Music_731ff
	doloop
	setloop $3
Music_731d1:
	callchannel Music_73208
	callchannel Music_73211
	callchannel Music_73208
	callchannel Music_7321a
	doloop
	callchannel Music_73208
	callchannel Music_7321a
	callchannel Music_731f7
	callchannel Music_731ff
	callchannel Music_731ff
	note C_, 1
	note __, 3
	setloop $2
Music_731f1:
	octave_up
	note A#, 1
	octave_down
	note F_, 1
	doloop
	doinfloop

Music_731f7:
	setloop $2
Music_731f9:
	note D_, 1
	note __, 1
	note G_, 1
	note G#, 1
	doloop
	retchannel

Music_731ff:
	note D_, 1
	note __, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note __, 1
	note C_, 1
	note C#, 1
	retchannel

Music_73208:
	note C_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note G#, 1
	retchannel

Music_73211:
	note C_, 1
	note G_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note G#, 1
	retchannel

Music_7321a:
	note C_, 1
	note D_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	retchannel

Song_7138d_Ch0: ; 73223
	tempo $e
	set_nrx1 $c0
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	key $2
	set_background_nrx2 $7a
	set_c153c157 $3
	set_c15f $1
	tempo $e
	callchannel Music_73291
	callchannel Music_732a3
	callchannel Music_73291
	note A_, 3
	note B_, 2
	octave_up
	note C_, 1
	note D_, 2
	set_background_nrx2 $a7
	note D_, 1
	set_background_nrx2 $7a
	note E_, 2
	note F_, 1
	callchannel Music_73291
	callchannel Music_732a3
	callchannel Music_73291
	note A_, 3
	note B_, 2
	octave_up
	note C_, 1
	note D_, 2
	set_background_nrx2 $a7
	note D_, 1
	octave_up
	tempo $15
	set_background_nrx2 $a7
	set_c153c157 $b
	set_c15f $1
	note E_, 1
	note F_, 1
	setloop $2
Music_7326d:
	note G_, 2
	note F_, 1
	note E_, 1
	note D_, 2
	note E_, 1
	note F_, 1
	doloop
	note G_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave_down
	note A#, 2
	note A_, 3
	set_background_nrx2 $37
	note A_, 1
	octave_down
	octave_down
	set_background_nrx2 $f6
	tempo $7
	setloop $5
Music_73287:
	note B_, 1
	doloop
	note __, 1
	octave_up
	octave_up
	set_background_nrx2 $7a
	note E_, 4
	note F_, 2
	doinfloop

Music_73291:
	note G_, 2
	set_background_nrx2 $a7
	note G_, 1
	set_background_nrx2 $7a
	note F_, 2
	note E_, 1
	note D_, 2
	note C_, 1
	octave_down
	note B_, 2
	set_background_nrx2 $a7
	note B_, 1
	set_background_nrx2 $7a
	retchannel

Music_732a3:
	note A_, 1
	octave_up
	note E_, 6
	set_background_nrx2 $84
	note E_, 2
	set_background_nrx2 $7a
	note E_, 2
	note F_, 1
	retchannel
	set_background_nrx2 $c8
	note A_, 1
	octave_up
	set_background_nrx2 $7a
	note E_, 6
	set_background_nrx2 $84
	note E_, 2
	set_background_nrx2 $7a
	note E_, 2
	note F_, 1
	retchannel

Song_7138d_Ch1: ; 732bd
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $a8
	dutycycle $11
	set_c153c157 $10
	set_c15f $1
	octave 1
	key $2
	set_background_nrx2 $a8
	callchannel Music_73386
	setloop $2
Music_732d3:
	callchannel Music_733f1
	doloop
	callchannel Music_73386
	callchannel Music_733f1
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note A_, 1
	set_background_nrx2 $54
	note A_, 1
	octave_up
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	octave_up
	set_background_nrx2 $a8
	note C_, 1
	note G_, 1
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	set_background_nrx2 $54
	note D_, 1
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $54
	note G_, 1
	set_background_nrx2 $a8
	note B_, 1
	set_background_nrx2 $54
	note B_, 1
	octave_up
	octave_up
	set_background_nrx2 $a8
	note C_, 1
	octave_down
	note F_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note A#, 1
	note F_, 1
	octave_up
	note E_, 5
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note D_, 1
	octave_down
	note A_, 1
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note A#, 5
	set_background_nrx2 $54
	note A#, 1
	set_background_nrx2 $a8
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note A#, 1
	note F_, 1
	octave_up
	note E_, 5
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note D_, 1
	octave_down
	note A_, 1
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note A#, 5
	set_background_nrx2 $54
	note A#, 1
	set_background_nrx2 $a8
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note A#, 1
	note F_, 1
	octave_up
	note E_, 5
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note D_, 1
	octave_down
	note A_, 1
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note A#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D_, 1
	note E_, 12
	octave_down
	set_background_nrx2 $d6
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	octave_up
	set_background_nrx2 $6a
	note C_, 4
	note D_, 2
	octave_down
	doinfloop

Music_73386:
	octave 1
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $54
	note G_, 1
	octave_up
	set_background_nrx2 $a8
	note C_, 1
	set_background_nrx2 $54
	note C_, 1
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	note G_, 1
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	set_background_nrx2 $54
	note D_, 1
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $54
	note G_, 1
	set_background_nrx2 $a8
	note B_, 1
	set_background_nrx2 $54
	note B_, 1
	set_background_nrx2 $a8
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note A_, 1
	set_background_nrx2 $54
	note A_, 1
	octave_up
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	octave_up
	set_background_nrx2 $a8
	note C_, 1
	note G_, 1
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note C_, 1
	octave_down
	note B_, 1
	set_background_nrx2 $54
	note B_, 1
	set_background_nrx2 $a8
	note B_, 1
	octave_up
	note D_, 1
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note B_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note E_, 1
	retchannel

Music_733f1:
	octave 1
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $a8
	note A_, 1
	set_background_nrx2 $54
	note A_, 1
	octave_up
	set_background_nrx2 $a8
	note E_, 1
	set_background_nrx2 $54
	note E_, 1
	octave_up
	set_background_nrx2 $a8
	note C_, 1
	note G_, 1
	note C_, 1
	octave_down
	note A_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	set_background_nrx2 $54
	note D_, 1
	set_background_nrx2 $a8
	note G_, 1
	set_background_nrx2 $54
	note G_, 1
	set_background_nrx2 $a8
	note B_, 1
	set_background_nrx2 $54
	note B_, 1
	set_background_nrx2 $a8
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	retchannel

Song_7138d_Ch2: ; 7342b
	tempo $7
	noise $a
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $7
	octave 2
	key $2
	set_background_nrx2 $20
	setloop $2
Music_7343c:
	note C_, 2
	note G_, 1
	set_background_nrx2 $40
	note G_, 1
	octave_up
	set_background_nrx2 $20
	note C_, 1
	set_background_nrx2 $40
	note C_, 1
	octave_down
	set_background_nrx2 $20
	note C_, 6
	octave_down
	note G_, 1
	set_background_nrx2 $40
	note G_, 1
	set_background_nrx2 $20
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note G_, 1
	octave_down
	note G_, 6
	callchannel Music_734f1
	octave_up
	note E_, 1
	set_background_nrx2 $40
	note E_, 1
	set_background_nrx2 $20
	note E_, 1
	note G#, 1
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	note E_, 6
	octave_down
	callchannel Music_734f1
	note G_, 1
	set_background_nrx2 $40
	note G_, 1
	set_background_nrx2 $20
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note B_, 1
	octave_down
	note G_, 6
	note A_, 2
	octave_up
	note E_, 1
	set_background_nrx2 $40
	note E_, 1
	octave_down
	set_background_nrx2 $20
	note A_, 1
	set_background_nrx2 $40
	note A_, 1
	octave_up
	set_background_nrx2 $20
	note C_, 4
	note E_, 1
	set_background_nrx2 $40
	note E_, 1
	set_background_nrx2 $20
	note G_, 2
	note D_, 1
	set_background_nrx2 $40
	note D_, 1
	set_background_nrx2 $20
	note B_, 1
	set_background_nrx2 $40
	note B_, 1
	octave_down
	set_background_nrx2 $20
	note B_, 6
	octave_up
	doloop
	octave_down
	setloop $2
Music_734a7:
	setloop $2
Music_734a9:
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	doloop
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note A_, 6
	note A#, 1
	octave_up
	note A#, 1
	octave_down
	note A#, 1
	octave_up
	note A#, 1
	octave_down
	note A#, 1
	octave_up
	note A#, 1
	octave_down
	note A#, 6
	doloop
	setloop $2
Music_734c3:
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	doloop
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note A_, 6
	setloop $2
Music_734cf:
	note G_, 1
	octave_up
	note G_, 1
	octave_down
	doloop
	note G_, 1
	octave_up
	note G_, 1
	octave_down
	note G_, 6
	note A_, 2
	note A_, 1
	octave_up
	note E_, 1
	octave_down
	note A_, 1
	octave_up
	note E_, 1
	octave_down
	note A_, 2
	setloop $2
Music_734e5:
	note A_, 1
	octave_up
	note E_, 1
	octave_down
	doloop
	setloop $5
Music_734ec:
	note G_, 1
	doloop
	note __, 7
	octave_up
	doinfloop

Music_734f1:
	set_background_nrx2 $20
	note A_, 2
	octave_up
	note E_, 1
	set_background_nrx2 $40
	note E_, 1
	octave_up
	set_background_nrx2 $20
	note C_, 1
	set_background_nrx2 $40
	note C_, 1
	octave_down
	octave_down
	set_background_nrx2 $20
	note A_, 6
	retchannel

Song_7138d_Ch3: ; 73506
	tempo $7
	octave 1
	setloop $8
Music_7350b:
	note C_, 2
	note E_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note __, 1
	doloop
	setloop $6
Music_73522:
	note C_, 1
	note G_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note A_, 1
	note D_, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note F_, 1
	doloop
	note C_, 2
	note D#, 1
	note D_, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 2
	note __, 6
	doinfloop

Song_71396_Ch0: ; 73541
	tempo $6
	set_nrx1 $c0
	set_background_nrx2 $a8
	dutycycle $11
	set_c153c157 $12
	set_c15f $1
	octave 4
	key $3
	set_background_nrx2 $a8
	note G_, 6
	note F#, 2
	note G_, 8
	set_background_nrx2 $48
	note G_, 4
	set_background_nrx2 $a8
	note E_, 4
	note F#, 4
	note G_, 4
	note A_, 6
	note F#, 2
	note D_, 12
	set_background_nrx2 $48
	note D_, 4
	octave_down
	set_background_nrx2 $a8
	note B_, 4
	octave_up
	note D_, 4
	note E_, 6
	note D#, 2
	note E_, 8
	set_background_nrx2 $48
	note E_, 4
	set_background_nrx2 $a8
	note E_, 4
	note F#, 4
	note B_, 4
	note G_, 16
	set_background_nrx2 $48
	note G_, 4
	set_background_nrx2 $a8
	note G_, 4
	note A_, 2
	note F#, 4
	note D_, 2
	note E_, 6
	note G_, 6
	note B_, 4
	note A_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	note E_, 6
	note G_, 6
	note B_, 4
	octave_up
	note D_, 4
	octave_down
	note A_, 4
	note G_, 4
	note F#, 4
	note G_, 6
	note A_, 2
	note A#, 3
	note G_, 3
	octave_up
	note D_, 2
	note C_, 4
	octave_down
	note A_, 2
	note F_, 4
	note D_, 3
	note F_, 3
	octave_down
	note G_, 4
	octave_down
	note A#, 2
	note A_, 2
	octave_up
	octave_up
	note A#, 1
	note A#, 1
	octave_down
	note C_, 2
	note __, 2
	octave_down
	note A#, 2
	octave_up
	octave_up
	note A#, 1
	note A#, 1
	octave_down
	note F_, 2
	octave_down
	note A_, 2
	octave_up
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	octave_down
	note G_, 4
	octave_up
	octave_up
	note E_, 1
	note E_, 1
	octave_down
	octave_down
	note G#, 1
	note A_, 1
	octave_up
	note G_, 4
	octave_down
	note A#, 2
	note A_, 2
	octave_up
	octave_up
	note A#, 1
	note A#, 1
	octave_down
	note C_, 2
	note __, 2
	octave_down
	note A#, 2
	octave_up
	octave_up
	note E_, 8
	note F#, 8
	doinfloop

Song_71396_Ch1: ; 735d2
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $94
	dutycycle $11
	set_c153c157 $1
	set_c15f $2
	octave 3
	key $3
	setloop $2
Music_735e3:
	note E_, 1
	octave_down
	note B_, 1
	note G_, 1
	octave_up
	note F#, 2
	octave_down
	note G_, 1
	octave_up
	note G_, 1
	note E_, 1
	octave_down
	note B_, 1
	octave_up
	note A_, 2
	note E_, 1
	note B_, 1
	note E_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	doloop
	setloop $2
Music_735fe:
	note E_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	note F#, 1
	note B_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	doloop
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note A_, 2
	note D_, 1
	note B_, 1
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note F#, 1
	octave_up
	note G_, 2
	octave_down
	note E_, 1
	note C_, 1
	octave_up
	note A_, 2
	octave_down
	note D#, 1
	octave_down
	note B_, 1
	octave_up
	octave_up
	octave_up
	note D_, 2
	note C#, 1
	note C_, 1
	octave_down
	note A#, 4
	octave_down
	note G_, 1
	note D#, 1
	octave_down
	note A#, 1
	octave_up
	note A_, 1
	note G_, 1
	note D#, 1
	note A#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	octave_up
	note C_, 1
	octave_down
	note D#, 1
	note G_, 1
	note D#, 1
	octave_down
	note A#, 1
	octave_up
	note A_, 1
	note G_, 1
	note D#, 1
	note A#, 1
	note G_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	note F#, 1
	note B_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note A_, 2
	note D_, 1
	note B_, 1
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note E_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	note F#, 1
	note B_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note A_, 2
	note D_, 1
	note B_, 1
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note E_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	note F#, 1
	note B_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note A#, 4
	octave_down
	note G_, 1
	note D#, 1
	octave_down
	note A#, 1
	octave_up
	note A_, 1
	note G_, 1
	note D#, 1
	note A#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	octave_up
	note C_, 1
	octave_down
	note D#, 1
	octave_up
	octave_up
	note C_, 4
	octave_down
	octave_down
	note A_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	octave_up
	note C_, 1
	octave_down
	note A_, 1
	note G_, 1
	note F_, 1
	octave_up
	note D_, 1
	octave_down
	note F_, 1
	octave_down
	note F_, 4
	note D_, 2
	note C_, 2
	octave_up
	octave_up
	note F_, 1
	note F_, 1
	octave_down
	octave_down
	note F_, 2
	note __, 2
	note D_, 2
	octave_up
	octave_up
	note F_, 1
	note F_, 1
	octave_down
	octave_down
	note F_, 2
	note C_, 2
	octave_up
	octave_up
	note E_, 1
	note E_, 1
	octave_down
	octave_down
	octave_down
	note B_, 4
	octave_up
	octave_up
	octave_up
	note E_, 1
	note E_, 1
	octave_down
	octave_down
	note C_, 1
	note C#, 1
	note F_, 4
	note D_, 2
	note C_, 2
	octave_up
	octave_up
	note F_, 1
	note F_, 1
	octave_down
	octave_down
	note F_, 2
	note __, 2
	note D_, 2
	note E_, 1
	note G_, 1
	octave_up
	note E_, 1
	note G_, 1
	octave_down
	note E_, 2
	note G_, 2
	note F#, 1
	note A_, 1
	octave_up
	note F#, 1
	note A_, 1
	octave_down
	note F#, 2
	note A_, 2
	octave_up
	doinfloop

Music_73724:
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note C_, 1
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	note G_, 1
	note C_, 1
	note G_, 1
	octave_up
	note F#, 1
	octave_down
	note G_, 1
	retchannel

Song_71396_Ch2: ; 7373d
	tempo $6
	noise $9
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $3
	set_background_nrx2 $20
	setloop $2
Music_7374e:
	callchannel Music_73804
	doloop
	setloop $2
Music_73754:
	key $fe
	callchannel Music_73804
	doloop
	key $3
	callchannel Music_737eb
	note C_, 1
	octave_up
	note G_, 1
	note E_, 1
	note C_, 1
	octave_down
	note G_, 2
	note C_, 2
	note F#, 2
	note B_, 2
	note B_, 2
	note B_, 2
	key $6
	callchannel Music_737eb
	key $3
	note D#, 1
	octave_up
	note A#, 1
	note G_, 1
	note D#, 1
	octave_down
	note D#, 1
	note G_, 1
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	note B_, 1
	octave_up
	note F#, 1
	note C#, 1
	octave_down
	note A_, 1
	note B_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	key $fc
	callchannel Music_73804
	key $fe
	callchannel Music_73804
	key $3
	callchannel Music_737eb
	key $fe
	callchannel Music_73804
	key $6
	callchannel Music_737eb
	key $3
	note F_, 1
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	octave_up
	note C_, 1
	note F_, 1
	note C_, 1
	octave_down
	note F_, 1
	octave_up
	note G_, 1
	octave_down
	note F_, 1
	octave_up
	note C_, 1
	note A_, 1
	note C_, 1
	octave_down
	note F_, 1
	octave_up
	note C_, 1
	note B_, 1
	note C_, 1
	octave_down
	callchannel Music_7381b
	octave_up
	note G_, 1
	note G_, 1
	octave_down
	note A#, 2
	note F_, 2
	octave_up
	note F_, 1
	note F_, 1
	octave_down
	note E_, 4
	octave_up
	octave_up
	note C_, 1
	note C_, 1
	octave_down
	octave_down
	note F_, 1
	note F#, 1
	callchannel Music_7381b
	note C_, 2
	octave_up
	note C_, 2
	octave_down
	note C_, 1
	note G_, 1
	octave_up
	note C_, 1
	note G_, 1
	octave_down
	note D_, 2
	octave_up
	note D_, 2
	octave_down
	note D_, 1
	note A_, 1
	octave_up
	note D_, 1
	note A_, 1
	octave_down
	doinfloop

Music_737eb:
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	note C_, 1
	octave_up
	note D_, 1
	octave_down
	note C_, 1
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	note G_, 1
	note C_, 1
	note G_, 1
	octave_up
	note F#, 1
	octave_down
	note G_, 1
	retchannel

Music_73804:
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	note B_, 1
	note D_, 1
	note G_, 1
	note E_, 1
	note B_, 1
	octave_up
	note G_, 1
	octave_down
	note B_, 1
	note E_, 1
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	retchannel

Music_7381b:
	note G_, 4
	note G_, 2
	note F_, 2
	octave_up
	note G_, 1
	note G_, 1
	octave_down
	note A#, 2
	note __, 2
	note G_, 2
	retchannel

Song_71396_Ch3: ; 73826
	tempo $6
	octave 1
	setloop $2
Music_7382b:
	callchannel Music_7388b
	callchannel Music_7387b
	doloop
	callchannel Music_7388b
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note D#, 1
	note D_, 1
	note F_, 1
	note F_, 1
	setloop $3
Music_73847:
	callchannel Music_7388b
	callchannel Music_7387b
	doloop
	callchannel Music_7388b
	note D_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	callchannel Music_7388b
	callchannel Music_7387b
	callchannel Music_7388b
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note F_, 1
	doinfloop

Music_7387b:
	note C_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	note A_, 2
	note D#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C_, 1
	note C#, 1
	retchannel

Music_7388b:
	note D_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	note A_, 2
	note D#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C_, 1
	note C#, 1
	retchannel

Song_7139f_Ch0: ; 7389b
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $f7
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	set_background_nrx2 $ba
	callchannel Music_73928
	set_background_nrx2 $77
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $ba
	note G_, 1
	note __, 1
	note G_, 8
	set_background_nrx2 $77
	octave_up
	octave_up
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_down
	octave_down
	set_background_nrx2 $ba
	note G_, 1
	note __, 1
	octave_up
	note D_, 3
	note __, 1
	note C_, 3
	note __, 1
	octave_down
	note G_, 1
	note __, 1
	note A_, 6
	octave_up
	octave_up
	callchannel Music_73928
	set_background_nrx2 $77
	octave_down
	note D_, 1
	set_background_nrx2 $ba
	note G_, 1
	set_background_nrx2 $77
	note D_, 1
	set_background_nrx2 $ba
	note G_, 8
	note __, 2
	note G_, 1
	note __, 1
	octave_up
	note D_, 3
	note __, 1
	note C_, 3
	note __, 1
	octave_down
	note G_, 1
	note __, 1
	note A_, 6
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 3
	note __, 1
	note A_, 1
	note __, 1
	note G_, 10
	note D_, 2
	note __, 2
	octave_down
	note A_, 2
	note __, 2
	note G_, 2
	octave_up
	octave_up
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 3
	note __, 1
	note A_, 1
	note __, 1
	note G_, 10
	octave_down
	note D_, 2
	note __, 2
	octave_down
	note A_, 2
	note __, 2
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 3
	note __, 1
	note A_, 1
	note __, 1
	note G_, 10
	mute_channel
	note G_, 8
	octave_up
	octave_up
	doinfloop

Music_73928:
	octave 5
	setloop $2
Music_7392b:
	set_background_nrx2 $77
	note B_, 1
	note D_, 1
	set_background_nrx2 $fc
	octave_down
	octave_down
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 2
	octave_up
	octave_up
	doloop
	set_background_nrx2 $77
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	set_background_nrx2 $fc
	octave_down
	octave_down
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 3
	set_background_nrx2 $77
	octave_up
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $fc
	note A_, 1
	note __, 1
	octave_up
	note D_, 3
	retchannel

Song_7139f_Ch1: ; 7395c
	tempo $6
	set_nrx1 $80
	set_background_nrx2 $86
	dutycycle $11
	set_c153c157 $9
	set_c15f $0
	octave 3
	tempo $6
	note B_, 1
	note __, 1
	octave_up
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 2
	note G_, 1
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	octave_up
	note D_, 2
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 2
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note A_, 2
	note G_, 1
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	octave_up
	note D_, 2
	note G_, 1
	note __, 1
	octave_down
	note B_, 1
	note __, 1
	octave_up
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave_down
	note E_, 4
	note G_, 4
	octave_up
	octave_up
	note D_, 1
	note C_, 1
	octave_down
	note B_, 1
	note D_, 1
	note G_, 2
	note __, 2
	octave_up
	setloop $2
Music_739aa:
	set_background_nrx2 $84
	note G_, 1
	octave_down
	note B_, 1
	octave_down
	set_background_nrx2 $86
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	note D_, 1
	note __, 1
	octave_up
	doloop
	set_background_nrx2 $84
	note G_, 1
	note C_, 1
	octave_down
	set_background_nrx2 $86
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 3
	octave_up
	set_background_nrx2 $84
	note C_, 1
	octave_down
	set_background_nrx2 $86
	note C_, 1
	note __, 1
	note A_, 3
	set_background_nrx2 $84
	note D_, 1
	set_background_nrx2 $86
	note B_, 1
	set_background_nrx2 $84
	note D_, 1
	note B_, 4
	octave_down
	set_background_nrx2 $86
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note G_, 1
	octave_down
	note B_, 1
	set_background_nrx2 $84
	note G_, 2
	set_background_nrx2 $86
	note D_, 2
	set_background_nrx2 $84
	note E_, 2
	octave_down
	set_background_nrx2 $86
	note G_, 2
	octave_up
	set_background_nrx2 $84
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C_, 1
	note D_, 2
	note __, 2
	octave_down
	octave_down
	note D_, 2
	note __, 2
	note G_, 4
	note F#, 4
	note B_, 2
	octave_up
	note D_, 4
	set_background_nrx2 $86
	note D_, 1
	octave_down
	set_background_nrx2 $84
	note G_, 1
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	set_background_nrx2 $84
	note F#, 1
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	set_background_nrx2 $84
	note E_, 1
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	set_background_nrx2 $84
	note D_, 1
	note D_, 2
	set_background_nrx2 $86
	octave_up
	note B_, 2
	octave_up
	note C_, 2
	octave_down
	note B_, 2
	octave_up
	note D_, 4
	note C_, 2
	octave_down
	note B_, 4
	octave_up
	note D_, 1
	octave_down
	octave_down
	set_background_nrx2 $84
	note G_, 1
	octave_up
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	octave_down
	set_background_nrx2 $84
	note F#, 1
	octave_up
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	octave_down
	set_background_nrx2 $84
	note E_, 1
	octave_up
	octave_up
	set_background_nrx2 $86
	note D_, 1
	note __, 1
	note D_, 1
	octave_down
	octave_down
	set_background_nrx2 $84
	note D_, 1
	set_background_nrx2 $86
	note E_, 2
	set_background_nrx2 $84
	note C_, 1
	note __, 1
	note G_, 2
	note E_, 1
	note __, 1
	set_background_nrx2 $86
	note F#, 2
	set_background_nrx2 $84
	note D_, 1
	note __, 1
	octave_up
	note D_, 2
	octave_down
	set_background_nrx2 $86
	note B_, 2
	set_background_nrx2 $df
	tempo $3
	note B_, 1
	octave_up
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note D_, 1
	note E_, 1
	note G_, 1
	note __, 3
	octave_down
	octave_down
	octave_down
	note G_, 4
	octave_up
	octave_up
	octave_up
	note G_, 1
	note E_, 1
	note D_, 1
	octave_down
	note B_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	octave_down
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	doinfloop

Song_7139f_Ch2: ; 73aac
	tempo $6
	noise $2
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	set_background_nrx2 $20
	callchannel Music_73abd
	doinfloop

Music_73abd:
	setloop $2
Music_73abf:
	setloop $4
Music_73ac1:
	note G_, 2
	octave_up
	note D_, 1
	note B_, 1
	octave_down
	doloop
	setloop $4
Music_73ac9:
	note A_, 2
	octave_up
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	doloop
	setloop $4
Music_73ad3:
	note B_, 2
	octave_up
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	doloop
	octave_up
	setloop $2
Music_73ade:
	note C_, 2
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	doloop
	note C_, 2
	octave_up
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note C_, 1
	octave_up
	note G_, 1
	octave_up
	note E_, 1
	note G_, 1
	octave_down
	octave_down
	octave_down
	doloop
	octave_up
	octave_up
	setloop $2
Music_73af9:
	octave_down
	note E_, 2
	note __, 2
	octave_up
	note G_, 1
	note E_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 2
	note __, 2
	note D_, 2
	note C_, 4
	octave_up
	note C_, 1
	note E_, 1
	octave_down
	note D_, 2
	octave_up
	note C_, 1
	note E_, 1
	octave_down
	note E_, 2
	octave_up
	note C_, 1
	note G_, 1
	octave_down
	note G_, 2
	octave_up
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	doloop
	octave_down
	note C_, 2
	note G_, 2
	octave_up
	note E_, 2
	octave_down
	note C_, 2
	note D_, 2
	note A_, 2
	octave_up
	note F#, 2
	octave_down
	note G_, 4
	octave_down
	octave_up
	note G_, 1
	note B_, 1
	octave_down
	note A_, 2
	octave_up
	note G_, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	note B_, 2
	octave_up
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note D_, 2
	note G_, 1
	octave_up
	note G_, 1
	octave_down
	octave_down
	octave_down
	retchannel

Song_7139f_Ch3: ; 73b42
	tempo $6
	octave 1
	setloop $2
Music_73b47:
	setloop $3
Music_73b49:
	callchannel Music_73b9b
	callchannel Music_73ba8
	doloop
	callchannel Music_73b9b
	callchannel Music_73bad
	doloop
	setloop $2
Music_73b59:
	note C_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note C_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note __, 1
	note F#, 1
	note D#, 1
	doloop
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note C_, 1
	note __, 1
	note D_, 1
	note F#, 1
	doinfloop

Music_73b9b:
	note C_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note __, 1
	note G_, 1
	note G#, 1
	note C_, 1
	note __, 1
	note C_, 1
	note F#, 1
	retchannel

Music_73ba8:
	note D_, 1
	note __, 1
	note F#, 1
	note G_, 1
	retchannel

Music_73bad:
	note D_, 1
	note D#, 1
	note E_, 1
	note D_, 1
	retchannel

Song_713a8_Ch0: ; 73bb2
	tempo $6
	set_nrx1 $c0
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $d
	set_c15f $1
	octave 3
	note E_, 3
	note G#, 3
	note B_, 3
	octave_up
	note D_, 3
	set_c15f $0
	note G_, 1
	octave_down
	note G_, 1
	octave_up
	note G_, 1
	set_c15f $1
	set_background_nrx2 $17
	note G_, 2
	set_background_nrx2 $b7
	note G_, 3
	set_background_nrx2 $17
	note G_, 4
	end_channel

Song_713a8_Ch1: ; 73bd7
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $a7
	dutycycle $11
	set_c153c157 $3
	set_c15f $1
	octave 3
	note G#, 1
	octave_down
	note B_, 1
	octave_up
	note G#, 1
	note B_, 1
	note E_, 1
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note G#, 1
	octave_up
	note D_, 1
	note G_, 1
	octave_down
	note B_, 1
	octave_up
	note G_, 1
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	set_background_nrx2 $27
	note E_, 2
	set_background_nrx2 $a7
	note E_, 3
	set_background_nrx2 $27
	note E_, 4
	end_channel

Song_713a8_Ch2: ; 73c06
	tempo $6
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 2
	set_background_nrx2 $20
	note __, 1
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note F_, 2
	octave_down
	note F_, 1
	octave_up
	note F#, 1
	note F#, 1
	octave_down
	note F#, 1
	octave_up
	note G_, 2
	octave_down
	note G_, 1
	octave_up
	note E_, 1
	note D_, 1
	octave_down
	note E_, 1
	set_background_nrx2 $40
	note E_, 2
	set_background_nrx2 $20
	octave_up
	note E_, 3
	end_channel

Song_713a8_Ch3: ; 73c31
	tempo $3
	octave 1
	note D_, 2
	note F_, 2
	note C_, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note D_, 2
	note F_, 2
	note C_, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note D#, 2
	note D_, 2
	note F_, 2
	note __, 2
	note __, 2
	note E_, 1
	note E_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	end_channel

Song_713b1_Ch0: ; 73c4c
	tempo $10
	set_nrx1 $c0
	set_background_nrx2 $7a
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	key $3
	note C#, 1
	note E_, 1
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note F#, 1
	note G#, 1
	note E_, 4
	set_background_nrx2 $27
	note E_, 4
	end_channel

Song_713b1_Ch1: ; 73c68
	tempo $4
	set_nrx1 $80
	set_background_nrx2 $71
	dutycycle $11
	set_c153c157 $4
	set_c15f $0
	octave 2
	key $3
	note A_, 1
	octave_up
	note C#, 1
	note E_, 1
	note G#, 1
	note A_, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	octave_down
	note E_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	note E_, 1
	note G#, 1
	note A_, 1
	octave_down
	note A_, 1
	note B_, 1
	octave_up
	note E_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave_up
	note C#, 1
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	note C#, 1
	note E_, 1
	note G#, 1
	note A_, 1
	octave_up
	note C#, 1
	note E_, 1
	note C#, 1
	octave_down
	note A_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	octave_down
	note A_, 1
	note G#, 1
	set_background_nrx2 $77
	note C#, 8
	set_background_nrx2 $27
	note C#, 8
	end_channel

Song_713b1_Ch2: ; 73cb3
	tempo $4
	noise $9
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $3
	set_background_nrx2 $20
	note A_, 2
	octave_up
	note E_, 2
	note B_, 2
	octave_up
	note C#, 2
	octave_down
	note C#, 2
	note G#, 2
	note B_, 2
	octave_up
	note E_, 2
	octave_down
	note E_, 2
	note A_, 2
	note B_, 2
	octave_up
	note E_, 2
	octave_down
	note A_, 2
	note B_, 2
	octave_up
	note E_, 2
	note B_, 2
	note A_, 2
	note E_, 2
	octave_down
	note A_, 2
	note E_, 2
	note A_, 8
	end_channel

Song_713b1_Ch3: ; 73ce1
	tempo $1e
	octave 1
	note __, 1
	end_channel

Song_713ba_Ch0: ; 73ce6
	tempo $7
	set_nrx1 $80
	set_background_nrx2 $ba
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	key $5
	note D_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 2
	note G_, 1
	note F_, 1
	note G_, 8
	end_channel

Song_713ba_Ch1: ; 73d09
	tempo $7
	set_nrx1 $c0
	set_background_nrx2 $8a
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 2
	key $5
	note D_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	note G_, 1
	note F_, 2
	note E_, 1
	note D_, 1
	note E_, 8
	end_channel

Song_713ba_Ch2: ; 73d2e
	tempo $7
	noise $e
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $5
	set_background_nrx2 $20
	note G_, 1
	note G_, 1
	octave_up
	note D_, 1
	note F_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	note F_, 1
	note A_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	note F_, 1
	note A_, 1
	note B_, 2
	note G_, 1
	note D_, 1
	note C_, 8
	end_channel

Song_713ba_Ch3: ; 73d53
	tempo $7
	octave 1
	note D#, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	note __, 5
	note F#, 1
	note F_, 1
	note C_, 1
	end_channel

Song_713c3_Ch0: ; 73d6c
	tempo $b
	set_nrx1 $40
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $f
	set_c15f $1
	octave 4
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note __, 1
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	note __, 1
	octave_up
	note G_, 1
	note G_, 1
	note __, 1
	octave_down
	octave_down
	set_background_nrx2 $b3
	note B_, 1
	octave_up
	note D_, 4
	end_channel

Song_713c3_Ch1: ; 73d92
	tempo $b
	set_nrx1 $80
	set_background_nrx2 $79
	dutycycle $11
	set_c153c157 $3
	set_c15f $1
	octave 3
	note B_, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note A_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	octave_down
	set_background_nrx2 $83
	note G_, 1
	note F_, 4
	end_channel

Song_713c3_Ch2: ; 73db6
	tempo $b
	noise $e
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 2
	set_background_nrx2 $20
	note C_, 1
	octave_down
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave_up
	note C_, 1
	note D_, 1
	note __, 1
	octave_down
	note G#, 1
	note G_, 1
	note __, 1
	note D_, 1
	note G_, 2
	end_channel

Song_713c3_Ch3: ; 73dd6
	tempo $b
	octave 1
	note C_, 1
	note C#, 1
	note D_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note F_, 1
	note F#, 1
	note C_, 1
	note F_, 1
	end_channel

Song_713cc_Ch0: ; 73de9
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $b8
	dutycycle $11
	set_c153c157 $e
	set_c15f $1
	octave 4
	note A#, 3
	octave_down
	note A#, 1
	octave_up
	note A#, 3
	octave_down
	note A#, 1
	octave_up
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	octave_down
	note A_, 1
	octave_up
	note D#, 1
	note __, 1
	note F_, 2
	note E_, 2
	note F_, 1
	note __, 1
	octave_down
	note A_, 10
	end_channel

Song_713cc_Ch1: ; 73e0f
	tempo $6
	set_nrx1 $80
	set_background_nrx2 $98
	dutycycle $11
	set_c153c157 $e
	set_c15f $1
	octave 3
	note G_, 3
	octave_down
	note G_, 1
	octave_up
	note A#, 3
	octave_down
	note G_, 1
	octave_up
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	note F_, 1
	octave_up
	note G_, 1
	note __, 1
	note A_, 2
	note G#, 2
	note A_, 1
	note __, 1
	note C_, 10
	end_channel

Song_713cc_Ch2: ; 73e36
	tempo $6
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 2
	set_background_nrx2 $20
	note D#, 2
	octave_down
	note A#, 1
	octave_up
	note D#, 1
	note G_, 2
	octave_down
	note A#, 1
	octave_up
	note D#, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note __, 1
	note F_, 2
	note C_, 2
	note E_, 1
	note __, 1
	note D#, 10
	end_channel

Song_713cc_Ch3: ; 73e5b
	tempo $6
	octave 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note F_, 1
	end_channel

Song_713e7_Ch0: ; 73e76
	tempo $8
	set_nrx1 $40
	set_background_nrx2 $69
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	note C_, 6
	octave_down
	note B_, 2
	octave_up
	note C_, 2
	set_background_nrx2 $54
	note C_, 1
	set_background_nrx2 $69
	note D_, 1
	note E_, 6
	note F_, 2
	note E_, 2
	set_background_nrx2 $54
	note E_, 1
	set_background_nrx2 $69
	note F_, 1
	note G_, 6
	set_background_nrx2 $17
	note G_, 4
	end_channel

Song_713e7_Ch1: ; 73e9c
	tempo $8
	set_nrx1 $80
	set_background_nrx2 $72
	dutycycle $11
	set_c153c157 $10
	set_c15f $1
	octave 3
	note A_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	note B_, 1
	octave_up
	note D_, 1
	note F_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	octave_down
	note G_, 1
	note E_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note A_, 1
	octave_up
	note C_, 1
	note G_, 6
	set_background_nrx2 $27
	note G_, 4
	end_channel

Song_713e7_Ch2: ; 73ecd
	tempo $8
	noise $5
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	set_background_nrx2 $20
	note A_, 2
	note F_, 2
	note __, 1
	note C_, 1
	octave_up
	note D_, 2
	octave_down
	note G_, 2
	note B_, 2
	octave_up
	note C_, 2
	octave_down
	note G_, 2
	note __, 1
	note E_, 1
	note A_, 2
	octave_up
	note C_, 2
	octave_down
	note A_, 2
	note B_, 6
	end_channel

Song_713e7_Ch3: ; 73ef0
	tempo $8
	octave 1
	setloop $2
Music_73ef5:
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	doloop
	note C_, 1
	end_channel

Music_73f04:
	note F#, 1
	doloop
	note C_, 1
	end_channel

Music_73f08:
	tempo $8
	octave 1
	setloop $2
Music_73f0d:
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note D_, 1


SECTION "Music Headers 1D", ROMX [$529c], BANK [$1d]
SongBanks_1d: ; 7529c
	db BANK(SongHeader_712f3)
	db BANK(SongHeader_712f4)
	db BANK(SongHeader_712fd)
	db BANK(SongHeader_71306)
	db BANK(SongHeader_7130f)
	db BANK(SongHeader_TrainerVictory)
	db BANK(SongHeader_TrainerBattle)
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
	dw Song_7534e_Ch0
	dw Song_7534e_Ch1
	dw Song_7534e_Ch2
	dw Song_7534e_Ch3

SongHeader_75357: ; 75357
	db %1111
	dw Song_75357_Ch0
	dw Song_75357_Ch1
	dw Song_75357_Ch2
	dw Song_75357_Ch3

SongHeader_75360: ; 75360
	db %1111
	dw Song_75360_Ch0
	dw Song_75360_Ch1
	dw Song_75360_Ch2
	dw Song_75360_Ch3

SongHeader_75369: ; 75369
	db %1111
	dw Song_75369_Ch0
	dw Song_75369_Ch1
	dw Song_75369_Ch2
	dw Song_75369_Ch3

SongHeader_75372: ; 75372
	db %1111
	dw Song_75372_Ch0
	dw Song_75372_Ch1
	dw Song_75372_Ch2
	dw Song_75372_Ch3

SongHeader_7537b: ; 7537b
	db %1111
	dw Song_7537b_Ch0
	dw Song_7537b_Ch1
	dw Song_7537b_Ch2
	dw Song_7537b_Ch3

	ds $51

SongHeader_753d5: ; 753d5
	db %1111
	dw Song_753d5_Ch0
	dw Song_753d5_Ch1
	dw Song_753d5_Ch2
	dw Song_753d5_Ch3

SongHeader_753de: ; 753de
	db %1111
	dw Song_753de_Ch0
	dw Song_753de_Ch1
	dw Song_753de_Ch2
	dw Song_753de_Ch3

	ds $9

Song_7534e_Ch0: ; 753f0
	tempo $f
	set_nrx1 $c0
	set_background_nrx2 $97
	dutycycle $11
	set_c153c157 $6
	set_c15f $1
	octave 4
	key $3
	callchannel Music_75452
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note C_, 3
	octave_down
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	octave_up
	callchannel Music_75452
	note C_, 2
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note E_, 1
	note F_, 2
	note E_, 2
	callchannel Music_7547a
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	octave_up
	note E_, 2
	note F_, 2
	note E_, 2
	callchannel Music_7547a
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	note C_, 1
	octave_up
	note E_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note C_, 1
	note F_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note E_, 1
	note D_, 1
	note C_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note G_, 16
	mute_channel
	note G_, 1
	doinfloop

Music_75452:
	octave 4
	note C_, 1
	note C_, 1
	note E_, 1
	note E_, 1
	note G_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note D_, 3
	octave_down
	octave_down
	note B_, 1
	note B_, 1
	octave_up
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note D_, 3
	octave_down
	octave_down
	note A_, 1
	note A_, 1
	octave_up
	octave_up
	retchannel

Music_7547a:
	octave 4
	note D_, 1
	octave_down
	note G_, 1
	octave_down
	note G_, 1
	note F#, 1
	note F_, 1
	octave_up
	note G_, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	retchannel

Song_7534e_Ch1: ; 75489
	tempo $f
	set_nrx1 $80
	set_background_nrx2 $77
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	key $3
	callchannel Music_754e2
	note E_, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	note E_, 1
	octave_up
	note G_, 3
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	callchannel Music_754e2
	note E_, 2
	octave_down
	note E_, 1
	octave_up
	note G_, 1
	octave_up
	note C_, 2
	octave_down
	note A_, 2
	callchannel Music_75502
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	note A_, 1
	note E_, 1
	callchannel Music_75502
	note A_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note G#, 1
	note C_, 1
	note G_, 1
	note E_, 1
	octave_down
	note G_, 1
	note G_, 1
	note A_, 1
	octave_up
	note C_, 1
	note C_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave_down
	note B_, 2
	note __, 1
	note B_, 1
	note A_, 2
	note __, 1
	note A_, 1
	note G_, 2
	note __, 1
	note G_, 1
	note F_, 2
	note F_, 2
	doinfloop

Music_754e2:
	octave 3
	note C_, 1
	note C_, 1
	octave_up
	note C_, 1
	note C_, 1
	note E_, 1
	note E_, 1
	note C_, 1
	octave_down
	note E_, 1
	note G_, 1
	note B_, 1
	octave_down
	note G_, 1
	octave_up
	note G_, 3
	octave_down
	note G_, 1
	note G_, 1
	octave_up
	note G_, 1
	note B_, 1
	octave_down
	note G_, 1
	octave_up
	note F_, 3
	octave_down
	note F_, 1
	note F_, 1
	octave_up
	retchannel

Music_75502:
	octave 3
	set_background_nrx2 $67
	octave_up
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_down
	octave_down
	set_background_nrx2 $87
	note B_, 1
	note A#, 1
	note A_, 1
	octave_up
	octave_up
	set_background_nrx2 $67
	note G_, 1
	note F_, 1
	note E_, 1
	octave_down
	octave_down
	set_background_nrx2 $87
	note G_, 1
	octave_up
	note C_, 1
	note G_, 1
	note E_, 1
	retchannel

Song_7534e_Ch2: ; 75522
	tempo $f
	noise $4
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $3
	set_background_nrx2 $20
	setloop $2
Music_75533:
	note C_, 1
	note C_, 1
	note G_, 1
	note G_, 1
	note C_, 1
	octave_up
	note C_, 1
	octave_down
	note E_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note E_, 1
	note B_, 1
	note B_, 1
	note D_, 1
	note A_, 1
	note G_, 1
	note B_, 1
	octave_up
	note C_, 1
	note C_, 1
	octave_down
	note G_, 1
	note G_, 1
	note C_, 1
	note C_, 1
	note G_, 1
	note G_, 1
	doloop
	callchannel Music_7558c
	note C_, 1
	note C_, 1
	note E_, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note F#, 1
	note F#, 1
	callchannel Music_7558c
	note C_, 1
	note C_, 1
	note G_, 1
	note G_, 1
	octave_up
	note E_, 1
	note E_, 1
	note C_, 1
	note C_, 1
	octave_down
	note F_, 1
	note C_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note G_, 2
	note __, 1
	note G_, 1
	note F_, 2
	note __, 1
	note F_, 1
	note E_, 2
	note __, 1
	note E_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	doinfloop

Music_7558c:
	note G_, 1
	octave_up
	note D_, 1
	note G_, 1
	note D_, 1
	octave_down
	note G_, 1
	note D_, 1
	octave_down
	note G_, 1
	note A_, 1
	octave_up
	retchannel

Song_7534e_Ch3: ; 75599
	tempo $f
	octave 1
	setloop $3
Music_7559e:
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	doloop
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note A_, 1
	setloop $3
Music_755b1:
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	doloop
	note C#, 1
	note G_, 1
	note D#, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	setloop $2
Music_755dc:
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note A_, 1
	doloop
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note C#, 2
	note G#, 1
	note C#, 1
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note D_, 1
	note F_, 1
	doinfloop

Song_75357_Ch0: ; 755fa
	tempo $7
	set_nrx1 $c0
	set_background_nrx2 $a7
	dutycycle $11
	set_c153c157 $5
	set_c15f $13
	octave 3
	setloop $2
Music_75609:
	note A_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	note B_, 1
	octave_up
	note A_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note B_, 2
	octave_up
	note C#, 1
	note __, 2
	note D_, 1
	note __, 5
	note E_, 2
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	octave_down
	note A_, 2
	note __, 1
	note A_, 1
	note A_, 2
	note __, 1
	octave_up
	octave_up
	note F#, 1
	note D_, 1
	note F#, 1
	note __, 3
	note G#, 1
	note E_, 1
	note G#, 1
	note __, 3
	octave_down
	octave_down
	doloop
	octave_up
	setloop $4
Music_7563a:
	note E_, 1
	note __, 1
	note E_, 1
	doloop
	note F#, 2
	note G#, 1
	note __, 2
	note A_, 2
	note __, 1
	note A_, 1
	note B_, 2
	note A_, 1
	note __, 3
	octave_up
	note C#, 3
	note __, 3
	note D_, 2
	note C#, 1
	octave_down
	note B_, 3
	note __, 2
	note G#, 1
	note G#, 2
	note A_, 2
	note B_, 2
	setloop $2
Music_75655:
	note B_, 2
	note A_, 1
	note A_, 3
	note __, 3
	doloop
	note A_, 2
	note G#, 1
	note __, 2
	note E_, 2
	note __, 16
	note G_, 1
	note G_, 2
	note __, 1
	note A_, 3
	callchannel Music_75684
	setloop $3
Music_75668:
	note A_, 1
	note __, 2
	doloop
	note B_, 1
	note __, 1
	note A#, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 6
	callchannel Music_75684
	note A_, 1
	note __, 2
	note G#, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 6
	doinfloop

Music_75684:
	octave_up
	note C#, 1
	note __, 2
	octave_down
	note A_, 1
	note __, 5
	note A_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 2
	note A_, 1
	note __, 2
	note A_, 1
	note B_, 1
	note __, 1
	note A_, 1
	octave_up
	note C#, 1
	note __, 2
	octave_down
	retchannel

Song_75357_Ch1: ; 7569c
	tempo $7
	set_nrx1 $c0
	set_background_nrx2 $c3
	dutycycle $11
	octave 1
	setloop $6
Music_756a7:
	note A_, 2
	note __, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_down
	note A_, 1
	note C#, 2
	note __, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note A_, 1
	octave_down
	note C#, 1
	note D_, 2
	note __, 1
	octave_up
	note F#, 1
	note D_, 1
	octave_down
	note D_, 1
	note E_, 2
	note __, 1
	octave_up
	note B_, 1
	note G#, 1
	octave_down
	note E_, 1
	doloop
	setloop $2
Music_756ca:
	note D_, 1
	note A_, 1
	note D_, 1
	octave_up
	note F#, 2
	octave_down
	note A_, 1
	note D_, 2
	note __, 1
	doloop
	note D_, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	note D#, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	note B_, 1
	note E_, 1
	octave_down
	note E_, 1
	octave_up
	note D_, 1
	octave_down
	note E_, 1
	note F#, 1
	octave_up
	note D_, 1
	octave_down
	note F#, 1
	note G#, 1
	octave_up
	note D_, 1
	octave_down
	note G#, 1
	note A_, 1
	octave_up
	note D_, 1
	octave_down
	note A_, 1
	note B_, 1
	note __, 2
	note E_, 1
	note __, 1
	octave_up
	note E_, 1
	note E_, 1
	note __, 2
	octave_down
	note A_, 3
	octave_up
	callchannel Music_75747
	callchannel Music_75736
	callchannel Music_75747
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	octave_down
	note G#, 2
	octave_up
	note G#, 1
	callchannel Music_75747
	callchannel Music_75736
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	octave_down
	note C#, 2
	octave_up
	note C#, 1
	setloop $2
Music_7572a:
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	doloop
	octave_down
	note E_, 2
	note F#, 1
	note G#, 2
	note A_, 1
	note __, 6
	doinfloop

Music_75736:
	octave_down
	note D_, 2
	octave_up
	note D_, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	octave_down
	note G#, 2
	octave_up
	note G#, 1
	retchannel

Music_75747:
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	octave_down
	note C#, 2
	octave_up
	note C#, 1
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	octave_down
	note A_, 2
	octave_up
	note A_, 1
	retchannel

Song_75357_Ch2: ; 75758
	tempo $7
	noise $a
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $6
	octave 4
	set_background_nrx2 $20
	setloop $2
Music_75767:
	note A_, 1
	octave_down
	note C#, 1
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	note D_, 1
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	note D#, 1
	octave_up
	note A_, 1
	note A_, 1
	octave_down
	note E_, 1
	octave_up
	note A_, 1
	octave_down
	note F#, 2
	note G#, 1
	note __, 2
	note A_, 2
	note __, 2
	octave_down
	note G#, 1
	note E_, 1
	octave_up
	octave_up
	note C#, 2
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	octave_down
	note E_, 2
	note __, 1
	note E_, 1
	note E_, 2
	note __, 1
	octave_up
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	note A_, 1
	note F#, 1
	note D_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note G#, 1
	note E_, 1
	octave_down
	note B_, 1
	octave_up
	octave_up
	octave_up
	doloop
	note C#, 1
	octave_down
	note C#, 1
	octave_up
	note C#, 1
	note C#, 1
	octave_down
	note D_, 1
	octave_up
	note C#, 1
	note C#, 1
	octave_down
	note D#, 1
	octave_up
	note C#, 1
	note C#, 1
	octave_down
	note E_, 1
	octave_up
	note C#, 1
	note D_, 1
	octave_down
	note F#, 1
	octave_up
	note E_, 1
	octave_down
	note A_, 1
	note F#, 1
	octave_up
	note F#, 1
	octave_down
	note D_, 1
	note F#, 1
	octave_up
	note E_, 1
	note G#, 1
	note __, 1
	note E_, 1
	octave_down
	note C#, 1
	note E_, 1
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note E_, 1
	note A_, 1
	octave_up
	note C#, 1
	note __, 1
	note E_, 1
	note B_, 1
	note __, 1
	note A_, 1
	note G#, 1
	note E_, 1
	octave_down
	note B_, 1
	note G#, 1
	note __, 1
	note E_, 1
	note E_, 2
	note F#, 2
	note G#, 2
	setloop $2
Music_757ef:
	note F#, 1
	note D_, 1
	octave_down
	note A_, 1
	octave_up
	note A_, 2
	note F#, 1
	octave_down
	note A_, 2
	note __, 1
	octave_up
	doloop
	octave_up
	note F#, 2
	note E_, 2
	note __, 1
	note D_, 2
	octave_down
	note F#, 1
	octave_down
	note G#, 1
	note A_, 1
	octave_up
	note F#, 1
	octave_down
	note A_, 1
	note B_, 1
	octave_up
	note F#, 1
	octave_down
	note B_, 1
	octave_up
	note C#, 1
	note F#, 1
	note C#, 1
	note D_, 1
	note __, 2
	note G#, 1
	note __, 1
	octave_up
	note D_, 1
	note D_, 1
	note __, 2
	note C#, 3
	callchannel Music_7583a
	note G#, 1
	octave_down
	note D_, 1
	octave_up
	note G_, 1
	note F#, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note E_, 1
	note __, 6
	callchannel Music_7583a
	note C#, 1
	octave_down
	note C#, 1
	octave_up
	note C#, 1
	note C_, 1
	octave_down
	note C#, 1
	octave_up
	note C#, 1
	note __, 6
	doinfloop

Music_7583a:
	note A_, 1
	note __, 1
	octave_down
	note C#, 1
	octave_up
	note E_, 1
	note __, 1
	octave_down
	note E_, 1
	note __, 2
	note C#, 1
	octave_up
	note E_, 1
	note __, 1
	note C#, 1
	note D_, 1
	octave_down
	note F#, 1
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 1
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note E_, 1
	octave_up
	note E_, 1
	note D#, 1
	octave_down
	note D_, 1
	octave_up
	note D_, 1
	note C#, 1
	note __, 1
	octave_down
	note C#, 1
	octave_up
	note E_, 1
	note __, 1
	octave_down
	note E_, 1
	octave_up
	setloop $2
Music_75869:
	note E_, 1
	note __, 1
	octave_down
	note C#, 1
	octave_up
	doloop
	retchannel

Song_75357_Ch3: ; 75870
	tempo $7
	octave 1
	setloop $7
Music_75875:
	setloop $3
Music_75877:
	callchannel Music_758ab
	doloop
	callchannel Music_758b2
	doloop
	callchannel Music_758b9
	note D#, 1
	note F#, 1
	note C#, 1
	note D_, 1
	note A_, 1
	note C_, 1
	note F_, 1
	note __, 2
	note C_, 1
	note __, 1
	note C#, 1
	note F_, 1
	note __, 2
	note F#, 3
	setloop $3
Music_75892:
	setloop $3
Music_75894:
	callchannel Music_758ab
	doloop
	callchannel Music_758b2
	doloop
	setloop $2
Music_7589e:
	callchannel Music_758ab
	doloop
	callchannel Music_758b9
	note __, 2
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	doinfloop

Music_758ab:
	note C_, 1
	note __, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 1
	retchannel

Music_758b2:
	note __, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 1
	retchannel

Music_758b9:
	note C_, 1
	note D#, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	retchannel

Song_75360_Ch0: ; 758c0
	set_nrx1 $c0
	set_background_nrx2 $a8
	dutycycle $11
	set_c153c157 $10
	set_c15f $1
	octave 2
	tempo $5
	setloop $2
Music_758cf:
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_down
	note E_, 1
	note C_, 2
	octave_up
	note D_, 2
	note E_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	setloop $4
Music_758e0:
	note E_, 1
	note G_, 1
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	doloop
	octave_down
	note C_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note E_, 1
	octave_down
	note E_, 1
	note C_, 2
	octave_up
	note D_, 2
	note E_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	setloop $2
Music_758f9:
	note C_, 1
	note D#, 1
	octave_down
	note D#, 1
	note G#, 1
	octave_up
	doloop
	setloop $2
Music_75902:
	note D_, 1
	note F_, 1
	octave_down
	note F_, 1
	note A#, 1
	octave_up
	doloop
	octave_down
	doloop
	octave_up
	octave_up
	note E_, 2
	note F_, 2
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave_up
	note F_, 2
	note __, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note F_, 2
	note __, 2
	note G_, 2
	setloop $2
Music_75923:
	note E_, 2
	note __, 2
	doloop
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 14
	note __, 4
	note E_, 2
	note F_, 2
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave_up
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note G_, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C_, 10
	note G_, 8
	note E_, 2
	note F_, 2
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave_up
	note F_, 2
	note __, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note F_, 2
	note __, 2
	note G_, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 14
	note __, 4
	note E_, 2
	note F_, 2
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave_up
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	note G_, 2
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	note E_, 2
	note D_, 2
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note D#, 2
	note D_, 2
	note C_, 2
	note C_, 6
	note __, 4
	octave_down
	octave_down
	note A_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	octave_up
	octave_up
	octave_up
	note F_, 1
	note D#, 1
	note C_, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	octave_down
	note C_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	note G_, 1
	octave_down
	note A_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	octave_up
	octave_up
	note C_, 1
	octave_down
	note A#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave_down
	note A#, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	octave_down
	note A_, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	octave_up
	octave_up
	octave_up
	note F_, 1
	note D#, 1
	note C_, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	octave_down
	note C_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note D#, 1
	note G_, 1
	octave_down
	note A_, 2
	note G#, 2
	octave_down
	note D_, 1
	note F#, 1
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	note F#, 1
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note E_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	note A_, 1
	octave_up
	note D_, 1
	tempo $4
	octave_down
	octave_down
	note B_, 1
	octave_up
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	note F_, 1
	octave_down
	note B_, 1
	octave_up
	note G_, 1
	note __, 5
	octave_down
	note F_, 5
	doinfloop

Song_75360_Ch1: ; 75a26
	tempo $5
	set_nrx1 $80
	set_background_nrx2 $78
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	set_background_nrx2 $7c
	setloop $2
Music_75a37:
	note A#, 5
	note __, 1
	note A#, 2
	setloop $2
Music_75a3c:
	octave_up
	note C_, 2
	note __, 2
	octave_down
	note A_, 2
	note A#, 6
	note __, 2
	note A#, 2
	doloop
	octave_up
	note C_, 2
	note __, 2
	octave_down
	note A_, 2
	note A#, 4
	note A_, 2
	note G#, 2
	note G_, 10
	doloop
	set_background_nrx2 $78
	octave_down
	note C_, 16
	setloop $6
Music_75a55:
	note __, 16
	doloop
	setloop $3
Music_75a59:
	note G_, 8
	note D_, 8
	note C_, 16
	doloop
	note G_, 8
	note D_, 8
	note C_, 2
	note E_, 1
	note G_, 1
	octave_down
	note A#, 2
	octave_up
	note A_, 1
	octave_up
	note C_, 1
	octave_down
	octave_down
	note G_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note E_, 6
	octave_up
	octave_up
	octave_up
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D#, 2
	note D#, 2
	note D_, 2
	note C_, 4
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	octave_down
	note G_, 1
	octave_up
	note C_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	octave_up
	note C_, 1
	note D#, 2
	note D#, 2
	note D_, 2
	note C_, 4
	octave_up
	note C_, 2
	octave_down
	octave_up
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note A_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	octave_down
	note A_, 1
	octave_up
	note C_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave_up
	note C_, 1
	note D#, 2
	note D#, 2
	note D_, 2
	note C_, 4
	note G_, 2
	note A_, 2
	octave_up
	note C_, 2
	note D_, 2
	octave_down
	octave_down
	note F#, 1
	note F#, 1
	octave_up
	octave_up
	note D_, 2
	octave_down
	octave_down
	note G_, 1
	note G_, 1
	octave_up
	octave_up
	note A_, 2
	octave_down
	octave_down
	note G#, 1
	note G#, 1
	octave_up
	octave_up
	note E_, 2
	octave_down
	octave_down
	note A_, 1
	note A_, 1
	octave_up
	octave_up
	note G_, 10
	note __, 2
	octave_down
	octave_down
	note G#, 4
	doinfloop

Song_75360_Ch2: ; 75af2
	tempo $5
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $7
	octave 1
	set_background_nrx2 $20
	setloop $2
Music_75b01:
	callchannel Music_75b9d
	callchannel Music_75bc7
	callchannel Music_75b9d
	callchannel Music_75bb2
	doloop
	setloop $3
Music_75b10:
	callchannel Music_75b9d
	callchannel Music_75bb2
	callchannel Music_75b9d
	callchannel Music_75bda
	doloop
	callchannel Music_75b9d
	callchannel Music_75bb2
	note C_, 2
	note __, 2
	octave_up
	octave_up
	octave_up
	note D#, 2
	note __, 2
	note E_, 2
	note G_, 2
	note A_, 2
	octave_up
	note C_, 2
	octave_down
	octave_down
	octave_down
	octave_down
	note G#, 1
	octave_up
	note C_, 1
	note D#, 1
	note G#, 1
	octave_down
	note A#, 2
	octave_up
	note C_, 4
	note E_, 1
	note G_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note A#, 1
	note F_, 2
	note F_, 2
	note A_, 2
	octave_up
	note C_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave_down
	note F_, 2
	note F_, 2
	note A_, 2
	octave_up
	note C_, 2
	note D#, 2
	octave_down
	note A_, 2
	note A#, 2
	note B_, 2
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note E_, 2
	note E_, 2
	note G_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	octave_up
	note C_, 2
	note C_, 2
	octave_down
	note A#, 2
	note A#, 2
	note A_, 2
	note A_, 2
	note G_, 2
	note G_, 2
	note F_, 2
	note F_, 2
	note A_, 2
	note A_, 2
	octave_up
	note C_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave_down
	note F_, 2
	note F_, 2
	note A_, 2
	octave_up
	note C_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave_down
	note D_, 2
	octave_up
	note D_, 1
	note D_, 1
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	note E_, 1
	octave_down
	note F_, 2
	octave_up
	note F_, 1
	note F_, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note F#, 1
	octave_down
	note G_, 1
	octave_up
	note B_, 1
	note G_, 1
	note D_, 1
	octave_down
	note G_, 2
	note G_, 2
	note __, 4
	note C#, 4
	doinfloop

Music_75b9d:
	note C_, 1
	octave_up
	octave_up
	octave_up
	note C_, 1
	octave_down
	note C_, 1
	octave_down
	note C_, 1
	octave_down
	note C_, 2
	note A#, 2
	octave_up
	octave_up
	note C_, 2
	octave_down
	note C_, 2
	octave_down
	note A#, 2
	note C_, 2
	retchannel

Music_75bb2:
	setloop $2
Music_75bb4:
	note G#, 1
	octave_up
	note C_, 1
	note D#, 1
	note G#, 1
	octave_down
	doloop
	setloop $2
Music_75bbd:
	note A#, 1
	octave_up
	note D_, 1
	note F_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	doloop
	retchannel

Music_75bc7:
	setloop $2
Music_75bc9:
	note C_, 1
	note E_, 1
	note G_, 1
	octave_up
	note C_, 1
	octave_down
	doloop
	setloop $2
Music_75bd2:
	note C_, 1
	note E_, 1
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	doloop
	retchannel

Music_75bda:
	setloop $2
Music_75bdc:
	note G#, 1
	octave_up
	note C_, 1
	note D#, 1
	note G#, 1
	octave_down
	doloop
	setloop $2
Music_75be5:
	note A#, 1
	octave_up
	note E_, 1
	note F_, 1
	octave_up
	note D_, 1
	octave_down
	octave_down
	doloop
	retchannel

Song_75360_Ch3: ; 75bef
	tempo $5
	octave 1
	setloop $7
Music_75bf4:
	tempo $5
	note C_, 1
	note G_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note C_, 1
	note F_, 1
	note G_, 1
	octave_up
	octave_up
	note C_, 2
	octave_down
	octave_down
	note C_, 1
	note G_, 1
	octave_up
	octave_up
	note C_, 2
	octave_down
	octave_down
	note F_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	setloop $7
Music_75c23:
	tempo $5
	note C_, 1
	note G_, 1
	note A_, 1
	note C_, 1
	note C_, 1
	note G_, 1
	note A_, 2
	note C_, 1
	note G_, 1
	note A_, 2
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	note G_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	tempo $4
	note E_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	setloop $3
Music_75c4a:
	tempo $5
	note C_, 1
	note G_, 1
	note A_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note A_, 2
	note C_, 1
	note G_, 1
	note A_, 2
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	tempo $5
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	setloop $2
Music_75c6f:
	tempo $5
	note C_, 1
	note G_, 1
	note A_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note A_, 2
	note C_, 1
	note G_, 1
	note A_, 2
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	doloop
	note C_, 1
	note __, 7
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note G_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note __, 1
	note A_, 2
	tempo $4
	note E_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	tempo $5
	setloop $2
Music_75ca1:
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	doloop
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	setloop $2
Music_75cbc:
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	doloop
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	setloop $2
Music_75cd7:
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	doloop
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note __, 4
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	doinfloop

Song_75369_Ch0: ; 75d0e
	tempo $6
	set_nrx1 $40
	set_background_nrx2 $98
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 4
	set_nrx1 $40
	set_c153c157 $4
	set_c15f $1
	note D_, 3
	octave_up
	note D_, 3
	note C_, 2
	octave_down
	note B_, 3
	note A_, 3
	note G_, 2
	octave_up
	note C_, 3
	octave_down
	note B_, 3
	note A#, 2
	note B_, 8
	octave_down
	note B_, 3
	octave_up
	note B_, 3
	note A_, 2
	note G_, 3
	note F#, 3
	note E_, 2
	note F_, 3
	note E_, 3
	note D#, 2
	note E_, 7
	note __, 1
	note E_, 3
	octave_up
	note E_, 3
	note D_, 2
	note C_, 3
	octave_down
	note B_, 3
	note A_, 2
	note D_, 3
	octave_up
	note D_, 3
	note C_, 2
	octave_down
	note B_, 3
	note A_, 3
	note B_, 2
	octave_up
	note D_, 4
	octave_down
	octave_down
	note C_, 1
	note __, 1
	octave_up
	octave_up
	note C_, 4
	octave_down
	octave_down
	note C_, 1
	note __, 1
	octave_up
	octave_up
	note E_, 4
	octave_down
	octave_down
	note D_, 1
	note __, 1
	octave_up
	note B_, 4
	octave_down
	note F#, 1
	note __, 1
	octave_up
	note E_, 4
	note F#, 4
	note G_, 16
	octave_down
	note D_, 2
	note D_, 2
	note D_, 2
	note __, 2
	set_nrx1 $40
	set_c153c157 $3
	set_c15f $1
	set_background_nrx2 $a8
	note G_, 4
	note F#, 4
	note G_, 6
	note D#, 6
	note F_, 4
	note G_, 4
	note A_, 4
	octave_up
	note C_, 4
	octave_down
	note A#, 4
	note F_, 6
	note D_, 6
	note D#, 4
	note F_, 4
	note F_, 4
	note A_, 4
	note A#, 4
	note D#, 6
	note C_, 6
	note D_, 4
	note D#, 4
	note G_, 4
	note F_, 4
	note D#, 4
	note D_, 8
	note E_, 8
	note G_, 8
	note A_, 8
	octave_up
	doinfloop

Song_75369_Ch1: ; 75d95
	tempo $6
	set_nrx1 $80
	set_background_nrx2 $67
	dutycycle $11
	set_c153c157 $6
	set_c15f $1
	octave 5
	set_nrx1 $80
	set_background_nrx2 $87
	note D_, 1
	octave_down
	octave_down
	octave_down
	note G_, 1
	note B_, 1
	octave_up
	octave_up
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	note D_, 1
	note G_, 1
	octave_up
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note B_, 1
	octave_down
	octave_down
	note B_, 1
	note G_, 1
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note D_, 1
	octave_down
	note B_, 1
	octave_up
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	octave_down
	octave_down
	note B_, 1
	octave_up
	note D#, 1
	octave_up
	octave_up
	note B_, 1
	octave_down
	octave_down
	note F#, 1
	note A_, 1
	octave_up
	octave_up
	note A#, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note B_, 1
	octave_down
	octave_down
	octave_down
	note F#, 1
	note B_, 1
	octave_up
	note D#, 1
	note F#, 1
	note A_, 1
	note B_, 1
	octave_up
	note D#, 1
	note B_, 1
	octave_down
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	octave_up
	octave_up
	note B_, 1
	octave_down
	octave_down
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	octave_up
	note F#, 1
	octave_down
	octave_down
	octave_down
	note B_, 1
	note G_, 1
	octave_up
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	octave_down
	note E_, 1
	octave_up
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	octave_down
	note G_, 1
	note B_, 1
	octave_up
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note D_, 1
	note F_, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note B_, 1
	note G_, 1
	note D_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	note E_, 1
	note G_, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	note C_, 1
	note E_, 1
	octave_up
	note F#, 1
	octave_down
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	note G_, 1
	note E_, 1
	octave_up
	note D_, 1
	octave_down
	note C_, 1
	octave_down
	note G_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note E_, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G_, 1
	note B_, 1
	octave_up
	octave_up
	note E_, 1
	octave_down
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	note D_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_down
	note B_, 2
	note C_, 1
	note E_, 1
	note B_, 1
	note __, 1
	note A_, 2
	note C_, 1
	note E_, 1
	note A_, 1
	note __, 1
	octave_up
	note C_, 2
	octave_down
	octave_down
	note A_, 1
	octave_up
	note F#, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note C_, 2
	note E_, 2
	note D_, 2
	note A_, 2
	note E_, 2
	note G_, 1
	octave_up
	note C_, 1
	note G_, 1
	note __, 1
	octave_down
	note E_, 2
	note G_, 1
	octave_up
	note C_, 1
	note G_, 1
	note __, 1
	octave_down
	note D_, 2
	note C_, 2
	octave_down
	setloop $3
Music_75eca:
	note B_, 2
	doloop
	note __, 10
	octave_up
	set_nrx1 $80
	set_background_nrx2 $74
	setloop $3
Music_75ed4:
	note A#, 1
	octave_up
	note D#, 1
	octave_down
	doloop
	setloop $3
Music_75edb:
	note G_, 1
	note A#, 1
	doloop
	octave_down
	note A#, 1
	octave_up
	note F_, 1
	octave_down
	note A#, 1
	octave_up
	note F_, 1
	setloop $2
Music_75ee8:
	note A#, 1
	octave_up
	note G_, 1
	octave_down
	doloop
	setloop $2
Music_75eef:
	note G_, 1
	octave_up
	note A_, 1
	octave_down
	doloop
	setloop $2
Music_75ef6:
	note D#, 1
	octave_up
	octave_up
	note C_, 1
	octave_down
	octave_down
	doloop
	setloop $2
Music_75eff:
	note G_, 1
	octave_up
	note A#, 1
	octave_down
	doloop
	setloop $3
Music_75f06:
	note D_, 1
	note A#, 1
	doloop
	octave_down
	setloop $3
Music_75f0c:
	note A#, 1
	octave_up
	note F_, 1
	octave_down
	doloop
	octave_up
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	setloop $2
Music_75f18:
	note D_, 1
	octave_up
	note F_, 1
	octave_down
	doloop
	octave_down
	note A#, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	note A#, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	note D_, 1
	octave_up
	note A_, 1
	octave_down
	note D#, 1
	octave_up
	note A_, 1
	octave_down
	setloop $2
Music_75f33:
	note D_, 1
	octave_up
	note A#, 1
	octave_down
	doloop
	setloop $3
Music_75f3a:
	note C_, 1
	note G_, 1
	doloop
	octave_down
	setloop $3
Music_75f40:
	note G_, 1
	octave_up
	note D#, 1
	octave_down
	doloop
	note G_, 1
	octave_up
	note D_, 1
	octave_down
	note G_, 1
	octave_up
	note D_, 1
	setloop $2
Music_75f4e:
	note G_, 1
	octave_up
	note D#, 1
	octave_down
	doloop
	setloop $2
Music_75f55:
	note D#, 1
	octave_up
	note G_, 1
	octave_down
	doloop
	octave_down
	setloop $2
Music_75f5d:
	note A#, 1
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	doloop
	setloop $2
Music_75f66:
	note G_, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	octave_down
	doloop
	octave_up
	setloop $3
Music_75f70:
	note F#, 1
	octave_up
	note D_, 1
	octave_down
	doloop
	note A_, 1
	octave_up
	note F#, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	octave_down
	note G_, 1
	octave_up
	note E_, 1
	octave_down
	octave_down
	note E_, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note F#, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G_, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note G#, 1
	octave_up
	octave_up
	note G_, 1
	octave_down
	octave_down
	note A_, 1
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note A#, 1
	octave_up
	octave_up
	note A_, 1
	octave_down
	octave_down
	note B_, 1
	octave_up
	octave_up
	note A_, 1
	octave_down
	note C_, 1
	octave_up
	note A_, 1
	octave_up
	doinfloop

Song_75369_Ch2: ; 75fb2
	tempo $6
	noise $2
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	noise $2
	set_background_nrx2 $20
	setloop $2
Music_75fc3:
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	doloop
	note A_, 2
	octave_up
	note A_, 1
	note __, 1
	note C_, 2
	octave_up
	note C_, 1
	note __, 1
	octave_down
	octave_down
	setloop $2
Music_75fd5:
	note B_, 2
	octave_up
	note B_, 1
	note __, 1
	octave_down
	doloop
	octave_up
	note C#, 2
	octave_up
	note C#, 1
	note __, 1
	octave_down
	note D_, 2
	note D#, 2
	note E_, 2
	octave_up
	note E_, 1
	note __, 1
	octave_down
	octave_down
	note B_, 2
	octave_up
	note B_, 1
	note __, 1
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	note __, 1
	octave_down
	note G#, 2
	octave_up
	note G#, 1
	note __, 1
	octave_down
	octave_down
	note B_, 2
	octave_up
	note B_, 1
	note __, 1
	note D_, 2
	octave_up
	note D_, 1
	note __, 1
	octave_down
	note E_, 2
	octave_up
	note E_, 1
	note __, 1
	octave_down
	note C_, 2
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note C_, 1
	note __, 1
	note D_, 4
	note E_, 2
	note C_, 2
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note G_, 1
	note __, 1
	note B_, 4
	note G_, 2
	octave_up
	note C_, 2
	octave_down
	note B_, 2
	octave_down
	setloop $2
Music_76029:
	note A_, 2
	note A_, 1
	octave_up
	note E_, 1
	octave_up
	note C_, 1
	note __, 1
	octave_down
	octave_down
	doloop
	octave_up
	note D_, 2
	note F#, 1
	note A_, 1
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note D_, 2
	octave_up
	note C_, 1
	octave_down
	note F#, 1
	octave_up
	note D_, 1
	note __, 1
	octave_down
	note C_, 2
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note D_, 2
	octave_up
	note D_, 1
	note __, 1
	note C_, 2
	octave_up
	note C_, 1
	note __, 1
	octave_down
	note C_, 1
	note __, 1
	note C_, 4
	octave_up
	note C_, 1
	octave_down
	note G_, 1
	octave_down
	note B_, 2
	note A_, 2
	setloop $3
Music_7605e:
	note G_, 2
	doloop
	note __, 10
	octave_up
	noise $a
	note D#, 2
	octave_down
	setloop $3
Music_76068:
	note A#, 2
	note G_, 2
	octave_up
	note D#, 4
	octave_down
	doloop
	octave_up
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	octave_down
	setloop $3
Music_76076:
	note A#, 2
	note F_, 2
	octave_up
	note D_, 4
	octave_down
	doloop
	octave_up
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave_down
	note G_, 2
	note D#, 2
	octave_up
	note C_, 4
	octave_down
	setloop $2
Music_76089:
	note G_, 2
	note D#, 2
	octave_up
	note C_, 4
	octave_down
	doloop
	octave_up
	note D_, 2
	note D#, 2
	note C_, 2
	octave_down
	noise $2
	note D_, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F#, 1
	note __, 1
	note D_, 2
	note C_, 2
	octave_up
	note E_, 1
	note __, 1
	octave_down
	note G_, 1
	note __, 1
	note C_, 2
	octave_down
	note A_, 2
	note B_, 2
	octave_up
	note C_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note F#, 2
	octave_down
	doinfloop

Song_75369_Ch3: ; 760b2
	tempo $6
	octave 1
	setloop $8
Music_760b7:
	note C_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note G#, 1
	note G_, 1
	note C_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	doloop
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 7
	note F_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	setloop $6
Music_760e2:
	note C_, 1
	note F#, 1
	note A_, 2
	note D_, 1
	note F#, 1
	note C_, 1
	note __, 1
	note F#, 1
	note D_, 1
	note A_, 2
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	doloop
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note F_, 1
	doinfloop

Song_75372_Ch0: ; 76112
	tempo $b
	set_nrx1 $c0
	set_background_nrx2 $f4
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 5
	set_c153c157 $4
	note __, 16
	note __, 16
	set_background_nrx2 $d4
	note __, 2
	note F_, 1
	note D_, 1
	callchannel Music_761bf
	note F_, 1
	note __, 1
	note F_, 1
	note D_, 1
	callchannel Music_761bf
	set_background_nrx2 $f6
	octave_down
	octave_down
	octave_down
	callchannel Music_761c9
	note C_, 1
	set_background_nrx2 $81
	octave_up
	note E_, 1
	octave_down
	set_background_nrx2 $f7
	note C#, 1
	callchannel Music_761c9
	set_background_nrx2 $f7
	note E_, 1
	note F_, 1
	note F#, 1
	set_background_nrx2 $82
	octave_up
	octave_up
	note G_, 1
	note __, 1
	set_background_nrx2 $d4
	octave_up
	note F_, 1
	note D_, 1
	callchannel Music_761bf
	note F_, 1
	note __, 1
	note F_, 1
	note D_, 1
	callchannel Music_761bf
	set_background_nrx2 $d7
	set_c153c157 $3
	note __, 1
	octave_down
	octave_down
	note E_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note G#, 1
	note F#, 1
	set_background_nrx2 $97
	note D#, 1
	set_background_nrx2 $f7
	note E_, 1
	note G#, 1
	octave_up
	note E_, 1
	note __, 1
	note D_, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	note __, 1
	note E_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note G#, 1
	note F#, 1
	set_background_nrx2 $97
	note D#, 1
	set_background_nrx2 $f7
	note E_, 1
	note G#, 1
	octave_up
	note E_, 1
	note __, 1
	note D_, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	set_background_nrx2 $c7
	octave_down
	note C#, 1
	note G#, 1
	note C#, 1
	note __, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note __, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note __, 1
	note A#, 1
	note C#, 1
	note A#, 1
	note __, 1
	set_background_nrx2 $f7
	note __, 1
	octave_up
	note F_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note G#, 1
	note G_, 1
	set_background_nrx2 $97
	note D#, 1
	set_background_nrx2 $f7
	note __, 1
	note F_, 1
	note G#, 1
	octave_up
	note F_, 1
	note D#, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	doinfloop

Music_761bf:
	note F_, 1
	note F_, 2
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note D_, 2
	note __, 2
	retchannel

Music_761c9:
	set_background_nrx2 $f7
	note D_, 1
	octave_up
	set_background_nrx2 $a1
	note G_, 1
	octave_up
	octave_up
	note D_, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $f7
	note D_, 1
	note E_, 1
	note F_, 1
	octave_up
	set_background_nrx2 $a1
	note A#, 1
	octave_down
	set_background_nrx2 $f7
	note D_, 1
	set_background_nrx2 $a1
	octave_up
	note G_, 1
	octave_down
	set_background_nrx2 $f7
	note E_, 1
	octave_up
	octave_up
	octave_up
	set_background_nrx2 $a1
	note D_, 1
	octave_down
	octave_down
	octave_down
	set_background_nrx2 $f7
	note F_, 1
	octave_up
	set_background_nrx2 $a1
	note A#, 1
	octave_down
	retchannel

Song_75372_Ch1: ; 761fd
	tempo $b
	set_nrx1 $80
	set_background_nrx2 $d1
	dutycycle $11
	set_c153c157 $4
	set_c15f $1
	octave 3
	set_background_nrx2 $d1
	set_c153c157 $4
	note __, 12
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	callchannel Music_762c0
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	callchannel Music_762c0
	callchannel Music_762ca
	callchannel Music_762c0
	note A#, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note A#, 1
	octave_up
	note F_, 1
	note D_, 1
	octave_down
	note A#, 1
	set_background_nrx2 $58
	set_c153c157 $d
	octave_up
	setloop $2
Music_76238:
	note A_, 8
	note F#, 8
	doloop
	set_c153c157 $4
	set_background_nrx2 $d1
	octave_down
	callchannel Music_762c0
	callchannel Music_762ca
	callchannel Music_762c0
	note A#, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note A#, 1
	octave_up
	note F_, 1
	note D_, 1
	octave_down
	note A#, 1
	octave_down
	callchannel Music_762d2
	note E_, 1
	note B_, 1
	note E_, 1
	set_background_nrx2 $45
	note E_, 1
	set_background_nrx2 $a5
	note B_, 1
	note E_, 1
	note B_, 1
	set_background_nrx2 $45
	note B_, 1
	set_background_nrx2 $a5
	note E_, 1
	note A#, 1
	note E_, 1
	set_background_nrx2 $45
	note E_, 1
	set_background_nrx2 $a5
	note A#, 1
	note E_, 1
	note A#, 1
	set_background_nrx2 $45
	note A#, 1
	callchannel Music_762d2
	octave_down
	note B_, 1
	octave_up
	note F_, 1
	octave_down
	note B_, 1
	set_background_nrx2 $45
	note B_, 1
	octave_up
	set_background_nrx2 $a5
	note F_, 1
	octave_down
	note B_, 1
	octave_up
	note F_, 1
	set_background_nrx2 $45
	note F_, 1
	set_background_nrx2 $a5
	octave_down
	note B_, 1
	octave_up
	note F#, 1
	octave_down
	note B_, 1
	set_background_nrx2 $45
	note B_, 1
	set_background_nrx2 $a5
	octave_up
	note F#, 1
	octave_down
	note B_, 1
	octave_up
	note F#, 1
	set_background_nrx2 $45
	note F#, 1
	set_background_nrx2 $a5
	octave_down
	note C#, 1
	note G#, 1
	note C#, 1
	set_background_nrx2 $45
	note C#, 1
	set_background_nrx2 $a5
	note B_, 1
	note D_, 1
	note B_, 1
	set_background_nrx2 $45
	note B_, 1
	set_background_nrx2 $a5
	note __, 1
	note F_, 1
	note G#, 1
	octave_up
	note F_, 1
	note D#, 1
	octave_down
	note B_, 1
	note A#, 1
	note G#, 1
	doinfloop

Music_762c0:
	setloop $3
Music_762c2:
	note A#, 1
	note E_, 1
	doloop
	octave_up
	note C_, 1
	octave_down
	note F_, 1
	retchannel

Music_762ca:
	setloop $3
Music_762cc:
	note A#, 1
	note E_, 1
	doloop
	note A_, 1
	note D_, 1
	retchannel

Music_762d2:
	set_background_nrx2 $a5
	note B_, 1
	octave_up
	note E_, 1
	octave_down
	note B_, 1
	set_background_nrx2 $45
	note B_, 1
	octave_up
	set_background_nrx2 $a5
	note E_, 1
	octave_down
	note B_, 1
	octave_up
	note E_, 1
	set_background_nrx2 $45
	note E_, 1
	set_background_nrx2 $a5
	retchannel

Song_75372_Ch2: ; 762ea
	tempo $b
	noise $8
	set_foreground_nrx2 $40
	dutycycle $11
	set_c13f $6
	octave 1
	setloop $8
Music_762f7:
	set_background_nrx2 $20
	noise $1
	note G_, 1
	octave_up
	octave_up
	noise $13
	note F_, 1
	octave_up
	note A#, 1
	octave_down
	octave_down
	octave_down
	noise $1
	note G_, 1
	note A#, 1
	octave_up
	note C_, 1
	noise $13
	octave_up
	octave_up
	note E_, 1
	octave_down
	octave_down
	octave_down
	noise $1
	note G_, 1
	noise $13
	octave_up
	octave_up
	note F_, 1
	octave_down
	octave_down
	noise $1
	note A#, 1
	octave_up
	octave_up
	octave_up
	noise $13
	note A#, 1
	octave_down
	octave_down
	noise $1
	note C_, 1
	octave_up
	octave_up
	noise $13
	note E_, 1
	octave_down
	octave_down
	octave_down
	noise $1
	note F_, 1
	octave_up
	octave_up
	octave_up
	noise $13
	note C_, 1
	octave_down
	octave_down
	octave_down
	noise $1
	note A#, 1
	doloop
	setloop $2
Music_76346:
	note E_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	doloop
	note C#, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note B_, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note C#, 1
	note B_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D#, 1
	note B_, 1
	note E_, 1
	note __, 8
	doinfloop

Song_75372_Ch3: ; 76371
	tempo $b
	octave 1
	setloop $4
Music_76376:
	callchannel Music_7639f
	note C_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	callchannel Music_7639f
	note C_, 1
	note D#, 1
	note D_, 1
	note F_, 1
	doloop
	setloop $6
Music_76387:
	note D#, 1
	note D_, 1
	note F#, 1
	note G_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note C#, 1
	doloop
	note D#, 1
	note D_, 1
	note F#, 1
	note G_, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 3
	note D#, 1
	note D_, 1
	note D#, 1
	note F_, 1
	doinfloop

Music_7639f:
	note C_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	retchannel

Song_7537b_Ch0: ; 763ac
	tempo $3
	set_nrx1 $c0
	set_background_nrx2 $b6
	dutycycle $11
	set_c153c157 $9
	set_c15f $1
	octave 3
	note F_, 3
	note __, 1
	octave_down
	note G#, 2
	octave_up
	note D#, 3
	note F_, 3
	octave_down
	note G#, 2
	note __, 1
	octave_up
	note C_, 3
	note D#, 3
	note C_, 3
	note D#, 3
	note F_, 3
	octave_down
	note G#, 2
	note __, 1
	octave_up
	note G#, 3
	octave_down
	note G#, 2
	note __, 1
	octave_up
	note D#, 3
	note F_, 3
	note G#, 3
	tempo $9
	note A#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note G#, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	octave_down
	tempo $3
	note G#, 2
	note __, 1
	octave_up
	note G#, 3
	octave_down
	note D#, 9
	octave_up
	note G#, 3
	note A#, 3
	note __, 1
	octave_down
	note D_, 2
	octave_up
	note A#, 3
	note G#, 3
	note __, 1
	octave_down
	note D_, 2
	octave_up
	note A#, 3
	note G#, 3
	note C_, 3
	note D#, 3
	note F_, 3
	octave_down
	note D#, 2
	note __, 1
	octave_up
	note D#, 3
	note F_, 3
	note __, 1
	octave_down
	note D#, 8
	octave_up
	doinfloop

Song_7537b_Ch1: ; 76407
	tempo $3
	set_nrx1 $40
	set_background_nrx2 $87
	dutycycle $11
	set_c153c157 $9
	set_c15f $1
	octave 3
	setloop $2
Music_76416:
	note C_, 2
	note __, 1
	note C_, 2
	note __, 1
	octave_down
	note F_, 2
	note __, 1
	octave_up
	setloop $3
Music_76420:
	note C_, 2
	note __, 1
	doloop
	octave_up
	note D#, 2
	note __, 1
	octave_down
	note C_, 2
	note __, 1
	doloop
	setloop $2
Music_7642c:
	note D_, 2
	note __, 1
	doloop
	octave_down
	note F_, 2
	note __, 1
	octave_up
	setloop $2
Music_76435:
	note D_, 2
	note __, 1
	doloop
	note F_, 2
	note __, 1
	octave_up
	note D_, 2
	note __, 1
	octave_down
	note D_, 2
	note __, 1
	setloop $2
Music_76442:
	note D#, 2
	note __, 1
	doloop
	octave_down
	note A_, 2
	note __, 1
	octave_up
	setloop $3
Music_7644b:
	note D#, 2
	note __, 1
	doloop
	octave_up
	note F#, 2
	note __, 1
	octave_down
	note D#, 2
	note __, 1
	setloop $2
Music_76456:
	note F_, 2
	note __, 1
	doloop
	octave_down
	note G#, 2
	note __, 1
	octave_up
	note F_, 2
	note __, 1
	note D#, 2
	note __, 1
	note F_, 2
	note __, 1
	note C_, 2
	note __, 1
	octave_down
	note G#, 2
	note __, 1
	octave_down
	note A#, 2
	note __, 1
	octave_up
	note C_, 2
	note __, 1
	octave_up
	note C_, 2
	note __, 1
	octave_down
	octave_down
	note A#, 2
	note __, 1
	octave_up
	note C_, 2
	note __, 1
	setloop $3
Music_7647a:
	note D#, 2
	note __, 1
	doloop
	octave_up
	doinfloop

Song_7537b_Ch2: ; 7647f
	tempo $9
	noise $1
	set_foreground_nrx2 $ea
	dutycycle $11
	set_c13f $7
	octave 2
	set_background_nrx2 $20
	note F_, 1
	note F_, 1
	note D#, 1
	note G#, 1
	note F_, 1
	note D#, 1
	octave_up
	note D#, 1
	octave_down
	note D#, 1
	callchannel Music_764af
	callchannel Music_764be
	callchannel Music_764af
	callchannel Music_764be
	octave_up
	note G_, 1
	note G#, 1
	octave_down
	note F_, 1
	octave_up
	note G_, 1
	note G#, 1
	octave_down
	note C_, 1
	note D#, 1
	note C_, 1
	doinfloop

Music_764af:
	note F_, 1
	note F_, 1
	note D#, 1
	octave_up
	octave_up
	note D#, 1
	octave_down
	octave_down
	note F_, 1
	note C_, 1
	octave_up
	note C_, 1
	octave_down
	note B_, 1
	retchannel

Music_764be:
	note A#, 1
	note F_, 1
	octave_down
	note A#, 1
	octave_up
	note D_, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note E_, 1
	retchannel

Song_7537b_Ch3: ; 764c9
	tempo $3
	octave 1
	setloop $5
Music_764ce:
	callchannel Music_764e4
	note D_, 2
	note D#, 1
	note G_, 2
	note G#, 1
	callchannel Music_764e9
	doloop
	callchannel Music_764e4
	note D_, 2
	note D#, 1
	note C_, 2
	note C#, 1
	callchannel Music_764e9
	doinfloop

Music_764e4:
	note C_, 2
	note C#, 1
	note C_, 2
	note C#, 1
	retchannel

Music_764e9:
	note D_, 2
	note D#, 1
	note C_, 2
	note C#, 1
	note D_, 2
	note D#, 1
	note G_, 2
	note G#, 1
	retchannel

Song_753d5_Ch0: ; 764f2
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $c7
	dutycycle $11
	set_c153c157 $3
	set_c15f $1
	octave 3
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note E_, 1
	set_background_nrx2 $37
	note G_, 2
	set_background_nrx2 $c7
	note C_, 2
	octave_down
	note B_, 2
	note A_, 2
	octave_up
	note A_, 1
	set_background_nrx2 $37
	note A_, 1
	set_background_nrx2 $c7
	note A_, 3
	set_background_nrx2 $37
	note A_, 1
	set_background_nrx2 $69
	note G#, 6
	set_background_nrx2 $24
	note G#, 4
	end_channel

Song_753d5_Ch1: ; 76522
	tempo $7
	set_nrx1 $80
	set_background_nrx2 $66
	dutycycle $11
	set_c153c157 $1
	set_c15f $2
	octave 4
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note E_, 1
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note E_, 2
	set_background_nrx2 $68
	note D_, 6
	set_background_nrx2 $24
	note D_, 4
	end_channel

Song_753d5_Ch2: ; 7654f
	tempo $7
	noise $a
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	set_background_nrx2 $20
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note A_, 2
	note B_, 1
	octave_up
	note A_, 1
	octave_down
	note B_, 2
	octave_up
	note C_, 1
	note A_, 1
	note C_, 2
	note E_, 1
	note A_, 1
	note E_, 2
	note D_, 2
	note F_, 2
	note __, 2
	octave_down
	note B_, 6
	end_channel

Song_753d5_Ch3: ; 76573
	tempo $7
	octave 1
	setloop $3
Music_76578:
	note F_, 1
	note __, 1
	note C_, 1
	note C#, 1
	doloop
	note D#, 1
	note F_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note C_, 1
	end_channel

Song_753de_Ch0: ; 76589
	tempo $4
	set_nrx1 $80
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $a
	set_c15f $1
	octave 4
	key $2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave_down
	octave_down
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	octave_up
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 4
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	note C_, 4
	octave_down
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 8
	end_channel

Song_753de_Ch1: ; 765c0
	tempo $4
	set_nrx1 $c0
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $a
	set_c15f $1
	octave 2
	key $2
	setloop $4
Music_765d1:
	note B_, 1
	note __, 1
	doloop
	octave_down
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave_up
	octave_up
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave_down
	note B_, 4
	octave_up
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 4
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave_down
	note G_, 8
	end_channel

Song_753de_Ch2: ; 765f4
	tempo $4
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $2
	set_background_nrx2 $20
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 1
	note __, 1
	octave_up
	note F_, 1
	note __, 1
	octave_down
	note F#, 1
	note __, 1
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 2
	octave_up
	note F_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 2
	octave_up
	note F_, 2
	octave_down
	note F#, 2
	note G_, 8
	end_channel

Song_753de_Ch3: ; 76634
	tempo $4
	octave 1
	setloop $2
Music_76639:
	note C_, 2
	note D_, 1
	note E_, 1
	note F_, 2
	note C_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	doloop
	note D#, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note C_, 2
	end_channel

Music_7664b:
	note C_, 2
	note A_, 2
	doloop
	note D#, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note C_, 2
	end_channel

Music_76656:
	note C_, 2
	note A_, 2
	note F_, 1
	note F_, 7
	doinfloop

Music_7665b:
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	retchannel
	note A_, 2
	note C#, 1
	note C_, 2
	note C_, 1
	note A_, 2
	note C#, 1
	note F#, 2
	note F_, 1
	retchannel
	tempo $7
	set_nrx1 $40
	set_background_nrx2 $c7
	dutycycle $11
	set_c153c157 $11
	set_c15f $1
	octave 3
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note E_, 1
	note __, 2
	note C_, 2
	octave_down
	note B_, 2
	note A_, 2
	octave_up
	note A_, 1
	note __, 1
	note A_, 3
	note __, 1
	set_background_nrx2 $69
	note G#, 6
	end_channel

Music_7668c:
	tempo $7
	set_nrx1 $80
	set_background_nrx2 $66
	dutycycle $11
	set_c153c157 $1
	set_c15f $2
	octave 4
	note C_, 1
	octave_down
	note B_, 1
	octave_up
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note E_, 1
	note C_, 1
	octave_down
	note A_, 1
	octave_up
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note E_, 2
	set_background_nrx2 $68
	note D_, 6
	end_channel

Music_766b6:
	tempo $7
	noise $a
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	set_background_nrx2 $20
	note A_, 1
	octave_up
	note A_, 1
	octave_down
	note A_, 2
	note B_, 1
	octave_up
	note A_, 1
	octave_down
	note B_, 2
	octave_up
	note C_, 1
	note A_, 1
	note C_, 2
	note E_, 1
	note A_, 1
	note E_, 2
	note D_, 2
	note F_, 2
	note __, 2
	octave_down
	note B_, 6
	end_channel

Music_766da:
	tempo $7
	octave 1
	note A_, 1
	note __, 1
	note C_, 1
	note C_, 1
	note A_, 1
	note __, 1
	note C_, 1
	note C_, 1
	note A_, 1
	note __, 1
	note C_, 1
	note C_, 1
	note A_, 1
	note A_, 1
	note C_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note C_, 1
	end_channel

Music_766f5:
	tempo $4
	set_nrx1 $80
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $18
	set_c15f $1
	octave 4
	key $2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave_down
	octave_down
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	octave_up
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 4
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave_up
	note C_, 4
	octave_down
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 8
	end_channel

Music_7672c:
	tempo $4
	set_nrx1 $c0
	set_background_nrx2 $b7
	dutycycle $11
	set_c153c157 $18
	set_c15f $1
	octave 2
	key $2
	setloop $4
Music_7673d:
	note B_, 1
	note __, 1
	doloop
	octave_down
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave_up
	octave_up
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave_down
	note B_, 4
	octave_up
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 4
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave_down
	note G_, 8
	end_channel

Music_76760:
	tempo $4
	noise $1
	set_foreground_nrx2 $0
	dutycycle $11
	set_c13f $8
	octave 1
	key $2
	set_background_nrx2 $20
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 1
	note __, 1
	octave_up
	note F_, 1
	note __, 1
	octave_down
	note F#, 1
	note __, 1
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note G_, 2
	octave_up
	note G_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 2
	octave_up
	note F_, 1
	note __, 1
	octave_down
	note F#, 2
	octave_up
	note F#, 1
	note __, 1
	octave_down
	note F_, 2
	octave_up
	note F_, 2
	octave_down
	note F#, 2
	note G_, 8
	end_channel

Music_767a0:
	tempo $4
	octave 1
	note C_, 2
	note D#, 1
	note C#, 1
	note A_, 2
	note C_, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note A_, 2
	note C_, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note A_, 2
	note C_, 2
	end_channel

Music_767bb:
	note C_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note A_, 2
	note C_, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note A_, 2
	note C_, 2
	end_channel

Music_767ce:
	note __, 1
	note C_, 1
	setloop $30
Music_767d2:
	note __, 5
	note __, 5
	note D#, 15
	note F_, 1
	note __, 4
	note __, 5
	note A#, 6
	note F_, 1
	note __, 4
	note D#, 1
	sfx_end

Music_767dd:
	note G_, 1
	note C_, 2
	note C_, 1
	note F#, 4
	note D_, 1
	note __, 4
	note __, 1
	note D#, 2
	note D#, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 9
	note E_, 1
	end_channel

Music_767ee:
	note C_, 1
	note F#, 4
	note C_, 1
	note F#, 4
	note D_, 1
	note __, 4
	note __, 1
	note C#, 6
	note D#, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 9
	note E_, 1
	end_channel

Music_767ff:
	note C_, 1

