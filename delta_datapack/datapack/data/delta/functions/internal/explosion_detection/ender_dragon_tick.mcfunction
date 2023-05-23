#> delta:internal/explosion_detection/ender_dragon_tick
#   Used to detect when the ender dragon dies

scoreboard players set $continue_loop delta.internal.dummy 1
execute unless entity @e[type=ender_dragon] run function delta:internal/effects/dragon_death/initialize
execute unless entity @s[tag=delta.dragon_death_intermediate] on vehicle if entity @s[nbt={DragonPhase:9}] on passengers as @s[type=marker,tag=delta.explosion_detection.ender_dragon] run function delta:internal/effects/dragon_death/intermediate_initialize