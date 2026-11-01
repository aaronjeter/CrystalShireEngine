	db 0 ; species ID placeholder

	db  45,  60,  40,  45,  70,  50
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/torchic/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROAR, ROCK_SMASH, HYPER_BEAM, EARTHQUAKE, DIG, FIRE_BLAST, DRAIN_PUNCH, THUNDERPUNCH, FIRE_PUNCH, ROCK_TOMB, WILLOWISP, DRAGON_CLAW, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, POISON_JAB, SHADOW_CLAW, CUT, STRENGTH
	; end
