#> delta:internal/explosion_detection/setup/bed_raycast
#   Recursively checks for a newly placed bed and sets up the marker there if found

execute if block ~ ~ ~ #minecraft:beds[part=foot] align xyz unless entity @e[type=marker,limit=1,distance=..0.01,tag=delta.bed] run function delta:internal/explosion_detection/setup/bed_found

scoreboard players remove $cast_distance delta.internal.dummy 1
execute if score $cast_distance delta.internal.dummy matches 1.. if score $bed_found delta.internal.dummy matches 0 positioned ^ ^ ^0.1 run function delta:internal/explosion_detection/setup/bed_raycast