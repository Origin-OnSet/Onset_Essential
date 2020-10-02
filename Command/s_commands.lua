local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

function OnPlayerChat(player, message)
    -- Region message
    message = '<span>'..PlayerData[player].name..'('..player..'):</> '..message

    for k, v in pairs(GetStreamedPlayersForPlayer(player)) do
        if player and v and IsPlayerStreamedIn(player, v) then
            AddPlayerChat(v, message)
        end
    end

    local query = mariadb_prepare(sql, "INSERT INTO logs VALUES (NULL, UNIX_TIMESTAMP(), '?');",
		message)

	mariadb_async_query(sql, query)
end
AddEvent("OnPlayerChat", OnPlayerChat)

-- Global chat
-- AddCommand("g", function(player, ...)
--     local args = { ... }
--     local message = ""
--     for i=1,#args do
--         if i > 1 then
--             message = message.." "
--         end
--         message = message..args[i]
--     end
--     message = '['.._("global")..'] <span>'..GetPlayerName(player)..'('..player..'):</> '..message
--     local query = mariadb_prepare(sql, "INSERT INTO logs VALUES (NULL, NULL, '?');",
-- 		message)

-- 	mariadb_async_query(sql, query)
--     AddPlayerChatAll(message)
-- end)


-- -- Send message to admin
-- AddCommand("/", function(player, ...) 
--     local args = { ... }
--     local message = ""
--     for i=1,#args do
--         if i > 1 then
--             message = message.." "
--         end
--         message = message..args[i]
--     end
--     message = '['.._("admin")..'] <span>'..GetPlayerName(player)..'('..player..'):</> '..message
--     AddPlayerChat(player, message)
--     for k,v in pairs(GetAllPlayers()) do
--         if PlayerData[k].admin == 1 then
--             AddPlayerChat(k, message)
--         end
--     end
--     local query = mariadb_prepare(sql, "INSERT INTO logs VALUES (NULL, NULL, '?');",
-- 		message)

-- 	mariadb_async_query(sql, query)
-- end)

AddCommand("kill", function(player, playerKill)
    SetPlayerHealth(playerKill, 0)
end)

AddCommand("getpos", function(player)
    if PlayerData[player].admin ~= 1 then return end
    local x, y, z = GetPlayerLocation(player)
    AddPlayerChat(player, "X : "..x.." Y : "..y.." Z : "..z)
end)

AddCommand("tppos", function(player, x, y, z)
    if PlayerData[player].admin ~= 1 then
        return
    end
    SetPlayerLocation(player, x, y, z)
end)