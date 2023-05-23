#> delta:internal/explosion_detection/marker_tick
#   Commands run by explosion tracker markers each tick

execute as @s[predicate=!delta:riding_entity] run function delta:internal/explosion_detection/simulate_explosion
execute as @s[tag=delta.explosion_detection.track_motion] at @s run function delta:internal/explosion_detection/track_motion