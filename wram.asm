INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $16 ; c006
	char wRTCTicker ; c01c
	; Cycles from $0 to $5 in increments of $1,
	; then from $5 to $11 in increments of $2,
	; then back to $0.
	; One increment per frame as described.
	array wRTCBuffer, 3, 1, 1 ; c10d

SECTION "Audio RAM Backup", WRAM0 [$c020]
	char wBackupSongIndex ; c020
	char wBackupAudioROMBank ; c021
	char wBackupGlobalDuty ; c022

wBackupChannelNR1s::
	char wBackupChannel1NR1 ; c023
	char wBackupChannel2NR1 ; c024
	char wBackupChannel3NR1 ; c025
	char wBackupChannel4NR1 ; c026

	char wBackupc10a ; c027
	char wBackupc10b ; c028

wBackupChannelActiveFlags::
	char wBackupChannel1ActiveFlag ; c029
	char wBackupChannel2ActiveFlag ; c02a
	char wBackupChannel3ActiveFlag ; c02b
	char wBackupChannel4ActiveFlag ; c02c

wBackupChannelNoteStates::
	char wBackupChannel1NoteState ; c02d
	char wBackupChannel2NoteState ; c02e
	char wBackupChannel3NoteState ; c02f
	char wBackupChannel4NoteState ; c030

wBackupChannelPointers::
	short wBackupChannel1Pointer ; c031
	short wBackupChannel2Pointer ; c033
	short wBackupChannel3Pointer ; c035
	short wBackupChannel4Pointer ; c037

wBackupChannelStartPointers::
	short wBackupChannel1StartPointer ; c039
	short wBackupChannel2StartPointer ; c03b
	short wBackupChannel3StartPointer ; c03d
	short wBackupChannel4StartPointer ; c03f

	short wBackupc12b ; c041

wBackupChannelOctaves::
	char wBackupChannel1Octave ; c043
	char wBackupChannel2Octave ; c044
	char wBackupChannel3Octave ; c045
	char wBackupChannel4Octave ; c046

wBackupChannelUnknownC133s::
	char wBackupChannel1UnknownC133 ; c047
	char wBackupChannel2UnknownC133 ; c048
	char wBackupChannel3UnknownC133 ; c049
	char wBackupChannel4UnknownC133 ; c04a

wBackupChannelNotesPlaying::
	char wBackupChannel1NotePlaying ; c04b
	char wBackupChannel2NotePlaying ; c04c
	char wBackupChannel3NotePlaying ; c04d
	char wBackupChannel4NotePlaying ; c04e

wBackupChannelNoteDurations::
	char wBackupChannel1NoteDuration ; c04f
	char wBackupChannel2NoteDuration ; c050
	char wBackupChannel3NoteDuration ; c051
	char wBackupChannel4NoteDuration ; c052

wBackupChannelUnknownC13Fs::
	char wBackupChannel1UnknownC13F
	char wBackupChannel2UnknownC13F
	char wBackupChannel3UnknownC13F
	char wBackupChannel4UnknownC13F

wBackupChannelUnknownC143s::
	char wBackupChannel1UnknownC143
	char wBackupChannel2UnknownC143
	char wBackupChannel3UnknownC143
	char wBackupChannel4UnknownC143

wBackupChannelNR2s::
	char wBackupChannel1NR2
	char wBackupChannel2NR2
	char wBackupChannel3NR2
	char wBackupChannel4NR2

wBackupChannelKeySignatures::
	char wBackupChannel1KeySignature
	char wBackupChannel2KeySignature
	char wBackupChannel3KeySignature
	char wBackupChannel4KeySignature

wBackupChannelTemposs::
	char wBackupChannel1Tempos
	char wBackupChannel2Tempos
	char wBackupChannel3Tempos
	char wBackupChannel4Tempos

wBackupChannelUnknownC157s::
	char wBackupChannel1UnknownC157
	char wBackupChannel2UnknownC157
	char wBackupChannel3UnknownC157
	char wBackupChannel4UnknownC157

wBackupChannelUnknownC15Fs::
	char wBackupChannel1UnknownC15F
	char wBackupChannel2UnknownC15F
	char wBackupChannel3UnknownC15F
	char wBackupChannel4UnknownC15F

	char wBackupNR12
	char wBackupNR22
	char wBackupNR32

wBackupChannelFrequencyOffsets::
	char wBackupChannel1FrequencyOffset
	char wBackupChannel2FrequencyOffset
	char wBackupChannel3FrequencyOffset

	short wBackupNoiseSamplePointer
	char wBackupc16f

wBackupChannelStackPointers::
	short wBackupChannel1StackPointer
	short wBackupChannel2StackPointer
	short wBackupChannel3StackPointer
	short wBackupChannel4StackPointer

	array wBackupChannel1Stack, 6, 1, 2
	array wBackupChannel2Stack, 6, 1, 2
	array wBackupChannel3Stack, 6, 1, 2
	array wBackupChannel4Stack, 6, 1, 2

wBackupChannelUnknownC1ABs::
	char wBackupChannel1UnknownC1AB
	char wBackupChannel2UnknownC1AB
	char wBackupChannel3UnknownC1AB
	char wBackupChannel4UnknownC1AB

wBackupChannelUnknownC1AFs::
	char wBackupChannel1UnknownC1AF
	char wBackupChannel2UnknownC1AF
	char wBackupChannel3UnknownC1AF
	char wBackupChannel4UnknownC1AF

wBackupChannelUnknownC1B3s::
	char wBackupChannel1UnknownC1B3
	char wBackupChannel2UnknownC1B3
	char wBackupChannel3UnknownC1B3
	char wBackupChannel4UnknownC1B3

wBackupChannelUnknownC1B7s::
	short wBackupChannel1UnknownC1B7
	short wBackupChannel2UnknownC1B7
	short wBackupChannel3UnknownC1B7
	short wBackupChannel4UnknownC1B7

wBackupChannelLoopCounters::
	char wBackupChannel1LoopCounter
	char wBackupChannel2LoopCounter
	char wBackupChannel3LoopCounter
	char wBackupChannel4LoopCounter

wBackupChannelLoopReturnPointers::
	short wBackupChannel1LoopReturnPointer
	short wBackupChannel2LoopReturnPointer
	short wBackupChannel3LoopReturnPointer
	short wBackupChannel4LoopReturnPointer

wBackupChannelSFXPointers::
	short wBackupChannel1SFXPointer
	short wBackupChannel2SFXPointer
	short wBackupChannel3SFXPointer
	short wBackupChannel4SFXPointer

	char wBackupSFXActive2
	char wBackupSFXChannelFlags2

SECTION "High WRAM", WRAM0 [$c0f8]
	char wc0f8 ; c0f8
	char wc0f9 ; c0f9

SECTION "Audio RAM", WRAM0 [$c100]
	char wSongIndex ; c100
	char wAudioROMBank ; c101
	char wSFXIndex ; c102
	char wSFXActive ; c103
	char wGlobalDuty ; c104
	char wSFXGlobalDuty ; c105

wChannelNR1s::
	char wChannel1NR1 ; c106
	char wChannel2NR1 ; c107
	char wChannel3NR1 ; c108
	char wChannel4NR1 ; c109

	char wc10a ; c10a
	char wc10b ; c10b
	char wSFXChannelFlags ; c10c

wChannelActiveFlags::
	char wChannel1ActiveFlag ; c10d
	char wChannel2ActiveFlag ; c10e
	char wChannel3ActiveFlag ; c10f
	char wChannel4ActiveFlag ; c110

wChannelNoteStates::
	char wChannel1NoteState ; c111
	char wChannel2NoteState ; c112
	char wChannel3NoteState ; c113
	char wChannel4NoteState ; c114

wChannelPointers::
	short wChannel1Pointer ; c115
	short wChannel2Pointer ; c117
	short wChannel3Pointer ; c119
	short wChannel4Pointer ; c11b

wChannelStartPointers::
	short wChannel1StartPointer ; c11d
	short wChannel2StartPointer ; c11f
	short wChannel3StartPointer ; c121
	short wChannel4StartPointer ; c123

wChannelFrequencies::
	short wChannel1Frequency ; c125
	short wChannel2Frequency ; c127
	short wChannel3Frequency ; c129

wNoiseSampleHeader:: ds $4 ; c12b

wChannelOctaves::
	char wChannel1Octave ; c12f
	char wChannel2Octave ; c130
	char wChannel3Octave ; c131
	char wChannel4Octave ; c132

wChannelUnknownC133s::
	char wChannel1UnknownC133 ; c133
	char wChannel2UnknownC133 ; c134
	char wChannel3UnknownC133 ; c135
	char wChannel4UnknownC133 ; c136

wChannelNotesPlaying::
	char wChannel1NotePlaying ; c137
	char wChannel2NotePlaying ; c138
	char wChannel3NotePlaying ; c139
	char wChannel4NotePlaying ; c13a

wChannelNoteDurations::
	char wChannel1NoteDuration ; c13b
	char wChannel2NoteDuration ; c13c
	char wChannel3NoteDuration ; c13d
	char wChannel4NoteDuration ; c13e

wChannelUnknownC13Fs::
	char wChannel1UnknownC13F ; c13f
	char wChannel2UnknownC13F ; c140
	char wChannel3UnknownC13F ; c141
	char wChannel4UnknownC13F ; c142

wChannelUnknownC143s::
	char wChannel1UnknownC143 ; c143
	char wChannel2UnknownC143 ; c144
	char wChannel3UnknownC143 ; c145
	char wChannel4UnknownC143 ; c146

wChannelNR2s::
	char wChannel1NR2 ; c147
	char wChannel2NR2 ; c148
	char wChannel3NR2 ; c149
	char wChannel4NR2 ; c14a

wChannelKeySignatures::
	char wChannel1KeySignature ; c14b
	char wChannel2KeySignature ; c14c
	char wChannel3KeySignature ; c14d
	char wChannel4KeySignature ; c14e

wChannelTemposs::
	char wChannel1Tempos ; c14f
	char wChannel2Tempos ; c150
	char wChannel3Tempos ; c151
	char wChannel4Tempos ; c152

wChannelUnknownC153s::
	char wChannel1UnknownC153 ; c153
	char wChannel2UnknownC153 ; c154
	char wChannel3UnknownC153 ; c155
	char wChannel4UnknownC153 ; c156

wChannelUnknownC157s::
	char wChannel1UnknownC157 ; c157
	char wChannel2UnknownC157 ; c158
	char wChannel3UnknownC157 ; c159
	char wChannel4UnknownC157 ; c15a

wChannelUnknownC15Bs::
	char wChannel1UnknownC15B ; c15b
	char wChannel2UnknownC15B ; c15c
	char wChannel3UnknownC15B ; c15d
	char wChannel4UnknownC15B ; c15e

wChannelUnknownC15Fs::
	char wChannel1UnknownC15F ; c15f
	char wChannel2UnknownC15F ; c160
	char wChannel3UnknownC15F ; c161
	char wChannel4UnknownC15F ; c162

wChannelUnknownC163s::
	char wChannel1UnknownC163 ; c163
	char wChannel2UnknownC163 ; c164
	char wChannel3UnknownC163 ; c165
	char wChannel4UnknownC163 ; c166

	char wNR12 ; c167
	char wNR22 ; c168
	char wNR32 ; c169

wChannelFrequencyOffsets::
	char wChannel1FrequencyOffset ; c16a
	char wChannel2FrequencyOffset ; c16b
	char wChannel3FrequencyOffset ; c16c

	short wNoiseSamplePointer ; c16d
	char wc16f ; c16f
	char wSoundOutputFlags ; c170
	char wVolume ; c171
	char wMusicPaused ; c172

wChannelStackPointers::
	short wChannel1StackPointer ; c173
	short wChannel2StackPointer ; c175
	short wChannel3StackPointer ; c177
	short wChannel4StackPointer ; c179

	array wChannel1Stack, 6, 1, 2 ; c17b
	array wChannel2Stack, 6, 1, 2 ; c187
	array wChannel3Stack, 6, 1, 2 ; c193
	array wChannel4Stack, 6, 1, 2 ; c19f

wChannelUnknownC1ABs::
	char wChannel1UnknownC1AB ; c1ab
	char wChannel2UnknownC1AB ; c1ac
	char wChannel3UnknownC1AB ; c1ad
	char wChannel4UnknownC1AB ; c1ae

wChannelUnknownC1AFs::
	char wChannel1UnknownC1AF ; c1af
	char wChannel2UnknownC1AF ; c1b0
	char wChannel3UnknownC1AF ; c1b1
	char wChannel4UnknownC1AF ; c1b2

wChannelUnknownC1B3s::
	char wChannel1UnknownC1B3 ; c1b3
	char wChannel2UnknownC1B3 ; c1b4
	char wChannel3UnknownC1B3 ; c1b5
	char wChannel4UnknownC1B3 ; c1b6

wChannelUnknownC1B7s::
	short wChannel1UnknownC1B7 ; c1b7
	short wChannel2UnknownC1B7 ; c1b9
	short wChannel3UnknownC1B7 ; c1bb
	short wChannel4UnknownC1B7 ; c1bd

wChannelLoopCounters::
	char wChannel1LoopCounter ; c1bf
	char wChannel2LoopCounter ; c1c0
	char wChannel3LoopCounter ; c1c1
	char wChannel4LoopCounter ; c1c2

wChannelLoopReturnPointers::
	short wChannel1LoopReturnPointer ; c1c3
	short wChannel2LoopReturnPointer ; c1c5
	short wChannel3LoopReturnPointer ; c1c7
	short wChannel4LoopReturnPointer ; c1c9

wChannelSFXPointers::
	short wChannel1SFXPointer ; c1cb
	short wChannel2SFXPointer ; c1cd
	short wChannel3SFXPointer ; c1cf
	short wChannel4SFXPointer ; c1d1

	char wSFXActive2 ; c1d3
	char wSFXChannelFlags2 ; c1d4

SECTION "LCD Interrupt", WRAM0 [$c200]
wLCD:: ds $3 ; c200

; bit 7: call wVBlankCallback (far call with SRAM open)
; bit 6: push BGMap metatiles or CGB palettes
; bit 5: push DMG pals
; bit 4: push SCX and SCY
; bit 3: read joypad
; bit 2: push LCDC
; bit 1: push OAM
; bit 0: handle video transfer request
	char wNextVBlankFlags ; c203
	char wLastVBlankFlags ; c204
	char wJoyPressed ; c205
	char wJoyLast ; c206
	char wJoyHeld ; c207
	char wc208 ; c208
	char wTextBlinkerFrameCounter ; c209
	short wTimerCounter ; c20a
	char wSCX ; c20c
	char wSCX2 ; c20d
	char wSCY ; c20e
	char wSCY2 ; c20f
	char wBGMapHi ; c210
	char wLCDC ; c211
	char wFarCallSavedA ; c212
	char wc213 ; c213
	ds $4
	short wFarCallSavedHL ; c218
	char wFarCallDestBank ; c21a
	short wFarCallDestAddr ; c21b
	char wBGP ; c21d
	char wOBP0 ; c21e
	char wOBP1 ; c21f
	ds $4
	char wVBlankCallbackROMBank ; c224
	char wVBlankCallbackRAMBank ; c225
	short wVBlankCallbackAddress ; c226
	short wDecompressEndAddress ; c228
	short wDecompressLiteralCopySize ; c22a
	char wDecompresLiteralCopyOffsetHi ; c22c
	ds $1
	short wBGMapTransferRowStart ; c22e
	char wBGMapTransferColumnStart ; c230
	char wCurBGMapHi ; c231
	char wCurScreenX ; c232
	char wCurScreenY ; c233
	ds $1
	char wPoncotPicAlignment ; c235
	char wc236 ; c236
	short wRNGState ; c237

wVideoTransferQueue:: ; c239
	video_transfer_queue wVideoTransferQueueEntry1 ; c239
	video_transfer_queue wVideoTransferQueueEntry2 ; c23e
	video_transfer_queue wVideoTransferQueueEntry3 ; c243
	video_transfer_queue wVideoTransferQueueEntry4 ; c248

	char wc24d ; c24d
	char wBlinkerX ; c24e
	char wBlinkerY ; c24f
	char wBlinkerTile ; c250
	char wBlinkerOffTile ; c251
	char wStringDestX ; c252
	char wStringDestY ; c253
	ds $1
	char wKana ; c255
; 00: katakana
; ff: hiragana

	ds $d

	char wc263 ; c263
	char wNumSpritesLoaded ; c264
	short wc265 ; c265
	short wc267 ; c267
	short wc269 ; c269
	array wc26b, 1, 16, 2 ; c26b
	array wc28b, 1, 16, 1 ; c28b
	array wc29b, 1, 16, 1 ; c29b
	array wc2ab, 1, 16, 1 ; c2ab
	array wc2bb, 1, 16, 1 ; c2bb
	char wc2cb ; c2cb
	char wc2cc ; c2cc
	char wc2cd ; c2cd
	ds $8

	char wMapWidth ; c2d6
	char wMapHeight ; c2d7
	char wMapX ; c2d8
	char wMapY ; c2d9
	ds $2

	short wMemoryAllocationNumBlocks ; c2dc
	short wMemoryAllocationPointer ; c2de
	char wMemoryAllocationMode ; c2e0
	char wc2e1 ; c2e1
	char wc2e2 ; c2e2
	char wc2e3 ; c2e3
	char wc2e4 ; c2e4
	char wc2e5 ; c2e5
	short wCurRobotPointer ; c2e6
	char wc2e8 ; c2e8
	char wc2e9 ; c2e9

	char wVideoTransferRequestFlags ; c2ea
	char wSongCurrentlyPlaying ; c2eb
	char wSFXCurrentlyPlaying ; c2ec
	char wVideoTransferRequestBank ; c2ed
	char wTimeSetMillennia ; c2ee
	char wTimeSetCenturies ; c2ef
	char wTimeSetDecades ; c2f0
	char wTimeSetYears ; c2f1
	short wc2f2 ; c2f2
	char wc2f4 ; c2f4
	char wc2f5 ; c2f5
	char wc2f6 ; c2f6
	char wc2f7 ; c2f7
	char wCurShop ; c2f8
	char wc2f9 ; c2f9
	char wInBattle ; c2fa
	char wSystemType ; c2fb
	char wTimeSetMonthsTensDigit ; c2fc
	char wTimeSetMonthsOnesDigit ; c2fd
	char wTimeSetDaysTensDigit ; c2fe
	char wTimeSetDaysOnesDigit ; c2ff
	char wc300 ; c300
	char wTimeSetHoursTensDigit ; c301
	char wTimeSetHoursOnesDigit ; c302
	char wTimeSetMinutesTensDigit ; c303
	char wTimeSetMinutesOnesDigit ; c304
	char wc305 ; c305
	char wc306 ; c306
	char wc307 ; c307
	char wc308 ; c308

	array wPlayerName, 5, 1, 1 ; c309
	short wc30e ; c30e
	char wc310 ; c310
	char wCurItem ; c311
	short wc312 ; c312
	short wc314 ; c314
	char wc316 ; c316
	char wc317 ; c317
	char wc318 ; c318
	char wc319 ; c319
	char wc31a ; c31a
	char wc31b ; c31b
	char wc31c ; c31c
	char wc31d ; c31d
	char wc31e ; c31e
	char wc31f ; c31f
	short wc320 ; c320
	short wc322 ; c322
	short wc324 ; c324
	char wc326 ; c326
	array wc327, 32, 1, 1 ; c327

	array wc347, 3, 20, 1 ; c347
	array wc383, 4, 1, 1 ; c383
	char wc387 ; c387
	char wc388 ; c388
	char wc389 ; c389
	char wc38a ; c38a
	char wc38b ; c38b
	char wc38c ; c38c
	char wc38d ; c38d
	short wc38e ; c38e
	char wc390 ; c390
	long wGameTimer ; c391
	char wc395 ; c395
	array wc396, 4, 1, 1 ; c396
	char wEnableAttrMapTransfer ; c39a
	char wc39b ; c39b
	char wc39c ; c39c
	char wc39d ; c39d
	char wc39e ; c39e
	char wc39f ; c39f
	array wc3a0, 16, 1, 1 ; c3a0
	short wc3b0 ; c3b0
	short wSTDLibRNGState ; c3b2
	char wSTDLibRNGCount ; c3b4
	
	char wc3b5 ; c3b5
	char wc3b6 ; c3b6
	short wc3b7 ; c3b7
	char wc3b9 ; c3b9
	char wc3ba ; c3ba
	char wc3bb ; c3bb
	char wc3bc ; c3bc
	char wc3bd ; c3bd
	array wc3be, 5, 1, 2 ; c3be
	short wc3c8 ; c3c8

	short wc3ca ; c3ca
	char wc3cc ; c3cc
	char wc3cd ; c3cd
	char wc3ce ; c3ce
	char wc3cf ; c3cf
	char wc3d0 ; c3d0
	char wc3d1 ; c3d1
	char wc3d2 ; c3d2
	char wc3d3 ; c3d3
	ds $c
	short wc3e0 ; c3e0
	short wc3e2 ; c3e2
	short wc3e4 ; c3e4
	short wc3e6 ; c3e6
	short wc3e8 ; c3e8
	short wc3ea ; c3ea
	short wc3ec ; c3ec
	short wc3ee ; c3ee

SECTION "OAM Buffer", WRAM0 [$c400]
wOAMBuffer:: ; c400
	oam_ram wOAM00
	oam_ram wOAM01
	oam_ram wOAM02
	oam_ram wOAM03
	oam_ram wOAM04
	oam_ram wOAM05
	oam_ram wOAM06
	oam_ram wOAM07
	oam_ram wOAM08
	oam_ram wOAM09
	oam_ram wOAM0a
	oam_ram wOAM0b
	oam_ram wOAM0c
	oam_ram wOAM0d
	oam_ram wOAM0e
	oam_ram wOAM0f
	oam_ram wOAM10
	oam_ram wOAM11
	oam_ram wOAM12
	oam_ram wOAM13
	oam_ram wOAM14
	oam_ram wOAM15
	oam_ram wOAM16
	oam_ram wOAM17
	oam_ram wOAM18
	oam_ram wOAM19
	oam_ram wOAM1a
	oam_ram wOAM1b
	oam_ram wOAM1c
	oam_ram wOAM1d
	oam_ram wOAM1e
	oam_ram wOAM1f
	oam_ram wOAM20
	oam_ram wOAM21
	oam_ram wOAM22
	oam_ram wOAM23
	oam_ram wOAM24
	oam_ram wOAM25
	oam_ram wOAM26
	oam_ram wOAM27
wOAMBufferEnd::

SECTION "Tile Map", WRAM0 [$c4a0]
	array wTileMap, SCREEN_WIDTH, SCREEN_HEIGHT, 1
	array wAttrMap, SCREEN_WIDTH, SCREEN_HEIGHT, 1

SECTION "Overworld RAM", WRAM0 [$c770]
wc770:: ; c770
	ds $2

	char wNumPeopleLoaded ; c772
	char wc773 ; c773
	short wObjectStructPointer ; c774
	short wc776 ; c776
	short wNPCMovementDataPointer ; c778
	short wWarpDataPointer ; c77a
	char wNumWarps ; c77c

	char wRandomEncounterTableBank ; c77d
	short wRandomEncounterTableAddr ; c77e
	char wRandomEncounterTableLength ; c780
	char wRandomEncounterRate ; c781

	char wc782 ; c782
	char wRandomEncounterCooldown ; c783
	char wc784 ; c784
	char wc785 ; c785
	short wc786 ; c786
	char wc788 ; c788

	char wc789 ; c789
	char wc78a ; c78a
	ds $1
	char wc78c ; c78c
	char wc78d ; c78d
	ds $2
	char wc790 ; c790
	char wc791 ; c791
	ds $1
	char wc793 ; c793
	ds $2
	char wc796 ; c796
	char wc797 ; c797
	char wSaveFileExists ; c798
	char wc799 ; c799
	char wc79a ; c79a
	ds $1
	char wc79c ; c79c
	char wc79d ; c79d
	char wc79e ; c79e
	char wc79f ; c79f
	char wc7a0 ; c7a0
	char wc7a1 ; c7a1
	char wc7a2 ; c7a2
	ds $1
	char wc7a4 ; c7a4
	char wc7a5 ; c7a5
	ds $b
	array wc7b1, $c, $1, $1
	char wc7bd ; c7bd
	char wMapMusic ; c7be
	ds $5
	char wc7c4 ; c7c4
	char wc7c5 ; c7c5
	ds $14

	char wc7da ; c7da
	char wBackupMapX ; c7db
	char wBackupMapY ; c7dc
	char wc7dd ; c7dd
	char wc7de ; c7de
	char wBackupMapGroup ; c7df
	char wBackupMapNumber ; c7e0
	char wPlayerState ; c7e1
	char wc7e2 ; c7e2
	bitfield wUnlockedAreaFlags, 32 ; c7e3

	char wSpawnX ; c7e7
	char wSpawnY ; c7e8
	char wSpawnPushX ; c7e9
	char wSpawnPushY ; c7ea
	char wMapGroup ; c7eb
	char wMapNumber ; c7ec

	bitfield wEventFlags, 400 ; c7ed
wEventFlagsEnd::

	char wc81f ; c81f
	char wc820 ; c820
	char wc821 ; c821

	short wLoadAttrsSourcePointer ; c822
	short wc824 ; c824
	short wc826 ; c826
	short wBlockdataPointer ; c828
	short wPlayerSpritePointer ; c82a
	short wc82c ; c82c
	short wc82e ; c82e
	short wMapCollisionPointer ; c830

	char wc832 ; c832
	char wc833 ; c833
	char wc834 ; c834
	char wc835 ; c835
	char wc836 ; c836
	char wc837 ; c837
	char wPlayerFacing ; c838
	char wLastPlayerFacing ; c839
	char wc83a ; c83a
	char wMovementDataBank ; c83b
	short wMovementDataAddr ; c83c
	char wMovementPerson ; c83e
	char wMovementCurPathEndpointX ; c83f
	char wMovementCurPathEndpointY ; c840
	char wc841 ; c841
	short wc842 ; c842
	short wc844 ; c844
	char wc846 ; c846
	char wc847 ; c847
	char wc848 ; c848
	char wc849 ; c849
	char wRemainInMap ; c84a
	char wc84b ; c84b
	char wc84c ; c84c
	char wc84d ; c84d
	char wScreenIsShaking ; c84e
	char wNextScreenShakeYDisplacement ; c84f
	char wScreenShakeFrameTimer ; c850
	char wc851 ; c851
	short wc852 ; c852
	short wc854 ; c854
	char wc856 ; c856
	char wc857 ; c857
	char wc858 ; c858
	char wc859 ; c859
	char wc85a ; c85a
	short wTilesetPointer ; c85b
	short wc85d ; c85d
	char wPlayerMapX ; c85f
	char wPlayerMapY ; c860
	char wCurWarpMinX ; c861
	char wCurWarpMinY ; c862
	char wCurWarpHDim ; c863
	char wCurWarpVDim ; c864
	short wPlayerStandingTileOffset ; c865
	char wc867 ; c867
	short wc868 ; c868
	short wc86a ; c86a
	short wc86c ; c86c
	short wc86e ; c86e
	short wc870 ; c870
	short wc872 ; c872
	short wc874 ; c874
	char wc876 ; c876
	ds $5

	char wPlayerMovementRate ; c87c
	char wLastStepSucceeded ; c87d
	ds $a

	char wc888 ; c888
	char wLoadTilesBlockCounter ; c889
	char wc88a ; c88a
	char wc88b ; c88b
	short wLoadTilesSourcePointer ; c88c
	short wc88e ; c88e
	short wLoadTilesTileCounter ; c890
	ds wc888 - @

	char wCheckFacingObjectReturnFlag ; c888
	char wCheckFacingObjectX ; c889
	char wCheckFacingObjectY ; c88a
	char wCheckFacingObjectFlag ; c88b
	char wCheckFacingObjectFacingDirection ; c88c
	char wCheckFacingObjectObjectCounter ; c88d
	short wCheckFacingObjectObjectStructPointer ; c88e
	short wCheckFacingObject_c890 ; c890
	ds wCheckFacingObjectReturnFlag - @

	char wFunc94a9_c888 ; c888
	char wFunc94a9_c889 ; c889
	short wFunc94a9_c88a ; c88a
	short wFunc94a9_c88c ; c88c
	char wFunc94a9_c88e ; c88e
	char wFunc94a9_c88f ; c88f
	char wFunc94a9_c890 ; c890
	char wFunc94a9_c891 ; c891

SECTION "CGB Palettes Buffer", WRAM0 [$c89c]
	array wCGB_BGPalsBuffer, $8, $8, $1 ; c89c
	array wCGB_OBPalsBuffer, $8, $8, $1 ; c8dc

	bitfield wVBlankTransferFlags, 8 ; c91c
; ==0: push CGB palettes
; bit 1: push wVBlankMetaTileTransferQueue1
; bit 0: push wVBlankMetaTileTransferQueue0

	short wc91d ; c91d

	short wVBlankMetaTileTransferQueue0TileSource ; c91f
	short wVBlankMetaTileTransferQueue0AttrSource ; c921
	short wVBlankMetaTileTransferQueue0Dest ; c923

	short wVBlankMetaTileTransferQueue1TileSource ; c925
	short wVBlankMetaTileTransferQueue1AttrSource ; c927
	short wVBlankMetaTileTransferQueue1Dest ; c929
	char wMapObjectCGBAttrsOverride ; c92b, only affects NPCs
	short wc92c ; c92c
	short wMinutesSinceMidnight ; c92e
	short wRTCDays ; c930
	short wc932 ; c932
	short wc934 ; c934
	array wc936, 2, 1, 1 ; c936
	array wc938, 9, 8, 1 ; c938

SECTION "Save Game Scratch", WRAM0 [$c980]
wSaveScratch::
wSaveBlock1::
	array wSaveScratchPlayerName, 5, 1, 1 ; c980
	char wSaveScratchBirthMonth ; c985
	char wSaveScratchBirthDay ; c986
	char wSaveScratchZodiacSign ; c987
	ds $1
	array wSaveScratchMoney, 4, 1, 1 ; c989
	char wc98d ; c98d
	array wc98e, 20, 1, 1 ; c98e
	char wc9a2 ; c9a2
	array wc9a3, 20, 1, 1 ; c9a3
	char wc9b7 ; c9b7
	array wSaveScratchParty, 4, 35, 1 ; c9b8
	array wSaveScratchBagItems, 20, 1, 1 ; ca44
	array wSaveScratchBagItemQuantities, 20, 1, 1 ; ca58
	char wSaveScratchca6c ; ca6c
	ds $3
	bitfield wSaveScratchDexSeenFlags, NUM_ROBOTS ; ca70
	bitfield wSaveScratchDexCaughtFlags, NUM_ROBOTS ; ca86
	char wca9c ; ca9c
	bitfield wSaveScratchEventFlags, 400 ; ca9d
	array wSaveScratchc789, 100, 1, 1 ; cacf
	array wcb33, 8, 1, 1 ; cb33
	long wcb3b ; cb3b
	array wcb3f, 5, 1, 2 ; cb3f
	array wcb49, 5, 1, 2 ; cb49
	short wcb53 ; cb53
	short wcb55 ; cb55
	char wcb57 ; cb57
	array wSaveScratchc347, 3, 20, 1 ; cb58
wSaveBlock2::
wWarehouseItemQuantities:: ds $a0  ; cb94
wSaveBlock3:: ds $dc  ; cc34
wSaveBlock4:: ds $fa  ; cd10
wSaveScratchEnd:: ; ce0a

	short wCheckSum ; ce0a
	ds $3
	char wce0f ; ce0f

SECTION "Allocatable Memory", WRAM0 [$ce10]
	alloc_block wAllocatableBlock0 ; ce10
	ds $900 - 5

SECTION "Stack", WRAM0 [$d810]
wStackBottom:: ds $7f0 ; d810
wStackTop:: ; e000
