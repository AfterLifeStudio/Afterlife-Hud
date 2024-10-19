

Notify = function (title,description,type)
    lib.notify({
        title = title,
        description = description,
        type = type
    })
end

NuiMessage = function(action, data)
    SendNUIMessage({
        action = action,
        data = data,
    })
end
