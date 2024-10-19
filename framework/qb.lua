if not (Config.framework == 'qb') then return end

local QBCore = exports['qb-core']:GetCoreObject()
PlayerLoaded = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    local playerdata = QBCore.Functions.GetPlayerData()

    Stress = playerdata.metadata.stress
    Hunger = playerdata.metadata.hunger
    Thirst = playerdata.metadata.thirst

    local response = StreamMinimap()
    DisplayHud(true)
    PlayerLoaded = true
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    local playerdata = QBCore.Functions.GetPlayerData()
    if playerdata then
        Stress = playerdata.metadata.stress
        Hunger = playerdata.metadata.hunger
        Thirst = playerdata.metadata.thirst
        
        local response = StreamMinimap()
        DisplayHud(true)
        PlayerLoaded = true
    end
end)


RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    Hunger = newHunger
    Thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    Stress = newStress
end)

