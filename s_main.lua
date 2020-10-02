PlayerData = {}
DEFAULTE_GROUP = nil
PERMISSION_GROUP = {}
NBR_GROUP = 0

AddEvent("OnPackageStart", function()

    if #GROUP_LIST == nil then MessagePrint(1, "group list is empty package can't start !") StopPackage(GetPackageName()) end

    for k, v in pairs(GROUP_LIST) do
        if v.default == true then DEFAULTE_GROUP = k MessagePrint(2, "Default group : "..k) break end
    end

    if DEFAULTE_GROUP == nil then MessagePrint(1, "No Defaulte group package can't start !") StopPackage(GetPackageName()) end

    CREATE_PERMISSION_LIST()
    MessagePrint(2, "Group : "..NBR_GROUP)
    MessagePrint(2, "Server Owner : "..SERVER_OWNER_STEAM_ID_64)
end)

AddEvent("OnPlayerSteamAuth", function(player)

    local ban = GET_PLAYER_IS_BAN(GET_STEAM_ID(player))

    if WHITE_LIST == true then if GET_PLAYER_WHITE_LIST(GetPlayerSteamId(player)) == false then KickPlayer(player, DEFAULT_WHITE_LITS_KICK_MESSAGE) end end

    if ban ~= false then KickPlayer(player, DATA_PLAYER_BAN[ban].reason) return end
    
    if GET_PLAYER_EXIST(player) == false then CREATE_PLAYER_DATA(player) end

    SET_PLAYER_DATA(player)

end)

AddEvent("OnPlayerSpawn", function(player)
    SetPlayerLocation(player, DEFAULT_SPAWN_POINT[1], DEFAULT_SPAWN_POINT[2], DEFAULT_SPAWN_POINT[3])
end)


function CREATE_PERMISSION_LIST()

    MessagePrint(2, "Create Permission List..")

    for k,v in pairs(GROUP_LIST) do
        NBR_GROUP = NBR_GROUP + 1
        PERMISSION_GROUP[k] = {}

        local group_inheritance = v.inheritance

        PERMISSION_GROUP[k] = v.permission

        if group_inheritance ~= "" then

            while true do

                for j,h in pairs(GROUP_LIST[group_inheritance].permission) do
                    for c,i in pairs(PERMISSION_GROUP[k]) do
                        if h == i then goto permission_exist end
                    end
                    table.insert(PERMISSION_GROUP[k], h)

                    ::permission_exist::
                end

                group_inheritance = GROUP_LIST[group_inheritance].inheritance

                if group_inheritance == "" then goto continue end
            end

            ::continue::
        end
    end
end

function SET_PLAYER_DATA(player)
    PlayerData[player] = {}
    
    PlayerData[player].steamId = GET_STEAM_ID(player)
    
    PlayerData[player].name = GetPlayerName(player)
    PlayerData[player].god = 0

    PlayerData[player].groupId = GET_PLAYER_NUMBER_ID(player)
    PlayerData[player].group = GET_PLAYER_GROUP(player)

    print("Data created for : " .. player)
    MessagePrint(2, "Data created for : "..GetPlayerName(player).."["..PlayerData[player].group.."]".."("..player..")["..GetPlayerSteamId(player).."]")
end