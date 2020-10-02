AddCommand("white_list_add", function(player, dest)
    local dest = tonumber(dest)

    if PLAYER_HAVE_PERMISSION(player, "essential.white_list.add") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /white_list_add [player] !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    ADD_PLAYER_TO_WHITE_LIST(GetPlayerSteamId(dest))

    MessageChat(player, 3, "SteamId "..GetPlayerSteamId(dest).." add to the white list !")

end)

AddCommand("white_list_remove", function(player, dest)
    local dest = tonumber(dest)

    if PLAYER_HAVE_PERMISSION(player, "essential.white_list.remove") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /white_list_remove [player] !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    REMOVE_PLAYER_TO_WHITE_LIST(GetPlayerSteamId(dest))

    MessageChat(player, 3, "SteamId "..GetPlayerSteamId(dest).." remove to the white list !")

end)

AddCommand("white_list", function(player)

    if PLAYER_HAVE_PERMISSION(player, "essential.white_list.see") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    AddPlayerChat(player, "-------White list-------")
    for k,v in pairs(DATA_PLAYER_WHITE_LIST) do
        AddPlayerChat(player, k..") SteamId:"..v.steamId)
    end
    AddPlayerChat(player, "------------------------")
    

end)