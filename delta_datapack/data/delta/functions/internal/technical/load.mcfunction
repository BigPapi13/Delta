#> delta:internal/technical/load
#   Sets up scores and teams

#Start schedule loops
schedule function delta:internal/technical/tick 1t replace
schedule function delta:internal/technical/loop_1s 1t replace

# Definitions for Data-pack Helper Plus
#declare storage delta:storage

#SCORES
scoreboard objectives add delta.api.launch dummy
scoreboard objectives add delta.api.particle dummy
scoreboard objectives add delta.internal.dummy dummy
scoreboard objectives add delta.internal.gamemode dummy
scoreboard objectives add delta.internal.invulnerable dummy
scoreboard objectives add delta.internal.math dummy
    scoreboard players set #constant.-1 delta.internal.math -1
    scoreboard players set #constant.2 delta.internal.math 2
    scoreboard players set #constant.4 delta.internal.math 4
    scoreboard players set #constant.16 delta.internal.math 16
    scoreboard players set #constant.100 delta.internal.math 100
    scoreboard players set #constant.256 delta.internal.math 256
    scoreboard players set #constant.1000 delta.internal.math 1000
    scoreboard players set #constant.4096 delta.internal.math 4096
    scoreboard players set #constant.65793 delta.internal.math 65793
scoreboard objectives add delta.internal.motion.x dummy
scoreboard objectives add delta.internal.motion.y dummy
scoreboard objectives add delta.internal.motion.z dummy
scoreboard objectives add delta.internal.uuid.0 dummy
scoreboard objectives add delta.internal.uuid.1 dummy
scoreboard objectives add delta.internal.uuid.2 dummy
scoreboard objectives add delta.internal.uuid.3 dummy
scoreboard objectives add delta.internal.id dummy
scoreboard objectives add delta.internal.x dummy
scoreboard objectives add delta.internal.y dummy
scoreboard objectives add delta.internal.z dummy
scoreboard objectives add delta.internal.mobgriefing dummy
scoreboard objectives add delta.internal.frame dummy
scoreboard objectives add delta.internal.lifetime dummy
scoreboard objectives add delta.internal.size dummy
scoreboard objectives add delta.internal.explosion_size dummy
scoreboard objectives add delta.internal.fuse dummy

#TEAMS
team add delta.no_collide
    team modify delta.no_collide collisionRule never

#FUNCTIONS
function delta:internal/technical/tick

forceload remove 0 0
forceload add 0 0

#MARKERS
kill d59ee2c6-58c8-4885-b9db-ecff066e4439
summon marker ~ ~ ~ {UUID: [I;-711007546,1489520773,-1176769281,107889721]}
kill ba8a076c-9a37-49bb-bead-79c12d22458a
summon marker ~ ~ ~ {UUID: [I;-1165359252,-1707652677,-1095927359,757220746]}

#STORAGE
data modify storage delta:storage data_to_apply set value {item:{id:"minecraft:lingering_potion",Count:1b,tag:{CustomModelData:130255,CustomPotionColor:16777215}},billboard:"center",brightness:{sky:15,block:15}}
