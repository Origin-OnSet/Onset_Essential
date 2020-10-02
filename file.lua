file_player_group_list = io.open ("packages/"..GetPackageName().."/Data/player_group_list.json" ,"r+")
file_player_white_list = io.open ("packages/"..GetPackageName().."/Data/player_white_list.json" ,"r+")
file_player_ban = io.open ("packages/"..GetPackageName().."/Data/player_ban.json" ,"r+")

AddEvent("OnPackageStart", function()

    DATA_PLAYER_GROUP = json_decode(file_player_group_list:read("*a"))
    DATA_PLAYER_WHITE_LIST = json_decode(file_player_white_list:read("*a"))
    DATA_PLAYER_BAN = json_decode(file_player_ban:read("*a"))

    MessagePrint(2, "Data Generate")
end)


AddEvent("OnPackageStop", function()
    UPDATE_ALL_DATA()
end)

function UPDATE_ALL_DATA()
    UPDATE_WHITE_LIST()
    UPDATE_GROUP_LIST()
    UPDATE_BAN_LIST()
end

function UPDATE_WHITE_LIST()
    clear("packages/"..GetPackageName().."/Data/player_white_list.json")
    file_player_white_list = io.open ("packages/"..GetPackageName().."/Data/player_white_list.json" ,"r+")
    file_player_white_list:write(json_encode(DATA_PLAYER_WHITE_LIST)):close()
    MessagePrint(2, "Update white list !")
end

function UPDATE_GROUP_LIST()
    clear("packages/"..GetPackageName().."/Data/player_group_list.json")
    file_player_group_list = io.open ("packages/"..GetPackageName().."/Data/player_group_list.json" ,"r+")
    file_player_group_list:write(json_encode(DATA_PLAYER_GROUP)):close()
    MessagePrint(2, "Update Group list !")
end

function UPDATE_BAN_LIST()
    clear("packages/"..GetPackageName().."/Data/player_ban.json")
    file_player_ban = io.open ("packages/"..GetPackageName().."/Data/player_ban.json" ,"r+")
    file_player_ban:write(json_encode(DATA_PLAYER_BAN)):close()
    MessagePrint(2, "Update ban list !")
end

function clear(filename)
    local fp = io.open( filename, "r" )
    if fp == nil then return nil end
 
    content = {}
    i = 1;
    for line in fp:lines() do
        if i < 1 or i >= 1 + 1 then
            content[#content+1] = line
        end
	    i = i + 1
    end
 
    fp:close()
    fp = io.open( filename, "w+" )
 
    for i = 1, #content do
	fp:write( string.format( "%s\n", content[i] ) )
    end
 
    fp:close()
end