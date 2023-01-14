#> random:private/choose_loop
#
# Recursively selects an NBT tag from a list given index from the end of the list
# Repeats until #index is 0
#
# @private
# @within random:choose
# @within random:private/choose_loop

scoreboard players remove #index random 1

# If the requested tag is now at the end of the list, send it to output
execute if score #index random matches 0 run data modify storage random:output Tag set from storage random:data List[-1]

# Otherwise, pop and run this function again
data remove storage random:data List[-1]
execute if score #index random matches 1.. run function random:private/choose_loop