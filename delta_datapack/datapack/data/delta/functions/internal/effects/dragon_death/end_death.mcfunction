#> delta:internal/effects/dragon_death/end_death
#   Marks the end of the ender dragon death

kill @s

#Check for gateway

scoreboard players set $current_gateways delta.internal.dummy 0
execute if block 96 75 0 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 1
execute if block 91 75 29 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 2
execute if block 77 75 56 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 4
execute if block 56 75 77 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 8
execute if block 29 75 91 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 16
execute if block -1 75 96 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 32
execute if block -30 75 91 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 64
execute if block -57 75 77 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 128
execute if block -78 75 56 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 256
execute if block -92 75 29 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 512
execute if block -96 75 -1 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 1024
execute if block -92 75 -30 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 2048
execute if block -78 75 -57 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 4096
execute if block -57 75 -78 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 8192
execute if block -30 75 -92 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 16384
execute if block 0 75 -96 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 32768
execute if block 29 75 -92 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 65536
execute if block 56 75 -78 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 131072
execute if block 77 75 -57 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 262144
execute if block 91 75 -30 end_gateway run scoreboard players add $current_gateways delta.internal.dummy 524288

scoreboard players operation $temp delta.internal.dummy = $current_gateways delta.internal.dummy
scoreboard players operation $current_gateways delta.internal.dummy -= $gateway_tracker delta.internal.dummy
scoreboard players operation $gateway_tracker delta.internal.dummy = $temp delta.internal.dummy

execute if score $current_gateways delta.internal.dummy matches 1 positioned 96 75 0 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 2 positioned 91 75 29 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 4 positioned 77 75 56 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 8 positioned 56 75 77 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 16 positioned 29 75 91 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 32 positioned -1 75 96 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 64 positioned -30 75 91 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 128 positioned -57 75 77 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 256 positioned -78 75 56 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 512 positioned -92 75 29 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 1024 positioned -96 75 -1 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 2048 positioned -92 75 -30 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 4096 positioned -78 75 -57 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 8192 positioned -57 75 -78 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 16384 positioned -30 75 -92 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 32768 positioned 0 75 -96 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 65536 positioned 29 75 -92 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 131072 positioned 56 75 -78 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 262144 positioned 77 75 -57 run function delta:internal/explosion_detection/large_explosion
execute if score $current_gateways delta.internal.dummy matches 524288 positioned 91 75 -30 run function delta:internal/explosion_detection/large_explosion