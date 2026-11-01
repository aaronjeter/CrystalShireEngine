	db 0 ; species ID placeholder
	;BST: 600
	db 100, 100, 100, 100, 100, 100
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, GRASS ; type
	db 45 ; catch rate
	db 64 ; base exp
	dw NO_ITEM, LUM_BERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/celebi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, SHADOW_BALL, MUD_SLAP, SANDSTORM, SWIFT, DREAM_EATER, LIGHT_SCREEN, REFLECT, EARTHPOWER, FLASH
	; end
