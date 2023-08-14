## Description
This is MTA:SA ready to use improved vehicles lights system resource. It implements custom indicators, brakes, reverse, parking lights, including client-server sides synchronization. The resource requires [custom_vehicle_lights](https://github.com/rifleh700/custom_vehicle_lights "custom_vehicle_lights") resource.

[Demo video here!](https://imgur.com/0DygyZf "Demo video here!")

**Note: required vehicles adaptation, check the "custom_vehicle_lights" resource.**

## Exported shared functions
- `boolean getVehicleHeadLightsState(element vehicle)`
- `boolean setVehicleHeadLightsState(element vehicle, boolean state)`
- `int getVehicleIndicatorLightsState(element vehicle)` (state 0 means that indicators are disabled, 1 - left turn signal is enabled, 2 - right turn signal is enabled, 3 - hazard signal is enabled)
- `boolean setVehicleIndicatorLightsState(element vehicle, int state)`
- `boolean getVehicleParkLightsState(element vehicle)`
- `boolean setVehicleParkLightsState(element vehicle, boolean vehicle)`

## Commands
- `lights` (`L` key) switch head lights
- `turnl` (`<` key) switch turn left signal
- `turnr` (`>` key) switch turn right signal
- `hazard` (`/` key) switch hazard signal
- `park` (`K` key) switch parking lights
