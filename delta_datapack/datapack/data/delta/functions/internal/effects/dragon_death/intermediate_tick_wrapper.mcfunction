#> delta:internal/effects/dragon_death/tick_wrapper
#   Wraps the tick, of course

scoreboard players set $pre_dragon_death_loop_active delta.internal.dummy 0
execute as @e[type=marker,tag=delta.dragon_death_intermediate] at @s run function delta:internal/effects/dragon_death/intermediate_tick

execute if score $pre_dragon_death_loop_active delta.internal.dummy matches 1 run schedule function delta:internal/effects/dragon_death/intermediate_tick_wrapper 10t replace