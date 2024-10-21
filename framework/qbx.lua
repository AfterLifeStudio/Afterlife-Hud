if not (Framework == 'qbx') then return end

local QBCore = exports['qb-core']:GetCoreObject()
PlayerLoaded = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Playerstatus.Stress = QBX.PlayerData.metadata.stress
    Playerstatus.Hunger = QBX.PlayerData.metadata.hunger
    Playerstatus.Thirst = QBX.PlayerData.metadata.thirst

    local response = LoadHud()
    if response then
        DisplayHud(GlobalSettings.showhud)
        PlayerLoaded = true
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    DisplayHud(false)
    PlayerLoaded = false
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if QBX.PlayerData then
        Playerstatus.Stress = QBX.PlayerData.metadata.stress
        Playerstatus.Hunger = QBX.PlayerData.metadata.hunger
        Playerstatus.Thirst = QBX.PlayerData.metadata.thirst
        
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

