#> delta:internal/explosion_detection/shulker_explosion
#   Creates the effect for when a shulker bullet explodes against a block

scoreboard players set $count delta.api.particle 2
scoreboard players set $dx delta.api.particle 20
scoreboard players set $dy delta.api.particle 20
scoreboard players set $dz delta.api.particle 20

function delta:api/explosion_particle