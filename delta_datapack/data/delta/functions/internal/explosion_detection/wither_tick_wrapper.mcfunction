#> delta:internal/explosion_detection/wither_tick_wrapper

scoreboard players set $continue_loop delta.internal.dummy 0
execute as @e[type=wither,tag=delta.wither.processed,tag=!delta.wither.exploded] at @s run function delta:internal/explosion_detection/wither_tick

execute if score $continue_loop delta.internal.dummy matches 1 run schedule function delta:internal/explosion_detection/wither_tick_wrapper 1t replace