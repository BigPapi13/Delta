#> delta:internal/explosion_detection/bed
#   Detects a bed exploding

advancement revoke @s only delta:explode_bed

execute as @e[type=marker,distance=..7,tag=delta.bed] at @s unless block ~ ~ ~ #minecraft:beds run function delta:internal/explosion_detection/explode_bed
execute as @e[type=marker,distance=..7,tag=delta.respawn_anchor] at @s unless block ~ ~ ~ minecraft:respawn_anchor run function delta:internal/explosion_detection/explode_bed
