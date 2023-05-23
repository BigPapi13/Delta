#> delta:internal/effects/dragon_death/intermediate_initialize
#   Sets the marker into the phase while the dragon is flying to the fountain to die

tag @s add delta.dragon_death_intermediate

schedule function delta:internal/effects/dragon_death/intermediate_tick_wrapper 1t replace