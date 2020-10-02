function PLAYER_BAN(player, reason)
    if PlayerData[player] == nil then return false end
    if reason == nil then reason = DEFAULT_BAN_MESSAGE end

    table.insert(DATA_PLAYER_BAN, { steamId = GET_STEAM_ID(tonumber(player)), reason = reason, date = os.date("%x")})

    UPDATE_BAN_LIST()

    KickPlayer(tonumber(player), reason)

    AddPlayerChatAll("[Ban] "..GetPlayerName.." has ben ban frome the server !")
    

    return true
end

function PLAYER_UNBAN(steamId)

    steamId = tostring(steamId)

    local Player_Info = GET_PLAYER_IS_BAN(steamId)

    if Player_Info == false then return false end

    table.remove(DATA_PLAYER_BAN, Player_Info)

    UPDATE_BAN_LIST()

end

function GET_PLAYER_IS_BAN(steamId)

    for k,v in pairs(DATA_PLAYER_BAN) do
        if steamId == v.steamId then
            return k
        end
    end

    return false
end