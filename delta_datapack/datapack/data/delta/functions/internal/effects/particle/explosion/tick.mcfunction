#> delta:internal/effects/particle/explosion/tick
#   Animates the explosion particle

scoreboard players set $particle_loop_active delta.internal.dummy 1

scoreboard players add @s delta.internal.frame 1
scoreboard players set $temp delta.internal.frame 15
scoreboard players operation $temp delta.internal.frame *= @s delta.internal.frame
scoreboard players operation $temp delta.internal.frame /= @s delta.internal.lifetime
scoreboard players add $temp delta.internal.frame 130000

#execute store result entity @s Item.tag.CustomModelData int 1 run scoreboard players get $temp delta.internal.frame
execute store result storage delta:storage CustomModelData int 1 run scoreboard players get $temp delta.internal.frame
item modify entity @s container.0 delta:set_frame

execute if score @s delta.internal.frame > @s delta.internal.lifetime run kill @s