
function getVehicleHeadLightsState(vehicle)

	return IVL.getData(vehicle, "head")
end

function setVehicleHeadLightsState(vehicle, state)

	return IVL.setData(vehicle, "head", state)
end