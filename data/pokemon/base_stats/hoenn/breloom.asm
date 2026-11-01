	db 0 ; species ID placeholder
	;BST: 460
	db  60, 130,  80,  70,  60,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIGHTING ; type
	db 90 ; catch rate
	db 165 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/breloom/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, SLUDGE_BOMB, THUNDERPUNCH, ROCK_TOMB, MAGICAL_LEAF, ROCK_SLIDE, POISON_JAB, CUT, STRENGTH, FLASH
	; end
