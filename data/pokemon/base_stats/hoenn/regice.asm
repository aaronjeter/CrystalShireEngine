	db 0 ; species ID placeholder

	db  105, 50, 100,  50, 125, 150
	evs   0,  0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 3 ; catch rate
	db 216 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/regice/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, RAIN_DANCE, THUNDER, EARTHQUAKE, SHOCK_WAVE, BRICK_BREAK, STRENGTH, THUNDERBOLT
	; end
