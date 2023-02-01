#> delta:internal/subtick/shift_entity
#   Temporarily moves an entity out of the way so it isn't affected by the explosion
#
# Callers:
#   > delta:internal/pre_explosion_subtick

#Set Invulnerable to 1b and get whether the original value was 0b.
execute store success score @s delta.internal.invulnerable run data modify entity @s Invulnerable set value 1b
#Invert 0b/1b
execute store success score @s delta.internal.invulnerable if score @s delta.internal.invulnerable matches 0

data modify storage delta:storage Motion set from entity @s Motion
execute store result score @s delta.internal.motion.x run data get storage delta:storage Motion[0] 10000000
execute store result score @s delta.internal.motion.y run data get storage delta:storage Motion[1] 10000000
execute store result score @s delta.internal.motion.z run data get storage delta:storage Motion[2] 10000000
data remove storage delta:storage Motion

tag @s add delta.shifted