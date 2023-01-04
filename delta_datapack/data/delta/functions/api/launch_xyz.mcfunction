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
summon marker ~ ~ ~ {UUID:[I;88,66,22,11]}
execute as 00000058-0000-0042-0000-00160000000b run function delta:internal/math/xyz_to_polar_wrapper

#Launch
execute rotated as 00000058-0000-0042-0000-00160000000b run function delta:api/launch_looking

#Kill marker
kill 00000058-0000-0042-0000-00160000000b
