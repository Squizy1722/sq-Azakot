local CanDisplay = true

RegisterNetEvent('sq-Azakot', function(bool, data) 
    if CanDisplay then
    SendNUIMessage({
        type = 'show',
        Alerts = data or false,
        status = bool
    }) 
end
end)

RegisterCommand('hideazakot', function ()
    CanDisplay = not CanDisplay
    if not CanDisplay then
            SendNUIMessage({
        type = 'show',
        Alerts = false,
        status = false
    }) 
    end
    print('You have set your azakot system to - '..tostring(CanDisplay))
end)

RegisterCommand('azakot', function ()
        SetNuiFocus(true, true)
end)

RegisterNUICallback("hide", function(data)
    SetNuiFocus(false, false)
end)