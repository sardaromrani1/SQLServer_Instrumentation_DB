-- Analyze Calibration Frequency by Device Type
SELECT
DeviceType, AVG( CASE
WHEN CalibrationFrequency LIKE '%month%' THEN
CAST(LEFT(CalibrationFrequency, CHARINDEX('', CalibrationFrequency) -1) AS INT) * 30
WHEN CalibrationFrequency LIKE '%year%' THEN
CAST( LEFT(CalibrationFrequency, CHARINDEX('', CalibrationFrequency) -1) AS INT) * 365
ELSE NULL -- Handle cases where CalibrationFrequency isn't in months or years
END) AS AverageCalibrationDays 
FROM 
DeviceInfo
WHERE
CalibrationFrequency IS NOT NULL AND 
( CalibrationFrequency LIKE '%month%' OR CalibrationFrequency LIKE '%YEAR%')
GROUP BY DeviceType