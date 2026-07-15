--[[
  Demo: register a 2x2 home widget with GKSPHONE (client-only export).

  Install:
    1. Copy this folder into your server resources
    2. ensure gksphone
    3. ensure custom-widget
    4. In-game: Edit home → + → Widgets → "Demo Widget"
]]

local WIDGET_ID = 'demo-widget'
local RESOURCE = GetCurrentResourceName()

local function registerWidget()
    if GetResourceState('gksphone') ~= 'started' then
        return false
    end

    local ok = exports['gksphone']:AddCustomWidget({
        id = WIDGET_ID,
        widgetUrl = ('https://cfx-nui-%s/ui/widget.html'):format(RESOURCE),
        title = 'Demo Widget',
        description = 'Example custom home widget',
        icon = 'sparkles',
        size = '2x2',
        labelLangs = {
            en = 'Demo Widget',
            tr = 'Demo Widget'
        },
        show = true
    })

    if ok then
        print(('[custom-widget] Registered "%s" with gksphone'):format(WIDGET_ID))
    else
        print('^1[custom-widget] AddCustomWidget failed^7')
    end
    return ok == true
end

CreateThread(function()
    local tries = 0
    while tries < 60 do
        if registerWidget() then
            return
        end
        tries = tries + 1
        Wait(1000)
    end
    print('^1[custom-widget] gksphone not started — widget not registered^7')
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == 'gksphone' then
        Wait(500)
        registerWidget()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= RESOURCE then return end
    if GetResourceState('gksphone') == 'started' then
        pcall(function()
            exports['gksphone']:RemoveCustomWidget(WIDGET_ID)
        end)
    end
end)
