	db 0 ; species ID placeholder
	;BST: 550
	db  85,  100,  70,  100,  55, 140
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIGHTING ; type
	db 90 ; catch rate
	db 134 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledianx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, DIG, ICE_PUNCH, SWIFT, THUNDERPUNCH, THIEF, ROCK_TOMB, AERIAL_ACE, BRICK_BREAK, STRENGTH, FLASH
	; end
