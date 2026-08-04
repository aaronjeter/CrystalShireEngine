	object_const_def
	const MIRAGETOWER_ROOT_FOSSIL
	const MIRAGETOWER_CLAW_FOSSIL
	const MIRAGETOWER_SCOPE_LENS

MirageTower_MapScripts:
	def_scene_scripts

	def_callbacks	

MirageTowerRootFossil:
	opentext
	verbosegiveitem ROOT_FOSSIL
	closetext
	earthquake 60
	disappear MIRAGETOWER_CLAW_FOSSIL
	disappear MIRAGETOWER_ROOT_FOSSIL
	end

MirageTowerClawFossil:
	opentext
	verbosegiveitem CLAW_FOSSIL
	closetext
	earthquake 60
	disappear MIRAGETOWER_CLAW_FOSSIL
	disappear MIRAGETOWER_ROOT_FOSSIL
	end

MirageTowerScopeLens:
	itemball SCOPE_LENS

MirageTower_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 09, 17, LAVARIDGE_DESERT, 6

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 07, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MirageTowerRootFossil, EVENT_GOT_MIRAGE_TOWER_FOSSIL
	object_event 12, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MirageTowerClawFossil, EVENT_GOT_MIRAGE_TOWER_FOSSIL
	object_event 05, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MirageTowerScopeLens, EVENT_GOT_HOENN_SCOPE_LENS
