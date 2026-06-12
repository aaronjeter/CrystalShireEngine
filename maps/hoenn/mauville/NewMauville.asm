	object_const_def

NewMauville_MapScripts:
	def_scene_scripts

	def_callbacks

NewMauvilleMagnet:
	itemball MAGNET

NewMauvilleThunderstone:
	itemball THUNDERSTONE

NewMauvilleElixer:
	itemball ELIXER

NewMauville_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  25,  40, ROUTE_110, 1
	warp_event  37,  04, NEW_MAUVILLE_BASEMENT, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleMagnet, EVENT_GOT_HOENN_MAGNET
	object_event  19, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleThunderstone, EVENT_NEW_MAUVILLE_THUNDERSTONE
	object_event  33, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleElixer, EVENT_NEW_MAUVILLE_ELIXER
