scoreboard players add @s vc_time 1
execute if score @s vc_time matches 201.. run function voidcraft:casting/recover
execute if score @s vc_state matches 1 run function voidcraft:sequence/preview/tick