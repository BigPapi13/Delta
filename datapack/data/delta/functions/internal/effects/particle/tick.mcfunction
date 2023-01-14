#> delta:internal/effects/particle/tick
#   Manually recreates particle effects and noises for explosions
#
# Callers:
#   > delta:internal/technical/main

execute as @e[type=snowball,tag=delta.explosion_particle] run function delta:internal/effects/particle/explosion/tick
execute as @e[type=marker,tag=delta.explosion_emitter] at @s run function delta:internal/effects/particle/explosion_emitter/tick