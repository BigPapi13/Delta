# Delta
Delta is an explosion-based player motion library that uses subtick timing to ensure that only one player is pushed by the blast.

## How to use

### Launching a player where in a specific direction

```mcfunction
scoreboard players set $strength delta.api.launch 10000
function delta:api/launch_looking
```
- `$strength` represents motion in blocks/tick, scaled by 10000. A strength of 10000 will push the player at 1 block/tick
- The facing direction in which the function is called is the direction the player will be launched
- Only the player executing the command will receive a motion update

### Launching a player with xyz vector

```mcfunction
scoreboard players set $x delta.api.launch 500
scoreboard players set $y delta.api.launch 12000
scoreboard players set $z delta.api.launch -3125
function delta:api/launch_xyz
```
- `$x`, `$y`, and `$z` are the strength in blocks/tick to launch the player in the x, y, and z directions
- As before, only the player executing the command will be launched

*Note: These functions are *additive* and will apply motion in addition to existing motion rather than directly setting it to whatever input you send 

### Launching player via creeper directly
If you'd like more fine-grain control, you can summon the creepers yourself and simply use delta for the subticking with the following format:
```mcfunction
function delta:internal/subtick/begin_launch_context
summon creeper <x y+1000 z> {Tags:["delta.launcher","delta.init"],Silent:1b,Invulnerable:1b,ExplosionRadius:-1b,Fuse:0s,PersistenceRequired:1b}
scoreboard players operation $temp delta.internal.id = @s delta.internal.id
execute as @e[type=creeper,tag=delta.init] at @s run function delta:internal/summon/initialize_creepers
function delta:internal/subtick/end_launch_context
```
*Note: Creepers with an `ExplosionRadius` of -1 are recommended for more powerful pushes, and 1 for weaker ones. The direction of the push is determined by the angle from the creeper's feet to the player's eyes. You can place as many summon commands as you want, as long as they are between the launch context functions, which **must** be ran from a player. Make sure to summon the creeper 1000 blocks *above* where you want it to spawn.

## Replicating explosion effects
If you choose to remove the explosion sounds and particles with the resource pack, you can still use those effects with the following API calls:
```mcfunction
# Creates a single explosion particle
function delta:api/explosion_particle

# Creates an explosion emitter, which is what creepers and TNT display when they explode
function delta:api/explosion_emitter_particle

# Plays an explosion sound
function delta:api/explosion_sound
```

## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **Resource pack**: The included resource pack removes *all* explosion sounds and particles to clean up the creeper explosions used to push the player. While we've successfully managed to recreate explosion effects, detecting when to place those explosion effects back in the game is quite difficult.
- **Lag**: While this pack will consistently apply the same amount of motion regardless of lag, the client may update the player's motion between creeper explosions, causing the player's position to jitter. This only occurs under very strenuous conditions (like simulating low-gravity), but it is still worth mentioning.
- **MSPT Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. This could likely be remedied with worldborder checking, but I decided not to include it in this library for compatibility reasons.
- **Advancement inconsistencies**: Some advancements will trigger their reward functions *after* entities are processed for the tick, meaning the player has a tick to move around before the explosion occurs, resulting in major inconsistencies in the motion applied. This can be fixed by scheduling the command to be run the next tick.
- **Spigot/Paper**: ~~This pack uses negative explosion radius creepers, which do not affect player motion on spigot or paper servers.~~ To make this pack work on paper, Nico314159 has made a fix here: https://github.com/Nico314159/Paper-Negative-Explosions

If you know any possible solutions or would like to help fixing these problems, please let me know!
