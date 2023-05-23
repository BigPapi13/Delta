#> delta:internal/effects/dragon_death/intermediate_tick
#   Simulates the flying phase right before death

scoreboard players set $pre_dragon_death_loop_active delta.internal.dummy 1

function delta:internal/effects/dragon_death/death_explosion
tp @s ~ ~1 ~