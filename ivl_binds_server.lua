
addCommandHandler("lights",
	function(player)
		local vehicle = getPedOccupiedVehicle(player)
		if not vehicle then return end

		setVehicleHeadLightsState(vehicle, not getVehicleHeadLightsState(vehicle))
	end
)

addCommandHandler("turnl",
	function(player)
		local vehicle = getPedOccupiedVehicle(player)
		if not vehicle then return end

		local state = getVehicleIndicatorLightsState(vehicle)
		setVehicleIndicatorLightsState(vehicle, state == 1 and 0 or 1)
	end
)

addCommandHandler("turnr",
	function(player)
		local vehicle = getPedOccupiedVehicle(player)
		if not vehicle then return end

		local state = getVehicleIndicatorLightsState(vehicle)
		setVehicleIndicatorLightsState(vehicle, state == 2 and 0 or 2)
	end
)

addCommandHandler("hazard",
	function(player)
		local vehicle = getPedOccupiedVehicle(player)
		if not vehicle then return end

		local state = getVehicleIndicatorLightsState(vehicle)
		setVehicleIndicatorLightsState(vehicle, state == 3 and 0 or 3)
	end
)

addCommandHandler("park",
	function(player)
		local vehicle = getPedOccupiedVehicle(player)
		if not vehicle then return end

		setVehicleParkLightsState(vehicle, not getVehicleParkLightsState(vehicle))
	end
)
