#> random:private/number_provider/binomial
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		n: int
#			The number of Bernoulli trials. Maximum accepted value is 1000. Otherwise, output is 0.
#		p: float
#			The probability of success of each Bernoulli trial.

# Save storage values as scores
execute if score $trials random matches -2147483648..2147483647 run scoreboard players operation #user_trials_input random = $trials random
execute if score $chance random matches -2147483648..2147483647 run scoreboard players operation #user_chance_input random = $chance random
execute store result score $trials random run data get storage random:input n
execute store result score $chance random run data get storage random:input p 1000000000

# Run main function
function random:binomial

# Clean up
execute unless score #user_trials_input random matches -2147483648..2147483647 run scoreboard players reset $trials random
execute unless score #user_chance_input random matches -2147483648..2147483647 run scoreboard players reset $chance random
execute if score #user_trials_input random matches -2147483648..2147483647 run scoreboard players operation $trials random = #user_trials_input random
execute if score #user_chance_input random matches -2147483648..2147483647 run scoreboard players operation $chance random = #user_chance_input random
scoreboard players reset #user_trials_input random
scoreboard players reset #user_chance_input random