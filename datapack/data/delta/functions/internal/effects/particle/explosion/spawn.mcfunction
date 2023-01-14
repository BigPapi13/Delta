#> delta:internal/effects/particle/explosion/spawn
#   Summons a fake explosion particle, since real ones are untextured

summon snowball ~ ~ ~ {Tags:["delta.explosion_particle","delta.explosion_particle.init"],NoGravity:1b,Item:{id:"minecraft:lingering_potion",Count:1b,tag:{CustomModelData:130255,CustomPotionColor:16777215}}}
execute as @e[type=snowball,tag=delta.explosion_particle.init] run function delta:internal/effects/particle/explosion/initialize