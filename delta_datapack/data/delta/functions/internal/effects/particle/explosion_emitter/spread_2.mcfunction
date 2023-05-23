#> delta:internal/effects/particle/explosion/spread_2
#   Applies a distribution to the particles and spawns recursively

data modify storage delta:storage Pos set value [0.0d,0.0d,0.0d]

#> Get x value
scoreboard players operation $min random = $dx delta.api.particle
scoreboard players operation $max random = $dx delta.api.particle
scoreboard players operation $min random *= #constant.-1 delta.internal.math
function random:uniform
scoreboard players operation $particle.x delta.internal.math = $out random
scoreboard players operation $particle.x delta.internal.math *= $out random
scoreboard players operation $particle.x delta.internal.math *= $out random
execute unless score $dx delta.api.particle matches 0 run scoreboard players operation $particle.x delta.internal.math /= $dx delta.api.particle
execute unless score $dx delta.api.particle matches 0 run scoreboard players operation $particle.x delta.internal.math /= $dx delta.api.particle
scoreboard players operation $out random /= #constant.2 delta.internal.math
scoreboard players operation $particle.x delta.internal.math += $out random 
execute store result storage delta:storage Pos[0] double 0.01 run scoreboard players operation $particle.x delta.internal.math += $root.x delta.internal.math

#> Get y value
scoreboard players operation $min random = $dy delta.api.particle
scoreboard players operation $max random = $dy delta.api.particle
scoreboard players operation $min random *= #constant.-1 delta.internal.math
function random:uniform
scoreboard players operation $particle.y delta.internal.math = $out random
scoreboard players operation $particle.y delta.internal.math *= $out random
scoreboard players operation $particle.y delta.internal.math *= $out random
execute unless score $dy delta.api.particle matches 0 run scoreboard players operation $particle.y delta.internal.math /= $dy delta.api.particle
execute unless score $dy delta.api.particle matches 0 run scoreboard players operation $particle.y delta.internal.math /= $dy delta.api.particle
scoreboard players operation $out random /= #constant.2 delta.internal.math
scoreboard players operation $particle.y delta.internal.math += $out random 
execute store result storage delta:storage Pos[1] double 0.01 run scoreboard players operation $particle.y delta.internal.math += $root.y delta.internal.math

#> Get z value
scoreboard players operation $min random = $dz delta.api.particle
scoreboard players operation $max random = $dz delta.api.particle
scoreboard players operation $min random *= #constant.-1 delta.internal.math
function random:uniform
scoreboard players operation $particle.z delta.internal.math = $out random
scoreboard players operation $particle.z delta.internal.math *= $out random
scoreboard players operation $particle.z delta.internal.math *= $out random
execute unless score $dz delta.api.particle matches 0 run scoreboard players operation $particle.z delta.internal.math /= $dz delta.api.particle
execute unless score $dz delta.api.particle matches 0 run scoreboard players operation $particle.z delta.internal.math /= $dz delta.api.particle
scoreboard players operation $out random /= #constant.2 delta.internal.math
scoreboard players operation $particle.z delta.internal.math += $out random 
execute store result storage delta:storage Pos[2] double 0.01 run scoreboard players operation $particle.z delta.internal.math += $root.z delta.internal.math
#> Modify position
data modify entity @s Pos set from storage delta:storage Pos

#> Summon particle
execute at @s run function delta:internal/effects/particle/explosion_emitter/spawn

scoreboard players remove $count delta.api.particle 1
execute if score $count delta.api.particle matches 1.. run function delta:internal/effects/particle/explosion_emitter/spread_2