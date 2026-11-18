Route124_MapScripts:
	def_scene_scripts

	def_callbacks

Route124Declan:
	trainer SWIMMERM, ROUTE124_DECLAN, EVENT_BEAT_ROUTE124_DECLAN, Route124DeclanSeenText, Route124DeclanBeatenText, 0, .Script

.Script:
	trainerafter Route124DeclanAfterBattleText

Route124DeclanSeenText:
	text "The open sea is"
	line "my training pool!"
	done

Route124DeclanBeatenText:
	text "I got swamped!"
	done

Route124DeclanAfterBattleText:
	text "Mossdeep's a long"
	line "swim from shore."

	para "Rest on the islets"
	line "if you need to."
	done

Route124Grace:
	trainer SWIMMERF, ROUTE124_GRACE, EVENT_BEAT_ROUTE124_GRACE, Route124GraceSeenText, Route124GraceBeatenText, 0, .Script

.Script:
	trainerafter Route124GraceAfterBattleText

Route124GraceSeenText:
	text "The water's so"
	line "clear out here!"

	para "Let's battle!"
	done

Route124GraceBeatenText:
	text "Glub..."
	done

Route124GraceAfterBattleText:
	text "On a calm day you"
	line "can see the sea"
	cont "floor from here."
	done

Route124KaiLea:
	trainer SWIMMERS, KAIANDLEA, EVENT_BEAT_ROUTE124_KAI_LEA, Route124KaiLeaSeenText, Route124KaiLeaBeatenText, 0, .Script

.Script:
	trainerafter Route124KaiLeaAfterBattleText

Route124KaiLeaSeenText:
	text "Kai: We swim"
	line "together and we"
	cont "battle together!"
	done

Route124KaiLeaBeatenText:
	text "Lea: We sank..."
	done

Route124KaiLeaAfterBattleText:
	text "Kai: Next time"
	line "we'll stay afloat!"
	done

Route124Carlos:
	trainer FISHER, ROUTE124_CARLOS, EVENT_BEAT_ROUTE124_CARLOS, Route124CarlosSeenText, Route124CarlosBeatenText, 0, .Script

.Script:
	trainerafter Route124CarlosAfterBattleText

Route124CarlosSeenText:
	text "Shh! Something big"
	line "is biting!"

	para "...Oh, it's you."
	done

Route124CarlosBeatenText:
	text "My line snapped!"
	done

Route124CarlosAfterBattleText:
	text "Big #mon live"
	line "in deep water."

	para "You never know"
	line "what you'll hook."
	done

Route124BigPearl:
	itemball BIG_PEARL

Route124Carbos:
	itemball CARBOS

Route124HiddenPearl:
	hiddenitem PEARL, EVENT_ROUTE_124_HIDDEN_PEARL

Route124_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 17, 21, BGEVENT_ITEM, Route124HiddenPearl

	def_object_events
	object_event 30, 22, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, Route124Declan, -1
	object_event 48, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, Route124Grace, -1
	object_event 27, 29, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route124KaiLea, -1
	object_event 27, 30, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route124KaiLea, -1
	object_event 38, 30, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route124Carlos, -1
	object_event 38, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route124BigPearl, EVENT_ROUTE_124_BIG_PEARL
	object_event 14, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route124Carbos, EVENT_ROUTE_124_CARBOS
