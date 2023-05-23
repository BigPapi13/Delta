#> delta:internal/explosion_detection/setup/process_entity
#   Initializes entity to be tracked for explosions

tag @s add delta.processed

summon marker ~ ~ ~ {Tags:["delta.explosion_tracker","delta.explosion_tracker.init"]}
ride @e[type=marker,tag=delta.explosion_tracker.init,limit=1] mount @s
execute on passengers run tag @s remove delta.explosion_tracker.init

execute as @s[type=minecraft:creeper] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/creeper
execute as @s[type=minecraft:fireball] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/fireball
execute as @s[type=minecraft:wither_skull] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/wither_skull
execute as @s[type=minecraft:end_crystal] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/end_crystal
execute as @s[type=minecraft:tnt_minecart] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/tnt_minecart
execute as @s[type=minecraft:ender_dragon] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/ender_dragon
execute as @s[type=minecraft:shulker_bullet] on passengers as @s[tag=delta.explosion_tracker] run function delta:internal/explosion_detection/setup/shulker_bullet