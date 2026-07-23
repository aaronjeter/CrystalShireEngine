	object_const_def
	const BIRCHSLAB_BIRCH
	const BIRCHSLAB_POKE_BALL1
	const BIRCHSLAB_POKE_BALL2
	const BIRCHSLAB_POKE_BALL3

BirchsLab_MapScripts:
	def_scene_scripts

	def_callbacks	

BirchsLab_WelcomeScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .done
	showemote EMOTE_SHOCK, BIRCHSLAB_BIRCH, 15
	applymovement PLAYER, BirchsLab_StepUpMovement
	opentext
	writetext BirchText_PickAPokemon
	waitbutton
	closetext
.done
	end

BirchText_PickAPokemon:
	text "Hey <PLAY_G>!"

	para "I could really"
	line "use your help"
	cont "with something."

	para "I can't find my"
	line "assistant, Wally."

	para "Can you take a"
	line "#mon from the"
	cont "table and go"
	cont "find him?"
	done

BirchsLab_StepUpMovement:
	step UP
	step_end

ProfBirchScript:
	faceplayer

	checkevent EVENT_START_HOENN
	iffalse .BirchNotHoenn

	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .BirchPickStarter

	checkevent EVENT_FOUND_ROUTE103_WALLY
	iffalse .BirchFindWally

	checkevent ENGINE_POKEDEX
	iffalse .BirchGivePokedex

.BirchNotHoenn
	opentext 
	writetext BirchNormalText
	waitbutton
	sjump .done

.BirchPickStarter
	opentext
	writetext BirchText_PickAPokemon
	sjump .done

.BirchFindWally
	opentext
	writetext BirchDirectionsText
	sjump .done

.BirchGivePokedex
	opentext
	writetext BirchGivePokedexText
	setflag ENGINE_POKEDEX

.done
	closetext
	end

BirchNormalText:
	text "Hey <PLAY_G>."

	para "I hope you're"
	line "enjoying Hoenn!"
	done


BirchLeftPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtBirchPokeBallScript

	turnobject BIRCHSLAB_BIRCH, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue BirchCharmanderPokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue BirchCyndaquilPokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue BirchTorchicPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue BirchLittenPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue BirchCyndaquil2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue BirchHonobeaPokeBallScript

BirchMiddlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtBirchPokeBallScript

	turnobject BIRCHSLAB_BIRCH, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue BirchSquirtlePokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue BirchTotodilePokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue BirchMudkipPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue BirchPopplioPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue BirchTotodile2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue BirchKurusuPokeBallScript

BirchRightPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtBirchPokeBallScript

	turnobject BIRCHSLAB_BIRCH, DOWN
	reanchormap

	checkevent EVENT_ORIGIN_KANTO
	iftrue BirchBulbasaurPokeBallScript
	
	checkevent EVENT_ORIGIN_JOHTO
	iftrue BirchChikoritaPokeBallScript

	checkevent EVENT_ORIGIN_HOENN
	iftrue BirchTreeckoPokeBallScript

	checkevent EVENT_ORIGIN_ALOLA
	iftrue BirchRowletPokeBallScript

	checkevent EVENT_ORIGIN_REDDIT
	iftrue BirchChikorita2PokeBallScript

	checkevent EVENT_ORIGIN_BETA
	iftrue BirchKotoraPokeBallScript


BirchCharmanderPokeBallScript:
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeCharmanderText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHARMANDER, 5, BERRY
	closetext	
	sjump BirchDirectionsScript

BirchCyndaquilPokeBallScript:	
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeCyndaquilText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchTorchicPokeBallScript:
	pokepic TORCHIC
	cry TORCHIC
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeTorchicText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TORCHIC
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TORCHIC, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchLittenPokeBallScript:
	pokepic LITTEN
	cry LITTEN
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeLittenText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, LITTEN
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke LITTEN, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchCyndaquil2PokeBallScript:	
	pokepic CYNDAQUIL2
	cry CYNDAQUIL2
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeCyndaquilText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL2
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL2, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchHonobeaPokeBallScript:	
	pokepic HONOBEA
	cry HONOBEA
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeHonobeaText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, HONOBEA
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke HONOBEA, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchSquirtlePokeBallScript:	
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeSquirtleText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SQUIRTLE, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchTotodilePokeBallScript:	
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeTotodileText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchMudkipPokeBallScript:	
	pokepic MUDKIP
	cry MUDKIP
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeMudkipText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, MUDKIP
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke MUDKIP, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchPopplioPokeBallScript:	
	pokepic POPPLIO
	cry POPPLIO
	waitbutton
	closepokepic
	opentext
	writetext BirchTakePopplioText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, POPPLIO
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke POPPLIO, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchTotodile2PokeBallScript:	
	pokepic TOTODILE2
	cry TOTODILE2
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeTotodileText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE2
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE2, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchKotoraPokeBallScript:
	pokepic KOTORA
	cry KOTORA
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeKotoraText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, KOTORA
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke KOTORA, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchBulbasaurPokeBallScript:	
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeBulbasaurText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke BULBASAUR, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchChikoritaPokeBallScript:	
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeChikoritaText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchTreeckoPokeBallScript:	
	pokepic TREECKO
	cry TREECKO
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeTreeckoText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TREECKO
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TREECKO, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchRowletPokeBallScript:	
	pokepic ROWLET
	cry ROWLET
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeRowletText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ROWLET
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ROWLET, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchChikorita2PokeBallScript:	
	pokepic CHIKORITA2
	cry CHIKORITA2
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeChikoritaText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA2
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA2, 5, BERRY
	closetext
	sjump BirchDirectionsScript

BirchKurusuPokeBallScript:	
	pokepic KURUSU
	cry KURUSU
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeKurusuText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, KURUSU
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke KURUSU, 5, BERRY
	closetext
	sjump BirchDirectionsScript



BirchDirectionsScript:
	opentext
	writetext BirchDirectionsText
	waitbutton
	verbosegiveitem BIRD_WHISTLE
	waitbutton
	verbosegiveitem POKE_BALL, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_NOOP
	end


BirchDidntChooseStarterScript:
	writetext BirchDidntChooseStarterText
	waitbutton
	closetext
	end


LookAtBirchPokeBallScript:
	opentext
	writetext BirchPokeBallText
	waitbutton
	closetext
	end

BirchDidntChooseStarterText:
	text "Birch: Think it"
	line "over carefully."

	para "Your partner is"
	line "important."
	done

BirchChoseStarterText:
	text "Birch: I think"
	line "that's a great"
	cont "#mon too!"
	done

BirchReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

BirchPokeBallText:
	text "It contains a"
	line "#mon caught by"
	cont "Prof.Birch."
	done

BirchTakeCharmanderText:
	text "Birch: Take"
	line "Charmander, the"
	cont "fire #mon?"
	done

BirchTakeCyndaquilText:
	text "Birch: Take"
	line "Cyndaquil, the"
	cont "fire #mon?"
	done

BirchTakeTorchicText:
	text "Birch: Take"
	line "Torchic, the"
	cont "fire #mon?"
	done

BirchTakeLittenText:
	text "Birch: Take"
	line "Litten, the"
	cont "fire #mon?"
	done

BirchTakeHonobeaText:
	text "Birch: Take"
	line "Honobea, the"
	cont "fire #mon?"
	done

BirchTakeSquirtleText:
	text "Birch: Take"
	line "Squirtle, the"
	cont "water #mon?"
	done

BirchTakeTotodileText:
	text "Birch: Take"
	line "Totodile, the"
	cont "water #mon?"
	done

BirchTakeMudkipText:
	text "Birch: Take"
	line "Mudkip, the"
	cont "mud #mon?"
	done

BirchTakePopplioText:
	text "Birch: Take"
	line "Popplio, the"
	cont "water #mon?"
	done

BirchTakeKotoraText:
	text "Birch: Take"
	line "Kotora, the"
	cont "tiger #mon?"
	done

BirchTakeBulbasaurText:	
	text "Birch: Take"
	line "Bulbasaur, the"
	cont "grass #mon?"
	done

BirchTakeChikoritaText:	
	text "Birch: Take"
	line "Chikorita, the"
	cont "grass #mon?"
	done

BirchTakeTreeckoText:
	text "Birch: Take"
	line "Treecko, the"
	cont "grass #mon?"
	done

BirchTakeRowletText:
	text "Birch: Take"
	line "Rowlet, the"
	cont "grass #mon?"
	done

BirchTakeKurusuText:	
	text "Birch: Take"
	line "Kurusu, the"
	cont "water #mon?"
	done


BirchDirectionsText:
	text "Alright, now head"
	line "North and find"
	cont "Wally for me."

	para "I'm pretty sure"
	line "he's up by"
	cont "Oldale Town."

	para "It's straight"
	line "North from here."
	done

BirchGivePokedexText:
	text "Birch: Welcome"
	line "back <PLAY_G>!"

	para "Thanks for finding"
	line "Wally for me."

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
	cont "badges of Hoenn."
	done

BirchsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event 04, 07, LITTLEROOT_TOWN, 3
	warp_event 05, 07, LITTLEROOT_TOWN, 3

	def_coord_events
	coord_event  04,  04, -1, BirchsLab_WelcomeScript
	coord_event  05,  04, -1, BirchsLab_WelcomeScript

	def_bg_events	

	def_object_events
	object_event 05, 02, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfBirchScript, -1
	object_event 08, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchLeftPokeBallScript, EVENT_GOT_CYNDAQUIL_FROM_ELM
	object_event 09, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchMiddlePokeBallScript, EVENT_GOT_TOTODILE_FROM_ELM
	object_event 10, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchRightPokeBallScript, EVENT_GOT_CHIKORITA_FROM_ELM
	