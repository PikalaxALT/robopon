SoundOffPredef:: ; 22c (0:022c)
	ld l, SoundOff_1c % $100
	jr callMusicEngine_predef

UpdateSoundPredef:: ; 230 (0:0230)
	ld l, UpdateSound_1c % $100
	jr callMusicEngine_predef

StartSongPredef:: ; 234 (0:0234)
	ld l, StartSong_1c % $100
	jr callMusicEngine_predef

StartSFXPredef:: ; 238 (0:0238)
	cp 60
	ret c
	sub 20
	ld l, StartSFX_1c % $100
	jr callMusicEngine_predef

SelectChannelsPredef:: ; 241 (0:0241)
	ld l, SelectChannels_1c % $100
	jr callMusicEngine_predef

CheckSongFinishedPredef:: ; 245 (0:0245)
	ld l, CheckSongFinished_1c % $100
	jr callMusicEngine_predef

CheckSFXFinishedPredef:: ; 249 (0:0249)
	ld l, CheckSFXFinished_1c % $100
	jr callMusicEngine_predef

ToggleMusicPredef:: ; 24d (0:024d)
	ld l, ToggleMusic_1c % $100
	jr callMusicEngine_predef

SetVolumePredef:: ; 251 (0:0251)
	ld l, SetVolume_1c % $100
callMusicEngine_predef
	ld h, SoundOff_1c / $100
	push af
	call .Bank1CCall
	pop hl
	push af
	ld a, h
	jr .BankSwitchBack

.Bank1CCall: ; 25e (0:025e)
	push hl
	push af
	ld a, [hROMBank]
	ld hl, sp+$7
	ld [hl], a
	ld a, BANK(SoundOff_1c)
.BankSwitchBack
	call BankSwitch_0020
	pop af
	ret
