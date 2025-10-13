	db 0 ; species ID placeholder
	;BST: 580
	db  103,  76,  85, 120,  96, 100
	evs  0,   0,   0,   1,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, GHOST ; type
	db 75 ; catch rate
	db 178 ; base exp
	dw BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, FLAMETHROWER, SHADOW_BALL
	; end
