#> random:private/geometric_loop
#
# Runs a single Bernoulli trial
# Repeats until the trial fails or until $out reaches 1000
#
# @private
# @within random:geometric
# @within random:private/geometric_loop

scoreboard players add $out random 1
execute unless predicate random:score_ppb unless score $out random matches 1000 run function random:private/geometric_loop