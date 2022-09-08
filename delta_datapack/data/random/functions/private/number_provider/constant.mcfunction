#> random:private/number_provider/constant
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		lambda: float
#			The rate or inverse scale

execute store result score $out random run data get storage random:input value