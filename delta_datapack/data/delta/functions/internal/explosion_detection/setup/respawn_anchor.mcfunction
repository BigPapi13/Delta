#> delta:internal/explosion_detection/setup/bed
#   Sets up a marker at the bed

advancement revoke @s only delta:place_respawn_anchor

scoreboard players set $cast_distance delta.internal.dummy 60
scoreboard players set $anchor_found delta.internal.dummy 0
execute unless dimension the_nether anchored eyes positioned ^ ^ ^ run function delta:internal/explosion_detection/setup/respawn_anchor_raycast