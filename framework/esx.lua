if not (Framework == 'esx') then return end

local ESX = exports['es_extended']:getSharedObject()
PlayerLoaded = false


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    Wait(1000)

    local response = LoadHud()
    if response then
        DisplayHud(GlobalSettings.showhud)
        PlayerLoaded = true
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    Wait(1000)
    if resourceName ~= GetCurrentResourceName() then return end
    if ESX.IsPlayerLoaded() then
        local response = LoadHud()
        if response then
            DisplayHud(GlobalSettings.showhud)
            PlayerLoaded = true
        end
    end
end)


AddEventHandler('esx_status:onTick', function(data)
    for i = 1, #data do
        if data[i].name == 'thirst' then Playerstatus.Thirst = math.floor(data[i].percent) end
        if data[i].name == 'hunger' then Playerstatus.Hunger = math.floor(data[i].percent) end
        if data[i].name == 'stress' then Playerstatus.Stress = math.floor(data[i].percent) end
    end
end)
