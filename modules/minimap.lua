
local resolutions = lib.load('data.resolutions')

---@class defaultres
local defaultres = {
    sizex = 203,
    sizey = 245,
    posx = 0.035,
    posy = -0.019,
}

---@return table
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

---@return boolean
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
    SetMinimapComponentPosition('minimap_mask', dir, 'B', dimensions.posx + 0.068, 0.0, 0.0837, 0.335)
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
