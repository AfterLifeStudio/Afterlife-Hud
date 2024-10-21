
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
    speedunit = 'MPH',
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

RegisterNUICallback('settings', function (data, cb)
    local value = data[2]
    if value == 'Show' then
        value = true
    elseif value == 'hide' then
        value = false
    end
    GlobalSettings[data[1]] = value
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
        print('a')
        NuiMessage('settings',GlobalSettings)
        SetNuiFocus(true, true)
    end,
})
