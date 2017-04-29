CallAudioEngine1C::
	ld h, a
	ld a, [wVideoTransferRequestFlags]
	bit 0, a
	jr z, .asm_1a7a
	xor a
	ret

.asm_1a7a
	ld a, [hROMBank]
	push af
	ld a, BANK(SoundOff_1c)
	call BankSwitch
	ld a, h
	ld de, .Return
	push de
	ld h, high(SoundOff_1c)
	push hl
	ret

.Return
	ld h, a
	pop af
	jp BankSwitch

SoundOff:: ; 1a90 (0:1a90)
	ld l, low(SoundOff_1c)
	jr CallAudioEngine1C

UpdateSound:: ; 1a94 (0:1a94)
	ld a, [hROMBank]
	ld [wVideoTransferRequestBank], a
	ld a, [wVideoTransferRequestFlags]
	set 1, a
	ld [wVideoTransferRequestFlags], a
	ld l, low(UpdateSound_1c)
	call CallAudioEngine1C
	ld a, [wVideoTransferRequestFlags]
	res 1, a
	ld [wVideoTransferRequestFlags], a
	ret

StartSong:: ; 1aaf (0:1aaf)
	ld l, low(StartSong_1c)
	ld h, a
	jr CallAudioEngine1C

StartSFX:: ; 1ab4 (0:1ab4)
	ld l, low(StartSFX_1c)
	ld h, a
	jr CallAudioEngine1C

SelectChannels:: ; 1ab9
	ld l, low(SelectChannels_1c)
	ld h, a
	jr CallAudioEngine1C

CheckSongFinished:: ; 1abe
	ld l, low(CheckSongFinished_1c)
	call CallAudioEngine1C
	ld a, h
	ret

CheckSFXFinished:: ; 1ac5
	ld l, low(CheckSFXFinished_1c)
	call CallAudioEngine1C
	ld a, h
	ret

ToggleMusic:: ; 1acc
	ld l, low(ToggleMusic_1c)
	jr CallAudioEngine1C

SetVolume:: ; 1ad0
	ld l, low(SetVolume_1c)
	ld h, a
	jr CallAudioEngine1C

BackUpMusicData:: ; 1ad5
	ld l, low(BackUpMusicData_1c)
	jr CallAudioEngine1C

RestoreMusicData:: ; 1ad9
	ld l, low(RestoreMusicData_1c)
	jr CallAudioEngine1C
