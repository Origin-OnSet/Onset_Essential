AddCommand("tp_pos", function(player, x, y, z)

    if PLAYER_HAVE_PERMISSION(player, "essential.tp.pos") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if x == nil or y == nil or z == nil then MessageChat(player, 4, " syntaxe error /tp_pos [x] [y] [z] !") return end

    SetPlayerLocation(player, x, y, z)

    MessageChat(player, 2, " you teleported to x:"..x.." y:"..y.." z:"..z)
end)

AddCommand("tp_to", function(player, dest)

    if PLAYER_HAVE_PERMISSION(player, "essential.tp.to") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if PlayerData[tonumber].name == nil then MessageChat(player, 4, " syntaxe error /tp_to [player] !") return end

    local x,y,z = GetPlayerLocation(tonumber)

    SetPlayerLocation(player, x, y, z +100)

    MessageChat(player, 2, " you teleported to "..GetPlayerName(tonumber))
end)

AddCommand("tp_all", function(player)

    if PLAYER_HAVE_PERMISSION(player, "essential.tp.all") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    local x,y,z = GetPlayerLocation(player)

    for k,v in pairs(GetAllPlayers()) do
        SetPlayerLocation(v, x,y,z + 100)
    end

    MessageChat(player, 2, " "..GetPlayerCount().." player(s) has been tp !")
end)