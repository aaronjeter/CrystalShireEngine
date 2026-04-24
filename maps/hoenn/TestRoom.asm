	object_const_def
	const TESTROOM_GOROCHU
	const TESTROOM_IRONBUNDLE
	;const TESTROOM_REGISTEEL
	const TESTROOM_LATIOS
	const TESTROOM_KYOGRE
	const TESTROOM_GROUDON
	const TESTROOM_RAYQUAZA
	const TESTROOM_JIRACHI
	const TESTROOM_CANDY

TestRoom_MapScripts:
	def_scene_scripts

	def_callbacks	

Testroom_Gorochu:
	cry GOROCHU
	opentext
	givepoke GOROCHU, 5
	closetext
	disappear TESTROOM_GOROCHU
	end

Testroom_Ironbubdle:
	cry IRONBUNDLE
	opentext
	givepoke IRONBUNDLE, 5
	closetext
	disappear TESTROOM_IRONBUNDLE
	end

Testroom_Registeel:
	cry REGISTEEL
	opentext
	givepoke REGISTEEL, 5
	closetext
	disappear TESTROOM_IRONBUNDLE
	end

Testroom_Latios:
	cry LATIOS
	opentext
	givepoke LATIOS, 5
	givepoke LATIAS, 5
	closetext
	disappear TESTROOM_LATIOS
	end

Testroom_Kyogre:
	cry KYOGRE
	opentext
	givepoke KYOGRE, 5
	closetext
	disappear TESTROOM_KYOGRE
	end

Testroom_Groudon:
	cry GROUDON
	opentext
	givepoke GROUDON, 5
	closetext
	disappear TESTROOM_GROUDON
	end

Testroom_Rayquaza:
	cry RAYQUAZA
	opentext
	givepoke RAYQUAZA, 5
	closetext
	disappear TESTROOM_RAYQUAZA
	end

Testroom_Jirachi:
	cry JIRACHI
	opentext
	givepoke JIRACHI, 5
	closetext
	disappear TESTROOM_JIRACHI
	end

Testroom_Candy:
	cry JIRACHI
	opentext
	writetext TestroomRareCandyText
	yesorno
	iffalse .Done
	verbosegiveitem RARE_CANDY, 99
	disappear TESTROOM_CANDY
	.Done
	closetext	
	end

Testroom_Guy:
	faceplayer
	opentext
	writetext WelcomeToTheTestroomText
	waitbutton
	closetext
	end

Testroom_Kris:
	faceplayer
	opentext

	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 

	writetext TestroomLevelcapsOffText
	yesorno
	iffalse .Done

	clearflag EVENT_LEVELCAPS_ENABLED
	setval 100
	writemem wLevelCap
	writetext TestroomlevelcapsDeactivatedText
	waitbutton
	sjump .Done

.SkipLevelCaps 
	writetext TestroomLevelcapsAlreadyOffText
	waitbutton

.Done
	closetext
	end

Testroom_Mom:
	faceplayer
	opentext

	checkevent EVENT_HARDMODE_ENABLED
	iftrue .AskTurnOffHardmode

	writetext TestroomHardmodeOnText
	yesorno
	iffalse .Done

	;turn on hard mode
	setevent EVENT_HARDMODE_ENABLED
	setval 0 ;yes, hardmode on == 0, this does seem backwards
	writemem wHardMode
	writetext TestroomHardmodeActivatedText
	waitbutton
	sjump .Done
	

.AskTurnOffHardmode
	writetext TestroomHardmodeOffText
	yesorno
	iffalse .Done

	;turn off hard mode
	writetext TestroomHardmodeTauntText
	waitbutton
	clearevent EVENT_HARDMODE_ENABLED
	setval 1
	writemem wHardMode
	writetext TestroomHardmodeDeactivatedText
	waitbutton
	sjump .Done

.Done
	closetext
	end

TestroomRareCandyText:
	text "Do you want"
	line "the RARE CANDY"
	cont "cheat?"
	done


TestroomHardmodeOnText:
	text "Do you want"
	line "to turn on"
	cont "Hardmode?"
	done

TestroomHardmodeOffText:
	text "Do you want"
	line "to turn off"
	cont "Hardmode?"
	done

TestroomHardmodeDeactivatedText:
	text "Hardmode"
	line "deactivated!"
	done

TestroomHardmodeActivatedText:
	text "Hardmode"
	line "activated!"
	done

TestroomlevelcapsDeactivatedText:
	text "Level Caps"
	line "deactivated!"
	done

TestroomHardmodeTauntText:
	text "Don't worry."

	para "I won't judge"
	line "you."

	para "..."

	para "Well, I'll"
	line "judge you a"
	cont "little..."
	done

TestroomLevelcapsAlreadyOffText:
	text "Your level caps"
	line "are already off."

	para "I've got nothing"
	line "for you."
	done

TestroomLevelcapsOffText:
	text "Do you want"
	line "to turn off"
	cont "Level Caps?"

	para "You won't be"
	line "able to turn"

	para "them back on."
	line "Ever..."
	done

WelcomeToTheTestroomText:
	text "Hi, welcome to"
	line "the TEST ROOM!"

	para "I keep stuff"
	line "here to test"
	cont "the game with."

	para "Using it is"
	line "technically"
	cont "a cheat."

	para "But I won't"
	line "tell on you."

	para "Have fun!"
	done

TestroomGetPokemonText:
	text "Would you like"
	line "a random party?"
	done

TestroomGenerateTeamScript:
	opentext
	writetext TestroomGetPokemonText
	promptbutton
	yesorno
	iffalse .Done
	
	scall TestroomGetStarter
	;scall TestroomGetBaby
	scall TestroomGetKantoMon
	scall TestroomGetJohtoMon
	scall TestroomGetHoennMon
	scall TestroomGetSingleStage
	scall TestroomGetAltMon
	
	.Done
	closetext
	end

TestroomGetStarter:	
	random 12
	ifequal 0, .Charmander
	ifequal 1, .Squirtle
	ifequal 2, .Bulbasaur
	ifequal 3, .Chikorita
	ifequal 4, .Cyndaquil
	ifequal 5, .Totodile
	ifequal 6, .Treecko
	ifequal 7, .Torchic
	ifequal 8, .Mudkip
	ifequal 9, .Honobea
	ifequal 10, .Kurusu
	ifequal 11, .Eevee
	ifequal 12, .Pikachu

.Charmander
	givepoke CHARMANDER, 5
	end
.Squirtle
	givepoke SQUIRTLE, 5
	end
.Bulbasaur
	givepoke BULBASAUR, 5
	end
.Chikorita
	givepoke CHIKORITA, 5
	end
.Cyndaquil
	givepoke CYNDAQUIL, 5
	end
.Totodile
	givepoke TOTODILE, 5
	end
.Treecko
	givepoke TREECKO, 5
	end
.Torchic
	givepoke TORCHIC, 5
	end
.Mudkip
	givepoke MUDKIP, 5
	end
.Honobea
	givepoke HONOBEA, 5
	end
.Kurusu
	givepoke KURUSU, 5
	end
.Eevee
	givepoke EEVEE, 5
	end
.Pikachu
	givepoke PIKACHU, 5
	end

TestroomGetBaby:
	random 10
	ifequal 0, .Pichu
	ifequal 1, .Cleffa
	ifequal 2, .Igglybuff
	ifequal 3, .Togepi
	ifequal 4, .Tyrogue
	ifequal 5, .Smoochum
	ifequal 6, .Elekid
	ifequal 7, .Magby
	ifequal 8, .Azurill
	ifequal 9, .Wynaut
	ifequal 10, .Munchlax

.Pichu
	givepoke PICHU, 5
	end
.Cleffa
	givepoke CLEFFA, 5
	end
.Igglybuff
	givepoke IGGLYBUFF, 5
	end
.Togepi
	givepoke TOGEPI, 5
	end
.Tyrogue
	givepoke TYROGUE, 5
	end
.Smoochum
	givepoke SMOOCHUM, 5
	end
.Elekid
	givepoke ELEKID, 5
	end
.Magby
	givepoke MAGBY, 5
	end
.Azurill
	givepoke AZURILL, 5
	end
.Wynaut
	givepoke WYNAUT, 5
	end
.Munchlax
	givepoke MUNCHLAX, 5
	end

TestroomGetKantoMon:
	random 36
	ifequal 0, .Caterpie
	ifequal 1, .Weedle
	ifequal 2, .Rattata
	ifequal 3, .Pidgey
	ifequal 4, .Spearow
	ifequal 5, .Ekans
	ifequal 6, .Sandshrew
	ifequal 7, .Zubat
	ifequal 8, .Oddish
	ifequal 9, .Paras
	ifequal 10, .Venonat
	ifequal 11, .Diglett
	ifequal 12, .Psyduck
	ifequal 13, .Mankey
	ifequal 14, .Tentacool
	ifequal 15, .Slowpoke
	ifequal 16, .Poliwag
	ifequal 17, .Abra
	ifequal 18, .Machop
	ifequal 19, .Geodude
	ifequal 20, .Ponyta
	ifequal 21, .Magnemite
	ifequal 22, .Seel
	ifequal 23, .Grimer
	ifequal 24, .Shellder
	ifequal 25, .Gastly
	ifequal 26, .Drowzee
	ifequal 27, .Krabby
	ifequal 28, .Voltorb
	ifequal 29, .Cubone
	ifequal 30, .Koffing
	ifequal 31, .Exeggcute
	ifequal 32, .Horsea
	ifequal 33, .Goldeen
	ifequal 34, .Staryu
	ifequal 35, .Porygon
	ifequal 36, .Omanyte

.Caterpie
	givepoke CATERPIE, 5
	end
.Weedle
	givepoke WEEDLE, 5
	end
.Rattata
	givepoke RATTATA, 5
	end
.Pidgey
	givepoke PIDGEY, 5
	end
.Spearow
	givepoke SPEAROW, 5
	end
.Ekans
	givepoke EKANS, 5
	end
.Sandshrew
	givepoke SANDSHREW, 5
	end
.Zubat
	givepoke ZUBAT, 5
	end
.Oddish
	givepoke ODDISH, 5
	end
.Paras
	givepoke PARAS, 5
	end
.Venonat
	givepoke VENONAT, 5
	end
.Diglett
	givepoke DIGLETT, 5
	end
.Psyduck
	givepoke PSYDUCK, 5
	end
.Mankey
	givepoke MANKEY, 5
	end
.Tentacool
	givepoke TENTACOOL, 5
	end
.Slowpoke
	givepoke SLOWPOKE, 5
	end
.Poliwag
	givepoke POLIWAG, 5
	end
.Abra
	givepoke ABRA, 5
	end
.Machop
	givepoke MACHOP, 5
	end
.Geodude
	givepoke GEODUDE, 5
	end
.Ponyta
	givepoke PONYTA, 5
	end
.Magnemite
	givepoke MAGNEMITE, 5
	end
.Seel
	givepoke SEEL, 5
	end
.Grimer
	givepoke GRIMER, 5
	end
.Shellder
	givepoke SHELLDER, 5
	end
.Gastly
	givepoke GASTLY, 5
	end
.Drowzee
	givepoke DROWZEE, 5
	end
.Krabby
	givepoke KRABBY, 5
	end
.Voltorb
	givepoke VOLTORB, 5
	end
.Cubone
	givepoke CUBONE, 5
	end
.Koffing
	givepoke KOFFING, 5
	end
.Exeggcute
	givepoke EXEGGCUTE, 5
	end
.Horsea
	givepoke HORSEA, 5
	end
.Goldeen
	givepoke GOLDEEN, 5
	end
.Staryu
	givepoke STARYU, 5
	end
.Porygon
	givepoke PORYGON, 5
	end
.Omanyte
	givepoke OMANYTE, 5
	end


TestroomGetJohtoMon:
	random 21
	ifequal 0, .Sentret
	ifequal 1, .Hoothoot
	ifequal 2, .Ledyba
	ifequal 3, .Spinarak
	ifequal 4, .Chinchou
	ifequal 5, .Natu
	ifequal 6, .Mareep
	ifequal 7, .Hoppip
	ifequal 8, .Sunkern
	ifequal 9, .Wooper
	ifequal 10, .Pineco
	ifequal 11, .Teddiursa
	ifequal 12, .Slugma
	ifequal 13, .Swinub
	ifequal 14, .Houndour
	ifequal 15, .Phanpy
	ifequal 16, .Gligar
	ifequal 17, .Snubbull
	ifequal 18, .Sneasel
	ifequal 19, .Girafarig
	ifequal 20, .Misdreavus
	ifequal 21, .Murkrow

.Sentret
	givepoke SENTRET, 5
	end
.Hoothoot
	givepoke HOOTHOOT, 5
	end
.Ledyba
	givepoke LEDYBA, 5
	end
.Spinarak
	givepoke SPINARAK, 5
	end
.Chinchou
	givepoke CHINCHOU, 5
	end
.Natu
	givepoke NATU, 5
	end
.Mareep
	givepoke MAREEP, 5
	end
.Hoppip
	givepoke HOPPIP, 5
	end
.Sunkern
	givepoke SUNKERN, 5
	end
.Wooper
	givepoke WOOPER, 5
	end
.Pineco
	givepoke PINECO, 5
	end
.Teddiursa
	givepoke TEDDIURSA, 5
	end
.Slugma
	givepoke SLUGMA, 5
	end
.Swinub
	givepoke SWINUB, 5
	end
.Houndour
	givepoke HOUNDOUR, 5
	end
.Phanpy
	givepoke PHANPY, 5
	end
.Gligar
	givepoke GLIGAR, 5
	end
.Snubbull
	givepoke SNUBBULL, 5
	end
.Sneasel
	givepoke SNEASEL, 5
	end
.Girafarig
	givepoke GIRAFARIG, 5
	end
.Misdreavus
	givepoke MISDREAVUS, 5
	end
.Murkrow
	givepoke MURKROW, 5
	end

TestroomGetHoennMon:
	random 36
	ifequal 0, .Poochyena
	ifequal 1, .Zigzagoon
	ifequal 2, .Wurmple
	ifequal 3, .Lotad
	ifequal 4, .Seedot
	ifequal 5, .Taillow
	ifequal 6, .Wingull
	ifequal 7, .Surskit
	ifequal 8, .Shroomish
	ifequal 9, .Nincada
	ifequal 10, .Whismur
	ifequal 11, .Makuhita
	ifequal 12, .Skitty
	ifequal 13, .Aron
	ifequal 14, .Meditite
	ifequal 15, .Electrike
	ifequal 16, .Ralts
	ifequal 17, .Slakoth
	ifequal 18, .Nosepass
	ifequal 19, .Roselia
	ifequal 20, .Gulpin
	ifequal 21, .Carvanha
	ifequal 22, .Wailmer
	ifequal 23, .Numel
	ifequal 24, .Spoink
	ifequal 25, .Trapinch
	ifequal 26, .Cacnea
	ifequal 27, .Swablu
	ifequal 28, .Barboach
	ifequal 29, .Corphish
	ifequal 30, .Baltoy
	ifequal 31, .Lileep
	ifequal 32, .Anorith
	ifequal 33, .Shuppet
	ifequal 34, .Duskull
	ifequal 35, .Snorunt
	ifequal 36, .Spheal


.Poochyena
	givepoke POOCHYENA, 5
	end
.Zigzagoon
	givepoke ZIGZAGOON, 5
	end
.Wurmple
	givepoke WURMPLE, 5
	end
.Lotad
	givepoke LOTAD, 5
	end
.Seedot
	givepoke SEEDOT, 5
	end
.Taillow
	givepoke TAILLOW, 5
	end
.Wingull
	givepoke WINGULL, 5
	end
.Surskit
	givepoke SURSKIT, 5
	end
.Shroomish
	givepoke SHROOMISH, 5
	end
.Nincada
	givepoke NINCADA, 5
	end
.Whismur
	givepoke WHISMUR, 5
	end
.Makuhita
	givepoke MAKUHITA, 5
	end
.Skitty
	givepoke SKITTY, 5
	end
.Aron
	givepoke ARON, 5
	end
.Meditite
	givepoke MEDITITE, 5
	end
.Electrike
	givepoke ELECTRIKE, 5
	end
.Ralts
	givepoke RALTS, 5
	end
.Slakoth
	givepoke SLAKOTH, 5
	end
.Nosepass
	givepoke NOSEPASS, 5
	end
.Roselia
	givepoke ROSELIA, 5
	end
.Gulpin
	givepoke GULPIN, 5
	end
.Carvanha
	givepoke CARVANHA, 5
	end
.Wailmer
	givepoke WAILMER, 5
	end
.Numel
	givepoke NUMEL, 5
	end
.Spoink
	givepoke SPOINK, 5
	end
.Trapinch
	givepoke TRAPINCH, 5
	end
.Cacnea
	givepoke CACNEA, 5
	end
.Swablu
	givepoke SWABLU, 5
	end
.Barboach
	givepoke BARBOACH, 5
	end
.Corphish
	givepoke CORPHISH, 5
	end
.Baltoy
	givepoke BALTOY, 5
	end
.Lileep
	givepoke LILEEP, 5
	end
.Anorith
	givepoke ANORITH, 5
	end
.Shuppet
	givepoke SHUPPET, 5
	end
.Duskull
	givepoke DUSKULL, 5
	end
.Snorunt
	givepoke SNORUNT, 5
	end
.Spheal
	givepoke SPHEAL, 5
	end


TestroomGetAltMon:
	random 20
	ifequal 0, .Agrimer
	ifequal 1, .Asandshrew
	ifequal 2, .Avulpix
	ifequal 3, .Ageodude
	ifequal 4, .Hvoltorb
	ifequal 5, .Voltorb2
	ifequal 6, .Exeggcute2
	ifequal 7, .Tentacool2
	ifequal 8, .Totodile2
	ifequal 9, .Cyndaquil2
	ifequal 10, .Sunbou
	ifequal 11, .Kotora
	ifequal 12, .Adiglett
	ifequal 13, .Hgrowlithe
	ifequal 14, .Gponyta
	ifequal 15, .Yanma2
	ifequal 16, .Vulpix2
	ifequal 17, .Abra2
	ifequal 18, .Haneei

.Agrimer
	givepoke AGRIMER, 5
	end
.Asandshrew
	givepoke ASANDSHREW, 5
	end
.Avulpix
	givepoke AVULPIX, 5
	end
.Ageodude
	givepoke AGEODUDE, 5
	end
.Hvoltorb
	givepoke HVOLTORB, 5
	end
.Voltorb2
	givepoke VOLTORB2, 5
	end
.Exeggcute2
	givepoke EXEGGCUTE2, 5
	end
.Tentacool2
	givepoke TENTACOOL2, 5
	end
.Totodile2
	givepoke TOTODILE2, 5
	end
.Cyndaquil2
	givepoke CYNDAQUIL2, 5
	end
.Sunbou
	givepoke SUNBOU, 5
	end
.Kotora
	givepoke KOTORA, 5
	end
.Adiglett
	givepoke ADIGLETT, 5
	end
.Hgrowlithe
	givepoke HGROWLITHE, 5
	end
.Gponyta
	givepoke GPONYTA, 5
	end
.Yanma2
	givepoke YANMA2, 5
	end
.Vulpix2
	givepoke VULPIX2, 5
	end
.Abra2
	givepoke ABRA2, 5
	end
.Haneei
	givepoke HANEEI, 5
	end


TestroomGetSingleStage:
	random 30
	ifequal 0, .Kangaskhan
	ifequal 1, .Pinsir
	ifequal 2, .Tauros
	ifequal 3, .Lapras
	ifequal 4, .Ditto
	ifequal 5, .Aerodactyl
	ifequal 6, .Unown
	ifequal 8, .Shuckle
	ifequal 9, .Heracross
	ifequal 10, .Corsola
	ifequal 11, .Delibird
	ifequal 12, .Skarmory
	ifequal 13, .Smeargle
	ifequal 14, .Miltank
	ifequal 15, .Sableye
	ifequal 16, .Mawile
	ifequal 17, .Torkoal
	ifequal 18, .Spinda
	ifequal 19, .Zangoose
	ifequal 20, .Seviper
	ifequal 21, .Lunatone
	ifequal 22, .Solrock
	ifequal 23, .Tropius
	ifequal 24, .Absol
	ifequal 25, .Relicanth
	ifequal 26, .Luvdisc
	ifequal 27, .Mantine
	ifequal 28, .Chimecho
	ifequal 29, .Sudowoodo
	ifequal 30, .Dunsparce

.Kangaskhan
	givepoke KANGASKHAN, 5
	end
.Pinsir
	givepoke PINSIR, 5
	end
.Tauros
	givepoke TAUROS, 5
	end
.Lapras
	givepoke LAPRAS, 5
	end
.Ditto
	givepoke DITTO, 5
	end
.Aerodactyl
	givepoke AERODACTYL, 5
	end
.Unown
	givepoke UNOWN, 5
	end
.Shuckle
	givepoke SHUCKLE, 5
	end
.Heracross
	givepoke HERACROSS, 5
	end
.Corsola
	givepoke CORSOLA, 5
	end
.Delibird
	givepoke DELIBIRD, 5
	end
.Skarmory
	givepoke SKARMORY, 5
	end
.Smeargle
	givepoke SMEARGLE, 5
	end
.Miltank
	givepoke MILTANK, 5
	end
.Sableye
	givepoke SABLEYE, 5
	end
.Mawile
	givepoke MAWILE, 5
	end
.Torkoal
	givepoke TORKOAL, 5
	end
.Spinda
	givepoke SPINDA, 5
	end
.Zangoose
	givepoke ZANGOOSE, 5
	end
.Seviper
	givepoke SEVIPER, 5
	end
.Lunatone
	givepoke LUNATONE, 5
	end
.Solrock
	givepoke SOLROCK, 5
	end
.Tropius
	givepoke TROPIUS, 5
	end
.Absol
	givepoke ABSOL, 5
	end
.Relicanth
	givepoke RELICANTH, 5
	end
.Luvdisc
	givepoke LUVDISC, 5
	end
.Mantine
	givepoke MANTINE, 5
	end
.Chimecho
	givepoke CHIMECHO, 5
	end
.Sudowoodo
	givepoke SUDOWOODO, 5
	end
.Dunsparce
	givepoke DUNSPARCE, 5
	end

TestRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 18, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 00, 01, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Gorochu, -1
	object_event 02, 01, SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Ironbubdle, -1
	;object_event 04, 01, SPRITE_REGISTEEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Testroom_Registeel, -1
	object_event 06, 01, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Latios, -1
	object_event 08, 01, SPRITE_KYOGRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Kyogre, -1
	object_event 10, 01, SPRITE_GROUDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Groudon, -1
	object_event 12, 01, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Testroom_Rayquaza, -1
	object_event 14, 01, SPRITE_JIRACHI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Jirachi, -1
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Testroom_Candy, -1
	object_event 19, 17, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Guy, -1
	object_event 15, 15, SPRITE_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Mom, -1
	object_event 14, 15, SPRITE_KRIS_BIKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Kris, -1
	object_event 16, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, TestroomGenerateTeamScript, -1
	