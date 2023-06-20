
function getVehicleParkLightsState(vehicle)
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "park")
end

function setVehicleParkLightsState(vehicle, state)
	if not scheck("u:element:vehicle,b") then return false end

	return IVL.setData(vehicle, "park", state)
end