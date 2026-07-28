	db 0 ; species ID placeholder
	;BST 550
	db  70,  100, 135,  45, 65, 135
	evs  0,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 236 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/dusknoir/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm FOCUS_PUNCH, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, ROCK_TOMB, REST, ATTRACT, THIEF, STRENGTH, FLASH, ROCK_SMASH, ICE_PUNCH, WILLOWISP, BRICK_BREAK
	; end
