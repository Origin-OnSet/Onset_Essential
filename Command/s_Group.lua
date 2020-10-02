AddCommand("add_player_group", function(player, dest, group)
    if PLAYER_HAVE_PERMISSION(player, "essential.group.add.player") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil or group == nil then MessageChat(player, 4, " syntaxe error /add_player_group [player] [group] !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    if PERMISSION_GROUP[group] == nil then MessageChat(player, 4, " "..group.." is not valide group !") return end

    SET_PLAYER_GROUP(tonumber(dest), group)

    MessageChat(player, 4, " "..dest.." move to group "..group.." !")
    MessagePrint(player, 2, " "..player.." move "..dest.." to group "..group.." !")
end)

AddCommand("remove_player_group", function(player, dest)
    if PLAYER_HAVE_PERMISSION(player, "essential.group.remove.player") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest == nil then MessageChat(player, 4, " syntaxe error /remove_player_group [player] !") return end

    if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end

    SET_PLAYER_GROUP(tonumber(dest), DEFAULTE_group)

    MessageChat(player, 4, " "..dest.." move to group "..DEFAULTE_group.." !")
    MessagePrint(player, 2, " "..player.." move "..dest.." to group "..DEFAULTE_group.." !")
end)

AddCommand("group_list", function(player)
    if PLAYER_HAVE_PERMISSION(player, "essential.group.list") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    local nbr = 1

    for k,v in pairs(GOUPE_LIST) do
        AddPlayerChat(player, "["..nbr.."]"..k)
        nbr = nbr + 1
    end
end)

AddCommand("group_permission_list", function(player, group)
    if PLAYER_HAVE_PERMISSION(player, "essential.group.permission.list") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if group == nil then MessageChat(player, 4, " syntaxe error /group_permission_list [group] !") return end

    if PERMISSION_GROUP[group] == nil then MessageChat(player, 4, " "..group.." is not valide group !") return end

    local nbr = 1

    for k,v in pairs(PERMISSION_GROUP[group]) do
        AddPlayerChat(player, "["..nbr.."]"..v)
        nbr = nbr + 1
    end
end)

AddCommand("group_player_list", function(player, group)
    if PLAYER_HAVE_PERMISSION(player, "essential.group.player.list") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if group == nil then MessageChat(player, 4, " syntaxe error /group_player_list [group] !") return end

    if PERMISSION_GROUP[group] == nil then MessageChat(player, 4, " "..group.." is not valide group !") return end

    local nbr = 1

    for k,v in pairs(PlayerData[player]) do
        if v.group == group then
            AddPlayerChat(player, "["..nbr.."]"..v.pseudo)
            nbr = nbr + 1
        end
    end
end)