INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $16 ; c006
wc01c:: db ; c01c

SECTION "Audio RAM Backup", WRAM0 [$c020]
wBackupSongIndex:: db ; c020
wBackupAudioROMBank:: db ; c021
wBackupGlobalDuty:: db ; c022

wBackupChannelNR1s::
wBackupChannel1NR1:: db ; c023
wBackupChannel2NR1:: db ; c024
wBackupChannel3NR1:: db ; c025
wBackupChannel4NR1:: db ; c026

wBackupc10a:: db ; c027
wBackupc10b:: db ; c028

wBackupChannelActiveFlags::
wBackupChannel1ActiveFlag:: db ; c029
wBackupChannel2ActiveFlag:: db ; c02a
wBackupChannel3ActiveFlag:: db ; c02b
wBackupChannel4ActiveFlag:: db ; c02c

wBackupChannelNoteStates::
wBackupChannel1NoteState:: db ; c02d
wBackupChannel2NoteState:: db ; c02e
wBackupChannel3NoteState:: db ; c02f
wBackupChannel4NoteState:: db ; c030

wBackupChannelPointers::
wBackupChannel1Pointer:: dw ; c031
wBackupChannel2Pointer:: dw ; c033
wBackupChannel3Pointer:: dw ; c035
wBackupChannel4Pointer:: dw ; c037

wBackupChannelStartPointers::
wBackupChannel1StartPointer:: dw ; c039
wBackupChannel2StartPointer:: dw ; c03b
wBackupChannel3StartPointer:: dw ; c03d
wBackupChannel4StartPointer:: dw ; c03f

wBackupc12b:: ds $2 ; c041

wBackupChannelOctaves::
wBackupChannel1Octave:: db ; c043
wBackupChannel2Octave:: db ; c044
wBackupChannel3Octave:: db ; c045
wBackupChannel4Octave:: db ; c046

wBackupChannelUnknownC133s::
wBackupChannel1UnknownC133:: db ; c047
wBackupChannel2UnknownC133:: db ; c048
wBackupChannel3UnknownC133:: db ; c049
wBackupChannel4UnknownC133:: db ; c04a

wBackupChannelNotesPlaying::
wBackupChannel1NotePlaying:: db ; c04b
wBackupChannel2NotePlaying:: db ; c04c
wBackupChannel3NotePlaying:: db ; c04d
wBackupChannel4NotePlaying:: db ; c04e

wBackupChannelNoteDurations::
wBackupChannel1NoteDuration:: db ; c04f
wBackupChannel2NoteDuration:: db ; c050
wBackupChannel3NoteDuration:: db ; c051
wBackupChannel4NoteDuration:: db ; c052

wBackupChannelUnknownC13Fs::
wBackupChannel1UnknownC13F:: db
wBackupChannel2UnknownC13F:: db
wBackupChannel3UnknownC13F:: db
wBackupChannel4UnknownC13F:: db

wBackupChannelUnknownC143s::
wBackupChannel1UnknownC143:: db
wBackupChannel2UnknownC143:: db
wBackupChannel3UnknownC143:: db
wBackupChannel4UnknownC143:: db

wBackupChannelNR2s::
wBackupChannel1NR2:: db
wBackupChannel2NR2:: db
wBackupChannel3NR2:: db
wBackupChannel4NR2:: db

wBackupChannelKeySignatures::
wBackupChannel1KeySignature:: db
wBackupChannel2KeySignature:: db
wBackupChannel3KeySignature:: db
wBackupChannel4KeySignature:: db

wBackupChannelTemposs::
wBackupChannel1Tempos:: db
wBackupChannel2Tempos:: db
wBackupChannel3Tempos:: db
wBackupChannel4Tempos:: db

wBackupChannelUnknownC157s::
wBackupChannel1UnknownC157:: db
wBackupChannel2UnknownC157:: db
wBackupChannel3UnknownC157:: db
wBackupChannel4UnknownC157:: db

wBackupChannelUnknownC15Fs::
wBackupChannel1UnknownC15F:: db
wBackupChannel2UnknownC15F:: db
wBackupChannel3UnknownC15F:: db
wBackupChannel4UnknownC15F:: db

wBackupNR12:: db
wBackupNR22:: db
wBackupNR32:: db

wBackupChannelFrequencyOffsets::
wBackupChannel1FrequencyOffset:: db
wBackupChannel2FrequencyOffset:: db
wBackupChannel3FrequencyOffset:: db

wBackupNoiseSamplePointer:: dw
wBackupc16f:: db

wBackupChannelStackPointers::
wBackupChannel1StackPointer:: dw
wBackupChannel2StackPointer:: dw
wBackupChannel3StackPointer:: dw
wBackupChannel4StackPointer:: dw

wBackupChannel1Stack:: ds $c
wBackupChannel2Stack:: ds $c
wBackupChannel3Stack:: ds $c
wBackupChannel4Stack:: ds $c

wBackupChannelUnknownC1ABs::
wBackupChannel1UnknownC1AB:: db
wBackupChannel2UnknownC1AB:: db
wBackupChannel3UnknownC1AB:: db
wBackupChannel4UnknownC1AB:: db

wBackupChannelUnknownC1AFs::
wBackupChannel1UnknownC1AF:: db
wBackupChannel2UnknownC1AF:: db
wBackupChannel3UnknownC1AF:: db
wBackupChannel4UnknownC1AF:: db

wBackupChannelUnknownC1B3s::
wBackupChannel1UnknownC1B3:: db
wBackupChannel2UnknownC1B3:: db
wBackupChannel3UnknownC1B3:: db
wBackupChannel4UnknownC1B3:: db

wBackupChannelUnknownC1B7s::
wBackupChannel1UnknownC1B7:: dw
wBackupChannel2UnknownC1B7:: dw
wBackupChannel3UnknownC1B7:: dw
wBackupChannel4UnknownC1B7:: dw

wBackupChannelLoopCounters::
wBackupChannel1LoopCounter:: db
wBackupChannel2LoopCounter:: db
wBackupChannel3LoopCounter:: db
wBackupChannel4LoopCounter:: db

wBackupChannelLoopReturnPointers::
wBackupChannel1LoopReturnPointer:: dw
wBackupChannel2LoopReturnPointer:: dw
wBackupChannel3LoopReturnPointer:: dw
wBackupChannel4LoopReturnPointer:: dw

wBackupChannelSFXPointers::
wBackupChannel1SFXPointer:: dw
wBackupChannel2SFXPointer:: dw
wBackupChannel3SFXPointer:: dw
wBackupChannel4SFXPointer:: dw

wBackupSFXActive2:: db
wBackupSFXChannelFlags2:: db

SECTION "Audio RAM", WRAM0 [$c100]
wSongIndex:: db ; c100
wAudioROMBank:: db ; c101
wSFXIndex:: db ; c102
wSFXActive:: db ; c103
wGlobalDuty:: db ; c104
wSFXGlobalDuty:: db ; c105

wChannelNR1s::
wChannel1NR1:: db ; c106
wChannel2NR1:: db ; c107
wChannel3NR1:: db ; c108
wChannel4NR1:: db ; c109

wc10a:: db ; c10a
wc10b:: db ; c10b
wSFXChannelFlags:: db ; c10c

wChannelActiveFlags::
wChannel1ActiveFlag:: db ; c10d
wChannel2ActiveFlag:: db ; c10e
wChannel3ActiveFlag:: db ; c10f
wChannel4ActiveFlag:: db ; c110

wChannelNoteStates::
wChannel1NoteState:: db ; c111
wChannel2NoteState:: db ; c112
wChannel3NoteState:: db ; c113
wChannel4NoteState:: db ; c114

wChannelPointers::
wChannel1Pointer:: dw ; c115
wChannel2Pointer:: dw ; c117
wChannel3Pointer:: dw ; c119
wChannel4Pointer:: dw ; c11b

wChannelStartPointers::
wChannel1StartPointer:: dw ; c11d
wChannel2StartPointer:: dw ; c11f
wChannel3StartPointer:: dw ; c121
wChannel4StartPointer:: dw ; c123

wChannelFrequencies::
wChannel1Frequency:: dw ; c125
wChannel2Frequency:: dw ; c127
wChannel3Frequency:: dw ; c129

wNoiseSampleHeader:: ds $4 ; c12b

wChannelOctaves::
wChannel1Octave:: db ; c12f
wChannel2Octave:: db ; c130
wChannel3Octave:: db ; c131
wChannel4Octave:: db ; c132

wChannelUnknownC133s::
wChannel1UnknownC133:: db ; c133
wChannel2UnknownC133:: db ; c134
wChannel3UnknownC133:: db ; c135
wChannel4UnknownC133:: db ; c136

wChannelNotesPlaying::
wChannel1NotePlaying:: db ; c137
wChannel2NotePlaying:: db ; c138
wChannel3NotePlaying:: db ; c139
wChannel4NotePlaying:: db ; c13a

wChannelNoteDurations::
wChannel1NoteDuration:: db ; c13b
wChannel2NoteDuration:: db ; c13c
wChannel3NoteDuration:: db ; c13d
wChannel4NoteDuration:: db ; c13e

wChannelUnknownC13Fs::
wChannel1UnknownC13F:: db ; c13f
wChannel2UnknownC13F:: db ; c140
wChannel3UnknownC13F:: db ; c141
wChannel4UnknownC13F:: db ; c142

wChannelUnknownC143s::
wChannel1UnknownC143:: db ; c143
wChannel2UnknownC143:: db ; c144
wChannel3UnknownC143:: db ; c145
wChannel4UnknownC143:: db ; c146

wChannelNR2s::
wChannel1NR2:: db ; c147
wChannel2NR2:: db ; c148
wChannel3NR2:: db ; c149
wChannel4NR2:: db ; c14a

wChannelKeySignatures::
wChannel1KeySignature:: db ; c14b
wChannel2KeySignature:: db ; c14c
wChannel3KeySignature:: db ; c14d
wChannel4KeySignature:: db ; c14e

wChannelTemposs::
wChannel1Tempos:: db ; c14f
wChannel2Tempos:: db ; c150
wChannel3Tempos:: db ; c151
wChannel4Tempos:: db ; c152

wChannelUnknownC153s::
wChannel1UnknownC153:: db ; c153
wChannel2UnknownC153:: db ; c154
wChannel3UnknownC153:: db ; c155
wChannel4UnknownC153:: db ; c156

wChannelUnknownC157s::
wChannel1UnknownC157:: db ; c157
wChannel2UnknownC157:: db ; c158
wChannel3UnknownC157:: db ; c159
wChannel4UnknownC157:: db ; c15a

wChannelUnknownC15Bs::
wChannel1UnknownC15B:: db ; c15b
wChannel2UnknownC15B:: db ; c15c
wChannel3UnknownC15B:: db ; c15d
wChannel4UnknownC15B:: db ; c15e

wChannelUnknownC15Fs::
wChannel1UnknownC15F:: db ; c15f
wChannel2UnknownC15F:: db ; c160
wChannel3UnknownC15F:: db ; c161
wChannel4UnknownC15F:: db ; c162

wChannelUnknownC163s::
wChannel1UnknownC163:: db ; c163
wChannel2UnknownC163:: db ; c164
wChannel3UnknownC163:: db ; c165
wChannel4UnknownC163:: db ; c166

wNR12:: db ; c167
wNR22:: db ; c168
wNR32:: db ; c169

wChannelFrequencyOffsets::
wChannel1FrequencyOffset:: db ; c16a
wChannel2FrequencyOffset:: db ; c16b
wChannel3FrequencyOffset:: db ; c16c

wNoiseSamplePointer:: dw ; c16d
wc16f:: db ; c16f
wSoundOutputFlags:: db ; c170
wVolume:: db ; c171
wMusicPaused:: db ; c172

wChannelStackPointers::
wChannel1StackPointer:: dw ; c173
wChannel2StackPointer:: dw ; c175
wChannel3StackPointer:: dw ; c177
wChannel4StackPointer:: dw ; c179

wChannel1Stack:: ds $c ; c17b
wChannel2Stack:: ds $c ; c187
wChannel3Stack:: ds $c ; c193
wChannel4Stack:: ds $c ; c19f

wChannelUnknownC1ABs::
wChannel1UnknownC1AB:: db ; c1ab
wChannel2UnknownC1AB:: db ; c1ac
wChannel3UnknownC1AB:: db ; c1ad
wChannel4UnknownC1AB:: db ; c1ae

wChannelUnknownC1AFs::
wChannel1UnknownC1AF:: db ; c1af
wChannel2UnknownC1AF:: db ; c1b0
wChannel3UnknownC1AF:: db ; c1b1
wChannel4UnknownC1AF:: db ; c1b2

wChannelUnknownC1B3s::
wChannel1UnknownC1B3:: db ; c1b3
wChannel2UnknownC1B3:: db ; c1b4
wChannel3UnknownC1B3:: db ; c1b5
wChannel4UnknownC1B3:: db ; c1b6

wChannelUnknownC1B7s::
wChannel1UnknownC1B7:: dw ; c1b7
wChannel2UnknownC1B7:: dw ; c1b9
wChannel3UnknownC1B7:: dw ; c1bb
wChannel4UnknownC1B7:: dw ; c1bd

wChannelLoopCounters::
wChannel1LoopCounter:: db ; c1bf
wChannel2LoopCounter:: db ; c1c0
wChannel3LoopCounter:: db ; c1c1
wChannel4LoopCounter:: db ; c1c2

wChannelLoopReturnPointers::
wChannel1LoopReturnPointer:: dw ; c1c3
wChannel2LoopReturnPointer:: dw ; c1c5
wChannel3LoopReturnPointer:: dw ; c1c7
wChannel4LoopReturnPointer:: dw ; c1c9

wChannelSFXPointers::
wChannel1SFXPointer:: dw ; c1cb
wChannel2SFXPointer:: dw ; c1cd
wChannel3SFXPointer:: dw ; c1cf
wChannel4SFXPointer:: dw ; c1d1

wSFXActive2:: db ; c1d3
wSFXChannelFlags2:: db ; c1d4

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
wNextVBlankFlags:: ds $1 ; c203
wLastVBlankFlags:: ds $1 ; c204
wJoyPressed:: ds $1 ; c205
wJoyLast:: ds $1 ; c206
wJoyHeld:: ds $1 ; c207
wc208:: ds $1 ; c208
wTextBlinkerFrameCounter:: ds $1 ; c209
wTimerCounter:: ds $2 ; c20a
wSCX:: ds $1 ; c20c
wSCX2:: ds $1 ; c20d
wSCY:: ds $1 ; c20e
wSCY2:: ds $2 ; c20f
wLCDC:: ds $1 ; c211
wFarCallSavedA:: ds $1 ; c212
wc213:: ds $5 ; c213
wFarCallSavedHL:: ds $2 ; c218
wFarCallDestBank:: ds $1 ; c21a
wFarCallDestAddr:: ds $2 ; c21b
wBGP:: ds $1 ; c21d
wOBP0:: ds $1 ; c21e
wOBP1:: ds $1 ; c21f
	ds $4
wVBlankCallbackROMBank:: ds $1 ; c224
wVBlankCallbackRAMBank:: ds $1 ; c225
wVBlankCallbackAddress:: ds $2 ; c226
wDecompressEndAddress:: ds $2 ; c228
wDecompressLiteralCopySize:: ds $2 ; c22a
wDecompresLiteralCopyOffsetHi:: ds $1 ; c22c
	ds $8

wPoncotPicAlignment:: ds $1 ; c235
	ds $1
wRNGState:: dw ; c237

video_transfer_queue: MACRO
\1::
\1TilesRemaining:: ds 1
\1Source:: ds 2
\1Dest:: ds 2
ENDM

wVideoTransferQueue:: ; c239
	video_transfer_queue wVideoTransferQueueEntry1 ; c239
	video_transfer_queue wVideoTransferQueueEntry2 ; c23e
	video_transfer_queue wVideoTransferQueueEntry3 ; c243
	video_transfer_queue wVideoTransferQueueEntry4 ; c248

wc24d:: ds $1 ; c24d
wBlinkerX:: ds $1 ; c24e
wBlinkerY:: ds $1 ; c24f
wBlinkerTile:: ds $1 ; c250
wBlinkerOffTile:: ds $1 ; c251
wStringDestX:: ds $1 ; c252
wStringDestY:: ds $1 ; c253
	ds $1
wKana:: ; c255
; 00: katakana
; ff: hiragana
	ds $1

	ds $80

wMapWidth:: db ; c2d6
wMapHeight:: db ; c2d7
wMapX:: db ; c2d8
wMapY:: db ; c2d9
	ds $6

wc2e0:: ds $1 ; c2e0
	ds $5
wc2e6:: ds $2 ; c2e6
wc2e8:: ds $1 ; c2e8
	ds $1

wVideoTransferRequestFlags:: ds $1 ; c2ea
wSongCurrentlyPlaying:: db ; c2eb
wSFXCurrentlyPlaying:: db ; c2ec
wVideoTransferRequestBank:: ds $1 ; c2ed
	ds $d
wSystemType:: ; c2fb

SECTION "OAM Buffer", WRAM0 [$c300]
wOAMBuffer:: ; c300
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

	ds wOAMBuffer - @

wc300:: ds $9
wPlayerName:: ds $4

SECTION "OAM Buffer 2", WRAM0 [$c400]
wOAMBuffer2:: ; c400
	oam_ram wOAM2_00
	oam_ram wOAM2_01
	oam_ram wOAM2_02
	oam_ram wOAM2_03
	oam_ram wOAM2_04
	oam_ram wOAM2_05
	oam_ram wOAM2_06
	oam_ram wOAM2_07
	oam_ram wOAM2_08
	oam_ram wOAM2_09
	oam_ram wOAM2_0a
	oam_ram wOAM2_0b
	oam_ram wOAM2_0c
	oam_ram wOAM2_0d
	oam_ram wOAM2_0e
	oam_ram wOAM2_0f
	oam_ram wOAM2_10
	oam_ram wOAM2_11
	oam_ram wOAM2_12
	oam_ram wOAM2_13
	oam_ram wOAM2_14
	oam_ram wOAM2_15
	oam_ram wOAM2_16
	oam_ram wOAM2_17
	oam_ram wOAM2_18
	oam_ram wOAM2_19
	oam_ram wOAM2_1a
	oam_ram wOAM2_1b
	oam_ram wOAM2_1c
	oam_ram wOAM2_1d
	oam_ram wOAM2_1e
	oam_ram wOAM2_1f
	oam_ram wOAM2_20
	oam_ram wOAM2_21
	oam_ram wOAM2_22
	oam_ram wOAM2_23
	oam_ram wOAM2_24
	oam_ram wOAM2_25
	oam_ram wOAM2_26
	oam_ram wOAM2_27
wOAMBuffer2End::

SECTION "Tile Map", WRAM0 [$c4a0]
wTileMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT

SECTION "Overworld RAM", WRAM0 [$c770]
wc770:: ; c770
	ds $4

wObjectStructPointer:: dw ; c774
wc776:: dw ; c776
	ds $2

wWarpDataPointer:: dw ; c77a
wNumWarps:: db ; c77c
	ds $4

wRandomEncounterRate:: db ; c781
	ds $1
wRandomEncounterCooldown:: db ; c783
	ds $3a

wMapMusic:: db ; c7be
	ds $1c

wBackupMapX:: db ; c7db
wBackupMapY:: db ; c7dc
	ds $2
wBackupMapGroup:: db ; c7df
wBackupMapNumber:: db ; c7e0
	ds $6

wSpawnX:: db ; c7e7
wSpawnY:: db ; c7e8
wc7e9:: db ; c7e9
wc7ea:: db ; c7ea
wMapGroup:: db ; c7eb
wMapNumber:: db ; c7ec
wEventFlags:: ; c7ed
	ds $3b

wBlockdataPointer:: dw ; c828
	ds $6

wMapCollisionPointer:: dw ; c830
	ds $6

wPlayerFacing:: db ; c838
	ds $18

wc851:: db ; c851
wc852:: dw ; c852
	ds $b

wPlayerMapX:: db ; c85f
wPlayerMapY:: db ; c860
wCurWarpMinX:: db ; c861
wCurWarpMinY:: db ; c862
wCurWarpHDim:: db ; c863
wCurWarpVDim:: db ; c864
wPlayerStandingTileOffset:: dw ; c865
	ds $15
wPlayerMovementRate:: db ; c87c
wLastStepSucceeded:: db ; c87d
	ds $a

wCheckCollisionReturnFlag:: db ; c888
wCheckCollisionX:: db ; c889
wCheckCollisionY:: db ; c88a
wCheckCollisionFlag:: db ; c88b
wCheckCollisionFacingDirection:: db ; c88c
wCheckCollisionObjectCounter:: db ; c88d
wCheckCollisionObjectStructPointer:: dw ; c88e
wCheckCollision

SECTION "CGB Palettes Buffer", WRAM0 [$c89c]
wCGB_BGPalsBuffer:: ; c89c
	ds 8 * 8

wCGB_OBPalsBuffer:: ; c8dc
	ds 8 * 8

wVBlankTransferFlags:: ; c91c
; ==0: push CGB palettes
; bit 1: push wVBlankMetaTileTransferQueue1
; bit 0: push wVBlankMetaTileTransferQueue0
	ds $1

wc91d:: dw ; c91d

wVBlankMetaTileTransferQueue0TileSource:: dw ; c91f
wVBlankMetaTileTransferQueue0AttrSource:: dw ; c921
wVBlankMetaTileTransferQueue0Dest:: dw ; c923

wVBlankMetaTileTransferQueue1TileSource:: dw ; c925
wVBlankMetaTileTransferQueue1AttrSource:: dw ; c927
wVBlankMetaTileTransferQueue1Dest:: dw ; c929

SECTION "OverworldMap", WRAM0 [$d508]
	ds 17 * 20

SECTION "Stack", WRAM0 [$d810]
wStackBottom:: ds $7f0 ; d810
wStackTop:: ; e000
