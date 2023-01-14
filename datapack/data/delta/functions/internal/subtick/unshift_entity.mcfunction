#> delta:internal/subtick/unshift_entity
#   Returns entities to their normal position
#
# Callers:
#   > delta:internal/post_explosion_subtick

execute store result entity @s Invulnerable byte 1 run scoreboard players get @s delta.internal.invulnerable

execute store result entity @s Motion[0] double 0.0000001 run scoreboard players get @s delta.internal.motion.x
execute store result entity @s Motion[1] double 0.0000001 run scoreboard players get @s delta.internal.motion.y
execute store result entity @s Motion[2] double 0.0000001 run scoreboard players get @s delta.internal.motion.z


tag @s remove delta.shifted