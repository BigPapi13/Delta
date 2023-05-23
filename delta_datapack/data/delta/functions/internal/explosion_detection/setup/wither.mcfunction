#> delta:internal/explosion_detection/setup/wither
#   Initializes wither spawn explosion detection

tag @s add delta.wither.processed
execute store result score @s delta.internal.fuse run data get entity @s Invul

#Start checking loop
schedule function delta:internal/explosion_detection/wither_tick_wrapper 1t replace