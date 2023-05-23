#> delta:internal/effects/particle/explosion_emitter/spread_0
#   Applies a distribution to the particles and spawns recursively

execute summon marker run function delta:internal/effects/particle/explosion_emitter/spread_1

scoreboard players reset $dx delta.api.particle
scoreboard players reset $dy delta.api.particle
scoreboard players reset $dz delta.api.particle
scoreboard players reset $count delta.api.particle