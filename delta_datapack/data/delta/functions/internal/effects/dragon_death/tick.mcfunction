#> delta:internal/effects/dragon_death/tick
#   Simulates the dragon's death

scoreboard players set $dragon_death_loop_active delta.internal.dummy 1

execute unless score @s delta.internal.lifetime matches 21.. run function delta:internal/effects/dragon_death/death_explosion
tp @s ~ ~1 ~

scoreboard players add @s delta.internal.lifetime 1

execute if score @s delta.internal.lifetime matches 22 run function delta:internal/effects/dragon_death/end_death