execute unless score @s vc_state matches 0..1 run function voidcraft:casting/recover
execute if score @s vc_state matches 1.. if score @s vc_time matches ..-1 run function voidcraft:casting/recover