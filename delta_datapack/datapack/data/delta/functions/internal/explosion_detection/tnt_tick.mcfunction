#> delta:internal/explosion_detection/tnt_tick
#   Commands run by tnt per tick

#Set up score for fuse
execute as @s[tag=!delta.tnt.initialized] run function delta:internal/explosion_detection/setup/tnt

#Decrement fuse and trigger if it hits 0
scoreboard players remove @s delta.internal.fuse 1
execute if score @s delta.internal.fuse matches ..0 at @s run function delta:internal/explosion_detection/large_explosion