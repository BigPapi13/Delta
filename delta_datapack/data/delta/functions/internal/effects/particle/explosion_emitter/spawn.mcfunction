#> delta:internal/effects/particle/explosion_emitter/spawn
#   Replicates the explosion_emitter particle effect

summon marker ~ ~ ~ {Tags:["delta.explosion_emitter","delta.explosion_emitter.init","global.ignore"]}
execute as @e[type=marker,tag=delta.explosion_emitter.init] run function delta:internal/effects/particle/explosion_emitter/initialize