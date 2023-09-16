#> delta:internal/subtick/pre_explosion_trigger
#   Runs commands as the player after all other entity processing has occurred and before the explosion has occurred
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

#Teleport self up
tp @s ~ ~1000 ~

#Save equipment in shulker box
item replace block 100000 0 100000 container.0 from entity @s weapon.mainhand
item replace block 100000 0 100000 container.1 from entity @s weapon.offhand
item replace block 100000 0 100000 container.2 from entity @s armor.feet
item replace block 100000 0 100000 container.3 from entity @s armor.legs
item replace block 100000 0 100000 container.4 from entity @s armor.chest
item replace block 100000 0 100000 container.5 from entity @s armor.head

#temporarily remove equipment
item replace entity @s armor.feet with minecraft:air
item replace entity @s armor.legs with minecraft:air
item replace entity @s armor.chest with minecraft:air
item replace entity @s armor.head with minecraft:air

#Temporarily disable mobGriefing (not usually necessary unless a positive explosion radius creeper is used)
execute store result score $temp delta.internal.mobgriefing run gamerule mobGriefing
gamerule mobGriefing false
