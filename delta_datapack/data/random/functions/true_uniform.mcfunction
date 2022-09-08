#> random:true_uniform
#
# Generates a random number between two given bounds using a linear congruential generator
# Adjusts for modulo bias: if the range is small, or if max-min almost divides 2147483648, the bias should not be noticeable and random:uniform should be used instead for efficiency
#
# @public
# @input
#	score $min random
#		The minimum value (inclusive)
#	score $max random
#		The maximum value (inclusive)
# @output
#	score $out random
#		An integer in range [min, max]

# Calculate size of range
scoreboard players operation #size random = $max random
scoreboard players operation #size random -= $min random
scoreboard players add #size random 1

# Calculate maximum authorised value
scoreboard players set #max random 2147483647
scoreboard players operation #max random /= #size random
scoreboard players operation #max random *= #size random

# Loop
function random:private/true_uniform_loop
scoreboard players operation $out random = #lcg random

# Get within desired range
scoreboard players operation $out random %= #size random
scoreboard players operation $out random += $min random