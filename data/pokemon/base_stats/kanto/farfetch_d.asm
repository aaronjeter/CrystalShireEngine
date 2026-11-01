	db 0 ; species ID placeholder
	;BST: 450
	db  77,  100,  55,  78,  78,  62
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp
	dw SILVER_LEAF, STICK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/farfetch_d/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, IRON_TAIL, MUD_SLAP, SWIFT, THIEF, STEEL_WING, BULK_UP, CUT, FLY
	; end
