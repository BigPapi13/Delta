#> delta:internal/pre_explosion_subtick
#   Runs comands as the player after all other entity processing has occurred and before the explosion has occurred
#
# Callers:
#   > delta:pre_explosion_trigger (advancement)

advancement revoke @s only delta:pre_explosion_trigger

#Store previous gamemode before switching
scoreboard players set @s[gamemode=adventure] delta.internal.gamemode 0
scoreboard players set @s[gamemode=creative] delta.internal.gamemode 1
scoreboard players set @s[gamemode=spectator] delta.internal.gamemode 2
scoreboard players set @s[gamemode=survival] delta.internal.gamemode 3

#Put self in creative so only knockback is applied, no damage
gamemode creative

#Make all entities that may be hit by the explosion invincible and NoAI
execute anchored eyes positioned ^ ^ ^ positioned ~-1.5 ~-1.5 ~-1.5 align xyz as @e[dx=2,dy=2,dz=2,type=!player,tag=!delta.launcher,tag=!global.ignore] at @s run function delta:internal/shift_entity

#Put all other players that may be hit by the explosion into spectator mode
tag @s add delta.ignore
execute anchored eyes positioned ^ ^ ^ positioned ~-1.5 ~-1.5 ~-1.5 align xyz as @a[dx=2,dy=2,dz=2,tag=!delta.ignore] at @s run function delta:internal/ignore_player
tag @s remove delta.ignore

#Teleport creeepers down
scoreboard players operation $temp delta.internal.id = @s delta.internal.id
execute as @e[type=creeper,tag=delta.launcher] if score @s delta.internal.id = $temp delta.internal.id at @s run tp @s ~ ~-1000 ~