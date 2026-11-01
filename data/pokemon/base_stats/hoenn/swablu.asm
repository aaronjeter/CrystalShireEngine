	db 0 ; species ID placeholder
	;BST: 310
	db  45,  40,  60,  50,  40,  75
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FAIRY ; type
	db 255 ; catch rate
	db 74 ; base exp
	dw POLKADOT_BOW, PINK_BOW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swablu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, IRON_TAIL, EARTHQUAKE, HYPER_VOICE, FIRE_BLAST, SWIFT, THIEF, STEEL_WING, AERIAL_ACE, BUBBLEBEAM, FLY, FLAMETHROWER, ICE_BEAM
	; end
