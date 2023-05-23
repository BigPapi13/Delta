#> delta:internal/effects/particle/explosion_emitter/initialize
#   One-time setup for position score for explosion emitter

tag @s add delta.explosion_emitter
tag @s add global.ignore

data modify storage delta:storage Pos set from entity @s Pos
execute store result score @s delta.internal.x run data get storage delta:storage Pos[0] 64
execute store result score @s delta.internal.y run data get storage delta:storage Pos[1] 64
execute store result score @s delta.internal.z run data get storage delta:storage Pos[2] 64
data remove storage delta:storage Pos

scoreboard players set @s delta.internal.lifetime 1

tag @s remove delta.explosion_emitter.init