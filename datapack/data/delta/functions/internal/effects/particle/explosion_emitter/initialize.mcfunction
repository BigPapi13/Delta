#> delta:internal/effects/particle/explosion_emitter/initialize
#   One-time setup for position score for explosion emitter

data modify storage delta:storage Pos set from entity @s Pos
execute store result score @s delta.api.x run data get storage delta:storage Pos[0] 64
execute store result score @s delta.api.y run data get storage delta:storage Pos[1] 64
execute store result score @s delta.api.z run data get storage delta:storage Pos[2] 64
data remove storage delta:storage Pos

scoreboard players set @s delta.internal.lifetime 1

tag @s remove delta.explosion_emitter.init