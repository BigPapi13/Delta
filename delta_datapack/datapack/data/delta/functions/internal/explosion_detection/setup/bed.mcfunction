#> delta:internal/explosion_detection/setup/bed
#   Sets up a marker at the bed

advancement revoke @s only delta:place_bed

scoreboard players set $cast_distance delta.internal.dummy 60
scoreboard players set $bed_found delta.internal.dummy 0
execute unless dimension overworld anchored eyes positioned ^ ^ ^ run function delta:internal/explosion_detection/setup/bed_raycast