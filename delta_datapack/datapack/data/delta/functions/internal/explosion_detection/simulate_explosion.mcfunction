#> delta:internal/explosion_detection/simulate_explosion
#   When an entity explodes, provide fake explosion

scoreboard players set $cancel delta.internal.dummy 0
execute if entity @s[tag=delta.explosion_detection.tnt_minecart] run function delta:internal/explosion_detection/check_tnt_minecart_misfire
execute if entity @s[tag=delta.explosion_detection.shulker_bullet] run function delta:internal/explosion_detection/shulker_bullet

execute if entity @s[tag=delta.explosion_detection.adjust] run function delta:internal/explosion_detection/adjust_position
execute if score @s delta.internal.explosion_size matches ..1 if score $cancel delta.internal.dummy matches 0 at @s run function delta:internal/explosion_detection/small_explosion
execute if score @s delta.internal.explosion_size matches 2.. if score $cancel delta.internal.dummy matches 0 at @s run function delta:internal/explosion_detection/large_explosion

kill @s