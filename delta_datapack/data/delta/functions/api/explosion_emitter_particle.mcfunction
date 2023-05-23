#> delta:api/explosion_emitter_particle
#   Replicates the particle effects of an explosion with a radius of 2 or more

execute unless score $count delta.api.particle matches -2147483648..2147483647 run function delta:internal/effects/particle/explosion_emitter/spawn
execute if score $count delta.api.particle matches -2147483648..2147483647 run function delta:internal/effects/particle/explosion_emitter/spread_0