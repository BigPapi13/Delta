#> random:choose
#
# Outputs a random tag from a list
#
# @public
# @input
#	storage random:input List
#		The list a tag is picked from
# @output
#	storage random:output Tag
#		The tag that is chosen

# Save scores and tags before modifying them
execute if score $min random matches -2147483648..2147483647 run scoreboard players operation #user_min_input random = $min random
execute if score $max random matches -2147483648..2147483647 run scoreboard players operation #user_max_input random = $max random
execute if score $out random matches -2147483648..2147483647 run scoreboard players operation #user_out_value random = $out random

# Choose random index
scoreboard players set $min random 1
execute store result score $max random if data storage random:input List[]
function random:uniform
scoreboard players operation #index random = $out random

# Pick nth tag from the end of the list
data modify storage random:data List set from storage random:input List
execute if data storage random:data List[0] run function random:private/choose_loop

# Clean up
data remove storage random:data List
execute unless score #user_min_input random matches -2147483648..2147483647 run scoreboard players reset $min random
execute unless score #user_max_input random matches -2147483648..2147483647 run scoreboard players reset $max random
execute unless score #user_out_value random matches -2147483648..2147483647 run scoreboard players reset $out random
execute if score #user_min_input random matches -2147483648..2147483647 run scoreboard players operation $min random = #user_min_input random
execute if score #user_max_input random matches -2147483648..2147483647 run scoreboard players operation $max random = #user_max_input random
execute if score #user_out_value random matches -2147483648..2147483647 run scoreboard players operation $out random = #user_out_value random
scoreboard players reset #user_min_input random
scoreboard players reset #user_max_input random
scoreboard players reset #user_out_value random