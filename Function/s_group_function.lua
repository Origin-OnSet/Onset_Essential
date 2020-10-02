function PLAYER_HAVE_PERMISSION(player,permission)
    if PlayerData[player] == nil then return false end

    local Player_group = PlayerData[player].group

    if tostring(GetPlayerSteamId(player)) == SERVER_OWNER_STEAM_ID_64 then print("ok") return false end
    
    for k,v in pairs(PERMISSION_GROUP[Player_group]) do
        if permission == v then return false end
    end

    return true
end
AddFunctionExport("PLAYER_HAVE_PERMISSION", PLAYER_HAVE_PERMISSION)


function GROUP_HAVE_PERMISSION(group, permission)
    if PERMISSION_GROUP[group] == nil then return false end

    for k,v in pairs(PERMISSION_GROUP[group]) do
        if permission == v then return true end
    end

    return false
end
AddFunctionExport("GROUP_HAVE_PERMISSION", GROUP_HAVE_PERMISSION)

function ADD_PLAYER_TO_GROUP(player, group)
    if group == nil and PlayerData[Player] == nil then return false end

    if PERMISSION_GROUP[group] == nil then return false end

    PlayerData[player].group = group

    MessagePrint(player, 2, " "..player.." has been move to group "..group.." !")

    return true

end
AddFunctionExport("ADD_PLAYER_TO_GROUP", ADD_PLAYER_TO_GROUP)

function REMOVE_PLAYER_TO_GROUP(player)
    if PlayerData[Player] == nil then return false end

    PlayerData[player].group = DEFAULTE_GROUP

    MessagePrint(player, 2, " "..player.." has been move to group "..group.." !")

    return true
end
AddFunctionExport("REMOVE_PLAYER_TO_GROUP", REMOVE_PLAYER_TO_GROUP)

