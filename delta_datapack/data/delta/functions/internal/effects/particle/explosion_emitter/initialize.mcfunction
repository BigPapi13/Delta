#> delta:internal/effects/particle/explosion_emitter/initialize
#   One-time setup for position score for explosion emitter

execute store result score @s delta.api.x run data get entity @s Pos[0] 64
execute store result score @s delta.api.y run data get entity @s Pos[1] 64
execute store result score @s delta.api.z run data get entity @s Pos[2] 64

scoreboard players set @s delta.internal.lifetime 1

tag @s remove delta.explosion_emitter.init