# Onset_Essential
Essential is a permission manager package with player and admin commands.

## How to install
- Edit your server_config.json and add "Onset_Essential in the packages section before the files which require it:
```json
"packages": [
  "Onset_Essential"
],
```
- Import the package on top of the files to initialize Onset_Weapon_Drop using:
```lua
local Essential = ImportPackage("Onset_Essential")
```

## Global Configuration
- Edit Global_Config.lua 
- Change SERVER_OWNER_STEAM_ID_64 value by you owner steam id 64 [SteamIdFinder.com](https://steamidfinder.com/)
```lua

SERVER_OWNER_STEAM_ID_64 = "76561198154401761" -- HAVE ALL PERMISSION

DEFAULT_KICK_MESSAGE = "Your have ben kick frome the server !"
DEFAULT_BAN_MESSAGE = "Your have ben ban frome the server !"
DEFAULT_WHITE_LITS_KICK_MESSAGE = "Your are not in the white list of the server !"

WHITE_LIST = false  -- [true] = only player on white list can be join 
USE_DEFAULT_CHAT = false -- [true] = no prefix groupe and chat gestion by essential

DEFAULT_SPAWN_POINT = {0, 0, 1700}

```

## Group Configuration
- Edit Group_Config.lua 
```lua
GROUP_LIST = {
    Administrator = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#E74C3C">Administrator</><span style="bold">]</>',
        permission = {
            "essential.ban",
            "essential.unban"
        },
        inheritance = "Moderator"
    },
    Moderator = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#F4D03F">Moderator</><span style="bold">]</>',
        permission = {
            "essential.kick",
            "essential.kick.all",
            "essential.white_list.see",
            "essential.white_list.add",
            "essential.white_list.remove",
            "essential.heal",
            "essential.armor",
            "essential.god",
            "essential.mute"
        },
        inheritance = "Helper"
    },
    Helper = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#1ABC9C">Helper</><span style="bold">]</>',
        permission = {
            "essential.message.seeadmin",
            "essential.groupe.list",
            "essential.groupe.permission.list",
            "essential.groupe.player.list"
        },
        inheritance = "VIP"
    },
    VIP = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#DC7633">VIP</><span style="bold">]</>',
        permission = {
            "essential.vehicle",
            "essential.weapon"
        },
        inheritance = "Player"
    },
    Player = {
        default = true,
        prefixChat = '<span style="bold">[</><span style="bold" color="#3498DB">Player</><span style="bold">]</>',
        permission = {
          "essential.ping",
          "essential.message.sendadmin"
        },
        inheritance = ""
    }
}
```

## Permission list
```lua
essential.kill
essential.suicide

essential.tp.pos
essential.tp.to
essential.tp.all
essential.tp.pos

essential.spawn
essential.setspawn

essential.ban
essential.unban
essential.banip

essential.kick
essential.kickall

essential.white_list.see
essential.white_list.add
essential.white_list.remove

essential.vehicle
essential.weapon
essential.heal
essential.armor
essential.god
essential.mute
essential.ping

essential.groupe.add.player
essential.groupe.remove.player
essential.groupe.list
essential.groupe.permission.list
essential.groupe.player.list
```

## Function
```lua
PLAYER_BAN(player, reason) -- ban player
PLAYER_UNBAN(steamId) -- unban player with steamId64
GET_PLAYER_IS_BAN(steamId) -- return true if player is ban 

ADD_PLAYER_TO_WHITE_LIST(steamId) -- add player to white list
REMOVE_PLAYER_TO_WHITE_LIST(steamId) -- remove player from white list
GET_PLAYER_WHITE_LIST(steamId) -- return true if player is in the white list

PLAYER_HAVE_PERMISSION(player,permission) -- return true if player have permission
GROUP_HAVE_PERMISSION(group, permission) -- return true if group have permission
ADD_PLAYER_TO_GROUP(player, group) -- add player to group
REMOVE_PLAYER_TO_GROUP(player) -- set player groups to default

GET_PLAYER_EXIST(player) -- return true if player connect at least once
GET_PLAYER_GROUP(player) -- return player group
```

## Package Commands
```
/ban [player] ([reason])
/unban [steamId 64]

/kick [player] ([reason])
/kick_all ([reason])

/white_list -- return all player on the white list
/white_list_add [player]
/white_list_remove [player]

/tp_pos [x] [y] [z]
/tp_to [player]
/tp_all

/get_pos -- return x, y, z possition 
/ping
/god
/vehicle [vehicle Id]
/weapon [weapon Id]
/armor ([player])
/heal ([player])
/kill [player]
/suicide

/add_player_group [player] [group]
/remove_player_group [player]
/group_list
/group_permission_list [group]
/group_player_list [group]
```

## Discord
Join Origin [Discord](https://discord.gg/MDEwtKr) server now !

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License
