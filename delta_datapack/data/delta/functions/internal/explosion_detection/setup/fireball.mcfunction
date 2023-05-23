#> delta:internal/explosion_detection/setup/fireball
#   Sets up marker for a fireball

tag @s add delta.explosion_detection.rapid
tag @s add delta.explosion_detection.fireball
tag @s add delta.explosion_detection.adjust
tag @s add delta.explosion_detection.track_motion
execute store result score @s delta.internal.explosion_size on vehicle run data get entity @s ExplosionPower

execute on vehicle run data modify storage delta:storage Motion set from entity @s power
data modify entity @s data.Motion set from storage delta:storage Motion
