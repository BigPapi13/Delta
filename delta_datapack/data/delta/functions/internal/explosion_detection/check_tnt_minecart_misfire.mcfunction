#> delta:internal/explosion_detection/check_tnt_minecart_misfire
#   Checks to see if a tnt minecart was broken instead of exploded

execute if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:tnt_minecart"},PickupDelay:10s,Age:0s}] run scoreboard players set $cancel delta.internal.dummy 1