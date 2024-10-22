local vehicle,seatbelt = false,false

local GetEntitySpeed = GetEntitySpeed
local GetVehicleFuelLevel = GetVehicleFuelLevel
local GetVehicleClass = GetVehicleClass
local SetFlyThroughWindscreenParams = SetFlyThroughWindscreenParams

CreateThread(function()
    while true do
        local sleep = 1000
        local incar = vehicle and true or false
        local showspeedometer = GlobalSettings.showspeedometer == true and incar or false

        if incar then
            sleep = 50
            local speed = math.ceil(GetEntitySpeed(vehicle) *  (GlobalSettings.speedunitmph and 2.2 or 3.6))
            local fuel = math.ceil(GetVehicleFuelLevel(vehicle))
            local data = {
                show = showspeedometer,
                speed = speed,
                fuel = fuel,
                seatbelt = not seatbelt,
                unit = GlobalSettings.speedunitmph
            }
            NuiMessage('speedometer', data)
        else
            NuiMessage('speedometer', {show = showspeedometer})
        end

        
        Wait(sleep)
    end
end)

---@return boolean
local VehicleTypeCheck = function()
    local class = GetVehicleClass(vehicle)
    if class == (8 and 13 and 14) then
        return false
    end
    return true
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
    defaultKey = 'b',
    onPressed = function(self)
        ToggleSeatbelt()
    end,
})



lib.onCache('vehicle', function(vehicledata)
    vehicle = vehicledata
end)
