#> delta:internal/effects/particle/explosion/initialize
#   Sets up starting parameters for explosion particle

#Set initial data
tag @s add delta.explosion_particle

execute if score $temp delta.internal.size matches 1 run data modify storage delta:storage data_to_apply.transformation.scale set value [3.75f,3.75f,0.0f]
execute if score $temp delta.internal.size matches 2 run data modify storage delta:storage data_to_apply.transformation.scale set value [3.50f,3.50f,0.0f]
execute if score $temp delta.internal.size matches 3 run data modify storage delta:storage data_to_apply.transformation.scale set value [3.25f,3.25f,0.0f]
execute if score $temp delta.internal.size matches 4 run data modify storage delta:storage data_to_apply.transformation.scale set value [3.00f,3.00f,0.0f]
execute if score $temp delta.internal.size matches 5 run data modify storage delta:storage data_to_apply.transformation.scale set value [2.75f,2.75f,0.0f]
execute if score $temp delta.internal.size matches 6 run data modify storage delta:storage data_to_apply.transformation.scale set value [2.50f,2.50f,0.0f]
execute if score $temp delta.internal.size matches 7 run data modify storage delta:storage data_to_apply.transformation.scale set value [2.25f,2.25f,0.0f]
execute if score $temp delta.internal.size matches 8 run data modify storage delta:storage data_to_apply.transformation.scale set value [2.00f,2.00f,0.0f]

#Set up random color
scoreboard players set $min random 102
scoreboard players set $max random 255
function random:uniform

scoreboard players operation $tint delta.internal.math = $out random
scoreboard players operation $tint delta.internal.math *= #constant.65793 delta.internal.math

execute store result storage delta:storage data_to_apply.item.tag.CustomPotionColor int 1 run scoreboard players get $tint delta.internal.math


#Set up random lifetime
scoreboard players set $min random 6
scoreboard players set $max random 10
function random:uniform
scoreboard players operation @s delta.internal.lifetime = $out random

#Save size CMD offset
scoreboard players set @s delta.internal.size 130000

#Merge data
data modify entity @s {} merge from storage delta:storage data_to_apply