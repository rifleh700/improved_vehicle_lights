
local HEAD_LIGHTS = {
	"head_l",
	"head_r"
}

local TAIL_LIGHTS = {
	"tail_l",
	"tail_r"
}

function IVL.updateHead(vehicle)

	local state = IVL.getData(vehicle, "head")
	setVehicleCustomLightsPower(vehicle, HEAD_LIGHTS, state and 1 or 0)
	setVehicleOverrideLights(vehicle, state and 2 or 1)
	setVehicleLightState(vehicle, 2, 1)
	setVehicleLightState(vehicle, 3, 1)

	if not getVehicleParkLightsState(vehicle) then
		setVehicleCustomLightsPower(vehicle, TAIL_LIGHTS, state and 1 or 0)
	end

	return true
end

addEventHandler("onClientElementStreamIn", resourceRoot,
	function()
		if getElementType(source) ~= "vehicle" then return end

		IVL.updateHead(source)

	end
)

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		
		for _, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
			IVL.updateHead(vehicle)
		end

	end
)

addEventHandler("ivl.onDataChanged", root,
	function(key)
		if key ~= "head" then return end

		IVL.updateHead(source)

	end
)

function getVehicleHeadLightsState(vehicle)

	return IVL.getData(vehicle, "head")
end

function setVehicleHeadLightsState(vehicle, state)

	return IVL.setData(vehicle, "head", state)
end