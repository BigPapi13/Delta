#> delta:api/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   execute rotated <desired direction>
#   score $strength delta.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Set up bat + arrow to trigger advancement immediately before explosion
function delta:internal/begin_launch_context

#Figure out offset angle to get reduced motion
function delta:internal/math/get_angle

#Summon creepers
execute anchored eyes positioned ^ ^ ^ as @e[type=marker,tag=delta.temp_marker] run function delta:internal/summon_creepers
scoreboard players operation $temp delta.internal.id = @s delta.internal.id
execute as @e[type=creeper,tag=delta.init] at @s run function delta:internal/initialize_creepers

#Set up bat + arrow to trigger advancement immediately after explosion
function delta:internal/end_launch_context