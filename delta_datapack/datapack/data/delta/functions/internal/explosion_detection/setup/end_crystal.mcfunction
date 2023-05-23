#> delta:internal/explosion_detection/setup/end_crystal
#   Sets up marker for a end crystal

tag @s add delta.explosion_detection.rapid
scoreboard players set @s delta.internal.explosion_size 2
execute on vehicle if entity @s[nbt={ShowBottom:1b}] at @s run function delta:internal/explosion_detection/large_explosion