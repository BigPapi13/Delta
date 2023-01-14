#> delta:internal/effects/particle/explosion/tick
#   Animates the explosion particle

scoreboard players add @s delta.internal.frame 1
scoreboard players set $temp delta.internal.frame 15
scoreboard players operation $temp delta.internal.frame *= @s delta.internal.frame
scoreboard players operation $temp delta.internal.frame /= @s delta.internal.lifetime
scoreboard players operation $temp delta.internal.frame += @s delta.internal.size

execute store result entity @s Item.tag.CustomModelData int 1 run scoreboard players get $temp delta.internal.frame
data modify entity @s Motion set value [0.0d,0.0d,0.0d]

execute if score @s delta.internal.frame > @s delta.internal.lifetime run kill @s