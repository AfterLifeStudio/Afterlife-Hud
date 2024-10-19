local vehicle,seatbelt = false,false

local SpeedLoop = function()
    CreateThread(function()
        while vehicle do
            local speed = math.ceil(GetEntitySpeed(vehicle) * 2.236936)
            local fuel = math.ceil(GetVehicleFuelLevel(vehicle))
            local data = {
                speed = speed,
                fuel = fuel,
                seatbelt = not seatbelt,
            }
            NuiMessage('speedometer', data)
            Wait(50)
        end
    end)
end


local VehicleTypeCheck = function()
    local class = GetVehicleClass(vehicle)
    if class ~= 8 and class ~= 13 and class ~= 14 then
        return true
    end
    return false
end

local ToggleSeatbelt = function()
    if vehicle then
        if VehicleTypeCheck(vehicle) then
            seatbelt = not seatbelt
            if seatbelt then
                SetFlyThroughWindscreenParams(1000.0, 1000.0, 0.0, 0.0)
            else
                SetFlyThroughWindscreenParams(15.0, 20.0, 17.0, -500.0)
            end
        end
    end
end



lib.addKeybind({
    name = 'seatbelt',
    description = 'Toggle vehicle seatbelt',
    defaultKey = Config.seatbelt,
    onPressed = function(self)
        ToggleSeatbelt()
    end,
})
lib.onCache('vehicle', function(vehicledata)
    vehicle = vehicledata

    NuiMessage('speedvisible', vehicle and true or false)

    if vehicle then
        SpeedLoop()
    end
end)
