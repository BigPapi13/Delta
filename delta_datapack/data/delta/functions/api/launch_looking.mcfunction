#> delta:api/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   execute rotated <desired direction>
#   score $strength delta.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called delta.internal.dummy 1
tag @s add delta.launch

execute as ba8a076c-9a37-49bb-bead-79c12d22458a in minecraft:overworld positioned 0.0 0.0 0.0 run function delta:internal/math/polar_to_xyz

scoreboard players operation @s delta.internal.x += $out delta.internal.x
scoreboard players operation @s delta.internal.y += $out delta.internal.y
scoreboard players operation @s delta.internal.z += $out delta.internal.z