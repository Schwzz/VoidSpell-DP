execute if score @s vc_state matches 1.. run tellraw @s {"text":"Casting cancelled.","color":"gray"}
execute if score @s vc_state matches 1.. run scoreboard players set @s vc_cooldown 20
scoreboard players set @s vc_state 0
scoreboard players set @s vc_time 0