	db 0 ; species ID placeholder
	;BST: 300
	db  60,  80,  50,  30,  40,  40
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FAIRY ; type
	db 190 ; catch rate
	db 63 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/snubbull/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, TAUNT, EARTHQUAKE, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SLUDGE_BOMB, THUNDERPUNCH, THIEF, FIRE_PUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG, POISON_FANG, BRICK_BREAK, ROCK_SLIDE, STRENGTH, THUNDERBOLT
	; end
