	db 0 ; species ID placeholder

	db  75,  93,  75,  85,  47,  75
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 150 ; catch rate
	db 146 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/volbeat/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, SHADOW_BALL, REST, ATTRACT, THIEF, FLASH, SHOCK_WAVE, CALM_MIND, MAGICAL_LEAF, BRICK_BREAK
	; end
