#> delta:internal/math/xyz_to_polar_wrapper
#   Wrapper function to set up the context for converting xyz coordinates to polar coordinates

tp @s 0.0 0.0 0.0
execute at @s run function delta:internal/math/xyz_to_polar
tp @s ~ ~ ~