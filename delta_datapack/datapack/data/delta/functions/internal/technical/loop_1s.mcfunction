#> delta:internal/technical/loop_1s
#   Commands run once every 19 ticks (was 20, but needs to be 19 to detect dying creepers)

execute as @e[type=marker,tag=delta.explosion_detection.slow] at @s run function delta:internal/explosion_detection/slow_check
execute as @e[type=wither,tag=!delta.wither.processed] run function delta:internal/explosion_detection/setup/wither
execute if entity @e[type=ender_dragon] run schedule function delta:internal/explosion_detection/ender_dragon_tick_wrapper 1t replace
tag @e[type=cow,tag=!delta.checked_cow] add delta.checked_cow

#Cleanup for if schedule loops fail
execute if score $particle_loop_active delta.internal.dummy matches 0 run function delta:internal/effects/particle/tick
execute if score $dragon_death_loop_active delta.internal.dummy matches 0 run function delta:internal/effects/dragon_death/tick_wrapper 
execute if score $pre_dragon_death_loop_active delta.internal.dummy matches 0 run function delta:internal/effects/dragon_death/intermediate_tick_wrapper 

#Bed and anchor cleanup
execute as @e[type=marker,tag=delta.bed] at @s unless block ~ ~ ~ #minecraft:beds run kill @s
execute as @e[type=marker,tag=delta.respawn_anchor] at @s unless block ~ ~ ~ minecraft:respawn_anchor run kill @s

schedule function delta:internal/technical/loop_1s 19t replace