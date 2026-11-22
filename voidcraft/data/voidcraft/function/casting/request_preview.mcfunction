execute if score @s vc_state matches 1.. run tellraw @s {"text":"You are already casting.","color":"red"}
execute if score @s vc_state matches 0 if score @s vc_cooldown matches 1.. run tellraw @s {"text":"Your casting is on cooldown.","color":"red"}
execute if score @s vc_state matches 0 if score @s vc_cooldown matches 0 run function voidcraft:sequence/preview/start