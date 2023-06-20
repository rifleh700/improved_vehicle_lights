
local PARK_LIGHTS = getVehicleCustomLightsFromNames({
	"parkf_l",
	"parkf_r",
	"park_l",
	"park_r",
	"park"
})

local TAIL_LIGHTS = getVehicleCustomLightsFromNames({
	"tail_l",
	"tail_r",
	"tail",
})

function IVL.updatePark(vehicle)

	local state = IVL.getData(vehicle, "park")
	setVehicleCustomLightsPower(vehicle, PARK_LIGHTS, state and 1 or 0)

	if not getVehicleHeadLightsState(vehicle) then
		setVehicleCustomLightsPower(vehicle, TAIL_LIGHTS, state and 1 or 0)
	end

	return true
end

addEventHandler("onClientElementStreamIn", resourceRoot,
	function()
		if getElementType(source) ~= "vehicle" then return end

		IVL.updatePark(source)

	end
)

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		
		for _, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
			IVL.updatePark(vehicle)
		end

	end
)

addEventHandler("ivl.onDataChanged", root,
	function(key)
		if key ~= "park" then return end

		IVL.updatePark(source)

	end
)

function getVehicleParkLightsState(vehicle)
	if not scheck("u:element:vehicle") then return false end

	return IVL.getData(vehicle, "park")
end

function setVehicleParkLightsState(vehicle, state)
	if not scheck("u:element:vehicle,b") then return false end

	return IVL.setData(vehicle, "park", state)
end