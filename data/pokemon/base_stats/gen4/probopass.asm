	db 0 ; species ID placeholder
	;BST: 525
	db  60,  55, 145,  40,  75,  150
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC ; type
	db 60 ; catch rate
	db 184 ; base exp
	dw NO_ITEM, HARD_STONE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/probopass/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, THUNDER, EARTHQUAKE, SHOCK_WAVE, ANCIENTPOWER, LIGHT_SCREEN, REFLECT, STRENGTH
	; end
