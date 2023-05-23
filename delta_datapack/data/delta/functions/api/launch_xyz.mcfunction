#> delta:api/launch_xyz
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   score $x delta.api.launch       <<< Strength to launch in x direction
#   score $y delta.api.launch       <<< Strength to launch in y direction
#   score $z delta.api.launch       <<< Strength to launch in z direction
#
# Outputs
#   player is launched in the specified direction

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called delta.internal.dummy 1
tag @s add delta.launch

scoreboard players operation @s delta.internal.x += $x delta.api.launch
scoreboard players operation @s delta.internal.y += $y delta.api.launch
scoreboard players operation @s delta.internal.z += $z delta.api.launch

