audio_engine: MACRO
Func_70000_\1::
	jp Func_70088_\1

UpdateSound_\1:: ; 70003 (1c:4003)
	jp UpdateSound__\1

StartSong_\1:: ; 70006 (1c:4006)
	jp StartSong__\1

Func_70009_\1:: ; 70009 (1c:4009)
	jp Func_70038_\1

Func_7000c_\1:: ; 7000c (1c:400c)
	jp Func_70059_\1

Func_7000f_\1:: ; 7000f (1c:400f)
	jp Func_7005d_\1

Func_70012_\1:: ; 70012 (1c:4012)
	jp Func_70067_\1

ToggleMusic_\1:: ; 70015 (1c:4015)
	jp ToggleMusic__\1

SetVolume_\1:: ; 70018 (1c:4018)
	jp SetVolume__\1

Func_7001b_\1:: ; 7001b (1c:401b)
	jp Func_709ba_\1

Func_7001e_\1:: ; 7001e (1c:401e)
	jp Func_709c4_\1

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

Func_70038_\1: ; 70038 (1c:4038)
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

Func_70059_\1: ; 70059 (1c:4059)
	ld [wc170], a
	ret

Func_7005d_\1: ; 7005d (1c:405d)
	ld a, [wSongIndex]
	cp $80
	ld a, $1
	ret nz
	xor a
	ret

Func_70067_\1: ; 70067 (1c:4067)
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

Func_70088_\1: ; 70088 (1c:4088)
	xor a
	ld [rNR52], a
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld a, BANK(Func_70088_1c)
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
	ld [wc170], a
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
	ld hl, wChannelUnknownC14Bs
	add hl, bc
	ld [hl], d
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld [hl], d
	inc c
	ld a, c
	cp $4
	jr nz, .loop
	ld hl, Data_70c12_\1
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
	ld hl, Func_76803
	call AudioEngineFarCall
	ld a, [wAudioROMBank]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, [wMusicPaused]
	cp $0
	jr z, .play_channels
	call Func_70976_\1
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
	call Func_70156_\1
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

Func_70156_\1: ; 70156 (1c:4156)
	ld a, [wSFXChannelFlags]
	ld d, a
	xor a
	ld [wChannel1ActiveFlag], a
	bit 0, d
	jr nz, .asm_7016a
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.asm_7016a
	xor a
	ld [wChannel2ActiveFlag], a
	bit 1, d
	jr nz, .asm_7017a
	ld a, $8
	ld [rNR22], a
	swap a
	ld [rNR24], a
.asm_7017a
	xor a
	ld [wChannel4ActiveFlag], a
	bit 3, d
	jr nz, .asm_7018a
	ld a, $8
	ld [rNR42], a
	swap a
	ld [rNR44], a
.asm_7018a
	xor a
	ld [wChannel3ActiveFlag], a
	bit 2, d
	jr nz, .asm_70196
	ld a, $0
	ld [rNR32], a
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
	ld [hROMBank], a
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
	ld [wChannel1UnknownC14B], a
	ld a, [Data_70c12_\1]
	ld [wChannel1StackPointer], a
	ld a, [Data_70c12_\1 + 1]
	ld [wChannel1StackPointer + 1], a
	ld a, $8
	ld [wChannel1UnknownC147], a
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
	ld [wChannel2UnknownC14B], a
	ld a, [Data_70c14_\1]
	ld [wChannel2StackPointer], a
	ld a, [Data_70c14_\1 + 1]
	ld [wChannel2StackPointer + 1], a
	ld a, $8
	ld [wChannel2UnknownC147], a
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
	ld [wChannel3UnknownC14B], a
	ld a, [Data_70c16_\1]
	ld [wChannel3StackPointer], a
	ld a, [Data_70c16_\1 + 1]
	ld [wChannel3StackPointer + 1], a
	ld a, $40
	ld [wChannel3UnknownC147], a
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
	ld [wChannel4UnknownC14B], a
	ld a, [Data_70c18_\1]
	ld [wChannel4StackPointer], a
	ld a, [Data_70c18_\1 + 1]
	ld [wChannel4StackPointer + 1], a
	ld a, $40
	ld [wChannel4UnknownC147], a
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
	ld a, [wChannel1UnknownC137]
	cp $0
	jr z, .asm_702df
	ld a, [wChannel1UnknownC143]
	dec a
	ld [wChannel1UnknownC143], a
	jr nz, .asm_702df
	ld a, [wChannel1NoteDuration]
	cp $1
	jr z, .asm_702df
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .asm_702df
	ld hl, rNR12
	ld a, [wChannel1UnknownC147]
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.asm_702df
	ld a, [wChannel1NoteDuration]
	dec a
	ld [wChannel1NoteDuration], a
	jr nz, .skip_audio_command_processor
	ld a, [wChannel1Pointer + 1]
	ld h, a
	ld a, [wChannelPointers]
	ld l, a
	ld bc, $0
	call AudioCommandProcessor_\1
	ld a, [wChannel1ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Func_7071d_\1
.skip_audio_command_processor
	ld a, $0
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .skip_sfx
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.skip_sfx
	ret

PlayChannel2_\1: ; 70315 (1c:4315)
	ld a, [wChannel2ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel2UnknownC137]
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
	ld a, [wChannel2UnknownC147]
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
	call AudioCommandProcessor_\1
	ld a, [wChannel2ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Func_70763_\1
.skip_command_processor
	ld a, $1
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .asm_70379
	ld a, $8
	ld [rNR22], a
	swap a
	ld [rNR24], a
.asm_70379
	ret

PlayChannel3_\1: ; 7037a (1c:437a)
	ld a, [wChannel3ActiveFlag]
	or a
	jr z, .channel_switched_off
	ld a, [wChannel3UnknownC137]
	cp $0
	jr z, .asm_703a3
	ld a, [wChannel3UnknownC143]
	dec a
	ld [wChannel3UnknownC143], a
	jr nz, .asm_703a3
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_703a3
	ld a, [wChannel3NoteDuration]
	cp $1
	jr z, .asm_703a3
	ld a, [wChannel3UnknownC147]
	ld [rNR32], a
.asm_703a3
	ld a, [wChannel3NoteDuration]
	dec a
	ld [wChannel3NoteDuration], a
	jr nz, .skip_command_processor
	ld a, [wChannel3Pointer + 1]
	ld h, a
	ld a, [wChannel3Pointer]
	ld l, a
	ld bc, $2
	call AudioCommandProcessor_\1
	ld a, [wChannel3ActiveFlag]
	or a
	jr z, .channel_switched_off
	call Func_707a5_\1
.skip_command_processor
	ld a, $2
	call UpdateChannelNoise_\1
	ret

.channel_switched_off
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_703d8
	ld a, $0
	ld [rNR32], a
	ld a, $80
	ld [rNR34], a
.asm_703d8
	ret

PlayChannel4_\1: ; 703d9 (1c:43d9)
	ld a, [wChannel4ActiveFlag]
	or a
	jr z, .asm_7040b
	ld a, [wChannel4NoteDuration]
	dec a
	ld [wChannel4NoteDuration], a
	jr nz, .asm_70401
	ld a, [wChannel4Pointer + 1]
	ld h, a
	ld a, [wChannel4Pointer]
	ld l, a
	ld bc, $3
	call AudioCommandProcessor_\1
	ld a, [wChannel4ActiveFlag]
	or a
	jr z, .asm_7040b
	call Func_70813_\1
	jr .asm_7041e

.asm_70401
	ld a, [wc16f]
	or a
	jr z, .asm_7041e
	call Func_70842_\1
	ret

.asm_7040b
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr nz, .asm_7041e
	xor a
	ld [wc16f], a
	ld a, $8
	ld [rNR42], a
	swap a
	ld [rNR44], a
.asm_7041e
	ret

AudioCommandProcessor_\1: ; 7041f (1c:441f)
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
	dw Func_705a3_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw MusicCommand_Octave_\1
	dw AudioCommand_OctaveUp_\1
	dw AudioCommand_OctaveDown_\1
	dw AudioCommand_MuteChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_Duty_\1
	dw AudioCommand_SetStartPointer_\1
	dw AudioCommand_JumpStartPointer_\1
	dw AudioCommand_SetLoop_\1
	dw AudioCommand_DoLoop_\1
	dw AudioCommand_JumpChannel_\1
	dw AudioCommand_CallChannel_\1
	dw AudioCommand_RetChannel_\1
	dw Func_70672_\1
	dw Func_7067f_\1
	dw Func_7068c_\1
	dw Func_70699_\1
	dw Func_706a9_\1
	dw Func_706b6_\1
	dw Func_706c3_\1
	dw Func_706d5_\1
	dw Func_706e2_\1
	dw Func_706ef_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1
	dw AudioCommand_StopChannel_\1

.note
	push af
	ld a, [hl]
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
	ld hl, wChannelUnknownC14Fs
	add hl, bc
	ld d, [hl]
	and $f
	inc a
	cp d
	jr nc, .no_rotate_regs
	ld e, a
	ld a, d
	ld d, e
.no_rotate_regs
	ld e, a
.loop
	dec d
	jr z, .done
	add e
	jr .loop

.done
	ld hl, wChannelNoteDurations
	add hl, bc
	ld [hl], a
	pop de
	ld d, a
	ld a, e
	cp $d9
	ld a, d
	jr z, .asm_70506
	ld e, a
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld a, [hl]
	cp $8
	ld d, a
	ld a, e
	jr z, .asm_70506
	push hl
	push bc
	ld b, $0
	ld c, a
	ld hl, $0
.asm_704f3
	add hl, bc
	dec d
	jr nz, .asm_704f3
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	pop bc
	pop hl
.asm_70506
	ld hl, wChannelUnknownC143s
	add hl, bc
	ld [hl], a
	pop af
	and $f0
	ld hl, wChannelUnknownC137s
	add hl, bc
	ld [hl], a
	or a
	jr nz, .asm_70519
	jp Func_70599_\1

.asm_70519
	swap a
	dec a
	ld h, a
	ld a, $3
	cp c
	ld a, h
	jr z, .asm_70525
	jr .asm_7056f

.asm_70525
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
	ld de, wc12b
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
	ld hl, wc16d
	ld [hli], a
	ld [hl], d
	ld a, $1
	ld [wc16f], a
	jr Func_70599_\1

.asm_7056f
	ld hl, wChannelFrequencies
	add hl, bc
	add hl, bc
	push hl
	ld hl, wChannelOctaves
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, Data_70c1a_\1
	add hl, de
	add a
	ld e, [hl]
	add e
	ld hl, wChannelUnknownC14Bs
	add hl, bc
	ld e, [hl]
	add e
	add e
	ld e, a
	ld hl, Data_70c22_\1
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	call ApplyPitchOffset_\1
	pop hl
	ld a, e
	ld [hli], a
	ld [hl], d
Func_70599_\1: ; 70599 (1c:4599)
	pop de
	ld hl, wChannelPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_705a3_\1: ; 705a3 (1c:45a3)
	pop hl
	ld a, [hli]
	push hl
	ld hl, wChannelUnknownC14Fs
	add hl, bc
	ld [hl], a
	jp NextAudioCommand_\1

MusicCommand_Octave_\1: ; 705ae (1c:45ae)
	and $7
	dec a
	ld hl, wChannelOctaves
	add hl, bc
	push af
	ld a, c
	cp $2
	jr nz, .not_ch2
	pop af
	inc a
	ld [hl], a
	jp NextAudioCommand_\1

.not_ch2
	pop af
	ld [hl], a
	jp NextAudioCommand_\1

AudioCommand_OctaveUp_\1: ; 705c6 (1c:45c6)
	ld hl, wChannelOctaves
	add hl, bc
	inc [hl]
	jp NextAudioCommand_\1

AudioCommand_OctaveDown_\1: ; 705ce (1c:45ce)
	ld hl, wChannelOctaves
	add hl, bc
	dec [hl]
	jp NextAudioCommand_\1

AudioCommand_MuteChannel_\1: ; 705d6 (1c:45d6)
	ld hl, wChannelNoteStates
	add hl, bc
	ld [hl], $80
	jp NextAudioCommand_\1

AudioCommand_Duty_\1: ; 705df (1c:45df)
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
	jp NextAudioCommand_\1

AudioCommand_SetStartPointer_\1: ; 705fa (1c:45fa)
	pop de
	push de
	dec de
	ld hl, wChannelStartPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	jp NextAudioCommand_\1

AudioCommand_JumpStartPointer_\1: ; 70608 (1c:4608)
	pop hl
	ld hl, wChannelStartPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp AudioCommandProcessor_\1

AudioCommand_SetLoop_\1: ; 70614 (1c:4614)
	pop de
	ld a, [de]
	inc de
	push af
	call AudioCommand_GetChannelStackPointer_\1
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop af
	ld [hl], a
	inc hl
	push de
	call AudioCommand_PushLoopAddress_\1
	jp NextAudioCommand_\1

AudioCommand_DoLoop_\1: ; 70629 (1c:4629)
	call AudioCommand_GetChannelStackPointer_\1
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
	jp AudioCommandProcessor_\1

.done_loop
	dec hl
	dec hl
	call AudioCommand_PushLoopAddress_\1
	jp NextAudioCommand_\1

AudioCommand_JumpChannel_\1: ; 70643 (1c:4643)
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp AudioCommandProcessor_\1

AudioCommand_CallChannel_\1: ; 7064a (1c:464a)
	call AudioCommand_GetChannelStackPointer_\1
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
	call AudioCommand_PushLoopAddress_\1
	jp NextAudioCommand_\1

AudioCommand_RetChannel_\1: ; 70661 (1c:4661)
	pop de
	call AudioCommand_GetChannelStackPointer_\1
	dec hl
	ld a, [hld]
	ld e, [hl]
	ld d, a
	inc de
	inc de
	push de
	call AudioCommand_PushLoopAddress_\1
	jp NextAudioCommand_\1

Func_70672_\1: ; 70672 (1c:4672)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelFrequencyOffsets
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_7067f_\1: ; 7067f (1c:467f)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelNR1s
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_7068c_\1: ; 7068c (1c:468c)
	pop de
	ld a, [de]
	inc de
	ld hl, wNR12
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_70699_\1: ; 70699 (1c:4699)
	pop de
	ld a, [de]
	inc de
	ld [wc10a], a
	ld a, $1
	ld [wc10b], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_706a9_\1: ; 706a9 (1c:46a9)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC13Fs
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_706b6_\1: ; 706b6 (1c:46b6)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC147s
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_706c3_\1: ; 706c3 (1c:46c3)
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
	jp AudioCommandProcessor_\1

Func_706d5_\1: ; 706d5 (1c:46d5)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC15Fs
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_706e2_\1: ; 706e2 (1c:46e2)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC14Bs
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

Func_706ef_\1: ; 706ef (1c:46ef)
	pop de
	ld a, [de]
	inc de
	ld hl, wChannelUnknownC14Bs
	add hl, bc
	add [hl]
	ld [hl], a
	ld h, d
	ld l, e
	jp AudioCommandProcessor_\1

AudioCommand_StopChannel_\1: ; 706fd (1c:46fd)
	ld hl, wChannelActiveFlags
	add hl, bc
	ld [hl], $0
	pop hl
	ret

AudioCommand_GetChannelStackPointer_\1: ; 70705 (1c:4705)
	ld hl, wChannelStackPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

AudioCommand_PushLoopAddress_\1: ; 7070e (1c:470e)
	ld d, h
	ld e, l
	ld hl, wChannelStackPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

NextAudioCommand_\1: ; 70719 (1c:4719)
	pop hl
	jp AudioCommandProcessor_\1

Func_7071d_\1: ; 7071d (1c:471d)
	ld a, [wSFXChannelFlags]
	bit 0, a
	jr nz, .dont_play_note
	ld a, [wChannel1UnknownC137]
	cp $0
	jr z, .asm_70753
	ld d, $0
	ld hl, wChannelNoteStates
	ld a, [hl]
	cp $80
	jr z, .skip
	ld a, [wNR12]
	ld [rNR12], a
	ld d, $80
.skip
	ld [hl], $2
	ld a, $8
	ld [rNR10], a
	ld a, [wChannel1NR1]
	ld [rNR11], a
	ld a, [wChannel1Frequency]
	ld [rNR13], a
	ld a, [wChannel1Frequency + 1]
	or d
	ld [rNR14], a
.dont_play_note
	ret

.asm_70753
	ld hl, wChannel1NoteState
	ld [hl], $0
	ld hl, rNR12
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Func_70763_\1: ; 70763 (1c:4763)
	ld a, [wSFXChannelFlags]
	bit 1, a
	jr nz, .asm_70794
	ld a, [wChannel2UnknownC137]
	cp $0
	jr z, .asm_70795
	ld d, $0
	ld hl, wChannel2NoteState
	ld a, [hl]
	cp $80
	jr z, .asm_70782
	ld a, [wNR22]
	ld [rNR22], a
	ld d, $80
.asm_70782
	ld [hl], $2
	ld a, [wChannel2NR1]
	ld [rNR21], a
	ld a, [wChannel2Frequency]
	ld [rNR23], a
	ld a, [wChannel2Frequency + 1]
	or d
	ld [rNR24], a
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

Func_707a5_\1: ; 707a5 (1c:47a5)
	ld a, [wSFXChannelFlags]
	bit 2, a
	jr nz, .asm_707e9
	ld d, $0
	ld a, [wc10b]
	or a
	jr z, .skip_wave_copy
	xor a
	ld [rNR30], a
	call Func_707f3_\1
	ld d, $80
.skip_wave_copy
	ld a, [wChannel3UnknownC137]
	cp $0
	jr z, .asm_707ea
	ld hl, wChannel3NoteState
	ld a, [hl]
	cp $80
	jr z, .asm_707d5
	ld a, [wNR32]
	ld [rNR32], a
	xor a
	ld [rNR30], a
	ld d, $80
.asm_707d5
	ld [hl], $2
	xor a
	ld [rNR31], a
	ld a, [wChannel3Frequency]
	ld [rNR33], a
	ld a, $80
	ld [rNR30], a
	ld a, [wChannel3Frequency + 1]
	or d
	ld [rNR34], a
.asm_707e9
	ret

.asm_707ea
	ld hl, wChannel1NoteState
	ld [hl], $0
	xor a
	ld [rNR30], a
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

Func_70813_\1: ; 70813 (1c:4813)
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr nz, .no_ch4_sfx
	ld a, [wChannel4UnknownC137]
	cp $0
	jr z, asm_70833_\1
	ld de, rNR41
	ld hl, wc12b
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

asm_70833_\1
	xor a
	ld [wc16f], a
	ld hl, rNR42
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Func_70842_\1: ; 70842 (1c:4842)
	ld a, [wSFXChannelFlags]
	bit 3, a
	jr z, .asm_7084f
	xor a
	ld [wc16f], a
	jr .asm_70862

.asm_7084f
	ld hl, wc16d
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [de]
	cp $ff
	jr nz, .asm_7085c
	jr asm_70833_\1

.asm_7085c
	ld [rNR43], a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
.asm_70862
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
	ld [rNR50], a
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
	ld a, [wc170]
	xor $ff
	and $f
	ld e, a
	swap e
	or e
	and d
	ld [rNR51], a
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
	ld [rNR13], a
	ld a, d
	ld [rNR14], a
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
	ld [rNR23], a
	ld a, d
	ld [rNR24], a
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
	ld [rNR33], a
	ld a, d
	ld [rNR34], a
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

Func_70976_\1: ; 70976 (1c:4976)
	ld a, [wSFXChannelFlags]
	ld d, a
	bit 0, d
	jr nz, .check_ch2
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.check_ch2
	bit 1, d
	jr nz, .check_ch3
	swap a
	ld [rNR22], a
	swap a
	ld [rNR24], a
.check_ch3
	bit 3, d
	jr nz, .check_ch4
	swap a
	ld [rNR42], a
	swap a
	ld [rNR44], a
.check_ch4
	bit 2, d
	jr nz, .end
	ld a, $0
	ld [rNR32], a
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

Func_709ba_\1: ; 709ba (1c:49ba)
	call Func_70976_\1
	call BackUpMusicData_\1
	call Func_70156_\1
	ret

Func_709c4_\1: ; 709c4 (1c:49c4)
	call Func_70976_\1
	call Func_70156_\1
	call RestoreMusicData_\1
	ret

BackUpMusicData_\1: ; 709ce (1c:49ce)
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
	ld a, [wc12b]
	ld [wBackupc12b], a
	ld a, [wc12b + 1]
	ld [wBackupc12b + 1], a
	ld hl, wChannelOctaves
	ld de, wBackupChannelOctaves
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC133s
	ld de, wBackupChannelUnknownC133s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC137s
	ld de, wBackupChannelUnknownC137s
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
	ld hl, wChannelUnknownC147s
	ld de, wBackupChannelUnknownC147s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC14Bs
	ld de, wBackupChannelUnknownC14Bs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wChannelUnknownC14Fs
	ld de, wBackupChannelUnknownC14Fs
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
	ld hl, wc16d
	ld de, wBackupc16d
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

RestoreMusicData_\1: ; 70af3 (1c:4af3)
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
	ld [wc12b], a
	ld a, [wBackupc12b + 1]
	ld [wc12b + 1], a
	ld hl, wBackupChannelOctaves
	ld de, wChannelOctaves
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC133s
	ld de, wChannelUnknownC133s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC137s
	ld de, wChannelUnknownC137s
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
	ld hl, wBackupChannelUnknownC147s
	ld de, wChannelUnknownC147s
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC14Bs
	ld de, wChannelUnknownC14Bs
	ld a, $4
	call AudioEngine_CopyBytes_\1
	ld hl, wBackupChannelUnknownC14Fs
	ld de, wChannelUnknownC14Fs
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
	ld hl, wBackupc16d
	ld de, wc16d
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


Data_70c12_\1: ; 70c12
	dw wChannel1Stack

Data_70c14_\1: ; 70c14
	dw wChannel2Stack

Data_70c16_\1: ; 70c16
	dw wChannel3Stack

Data_70c18_\1: ; 70c18
	dw wChannel4Stack

Data_70c1a_\1: ; 70c1a
	db   0
	db  24
	db  48
	db  72
	db  96
	db 120
	db 144
	db 168

Data_70c22_\1: ; 70c22
	dw $002c
	dw $009c
	dw $0106
	dw $016b
	dw $01c9
	dw $0222
	dw $0278
	dw $02c6
	dw $0312
	dw $0358
	dw $039b
	dw $03da
	dw $0416
	dw $044e
	dw $0483
	dw $04b5
	dw $04e5
	dw $0511
	dw $053c
	dw $0563
	dw $0589
	dw $05ac
	dw $05cd
	dw $05ed
	dw $060b
	dw $0628
	dw $0642
	dw $065b
	dw $0672
	dw $0689
	dw $069e
	dw $06b2
	dw $06c4
	dw $06d6
	dw $06e7
	dw $06f6
	dw $0705
	dw $0714
	dw $0721
	dw $072d
	dw $0739
	dw $0744
	dw $074f
	dw $0759
	dw $0762
	dw $076b
	dw $0773
	dw $077b
	dw $0783
	dw $078a
	dw $0790
	dw $0797
	dw $079d
	dw $07a2
	dw $07a7
	dw $07ac
	dw $07b1
	dw $07b6
	dw $07ba
	dw $07be
	dw $07c1
	dw $07c5
	dw $07c8
	dw $07cb
	dw $07ce
	dw $07d1
	dw $07d4
	dw $07d6
	dw $07d9
	dw $07db
	dw $07dd
	dw $07df
	dw $07e1
	dw $07e3
	dw $07e4
	dw $07e5
	dw $07e7
	dw $07e8
	dw $07ea
	dw $07eb
	dw $07ec
	dw $07ed
	dw $07ee
	dw $07ef
	dw $07f0

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
	dr $70cf4, $70d04

Data_70d04_\1: ; 70d04
	dr $70d04, $70d14

Data_70d14_\1: ; 70d14
	dr $70d14, $70d24

Data_70d24_\1: ; 70d24
	dr $70d24, $70d34

Data_70d34_\1: ; 70d34
	dr $70d34, $70d44

Data_70d44_\1: ; 70d44
	dr $70d44, $70d54

Data_70d54_\1: ; 70d54
	dr $70d54, $70d64

Data_70d64_\1: ; 70d64
	dr $70d64, $70d74

Data_70d74_\1: ; 70d74
	dr $70d74, $70d84

Data_70d84_\1: ; 70d84
	dr $70d84, $70d94

Data_70d94_\1: ; 70d94
	dr $70d94, $70da4

Data_70da4_\1: ; 70da4
	dr $70da4, $70db4

Data_70db4_\1: ; 70db4
	dr $70db4, $70dc4

Data_70dc4_\1: ; 70dc4
	dr $70dc4, $70dd4

Data_70dd4_\1: ; 70dd4
	dr $70dd4, $70de4

Data_70de4_\1: ; 70de4
	dw Data_70e52_\1
	dw Data_70e59_\1
	dw Data_70e60_\1
	dw Data_70e69_\1
	dw Data_70e72_\1
	dw Data_70e7b_\1
	dw Data_70e85_\1
	dw Data_70e8f_\1
	dw Data_70e97_\1
	dw Data_70e9f_\1
	dw Data_70ec1_\1
	dw Data_70ec7_\1
	dw Data_70ee4_\1
	dw Data_70eeb_\1
	dw Data_70ef2_\1
	dw Data_70efc_\1
	dw Data_70f06_\1
	dw Data_70f10_\1
	dw Data_70f1a_\1
	dw Data_70f21_\1
	dw Data_70f28_\1
	dw Data_70f2f_\1
	dw Data_70f49_\1
	dw Data_70f54_\1
	dw Data_70f74_\1
	dw Data_70f8c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1
	dw Data_70e4c_\1

Data_70e4c_\1: ; 70e4c
	dr $70e4c, $70e52

Data_70e52_\1: ; 70e52
	dr $70e52, $70e59

Data_70e59_\1: ; 70e59
	dr $70e59, $70e60

Data_70e60_\1: ; 70e60
	dr $70e60, $70e69

Data_70e69_\1: ; 70e69
	dr $70e69, $70e72

Data_70e72_\1: ; 70e72
	dr $70e72, $70e7b

Data_70e7b_\1: ; 70e7b
	dr $70e7b, $70e85

Data_70e85_\1: ; 70e85
	dr $70e85, $70e8f

Data_70e8f_\1: ; 70e8f
	dr $70e8f, $70e97

Data_70e97_\1: ; 70e97
	dr $70e97, $70e9f

Data_70e9f_\1: ; 70e9f
	dr $70e9f, $70ec1

Data_70ec1_\1: ; 70ec1
	dr $70ec1, $70ec7

Data_70ec7_\1: ; 70ec7
	dr $70ec7, $70ee4

Data_70ee4_\1: ; 70ee4
	dr $70ee4, $70eeb

Data_70eeb_\1: ; 70eeb
	dr $70eeb, $70ef2

Data_70ef2_\1: ; 70ef2
	dr $70ef2, $70efc

Data_70efc_\1: ; 70efc
	dr $70efc, $70f06

Data_70f06_\1: ; 70f06
	dr $70f06, $70f10

Data_70f10_\1: ; 70f10
	dr $70f10, $70f1a

Data_70f1a_\1: ; 70f1a
	dr $70f1a, $70f21

Data_70f21_\1: ; 70f21
	dr $70f21, $70f28

Data_70f28_\1: ; 70f28
	dr $70f28, $70f2f

Data_70f2f_\1: ; 70f2f
	dr $70f2f, $70f49

Data_70f49_\1: ; 70f49
	dr $70f49, $70f54

Data_70f54_\1: ; 70f54
	dr $70f54, $70f74

Data_70f74_\1: ; 70f74
	dr $70f74, $70f8c

Data_70f8c_\1: ; 70f8c
	dr $70f8c, $70fa4

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
	dr $70fce, $70fd1

Data_70fd1_\1: ; 70fd1
	dr $70fd1, $70fe3

Data_70fe3_\1: ; 70fe3
	dr $70fe3, $70ffd

Data_70ffd_\1: ; 70ffd
	dr $70ffd, $71055

Data_71055_\1: ; 71055
	dr $71055, $71070

Data_71070_\1: ; 71070
	dr $71070, $71079

Data_71079_\1: ; 71079
	dr $71079, $71090

Data_71090_\1: ; 71090
	dr $71090, $710ae

Data_710ae_\1: ; 710ae
	dr $710ae, $710be

Data_710be_\1: ; 710be
	dr $710be, $710d5

Data_710d5_\1: ; 710d5
	dr $710d5, $710f6

Data_710f6_\1: ; 710f6
	dr $710f6, $71106

Data_71106_\1: ; 71106
	dr $71106, $71112

Data_71112_\1: ; 71112
	dr $71112, $71166

Data_71166_\1: ; 71166
	dr $71166, $71181

Data_71181_\1: ; 71181
	dr $71181, $711d5

Data_711d5_\1: ; 711d5
	dr $711d5, $711ec

Data_711ec_\1: ; 711ec
	dr $711ec, $711f6

Data_711f6_\1: ; 711f6
	dr $711f6, $7120e

Data_7120e_\1: ; 7120e
	dr $7120e, $71220

Data_71220_\1: ; 71220
	dr $71220, $7122e

Data_7122e_\1: ; 7122e
	db $0
	REPT 108
	db $0a
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

Func_76803: ; 76803
	jp Func_76859

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
	call Func_76a20
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

Func_76859: ; 76859 (1d:6859)
	ld a, [wSFXChannelFlags]
	or a
	jr nz, .no_sfx
	call Func_76a13
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
	call Func_7696e
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
	dw Func_768ce
	dw Func_768f9
	dw Func_76912
	dw SFXCommand_StartLoop
	dw SFXCommand_EndLoop
	dw Func_76951
	dw Func_7695d
	dw Func_769a9
	dw Func_769d4
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_769f0

Func_768cb: ; Data_7768cb
	jp SFXCommandProcessor

Func_768ce: ; 768ce (1d:68ce)
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
Func_768f0: ; 768f0 (1d:68f0)
	ld hl, wChannelSFXPointers
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_768f9: ; 768f9 (1d:68f9)
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

Func_76912: ; 76912 (1d:6912)
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
	jr z, .asm_7694d
	ld [hl], a
	ld hl, wChannelLoopReturnPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp SFXCommandProcessor

.asm_7694d
	pop hl
	jp SFXCommandProcessor

Func_76951: ; 76951 (1d:6951)
	ld hl, wChannelUnknownC1AFs
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	jp SFXCommandProcessor

Func_7695d: ; 7695d (1d:695d)
	call Func_7696e
	ld hl, wChannelUnknownC1B3s
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	ld e, l
	ld d, h
	jp Func_768f0

Func_7696e: ; 7696e (1d:696e)
	ld hl, wChannelUnknownC1AFs
	add hl, bc
	ld a, [hl]
	or a
	jr z, .asm_769a8
	ld hl, wChannelUnknownC1B7s
	add hl, bc
	add hl, bc
	bit 7, a
	jr z, .asm_7698b
	xor $ff
	inc a
	ld d, a
	ld a, [hl]
	sub d
	ld [hli], a
	ld e, a
	ld a, [hl]
	sbc b
	jr .asm_76992

.asm_7698b
	ld d, a
	ld a, [hl]
	add d
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc b
.asm_76992
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
.asm_769a8
	ret

Func_769a9: ; 769a9 (1d:69a9)
	add a
	ld d, $0
	ld e, a
	ld hl, Pointers_76c72
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $0
	ld [rNR30], a
	ld b, d
	ld de, rWave_0
.asm_769bc
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $10
	jr nz, .asm_769bc
	ld a, $1
	ld [wc10b], a
	ld a, $80
	ld [rNR30], a
	ld b, $0
	pop hl
	jp SFXCommandProcessor

Func_769d4: ; 769d4 (1d:69d4)
	pop hl
	ld a, [hli]
	push hl
	push bc
	inc c
	ld e, $ee
.load
	dec c
	jr z, .set
	rlca
	rlc e
	jr .load

.set
	ld d, a
	ld hl, wc105
	ld a, [hl]
	and e
	or d
	ld [hl], a
	pop bc
	pop hl
	jp SFXCommandProcessor

Func_769f0: ; 769f0 (1d:69f0)
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

Func_76a13: ; 76a13 (1d:6a13)
	xor a
	ld [wSFXActive2], a
	ld [wSFXActive], a
	ld a, $80
	ld [wSFXIndex], a
	ret

Func_76a20: ; 76a20 (1d:6a20)
	ld a, $8
	ld a, [rNR12]
	ld a, [rNR22]
	ld a, [rNR32]
	ld a, [rNR42]
	ld a, $80
	ld a, [rNR14]
	ld a, [rNR24]
	ld a, [rNR44]
	xor a
	ld [wSFXChannelFlags], a
	ret
