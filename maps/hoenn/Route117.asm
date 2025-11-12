	object_const_def
	const MAPROUTE117_DYLAN
	const MAPROUTE117_ANNA
	const MAPROUTE117_MEG
	const MAPROUTE117_ISAAC
	const MAPROUTE117_MARIA
	const MAPROUTE117_DEREK
	const MAPROUTE117_BRANDI
	const MAPROUTE117_MELINA
	const MAPROUTE117_AISHA
	const MAPROUTE117_LYDIA
	

Route117_MapScripts:
	def_scene_scripts

	def_callbacks	

Route117DylanScript:
	trainer CAMPER, ROUTE117_DYLAN, EVENT_BEAT_ROUTE117_DYLAN, Route117DylanSeenText, Route117DylanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117DylanAfterBattleText
	waitbutton
	closetext
	end

Route117DylanSeenText:
	text "Hi"
	done

Route117DylanBeatenText:
	text "Aiyiyi!"
	done

Route117DylanAfterBattleText:
	text "Bye"
	done


Route117AnnaMegScript:
	trainer TWINS, ROUTE117_ANNAMEG, EVENT_BEAT_ROUTE117_ANNAMEG, Route117AnnaMegSeenText, Route117AnnaMegBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117AnnaMegAfterBattleText
	waitbutton
	closetext
	end

Route117AnnaMegSeenText:
	text "Hi"
	done

Route117AnnaMegBeatenText:
	text "Aiyiyi!"
	done

Route117AnnaMegAfterBattleText:
	text "Bye"
	done


Route117IsaacScript:
	trainer POKEFANM, ROUTE117_ISAAC, EVENT_BEAT_ROUTE117_ISAAC, Route117IsaacSeenText, Route117IsaacBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117IsaacAfterBattleText
	waitbutton
	closetext
	end

Route117IsaacSeenText:
	text "Hi"
	done

Route117IsaacBeatenText:
	text "Aiyiyi!"
	done

Route117IsaacAfterBattleText:
	text "Bye"
	done


Route117MariaScript:
	trainer PICNICKER, ROUTE117_MARIA, EVENT_BEAT_ROUTE117_MARIA, Route117MariaSeenText, Route117MariaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117MariaAfterBattleText
	waitbutton
	closetext
	end

Route117MariaSeenText:
	text "Hi"
	done

Route117MariaBeatenText:
	text "Aiyiyi!"
	done

Route117MariaAfterBattleText:
	text "Bye"
	done


Route117DerekScript:
	trainer BUG_CATCHER, ROUTE117_DEREK, EVENT_BEAT_ROUTE117_DEREK, Route117DerekSeenText, Route117DerekBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117DerekAfterBattleText
	waitbutton
	closetext
	end

Route117DerekSeenText:
	text "Hi"
	done

Route117DerekBeatenText:
	text "Aiyiyi!"
	done

Route117DerekAfterBattleText:
	text "Bye"
	done


Route117BrandiScript:
	trainer MEDIUM, ROUTE117_BRANDI, EVENT_BEAT_ROUTE117_BRANDI, Route117BrandiSeenText, Route117BrandiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117BrandiAfterBattleText
	waitbutton
	closetext
	end

Route117BrandiSeenText:
	text "Hi"
	done

Route117BrandiBeatenText:
	text "Aiyiyi!"
	done

Route117BrandiAfterBattleText:
	text "Bye"
	done


Route117MelinaScript:
	trainer PICNICKER, ROUTE117_MELINA, EVENT_BEAT_ROUTE117_MELINA, Route117MelinaSeenText, Route117MelinaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117MelinaAfterBattleText
	waitbutton
	closetext
	end

Route117MelinaSeenText:
	text "Hi"
	done

Route117MelinaBeatenText:
	text "Aiyiyi!"
	done

Route117MelinaAfterBattleText:
	text "Bye"
	done


Route117AishaScript:
	trainer BATTLE_GIRL, ROUTE117_AISHA, EVENT_BEAT_ROUTE117_AISHA, Route117AishaSeenText, Route117AishaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117AishaAfterBattleText
	waitbutton
	closetext
	end

Route117AishaSeenText:
	text "Hi"
	done

Route117AishaBeatenText:
	text "Aiyiyi!"
	done

Route117AishaAfterBattleText:
	text "Bye"
	done


Route117LydiaScript:
	trainer POKEFANF, ROUTE117_LYDIA, EVENT_BEAT_ROUTE117_LYDIA, Route117LydiaSeenText, Route117LydiaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route117LydiaAfterBattleText
	waitbutton
	closetext
	end

Route117LydiaSeenText:
	text "Hi"
	done

Route117LydiaBeatenText:
	text "Aiyiyi!"
	done

Route117LydiaAfterBattleText:
	text "Bye"
	done

Route117_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  32, 06, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route117DylanScript, -1
	object_event  50, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route117AnnaMegScript, -1
	object_event  51, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route117AnnaMegScript, -1
	object_event  48, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route117IsaacScript, -1
	object_event  22, 09, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route117MariaScript, -1
	object_event  17, 03, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route117DerekScript, -1
	object_event  11, 03, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, Route117BrandiScript, -1
	object_event  31, 06, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route117MelinaScript, -1
	object_event  26, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route117AishaScript, -1
	object_event  41, 09, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route117LydiaScript, -1
	