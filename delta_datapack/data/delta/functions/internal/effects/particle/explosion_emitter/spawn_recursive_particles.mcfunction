#> delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles
#   Recursively spawns the particles for an explosion emitter
#
# Callers:
#   > delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles

#Get random position
data modify storage delta:storage Pos set value [0d,0d,0d]

scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.x delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.x delta.internal.math -= $out random
execute store result storage delta:storage Pos[0] double 0.015625 run scoreboard players operation $spawn.x delta.internal.math += @s delta.internal.x

scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.y delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.y delta.internal.math -= $out random
execute store result storage delta:storage Pos[1] double 0.015625 run scoreboard players operation $spawn.y delta.internal.math += @s delta.internal.y

scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.z delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.z delta.internal.math -= $out random
execute store result storage delta:storage Pos[2] double 0.015625 run scoreboard players operation $spawn.z delta.internal.math += @s delta.internal.z

data modify entity @s Pos set from storage delta:storage Pos
data remove storage delta:storage Pos

#Summon item display
execute at @s summon item_display run function delta:internal/effects/particle/explosion/initialize

scoreboard players add $remaining_particles delta.internal.math 1
execute if score $remaining_particles delta.internal.math matches ..5 run function delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles