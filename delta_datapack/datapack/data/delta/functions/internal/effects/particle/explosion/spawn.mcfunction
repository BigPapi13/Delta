#> delta:internal/effects/particle/explosion/spawn
#   Summons a fake explosion particle, since real ones are untextured

schedule function delta:internal/effects/particle/tick 1t replace
scoreboard players set $temp delta.internal.size 1
execute summon item_display run function delta:internal/effects/particle/explosion/initialize