MESSAGE_PREFIX = {
    "[ERROR]",
    "[INFO]",
    "[COMMAND]",
    "[PERMISSION]"
}

function MessagePrint(type, message)
    if type > #MESSAGE_PREFIX or type < 0 then type = 1 end
    print("[ESSENTIAL] "..MESSAGE_PREFIX[type].." "..message)
end
AddRemoteEvent("essential:MessagePrint", MessagePrint)

function MessageChat(player, type, message)
    if type > #MESSAGE_PREFIX or type < 0 then type = 1 end
    AddPlayerChat(player,MESSAGE_PREFIX[type].." "..message)
end
AddRemoteEvent("essential:MessageChat", MessageChat)
