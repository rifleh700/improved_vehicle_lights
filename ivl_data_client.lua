
addEvent("ivl.data", true)
addEvent("ivl.onDataChanged", false)

local vehiclesData = {}

function IVL.getData(vehicle, key)

	local data = vehiclesData[vehicle]
	if not data then return nil end

	return data[key]
end

function IVL.setData(vehicle, key, value)
	
	local data = vehiclesData[vehicle] or {}
	if data[key] == value then return false end

	data[key] = value
	vehiclesData[vehicle] = data
	triggerEvent("ivl.onDataChanged", vehicle, key, value)

	return true
end

addEventHandler("ivl.data", root,
	function(key, value)
		if not isElement(source) then return end

		IVL.setData(source, key, value)

	end
)

addEventHandler("onClientElementDestroy", root,
	function()

		vehiclesData[source] = nil

	end
)