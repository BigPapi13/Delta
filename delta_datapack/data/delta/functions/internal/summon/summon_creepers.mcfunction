#> delta:internal/summon/summon_creepers
#   Summons creepers to launch
#
# Callers:
#   > delta:api/launch_looking

scoreboard players operation $creepers_remaining delta.internal.math = $creeper_count delta.internal.math
$execute rotated ~ ~$(positive) positioned ^ ^ ^-0.01 run function delta:internal/summon/summon_creepers_recursive

scoreboard players operation $creepers_remaining delta.internal.math = $creeper_count delta.internal.math
$execute rotated ~ ~$(negative) positioned ^ ^ ^-0.01 run function delta:internal/summon/summon_creepers_recursive