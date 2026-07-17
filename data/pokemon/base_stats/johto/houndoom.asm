	db 0 ; species ID placeholder
	;BST: 500
	db  75,  90,  50,  95, 110,  80
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 45 ; catch rate
	db 204 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/houndoom/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, SHADOW_BALL, MUD_SLAP, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, SWIFT, DETECT, REST, ATTRACT, THIEF, STRENGTH, FLAMETHROWER, FIRE_FANG, THUNDER_FANG, WILLOWISP
	; end
