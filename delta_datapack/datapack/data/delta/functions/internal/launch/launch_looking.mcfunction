#> delta:internal/launch/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   execute rotated <desired direction>
#   score $temp_strength delta.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Set up bat + arrow to trigger advancement immediately before explosion
function delta:internal/subtick/begin_launch_context

#Figure out offset angle to get reduced motion
function delta:internal/math/get_angle

#Check if peaceful
execute store result score $diff delta.internal.gamemode run difficulty
execute if score $diff delta.internal.gamemode matches 0 run difficulty easy

#Summon creepers
execute anchored eyes positioned ^ ^ ^ as ba8a076c-9a37-49bb-bead-79c12d22458a run function delta:internal/summon/summon_creepers
scoreboard players operation $temp delta.internal.id = @s delta.internal.id
execute anchored eyes positioned ^ ^ ^ positioned ~ ~1000 ~ as @e[type=creeper,tag=delta.init,distance=..0.02] at @s run function delta:internal/summon/initialize_creepers

#Set up bat + arrow to trigger advancement immediately after explosion
function delta:internal/subtick/end_launch_context
