#> delta:internal/explosion_detection/wither_tick
#   Checks to see whether the wither should do its spawn explosion

scoreboard players remove @s delta.internal.fuse 1
execute if score @s delta.internal.fuse matches 0 run function delta:internal/explosion_detection/wither_explode
scoreboard players set $continue_loop delta.internal.dummy 1