#> delta:internal/subtick/shift_entity
#   Temporarily moves an entity out of the way so it isn't affected by the explosion
#
# Callers:
#   > delta:internal/pre_explosion_subtick

execute store result score @s delta.internal.invulnerable run data get entity @s Invulnerable
data modify entity @s Invulnerable set value 1b

data modify storage delta:storage Motion set from entity @s Motion
execute store result score @s delta.internal.motion.x run data get storage delta:storage Motion[0] 10000000
execute store result score @s delta.internal.motion.y run data get storage delta:storage Motion[1] 10000000
execute store result score @s delta.internal.motion.z run data get storage delta:storage Motion[2] 10000000
data remove storage delta:storage Motion

tag @s add delta.shifted