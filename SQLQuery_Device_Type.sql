-- Find Devices by Type:
SELECT
DeviceID, TagNumber, Manufacturer, ModelNumber
FROM DeviceInfo
WHERE
DeviceType = 'Pressure Transmitter'	-- Replace with the desired device type