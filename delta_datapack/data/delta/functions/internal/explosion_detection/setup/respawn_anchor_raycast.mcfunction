#> delta:internal/explosion_detection/setup/respawn_anchor_raycast
#   Recursively checks for a newly placed respawn anchor and sets up the marker there if found

execute if block ~ ~ ~ minecraft:respawn_anchor align xyz unless entity @e[type=marker,limit=1,distance=..0.01,tag=delta.respawn_anchor] run function delta:internal/explosion_detection/setup/respawn_anchor_found

scoreboard players remove $cast_distance delta.internal.dummy 1
execute if score $cast_distance delta.internal.dummy matches 1.. if score $anchor_found delta.internal.dummy matches 0 positioned ^ ^ ^0.1 run function delta:internal/explosion_detection/setup/respawn_anchor_raycast