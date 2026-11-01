	db 0 ; species ID placeholder
	;BST: 350
	db  60,  75,  45,  55,  65,  50
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK ; type
	db 190 ; catch rate
	db 91 ; base exp
	dw ASPEAR_BERRY, CHARCOAL ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hgrowlithe/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, IRON_TAIL, DRAGONBREATH, DIG, SANDSTORM, FIRE_BLAST, SWIFT, THUNDER_FANG, ROCK_TOMB, WILLOWISP, BRICK_BREAK, ANCIENTPOWER, FLAMETHROWER
	; end
