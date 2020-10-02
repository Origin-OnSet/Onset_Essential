AddEvent("OnPlayerChat", function(player, text)

    if USE_DEFAULT_CHAT == true then return end

    AddPlayerChatAll(GROUP_LIST[PlayerData[player].group].prefixChat.." ["..GetPlayerName(player).."] "..text)

    return false
end)