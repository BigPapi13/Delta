#> random:private/binomial_loop
#
# Runs a single Bernoulli trial
# Repeats until #trials is 0
#
# @private
# @within random:binomial
# @within random:private/binomial_loop

execute if predicate random:score_ppb run scoreboard players add $out random 1
scoreboard players remove #trials random 1
execute if score #trials random matches 1.. run function random:private/binomial_loop