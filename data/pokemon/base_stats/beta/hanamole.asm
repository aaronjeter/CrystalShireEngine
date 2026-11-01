	db 0 ; species ID placeholder
	;BST: 500
	db  100, 50,  90,  90,  80,  90
	evs  1,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 45 ; catch rate
	db 180 ; base exp
	dw GOLD_LEAF, MARVEL_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/hanamole/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, PSYCHIC_M, SHADOW_BALL, SANDSTORM, SWIFT, ANCIENTPOWER, REFLECT, FLASH
	; end
