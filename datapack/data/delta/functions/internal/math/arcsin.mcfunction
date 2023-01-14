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

execute store result entity @s Pos[0] double 0.0001 run scoreboard players get $output delta.internal.math
execute store result entity @s Pos[1] double 0.0001 run scoreboard players get $adjusted_strength delta.internal.math

execute facing entity @s feet run tp @s ~ ~ ~ ~ ~

execute store result score $complementary_angle delta.internal.math run data get entity @s Rotation[1] 1000000
scoreboard players set $rotation_offset delta.internal.math 90000000
scoreboard players operation $rotation_offset delta.internal.math += $complementary_angle delta.internal.math