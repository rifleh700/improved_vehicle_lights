
local HEAD_LIGHTS = getVehicleCustomLightsFromNames({
	"head_l",
	"head_r",
	"head"
})

local TAIL_LIGHTS = getVehicleCustomLightsFromNames({
	"tail_l",
	"tail_r",
	"tail"
})

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
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "head")
end

function setVehicleHeadLightsState(vehicle, state)
	if not scheck("u:element:vehicle,b") then return false end

	return IVL.setData(vehicle, "head", state)
end