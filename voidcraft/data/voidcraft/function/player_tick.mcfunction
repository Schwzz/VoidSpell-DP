scoreboard players add @s vc_state 0
scoreboard players add @s vc_time 0
scoreboard players add @s vc_cooldown 0
execute if score @s vc_cooldown matches ..-1 run scoreboard players set @s vc_cooldown 0
execute if score @s vc_cooldown matches 1.. run scoreboard players remove @s vc_cooldown 1
execute unless score @s vc_state matches 0..1 run function voidcraft:casting/recover
execute if score @s vc_state matches 1 if score @s vc_time matches ..-1 run function voidcraft:casting/recover
execute if score @s vc_cast matches 2 run function voidcraft:casting/cancel
execute if score @s vc_state matches 1.. run function voidcraft:casting/advance
execute if score @s vc_cast matches 1 run function voidcraft:casting/request_preview
scoreboard players set @s vc_cast 0
scoreboard players enable @s vc_cast