#> delta:internal/math/sqrt
#   Calculates the square root of an input number
#   Credit: Part Toon
#
# Callers:
#   > delta:api/launch_looking
#
# Inputs:
#   score $input delta.internal.math
#
# Outputs:
#   score $output delta.internal.math

# Initialize values

scoreboard players set $output delta.internal.math 0
scoreboard players set $increment delta.internal.math 32768

# Execute recursive function

function delta:internal/math/sqrt_loop