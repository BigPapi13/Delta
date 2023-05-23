#> delta:internal/effects/dragon_death/initialize
#   Begins the dragon death sequence, recreating the explosion effects

ride @s dismount
tag @s remove delta.dragon_death_intermediate

tag @s add delta.dragon_death
tag @s remove delta.explosion_detection.ender_dragon

data modify storage delta:storage Pos set from entity @s Pos
execute store result score @s delta.internal.x run data get storage delta:storage Pos[0] 64
execute store result score @s delta.internal.y run data get storage delta:storage Pos[1] 64
execute store result score @s delta.internal.z run data get storage delta:storage Pos[2] 64

schedule function delta:internal/effects/dragon_death/tick_wrapper 1t replace

#Grab gateway data at the beginning just for future reference

scoreboard players set $gateway_tracker delta.internal.dummy 0
execute if block 96 75 0 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 1
execute if block 91 75 29 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 2
execute if block 77 75 56 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 4
execute if block 56 75 77 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 8
execute if block 29 75 91 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 16
execute if block -1 75 96 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 32
execute if block -30 75 91 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 64
execute if block -57 75 77 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 128
execute if block -78 75 56 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 256
execute if block -92 75 29 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 512
execute if block -96 75 -1 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 1024
execute if block -92 75 -30 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 2048
execute if block -78 75 -57 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 4096
execute if block -57 75 -78 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 8192
execute if block -30 75 -92 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 16384
execute if block 0 75 -96 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 32768
execute if block 29 75 -92 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 65536
execute if block 56 75 -78 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 131072
execute if block 77 75 -57 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 262144
execute if block 91 75 -30 end_gateway run scoreboard players add $gateway_tracker delta.internal.dummy 524288