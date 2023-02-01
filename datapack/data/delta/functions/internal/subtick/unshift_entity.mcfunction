#> delta:internal/subtick/unshift_entity
#   Returns entities to their normal position
#
# Callers:
#   > delta:internal/post_explosion_subtick

execute store result entity @s Invulnerable byte 1 run scoreboard players get @s delta.internal.invulnerable

data modify storage delta:storage Motion set value [0d,0d,0d]
execute store result storage delta:storage Motion[0] double 0.0000001 run scoreboard players get @s delta.internal.motion.x
execute store result storage delta:storage Motion[1] double 0.0000001 run scoreboard players get @s delta.internal.motion.y
execute store result storage delta:storage Motion[2] double 0.0000001 run scoreboard players get @s delta.internal.motion.z
data modify entity @s Motion set from storage delta:storage Motion
data remove storage delta:storage Motion


tag @s remove delta.shifted