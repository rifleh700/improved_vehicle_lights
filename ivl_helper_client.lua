
function setVehicleCustomLightsPower(vehicle, lights, power)
	
	for i, light in ipairs(lights) do
		setVehicleCustomLightPower(vehicle, light, power)
	end
	return true
end