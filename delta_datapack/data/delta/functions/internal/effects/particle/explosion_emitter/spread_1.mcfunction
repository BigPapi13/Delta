#> delta:internal/effects/particle/explosion_emitter/spread_1
#   Initial setup

data modify storage delta:storage Pos set from entity @s Pos
execute store result score $root.x delta.internal.math run data get entity @s Pos[0] 100
execute store result score $root.y delta.internal.math run data get entity @s Pos[1] 100
execute store result score $root.z delta.internal.math run data get entity @s Pos[2] 100

function delta:internal/effects/particle/explosion_emitter/spread_2

kill @s