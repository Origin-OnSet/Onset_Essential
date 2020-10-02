AddCommand("get_pos", function(player)
    if PLAYER_HAVE_PERMISSION(player, "essential.pos") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end
    local x, y, z = GetPlayerLocation(player)
    MessageChat(player, 2, "X : "..x.." Y : "..y.." Z : "..z)
end)

AddCommand("heal", function(player, dest)
    if PLAYER_HAVE_PERMISSION(player, "essential.heal") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest ~= nil then if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end end
    if dest == nil then dest = player end
    SetPlayerHealth(dest, 100)
    
    MessageChat(player, 2, "Heal : 100%")
end)

AddCommand("armor", function(player, dest)
    if PLAYER_HAVE_PERMISSION(player, "essential.armor") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest ~= nil then if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end end
    if dest == nil then dest = player end
    SetPlayerArmor(dest, 100)
    
    MessageChat(player, 2, "armor : 100%")
end)

AddCommand("god", function(player, dest)
    if PLAYER_HAVE_PERMISSION(player, "essential.god") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end

    if dest ~= nil then if PlayerData[tonumber(dest)] == nil then MessageChat(player, 4, " "..dest.." is not valide player !") return end end
    if dest == nil then dest = player end

    if PlayerData[dest].god == 0 then 
        PlayerData[dest].god = 1
        MessageChat(dest, 2, "god mod : enbaled")
    else
        PlayerData[dest].god = 0
        MessageChat(dest, 2, "god mod : disabled")
    end
end)

AddCommand("ping", function(player)
    if PLAYER_HAVE_PERMISSION(player, "essential.ping") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end
    MessageChat(player, 2, "Ping : "..GetPlayerPing(player))
end)

AddCommand("weapon", function(player, weapon)
    if PLAYER_HAVE_PERMISSION(player, "essential.weapon") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end
    local weapon = tonumber(weapon)
    if weapon <= 0 or weapon >= 21 then weapon = 19 end

    SetPlayerWeapon(player, weapon, 1000, true, GetPlayerEquippedWeaponSlot(player), true)
    MessageChat(player, 2, "Weapon : "..weapon)
end)

AddCommand("vehicle", function(player, vehicle)
    if PLAYER_HAVE_PERMISSION(player, "essential.vehicle") then MessageChat(player, 4, " You don't haver permission to execute this commande !") return end
    local vehicle = tonumber(vehicle)
    if vehicle <= 0 or vehicle >= 40 then vehicle = 37 end

    local x,y,z = GetPlayerLocation(player)
    local vehicleId = CreateVehicle(vehicle, x, y, z)

    AttachVehicleNitro(vehicleId , true)
    EnableVehicleBackfire(vehicleId, true)
    SetPlayerInVehicle(player, vehicleId , 1)

    MessageChat(player, 2, "vehicle : "..vehicle)
end)

AddCommand("/", function(player)
    MessageChat(player, 2, "test")
end)