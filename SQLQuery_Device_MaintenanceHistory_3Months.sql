-- List Devices with Recent Maintenance ( Last 3 Months )
SELECT
DI.DeviceID,
DI.TagNumber,
DI.DeviceType,
CM.MaintenanceHistory
FROM
DeviceInfo AS DI INNER JOIN CalibrationMaintenance AS CM
ON DI.DeviceID = CM.DeviceID
WHERE
CM.NextcalibrationDate >= DATEADD(month, -3, GETDATE());
