#> delta:api/explosion_particle
#   Simulates the particles of an explosion with a radius of 1 or less
#
# Inputs:
#   score $dx delta.api.particle            << X spread of the particle (Scale factor 100)
#   score $dy delta.api.particle            << Y spread of the particle (Scale factor 100)
#   score $dz delta.api.particle            << Z spread of the particle (Scale factor 100)
#
#   score $count delta.api.particle         << Number of particles to spawn

execute unless score $count delta.api.particle matches -2147483648..2147483647 run function delta:internal/effects/particle/explosion/spawn
execute if score $count delta.api.particle matches -2147483648..2147483647 run function delta:internal/effects/particle/explosion/spread_0