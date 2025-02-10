-- List Devices Installed Within Date Range
SELECT DeviceID, TagNumber, DeviceType, InstallationDate
FROM
DeviceInfo
WHERE
InstallationDate BETWEEN '2023-01-01' AND '2023-12-31';	-- Replace with the desired date range
