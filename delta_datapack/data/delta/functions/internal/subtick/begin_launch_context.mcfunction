#> delta:internal/subtick/begin_launch_context
#   Sets up the bat and aec used to trigger the player_hurt_entity advancement right before an explosion

summon minecraft:area_effect_cloud ~ ~10000 ~ {Duration:1,Radius:0.0f,ReapplicationDelay:-1,Age:-1,WaitTime:0,Effects:[{Id:7,Amplifier:0b,Duration:1}],UUID:[I;88,66,44,22]}
summon minecraft:bat ~ ~10000 ~ {DeathLootTable:"",NoAI:1b,Health:1.0f,Tags:["delta.pre_explosion"],PersistenceRequired:1b}
data modify storage delta:storage root.temp.UUID set from entity @s UUID
execute as 00000058-0000-0042-0000-002c00000016 run data modify entity @s Owner set from storage delta:storage root.temp.UUID