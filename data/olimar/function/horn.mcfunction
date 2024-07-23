schedule function olimar:clear_advancement 1s
scoreboard objectives add olimaruuid0 dummy
scoreboard objectives add olimaruuid1 dummy
scoreboard objectives add olimaruuid2 dummy
scoreboard objectives add olimaruuid3 dummy
scoreboard objectives add olimarsitting dummy

summon armor_stand ~ ~ ~ {Tags:["olimarstore"]}
scoreboard players set @e[type=armor_stand,tag=olimarstore] olimarsitting 1
execute as @s store result score @e[type=armor_stand,tag=olimarstore] olimaruuid0 run data get entity @s UUID[0]
execute as @s store result score @e[type=armor_stand,tag=olimarstore] olimaruuid1 run data get entity @s UUID[1]
execute as @s store result score @e[type=armor_stand,tag=olimarstore] olimaruuid2 run data get entity @s UUID[2]
execute as @s store result score @e[type=armor_stand,tag=olimarstore] olimaruuid3 run data get entity @s UUID[3]
scoreboard objectives add olimarowner0 dummy
scoreboard objectives add olimarowner1 dummy
scoreboard objectives add olimarowner2 dummy
scoreboard objectives add olimarowner3 dummy
execute as @e[distance=..64] if data entity @s Owner store result score @s olimarowner0 run data get entity @s Owner[0]
execute as @e[distance=..64] if data entity @s Owner store result score @s olimarowner1 run data get entity @s Owner[1]
execute as @e[distance=..64] if data entity @s Owner store result score @s olimarowner2 run data get entity @s Owner[2]
execute as @e[distance=..64] if data entity @s Owner store result score @s olimarowner3 run data get entity @s Owner[3]

execute as @s unless score @s olimarsitting = @e[type=armor_stand,tag=olimarstore,limit=1] olimarsitting run scoreboard players set @e[type=armor_stand,tag=olimarstore] olimarsitting 0

execute as @e[distance=..64] if score @s olimarowner0 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid0 if score @s olimarowner1 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid1 if score @s olimarowner2 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid2 if score @s olimarowner3 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid3 if score @e[type=armor_stand,tag=olimarstore,limit=1] olimarsitting matches 0 run data merge entity @s {Sitting:1b}
execute as @e[distance=..64] if score @s olimarowner0 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid0 if score @s olimarowner1 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid1 if score @s olimarowner2 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid2 if score @s olimarowner3 = @e[type=armor_stand,tag=olimarstore,limit=1] olimaruuid3 if score @e[type=armor_stand,tag=olimarstore,limit=1] olimarsitting matches 1 run data merge entity @s {Sitting:0b}

execute as @s if score @e[type=armor_stand,tag=olimarstore,limit=1] olimarsitting matches 1 run scoreboard players set @s olimarsitting 0
execute as @s if score @e[type=armor_stand,tag=olimarstore,limit=1] olimarsitting matches 0 run scoreboard players set @s olimarsitting 1

scoreboard objectives remove olimarowner0
scoreboard objectives remove olimarowner1
scoreboard objectives remove olimarowner2
scoreboard objectives remove olimarowner3
scoreboard objectives remove olimaruuid0
scoreboard objectives remove olimaruuid1
scoreboard objectives remove olimaruuid2
scoreboard objectives remove olimaruuid3
kill @e[type=armor_stand,tag=olimarstore]

