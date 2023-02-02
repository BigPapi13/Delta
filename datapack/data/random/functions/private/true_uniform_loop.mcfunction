#> random:private/true_uniform_loop
#
# Generates uniform variates until the result is not subject to modulo bias (i.e. x < maxint/size*size where size=max-min+1)
#
# @private
# @within random:true_uniform
# @within random:private/true_uniform_loop

# Xn+1 = (aXn + c) mod m
scoreboard players operation #lcg random *= #lcg_a random
scoreboard players operation #lcg random += #lcg_c random
scoreboard players operation #lcg random %= #lcg_m random

# Loop if necessary
execute if score #lcg random >= #max random run function random:private/true_uniform_loop