-- Find Devices Lacking Datasheets ( Missing Documentation )
SELECT
DI.DeviceID, DI.TagNumber, DI.DeviceType
FROM
DeviceInfo DI
LEFT JOIN
DocumentationDrawings DD
ON
DI.DeviceID = DD.DeviceID
WHERE
DD.Datasheet IS NULL;