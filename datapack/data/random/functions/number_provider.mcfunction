#> random:number_provider
#
# Generates a random number using input from storage
#
# @public
# @input
#	storage random:input
#		type: string
#			The probability law
#			Either "uniform", "binomial", "poisson" or "exponential"
#		min: int
#			(For uniform RNG) The minimum value
#		max: int
#			(For uniform RNG) The maximum value
#		n: int
#			(For binomial RNG) The number of Bernoulli trials
#		p: double
#			(For binomial RNG) The probability of each Bernoulli trial
#		lambda: float
#			For exponential RNG: The rate/inverse scale
#			For Poisson RNG: The expected value, a number between 0.1 and 10 - decimal values are supported but only the first decimal place is taken into account

# Constant
execute if data storage random:input {type: "constant"} run function random:private/number_provider/constant
execute if data storage random:input {type: "minecraft:constant"} run function random:private/number_provider/constant

# Uniform
execute if data storage random:input {type: "uniform"} run function random:private/number_provider/uniform
execute if data storage random:input {type: "minecraft:uniform"} run function random:private/number_provider/uniform
execute unless data storage random:input type if data storage random:input min if data storage random:input max run function random:private/number_provider/uniform

# Binomial
execute if data storage random:input {type: "binomial"} run function random:private/number_provider/binomial
execute if data storage random:input {type: "minecraft:binomial"} run function random:private/number_provider/binomial
execute unless data storage random:input type unless data storage random:input min if data storage random:input n if data storage random:input p run function random:private/number_provider/binomial

# Geometric
execute if data storage random:input {type: "geometric"} run function random:private/number_provider/geometric
execute if data storage random:input {type: "minecraft:geometric"} run function random:private/number_provider/geometric

# Poisson
execute if data storage random:input {type: "poisson"} run function random:private/number_provider/poisson
execute if data storage random:input {type: "minecraft:poisson"} run function random:private/number_provider/poisson
