	db 0 ; species ID placeholder
	;BST: 600
	db 100, 134, 110,  61,  95, 100
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DARK ; type
	db 45 ; catch rate
	db 218 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/tyranitar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, TAUNT, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, DIG, MUD_SLAP, FIRE_BLAST, THIEF, FIRE_PUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG, ROCK_TOMB, DRAGON_CLAW, ANCIENTPOWER, SHADOW_CLAW, CUT, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
