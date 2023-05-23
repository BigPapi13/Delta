#> delta:internal/effects/particle/explosion_emitter/spawn
#   Replicates the explosion_emitter particle effect

schedule function delta:internal/effects/particle/tick 1t replace
execute summon marker run function delta:internal/effects/particle/explosion_emitter/initialize