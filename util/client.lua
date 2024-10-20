
---@param title string
---@param description string
---@param type string
Notify = function (title,description,type)
    lib.notify({
        title = title,
        description = description,
        type = type
    })
end

---@param action string
---@param data any
NuiMessage = function(action, data)
    SendNUIMessage({
        action = action,
        data = data,
    })
end
