#> delta:internal/explosion_detection/mooshroom
#   Sets up and schedules for mooshroom

advancement revoke @s only delta:sheared_mooshroom

schedule function delta:internal/effects/particle/tick 1t replace
scoreboard players set $temp delta.internal.size 2
execute as @e[type=cow,tag=!delta.checked_cow,distance=..7,limit=1,sort=nearest] at @s positioned ~ ~1 ~ run execute summon item_display run function delta:internal/effects/particle/explosion/initialize
tag @e[type=cow,tag=!delta.checked_cow,distance=..7,limit=1,sort=nearest] add delta.checked_cow