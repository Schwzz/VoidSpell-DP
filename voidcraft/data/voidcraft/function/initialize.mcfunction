execute store success storage voidcraft:system objective_exists byte 1 run scoreboard players add #vc_probe vc_cast 0
execute unless data storage voidcraft:system {objective_exists:1b} run scoreboard objectives add vc_cast trigger
execute store success storage voidcraft:system objective_exists byte 1 run scoreboard players add #vc_probe vc_state 0
execute unless data storage voidcraft:system {objective_exists:1b} run scoreboard objectives add vc_state dummy
execute store success storage voidcraft:system objective_exists byte 1 run scoreboard players add #vc_probe vc_time 0
execute unless data storage voidcraft:system {objective_exists:1b} run scoreboard objectives add vc_time dummy
execute store success storage voidcraft:system objective_exists byte 1 run scoreboard players add #vc_probe vc_cooldown 0
execute unless data storage voidcraft:system {objective_exists:1b} run scoreboard objectives add vc_cooldown dummy
execute store success storage voidcraft:system objective_exists byte 1 run scoreboard players add #vc_probe vc_owner 0
execute unless data storage voidcraft:system {objective_exists:1b} run scoreboard objectives add vc_owner dummy