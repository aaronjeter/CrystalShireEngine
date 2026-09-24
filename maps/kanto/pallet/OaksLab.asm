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
	opendialog OAK

	checkevent EVENT_START_KANTO
	iftrue .OakKantoScript

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
	closedialog
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

.OakKantoScript:
	checkevent EVENT_GOT_A_POKEMON
	iffalse .OakPickStarter

	checkevent EVENT_FOUND_ROUTE22_GREEN
	iffalse .OakFindGreen

	checkflag ENGINE_POKEDEX
	iffalse .OakGivePokedex

	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedexKanto
	
	readvar VAR_BADGES
	ifgreater 15, .OpenMtSilverKanto
	ifequal 0, .ComplainKanto
	sjump .AhGoodKanto

	;failsafe
	writetext OakLabGoodbyeText
	waitbutton
	sjump .done


.OakPickStarter
	opentext
	writetext OakText_PickAPokemon
	waitbutton
	sjump .done

.OakFindGreen
	opentext
	writetext OakDirectionsText
	waitbutton
	sjump .done

.OakGivePokedex
	opentext
	writetext OakGivePokedexText
	waitbutton
	setflag ENGINE_POKEDEX
	sjump .done

.ComplainKanto:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedexKanto

.AhGoodKanto:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedexKanto

.OpenMtSilverKanto:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER

.CheckPokedexKanto:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	sjump .done

.done
	closedialog
	end


OakText_PickAPokemon:
	text "Ah, <PLAY_G>!"

	para "I could really"
	line "use your help"
	cont "with something."

	para "I can't find my"
	line "assistant, Green."

	para "Can you take a"
	line "#mon from the"
	cont "table and go"
	cont "find her?"

	para "I expect she's"
	line "over on Route 22"
	cont "West of Viridian"
	cont "City."
	done


OakDirectionsText:
	text "Alright, now head"
	line "North and find"
	cont "Green for me."

	para "I'm pretty sure"
	line "she's up by"
	cont "Viridian City."

	para "It's straight"
	line "North from here."
	done

OakGivePokedexText:
	text "Oak: Welcome"
	line "back <PLAY_G>!"

	para "Thanks for finding"
	line "Green for me."

	para "I've got something"
	line "for you."

	para "This is a #dex."
	line "It'a a type of"
	cont "encyclopedia."

	para "It records data"
	line "on #mon you"
	cont "encounter."

	para "You should take"
	line "it with you when"
	cont "you leave town."

	para "There's a whole"
	line "world out there,"
	cont "<PLAY_G>..."

	para "If I were you,"
	line "I would try to"
	cont "collect the Gym"
	cont "badges of Kanto."

	para "Catch as many"
	line "#mon as you"
	cont "can and fill that"
	cont "#dex!"
	done

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

	para "Elm in New Bark"
	line "TOWN 8-)"
	done


OakLeftPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON
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
	iftrue OakLittenPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakCyndaquil2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakHonobeaPokeBallScript

OakMiddlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON
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
	iftrue OakPopplioPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakTotodile2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakKurusuPokeBallScript

OakRightPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON
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
	iftrue OakRowletPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue OakChikorita2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue OakKotoraPokeBallScript


OakCharmanderPokeBallScript:
	openpokedialog CHARMANDER
	cry CHARMANDER	
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
	closedialog
	sjump OakDirectionsScript

OakCyndaquilPokeBallScript:	
	openpokedialog CYNDAQUIL
	cry CYNDAQUIL	
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
	closedialog
	sjump OakDirectionsScript

OakTorchicPokeBallScript:
	openpokedialog TORCHIC
	cry TORCHIC
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
	closedialog
	sjump OakDirectionsScript

OakLittenPokeBallScript:
	openpokedialog LITTEN
	cry LITTEN
	writetext OakTakeLittenText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, LITTEN
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke LITTEN, 5, BERRY
	closedialog
	sjump OakDirectionsScript

OakCyndaquil2PokeBallScript:	
	openpokedialog CYNDAQUIL2
	cry CYNDAQUIL2
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
	closedialog
	sjump OakDirectionsScript

OakHonobeaPokeBallScript:	
	openpokedialog HONOBEA
	cry HONOBEA
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
	closedialog
	sjump OakDirectionsScript

OakSquirtlePokeBallScript:		
	openpokedialog SQUIRTLE
	cry SQUIRTLE
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
	closedialog
	sjump OakDirectionsScript

OakTotodilePokeBallScript:	
	openpokedialog TOTODILE
	cry TOTODILE
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
	closedialog
	sjump OakDirectionsScript

OakMudkipPokeBallScript:	
	openpokedialog MUDKIP
	cry MUDKIP
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
	closedialog
	sjump OakDirectionsScript

OakPopplioPokeBallScript:	
	openpokedialog POPPLIO
	cry POPPLIO
	writetext OakTakePopplioText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, POPPLIO
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke POPPLIO, 5, BERRY
	closedialog
	sjump OakDirectionsScript

OakTotodile2PokeBallScript:	
	openpokedialog TOTODILE2
	cry TOTODILE2
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
	closedialog
	sjump OakDirectionsScript

OakKotoraPokeBallScript:
	openpokedialog KOTORA
	cry KOTORA
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
	closedialog
	sjump OakDirectionsScript

OakBulbasaurPokeBallScript:	
	openpokedialog BULBASAUR
	cry BULBASAUR
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
	closedialog
	sjump OakDirectionsScript

OakChikoritaPokeBallScript:	
	openpokedialog CHIKORITA
	cry CHIKORITA
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
	closedialog
	sjump OakDirectionsScript

OakTreeckoPokeBallScript:	
	openpokedialog TREECKO
	cry TREECKO
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
	closedialog
	sjump OakDirectionsScript

OakRowletPokeBallScript:	
	openpokedialog ROWLET
	cry ROWLET
	writetext OakTakeRowletText
	yesorno
	iffalse OakDidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext OakChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ROWLET
	writetext OakReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ROWLET, 5, BERRY
	closedialog
	sjump OakDirectionsScript

OakChikorita2PokeBallScript:	
	openpokedialog CHIKORITA2
	cry CHIKORITA2
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
	closedialog
	sjump OakDirectionsScript

OakKurusuPokeBallScript:	
	openpokedialog KURUSU
	cry KURUSU
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
	closedialog
	sjump OakDirectionsScript


OakDirectionsScript:
	opendialog OAK
	writetext OakDirectionsText
	waitbutton
	verbosegiveitem BIRD_WHISTLE
	waitbutton
	verbosegiveitem POKE_BALL, 5
	closedialog
	setevent EVENT_GOT_A_POKEMON
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end


OakDidntChooseStarterScript:
	writetext OakDidntChooseStarterText
	waitbutton
	closedialog
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

OakTakeLittenText:
	text "Oak: Take"
	line "Litten, the"
	cont "fire #mon?"
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

OakTakePopplioText:
	text "Oak: Take"
	line "Popplio, the"
	cont "water #mon?"
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

OakTakeRowletText:
	text "Oak: Take"
	line "Rowlet, the"
	cont "grass #mon?"
	done

OakTakeKurusuText:	
	text "Oak: Take"
	line "Kurusu, the"
	cont "water #mon?"
	done

OaksLab_WelcomeScript:
	checkevent EVENT_GOT_A_POKEMON
	iftrue .done
	showemote EMOTE_SHOCK, OAKSLAB_OAK, 15
	applymovement PLAYER, OaksLab_StepUpMovement
	opentext
	writetext OakText_PickAPokemon
	waitbutton
	closetext
.done
	end

OaksLab_StepUpMovement:
	step UP
	step UP
	step_end

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events
	coord_event  04,  06, -1, OaksLab_WelcomeScript
	coord_event  05,  06, -1, OaksLab_WelcomeScript

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
	