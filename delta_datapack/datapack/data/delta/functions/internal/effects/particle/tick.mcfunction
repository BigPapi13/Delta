#> delta:internal/effects/particle/tick
#   Manually recreates particle effects and noises for explosions
#
# Callers:
#   > delta:internal/effects/particle/explosion/spawn
#   > delta:internal/effects/particle/explosion_emitter/spawn

scoreboard players set $particle_loop_active delta.internal.dummy 0
execute as @e[type=item_display,tag=delta.explosion_particle] run function delta:internal/effects/particle/explosion/tick
execute as @e[type=marker,tag=delta.explosion_emitter] at @s run function delta:internal/effects/particle/explosion_emitter/tick

#Only continue checking if there are still existing particles
execute if score $particle_loop_active delta.internal.dummy matches 1 run schedule function delta:internal/effects/particle/tick 1t replace