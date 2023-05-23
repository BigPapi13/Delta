#> delta:internal/explosion_detection/ender_dragon_tick_wrapper
#   Description here

scoreboard players set $continue_loop delta.internal.dummy 0
execute as @e[type=marker,tag=delta.explosion_detection.ender_dragon] at @s run function delta:internal/explosion_detection/ender_dragon_tick

execute if score $continue_loop delta.internal.dummy matches 1 run schedule function delta:internal/explosion_detection/ender_dragon_tick_wrapper 1t replace