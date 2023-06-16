#> delta:internal/subtick/ignore_player
#   Puts the player into spectator mode while the explosion is occurring
#
# Callers:
#   > delta:internal/subtick/pre_explosion_trigger

#Store previous gamemode before switching
#scoreboard players set @s[gamemode=adventure] delta.internal.gamemode 0
#scoreboard players set @s[gamemode=creative] delta.internal.gamemode 1
#scoreboard players set @s[gamemode=spectator] delta.internal.gamemode 2
#scoreboard players set @s[gamemode=survival] delta.internal.gamemode 3

#gamemode spectator
tp @s ~ ~10000 ~

tag @s add delta.ignored_player