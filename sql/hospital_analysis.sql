
--Data Preparation 
--Convert blank Age values imported from CSV to SQL NULL
UPDATE hospital_patients
SET Age = NULL
WHERE Age = '';

--Convert blank Length of Stay values imported from CSV to SQL NULL
UPDATE hospital_patients
SET Length_of_Stay = NULL
WHERE Length_of_Stay = '';


--Question 1: How many total patient records are there?
SELECT 
	COUNT (*) AS total_patients
FROM hospital_patients;

--Question 2: What is the average patient age?
SELECT 
	ROUND(AVG(Age), 1) AS average_age
FROM hospital_patients;

--Question 3: What are the youngest and oldest recorded patient ages?
SELECT
    MIN(Age) AS youngest_age,
    MAX(Age) AS oldest_age
FROM hospital_patients;

--Question 4: How many patients are in each gender category?
--Results ranked from highest to lowest patient count.
SELECT
    COUNT(PatientID) AS patient_count,
    Gender
FROM hospital_patients
GROUP BY Gender
ORDER BY patient_count DESC;

--Question 5: What are the most common diagnoses?
SELECT
    Diagnosis,
    COUNT(Diagnosis) AS diagnosis_count
FROM hospital_patients
GROUP BY Diagnosis
ORDER BY diagnosis_count DESC;

--Question 6: What is the average length of stay?
SELECT
    ROUND(AVG(Length_of_stay),1) AS average_LOS
FROM hospital_patients;

--Question 7: Which hospitals treated the most patients?
SELECT 
	HospitalID, 
	COUNT(PatientID) AS patient_count
FROM hospital_patients
GROUP BY HospitalID 
ORDER BY patient_count DESC;

--Question 8: Which hospitals have the highest and lowest average length of stay?
SELECT 
	HospitalID, 
	ROUND(AVG(Length_of_Stay),1) AS average_LOS
FROM hospital_patients
GROUP BY HospitalID 
ORDER BY average_LOS DESC;

--Question 9: How does patient admission volume change by month?
SELECT
    CAST(SUBSTR(AdmissionDate, 1, INSTR(AdmissionDate, '/') - 1) AS INTEGER) AS admission_month,
    COUNT(PatientID) AS admissions
FROM hospital_patients
GROUP BY admission_month
ORDER BY admission_month;

--Question 10: How does average length of stay vary by age group?
SELECT 
	Age_Group, 
	ROUND(AVG(Length_of_Stay), 1) AS average_LOS
FROM hospital_patients
GROUP BY Age_Group 
ORDER BY average_LOS;



