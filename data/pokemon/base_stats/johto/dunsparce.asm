	db 0 ; species ID placeholder
	;BST: 450
	db 100,  75,  75,  50,  75,  75
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FAIRY ; type
	db 75 ; catch rate
	db 150 ; base exp
	dw DOME_FOSSIL, HELIX_FOSSIL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dunsparce/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, SWIFT, DREAM_EATER, THIEF, ROCK_TOMB, DRAGON_CLAW, STRENGTH, FLAMETHROWER, THUNDERBOLT
	; end
