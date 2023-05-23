#> delta:internal/effects/particle/explosion_emitter/tick
#   Ticks the explosion_emitter particle replication

scoreboard players set $particle_loop_active delta.internal.dummy 1

scoreboard players add @s delta.internal.lifetime 1
scoreboard players operation $temp delta.internal.size = @s delta.internal.lifetime

scoreboard players set $remaining_particles delta.internal.math 0
function delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles
tp @s ~ ~ ~

execute if score @s delta.internal.lifetime matches 8.. run kill @s