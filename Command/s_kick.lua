AddCommand("kick", function(player, dest, reason)

    local dest = tonumber(dest)

    if PLAYER_HAVE_PERMISSION(player, "essential.kick") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /kick [player] ([reason]) !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    if reason == nil then reason = DEFAULT_KICK_MESSAGE end

    KickPlayer(dest, reason)

    MessageChat(player, 3, "Player "..GetPlayerName(dest).." has ben kick frome the server !")
end)

AddCommand("kick_all", function(player, reason)

    if PLAYER_HAVE_PERMISSION(player, "essential.kick.all") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /kick [player] ([reason]) !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    if reason == nil then reason = DEFAULT_KICK_MESSAGE end

    for k,v in pairs(GetAllPlayers()) do
        KickPlayer(v, reason)
    end
end)