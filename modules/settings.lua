
local GetResourceKvpString = GetResourceKvpString
local SetResourceKvp = SetResourceKvp
local PlaySoundFromEntity = PlaySoundFromEntity

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
    elseif data.option == 'cinemtic' then
        --Todo
    end

    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)

    cb{{}}
end)




RegisterNUICallback('exitsettings', function (data, cb)
    SetNuiFocus(false, false)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    cb{{}}
end)

lib.addKeybind({
    name = 'hud:settings',
    description = 'Toggle Hud Settings',
    defaultKey = 'i',
    onPressed = function(self)
        PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
        NuiMessage('settings',GlobalSettings)
        SetNuiFocus(true, true)
    end,
})
