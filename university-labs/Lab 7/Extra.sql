--Extera
CREATE TABLE PatientRecords ( 
	RecordID INT PRIMARY KEY, 
	PatientName VARCHAR(100), 
	DiagnosisCode VARCHAR(50), 
	TreatmentPlan VARCHAR(250) 
	); 

	INSERT INTO PatientRecords (RecordID, PatientName, DiagnosisCode,TreatmentPlan) 
	VALUES (201, 'Amy Smith', 'ABC-123', 'Take vitamin pills daily.'), 
	(202, 'Bob Jones', 'abc-999', 'Rest and drink water.'), 
	(203, 'Cody Miller', 'XYZ-450', 'Take antibiotics daily.'), 
	(204, 'Dan_Webb', 'E11', 'Check blood sugar.'), 
	(205, '1st_Test', 'XYZ-%', 'Emergency care.'); 
	
	SELECT * FROM PatientRecords

--1. Find all records where the PatientName starts with 'A' and ends with 'h'. 
	SELECT * FROM PatientRecords
	WHERE PatientName LIKE 'A%h'

--2. Find all records where the DiagnosisCode starts with 'abc' and ends with '9'.
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode LIKE 'abc%9'

--3. Find all records where the PatientName starts with 'C' and is exactly 11 characters long.
	SELECT * FROM PatientRecords
	WHERE PatientName LIKE 'C__________'

--4. Find all records where the DiagnosisCode ends with a literal percent sign %.
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode LIKE '%%'



	PRO
--5. Find all records where the TreatmentPlan ends with a period ‘.’.
	SELECT * FROM PatientRecords
	WHERE TreatmentPlan LIKE '%.'

--6. Find all records where the PatientName begins with any letter from A through C.
	SELECT * FROM PatientRecords
	WHERE PatientName LIKE '[A-C]%'

--7. Find all records where the DiagnosisCode starts with a letter between X and Z. 
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode LIKE '[X-Z]%'

--8. Find all records where the DiagnosisCode contains a 3-digit number starting with 4 (i.e., 400 to 499).
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode LIKE '%4__'

--9. Find all records where the PatientName does NOT start with any letter between A and C. 
	SELECT * FROM PatientRecords
	WHERE PatientName NOT LIKE '[A-C]%'

--10. Find all records where the PatientName starts with a number. 
	SELECT * FROM PatientRecords
	WHERE PatientName  LIKE '[0-9]%'

--11. Find all records where the second letter of the PatientName is a lowercase vowel (a, e, i, o, u). 
	SELECT * FROM PatientRecords
	WHERE PatientName  LIKE '_[aeiou]%'

--12. Find all records where the DiagnosisCode starts with a letter, followed immediately by two digits. 
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode LIKE '[A-Z][0-9][0-9]'

--13. Find all records where the last character of the DiagnosisCode is not a letter or a number. 
	SELECT * FROM PatientRecords
	WHERE DiagnosisCode NOT LIKE '%[A-Z0-9]'

--14. Find all records where the PatientName contains a literal underscore ‘_’ anywhere inside it.
	SELECT * FROM PatientRecords
	WHERE PatientName LIKE '%_%'
	PRO