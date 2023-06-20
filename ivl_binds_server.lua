
local CONTROLS = {
	{"lights", "l", setVehicleHeadLightsState, getVehicleHeadLightsState, true, false},
	{"turnl", ",", setVehicleIndicatorLightsState, getVehicleIndicatorLightsState, 1, 0},
	{"turnr", ".", setVehicleIndicatorLightsState, getVehicleIndicatorLightsState, 2, 0},
	{"hazard", "/", setVehicleIndicatorLightsState, getVehicleIndicatorLightsState, 3, 0},
	{"park", "k", setVehicleParkLightsState, getVehicleParkLightsState, true, false},
}

local function bindKeys(player)
	for _, control in ipairs(CONTROLS) do
		bindKey(player, control[2], "down", control[1])
	end
	return true
end

addEventHandler("onResourceStart", resourceRoot,
	function()
		
		for _, control in ipairs(CONTROLS) do
			addCommandHandler(control[1],
				function(player)
					local vehicle = getPedOccupiedVehicle(player)
					if not vehicle then return end

					local current = control[4](vehicle)
					local arg = control[5]
					if arg == current then
						arg = control[6]
					end
					control[3](vehicle, arg)
				end
			)
		end

		for _, player in ipairs(getElementsByType("player")) do
			bindKeys(player)
		end

	end
)

addEventHandler("onPlayerJoin", root,
	function()
		
		bindKeys(source)

	end
)