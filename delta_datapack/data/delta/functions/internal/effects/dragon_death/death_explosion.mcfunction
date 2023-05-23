#> delta:internal/effects/dragon_death/death_explosion
#   Simulates a single explosion from the death sequence

scoreboard players set $min random -256
scoreboard players set $max random 256
function random:uniform
execute store result storage delta:storage Pos[0] double 0.015625 run scoreboard players operation $out random += @s delta.internal.x
function random:uniform
execute store result storage delta:storage Pos[2] double 0.015625 run scoreboard players operation $out random += @s delta.internal.z

scoreboard players set $min random -128
scoreboard players set $max random 128
function random:uniform
execute store result storage delta:storage Pos[1] double 0.015625 run scoreboard players operation $out random += @s delta.internal.y

execute at @s run function delta:internal/effects/particle/explosion_emitter/spawn
