#> delta:internal/effects/particle/explosion_emitter/tick
#   Ticks the explosion_emitter particle replication

#Set starting custom model data and recursively spawn explosion particles
scoreboard players operation $temp delta.internal.size = @s delta.internal.lifetime
scoreboard players remove $temp delta.internal.size 1
scoreboard players operation $temp delta.internal.size *= #constant.16 delta.internal.math
scoreboard players add $temp delta.internal.size 130000

scoreboard players set $remaining_particles delta.internal.math 0
function delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles
execute as @e[type=snowball,tag=delta.explosion_particle.init] run function delta:internal/effects/particle/explosion/initialize
tp @s ~ ~ ~

scoreboard players add @s delta.internal.lifetime 1
execute if score @s delta.internal.lifetime matches 8.. run kill @s