local resolutions = lib.load('data.resolutions')

local defaultres = {
    sizex = 203,
    sizey = 245,
    posx = 0.035,
    posy = -0.019,
}


local function CalculateMinimap()
    local screenx, screeny = GetActualScreenResolution()
    local res = defaultres
    for i = 1, #resolutions do
        if resolutions[i].screenx == screenx and resolutions[i].screeny == screeny then
            res = resolutions[i]
            break;
        end
    end
    return res
end



StreamMinimap = function ()
    local dimensions = CalculateMinimap()
    local dir = 'R'

    RequestStreamedTextureDict("squaremap", false)
    if not HasStreamedTextureDictLoaded("squaremap") then
        Wait(150)
    end

    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")

    SetMinimapComponentPosition('minimap', dir, 'B', dimensions.posx, dimensions.posy, 0.203, 0.245)
    SetMinimapComponentPosition('minimap_mask', dir, 'B', dimensions.posx + 0.068, 0.0, 0.0837, 0.235)
    SetMinimapComponentPosition('minimap_blur', dir, 'B', dimensions.posx + (-0.0465), dimensions.posy + (-0.002), 0.111,0.245)

    SetMinimapClipType(0)
    SetBlipAlpha(GetNorthRadarBlip(), 0)

    SetRadarBigmapEnabled(true, false)
    Wait(50)
    SetRadarBigmapEnabled(false, false)

    NuiMessage('minimap',{
        width = dimensions.sizex,
        height = dimensions.sizey
    })

    return true
end


CreateThread(function()
    DisplayRadar(false)
    SetHudComponentSize(6, 0, 0)
    SetHudComponentSize(7, 0, 0)
    SetHudComponentSize(8, 0, 0)
    SetHudComponentSize(9, 0, 0)
end)


DisplayHud = function (state)
    print(state)
   NuiMessage('visible', state)
   DisplayRadar(state)
end


local _st = true
CreateThread(function()
    while true do
        local state = IsPauseMenuActive()
        if state == 1 then state = true end
        if not (_st == state) then
            _st = not _st
            DisplayHud(not state)
        end
        Wait(1000)
    end
end)
