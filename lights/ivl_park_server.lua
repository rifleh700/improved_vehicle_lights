
function getVehicleParkLightsState(vehicle)

	return IVL.getData(vehicle, "park")
end

function setVehicleParkLightsState(vehicle, state)

	return IVL.setData(vehicle, "park", state)
end