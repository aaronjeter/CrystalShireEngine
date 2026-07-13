	db 0 ; species ID placeholder
	;BST: 310
	db  45,  40,  60,  50,  40,  75
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FAIRY ; type
	db 255 ; catch rate
	db 74 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swablu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, REST, ATTRACT, THIEF, STEEL_WING, FLY, AERIAL_ACE
	; end
