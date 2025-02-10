-- Find Devices with Specific Connection Type (e.g. Flanged)
SELECT DI.DeviceID, DI.TagNumber, DI.DeviceType
FROM
DeviceInfo DI 
LEFT JOIN ProcessConnectionSpecifications PCS
ON
DI.DeviceID = PCS.DeviceID
WHERE
PCS.ProcessConnectionType LIKE '%Flanged%';	-- Use LIKE for partial matches