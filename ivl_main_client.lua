
IVL = {}

addEventHandler("onClientPreRender", root,
	function()
		
		for _, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
			if not isVehicleBlown(vehicle) then
				IVL.updateBrakeReverse(vehicle)
				IVL.updateIndicators(vehicle)
			end
		end

	end
)