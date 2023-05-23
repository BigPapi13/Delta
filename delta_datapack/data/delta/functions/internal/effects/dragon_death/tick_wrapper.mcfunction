#> delta:internal/effects/dragon_death/tick_wrapper
#   Wraps the tick, of course

scoreboard players set $dragon_death_loop_active delta.internal.dummy 0
execute as @e[type=marker,tag=delta.dragon_death] at @s run function delta:internal/effects/dragon_death/tick

execute if score $dragon_death_loop_active delta.internal.dummy matches 1 run schedule function delta:internal/effects/dragon_death/tick_wrapper 10t replace