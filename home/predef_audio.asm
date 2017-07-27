SoundOffPredef:: ; 22c (0:022c)
	ld l, low(SoundOff_1c)
	jr callMusicEngine_predef

UpdateSoundPredef:: ; 230 (0:0230)
	ld l, low(UpdateSound_1c)
	jr callMusicEngine_predef

StartSongPredef:: ; 234 (0:0234)
	ld l, low(StartSong_1c)
	jr callMusicEngine_predef

StartSFXPredef:: ; 238 (0:0238)
	cp 60
	ret c
	sub 20
	ld l, low(StartSFX_1c)
	jr callMusicEngine_predef

SelectChannelsPredef:: ; 241 (0:0241)
	ld l, low(SelectChannels_1c)
	jr callMusicEngine_predef

CheckSongFinishedPredef:: ; 245 (0:0245)
	ld l, low(CheckSongFinished_1c)
	jr callMusicEngine_predef

CheckSFXFinishedPredef:: ; 249 (0:0249)
	ld l, low(CheckSFXFinished_1c)
	jr callMusicEngine_predef

ToggleMusicPredef:: ; 24d (0:024d)
	ld l, low(ToggleMusic_1c)
	jr callMusicEngine_predef

SetVolumePredef:: ; 251 (0:0251)
	ld l, low(SetVolume_1c)
callMusicEngine_predef
	ld h, high(SoundOff_1c)
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
