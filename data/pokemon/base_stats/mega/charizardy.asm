	db 0 ; species ID placeholder
	;BST: 580
	db  78,  94,  78, 100, 130,  100
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/charizardy/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, HYPER_BEAM, IRON_TAIL, EARTHQUAKE, DIG, MUD_SLAP, SWIFT, THUNDERPUNCH, STEEL_WING, FIRE_PUNCH, ROCK_TOMB, WILLOWISP, AERIAL_ACE, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, SHADOW_CLAW, CUT, FLY, STRENGTH
	; end
