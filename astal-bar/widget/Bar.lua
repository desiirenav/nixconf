local astal = require("astal")
local bind = astal.bind
local Battery = astal.require("AstalBattery")
local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor

local function BatteryPercentage()
    local bat = Battery.get_default()

    return Widget.Label({
        label = bind(bat, "percentage"):as(function(p)
            return string.format("%.0f%%", p * 100)
        end),
    })
end

return function(monitor)
    return Widget.Window({
        monitor = monitor,
        anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
        exclusivity = "EXCLUSIVE",
        child = Widget.Box({
            children = {
                BatteryPercentage(),
                Widget.Label({
                    label = "Example label content",
                }),
            }
        })
    })
end
