-- Find Devices by Manufacturer
SELECT
DeviceID, TagNumber, DeviceType, ModelNumber
FROM DeviceInfo
WHERE
Manufacturer = 'Rosemount';		-- Replace with the desired manufacturer