-- List Devices with No DecommissioningDate ( Active Devices )
SELECT 
DeviceID, TagNumber, DeviceType, Location
FROM
DeviceInfo
WHERE
DecommissioningDate IS NULL;