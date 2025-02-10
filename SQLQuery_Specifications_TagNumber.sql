-- Query InstrumentationDB3 on TagNumber and return all other specifications (Columns) based on that TagNumber
SELECT
DI.DeviceID,
DI.TagNumber,
DI.DeviceType,
DI.Manufacturer,
DI.ModelNumber,
DI.SerialNumber,
DI.Description,
DI.Location,
DI.InstallationDate,
DI.CommissioningDate,
DI.DecommissioningDate,
PS.MeasurementRangeMin,
PS.MeasurementRangeMax,
PS.Accuracy,
PS.Repeatability,
PS.ResponseTime,
PS.Resolution,
PS.Drift,
ES.OperatingTempRangeMin,
ES.OperatingTempRangeMax,
ES.IngressProtectionIP,
ES.HazardousAreaClassification,
ES.CorrosionResistance,
ELS.PowerSupply,
ELS.SignalOutput,
ELS.CommunicationProtocol,
PCS.ProcessConnectionType,
PCS.ProcessConnectionSize,
PCS.WettedMaterials,
CM.CalibrationFrequency,
CM.LastCalibrationDate,
CM.NextCalibrationDate,
CM.CalibrationProcedure,
CM.MaintenanceHistory,
DD.Datasheet,
DD.InstallationManual,
DD.LoopDiagram,
DD.PIDReference
FROM DeviceInfo DI 
LEFT JOIN PerformanceSpecifications PS ON DI.DeviceID = PS.DeviceID
LEFT JOIN EnvironmentalSpecifications ES ON DI.DeviceID = ES.DeviceID
LEFT JOIN ElectricalSpecifications ELS ON DI.DeviceID = ELS.DeviceID
LEFT JOIN ProcessConnectionSpecifications PCS ON DI.DeviceID = PCS.DeviceID
LEFT JOIN CalibrationMaintenance CM ON DI.DeviceID = CM.DeviceID
LEFT JOIN DocumentationDrawings DD ON DI.DeviceID = DD.DeviceID
WHERE
TagNumber = 'Your_Tag_Number';	-- Replace 'Your_Tag_Number' with the TagNumber you want to search for.