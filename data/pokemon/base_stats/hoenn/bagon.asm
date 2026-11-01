	db 0 ; species ID placeholder

	db  45,  75,  60,  50,  40,  30
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 110 ; base exp
	dw DRAGON_FANG, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/bagon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, FIRE_BLAST, STEEL_WING, THUNDER_FANG, ROCK_TOMB, AERIAL_ACE, BRICK_BREAK, ROCK_SLIDE, CUT, STRENGTH
	; end
