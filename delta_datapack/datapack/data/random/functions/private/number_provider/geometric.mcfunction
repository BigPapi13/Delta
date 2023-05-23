#> random:private/number_provider/geometric
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		p: float
#			The probability of success of each Bernoulli trial.

# Save storage values as scores
execute if score $chance random matches -2147483648..2147483647 run scoreboard players operation #user_chance_input random = $chance random
execute store result score $chance random run data get storage random:input p 1000000000

# Run main function
function random:geometric

# Clean up
execute unless score #user_chance_input random matches -2147483648..2147483647 run scoreboard players reset $chance random
execute if score #user_chance_input random matches -2147483648..2147483647 run scoreboard players operation $chance random = #user_chance_input random
scoreboard players reset #user_chance_input random