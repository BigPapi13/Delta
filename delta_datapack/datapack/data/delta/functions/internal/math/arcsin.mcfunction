#> delta:internal/math/arcsin
#   Calculates arcsin
#
# Callers:
#   > delta:api/launch_looking
#
# Inputs:
#   executed as and at marker
#   score $output delta.internal.math
#   score $adjusted_strength delta.internal.math
#
# Outputs:
#   $rotation_offset delta.internal.math

data modify storage delta:storage Pos set value [0d,0d,0d]
execute store result storage delta:storage Pos[0] double 0.0001 run scoreboard players get $output delta.internal.math
execute store result storage delta:storage Pos[1] double 0.0001 run scoreboard players get $adjusted_strength delta.internal.math
data modify entity @s Pos set from storage delta:storage Pos
data remove storage delta:storage Pos

execute facing entity @s feet run tp @s ~ ~ ~ ~ ~

execute store result score $complementary_angle delta.internal.math run data get entity @s Rotation[1] 1000000
scoreboard players set $rotation_offset delta.internal.math 90000000
scoreboard players operation $rotation_offset delta.internal.math += $complementary_angle delta.internal.math