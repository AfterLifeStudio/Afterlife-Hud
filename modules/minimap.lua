local resolutions = lib.load('data.resolutions')

local GetActualScreenResolution = GetActualScreenResolution
local RequestStreamedTextureDict = RequestStreamedTextureDict
local HasStreamedTextureDictLoaded = HasStreamedTextureDictLoaded
local SetMinimapComponentPosition = SetMinimapComponentPosition
local SetBlipAlpha = SetBlipAlpha
local GetNorthRadarBlip = GetNorthRadarBlip
local SetRadarBigmapEnabled = SetRadarBigmapEnabled


---@class NuiRes
NuiRes = {
    width = 203,
    height = 245
}

---@class defaultres
local defaultres = {
    sizex = 203,
    sizey = 245,
    posx = 0.847,
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
StreamMinimap = function()
    local dimensions = CalculateMinimap()
    local dir = 'L'
    local map = GlobalSettings.circlemap and 'circlemap' or 'squaremap'


    Wait(1000)
    RequestStreamedTextureDict(map, false)
    while not HasStreamedTextureDictLoaded(map) do
        Wait(100)
    end
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", map, "radarmasksm")

    SetMinimapClipType(GlobalSettings.circlemap and 1 or 0)

    local w, h = 0.111, 0.245

    if GlobalSettings.circlemap then
        SetMinimapComponentPosition('minimap', dir, 'B', dimensions.posx - 0.003, dimensions.posy, w, h)
        SetMinimapComponentPosition('minimap_mask', dir, 'B', dimensions.posx - 0.007, dimensions.posy + 0.03, w, h - 0.05)
        SetMinimapComponentPosition('minimap_blur', dir, 'B', dimensions.posx - 0.007, dimensions.posy, w, h)
    else
        SetMinimapComponentPosition('minimap', dir, 'B', dimensions.posx, dimensions.posy, w + 0.06, h + 0.06)
        SetMinimapComponentPosition('minimap_mask', dir, 'B', dimensions.posx + 0.008, dimensions.posy, w - 0.027, h + 0.05)
        SetMinimapComponentPosition('minimap_blur', dir, 'B', dimensions.posx, dimensions.posy, w, h)
    end

    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)

    NuiRes = {
        width = dimensions.sizex + (GlobalSettings.circlemap and 75 or 0),
        height = dimensions.sizey
    }
    return true
end


