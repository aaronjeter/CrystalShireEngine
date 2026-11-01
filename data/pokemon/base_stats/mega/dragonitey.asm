	db 0 ; species ID placeholder
	;BST: 650
	db  91, 85, 100, 120, 134, 120
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/dragonitey/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, BODY_SLAM, BLIZZARD, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, EARTHQUAKE, MUD_SLAP, ICE_PUNCH, SANDSTORM, FIRE_BLAST, SWIFT, THUNDERPUNCH, STEEL_WING, FIRE_PUNCH, SHOCK_WAVE, AERIAL_ACE, BUBBLEBEAM, BRICK_BREAK, ROCK_SLIDE, FLY, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
