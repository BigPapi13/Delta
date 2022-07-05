#> delta:internal/end_ignore_player
#   Shifts the player back into their normal game mode
#
# Callers:
#   > delta:internal/post_explosion_subtick

#Revert player to previous gamemode
gamemode adventure @s[scores={delta.internal.gamemode=0}]
gamemode creative @s[scores={delta.internal.gamemode=1}]
gamemode spectator @s[scores={delta.internal.gamemode=2}]
gamemode survival @s[scores={delta.internal.gamemode=3}]

tag @s remove delta.ignored_player