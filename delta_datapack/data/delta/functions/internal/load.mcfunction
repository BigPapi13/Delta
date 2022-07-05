#> delta:internal/load
#   Sets up scores and teams

#SCORES
scoreboard objectives add delta.internal.gametime dummy
scoreboard objectives add delta.api.launch dummy
scoreboard objectives add delta.internal.gamemode dummy
scoreboard objectives add delta.internal.invulnerable dummy
scoreboard objectives add delta.internal.math dummy
    scoreboard players set #constant.-1 delta.internal.math -1
    scoreboard players set #constant.2 delta.internal.math 2
    scoreboard players set #constant.4 delta.internal.math 4
    scoreboard players set #constant.100 delta.internal.math 100
    scoreboard players set #constant.1000 delta.internal.math 1000
scoreboard objectives add delta.internal.motion.x dummy
scoreboard objectives add delta.internal.motion.y dummy
scoreboard objectives add delta.internal.motion.z dummy
scoreboard objectives add delta.internal.id dummy

#TEAMS
team add delta.no_collide
    team modify delta.no_collide collisionRule never