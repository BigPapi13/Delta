#> delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles
#   Recursively spawns the particles for an explosion emitter
#
# Callers:
#   > delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles

#Get random position
scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.x delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.x delta.internal.math -= $out random
execute store result entity @s Pos[0] double 0.015625 run scoreboard players operation $spawn.x delta.internal.math += @s delta.api.x

scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.y delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.y delta.internal.math -= $out random
execute store result entity @s Pos[1] double 0.015625 run scoreboard players operation $spawn.y delta.internal.math += @s delta.api.y

scoreboard players set $min random 0
scoreboard players set $max random 256
function random:uniform
scoreboard players operation $spawn.z delta.internal.math = $out random
function random:uniform
scoreboard players operation $spawn.z delta.internal.math -= $out random
execute store result entity @s Pos[2] double 0.015625 run scoreboard players operation $spawn.z delta.internal.math += @s delta.api.z

#Summon snowball
execute at @s run summon snowball ~ ~ ~ {Tags:["delta.explosion_particle","delta.explosion_particle.init"],NoGravity:1b,Item:{id:"minecraft:lingering_potion",Count:1b,tag:{CustomModelData:130000,CustomPotionColor:16777215}}}

scoreboard players add $remaining_particles delta.internal.math 1
execute if score $remaining_particles delta.internal.math matches ..5 run function delta:internal/effects/particle/explosion_emitter/spawn_recursive_particles