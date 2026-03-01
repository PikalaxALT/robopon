
Data_97465:
    warpdef $03, $0e, $01, $01, MAP_12_02, $01, $0a, $02, $0a, SFX_2E

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
