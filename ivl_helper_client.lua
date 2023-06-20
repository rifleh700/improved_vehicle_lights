
function getVehicleCustomLightsFromNames(names)
	
	local lights = {}
	for i, name in ipairs(names) do
		local light = getVehicleCustomLightFromName(name)
		if light then
			lights[#lights + 1] = light
		end
	end
	return lights
end

function setVehicleCustomLightsPower(vehicle, lights, power)
	
	for i, light in ipairs(lights) do
		setVehicleCustomLightPower(vehicle, light, power)
	end
	return true
end