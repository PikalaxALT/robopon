INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 09", ROMX, BANK [$9]
INCLUDE "charmap2.asm"
Func_24000: ; 24000
	ret

Func_24001:: ; 24001
	callba_hli Func_5cf1d
	ret

Func_24010:: ; 24010
	push hl
	set_farcall_addrs_hli Func_5cf85
	pop hl
	ld e, BANK(Func_24010)
	call FarCall
	ret

Func_24023:: ; 24023
	push hl
	set_farcall_addrs_hli Func_5d02d
	pop hl
	ld e, BANK(Func_24023)
	call FarCall
	ret

Func_24036:: ; 24036
	callba_hli Func_5d107
	ret

Func_24045:: ; 24045
	callba_hli Func_5d10d
	ret

Func_24054:: ; 24054
	push af
	set_farcall_addrs_hli Func_5d096
	pop af
	call FarCall
	ret

Text_24065:: ; 24065
	dstr " "

Text_24067:: ; 24067
	dstr "!"

Text_24069:: ; 24069
	dstr "は"

Text_2406b:: ; 2406b
	dstr "に"

Text_2406d:: ; 2406d
	dstr "が"

Text_2406f:: ; 2406f
	dstr "の"

Text_24071:: ; 24071
	dstr "を"

Text_24073: ; 24073
	dstr "で"

Text_24075: ; 24075
	dstr "/"

Text_24077: ; 24077
	dstr "G"

Pointers_24079: ; 24079
	dw Text_24065
	dw Text_24067
	dw Text_24069
	dw Text_2406b
	dw Text_2406d
	dw Text_2406f
	dw Text_24071
	dw Text_24073
	dw Text_24075
	dw Text_24077

Text_2408d: ; 2408d
	dstr " "

Text_2408f:: ; 2408f
	dstr "いのり"

Text_24093:: ; 24093
	dstr "のろい"

Text_24097:: ; 24097
	dstr "ねつ"

Text_2409a: ; 2409a
	dstr "バグ"

Text_2409d: ; 2409d
	dstr "のうむ"

Text_240a1: ; 240a1
	dstr "めいれいむし"

Text_240a8: ; 240a8
	dstr "ていし"

Text_240ac:: ; 240ac
	dstr "サビ"

Text_240af: ; 240af
	dstr "ぼうそう"

Text_240b4: ; 240b4
	dstr "はんどう"

Text_240b9:: ; 240b9
	dstr "みずびたし"

Text_240bf:: ; 240bf
	dstr "あぶらまみれ"

Text_240c6:: ; 240c6
	dstr "バリヤ"

Text_240ca: ; 240ca
	dstr "ふのう"

Pointers_240ce:: ; 240ce
	dw Text_2408d
	dw Text_2408f
	dw Text_24093
	dw Text_24097
	dw Text_2409a
	dw Text_2409d
	dw Text_240a1
	dw Text_240a8
	dw Text_240ac
	dw Text_240af
	dw Text_240b4
	dw Text_240b9
	dw Text_240bf
	dw Text_240c6
	dw Text_240ca

Text_240ec: ; 240ec
	dstr "ぼうぎょ"

Text_240f1:: ; 240f1
	dstr "こうげき"

Text_240f6: ; 240f6
	dstr "すばやさ"

Text_240fb: ; 240fb
	dstr "めいちゅう"

Text_24101: ; 24101
	dstr "ポイント"

Text_24106: ; 24106
	dstr "エネルギー"

Text_2410c: ; 2410c
	dstr "ヒット"

Text_24110: ; 24110
	dstr "こうげき"

Text_24115: ; 24115
	dstr "わざ"

Text_24118: ; 24118
	dstr "はんどう"

Text_2411d:: ; 2411d
	dstr "ばくはつ"

Pointers_24122:: ; 24122
	dw Text_240ec
	dw Text_240f1
	dw Text_240f6
	dw Text_240fb
	dw Text_24101
	dw Text_24106
	dw Text_2410c
	dw Text_24110
	dw Text_24115
	dw Text_24118
	dw Text_2411d

Text_24138: ; 24138
	dstr "たたかう"

Text_2413d: ; 2413d
	dstr "アイテム"

Text_24142: ; 24142
	dstr "ロボポン"

Text_24147: ; 24147
	dstr "にげる"

Text_2414b:: ; 2414b
	dstr "コマンド"

Text_24150:: ; 24150
	dstr "すべて"

Pointers_24154: ; 24154
	dw Text_24138
	dw Text_2413d
	dw Text_24142
	dw Text_24147
	dw Text_2414b
	dw Text_24150

Text_24160:: ; 24160
	dstr "あがった"

Text_24165:: ; 24165
	dstr "さがった"

Text_2416a: ; 2416a
	dstr "うけた"

Text_2416e:: ; 2416e
	dstr "つかえません"

Text_24175:: ; 24175
	dstr "はずれた"

Text_2417a:: ; 2417a
	dstr "なっている"

Text_24180:: ; 24180
	dstr "なおった"

Text_24185:: ; 24185
	dstr "ふせいだ"

Text_2418a: ; 2418a
	dstr "すいとった"

Text_24190: ; 24190
	dstr "あたえた"

Text_24195:: ; 24195
	dstr "ダメージ"

Text_2419a: ; 2419a
	dstr "はんげきした"

Text_241a1: ; 241a1
	dstr "ひろった"

Text_241a6: ; 241a6
	dstr "かけてきた"

Text_241ac:: ; 241ac
	dstr "かけている"

Text_241b2:: ; 241b2
	dstr "しっぱいした"

Text_241b9:: ; 241b9
	dstr "になった"

Text_241be:: ; 241be
	dstr "ダメージをうけとめた"

Text_241c9:: ; 241c9
	dstr "にへった"

Text_241ce:: ; 241ce
	dstr "しようできなくなった"

Text_241d9:: ; 241d9
	dstr "の ばくははしっぱいした"

Text_241e6:: ; 241e6
	dstr "つかった"

Text_241eb:: ; 241eb
	dstr "スクラップ"

Text_241f1:: ; 241f1
	dstr "にした"

Pointers_241f5: ; 241f5
	dw Text_24160
	dw Text_24165
	dw Text_2416a
	dw Text_2416e
	dw Text_24175
	dw Text_2417a
	dw Text_24180
	dw Text_24185
	dw Text_2418a
	dw Text_24190
	dw Text_24195
	dw Text_2419a
	dw Text_241a1
	dw Text_241a6
	dw Text_241ac
	dw Text_241b2
	dw Text_241b9
	dw Text_241be
	dw Text_241c9
	dw Text_241ce
	dw Text_241d9
	dw Text_241e6
	dw Text_241eb
	dw Text_241f1

Text_24225:: ; 24225
	dstr "えいきょうで "

Text_2422d:: ; 2422d
	dstr "こうかで "

Text_24233:: ; 24233
	dstr "のこうかが きれた"

Text_2423d:: ; 2423d
	dstr "で まもられている"

Text_24247:: ; 24247
	dstr "は こんらんしている"

Text_24252:: ; 24252
	dstr "しかし "

Text_24257:: ; 24257
	dstr "で つつまれた"

Text_2425f:: ; 2425f
	dstr "バリアにはねかえされた"

Text_2426b:: ; 2426b
	dstr "さらに"

Text_2426f:: ; 2426f
	dstr "のこうかで"

Text_24275:: ; 24275
	dstr "HP"

Text_24278:: ; 24278
	dstr "そのわざは"

Text_2427e: ; 2427e
	dstr "ぞくせいは"

Text_24284:: ; 24284
	dstr "にげようとした"

Text_2428c:: ; 2428c
	dstr "しかし にげられなかった"

Text_24299:: ; 24299
	dstr "うまく にげた"

Text_242a1:: ; 242a1
	dstr "ばくはつした"

Pointers_242a8: ; 242a8
	dw Text_24225
	dw Text_2422d
	dw Text_24233
	dw Text_2423d
	dw Text_24247
	dw Text_24252
	dw Text_24257
	dw Text_2425f
	dw Text_2426b
	dw Text_2426f
	dw Text_24275
	dw Text_24278
	dw Text_2427e
	dw Text_24284
	dw Text_2428c
	dw Text_24299
	dw Text_242a1

Text_242ca: ; 242ca
	dstr "ノーマル"

Text_242cf: ; 242cf
	dstr "ひ"

Text_242d1: ; 242d1
	dstr "みず"

Text_242d4: ; 242d4
	dstr "かぜ"

Text_242d7: ; 242d7
	dstr "つち"

Text_242da: ; 242da
	dstr "かみなり"

Text_242df: ; 242df
	dstr "こおり"

Text_242e3: ; 242e3
	dstr "せい"

Text_242e6: ; 242e6
	dstr "じゃ"

Text_242e9: ; 242e9
	dstr "りく"

Text_242ec: ; 242ec
	dstr "かい"

Text_242ef: ; 242ef
	dstr "くう"

Pointers_242f2:: ; 242f2
	dw Text_242ca
	dw Text_242cf
	dw Text_242d1
	dw Text_242d4
	dw Text_242d7
	dw Text_242da
	dw Text_242df
	dw Text_242e3
	dw Text_242e6
	dw Text_242e9
	dw Text_242ec
	dw Text_242ef

Text_2430a: ; 2430a
	dstr "こうか17"

Text_24310:: ; 24310
	dstr "EP"

Text_24313:: ; 24313
	dstr "ついかダメージ"

Text_2431b: ; 2431b
	dstr "ごうげきのはんどうで"

Text_24326:: ; 24326
	dstr "じばくした"

Text_2432c:: ; 2432c
	dstr "はんげき"

Text_24331: ; 24331
	dstr "いちげきひっさつ"

Text_2433a:: ; 2433a
	dstr "がまんしている"

Text_24342:: ; 24342
	dstr "してきた"

Text_24347:: ; 24347
	dstr "した"

Text_2434a: ; 2434a
	dstr "27"

Text_2434d: ; 2434d
	dstr "28"

Text_24350: ; 24350
	dstr "はんてんかいふく"

Text_24359: ; 24359
	dstr "きゅうしゅう"

Text_24360: ; 24360
	dstr "HPかいふく"

Text_24367: ; 24367
	dstr "32"

Text_2436a: ; 2436a
	dstr "ぼうぎょ"

Text_2436f: ; 2436f
	dstr "うけみ"

Text_24373: ; 24373
	dstr "35"

Text_24376: ; 24376
	dstr "36"

Text_24379: ; 24379
	dstr "37"

Text_2437c: ; 2437c
	dstr "38"

Text_2437f: ; 2437f
	dstr "れんぞくこうげき"

Text_24388: ; 24388
	dstr "こうか40"

Text_2438e: ; 2438e
	dstr "こうか41"

Text_24394: ; 24394
	dstr "こうか42"

Text_2439a: ; 2439a
	dstr "こうか43"

Text_243a0: ; 243a0
	dstr "こうか44"

Pointers_243a6:: ; 243a6
	dw Text_2430a
	dw Text_24310
	dw Text_24313
	dw Text_2431b
	dw Text_24326
	dw Text_2432c
	dw Text_24331
	dw Text_2433a
	dw Text_24342
	dw Text_24347
	dw Text_2434a
	dw Text_2434d
	dw Text_24350
	dw Text_24359
	dw Text_24360
	dw Text_24367
	dw Text_2436a
	dw Text_2436f
	dw Text_24373
	dw Text_24376
	dw Text_24379
	dw Text_2437c
	dw Text_2437f
	dw Text_24388
	dw Text_2438e
	dw Text_24394
	dw Text_2439a
	dw Text_243a0

Text_243de:: ; 243de
	dstr "ていしじょうたいで うごけない!"

Text_243ef:: ; 243ef
	dstr "ぼうぎょしている"

Text_243f8:: ; 243f8
	dstr "かいひしようとしている"

Text_24404:: ; 24404
	dstr "なにもしない"

Pointers_2440b: ; 2440b
	dw Text_243de
	dw Text_243ef
	dw Text_243f8
	dw Text_24404

Text_24413:: ; 24413
	dstr "こうげきの はんどうで"

Text_2441f:: ; 2441f
	dstr "の ダメージ"

Pointers_24426: ; 24426
	dw Text_24413
	dw Text_2441f

Text_2442a:: ; 2442a
	dstr "しかし"

Text_2442e:: ; 2442e
	dstr "バリアに はねかえされた"

Pointers_2443b: ; 2443b
	dw Text_2442a
	dw Text_2442e

Text_2443f:: ; 2443f
	dstr "きゅうしょ にあたって"

Text_2444b:: ; 2444b
	dstr "いちげきひっさつ にした!"

Pointers_24459: ; 24459
	dw Text_2443f
	dw Text_2444b

Text_2445d:: ; 2445d
	dstr "は すべての わざの"

Text_24468:: ; 24468
	dstr "しようが できなくなった!"

Pointers_24476: ; 24476
	dw Text_2445d
	dw Text_24468

Text_2447a:: ; 2447a
	dstr "きあい をいれた!"

Pointers_24484: ; 24484
	dw Text_2447a

Text_24486:: ; 24486
	dstr "しようできなくなった!"

Pointers_24492: ; 24492
	dw Text_24486

Text_24494: ; 24494
	dstr "りく こうげき をふうじた!"

Text_244a3: ; 244a3
	dstr "うみ こうげき をふうじた!"

Text_244b2: ; 244b2
	dstr "そら こうげき をふうじた!"

Text_244c1: ; 244c1
	dstr "ノーマル こうげき をふうじた!"

Pointers_244d2: ; 244d2
	dw Text_24494
	dw Text_244a3
	dw Text_244b2
	dw Text_244c1

Text_244da: ; 244da
	dstr "を ぬすんだ"

Pointers_244e1: ; 244e1
	dw Text_244da

Text_244e3:: ; 244e3
	dstr "は "

Text_244e6:: ; 244e6
	dstr "を"

Text_244e8:: ; 244e8
	dstr "スキャニングした!"

Text_244f2:: ; 244f2
	dstr "の ぼうぎょぞくせいは"

Text_244fe:: ; 244fe
	dstr "ヒットポイントの"

Text_24507:: ; 24507
	dstr "じょうたいも わかった!"

Pointers_24514: ; 24514
	dw Text_244e3
	dw Text_244e6
	dw Text_244e8
	dw Text_244f2
	dw Text_244fe
	dw Text_24507

Text_24520:: ; 24520
	dstr "は "

Text_24523:: ; 24523
	dstr "から"

Text_24526:: ; 24526
	dstr "ゴールド ごうだつした!"

Pointers_24533: ; 24533
	dw Text_24520
	dw Text_24523
	dw Text_24526

Text_24539:: ; 24539
	dstr "は "

Text_2453c:: ; 2453c
	dstr "れんぞくこうげき した!"

Pointers_24549: ; 24549
	dw Text_24539
	dw Text_2453c

Text_2454d:: ; 2454d
	dstr "は "

Text_24550:: ; 24550
	dstr "せんせいこうげき した!"

Pointers_2455d: ; 2455d
	dw Text_2454d
	dw Text_24550

Text_24561: ; 24561
	dstr "かけた"

Text_24565: ; 24565
	dstr "かけてきた"

Pointers_2456b:: ; 2456b
	dw Text_24561
	dw Text_24565

Text_2456f:: ; 2456f
	dstr "よしっ!"

Text_24574:: ; 24574
	dstr "かなりきいたみたいだぞ"

Pointers_24580: ; 24580
	dw Text_2456f
	dw Text_24574

Text_24584:: ; 24584
	dstr "しまった!"

Text_2458a:: ; 2458a
	dstr "かなりやられたみたいだ"

Pointers_24596: ; 24596
	dw Text_24584
	dw Text_2458a

Text_2459a:: ; 2459a
	dstr "しまった!"

Text_245a0:: ; 245a0
	dstr "ぜんぜんきいていないみたいだ"

Pointers_245af: ; 245af
	dw Text_2459a
	dw Text_245a0

Text_245b3:: ; 245b3
	dstr "よしっ!"

Text_245b8:: ; 245b8
	dstr "ぜんぜんきいていないぞ"

Pointers_245c4: ; 245c4
	dw Text_245b3
	dw Text_245b8

