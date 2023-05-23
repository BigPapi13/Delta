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
### Advanced particles
If you would like to replicate the arguments of the particle command such as the spread and count, Delta provides a rough approximation like so:
`particle minecraft:explosion ~ ~ ~ 3.5 1.2 0.24 0 10`
will instead be written as:
```mcfunction
scoreboard players set $dx delta.api.particle 350
scoreboard players set $dy delta.api.particle 120
scoreboard players set $dz delta.api.particle 24
scoreboard players set $count delta.api.particle 10
function delta:api/explosion_particle
```
*Note: All of the above parameters must be set every time the function is called, otherwise it will default to a single particle. The parameters work for both `explosion` and `explosion_emitter`* 
## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **Resource pack**: The included resource pack removes explosion particles and sounds, which are then manually reinserted into the game. Any other packs attempting to use normal explosion particles/sounds without using delta api calls will be unable to do so.
- **MSPT Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. For consistent results, Delta should only be used for instantaneous bursts of motion, and continuous forces should instead rely on riding-based methods or levitation, depending on the context.
- **Explosion Replication**: Delta has to manually detect every source of explosion particles and sounds in the game. Some of these sources are very difficult to detect both efficiently and consistently, so it is possible that an effect may not play when it is supposed to. However, for most sources this should be incredibly rare.
- **Spigot/Paper**: ~~This pack uses negative explosion radius creepers, which do not affect player motion on spigot or paper servers.~~ To make this pack work on paper, Nico314159 has made a fix here: https://github.com/Nico314159/Paper-Negative-Explosions

If you know any possible solutions or would like to help fixing these problems, please let me know!
