; Bridges the player can walk both over and under.
;
; Bridge tiles use three collision types:
; - COLL_BRIDGE_FLOOR: deck over floor
; - COLL_BRIDGE_WATER: deck over water
; - COLL_BRIDGE_EDGE:  bridge end (floor on top, wall underneath)
;
; The player's level is ENGINE_BRIDGE_UPPER (saved, so it survives battles,
; saves and reloads). It only changes when stepping onto a bridge tile:
; - onto an edge, or from an edge onto a deck: upper
; - onto a deck from a non-bridge tile: lower
; - from deck to deck: unchanged
;
; On top, the player can only walk between bridge tiles; underneath, decks act
; as floor/water and edges as walls. Deck tiles are drawn over sprites while
; the player is underneath.

TranslateBridgeCollision::
; Translate collision a for the player's current level
; (used for the current tile, NPCs, and anything else without context).
	cp COLL_BRIDGE_FLOOR
	ret c
	cp COLL_BRIDGE_EDGE + 1
	ret nc
	ld c, a
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_BRIDGE_UPPER_F, a
	jr nz, .floor
	ld a, c
.Lower:
; a = bridge collision -> what it is underneath the bridge
	cp COLL_BRIDGE_WATER
	ld a, COLL_WATER
	ret z
	jr c, .floor
	ld a, COLL_WALL
	ret

.floor
	xor a ; COLL_FLOOR
	ret

GetNeighborCollision::
; Collision of tile d, e as seen from the player's tile, whose raw collision
; is in wPlayerTileCollision.
	call GetCoordTileCollisionRaw
	ld b, a
	ld a, [wPlayerTileCollision]
	sub COLL_BRIDGE_FLOOR
	ld c, a ; 0-1: deck, 2: edge, 3+: not a bridge
	ld a, [wStatusFlags2]
	and 1 << STATUSFLAGS2_BRIDGE_UPPER_F
	ld e, a ; nz: upper
	ld a, b
	sub COLL_BRIDGE_FLOOR
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR + 1
	jr c, .bridge

; not a bridge: can't step off the side of a bridge from on top
	ld a, c
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr nc, .raw
	ld a, e
	and a
	jr nz, .wall
.raw
	ld a, b
	ret

.bridge
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr nz, .deck
; edge: a wall from underneath a deck, otherwise floor (stepping on it goes up)
	ld a, c
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr nc, .floor
	ld a, e
	and a
	jr nz, .floor
.wall
	ld a, COLL_WALL
	ret

.deck
	ld a, c
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr z, .floor ; from an edge: on top
	jr nc, .lower ; from off the bridge: underneath
	ld a, e
	and a
	jr nz, .floor
.lower
	ld a, b
	jr TranslateBridgeCollision.Lower

.floor
	xor a ; COLL_FLOOR
	ret

ApplyBridgePriority::
; Draw every bridge tile of the current tileset over sprites while the player
; is underneath, or under sprites while on top.
	ld a, [wStatusFlags2]
	cpl
	and 1 << STATUSFLAGS2_BRIDGE_UPPER_F
	jr z, .got_priority
	ld a, PRIORITY
.got_priority
	ldh [hTemp], a
	ldh a, [hROMBank]
	push af
	ld a, [wTilesetCollisionBank]
	rst Bankswitch
	ld hl, wTilesetCollisionAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressedAttributes)
	ldh [rSVBK], a
	ld de, wDecompressedAttributes
	ld b, 0 ; 256 blocks
.block
	ld c, 0 ; quadrant offsets: 0, 2, 8, 10
.quadrant
	ld a, [hli]
	sub COLL_BRIDGE_FLOOR
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR + 1
	jr nc, .next
	push hl
	push bc
	ld h, d
	ld a, e
	add c
	ld l, a
	call .Pair
	inc l
	inc l
	inc l
	call .Pair
	pop bc
	pop hl
.next
	ld a, c
	bit 1, a
	jr nz, .skip_row
	add 2
	ld c, a
	jr .quadrant
.skip_row
	add 6
	ld c, a
	cp 16
	jr c, .quadrant
	ld a, e
	add 16
	ld e, a
	adc d
	sub e
	ld d, a
	dec b
	jr nz, .block
	pop af
	ldh [rSVBK], a
	pop af
	rst Bankswitch
	ret

.Pair:
	ldh a, [hTemp]
	ld c, a
	ld a, [hl]
	and ~PRIORITY
	or c
	ld [hli], a
	ld a, [hl]
	and ~PRIORITY
	or c
	ld [hl], a
	ret
