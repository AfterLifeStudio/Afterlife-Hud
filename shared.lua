Config = {}
--  setr game_enableFlyThroughWindscreen true
--  add this in the server.cfg for the seatbelt to work  

Config.seatbelt = 'b'
Config.settingskey = 'i'

GetFramework = function()
    if GetResourceState('es_extended') ~= 'missing' then
        return 'esx'
    elseif GetResourceState('qbx_core') ~= 'missing' then
        return 'qbx'
    elseif GetResourceState('qb-core') ~= 'missing' then
        return 'qb'
    elseif GetResourceState('ox_core') ~= 'missing' then
        return 'ox'
    end
end

Framework = GetFramework() -- qb / esx /qbox /ox






