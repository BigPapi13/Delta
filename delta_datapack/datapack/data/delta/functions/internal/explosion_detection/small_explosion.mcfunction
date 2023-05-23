#> delta:internal/explosion_detection/small_explosion
#   Simulates a small explosion

schedule function delta:internal/effects/particle/tick 1t replace
scoreboard players set $temp delta.internal.size 8
playsound minecraft:delta.entity.generic.explode block @a ~ ~ ~ 4.0 0.7
execute summon item_display run function delta:internal/effects/particle/explosion/initialize