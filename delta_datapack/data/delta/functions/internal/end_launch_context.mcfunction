#> delta:internal/end_launch_context
#   Summons the bat and aec used to trigger the player_hurt_entity advancement immediately after an explosion

summon minecraft:bat ~ ~12000 ~ {NoAI:1b,Health:1.0f,Tags:["delta.post_explosion"],PersistenceRequired:1b}
summon minecraft:arrow ~ ~12002 ~ {Tags:["delta.init.arrow"],Motion:[0.0d,-10.0d,0.0d]}
data modify entity @e[type=arrow,tag=delta.init.arrow,limit=1] Owner set from entity @s UUID
tag @e[type=arrow,tag=delta.init.arrow] remove delta.init.arrow