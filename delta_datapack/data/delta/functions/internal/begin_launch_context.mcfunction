#> delta:internal/begin_launch_context
#   Sets up the bat and aec used to trigger the player_hurt_entity advancement right before an explosion

summon minecraft:bat ~ ~10000 ~ {NoAI:1b,Health:1.0f,Tags:["delta.pre_explosion"],PersistenceRequired:1b}
summon minecraft:arrow ~ ~10002 ~ {Tags:["delta.init.arrow"],Motion:[0.0d,-10.0d,0.0d]}
data modify entity @e[type=arrow,tag=delta.init.arrow,limit=1] Owner set from entity @s UUID
tag @e[type=arrow,tag=delta.init.arrow] remove delta.init.arrow