#> delta:internal/explosion_detection/setup/bed_found
#   Sets a marker at the respawn anchor when it is found

summon marker ~ ~ ~ {Tags:["delta.respawn_anchor"]}
scoreboard players set $anchor_found delta.internal.dummy 1