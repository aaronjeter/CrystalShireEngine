	db 0 ; species ID placeholder
	;BST: 450
	db  75,  45, 135,  30,  75,  90
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC ; type
	db 255 ; catch rate
	db 108 ; base exp
	dw MAGNET, HARD_STONE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/nosepass/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, SANDSTORM, REST, ATTRACT, STRENGTH, ROCK_SMASH
	; end
