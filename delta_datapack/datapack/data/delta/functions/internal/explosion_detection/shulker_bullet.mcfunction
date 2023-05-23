#> delta:internal/explosion_detection/shulker_bullet
#   Creates the shulker bullet explosion effect if the conditions are right

scoreboard players set $cancel delta.internal.dummy 1

data modify storage delta:storage Pos set from entity @s Pos
execute store result score $pos.x delta.internal.math run data get storage delta:storage Pos[0] 64
execute store result score $pos.y delta.internal.math run data get storage delta:storage Pos[1] 64
execute store result score $pos.z delta.internal.math run data get storage delta:storage Pos[2] 64

data modify storage delta:storage Motion set from entity @s data.Motion
execute store result score $motion.x delta.internal.math run data get storage delta:storage Motion[0] 64
execute store result score $motion.y delta.internal.math run data get storage delta:storage Motion[1] 64
execute store result score $motion.z delta.internal.math run data get storage delta:storage Motion[2] 64

execute store result storage delta:storage Pos[0] double 0.015625 run scoreboard players operation $pos.x delta.internal.math += $motion.x delta.internal.math
execute store result storage delta:storage Pos[1] double 0.015625 run scoreboard players operation $pos.y delta.internal.math += $motion.y delta.internal.math
execute store result storage delta:storage Pos[2] double 0.015625 run scoreboard players operation $pos.z delta.internal.math += $motion.z delta.internal.math
data modify entity @s Pos set from storage delta:storage Pos


#Check for collision
scoreboard players set $block_hit delta.internal.dummy 0
execute unless block ~ ~ ~ #delta:no_collision run scoreboard players set $block_hit delta.internal.dummy 1
execute facing entity @s feet positioned as @s unless block ^ ^ ^0.15 #delta:no_collision run scoreboard players set $block_hit delta.internal.dummy 1
execute facing entity @s feet positioned as @s unless block ^ ^ ^0.3 #delta:no_collision run scoreboard players set $block_hit delta.internal.dummy 1

execute if score $block_hit delta.internal.dummy matches 1 run function delta:internal/explosion_detection/shulker_explosion

kill @s