#> delta:internal/explosion_detection/wither_explode
#   Makes the wither do its spawn explosion

execute positioned ~ ~1.75 ~ run function delta:internal/explosion_detection/large_explosion
tag @s add delta.wither.exploded