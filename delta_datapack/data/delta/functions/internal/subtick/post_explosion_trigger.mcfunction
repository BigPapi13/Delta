#> delta:internal/subtick/post_explosion_trigger
#   Runs commands as the player immediately after the creeper explosion has been processed
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
execute anchored eyes positioned ^ ^ ^ positioned ~-2.5 ~-2.5 ~-2.5 align xyz as @e[type=!player,tag=delta.shifted,dx=4,dy=4,dz=4] at @s run function delta:internal/subtick/unshift_entity
execute anchored eyes positioned ^ ^ ^ positioned ~-2.5 ~9997.5 ~-2.5 align xyz as @a[tag=delta.ignored_player,dx=4,dy=4,dz=4] at @s run function delta:internal/subtick/end_ignore_player

#Revert mobGriefing gamerule if necessary
execute if score $temp delta.internal.mobgriefing matches 1 run gamerule mobGriefing true
#Revert difficulty if necessary
execute if score $diff delta.internal.gamemode matches 0 run difficulty peaceful