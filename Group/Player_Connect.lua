PlayerData = {}

AddEvent("OnPlayerSteamAuth", function(player)

    local ban = GET_PLAYER_IS_BAN(GET_STEAM_ID(player))

    if WHITE_LIST == true then if GET_PLAYER_WHITE_LIST(GetPlayerSteamId(player)) == false then KickPlayer(player, DEFAULT_WHITE_LITS_KICK_MESSAGE) end end

    if ban ~= false then KickPlayer(player, DATA_PLAYER_BAN[ban].reason) return end
    
    if GET_PLAYER_EXIST(player) == false then CREATE_PLAYER_DATA(player) end

    SET_PLAYER_DATA(player)

end)

function SET_PLAYER_DATA(player)
    PlayerData[player] = {}
    
    PlayerData[player].Id = 0
    PlayerData[player].steamId = GET_STEAM_ID(player)
    
    PlayerData[player].name = GetPlayerName(player)

    PlayerData[player].groupId = GET_PLAYER_NUMBER_ID(player)
    PlayerData[player].group = GET_PLAYER_GROUP(player)

    print("Data created for : " .. player)
    MessagePrint(2, "Data created for : "..GetPlayerName(player).."["..PlayerData[player].group.."]".."("..player..")")
end