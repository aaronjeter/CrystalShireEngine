	db 0 ; species ID placeholder
	;BST: 330
	db  40,  30,  50, 100,  55,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, GRASS ; type
	db 190 ; catch rate
	db 103 ; base exp
	dw SILVER_LEAF, MAGNET ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hvoltorb/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, TAUNT, SWIFT, SHOCK_WAVE, MAGICAL_LEAF, FLASH
	; end
