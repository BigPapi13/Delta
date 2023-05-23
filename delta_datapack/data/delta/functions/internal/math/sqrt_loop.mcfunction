#> delta:internal/math/sqrt_loop
#   Iterates through the square root algorithm
#   Credit: Part Toon
#
# Callers:
#   > delta:internal/math/sqrt_loop

# Compute test
scoreboard players operation $test delta.internal.math = $output delta.internal.math
scoreboard players operation $test delta.internal.math += $increment delta.internal.math
scoreboard players operation $test delta.internal.math *= $test delta.internal.math

# Compare
execute if score $test delta.internal.math <= $input delta.internal.math run scoreboard players operation $output delta.internal.math += $increment delta.internal.math

# Execute recursive function
scoreboard players operation $increment delta.internal.math /= #constant.2 delta.internal.math
execute if score $increment delta.internal.math matches 1.. run function delta:internal/math/sqrt_loop