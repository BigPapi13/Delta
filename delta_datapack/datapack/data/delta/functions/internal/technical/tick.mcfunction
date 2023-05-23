#> delta:internal/technical/tick
#   Commands run per tick, within a scheduling loop to ensure they're run after any tick.json functions

#Check for any unprocessed entities that need explosion detection
execute as @e[type=#delta:technical/detect_explosion,tag=!delta.processed] at @s run function delta:internal/explosion_detection/setup/process_entity 

#Run explosion detection
execute as @e[type=marker,tag=delta.explosion_detection.rapid] at @s run function delta:internal/explosion_detection/marker_tick
execute as @e[type=tnt] at @s run function delta:internal/explosion_detection/tnt_tick

#If any motion functions were called in the past tick, run the function (this is a measure to enforce proper subtick timing)
execute if score $function_called delta.internal.dummy matches 1 as @a[tag=delta.launch] at @s run function delta:internal/launch/main

schedule function delta:internal/technical/tick 1t replace
