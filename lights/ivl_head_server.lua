
function getVehicleHeadLightsState(vehicle)
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "head")
end

function setVehicleHeadLightsState(vehicle, state)
	if not scheck("u:element:vehicle,b") then return false end

	return IVL.setData(vehicle, "head", state)
end