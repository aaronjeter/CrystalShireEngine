	db 0 ; species ID placeholder
	;BST: 534
	db  78,  109,  78, 100, 84,  85
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DARK ; type
	db 45 ; catch rate
	db 209 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/typhlosion2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, TAUNT, IRON_TAIL, EARTHQUAKE, DIG, MUD_SLAP, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, FURY_CUTTER, DRAGON_CLAW, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, SHADOW_CLAW, CUT, STRENGTH
	; end
