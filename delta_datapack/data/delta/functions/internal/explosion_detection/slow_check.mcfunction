#> delta:internal/explosion_detection/slow_check
#   Slow checks things like creepers to swap them in and out of active mode

execute as @s[tag=!delta.explosion_detection.rapid] if entity @a[distance=..15] run tag @s add delta.explosion_detection.rapid
execute as @s[tag=delta.explosion_detection.rapid] unless entity @a[distance=..15] run tag @s remove delta.explosion_detection.rapid
execute as @s[tag=delta.explosion_detection.rapid] on vehicle unless data entity @s {DeathTime:0s} on passengers run kill @s[tag=delta.explosion_tracker]
execute as @s[predicate=!delta:riding_entity] run kill @s