
---@class Playerstatus
Playerstatus = {
    voicemode = 0,
    Hunger = 0,
    Thirst = 0,
    Stress = 100,
}


local GetEntityHealth = GetEntityHealth
local GetPedArmour = GetPedArmour
local IsEntityInWater = IsEntityInWater
local GetPlayerSprintStaminaRemaining = GetPlayerSprintStaminaRemaining
local GetPlayerUnderwaterTimeRemaining = GetPlayerUnderwaterTimeRemaining

CreateThread(function()
    while true do
        local ped = cache.ped
        local playerid = cache.playerId
        local health = GetEntityHealth(ped)
        local armour = GetPedArmour(ped)
        local voice = NetworkIsPlayerTalking(playerid)
        local oxygen
        if not IsEntityInWater(ped) then
            oxygen = 100 - GetPlayerSprintStaminaRemaining(playerid)
        end
        
        if IsEntityInWater(ped) then
            oxygen = GetPlayerUnderwaterTimeRemaining(playerid) * 10
        end

        NuiMessage('playerstatus', {
            show   = GlobalSettings.showplayerstatus,
            health = health - 100,
            armour = armour,
            oxygen = oxygen,
            voice = voice,
            voicemode = Playerstatus.voicemode,
            hunger = Playerstatus.Hunger,
            thirst = Playerstatus.Thirst,
        })
        Wait(1200)
    end
end)

---@param mode integer
AddEventHandler('pma-voice:setTalkingMode', function(mode)
    Playerstatus.voicemode = mode
end)


