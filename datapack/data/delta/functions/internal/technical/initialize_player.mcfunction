#> delta:internal/technical/initialize_player
#   Sets up unique ID for a player

scoreboard players add $global delta.internal.id 1
scoreboard players operation @s delta.internal.id = $global delta.internal.id