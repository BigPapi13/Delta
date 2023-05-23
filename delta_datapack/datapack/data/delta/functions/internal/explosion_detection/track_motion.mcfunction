#> delta:internal/explosion_detection/track_motion
#   Does some checks to help distinguish whether the shulker bullet hit a block or was destroyed by something else

execute as @s[tag=delta.explosion_detection.shulker_bullet] on vehicle run data modify storage delta:storage Motion set from entity @s Motion
execute as @s[tag=delta.explosion_detection.fireball] on vehicle run data modify storage delta:storage Motion set from entity @s power
execute as @s[tag=delta.explosion_detection.wither] on vehicle run data modify storage delta:storage Motion set from entity @s power
data modify entity @s data.Motion set from storage delta:storage Motion
