#> delta:internal/subtick/post_explosion_trigger
#   Runs comands as the player immediately after the creeper explosion has been processed
#
# Callers:
#   > delta:post_explosion_trigger (advancement)

advancement revoke @s only delta:post_explosion_trigger

#Revert player to previous gamemode
gamemode adventure @s[scores={delta.internal.gamemode=0}]
gamemode creative @s[scores={delta.internal.gamemode=1}]
gamemode spectator @s[scores={delta.internal.gamemode=2}]
gamemode survival @s[scores={delta.internal.gamemode=3}]

#Any entities ignoring the explosion are returned to normal
execute as @e[tag=delta.shifted] at @s run function delta:internal/subtick/unshift_entity
execute as @a[tag=delta.ignored_player] run function delta:internal/subtick/end_ignore_player

#Revert mobgriefing gamerule if necessary
execute if score $temp delta.internal.mobgriefing matches 1 run gamerule mobGriefing true