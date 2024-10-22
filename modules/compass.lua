
---@return string
local GetPlayerDirection = function ()
    local dgr = GetGameplayCamRot(0).z + 180

    if (dgr >= 0.0 and dgr < 22.5) or dgr >= 337.5 then
        return 'N'
    elseif dgr >= 22.5 and dgr < 67.5 then
        return 'NE'
    elseif dgr >= 67.5 and dgr < 112.5 then
        return 'E'
    elseif dgr >= 112.5 and dgr < 157.5 then
        return 'SE'
    elseif dgr >= 157.5 and dgr < 202.5 then
        return 'S'
    elseif dgr >= 202.5 and dgr < 247.5 then
        return 'SW'
    elseif dgr >= 247.5 and dgr < 292.5 then
        return 'W'
    elseif dgr >= 292.5 and dgr < 337.5 then
        return 'NW'
    end
end 


CreateThread(function()
    while true do
        local ped = cache.ped
        local coords = GetEntityCoords(ped)
        local street1,street2 = GetStreetNameAtCoord(coords.x,coords.y,coords.z)
        local streetname = GetStreetNameFromHashKey(street2)
        if street2 == 0 then
            streetname = GetStreetNameFromHashKey(street1)
        end

        local direction = GetPlayerDirection()

        NuiMessage('compass',{
            show = GlobalSettings.showminimap,
            streetname = streetname,
            direction = direction,
            width = NuiRes.width,
            height = NuiRes.height
        })
        Wait(500)
    end
end)