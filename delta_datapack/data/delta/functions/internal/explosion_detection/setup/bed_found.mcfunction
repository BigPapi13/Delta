#> delta:internal/explosion_detection/setup/bed_found
#   Sets a marker at the bed when it is found

summon marker ~ ~ ~ {Tags:["delta.bed"]}
scoreboard players set $bed_found delta.internal.dummy 1