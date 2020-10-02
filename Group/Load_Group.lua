DEFAULTE_GROUP = nil
PERMISSION_GROUP = {}
NBR_GROUP = 0

AddEvent("OnPackageStart", function()

    if #GROUP_LIST == nil then MessagePrint(1, "GROUP list is empty package can't start !") StopPackage(GetPackageName()) end

    for k, v in pairs(GROUP_LIST) do
        if v.default == true then DEFAULTE_GROUP = k MessagePrint(2, "Default GROUP : "..k) break end
    end

    if DEFAULTE_GROUP == nil then MessagePrint(1, "No Defaulte GROUP package can't start !") StopPackage(GetPackageName()) end

    CREATE_PERMISSION_LIST()
    MessagePrint(2, "GROUP : "..NBR_GROUP)
    MessagePrint(2, "Server Owner : "..SERVER_OWNER_STEAM_ID_64)
end)

function CREATE_PERMISSION_LIST()

    MessagePrint(2, "Create Permission List..")

    for k,v in pairs(GROUP_LIST) do
        NBR_GROUP = NBR_GROUP + 1
        PERMISSION_GROUP[k] = {}

        local GROUP_inheritance = v.inheritance

        PERMISSION_GROUP[k] = v.permission

        if GROUP_inheritance ~= "" then

            while true do

                for j,h in pairs(GROUP_LIST[GROUP_inheritance].permission) do
                    for c,i in pairs(PERMISSION_GROUP[k]) do
                        if h == i then goto permission_exist end
                    end
                    table.insert(PERMISSION_GROUP[k], h)

                    ::permission_exist::
                end

                GROUP_inheritance = GROUP_LIST[GROUP_inheritance].inheritance

                if GROUP_inheritance == "" then goto continue end
            end

            ::continue::
        end
    end
end