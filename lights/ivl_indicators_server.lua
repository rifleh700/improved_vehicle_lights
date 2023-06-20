
function getVehicleIndicatorLightsState(vehicle)
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "indicators.state")
end

function setVehicleIndicatorLightsState(vehicle, state)
	if not scheck("u:element:vehicle,n") then return false end

	state = math.min(math.max(math.floor(state), 0), 3)

	return IVL.setData(vehicle, "indicators.state", state)
end