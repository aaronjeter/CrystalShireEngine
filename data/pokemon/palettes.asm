; Eggs are negative now
INCBIN "gfx/pokemon/egg/front.gbcpal", middle_colors
INCLUDE "gfx/pokemon/egg/shiny.pal"

; -2
	RGB 30, 26, 11
	RGB 23, 16, 00
; -2 shiny
	RGB 30, 26, 11
	RGB 23, 16, 00

; -1
	RGB 23, 23, 23
	RGB 17, 17, 17
; -1 shiny
	RGB 23, 23, 23
	RGB 17, 17, 17

PokemonPalettes:
; entries correspond to Pokémon species, two apiece

; Each normal.gbcpal is generated from the corresponding .png, and
; only the middle two colors are included, not black or white.
; Shiny palettes are defined directly, not generated.

	; 2 middle palettes, normal and shiny, with 2 colors each
	table_width PAL_COLOR_SIZE * 2 * 2

; 000
	RGB 30, 22, 17
	RGB 16, 14, 19
; 000 shiny
	RGB 30, 22, 17
	RGB 16, 14, 19

INCBIN "gfx/pokemon/bulbasaur/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bulbasaur/shiny.pal"
INCBIN "gfx/pokemon/ivysaur/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ivysaur/shiny.pal"
INCBIN "gfx/pokemon/venusaur/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/venusaur/shiny.pal"
INCBIN "gfx/pokemon/charmander/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/charmander/shiny.pal"
INCBIN "gfx/pokemon/charmeleon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/charmeleon/shiny.pal"
INCBIN "gfx/pokemon/charizard/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/charizard/shiny.pal"
INCBIN "gfx/pokemon/squirtle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/squirtle/shiny.pal"
INCBIN "gfx/pokemon/wartortle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wartortle/shiny.pal"
INCBIN "gfx/pokemon/blastoise/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/blastoise/shiny.pal"
INCBIN "gfx/pokemon/caterpie/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/caterpie/shiny.pal"
INCBIN "gfx/pokemon/metapod/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/metapod/shiny.pal"
INCBIN "gfx/pokemon/butterfree/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/butterfree/shiny.pal"
INCBIN "gfx/pokemon/weedle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/weedle/shiny.pal"
INCBIN "gfx/pokemon/kakuna/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kakuna/shiny.pal"
INCBIN "gfx/pokemon/beedrill/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/beedrill/shiny.pal"
INCBIN "gfx/pokemon/pidgey/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pidgey/shiny.pal"
INCBIN "gfx/pokemon/pidgeotto/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pidgeotto/shiny.pal"
INCBIN "gfx/pokemon/pidgeot/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pidgeot/shiny.pal"
INCBIN "gfx/pokemon/rattata/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rattata/shiny.pal"
INCBIN "gfx/pokemon/raticate/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/raticate/shiny.pal"
INCBIN "gfx/pokemon/spearow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/spearow/shiny.pal"
INCBIN "gfx/pokemon/fearow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/fearow/shiny.pal"
INCBIN "gfx/pokemon/ekans/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ekans/shiny.pal"
INCBIN "gfx/pokemon/arbok/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/arbok/shiny.pal"
INCBIN "gfx/pokemon/pikachu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pikachu/shiny.pal"
INCBIN "gfx/pokemon/raichu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/raichu/shiny.pal"
INCBIN "gfx/pokemon/sandshrew/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sandshrew/shiny.pal"
INCBIN "gfx/pokemon/sandslash/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sandslash/shiny.pal"
INCBIN "gfx/pokemon/nidoran_f/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidoran_f/shiny.pal"
INCBIN "gfx/pokemon/nidorina/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidorina/shiny.pal"
INCBIN "gfx/pokemon/nidoqueen/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidoqueen/shiny.pal"
INCBIN "gfx/pokemon/nidoran_m/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidoran_m/shiny.pal"
INCBIN "gfx/pokemon/nidorino/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidorino/shiny.pal"
INCBIN "gfx/pokemon/nidoking/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nidoking/shiny.pal"
INCBIN "gfx/pokemon/clefairy/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/clefairy/shiny.pal"
INCBIN "gfx/pokemon/clefable/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/clefable/shiny.pal"
INCBIN "gfx/pokemon/vulpix/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/vulpix/shiny.pal"
INCBIN "gfx/pokemon/ninetales/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ninetales/shiny.pal"
INCBIN "gfx/pokemon/jigglypuff/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jigglypuff/shiny.pal"
INCBIN "gfx/pokemon/wigglytuff/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wigglytuff/shiny.pal"
INCBIN "gfx/pokemon/zubat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/zubat/shiny.pal"
INCBIN "gfx/pokemon/golbat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/golbat/shiny.pal"
INCBIN "gfx/pokemon/oddish/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/oddish/shiny.pal"
INCBIN "gfx/pokemon/gloom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gloom/shiny.pal"
INCBIN "gfx/pokemon/vileplume/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/vileplume/shiny.pal"
INCBIN "gfx/pokemon/paras/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/paras/shiny.pal"
INCBIN "gfx/pokemon/parasect/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/parasect/shiny.pal"
INCBIN "gfx/pokemon/venonat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/venonat/shiny.pal"
INCBIN "gfx/pokemon/venomoth/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/venomoth/shiny.pal"
INCBIN "gfx/pokemon/diglett/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/diglett/shiny.pal"
INCBIN "gfx/pokemon/dugtrio/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dugtrio/shiny.pal"
INCBIN "gfx/pokemon/meowth/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/meowth/shiny.pal"
INCBIN "gfx/pokemon/persian/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/persian/shiny.pal"
INCBIN "gfx/pokemon/psyduck/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/psyduck/shiny.pal"
INCBIN "gfx/pokemon/golduck/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/golduck/shiny.pal"
INCBIN "gfx/pokemon/mankey/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mankey/shiny.pal"
INCBIN "gfx/pokemon/primeape/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/primeape/shiny.pal"
INCBIN "gfx/pokemon/growlithe/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/growlithe/shiny.pal"
INCBIN "gfx/pokemon/arcanine/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/arcanine/shiny.pal"
INCBIN "gfx/pokemon/poliwag/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/poliwag/shiny.pal"
INCBIN "gfx/pokemon/poliwhirl/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/poliwhirl/shiny.pal"
INCBIN "gfx/pokemon/poliwrath/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/poliwrath/shiny.pal"
INCBIN "gfx/pokemon/abra/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/abra/shiny.pal"
INCBIN "gfx/pokemon/kadabra/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kadabra/shiny.pal"
INCBIN "gfx/pokemon/alakazam/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/alakazam/shiny.pal"
INCBIN "gfx/pokemon/machop/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/machop/shiny.pal"
INCBIN "gfx/pokemon/machoke/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/machoke/shiny.pal"
INCBIN "gfx/pokemon/machamp/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/machamp/shiny.pal"
INCBIN "gfx/pokemon/bellsprout/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bellsprout/shiny.pal"
INCBIN "gfx/pokemon/weepinbell/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/weepinbell/shiny.pal"
INCBIN "gfx/pokemon/victreebel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/victreebel/shiny.pal"
INCBIN "gfx/pokemon/tentacool/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tentacool/shiny.pal"
INCBIN "gfx/pokemon/tentacruel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tentacruel/shiny.pal"
INCBIN "gfx/pokemon/geodude/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/geodude/shiny.pal"
INCBIN "gfx/pokemon/graveler/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/graveler/shiny.pal"
INCBIN "gfx/pokemon/golem/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/golem/shiny.pal"
INCBIN "gfx/pokemon/ponyta/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ponyta/shiny.pal"
INCBIN "gfx/pokemon/rapidash/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rapidash/shiny.pal"
INCBIN "gfx/pokemon/slowpoke/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/slowpoke/shiny.pal"
INCBIN "gfx/pokemon/slowbro/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/slowbro/shiny.pal"
INCBIN "gfx/pokemon/magnemite/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magnemite/shiny.pal"
INCBIN "gfx/pokemon/magneton/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magneton/shiny.pal"
INCBIN "gfx/pokemon/farfetch_d/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/farfetch_d/shiny.pal"
INCBIN "gfx/pokemon/doduo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/doduo/shiny.pal"
INCBIN "gfx/pokemon/dodrio/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dodrio/shiny.pal"
INCBIN "gfx/pokemon/seel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/seel/shiny.pal"
INCBIN "gfx/pokemon/dewgong/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dewgong/shiny.pal"
INCBIN "gfx/pokemon/grimer/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/grimer/shiny.pal"
INCBIN "gfx/pokemon/muk/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/muk/shiny.pal"
INCBIN "gfx/pokemon/shellder/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shellder/shiny.pal"
INCBIN "gfx/pokemon/cloyster/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cloyster/shiny.pal"
INCBIN "gfx/pokemon/gastly/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gastly/shiny.pal"
INCBIN "gfx/pokemon/haunter/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/haunter/shiny.pal"
INCBIN "gfx/pokemon/gengar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gengar/shiny.pal"
INCBIN "gfx/pokemon/onix/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/onix/shiny.pal"
INCBIN "gfx/pokemon/drowzee/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/drowzee/shiny.pal"
INCBIN "gfx/pokemon/hypno/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hypno/shiny.pal"
INCBIN "gfx/pokemon/krabby/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/krabby/shiny.pal"
INCBIN "gfx/pokemon/kingler/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kingler/shiny.pal"
INCBIN "gfx/pokemon/voltorb/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/voltorb/shiny.pal"
INCBIN "gfx/pokemon/electrode/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/electrode/shiny.pal"
INCBIN "gfx/pokemon/exeggcute/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/exeggcute/shiny.pal"
INCBIN "gfx/pokemon/exeggutor/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/exeggutor/shiny.pal"
INCBIN "gfx/pokemon/cubone/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cubone/shiny.pal"
INCBIN "gfx/pokemon/marowak/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/marowak/shiny.pal"
INCBIN "gfx/pokemon/hitmonlee/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hitmonlee/shiny.pal"
INCBIN "gfx/pokemon/hitmonchan/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hitmonchan/shiny.pal"
INCBIN "gfx/pokemon/lickitung/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lickitung/shiny.pal"
INCBIN "gfx/pokemon/koffing/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/koffing/shiny.pal"
INCBIN "gfx/pokemon/weezing/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/weezing/shiny.pal"
INCBIN "gfx/pokemon/rhyhorn/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rhyhorn/shiny.pal"
INCBIN "gfx/pokemon/rhydon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rhydon/shiny.pal"
INCBIN "gfx/pokemon/chansey/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chansey/shiny.pal"
INCBIN "gfx/pokemon/tangela/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tangela/shiny.pal"
INCBIN "gfx/pokemon/kangaskhan/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kangaskhan/shiny.pal"
INCBIN "gfx/pokemon/horsea/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/horsea/shiny.pal"
INCBIN "gfx/pokemon/seadra/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/seadra/shiny.pal"
INCBIN "gfx/pokemon/goldeen/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/goldeen/shiny.pal"
INCBIN "gfx/pokemon/seaking/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/seaking/shiny.pal"
INCBIN "gfx/pokemon/staryu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/staryu/shiny.pal"
INCBIN "gfx/pokemon/starmie/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/starmie/shiny.pal"
INCBIN "gfx/pokemon/mr__mime/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mr__mime/shiny.pal"
INCBIN "gfx/pokemon/scyther/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/scyther/shiny.pal"
INCBIN "gfx/pokemon/jynx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jynx/shiny.pal"
INCBIN "gfx/pokemon/electabuzz/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/electabuzz/shiny.pal"
INCBIN "gfx/pokemon/magmar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magmar/shiny.pal"
INCBIN "gfx/pokemon/pinsir/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pinsir/shiny.pal"
INCBIN "gfx/pokemon/tauros/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tauros/shiny.pal"
INCBIN "gfx/pokemon/magikarp/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magikarp/shiny.pal"
INCBIN "gfx/pokemon/gyarados/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gyarados/shiny.pal"
INCBIN "gfx/pokemon/lapras/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lapras/shiny.pal"
INCBIN "gfx/pokemon/ditto/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ditto/shiny.pal"
INCBIN "gfx/pokemon/eevee/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/eevee/shiny.pal"
INCBIN "gfx/pokemon/vaporeon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/vaporeon/shiny.pal"
INCBIN "gfx/pokemon/jolteon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jolteon/shiny.pal"
INCBIN "gfx/pokemon/flareon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/flareon/shiny.pal"
INCBIN "gfx/pokemon/porygon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/porygon/shiny.pal"
INCBIN "gfx/pokemon/omanyte/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/omanyte/shiny.pal"
INCBIN "gfx/pokemon/omastar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/omastar/shiny.pal"
INCBIN "gfx/pokemon/kabuto/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kabuto/shiny.pal"
INCBIN "gfx/pokemon/kabutops/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kabutops/shiny.pal"
INCBIN "gfx/pokemon/aerodactyl/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aerodactyl/shiny.pal"
INCBIN "gfx/pokemon/snorlax/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/snorlax/shiny.pal"
INCBIN "gfx/pokemon/articuno/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/articuno/shiny.pal"
INCBIN "gfx/pokemon/zapdos/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/zapdos/shiny.pal"
INCBIN "gfx/pokemon/moltres/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/moltres/shiny.pal"
INCBIN "gfx/pokemon/dratini/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dratini/shiny.pal"
INCBIN "gfx/pokemon/dragonair/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dragonair/shiny.pal"
INCBIN "gfx/pokemon/dragonite/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dragonite/shiny.pal"
INCBIN "gfx/pokemon/mewtwo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mewtwo/shiny.pal"
INCBIN "gfx/pokemon/mew/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mew/shiny.pal"
INCBIN "gfx/pokemon/chikorita/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chikorita/shiny.pal"
INCBIN "gfx/pokemon/bayleef/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bayleef/shiny.pal"
INCBIN "gfx/pokemon/meganium/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/meganium/shiny.pal"
INCBIN "gfx/pokemon/cyndaquil/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cyndaquil/shiny.pal"
INCBIN "gfx/pokemon/quilava/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/quilava/shiny.pal"
INCBIN "gfx/pokemon/typhlosion/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/typhlosion/shiny.pal"
INCBIN "gfx/pokemon/totodile/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/totodile/shiny.pal"
INCBIN "gfx/pokemon/croconaw/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/croconaw/shiny.pal"
INCBIN "gfx/pokemon/feraligatr/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/feraligatr/shiny.pal"
INCBIN "gfx/pokemon/sentret/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sentret/shiny.pal"
INCBIN "gfx/pokemon/furret/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/furret/shiny.pal"
INCBIN "gfx/pokemon/hoothoot/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hoothoot/shiny.pal"
INCBIN "gfx/pokemon/noctowl/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/noctowl/shiny.pal"
INCBIN "gfx/pokemon/ledyba/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ledyba/shiny.pal"
INCBIN "gfx/pokemon/ledian/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ledian/shiny.pal"
INCBIN "gfx/pokemon/spinarak/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/spinarak/shiny.pal"
INCBIN "gfx/pokemon/ariados/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ariados/shiny.pal"
INCBIN "gfx/pokemon/crobat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/crobat/shiny.pal"
INCBIN "gfx/pokemon/chinchou/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chinchou/shiny.pal"
INCBIN "gfx/pokemon/lanturn/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lanturn/shiny.pal"
INCBIN "gfx/pokemon/pichu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pichu/shiny.pal"
INCBIN "gfx/pokemon/cleffa/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cleffa/shiny.pal"
INCBIN "gfx/pokemon/igglybuff/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/igglybuff/shiny.pal"
INCBIN "gfx/pokemon/togepi/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/togepi/shiny.pal"
INCBIN "gfx/pokemon/togetic/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/togetic/shiny.pal"
INCBIN "gfx/pokemon/natu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/natu/shiny.pal"
INCBIN "gfx/pokemon/xatu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/xatu/shiny.pal"
INCBIN "gfx/pokemon/mareep/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mareep/shiny.pal"
INCBIN "gfx/pokemon/flaaffy/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/flaaffy/shiny.pal"
INCBIN "gfx/pokemon/ampharos/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ampharos/shiny.pal"
INCBIN "gfx/pokemon/bellossom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bellossom/shiny.pal"
INCBIN "gfx/pokemon/marill/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/marill/shiny.pal"
INCBIN "gfx/pokemon/azumarill/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/azumarill/shiny.pal"
INCBIN "gfx/pokemon/sudowoodo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sudowoodo/shiny.pal"
INCBIN "gfx/pokemon/politoed/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/politoed/shiny.pal"
INCBIN "gfx/pokemon/hoppip/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hoppip/shiny.pal"
INCBIN "gfx/pokemon/skiploom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/skiploom/shiny.pal"
INCBIN "gfx/pokemon/jumpluff/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jumpluff/shiny.pal"
INCBIN "gfx/pokemon/aipom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aipom/shiny.pal"
INCBIN "gfx/pokemon/sunkern/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sunkern/shiny.pal"
INCBIN "gfx/pokemon/sunflora/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sunflora/shiny.pal"
INCBIN "gfx/pokemon/yanma/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/yanma/shiny.pal"
INCBIN "gfx/pokemon/wooper/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wooper/shiny.pal"
INCBIN "gfx/pokemon/quagsire/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/quagsire/shiny.pal"
INCBIN "gfx/pokemon/espeon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/espeon/shiny.pal"
INCBIN "gfx/pokemon/umbreon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/umbreon/shiny.pal"
INCBIN "gfx/pokemon/murkrow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/murkrow/shiny.pal"
INCBIN "gfx/pokemon/slowking/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/slowking/shiny.pal"
INCBIN "gfx/pokemon/misdreavus/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/misdreavus/shiny.pal"
INCBIN "gfx/pokemon/unown/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/unown/shiny.pal"
INCBIN "gfx/pokemon/wobbuffet/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wobbuffet/shiny.pal"
INCBIN "gfx/pokemon/girafarig/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/girafarig/shiny.pal"
INCBIN "gfx/pokemon/pineco/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pineco/shiny.pal"
INCBIN "gfx/pokemon/forretress/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/forretress/shiny.pal"
INCBIN "gfx/pokemon/dunsparce/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dunsparce/shiny.pal"
INCBIN "gfx/pokemon/gligar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gligar/shiny.pal"
INCBIN "gfx/pokemon/steelix/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/steelix/shiny.pal"
INCBIN "gfx/pokemon/snubbull/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/snubbull/shiny.pal"
INCBIN "gfx/pokemon/granbull/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/granbull/shiny.pal"
INCBIN "gfx/pokemon/qwilfish/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/qwilfish/shiny.pal"
INCBIN "gfx/pokemon/scizor/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/scizor/shiny.pal"
INCBIN "gfx/pokemon/shuckle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shuckle/shiny.pal"
INCBIN "gfx/pokemon/heracross/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/heracross/shiny.pal"
INCBIN "gfx/pokemon/sneasel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sneasel/shiny.pal"
INCBIN "gfx/pokemon/teddiursa/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/teddiursa/shiny.pal"
INCBIN "gfx/pokemon/ursaring/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ursaring/shiny.pal"
INCBIN "gfx/pokemon/slugma/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/slugma/shiny.pal"
INCBIN "gfx/pokemon/magcargo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magcargo/shiny.pal"
INCBIN "gfx/pokemon/swinub/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swinub/shiny.pal"
INCBIN "gfx/pokemon/piloswine/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/piloswine/shiny.pal"
INCBIN "gfx/pokemon/corsola/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/corsola/shiny.pal"
INCBIN "gfx/pokemon/remoraid/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/remoraid/shiny.pal"
INCBIN "gfx/pokemon/octillery/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/octillery/shiny.pal"
INCBIN "gfx/pokemon/delibird/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/delibird/shiny.pal"
INCBIN "gfx/pokemon/mantine/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mantine/shiny.pal"
INCBIN "gfx/pokemon/skarmory/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/skarmory/shiny.pal"
INCBIN "gfx/pokemon/houndour/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/houndour/shiny.pal"
INCBIN "gfx/pokemon/houndoom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/houndoom/shiny.pal"
INCBIN "gfx/pokemon/kingdra/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kingdra/shiny.pal"
INCBIN "gfx/pokemon/phanpy/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/phanpy/shiny.pal"
INCBIN "gfx/pokemon/donphan/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/donphan/shiny.pal"
INCBIN "gfx/pokemon/porygon2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/porygon2/shiny.pal"
INCBIN "gfx/pokemon/stantler/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/stantler/shiny.pal"
INCBIN "gfx/pokemon/smeargle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/smeargle/shiny.pal"
INCBIN "gfx/pokemon/tyrogue/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tyrogue/shiny.pal"
INCBIN "gfx/pokemon/hitmontop/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hitmontop/shiny.pal"
INCBIN "gfx/pokemon/smoochum/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/smoochum/shiny.pal"
INCBIN "gfx/pokemon/elekid/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/elekid/shiny.pal"
INCBIN "gfx/pokemon/magby/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magby/shiny.pal"
INCBIN "gfx/pokemon/miltank/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/miltank/shiny.pal"
INCBIN "gfx/pokemon/blissey/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/blissey/shiny.pal"
INCBIN "gfx/pokemon/raikou/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/raikou/shiny.pal"
INCBIN "gfx/pokemon/entei/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/entei/shiny.pal"
INCBIN "gfx/pokemon/suicune/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/suicune/shiny.pal"
INCBIN "gfx/pokemon/larvitar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/larvitar/shiny.pal"
INCBIN "gfx/pokemon/pupitar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pupitar/shiny.pal"
INCBIN "gfx/pokemon/tyranitar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tyranitar/shiny.pal"
INCBIN "gfx/pokemon/lugia/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lugia/shiny.pal"
INCBIN "gfx/pokemon/ho_oh/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ho_oh/shiny.pal"
INCBIN "gfx/pokemon/celebi/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/celebi/shiny.pal"
INCBIN "gfx/pokemon/munchlax/front.gbcpal", middle_colors
INCLUDE "gfx/pokemon/munchlax/shiny.pal"
; Hoenn
INCBIN "gfx/pokemon/treecko/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/treecko/shiny.pal"
INCBIN "gfx/pokemon/grovyle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/grovyle/shiny.pal"
INCBIN "gfx/pokemon/sceptile/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sceptile/shiny.pal"
INCBIN "gfx/pokemon/torchic/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/torchic/shiny.pal"
INCBIN "gfx/pokemon/combusken/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/combusken/shiny.pal"
INCBIN "gfx/pokemon/blaziken/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/blaziken/shiny.pal"
INCBIN "gfx/pokemon/mudkip/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mudkip/shiny.pal"
INCBIN "gfx/pokemon/marshtomp/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/marshtomp/shiny.pal"
INCBIN "gfx/pokemon/swampert/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swampert/shiny.pal"
INCBIN "gfx/pokemon/poochyena/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/poochyena/shiny.pal"
INCBIN "gfx/pokemon/mightyena/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mightyena/shiny.pal"
INCBIN "gfx/pokemon/zigzagoon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/zigzagoon/shiny.pal"
INCBIN "gfx/pokemon/linoone/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/linoone/shiny.pal"
INCBIN "gfx/pokemon/wurmple/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wurmple/shiny.pal"
INCBIN "gfx/pokemon/silcoon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/silcoon/shiny.pal"
INCBIN "gfx/pokemon/beautifly/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/beautifly/shiny.pal"
INCBIN "gfx/pokemon/cascoon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cascoon/shiny.pal"
INCBIN "gfx/pokemon/dustox/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dustox/shiny.pal"
INCBIN "gfx/pokemon/lotad/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lotad/shiny.pal"
INCBIN "gfx/pokemon/lombre/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lombre/shiny.pal"
INCBIN "gfx/pokemon/ludicolo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ludicolo/shiny.pal"
INCBIN "gfx/pokemon/seedot/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/seedot/shiny.pal"
INCBIN "gfx/pokemon/nuzleaf/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nuzleaf/shiny.pal"
INCBIN "gfx/pokemon/shiftry/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shiftry/shiny.pal"
INCBIN "gfx/pokemon/taillow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/taillow/shiny.pal"
INCBIN "gfx/pokemon/swellow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swellow/shiny.pal"
INCBIN "gfx/pokemon/wingull/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wingull/shiny.pal"
INCBIN "gfx/pokemon/pelipper/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pelipper/shiny.pal"
INCBIN "gfx/pokemon/ralts/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ralts/shiny.pal"
INCBIN "gfx/pokemon/kirlia/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kirlia/shiny.pal"
INCBIN "gfx/pokemon/gardevoir/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gardevoir/shiny.pal"
INCBIN "gfx/pokemon/surskit/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/surskit/shiny.pal"
INCBIN "gfx/pokemon/masquerain/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/masquerain/shiny.pal"
INCBIN "gfx/pokemon/shroomish/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shroomish/shiny.pal"
INCBIN "gfx/pokemon/breloom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/breloom/shiny.pal"
INCBIN "gfx/pokemon/rowlet/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rowlet/shiny.pal"
INCBIN "gfx/pokemon/dartrix/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dartrix/shiny.pal"
INCBIN "gfx/pokemon/decidueye/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/decidueye/shiny.pal"
INCBIN "gfx/pokemon/litten/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/litten/shiny.pal"
INCBIN "gfx/pokemon/torracat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/torracat/shiny.pal"
INCBIN "gfx/pokemon/incineroar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/incineroar/shiny.pal"
INCBIN "gfx/pokemon/popplio/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/popplio/shiny.pal"
INCBIN "gfx/pokemon/brionne/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/brionne/shiny.pal"
INCBIN "gfx/pokemon/primarina/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/primarina/shiny.pal"
INCBIN "gfx/pokemon/makuhita/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/makuhita/shiny.pal"
INCBIN "gfx/pokemon/hariyama/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hariyama/shiny.pal"
INCBIN "gfx/pokemon/azurill/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/azurill/shiny.pal"
INCBIN "gfx/pokemon/nosepass/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/nosepass/shiny.pal"
INCBIN "gfx/pokemon/skitty/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/skitty/shiny.pal"
INCBIN "gfx/pokemon/delcatty/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/delcatty/shiny.pal"
INCBIN "gfx/pokemon/sableye/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sableye/shiny.pal"
INCBIN "gfx/pokemon/mawile/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mawile/shiny.pal"
INCBIN "gfx/pokemon/aron/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aron/shiny.pal"
INCBIN "gfx/pokemon/lairon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lairon/shiny.pal"
INCBIN "gfx/pokemon/aggron/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aggron/shiny.pal"
INCBIN "gfx/pokemon/meditite/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/meditite/shiny.pal"
INCBIN "gfx/pokemon/medicham/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/medicham/shiny.pal"
INCBIN "gfx/pokemon/electrike/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/electrike/shiny.pal"
INCBIN "gfx/pokemon/manectric/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/manectric/shiny.pal"
INCBIN "gfx/pokemon/plusle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/plusle/shiny.pal"
INCBIN "gfx/pokemon/minun/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/minun/shiny.pal"
INCBIN "gfx/pokemon/volbeat/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/volbeat/shiny.pal"
INCBIN "gfx/pokemon/illumise/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/illumise/shiny.pal"
INCBIN "gfx/pokemon/roselia/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/roselia/shiny.pal"
INCBIN "gfx/pokemon/gulpin/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gulpin/shiny.pal"
INCBIN "gfx/pokemon/swalot/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swalot/shiny.pal"
INCBIN "gfx/pokemon/carvanha/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/carvanha/shiny.pal"
INCBIN "gfx/pokemon/sharpedo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sharpedo/shiny.pal"
INCBIN "gfx/pokemon/wailmer/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wailmer/shiny.pal"
INCBIN "gfx/pokemon/wailord/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wailord/shiny.pal"
INCBIN "gfx/pokemon/numel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/numel/shiny.pal"
INCBIN "gfx/pokemon/camerupt/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/camerupt/shiny.pal"
INCBIN "gfx/pokemon/torkoal/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/torkoal/shiny.pal"
INCBIN "gfx/pokemon/spoink/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/spoink/shiny.pal"
INCBIN "gfx/pokemon/grumpig/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/grumpig/shiny.pal"
INCBIN "gfx/pokemon/spinda/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/spinda/shiny.pal"
INCBIN "gfx/pokemon/trapinch/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/trapinch/shiny.pal"
INCBIN "gfx/pokemon/vibrava/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/vibrava/shiny.pal"
INCBIN "gfx/pokemon/flygon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/flygon/shiny.pal"
INCBIN "gfx/pokemon/cacnea/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cacnea/shiny.pal"
INCBIN "gfx/pokemon/cacturne/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cacturne/shiny.pal"
INCBIN "gfx/pokemon/swablu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swablu/shiny.pal"
INCBIN "gfx/pokemon/altaria/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/altaria/shiny.pal"
INCBIN "gfx/pokemon/zangoose/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/zangoose/shiny.pal"
INCBIN "gfx/pokemon/seviper/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/seviper/shiny.pal"
INCBIN "gfx/pokemon/lunatone/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lunatone/shiny.pal"
INCBIN "gfx/pokemon/solrock/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/solrock/shiny.pal"
INCBIN "gfx/pokemon/barboach/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/barboach/shiny.pal"
INCBIN "gfx/pokemon/whiscash/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/whiscash/shiny.pal"
INCBIN "gfx/pokemon/corphish/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/corphish/shiny.pal"
INCBIN "gfx/pokemon/crawdaunt/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/crawdaunt/shiny.pal"
INCBIN "gfx/pokemon/baltoy/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/baltoy/shiny.pal"
INCBIN "gfx/pokemon/claydol/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/claydol/shiny.pal"
INCBIN "gfx/pokemon/lileep/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lileep/shiny.pal"
INCBIN "gfx/pokemon/cradily/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cradily/shiny.pal"
INCBIN "gfx/pokemon/anorith/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/anorith/shiny.pal"
INCBIN "gfx/pokemon/armaldo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/armaldo/shiny.pal"
INCBIN "gfx/pokemon/feebas/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/feebas/shiny.pal"
INCBIN "gfx/pokemon/milotic/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/milotic/shiny.pal"
INCBIN "gfx/pokemon/kecleon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kecleon/shiny.pal"
INCBIN "gfx/pokemon/shuppet/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shuppet/shiny.pal"
INCBIN "gfx/pokemon/banette/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/banette/shiny.pal"
INCBIN "gfx/pokemon/duskull/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/duskull/shiny.pal"
INCBIN "gfx/pokemon/dusclops/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dusclops/shiny.pal"
INCBIN "gfx/pokemon/tropius/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tropius/shiny.pal"
INCBIN "gfx/pokemon/chimecho/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chimecho/shiny.pal"
INCBIN "gfx/pokemon/absol/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/absol/shiny.pal"
INCBIN "gfx/pokemon/wynaut/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wynaut/shiny.pal"
INCBIN "gfx/pokemon/snorunt/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/snorunt/shiny.pal"
INCBIN "gfx/pokemon/glalie/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/glalie/shiny.pal"
INCBIN "gfx/pokemon/spheal/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/spheal/shiny.pal"
INCBIN "gfx/pokemon/sealeo/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sealeo/shiny.pal"
INCBIN "gfx/pokemon/walrein/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/walrein/shiny.pal"
INCBIN "gfx/pokemon/clamperl/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/clamperl/shiny.pal"
INCBIN "gfx/pokemon/huntail/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/huntail/shiny.pal"
INCBIN "gfx/pokemon/gorebyss/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gorebyss/shiny.pal"
INCBIN "gfx/pokemon/relicanth/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/relicanth/shiny.pal"
INCBIN "gfx/pokemon/luvdisc/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/luvdisc/shiny.pal"
INCBIN "gfx/pokemon/bagon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bagon/shiny.pal"
INCBIN "gfx/pokemon/shelgon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/shelgon/shiny.pal"
INCBIN "gfx/pokemon/salamence/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/salamence/shiny.pal"
INCBIN "gfx/pokemon/beldum/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/beldum/shiny.pal"
INCBIN "gfx/pokemon/metang/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/metang/shiny.pal"
INCBIN "gfx/pokemon/metagross/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/metagross/shiny.pal"
INCBIN "gfx/pokemon/regirock/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/regirock/shiny.pal"
INCBIN "gfx/pokemon/regice/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/regice/shiny.pal"
INCBIN "gfx/pokemon/registeel/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/registeel/shiny.pal"
INCBIN "gfx/pokemon/latias/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/latias/shiny.pal"
INCBIN "gfx/pokemon/latios/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/latios/shiny.pal"
INCBIN "gfx/pokemon/kyogre/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kyogre/shiny.pal"
INCBIN "gfx/pokemon/groudon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/groudon/shiny.pal"
INCBIN "gfx/pokemon/rayquaza/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rayquaza/shiny.pal"
INCBIN "gfx/pokemon/jirachi/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jirachi/shiny.pal"
;Gen4
INCBIN "gfx/pokemon/togekiss/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/togekiss/shiny.pal"
INCBIN "gfx/pokemon/mamoswine/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mamoswine/shiny.pal"
INCBIN "gfx/pokemon/sylveon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sylveon/shiny.pal"
INCBIN "gfx/pokemon/leafeon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/leafeon/shiny.pal"
INCBIN "gfx/pokemon/glaceon/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/glaceon/shiny.pal"
INCBIN "gfx/pokemon/gliscor/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gliscor/shiny.pal"
INCBIN "gfx/pokemon/gallade/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gallade/shiny.pal"
INCBIN "gfx/pokemon/froslass/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/froslass/shiny.pal"
INCBIN "gfx/pokemon/honchkrow/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/honchkrow/shiny.pal"
INCBIN "gfx/pokemon/weavile/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/weavile/shiny.pal"
INCBIN "gfx/pokemon/magnezone/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magnezone/shiny.pal"
INCBIN "gfx/pokemon/tangrowth/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tangrowth/shiny.pal"
INCBIN "gfx/pokemon/electivire/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/electivire/shiny.pal"
INCBIN "gfx/pokemon/magmortar/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magmortar/shiny.pal"
INCBIN "gfx/pokemon/wyrdeer/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/wyrdeer/shiny.pal"
INCBIN "gfx/pokemon/porygonz/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/porygonz/shiny.pal"
INCBIN "gfx/pokemon/annihilape/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/annihilape/shiny.pal"
INCBIN "gfx/pokemon/kleavor/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kleavor/shiny.pal"
INCBIN "gfx/pokemon/roserade/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/roserade/shiny.pal"
INCBIN "gfx/pokemon/ambipom/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ambipom/shiny.pal"
INCBIN "gfx/pokemon/mismagius/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mismagius/shiny.pal"
INCBIN "gfx/pokemon/lickilicky/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/lickilicky/shiny.pal"
INCBIN "gfx/pokemon/rhyperior/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rhyperior/shiny.pal"
INCBIN "gfx/pokemon/yanmega/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/yanmega/shiny.pal"
INCBIN "gfx/pokemon/probopass/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/probopass/shiny.pal"
INCBIN "gfx/pokemon/dusknoir/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dusknoir/shiny.pal"
INCBIN "gfx/pokemon/mr__rime/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mr__rime/shiny.pal"
INCBIN "gfx/pokemon/ursaluna/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ursaluna/shiny.pal"
INCBIN "gfx/pokemon/farigiraf/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/farigiraf/shiny.pal"
INCBIN "gfx/pokemon/sirfetch_d/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sirfetch_d/shiny.pal"

;alt forms
INCBIN "gfx/pokemon/araichu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/araichu/shiny.pal"
INCBIN "gfx/pokemon/amarowak/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/amarowak/shiny.pal"
INCBIN "gfx/pokemon/agrimer/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/agrimer/shiny.pal"
INCBIN "gfx/pokemon/amuk/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/amuk/shiny.pal"
INCBIN "gfx/pokemon/asandshrew/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/asandshrew/shiny.pal"
INCBIN "gfx/pokemon/asandslash/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/asandslash/shiny.pal"
INCBIN "gfx/pokemon/avulpix/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/avulpix/shiny.pal"
INCBIN "gfx/pokemon/aninetales/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aninetales/shiny.pal"
INCBIN "gfx/pokemon/ageodude/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ageodude/shiny.pal"
INCBIN "gfx/pokemon/agraveler/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/agraveler/shiny.pal"
INCBIN "gfx/pokemon/agolem/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/agolem/shiny.pal"
INCBIN "gfx/pokemon/hvoltorb/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hvoltorb/shiny.pal"
INCBIN "gfx/pokemon/helectrode/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/helectrode/shiny.pal"
INCBIN "gfx/pokemon/hgrowlithe/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hgrowlithe/shiny.pal"
INCBIN "gfx/pokemon/harcanine/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/harcanine/shiny.pal"
INCBIN "gfx/pokemon/gponyta/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gponyta/shiny.pal"
INCBIN "gfx/pokemon/grapidash/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/grapidash/shiny.pal"
INCBIN "gfx/pokemon/adiglett/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/adiglett/shiny.pal"
INCBIN "gfx/pokemon/adugtrio/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/adugtrio/shiny.pal"
INCBIN "gfx/pokemon/gweezing/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gweezing/shiny.pal"
INCBIN "gfx/pokemon/ironbundle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ironbundle/shiny.pal"
;reddit mons
INCBIN "gfx/pokemon/voltorb2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/voltorb2/shiny.pal"
INCBIN "gfx/pokemon/electrode2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/electrode2/shiny.pal"
INCBIN "gfx/pokemon/exeggcute2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/exeggcute2/shiny.pal"
INCBIN "gfx/pokemon/exeggutor2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/exeggutor2/shiny.pal"
INCBIN "gfx/pokemon/furret2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/furret2/shiny.pal"
INCBIN "gfx/pokemon/noctowl2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/noctowl2/shiny.pal"
INCBIN "gfx/pokemon/octillery2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/octillery2/shiny.pal"
INCBIN "gfx/pokemon/yanma2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/yanma2/shiny.pal"
INCBIN "gfx/pokemon/scyther2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/scyther2/shiny.pal"
INCBIN "gfx/pokemon/scizor2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/scizor2/shiny.pal"
INCBIN "gfx/pokemon/tentacool2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tentacool2/shiny.pal"
INCBIN "gfx/pokemon/tentacruel2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tentacruel2/shiny.pal"
INCBIN "gfx/pokemon/ponyta2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ponyta2/shiny.pal"
INCBIN "gfx/pokemon/rapidash2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/rapidash2/shiny.pal"
INCBIN "gfx/pokemon/vulpix2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/vulpix2/shiny.pal"
INCBIN "gfx/pokemon/ninetales2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ninetales2/shiny.pal"
INCBIN "gfx/pokemon/abra2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/abra2/shiny.pal"
INCBIN "gfx/pokemon/kadabra2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kadabra2/shiny.pal"
INCBIN "gfx/pokemon/alakazam2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/alakazam2/shiny.pal"
INCBIN "gfx/pokemon/skarmory2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/skarmory2/shiny.pal"
INCBIN "gfx/pokemon/totodile2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/totodile2/shiny.pal"
INCBIN "gfx/pokemon/croconaw2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/croconaw2/shiny.pal"
INCBIN "gfx/pokemon/feraligatr2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/feraligatr2/shiny.pal"
INCBIN "gfx/pokemon/cyndaquil2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cyndaquil2/shiny.pal"
INCBIN "gfx/pokemon/quilava2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/quilava2/shiny.pal"
INCBIN "gfx/pokemon/typhlosion2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/typhlosion2/shiny.pal"
;beta mons
INCBIN "gfx/pokemon/hanamole/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/hanamole/shiny.pal"
INCBIN "gfx/pokemon/honobea/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/honobea/shiny.pal"
INCBIN "gfx/pokemon/borubea/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/borubea/shiny.pal"
INCBIN "gfx/pokemon/dynabea/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dynabea/shiny.pal"
INCBIN "gfx/pokemon/kurusu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kurusu/shiny.pal"
INCBIN "gfx/pokemon/akua/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/akua/shiny.pal"
INCBIN "gfx/pokemon/akueria/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/akueria/shiny.pal"
INCBIN "gfx/pokemon/haneei/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/haneei/shiny.pal"
INCBIN "gfx/pokemon/chikorita2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chikorita2/shiny.pal"
INCBIN "gfx/pokemon/kotora/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kotora/shiny.pal"
INCBIN "gfx/pokemon/raitora/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/raitora/shiny.pal"
INCBIN "gfx/pokemon/ashibomb/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ashibomb/shiny.pal"
INCBIN "gfx/pokemon/sunbou/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sunbou/shiny.pal"
INCBIN "gfx/pokemon/ikari/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ikari/shiny.pal"
INCBIN "gfx/pokemon/totartle/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/totartle/shiny.pal"
INCBIN "gfx/pokemon/gorochu/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gorochu/shiny.pal"
;Megas
INCBIN "gfx/pokemon/bayleef2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/bayleef2/shiny.pal"
INCBIN "gfx/pokemon/meganium2/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/meganium2/shiny.pal"
INCBIN "gfx/pokemon/dragonitex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dragonitex/shiny.pal"
INCBIN "gfx/pokemon/dragonitey/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/dragonitey/shiny.pal"

INCBIN "gfx/pokemon/venusaurx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/venusaurx/shiny.pal"
INCBIN "gfx/pokemon/charizardx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/charizardx/shiny.pal"
INCBIN "gfx/pokemon/charizardy/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/charizardy/shiny.pal"
INCBIN "gfx/pokemon/blastoisex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/blastoisex/shiny.pal"
INCBIN "gfx/pokemon/beedrillx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/beedrillx/shiny.pal"
INCBIN "gfx/pokemon/alakazamx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/alakazamx/shiny.pal"
INCBIN "gfx/pokemon/slowbrox/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/slowbrox/shiny.pal"
INCBIN "gfx/pokemon/gengarx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gengarx/shiny.pal"
INCBIN "gfx/pokemon/pinsirx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pinsirx/shiny.pal"
INCBIN "gfx/pokemon/gyaradosx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gyaradosx/shiny.pal"
INCBIN "gfx/pokemon/aerodactylx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aerodactylx/shiny.pal"
INCBIN "gfx/pokemon/ampharosx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ampharosx/shiny.pal"
INCBIN "gfx/pokemon/steelixx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/steelixx/shiny.pal"
INCBIN "gfx/pokemon/scizorx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/scizorx/shiny.pal"
INCBIN "gfx/pokemon/heracrossx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/heracrossx/shiny.pal"
INCBIN "gfx/pokemon/houndoomx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/houndoomx/shiny.pal"
INCBIN "gfx/pokemon/tyranitarx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tyranitarx/shiny.pal"
INCBIN "gfx/pokemon/aggronx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/aggronx/shiny.pal"
INCBIN "gfx/pokemon/cameruptx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/cameruptx/shiny.pal"
INCBIN "gfx/pokemon/altariax/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/altariax/shiny.pal"
INCBIN "gfx/pokemon/absolx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/absolx/shiny.pal"
INCBIN "gfx/pokemon/glaliex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/glaliex/shiny.pal"
INCBIN "gfx/pokemon/salamencex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/salamencex/shiny.pal"
INCBIN "gfx/pokemon/metagrossx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/metagrossx/shiny.pal"
INCBIN "gfx/pokemon/kinglerx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/kinglerx/shiny.pal"
INCBIN "gfx/pokemon/tropiusx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/tropiusx/shiny.pal"
INCBIN "gfx/pokemon/swalotx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swalotx/shiny.pal"
INCBIN "gfx/pokemon/flygonx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/flygonx/shiny.pal"
INCBIN "gfx/pokemon/chimechox/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/chimechox/shiny.pal"
INCBIN "gfx/pokemon/victreebelx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/victreebelx/shiny.pal"
INCBIN "gfx/pokemon/unownx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/unownx/shiny.pal"
INCBIN "gfx/pokemon/butterfreex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/butterfreex/shiny.pal"
INCBIN "gfx/pokemon/ledianx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/ledianx/shiny.pal"
INCBIN "gfx/pokemon/magcargox/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/magcargox/shiny.pal"
INCBIN "gfx/pokemon/sceptilex/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/sceptilex/shiny.pal"
INCBIN "gfx/pokemon/blazikenx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/blazikenx/shiny.pal"
INCBIN "gfx/pokemon/swampertx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/swampertx/shiny.pal"
INCBIN "gfx/pokemon/gardevoirx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/gardevoirx/shiny.pal"
INCBIN "gfx/pokemon/pidgeotx/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/pidgeotx/shiny.pal"
INCBIN "gfx/pokemon/mercury/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mercury/shiny.pal"
INCBIN "gfx/pokemon/venus/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/venus/shiny.pal"
INCBIN "gfx/pokemon/mars/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/mars/shiny.pal"
INCBIN "gfx/pokemon/jupiter/normal.gbcpal", middle_colors
INCLUDE "gfx/pokemon/jupiter/shiny.pal"
	assert_table_length NUM_POKEMON + 1
