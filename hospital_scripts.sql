--data preview--
SELECT * FROM patients
LIMIT 5;

--show doctor who have an experiences more than five years--
SELECT first_name, last_name, specialization, years_experience
FROM doctors
WHERE years_experience >5
ORDER BY years_experience DESC;

--show appointment include patients and docter details--
SELECT patients.first_name ||" "|| patients.last_name AS Patient_Name, 
	   patients.gender AS Patient_Gender,
	   doctors.first_name ||" "|| doctors.last_name AS Doctor_Name, 
	   appointments.appointment_date, appointments.appointment_time, appointments.reason_for_visit, appointments.status
FROM appointments
LEFT JOIN patients
ON appointments.patient_id = patients.patient_id
LEFT JOIN doctors
ON appointments.doctor_id = doctors.doctor_id
--WHERE appointments.status = "Scheduled"
ORDER BY appointment_date, appointment_time ASC;

--summarize how many time each of appointments in each type--
SELECT treatment_type, count(*) AS Treatment_Count, sum(cost) AS Total_Cost
FROM treatments
GROUP BY treatment_type
--ORDER BY Total_Cost DESC--
ORDER BY Treatment_Count DESC;

/*Finding insights/ analysis*/

--Monthly revenue, with 
SELECT strftime("%Y-%m",bill_date) AS Billing_Month, payment_method, sum(amount) AS Revenue
FROM billing
GROUP BY Billing_Month
--ORDER BY Billing_Month
ORDER BY Revenue DESC;

--Each doctors Revenue--
SELECT doctors.first_name ||' '|| doctors.last_name AS Doctor_Name, 
	   sum(billing.amount) AS Revenue
FROM billing
INNER JOIN treatments
ON billing.treatment_id = treatments.treatment_id
INNER JOIN appointments
ON treatments.appointment_id = appointments.appointment_id
INNER JOIN doctors
ON appointments.doctor_id = doctors.doctor_id
GROUP BY Doctor_Name
ORDER BY Revenue DESC;
