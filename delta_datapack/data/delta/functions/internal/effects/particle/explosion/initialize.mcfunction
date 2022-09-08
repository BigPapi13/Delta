#> delta:internal/effects/particle/explosion/initialize
#   Sets up starting parameters for explosion particle

#Set up random color
scoreboard players set $min random 102
scoreboard players set $max random 255
function random:uniform

scoreboard players operation $tint delta.internal.math = $out random
scoreboard players operation $tint_add delta.internal.math = $tint delta.internal.math
scoreboard players operation $tint_add delta.internal.math *= #constant.256 delta.internal.math
scoreboard players operation $tint delta.internal.math += $tint_add delta.internal.math
scoreboard players operation $tint_add delta.internal.math *= #constant.256 delta.internal.math
scoreboard players operation $tint delta.internal.math += $tint_add delta.internal.math

execute store result entity @s Item.tag.CustomPotionColor int 1 run scoreboard players get $tint delta.internal.math


#Set up random lifetime
scoreboard players set $min random 6
scoreboard players set $max random 10
function random:uniform
scoreboard players operation @s delta.internal.lifetime = $out random

#Save size CMD offset
scoreboard players operation @s delta.internal.size = $temp delta.internal.size

tag @s remove delta.explosion_particle.init