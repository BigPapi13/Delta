#> delta:internal/subtick/end_launch_context
#   Summons the bat and aec used to trigger the player_hurt_entity advancement immediately after an explosion

summon minecraft:area_effect_cloud ~ ~12000 ~ {Tags:["delta.init.aec"],Duration:1,Radius:0.0f,ReapplicationDelay:-1,Age:-1,WaitTime:0,Effects:[{Id:7,Amplifier:0b,Duration:1}]}
summon minecraft:bat ~ ~12000 ~ {NoAI:1b,Health:1.0f,Tags:["delta.post_explosion"],PersistenceRequired:1b}
data modify entity @e[type=area_effect_cloud,tag=delta.init.aec,limit=1] Owner set from entity @s UUID
tag @e[type=area_effect_cloud,tag=delta.init.aec] remove delta.init.aec