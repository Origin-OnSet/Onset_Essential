function ADD_PLAYER_TO_WHITE_LIST(steamId)
    local steamId = tostring(steamId)

    if GET_PLAYER_WHITE_LIST(steamId) ~= false then return false end

    table.insert(DATA_PLAYER_WHITE_LIST, { steamId = steamId, date = os.date("%x")})
    print(_.str(DATA_PLAYER_WHITE_LIST))

    MessagePrint(3, "SteamId "..steamId.." add to the white list !")
    UPDATE_WHITE_LIST()

    return true
end
AddFunctionExport("ADD_PLAYER_TO_WHITE_LIST", ADD_PLAYER_TO_WHITE_LIST)


function REMOVE_PLAYER_TO_WHITE_LIST(steamId)
    local steamId = tostring(steamId)
    local PLAYER_WHITE_LIST = GET_PLAYER_WHITE_LIST(steamId)

    if PLAYER_WHITE_LIST == false then return false end

    table.remove(DATA_PLAYER_WHITE_LIST, PLAYER_WHITE_LIST)

    MessagePrint(3, "SteamId "..steamId.." remove to the white list !")
    UPDATE_WHITE_LIST()

    return true
end
AddFunctionExport("REMOVE_PLAYER_TO_WHITE_LIST", REMOVE_PLAYER_TO_WHITE_LIST)

function GET_PLAYER_WHITE_LIST(steamId)
    local steamId = tostring(steamId)

    if steamId == SERVER_OWNER_STEAM_ID_64 then return end

    for k,v in pairs(DATA_PLAYER_WHITE_LIST) do
        if v.steamId == steamId then
            return k
        end
    end

    return false
end
AddFunctionExport("GET_PLAYER_WHITE_LIST", GET_PLAYER_WHITE_LIST)