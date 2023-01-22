#> delta:internal/summon/initialize_creepers
#   Links creepers to players via a scoreboard

scoreboard players operation @s delta.internal.id = $temp delta.internal.id
tag @s remove delta.init