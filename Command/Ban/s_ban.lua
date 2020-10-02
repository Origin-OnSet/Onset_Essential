AddCommand("ban", function(player, dest, reason)
    if PLAYER_HAVE_PERMISSION(player, "essential.ban") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /ban [player] ([reason]) !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    PLAYER_BAN(tonumber(dest), reason)
    MessageChat(player, 3, "Player "..GetPlayerName(dest).." has ben ban frome the server !")
end)

AddCommand("unban", function(player, steamId)
    if PLAYER_HAVE_PERMISSION(player, "essential.unban") == false then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if steamId == nil then MessageChat(player, 4, " syntaxe error /unban [steamId] !") return end

    PLAYER_UNBAN(steamId)
    MessageChat(player, 3, steamId.." has ben unban frome the server !")
end)