#> delta:internal/subtick/shift_entity
#   Temporarily moves an entity out of the way so it isn't affected by the explosion
#
# Callers:
#   > delta:internal/pre_explosion_subtick

execute store result score @s delta.internal.invulnerable run data get entity @s Invulnerable
data modify entity @s Invulnerable set value 1b

execute store result score @s delta.internal.motion.x run data get entity @s Motion[0] 10000000
execute store result score @s delta.internal.motion.y run data get entity @s Motion[1] 10000000
execute store result score @s delta.internal.motion.z run data get entity @s Motion[2] 10000000

tag @s add delta.shifted