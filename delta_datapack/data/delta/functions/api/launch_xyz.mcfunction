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


#Get looking angle and strength
summon marker ~ ~ ~ {Tags:["delta.xyz_helper"]}
execute as @e[type=marker,tag=delta.xyz_helper] run function delta:internal/math/xyz_to_polar_wrapper

#Launch
execute rotated as @e[type=marker,tag=delta.xyz_helper] run function delta:api/launch_looking

#Kill marker
kill @e[type=marker,tag=delta.xyz_helper]
