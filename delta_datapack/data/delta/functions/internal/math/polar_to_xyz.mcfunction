#> delta:internal/math/polar_to_xyz
#   Converts a looking direction and magnitude into xyz coordinates

tp @s ^ ^ ^1
data modify storage delta:storage Pos set from entity @s Pos

execute store result score $out delta.internal.x run data get storage delta:storage Pos[0] 4096
execute store result score $out delta.internal.y run data get storage delta:storage Pos[1] 4096
execute store result score $out delta.internal.z run data get storage delta:storage Pos[2] 4096

scoreboard players operation $out delta.internal.y *= $strength delta.api.launch
scoreboard players operation $out delta.internal.x *= $strength delta.api.launch
scoreboard players operation $out delta.internal.z *= $strength delta.api.launch

scoreboard players operation $out delta.internal.x /= #constant.4096 delta.internal.math
scoreboard players operation $out delta.internal.y /= #constant.4096 delta.internal.math
scoreboard players operation $out delta.internal.z /= #constant.4096 delta.internal.math

tp @s 0.0 0.0 0.0