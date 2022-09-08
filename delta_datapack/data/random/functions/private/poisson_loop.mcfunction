#> random:private/poisson_loop
#
# In this loop, p is multiplied by a uniform random number u in [0, 1] until p is smaller than L = exp(-l)
# Because we are working with integers, u is represented with a scale of 2^16 and p is divided by 2^16 after every multiplication
# At the end of the loop, #k is one less than the total number of repetitions of this function
#
# @private
# @within random:poisson
# @within random:private/poisson_loop

scoreboard players add #k random 1

scoreboard players set $min random 0
scoreboard players set $max random 65536
function random:uniform
scoreboard players operation #p random /= #65536 random
scoreboard players operation #p random *= $out random

execute if score #p random > #L random run function random:private/poisson_loop