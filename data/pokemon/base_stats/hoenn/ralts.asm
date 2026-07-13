	db 0 ; species ID placeholder
	;BST: 198
	db  28,  25,  25,  40,  45,  35
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 235 ; catch rate
	db 70 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ralts/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REST, ATTRACT, THIEF, FLASH, SHOCK_WAVE, WILLOWISP, CALM_MIND, MAGICAL_LEAF
	; end
