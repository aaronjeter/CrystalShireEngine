	db 0 ; species ID placeholder
	;BST: 450
	db  75,  45,  60,  90,  100,  80
	evs  0,   0,   0,   0,   2,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY ; type
	db 45 ; catch rate
	db 160 ; base exp
	dw NO_ITEM, SILVERPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/butterfree/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, TAUNT, SOLARBEAM, PSYCHIC_M, SHADOW_BALL, SWIFT, AERIAL_ACE, MAGICAL_LEAF, FLASH
	; end
