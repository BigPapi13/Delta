#> random:private/load
#
# Sets up the scoreboard for RNG
#
# @private
# @handles #minecraft:load

# Definitions for Data-pack Helper Plus
#define storage random:input
#define storage random:output
#define storage random:data

# Create scoreboard objective and initialize LCG
scoreboard objectives add random dummy
execute store result score #lcg_x random run seed

# Define constants
scoreboard players set #3 random 3
scoreboard players set #5 random 5
scoreboard players set #7 random 7
scoreboard players set #8 random 8
scoreboard players set #9 random 9
scoreboard players set #10 random 10
scoreboard players set #100 random 100
scoreboard players set #1000 random 1000
scoreboard players set #10000 random 10000
scoreboard players set #log(10) random 23026
scoreboard players set #exp(-0.9)*65536 random 26645
scoreboard players set #exp(-0.8)*65536 random 29447
scoreboard players set #exp(-0.7)*65536 random 32544
scoreboard players set #exp(-0.6)*65536 random 35967
scoreboard players set #exp(-0.5)*65536 random 39750
scoreboard players set #exp(-0.4)*65536 random 43930
scoreboard players set #exp(-0.3)*65536 random 48550
scoreboard players set #exp(-0.2)*65536 random 53656
scoreboard players set #exp(-0.1)*65536 random 59299
scoreboard players set #65536 random 65536
scoreboard players set #lcg_a random 1630111353
scoreboard players set #lcg_c random 1623164762
scoreboard players set #lcg_m random 2147483647
