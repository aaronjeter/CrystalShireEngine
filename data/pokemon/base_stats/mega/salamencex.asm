	db 0 ; species ID placeholder
	;bst 650
	db  95, 135,  120, 120, 100,  80
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/salamencex/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, FIRE_BLAST, STEEL_WING, THUNDER_FANG, ROCK_TOMB, AERIAL_ACE, BRICK_BREAK, ROCK_SLIDE, CUT, STRENGTH
	; end
