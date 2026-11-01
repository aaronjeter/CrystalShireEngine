	db 0 ; species ID placeholder
	;BST: 490
	db  75, 70, 90,  80, 70, 105
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FAIRY ; type
	db 45 ; catch rate
	db 188 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/altaria/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, IRON_TAIL, EARTHQUAKE, HYPER_VOICE, FIRE_BLAST, SWIFT, THIEF, STEEL_WING, AERIAL_ACE, BUBBLEBEAM, FLY, FLAMETHROWER, ICE_BEAM
	; end
