SECTION "VBlankInt", ROM0 [$40]
	jp wVBlank

SECTION "HBlankInt", ROM0 [$48]
	jp wLCD

SECTION "TimerInt", ROM0 [$50]
	jp wTimer
Timer_::
	jp Func_021c

SECTION "SerialInt", ROM0 [$58]
	jp wSerial
