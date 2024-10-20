
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

