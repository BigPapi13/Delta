#> delta:internal/math/get_angle
#   Gets the offset angle to get the proper momentum cancellation and leave the right amount of forceload
#
# Callers:
#   > delta:api/launch_looking

#Determine power coefficient from eye level
function delta:internal/math/get_power_coefficient

#If strength is large, figure out number of creepers needed
scoreboard players operation $creeper_count delta.internal.math = $temp_strength delta.api.launch
scoreboard players operation $momentum_per_iteration delta.internal.math = $divisor delta.internal.math
scoreboard players operation $momentum_per_iteration delta.internal.math *= #constant.100 delta.internal.math
scoreboard players operation $creeper_count delta.internal.math /= $momentum_per_iteration delta.internal.math
scoreboard players add $creeper_count delta.internal.math 1

scoreboard players operation $adjusted_strength delta.internal.math = $temp_strength delta.api.launch
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
scoreboard players operation $adjusted_strength delta.internal.math /= #constant.2 delta.internal.math
execute in overworld as d59ee2c6-58c8-4885-b9db-ecff066e4439 positioned 0.0 0.0 0.0 run function delta:internal/math/arcsin

#Get relative to current angle
execute store result storage delta:macros rotation.positive int 0.000001 run scoreboard players get $rotation_offset delta.internal.math
execute store result storage delta:macros rotation.negative int -0.000001 run scoreboard players get $rotation_offset delta.internal.math