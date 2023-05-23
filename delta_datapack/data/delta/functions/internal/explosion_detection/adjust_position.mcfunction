#> delta:internal/explosion_detection/adjust_position
#   Nudges the explosion a little bit to account for the riding entity lagging behind

data modify storage delta:storage Pos set from entity @s Pos
execute store result score $pos.x delta.internal.math run data get storage delta:storage Pos[0] 64
execute store result score $pos.y delta.internal.math run data get storage delta:storage Pos[1] 64
execute store result score $pos.z delta.internal.math run data get storage delta:storage Pos[2] 64

data modify storage delta:storage Motion set from entity @s data.Motion
execute store result score $motion.x delta.internal.math run data get storage delta:storage Motion[0] 128
execute store result score $motion.y delta.internal.math run data get storage delta:storage Motion[1] 128
execute store result score $motion.z delta.internal.math run data get storage delta:storage Motion[2] 128

execute store result storage delta:storage Pos[0] double 0.015625 run scoreboard players operation $pos.x delta.internal.math += $motion.x delta.internal.math
execute store result storage delta:storage Pos[1] double 0.015625 run scoreboard players operation $pos.y delta.internal.math += $motion.y delta.internal.math
execute store result storage delta:storage Pos[2] double 0.015625 run scoreboard players operation $pos.z delta.internal.math += $motion.z delta.internal.math
data modify entity @s Pos set from storage delta:storage Pos
