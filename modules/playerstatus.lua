Hunger, Thirst, Stres = 0, 0, 0

CreateThread(function()
    while true do
        local ped = cache.ped
        local health = GetEntityHealth(ped)
        local armour = GetPedArmour(ped)
        local oxygen
        -- if not IsEntityInWater(cache.ped) then
        --     oxygen = 100 - GetPlayerSprintStaminaRemaining(cache.playerId)
        -- end
        --
        -- if IsEntityInWater(cache.ped) then
        --     oxygen = GetPlayerUnderwaterTimeRemaining(cache.playerId) * 10
        -- end

        NuiMessage('playerstatus', {
            health = health - 100,
            armour = armour,
            oxygen = oxygen,
            hunger = Hunger,
            thirst = Thirst,
        })
        Wait(1200)
    end
end)
