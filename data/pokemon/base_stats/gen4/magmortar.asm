	db 0 ; species ID placeholder
	;BST: 540
	db  75,  95,  67,  83, 125,  95
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 220 ; base exp
	dw ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmortar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HYPER_BEAM, TAUNT, SOLARBEAM, IRON_TAIL, MUD_SLAP, THUNDERPUNCH, THIEF, STRENGTH, THUNDERBOLT
	; end
