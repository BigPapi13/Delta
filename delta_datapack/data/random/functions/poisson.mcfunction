#> random:poisson
#
# Generates a random number using a Poisson distribution
#
# @public
# @input
#	score $lambda random
#		The expected value with a scale of 10, a number between 1 and 100
# @output
#	score $out random
#		The Poisson variate, rounded down to an integer in {0, 1, 2, 3, ...}

# Save expected value as two scores
scoreboard players operation #lambda_int random = $lambda random
scoreboard players operation #lambda_int random /= #10 random
scoreboard players operation #lambda_dec random = $lambda random
scoreboard players operation #lambda_dec random %= #10 random

# Make sure expected value is valid
execute if score #lambda_int random matches ..-1 run scoreboard players set #lambda_int random 0
execute if score #lambda_int random matches 11.. run scoreboard players set #lambda_int random 10
execute if score #lambda_int random matches 0 if score #lambda_dec random matches 0 run scoreboard players set #lambda_dec random 1

# Evaluate exp(-l). The result is a number between 0 and 1 (but not 0), we save it with a scale of 2147483648
execute if score #lambda_int random matches 0 run scoreboard players set #exp(-l) random 32768
execute if score #lambda_int random matches 1 run scoreboard players set #exp(-l) random 12054
execute if score #lambda_int random matches 2 run scoreboard players set #exp(-l) random 4434
execute if score #lambda_int random matches 3 run scoreboard players set #exp(-l) random 1631
execute if score #lambda_int random matches 4 run scoreboard players set #exp(-l) random 600
execute if score #lambda_int random matches 5 run scoreboard players set #exp(-l) random 221
execute if score #lambda_int random matches 6 run scoreboard players set #exp(-l) random 81
execute if score #lambda_int random matches 7 run scoreboard players set #exp(-l) random 30
execute if score #lambda_int random matches 8 run scoreboard players set #exp(-l) random 11
execute if score #lambda_int random matches 9 run scoreboard players set #exp(-l) random 4
execute if score #lambda_int random matches 10 run scoreboard players set #exp(-l) random 2

execute if score #lambda_dec random matches 0 run scoreboard players operation #exp(-l) random *= #65536 random
execute if score #lambda_dec random matches 1 run scoreboard players operation #exp(-l) random *= #exp(-0.1)*65536 random
execute if score #lambda_dec random matches 2 run scoreboard players operation #exp(-l) random *= #exp(-0.2)*65536 random
execute if score #lambda_dec random matches 3 run scoreboard players operation #exp(-l) random *= #exp(-0.3)*65536 random
execute if score #lambda_dec random matches 4 run scoreboard players operation #exp(-l) random *= #exp(-0.4)*65536 random
execute if score #lambda_dec random matches 5 run scoreboard players operation #exp(-l) random *= #exp(-0.5)*65536 random
execute if score #lambda_dec random matches 6 run scoreboard players operation #exp(-l) random *= #exp(-0.6)*65536 random
execute if score #lambda_dec random matches 7 run scoreboard players operation #exp(-l) random *= #exp(-0.7)*65536 random
execute if score #lambda_dec random matches 8 run scoreboard players operation #exp(-l) random *= #exp(-0.8)*65536 random
execute if score #lambda_dec random matches 9 run scoreboard players operation #exp(-l) random *= #exp(-0.9)*65536 random

# Draw random number using Knuth's method
scoreboard players operation #L random = #exp(-l) random
scoreboard players set #p random 2147483647
scoreboard players set #k random -1
execute if score $min random matches -2147483648..2147483647 run scoreboard players operation #user_min_input random = $min random
execute if score $max random matches -2147483648..2147483647 run scoreboard players operation #user_max_input random = $max random
function random:private/poisson_loop
scoreboard players operation $out random = #k random

# Clean up
execute unless score #user_min_input random matches -2147483648..2147483647 run scoreboard players reset $min random
execute unless score #user_max_input random matches -2147483648..2147483647 run scoreboard players reset $max random
execute if score #user_min_input random matches -2147483648..2147483647 run scoreboard players operation $min random = #user_min_input random
execute if score #user_max_input random matches -2147483648..2147483647 run scoreboard players operation $max random = #user_max_input random
scoreboard players reset #user_min_input random
scoreboard players reset #user_max_input random