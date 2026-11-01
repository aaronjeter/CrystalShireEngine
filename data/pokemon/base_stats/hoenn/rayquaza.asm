	db 0 ; species ID placeholder

	db 105, 150,  90,  95, 150,  90
	evs  0,   2,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 3 ; catch rate
	db 220 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/rayquaza/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, BLIZZARD, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, SANDSTORM, FIRE_BLAST, BULK_UP, SHOCK_WAVE, AERIAL_ACE, BRICK_BREAK, ROCK_SLIDE, SURF, STRENGTH, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
