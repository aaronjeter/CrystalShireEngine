	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton	
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifgreater 15, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakGiveKantoiteText:
	text "oh, <PLAY_G>."

	para "Prof. Elm said"
	line "you might have a"
	cont "use for this."
	done

OakExplainsKantoiteText:
	text "Certain #MON"
	line "from KANTO could"
	cont "use this."
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done


OakLeftPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtOakPokeBallScript

	turnobject OAKSLAB_OAK, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue OakCharmanderPokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue OakCyndaquilPokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue OakTorchicPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue OakAvulpixPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakAbra2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakHonobeaPokeBallScript

OakMiddlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtOakPokeBallScript

	turnobject OAKSLAB_OAK, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue OakSquirtlePokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue OakTotodilePokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue OakMudkipPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue OakAsandshrewPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakVoltorb2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakKurusuPokeBallScript

OakRightPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtOakPokeBallScript

	turnobject OAKSLAB_OAK, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue OakBulbasaurPokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue OakChikoritaPokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue OakTreeckoPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue OakAgrimerPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakExeggcutePokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakKotoraPokeBallScript


OakCharmanderPokeBallScript:
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext OakTakeCharmanderText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHARMANDER, 5, BERRY
	closetext	
	sjump OakDirectionsScript

OakCyndaquilPokeBallScript:	
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext OakTakeCyndaquilText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakTorchicPokeBallScript:
	pokepic TORCHIC
	cry TORCHIC
	waitbutton
	closepokepic
	opentext
	writetext OakTakeTorchicText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TORCHIC
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TORCHIC, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakAvulpixPokeBallScript:
	pokepic AVULPIX
	cry AVULPIX
	waitbutton
	closepokepic
	opentext
	writetext OakTakeAvulpixText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, AVULPIX
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke AVULPIX, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakAbra2PokeBallScript:	
	pokepic ABRA2
	cry ABRA2
	waitbutton
	closepokepic
	opentext
	writetext OakTakeAbra2Text
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ABRA2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ABRA2, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakVulpix2PokeBallScript:	
	pokepic VULPIX2
	cry VULPIX2
	waitbutton
	closepokepic
	opentext
	writetext OakTakeVulpix2Text
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, VULPIX2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke VULPIX2, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakHonobeaPokeBallScript:	
	pokepic HONOBEA
	cry HONOBEA
	waitbutton
	closepokepic
	opentext
	writetext OakTakeHonobeaText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, HONOBEA
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke HONOBEA, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakSquirtlePokeBallScript:	
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext OakTakeSquirtleText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakTotodilePokeBallScript:	
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext OakTakeTotodileText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakMudkipPokeBallScript:	
	pokepic MUDKIP
	cry MUDKIP
	waitbutton
	closepokepic
	opentext
	writetext OakTakeMudkipText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, MUDKIP
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke MUDKIP, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakAsandshrewPokeBallScript:	
	pokepic ASANDSHREW
	cry ASANDSHREW
	waitbutton
	closepokepic
	opentext
	writetext OakTakeAsandshrewText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ASANDSHREW
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ASANDSHREW, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakVoltorb2PokeBallScript:	
	pokepic VOLTORB2
	cry VOLTORB2
	waitbutton
	closepokepic
	opentext
	writetext OakTakeVoltorbText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, VOLTORB2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke VOLTORB2, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakKotoraPokeBallScript:
	pokepic KOTORA
	cry KOTORA
	waitbutton
	closepokepic
	opentext
	writetext OakTakeKotoraText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, KOTORA
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke KOTORA, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakBulbasaurPokeBallScript:	
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext OakTakeBulbasaurText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakChikoritaPokeBallScript:	
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext OakTakeChikoritaText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakTreeckoPokeBallScript:	
	pokepic TREECKO
	cry TREECKO
	waitbutton
	closepokepic
	opentext
	writetext OakTakeTreeckoText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TREECKO
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TREECKO, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakAgrimerPokeBallScript:	
	pokepic AGRIMER
	cry AGRIMER
	waitbutton
	closepokepic
	opentext
	writetext OakTakeAgrimerText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, AGRIMER
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke AGRIMER, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakExeggcutePokeBallScript:	
	pokepic EXEGGCUTE2
	cry EXEGGCUTE2
	waitbutton
	closepokepic
	opentext
	writetext OakTakeExeggcuteText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, EXEGGCUTE2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke EXEGGCUTE2, 5, BERRY
	closetext
	sjump OakDirectionsScript

OakKurusuPokeBallScript:	
	pokepic KURUSU
	cry KURUSU
	waitbutton
	closepokepic
	opentext
	writetext OakTakeKurusuText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, KURUSU
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke KURUSU, 5, BERRY
	closetext
	sjump OakDirectionsScript


OakDirectionsScript:
	opentext
	writetext OakDirectionsText
	waitbutton
	verbosegiveitem BIRD_WHISTLE
	waitbutton
	verbosegiveitem POKE_BALL, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setflag ENGINE_POKEDEX
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end


OakDidntChooseStarterScript:
	writetext OakDidntChooseStarterText
	waitbutton
	closetext
	end


LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end

OakDidntChooseStarterText:
	text "Oak: Think it"
	line "over carefully."

	para "Your partner is"
	line "important."
	done

OakChoseStarterText:
	text "Oak: I think"
	line "that's a great"
	cont "#MON too!"
	done

OakReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

OakPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.Oak."
	done

OakTakeCharmanderText:
	text "Oak: Take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

OakTakeCyndaquilText:
	text "Oak: Take"
	line "CYNDAQUIL, the"
	cont "fire #MON?"
	done

OakTakeTorchicText:
	text "Oak: Take"
	line "TORCHIC, the"
	cont "fire #MON?"
	done

OakTakeAvulpixText:
	text "Oak: Take"
	line "VULPIX, the"
	cont "snow #MON?"
	done

OakTakeVulpix2Text:
	text "Oak: Take"
	line "Vulpix, the"
	cont "steam #MON?"
	done

OakTakeAbra2Text:
	text "Oak: Take"
	line "Abra, the"
	cont "magician #MON?"
	done

OakTakeHonobeaText:
	text "Oak: Take"
	line "Honobea, the"
	cont "fire #MON?"
	done

OakTakeSquirtleText:
	text "Oak: Take"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

OakTakeTotodileText:
	text "Oak: Take"
	line "TOTODILE, the"
	cont "water #MON?"
	done

OakTakeMudkipText:
	text "Oak: Take"
	line "MUDKIP, the"
	cont "mud #MON?"
	done

OakTakeAsandshrewText:
	text "Oak: Take"
	line "SANDSHREW, the"
	cont "mouse #MON?"
	done

OakTakeVoltorbText:
	text "Oak: Take"
	line "VOLTORB, the"
	cont "orb #MON?"
	done

OakTakeKotoraText:
	text "Oak: Take"
	line "KOTORA, the"
	cont "tiger #MON?"
	done

OakTakeBulbasaurText:	
	text "Oak: Take"
	line "BULBASAUR, the"
	cont "grass #MON?"
	done

OakTakeChikoritaText:	
	text "Oak: Take"
	line "CHIKORITA, the"
	cont "grass #MON?"
	done

OakTakeTreeckoText:
	text "Oak: Take"
	line "TREECKO, the"
	cont "grass #MON?"
	done

OakTakeAgrimerText:
	text "Oak: Take"
	line "GRIMER, the"
	cont "poison #MON?"
	done

OakTakeExeggcuteText:	
	text "Oak: Take"
	line "EXEGGCUTE, the"
	cont "grass #MON?"
	done

OakTakeKurusuText:	
	text "Oak: Take"
	line "KURUSU, the"
	cont "water #MON?"
	done

OakDirectionsText:
	text "Alright, now"
	line "it's time for"

	para "your #MON"
	line "adventure."

	para "You should"
	line "explore and"

	para "challenge gyms,"
	line "catch #MON."

	para "and try to have"
	line "fun!"

	para "Oh! And go"
	line "see Mr."
	cont "#MON sometime."

	para "He lives around"
	line "Cherrywood Town"
	cont "in Johto."
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	object_event 06, 03, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakLeftPokeBallScript, EVENT_GOT_CYNDAQUIL_FROM_ELM
	object_event 07, 03, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakMiddlePokeBallScript, EVENT_GOT_TOTODILE_FROM_ELM
	object_event 08, 03, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakRightPokeBallScript, EVENT_GOT_CHIKORITA_FROM_ELM
	