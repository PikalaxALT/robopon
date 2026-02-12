INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 24, 2", ROMX
CommonYearMonthLengths:
	db 0
	db 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

LeapYearMonthLengths:
	db 0
	db 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

Data_930b1:
	dstr "Robopon"

Func_930b9:
	ldh a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank
	ld bc, $7
	ld de, Data_930b1
	ld hl, sRoboponTitle
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ret

Func_930d2:
	push bc
	ldh a, [hSRAMBank]
	push af
	ld hl, sp+$2
	ld [hl], $0
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld c, $0
Func_930e1: ; 930e1 (24:70e1)
	ld a, c
	cp $7
	jp nc, Func_93105
	ld e, c
	ld d, $0
	ld hl, Data_930b1
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sRoboponTitle
	add hl, de
	cp [hl]
	jp z, Func_93101
	ld hl, sp+$2
	ld [hl], $ff
	jp Func_93105

Func_93101: ; 93101 (24:7101)
	inc c
	jp Func_930e1

Func_93105: ; 93105 (24:7105)
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_9310e:
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $d
	ld e, $14
	ld hl, $0
	call FarCall
	ld e, $1
	ld a, $2
	call SetStringStartState
	ld hl, Data_93224
	push hl
	call PlaceString
	pop bc
	ld e, $3
	ld a, $2
	call SetStringStartState
	ld hl, Data_93235
	push hl
	call PlaceString
	pop bc
	ld e, $5
	ld a, $2
	call SetStringStartState
	ld hl, Data_93240
	push hl
	call PlaceString
	pop bc
	ld e, $7
	ld a, $2
	call SetStringStartState
	ld hl, Data_93256
	push hl
	call PlaceString
	pop bc
	ld e, $9
	ld a, $2
	call SetStringStartState
	ld hl, Data_9325f
	push hl
	call PlaceString
	pop bc
	ld e, $b
	ld a, $2
	call SetStringStartState
	ld hl, Data_93271
	push hl
	call PlaceString
	pop bc
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_93281
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld l, $0
Func_931a2: ; 931a2 (24:71a2)
	push hl
	call NextOverworldFrame
	call CheckButton
	pop hl
	cp $10
	jp nz, Func_931b2
	jp Func_931fc

Func_931b2: ; 931b2 (24:71b2)
	cp $2
	jp nz, Func_931b9
	ld l, $0
Func_931b9: ; 931b9 (24:71b9)
	cp $1
	jp nz, Func_931c0
	ld l, $1
Func_931c0: ; 931c0 (24:71c0)
	push hl
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop hl
	push hl
	inc l
	dec l
	jp nz, Func_931df
	ld hl, $8b
	push hl
	ld hl, Data_93295
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_931ec

Func_931df: ; 931df (24:71df)
	ld hl, $8b
	push hl
	ld hl, Data_932a9
	push hl
	call PlaceString
	pop bc
	pop bc
Func_931ec: ; 931ec (24:71ec)
	ld l, $3
	push hl
	ld c, $14
	ld e, $e
.asm_931f2
	xor a
	call PushBGMapRegion
	pop bc
	pop hl
	jp Func_931a2

Func_931fc: ; 931fc (24:71fc)
	push hl
	call FillVisibleAreaWithBlankTile
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	xor a
	ld [wOverworldTilemapSelector], a
Func_93214: ; 93214 (24:7214)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp z, Func_93221
	jp Func_93214

Func_93221: ; 93221 (24:7221)
	pop hl
	ld a, l
	ret

Data_93224:
	dstr "カートリッシﾞ(の てﾞんちを)"

Data_93235:
	dstr "(とりかえてね!!)"

Data_93240:
	dstr "(そろそろ てﾞんちかﾞ きれそうてﾞす)"

Data_93256:
	dstr "(ちゅうい!!)"

Data_9325f:
	dstr "ケﾞームホﾞーイ (ほんたい の)"

Data_93271:
	dstr "(てﾞんちてﾞは ありません)"

Data_93281:
	dstr "(%cとりかえた    とりかえない)"

Data_93295:
	dstr "(%cとりかえた    とりかえない)"

Data_932a9:
	dstr "( とりかえた   %cとりかえない)"

Func_932bd:: ; 932bd (24:72bd)
	push hl
	ld a, [wRTCTicker]
	push af
	call GetHLAtSPPlus4
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus4
	ld a, [hl]
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	call Func_93883
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, bc
	push hl
.loop
	ld a, [wRTCTicker]
	cp $1
	jp z, .break
	ld a, [wRTCTicker]
	or a
	jp nz, .delay
	ld a, $1
	ld [wRTCTicker], a
.delay
	call NextOverworldFrame
	jp .loop

.break
	pop hl
	pop bc
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call Func_93d05
	pop af
	or a
	jp z, .loop2
	ld a, [wRTCTicker]
	or a
	jp nz, .loop2
	ld a, $1
	ld [wRTCTicker], a
.loop2
	ld a, [wRTCTicker]
	cp $11
	jp z, .break2
	ld a, [wRTCTicker]
	or a
	jp nz, .delay2
	ld a, $1
	ld [wRTCTicker], a
.delay2
	call NextOverworldFrame
	jp .loop2

.break2
	call NextOverworldFrame
.loop3
	ld a, [wRTCTicker]
	cp $11
	jp z, .break3
	ld a, [wRTCTicker]
	or a
	jp nz, .delay3
	ld a, $1
	ld [wRTCTicker], a
.delay3
	call NextOverworldFrame
	jp .loop3

.break3
	call NextOverworldFrame
	pop bc
	ret

Func_93364: ; 93364 (24:7364)
	read_hl_from wRTCDays
	ret

Func_9336a:: ; 9336a (24:736a)
	read_hl_from wc92c
	ret

Func_93370:: ; 93370 (24:7370)
	push hl
	pop hl
	push hl
	reg16swap de, hl
	read_hl_from wRTCDays
	call FixDays
	read_hl_from wMinutesSinceMidnight
	ld de, 60
	call DivideHLByDESigned
	ld a, l
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from wMinutesSinceMidnight
	ld de, 60
	call DivideHLByDESigned
	ld a, e
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ret

Func_933a6:
	push hl
	ld a, [wc92c]
	ld [hl], a
	inc hl
	ld a, [wc92c + 1]
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [wMinutesSinceMidnight]
	ld [hl], a
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [wMinutesSinceMidnight + 1]
	ld [hl], a
	ret

Func_933c1:: ; 933c1 (24:73c1)
	push hl
	push de
	ld hl, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_933d8
	reg16swap de, hl
	ld e, $0
	ld bc, $8
	call FillMemory
Func_933d8: ; 933d8 (24:73d8)
	pop de
	pop hl
	push hl
	ld a, l
	sub $a
	or h
	jp nz, Func_933ea
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, $8
	or [hl]
	ld [hl], a
Func_933ea: ; 933ea (24:73ea)
	ld a, [wRTCTicker]
	reg16swap de, hl
	write_hl_to wc874
	pop hl
	push af
	ld a, l
	add a
	add a
	add a
	add $20
	ld [wc876], a
	ld a, [wc874]
	ld l, a
	ld a, [wc874 + 1]
	ld h, a
	ld a, [wc876]
	ld c, a
	ld b, $8
	ldh a, [hSRAMBank]
	push af
	predef Func_7e497
	pop af
	call GetSRAMBank
	pop af
	or a
	jp z, Func_93429
	ld a, [wRTCTicker]
	or a
	jp nz, Func_93429
	ld a, $1
	ld [wRTCTicker], a
Func_93429: ; 93429 (24:7429)
	ret

Func_9342a::
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	read_hl_from_sp_plus $c
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_93468
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	push bc
	ld bc, $8
	read_hl_from_sp_plus $e
	ld e, $0
	call FillMemory
	pop bc
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_935a8
	jp Func_935a5

Func_93468: ; 93468 (24:7468)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wOptions]
	and $2 ; stereo
	push af
	ld a, l
	call GetSRAMBank
	pop af
	or a
	jp z, Func_934b6
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	push bc
	ld bc, $8
	read_hl_from_sp_plus $e
	ld e, $0
	call FillMemory
	pop bc
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_935a8
	jp Func_935a5

Func_934b6: ; 934b6 (24:74b6)
	call Func_9336a
	push hl
	call Func_93364
	push hl
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld c, [hl]
	read_hl_from_sp_plus $10
	ld a, [hl]
	read_hl_from_sp_plus $10
	inc hl
	ld e, [hl]
	call Func_93883
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	add hl, de
	reg16swap de, hl
	push de
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, bc
	reg16swap de, hl
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$4
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	pop de
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$5
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $c
	ld de, $5
	add hl, de
	ld a, [hl]
	cp $2
	jp nc, Func_9357b
	jp Func_935a5

Func_9357b: ; 9357b (24:757b)
	ld bc, $8
	ld hl, sp+$1
	push hl
	read_hl_from_sp_plus $e
	ld de, $5
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wc938 - 2 * 8
	add hl, de
	pop de
	call CopyFromDEtoHL
	callba_hli Func_93c0c
Func_935a5: ; 935a5 (24:75a5)
	add sp, $c
	ret

Func_935a8:: ; 935a8 (24:75a8)
	push hl
	push de
	call GetHLAtSPPlus4
	ld de, $2
	call CompareHLtoDE
	jp nc, Func_935b9
	jp Func_9362f

Func_935b9: ; 935b9 (24:75b9)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_935ce
	ld bc, $8
	pop hl
	push hl
	ld e, $0
	call FillMemory
Func_935ce: ; 935ce (24:75ce)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wOptions]
	and $2 ; stereo
	push af
	ld a, l
	call GetSRAMBank
	pop af
	or a
	jp z, Func_935fb
	ld bc, $8
	pop hl
	push hl
	ld e, $0
	call FillMemory
Func_935fb: ; 935fb (24:75fb)
	call GetHLAtSPPlus4
	ld a, l
	sub $a
	or h
	jp nz, Func_9360d
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $8
	or [hl]
	ld [hl], a
Func_9360d: ; 9360d (24:760d)
	ld bc, $8
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wRTCDays - 8
	add hl, de
	pop de
	call CopyFromDEtoHL
	callba_hli Func_93c0c
Func_9362f: ; 9362f (24:762f)
	pop bc
	pop bc
	ret

DaysSince1Jan1924:
	dw   366 ; 1924
	dw   731 ; 1925
	dw  1096 ; 1926
	dw  1461 ; 1927
	dw  1827 ; 1928
	dw  2192 ; 1929
	dw  2557 ; 1930
	dw  2922 ; 1931
	dw  3288 ; 1932
	dw  3653 ; 1933
	dw  4018 ; 1934
	dw  4383 ; 1935
	dw  4749 ; 1936
	dw  5114 ; 1937
	dw  5479 ; 1938
	dw  5844 ; 1939
	dw  6210 ; 1940
	dw  6575 ; 1941
	dw  6940 ; 1942
	dw  7305 ; 1943
	dw  7671 ; 1944
	dw  8036 ; 1945
	dw  8401 ; 1946
	dw  8766 ; 1947
	dw  9132 ; 1948
	dw  9497 ; 1949
	dw  9862 ; 1950
	dw 10227 ; 1951
	dw 10593 ; 1952
	dw 10958 ; 1953
	dw 11323 ; 1954
	dw 11688 ; 1955
	dw 12054 ; 1956
	dw 12419 ; 1957
	dw 12784 ; 1958
	dw 13149 ; 1959
	dw 13515 ; 1960
	dw 13880 ; 1961
	dw 14245 ; 1962
	dw 14610 ; 1963
	dw 14976 ; 1964
	dw 15341 ; 1965
	dw 15706 ; 1966
	dw 16071 ; 1967
	dw 16437 ; 1968
	dw 16802 ; 1969
	dw 17167 ; 1970
	dw 17532 ; 1971
	dw 17898 ; 1972
	dw 18263 ; 1973
	dw 18628 ; 1974
	dw 18993 ; 1975
	dw 19359 ; 1976
	dw 19724 ; 1977
	dw 20089 ; 1978
	dw 20454 ; 1979
	dw 20820 ; 1980
	dw 21185 ; 1981
	dw 21550 ; 1982
	dw 21915 ; 1983
	dw 22281 ; 1984
	dw 22646 ; 1985
	dw 23011 ; 1986
	dw 23376 ; 1987
	dw 23742 ; 1988
	dw 24107 ; 1989
	dw 24472 ; 1990
	dw 24837 ; 1991
	dw 25203 ; 1992
	dw 25568 ; 1993
	dw 25933 ; 1994
	dw 26298 ; 1995
	dw 26664 ; 1996
	dw 27029 ; 1997
	dw 27394 ; 1998
	dw 27759 ; 1999
	dw 28125 ; 2000
	dw 28490 ; 2001
	dw 28855 ; 2002
	dw 29220 ; 2003
	dw 29586 ; 2004
	dw 29951 ; 2005
	dw 30316 ; 2006
	dw 30681 ; 2007
	dw 31047 ; 2008
	dw 31412 ; 2009
	dw 31777 ; 2010
	dw 32142 ; 2011
	dw 32508 ; 2012
	dw 32873 ; 2013
	dw 33238 ; 2014
	dw 33603 ; 2015
	dw 33969 ; 2016
	dw 34334 ; 2017
	dw 34699 ; 2018
	dw 35064 ; 2019
	dw 35430 ; 2020
	dw 35795 ; 2021
	dw 36160 ; 2022
	dw 36525 ; 2023
	dw 36891 ; 2024
	dw 37256 ; 2025
	dw 37621 ; 2026
	dw 37986 ; 2027
	dw 38352 ; 2028
	dw 38717 ; 2029
	dw 39082 ; 2030
	dw 39447 ; 2031
	dw 39813 ; 2032
	dw 40178 ; 2033
	dw 40543 ; 2034
	dw 40908 ; 2035
	dw 41274 ; 2036
	dw 41639 ; 2037
	dw 42004 ; 2038
	dw 42369 ; 2039
	dw 42735 ; 2040
	dw 43100 ; 2041
	dw 43465 ; 2042
	dw 43830 ; 2043
	dw 44196 ; 2044
	dw 44561 ; 2045
	dw 44926 ; 2046
	dw 45291 ; 2047
	dw 45657 ; 2048
	dw 46022 ; 2049
	dw 46387 ; 2050
	dw 46752 ; 2051
	dw 47118 ; 2052
	dw 47483 ; 2053
	dw 47848 ; 2054
	dw 48213 ; 2055
	dw 48579 ; 2056
	dw 48944 ; 2057
	dw 49309 ; 2058
	dw 49674 ; 2059
	dw 50040 ; 2060
	dw 50405 ; 2061
	dw 50770 ; 2062
	dw 51135 ; 2063
	dw 51501 ; 2064
	dw 51866 ; 2065
	dw 52231 ; 2066
	dw 52596 ; 2067
	dw 52962 ; 2068
	dw 53327 ; 2069
	dw 53692 ; 2070
	dw 54057 ; 2071
	dw 54423 ; 2072
	dw 54788 ; 2073
	dw 55153 ; 2074
	dw 55518 ; 2075
	dw 55884 ; 2076
	dw 56249 ; 2077
	dw 56614 ; 2078
	dw 56979 ; 2079
	dw 57345 ; 2080
	dw 57710 ; 2081
	dw 58075 ; 2082
	dw 58440 ; 2083
	dw 58806 ; 2084
	dw 59171 ; 2085
	dw 59536 ; 2086
	dw 59901 ; 2087
	dw 60267 ; 2088
	dw 60632 ; 2089
	dw 60997 ; 2090
	dw 61362 ; 2091
	dw 61728 ; 2092
	dw 62093 ; 2093
	dw 62458 ; 2094
	dw 62823 ; 2095
	dw 63189 ; 2096
	dw 63554 ; 2097
	dw 63919 ; 2098
	dw 64284 ; 2099

FixDays:: ; 93792 (24:7792)
	push hl
	push bc
	push bc
	push de
	call GetHLAtSPPlus8
	ld de, $3c
	add hl, de
	call WriteHLToSPPlus8
	ld hl, sp+$4
	ld [hl], $0
.getYear
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .gotYear
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp .getYear

.gotYear
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, .year_zero
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924 - 2
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus8
.year_zero
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, .not_1924
	ld hl, sp+$3
	ld [hl], $3
	jp .query_leap_year

.not_1924: ; 937f3 (24:77f3)
	ld hl, sp+$3
	ld [hl], $1
.query_leap_year: ; 937f7 (24:77f7)
	; this is queried twice for some reason
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld hl, sp+$2
	ld [hl], a
.loop: ; 93812 (24:7812)
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, .break
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, .common_year
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, LeapYearMonthLengths
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	jp .got_month

.common_year: ; 93833 (24:7833)
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, CommonYearMonthLengths
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
.got_month: ; 93841 (24:7841)
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, .break_
	call GetHLAtSPPlus8
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus8
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp .continue

.break_: ; 93861 (24:7861)
	jp .break

.continue: ; 93864 (24:7864)
	jp .loop

.break: ; 93867 (24:7867)
	call GetHLAtSPPlus8
	inc hl
	ld c, l
	pop de
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
	ld hl, sp+$1
	ld a, [hl]
	ld l, e
	ld h, d
	inc hl
	ld [hl], a
	reg16swap de, hl
	inc hl
	inc hl
	ld [hl], c
	pop bc
	pop bc
	pop bc
	ret

Func_93883:: ; 93883 (24:7883)
	push bc
	push bc
	push de
	or a
	jp nz, Func_93893
	ld hl, $0
	call WriteHLToSPPlus6
	jp Func_938a4

Func_93893: ; 93893 (24:7893)
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, DaysSince1Jan1924 - 2
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	pop af
Func_938a4: ; 938a4 (24:78a4)
	call GetHLAtSPPlus6
	ld de, hFFC4
	add hl, de
	call WriteHLToSPPlus6
	or a
	jp nz, Func_938b7
	ld c, $3
	jp Func_938b9

Func_938b7: ; 938b7 (24:78b7)
	ld c, $1
Func_938b9: ; 938b9 (24:78b9)
	push bc
	ld l, a
	ld h, $0
	ld de, 1924
	add hl, de
	call IsLeapYear
	ld l, a
	pop bc
	pop de
Func_938c7: ; 938c7 (24:78c7)
	ld a, c
	cp e
	jp nc, Func_93903
	push hl
	push de
	ld a, l
	cp $1
	jp nz, Func_938ea
	push bc
	ld e, c
	ld d, $0
	ld hl, LeapYearMonthLengths
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, bc
	call WriteHLToSPPlus10
	pop bc
	jp Func_938fd

Func_938ea: ; 938ea (24:78ea)
	push bc
	ld e, c
	ld d, $0
	ld hl, CommonYearMonthLengths
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	add hl, bc
	call WriteHLToSPPlus10
	pop bc
Func_938fd: ; 938fd (24:78fd)
	inc c
	pop de
	pop hl
	jp Func_938c7

Func_93903: ; 93903 (24:7903)
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, $0
	dec de
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	pop bc
	ret

IsLeapYear: ; 93911 (24:7911)
	push hl
	pop hl
	push hl
	ld de, 4
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_9392c
	pop hl
	push hl
	ld de, 100
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_93939
Func_9392c: ; 9392c (24:792c)
	pop hl
	push hl
	ld de, 400
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_9393e
Func_93939: ; 93939 (24:7939)
	ld a, $1
	jp Func_9393f

Func_9393e: ; 9393e (24:793e)
	xor a
Func_9393f: ; 9393f (24:793f)
	pop bc
	ret

Func_93941:: ; 93941 (24:7941)
	add sp, -$12
	push bc
	push af
	ld hl, sp+$4
	call Func_93370
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, de
	write_hl_to_sp_plus $13
	pop af
	pop bc
	cp $1
	jp nz, Func_939c3
	push af
	ld hl, sp+$c
	ld [hl], $8
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $12
	call FarCall
	cp $1
	jp nz, Func_939ad
	ld hl, $384
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_939a2
	inc bc
Func_939a2: ; 939a2 (24:79a2)
	ld hl, sp+$e
	ld [hl], $3
	ld hl, sp+$d
	ld [hl], $1
	jp Func_939bf

Func_939ad: ; 939ad (24:79ad)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_939bf: ; 939bf (24:79bf)
	pop af
	jp Func_93b08

Func_939c3: ; 939c3 (24:79c3)
	cp $2
	jp nz, Func_93a3d
	push af
	ld hl, sp+$c
	ld [hl], $9
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $7
	call FarCall
	ld hl, sp+$b
	ld [hl], a
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $2
	call FarCall
	cp $1
	jp nz, Func_93a27
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_93a27
	ld hl, $474
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_93a1c
	inc bc
Func_93a1c: ; 93a1c (24:7a1c)
	ld hl, sp+$e
	ld [hl], $7
	ld hl, sp+$d
	ld [hl], $1
	jp Func_93a39

Func_93a27: ; 93a27 (24:7a27)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_93a39: ; 93a39 (24:7a39)
	pop af
	jp Func_93b08

Func_93a3d: ; 93a3d (24:7a3d)
	cp $3
	jp nz, Func_93ab7
	push af
	ld hl, sp+$c
	ld [hl], $a
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $b9
	call FarCall
	ld hl, sp+$b
	ld [hl], a
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $b
	call FarCall
	cp $1
	jp nz, Func_93aa1
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_93aa1
	ld hl, $438
	write_hl_to_sp_plus $13
	call Func_9336a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_93a96
	inc bc
Func_93a96: ; 93a96 (24:7a96)
	ld hl, sp+$e
	ld [hl], $3
	ld hl, sp+$d
	ld [hl], $1
	jp Func_93ab3

Func_93aa1: ; 93aa1 (24:7aa1)
	ld hl, $0
	write_hl_to_sp_plus $13
	ld bc, $0
	ld hl, sp+$e
	ld [hl], $0
	ld hl, sp+$d
	ld [hl], $0
Func_93ab3: ; 93ab3 (24:7ab3)
	pop af
	jp Func_93b08

Func_93ab7: ; 93ab7 (24:7ab7)
	cp $4
	jp nz, Func_93b08
	push bc
	push af
	ld hl, sp+$e
	ld [hl], $7
	ld hl, sp+$4
	ld a, [wc79e]
	ld [hl], a
	ld hl, sp+$5
	ld a, [wc79f]
	ld [hl], a
	ld hl, sp+$6
	ld a, [wc7a0]
	ld [hl], a
	ld hl, sp+$7
	ld a, [wc7a1]
	ld [hl], a
	ld hl, sp+$8
	ld a, [wc7a2]
	ld [hl], a
	ld hl, sp+$e
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, sp+$a
	ld [hl], $3
	ld hl, sp+$c
	ld [hl], $0
	ld a, [wc79d]
	cp $1
	jp nz, Func_93afd
	ld hl, sp+$b
	ld [hl], $1
	jp Func_93b01

Func_93afd: ; 93afd (24:7afd)
	ld hl, sp+$b
	ld [hl], $0
Func_93b01: ; 93b01 (24:7b01)
	ld hl, sp+$4
	call Func_9342a
	pop af
	pop bc
Func_93b08: ; 93b08 (24:7b08)
	cp $4
	jp z, Func_93b84
	push af
	push bc
	read_hl_from_sp_plus $15
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$4
	ld [hl], e
	read_hl_from_sp_plus $15
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	read_hl_from_sp_plus $15
	ld l, h
	ld h, $0
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop bc
	ld a, c
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld [hl], e
	ld l, c
	ld h, b
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$6
	ld [hl], c
	ld hl, sp+$7
	ld [hl], $9
	ld hl, sp+$e
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	pop af
	cp $3
	jp nz, Func_93b76
	ld hl, sp+$3
	ld a, [hl]
	or $8
	ld hl, sp+$3
	ld [hl], a
Func_93b76: ; 93b76 (24:7b76)
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	call Func_935a8
Func_93b84: ; 93b84 (24:7b84)
	add sp, $12
	ret

GameBoot_ValidateRTC:: ; 93b87 (24:7b87)
	push bc
	push de
	push hl
	ldh a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	xor a
	ld [wRTCTicker], a
	predef Func_7e4d2
	jr z, .asm_93bb6
	ld hl, wLCDInterrupt2
	xor a
	ld [hl], a
	ld c, $7
	ld b, $1
	predef Func_7e497
	predef Func_7e2fd
	ld bc, -$200
	add hl, bc
	jr nc, .skip_reset
	call Func_93c08
	or a
	jr nz, .skip_reset
	predef Func_7e2d8
	jr .asm_93bc1

.asm_93bb6
	call Func_93bee
	ld de, 27273 ; September 1, 1998
	ld hl, $0
	jr .asm_93bc1

.asm_93bc1
	ld bc, $0
	predef SetRTCPredef
.skip_reset
	call Func_93be9
	jr z, .asm_93bd9
	call Func_93bee
	ld de, 27273 ; September 1, 1998
	ld hl, $0
	predef Func_7e320
	call Func_93be5
.asm_93bd9
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	pop hl
	pop de
	pop bc
	ret

Func_93be5: ; 93be5 (24:7be5)
	call Func_930b9
	ret

Func_93be9: ; 93be9 (24:7be9)
	call Func_930d2
	or a
	ret

Func_93bee: ; 93bee (24:7bee)
	ld hl, wLCDInterrupt2
	ld b, $e0
	xor a
.fill
	ld [hli], a
	dec b
	jr nz, .fill
	ld hl, wc7c2
	ld a, $8
	ld [hl], a
	ld hl, wLCDInterrupt2
	ld c, $20
	ld b, $e0
	predef Func_7e497
	ret

Func_93c08: ; 93c08 (24:7c08)
	call Func_9310e
	ret

Func_93c0c:: ; 93c0c (24:7c0c)
	push af
	push bc
	push de
	push hl
	ld a, $ff
	ld [wc932], a
	ld [wc932 + 1], a
	ld [wc934], a
	ld [wc934 + 1], a
	ld hl, wc938 + 7
	ld a, $9
Func_93c23: ; 93c23 (24:7c23)
	push af
	push hl
	ld a, [hld]
	or a
	jp z, Func_93cf6
	dec hl
	ld a, [hld]
	bit 3, a
	jr z, .asm_93c64
	ld b, a
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
	ld a, [hld]
	and $7
	ld d, a
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
	ld a, [wc92c + 1]
	ld b, a
	ld a, [wc92c]
	ld c, a
	ld a, [wMinutesSinceMidnight + 1]
	cp d
	jr c, .asm_93cba
	jr nz, .asm_93c61
	ld a, [wMinutesSinceMidnight]
	cp e
	jr c, .asm_93cba
.asm_93c61
	inc bc
	jr .asm_93cba

.asm_93c64
	ld b, a
	ld a, [wc92c + 1]
	cp b
	jr c, .asm_93ca0
	jp nz, Func_93cf6
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
	ld a, [wc92c]
	cp c
	jr c, .asm_93cab
	jr nz, Func_93cf6
	ld a, [hld]
	and $7
	ld d, a
	ld a, [wMinutesSinceMidnight + 1]
	cp d
	jr c, .asm_93caf
	jr nz, Func_93cf6
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
	ld a, [wMinutesSinceMidnight]
	cp e
	jr c, .asm_93cba
	jr Func_93cf6

.asm_93ca0
	ld a, [hld]
	and $f
	swap a
	ld c, a
	ld a, [hld]
	and $f
	or c
	ld c, a
.asm_93cab
	ld a, [hld]
	and $7
	ld d, a
.asm_93caf
	ld a, [hld]
	and $f
	swap a
	ld e, a
	ld a, [hld]
	and $f
	or e
	ld e, a
.asm_93cba
	ld a, [wc932 + 1]
	cp b
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc932]
	cp c
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc934 + 1]
	cp d
	jr c, Func_93cf6
	jr nz, .asm_93cda
	ld a, [wc934]
	cp e
	jr c, Func_93cf6
	jr z, Func_93cf6
.asm_93cda
	ld a, c
	ld [wc932], a
	ld a, b
	ld [wc932 + 1], a
	ld a, e
	ld [wc934], a
	ld a, d
	ld [wc934 + 1], a
	ld de, $7
	add hl, de
	ld a, [hli]
	ld [wc936], a
	ld a, [hli]
	ld [wc936 + 1], a
Func_93cf6: ; 93cf6 (24:7cf6)
	pop hl
	pop af
	ld bc, $8
	add hl, bc
	dec a
	jp nz, Func_93c23
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_93d05: ; 93d05 (24:7d05)
	push bc
	push de
	push hl
	call SuppressVBlankCallback
	push bc
	reg16swap hl, de
	ldh a, [hSRAMBank]
	push af
	push af
	push bc
	push de
	push hl
	predef Func_7e320
	call NextOverworldFrame
	call NextOverworldFrame
	call NextOverworldFrame
	pop hl
	pop de
	pop bc
	pop af
	predef Func_7e320
	pop af
	call GetSRAMBank
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop hl
	pop de
	pop bc
	ret

