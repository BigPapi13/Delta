#> delta:internal/explosion_detection/setup/creeper
#   Sets up marker for a creeper

tag @s add delta.explosion_detection.slow
tag @s add delta.explosion_detection.creeper
execute store result score @s delta.internal.explosion_size on vehicle run data get entity @s ExplosionRadius