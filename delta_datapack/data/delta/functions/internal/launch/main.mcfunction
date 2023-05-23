#> delta:internal/launch/main
#   Executes the commands to launch the player
#
# Inputs:
#   score @s delta.internal.x    <<< Strength to launch in x direction
#   score @s delta.internal.y    <<< Strength to launch in y direction
#   score @s delta.internal.z    <<< Strength to launch in z direction

scoreboard players operation $temp delta.internal.x = @s delta.internal.x
scoreboard players operation $temp delta.internal.y = @s delta.internal.y
scoreboard players operation $temp delta.internal.z = @s delta.internal.z

execute as d59ee2c6-58c8-4885-b9db-ecff066e4439 in overworld run function delta:internal/math/xyz_to_polar_wrapper
execute rotated as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function delta:internal/launch/launch_looking

#Disables flag indicating that players need to be launched and removes tag
scoreboard players set $function_called delta.internal.dummy 0
tag @s remove delta.launch

#Reset scoreboards
scoreboard players reset @s delta.internal.x
scoreboard players reset @s delta.internal.y
scoreboard players reset @s delta.internal.z