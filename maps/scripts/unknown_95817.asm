
Data_9580c:
	warpdef $00, $0b, $09, $01, MAP_00_10, $09, $04, $09, $05, SFX_2E

Func_95817:: ; 95817
	loadwarps $01, Data_9580c
	playmusic SONG_WORLD_MAP
	scall Func_8001c
	ret
