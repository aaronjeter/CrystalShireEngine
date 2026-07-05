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
	text "Oak: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to Kanto."

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
	text "Certain #mon"
	line "from Kanto could"
	cont "use this."
	done

OakLabDexCheckText:
	text "How is your #-"
	line "dex coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "Oak: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "Badges of Gyms in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "Mt.Silver."

	para "Mt.Silver is a big"
	line "mountain that is"

	para "home to many wild"
	line "#mon."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to Indigo"
	line "Plateau. You can"

	para "reach Mt.Silver"
	line "from there."
	done

OakNoKantoBadgesText:
	text "Oak: Hmm? You're"
	line "not collecting"
	cont "Badges?"

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "Oak: Ah, you're"
	line "collecting"
	cont "Gym Badges."

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
	text "The Prof's #mon"
	line "Talk radio program"

	para "isn't aired here"
	line "in Kanto."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "dex, the Prof's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but Prof.Oak'S"

	para "#mon Talk isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press Start to"
	line "open the Menu."
	done

OaksLabPoster2Text:
	text "The Save option is"
	line "on the Menu."

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

	para "Prof.Oak, how is"
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

	para "Elm in New Bark"
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
	iftrue OakCyndaquil2PokeBallScript

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
	iftrue OakTotodile2PokeBallScript

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
	iftrue OakChikorita2PokeBallScript

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

OakCyndaquil2PokeBallScript:	
	pokepic CYNDAQUIL2
	cry CYNDAQUIL2
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
	getmonname STRING_BUFFER_3, CYNDAQUIL2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL2, 5, BERRY
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

OakTotodile2PokeBallScript:	
	pokepic TOTODILE2
	cry TOTODILE2
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
	getmonname STRING_BUFFER_3, TOTODILE2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE2, 5, BERRY
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

OakChikorita2PokeBallScript:	
	pokepic CHIKORITA2
	cry CHIKORITA2
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
	getmonname STRING_BUFFER_3, CHIKORITA2
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA2, 5, BERRY
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
	cont "#mon too!"
	done

OakReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

OakPokeBallText:
	text "It contains a"
	line "#mon caught by"
	cont "Prof.Oak."
	done

OakTakeCharmanderText:
	text "Oak: Take"
	line "Charmander, the"
	cont "fire #mon?"
	done

OakTakeCyndaquilText:
	text "Oak: Take"
	line "Cyndaquil, the"
	cont "fire #mon?"
	done

OakTakeTorchicText:
	text "Oak: Take"
	line "Torchic, the"
	cont "fire #mon?"
	done

OakTakeAvulpixText:
	text "Oak: Take"
	line "Vulpix, the"
	cont "snow #mon?"
	done

OakTakeHonobeaText:
	text "Oak: Take"
	line "Honobea, the"
	cont "fire #mon?"
	done

OakTakeSquirtleText:
	text "Oak: Take"
	line "Squirtle, the"
	cont "water #mon?"
	done

OakTakeTotodileText:
	text "Oak: Take"
	line "Totodile, the"
	cont "water #mon?"
	done

OakTakeMudkipText:
	text "Oak: Take"
	line "Mudkip, the"
	cont "mud #mon?"
	done

OakTakeAsandshrewText:
	text "Oak: Take"
	line "Sandshrew, the"
	cont "mouse #mon?"
	done

OakTakeKotoraText:
	text "Oak: Take"
	line "Kotora, the"
	cont "tiger #mon?"
	done

OakTakeBulbasaurText:	
	text "Oak: Take"
	line "Bulbasaur, the"
	cont "grass #mon?"
	done

OakTakeChikoritaText:	
	text "Oak: Take"
	line "Chikorita, the"
	cont "grass #mon?"
	done

OakTakeTreeckoText:
	text "Oak: Take"
	line "Treecko, the"
	cont "grass #mon?"
	done

OakTakeAgrimerText:
	text "Oak: Take"
	line "Grimer, the"
	cont "poison #mon?"
	done

OakTakeKurusuText:	
	text "Oak: Take"
	line "Kurusu, the"
	cont "water #mon?"
	done

OakDirectionsText:
	text "Alright, now"
	line "it's time for"

	para "your #mon"
	line "adventure."

	para "You should"
	line "explore and"

	para "challenge gyms,"
	line "catch #mon."

	para "and try to have"
	line "fun!"

	para "Oh! And go"
	line "see Mr."
	cont "#mon sometime."

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
	