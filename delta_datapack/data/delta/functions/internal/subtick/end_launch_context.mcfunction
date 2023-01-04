#> delta:internal/subtick/end_launch_context
#   Summons the bat and aec used to trigger the player_hurt_entity advancement immediately after an explosion

summon minecraft:area_effect_cloud ~ ~12000 ~ {Duration:1,Radius:0.0f,ReapplicationDelay:-1,Age:-1,WaitTime:0,Effects:[{Id:7,Amplifier:0b,Duration:1}],UUID:[I;88,66,44,11]}
summon minecraft:bat ~ ~12000 ~ {DeathLootTable:"",NoAI:1b,Health:1.0f,Tags:["delta.post_explosion"],PersistenceRequired:1b}
data modify entity 00000058-0000-0042-0000-002c0000000b Owner set from storage delta:storage root.temp.UUID