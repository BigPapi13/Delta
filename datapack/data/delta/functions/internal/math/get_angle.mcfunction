#> delta:internal/math/get_angle
#   Gets the offset angle to get the proper momentum cancellation and leave the right amount of forceload
#
# Callers:
#   > delta:api/launch_looking

#Determine power coefficient from eye level
function delta:internal/math/get_power_coefficient

#If strength is large, figure out number of creepers needed
scoreboard players operation $creeper_count delta.internal.math = $strength delta.api.launch
scoreboard players operation $momentum_per_iteration delta.internal.math = $divisor delta.internal.math
scoreboard players operation $momentum_per_iteration delta.internal.math *= #constant.100 delta.internal.math
scoreboard players operation $creeper_count delta.internal.math /= $momentum_per_iteration delta.internal.math
scoreboard players add $creeper_count delta.internal.math 1

scoreboard players operation $adjusted_strength delta.internal.math = $strength delta.api.launch
scoreboard players operation $adjusted_strength delta.internal.math /= $creeper_count delta.internal.math


#X: sqrt (p^2 - (d^2)/4) -- d is desired power, p is max possible power produceable by 1 creeper
#Scale factors:
# adjusted_strength: 10000
# $input: 100000000
# p^2: 100000000
# output: 10000

scoreboard players operation $input delta.internal.math = $p_squared delta.internal.math
scoreboard players operation $d delta.internal.math = $adjusted_strength delta.internal.math
scoreboard players operation $d delta.internal.math *= $d delta.internal.math
scoreboard players operation $d delta.internal.math /= #constant.4 delta.internal.math
scoreboard players operation $input delta.internal.math -= $d delta.internal.math

function delta:internal/math/sqrt

#Get atan2
#Angle Marker
summon marker ~ ~ ~ {UUID:[I;235,235,12,23]}
scoreboard players operation $adjusted_strength delta.internal.math /= #constant.2 delta.internal.math
execute as 000000eb-0000-00eb-0000-000c00000017 at @s run function delta:internal/math/arcsin_wrapper