particle minecraft:reverse_portal ~ ~1 ~ 0.4 0.4 0.4 0.1 20 normal
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1 1.4
function voidcraft:casting/cleanup
scoreboard players set @s vc_state 0
scoreboard players set @s vc_time 0
scoreboard players set @s vc_cooldown 100