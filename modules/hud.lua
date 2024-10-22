local Active = false
local IsPauseMenuActive = IsPauseMenuActive

---@class hidehudcomponents
local hidehudcomponents = {6,7,8,9}

CreateThread(function()
    DisplayRadar(false)
    for i = 1,#hidehudcomponents do
        SetHudComponentSize(hidehudcomponents[i], 0, 0)
    end
end)

---@param state boolean;
DisplayHud = function (state)
   NuiMessage('visible', state)
   DisplayRadar(state)
end

CreateThread(function()
    while true do
        if GlobalSettings.showhud then
            local pausemenuactive = IsPauseMenuActive()

            if pausemenuactive and not Active then
                NuiMessage('visible', Active)
                Active = true
            elseif not pausemenuactive and Active then
                StreamMinimap()
                NuiMessage('visible', Active)
                Active = false
            end
        end
        Wait(1000)
    end
end)
