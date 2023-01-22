#> random:private/number_provider/poisson
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		lambda: float
#			The expected value, a number between 0.1 and 10
#			Decimal values are supported but only the first decimal place is taken into account

# Save storage values as scores
execute if score $lambda random matches -2147483648..2147483647 run scoreboard players operation #user_lambda_input random = $lambda random
execute store result score $lambda random run data get storage random:input lambda 10

# Run main function
function random:poisson

# Clean up
execute unless score #user_lambda_input random matches -2147483648..2147483647 run scoreboard players reset $lambda random
execute if score #user_lambda_input random matches -2147483648..2147483647 run scoreboard players operation $lambda random = #user_lambda_input random
scoreboard players reset #user_lambda_input random