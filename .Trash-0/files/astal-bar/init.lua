local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("widget.Bar")
local src = require("lib").src

App:start({
	instance_name = "lua",
	request_handler = function(msg, res)
		print(msg)
		res("ok")
	end,
	main = function()
		for _, mon in pairs(App.monitors) do
			Bar(mon)
		end
	end,
})
