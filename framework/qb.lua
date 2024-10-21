if not (Framework == 'qb') then return end

local QBCore = exports['qb-core']:GetCoreObject()
PlayerLoaded = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    local playerdata = QBCore.Functions.GetPlayerData()

    Playerstatus.Stress = playerdata.metadata.stress
    Playerstatus.Hunger = playerdata.metadata.hunger
    Playerstatus.Thirst = playerdata.metadata.thirst

    local response = LoadHud()
    if response then
        DisplayHud(GlobalSettings.showhud)
        PlayerLoaded = true
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    local playerdata = QBCore.Functions.GetPlayerData()
    if playerdata then
        Playerstatus.Stress = playerdata.metadata.stress
        Playerstatus.Hunger = playerdata.metadata.hunger
        Playerstatus.Thirst = playerdata.metadata.thirst
        
        local response = LoadHud()
        if response then
            DisplayHud(GlobalSettings.showhud)
            PlayerLoaded = true
        end
    end
end)


RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    Hunger = newHunger
    Thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    Stress = newStress
end)

