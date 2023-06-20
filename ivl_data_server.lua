
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
	triggerClientEvent("ivl.data", vehicle, key, value)

	return true
end

addEventHandler("onElementDestroy", root,
	function()

		vehiclesData[source] = nil

	end
)