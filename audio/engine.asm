MACRO audio_engine
SoundOff_\1::
	jp SoundOff__\1

UpdateSound_\1:: ; 70003 (1c:4003)
	jp UpdateSound__\1

StartSong_\1:: ; 70006 (1c:4006)
	jp StartSong__\1

StartSFX_\1:: ; 70009 (1c:4009)
	jp StartSFX__\1

SelectChannels_\1:: ; 7000c (1c:400c)
	jp SelectChannels__\1

CheckSongFinished_\1:: ; 7000f (1c:400f)
	jp CheckSongFinished__\1

CheckSFXFinished_\1:: ; 70012 (1c:4012)
	jp CheckSFXFinished__\1

ToggleMusic_\1:: ; 70015 (1c:4015)
	jp ToggleMusic__\1

SetVolume_\1:: ; 70018 (1c:4018)
	jp SetVolume__\1

BackUpMusicData_\1:: ; 7001b (1c:401b)
	jp BackUpMusicData__\1

RestoreMusicData_\1:: ; 7001e (1c:401e)
	jp RestoreMusicData__\1

StartSong__\1: ; 70021 (1c:4021)
	push hl
	ld hl, NumSongs_\1
	cp [hl]
	jr nc, .invalid
	ld [wSongIndex], a
	xor a
	ld [wc10b], a
	ld [wc16f], a
	dec a
	ld [wGlobalDuty], a
.invalid
	pop hl
	ret

StartSFX__\1: ; 70038 (1c:4038)
	push bc
	push hl
	ld b, $0
	ld c, a
	or a
	jr z, .load
	ld hl, Data_7122e_\1
	add hl, bc
	ld b, [hl]
	ld a, [wSFXActive]
	or a
	jr z, .load
	cp b
	jr c, .done
.load
	ld a, c
	ld [wSFXIndex], a
	ld a, b
	ld [wSFXActive], a
.done
	pop hl
	pop bc
	ret

SelectChannels__\1: ; 70059 (1c:4059)
	ld [wSoundOutputFlags], a
	ret

CheckSongFinished__\1: ; 7005d (1c:405d)
	ld a, [wSongIndex]
	cp $80
	ld a, $1
	ret nz
	xor a
	ret

CheckSFXFinished__\1: ; 70067 (1c:4067)
	ld a, [wSFXIndex]
	cp $80
	ld a, $1
	ret nz
	xor a
	ret

ToggleMusic__\1: ; 70071 (1c:4071)
	ld a, [wMusicPaused]
	xor $1
	ld [wMusicPaused], a
	ret

SetVolume__\1: ; 7007a (1c:407a)
	push bc
	push af
	and $7
	ld b, a
	swap b
	or b
	ld [wVolume], a
	pop af
	pop bc
	ret

SoundOff__\1: ; 70088 (1c:4088)
	xor a
	ldh [rNR52], a
	ld a, $80
	ldh [rNR52], a
	ld a, $77
	ldh [rNR50], a
	ld a, $ff
	ldh [rNR51], a
	ld a, BANK(SoundOff__1c)
	ld [wAudioROMBank], a
	ld a, $80
	ld [wSongIndex], a
	ld [wSFXIndex], a
	ld a, $77
	ld [wVolume], a
	xor a
	ld [wSFXChannelFlags], a
	ld [wSFXActive2], a
	ld [wc10b], a
	ld [wc16f], a
	ld [wSoundOutputFlags], a
	ld [wMusicPaused], a
	dec a
	ld [wGlobalDuty], a
	ld de, $1
	ld bc, $0
.loop
	ld hl, wChannelActiveFlags
	add hl, bc
	ld [hl], d
	ld hl, wChannelNoteStates
	add hl, bc
	ld [hl], d
	ld hl, wChannelUnknownC133s
	add hl, bc
	ld [hl], d
	ld hl, wChannelKeySignatures
	add hl, bc
	ld [hl], d
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld [hl], d
	inc c
	ld a, c
	cp $4
	jr nz, .loop
	ld hl, ChannelStackPointerResets_\1
	ld bc, wChannelStackPointers
	ld d, $8
.copy
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .copy
	ret

UpdateSound__\1: ; 700f4 (1c:40f4)
	call DeletedFunc702af_\1
	call PlayAudio_\1
	ld hl, UpdateSFX
	call AudioEngineFarCall
	ld a, [wAudioROMBank]
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld a, [wMusicPaused]
	cp $0
	jr z, .play_channels
	call MusicChannelsOff_\1
	jr .done

.play_channels
	call PlayChannel1_\1
	call PlayChannel2_\1
	call PlayChannel3_\1
	call PlayChannel4_\1
.done
	call Func_7086f_\1
	call CheckSongPlaying_\1
	ret

PlayAudio_\1: ; 70127 (1c:4127)
	ld a, [wSongIndex]
	rla
	jr c, .already_started_song
	call MusicChannelsOff2_\1
	ld a, [wSongIndex]
	call PlaySong_\1
	ld a, [wSongIndex]
	or $80
	ld [wSongIndex], a
.already_started_song
	ld a, [wSFXIndex]
	rla
	jr c, .already_started_sfx
	ld a, [wSFXIndex]
	ld hl, PlaySFX
	call AudioEngineFarCall
	ld a, [wSFXIndex]
	or $80
	ld [wSFXIndex], a
.already_started_sfx
	ret

MusicChannelsOff2_\1: ; 70156 (1c:4156)
	ld a, [wSFXChannelFlags]
	ld d, a
	xor a
	ld [wChannel1ActiveFlag], a
	bit 0, d
	jr nz, .asm_7016a
	ld a, $8
	ldh [rNR12], a
	swap a
	ldh [rNR14], a
.asm_7016a
	xor a
	ld [wChannel2ActiveFlag], a
	bit 1, d
	jr nz, .asm_7017a
	ld a, $8
	ldh [rNR22], a
	swap a
	ldh [rNR24], a
.asm_7017a
	xor a
	ld [wChannel4ActiveFlag], a
	bit 3, d
	jr nz, .asm_7018a
	ld a, $8
	ldh [rNR42], a
	swap a
	ldh [rNR44], a
.asm_7018a
	xor a
	ld [wChannel3ActiveFlag], a
	bit 2, d
	jr nz, .asm_70196
	ld a, $0
	ldh [rNR32], a
.asm_70196
	ret

PlaySong_\1: ; 70197 (1c:4197)
	push af
	ld c, a
	ld b, $0
	ld hl, SongBanks_\1
	add hl, bc
	ld a, [hl]
	ld [wAudioROMBank], a
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	add a
	ld c, a
	ld b, $0
	ld hl, SongPointers_\1
	add hl, bc
	ld e, [hl]
	inc hl
	ld h, [hl]
	ld l, e
	ld e, [hl]
	inc hl
	ld b, h
	ld c, l
	rr e
	jr nc, .not_ch1
	ld a, [bc]
	inc bc
	ld [wChannel1Pointer], a
	ld [wChannel1StartPointer], a
	ld a, [bc]
	inc bc
	ld [wChannel1Pointer + 1], a
	ld [wChannel1StartPointer + 1], a
	ld a, $1
	ld [wChannel1NoteDuration], a
	ld [wChannel1ActiveFlag], a
	xor a
	ld [wChannel1NoteState], a
	ld [wChannel1FrequencyOffset], a
	ld [wChannel1UnknownC13F], a
	ld [wChannel1UnknownC15F], a
	ld [wChannel1KeySignature], a
	ld a, [Channel1StackPointerReset_\1]
	ld [wChannel1StackPointer], a
	ld a, [Channel1StackPointerReset_\1 + 1]
	ld [wChannel1StackPointer + 1], a
	ld a, $8
	ld [wChannel1NR2], a
.not_ch1
	rr e
	jr nc, .not_ch2
	ld a, [bc]
	inc bc
	ld [wChannel2Pointer], a
	ld [wChannel2StartPointer], a
	ld a, [bc]
	inc bc
	ld [wChannel2Pointer + 1], a
	ld [wChannel2StartPointer + 1], a
	ld a, $1
	ld [wChannel2NoteDuration], a
	ld [wChannel2ActiveFlag], a
	xor a
	ld [wChannel2NoteState], a
	ld [wChannel2FrequencyOffset], a
	ld [wChannel2UnknownC13F], a
	ld [wChannel2UnknownC15F], a
	ld [wChannel2KeySignature], a
	ld a, [Channel2StackPointerReset_\1]
	ld [wChannel2StackPointer], a
	ld a, [Channel2StackPointerReset_\1 + 1]
	ld [wChannel2StackPointer + 1], a
	ld a, $8
	ld [wChannel2NR2], a
.not_ch2
	rr e
	jr nc, .not_ch3
	ld a, [bc]
	inc bc
	ld [wChannel3Pointer], a
	ld [wChannel3StartPointer], a
	ld a, [bc]
	inc bc
	ld [wChannel3Pointer + 1], a
	ld [wChannel3StartPointer + 1], a
	ld a, $1
	ld [wChannel3NoteDuration], a
	ld [wChannel3ActiveFlag], a
	xor a
	ld [wChannel3NoteState], a
	ld [wChannel3FrequencyOffset], a
	ld [wChannel3UnknownC13F], a
	ld [wChannel3UnknownC15F], a
	ld [wChannel3KeySignature], a
	ld a, [Channel3StackPointerReset_\1]
	ld [wChannel3StackPointer], a
	ld a, [Channel3StackPointerReset_\1 + 1]
	ld [wChannel3StackPointer + 1], a
	ld a, $40
	ld [wChannel3NR2], a
.not_ch3
	rr e
	jr nc, .not_ch4
	ld a, [bc]
	inc bc
	ld [wChannel4Pointer], a
	ld [wChannel4StartPointer], a
	ld a, [bc]
	inc bc
	ld [wChannel4Pointer + 1], a
	ld [wChannel4StartPointer + 1], a
	ld a, $1
	ld [wChannel4NoteDuration], a
	ld [wChannel4ActiveFlag], a
	xor a
	ld [wChannel4NoteState], a
	ld [wChannel4UnknownC13F], a
	ld [wChannel4UnknownC15F], a
	ld [wChannel4KeySignature], a
	ld a, [Channel4StackPointerReset_\1]
	ld [wChannel4StackPointer], a
	ld a, [Channel4StackPointerReset_\1 + 1]
	ld [wChannel4StackPointer + 1], a
	ld a, $40
	ld [wChannel4NR2], a
.not_ch4
	xor a
	ld [wMusicPaused], a
	ret

DeletedFunc702af_\1: ; 702af (1c:42af)
	ret

PlayChannel1_\1: ; 702b0 (1c:42b0)
	ld a, [wChannel1ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel1NotePlaying]
	cp $0
	jr z, .skip
	ld a, [wChannel1UnknownC143]
	dec a
	ld [wChannel1UnknownC143], a
	jr nz, .skip
	ld a, [wChannel1NoteDuration]
	cp $1
	jr z, .skip
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .skip
	ld hl, rNR12
	ld a, [wChannel1NR2]
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.skip
	ld a, [wChannel1NoteDuration]
	dec a
	ld [wChannel1NoteDuration], a
	jr nz, .skip_audio_command_processor
	ld a, [wChannel1Pointer + 1]
	ld h, a
	ld a, [wChannelPointers]
	ld l, a
	ld bc, $0
	call MusicCommandProcessor_\1
	ld a, [wChannel1ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Channel1_PlayNote_\1
.skip_audio_command_processor
	ld a, $0
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .skip_sfx
	ld a, $8
	ldh [rNR12], a
	swap a
	ldh [rNR14], a
.skip_sfx
	ret

PlayChannel2_\1: ; 70315 (1c:4315)
	ld a, [wChannel2ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel2NotePlaying]
	cp $0
	jr z, .skip
	ld a, [wChannel2UnknownC143]
	dec a
	ld [wChannel2UnknownC143], a
	jr nz, .skip
	ld a, [wChannel2NoteDuration]
	cp $1
	jr z, .skip
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .skip
	ld hl, rNR22
	ld a, [wChannel2NR2]
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.skip
	ld a, [wChannel2NoteDuration]
	dec a
	ld [wChannel2NoteDuration], a
	jr nz, .skip_command_processor
	ld a, [wChannel2Pointer + 1]
	ld h, a
	ld a, [wChannel2Pointer]
	ld l, a
	ld bc, $1
	call MusicCommandProcessor_\1
	ld a, [wChannel2ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Channel2_PlayNote_\1
.skip_command_processor
	ld a, $1
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .asm_70379
	ld a, $8
	ldh [rNR22], a
	swap a
	ldh [rNR24], a
.asm_70379
	ret

PlayChannel3_\1: ; 7037a (1c:437a)
	ld a, [wChannel3ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel3NotePlaying]
	cp $0
	jr z, .skip
	ld a, [wChannel3UnknownC143]
	dec a
	ld [wChannel3UnknownC143], a
	jr nz, .skip
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .skip
	ld a, [wChannel3NoteDuration]
	cp $1
	jr z, .skip
	ld a, [wChannel3NR2]
	ldh [rNR32], a
.skip
	ld a, [wChannel3NoteDuration]
	dec a
	ld [wChannel3NoteDuration], a
	jr nz, .skip_command_processor
	ld a, [wChannel3Pointer + 1]
	ld h, a
	ld a, [wChannel3Pointer]
	ld l, a
	ld bc, $2
	call MusicCommandProcessor_\1
	ld a, [wChannel3ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Channel3_PlayNote_\1
.skip_command_processor
	ld a, $2
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_703d8
	ld a, $0
	ldh [rNR32], a
	ld a, $80
	ldh [rNR34], a
.asm_703d8
	ret

PlayChannel4_\1: ; 703d9 (1c:43d9)
	ld a, [wChannel4ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel4NoteDuration]
	dec a
	ld [wChannel4NoteDuration], a
	jr nz, .note_not_done
	ld a, [wChannel4Pointer + 1]
	ld h, a
	ld a, [wChannel4Pointer]
	ld l, a
	ld bc, $3
	call MusicCommandProcessor_\1
	ld a, [wChannel4ActiveFlag]
	or a
	jr z, .channel_switched_off
	call PlayNoiseHeaderCh4_\1
	jr .quit

.note_not_done
	ld a, [wc16f]
	or a
	jr z, .quit
	call PlayNextNoiseSample_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr nz, .quit
	xor a
	ld [wc16f], a
	ld a, $8
	ldh [rNR42], a
	swap a
	ldh [rNR44], a
.quit
	ret

MusicCommandProcessor_\1: ; 7041f (1c:441f)
	; hl = song pointer
	; bc = which channel
	ld a, [hli]
	push hl
	push af
	cp $d0
	jr c, .note
	sub $d0
	add a
	ld e, a
	ld d, $0
	ld hl, .pointers_70437
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	pop af
	jp hl

.pointers_70437
	dw MusicCommand_Tempo_\1 ; d0
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_OctaveUp_\1
	dw MusicCommand_OctaveDown_\1 ; d8
	dw MusicCommand_MuteChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_DutyCycle_\1
	dw MusicCommand_SetStartPointer_\1
	dw MusicCommand_JumpStartPointer_\1
	dw MusicCommand_SetLoop_\1
	dw MusicCommand_DoLoop_\1 ; e0
	dw MusicCommand_JumpChannel_\1
	dw MusicCommand_CallChannel_\1
	dw MusicCommand_RetChannel_\1
	dw MusicCommand_FreqOffset_\1
	dw MusicCommand_SetNRx1_\1
	dw MusicCommand_SetNRx2_\1
	dw MusicCommand_NoiseSample_\1
	dw MusicCommand_SetC13F_\1 ; e8
	dw MusicCommand_SetNRx2_2_\1
	dw MusicCommand_SetC153andC157_\1
	dw MusicCommand_SetC15F_\1
	dw MusicCommand_KeyChange_\1
	dw MusicCommand_KeyChangeRelative_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1
	dw MusicCommand_StopChannel_\1

.note
	push af
	ld a, [hl] ; peek ahead
	ld e, a
	ld hl, wChannelNoteStates
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .skip
	ld [hl], $1
	xor a
	ld hl, wChannelUnknownC15Bs
	add hl, bc
	ld [hl], a
	ld hl, wChannelUnknownC163s
	add hl, bc
	ld [hl], a
	inc [hl]
	ld hl, wChannelUnknownC157s
	add hl, bc
	ld a, [hl]
	ld hl, wChannelUnknownC153s
	add hl, bc
	ld [hl], a
.skip
	pop af
	push de
	ld hl, wChannelTemposs
	add hl, bc
	ld d, [hl]
	and $f
	inc a
	cp d
	jr nc, .no_rotate_regs
		reg8rot e, a, d
.no_rotate_regs
	ld e, a
.shift_left
	dec d
	jr z, .done
	add e
	jr .shift_left

.done
	ld hl, wChannelNoteDurations
	add hl, bc
	ld [hl], a
	pop de
	ld d, a
	ld a, e
	cp $d9 ; mute
	ld a, d
	jr z, .set_c143
	ld e, a
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld a, [hl]
	cp $8
	ld d, a
	ld a, e
	jr z, .set_c143
	push hl
	push bc
	ld b, $0
	ld c, a
	ld hl, $0
	; no checks for d==0
.add_n_times
	add hl, bc
	dec d
	jr nz, .add_n_times
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	pop bc
	pop hl
.set_c143
	ld hl, wChannelUnknownC143s
	add hl, bc
	ld [hl], a
	pop af
	and $f0
	ld hl, wChannelNotesPlaying
	add hl, bc
	ld [hl], a
	or a
	jr nz, .get_pitch
	jp .update_channel_pointer

.get_pitch
	swap a
	dec a
	ld h, a
	ld a, $3
	cp c
	ld a, h
	jr z, .channel_4
	jr .not_channel_4

.channel_4
	push af
	ld hl, wChannelOctaves
	add hl, bc
	ld a, [hl]
	ld d, a
	sla a
	add d
	sla a
	sla a
	sla a
	ld e, a
	pop af
	ld hl, Data_70de4_\1
	add a
	ld d, c
	ld c, a
	add hl, bc
	ld c, e
	add hl, bc
	ld c, d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld d, a
	ld a, [wGlobalDuty]
	and $77
	or d
	ld [wGlobalDuty], a
	ld de, wNoiseSampleHeader
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	ld b, $0
	ld a, l
	ld d, h
	ld hl, wNoiseSamplePointer
	ld [hli], a
	ld [hl], d
	ld a, $1
	ld [wc16f], a
	jr .update_channel_pointer

.not_channel_4
	ld hl, wChannelFrequencies
	add hl, bc
	add hl, bc
	push hl
	ld hl, wChannelOctaves
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, CNotes_\1
	add hl, de
	add a
	ld e, [hl]
	add e
	ld hl, wChannelKeySignatures
	add hl, bc
	ld e, [hl]
	add e
	add e
	ld e, a
	ld hl, FrequencyTable_\1
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	call ApplyPitchOffset_\1
	pop hl
	ld a, e
	ld [hli], a
	ld [hl], d
.update_channel_pointer
	pop de
	ld hl, wChannelPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

MusicCommand_Tempo_\1: ; 705a3 (1c:45a3)
	pop hl
	ld a, [hli]
	push hl
	ld hl, wChannelTemposs
	add hl, bc
	ld [hl], a
	jp NextMusicCommand_\1

MusicCommand_Octave_\1: ; 705ae (1c:45ae)
	and $7
	dec a
	ld hl, wChannelOctaves
	add hl, bc
	push af
	ld a, c
	cp $2
	jr nz, .not_ch3
	pop af
	inc a
	ld [hl], a
	jp NextMusicCommand_\1

.not_ch3
	pop af
	ld [hl], a
	jp NextMusicCommand_\1

MusicCommand_OctaveUp_\1: ; 705c6 (1c:45c6)
	ld hl, wChannelOctaves
	add hl, bc
	inc [hl]
	jp NextMusicCommand_\1

MusicCommand_OctaveDown_\1: ; 705ce (1c:45ce)
	ld hl, wChannelOctaves
	add hl, bc
	dec [hl]
	jp NextMusicCommand_\1

MusicCommand_MuteChannel_\1: ; 705d6 (1c:45d6)
	ld hl, wChannelNoteStates
	add hl, bc
	ld [hl], $80
	jp NextMusicCommand_\1

MusicCommand_DutyCycle_\1: ; 705df (1c:45df)
	pop hl
	ld a, [hli]
	push hl
	push bc
	inc c
	ld e, $ee
.loop
	dec c
	jr z, .skip
	rlca
	rlc e
	jr .loop

.skip
	ld d, a
	ld hl, wGlobalDuty
	ld a, [hl]
	and e
	or d
	ld [hl], a
	pop bc
	jp NextMusicCommand_\1

MusicCommand_SetStartPointer_\1: ; 705fa (1c:45fa)
	pop de
	push de
	dec de
	ld hl, wChannelStartPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	jp NextMusicCommand_\1

MusicCommand_JumpStartPointer_\1: ; 70608 (1c:4608)
	pop hl
	ld hl, wChannelStartPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp MusicCommandProcessor_\1

MusicCommand_SetLoop_\1: ; 70614 (1c:4614)
	pop de
	ld a, [de]
	inc de
	push af
	call MusicCommand_GetChannelStackPointer_\1
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop af
	ld [hl], a
	inc hl
	push de
	call MusicCommand_UpdateStackPointer_\1
	jp NextMusicCommand_\1

MusicCommand_DoLoop_\1: ; 70629 (1c:4629)
	call MusicCommand_GetChannelStackPointer_\1
	dec hl
	ld a, [hl]
	dec a
	jr z, .done_loop
	ld [hld], a
	ld d, [hl]
	dec hl
	ld e, [hl]
	pop hl
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

.done_loop
	dec hl
	dec hl
	call MusicCommand_UpdateStackPointer_\1
	jp NextMusicCommand_\1

MusicCommand_JumpChannel_\1: ; 70643 (1c:4643)
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp MusicCommandProcessor_\1

MusicCommand_CallChannel_\1: ; 7064a (1c:464a)
	call MusicCommand_GetChannelStackPointer_\1
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld d, a
	ld e, b
	ld b, $0
	push de
	call MusicCommand_UpdateStackPointer_\1
	jp NextMusicCommand_\1

MusicCommand_RetChannel_\1: ; 70661 (1c:4661)
	pop de
	call MusicCommand_GetChannelStackPointer_\1
	dec hl
	ld a, [hld]
	ld e, [hl]
	ld d, a
	inc de
	inc de
	push de
	call MusicCommand_UpdateStackPointer_\1
	jp NextMusicCommand_\1

MusicCommand_FreqOffset_\1: ; 70672 (1c:4672)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelFrequencyOffsets
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetNRx1_\1: ; 7067f (1c:467f)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelNR1s
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetNRx2_\1: ; 7068c (1c:468c)
	pop de
	ld a, [de]
	inc de
	ld hl, wNR12
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_NoiseSample_\1: ; 70699 (1c:4699)
	pop de
	ld a, [de]
	inc de
	ld [wc10a], a
	ld a, $1
	ld [wc10b], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetC13F_\1: ; 706a9 (1c:46a9)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetNRx2_2_\1: ; 706b6 (1c:46b6)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelNR2s
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetC153andC157_\1: ; 706c3 (1c:46c3)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC153s
	add hl, bc
	ld [hl], a
	ld hl, wChannelUnknownC157s
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_SetC15F_\1: ; 706d5 (1c:46d5)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC15Fs
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_KeyChange_\1: ; 706e2 (1c:46e2)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelKeySignatures
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_KeyChangeRelative_\1: ; 706ef (1c:46ef)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelKeySignatures
	add hl, bc
	add [hl]
	ld [hl], a
	ld h, d
	ld l, e
	jp MusicCommandProcessor_\1

MusicCommand_StopChannel_\1: ; 706fd (1c:46fd)
	ld hl, wChannelActiveFlags
	add hl, bc
	ld [hl], $0
	pop hl
	ret

MusicCommand_GetChannelStackPointer_\1: ; 70705 (1c:4705)
	ld hl, wChannelStackPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

MusicCommand_UpdateStackPointer_\1: ; 7070e (1c:470e)
	ld d, h
	ld e, l
	ld hl, wChannelStackPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

NextMusicCommand_\1: ; 70719 (1c:4719)
	pop hl
	jp MusicCommandProcessor_\1

Channel1_PlayNote_\1: ; 7071d (1c:471d)
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .dont_play_note
	ld a, [wChannel1NotePlaying]
	cp $0
	jr z, .rest
	ld d, $0
	ld hl, wChannelNoteStates
	ld a, [hl]
	cp $80
	jr z, .skip
	ld a, [wNR12]
	ldh [rNR12], a
	ld d, $80
.skip
	ld [hl], $2
	ld a, $8
	ldh [rNR10], a
	ld a, [wChannel1NR1]
	ldh [rNR11], a
	ld a, [wChannel1Frequency]
	ldh [rNR13], a
	ld a, [wChannel1Frequency + 1]
	or d
	ldh [rNR14], a
.dont_play_note
	ret

.rest
	ld hl, wChannel1NoteState
	ld [hl], $0
	ld hl, rNR12
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Channel2_PlayNote_\1: ; 70763 (1c:4763)
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .asm_70794
	ld a, [wChannel2NotePlaying]
	cp $0
	jr z, .asm_70795
	ld d, $0
	ld hl, wChannel2NoteState
	ld a, [hl]
	cp $80
	jr z, .asm_70782
	ld a, [wNR22]
	ldh [rNR22], a
	ld d, $80
.asm_70782
	ld [hl], $2
	ld a, [wChannel2NR1]
	ldh [rNR21], a
	ld a, [wChannel2Frequency]
	ldh [rNR23], a
	ld a, [wChannel2Frequency + 1]
	or d
	ldh [rNR24], a
.asm_70794
	ret

.asm_70795
	ld hl, wChannel2NoteState
	ld [hl], $0
	ld hl, rNR22
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Channel3_PlayNote_\1: ; 707a5 (1c:47a5)
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_707e9
	ld d, $0
	ld a, [wc10b]
	or a
	jr z, .skip_wave_copy
	xor a
	ldh [rNR30], a
	call Func_707f3_\1
	ld d, $80
.skip_wave_copy
	ld a, [wChannel3NotePlaying]
	cp $0
	jr z, .asm_707ea
	ld hl, wChannel3NoteState
	ld a, [hl]
	cp $80
	jr z, .asm_707d5
	ld a, [wNR32]
	ldh [rNR32], a
	xor a
	ldh [rNR30], a
	ld d, $80
.asm_707d5
	ld [hl], $2
	xor a
	ldh [rNR31], a
	ld a, [wChannel3Frequency]
	ldh [rNR33], a
	ld a, $80
	ldh [rNR30], a
	ld a, [wChannel3Frequency + 1]
	or d
	ldh [rNR34], a
.asm_707e9
	ret

.asm_707ea
	ld hl, wChannel1NoteState
	ld [hl], $0
	xor a
	ldh [rNR30], a
	ret

Func_707f3_\1: ; 707f3 (1c:47f3)
	ld a, [wc10a]
	add a
	ld d, $0
	ld e, a
	ld hl, Data_70ccc_\1
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, d
	ld de, rWave_0
.copy_wave
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $10
	jr nz, .copy_wave
	xor a
	ld [wc10b], a
	ret

PlayNoiseHeaderCh4_\1: ; 70813 (1c:4813)
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr nz, .no_ch4_sfx
	ld a, [wChannel4NotePlaying]
	cp $0
	jr z, noiseSampleEndedCh4_\1
	ld de, rNR41
	ld hl, wNoiseSampleHeader
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
.no_ch4_sfx
	ret

noiseSampleEndedCh4_\1:
	xor a
	ld [wc16f], a
	ld hl, rNR42
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

PlayNextNoiseSample_\1: ; 70842 (1c:4842)
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr z, .check_c16d
	xor a
	ld [wc16f], a
	jr .quit

.check_c16d
	ld hl, wNoiseSamplePointer
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [de]
	cp $ff
	jr nz, .read
	jr noiseSampleEndedCh4_\1

.read
	ldh [rNR43], a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
.quit
	ret

UpdateChannelNoise_\1: ; 70863 (1c:4863)
	push af
	ld b, $0
	ld c, a
	call Func_708a1_\1
	pop af
	call Func_70914_\1
	ret

Func_7086f_\1: ; 7086f (1c:486f)
	ld a, [wVolume]
	ldh [rNR50], a
	ld a, [wSFXChannelFlags]
	or a
	ld hl, wGlobalDuty
	ld a, [hli]
	jr z, .asm_70891
	ld a, [wSFXChannelFlags]
	and $f
	ld d, a
	swap d
	or d
	ld d, a
	xor $ff
	ld e, a
	ld a, [hld]
	and d
	ld d, a
	ld a, [hl]
	and e
	or d
.asm_70891
	ld d, a
	ld a, [wSoundOutputFlags]
	xor $ff
	and $f
	ld e, a
	swap e
	or e
	and d
	ldh [rNR51], a
	ret

Func_708a1_\1: ; 708a1 (1c:48a1)
	ld hl, wChannelUnknownC15Fs
	add hl, bc
	ld a, [hl]
	cp $0
	jr z, .get_frequency
	ld hl, wChannelUnknownC163s
	add hl, bc
	cp [hl]
	jr z, .asm_708b4
	inc [hl]
	jr .get_frequency

.asm_708b4
	ld hl, wChannelUnknownC153s
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, Data_70fa4_\1
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wChannelUnknownC15Bs
	add hl, bc
	ld d, $0
	ld e, [hl]
	inc [hl]
	pop hl
	add hl, de
	ld a, [hli]
	cp $80
	jr z, .asm_708f7
	ld hl, wChannelFrequencies
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	bit 7, a
	jr nz, .asm_708e8
	add e
	ld e, a
	ld a, $0
	adc d
	and $7
	ld d, a
	ret

.asm_708e8
	xor $ff
	inc a
	push bc
	ld c, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	and $7
	ld d, a
	pop bc
	ret

.asm_708f7
	push hl
	ld hl, wChannelUnknownC15Bs
	add hl, bc
	ld [hl], $0
	pop hl
	ld a, [hl]
	cp $80
	jr z, .asm_708b4
	ld hl, wChannelUnknownC153s
	add hl, bc
	ld [hl], a
	jr .asm_708b4

.get_frequency
	ld hl, wChannelFrequencies
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

Func_70914_\1: ; 70914 (1c:4914)
	cp $0
	jr nz, .asm_7092c
	ld a, [wChannel1UnknownC15F]
	cp $0
	jr z, .asm_7092c
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .asm_7095c
	ld a, e
	ldh [rNR13], a
	ld a, d
	ldh [rNR14], a
.asm_7092c
	cp $1
	jr nz, .asm_70944
	ld a, [wChannel2UnknownC15F]
	cp $0
	jr z, .asm_70944
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .asm_7095c
	ld a, e
	ldh [rNR23], a
	ld a, d
	ldh [rNR24], a
.asm_70944
	cp $2
	jr nz, .asm_7095c
	ld a, [wChannel3UnknownC15F]
	cp $0
	jr z, .asm_7095c
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_7095c
	ld a, e
	ldh [rNR33], a
	ld a, d
	ldh [rNR34], a
.asm_7095c
	ret

ApplyPitchOffset_\1: ; 7095d (1c:495d)
	ld hl, wChannelFrequencyOffsets
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .subtract
	add e
	ld e, a
	ld a, d
	adc b
	ld d, a
	ret

.subtract
	xor $ff
	ld h, a
	ld a, e
	sub h
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ret

MusicChannelsOff_\1: ; 70976 (1c:4976)
	ld a, [wSFXChannelFlags]
	ld d, a
	bit 0, d
	jr nz, .check_ch2
	ld a, $8
	ldh [rNR12], a
	swap a
	ldh [rNR14], a
.check_ch2
	bit 1, d
	jr nz, .check_ch3
	swap a
	ldh [rNR22], a
	swap a
	ldh [rNR24], a
.check_ch3
	bit 3, d
	jr nz, .check_ch4
	swap a
	ldh [rNR42], a
	swap a
	ldh [rNR44], a
.check_ch4
	bit 2, d
	jr nz, .end
	ld a, $0
	ldh [rNR32], a
.end
	ret

CheckSongPlaying_\1: ; 709a7 (1c:49a7)
	ld hl, wChannelActiveFlags
	xor a
	add [hl]
	inc hl
	add [hl]
	inc hl
	add [hl]
	inc hl
	add [hl]
	or a
	ret nz
	ld a, $80
	ld [wSongIndex], a
	ret

BackUpMusicData__\1: ; 709ba (1c:49ba)
	call MusicChannelsOff_\1
	call BackUpMusicData___\1
	call MusicChannelsOff2_\1
	ret

RestoreMusicData__\1: ; 709c4 (1c:49c4)
	call MusicChannelsOff_\1
	call MusicChannelsOff2_\1
	call RestoreMusicData___\1
	ret

BackUpMusicData___\1: ; 709ce (1c:49ce)
	ld a, [wSongIndex]
	ld [wBackupSongIndex], a
	ld a, [wAudioROMBank]
	ld [wBackupAudioROMBank], a
	ld a, [wGlobalDuty]
	ld [wBackupGlobalDuty], a
	ld hl, wChannelNR1s
	ld de, wBackupChannelNR1s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld a, [wc10a]
	ld [wBackupc10a], a
	ld a, [wc10b]
	ld [wBackupc10b], a
	ld hl, wChannelActiveFlags
	ld de, wBackupChannelActiveFlags
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelNoteStates
	ld de, wBackupChannelNoteStates
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelPointers
	ld de, wBackupChannelPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelStartPointers
	ld de, wBackupChannelStartPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld a, [wNoiseSampleHeader]
	ld [wBackupc12b], a
	ld a, [wNoiseSampleHeader + 1]
	ld [wBackupc12b + 1], a
	ld hl, wChannelOctaves
	ld de, wBackupChannelOctaves
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC133s
	ld de, wBackupChannelUnknownC133s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelNotesPlaying
	ld de, wBackupChannelNotesPlaying
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelNoteDurations
	ld de, wBackupChannelNoteDurations
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC13Fs
	ld de, wBackupChannelUnknownC13Fs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC143s
	ld de, wBackupChannelUnknownC143s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelNR2s
	ld de, wBackupChannelNR2s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelKeySignatures
	ld de, wBackupChannelKeySignatures
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelTemposs
	ld de, wBackupChannelTemposs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC157s
	ld de, wBackupChannelUnknownC157s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC15Fs
	ld de, wBackupChannelUnknownC15Fs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld a, $0
	ld [wChannel1UnknownC15B], a
	ld [wChannel2UnknownC15B], a
	ld [wChannel3UnknownC15B], a
	ld [wChannel4UnknownC15B], a
	ld hl, wNR12
	ld de, wBackupNR12
	ld a, $3
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelFrequencyOffsets
	ld de, wBackupChannelFrequencyOffsets
	ld a, $3
	call AudioEngine_CopyBytes_\1
	ld hl, wNoiseSamplePointer
	ld de, wBackupNoiseSamplePointer
	ld a, $2
	call AudioEngine_CopyBytes_\1
	ld a, $0
	ld [wBackupc16f], a
	ld hl, wChannelStackPointers
	ld de, wBackupChannelStackPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld hl, wChannel1Stack
	ld de, wBackupChannel1Stack
	ld a, $30
	call AudioEngine_CopyBytes_\1
	ret

RestoreMusicData___\1: ; 70af3 (1c:4af3)
	ld a, [wBackupSongIndex]
	ld [wSongIndex], a
	ld a, [wBackupAudioROMBank]
	ld [wAudioROMBank], a
	ld a, [wBackupGlobalDuty]
	ld [wGlobalDuty], a
	ld hl, wBackupChannelNR1s
	ld de, wChannelNR1s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld a, [wBackupc10a]
	ld [wc10a], a
	ld a, $1
	ld [wc10b], a
	ld hl, wBackupChannelActiveFlags
	ld de, wChannelActiveFlags
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelNoteStates
	ld de, wChannelNoteStates
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelPointers
	ld de, wChannelPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelStartPointers
	ld de, wChannelStartPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld a, [wBackupc12b]
	ld [wNoiseSampleHeader], a
	ld a, [wBackupc12b + 1]
	ld [wNoiseSampleHeader + 1], a
	ld hl, wBackupChannelOctaves
	ld de, wChannelOctaves
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC133s
	ld de, wChannelUnknownC133s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelNotesPlaying
	ld de, wChannelNotesPlaying
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelNoteDurations
	ld de, wChannelNoteDurations
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC13Fs
	ld de, wChannelUnknownC13Fs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC143s
	ld de, wChannelUnknownC143s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelNR2s
	ld de, wChannelNR2s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelKeySignatures
	ld de, wChannelKeySignatures
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelTemposs
	ld de, wChannelTemposs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC157s
	ld de, wChannelUnknownC157s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC15Fs
	ld de, wChannelUnknownC15Fs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupNR12
	ld de, wNR12
	ld a, $3
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelFrequencyOffsets
	ld de, wChannelFrequencyOffsets
	ld a, $3
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupNoiseSamplePointer
	ld de, wNoiseSamplePointer
	ld a, $2
	call AudioEngine_CopyBytes_\1
	ld a, [wBackupc16f]
	ld [wc16f], a
	ld hl, wBackupChannelStackPointers
	ld de, wChannelStackPointers
	ld a, $8
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannel1Stack
	ld de, wChannel1Stack
	ld a, $30
	call AudioEngine_CopyBytes_\1
	ret

AudioEngine_CopyBytes_\1: ; 70c0a (1c:4c0a)
	ld c, a
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ret


ChannelStackPointerResets_\1: ; 70c12
Channel1StackPointerReset_\1: ; 70c12
	dw wChannel1Stack

Channel2StackPointerReset_\1: ; 70c14
	dw wChannel2Stack

Channel3StackPointerReset_\1: ; 70c16
	dw wChannel3Stack

Channel4StackPointerReset_\1: ; 70c18
	dw wChannel4Stack

CNotes_\1: ; 70c1a
	db   0
	db  24
	db  48
	db  72
	db  96
	db 120
	db 144
	db 168

FrequencyTable_\1: ; 70c22
	dw $2c, $9c, $106, $16b
	dw $1c9, $222, $278, $2c6
	dw $312, $358, $39b, $3da

	dw $416, $44e, $483, $4b5
	dw $4e5, $511, $53c, $563
	dw $589, $5ac, $5cd, $5ed

	dw $60b, $628, $642, $65b
	dw $672, $689, $69e, $6b2
	dw $6c4, $6d6, $6e7, $6f6

	dw $705, $714, $721, $72d
	dw $739, $744, $74f, $759
	dw $762, $76b, $773, $77b

	dw $783, $78a, $790, $797
	dw $79d, $7a2, $7a7, $7ac
	dw $7b1, $7b6, $7ba, $7be

	dw $7c1, $7c5, $7c8, $7cb
	dw $7ce, $7d1, $7d4, $7d6
	dw $7d9, $7db, $7dd, $7df

	dw $7e1, $7e3, $7e4, $7e5
	dw $7e7, $7e8, $7ea, $7eb
	dw $7ec, $7ed, $7ee, $7ef

	dw $7f0

Data_70ccc_\1: ; 70ccc
	dw Data_70cf4_\1
	dw Data_70d04_\1
	dw Data_70d14_\1
	dw Data_70d24_\1
	dw Data_70d34_\1
	dw Data_70d44_\1
	dw Data_70d54_\1
	dw Data_70d64_\1
	dw Data_70da4_\1
	dw Data_70db4_\1
	dw Data_70dc4_\1
	dw Data_70dd4_\1
	dw Data_70d84_\1
	dw Data_70d84_\1
	dw Data_70d94_\1
	dw Data_70d84_\1
	dw Data_70d84_\1
	dw Data_70d84_\1
	dw Data_70d84_\1
	dw Data_70d74_\1

Data_70cf4_\1: ; 70cf4
	db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35

Data_70d04_\1: ; 70d04
	db $01, $12, $23, $34, $45, $56, $67, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff

Data_70d14_\1: ; 70d14
	db $12, $23, $33, $44, $55, $66, $77, $77, $78, $89, $9a, $ab, $bb, $cc, $dd, $ee

Data_70d24_\1: ; 70d24
	db $22, $33, $34, $45, $55, $66, $77, $77, $78, $89, $99, $aa, $bb, $bc, $cd, $dd

Data_70d34_\1: ; 70d34
	db $33, $34, $44, $55, $56, $66, $77, $77, $78, $88, $99, $9a, $aa, $bb, $bc, $cc

Data_70d44_\1: ; 70d44
	db $7b, $ff, $ff, $fb, $73, $00, $00, $03, $7b, $ff, $ff, $fb, $73, $00, $00, $03

Data_70d54_\1: ; 70d54
	db $7b, $ef, $ff, $eb, $73, $00, $00, $03, $7b, $ef, $ff, $eb, $73, $00, $00, $03

Data_70d64_\1: ; 70d64
	db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14

Data_70d74_\1: ; 70d74
	db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33

Data_70d84_\1: ; 70d84
	db $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_70d94_\1: ; 70d94
	db $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22

Data_70da4_\1: ; 70da4
	db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00

Data_70db4_\1: ; 70db4
	db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11

Data_70dc4_\1: ; 70dc4
	db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22

Data_70dd4_\1: ; 70dd4
	db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33

Data_70de4_\1: ; 70de4
	dw Data_70e52_\1, Data_70e59_\1, Data_70e60_\1, Data_70e69_\1
	dw Data_70e72_\1, Data_70e7b_\1, Data_70e85_\1, Data_70e8f_\1
	dw Data_70e97_\1, Data_70e9f_\1, Data_70ec1_\1, Data_70ec7_\1
	dw Data_70ee4_\1, Data_70eeb_\1, Data_70ef2_\1, Data_70efc_\1
	dw Data_70f06_\1, Data_70f10_\1, Data_70f1a_\1, Data_70f21_\1
	dw Data_70f28_\1, Data_70f2f_\1, Data_70f49_\1, Data_70f54_\1
	dw Data_70f74_\1, Data_70f8c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1
	dw Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1, Data_70e4c_\1

Data_70e4c_\1: ; 70e4c
	db $0
	db $ed, $2, $c0, $48
	db $4e

Data_70e52_\1: ; 70e52
	db $88
	db $f7, $b2, $c0, $48
	db $4f
	db $ff

Data_70e59_\1: ; 70e59
	db $88
	db $f7, $82, $c0, $48
	db $4f
	db $ff

Data_70e60_\1: ; 70e60
	db $88
	db $0, $a1, $80, $6
	db $4
	db $6
	db $4
	db $ff

Data_70e69_\1: ; 70e69
	db $88
	db $0, $81, $80, $6
	db $4
	db $6
	db $4
	db $ff

Data_70e72_\1: ; 70e72
	db $88
	db $0, $61, $80, $6
	db $4
	db $6
	db $4
	db $ff

Data_70e7b_\1: ; 70e7b
	db $88
	db $0, $c1, $80, $6
	db $4
	db $6
	db $4
	db $4
	db $ff

Data_70e85_\1: ; 70e85
	db $88
	db $f7, $e1, $c0, $2
	db $1
	db $1
	db $1
	db $1
	db $ff

Data_70e8f_\1: ; 70e8f
	db $88
	db $f7, $b1, $c0, $2
	db $1
	db $1
	db $ff

Data_70e97_\1: ; 70e97
	db $88
	db $f7, $91, $c0, $2
	db $1
	db $1
	db $ff

Data_70e9f_\1: ; 70e9f
	db $88
	db $0, $b3, $80, $2
	db $0
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $ff

Data_70ec1_\1: ; 70ec1
	db $88
	db $1e, $91, $80, $3d
	db $ff

Data_70ec7_\1: ; 70ec7
	db $88
	db $0, $c3, $80, $2
	db $0
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $ff

Data_70ee4_\1: ; 70ee4
	db $88
	db $1e, $f1, $c0, $36
	db $47
	db $ff

Data_70eeb_\1: ; 70eeb
	db $88
	db $32, $f1, $c0, $36
	db $47
	db $ff

Data_70ef2_\1: ; 70ef2
	db $88
	db $f5, $d1, $c0, $d8
	db $22
	db $11
	db $6
	db $4
	db $ff

Data_70efc_\1: ; 70efc
	db $88
	db $f7, $b1, $c0, $d8
	db $22
	db $11
	db $6
	db $4
	db $ff

Data_70f06_\1: ; 70f06
	db $88
	db $f7, $91, $c0, $d8
	db $6
	db $4
	db $6
	db $6
	db $ff

Data_70f10_\1: ; 70f10
	db $88
	db $f7, $f1, $c0, $d8
	db $33
	db $22
	db $11
	db $6
	db $ff

Data_70f1a_\1: ; 70f1a
	db $88
	db $0, $d1, $80, $2
	db $1
	db $ff

Data_70f21_\1: ; 70f21
	db $88
	db $0, $a1, $80, $2
	db $1
	db $ff

Data_70f28_\1: ; 70f28
	db $88
	db $0, $71, $b0, $2
	db $1
	db $ff

Data_70f2f_\1: ; 70f2f
	db $88
	db $0, $a3, $c0, $fd
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $1
	db $ff

Data_70f49_\1: ; 70f49
	db $88
	db $0, $b4, $80, $46
	db $6
	db $4
	db $0
	db $4
	db $2
	db $ff

Data_70f54_\1: ; 70f54
	db $88
	db $0, $a1, $80, $46
	db $7
	db $5
	db $0
	db $0
	db $3
	db $3
	db $0
	db $0
	db $2
	db $2
	db $0
	db $0
	db $2
	db $2
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $ff

Data_70f74_\1: ; 70f74
	db $88
	db $0, $c2, $80, $48
	db $b
	db $a
	db $9
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $ff

Data_70f8c_\1: ; 70f8c
	db $88
	db $0, $72, $80, $48
	db $b
	db $a
	db $9
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $b
	db $a
	db $ff

Data_70fa4_\1: ; 70fa4
	dw Data_70fce_\1
	dw Data_70fd1_\1
	dw Data_70fe3_\1
	dw Data_70ffd_\1
	dw Data_71055_\1
	dw Data_71070_\1
	dw Data_71079_\1
	dw Data_71090_\1
	dw Data_710ae_\1
	dw Data_710be_\1
	dw Data_710d5_\1
	dw Data_710f6_\1
	dw Data_71106_\1
	dw Data_71112_\1
	dw Data_71166_\1
	dw Data_71181_\1
	dw Data_711d5_\1
	dw Data_711ec_\1
	dw Data_711f6_\1
	dw Data_7120e_\1
	dw Data_71220_\1

Data_70fce_\1: ; 70fce
	db $00, $80, $01

Data_70fd1_\1: ; 70fd1
	db $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff, $00, $00, $80, $80

Data_70fe3_\1: ; 70fe3
	db $01, $01, $01, $02, $02, $02, $01, $01, $01, $00, $00, $00, $ff, $ff, $ff, $fe, $fe, $fe, $ff, $ff, $ff, $00, $00, $00, $80, $80

Data_70ffd_\1: ; 70ffd
	db $f9, $fc, $fe, $00, $00, $00, $01, $02, $03, $04, $03, $02, $01, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00, $01, $02, $03, $04, $03, $02, $01, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00, $01, $02, $03, $04, $03, $02, $01, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00, $01, $02, $03, $04, $03, $02, $01, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00, $01, $02, $03, $04, $03, $02, $01, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00, $80, $00

Data_71055_\1: ; 71055
	db $fc, $fe, $ff, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff, $00, $00, $80, $13

Data_71070_\1: ; 71070
	db $00, $04, $08, $06, $04, $02, $00, $80, $80

Data_71079_\1: ; 71079
	db $fc, $fe, $ff, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $14

Data_71090_\1: ; 71090
	db $d0, $dc, $e8, $f4, $fa, $fd, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff, $00, $00, $80, $13

Data_710ae_\1: ; 710ae
	db $f6, $fa, $fe, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00

Data_710be_\1: ; 710be
	db $0f, $0a, $05, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $14

Data_710d5_\1: ; 710d5
	db $f6, $fb, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $00, $00, $fb, $f6, $f1, $ec, $e7, $ec, $f1, $f6, $fb, $00, $80, $00

Data_710f6_\1: ; 710f6
	db $f1, $f6, $fb, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $80

Data_71106_\1: ; 71106
	db $d0, $dc, $e8, $f4, $fa, $fd, $00, $00, $00, $00, $80, $80

Data_71112_\1: ; 71112
	db $ec, $f1, $f6, $f8, $fa, $fc, $fe, $00, $00, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $80, $00

Data_71166_\1: ; 71166
	db $f6, $fa, $fe, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $fb, $f6, $f1, $ec, $e7, $ec, $f1, $f6, $fb, $00, $80, $00

Data_71181_\1: ; 71181
	db $ec, $f1, $f6, $f8, $fa, $fc, $fe, $00, $00, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $01, $01, $02, $03, $02, $01, $01, $00, $ff, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $ff, $00, $80, $00

Data_711d5_\1: ; 711d5
	db $04, $02, $01, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $14

Data_711ec_\1: ; 711ec
	db $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $80

Data_711f6_\1: ; 711f6
	db $08, $04, $02, $01, $00, $00, $00, $00, $00, $00, $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $14

Data_7120e_\1: ; 7120e
	db $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff, $00, $00, $80, $80

Data_71220_\1: ; 71220
	db $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $80

Data_7122e_\1: ; 7122e
	db $0
	REPT 108
	db $a
	ENDR
 
NumSongs_\1: ; 7129b
	db 29
ENDM

SECTION "Audio Engine", ROMX [$4000], BANK [$1c]
	audio_engine 1c

SECTION "Audio Engine 2", ROMX [$4000], BANK [$1d]
	audio_engine 1d

SECTION "Audio Engine 3", ROMX [$6800], BANK [$1d]
PlaySFX:
	jp PlaySFX_

UpdateSFX: ; 76803
	jp UpdateSFX_

PlaySFX_: ; 76806 (1d:6806)
	ld hl, MaxSFXIndex
	cp [hl]
	jr nc, .invalid_sfx
	add a
	ld c, a
	ld b, $0
	ld a, [wSFXActive2]
	or a
	jr z, .skip
	call ResetSFXChannelRegisters
.skip
	ld a, $1
	ld [wSFXActive2], a
	ld hl, SFXHeaderPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [wSFXChannelFlags], a
	ld [wSFXChannelFlags2], a
	ld de, wChannelSFXPointers
	ld c, $0
.loop
	ld a, [wSFXChannelFlags2]
	rrca
	ld [wSFXChannelFlags2], a
	jr nc, .next
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld hl, wChannelUnknownC1AFs
	add hl, bc
	ld [hl], $0
	ld hl, wChannelUnknownC1B3s
	add hl, bc
	ld [hl], $1
	pop hl
	jr .next_ch

.next
	inc de
	inc de
.next_ch
	inc c
	ld a, $4
	cp c
	jr nz, .loop
.invalid_sfx
	ret

UpdateSFX_: ; 76859 (1d:6859)
	ld a, [wSFXChannelFlags]
	or a
	jr nz, .no_sfx
	call ResetSFXVariables
	ret

.no_sfx
	xor a
	ld b, a
	ld c, a
	ld a, [wSFXChannelFlags]
	ld [wSFXChannelFlags2], a
.loop_channels
	ld hl, wSFXChannelFlags2
	ld a, [hl]
	rrca
	ld [hl], a
	jr nc, .skip_command_processing
	ld hl, wChannelUnknownC1B3s
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .process_command
	ld [hl], a
	call ApplySFXPitchOffset
	jr .skip_command_processing

.process_command
	ld hl, wChannelSFXPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call SFXCommandProcessor
.skip_command_processing
	inc c
	ld a, c
	cp $4
	jr nz, .loop_channels
	ret

SFXCommandProcessor: ; 76894 (1d:6894)
	ld a, [hl]
	and $f0
	swap a
	add a
	ld e, a
	ld d, $0
	ld a, [hli]
	push hl
	and $f
	ld hl, Pointers_768ab
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	jp hl

Pointers_768ab: ; 768ab
	dw SFXCommand_Frq
	dw SFXCommand_Env
	dw SFXCommand_Duty
	dw SFXCommand_StartLoop
	dw SFXCommand_EndLoop
	dw SFXCommand_SetC1AF
	dw SFXCommand_SetC1B3
	dw SFXCommand_Wave
	dw SFXCommand_DutyCycle
	dw SFXCommand_DoNothing
	dw SFXCommand_DoNothing
	dw SFXCommand_DoNothing
	dw SFXCommand_DoNothing
	dw SFXCommand_DoNothing
	dw SFXCommand_DoNothing
	dw SFXCommand_EndChannel

SFXCommand_DoNothing: ; Data_7768cb
	jp SFXCommandProcessor

SFXCommand_Frq: ; 768ce (1d:68ce)
	ld d, a
	pop hl
	ld a, [hli]
	ld e, a
	push hl
	ld hl, wChannelUnknownC1B7s
	add hl, bc
	add hl, bc
	ld [hli], a
	ld [hl], d
	ld hl, wChannelUnknownC1ABs
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	or d
	ld d, a
	ld hl, rNR13
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop de
FinishSFXCommands: ; 768f0 (1d:68f0)
	ld hl, wChannelSFXPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

SFXCommand_Env: ; 768f9 (1d:68f9)
	ld hl, wChannelUnknownC1ABs
	add hl, bc
	ld a, $80
	ld [hl], a
	pop hl
	ld a, [hli]
	ld e, a
	push hl
	ld hl, rNR12
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld [hl], e
	pop hl
	jp SFXCommandProcessor

SFXCommand_Duty: ; 76912 (1d:6912)
	swap a
	ld e, a
	ld hl, rNR11
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld [hl], e
	pop hl
	jp SFXCommandProcessor

SFXCommand_StartLoop: ; 76923 (1d:6923)
	ld hl, wChannelLoopReturnPointers
	add hl, bc
	add hl, bc
	pop de
	ld a, [de]
	inc de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wChannelLoopCounters
	add hl, bc
	ld [hl], a
	ld l, e
	ld h, d
	jp SFXCommandProcessor

SFXCommand_EndLoop: ; 76938 (1d:6938)
	ld hl, wChannelLoopCounters
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .loop_over
	ld [hl], a
	ld hl, wChannelLoopReturnPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp SFXCommandProcessor

.loop_over
	pop hl
	jp SFXCommandProcessor

SFXCommand_SetC1AF: ; 76951 (1d:6951)
	ld hl, wChannelUnknownC1AFs
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	jp SFXCommandProcessor

SFXCommand_SetC1B3: ; 7695d (1d:695d)
	call ApplySFXPitchOffset
	ld hl, wChannelUnknownC1B3s
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	ld e, l
	ld d, h
	jp FinishSFXCommands

ApplySFXPitchOffset: ; 7696e (1d:696e)
	ld hl, wChannelUnknownC1AFs
	add hl, bc
	ld a, [hl]
	or a
	jr z, .bail
	ld hl, wChannelUnknownC1B7s
	add hl, bc
	add hl, bc
	bit 7, a
	jr z, .positive
	xor $ff
	inc a
	ld d, a
	ld a, [hl]
	sub d
	ld [hli], a
	ld e, a
	ld a, [hl]
	sbc b
	jr .done

.positive
	ld d, a
	ld a, [hl]
	add d
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc b
.done
	ld [hl], a
	ld hl, wChannelUnknownC1ABs
	add hl, bc
	ld d, [hl]
	ld [hl], $0
	or d
	ld d, a
	ld hl, rNR13
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
.bail
	ret

SFXCommand_Wave: ; 769a9 (1d:69a9)
	add a
	ld d, $0
	ld e, a
	ld hl, SFXWaveSamples
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $0
	ldh [rNR30], a
	ld b, d
	ld de, rWave_0
.loop
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $10
	jr nz, .loop
	ld a, $1
	ld [wc10b], a
	ld a, $80
	ldh [rNR30], a
	ld b, $0
	pop hl
	jp SFXCommandProcessor

SFXCommand_DutyCycle: ; 769d4 (1d:69d4)
	pop hl
	ld a, [hli]
	push hl
	push bc
	inc c
	ld e, $ee
.loop
	dec c
	jr z, .set
	rlca
	rlc e
	jr .loop

.set
	ld d, a
	ld hl, wSFXGlobalDuty
	ld a, [hl]
	and e
	or d
	ld [hl], a
	pop bc
	pop hl
	jp SFXCommandProcessor

SFXCommand_EndChannel: ; 769f0 (1d:69f0)
	ld e, c
	inc e
	ld a, $7f
.loop
	rlca
	dec e
	jr nz, .loop
	ld e, a
	ld a, [wSFXChannelFlags]
	and e
	ld [wSFXChannelFlags], a
	ld a, c
	rlca
	rlca
	add c
	ld e, a
	ld d, b
	ld hl, rNR12
	add hl, de
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	pop hl
	ret

ResetSFXVariables: ; 76a13 (1d:6a13)
	xor a
	ld [wSFXActive2], a
	ld [wSFXActive], a
	ld a, $80
	ld [wSFXIndex], a
	ret

ResetSFXChannelRegisters: ; 76a20 (1d:6a20)
	ld a, $8
	ldh a, [rNR12]
	ldh a, [rNR22]
	ldh a, [rNR32]
	ldh a, [rNR42]
	ld a, $80
	ldh a, [rNR14]
	ldh a, [rNR24]
	ldh a, [rNR44]
	xor a
	ld [wSFXChannelFlags], a
  	ret
