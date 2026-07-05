	object_const_def
	const BIRCHSLAB_BIRCH
	const BIRCHSLAB_POKE_BALL1
	const BIRCHSLAB_POKE_BALL2
	const BIRCHSLAB_POKE_BALL3

BirchsLab_MapScripts:
	def_scene_scripts

	def_callbacks	

ProfBirchScript:
	faceplayer
	opentext 
	writetext BirchNormalText
	waitbutton
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
	iftrue BirchAvulpixPokeBallScript

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
	iftrue BirchAsandshrewPokeBallScript

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
	iftrue BirchAgrimerPokeBallScript

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

BirchAvulpixPokeBallScript:
	pokepic AVULPIX
	cry AVULPIX
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeAvulpixText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, AVULPIX
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke AVULPIX, 5, BERRY
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

BirchAsandshrewPokeBallScript:	
	pokepic ASANDSHREW
	cry ASANDSHREW
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeAsandshrewText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ASANDSHREW
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ASANDSHREW, 5, BERRY
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

BirchAgrimerPokeBallScript:	
	pokepic AGRIMER
	cry AGRIMER
	waitbutton
	closepokepic
	opentext
	writetext BirchTakeAgrimerText
	yesorno
	iffalse BirchDidntChooseStarterScript
	disappear BIRCHSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext BirchChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, AGRIMER
	writetext BirchReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke AGRIMER, 5, BERRY
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
	setflag ENGINE_POKEDEX
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

BirchTakeAvulpixText:
	text "Birch: Take"
	line "Vulpix, the"
	cont "snow #mon?"
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

BirchTakeAsandshrewText:
	text "Birch: Take"
	line "Sandshrew, the"
	cont "mouse #mon?"
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

BirchTakeAgrimerText:
	text "Birch: Take"
	line "Grimer, the"
	cont "poison #mon?"
	done

BirchTakeKurusuText:	
	text "Birch: Take"
	line "Kurusu, the"
	cont "water #mon?"
	done


BirchDirectionsText:
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

BirchsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event 04, 07, LITTLEROOT_TOWN, 3
	warp_event 05, 07, LITTLEROOT_TOWN, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 05, 02, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfBirchScript, -1
	object_event 08, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchLeftPokeBallScript, EVENT_GOT_CYNDAQUIL_FROM_ELM
	object_event 09, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchMiddlePokeBallScript, EVENT_GOT_TOTODILE_FROM_ELM
	object_event 10, 01, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirchRightPokeBallScript, EVENT_GOT_CHIKORITA_FROM_ELM
	