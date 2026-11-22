tellraw @s {"text":"Casting state reset.","color":"red"}
function voidcraft:casting/cleanup
scoreboard players set @s vc_state 0
scoreboard players set @s vc_time 0
scoreboard players set @s vc_cooldown 20