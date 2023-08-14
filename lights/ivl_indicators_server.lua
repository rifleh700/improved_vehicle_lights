
function getVehicleIndicatorLightsState(vehicle)

	return IVL.getData(vehicle, "indicators.state")
end

function setVehicleIndicatorLightsState(vehicle, state)

	state = math.min(math.max(math.floor(state), 0), 3)

	return IVL.setData(vehicle, "indicators.state", state)
end