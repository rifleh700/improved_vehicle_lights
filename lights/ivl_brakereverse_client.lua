
local BRAKE_LIGHTS = getVehicleCustomLightsFromNames({
	"brake_l",
	"brake_r",
	"brake"
})

local REVERSE_LIGHTS = getVehicleCustomLightsFromNames({
	"reverse_l",
	"reverse_r",
	"reverse",
})

function IVL.disableBrakeReverse(vehicle)
	
	IVL.setData(vehicle, "brake", false)
	IVL.setData(vehicle, "reverse", false)
	setVehicleCustomLightsPower(vehicle, BRAKE_LIGHTS, 0)
	setVehicleCustomLightsPower(vehicle, REVERSE_LIGHTS, 0)

	return true
end

function IVL.updateBrakeReverse(vehicle)
	
	local driver = getVehicleOccupant(vehicle)
	if not driver then return false end

	local reverseNew = false
	local brakeNew = false
	local brakeOld = IVL.getData(vehicle, "brake")
	local reverseOld = IVL.getData(vehicle, "reverse")
	
	local gear = getVehicleCurrentGear(vehicle)
	local accelerateControl = getPedControlState(driver, "accelerate")
	local brakeControl = getPedControlState(driver, "brake_reverse")
	if not (accelerateControl and brakeControl) then

		reverseNew =
			gear == 0 and (brakeControl or reverseOld)

		brakeNew = 
			(gear == 0 and accelerateControl) or
			(gear > 0 and brakeControl) or
			(brakeOld and not(accelerateControl or brakeControl))
	end
	
	if brakeOld ~= brakeNew then
		setVehicleCustomLightsPower(vehicle, BRAKE_LIGHTS, brakeNew and 1 or 0)
		setVehicleLightState(vehicle, 2, 1)
		setVehicleLightState(vehicle, 3, 1)
		IVL.setData(vehicle, "brake", brakeNew)
	end

	if reverseOld ~= reverseNew then
		setVehicleCustomLightsPower(vehicle, REVERSE_LIGHTS, reverseNew and 1 or 0)
		IVL.setData(vehicle, "reverse", reverseNew)
	end

	return true
end

addEventHandler("onClientVehicleStartExit", root,
	function(player, seat, door)
		if seat ~= 0 then return end

		IVL.disableBrakeReverse(source)

	end
)

addEventHandler("onClientVehicleExit", root,
	function(player, seat)
		if seat ~= 0 then return end

		IVL.disableBrakeReverse(source)

	end
)

function getVehicleBrakeLightsState(vehicle)
	
	return IVL.getData(source, "brake")
end

function getVehicleReverseLightsState(vehicle)
	
	return IVL.getData(source, "reverse")
end