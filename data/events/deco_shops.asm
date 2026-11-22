; Decoration shops (engine/events/deco_shop.asm), indexed by DECOSHOP_*.
; Each shop: its currency (DECOSHOP_MONEY or DECOSHOP_BP), then entries of
; a decoration (its DecorationAttributes index) and its price, then -1.

MACRO deco_for_sale
	db \1 ; DecorationAttributes index
	dw \2 ; price
ENDM

DecoShops:
	table_width 2
	dw DecoShopVendingMachine ; DECOSHOP_VENDING
	dw DecoShopResort         ; DECOSHOP_RESORT
	assert_table_length NUM_DECOSHOPS

DecoShopVendingMachine:
	db DECOSHOP_MONEY
	deco_for_sale 33, 3000 ; Jigglypuff Doll
	deco_for_sale 34, 3000 ; Bulbasaur Doll
	deco_for_sale 36, 3000 ; Squirtle Doll
	deco_for_sale 37, 3000 ; Poliwag Doll
	deco_for_sale 38, 3000 ; Diglett Doll
	deco_for_sale 39, 3000 ; Staryu Doll
	deco_for_sale 40, 3000 ; Magikarp Doll
	deco_for_sale 41, 3000 ; Oddish Doll
	deco_for_sale 42, 3000 ; Gengar Doll
	deco_for_sale 43, 3000 ; Shellder Doll
	deco_for_sale 44, 3000 ; Grimer Doll
	deco_for_sale 45, 3000 ; Voltorb Doll
	deco_for_sale 46, 3000 ; Weedle Doll
	deco_for_sale 47, 3000 ; Unown Doll
	deco_for_sale 48, 3000 ; Geodude Doll
	deco_for_sale 49, 3000 ; Machop Doll
	deco_for_sale 50, 3000 ; Tentacool Doll
	deco_for_sale 17, 2000 ; Pikachu Poster
	deco_for_sale 18, 2000 ; Clefairy Poster
	deco_for_sale 19, 2000 ; Jigglypuff Poster
	deco_for_sale 7,  3000 ; Red Carpet
	deco_for_sale 8,  3000 ; Blue Carpet
	deco_for_sale 9,  3000 ; Yellow Carpet
	deco_for_sale 10, 3000 ; Green Carpet
	deco_for_sale 12, 4000 ; Magnaplant
	deco_for_sale 13, 4000 ; Tropicplant
	deco_for_sale 14, 4000 ; Jumboplant
	deco_for_sale 3,  5000 ; Pink Bed
	deco_for_sale 4,  5000 ; Polkadot Bed
	deco_for_sale 5,  5000 ; Pikachu Bed
	db -1

DecoShopResort:
	db DECOSHOP_BP
	deco_for_sale 31, 10 ; Surf Pikachu Doll
	deco_for_sale 21, 12 ; Famicom
	deco_for_sale 22, 12 ; Super NES
	deco_for_sale 23, 16 ; Nintendo 64
	deco_for_sale 24, 16 ; Virtual Boy
	deco_for_sale 27, 20 ; Big Onix Doll
	deco_for_sale 28, 20 ; Big Lapras Doll
	db -1
