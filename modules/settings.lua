
local GetResourceKvpString = GetResourceKvpString
local SetResourceKvp = SetResourceKvp

---@class GlobalSettings 
GlobalSettings = {}

---@class Settings
local Settings = {
    showhud = true,
    cinemtic = false,
    showspeedometer = true,
    showplayerstatus = true,
    showminimap = true,
    speedunitmph = true,
}

---@return boolean
LoadHud = function ()
    ::Repeat::

    local data = GetResourceKvpString('Hud:Data')
    
    if data then
        GlobalSettings = json.decode(data)
    else
        SetResourceKvp('Hud:Data', json.encode(Settings))
        goto Repeat
    end

    local response = StreamMinimap()
    return response
end


---@param data table
RegisterNUICallback('settings', function (data, cb)
    local value = data.input

    GlobalSettings[data.option] = value
    SetResourceKvp('Hud:Data', json.encode(GlobalSettings))

    if data.option == 'showhud' then
        DisplayHud(GlobalSettings[data.option])
        ToggleSpeedometer(cache.vehicle)
    elseif data.option == 'showspeedometer' then
        ToggleSpeedometer(cache.vehicle)
    end

    cb{{}}
end)




RegisterNUICallback('exitsettings', function (data, cb)
    SetNuiFocus(false, false)
    cb{{}}
end)

lib.addKeybind({
    name = 'hud:settings',
    description = 'Toggle Hud Settings',
    defaultKey = 'i',
    onPressed = function(self)
        NuiMessage('settings',GlobalSettings)
        SetNuiFocus(true, true)
    end,
})
