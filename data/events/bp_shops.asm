; BP shops (engine/events/bp_shop.asm), indexed by BPSHOP_* (constants/facility_constants.asm).
; Each vendor sells one tier; later facilities have several vendors.

MACRO bp_item
; item, price in BP
	dw \1
	db \2
ENDM

BPShops:
	table_width 2
	dw BPShopTier1
	dw BPShopTier2
	dw BPShopTier3
	dw BPShopTier4
	dw BPShopCosmetic
	assert_table_length NUM_BPSHOPS

BPShopTier1: ; cheap
	bp_item HP_UP, 1
	bp_item PROTEIN, 1
	bp_item IRON, 1
	bp_item CARBOS, 1
	bp_item CALCIUM, 1
	bp_item ZINC, 1
	bp_item RARE_CANDY, 2
	bp_item PP_UP, 2
	bp_item ABILITY_CAPSULE, 3
	dw -1

BPShopTier2: ; utility
	bp_item WIDE_LENS, 4
	bp_item BIG_ROOT, 4
	bp_item BINDING_BAND, 4
	bp_item BERRY_JUICE, 4
	bp_item ABILITY_PATCH, 6
	dw -1

BPShopTier3: ; solid held items
	bp_item FOCUS_SASH, 8
	bp_item SHELL_BELL, 8
	bp_item FLAME_ORB, 8
	bp_item TOXIC_ORB, 8
	bp_item BLACK_SLUDGE, 8
	bp_item MUSCLE_BAND, 8
	bp_item WISE_GLASSES, 8
	bp_item ROCKY_HELMET, 10
	bp_item EXPERT_BELT, 10
	dw -1

BPShopTier4: ; premium
	bp_item EVIOLITE, 16
	bp_item LIFE_ORB, 16
	bp_item LEFTOVERS, 16
	dw -1

BPShopCosmetic:
	bp_item SILVER_LEAF, 2
	bp_item GOLD_LEAF, 5
	bp_item MARVEL_SCALE, 10
	dw -1
