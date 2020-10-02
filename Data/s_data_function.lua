function GET_PLAYER_GROUP(player)
    local steamId = GET_STEAM_ID(player)
    return DATA_PLAYER_GROUP[PlayerData[player].groupId].group
end

function GET_PLAYER_EXIST(player)
    local steamId = GET_STEAM_ID(player)

    if DATA_PLAYER_GROUP == nil then return false end

    for k,v in pairs(DATA_PLAYER_GROUP) do
        if v.steamId == steamId then
            return true
        end
    end

    return false
end

function SET_PLAYER_GROUP(player, group)
    if PERMISSION_GROUP[group] == nil or PlayerData[player] == nil then return false end
    PlayerData[player].group = group
    DATA_PLAYER_GROUP[GET_PLAYER_NUMBER_ID(player)].group = group

    return true

end

function GET_PLAYER_NUMBER_ID(player)
    local steamId = GET_STEAM_ID(player)

    for k,v in pairs(DATA_PLAYER_GROUP) do
        if v.steamId == steamId then
            return k
        end
    end

    return false
end

function CREATE_PLAYER_DATA(player)
    local steamId = GET_STEAM_ID(player)

    if GET_PLAYER_EXIST(player) == true then return end

    table.insert(DATA_PLAYER_GROUP, { steamId = steamId, group = DEFAULTE_GROUP})

    MessagePrint(2, " "..GetPlayerName(player).." join the server for the first time !")
end

function GET_STEAM_ID(player)
    return tostring(GetPlayerSteamId(player))
end