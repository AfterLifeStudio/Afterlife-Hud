if not (Framework == 'qbx') then return end

local QBCore = exports['qb-core']:GetCoreObject()
PlayerLoaded = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Stress = QBX.PlayerData.metadata.stress
    Hunger = QBX.PlayerData.metadata.hunger
    Thirst = QBX.PlayerData.metadata.thirst

    local response = StreamMinimap()
    DisplayHud(true)
    PlayerLoaded = true
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    DisplayHud(false)
    PlayerLoaded = false
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if QBX.PlayerData then
        Stress = QBX.PlayerData.metadata.stress
        Hunger = QBX.PlayerData.metadata.hunger
        Thirst = QBX.PlayerData.metadata.thirst
        
        local response = StreamMinimap()
        StreamMinimap()
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

