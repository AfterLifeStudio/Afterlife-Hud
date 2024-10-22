if not (Framework == 'ox') then return end

PlayerLoaded = false

RegisterNetEvent("ox:playerLoaded", function()
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
    if player then
        local response = LoadHud()
        if response then
            DisplayHud(GlobalSettings.showhud)
            PlayerLoaded = true
        end
    end
end)

AddEventHandler('ox:statusTick', function(values)
    Playerstatus.Thirst = values.hunger
    Playerstatus.Hunger = values.thirst
    Playerstatus.Stress = values.stress
end)
