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


execute as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function delta:internal/math/xyz_to_polar_wrapper
execute rotated as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function delta:api/launch_looking