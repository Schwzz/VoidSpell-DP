execute if score @s vc_time matches 201.. run return run function voidcraft:casting/recover
execute if score @s vc_time matches 1 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1 0.7
execute if score @s vc_time matches 1..19 run particle minecraft:portal ~ ~1 ~ 0.3 0.4 0.3 0.1 5 normal
execute if score @s vc_time matches 10 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1 1
execute if score @s vc_time matches 20 run function voidcraft:sequence/preview/finish