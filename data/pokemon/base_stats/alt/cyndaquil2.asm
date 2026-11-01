	db 0 ; species ID placeholder
	;BST: 309
	db  39,  60,  43,  65,  52,  50
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DARK ; type
	db 45 ; catch rate
	db 65 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cyndaquil2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, TAUNT, IRON_TAIL, EARTHQUAKE, DIG, MUD_SLAP, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, FURY_CUTTER, DRAGON_CLAW, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, SHADOW_CLAW, CUT, STRENGTH
	; end
