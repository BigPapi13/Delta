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

## Limitations + Known Issues

While this library is likely the closest we've gotten to perfect player motion manipulation, there are some limitations worth mentioning:
- **Resource pack**: The included resource pack removes *all* explosion sounds and particles to clean up the creeper explosions used to push the player. If you'd like to contribute to fixing this issue, please reach out to me!
- **Lag**: While this pack will consistently apply the same amount of motion regardless of lag, the client may update the player's motion between creeper explosions, causing the player's position to jitter. This only occurs under very strenuous conditions, but it is still worth mentioning.
- **MSPT Inconsistency**: Even though the motion applied is constant, the rate at which the server and client update may vary, and calling motion updates per tick may result in inconsistencies when these variations become too large. This could likely be remedied with worldborder checking, but I decided not to include it in this library for compatibility reasons.
- **Advancement inconsistencies**: Some advancements will trigger their reward functions *after* entities are processed for the tick, meaning the player has a tick to move around before the explosion occurs, resulting in major inconsistencies in the motion applied. This can be fixed by scheduling the command to be run the next tick.
- **Spigot/Paper**: This pack uses negative explosion radius creepers, which do not affect player motion on spigot or paper servers
- **Peaceful mode**: Currently, delta does not work in peaceful difficulty

If you know any possible solutions or would like to help fixing these problems, please let me know!
