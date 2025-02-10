USE InstrumentationDB3;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='DeviceInfo')
BEGIN
CREATE TABLE DeviceInfo (
	DeviceID INT PRIMARY KEY, 
	TagNumber NVARCHAR(100),
	DeviceType NVARCHAR(50) CHECK (DeviceType IN ('Transmitter', 'Controller', 'Valve', 'Analyzer', 'Gauge', 'Switch')),	-- ENUM Simulation
	Manufacturer NVARCHAR(100),
	ModelNumber NVARCHAR(100),
	SerialNumber NVARCHAR(100),
	Description NVARCHAR(255),
	Location NVARCHAR(100),
	InstallationDate DATE,
	CommissioningDate DATE,
	DecommissioningDate DATE
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='PerformanceSpecifications')
BEGIN
CREATE TABLE PerformanceSpecifications (
	DeviceID INT PRIMARY KEY,
	MeasurementRangeMin NVARCHAR(50),
	MeasurementRangeMax NVARCHAR(50),
	Accuracy NUMERIC(10, 2),
	Repeatability NUMERIC(10, 2),
	ResponseTime NUMERIC(10, 2),
	Resolution NUMERIC(10, 2),
	Drift NUMERIC(10, 2),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='EnvironmentalSpecifications')
BEGIN
CREATE TABLE EnvironmentalSpecifications(
	DeviceID INT PRIMARY KEY,
	OperatingTempRangeMin NVARCHAR(50),
	OperatingTempRangeMax NVARCHAR(50),
	IngressProtectionIP NVARCHAR(50),
	HazardousAreaClassification NVARCHAR(100),
	CorrosionResistance NVARCHAR(100),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='ElectricalSpecifications')
BEGIN
CREATE TABLE ElectricalSpecifications(
	DeviceID INT PRIMARY KEY,
	PowerSupply NVARCHAR(100),
	SignalOutput NVARCHAR(100),
	CommunicationProtocol NVARCHAR(100),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='ProcessConnectionSpecifications')
BEGIN
CREATE TABLE ProcessConnectionSpecifications(
	DeviceID INT PRIMARY KEY,
	ProcessConnectionType NVARCHAR(100),
	ProcessConnectionSize NVARCHAR(100),
	WettedMaterials NVARCHAR(255),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='CalibrationMaintenance')
BEGIN
CREATE TABLE CalibrationMaintenance(
	DeviceID INT PRIMARY KEY,
	CalibrationFrequency NVARCHAR(100),
	LastCalibrationDate DATE,
	NextcalibrationDate DATE,
	CalibrationProcedure NVARCHAR(255),
	MaintenanceHistory TEXT, 
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='DocumentationDrawings')
BEGIN
CREATE TABLE DocumentationDrawings(
	DeviceID INT PRIMARY KEY,
	Datasheet NVARCHAR(255),
	InstallationManual NVARCHAR(255),
	LoopDiagram NVARCHAR(255),
	PIDReference NVARCHAR(255),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

-- Table for Valve-Specific Specifications (if applicable)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='ValveSpecifications')
BEGIN
CREATE TABLE ValveSpecifications(
	DeviceID INT PRIMARY KEY,
	ValveType NVARCHAR(50) CHECK (ValveType IN ('Type A', 'Type B', 'Type C')),
	ValveSize NVARCHAR(50),
	ValvePressureRating NVARCHAR(50),
	ActuatorType NVARCHAR(50),
	ActuatorFailPosition NVARCHAR(50) CHECK (ActuatorFailPosition IN ('Fail Open', 'Fail Close')),	-- ENUM Simulation
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

-- Table for Transmitter-Specific Specifications (if applicable)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='TransmitterSpecifications')
BEGIN
CREATE TABLE TransmitterSpecifications(
DeviceID INT PRIMARY KEY,
MeasuredVariable NVARCHAR(100),
SensorType NVARCHAR(100),
FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END

-- Table for Transmitter-Specific-Specifications (if applicable)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='AnalyzerSpecifications')
BEGIN
CREATE TABLE AnalyzerSpecifications(
	DeviceID INT PRIMARY KEY,
	MeasuredComponents NVARCHAR(100),
	AnalysisMethod NVARCHAR(100),
	FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID)
);
END