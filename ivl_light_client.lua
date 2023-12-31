
local UP_SPEED = 0.25
local DOWN_SPEED = 0.15

local _setVehicleCustomLightPower = setVehicleCustomLightPower
function setVehicleCustomLightPower(vehicle, name, power)

	local powerData = IVL.getData(vehicle, "power") or {}
	powerData[name] = power

	return IVL.setData(vehicle, "power", powerData)
end

addEventHandler("onClientPreRender", root,
	function()

		for _, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
			if not isVehicleBlown(vehicle) then
				for name, target in pairs(IVL.getData(vehicle, "power") or {}) do
					local current = getVehicleCustomLightPower(vehicle, name)
					if target ~= current then
						local power = current
						if target > current then
							power = power + UP_SPEED
						else
							power = power - DOWN_SPEED
						end
						_setVehicleCustomLightPower(vehicle, name, power)
					end
				end
			end
		end

	end
)

