local display = false
local sleep = 10000

CreateThread(function()
    while true do
        PerformHttpRequest("https://redalert.me/alerts", function(err, text, headers) 
            if text then
                text = json.decode(text)
                local Alerts = {}
                for k, v in ipairs(text) do
                    if os.time() - v.date < 120 then
                        Alerts[#Alerts+1] = v
                    end
                end
                if #Alerts > 0 then
                TriggerClientEvent('sq-Azakot', -1, true, Alerts)
                display = true
                sleep = 2500
                else
                    if display then
                TriggerClientEvent('sq-Azakot', -1, false)
                display = false
                sleep = 10000
                    end
                end
            end
        end)
        Wait(sleep)
    end
end)