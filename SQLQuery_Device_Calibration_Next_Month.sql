-- Find Devices Due for Calibration Within the Next Month
SELECT
DI.DeviceID, 
DI.TagNumber, 
DI.DeviceType, 
CM.NextcalibrationDate
FROM
DeviceInfo DI LEFT JOIN CalibrationMaintenance CM ON DI.DeviceID = CM.DeviceID
WHERE
NextcalibrationDate BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE());