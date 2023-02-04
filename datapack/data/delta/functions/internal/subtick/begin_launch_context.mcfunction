#> delta:internal/subtick/begin_launch_context
#   Sets up the bat and aec used to trigger the player_hurt_entity advancement right before an explosion

summon minecraft:area_effect_cloud ~ ~10000 ~ {Duration:1,Radius:0.0f,ReapplicationDelay:-1,Age:-1,WaitTime:0,Effects:[{Id:7,Amplifier:0b,Duration:1}],Tags:["delta.init.aec"]}
summon minecraft:bat ~ ~10000 ~ {DeathLootTable:"",NoAI:1b,Health:1.0f,Tags:["delta.pre_explosion"],PersistenceRequired:1b}
function delta:internal/subtick/get_player_uuid
execute positioned ~ ~10000 ~ as @e[type=area_effect_cloud,tag=delta.init.aec,distance=..0.01] run function delta:internal/subtick/aec_setup