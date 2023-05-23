#> delta:internal/explosion_detection/setup/tnt
#   Grabs initial fuse of tnt

execute store result score @s delta.internal.fuse run data get entity @s Fuse
tag @s add delta.tnt.initialized