#> delta:internal/math/xyz_to_polar_wrapper
#   Wrapper function to set up the context for converting xyz coordinates to polar coordinates

#Get looking angle and strength
tp @s 0.0 0.0 0.0

execute at @s run function delta:internal/math/xyz_to_polar

#Tp back to forceloaded chunks
execute in overworld run tp @s 0.0 0.0 0.0