
local INDICATORS_LIGHTS = {
	getVehicleCustomLightsFromNames({
		"indicatorf_l",
		"indicatorm_l",
		"indicatorr_l",
		"indicator_l"
	}),

	getVehicleCustomLightsFromNames({
		"indicatorf_r",
		"indicatorm_r",
		"indicatorr_r",
		"indicator_r"
	}),

	getVehicleCustomLightsFromNames({
		"indicatorf_l",
		"indicatorm_l",
		"indicatorr_l",
		"indicator_l",
		"indicatorf_r",
		"indicatorm_r",
		"indicatorr_r",
		"indicator_r"
	})
}

-- https://en.wikipedia.org/wiki/Automotive_lighting#Electrical_connection_and_switching
-- "Turn signals are required to blink on and off, or "flash", at a steady rate of between 60 and 120 pulses per minute (1–2 Hz)"
local FREQUENCY_BASE = 1.5

function IVL.updateIndicators(vehicle)

	local state = IVL.getData(vehicle, "indicators.state") or 0
	if state == 0 then return end

	local power = 0
	if state == 3 or getVehicleEngineState(vehicle) then
		local clock = IVL.getData(vehicle, "indicators.clock")
		power = math.sin(2*math.pi*(os.clock() - clock)*FREQUENCY_BASE) > 0 and 1 or 0
	end
	setVehicleCustomLightsPower(vehicle, INDICATORS_LIGHTS[state], power)

	return true
end

addEventHandler("ivl.data", root,
	function(key)
		if key ~= "indicators.state" then return end

		IVL.setData(source, "indicators.clock", os.clock())
		setVehicleCustomLightsPower(source, INDICATORS_LIGHTS[3], 0)
	end
)

function getVehicleIndicatorLightsState(vehicle)
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "indicators.state")
end

function setVehicleIndicatorLightsState(vehicle, state)
	if not scheck("u:element:vehicle,n") then return false end

	state = math.min(math.max(math.floor(state), 0), 3)
	
	return IVL.setData(vehicle, "indicators.state", state)
end