#> delta:internal/summon/summon_creepers
#   Summons creepers to launch
#
# Callers:
#   > delta:api/launch_looking

tp @s ~ ~ ~ ~ ~
execute store result score $base_rotation delta.internal.math run data get entity @s Rotation[1] 1000000

scoreboard players operation $base_rotation delta.internal.math += $rotation_offset delta.internal.math
execute store result entity @s Rotation[1] float 0.000001 run scoreboard players get $base_rotation delta.internal.math

scoreboard players operation $creepers_remaining delta.internal.math = $creeper_count delta.internal.math
execute rotated as @s positioned ^ ^ ^-0.01 run function delta:internal/summon/summon_creepers_recursive

scoreboard players operation $base_rotation delta.internal.math -= $rotation_offset delta.internal.math
scoreboard players operation $base_rotation delta.internal.math -= $rotation_offset delta.internal.math
execute store result entity @s Rotation[1] float 0.000001 run scoreboard players get $base_rotation delta.internal.math

scoreboard players operation $creepers_remaining delta.internal.math = $creeper_count delta.internal.math
execute rotated as @s positioned ^ ^ ^-0.01 run function delta:internal/summon/summon_creepers_recursive

#Tp back to forceloaded chunks
execute in overworld run tp @s 0.0 0 0.0