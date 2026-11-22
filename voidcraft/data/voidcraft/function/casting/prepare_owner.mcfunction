scoreboard players add #next vc_owner 0
execute unless score @s vc_owner matches 1.. run function voidcraft:casting/assign_owner
scoreboard players operation #pending vc_owner = @s vc_owner